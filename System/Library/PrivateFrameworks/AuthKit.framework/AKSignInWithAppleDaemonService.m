@interface AKSignInWithAppleDaemonService
- (AKSignInWithAppleDaemonService)init;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (NSString)serviceName;
- (Protocol)exportedProtocol;
- (void)cancelAppIconRequestForClientID:(NSString *)a3 completion:(id)a4;
- (void)configureExportedInterface:(id)a3;
- (void)deleteAllItemsFromDepartedGroupWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4;
- (void)fetchAccountsWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4;
- (void)fetchAppIconForClientID:(NSString *)a3 iconSize:(CGSize)a4 completion:(id)a5;
- (void)fetchEULAForClientID:(NSString *)a3 completion:(id)a4;
- (void)fetchSharedGroupsWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4;
- (void)fetchSignInWithApplePrivateEmailCountWithCompletion:(id)a3;
- (void)leaveGroupWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4;
- (void)participantRemovedWithContext:(AKSignInWithAppleRequestContext *)a3 participantID:(NSString *)a4 completion:(id)a5;
- (void)performHealthCheckWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4;
- (void)performTokenRotationWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4;
- (void)revokeAcccountWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4;
- (void)shareAccountWithContext:(AKSignInWithAppleRequestContext *)a3 withGroup:(AKSignInWithAppleAccountShareInfo *)a4 completion:(id)a5;
- (void)unshareAccountWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4;
@end

@implementation AKSignInWithAppleDaemonService

- (NSString)serviceName
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (Protocol)exportedProtocol
{
  return (Protocol *)&OBJC_PROTOCOL___AKSignInWithAppleDaemonProtocol;
}

- (void)configureExportedInterface:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s3akd28SignInWithAppleDaemonServiceC26configureExportedInterfaceyySo14NSXPCInterfaceCF_0();
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SignInWithAppleDaemonService();
  id v4 = a3;
  v5 = (char *)v11.receiver;
  BOOL v6 = [(AKSignInWithAppleDaemonService *)&v11 shouldAcceptNewConnection:v4];
  if (v6)
  {
    id v7 = objc_allocWithZone((Class)AKClient);
    id v8 = objc_msgSend(v7, "initWithConnection:", v4, v11.receiver, v11.super_class);
    v9 = *(char **)&v5[OBJC_IVAR___AKSignInWithAppleDaemonService_client];
    *(void *)&v5[OBJC_IVAR___AKSignInWithAppleDaemonService_client] = v8;

    v5 = v9;
  }
  else
  {
  }
  return v6;
}

- (AKSignInWithAppleDaemonService)init
{
  *(void *)&self->AAFService_opaque[OBJC_IVAR___AKSignInWithAppleDaemonService_client] = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SignInWithAppleDaemonService();
  return [(AKSignInWithAppleDaemonService *)&v3 init];
}

- (void).cxx_destruct
{
}

- (void)fetchAccountsWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4
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
  v13[4] = &unk_1002720F0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1002720F8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100272100, (uint64_t)v14);
  swift_release();
}

- (void)fetchEULAForClientID:(NSString *)a3 completion:(id)a4
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
  v13[4] = &unk_1002720D0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1002720D8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_1002720E0, (uint64_t)v14);
  swift_release();
}

- (void)revokeAcccountWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4
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
  v13[4] = &unk_1002720B0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1002720B8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_1002720C0, (uint64_t)v14);
  swift_release();
}

- (void)fetchAppIconForClientID:(NSString *)a3 iconSize:(CGSize)a4 completion:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v10 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = (CGFloat *)swift_allocObject();
  *((void *)v14 + 2) = a3;
  v14[3] = width;
  v14[4] = height;
  *((void *)v14 + 5) = v13;
  *((void *)v14 + 6) = self;
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100272090;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100272098;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_1001538E0((uint64_t)v12, (uint64_t)&unk_1002720A0, (uint64_t)v17);
  swift_release();
}

- (void)cancelAppIconRequestForClientID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100272070;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100272078;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100272080, (uint64_t)v14);
  swift_release();
}

- (void)shareAccountWithContext:(AKSignInWithAppleRequestContext *)a3 withGroup:(AKSignInWithAppleAccountShareInfo *)a4 completion:(id)a5
{
  uint64_t v9 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100272050;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100272058;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1001538E0((uint64_t)v11, (uint64_t)&unk_100272060, (uint64_t)v16);
  swift_release();
}

- (void)unshareAccountWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100272030;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100272038;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100272040, (uint64_t)v14);
  swift_release();
}

- (void)leaveGroupWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100272010;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100272018;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100272020, (uint64_t)v14);
  swift_release();
}

- (void)deleteAllItemsFromDepartedGroupWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100272000;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100271DD8;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100271DE0, (uint64_t)v14);
  swift_release();
}

- (void)participantRemovedWithContext:(AKSignInWithAppleRequestContext *)a3 participantID:(NSString *)a4 completion:(id)a5
{
  uint64_t v9 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100271FF0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100271DB8;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1001538E0((uint64_t)v11, (uint64_t)&unk_100271DC0, (uint64_t)v16);
  swift_release();
}

- (void)fetchSharedGroupsWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100271FD0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100271FD8;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100271FE0, (uint64_t)v14);
  swift_release();
}

- (void)performTokenRotationWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100271FB0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100271FB8;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100271FC0, (uint64_t)v14);
  swift_release();
}

- (void)performHealthCheckWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100271F90;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100270080;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100271FA0, (uint64_t)v14);
  swift_release();
}

- (void)fetchSignInWithApplePrivateEmailCountWithCompletion:(id)a3
{
  uint64_t v5 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100271F50;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10026FD30;
  v12[5] = v11;
  v13 = self;
  sub_1001538E0((uint64_t)v7, (uint64_t)&unk_1002701D0, (uint64_t)v12);
  swift_release();
}

@end