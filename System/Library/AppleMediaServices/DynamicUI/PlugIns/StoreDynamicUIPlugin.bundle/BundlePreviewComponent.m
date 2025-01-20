@interface BundlePreviewComponent
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin22BundlePreviewComponent)init;
- (_TtC20StoreDynamicUIPlugin22BundlePreviewComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BundlePreviewComponent

- (_TtC20StoreDynamicUIPlugin22BundlePreviewComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin22BundlePreviewComponent *)sub_49F30(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_4A26C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_4A3AC();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v8 = self;
  double v9 = sub_4AB3C(width, height, a4);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (_TtC20StoreDynamicUIPlugin22BundlePreviewComponent)init
{
}

- (void).cxx_destruct
{
  sub_4BD24((uint64_t)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin22BundlePreviewComponent_metrics]);
  swift_bridgeObjectRelease();
  v3 = *(void **)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin22BundlePreviewComponent_servicesGrid];
}

@end