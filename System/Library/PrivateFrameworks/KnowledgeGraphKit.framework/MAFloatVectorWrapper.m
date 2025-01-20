@interface MAFloatVectorWrapper
+ (id)onesOfCount:(int64_t)a3;
+ (id)repeatingFloat:(float)a3 count:(int64_t)a4;
+ (id)zerosOfCount:(int64_t)a3;
- (BOOL)isApproximatelyEqualTo:(id)a3;
- (BOOL)isApproximatelyEqualTo:(id)a3 epsilon:(float)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper)init;
- (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper)initWithArray:(id)a3;
- (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper)initWithFloats:(const float *)a3 count:(int64_t)a4;
- (float)dotProductWithWrapper:(id)a3;
- (float)floatAtIndex:(int64_t)a3;
- (float)mean;
- (float)standardDeviation;
- (float)sum;
- (float)sumOfSquares;
- (id)array;
- (id)data;
- (id)mutableCopyWithZone:(void *)a3;
- (id)naturalLogarithm;
- (id)naturalLogarithmIfPositive;
- (id)sliceFromStart:(int64_t)a3 toEnd:(int64_t)a4;
- (id)vectorByAddingScalar:(float)a3;
- (id)vectorByAddingVector:(id)a3;
- (id)vectorByDividingByScalar:(float)a3;
- (id)vectorByElementwiseMultiplyingByWrapper:(id)a3;
- (id)vectorByElementwiseRaisingToExponent:(float)a3;
- (id)vectorByMultiplyingByScalar:(float)a3;
- (id)vectorBySubtractingScalar:(float)a3;
- (id)vectorBySubtractingVector:(id)a3;
- (int64_t)count;
- (int64_t)hash;
@end

@implementation MAFloatVectorWrapper

- (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper)initWithArray:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector) = (Class)sub_1D17BE130();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MAFloatVectorWrapper();
  return [(MAFloatVectorWrapper *)&v5 init];
}

- (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector) = (Class)MEMORY[0x1E4FBC860];
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MAFloatVectorWrapper();
  return [(MAFloatVectorWrapper *)&v3 init];
}

- (void).cxx_destruct
{
}

- (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper)initWithFloats:(const float *)a3 count:(int64_t)a4
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v9 = sub_1D1666A30((char *)a3, a4);
  v7 = (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper *)(*(uint64_t (**)(uint64_t *))(ObjectType + 120))(&v9);
  swift_deallocPartialClassInstance();
  return v7;
}

+ (id)zerosOfCount:(int64_t)a3
{
  swift_getObjCClassMetadata();
  v4 = (void *)static MAFloatVectorWrapper.zeros(count:)(a3);
  return v4;
}

+ (id)onesOfCount:(int64_t)a3
{
  swift_getObjCClassMetadata();
  objc_super v5 = (void *)static MAFloatVectorWrapper.ones(count:)(a3, v4);
  return v5;
}

+ (id)repeatingFloat:(float)a3 count:(int64_t)a4
{
  swift_getObjCClassMetadata();
  *(float *)v6.i32 = a3;
  v7 = (void *)static MAFloatVectorWrapper.repeating(float:count:)(a4, v6);
  return v7;
}

- (id)mutableCopyWithZone:(void *)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector);
  int32x2_t v4 = (char *)objc_allocWithZone((Class)type metadata accessor for MAMutableFloatVectorWrapper());
  *(void *)&v4[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector] = v3;
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for MAFloatVectorWrapper();
  swift_bridgeObjectRetain();
  return [(MAFloatVectorWrapper *)&v6 init];
}

- (float)floatAtIndex:(int64_t)a3
{
  (*(void (**)(uint64_t *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x70))(&v6);
  if (a3 < 0)
  {
    __break(1u);
  }
  else if (*(void *)(v6 + 16) > (unint64_t)a3)
  {
    float v5 = *(float *)(v6 + 4 * a3 + 32);
    swift_bridgeObjectRelease();
    return v5;
  }
  __break(1u);
  return result;
}

- (id)vectorBySubtractingVector:(id)a3
{
  int32x2_t v4 = a3;
  float v5 = self;
  uint64_t v6 = MAFloatVectorWrapper.vectorBySubtractingVector(_:)(v4);

  return v6;
}

- (id)vectorByAddingVector:(id)a3
{
  int32x2_t v4 = a3;
  float v5 = self;
  uint64_t v6 = MAFloatVectorWrapper.vectorByAddingVector(_:)(v4);

  return v6;
}

- (id)vectorBySubtractingScalar:(float)a3
{
  uint64_t v3 = self;
  id v4 = MAFloatVectorWrapper.vectorBySubtractingScalar(_:)();

  return v4;
}

- (id)vectorByAddingScalar:(float)a3
{
  uint64_t v3 = self;
  id v4 = MAFloatVectorWrapper.vectorByAddingScalar(_:)();

  return v4;
}

- (id)vectorByMultiplyingByScalar:(float)a3
{
  uint64_t v3 = self;
  id v4 = MAFloatVectorWrapper.vectorByMultiplyingByScalar(_:)();

  return v4;
}

- (id)vectorByDividingByScalar:(float)a3
{
  uint64_t v3 = self;
  id v4 = MAFloatVectorWrapper.vectorByDividingByScalar(_:)();

  return v4;
}

- (id)vectorByElementwiseMultiplyingByWrapper:(id)a3
{
  id v4 = a3;
  float v5 = self;
  uint64_t v6 = MAFloatVectorWrapper.vectorByElementwiseMultiplyingByWrapper(_:)(v4);

  return v6;
}

- (id)vectorByElementwiseRaisingToExponent:(float)a3
{
  id v4 = self;
  id v5 = MAFloatVectorWrapper.vectorByElementwiseRaisingToExponent(_:)(a3);

  return v5;
}

- (float)dotProductWithWrapper:(id)a3
{
  id v4 = a3;
  id v5 = self;
  float v6 = MAFloatVectorWrapper.dotProductWithWrapper(_:)(v4);

  return v6;
}

- (id)sliceFromStart:(int64_t)a3 toEnd:(int64_t)a4
{
  float v6 = self;
  id v7 = MAFloatVectorWrapper.slice(from:to:)(a3, a4);

  return v7;
}

- (int64_t)count
{
  (*(void (**)(uint64_t *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x70))(&v4);
  int64_t v2 = *(void *)(v4 + 16);
  swift_bridgeObjectRelease();
  return v2;
}

- (float)sum
{
  int64_t v2 = (void (*)(uint64_t, uint64_t, float *, uint64_t))MEMORY[0x1E4F16A38];
  return sub_1D1662654(self, (uint64_t)a2, v2);
}

- (float)sumOfSquares
{
  int64_t v2 = (void (*)(uint64_t, uint64_t, float *, uint64_t))MEMORY[0x1E4F16A80];
  return sub_1D1662654(self, (uint64_t)a2, v2);
}

- (float)mean
{
  int64_t v2 = (void (*)(uint64_t, uint64_t, float *, uint64_t))MEMORY[0x1E4F169A0];
  return sub_1D1662654(self, (uint64_t)a2, v2);
}

- (float)standardDeviation
{
  int64_t v2 = self;
  float v3 = MAFloatVectorWrapper.standardDeviation()();

  return v3;
}

- (id)array
{
  (*(void (**)(uint64_t *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x70))(&v4);
  int64_t v2 = (void *)sub_1D17BE110();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)data
{
  int64_t v2 = self;
  float v3 = MAFloatVectorWrapper.data()();
  unint64_t v5 = v4;

  float v6 = (void *)sub_1D17BDD60();
  sub_1D1668030((uint64_t)v3, v5);
  return v6;
}

- (NSString)description
{
  return (NSString *)sub_1D1662B50(self, (uint64_t)a2, MEMORY[0x1E4FBB300]);
}

- (NSString)debugDescription
{
  return (NSString *)sub_1D1662B50(self, (uint64_t)a2, MEMORY[0x1E4FBB308]);
}

- (id)naturalLogarithm
{
  int64_t v2 = self;
  id v3 = MAFloatVectorWrapper.naturalLogarithm()();

  return v3;
}

- (id)naturalLogarithmIfPositive
{
  int64_t v2 = self;
  id v3 = MAFloatVectorWrapper.naturalLogarithmIfPositive()();

  return v3;
}

- (BOOL)isApproximatelyEqualTo:(id)a3
{
  unint64_t v4 = a3;
  unint64_t v5 = self;
  LOBYTE(self) = MAFloatVectorWrapper.isApproximatelyEqual(to:)(v4);

  return self & 1;
}

- (BOOL)isApproximatelyEqualTo:(id)a3 epsilon:(float)a4
{
  float v6 = a3;
  id v7 = self;
  LOBYTE(self) = MAFloatVectorWrapper.isApproximatelyEqual(to:epsilon:)(v6, a4);

  return self & 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    unint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1D17BE690();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    unint64_t v5 = self;
  }
  BOOL v6 = MAFloatVectorWrapper.isEqual(_:)((uint64_t)v8);

  sub_1D166817C((uint64_t)v8, &qword_1EBD272F8);
  return v6;
}

- (int64_t)hash
{
  (*(void (**)(uint64_t *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x70))(&v6);
  uint64_t v2 = v6;
  sub_1D17BED20();
  sub_1D16668F8((uint64_t)&v5, v2);
  int64_t v3 = sub_1D17BED80();
  swift_bridgeObjectRelease();
  return v3;
}

@end