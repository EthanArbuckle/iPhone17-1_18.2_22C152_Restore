@interface MAMutableFloatMatrixWrapper
- (_TtC17KnowledgeGraphKit27MAMutableFloatMatrixWrapper)init;
- (_TtC17KnowledgeGraphKit27MAMutableFloatMatrixWrapper)initWithRows:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)addScalar:(float)a3;
- (void)appendRow:(id)a3;
- (void)setFloat:(float)a3 atRow:(int64_t)a4 column:(int64_t)a5;
- (void)subtract:(id)a3;
- (void)subtractScalar:(float)a3;
@end

@implementation MAMutableFloatMatrixWrapper

- (_TtC17KnowledgeGraphKit27MAMutableFloatMatrixWrapper)initWithRows:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD272D0);
  uint64_t v4 = sub_1D17BE130();
  v5 = self;
  sub_1D1711FF8(v4, &v9);
  v6 = (char *)v5 + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix;
  *(void *)v6 = v9;
  *(_OWORD *)(v6 + 8) = v10;

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for MAFloatMatrixWrapper();
  return [(MAFloatMatrixWrapper *)&v8 init];
}

- (_TtC17KnowledgeGraphKit27MAMutableFloatMatrixWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(MAFloatMatrixWrapper *)&v3 init];
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix);
  uint64_t v4 = *(void *)&self->super._floatMatrix[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix];
  uint64_t v5 = *(void *)&self->super._floatMatrix[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix + 8];
  v6 = (objc_class *)type metadata accessor for MAFloatMatrixWrapper();
  v7 = (char *)objc_allocWithZone(v6);
  objc_super v8 = &v7[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix];
  *(void *)objc_super v8 = v3;
  *((void *)v8 + 1) = v4;
  *((void *)v8 + 2) = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  swift_bridgeObjectRetain();
  return [(MAFloatMatrixWrapper *)&v10 init];
}

- (void)setFloat:(float)a3 atRow:(int64_t)a4 column:(int64_t)a5
{
  objc_super v8 = self;
  MAMutableFloatMatrixWrapper.setFloat(_:at:column:)(a3, a4, a5);
}

- (void)subtract:(id)a3
{
  uint64_t v4 = (float *)a3;
  uint64_t v5 = self;
  MAMutableFloatMatrixWrapper.subtract(_:)(v4);
}

- (void)subtractScalar:(float)a3
{
  uint64_t v4 = self;
  MAMutableFloatMatrixWrapper.subtract(_:)(a3);
}

- (void)addScalar:(float)a3
{
  uint64_t v4 = self;
  MAMutableFloatMatrixWrapper.add(_:)(a3);
}

- (void)appendRow:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = self;
  MAMutableFloatMatrixWrapper.appendRow(_:)(v4);
}

@end