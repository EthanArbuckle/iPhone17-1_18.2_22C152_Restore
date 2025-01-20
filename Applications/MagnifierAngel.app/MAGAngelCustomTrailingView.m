@interface MAGAngelCustomTrailingView
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (_TtC14MagnifierAngel26MAGAngelCustomTrailingView)init;
- (_TtC14MagnifierAngel26MAGAngelCustomTrailingView)initWithCoder:(id)a3;
- (_TtC14MagnifierAngel26MAGAngelCustomTrailingView)initWithFrame:(CGRect)a3;
@end

@implementation MAGAngelCustomTrailingView

- (_TtC14MagnifierAngel26MAGAngelCustomTrailingView)init
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14MagnifierAngel26MAGAngelCustomTrailingView_compressedWidth) = (Class)0x4043000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14MagnifierAngel26MAGAngelCustomTrailingView_compressedHeight) = (Class)0x4010000000000000;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MAGAngelCustomTrailingView();
  return -[MAGAngelCustomTrailingView initWithFrame:](&v3, "initWithFrame:", 0.0, 0.0, 38.0, 4.0);
}

- (_TtC14MagnifierAngel26MAGAngelCustomTrailingView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14MagnifierAngel26MAGAngelCustomTrailingView_compressedWidth) = (Class)0x4043000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14MagnifierAngel26MAGAngelCustomTrailingView_compressedHeight) = (Class)0x4010000000000000;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MAGAngelCustomTrailingView();
  return [(MAGAngelCustomTrailingView *)&v5 initWithCoder:a3];
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  double v4 = 19.0;
  double v5 = 4.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (_TtC14MagnifierAngel26MAGAngelCustomTrailingView)initWithFrame:(CGRect)a3
{
}

@end