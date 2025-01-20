@interface OfferPlatterComponent
- (BOOL)isHighlighted;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin21OfferPlatterComponent)init;
- (_TtC20StoreDynamicUIPlugin21OfferPlatterComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation OfferPlatterComponent

- (_TtC20StoreDynamicUIPlugin21OfferPlatterComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin21OfferPlatterComponent *)sub_AC9D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isHighlighted
{
  v2 = self;
  unsigned __int8 v3 = sub_ACF34();

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_ACFBC(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_AD33C((uint64_t)a3);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_AD5BC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_AD6CC();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width = a3.width;
  v7 = self;
  double v9 = sub_AE420(width, v8, a4);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.double width = v12;
  return result;
}

- (_TtC20StoreDynamicUIPlugin21OfferPlatterComponent)init
{
}

- (void).cxx_destruct
{
  sub_AFBA8((uint64_t)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_metrics]);
  unsigned __int8 v3 = *(void **)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_separatorView];
}

@end