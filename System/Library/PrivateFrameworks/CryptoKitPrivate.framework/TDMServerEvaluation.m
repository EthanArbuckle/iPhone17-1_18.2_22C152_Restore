@interface TDMServerEvaluation
- (NSData)evaluatedElement;
- (NSData)proof;
- (_TtC16CryptoKitPrivate19TDMServerEvaluation)init;
@end

@implementation TDMServerEvaluation

- (NSData)proof
{
  return (NSData *)sub_1DB06255C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate19TDMServerEvaluation_proof);
}

- (NSData)evaluatedElement
{
  return (NSData *)sub_1DB06255C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate19TDMServerEvaluation_evaluatedElement);
}

- (_TtC16CryptoKitPrivate19TDMServerEvaluation)init
{
  result = (_TtC16CryptoKitPrivate19TDMServerEvaluation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DB042664(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate19TDMServerEvaluation_proof), *(void *)&self->proof[OBJC_IVAR____TtC16CryptoKitPrivate19TDMServerEvaluation_proof]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate19TDMServerEvaluation_evaluatedElement);
  unint64_t v4 = *(void *)&self->proof[OBJC_IVAR____TtC16CryptoKitPrivate19TDMServerEvaluation_evaluatedElement];
  sub_1DB042664(v3, v4);
}

@end