@interface QRCodeItem
- (void)didTapDone;
@end

@implementation QRCodeItem

- (void)didTapDone
{
  v2 = *(void **)self->viewController;
  if (v2) {
    objc_msgSend(v2, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
}

@end