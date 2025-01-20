@interface BundleDetailComponent
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin21BundleDetailComponent)init;
- (_TtC20StoreDynamicUIPlugin21BundleDetailComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BundleDetailComponent

- (_TtC20StoreDynamicUIPlugin21BundleDetailComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin21BundleDetailComponent *)sub_30220();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_3055C();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  v5 = self;
  double v6 = sub_30AD4();
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC20StoreDynamicUIPlugin21BundleDetailComponent)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = *(void **)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin21BundleDetailComponent_content];
}

@end