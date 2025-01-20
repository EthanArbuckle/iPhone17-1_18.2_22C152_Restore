@interface IXSDataPromise
+ (BOOL)supportsSecureCoding;
- (BOOL)awakeFromSerializationWithLookupBlock:(id)a3 error:(id *)a4;
- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5;
- (BOOL)didAwake;
- (BOOL)hasBegun;
- (BOOL)isComplete;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTracked;
- (IXDataPromiseSeed)clientSeed;
- (IXDataPromiseSeed)seed;
- (IXSDataPromise)initWithCoder:(id)a3;
- (IXSDataPromise)initWithSeed:(id)a3 error:(id *)a4;
- (IXSDataPromiseDelegate)delegate;
- (NSError)error;
- (NSSet)subPromiseUUIDs;
- (NSString)name;
- (NSUUID)uniqueIdentifier;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)delegateDeliveryQueue;
- (double)lastSavedPercentComplete;
- (double)percentComplete;
- (id)description;
- (unint64_t)bytesConsumedOnDisk;
- (unint64_t)creatorIdentifier;
- (unint64_t)errorSourceIdentifier;
- (unint64_t)hash;
- (unint64_t)totalBytesForProgress;
- (unint64_t)totalBytesNeededOnDisk;
- (void)_internalInitWithUniqueIdentifier:(id)a3;
- (void)_remote_cancelForReason:(id)a3 client:(unint64_t)a4 completion:(id)a5;
- (void)_remote_getErrorInfo:(id)a3;
- (void)_remote_getIsComplete:(id)a3;
- (void)_remote_getPercentComplete:(id)a3;
- (void)_remote_preflightWithCompletion:(id)a3;
- (void)_remote_resetWithCompletion:(id)a3;
- (void)_remote_setIsComplete:(id)a3;
- (void)_remote_setPercentComplete:(double)a3;
- (void)_removeSavedState;
- (void)_setPercentComplete:(double)a3 saveStateIfNeeded:(BOOL)a4;
- (void)decommission;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)saveState;
- (void)setComplete:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDidAwake:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setErrorSourceIdentifier:(unint64_t)a3;
- (void)setIsTracked:(BOOL)a3;
- (void)setLastSavedPercentComplete:(double)a3;
- (void)setPercentComplete:(double)a3;
- (void)setSeed:(id)a3;
- (void)supersede;
@end

@implementation IXSDataPromise

- (void)_internalInitWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:@"com.apple.installcoordinationd.promise_%@", v4];
  v6 = (const char *)[v5 UTF8String];
  v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = (OS_dispatch_queue *)dispatch_queue_create(v6, v7);
  accessQueue = self->_accessQueue;
  self->_accessQueue = v8;

  v10 = +[NSString stringWithFormat:@"com.apple.installcoordinationd.promise_delegate_%@", v4];

  id v15 = v10;
  v11 = (const char *)[v15 UTF8String];
  v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = (OS_dispatch_queue *)dispatch_queue_create(v11, v12);
  delegateDeliveryQueue = self->_delegateDeliveryQueue;
  self->_delegateDeliveryQueue = v13;
}

- (IXSDataPromise)initWithSeed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IXSDataPromise;
  v6 = [(IXSDataPromise *)&v14 init];
  if (v6)
  {
    v7 = objc_opt_new();
    [v5 setUniqueIdentifier:v7];

    v8 = [v5 uniqueIdentifier];
    [(IXSDataPromise *)v6 _internalInitWithUniqueIdentifier:v8];

    v9 = [(IXSDataPromise *)v6 accessQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100085B84;
    v11[3] = &unk_1000E8E08;
    v12 = v6;
    id v13 = v5;
    dispatch_sync(v9, v11);
  }
  return v6;
}

- (IXDataPromiseSeed)clientSeed
{
  v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(IXSDataPromise *)self seed];
  id v5 = [v4 copy];

  return (IXDataPromiseSeed *)v5;
}

- (IXSDataPromise)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IXSDataPromise;
  id v5 = [(IXSDataPromise *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seed"];
    seed = v5->_seed;
    v5->_seed = (IXDataPromiseSeed *)v6;

    v8 = [(IXDataPromiseSeed *)v5->_seed uniqueIdentifier];
    [(IXSDataPromise *)v5 _internalInitWithUniqueIdentifier:v8];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorSourceIdentifier"];
    v5->_errorSourceIdentifier = (unint64_t)[v11 unsignedLongLongValue];

    v5->_isTracked = [v4 decodeBoolForKey:@"isTracked"];
    [v4 decodeDoubleForKey:@"percentComplete"];
    v5->_percentComplete = v12;
    v5->_complete = [v4 decodeBoolForKey:@"complete"];
    id v13 = [(IXSDataPromise *)v5 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100085DF0;
    block[3] = &unk_1000E8FA8;
    v16 = v5;
    dispatch_sync(v13, block);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(IXSDataPromise *)self seed];
  [v4 encodeObject:v6 forKey:@"seed"];

  v7 = [(IXSDataPromise *)self error];
  [v4 encodeObject:v7 forKey:@"error"];

  v8 = +[NSNumber numberWithUnsignedInteger:[(IXSDataPromise *)self errorSourceIdentifier]];
  [v4 encodeObject:v8 forKey:@"errorSourceIdentifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[IXSDataPromise isTracked](self, "isTracked"), @"isTracked");
  [(IXSDataPromise *)self percentComplete];
  objc_msgSend(v4, "encodeDouble:forKey:", @"percentComplete");
  objc_msgSend(v4, "encodeBool:forKey:", -[IXSDataPromise isComplete](self, "isComplete"), @"complete");

  [(IXSDataPromise *)self percentComplete];

  -[IXSDataPromise setLastSavedPercentComplete:](self, "setLastSavedPercentComplete:");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IXSDataPromise *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(IXSDataPromise *)v5 uniqueIdentifier];
    v7 = [(IXSDataPromise *)self uniqueIdentifier];
    unsigned __int8 v8 = [v6 isEqual:v7];
  }
  else
  {
LABEL_5:
    unsigned __int8 v8 = 0;
  }
LABEL_7:

  return v8;
}

- (unint64_t)hash
{
  v2 = [(IXSDataPromise *)self uniqueIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (void)reset
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(IXSDataPromise *)self error];

  if (v4)
  {
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      objc_super v14 = "-[IXSDataPromise reset]";
      uint64_t v6 = "%s: Ignoring reset request for promise that hit error";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
  else
  {
    unsigned int v7 = [(IXSDataPromise *)self isComplete];
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    BOOL v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v8)
      {
        *(_DWORD *)buf = 136315138;
        objc_super v14 = "-[IXSDataPromise reset]";
        uint64_t v6 = "%s: Ignoring reset request for complete promise";
        goto LABEL_7;
      }
    }
    else
    {
      if (v8)
      {
        *(_DWORD *)buf = 136315394;
        objc_super v14 = "-[IXSDataPromise reset]";
        __int16 v15 = 2112;
        v16 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Resetting data promise %@", buf, 0x16u);
      }

      [(IXSDataPromise *)self setComplete:0];
      [(IXSDataPromise *)self setPercentComplete:0.0];
      id v5 = [(IXSDataPromise *)self delegate];
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v9 = [(IXSDataPromise *)self delegateDeliveryQueue];
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_1000862AC;
        v10[3] = &unk_1000E8E08;
        id v5 = v5;
        v11 = v5;
        double v12 = self;
        sub_100066F24(v9, v10);
      }
    }
  }
}

- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v9);

  if (!v8)
  {
    id v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10009A518();
    }

    __int16 v15 = @"Reason passed to -[IXSDataPromise cancelForReason:client:] was nil";
    uint64_t v16 = 177;
    goto LABEL_12;
  }
  if (!a4)
  {
    objc_super v17 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10009A590();
    }

    __int16 v15 = @"Client passed to -[IXSDataPromise cancelForReason:client:] was IXClientNone (0)";
    uint64_t v16 = 182;
LABEL_12:
    sub_10003DAE4((uint64_t)"-[IXSDataPromise cancelForReason:client:error:]", v16, @"IXErrorDomain", 0x35uLL, 0, 0, v15, v14, v23);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      id v18 = v18;
      BOOL v19 = 0;
      *a5 = v18;
    }
    else
    {
      BOOL v19 = 0;
    }
    goto LABEL_22;
  }
  v10 = [(IXSDataPromise *)self error];

  v11 = sub_100004B28((uint64_t)off_100109BB8);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 136315650;
      v33 = "-[IXSDataPromise cancelForReason:client:error:]";
      __int16 v34 = 2112;
      v35 = self;
      __int16 v36 = 2112;
      unint64_t v37 = (unint64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: %@ : ignoring cancel request for reason %@ after promise was already canceled", buf, 0x20u);
    }
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 136315906;
      v33 = "-[IXSDataPromise cancelForReason:client:error:]";
      __int16 v34 = 2112;
      v35 = self;
      __int16 v36 = 2048;
      unint64_t v37 = a4;
      __int16 v38 = 2112;
      id v39 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: %@ : canceled by client %lu for reason %@", buf, 0x2Au);
    }

    [(IXSDataPromise *)self setError:v8];
    [(IXSDataPromise *)self setErrorSourceIdentifier:a4];
    self->_complete = 0;
    self->_percentComplete = 0.0;
    v11 = [(IXSDataPromise *)self delegate];
    if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v20 = [(IXSDataPromise *)self delegateDeliveryQueue];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100086688;
      v27[3] = &unk_1000E9408;
      v28 = v11;
      v29 = self;
      id v30 = v8;
      unint64_t v31 = a4;
      sub_100066F24(v20, v27);
    }
    v21 = [(IXSDataPromise *)self delegateDeliveryQueue];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100086698;
    v24[3] = &unk_1000E9738;
    v24[4] = self;
    id v25 = v8;
    unint64_t v26 = a4;
    sub_100066F24(v21, v24);

    [(IXSDataPromise *)self decommission];
  }

  id v18 = 0;
  BOOL v19 = 1;
LABEL_22:

  return v19;
}

- (NSError)error
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  error = self->_error;

  return error;
}

- (unint64_t)errorSourceIdentifier
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  return self->_errorSourceIdentifier;
}

- (BOOL)awakeFromSerializationWithLookupBlock:(id)a3 error:(id *)a4
{
  id v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  if (![(IXSDataPromise *)self didAwake]) {
    [(IXSDataPromise *)self setDidAwake:1];
  }
  return 1;
}

- (void)saveState
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  if ([(IXSDataPromise *)self isTracked])
  {
    id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v4 encodeObject:self forKey:NSKeyedArchiveRootObjectKey];
    id v5 = [v4 encodedData];

    uint64_t v6 = +[IXSDataPromiseManager savePathForPromise:self];
    id v12 = 0;
    unsigned __int8 v7 = [v5 writeToURL:v6 options:268435457 error:&v12];
    id v8 = v12;
    if ((v7 & 1) == 0)
    {
      uint64_t v9 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [v6 path];
        *(_DWORD *)buf = 136315906;
        uint64_t v14 = "-[IXSDataPromise saveState]";
        __int16 v15 = 2112;
        uint64_t v16 = self;
        __int16 v17 = 2112;
        id v18 = v10;
        __int16 v19 = 2112;
        id v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to write promise %@ to disk at %@: %@", buf, 0x2Au);
      }
    }
  }
  else
  {
    v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "-[IXSDataPromise saveState]";
      __int16 v15 = 2112;
      uint64_t v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Not saving %@ because it's not tracked", buf, 0x16u);
    }
  }
}

- (void)_removeSavedState
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[IXSDataPromiseManager savePathForPromise:self];
  id v5 = +[IXFileManager defaultManager];
  id v10 = 0;
  unsigned __int8 v6 = [v5 removeItemAtURL:v4 error:&v10];
  id v7 = v10;

  if ((v6 & 1) == 0)
  {
    id v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v4 path];
      *(_DWORD *)buf = 136315906;
      id v12 = "-[IXSDataPromise _removeSavedState]";
      __int16 v13 = 2112;
      uint64_t v14 = self;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Failed to remove saved promise %@ at %@ : %@", buf, 0x2Au);
    }
  }
}

- (BOOL)isTracked
{
  return self->_isTracked;
}

- (void)setIsTracked:(BOOL)a3
{
  id v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  if (a3)
  {
    self->_isTracked = a3;
    [(IXSDataPromise *)self saveState];
  }
  else
  {
    [(IXSDataPromise *)self _removeSavedState];
    self->_isTracked = a3;
  }
}

- (NSString)name
{
  v2 = [(IXSDataPromise *)self seed];
  id v3 = [v2 name];

  return (NSString *)v3;
}

- (unint64_t)creatorIdentifier
{
  v2 = [(IXSDataPromise *)self seed];
  id v3 = [v2 creatorIdentifier];

  return (unint64_t)v3;
}

- (NSUUID)uniqueIdentifier
{
  v2 = [(IXSDataPromise *)self seed];
  id v3 = [v2 uniqueIdentifier];

  return (NSUUID *)v3;
}

- (unint64_t)totalBytesNeededOnDisk
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(IXSDataPromise *)self seed];
  id v5 = [v4 totalBytesNeededOnDisk];

  return (unint64_t)v5;
}

- (unint64_t)totalBytesForProgress
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  return [(IXSDataPromise *)self totalBytesNeededOnDisk];
}

- (unint64_t)bytesConsumedOnDisk
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  [(IXSDataPromise *)self percentComplete];
  return (unint64_t)(v4 * (double)[(IXSDataPromise *)self totalBytesNeededOnDisk]);
}

- (NSSet)subPromiseUUIDs
{
  v2 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v2);

  return +[NSSet set];
}

- (BOOL)isComplete
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_complete != v3)
  {
    if (!self->_complete || v3)
    {
      if (!v3) {
        return;
      }
      [(IXSDataPromise *)self percentComplete];
      if (v7 < 1.0) {
        [(IXSDataPromise *)self _setPercentComplete:0 saveStateIfNeeded:1.0];
      }
      self->_complete = v3;
      [(IXSDataPromise *)self saveState];
      unsigned __int8 v6 = [(IXSDataPromise *)self delegate];
      if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v8 = [(IXSDataPromise *)self delegateDeliveryQueue];
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_100087114;
        v11[3] = &unk_1000E8E08;
        id v12 = v6;
        __int16 v13 = self;
        sub_100066F24(v8, v11);
      }
      uint64_t v9 = [(IXSDataPromise *)self delegateDeliveryQueue];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100087120;
      v10[3] = &unk_1000E8FA8;
      void v10[4] = self;
      sub_100066F24(v9, v10);
    }
    else
    {
      unsigned __int8 v6 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v15 = "-[IXSDataPromise setComplete:]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Ignoring attempt to set a complete promise to not complete", buf, 0xCu);
      }
    }
  }
}

- (double)percentComplete
{
  BOOL v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  return self->_percentComplete;
}

- (void)_setPercentComplete:(double)a3 saveStateIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v7);

  if ([(IXSDataPromise *)self isComplete])
  {
    id v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = "-[IXSDataPromise _setPercentComplete:saveStateIfNeeded:]";
      __int16 v24 = 2048;
      double v25 = a3;
      __int16 v26 = 2112;
      v27 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Ignoring attempt to set percent complete to %f for %@ when it was already complete.", buf, 0x20u);
    }
  }
  else
  {
    if (a3 < 0.0) {
      return;
    }
    if (a3 > 1.0) {
      a3 = 1.0;
    }
    BOOL v9 = self->_percentComplete == 0.0 && a3 > 0.0;
    self->_percentComplete = a3;
    [(IXSDataPromise *)self lastSavedPercentComplete];
    if (v10 == 0.0
      || ([(IXSDataPromise *)self lastSavedPercentComplete], a3 - v11 >= 0.100000001))
    {
      id v12 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v23 = "-[IXSDataPromise _setPercentComplete:saveStateIfNeeded:]";
        __int16 v24 = 2112;
        double v25 = *(double *)&self;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Progress: %@", buf, 0x16u);
      }

      if (v4) {
        [(IXSDataPromise *)self saveState];
      }
    }
    id v8 = [(IXSDataPromise *)self delegate];
    if (v8)
    {
      if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        __int16 v13 = [(IXSDataPromise *)self delegateDeliveryQueue];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000874C0;
        v19[3] = &unk_1000E8E08;
        id v20 = v8;
        v21 = self;
        sub_100066F24(v13, v19);
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v14 = [(IXSDataPromise *)self delegateDeliveryQueue];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1000874CC;
        v15[3] = &unk_1000E9738;
        id v8 = v8;
        uint64_t v16 = v8;
        __int16 v17 = self;
        double v18 = a3;
        sub_100066F24(v14, v15);
      }
    }
  }
}

- (void)setPercentComplete:(double)a3
{
  id v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  [(IXSDataPromise *)self _setPercentComplete:1 saveStateIfNeeded:a3];
}

- (BOOL)hasBegun
{
  BOOL v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  [(IXSDataPromise *)self percentComplete];
  return v4 > 0.0;
}

- (BOOL)didAwake
{
  BOOL v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  return self->_didAwake;
}

- (void)setDidAwake:(BOOL)a3
{
  id v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  self->_didAwake = a3;
}

- (IXSDataPromiseDelegate)delegate
{
  BOOL v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IXSDataPromiseDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    if (v4)
    {
      if ([(IXSDataPromise *)self hasBegun])
      {
        double v7 = [(IXSDataPromise *)self delegateDeliveryQueue];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100087858;
        v20[3] = &unk_1000E8E08;
        id v21 = v4;
        v22 = self;
        sub_100066F24(v7, v20);
      }
      [(IXSDataPromise *)self percentComplete];
      if (v8 > 0.0)
      {
        [(IXSDataPromise *)self percentComplete];
        uint64_t v10 = v9;
        double v11 = [(IXSDataPromise *)self delegateDeliveryQueue];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100087864;
        v16[3] = &unk_1000E9738;
        id v17 = v4;
        double v18 = self;
        uint64_t v19 = v10;
        sub_100066F24(v11, v16);
      }
      if ([(IXSDataPromise *)self isComplete])
      {
        id v12 = [(IXSDataPromise *)self delegateDeliveryQueue];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100087874;
        v13[3] = &unk_1000E8E08;
        id v14 = v4;
        __int16 v15 = self;
        sub_100066F24(v12, v13);
      }
    }
  }
}

- (void)decommission
{
  BOOL v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    double v7 = "-[IXSDataPromise decommission]";
    __int16 v8 = 2112;
    uint64_t v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Decommissioning %@", (uint8_t *)&v6, 0x16u);
  }

  [(IXSDataPromise *)self setDelegate:0];
  [(IXSDataPromise *)self setIsTracked:0];
  id v5 = +[IXSDataPromiseManager sharedInstance];
  [v5 decommissionPromise:self];
}

- (void)supersede
{
  BOOL v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  [(IXSDataPromise *)self setDelegate:0];
  sub_10003DAE4((uint64_t)"-[IXSDataPromise supersede]", 561, @"IXErrorDomain", 7uLL, 0, 0, @"Data promise was superseded by a new promise being set.", v4, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(IXSDataPromise *)self cancelForReason:v6 client:15 error:0];
}

- (id)description
{
  BOOL v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [(IXSDataPromise *)self name];
  id v6 = IXStringForClientID([(IXSDataPromise *)self creatorIdentifier]);
  double v7 = [(IXSDataPromise *)self uniqueIdentifier];
  double percentComplete = self->_percentComplete;
  BOOL complete = self->_complete;
  uint64_t v10 = [(IXSDataPromise *)self seed];
  id v11 = [v10 totalBytesNeededOnDisk];
  uint64_t v12 = 89;
  if (!complete) {
    uint64_t v12 = 78;
  }
  __int16 v13 = +[NSString stringWithFormat:@"<%@(%p) Name:%@ Creator:%@ UUID:%@ PercentComplete:%f IsComplete:%c DiskUsageBytes:%llu>", v4, self, v5, v6, v7, *(void *)&percentComplete, v12, v11];

  return v13;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setError:(id)a3
{
}

- (void)setErrorSourceIdentifier:(unint64_t)a3
{
  self->_errorSourceIdentifier = a3;
}

- (OS_dispatch_queue)delegateDeliveryQueue
{
  return self->_delegateDeliveryQueue;
}

- (IXDataPromiseSeed)seed
{
  return self->_seed;
}

- (void)setSeed:(id)a3
{
}

- (double)lastSavedPercentComplete
{
  return self->_lastSavedPercentComplete;
}

- (void)setLastSavedPercentComplete:(double)a3
{
  self->_lastSavedPercentComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seed, 0);
  objc_storeStrong((id *)&self->_delegateDeliveryQueue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_remote_getPercentComplete:(id)a3
{
  uint64_t v4 = (void (**)(id, void, double))a3;
  uint64_t v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100087D08;
  v7[3] = &unk_1000E90A8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, 0, v9[3]);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setPercentComplete:(double)a3
{
  uint64_t v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100087DEC;
  v7[3] = &unk_1000E8D28;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  dispatch_sync(v6, v7);
}

- (void)_remote_getIsComplete:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100087F08;
  v7[3] = &unk_1000E90A8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v6, v7);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v9 + 24), 0);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setIsComplete:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [(IXSDataPromise *)self uniqueIdentifier];
  double v7 = [v6 UUIDString];
  BOOL v8 = sub_1000392E4(v7, 9);

  if (v8) {
    exit(1);
  }
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_1000880B8;
  __int16 v15 = sub_1000880C8;
  id v16 = 0;
  uint64_t v9 = [(IXSDataPromise *)self accessQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000880D0;
  v10[3] = &unk_1000E90A8;
  void v10[4] = self;
  void v10[5] = &v11;
  dispatch_sync(v9, v10);

  v4[2](v4, v12[5]);
  _Block_object_dispose(&v11, 8);
}

- (void)_remote_cancelForReason:(id)a3 client:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void))a5;
  uint64_t v10 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v10);

  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_1000880B8;
  id v21 = sub_1000880C8;
  id v22 = 0;
  uint64_t v11 = [(IXSDataPromise *)self accessQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000882B4;
  v13[3] = &unk_1000EB580;
  void v13[4] = self;
  id v12 = v8;
  __int16 v15 = &v17;
  unint64_t v16 = a4;
  id v14 = v12;
  dispatch_sync(v11, v13);

  v9[2](v9, v18[5]);
  _Block_object_dispose(&v17, 8);
}

- (void)_remote_resetWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v18 = 0;
  v19[0] = &v18;
  v19[1] = 0x3032000000;
  v19[2] = sub_1000880B8;
  v19[3] = sub_1000880C8;
  id v20 = 0;
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000885DC;
  block[3] = &unk_1000E9710;
  void block[4] = self;
  block[5] = &v18;
  block[6] = &v14;
  dispatch_sync(v6, block);

  if (*(void *)(v19[0] + 40))
  {
    double v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009A680((uint64_t)v19, v7);
    }

    uint64_t v9 = sub_10003DAE4((uint64_t)"-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_resetWithCompletion:]", 654, @"IXErrorDomain", 4uLL, 0, 0, @"Attempt made to reset a canceled promise (promise canceled with error %@)", v8, *(void *)(v19[0] + 40));
    v4[2](v4, v9);
  }
  else
  {
    if (!*((unsigned char *)v15 + 24))
    {
      v4[2](v4, 0);
      goto LABEL_10;
    }
    uint64_t v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10009A608();
    }

    uint64_t v9 = sub_10003DAE4((uint64_t)"-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_resetWithCompletion:]", 657, @"IXErrorDomain", 4uLL, 0, 0, @"Attempt made to reset a completed promise", v11, v12);
    v4[2](v4, v9);
  }

LABEL_10:
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

- (void)_remote_getErrorInfo:(id)a3
{
  id v4 = (void (**)(id, uint64_t, uint64_t))a3;
  uint64_t v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = sub_1000880B8;
  uint64_t v16 = sub_1000880C8;
  id v17 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000887EC;
  block[3] = &unk_1000E9710;
  void block[4] = self;
  block[5] = &v12;
  block[6] = &v8;
  dispatch_sync(v6, block);

  v4[2](v4, v9[3], v13[5]);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

- (void)_remote_preflightWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000890D8;
  block[3] = &unk_1000E9710;
  void block[4] = self;
  block[5] = &v46;
  block[6] = &v42;
  dispatch_sync(v6, block);

  double v7 = +[IXGlobalConfiguration sharedInstance];
  uint64_t v8 = [v7 userVolumeURL];
  uint64_t v9 = [v8 path];

  bzero(&v68, 0x878uLL);
  id v10 = v9;
  if (statfs((const char *)[v10 fileSystemRepresentation], &v68))
  {
    uint64_t v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = __error();
      uint64_t v13 = strerror(*v12);
      *(_DWORD *)buf = 136315650;
      v53 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]";
      __int16 v54 = 2112;
      v55 = self;
      __int16 v56 = 2080;
      v57 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Failed to get available space on device for promise %@: %s", buf, 0x20u);
    }
    goto LABEL_4;
  }
  uint64_t v14 = v68.f_bavail * v68.f_bsize;
  if (v14 >> 23 <= 0x18) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = v14 - 209715200;
  }
  unint64_t v16 = v47[3];
  unint64_t v17 = v43[3];
  uint64_t v18 = (char *)(v16 - v17);
  if (v16 < v17)
  {
    uint64_t v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = (char *)v47[3];
      id v20 = (char *)v43[3];
      *(_DWORD *)buf = 136315906;
      v53 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]";
      __int16 v54 = 2112;
      v55 = self;
      __int16 v56 = 2048;
      v57 = v19;
      __int16 v58 = 2048;
      v59 = v20;
      id v21 = "%s: Promise %@: bytes consumed (%llu) greater than total bytes needed (%llu): space needed cannot be determined.";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v21, buf, 0x2Au);
      goto LABEL_4;
    }
    goto LABEL_4;
  }
  if ((unint64_t)v18 <= v15)
  {
    uint64_t v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v53 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]";
      __int16 v54 = 2112;
      v55 = self;
      __int16 v56 = 2048;
      v57 = v18;
      __int16 v58 = 2048;
      v59 = (char *)v15;
      id v21 = "%s: Promise %@: %llu bytes needed, %llu bytes available.";
      goto LABEL_20;
    }
LABEL_4:

    v4[2](v4, 0);
    goto LABEL_32;
  }
  CFStringRef v66 = @"CACHE_DELETE_VOLUME";
  id v67 = v10;
  __int16 v38 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
  id v22 = (void *)CacheDeleteCopyPurgeableSpaceWithInfo();
  uint64_t v23 = [v22 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"];
  id v39 = v22;

  if (v23)
  {
    __int16 v24 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      double v25 = [v22 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"];
      *(_DWORD *)buf = 136315394;
      v53 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]";
      __int16 v54 = 2112;
      v55 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: Failed to get purgable space from Cache Delete: %@", buf, 0x16u);
    }
    __int16 v26 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v53 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]";
      __int16 v54 = 2112;
      v55 = self;
      __int16 v56 = 2048;
      v57 = v18;
      __int16 v58 = 2048;
      v59 = (char *)v15;
      __int16 v60 = 2048;
      v61 = (char *)v15;
      __int16 v62 = 2112;
      v63 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s: Not enough space for promise %@: %llu bytes needed, %llu bytes available (%llu free, purgable unavailable). : %@", buf, 0x3Eu);
    }

    v28 = sub_10003DAE4((uint64_t)"-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]", 729, @"IXUserPresentableErrorDomain", 0xBuLL, 0, 0, @"Not enough space for promise %@: %llu bytes needed, %llu bytes available (%llu free, purgable unavailable).", v27, (uint64_t)self);
    ((void (**)(id, void *))v4)[2](v4, v28);
  }
  else
  {
    v29 = [v22 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
    unint64_t v37 = (char *)[v29 unsignedLongLongValue];

    if (&v37[v15] >= v18)
    {
      v50[1] = @"CACHE_DELETE_AMOUNT";
      v51[0] = v10;
      v50[0] = @"CACHE_DELETE_VOLUME";
      v33 = +[NSNumber numberWithUnsignedLongLong:&v18[-v15]];
      v51[1] = v33;
      uint64_t v34 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];

      v35 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v53 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]";
        __int16 v54 = 2112;
        v55 = self;
        __int16 v56 = 2048;
        v57 = v18;
        __int16 v58 = 2048;
        v59 = (char *)v15;
        __int16 v60 = 2048;
        v61 = v37;
        __int16 v62 = 2048;
        v63 = &v18[-v15];
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s: Promise %@: %llu bytes needed, %llu bytes available.  %llu bytes can be purged, requesting %llu bytes be purged.", buf, 0x3Eu);
      }

      v40 = v4;
      __int16 v36 = (const void *)CacheDeletePurgeSpaceWithInfo();
      if (v36) {
        CFRelease(v36);
      }

      __int16 v38 = (void *)v34;
    }
    else
    {
      id v30 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316674;
        v53 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]";
        __int16 v54 = 2112;
        v55 = self;
        __int16 v56 = 2048;
        v57 = v18;
        __int16 v58 = 2048;
        v59 = &v37[v15];
        __int16 v60 = 2048;
        v61 = (char *)v15;
        __int16 v62 = 2048;
        v63 = v37;
        __int16 v64 = 2112;
        uint64_t v65 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s: Not enough space for promise %@: %llu bytes needed, %llu bytes available (%llu free, %llu purgable). : %@", buf, 0x48u);
      }

      v32 = sub_10003DAE4((uint64_t)"-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]", 737, @"IXUserPresentableErrorDomain", 0xBuLL, 0, 0, @"Not enough space for promise %@: %llu bytes needed, %llu bytes available (%llu free, %llu purgable).", v31, (uint64_t)self);
      ((void (**)(id, void *))v4)[2](v4, v32);
    }
  }

LABEL_32:
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
}

@end