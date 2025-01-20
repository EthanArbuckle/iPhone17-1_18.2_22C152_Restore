@interface ProductPresenter
- (void)restrictionsDidChange:(id)a3;
@end

@implementation ProductPresenter

- (void)restrictionsDidChange:(id)a3
{
  id v3 = a3;
  swift_retain();
  ProductPresenter.reloadTopLockup()();

  swift_release();
}

@end