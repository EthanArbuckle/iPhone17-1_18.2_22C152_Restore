@interface _SCNUIApplicationObserver
+ (id)sharedInstance;
@end

@implementation _SCNUIApplicationObserver

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_110);
  }
  return (id)sharedInstance_sharedInstance;
}

@end