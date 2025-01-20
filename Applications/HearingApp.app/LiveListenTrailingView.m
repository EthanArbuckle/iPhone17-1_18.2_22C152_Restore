@interface LiveListenTrailingView
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (_TtC10HearingApp22LiveListenTrailingView)init;
- (_TtC10HearingApp22LiveListenTrailingView)initWithCoder:(id)a3;
- (_TtC10HearingApp22LiveListenTrailingView)initWithFrame:(CGRect)a3;
@end

@implementation LiveListenTrailingView

- (_TtC10HearingApp22LiveListenTrailingView)init
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10HearingApp22LiveListenTrailingView_compressedWidth) = (Class)0x4043000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10HearingApp22LiveListenTrailingView_compressedHeight) = (Class)0x4010000000000000;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LiveListenTrailingView();
  return -[LiveListenTrailingView initWithFrame:](&v3, "initWithFrame:", 0.0, 0.0, 38.0, 4.0);
}

- (_TtC10HearingApp22LiveListenTrailingView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10HearingApp22LiveListenTrailingView_compressedWidth) = (Class)0x4043000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10HearingApp22LiveListenTrailingView_compressedHeight) = (Class)0x4010000000000000;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LiveListenTrailingView();
  return [(LiveListenTrailingView *)&v5 initWithCoder:a3];
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  double v4 = 19.0;
  double v5 = 4.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (_TtC10HearingApp22LiveListenTrailingView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC10HearingApp22LiveListenTrailingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end