@interface _DPPINEShardResult
- (NSArray)inputShares;
- (NSData)nonce;
- (NSData)publicShare;
- (_DPPINEShardResult)init;
- (_DPPINEShardResult)initWithPublicShare:(id)a3 inputShares:(id)a4 nonce:(id)a5 dimension:(int64_t)a6 chunkLength:(int64_t)a7 chunkLengthNormEquality:(int64_t)a8 l2NormBoundInt:(unint64_t)a9 fractionalBitCount:(int64_t)a10;
- (int64_t)fractionalBitCount;
- (unint64_t)l2NormBoundInt;
- (unsigned)chunkLength;
- (unsigned)chunkLengthNormEquality;
- (unsigned)dimension;
@end

@implementation _DPPINEShardResult

- (NSData)publicShare
{
  return (NSData *)sub_1DC5B3C3C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____DPPINEShardResult_publicShare);
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
  return (NSData *)sub_1DC5B3C3C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____DPPINEShardResult_nonce);
}

- (unsigned)dimension
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____DPPINEShardResult_dimension);
}

- (unsigned)chunkLength
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____DPPINEShardResult_chunkLength);
}

- (unsigned)chunkLengthNormEquality
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____DPPINEShardResult_chunkLengthNormEquality);
}

- (unint64_t)l2NormBoundInt
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPPINEShardResult_l2NormBoundInt);
}

- (int64_t)fractionalBitCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____DPPINEShardResult_fractionalBitCount);
}

- (_DPPINEShardResult)initWithPublicShare:(id)a3 inputShares:(id)a4 nonce:(id)a5 dimension:(int64_t)a6 chunkLength:(int64_t)a7 chunkLengthNormEquality:(int64_t)a8 l2NormBoundInt:(unint64_t)a9 fractionalBitCount:(int64_t)a10
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = sub_1DC5BFAC0();
  uint64_t v18 = v17;

  uint64_t v19 = sub_1DC5BFD50();
  uint64_t v20 = sub_1DC5BFAC0();
  uint64_t v22 = v21;

  return (_DPPINEShardResult *)PINEShim.ShardResult.init(publicShare:inputShares:nonce:dimension:chunkLength:chunkLengthNormEquality:l2NormBoundInt:fractionalBitCount:)(v16, v18, v19, v20, v22, a6, a7, a8, a9, a10);
}

- (_DPPINEShardResult)init
{
  result = (_DPPINEShardResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DC5B3A24(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPPINEShardResult_publicShare), *(void *)&self->publicShare[OBJC_IVAR____DPPINEShardResult_publicShare]);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPPINEShardResult_nonce);
  unint64_t v4 = *(void *)&self->publicShare[OBJC_IVAR____DPPINEShardResult_nonce];
  sub_1DC5B3A24(v3, v4);
}

@end