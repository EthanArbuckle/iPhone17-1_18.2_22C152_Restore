@interface CKCNContactPickerViewController
- (BOOL)preserveModalPresentationStyle;
- (BOOL)shouldAutorotate;
- (BOOL)wantsWindowedPresentation;
- (void)setPreserveModalPresentationStyle:(BOOL)a3;
- (void)setWantsWindowedPresentation:(BOOL)a3;
@end

@implementation CKCNContactPickerViewController

- (BOOL)shouldAutorotate
{
  v2 = +[CKUIBehavior sharedBehaviors];
  char v3 = [v2 shouldSuppressRotationInNewCompose] ^ 1;

  return v3;
}

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