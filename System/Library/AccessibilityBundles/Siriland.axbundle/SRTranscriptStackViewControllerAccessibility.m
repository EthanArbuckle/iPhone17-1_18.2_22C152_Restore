@interface SRTranscriptStackViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_enumerateSortedParentItemIndexPathsForItemIndexPaths:(id)a3 usingBlock:(id)a4;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
@end

@implementation SRTranscriptStackViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SRTranscriptStackViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (void)_enumerateSortedParentItemIndexPathsForItemIndexPaths:(id)a3 usingBlock:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SRTranscriptStackViewControllerAccessibility;
  [(SRTranscriptStackViewControllerAccessibility *)&v4 _enumerateSortedParentItemIndexPathsForItemIndexPaths:a3 usingBlock:a4];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __113__SRTranscriptStackViewControllerAccessibility__enumerateSortedParentItemIndexPathsForItemIndexPaths_usingBlock___block_invoke()
{
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  v5.receiver = self;
  v5.super_class = (Class)SRTranscriptStackViewControllerAccessibility;
  [(SRTranscriptStackViewControllerAccessibility *)&v5 navigationController:a3 didShowViewController:a4 animated:a5];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __100__SRTranscriptStackViewControllerAccessibility_navigationController_didShowViewController_animated___block_invoke()
{
}

@end