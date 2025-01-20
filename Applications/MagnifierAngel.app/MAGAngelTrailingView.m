@interface MAGAngelTrailingView
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (_TtC14MagnifierAngel20MAGAngelTrailingView)init;
- (_TtC14MagnifierAngel20MAGAngelTrailingView)initWithCoder:(id)a3;
- (_TtC14MagnifierAngel20MAGAngelTrailingView)initWithFrame:(CGRect)a3;
@end

@implementation MAGAngelTrailingView

- (_TtC14MagnifierAngel20MAGAngelTrailingView)init
{
  return (_TtC14MagnifierAngel20MAGAngelTrailingView *)sub_100025B84();
}

- (_TtC14MagnifierAngel20MAGAngelTrailingView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC14MagnifierAngel20MAGAngelTrailingView_compressedElementSize;
  *(double *)v5 = MAGAngelContentState.hash(into:)(19.0, 19.0);
  *((void *)v5 + 1) = v6;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MAGAngelTrailingView();
  id v7 = a3;
  v8 = [(MAGAngelTrailingView *)&v10 initWithCoder:v7];

  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  double v4 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC14MagnifierAngel20MAGAngelTrailingView_compressedElementSize);
  double v5 = *(double *)&self->compressedElementSize[OBJC_IVAR____TtC14MagnifierAngel20MAGAngelTrailingView_compressedElementSize];
  result.height = v5;
  result.width = v4;
  return result;
}

- (_TtC14MagnifierAngel20MAGAngelTrailingView)initWithFrame:(CGRect)a3
{
}

@end