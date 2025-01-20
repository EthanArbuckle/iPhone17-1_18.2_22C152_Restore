@interface UIDocumentListController
@end

@implementation UIDocumentListController

id __59___UIDocumentListController_listControllerHierarchyForURL___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(objc_class **)(a1 + 32);
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithURL:v3];

  return v4;
}

@end