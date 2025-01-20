@interface BundleTileComponent
- (BOOL)isHighlighted;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin19BundleTileComponent)init;
- (_TtC20StoreDynamicUIPlugin19BundleTileComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BundleTileComponent

- (_TtC20StoreDynamicUIPlugin19BundleTileComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin19BundleTileComponent *)sub_4FF38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isHighlighted
{
  v2 = self;
  unsigned __int8 v3 = sub_50260();

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_502E8(a3);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_50344();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_50454();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  v5 = self;
  sub_50848();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_50B3C((uint64_t)a3);
}

- (_TtC20StoreDynamicUIPlugin19BundleTileComponent)init
{
}

- (void).cxx_destruct
{
  unsigned __int8 v3 = &self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin19BundleTileComponent_metrics];

  sub_510E8((uint64_t)v3);
}

@end