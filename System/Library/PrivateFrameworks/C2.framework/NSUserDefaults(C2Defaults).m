@interface NSUserDefaults(C2Defaults)
+ (id)c2DefaultsDomain;
@end

@implementation NSUserDefaults(C2Defaults)

+ (id)c2DefaultsDomain
{
  if (c2DefaultsDomain_once != -1) {
    dispatch_once(&c2DefaultsDomain_once, &__block_literal_global);
  }
  v0 = (void *)c2DefaultsDomain_c2DefaultsDomain;
  return v0;
}

@end