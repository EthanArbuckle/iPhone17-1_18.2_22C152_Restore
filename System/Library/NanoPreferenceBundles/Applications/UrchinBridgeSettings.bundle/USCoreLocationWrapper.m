@interface USCoreLocationWrapper
- (CLLocationManager)manager;
- (USCoreLocationWrapper)init;
- (void)setManager:(id)a3;
@end

@implementation USCoreLocationWrapper

- (USCoreLocationWrapper)init
{
  v5.receiver = self;
  v5.super_class = (Class)USCoreLocationWrapper;
  v2 = [(USCoreLocationWrapper *)&v5 init];
  if (v2)
  {
    id v3 = [objc_alloc((Class)CLLocationManager) initWithEffectiveBundleIdentifier:@"com.apple.boardwalk.watchapp" delegate:v2 onQueue:&_dispatch_main_q];
    [(USCoreLocationWrapper *)v2 setManager:v3];
  }
  return v2;
}

- (CLLocationManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end