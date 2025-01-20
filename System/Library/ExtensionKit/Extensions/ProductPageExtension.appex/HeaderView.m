@interface HeaderView
- (_TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036110HeaderView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036110HeaderView)initWithReuseIdentifier:(id)a3;
- (_TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView)init;
- (_TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HeaderView

- (void)layoutSubviews
{
  v2 = self;
  sub_100558690();
}

- (_TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036110HeaderView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    sub_10077BCB0();
    NSString v4 = sub_10077BC80();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HeaderView();
  v5 = [(HeaderView *)&v7 initWithReuseIdentifier:v4];

  return v5;
}

- (_TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036110HeaderView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HeaderView();
  return [(HeaderView *)&v5 initWithCoder:a3];
}

- (_TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView)init
{
  return (_TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView *)sub_1005584F0();
}

- (_TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10055A548();
}

- (_TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView_mediaView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView_gradientBlurView);
}

@end