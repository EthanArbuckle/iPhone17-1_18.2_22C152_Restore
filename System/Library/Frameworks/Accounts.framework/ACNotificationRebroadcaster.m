@interface ACNotificationRebroadcaster
+ (ACNotificationRebroadcaster)sharedRebroadcaster;
- (ACNotificationRebroadcaster)init;
- (void)_accountStoreDidChange:(id)a3;
- (void)_beginObservingAccountStoreDidChangeNotifications;
- (void)_endObservingAccountStoreDidChangeNotifications;
- (void)dealloc;
@end

@implementation ACNotificationRebroadcaster

uint64_t __50__ACNotificationRebroadcaster_sharedRebroadcaster__block_invoke()
{
  sharedRebroadcaster_sharedRebroadcaster = objc_alloc_init(ACNotificationRebroadcaster);

  return MEMORY[0x1F41817F8]();
}

- (ACNotificationRebroadcaster)init
{
  v5.receiver = self;
  v5.super_class = (Class)ACNotificationRebroadcaster;
  v2 = [(ACNotificationRebroadcaster *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ACNotificationRebroadcaster *)v2 _beginObservingAccountStoreDidChangeNotifications];
  }
  return v3;
}

- (void)_beginObservingAccountStoreDidChangeNotifications
{
  v3 = (void *)MEMORY[0x1A626D840](self, a2);
  v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 addObserver:self selector:sel__accountStoreDidChange_ name:@"ACDAccountStoreDidChangeNotification" object:0 suspensionBehavior:4];
}

+ (ACNotificationRebroadcaster)sharedRebroadcaster
{
  if (sharedRebroadcaster_onceToken != -1) {
    dispatch_once(&sharedRebroadcaster_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedRebroadcaster_sharedRebroadcaster;

  return (ACNotificationRebroadcaster *)v2;
}

- (void)dealloc
{
  [(ACNotificationRebroadcaster *)self _endObservingAccountStoreDidChangeNotifications];
  v3.receiver = self;
  v3.super_class = (Class)ACNotificationRebroadcaster;
  [(ACNotificationRebroadcaster *)&v3 dealloc];
}

- (void)_accountStoreDidChange:(id)a3
{
  id v7 = a3;
  v4 = (void *)MEMORY[0x1A626D840]();
  objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6 = [v7 userInfo];
  [v5 postNotificationName:@"ACDAccountStoreDidChangeNotification" object:self userInfo:v6];
}

- (void)_endObservingAccountStoreDidChangeNotifications
{
  objc_super v3 = (void *)MEMORY[0x1A626D840](self, a2);
  v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 removeObserver:self name:@"ACDAccountStoreDidChangeNotification" object:0];
}

@end