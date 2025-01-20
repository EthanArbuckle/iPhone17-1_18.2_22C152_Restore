@interface InAppBlendedBackgroundView
- (_TtC20ProductPageExtensionP33_AF8B3EA06286D4AB02CD0CCCFC27CE8F26InAppBlendedBackgroundView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtensionP33_AF8B3EA06286D4AB02CD0CCCFC27CE8F26InAppBlendedBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InAppBlendedBackgroundView

- (_TtC20ProductPageExtensionP33_AF8B3EA06286D4AB02CD0CCCFC27CE8F26InAppBlendedBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtensionP33_AF8B3EA06286D4AB02CD0CCCFC27CE8F26InAppBlendedBackgroundView *)sub_1005B4630(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtensionP33_AF8B3EA06286D4AB02CD0CCCFC27CE8F26InAppBlendedBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005B5054();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005B4BD0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_AF8B3EA06286D4AB02CD0CCCFC27CE8F26InAppBlendedBackgroundView_topLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_AF8B3EA06286D4AB02CD0CCCFC27CE8F26InAppBlendedBackgroundView_bottomLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_AF8B3EA06286D4AB02CD0CCCFC27CE8F26InAppBlendedBackgroundView_blurView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtensionP33_AF8B3EA06286D4AB02CD0CCCFC27CE8F26InAppBlendedBackgroundView_shadowView);
}

@end