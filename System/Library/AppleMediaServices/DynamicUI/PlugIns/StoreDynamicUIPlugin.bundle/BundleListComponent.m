@interface BundleListComponent
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin19BundleListComponent)init;
- (_TtC20StoreDynamicUIPlugin19BundleListComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BundleListComponent

- (_TtC20StoreDynamicUIPlugin19BundleListComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin19BundleListComponent *)sub_3E128(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_3E23C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_3E8C0();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  v5 = self;
  sub_3EAE0();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC20StoreDynamicUIPlugin19BundleListComponent)init
{
}

- (void).cxx_destruct
{
}

@end