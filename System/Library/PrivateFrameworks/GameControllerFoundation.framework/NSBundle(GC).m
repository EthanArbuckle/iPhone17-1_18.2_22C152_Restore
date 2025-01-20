@interface NSBundle(GC)
+ (id)GameControllerFoundationBundle;
+ (id)GameControllerFrameworkBundle;
+ (id)gc_bundleForExecutableAtPath:()GC;
+ (id)gc_bundleForExecutableAtURL:()GC;
@end

@implementation NSBundle(GC)

+ (id)GameControllerFoundationBundle
{
  if (GameControllerFoundationBundle_onceToken != -1) {
    dispatch_once(&GameControllerFoundationBundle_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)GameControllerFoundationBundle_Bundle;

  return v0;
}

+ (id)GameControllerFrameworkBundle
{
  if (GameControllerFrameworkBundle_onceToken != -1) {
    dispatch_once(&GameControllerFrameworkBundle_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)GameControllerFrameworkBundle_Bundle;

  return v0;
}

+ (id)gc_bundleForExecutableAtURL:()GC
{
  v0 = (void *)_CFBundleCopyBundleURLForExecutableURL();
  if (v0)
  {
    v1 = +[NSBundle bundleWithURL:v0];
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

+ (id)gc_bundleForExecutableAtPath:()GC
{
  v2 = +[NSURL fileURLWithPath:](&off_26BEEE4B0, "fileURLWithPath:");
  v3 = objc_msgSend(a1, "gc_bundleForExecutableAtURL:", v2);

  return v3;
}

@end