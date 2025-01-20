@interface InvertedGradientLayer
- (_TtC18ASMessagesProviderP33_641AD3B9CC6D2F83FAB80978F020883021InvertedGradientLayer)init;
- (_TtC18ASMessagesProviderP33_641AD3B9CC6D2F83FAB80978F020883021InvertedGradientLayer)initWithCoder:(id)a3;
- (_TtC18ASMessagesProviderP33_641AD3B9CC6D2F83FAB80978F020883021InvertedGradientLayer)initWithLayer:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation InvertedGradientLayer

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  sub_1DCE50(v4);
}

- (_TtC18ASMessagesProviderP33_641AD3B9CC6D2F83FAB80978F020883021InvertedGradientLayer)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProviderP33_641AD3B9CC6D2F83FAB80978F020883021InvertedGradientLayer_lineHeight) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProviderP33_641AD3B9CC6D2F83FAB80978F020883021InvertedGradientLayer_gradientStart) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProviderP33_641AD3B9CC6D2F83FAB80978F020883021InvertedGradientLayer_gradientEnd) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProviderP33_641AD3B9CC6D2F83FAB80978F020883021InvertedGradientLayer_textDirection) = (Class)(&def_270DE0 + 3);
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InvertedGradientLayer();
  return [(InvertedGradientLayer *)&v3 init];
}

- (_TtC18ASMessagesProviderP33_641AD3B9CC6D2F83FAB80978F020883021InvertedGradientLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_77E7F0();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProviderP33_641AD3B9CC6D2F83FAB80978F020883021InvertedGradientLayer_lineHeight) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProviderP33_641AD3B9CC6D2F83FAB80978F020883021InvertedGradientLayer_gradientStart) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProviderP33_641AD3B9CC6D2F83FAB80978F020883021InvertedGradientLayer_gradientEnd) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProviderP33_641AD3B9CC6D2F83FAB80978F020883021InvertedGradientLayer_textDirection) = (Class)(&def_270DE0 + 3);
  sub_FB9C(v8, v8[3]);
  uint64_t v4 = sub_77EC10();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for InvertedGradientLayer();
  v5 = [(InvertedGradientLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v8);
  return v5;
}

- (_TtC18ASMessagesProviderP33_641AD3B9CC6D2F83FAB80978F020883021InvertedGradientLayer)initWithCoder:(id)a3
{
  return (_TtC18ASMessagesProviderP33_641AD3B9CC6D2F83FAB80978F020883021InvertedGradientLayer *)sub_1DD474(a3);
}

@end