@interface Service
- (_TtC19ExtensionFoundation7Service)init;
- (void)beginExtensionsQuery:(id)a3 listenerEndpoint:(id)a4 reply:(id)a5;
- (void)extensionsWith:(id)a3 reply:(id)a4;
- (void)invalidateLaunchAssertionsForExtensionAuditToken:(id *)a3 reply:(id)a4;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)photoServiceAuthorizationStatusForExtensionUUID:(id)a3 completion:(id)a4;
- (void)prepareWithLaunchConfiguration:(id)a3 reply:(id)a4;
@end

@implementation Service

- (void)prepareWithLaunchConfiguration:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_191F319E4(v7, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)invalidateLaunchAssertionsForExtensionAuditToken:(id *)a3 reply:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = self;
  sub_191F322F0((uint64_t)sub_191F35668, v6);

  swift_release();
}

- (_TtC19ExtensionFoundation7Service)init
{
  uint64_t v3 = OBJC_IVAR____TtC19ExtensionFoundation7Service_discoveryController;
  id v4 = objc_allocWithZone((Class)type metadata accessor for _EXDiscoveryController());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  uint64_t v6 = OBJC_IVAR____TtC19ExtensionFoundation7Service_sigtermSource;
  *(Class *)((char *)&v5->super.isa + v6) = (Class)sub_191F83650();

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for Service();
  return [(Service *)&v8 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_191F84E94(v8);

  swift_unknownObjectRelease();
}

- (void)extensionsWith:(id)a3 reply:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = (char *)a3;
  id v8 = self;
  sub_191F85644(v7, (uint64_t)v8, v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)beginExtensionsQuery:(id)a3 listenerEndpoint:(id)a4 reply:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_191F85C9C(v9, (uint64_t)v10, (char *)v11, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)photoServiceAuthorizationStatusForExtensionUUID:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_191FB9C68();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  sub_191FB9C28();
  _Block_copy(v10);
  v11 = self;
  sub_191F8636C((uint64_t)v9, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end