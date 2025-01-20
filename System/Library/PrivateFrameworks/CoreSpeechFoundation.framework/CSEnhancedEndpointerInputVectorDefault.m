@interface CSEnhancedEndpointerInputVectorDefault
- (MLMultiArray)multiArray;
- (_TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault)init;
- (_TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault)initWithShape:(id)a3 dataType:(int64_t)a4 error:(id *)a5;
- (_TtP20CoreSpeechFoundation29CSEnhancedEndpointerModelType_)modelType;
- (id)modelName;
- (id)multiArrayWithContext:(id)a3;
- (int64_t)endpointerType;
- (void)setModelType:(id)a3;
- (void)setMultiArray:(id)a3;
@end

@implementation CSEnhancedEndpointerInputVectorDefault

- (_TtP20CoreSpeechFoundation29CSEnhancedEndpointerModelType_)modelType
{
  v2 = (void *)swift_unknownObjectRetain();
  return (_TtP20CoreSpeechFoundation29CSEnhancedEndpointerModelType_ *)v2;
}

- (void)setModelType:(id)a3
{
}

- (MLMultiArray)multiArray
{
  return (MLMultiArray *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault_multiArray));
}

- (void)setMultiArray:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault_multiArray);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault_multiArray) = (Class)a3;
  id v3 = a3;
}

- (_TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault)initWithShape:(id)a3 dataType:(int64_t)a4 error:(id *)a5
{
  return (_TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault *)sub_1BA1ACBF0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, uint64_t))sub_1BA1AC7B8);
}

- (id)modelName
{
  return sub_1BA1ACCA8((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault_modelType);
}

- (int64_t)endpointerType
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault_modelType), sel_endpointerType);
}

- (id)multiArrayWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BA1AC580(v4);
  v7 = v6;

  return v7;
}

- (_TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault)init
{
  result = (_TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault_multiArray);
}

@end