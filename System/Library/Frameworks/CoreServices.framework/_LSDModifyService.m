@interface _LSDModifyService
+ (BOOL)isEnabled;
+ (Class)clientClass;
+ (id)XPCInterface;
+ (id)dispatchQueue;
+ (unsigned)connectionType;
@end

@implementation _LSDModifyService

+ (unsigned)connectionType
{
  return 1;
}

+ (Class)clientClass
{
  return (Class)objc_opt_class();
}

+ (id)XPCInterface
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33___LSDModifyService_XPCInterface__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a2;
  v4[5] = a1;
  if (+[_LSDModifyService XPCInterface]::once != -1) {
    dispatch_once(&+[_LSDModifyService XPCInterface]::once, v4);
  }
  v2 = (void *)+[_LSDModifyService XPCInterface]::result;

  return v2;
}

+ (BOOL)isEnabled
{
  return [(id)__LSDefaultsGetSharedInstance() isInSyncBubble] ^ 1;
}

+ (id)dispatchQueue
{
  if (+[_LSDModifyService dispatchQueue]::once != -1) {
    dispatch_once(&+[_LSDModifyService dispatchQueue]::once, &__block_literal_global_32);
  }
  v2 = (void *)+[_LSDModifyService dispatchQueue]::result;

  return v2;
}

@end