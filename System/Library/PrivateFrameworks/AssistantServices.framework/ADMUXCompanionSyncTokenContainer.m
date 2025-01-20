@interface ADMUXCompanionSyncTokenContainer
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstance;
- (ADMUXCompanionSyncTokenContainer)init;
- (ADMUXCompanionSyncTokenContainer)initWithCoder:(id)a3;
- (BOOL)_loadContentsOfFileIfExists;
- (BOOL)_openFileAtPath:(id)a3 withFlags:(int)a4;
- (NSMutableDictionary)aceHostPrimeTokens;
- (NSMutableDictionary)aceHostSyncTokens;
- (id)getSyncTokenForAceHost:(id)a3;
- (id)primeTokenWrapperForAceHost:(id)a3;
- (void)_cleanUpPostFileOperationErrors;
- (void)_deviceUnlockedPostBoot:(id)a3;
- (void)_handleAccountCreatedNotification:(id)a3;
- (void)_loadContentsOfFileOnNotification;
- (void)_removeFilePostAccountRemoval:(id)a3;
- (void)_syncTokens;
- (void)_writeTokensToFile;
- (void)encodeWithCoder:(id)a3;
- (void)handleMuxTokenExchangeMessage:(id)a3 fromPeer:(id)a4 completion:(id)a5;
- (void)putSyncToken:(id)a3 forAceHost:(id)a4;
- (void)setAceHostPrimeTokens:(id)a3;
- (void)setAceHostSyncTokens:(id)a3;
- (void)setPrimeToken:(id)a3 forAceHost:(id)a4;
@end

@implementation ADMUXCompanionSyncTokenContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceHostPrimeTokens, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_fileOperationQueue, 0);
  objc_storeStrong((id *)&self->_primeToken, 0);
  objc_storeStrong((id *)&self->_aceHostSyncTokens, 0);
}

- (void)setAceHostPrimeTokens:(id)a3
{
}

- (NSMutableDictionary)aceHostPrimeTokens
{
  return self->_aceHostPrimeTokens;
}

- (void)setAceHostSyncTokens:(id)a3
{
}

- (NSMutableDictionary)aceHostSyncTokens
{
  return self->_aceHostSyncTokens;
}

- (void)handleMuxTokenExchangeMessage:(id)a3 fromPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, void))a5;
  if (AFIsMultiUserCompanion())
  {
    v11 = [v8 objectForKey:@"SiriMuxTokenHost"];
    uint64_t v12 = [(ADMUXCompanionSyncTokenContainer *)self getSyncTokenForAceHost:v11];
    if (v12)
    {
      v13 = (void *)v12;
    }
    else
    {
      v14 = +[ADAccount activeAccount];
      uint64_t v15 = [v14 aceHostCluster];

      v16 = +[ADMUXCompanionSyncTokenContainer sharedInstance];
      v13 = [v16 getSyncTokenForAceHost:v15];

      v11 = (void *)v15;
    }
    if (self->_deviceUnlockedAtleastOnce)
    {
      if (v13 && v11)
      {
        v17 = [v9 assistantIdentifier];
        v18 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v27 = "-[ADMUXCompanionSyncTokenContainer handleMuxTokenExchangeMessage:fromPeer:completion:]";
          __int16 v28 = 2112;
          v29 = v11;
          __int16 v30 = 2112;
          v31 = v17;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%s Sending token for aceHost: %@ to peer with assistantID: %@", buf, 0x20u);
        }
        v25[0] = v13;
        v25[1] = v11;
        v19 = +[NSDate date];
        [v19 timeIntervalSince1970];
        v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v24[3] = @"SiriMuxSyncTokenTransferReason";
        v25[2] = v20;
        v25[3] = &off_100523A80;
        v21 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];

        v10[2](v10, v21, 0);
        goto LABEL_15;
      }
      uint64_t v22 = 6016;
    }
    else
    {
      uint64_t v22 = 6017;
    }
    v23 = +[AFError errorWithCode:v22];
    ((void (**)(id, void *, void *))v10)[2](v10, 0, v23);

LABEL_15:
    goto LABEL_16;
  }
  v11 = +[AFError errorWithCode:1010];
  ((void (**)(id, void *, void *))v10)[2](v10, 0, v11);
LABEL_16:
}

- (void)setPrimeToken:(id)a3 forAceHost:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    os_unfair_lock_lock(&self->_tokenLock);
    id v8 = [ADPrimeTokenWrapper alloc];
    id v9 = +[NSDate now];
    [v9 timeIntervalSince1970];
    id v10 = -[ADPrimeTokenWrapper init:timeStamp:](v8, "init:timeStamp:", v6);

    [(NSMutableDictionary *)self->_aceHostPrimeTokens setObject:v10 forKey:v7];
    os_unfair_lock_unlock(&self->_tokenLock);
  }
  else
  {
    v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      v13 = "-[ADMUXCompanionSyncTokenContainer setPrimeToken:forAceHost:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Prime token is nil", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (id)primeTokenWrapperForAceHost:(id)a3
{
  p_tokenLock = &self->_tokenLock;
  id v5 = a3;
  os_unfair_lock_lock(p_tokenLock);
  id v6 = [(NSMutableDictionary *)self->_aceHostPrimeTokens objectForKey:v5];

  os_unfair_lock_unlock(p_tokenLock);
  return v6;
}

- (id)getSyncTokenForAceHost:(id)a3
{
  p_tokenLock = &self->_tokenLock;
  id v5 = a3;
  os_unfair_lock_lock(p_tokenLock);
  id v6 = [(NSMutableDictionary *)self->_aceHostSyncTokens objectForKey:v5];

  os_unfair_lock_unlock(p_tokenLock);
  return v6;
}

- (void)putSyncToken:(id)a3 forAceHost:(id)a4
{
  p_tokenLock = &self->_tokenLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_tokenLock);
  [(NSMutableDictionary *)self->_aceHostSyncTokens setObject:v8 forKey:v7];

  os_unfair_lock_unlock(p_tokenLock);
  [(ADMUXCompanionSyncTokenContainer *)self _syncTokens];
}

- (void)_cleanUpPostFileOperationErrors
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_fileOperationQueue);
  [(NSFileHandle *)self->_fileHandle closeFile];
  filePath = self->_filePath;
  [(ADMUXCompanionSyncTokenContainer *)self _openFileAtPath:filePath withFlags:2];
}

- (void)_writeTokensToFile
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_fileOperationQueue);
  [(NSFileHandle *)self->_fileHandle seekToFileOffset:0];
  id v20 = 0;
  v3 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v20];
  id v4 = v20;
  if (v4)
  {
    id v5 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v12 = v5;
      v13 = [v4 description];
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "-[ADMUXCompanionSyncTokenContainer _writeTokensToFile]";
      __int16 v23 = 2112;
      v24 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Failed to archive token container with error=%@", buf, 0x16u);
    }
  }
  fileHandle = self->_fileHandle;
  id v19 = 0;
  [(NSFileHandle *)fileHandle writeData:v3 error:&v19];
  id v7 = v19;
  if (v7)
  {
    id v8 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v14 = v8;
      uint64_t v15 = [v7 description];
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "-[ADMUXCompanionSyncTokenContainer _writeTokensToFile]";
      __int16 v23 = 2112;
      v24 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Failed to write data to disk %@", buf, 0x16u);
    }
    [(ADMUXCompanionSyncTokenContainer *)self _cleanUpPostFileOperationErrors];
  }
  else
  {
    id v9 = self->_fileHandle;
    id v18 = 0;
    [(NSFileHandle *)v9 synchronizeAndReturnError:&v18];
    id v10 = v18;
    v11 = AFSiriLogContextDaemon;
    if (v10)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        v16 = v11;
        v17 = [v10 description];
        *(_DWORD *)buf = 136315394;
        uint64_t v22 = "-[ADMUXCompanionSyncTokenContainer _writeTokensToFile]";
        __int16 v23 = 2112;
        v24 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Failed to synchronize file to the disk due to %@", buf, 0x16u);
      }
      [(ADMUXCompanionSyncTokenContainer *)self _cleanUpPostFileOperationErrors];
    }
    else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v22 = "-[ADMUXCompanionSyncTokenContainer _writeTokensToFile]";
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Writing primeToken and sync tokens per ace host to file", buf, 0xCu);
    }
  }
}

- (void)_syncTokens
{
  fileOperationQueue = self->_fileOperationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026EA10;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(fileOperationQueue, block);
}

- (ADMUXCompanionSyncTokenContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"aceHostPrimeTokens"];
  id v9 = [v4 decodeObjectOfClasses:v7 forKey:@"aceHostSyncTokens"];

  v13.receiver = self;
  v13.super_class = (Class)ADMUXCompanionSyncTokenContainer;
  id v10 = [(ADMUXCompanionSyncTokenContainer *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_aceHostPrimeTokens, v8);
    objc_storeStrong((id *)&v11->_aceHostSyncTokens, v9);
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  aceHostSyncTokens = self->_aceHostSyncTokens;
  id v5 = a3;
  [v5 encodeObject:aceHostSyncTokens forKey:@"aceHostSyncTokens"];
  [v5 encodeObject:self->_aceHostPrimeTokens forKey:@"aceHostPrimeTokens"];
}

- (BOOL)_openFileAtPath:(id)a3 withFlags:(int)a4
{
  uint64_t v5 = open_dprotected_np((const char *)[a3 UTF8String], a4, 3, 0, 384);
  if (v5 == -1)
  {
    id v8 = __error();
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v11 = *v8;
      filePath = self->_filePath;
      *(_DWORD *)buf = 136315650;
      v14 = "-[ADMUXCompanionSyncTokenContainer _openFileAtPath:withFlags:]";
      __int16 v15 = 2112;
      v16 = filePath;
      __int16 v17 = 1024;
      int v18 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Failed to open file at path=%@, errno=%d", buf, 0x1Cu);
    }
  }
  else
  {
    uint64_t v6 = (NSFileHandle *)[objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v5 closeOnDealloc:1];
    fileHandle = self->_fileHandle;
    self->_fileHandle = v6;
  }
  return v5 != -1;
}

- (BOOL)_loadContentsOfFileIfExists
{
  if (!self->_fileHandle)
  {
    uint64_t v5 = +[NSFileManager defaultManager];
    uint64_t v6 = [v5 URLsForDirectory:5 inDomains:1];
    id v7 = [v6 firstObject];

    id v8 = [v7 URLByAppendingPathComponent:@"Assistant" isDirectory:1];

    id v33 = 0;
    [v5 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v33];
    id v9 = v33;
    if (v9)
    {
      id v10 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v35 = "-[ADMUXCompanionSyncTokenContainer _loadContentsOfFileIfExists]";
        __int16 v36 = 2112;
        v37 = v8;
        __int16 v38 = 2112;
        id v39 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Failed to create directory at path=%@, error=%@", buf, 0x20u);
      }
      BOOL v3 = 0;
      int v11 = v8;
    }
    else
    {
      int v11 = [(NSString *)v8 URLByAppendingPathComponent:@"ADMUXSyncTokensFile"];

      int v12 = [v11 path];
      filePath = self->_filePath;
      self->_filePath = v12;

      unsigned int v14 = [v5 fileExistsAtPath:self->_filePath];
      if (v14) {
        uint64_t v15 = 2;
      }
      else {
        uint64_t v15 = 2562;
      }
      self->_deviceUnlockedAtleastOnce = AFHasUnlockedSinceBoot();
      v16 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[ADMUXCompanionSyncTokenContainer _loadContentsOfFileIfExists]";
        __int16 v36 = 1024;
        LODWORD(v37) = v14;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s ADMUXSyncTokensFile fileExists?=%d", buf, 0x12u);
      }
      unsigned int v17 = [(ADMUXCompanionSyncTokenContainer *)self _openFileAtPath:self->_filePath withFlags:v15];
      if ((v17 & v14) == 1)
      {
        int v18 = [(NSFileHandle *)self->_fileHandle availableData];
        if ([v18 length])
        {
          id v32 = 0;
          id v19 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v18 error:&v32];
          id v20 = v32;
          v21 = AFSiriLogContextDaemon;
          if (v20)
          {
            uint64_t v22 = v20;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              v29 = self->_filePath;
              __int16 v30 = v21;
              v31 = [v22 description];
              *(_DWORD *)buf = 136315650;
              v35 = "-[ADMUXCompanionSyncTokenContainer _loadContentsOfFileIfExists]";
              __int16 v36 = 2112;
              v37 = v29;
              __int16 v38 = 2112;
              id v39 = v31;
              _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s Failed to load data from file =%@ with error=%@", buf, 0x20u);
            }
            BOOL v3 = 0;
            goto LABEL_27;
          }
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v35 = "-[ADMUXCompanionSyncTokenContainer _loadContentsOfFileIfExists]";
            _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%s Extracting primeTokens and syncTokens per ace host from file", buf, 0xCu);
          }
          v24 = [v19 aceHostPrimeTokens];
          aceHostPrimeTokens = self->_aceHostPrimeTokens;
          self->_aceHostPrimeTokens = v24;

          v26 = [v19 aceHostSyncTokens];
          aceHostSyncTokens = self->_aceHostSyncTokens;
          self->_aceHostSyncTokens = v26;
        }
        else
        {
          __int16 v23 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v35 = "-[ADMUXCompanionSyncTokenContainer _loadContentsOfFileIfExists]";
            _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s ADMUXSyncTokensFile is empty", buf, 0xCu);
          }
        }

        BOOL v3 = 1;
      }
      else
      {
        BOOL v3 = v17;
      }
    }
LABEL_27:

    return v3;
  }
  v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[ADMUXCompanionSyncTokenContainer _loadContentsOfFileIfExists]";
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s The fileHandle exists. Returning", buf, 0xCu);
  }
  return 0;
}

- (void)_loadContentsOfFileOnNotification
{
  fileOperationQueue = self->_fileOperationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026F20C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(fileOperationQueue, block);
}

- (void)_deviceUnlockedPostBoot:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[ADMUXCompanionSyncTokenContainer _deviceUnlockedPostBoot:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s Received notification about device unlock post boot", (uint8_t *)&v5, 0xCu);
  }
  [(ADMUXCompanionSyncTokenContainer *)self _loadContentsOfFileOnNotification];
}

- (void)_removeFilePostAccountRemoval:(id)a3
{
  fileOperationQueue = self->_fileOperationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026F340;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(fileOperationQueue, block);
}

- (void)_handleAccountCreatedNotification:(id)a3
{
  id v4 = +[AFPreferences sharedPreferences];
  unsigned int v5 = [v4 assistantIsEnabled];

  uint64_t v6 = AFSiriLogContextDaemon;
  BOOL v7 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      int v8 = 136315138;
      id v9 = "-[ADMUXCompanionSyncTokenContainer _handleAccountCreatedNotification:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s Handling file load on account creation", (uint8_t *)&v8, 0xCu);
    }
    [(ADMUXCompanionSyncTokenContainer *)self _loadContentsOfFileOnNotification];
  }
  else if (v7)
  {
    int v8 = 136315138;
    id v9 = "-[ADMUXCompanionSyncTokenContainer _handleAccountCreatedNotification:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s Assistant hasn't been enabled", (uint8_t *)&v8, 0xCu);
  }
}

- (ADMUXCompanionSyncTokenContainer)init
{
  v21.receiver = self;
  v21.super_class = (Class)ADMUXCompanionSyncTokenContainer;
  v2 = [(ADMUXCompanionSyncTokenContainer *)&v21 init];
  if (v2)
  {
    BOOL v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ADMUXCompanionSyncTokenContainerFileOperationQueue", v3);

    fileOperationQueue = v2->_fileOperationQueue;
    v2->_fileOperationQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    aceHostSyncTokens = v2->_aceHostSyncTokens;
    v2->_aceHostSyncTokens = v6;

    int v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    aceHostPrimeTokens = v2->_aceHostPrimeTokens;
    v2->_aceHostPrimeTokens = v8;

    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v23 = "-[ADMUXCompanionSyncTokenContainer init]";
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Registering for first unlock notification", buf, 0xCu);
    }
    v2->_deviceUnlockedAtleastOnce = 0;
    int v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"_deviceUnlockedPostBoot:" name:@"ADFirstUnlockNotification" object:0];

    int v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v23 = "-[ADMUXCompanionSyncTokenContainer init]";
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Registering for account removal notification", buf, 0xCu);
    }
    objc_super v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v2 selector:"_removeFilePostAccountRemoval:" name:@"AssistantAccountRemoved" object:0];

    unsigned int v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v23 = "-[ADMUXCompanionSyncTokenContainer init]";
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s Registering for account creation notification", buf, 0xCu);
    }
    uint64_t v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v2 selector:"_handleAccountCreatedNotification:" name:@"AssistantAccountCreated" object:0];

    v16 = v2->_fileOperationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10026F974;
    block[3] = &unk_10050E138;
    unsigned int v17 = v2;
    id v20 = v17;
    dispatch_sync(v16, block);
    v17->_tokenLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharedInstance
{
  if (qword_100586078 != -1) {
    dispatch_once(&qword_100586078, &stru_1005084B8);
  }
  v2 = (void *)qword_100586080;
  return v2;
}

@end