@interface IDSDMessageStoreMap
+ (id)sharedInstance;
- (IDSDMessageStoreMap)init;
- (NSArray)messageStores;
- (id)getOrCreateMessageStoreForDataProtectionClass:(unsigned int)a3;
- (void)dealloc;
@end

@implementation IDSDMessageStoreMap

+ (id)sharedInstance
{
  if (qword_100A4C770 != -1) {
    dispatch_once(&qword_100A4C770, &stru_100989138);
  }
  v2 = (void *)qword_100A4C768;

  return v2;
}

- (IDSDMessageStoreMap)init
{
  v10.receiver = self;
  v10.super_class = (Class)IDSDMessageStoreMap;
  v2 = [(IDSDMessageStoreMap *)&v10 init];
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_mutex, 0);
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    messageStores = v3->_messageStores;
    v3->_messageStores = v4;

    id v6 = [(IDSDMessageStoreMap *)v3 getOrCreateMessageStoreForDataProtectionClass:1];
    id v7 = [(IDSDMessageStoreMap *)v3 getOrCreateMessageStoreForDataProtectionClass:0];
    id v8 = [(IDSDMessageStoreMap *)v3 getOrCreateMessageStoreForDataProtectionClass:2];
  }
  return v3;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_mutex);
  v3.receiver = self;
  v3.super_class = (Class)IDSDMessageStoreMap;
  [(IDSDMessageStoreMap *)&v3 dealloc];
}

- (id)getOrCreateMessageStoreForDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = +[FTDeviceSupport sharedInstance];
  unsigned int v6 = [v5 supportsHandoff];

  if (v3 <= 1 && !v6)
  {
    id v7 = 0;
    goto LABEL_14;
  }
  id v8 = IDSDataProtectionClassStringFromDataProtectionClass();
  pthread_mutex_lock(&self->_mutex);
  v9 = +[IMSystemMonitor sharedInstance];
  unsigned __int8 v10 = [v9 isUnderFirstDataProtectionLock];

  v11 = +[IMSystemMonitor sharedInstance];
  unsigned __int8 v12 = [v11 isUnderDataProtectionLock];

  id v7 = [(NSMutableDictionary *)self->_messageStores objectForKey:v8];
  if (!v7)
  {
    char v13 = v12 ^ 1;
    if (v3 != 1) {
      char v13 = 1;
    }
    if ((v13 & 1) == 0) {
      goto LABEL_12;
    }
    char v14 = v10 ^ 1;
    if (v3 == 2) {
      char v14 = 1;
    }
    if ((v14 & 1) == 0)
    {
LABEL_12:
      pthread_mutex_unlock(&self->_mutex);
      id v7 = 0;
      goto LABEL_13;
    }
    id v7 = [[IDSDMessageStore alloc] initWithDataProtectionClass:v3];
    [(IDSDMessageStore *)v7 _performInitialHousekeeping];
    [(NSMutableDictionary *)self->_messageStores setObject:v7 forKey:v8];
    v16 = +[IMRGLog dataProtectionClass];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      messageStores = self->_messageStores;
      int v18 = 138412290;
      v19 = messageStores;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Message store map %@", (uint8_t *)&v18, 0xCu);
    }
  }
  pthread_mutex_unlock(&self->_mutex);
LABEL_13:

LABEL_14:

  return v7;
}

- (NSArray)messageStores
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  v4 = [(NSMutableDictionary *)self->_messageStores allValues];
  pthread_mutex_unlock(p_mutex);

  return (NSArray *)v4;
}

- (void).cxx_destruct
{
}

@end