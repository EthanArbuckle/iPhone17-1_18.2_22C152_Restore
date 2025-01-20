@interface _LSDRebuildService
+ (BOOL)isEnabled;
+ (Class)clientClass;
+ (id)XPCInterface;
+ (unsigned)connectionType;
@end

@implementation _LSDRebuildService

+ (BOOL)isEnabled
{
  return [(id)__LSDefaultsGetSharedInstance() isInSyncBubble] ^ 1;
}

+ (unsigned)connectionType
{
  return 13;
}

+ (Class)clientClass
{
  return (Class)objc_opt_class();
}

+ (id)XPCInterface
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34___LSDRebuildService_XPCInterface__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a2;
  v4[5] = a1;
  if (+[_LSDRebuildService XPCInterface]::once != -1) {
    dispatch_once(&+[_LSDRebuildService XPCInterface]::once, v4);
  }
  v2 = (void *)+[_LSDRebuildService XPCInterface]::result;

  return v2;
}

@end