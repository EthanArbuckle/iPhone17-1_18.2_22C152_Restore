@interface DOCFastLabel.FastLabelLayer
- (_TtCC18DocumentAppIntents12DOCFastLabelP33_090D52918CACA83C9ED6C9F3722E2C0214FastLabelLayer)init;
- (_TtCC18DocumentAppIntents12DOCFastLabelP33_090D52918CACA83C9ED6C9F3722E2C0214FastLabelLayer)initWithCoder:(id)a3;
- (_TtCC18DocumentAppIntents12DOCFastLabelP33_090D52918CACA83C9ED6C9F3722E2C0214FastLabelLayer)initWithLayer:(id)a3;
- (id)implicitAnimationForKeyPath:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation DOCFastLabel.FastLabelLayer

- (_TtCC18DocumentAppIntents12DOCFastLabelP33_090D52918CACA83C9ED6C9F3722E2C0214FastLabelLayer)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCC18DocumentAppIntents12DOCFastLabelP33_090D52918CACA83C9ED6C9F3722E2C0214FastLabelLayer_traitCollection) = 0;
  v3 = (char *)self
     + OBJC_IVAR____TtCC18DocumentAppIntents12DOCFastLabelP33_090D52918CACA83C9ED6C9F3722E2C0214FastLabelLayer_labelInformation;
  sub_1000306E0((uint64_t)v7);
  sub_100030704((uint64_t)v7, (uint64_t)v3, &qword_10065CA10);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCFastLabel.FastLabelLayer();
  v4 = [(DOCFastLabel.FastLabelLayer *)&v6 init];
  [(DOCFastLabel.FastLabelLayer *)v4 setOpaque:0];
  [(DOCFastLabel.FastLabelLayer *)v4 setContentsFormat:kCAContentsFormatAutomatic];

  return v4;
}

- (_TtCC18DocumentAppIntents12DOCFastLabelP33_090D52918CACA83C9ED6C9F3722E2C0214FastLabelLayer)initWithCoder:(id)a3
{
  return (_TtCC18DocumentAppIntents12DOCFastLabelP33_090D52918CACA83C9ED6C9F3722E2C0214FastLabelLayer *)sub_100407F60(a3);
}

- (_TtCC18DocumentAppIntents12DOCFastLabelP33_090D52918CACA83C9ED6C9F3722E2C0214FastLabelLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1004F5D00();
  swift_unknownObjectRelease();
  return (_TtCC18DocumentAppIntents12DOCFastLabelP33_090D52918CACA83C9ED6C9F3722E2C0214FastLabelLayer *)sub_100408054(v4);
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  return 0;
}

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  sub_100408268(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC18DocumentAppIntents12DOCFastLabelP33_090D52918CACA83C9ED6C9F3722E2C0214FastLabelLayer_traitCollection));
  sub_100030704((uint64_t)self+ OBJC_IVAR____TtCC18DocumentAppIntents12DOCFastLabelP33_090D52918CACA83C9ED6C9F3722E2C0214FastLabelLayer_labelInformation, (uint64_t)v3, &qword_10065CA10);
  sub_10040AB90(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_10004B7C8);
}

@end