@interface APExtensionInfoClient
- (_TtC13AppProtection21APExtensionInfoClient)init;
- (void)authenticateForExtensionWithUUID:(id)a3 reasonDescription:(id)a4 completion:(id)a5;
- (void)extensionRequiresAuthentication:(id)a3 completion:(id)a4;
- (void)getExtensionIsLockedForUUID:(id)a3 completion:(id)a4;
@end

@implementation APExtensionInfoClient

- (void)authenticateForExtensionWithUUID:(id)a3 reasonDescription:(id)a4 completion:(id)a5
{
  uint64_t v8 = sub_247DD28F0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  sub_247DD28D0();
  if (a4)
  {
    uint64_t v14 = sub_247DD2C20();
    a4 = v15;
  }
  else
  {
    uint64_t v14 = 0;
  }
  _Block_copy(v13);
  v16 = self;
  sub_247D84844((uint64_t)v12, v14, (uint64_t)a4, (uint64_t)v16, (void (**)(void, void, void))v13);
  _Block_release(v13);
  _Block_release(v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)extensionRequiresAuthentication:(id)a3 completion:(id)a4
{
}

- (void)getExtensionIsLockedForUUID:(id)a3 completion:(id)a4
{
}

- (_TtC13AppProtection21APExtensionInfoClient)init
{
  result = (_TtC13AppProtection21APExtensionInfoClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_247D53450((uint64_t)self + OBJC_IVAR____TtC13AppProtection21APExtensionInfoClient_delegate);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13AppProtection21APExtensionInfoClient_connection);
}

@end