@interface RegisterCacheManagementAssetsService
@end

@implementation RegisterCacheManagementAssetsService

CacheDeleteManagedAssets *__cdecl __RegisterCacheManagementAssetsService_block_invoke_2(id a1, NSDictionary *a2, int a3, BOOL a4, BOOL a5)
{
  v8 = a2;
  v9 = _MergedGlobals_0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __RegisterCacheManagementAssetsService_block_invoke_3;
  v13[3] = &unk_10000C7F8;
  BOOL v16 = a4;
  v14 = v8;
  int v15 = a3;
  BOOL v17 = a5;
  v10 = v8;
  dispatch_sync(v9, v13);
  v11 = (CacheDeleteManagedAssets *)(id)qword_1000108D8;

  return v11;
}

void __RegisterCacheManagementAssetsService_block_invoke(id a1)
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.CacheDeleteManagedAssets", v3);
  v2 = (void *)_MergedGlobals_0;
  _MergedGlobals_0 = (uint64_t)v1;
}

@end