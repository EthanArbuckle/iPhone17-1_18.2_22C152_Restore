@interface _UIAccessibilityWeakObjectHolder_NTKPageScrollViewControllerAccessibility
- (NTKPageScrollViewControllerAccessibility)referencedScrollViewController;
- (void)setReferencedScrollViewController:(id)a3;
@end

@implementation _UIAccessibilityWeakObjectHolder_NTKPageScrollViewControllerAccessibility

- (NTKPageScrollViewControllerAccessibility)referencedScrollViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_referencedScrollViewController);

  return (NTKPageScrollViewControllerAccessibility *)WeakRetained;
}

- (void)setReferencedScrollViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end