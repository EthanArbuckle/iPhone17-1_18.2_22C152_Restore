@interface XPCEndpoint
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC22ActivityAwardsServices11XPCEndpoint)init;
- (void)transportEvent:(unint64_t)a3 data:(id)a4;
- (void)transportRequest:(unint64_t)a3 data:(NSData *)a4 completion:(id)a5;
@end

@implementation XPCEndpoint

- (_TtC22ActivityAwardsServices11XPCEndpoint)init
{
  result = (_TtC22ActivityAwardsServices11XPCEndpoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_connection);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1DAE27A38(v7);

  return v9 & 1;
}

- (void)transportRequest:(unint64_t)a3 data:(NSData *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE6FAC0);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1DAE304C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA8FA0F8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA8F9E78;
  v16[5] = v15;
  v17 = a4;
  v18 = self;
  sub_1DAE27868((uint64_t)v11, (uint64_t)&unk_1EA8F9E80, (uint64_t)v16);
  swift_release();
}

- (void)transportEvent:(unint64_t)a3 data:(id)a4
{
  v4 = a4;
  if (a4)
  {
    v5 = self;
    id v6 = v4;
    v4 = (void *)sub_1DAE30120();
    unint64_t v8 = v7;
  }
  else
  {
    uint64_t v9 = self;
    unint64_t v8 = 0xF000000000000000;
  }
  if (qword_1EBE6FC88 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1DAE30250();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EBE6FA98);
  v11._countAndFlagsBits = 0xD000000000000061;
  v11._object = (void *)0x80000001DAE32D50;
  v12._object = (void *)0x80000001DAE32DC0;
  v12._countAndFlagsBits = 0xD000000000000017;
  Logger.trace(file:function:)(v11, v12);
  sub_1DAE11EB0((uint64_t)v4, v8);
}

@end