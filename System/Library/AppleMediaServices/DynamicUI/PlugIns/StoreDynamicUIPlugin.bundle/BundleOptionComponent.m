@interface BundleOptionComponent
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin21BundleOptionComponent)init;
- (_TtC20StoreDynamicUIPlugin21BundleOptionComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BundleOptionComponent

- (_TtC20StoreDynamicUIPlugin21BundleOptionComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin21BundleOptionComponent *)sub_40E8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_415F8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_41778();
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_41B00();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_41BB0((uint64_t)a3);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v8 = self;
  double v9 = sub_42620(width, height, a4);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (_TtC20StoreDynamicUIPlugin21BundleOptionComponent)init
{
}

- (void).cxx_destruct
{
  sub_440A4((uint64_t)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin21BundleOptionComponent_metrics]);
  swift_bridgeObjectRelease();
  v3 = *(void **)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin21BundleOptionComponent_servicesGrid];
}

@end