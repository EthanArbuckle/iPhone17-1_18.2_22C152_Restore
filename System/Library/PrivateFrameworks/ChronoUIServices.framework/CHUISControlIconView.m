@interface CHUISControlIconView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CHUISControlIconView)initWithCoder:(id)a3;
- (CHUISControlIconView)initWithFrame:(CGRect)a3;
- (UIFont)font;
- (unint64_t)style;
- (void)layoutSubviews;
- (void)setFont:(id)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation CHUISControlIconView

- (UIFont)font
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHUISControlIconView_font);
  swift_beginAccess();
  return (UIFont *)*v2;
}

- (void)setFont:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1BC422680(a3);
}

- (unint64_t)style
{
  uint64_t v3 = type metadata accessor for ControlIconView(0);
  MEMORY[0x1F4188790](v3);
  v5 = v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  id v6 = (char *)self + OBJC_IVAR___CHUISControlIconView__controlIconView;
  swift_beginAccess();
  sub_1BC42285C((uint64_t)v6, (uint64_t)v11);
  v7 = self;
  swift_dynamicCast();
  unint64_t v8 = *(void *)&v5[*(int *)(v3 + 20)];
  sub_1BC4228B8((uint64_t)v5, type metadata accessor for ControlIconView);

  return v8;
}

- (void)setStyle:(unint64_t)a3
{
  uint64_t v5 = type metadata accessor for ControlIconView(0);
  MEMORY[0x1F4188790](v5);
  v7 = v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  unint64_t v8 = (char *)self + OBJC_IVAR___CHUISControlIconView__controlIconView;
  swift_beginAccess();
  sub_1BC42285C((uint64_t)v8, (uint64_t)v11);
  v9 = self;
  swift_dynamicCast();
  *(void *)&v7[*(int *)(v5 + 20)] = a3;
  sub_1BC421B60((uint64_t)v7);
}

- (CHUISControlIconView)initWithFrame:(CGRect)a3
{
  return (CHUISControlIconView *)CHUISControlIconView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CHUISControlIconView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHUISControlIconView_font) = 0;
  id v4 = a3;

  result = (CHUISControlIconView *)sub_1BC488E98();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CHUISControlIconView;
  v2 = self;
  [(CHUISControlIconView *)&v4 layoutSubviews];
  id v3 = *(id *)((char *)&v2->super.super.super.isa + OBJC_IVAR___CHUISControlIconView__hostingView);
  [(CHUISControlIconView *)v2 bounds];
  objc_msgSend(v3, sel_setFrame_);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHUISControlIconView__hostingView), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___CHUISControlIconView__controlIconView);
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHUISControlIconView__hostingView);
}

@end