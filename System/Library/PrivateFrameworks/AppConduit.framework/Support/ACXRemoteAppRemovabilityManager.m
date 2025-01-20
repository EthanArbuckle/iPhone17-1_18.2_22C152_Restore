@interface ACXRemoteAppRemovabilityManager
+ (BOOL)supportsSecureCoding;
+ (id)remoteRemovabilityManagerForStorageBaseURL:(id)a3 delegate:(id)a4 queue:(id)a5;
- (ACXRemoteAppRemovabilityManager)initWithCoder:(id)a3;
- (ACXRemoteAppRemovabilityManager)initWithStorageBaseURL:(id)a3 delegate:(id)a4 queue:(id)a5;
- (ACXRemoteRemovabilityCommunications)delegate;
- (BOOL)_onQueue_hasRemoteChangeClockUpdatedForUUID:(id)a3 sequenceNumber:(unint64_t)a4;
- (NSDictionary)appRemovabilityMap;
- (NSURL)storageBaseURL;
- (NSUUID)currentClockUUID;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (unint64_t)lastSequenceNumber;
- (void)_onQueue_saveData;
- (void)encodeWithCoder:(id)a3;
- (void)removabilityUpdatedForApp:(id)a3 removability:(unint64_t)a4 dbUUID:(id)a5 sequenceNumber:(unint64_t)a6;
- (void)removeDelegate:(id)a3;
- (void)reportRemoteRemovabilityDBUUID:(id)a3 sequenceNumber:(unint64_t)a4;
- (void)setAppRemovabilityMap:(id)a3;
- (void)setCurrentClockUUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setLastSequenceNumber:(unint64_t)a3;
- (void)setRemoteRemovabilityData:(id)a3 withDBUUID:(id)a4 sequenceNumber:(unint64_t)a5;
- (void)setStorageBaseURL:(id)a3;
@end

@implementation ACXRemoteAppRemovabilityManager

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)remoteRemovabilityManagerForStorageBaseURL:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 URLByAppendingPathComponent:@"ACXRemoteRemovability.plist" isDirectory:0];
  v11 = [v10 path];
  id v26 = 0;
  v12 = +[NSData dataWithContentsOfFile:v11 options:1 error:&v26];
  id v13 = v26;

  if (!v12)
  {
    v18 = [v13 domain];
    if ([v18 isEqualToString:NSCocoaErrorDomain])
    {
      id v19 = [v13 code];

      if (v19 == (id)260) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      v20 = [v10 path];
      v23 = v20;
      id v24 = v13;
      MOLogWrite();
      id v14 = 0;
LABEL_20:

      goto LABEL_23;
    }
LABEL_15:
    id v14 = 0;
    goto LABEL_23;
  }
  id v25 = v13;
  id v14 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v12 error:&v25];
  id v15 = v25;

  if (v14)
  {
    v16 = [v14 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
    if (v16)
    {
      id v17 = v16;
      [v16 setDelegate:v8];
      [v17 setDelegateQueue:v9];
      [v17 setStorageBaseURL:v7];
      id v13 = v15;
      goto LABEL_27;
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      v20 = [v10 path];
      v23 = v20;
      MOLogWrite();
      goto LABEL_19;
    }
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      v20 = [v10 path];
      v23 = v20;
      id v24 = v15;
      MOLogWrite();
      id v14 = 0;
LABEL_19:
      id v13 = v15;
      goto LABEL_20;
    }
    id v14 = 0;
  }
  id v13 = v15;
LABEL_23:
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  v21 = +[NSFileManager defaultManager];
  [v21 removeItemAtURL:v10 error:0];

  id v17 = [objc_alloc((Class)objc_opt_class()) initWithStorageBaseURL:v7 delegate:v8 queue:v9];
LABEL_27:

  return v17;
}

- (ACXRemoteAppRemovabilityManager)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ACXRemoteAppRemovabilityManager;
  v5 = [(ACXRemoteAppRemovabilityManager *)&v19 init];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"appRemovabilityMap"];
  appRemovabilityMap = v5->_appRemovabilityMap;
  v5->_appRemovabilityMap = (NSDictionary *)v9;

  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentClockUUID"];
  currentClockUUID = v5->_currentClockUUID;
  v5->_currentClockUUID = (NSUUID *)v11;

  id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastSequenceNumber"];
  v5->_lastSequenceNumber = (unint64_t)[v13 unsignedIntegerValue];

  id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RemoteRemovabilityVersion"];
  id v15 = v14;
  if (v14 && [v14 unsignedLongLongValue] != (id)1)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_13;
    }
LABEL_12:
    MOLogWrite();
LABEL_13:

    id v17 = 0;
    goto LABEL_14;
  }
  v16 = [(ACXRemoteAppRemovabilityManager *)v5 appRemovabilityMap];

  if (!v16)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

LABEL_6:
  id v17 = v5;
LABEL_14:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  appRemovabilityMap = self->_appRemovabilityMap;
  id v6 = a3;
  [v6 encodeObject:appRemovabilityMap forKey:@"appRemovabilityMap"];
  [v6 encodeObject:self->_currentClockUUID forKey:@"currentClockUUID"];
  v5 = +[NSNumber numberWithUnsignedInteger:self->_lastSequenceNumber];
  [v6 encodeObject:v5 forKey:@"lastSequenceNumber"];

  [v6 encodeObject:&off_100097588 forKey:@"RemoteRemovabilityVersion"];
}

- (void)_onQueue_saveData
{
  v3 = [(ACXRemoteAppRemovabilityManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v4 setOutputFormat:200];
  [v4 encodeObject:self forKey:NSKeyedArchiveRootObjectKey];
  v5 = [v4 encodedData];
  id v6 = [(ACXRemoteAppRemovabilityManager *)self storageBaseURL];
  id v7 = [v6 URLByAppendingPathComponent:@"ACXRemoteRemovability.plist" isDirectory:0];

  id v11 = 0;
  unsigned __int8 v8 = [v5 writeToURL:v7 options:268435457 error:&v11];
  id v9 = v11;
  if ((v8 & 1) == 0 && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3))
  {
    id v10 = [v7 path];
    MOLogWrite();
  }
}

- (ACXRemoteAppRemovabilityManager)initWithStorageBaseURL:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ACXRemoteAppRemovabilityManager;
  v12 = [(ACXRemoteAppRemovabilityManager *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storageBaseURL, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_delegateQueue, a5);
  }

  return v13;
}

- (OS_dispatch_queue)queue
{
  if (qword_1000A5500 != -1) {
    dispatch_once(&qword_1000A5500, &stru_10008CE90);
  }
  v2 = (void *)qword_1000A5508;

  return (OS_dispatch_queue *)v2;
}

- (void)removeDelegate:(id)a3
{
  id v4 = [(ACXRemoteAppRemovabilityManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000101C8;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (BOOL)_onQueue_hasRemoteChangeClockUpdatedForUUID:(id)a3 sequenceNumber:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(ACXRemoteAppRemovabilityManager *)self queue];
  dispatch_assert_queue_V2(v7);

  if ([(NSUUID *)self->_currentClockUUID isEqual:v6])
  {
    BOOL v8 = self->_lastSequenceNumber != a4;
  }
  else
  {
    if (self->_currentClockUUID && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 4)) {
      MOLogWrite();
    }
    BOOL v8 = 1;
  }

  return v8;
}

- (void)reportRemoteRemovabilityDBUUID:(id)a3 sequenceNumber:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(ACXRemoteAppRemovabilityManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010350;
  block[3] = &unk_10008CEB8;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)removabilityUpdatedForApp:(id)a3 removability:(unint64_t)a4 dbUUID:(id)a5 sequenceNumber:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  v12 = [(ACXRemoteAppRemovabilityManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010520;
  block[3] = &unk_10008CEE0;
  block[4] = self;
  id v16 = v11;
  id v17 = v10;
  unint64_t v18 = a6;
  unint64_t v19 = a4;
  id v13 = v10;
  id v14 = v11;
  dispatch_sync(v12, block);
}

- (void)setRemoteRemovabilityData:(id)a3 withDBUUID:(id)a4 sequenceNumber:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(ACXRemoteAppRemovabilityManager *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100010AD4;
  v13[3] = &unk_10008CF30;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  unint64_t v16 = a5;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(v10, v13);
}

- (NSDictionary)appRemovabilityMap
{
  return self->_appRemovabilityMap;
}

- (void)setAppRemovabilityMap:(id)a3
{
}

- (NSUUID)currentClockUUID
{
  return self->_currentClockUUID;
}

- (void)setCurrentClockUUID:(id)a3
{
}

- (unint64_t)lastSequenceNumber
{
  return self->_lastSequenceNumber;
}

- (void)setLastSequenceNumber:(unint64_t)a3
{
  self->_lastSequenceNumber = a3;
}

- (ACXRemoteRemovabilityCommunications)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ACXRemoteRemovabilityCommunications *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSURL)storageBaseURL
{
  return self->_storageBaseURL;
}

- (void)setStorageBaseURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageBaseURL, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentClockUUID, 0);

  objc_storeStrong((id *)&self->_appRemovabilityMap, 0);
}

@end