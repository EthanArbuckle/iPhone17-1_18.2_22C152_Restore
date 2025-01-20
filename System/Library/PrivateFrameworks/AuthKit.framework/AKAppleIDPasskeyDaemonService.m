@interface AKAppleIDPasskeyDaemonService
- (AKAppleIDPasskeyDaemonService)init;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (NSString)serviceName;
- (Protocol)exportedProtocol;
- (void)appleIDPasskeyStatusWithContext:(AKAppleIDPasskeySetupContext *)a3 completion:(id)a4;
- (void)configureExportedInterface:(id)a3;
- (void)setupAppleIDPasskeyWithContext:(AKAppleIDPasskeySetupContext *)a3 completion:(id)a4;
- (void)unenrollAppleIDPasskeyWithContext:(AKAppleIDPasskeySetupContext *)a3 completion:(id)a4;
- (void)verifyAppleIDPasskeyWithContext:(AKAppleIDPasskeySetupContext *)a3 completion:(id)a4;
@end

@implementation AKAppleIDPasskeyDaemonService

- (NSString)serviceName
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (Protocol)exportedProtocol
{
  return (Protocol *)&OBJC_PROTOCOL___AKAppleIDPasskeyDaemonProtocol;
}

- (void)configureExportedInterface:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s3akd27AppleIDPasskeyDaemonServiceC26configureExportedInterfaceyySo14NSXPCInterfaceCF_0();
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AppleIDPasskeyDaemonService();
  id v4 = a3;
  v5 = (char *)v11.receiver;
  BOOL v6 = [(AKAppleIDPasskeyDaemonService *)&v11 shouldAcceptNewConnection:v4];
  if (v6)
  {
    id v7 = objc_allocWithZone((Class)AKClient);
    id v8 = objc_msgSend(v7, "initWithConnection:", v4, v11.receiver, v11.super_class);
    v9 = *(char **)&v5[OBJC_IVAR___AKAppleIDPasskeyDaemonService_client];
    *(void *)&v5[OBJC_IVAR___AKAppleIDPasskeyDaemonService_client] = v8;

    v5 = v9;
  }
  else
  {
  }
  return v6;
}

- (AKAppleIDPasskeyDaemonService)init
{
  *(void *)&self->AAFService_opaque[OBJC_IVAR___AKAppleIDPasskeyDaemonService_client] = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppleIDPasskeyDaemonService();
  return [(AKAppleIDPasskeyDaemonService *)&v3 init];
}

- (void).cxx_destruct
{
}

- (void)setupAppleIDPasskeyWithContext:(AKAppleIDPasskeySetupContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  objc_super v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100270ED0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100270ED8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100270EE0, (uint64_t)v14);
  swift_release();
}

- (void)verifyAppleIDPasskeyWithContext:(AKAppleIDPasskeySetupContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  objc_super v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100270EB0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100270EB8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100270EC0, (uint64_t)v14);
  swift_release();
}

- (void)unenrollAppleIDPasskeyWithContext:(AKAppleIDPasskeySetupContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  objc_super v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100270E90;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100270E98;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100270EA0, (uint64_t)v14);
  swift_release();
}

- (void)appleIDPasskeyStatusWithContext:(AKAppleIDPasskeySetupContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  objc_super v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100270E78;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10026FD30;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_1002701D0, (uint64_t)v14);
  swift_release();
}

@end