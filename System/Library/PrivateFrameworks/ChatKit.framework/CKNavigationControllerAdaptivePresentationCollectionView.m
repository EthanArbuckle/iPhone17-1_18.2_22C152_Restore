@interface CKNavigationControllerAdaptivePresentationCollectionView
- (BOOL)preserveModalPresentationStyle;
- (BOOL)wantsWindowedPresentation;
- (void)setPreserveModalPresentationStyle:(BOOL)a3;
- (void)setWantsWindowedPresentation:(BOOL)a3;
@end

@implementation CKNavigationControllerAdaptivePresentationCollectionView

- (BOOL)wantsWindowedPresentation
{
  self->_wantsWindowedPresentation = 0;
  return 0;
}

- (BOOL)preserveModalPresentationStyle
{
  self->_preserveModalPresentationStyle = 0;
  return 0;
}

- (void)setWantsWindowedPresentation:(BOOL)a3
{
  self->_wantsWindowedPresentation = a3;
}

- (void)setPreserveModalPresentationStyle:(BOOL)a3
{
  self->_preserveModalPresentationStyle = a3;
}

@end