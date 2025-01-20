@interface UISDeviceContext
+ (id)uv_loadedInitialContext;
@end

@implementation UISDeviceContext

+ (id)uv_loadedInitialContext
{
  return +[UISDeviceContext _loadedInitialContext];
}

@end