@interface UIDocumentPickerContainerViewController
@end

@implementation UIDocumentPickerContainerViewController

void __93___UIDocumentPickerContainerViewController__startSearchWithQueryString_becomeFirstResponder___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setText:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) delegate];
  v2 = *(void **)(a1 + 32);
  v3 = [v2 text];
  [v4 searchBar:v2 textDidChange:v3];
}

uint64_t __76___UIDocumentPickerContainerViewController_setChildViewController_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didMoveToParentViewController:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) endAppearanceTransition];
  [*(id *)(a1 + 48) removeFromParentViewController];
  v2 = *(void **)(a1 + 48);

  return [v2 didMoveToParentViewController:0];
}

@end