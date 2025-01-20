@interface MAFloatMatrixWrapper
+ (id)onesWithRows:(int64_t)a3 columns:(int64_t)a4;
+ (id)repeatingWithElement:(float)a3 rows:(int64_t)a4 columns:(int64_t)a5;
+ (id)wrapperWithData:(id)a3 rows:(int64_t)a4 columns:(int64_t)a5;
+ (id)zerosWithRows:(int64_t)a3 columns:(int64_t)a4;
- (BOOL)isApproximatelyEqualTo:(id)a3;
- (BOOL)isApproximatelyEqualTo:(id)a3 epsilon:(float)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper)init;
- (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper)initWithFloats:(const float *)a3 rows:(int64_t)a4 columns:(int64_t)a5;
- (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper)initWithRows:(id)a3;
- (float)floatAtRow:(int64_t)a3 column:(int64_t)a4;
- (float)mean;
- (float)sum;
- (float)sumOfSquares;
- (id)array;
- (id)data;
- (id)matrixByAddingScalar:(float)a3;
- (id)matrixByAppendingColumnVector:(id)a3;
- (id)matrixByAppendingColumnsOfMatrix:(id)a3;
- (id)matrixBySubtractingMatrix:(id)a3;
- (id)matrixBySubtractingScalar:(float)a3;
- (id)meanAlongAxis:(unint64_t)a3;
- (id)mutableCopyWithZone:(void *)a3;
- (id)row:(int64_t)a3;
- (id)sumAlongAxis:(unint64_t)a3;
- (int64_t)columns;
- (int64_t)count;
- (int64_t)hash;
- (int64_t)rows;
@end

@implementation MAFloatMatrixWrapper

- (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper)initWithRows:(id)a3
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

- (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper)init
{
  v2 = self;
  sub_1D1711FF8(MEMORY[0x1E4FBC860], &v7);
  long long v3 = v8;
  uint64_t v4 = (char *)v2 + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix;
  *(void *)uint64_t v4 = v7;
  *(_OWORD *)(v4 + 8) = v3;

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for MAFloatMatrixWrapper();
  return [(MAFloatMatrixWrapper *)&v6 init];
}

- (void).cxx_destruct
{
}

- (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper)initWithFloats:(const float *)a3 rows:(int64_t)a4 columns:(int64_t)a5
{
  result = (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *)swift_getObjectType();
  if ((unsigned __int128)(a4 * (__int128)a5) >> 64 == (a4 * a5) >> 63)
  {
    uint64_t v9 = result;
    result = (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *)sub_1D1666A30((char *)a3, a4 * a5);
    if (*(void *)&result->_floatMatrix[8] == a4 * a5)
    {
      v11[0] = result;
      v11[1] = a4;
      v11[2] = a5;
      long long v10 = (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *)(*(uint64_t (**)(void *))&v9[3]._floatMatrix[16])(v11);
      swift_deallocPartialClassInstance();
      return v10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

+ (id)wrapperWithData:(id)a3 rows:(int64_t)a4 columns:(int64_t)a5
{
  id v7 = a3;
  uint64_t v8 = sub_1D17BDD70();
  unint64_t v10 = v9;

  id v11 = _s17KnowledgeGraphKit20MAFloatMatrixWrapperC8fromData4data4rows7columnsAC10Foundation0H0V_S2itFZ_0(v8, v10, a4, a5);
  sub_1D1668030(v8, v10);
  return v11;
}

+ (id)repeatingWithElement:(float)a3 rows:(int64_t)a4 columns:(int64_t)a5
{
  int64_t v5 = a4 * a5;
  if ((unsigned __int128)(a4 * (__int128)a5) >> 64 != (a4 * a5) >> 63)
  {
    __break(1u);
    goto LABEL_7;
  }
  result = (id)sub_1D1665A14(a4 * a5, *(int32x2_t *)&a3);
  if (*((void *)result + 2) != v5)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  id v8 = result;
  unint64_t v9 = (objc_class *)type metadata accessor for MAFloatMatrixWrapper();
  unint64_t v10 = (char *)objc_allocWithZone(v9);
  id v11 = &v10[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix];
  *(void *)id v11 = v8;
  *((void *)v11 + 1) = a4;
  *((void *)v11 + 2) = a5;
  v13.receiver = v10;
  v13.super_class = v9;
  id v12 = objc_msgSendSuper2(&v13, sel_init);
  return v12;
}

+ (id)zerosWithRows:(int64_t)a3 columns:(int64_t)a4
{
  swift_getObjCClassMetadata();
  objc_super v6 = (void *)static MAFloatMatrixWrapper.zeros(rows:columns:)(a3, a4);
  return v6;
}

+ (id)onesWithRows:(int64_t)a3 columns:(int64_t)a4
{
  swift_getObjCClassMetadata();
  id v7 = (void *)static MAFloatMatrixWrapper.ones(rows:columns:)(a3, a4, v6);
  return v7;
}

- (id)mutableCopyWithZone:(void *)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix);
  uint64_t v4 = *(void *)&self->_floatMatrix[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix];
  uint64_t v5 = *(void *)&self->_floatMatrix[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix + 8];
  int32x2_t v6 = (char *)objc_allocWithZone((Class)type metadata accessor for MAMutableFloatMatrixWrapper());
  id v7 = &v6[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix];
  *(void *)id v7 = v3;
  *((void *)v7 + 1) = v4;
  *((void *)v7 + 2) = v5;
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for MAFloatMatrixWrapper();
  swift_bridgeObjectRetain();
  return [(MAFloatMatrixWrapper *)&v9 init];
}

- (float)floatAtRow:(int64_t)a3 column:(int64_t)a4
{
  (*(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x70))(v11);
  if (v11[1] < a3 || v12 <= a4)
  {
    __break(1u);
    goto LABEL_11;
  }
  int64_t v8 = a3 * v12;
  if ((unsigned __int128)(a3 * (__int128)v12) >> 64 != (a3 * v12) >> 63)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  unint64_t v9 = v8 + a4;
  if (__OFADD__(v8, a4))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if ((v9 & 0x8000000000000000) != 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v9 < *(void *)(v11[0] + 16))
  {
    float v10 = *(float *)(v11[0] + 4 * v9 + 32);
    swift_bridgeObjectRelease();
    return v10;
  }
LABEL_14:
  __break(1u);
  return result;
}

- (id)row:(int64_t)a3
{
  uint64_t v4 = self;
  id v5 = MAFloatMatrixWrapper.vector(_:)(a3);

  return v5;
}

- (int64_t)count
{
  (*(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x70))(v4);
  int64_t v2 = *(void *)(v4[0] + 16);
  swift_bridgeObjectRelease();
  return v2;
}

- (int64_t)rows
{
  (*(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x70))(v4);
  int64_t v2 = v4[1];
  swift_bridgeObjectRelease();
  return v2;
}

- (int64_t)columns
{
  (*(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x70))(v4);
  int64_t v2 = v4[2];
  swift_bridgeObjectRelease();
  return v2;
}

- (float)sum
{
  int64_t v2 = (void (*)(uint64_t, uint64_t, float *, uint64_t))MEMORY[0x1E4F16A38];
  return sub_1D16AE034(self, (uint64_t)a2, v2);
}

- (float)sumOfSquares
{
  int64_t v2 = (void (*)(uint64_t, uint64_t, float *, uint64_t))MEMORY[0x1E4F16A80];
  return sub_1D16AE034(self, (uint64_t)a2, v2);
}

- (float)mean
{
  int64_t v2 = (void (*)(uint64_t, uint64_t, float *, uint64_t))MEMORY[0x1E4F169A0];
  return sub_1D16AE034(self, (uint64_t)a2, v2);
}

- (id)array
{
  int64_t v2 = self;
  MAFloatMatrixWrapper.array()();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD272D0);
  uint64_t v3 = (void *)sub_1D17BE110();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)data
{
  int64_t v2 = self;
  uint64_t v3 = MAFloatMatrixWrapper.data()();
  unint64_t v5 = v4;

  int32x2_t v6 = (void *)sub_1D17BDD60();
  sub_1D1668030((uint64_t)v3, v5);
  return v6;
}

- (NSString)description
{
  int64_t v2 = self;
  MAFloatMatrixWrapper.description.getter();

  uint64_t v3 = (void *)sub_1D17BDFE0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)matrixBySubtractingMatrix:(id)a3
{
  unint64_t v4 = a3;
  unint64_t v5 = self;
  int32x2_t v6 = MAFloatMatrixWrapper.matrixBySubtractingMatrix(_:)(v4);

  return v6;
}

- (id)matrixBySubtractingScalar:(float)a3
{
  uint64_t v3 = self;
  id v4 = MAFloatMatrixWrapper.matrixBySubtractingScalar(_:)();

  return v4;
}

- (id)matrixByAddingScalar:(float)a3
{
  uint64_t v3 = self;
  id v4 = MAFloatMatrixWrapper.matrixByAddingScalar(_:)();

  return v4;
}

- (id)sumAlongAxis:(unint64_t)a3
{
  id v4 = self;
  id v5 = MAFloatMatrixWrapper.sumAlongAxis(_:)(a3);

  return v5;
}

- (id)meanAlongAxis:(unint64_t)a3
{
  id v4 = self;
  id v5 = MAFloatMatrixWrapper.meanAlongAxis(_:)(a3);

  return v5;
}

- (id)matrixByAppendingColumnVector:(id)a3
{
  id v4 = a3;
  id v5 = self;
  int32x2_t v6 = MAFloatMatrixWrapper.appendingColumn(_:)(v4);

  return v6;
}

- (id)matrixByAppendingColumnsOfMatrix:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = MAFloatMatrixWrapper.appendingColumns(of:)(v4);

  return v6;
}

- (BOOL)isApproximatelyEqualTo:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = MAFloatMatrixWrapper.isApproximatelyEqual(to:)(v4);

  return self & 1;
}

- (BOOL)isApproximatelyEqualTo:(id)a3 epsilon:(float)a4
{
  id v6 = a3;
  id v7 = self;
  LOBYTE(self) = MAFloatMatrixWrapper.isApproximatelyEqual(to:epsilon:)(v6, a4);

  return self & 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1D17BE690();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  char v6 = MAFloatMatrixWrapper.isEqual(_:)((uint64_t)v8);

  sub_1D167133C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  (*(void (**)(uint64_t *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x70))(&v6);
  uint64_t v2 = v6;
  sub_1D17BED20();
  sub_1D16668F8((uint64_t)&v5, v2);
  sub_1D17BED30();
  sub_1D17BED30();
  int64_t v3 = sub_1D17BED80();
  swift_bridgeObjectRelease();
  return v3;
}

@end