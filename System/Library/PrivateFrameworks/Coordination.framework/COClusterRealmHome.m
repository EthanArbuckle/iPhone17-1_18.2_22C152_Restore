@interface COClusterRealmHome
@end

@implementation COClusterRealmHome

void __32___COClusterRealmHome_activate___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 specificHomeUUID];
  v4 = [v3 UUIDString];
  [v2 _setIdentifierLocked:v4];

  v5 = *(void **)(a1 + 32);
  id v6 = (id)[*(id *)(a1 + 40) copy];
  [v5 _setUpdateHandlerLocked:v6];
}

@end