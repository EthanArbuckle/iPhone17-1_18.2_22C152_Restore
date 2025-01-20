@interface UINavigationItem
@end

@implementation UINavigationItem

void __63__UINavigationItem_DOCExtensions__doc_safeSetSearchController___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "doc_pendingSearchControllerUpdateRequest");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "doc_setPendingSearchControllerUpdateRequest:", 0);
    v2 = *(void **)(a1 + 32);
    v3 = [v4 searchController];
    [v2 setSearchController:v3];
  }
}

@end