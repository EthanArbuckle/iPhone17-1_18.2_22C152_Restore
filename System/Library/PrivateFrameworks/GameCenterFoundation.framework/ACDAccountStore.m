@interface ACDAccountStore
@end

@implementation ACDAccountStore

void __72__ACDAccountStore_GKNillableShims__gkSaveAccount_verify_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = objc_alloc_init(GKSaveAccountResult);
  [(GKSaveAccountResult *)v7 setError:v5];

  [(GKSaveAccountResult *)v7 setObjectID:v6];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end