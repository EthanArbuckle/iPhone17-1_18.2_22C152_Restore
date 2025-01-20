@interface BorderView
- (BOOL)clipsToBounds;
- (UIColor)backgroundColor;
- (_TtC19AppStoreKitInternal10BorderView)initWithCoder:(id)a3;
- (_TtC19AppStoreKitInternal10BorderView)initWithFrame:(CGRect)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setClipsToBounds:(BOOL)a3;
@end

@implementation BorderView

- (_TtC19AppStoreKitInternal10BorderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v7 = -[BorderView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  [(BorderView *)v7 setUserInteractionEnabled:0];
  return v7;
}

- (_TtC19AppStoreKitInternal10BorderView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(BorderView *)&v5 initWithCoder:a3];
}

- (UIColor)backgroundColor
{
  id v2 = objc_msgSend(self, sel_clearColor);
  return (UIColor *)v2;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  BorderView.backgroundColor.setter(a3);
}

- (BOOL)clipsToBounds
{
  return 0;
}

- (void)setClipsToBounds:(BOOL)a3
{
  v3 = self;
  _s19AppStoreKitInternal10BorderViewC13clipsToBoundsSbvs_0();
}

@end