@interface _LSDReadService
+ (BOOL)isEnabled;
+ (Class)clientClass;
+ (id)XPCInterface;
+ (unsigned)connectionType;
@end

@implementation _LSDReadService

+ (unsigned)connectionType
{
  return 0;
}

+ (id)XPCInterface
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31___LSDReadService_XPCInterface__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a2;
  v4[5] = a1;
  if (+[_LSDReadService XPCInterface]::once != -1) {
    dispatch_once(&+[_LSDReadService XPCInterface]::once, v4);
  }
  v2 = (void *)+[_LSDReadService XPCInterface]::result;

  return v2;
}

+ (Class)clientClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isEnabled
{
  return 1;
}

@end