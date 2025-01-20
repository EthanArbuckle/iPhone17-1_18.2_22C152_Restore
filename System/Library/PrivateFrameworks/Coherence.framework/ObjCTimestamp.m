@interface ObjCTimestamp
- (NSString)description;
- (ObjCReplica)replica;
- (ObjCTimestamp)init;
- (ObjCTimestamp)initWithReplica:(id)a3 counter:(int64_t)a4;
- (int64_t)counter;
@end

@implementation ObjCTimestamp

- (ObjCReplica)replica
{
  v2 = self;
  id v3 = sub_1C4126034();

  return (ObjCReplica *)v3;
}

- (int64_t)counter
{
  v2 = (char *)self + OBJC_IVAR___ObjCTimestamp_timestamp;
  return *(void *)&v2[*(int *)(type metadata accessor for Timestamp(0) + 20)];
}

- (ObjCTimestamp)initWithReplica:(id)a3 counter:(int64_t)a4
{
  uint64_t v7 = type metadata accessor for Timestamp(0);
  uint64_t v8 = v7 - 8;
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (char *)a3 + OBJC_IVAR___ObjCReplica_uuid;
  swift_beginAccess();
  uint64_t v12 = sub_1C4496678();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  uint64_t v13 = *(void *)((char *)a3 + OBJC_IVAR___ObjCReplica_index);
  *(void *)&v10[*(int *)(type metadata accessor for Replica() + 20)] = v13;
  *(void *)&v10[*(int *)(v8 + 28)] = a4;
  sub_1C3F8AD10((uint64_t)v10, (uint64_t)self + OBJC_IVAR___ObjCTimestamp_timestamp, type metadata accessor for Timestamp);
  v14 = (objc_class *)type metadata accessor for ObjCTimestamp(0);
  v17.receiver = self;
  v17.super_class = v14;
  return [(ObjCTimestamp *)&v17 init];
}

- (NSString)description
{
  uint64_t v3 = type metadata accessor for Timestamp(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3F8EFF4((uint64_t)self + OBJC_IVAR___ObjCTimestamp_timestamp, (uint64_t)v6, type metadata accessor for Timestamp);
  uint64_t v7 = self;
  v11[2] = sub_1C43EEA2C();
  v11[3] = v8;
  sub_1C4497268();
  v11[1] = *(void *)&v6[*(int *)(v4 + 28)];
  sub_1C4498088();
  sub_1C4497268();
  swift_bridgeObjectRelease();
  sub_1C4497268();
  sub_1C3F8B168((uint64_t)v6, type metadata accessor for Timestamp);

  uint64_t v9 = (void *)sub_1C4497188();
  swift_bridgeObjectRelease();
  return (NSString *)v9;
}

- (ObjCTimestamp)init
{
  result = (ObjCTimestamp *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end