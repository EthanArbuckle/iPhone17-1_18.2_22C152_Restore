@interface DOCFastLabel.FastLabelLayer
- (_TtCC33com_apple_DocumentManager_Service12DOCFastLabelP33_7D25665A06605AE161E4D244A1D6EF7A14FastLabelLayer)init;
- (_TtCC33com_apple_DocumentManager_Service12DOCFastLabelP33_7D25665A06605AE161E4D244A1D6EF7A14FastLabelLayer)initWithCoder:(id)a3;
- (_TtCC33com_apple_DocumentManager_Service12DOCFastLabelP33_7D25665A06605AE161E4D244A1D6EF7A14FastLabelLayer)initWithLayer:(id)a3;
- (id)implicitAnimationForKeyPath:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation DOCFastLabel.FastLabelLayer

- (_TtCC33com_apple_DocumentManager_Service12DOCFastLabelP33_7D25665A06605AE161E4D244A1D6EF7A14FastLabelLayer)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCC33com_apple_DocumentManager_Service12DOCFastLabelP33_7D25665A06605AE161E4D244A1D6EF7A14FastLabelLayer_traitCollection) = 0;
  v3 = (char *)self
     + OBJC_IVAR____TtCC33com_apple_DocumentManager_Service12DOCFastLabelP33_7D25665A06605AE161E4D244A1D6EF7A14FastLabelLayer_labelInformation;
  sub_100039760((uint64_t)v7);
  sub_10003B0B8((uint64_t)v7, (uint64_t)v3, &qword_10062A800);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCFastLabel.FastLabelLayer();
  v4 = [(DOCFastLabel.FastLabelLayer *)&v6 init];
  [(DOCFastLabel.FastLabelLayer *)v4 setOpaque:0];
  [(DOCFastLabel.FastLabelLayer *)v4 setContentsFormat:kCAContentsFormatAutomatic];

  return v4;
}

- (_TtCC33com_apple_DocumentManager_Service12DOCFastLabelP33_7D25665A06605AE161E4D244A1D6EF7A14FastLabelLayer)initWithCoder:(id)a3
{
  return (_TtCC33com_apple_DocumentManager_Service12DOCFastLabelP33_7D25665A06605AE161E4D244A1D6EF7A14FastLabelLayer *)sub_100418EF0(a3);
}

- (_TtCC33com_apple_DocumentManager_Service12DOCFastLabelP33_7D25665A06605AE161E4D244A1D6EF7A14FastLabelLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1004CEA50();
  swift_unknownObjectRelease();
  return (_TtCC33com_apple_DocumentManager_Service12DOCFastLabelP33_7D25665A06605AE161E4D244A1D6EF7A14FastLabelLayer *)sub_100418FE4(v4);
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  return 0;
}

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  sub_1004191F8(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC33com_apple_DocumentManager_Service12DOCFastLabelP33_7D25665A06605AE161E4D244A1D6EF7A14FastLabelLayer_traitCollection));
  sub_10003B0B8((uint64_t)self+ OBJC_IVAR____TtCC33com_apple_DocumentManager_Service12DOCFastLabelP33_7D25665A06605AE161E4D244A1D6EF7A14FastLabelLayer_labelInformation, (uint64_t)v3, &qword_10062A800);
  sub_10041BB20(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1001BA0D8);
}

@end