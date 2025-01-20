@interface InAppPurchaseTiledLockupCollectionViewCell
- (_TtC18ASMessagesProvider42InAppPurchaseTiledLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)tintColorDidChange;
@end

@implementation InAppPurchaseTiledLockupCollectionViewCell

- (void)tintColorDidChange
{
  v2 = self;
  sub_2B1AFC();
}

- (_TtC18ASMessagesProvider42InAppPurchaseTiledLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[InAppPurchaseLockupCollectionViewCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

@end