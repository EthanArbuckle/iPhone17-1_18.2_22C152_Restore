@interface IMNotificationCenterEventListener
+ (id)eventListenerForNotificationName:(id)a3;
+ (id)eventListenerForNotificationName:(id)a3 object:(id)a4;
- (BOOL)isListening;
- (BOOL)isRegisteredForNotification;
- (NSString)notificationName;
- (NSString)registeredNotificationName;
- (id)notificationObject;
- (void)_notification:(id)a3;
- (void)dealloc;
- (void)registerForNotificationName:(id)a3;
- (void)registerForNotificationName:(id)a3 object:(id)a4;
- (void)willReset;
- (void)willStartListening;
- (void)willStopListening;
@end

@implementation IMNotificationCenterEventListener

- (BOOL)isRegisteredForNotification
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_registeredNotificationName != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)_notification:(id)a3
{
  id v4 = [a3 userInfo];
  [(IMEventListener *)self _didReceiveEvent:1 userInfo:v4 error:0];
}

- (void)registerForNotificationName:(id)a3
{
}

- (void)registerForNotificationName:(id)a3 object:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  [(IMEventListener *)v7 _reset];
  uint64_t v8 = [v10 copy];
  notificationName = v7->_notificationName;
  v7->_notificationName = (NSString *)v8;

  objc_storeWeak(&v7->_notificationObject, v6);
  objc_sync_exit(v7);
}

+ (id)eventListenerForNotificationName:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 registerForNotificationName:v3];

  return v4;
}

+ (id)eventListenerForNotificationName:(id)a3 object:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 registerForNotificationName:v6 object:v5];

  return v7;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)IMNotificationCenterEventListener;
  [(IMNotificationCenterEventListener *)&v4 dealloc];
}

- (BOOL)isListening
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_registeredNotificationName != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)willStartListening
{
  p_registeredNotificationName = &self->_registeredNotificationName;
  if (!self->_registeredNotificationName)
  {
    objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    notificationName = self->_notificationName;
    id WeakRetained = objc_loadWeakRetained(&self->_notificationObject);
    [v4 addObserver:self selector:sel__notification_ name:notificationName object:WeakRetained];

    id v7 = self->_notificationName;
    objc_storeStrong((id *)p_registeredNotificationName, v7);
  }
}

- (void)willStopListening
{
  if (self->_registeredNotificationName)
  {
    BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self];

    registeredNotificationName = self->_registeredNotificationName;
    self->_registeredNotificationName = 0;
  }
}

- (void)willReset
{
  self->_notificationName = 0;
  MEMORY[0x1F41817F8]();
}

- (NSString)registeredNotificationName
{
  return self->_registeredNotificationName;
}

- (NSString)notificationName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (id)notificationObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_notificationObject);

  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_notificationObject);
  objc_storeStrong((id *)&self->_notificationName, 0);

  objc_storeStrong((id *)&self->_registeredNotificationName, 0);
}

@end