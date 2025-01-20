@interface DOCFastLabel.FastLabelLayer
- (_TtCC11SaveToFiles12DOCFastLabelP33_2009331A07BDFFF76CD3A937802B6B3F14FastLabelLayer)init;
- (_TtCC11SaveToFiles12DOCFastLabelP33_2009331A07BDFFF76CD3A937802B6B3F14FastLabelLayer)initWithCoder:(id)a3;
- (_TtCC11SaveToFiles12DOCFastLabelP33_2009331A07BDFFF76CD3A937802B6B3F14FastLabelLayer)initWithLayer:(id)a3;
- (id)implicitAnimationForKeyPath:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation DOCFastLabel.FastLabelLayer

- (_TtCC11SaveToFiles12DOCFastLabelP33_2009331A07BDFFF76CD3A937802B6B3F14FastLabelLayer)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCC11SaveToFiles12DOCFastLabelP33_2009331A07BDFFF76CD3A937802B6B3F14FastLabelLayer_traitCollection) = 0;
  v3 = (char *)self
     + OBJC_IVAR____TtCC11SaveToFiles12DOCFastLabelP33_2009331A07BDFFF76CD3A937802B6B3F14FastLabelLayer_labelInformation;
  sub_10003429C((uint64_t)v7);
  sub_1000342C0((uint64_t)v7, (uint64_t)v3, (uint64_t *)&unk_100634850);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCFastLabel.FastLabelLayer();
  v4 = [(DOCFastLabel.FastLabelLayer *)&v6 init];
  [(DOCFastLabel.FastLabelLayer *)v4 setOpaque:0];
  [(DOCFastLabel.FastLabelLayer *)v4 setContentsFormat:kCAContentsFormatAutomatic];

  return v4;
}

- (_TtCC11SaveToFiles12DOCFastLabelP33_2009331A07BDFFF76CD3A937802B6B3F14FastLabelLayer)initWithCoder:(id)a3
{
  return (_TtCC11SaveToFiles12DOCFastLabelP33_2009331A07BDFFF76CD3A937802B6B3F14FastLabelLayer *)sub_100401094(a3);
}

- (_TtCC11SaveToFiles12DOCFastLabelP33_2009331A07BDFFF76CD3A937802B6B3F14FastLabelLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1004D29A0();
  swift_unknownObjectRelease();
  return (_TtCC11SaveToFiles12DOCFastLabelP33_2009331A07BDFFF76CD3A937802B6B3F14FastLabelLayer *)sub_100401188(v4);
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  return 0;
}

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  sub_10040139C(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC11SaveToFiles12DOCFastLabelP33_2009331A07BDFFF76CD3A937802B6B3F14FastLabelLayer_traitCollection));
  sub_1000342C0((uint64_t)self+ OBJC_IVAR____TtCC11SaveToFiles12DOCFastLabelP33_2009331A07BDFFF76CD3A937802B6B3F14FastLabelLayer_labelInformation, (uint64_t)v3, (uint64_t *)&unk_100634850);
  sub_100403A70(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1001F0C98);
}

@end