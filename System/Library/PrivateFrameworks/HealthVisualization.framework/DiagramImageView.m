@interface DiagramImageView
- (CGRect)bounds;
- (CGRect)frame;
- (CGSize)intrinsicContentSize;
- (_TtC19HealthVisualization16DiagramImageView)initWithCoder:(id)a3;
- (_TtC19HealthVisualization16DiagramImageView)initWithFrame:(CGRect)a3;
- (_TtC19HealthVisualization16DiagramImageView)initWithImage:(id)a3;
- (_TtC19HealthVisualization16DiagramImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DiagramImageView

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1C29339CC(a3);
}

- (CGRect)bounds
{
  sub_1C293841C(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)frame
{
  sub_1C293841C(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4FB30D8];
  double v3 = *MEMORY[0x1E4FB30D8];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (void)setFrame:(CGRect)a3
{
}

- (_TtC19HealthVisualization16DiagramImageView)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthVisualization16DiagramImageView *)DiagramImageView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthVisualization16DiagramImageView)initWithCoder:(id)a3
{
  return (_TtC19HealthVisualization16DiagramImageView *)DiagramImageView.init(coder:)(a3);
}

- (_TtC19HealthVisualization16DiagramImageView)initWithImage:(id)a3
{
  id v3 = a3;
  CGSize result = (_TtC19HealthVisualization16DiagramImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19HealthVisualization16DiagramImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CGSize result = (_TtC19HealthVisualization16DiagramImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthVisualization16DiagramImageView_imageRenderer));
  sub_1C2989DC4((uint64_t)self + OBJC_IVAR____TtC19HealthVisualization16DiagramImageView_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthVisualization16DiagramImageView_lastUsedTransformer);
  sub_1C2944A80(v3);
}

@end