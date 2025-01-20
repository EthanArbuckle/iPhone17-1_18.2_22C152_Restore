@interface FeaturesDaemon
+ (id)sharedInstance;
- (DaemonController)controller;
- (FeaturesDaemon)init;
- (void)setController:(id)a3;
- (void)start;
@end

@implementation FeaturesDaemon

+ (id)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1) {
    dispatch_once(sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __32__FeaturesDaemon_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (FeaturesDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)FeaturesDaemon;
  v2 = [(FeaturesDaemon *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    controller = v2->_controller;
    v2->_controller = (DaemonController *)v3;
  }
  return v2;
}

- (void)start
{
  id v2 = [(FeaturesDaemon *)self controller];
  [v2 start];
}

- (DaemonController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end