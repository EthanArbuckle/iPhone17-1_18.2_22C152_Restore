@interface _LSDIconService
+ (Class)clientClass;
+ (id)XPCInterface;
+ (unsigned)connectionType;
@end

@implementation _LSDIconService

+ (unsigned)connectionType
{
  return 10;
}

+ (Class)clientClass
{
  return (Class)objc_opt_class();
}

+ (id)XPCInterface
{
  if (XPCInterface_onceToken != -1) {
    dispatch_once(&XPCInterface_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)XPCInterface_interface;

  return v2;
}

@end