@interface ButtonComponent
- (BOOL)isHighlighted;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSString)accessibilityLabel;
- (_TtC19CoreDynamicUIPlugin15ButtonComponent)init;
- (_TtC19CoreDynamicUIPlugin15ButtonComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessibilityLabel:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation ButtonComponent

- (_TtC19CoreDynamicUIPlugin15ButtonComponent)initWithFrame:(CGRect)a3
{
  return (_TtC19CoreDynamicUIPlugin15ButtonComponent *)sub_1CBC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_1CD48();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_8F9A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3) {
    sub_8F9D0();
  }
  uint64_t v4 = self;
  sub_1CE1C();
}

- (BOOL)isHighlighted
{
  v2 = self;
  unsigned __int8 v3 = sub_1CE58();

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1CEE0(a3);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1CF70();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1D008();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  NSString v5 = self;
  sub_1D104();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC19CoreDynamicUIPlugin15ButtonComponent)init
{
}

- (void).cxx_destruct
{
  unsigned __int8 v3 = *(void **)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin15ButtonComponent_color];
}

@end