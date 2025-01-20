@interface BlastDoorSyndicationAction
- (BlastDoorGroupContext)groupContext;
- (BlastDoorSyndicationAction)init;
- (NSString)description;
- (NSString)messagePartGUID;
- (_NSRange)syndicatedMessagePartRange;
- (unint64_t)encodedSyndicationStartDate;
- (unsigned)actionType;
- (unsigned)itemType;
- (unsigned)version;
@end

@implementation BlastDoorSyndicationAction

- (NSString)description
{
  long long v2 = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 104];
  v8[6] = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 88];
  v8[7] = v2;
  v8[8] = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 120];
  long long v3 = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 40];
  v8[2] = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 24];
  v8[3] = v3;
  long long v4 = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 72];
  v8[4] = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 56];
  v8[5] = v4;
  long long v5 = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction);
  v8[1] = v5;
  __int16 v9 = *(_WORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 136];
  sub_1B17B3B5C((uint64_t)v8);
  sub_1B196A850();
  v6 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (unsigned)itemType
{
  unsigned int v2 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction);
  if (v2 > 2) {
    __break(1u);
  }
  return v2;
}

- (unsigned)actionType
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 1);
}

- (unint64_t)encodedSyndicationStartDate
{
  return *(void *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction];
}

- (_NSRange)syndicatedMessagePartRange
{
  unsigned int v2 = (char *)self + OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction;
  NSUInteger v3 = *(void *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 8];
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  uint64_t v4 = *((void *)v2 + 3);
  if (v4 < 0)
  {
LABEL_5:
    __break(1u);
    goto LABEL_6;
  }
  a2 = (SEL)(v4 - v3);
LABEL_6:
  result.length = (NSUInteger)a2;
  result.location = v3;
  return result;
}

- (NSString)messagePartGUID
{
  return (NSString *)sub_1B17A78F0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction);
}

- (BlastDoorGroupContext)groupContext
{
  uint64_t v3 = *(void *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 40];
  uint64_t v2 = *(void *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 48];
  uint64_t v4 = *(void *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 56];
  uint64_t v5 = *(void *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 64];
  uint64_t v6 = *(void *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 72];
  uint64_t v7 = *(void *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 80];
  uint64_t v8 = *(void *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 88];
  uint64_t v9 = *(void *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 104];
  uint64_t v18 = *(void *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 112];
  uint64_t v19 = *(void *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 96];
  unsigned __int8 v17 = self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 120];
  uint64_t v16 = *(void *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 128];
  unsigned __int8 v15 = self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 136];
  v10 = (objc_class *)type metadata accessor for _ObjCGroupContextWrapper();
  v11 = (char *)objc_allocWithZone(v10);
  v12 = &v11[OBJC_IVAR___BlastDoorGroupContext_groupContext];
  *(void *)v12 = v3;
  *((void *)v12 + 1) = v2;
  *((void *)v12 + 2) = v4;
  *((void *)v12 + 3) = v5;
  *((void *)v12 + 4) = v6;
  *((void *)v12 + 5) = v7;
  *((void *)v12 + 6) = v8;
  *((void *)v12 + 7) = v19;
  *((void *)v12 + 8) = v9;
  *((void *)v12 + 9) = v18;
  v12[80] = v17;
  *((void *)v12 + 11) = v16;
  v12[96] = v15;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_1B11E7664(v7, v8);
  v20.receiver = v11;
  v20.super_class = v10;
  swift_bridgeObjectRetain();
  v13 = [(BlastDoorSyndicationAction *)&v20 init];
  return (BlastDoorGroupContext *)v13;
}

- (unsigned)version
{
  return self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 137];
}

- (BlastDoorSyndicationAction)init
{
  _NSRange result = (BlastDoorSyndicationAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v2 = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 104];
  v6[6] = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 88];
  v6[7] = v2;
  v6[8] = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 120];
  __int16 v7 = *(_WORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 136];
  long long v3 = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 40];
  v6[2] = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 24];
  v6[3] = v3;
  long long v4 = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 72];
  v6[4] = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 56];
  v6[5] = v4;
  long long v5 = *(_OWORD *)&self->syndicationAction[OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction + 8];
  v6[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSyndicationAction_syndicationAction);
  v6[1] = v5;
  sub_1B17C6E98((uint64_t)v6);
}

@end