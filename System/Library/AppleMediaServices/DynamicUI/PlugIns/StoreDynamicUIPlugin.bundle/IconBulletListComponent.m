@interface IconBulletListComponent
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin23IconBulletListComponent)init;
- (_TtC20StoreDynamicUIPlugin23IconBulletListComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation IconBulletListComponent

- (_TtC20StoreDynamicUIPlugin23IconBulletListComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin23IconBulletListComponent *)sub_99D88(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_9A08C();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  v5 = self;
  sub_9A224();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_9A4A4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_9A5B4((uint64_t)a3);
}

- (_TtC20StoreDynamicUIPlugin23IconBulletListComponent)init
{
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end