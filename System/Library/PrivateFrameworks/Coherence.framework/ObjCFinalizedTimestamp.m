@interface ObjCFinalizedTimestamp
- (BOOL)isEqual:(id)a3;
- (BOOL)isGreaterThanTimestamp:(id)a3;
- (NSString)description;
- (ObjCFinalizedTimestamp)init;
- (ObjCFinalizedTimestamp)initWithReplica:(id)a3 counter:(int64_t)a4;
- (ObjCReplica)replica;
- (int64_t)counter;
- (int64_t)hash;
@end

@implementation ObjCFinalizedTimestamp

- (ObjCReplica)replica
{
  uint64_t v3 = sub_1C4496678();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for FinalizedTimestamp(0);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3FB77C0((uint64_t)self + OBJC_IVAR___ObjCFinalizedTimestamp_timestamp, (uint64_t)v9, type metadata accessor for FinalizedTimestamp);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v9, v3);
  v10 = (objc_class *)type metadata accessor for ObjCReplica(0);
  v11 = (char *)objc_allocWithZone(v10);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(&v11[OBJC_IVAR___ObjCReplica_uuid], v6, v3);
  *(void *)&v11[OBJC_IVAR___ObjCReplica_index] = 0;
  v15.receiver = v11;
  v15.super_class = v10;
  v12 = self;
  v13 = [(ObjCFinalizedTimestamp *)&v15 init];
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (ObjCReplica *)v13;
}

- (int64_t)counter
{
  v2 = (char *)self + OBJC_IVAR___ObjCFinalizedTimestamp_timestamp;
  return *(void *)&v2[*(int *)(type metadata accessor for FinalizedTimestamp(0) + 20)];
}

- (ObjCFinalizedTimestamp)initWithReplica:(id)a3 counter:(int64_t)a4
{
  uint64_t v7 = type metadata accessor for FinalizedTimestamp(0);
  uint64_t v8 = v7 - 8;
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (char *)a3 + OBJC_IVAR___ObjCReplica_uuid;
  swift_beginAccess();
  uint64_t v12 = sub_1C4496678();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  *(void *)&v10[*(int *)(v8 + 28)] = a4;
  sub_1C3F8AEB0((uint64_t)v10, (uint64_t)self + OBJC_IVAR___ObjCFinalizedTimestamp_timestamp, type metadata accessor for FinalizedTimestamp);
  v13 = (objc_class *)type metadata accessor for ObjCFinalizedTimestamp(0);
  v16.receiver = self;
  v16.super_class = v13;
  return [(ObjCFinalizedTimestamp *)&v16 init];
}

- (BOOL)isGreaterThanTimestamp:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_1C43A50A8((uint64_t)v4);

  return self & 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1C4497BA8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_1C43A5230((uint64_t)v8);

  sub_1C3F962E0((uint64_t)v8, (uint64_t *)&unk_1EA39AE20);
  return v6 & 1;
}

- (int64_t)hash
{
  uint64_t v3 = type metadata accessor for FinalizedTimestamp(0);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3FB77C0((uint64_t)self + OBJC_IVAR___ObjCFinalizedTimestamp_timestamp, (uint64_t)v5, type metadata accessor for FinalizedTimestamp);
  sub_1C44985F8();
  char v6 = self;
  sub_1C4496638();
  sub_1C4498608();
  int64_t v7 = sub_1C4498628();
  sub_1C3FB7698((uint64_t)v5, type metadata accessor for FinalizedTimestamp);

  return v7;
}

- (NSString)description
{
  uint64_t v3 = type metadata accessor for FinalizedTimestamp(0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3FB77C0((uint64_t)self + OBJC_IVAR___ObjCFinalizedTimestamp_timestamp, (uint64_t)v5, type metadata accessor for FinalizedTimestamp);
  char v6 = self;
  FinalizedTimestamp.description.getter();
  sub_1C3FB7698((uint64_t)v5, type metadata accessor for FinalizedTimestamp);

  int64_t v7 = (void *)sub_1C4497188();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (ObjCFinalizedTimestamp)init
{
  result = (ObjCFinalizedTimestamp *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end