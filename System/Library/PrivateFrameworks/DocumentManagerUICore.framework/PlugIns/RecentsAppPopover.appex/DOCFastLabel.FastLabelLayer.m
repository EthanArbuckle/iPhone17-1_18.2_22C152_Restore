@interface DOCFastLabel.FastLabelLayer
- (_TtCC17RecentsAppPopover12DOCFastLabelP33_ECE77F2DBA8A7C77BE10E6892438606014FastLabelLayer)init;
- (_TtCC17RecentsAppPopover12DOCFastLabelP33_ECE77F2DBA8A7C77BE10E6892438606014FastLabelLayer)initWithCoder:(id)a3;
- (_TtCC17RecentsAppPopover12DOCFastLabelP33_ECE77F2DBA8A7C77BE10E6892438606014FastLabelLayer)initWithLayer:(id)a3;
- (id)implicitAnimationForKeyPath:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation DOCFastLabel.FastLabelLayer

- (_TtCC17RecentsAppPopover12DOCFastLabelP33_ECE77F2DBA8A7C77BE10E6892438606014FastLabelLayer)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCC17RecentsAppPopover12DOCFastLabelP33_ECE77F2DBA8A7C77BE10E6892438606014FastLabelLayer_traitCollection) = 0;
  v3 = (char *)self
     + OBJC_IVAR____TtCC17RecentsAppPopover12DOCFastLabelP33_ECE77F2DBA8A7C77BE10E6892438606014FastLabelLayer_labelInformation;
  sub_100031984((uint64_t)v7);
  sub_1000319A8((uint64_t)v7, (uint64_t)v3, &qword_100615F80);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCFastLabel.FastLabelLayer();
  v4 = [(DOCFastLabel.FastLabelLayer *)&v6 init];
  [(DOCFastLabel.FastLabelLayer *)v4 setOpaque:0];
  [(DOCFastLabel.FastLabelLayer *)v4 setContentsFormat:kCAContentsFormatAutomatic];

  return v4;
}

- (_TtCC17RecentsAppPopover12DOCFastLabelP33_ECE77F2DBA8A7C77BE10E6892438606014FastLabelLayer)initWithCoder:(id)a3
{
  return (_TtCC17RecentsAppPopover12DOCFastLabelP33_ECE77F2DBA8A7C77BE10E6892438606014FastLabelLayer *)sub_1003A0100(a3);
}

- (_TtCC17RecentsAppPopover12DOCFastLabelP33_ECE77F2DBA8A7C77BE10E6892438606014FastLabelLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1004C0260();
  swift_unknownObjectRelease();
  return (_TtCC17RecentsAppPopover12DOCFastLabelP33_ECE77F2DBA8A7C77BE10E6892438606014FastLabelLayer *)sub_1003A01F4(v4);
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  return 0;
}

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  sub_1003A0408(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC17RecentsAppPopover12DOCFastLabelP33_ECE77F2DBA8A7C77BE10E6892438606014FastLabelLayer_traitCollection));
  sub_1000319A8((uint64_t)self+ OBJC_IVAR____TtCC17RecentsAppPopover12DOCFastLabelP33_ECE77F2DBA8A7C77BE10E6892438606014FastLabelLayer_labelInformation, (uint64_t)v3, &qword_100615F80);
  sub_1003A2D30(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1000515D8);
}

@end