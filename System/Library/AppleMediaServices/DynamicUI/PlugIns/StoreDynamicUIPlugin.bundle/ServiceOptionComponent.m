@interface ServiceOptionComponent
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin22ServiceOptionComponent)init;
- (_TtC20StoreDynamicUIPlugin22ServiceOptionComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ServiceOptionComponent

- (_TtC20StoreDynamicUIPlugin22ServiceOptionComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin22ServiceOptionComponent *)sub_C278C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_C3020();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_C314C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_C3470((uint64_t)a3);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v8 = self;
  double v9 = sub_C3D18(width, height, a4);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (_TtC20StoreDynamicUIPlugin22ServiceOptionComponent)init
{
}

- (void).cxx_destruct
{
  v3 = &self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_metrics];

  sub_C5568((uint64_t)v3);
}

@end