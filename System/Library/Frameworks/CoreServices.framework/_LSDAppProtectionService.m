@interface _LSDAppProtectionService
+ (Class)clientClass;
+ (id)XPCInterface;
+ (unsigned)connectionType;
+ (void)getHiddenApplicationsWithCompletion:(id)a3;
+ (void)getLockedApplicationsWithCompletion:(id)a3;
+ (void)setHiddenApplications:(id)a3 completion:(id)a4;
+ (void)setLockedApplications:(id)a3 completion:(id)a4;
@end

@implementation _LSDAppProtectionService

+ (void)setHiddenApplications:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)a1, 0);
  [v7 setHiddenApplications:v8 completion:v6];
}

+ (void)getHiddenApplicationsWithCompletion:(id)a3
{
  id v5 = a3;
  v4 = +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)a1, 0);
  [v4 getHiddenApplicationsWithCompletion:v5];
}

+ (void)setLockedApplications:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)a1, 0);
  [v7 setLockedApplications:v8 completion:v6];
}

+ (void)getLockedApplicationsWithCompletion:(id)a3
{
  id v5 = a3;
  v4 = +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)a1, 0);
  [v4 getLockedApplicationsWithCompletion:v5];
}

+ (unsigned)connectionType
{
  return 14;
}

+ (Class)clientClass
{
  return (Class)objc_opt_class();
}

+ (id)XPCInterface
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40___LSDAppProtectionService_XPCInterface__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a2;
  v4[5] = a1;
  if (+[_LSDAppProtectionService XPCInterface]::once != -1) {
    dispatch_once(&+[_LSDAppProtectionService XPCInterface]::once, v4);
  }
  v2 = (void *)+[_LSDAppProtectionService XPCInterface]::result;

  return v2;
}

@end