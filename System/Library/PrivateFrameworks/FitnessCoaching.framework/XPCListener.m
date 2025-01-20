@interface XPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC15FitnessCoaching11XPCListener)init;
- (void)dealloc;
- (void)transportMessage:(unint64_t)a3 data:(NSData *)a4 completion:(id)a5;
- (void)transportRequest:(unint64_t)a3 data:(NSData *)a4 completion:(id)a5;
@end

@implementation XPCListener

- (_TtC15FitnessCoaching11XPCListener)init
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for XPCListener());
  v3 = XPCListener.init(machServiceName:)();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC15FitnessCoaching11XPCListener *)v3;
}

- (void)dealloc
{
  uint64_t v2 = qword_1EBD738C8;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1D3CB9708();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EBD73500);
  v5._object = (void *)0x80000001D3CC0AA0;
  v5._countAndFlagsBits = 0xD00000000000005BLL;
  v6._countAndFlagsBits = 0x6164696C61766E69;
  v6._object = (void *)0xEC00000029286574;
  Logger.trace(file:function:)(v5, v6);
  v7 = *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC15FitnessCoaching11XPCListener_listener);
  objc_msgSend(v7, sel_setDelegate_, 0);
  objc_msgSend(v7, sel_invalidate);
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for XPCListener();
  [(XPCListener *)&v8 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15FitnessCoaching11XPCListener_requiredEntitlements);
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  char v10 = sub_1D3CA6F40(v8, v6);
  if (v10) {
    sub_1D3CA5588(v8);
  }

  return v10 & 1;
}

- (void)transportMessage:(unint64_t)a3 data:(NSData *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_1EBD73530);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D3CB99D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA6B9860;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA6B9868;
  v16[5] = v15;
  v17 = a4;
  v18 = self;
  sub_1D3CA6D94((uint64_t)v11, (uint64_t)&unk_1EA6B9870, (uint64_t)v16);
  swift_release();
}

- (void)transportRequest:(unint64_t)a3 data:(NSData *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_1EBD73530);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D3CB99D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA6B9820;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA6B9830;
  v16[5] = v15;
  v17 = a4;
  v18 = self;
  sub_1D3CA6D94((uint64_t)v11, (uint64_t)&unk_1EA6B9840, (uint64_t)v16);
  swift_release();
}

@end