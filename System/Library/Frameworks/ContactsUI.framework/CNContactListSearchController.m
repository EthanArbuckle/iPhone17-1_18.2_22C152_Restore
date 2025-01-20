@interface CNContactListSearchController
- (id)searchBar;
@end

@implementation CNContactListSearchController

id __42__CNContactListSearchController_searchBar__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1320);
  if (!v2)
  {
    v3 = objc_alloc_init(CNContactListSearchBar);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 1320);
    *(void *)(v4 + 1320) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 1320);
  }

  return v2;
}

- (id)searchBar
{
  v2 = cn_objectResultWithObjectLock();

  return v2;
}

- (void).cxx_destruct
{
}

@end