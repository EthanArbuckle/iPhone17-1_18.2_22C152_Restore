@interface ASXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC21ActivitySharingClient13ASXPCListener)init;
- (void)dealloc;
- (void)transportRequest:(int64_t)a3 data:(id)a4 completion:(id)a5;
@end

@implementation ASXPCListener

- (_TtC21ActivitySharingClient13ASXPCListener)init
{
  sub_2474B0F50();
  id v2 = objc_allocWithZone((Class)type metadata accessor for ASXPCListener());
  v3 = ASXPCListener.init(machServiceName:)();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC21ActivitySharingClient13ASXPCListener *)v3;
}

- (void)dealloc
{
  uint64_t v2 = qword_26B12CCD0;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2474B0EC0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B12CCE8);
  sub_24743FD94(0xD000000000000063, 0x80000002474B70D0, 0x6164696C61766E69, 0xEC00000029286574);
  v5 = *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC21ActivitySharingClient13ASXPCListener_listener);
  objc_msgSend(v5, sel_setDelegate_, 0);
  objc_msgSend(v5, sel_invalidate);
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for ASXPCListener();
  [(ASXPCListener *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC21ActivitySharingClient13ASXPCListener_requiredEntitlements);
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  char v10 = sub_247483FA8(v8, v6);
  if (v10) {
    sub_2474830F0(v8);
  }

  return v10 & 1;
}

- (void)transportRequest:(int64_t)a3 data:(id)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12CC80);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = self;
  if (a4)
  {
    id v14 = a4;
    a4 = (id)sub_2474B0BC0();
    unint64_t v16 = v15;
  }
  else
  {
    unint64_t v16 = 0xF000000000000000;
  }
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v12;
  if (qword_26B12CCD0 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_2474B0EC0();
  __swift_project_value_buffer(v18, (uint64_t)qword_26B12CCE8);
  sub_24743FD94(0xD000000000000063, 0x80000002474B70D0, 0xD000000000000024, 0x80000002474B7020);
  uint64_t v19 = sub_2474B1110();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v11, 1, 1, v19);
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = self;
  v20[5] = a3;
  v20[6] = a4;
  v20[7] = v16;
  v20[8] = sub_24747DBEC;
  v20[9] = v17;
  v21 = self;
  sub_247446DC4((uint64_t)a4, v16);
  swift_retain();
  sub_24747D41C((uint64_t)v11, (uint64_t)&unk_269251240, (uint64_t)v20);
  swift_release();
  swift_release();
  sub_24743E498((uint64_t)a4, v16);
}

@end