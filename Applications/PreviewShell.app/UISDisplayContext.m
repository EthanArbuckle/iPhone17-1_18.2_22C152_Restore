@interface UISDisplayContext
+ (id)uv_loadedInitialContext;
@end

@implementation UISDisplayContext

+ (id)uv_loadedInitialContext
{
  return +[UISDisplayContext _loadedInitialContext];
}

@end