@interface HighlightAnimatingMenuButton
- (_TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton)initWithCoder:(id)a3;
- (_TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton)initWithFrame:(CGRect)a3;
- (void)setNeedsLayout;
@end

@implementation HighlightAnimatingMenuButton

- (void)setNeedsLayout
{
  v2 = self;
  sub_2473DCDE4();
}

- (_TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_isAnimating) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_hasPendingLayout) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousState) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousConfiguration;
  uint64_t v9 = sub_24740E1C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = (_OWORD *)((char *)self
                 + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousBounds);
  _OWORD *v10 = 0u;
  v10[1] = 0u;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_commitTracker) = 0;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for HighlightAnimatingMenuButton();
  return -[MenuButton initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (_TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton)initWithCoder:(id)a3
{
  return (_TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton *)sub_2473DD978(a3);
}

- (void).cxx_destruct
{
  sub_2473DB3A8((uint64_t)self + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousConfiguration);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_commitTracker);
}

@end