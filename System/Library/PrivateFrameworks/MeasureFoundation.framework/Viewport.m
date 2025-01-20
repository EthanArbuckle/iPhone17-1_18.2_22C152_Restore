@interface Viewport
- (_TtC17MeasureFoundation8Viewport)initWithCoder:(id)a3;
- (_TtC17MeasureFoundation8Viewport)initWithFrame:(CGRect)a3;
@end

@implementation Viewport

- (_TtC17MeasureFoundation8Viewport)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC17MeasureFoundation8Viewport_portView;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)_s17MeasureFoundation8ViewportC8portView33_7C22ACC4716B0FDE2A507783D80F08CBLLSo6UIViewCvpfi_0();

  result = (_TtC17MeasureFoundation8Viewport *)sub_22F224538();
  __break(1u);
  return result;
}

- (_TtC17MeasureFoundation8Viewport)initWithFrame:(CGRect)a3
{
  result = (_TtC17MeasureFoundation8Viewport *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end