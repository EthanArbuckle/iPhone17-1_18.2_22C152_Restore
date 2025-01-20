@interface VOTLockStateManager
+ (id)sharedInstance;
- (BOOL)isLocked;
- (VOTLockStateManager)init;
- (void)_notifyObserversLockStateDidChange;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation VOTLockStateManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010F6C;
  block[3] = &unk_1001B3580;
  block[4] = a1;
  if (qword_1001EB6A0 != -1) {
    dispatch_once(&qword_1001EB6A0, block);
  }
  v2 = (void *)qword_1001EB6A8;

  return v2;
}

- (VOTLockStateManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)VOTLockStateManager;
  v2 = [(VOTLockStateManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    lockStateObservers = v2->_lockStateObservers;
    v2->_lockStateObservers = (NSHashTable *)v3;

    v5 = (NSLock *)objc_alloc_init((Class)NSLock);
    lockStateObserversLock = v2->_lockStateObserversLock;
    v2->_lockStateObserversLock = v5;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_100011050, @"com.apple.mobile.keybagd.lock_status", 0, CFNotificationSuspensionBehaviorDrop);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)VOTLockStateManager;
  [(VOTLockStateManager *)&v4 dealloc];
}

- (BOOL)isLocked
{
  return MKBGetDeviceLockState() == 1;
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    lockStateObserversLock = self->_lockStateObserversLock;
    id v5 = a3;
    [(NSLock *)lockStateObserversLock lock];
    [(NSHashTable *)self->_lockStateObservers addObject:v5];

    v6 = self->_lockStateObserversLock;
    [(NSLock *)v6 unlock];
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    lockStateObserversLock = self->_lockStateObserversLock;
    id v5 = a3;
    [(NSLock *)lockStateObserversLock lock];
    [(NSHashTable *)self->_lockStateObservers removeObject:v5];

    v6 = self->_lockStateObserversLock;
    [(NSLock *)v6 unlock];
  }
}

- (void)_notifyObserversLockStateDidChange
{
  [(NSLock *)self->_lockStateObserversLock lock];
  uint64_t v3 = [(NSHashTable *)self->_lockStateObservers allObjects];
  [(NSLock *)self->_lockStateObserversLock unlock];
  BOOL v4 = [(VOTLockStateManager *)self isLocked];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      objc_super v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "lockStateDidChange:", v4, (void)v10);
        objc_super v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockStateObserversLock, 0);

  objc_storeStrong((id *)&self->_lockStateObservers, 0);
}

@end