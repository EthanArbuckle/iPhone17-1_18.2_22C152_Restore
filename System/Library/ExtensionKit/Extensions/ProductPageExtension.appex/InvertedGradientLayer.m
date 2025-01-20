@interface InvertedGradientLayer
- (_TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer)init;
- (_TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer)initWithCoder:(id)a3;
- (_TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer)initWithLayer:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation InvertedGradientLayer

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  sub_100708290(v4);
}

- (_TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer_lineHeight) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer_gradientStart) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer_gradientEnd) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer_textDirection) = (Class)3;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InvertedGradientLayer();
  return [(InvertedGradientLayer *)&v3 init];
}

- (_TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_10077CDF0();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer_lineHeight) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer_gradientStart) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer_gradientEnd) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer_textDirection) = (Class)3;
  sub_10000FA3C(v8, v8[3]);
  uint64_t v4 = sub_10077D210();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for InvertedGradientLayer();
  v5 = [(InvertedGradientLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v8);
  return v5;
}

- (_TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer)initWithCoder:(id)a3
{
  return (_TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer *)sub_1007088B4(a3);
}

@end