@interface MailPersistentStorageSaveOperation
- (EFCancelable)finishedObservation;
- (MFTaskAssertion)taskAssertion;
- (MailPersistentStorageSaveOperation)initWithDestinationPath:(id)a3 groupDictionary:(id)a4;
- (NSDictionary)groupDictionary;
- (NSString)destinationPath;
- (void)dealloc;
- (void)main;
- (void)setDestinationPath:(id)a3;
- (void)setFinishedObservation:(id)a3;
- (void)setGroupDictionary:(id)a3;
- (void)setTaskAssertion:(id)a3;
@end

@implementation MailPersistentStorageSaveOperation

- (void)dealloc
{
  [(EFCancelable *)self->_finishedObservation cancel];
  v3.receiver = self;
  v3.super_class = (Class)MailPersistentStorageSaveOperation;
  [(MailPersistentStorageSaveOperation *)&v3 dealloc];
}

- (MailPersistentStorageSaveOperation)initWithDestinationPath:(id)a3 groupDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)MailPersistentStorageSaveOperation;
  v8 = [(MailPersistentStorageSaveOperation *)&v25 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    destinationPath = v8->_destinationPath;
    v8->_destinationPath = v9;

    v11 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithDictionary:v7 copyItems:1];
    groupDictionary = v8->_groupDictionary;
    v8->_groupDictionary = v11;

    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v15 = +[NSString stringWithFormat:@"com.apple.mobilemail.%@-%p", v14, v8];

    v16 = (MFTaskAssertion *)[objc_alloc((Class)MFTaskAssertion) initWithName:v15 preventIdleSleep:1];
    taskAssertion = v8->_taskAssertion;
    v8->_taskAssertion = v16;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v8);
    v18 = NSStringFromSelector("isFinished");
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100037BD4;
    v22[3] = &unk_10013AD48;
    objc_copyWeak(&v23, &location);
    uint64_t v19 = [(MailPersistentStorageSaveOperation *)v8 ef_observeKeyPath:v18 options:0 usingBlock:v22];
    finishedObservation = v8->_finishedObservation;
    v8->_finishedObservation = (EFCancelable *)v19;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)main
{
  if (([(MailPersistentStorageSaveOperation *)self isCancelled] & 1) == 0)
  {
    objc_super v3 = [(MailPersistentStorageSaveOperation *)self groupDictionary];
    id v14 = 0;
    v4 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:100 options:0 error:&v14];
    id v5 = v14;

    if (v4)
    {
      if ([(MailPersistentStorageSaveOperation *)self isCancelled])
      {
LABEL_11:

        return;
      }
      id v6 = [(MailPersistentStorageSaveOperation *)self destinationPath];
      id v13 = 0;
      unsigned __int8 v7 = [v4 writeToFile:v6 options:1073741825 error:&v13];
      v8 = v13;

      if ((v7 & 1) == 0)
      {
        v9 = MFLogGeneral();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = [(MailPersistentStorageSaveOperation *)self destinationPath];
          v11 = [v8 ef_publicDescription];
          sub_1000C0DAC(v10, v11, buf, v9);
        }
      }
    }
    else
    {
      v8 = MFLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v12 = objc_msgSend(v5, "ef_publicDescription");
        sub_1000C0D54(v12, buf, v8);
      }
    }

    goto LABEL_11;
  }
}

- (NSDictionary)groupDictionary
{
  return self->_groupDictionary;
}

- (void)setGroupDictionary:(id)a3
{
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
}

- (EFCancelable)finishedObservation
{
  return self->_finishedObservation;
}

- (void)setFinishedObservation:(id)a3
{
}

- (MFTaskAssertion)taskAssertion
{
  return self->_taskAssertion;
}

- (void)setTaskAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskAssertion, 0);
  objc_storeStrong((id *)&self->_finishedObservation, 0);
  objc_storeStrong((id *)&self->_destinationPath, 0);

  objc_storeStrong((id *)&self->_groupDictionary, 0);
}

@end