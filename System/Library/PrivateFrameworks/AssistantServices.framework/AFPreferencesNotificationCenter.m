@interface AFPreferencesNotificationCenter
+ (id)sharedInstance;
- (AFPreferencesNotificationCenter)init;
- (id)addObserverForDarwinName:(__CFString *)a3 usingBlock:(id)a4;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation AFPreferencesNotificationCenter

- (id)addObserverForDarwinName:(__CFString *)a3 usingBlock:(id)a4
{
  v6 = a3;
  instanceLock = self->instanceLock;
  id v8 = a4;
  [(NSLock *)instanceLock lock];
  v9 = [(NSMutableDictionary *)self->darwinRegistrationsByName objectForKey:v6];
  v10 = v9;
  darwinRegistrationsByName = self->darwinRegistrationsByName;
  if (v9)
  {
    v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v9, "intValue") + 1);
    [(NSMutableDictionary *)darwinRegistrationsByName setObject:v12 forKey:v6];
  }
  else
  {
    v13 = [MEMORY[0x1E4F28ED0] numberWithInt:1];
    [(NSMutableDictionary *)darwinRegistrationsByName setObject:v13 forKey:v6];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_AFPreferencesNotificationCenterTrampoline, v6, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v18.receiver = self;
  v18.super_class = (Class)AFPreferencesNotificationCenter;
  v15 = [(AFPreferencesNotificationCenter *)&v18 addObserverForName:v6 object:0 queue:0 usingBlock:v8];

  v16 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v15);
  [(NSMutableDictionary *)self->darwinRegistrationsByObserver setObject:v6 forKey:v16];
  [(NSLock *)self->instanceLock unlock];

  return v15;
}

- (AFPreferencesNotificationCenter)init
{
  v10.receiver = self;
  v10.super_class = (Class)AFPreferencesNotificationCenter;
  v2 = [(AFPreferencesNotificationCenter *)&v10 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    instanceLock = v2->instanceLock;
    v2->instanceLock = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:8];
    darwinRegistrationsByObserver = v2->darwinRegistrationsByObserver;
    v2->darwinRegistrationsByObserver = (NSMutableDictionary *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:8];
    darwinRegistrationsByName = v2->darwinRegistrationsByName;
    v2->darwinRegistrationsByName = (NSMutableDictionary *)v7;
  }
  return v2;
}

+ (id)sharedInstance
{
  return _AFPreferencesNotificationCenterGetSharedInstance(1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->darwinRegistrationsByName, 0);
  objc_storeStrong((id *)&self->darwinRegistrationsByObserver, 0);
  objc_storeStrong((id *)&self->instanceLock, 0);
}

- (void)removeObserver:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSLock *)self->instanceLock lock];
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v4);
  v6 = [(NSMutableDictionary *)self->darwinRegistrationsByObserver objectForKey:v5];
  if (v6)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->darwinRegistrationsByName objectForKey:v6];
    id v8 = v7;
    if (v7)
    {
      int v9 = [v7 intValue];
      darwinRegistrationsByName = self->darwinRegistrationsByName;
      if (v9 < 2)
      {
        [(NSMutableDictionary *)darwinRegistrationsByName removeObjectForKey:v6];
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v6, 0);
      }
      else
      {
        v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v8, "intValue") - 1);
        [(NSMutableDictionary *)darwinRegistrationsByName setObject:v11 forKey:v6];
      }
    }
    else
    {
      v12 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[AFPreferencesNotificationCenter removeObserver:]";
        __int16 v17 = 2112;
        objc_super v18 = v6;
        _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s Notification registration inconsistency detected for %@", buf, 0x16u);
      }
    }
    [(NSMutableDictionary *)self->darwinRegistrationsByObserver removeObjectForKey:v5];
  }
  [(NSLock *)self->instanceLock unlock];
  v14.receiver = self;
  v14.super_class = (Class)AFPreferencesNotificationCenter;
  [(AFPreferencesNotificationCenter *)&v14 removeObserver:v4];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)AFPreferencesNotificationCenter;
  [(AFPreferencesNotificationCenter *)&v4 dealloc];
}

@end