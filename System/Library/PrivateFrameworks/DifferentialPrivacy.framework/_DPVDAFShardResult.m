@interface _DPVDAFShardResult
- (NSArray)inputShares;
- (NSData)nonce;
- (NSData)publicShare;
- (_DPVDAFShardResult)init;
- (_DPVDAFShardResult)initWithPublicShare:(id)a3 inputShares:(id)a4 nonce:(id)a5 dimension:(int64_t)a6 chunkLength:(int64_t)a7;
- (int64_t)chunkLength;
- (int64_t)dimension;
@end

@implementation _DPVDAFShardResult

- (NSData)publicShare
{
  return (NSData *)sub_1DC5B3C3C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____DPVDAFShardResult_publicShare);
}

- (NSArray)inputShares
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DC5BFD40();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSData)nonce
{
  return (NSData *)sub_1DC5B3C3C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____DPVDAFShardResult_nonce);
}

- (int64_t)dimension
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____DPVDAFShardResult_dimension);
}

- (int64_t)chunkLength
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____DPVDAFShardResult_chunkLength);
}

- (_DPVDAFShardResult)initWithPublicShare:(id)a3 inputShares:(id)a4 nonce:(id)a5 dimension:(int64_t)a6 chunkLength:(int64_t)a7
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v17 = sub_1DC5BFAC0();
  uint64_t v19 = v18;

  v20 = (objc_class *)sub_1DC5BFD50();
  uint64_t v21 = sub_1DC5BFAC0();
  uint64_t v23 = v22;

  v24 = (uint64_t *)((char *)self + OBJC_IVAR____DPVDAFShardResult_publicShare);
  uint64_t *v24 = v17;
  v24[1] = v19;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPVDAFShardResult_inputShares) = v20;
  v25 = (uint64_t *)((char *)self + OBJC_IVAR____DPVDAFShardResult_nonce);
  uint64_t *v25 = v21;
  v25[1] = v23;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPVDAFShardResult_dimension) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPVDAFShardResult_chunkLength) = (Class)a7;
  v27.receiver = self;
  v27.super_class = ObjectType;
  return [(_DPVDAFShardResult *)&v27 init];
}

- (_DPVDAFShardResult)init
{
  result = (_DPVDAFShardResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DC5B3A24(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPVDAFShardResult_publicShare), *(void *)&self->publicShare[OBJC_IVAR____DPVDAFShardResult_publicShare]);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPVDAFShardResult_nonce);
  unint64_t v4 = *(void *)&self->publicShare[OBJC_IVAR____DPVDAFShardResult_nonce];
  sub_1DC5B3A24(v3, v4);
}

@end