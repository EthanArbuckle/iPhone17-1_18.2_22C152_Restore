@interface DOCFastLabel.FastLabelLayer
- (_TtCC14RecentsAvocado12DOCFastLabelP33_CD5294DB9AEF0F9645B1C8B7D38F0AD414FastLabelLayer)init;
- (_TtCC14RecentsAvocado12DOCFastLabelP33_CD5294DB9AEF0F9645B1C8B7D38F0AD414FastLabelLayer)initWithCoder:(id)a3;
- (_TtCC14RecentsAvocado12DOCFastLabelP33_CD5294DB9AEF0F9645B1C8B7D38F0AD414FastLabelLayer)initWithLayer:(id)a3;
- (id)implicitAnimationForKeyPath:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation DOCFastLabel.FastLabelLayer

- (_TtCC14RecentsAvocado12DOCFastLabelP33_CD5294DB9AEF0F9645B1C8B7D38F0AD414FastLabelLayer)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCC14RecentsAvocado12DOCFastLabelP33_CD5294DB9AEF0F9645B1C8B7D38F0AD414FastLabelLayer_traitCollection) = 0;
  v3 = (char *)self
     + OBJC_IVAR____TtCC14RecentsAvocado12DOCFastLabelP33_CD5294DB9AEF0F9645B1C8B7D38F0AD414FastLabelLayer_labelInformation;
  sub_10003176C((uint64_t)v7);
  sub_100031790((uint64_t)v7, (uint64_t)v3, &qword_100626C70);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCFastLabel.FastLabelLayer();
  v4 = [(DOCFastLabel.FastLabelLayer *)&v6 init];
  [(DOCFastLabel.FastLabelLayer *)v4 setOpaque:0];
  [(DOCFastLabel.FastLabelLayer *)v4 setContentsFormat:kCAContentsFormatAutomatic];

  return v4;
}

- (_TtCC14RecentsAvocado12DOCFastLabelP33_CD5294DB9AEF0F9645B1C8B7D38F0AD414FastLabelLayer)initWithCoder:(id)a3
{
  return (_TtCC14RecentsAvocado12DOCFastLabelP33_CD5294DB9AEF0F9645B1C8B7D38F0AD414FastLabelLayer *)sub_1003E5394(a3);
}

- (_TtCC14RecentsAvocado12DOCFastLabelP33_CD5294DB9AEF0F9645B1C8B7D38F0AD414FastLabelLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1004CF2A0();
  swift_unknownObjectRelease();
  return (_TtCC14RecentsAvocado12DOCFastLabelP33_CD5294DB9AEF0F9645B1C8B7D38F0AD414FastLabelLayer *)sub_1003E5488(v4);
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  return 0;
}

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  sub_1003E569C(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC14RecentsAvocado12DOCFastLabelP33_CD5294DB9AEF0F9645B1C8B7D38F0AD414FastLabelLayer_traitCollection));
  sub_100031790((uint64_t)self+ OBJC_IVAR____TtCC14RecentsAvocado12DOCFastLabelP33_CD5294DB9AEF0F9645B1C8B7D38F0AD414FastLabelLayer_labelInformation, (uint64_t)v3, &qword_100626C70);
  sub_1003E7FC4(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_100049A88);
}

@end