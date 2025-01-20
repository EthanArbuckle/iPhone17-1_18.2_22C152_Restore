@interface MAMutableFloatVectorWrapper
- (_TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper)init;
- (_TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper)initWithArray:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)addScalar:(float)a3;
- (void)addVector:(id)a3;
- (void)appendArray:(id)a3;
- (void)appendDoubles:(const double *)a3 count:(int64_t)a4;
- (void)appendFloat:(float)a3;
- (void)appendFloats:(const float *)a3 count:(int64_t)a4;
- (void)appendVector:(id)a3;
- (void)divideByScalar:(float)a3;
- (void)elementwiseMultiplyByWrapper:(id)a3;
- (void)elementwiseRaiseToExponent:(float)a3;
- (void)multiplyByScalar:(float)a3;
- (void)setFloat:(float)a3 atIndex:(int64_t)a4;
- (void)subtractScalar:(float)a3;
- (void)subtractVector:(id)a3;
@end

@implementation MAMutableFloatVectorWrapper

- (_TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper)initWithArray:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector) = (Class)sub_1D17BE130();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MAFloatVectorWrapper();
  return [(MAFloatVectorWrapper *)&v5 init];
}

- (_TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(MAFloatVectorWrapper *)&v3 init];
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector);
  v4 = (objc_class *)type metadata accessor for MAFloatVectorWrapper();
  objc_super v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector] = v3;
  v7.receiver = v5;
  v7.super_class = v4;
  swift_bridgeObjectRetain();
  return [(MAFloatVectorWrapper *)&v7 init];
}

- (void)appendFloat:(float)a3
{
  uint64_t v5 = OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector;
  v6 = *(char **)((char *)&self->super.super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector);
  objc_super v7 = self;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v6 = sub_1D169C88C(0, *((void *)v6 + 2) + 1, 1, v6);
  }
  unint64_t v9 = *((void *)v6 + 2);
  unint64_t v8 = *((void *)v6 + 3);
  if (v9 >= v8 >> 1) {
    v6 = sub_1D169C88C((char *)(v8 > 1), v9 + 1, 1, v6);
  }
  *((void *)v6 + 2) = v9 + 1;
  *(float *)&v6[4 * v9 + 32] = a3;
  *(Class *)((char *)&self->super.super.isa + v5) = (Class)v6;

  swift_bridgeObjectRelease();
}

- (void)appendFloats:(const float *)a3 count:(int64_t)a4
{
  uint64_t v7 = OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector;
  unint64_t v9 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector);
  unint64_t v8 = self;
  swift_bridgeObjectRetain();
  sub_1D16631F0((char *)a3, (char *)a4);
  *(Class *)((char *)&self->super.super.isa + v7) = v9;

  swift_bridgeObjectRelease();
}

- (void)appendDoubles:(const double *)a3 count:(int64_t)a4
{
  v6 = self;
  MAMutableFloatVectorWrapper.append(doubles:count:)((uint64_t)a3, a4);
}

- (void)appendVector:(id)a3
{
  (*(void (**)(uint64_t *__return_ptr, _TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper *, SEL))((*MEMORY[0x1E4FBC8C8] & *(void *)a3) + 0x70))(&v10, self, a2);
  uint64_t v5 = v10;
  uint64_t v6 = OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector;
  unint64_t v9 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector);
  id v7 = a3;
  unint64_t v8 = self;
  swift_bridgeObjectRetain();
  sub_1D16633B0(v5);
  *(Class *)((char *)&self->super.super.isa + v6) = v9;

  swift_bridgeObjectRelease();
}

- (void)appendArray:(id)a3
{
  uint64_t v4 = sub_1D17BE130();
  uint64_t v5 = OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector;
  id v7 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector);
  uint64_t v6 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1D16633B0(v4);
  *(Class *)((char *)&self->super.super.isa + v5) = v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)setFloat:(float)a3 atIndex:(int64_t)a4
{
  uint64_t v7 = OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector;
  unint64_t v8 = *(char **)((char *)&self->super.super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector);
  unint64_t v9 = self;
  swift_bridgeObjectRetain();
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    if ((a4 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  unint64_t v8 = sub_1D166762C((uint64_t)v8);
  if (a4 < 0) {
    goto LABEL_8;
  }
LABEL_3:
  if (*((void *)v8 + 2) <= (unint64_t)a4)
  {
LABEL_9:
    __break(1u);
    return;
  }
  *(float *)&v8[4 * a4 + 32] = a3;
  *(Class *)((char *)&self->super.super.isa + v7) = (Class)v8;

  swift_bridgeObjectRelease();
}

- (void)subtractVector:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = self;
  MAMutableFloatVectorWrapper.subtract(_:)(v4);
}

- (void)addVector:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = self;
  MAMutableFloatVectorWrapper.add(_:)(v4);
}

- (void)subtractScalar:(float)a3
{
  uint64_t v4 = self;
  MAMutableFloatVectorWrapper.subtract(_:)(a3);
}

- (void)addScalar:(float)a3
{
  uint64_t v4 = self;
  MAMutableFloatVectorWrapper.add(_:)(a3);
}

- (void)multiplyByScalar:(float)a3
{
  uint64_t v4 = OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector;
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector);
  float v9 = a3;
  v8[2] = &v9;
  uint64_t v6 = self;
  swift_bridgeObjectRetain();
  uint64_t v7 = (objc_class *)sub_1D1665EAC((void (*)(int *__return_ptr, int *))sub_1D16681D8, (uint64_t)v8, v5);
  swift_bridgeObjectRelease();
  *(Class *)((char *)&self->super.super.isa + v4) = v7;

  swift_bridgeObjectRelease();
}

- (void)divideByScalar:(float)a3
{
  uint64_t v4 = self;
  MAMutableFloatVectorWrapper.divide(_:)(a3);
}

- (void)elementwiseMultiplyByWrapper:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = self;
  MAMutableFloatVectorWrapper.elementwiseMultiplyByWrapper(_:)(v4);
}

- (void)elementwiseRaiseToExponent:(float)a3
{
  uint64_t v4 = self;
  MAMutableFloatVectorWrapper.elementwiseRaiseToExponent(_:)(a3);
}

@end