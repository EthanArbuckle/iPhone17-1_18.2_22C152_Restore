@interface VisualAreaArtworkComponent
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin26VisualAreaArtworkComponent)init;
- (_TtC20StoreDynamicUIPlugin26VisualAreaArtworkComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation VisualAreaArtworkComponent

- (_TtC20StoreDynamicUIPlugin26VisualAreaArtworkComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin26VisualAreaArtworkComponent *)sub_1075D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1076F0();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = self;
  double v10 = sub_1077EC(width, height, a4, a5);
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_107A68((SEL *)&selRef_prepareForReuse);
}

- (_TtC20StoreDynamicUIPlugin26VisualAreaArtworkComponent)init
{
}

- (void).cxx_destruct
{
}

@end