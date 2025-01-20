@interface IXSOwnedDataPromise
+ (BOOL)supportsSecureCoding;
- (BOOL)_onQueue_createStagingBaseDirWithError:(id *)a3;
- (BOOL)_onQueue_initWithSeedWithError:(id *)a3;
- (BOOL)awakeFromSerializationWithLookupBlock:(id)a3 error:(id *)a4;
- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5;
- (BOOL)issueSandboxExtensionWithError:(id *)a3;
- (BOOL)stagedPathMayNotExistWhenAwakening;
- (BOOL)validateStagedPathWithError:(id *)a3;
- (IXSOwnedDataPromise)initWithCoder:(id)a3;
- (IXSOwnedDataPromise)initWithSeed:(id)a3 error:(id *)a4;
- (NSError)awakeningError;
- (NSString)relativeStagedPath;
- (NSString)targetLastPathComponent;
- (NSURL)stagedPath;
- (NSURL)stagingBaseDir;
- (void)_internal_setStagedPath:(id)a3;
- (void)_onQueue_purgeStagingBaseDirKeepingBaseDir:(BOOL)a3;
- (void)_remote_getStagedPath:(id)a3;
- (void)_remote_getTargetLastPathComponent:(id)a3;
- (void)_remote_setStagedPath:(id)a3;
- (void)_remote_setTargetLastPathComponent:(id)a3 withCompletion:(id)a4;
- (void)decommission;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)setAwakeningError:(id)a3;
- (void)setComplete:(BOOL)a3;
- (void)setRelativeStagedPath:(id)a3;
- (void)setStagedPath:(id)a3;
- (void)setStagedPathMayNotExistWhenAwakening:(BOOL)a3;
- (void)setTargetLastPathComponent:(id)a3;
@end

@implementation IXSOwnedDataPromise

- (BOOL)_onQueue_createStagingBaseDirWithError:(id *)a3
{
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  v6 = +[IXGlobalConfiguration sharedInstance];
  id v39 = 0;
  v7 = [v6 promiseStagingRootDirectoryWithError:&v39];
  id v8 = v39;

  if (v7)
  {
    v9 = [(IXSDataPromise *)self uniqueIdentifier];
    v10 = [v9 UUIDString];
    v11 = [v7 URLByAppendingPathComponent:v10 isDirectory:1];
    v12 = [(IXSDataPromise *)self seed];
    [v12 setStagingBaseDir:v11];

    v13 = +[IXFileManager defaultManager];
    v14 = [(IXSDataPromise *)self seed];
    v15 = [v14 stagingBaseDir];
    id v38 = v8;
    unsigned __int8 v16 = [v13 createDirectoryAtURL:v15 withIntermediateDirectories:1 mode:493 class:4 error:&v38];
    id v17 = v38;

    v18 = sub_100004B28((uint64_t)off_100109BB8);
    v19 = v18;
    if ((v16 & 1) == 0)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10008F950();
      }

      v33 = sub_10003DAE4((uint64_t)"-[IXSOwnedDataPromise _onQueue_createStagingBaseDirWithError:]", 65, @"IXErrorDomain", 1uLL, v17, 0, @"Failed to create promise staging directory", v32, v36);
      id v8 = v17;
      goto LABEL_17;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v20 = [(IXSDataPromise *)self seed];
      v21 = [v20 stagingBaseDir];
      v22 = [v21 path];
      *(_DWORD *)buf = 136315394;
      v41 = "-[IXSOwnedDataPromise _onQueue_createStagingBaseDirWithError:]";
      __int16 v42 = 2112;
      v43 = v22;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s: Created %@", buf, 0x16u);
    }
    v23 = +[IXFileManager defaultManager];
    v24 = [(IXSDataPromise *)self seed];
    v25 = [v24 stagingBaseDir];
    id v37 = v17;
    unsigned __int8 v26 = [v23 setPermissionsOfItemAtURL:v25 toMode:493 error:&v37];
    id v8 = v37;

    if (v26)
    {
      BOOL v27 = 1;
      goto LABEL_20;
    }
    v34 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10008F8DC();
    }

    v30 = @"Failed to set mode on promise staging directory";
    uint64_t v31 = 74;
  }
  else
  {
    v28 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10008F868();
    }

    v30 = @"Failed to create promise staging root directory";
    uint64_t v31 = 50;
  }
  v33 = sub_10003DAE4((uint64_t)"-[IXSOwnedDataPromise _onQueue_createStagingBaseDirWithError:]", v31, @"IXErrorDomain", 1uLL, v8, 0, v30, v29, v36);
LABEL_17:

  if (a3)
  {
    id v8 = v33;
    BOOL v27 = 0;
    *a3 = v8;
  }
  else
  {
    BOOL v27 = 0;
    id v8 = v33;
  }
LABEL_20:

  return v27;
}

- (void)_onQueue_purgeStagingBaseDirKeepingBaseDir:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  v6 = +[IXFileManager defaultManager];
  v7 = [(IXSDataPromise *)self seed];
  id v8 = [v7 stagingBaseDir];
  id v20 = 0;
  unsigned __int8 v9 = [v6 removeItemAtURL:v8 keepParent:v3 error:&v20];
  id v10 = v20;

  v11 = sub_100004B28((uint64_t)off_100109BB8);
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = [(IXSDataPromise *)self seed];
      v14 = [v13 stagingBaseDir];
      v15 = [v14 path];
      *(_DWORD *)buf = 136315394;
      v22 = "-[IXSOwnedDataPromise _onQueue_purgeStagingBaseDirKeepingBaseDir:]";
      __int16 v23 = 2112;
      v24 = v15;
      unsigned __int8 v16 = "%s: Destroyed %@";
      id v17 = v12;
      os_log_type_t v18 = OS_LOG_TYPE_INFO;
      uint32_t v19 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, v19);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [(IXSDataPromise *)self seed];
    v14 = [v13 stagingBaseDir];
    v15 = [v14 path];
    *(_DWORD *)buf = 136315650;
    v22 = "-[IXSOwnedDataPromise _onQueue_purgeStagingBaseDirKeepingBaseDir:]";
    __int16 v23 = 2112;
    v24 = v15;
    __int16 v25 = 2112;
    id v26 = v10;
    unsigned __int8 v16 = "%s: Failed to remove staged content at %@: %@";
    id v17 = v12;
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    uint32_t v19 = 32;
    goto LABEL_6;
  }
}

- (BOOL)_onQueue_initWithSeedWithError:(id *)a3
{
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  return [(IXSOwnedDataPromise *)self _onQueue_createStagingBaseDirWithError:a3];
}

- (IXSOwnedDataPromise)initWithSeed:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)IXSOwnedDataPromise;
  v7 = [(IXSDataPromise *)&v26 initWithSeed:v6 error:a4];
  id v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint32_t v19 = sub_10002EFCC;
  id v20 = sub_10002EFDC;
  id v21 = 0;
  unsigned __int8 v9 = [(IXSDataPromise *)v7 accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EFE4;
  block[3] = &unk_1000E9828;
  v13 = v8;
  v14 = &v16;
  v15 = &v22;
  dispatch_sync(v9, block);

  if (!*((unsigned char *)v23 + 24))
  {

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
LABEL_7:
    id v10 = v8;
    goto LABEL_8;
  }
  if (a4) {
    *a4 = (id) v17[5];
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  id v10 = 0;
LABEL_8:

  return v10;
}

- (IXSOwnedDataPromise)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IXSOwnedDataPromise;
  v5 = [(IXSDataPromise *)&v14 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stagedPath"];
    if (v6)
    {
      v7 = [(IXSDataPromise *)v5 accessQueue];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10002F1C8;
      v11[3] = &unk_1000E8E08;
      v12 = v5;
      id v13 = v6;
      dispatch_sync(v7, v11);
    }
    else
    {
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relativeStagedPath"];
      relativeStagedPath = v5->_relativeStagedPath;
      v5->_relativeStagedPath = (NSString *)v8;

      v5->_stagedPathMayNotExistWhenAwakening = [v4 decodeBoolForKey:@"stagedPathMayNotExistWhenAwakening"];
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  v7.receiver = self;
  v7.super_class = (Class)IXSOwnedDataPromise;
  [(IXSDataPromise *)&v7 encodeWithCoder:v4];
  id v6 = [(IXSOwnedDataPromise *)self relativeStagedPath];
  [v4 encodeObject:v6 forKey:@"relativeStagedPath"];

  objc_msgSend(v4, "encodeBool:forKey:", -[IXSOwnedDataPromise stagedPathMayNotExistWhenAwakening](self, "stagedPathMayNotExistWhenAwakening"), @"stagedPathMayNotExistWhenAwakening");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)reset
{
  BOOL v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  [(IXSOwnedDataPromise *)self _onQueue_purgeStagingBaseDirKeepingBaseDir:1];
  v4.receiver = self;
  v4.super_class = (Class)IXSOwnedDataPromise;
  [(IXSDataPromise *)&v4 reset];
}

- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  unsigned __int8 v9 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v9);

  [(IXSOwnedDataPromise *)self _onQueue_purgeStagingBaseDirKeepingBaseDir:0];
  v11.receiver = self;
  v11.super_class = (Class)IXSOwnedDataPromise;
  LOBYTE(a5) = [(IXSDataPromise *)&v11 cancelForReason:v8 client:a4 error:a5];

  return (char)a5;
}

- (BOOL)validateStagedPathWithError:(id *)a3
{
  v5 = [(IXSOwnedDataPromise *)self stagedPath];

  if (v5)
  {
    id v6 = +[IXFileManager defaultManager];
    objc_super v7 = [(IXSOwnedDataPromise *)self stagedPath];
    unsigned int v8 = [v6 itemDoesNotExistAtURL:v7];

    if (!v8)
    {
      id v13 = 0;
      BOOL v14 = 1;
      goto LABEL_12;
    }
    unsigned __int8 v9 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10008FA40(self, v9);
    }

    id v10 = [(IXSOwnedDataPromise *)self stagedPath];
    objc_super v11 = [v10 path];
    sub_10003DAE4((uint64_t)"-[IXSOwnedDataPromise validateStagedPathWithError:]", 201, @"IXErrorDomain", 1uLL, 0, 0, @"The item that this promise is representing does not exist at staged path \"%@\".", v12, (uint64_t)v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (!a3) {
      goto LABEL_6;
    }
LABEL_10:
    id v13 = v13;
    BOOL v14 = 0;
    *a3 = v13;
    goto LABEL_12;
  }
  v15 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10008F9C4();
  }

  sub_10003DAE4((uint64_t)"-[IXSOwnedDataPromise validateStagedPathWithError:]", 196, @"IXErrorDomain", 1uLL, 0, 0, @"The staged path property was not set set.", v16, v18);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (a3) {
    goto LABEL_10;
  }
LABEL_6:
  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (void)setComplete:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  if ([(IXSDataPromise *)self isComplete] != v3)
  {
    if (!v3)
    {
LABEL_5:
      v9.receiver = self;
      v9.super_class = (Class)IXSOwnedDataPromise;
      [(IXSDataPromise *)&v9 setComplete:v3];
      return;
    }
    id v10 = 0;
    unsigned int v6 = [(IXSOwnedDataPromise *)self validateStagedPathWithError:&v10];
    id v7 = v10;
    unsigned int v8 = v7;
    if (v6)
    {

      goto LABEL_5;
    }
    [(IXSOwnedDataPromise *)self cancelForReason:v7 client:15 error:0];
  }
}

- (void)decommission
{
  BOOL v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  [(IXSOwnedDataPromise *)self _onQueue_purgeStagingBaseDirKeepingBaseDir:0];
  v4.receiver = self;
  v4.super_class = (Class)IXSOwnedDataPromise;
  [(IXSDataPromise *)&v4 decommission];
}

- (NSURL)stagingBaseDir
{
  BOOL v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  objc_super v4 = [(IXSDataPromise *)self seed];
  v5 = [v4 stagingBaseDir];

  return (NSURL *)v5;
}

- (NSString)relativeStagedPath
{
  BOOL v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(NSString *)self->_relativeStagedPath copy];

  return (NSString *)v4;
}

- (void)setRelativeStagedPath:(id)a3
{
  id v4 = a3;
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = (NSString *)[v4 copy];
  relativeStagedPath = self->_relativeStagedPath;
  self->_relativeStagedPath = v6;
}

- (NSString)targetLastPathComponent
{
  BOOL v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(NSString *)self->_targetLastPathComponent copy];

  return (NSString *)v4;
}

- (void)setTargetLastPathComponent:(id)a3
{
  id v4 = a3;
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = (NSString *)[v4 copy];
  targetLastPathComponent = self->_targetLastPathComponent;
  self->_targetLastPathComponent = v6;
}

- (NSURL)stagedPath
{
  BOOL v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(IXSOwnedDataPromise *)self relativeStagedPath];

  if (v4)
  {
    v5 = +[IXGlobalConfiguration sharedInstance];
    unsigned int v6 = [v5 promiseStagingRootDirectoryAbortingOnError];

    id v7 = [(IXSOwnedDataPromise *)self relativeStagedPath];
    unsigned int v8 = [v6 URLByAppendingPathComponent:v7 isDirectory:1];
  }
  else
  {
    unsigned int v8 = 0;
  }

  return (NSURL *)v8;
}

- (void)_internal_setStagedPath:(id)a3
{
  id v11 = a3;
  id v4 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v4);

  if (v11)
  {
    v5 = +[IXGlobalConfiguration sharedInstance];
    unsigned int v6 = [v5 promiseStagingRootDirectoryAbortingOnError];

    id v7 = [v6 path];
    unsigned int v8 = [v11 path];
    objc_super v9 = objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:options:range:", v7, &stru_1000ED390, 8, 0, objc_msgSend(v7, "length"));
    id v10 = [v9 mutableCopy];

    if ([v10 hasPrefix:@"/"]) {
      objc_msgSend(v10, "replaceCharactersInRange:withString:", 0, 1, &stru_1000ED390);
    }
    [(IXSOwnedDataPromise *)self setRelativeStagedPath:v10];
  }
  else
  {
    [(IXSOwnedDataPromise *)self setRelativeStagedPath:0];
  }
}

- (void)setStagedPath:(id)a3
{
  id v9 = a3;
  id v4 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v4);

  v5 = [(IXSOwnedDataPromise *)self stagedPath];
  unsigned int v6 = [v5 path];
  id v7 = [v9 path];
  unsigned __int8 v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    [(IXSOwnedDataPromise *)self _internal_setStagedPath:v9];
    [(IXSDataPromise *)self saveState];
  }
}

- (void)setStagedPathMayNotExistWhenAwakening:(BOOL)a3
{
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  self->_stagedPathMayNotExistWhenAwakening = a3;

  [(IXSDataPromise *)self saveState];
}

- (BOOL)issueSandboxExtensionWithError:(id *)a3
{
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = [(IXSDataPromise *)self seed];
  id v7 = [v6 stagingBaseDir];
  [v7 fileSystemRepresentation];
  unsigned __int8 v8 = (const char *)sandbox_extension_issue_file();

  if (v8)
  {
    id v9 = [objc_alloc((Class)NSString) initWithBytesNoCopy:v8 length:strlen(v8) encoding:4 freeWhenDone:1];
    id v10 = [(IXSDataPromise *)self seed];
    [v10 setSandboxExtensionToken:v9];

    id v11 = 0;
  }
  else
  {
    unint64_t v12 = *__error();
    id v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v21 = [(IXSDataPromise *)self seed];
      uint64_t v22 = [v21 stagingBaseDir];
      __int16 v23 = [v22 path];
      char v25 = sub_10003DAE4((uint64_t)"-[IXSOwnedDataPromise issueSandboxExtensionWithError:]", 351, NSPOSIXErrorDomain, v12, 0, 0, @"Failed to create sandbox extension for com.apple.installcoordinationd for path %@", v24, (uint64_t)v23);
      *(_DWORD *)buf = 136315394;
      v28 = "-[IXSOwnedDataPromise issueSandboxExtensionWithError:]";
      __int16 v29 = 2112;
      v30 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Could not provide access to staging directory : %@", buf, 0x16u);
    }
    BOOL v14 = [(IXSDataPromise *)self seed];
    v15 = [v14 stagingBaseDir];
    uint64_t v16 = [v15 path];
    uint64_t v18 = sub_10003DAE4((uint64_t)"-[IXSOwnedDataPromise issueSandboxExtensionWithError:]", 351, NSPOSIXErrorDomain, v12, 0, 0, @"Failed to create sandbox extension for com.apple.installcoordinationd for path %@", v17, (uint64_t)v16);
    sub_10003DAE4((uint64_t)"-[IXSOwnedDataPromise issueSandboxExtensionWithError:]", 351, @"IXErrorDomain", 1uLL, v18, 0, @"Could not provide access to staging directory", v19, v26);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      id v11 = v11;
      *a3 = v11;
    }
  }

  return v8 != 0;
}

- (BOOL)stagedPathMayNotExistWhenAwakening
{
  return self->_stagedPathMayNotExistWhenAwakening;
}

- (NSError)awakeningError
{
  return self->_awakeningError;
}

- (void)setAwakeningError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awakeningError, 0);
  objc_storeStrong((id *)&self->_targetLastPathComponent, 0);

  objc_storeStrong((id *)&self->_relativeStagedPath, 0);
}

- (void)_remote_setStagedPath:(id)a3
{
  id v4 = a3;
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  unsigned int v6 = [(IXSDataPromise *)self accessQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100030034;
  v8[3] = &unk_1000E8E08;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)_remote_getStagedPath:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  unsigned int v6 = [(IXSDataPromise *)self uniqueIdentifier];
  id v7 = [v6 UUIDString];
  BOOL v8 = sub_1000392E4(v7, 8);

  if (v8) {
    exit(1);
  }
  uint64_t v11 = 0;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  BOOL v14 = sub_10002EFCC;
  v15 = sub_10002EFDC;
  id v16 = 0;
  id v9 = [(IXSDataPromise *)self accessQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100030364;
  v10[3] = &unk_1000E90A8;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v9, v10);

  v4[2](v4, v12[5], 0);
  _Block_object_dispose(&v11, 8);
}

- (void)_remote_setTargetLastPathComponent:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  BOOL v8 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v8);

  if ([v6 containsString:@"/"])
  {
    id v9 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10008FBF8();
    }

    uint64_t v11 = sub_10003DAE4((uint64_t)"-[IXSOwnedDataPromise(IXSOwnedDataPromiseIPCMethods) _remote_setTargetLastPathComponent:withCompletion:]", 404, @"IXErrorDomain", 0x29uLL, 0, 0, @"Failed to set target last path component to %@ because it contains slash(es)", v10, (uint64_t)v6);
    v7[2](v7, v11);
  }
  else
  {
    unint64_t v12 = [(IXSDataPromise *)self accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030548;
    block[3] = &unk_1000E8E08;
    void block[4] = self;
    id v14 = v6;
    dispatch_sync(v12, block);

    v7[2](v7, 0);
  }
}

- (void)_remote_getTargetLastPathComponent:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_10002EFCC;
  unint64_t v12 = sub_10002EFDC;
  id v13 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003068C;
  v7[3] = &unk_1000E90A8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0);
  _Block_object_dispose(&v8, 8);
}

- (BOOL)awakeFromSerializationWithLookupBlock:(id)a3 error:(id *)a4
{
  id v6 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(IXSOwnedDataPromise *)self awakeningError];

  if (!v7)
  {
    if ([(IXSDataPromise *)self isTracked])
    {
      [(IXSDataPromise *)self didAwake];
      BOOL v10 = 1;
      [(IXSDataPromise *)self setDidAwake:1];
      if (![(IXSDataPromise *)self isComplete]
        || [(IXSOwnedDataPromise *)self stagedPathMayNotExistWhenAwakening])
      {
        id v9 = 0;
        goto LABEL_16;
      }
      uint64_t v11 = [(IXSOwnedDataPromise *)self stagedPath];
      unint64_t v12 = [(IXSOwnedDataPromise *)self targetLastPathComponent];
      if (v12)
      {
        uint64_t v13 = [v11 URLByAppendingPathComponent:v12 isDirectory:1];

        uint64_t v11 = (void *)v13;
      }
      id v14 = +[IXFileManager defaultManager];
      unsigned int v15 = [v14 itemExistsAtURL:v11];

      if (!v15)
      {
        uint64_t v17 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10008FC78(self, v11, v17);
        }

        uint64_t v18 = [(IXSDataPromise *)self name];
        uint64_t v19 = [(IXSDataPromise *)self uniqueIdentifier];
        id v21 = [v11 path];
        id v9 = sub_10003DAE4((uint64_t)"-[IXSOwnedDataPromise(IXSOwnedDataPromiseIPCMethods) awakeFromSerializationWithLookupBlock:error:]", 463, @"IXErrorDomain", 3uLL, 0, 0, @"IXSOwnedDataPromise (%@) with UUID %@ was complete but found nothing at %@", v20, (uint64_t)v18);

        [(IXSOwnedDataPromise *)self setAwakeningError:v9];
        [(IXSOwnedDataPromise *)self cancelForReason:v9 client:15 error:0];
        if (a4)
        {
          id v8 = v9;
          id v9 = v8;
          goto LABEL_4;
        }
LABEL_10:
        BOOL v10 = 0;
        goto LABEL_16;
      }
    }
    id v9 = 0;
    BOOL v10 = 1;
    goto LABEL_16;
  }
  if (!a4)
  {
    id v9 = 0;
    goto LABEL_10;
  }
  id v8 = [(IXSOwnedDataPromise *)self awakeningError];
  id v9 = 0;
LABEL_4:
  BOOL v10 = 0;
  *a4 = v8;
LABEL_16:

  return v10;
}

@end