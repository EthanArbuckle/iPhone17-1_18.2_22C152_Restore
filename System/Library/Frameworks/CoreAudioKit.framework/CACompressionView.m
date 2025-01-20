@interface CACompressionView
- (NSArray)accessibilityElements;
- (_TtC12CoreAudioKit17CACompressionView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit17CACompressionView)initWithFrame:(CGRect)a3;
- (void)tintColorDidChange;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CACompressionView

- (NSArray)accessibilityElements
{
  v2 = self;
  sub_21E582AE0();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_21E5B6688();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (void)tintColorDidChange
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_curveFill);
  uint64_t v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_tintColor);
  id v7 = objc_msgSend(v6, sel_colorWithAlphaComponent_, 0.5);

  id v8 = objc_msgSend(v7, sel_CGColor);
  objc_msgSend(v3, sel_setFillColor_, v8);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (_TtC12CoreAudioKit17CACompressionView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit17CACompressionView *)sub_21E587C3C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit17CACompressionView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit17CACompressionView *)sub_21E587E24(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_diagonalLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_curveFill));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_compressionLine));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_expansionFill));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_compressionFill));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_compressionTriangle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_accessibilityFormatter));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_activeControl));
  swift_bridgeObjectRelease();
  sub_21E54AF98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_dataSource, &qword_267D384A8);
}

@end