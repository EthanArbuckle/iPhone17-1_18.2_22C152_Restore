@interface ObjCReplica
- (NSUUID)uuid;
- (ObjCReplica)init;
- (ObjCReplica)initWithUuid:(id)a3 index:(int64_t)a4;
- (int64_t)index;
- (void)setIndex:(int64_t)a3;
- (void)setUuid:(id)a3;
@end

@implementation ObjCReplica

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___ObjCReplica_uuid;
  uint64_t v3 = sub_1C4496678();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

- (int64_t)index
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___ObjCReplica_index);
}

- (NSUUID)uuid
{
  uint64_t v3 = sub_1C4496678();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___ObjCReplica_uuid;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_1C4496608();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v8;
}

- (void)setUuid:(id)a3
{
  uint64_t v4 = sub_1C4496678();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4496628();
  v8 = (char *)self + OBJC_IVAR___ObjCReplica_uuid;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  uint64_t v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();
}

- (void)setIndex:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCReplica_index) = (Class)a3;
}

- (ObjCReplica)initWithUuid:(id)a3 index:(int64_t)a4
{
  uint64_t v6 = sub_1C4496678();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4496628();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)self + OBJC_IVAR___ObjCReplica_uuid, v9, v6);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCReplica_index) = (Class)a4;
  uint64_t v10 = (objc_class *)type metadata accessor for ObjCReplica(0);
  v13.receiver = self;
  v13.super_class = v10;
  uint64_t v11 = [(ObjCReplica *)&v13 init];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (ObjCReplica)init
{
  result = (ObjCReplica *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end