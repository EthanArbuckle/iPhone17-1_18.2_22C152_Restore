@interface XPCEndpointProvider
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC22ActivityAwardsServices19XPCEndpointProvider)init;
- (void)createEndpointNamed:(NSString *)a3 completion:(id)a4;
@end

@implementation XPCEndpointProvider

- (_TtC22ActivityAwardsServices19XPCEndpointProvider)init
{
  return (_TtC22ActivityAwardsServices19XPCEndpointProvider *)XPCEndpointProvider.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1DAE18690(v7);

  return v9 & 1;
}

- (void)createEndpointNamed:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE6FAC0);
  MEMORY[0x1F4188790](v7 - 8);
  char v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1DAE304C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA8F9E70;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA8F9E78;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1DAE27868((uint64_t)v9, (uint64_t)&unk_1EA8F9E80, (uint64_t)v14);
  swift_release();
}

@end