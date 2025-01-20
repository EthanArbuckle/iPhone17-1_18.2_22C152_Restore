@interface InvertedGradientLayer
- (_TtC22SubscribePageExtensionP33_01960AF73D0044DE1D4A999706BB79A321InvertedGradientLayer)init;
- (_TtC22SubscribePageExtensionP33_01960AF73D0044DE1D4A999706BB79A321InvertedGradientLayer)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtensionP33_01960AF73D0044DE1D4A999706BB79A321InvertedGradientLayer)initWithLayer:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation InvertedGradientLayer

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  sub_1001FBFF4(v4);
}

- (_TtC22SubscribePageExtensionP33_01960AF73D0044DE1D4A999706BB79A321InvertedGradientLayer)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_01960AF73D0044DE1D4A999706BB79A321InvertedGradientLayer_lineHeight) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_01960AF73D0044DE1D4A999706BB79A321InvertedGradientLayer_gradientStart) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_01960AF73D0044DE1D4A999706BB79A321InvertedGradientLayer_gradientEnd) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_01960AF73D0044DE1D4A999706BB79A321InvertedGradientLayer_textDirection) = (Class)3;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InvertedGradientLayer();
  return [(InvertedGradientLayer *)&v3 init];
}

- (_TtC22SubscribePageExtensionP33_01960AF73D0044DE1D4A999706BB79A321InvertedGradientLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_100768710();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_01960AF73D0044DE1D4A999706BB79A321InvertedGradientLayer_lineHeight) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_01960AF73D0044DE1D4A999706BB79A321InvertedGradientLayer_gradientStart) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_01960AF73D0044DE1D4A999706BB79A321InvertedGradientLayer_gradientEnd) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_01960AF73D0044DE1D4A999706BB79A321InvertedGradientLayer_textDirection) = (Class)3;
  sub_10000FE94(v8, v8[3]);
  uint64_t v4 = sub_100768B30();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for InvertedGradientLayer();
  v5 = [(InvertedGradientLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v8);
  return v5;
}

- (_TtC22SubscribePageExtensionP33_01960AF73D0044DE1D4A999706BB79A321InvertedGradientLayer)initWithCoder:(id)a3
{
  return (_TtC22SubscribePageExtensionP33_01960AF73D0044DE1D4A999706BB79A321InvertedGradientLayer *)sub_1001FC618(a3);
}

@end