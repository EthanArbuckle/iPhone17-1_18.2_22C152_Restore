@interface UINavigationItem(DOCExtensions)
- (id)doc_pendingSearchControllerUpdateRequest;
- (void)doc_safeSetSearchController:()DOCExtensions;
- (void)doc_setPendingSearchControllerUpdateRequest:()DOCExtensions;
@end

@implementation UINavigationItem(DOCExtensions)

- (void)doc_setPendingSearchControllerUpdateRequest:()DOCExtensions
{
}

- (id)doc_pendingSearchControllerUpdateRequest
{
  return objc_getAssociatedObject(a1, &doc_pendingSearchControllerUpdateRequestKey);
}

- (void)doc_safeSetSearchController:()DOCExtensions
{
  id v4 = a3;
  v5 = [a1 searchController];
  v6 = [v5 transitionCoordinator];
  if (v6)
  {
    v7 = objc_msgSend(a1, "doc_pendingSearchControllerUpdateRequest");

    v8 = objc_opt_new();
    [v8 setSearchController:v4];

    objc_msgSend(a1, "doc_setPendingSearchControllerUpdateRequest:", v8);
    if (!v7)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __63__UINavigationItem_DOCExtensions__doc_safeSetSearchController___block_invoke;
      v9[3] = &unk_2648FB4F0;
      v9[4] = a1;
      [v6 animateAlongsideTransition:0 completion:v9];
    }
  }
  else
  {
    objc_msgSend(a1, "doc_setPendingSearchControllerUpdateRequest:", 0);
    [a1 setSearchController:v4];
    v8 = v4;
  }
}

@end