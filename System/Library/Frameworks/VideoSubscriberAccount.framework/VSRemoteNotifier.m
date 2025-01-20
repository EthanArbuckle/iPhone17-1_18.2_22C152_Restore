@interface VSRemoteNotifier
+ (id)_currentProcessIdentifier;
- (NSDistributedNotificationCenter)distributedNotificationCenter;
- (NSString)notificationObject;
- (NSString)remoteNotificationName;
- (VSRemoteNotifier)init;
- (VSRemoteNotifier)initWithNotificationName:(id)a3;
- (VSRemoteNotifierDelegate)delegate;
- (void)_didReceiveDistributedNotification:(id)a3;
- (void)dealloc;
- (void)postNotification;
- (void)postNotificationWithUserInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDistributedNotificationCenter:(id)a3;
- (void)setNotificationObject:(id)a3;
@end

@implementation VSRemoteNotifier

- (void)setDelegate:(id)a3
{
}

- (VSRemoteNotifier)initWithNotificationName:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSRemoteNotifier;
  v5 = [(VSRemoteNotifier *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() _currentProcessIdentifier];
    notificationObject = v5->_notificationObject;
    v5->_notificationObject = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28C40] defaultCenter];
    distributedNotificationCenter = v5->_distributedNotificationCenter;
    v5->_distributedNotificationCenter = (NSDistributedNotificationCenter *)v8;

    uint64_t v10 = [v4 copy];
    remoteNotificationName = v5->_remoteNotificationName;
    v5->_remoteNotificationName = (NSString *)v10;

    [(NSDistributedNotificationCenter *)v5->_distributedNotificationCenter addObserver:v5 selector:sel__didReceiveDistributedNotification_ name:v4 object:0];
  }

  return v5;
}

void __45__VSRemoteNotifier__currentProcessIdentifier__block_invoke()
{
  id v3 = [MEMORY[0x1E4F29128] UUID];
  v0 = [v3 UUIDString];
  uint64_t v1 = [v0 copy];
  v2 = (void *)_currentProcessIdentifier___vs_lazy_init_variable;
  _currentProcessIdentifier___vs_lazy_init_variable = v1;
}

+ (id)_currentProcessIdentifier
{
  if (_currentProcessIdentifier___vs_lazy_init_predicate != -1) {
    dispatch_once(&_currentProcessIdentifier___vs_lazy_init_predicate, &__block_literal_global_2);
  }
  v2 = (void *)_currentProcessIdentifier___vs_lazy_init_variable;

  return v2;
}

- (VSRemoteNotifier)init
{
  return 0;
}

- (void)dealloc
{
  [(NSDistributedNotificationCenter *)self->_distributedNotificationCenter removeObserver:self name:self->_remoteNotificationName object:0];
  v3.receiver = self;
  v3.super_class = (Class)VSRemoteNotifier;
  [(VSRemoteNotifier *)&v3 dealloc];
}

- (void)_didReceiveDistributedNotification:(id)a3
{
  id v9 = a3;
  id v4 = [(VSRemoteNotifier *)self notificationObject];
  v5 = [v9 object];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    v7 = [(VSRemoteNotifier *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [v9 userInfo];
      [v7 remoteNotifier:self didReceiveRemoteNotificationWithUserInfo:v8];
    }
  }
}

- (void)postNotification
{
}

- (void)postNotificationWithUserInfo:(id)a3
{
  id v4 = a3;
  id v7 = [(VSRemoteNotifier *)self distributedNotificationCenter];
  v5 = [(VSRemoteNotifier *)self remoteNotificationName];
  char v6 = [(VSRemoteNotifier *)self notificationObject];
  [v7 postNotificationName:v5 object:v6 userInfo:v4];
}

- (NSString)remoteNotificationName
{
  return self->_remoteNotificationName;
}

- (VSRemoteNotifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VSRemoteNotifierDelegate *)WeakRetained;
}

- (NSString)notificationObject
{
  return self->_notificationObject;
}

- (void)setNotificationObject:(id)a3
{
}

- (NSDistributedNotificationCenter)distributedNotificationCenter
{
  return self->_distributedNotificationCenter;
}

- (void)setDistributedNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distributedNotificationCenter, 0);
  objc_storeStrong((id *)&self->_notificationObject, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_remoteNotificationName, 0);
}

@end