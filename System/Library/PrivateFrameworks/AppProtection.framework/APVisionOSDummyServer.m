@interface APVisionOSDummyServer
+ (id)sharedInstance;
- (APVisionOSDummyServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)dummyServiceConnectionForServiceName:(id)a3;
- (void)abortOngoingAuthWithCompletion:(void *)aBlock;
- (void)authenticateForBundle:(id)a3 interfacePresentationTarget:(id *)a4 completion:(id)a5;
- (void)authenticateForExtensionWithUUID:(id)a3 reasonDescription:(id)a4 completion:(id)a5;
- (void)authenticateUnconditionallyWithReason:(id)a3 completion:(id)a4;
- (void)beginMonitoringForExtensionUUID:(id)a3 monitorUUID:(id)a4;
- (void)beginTransactionForAccessOfBundle:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 transactionUUID:(id)a6 completion:(id)a7;
- (void)endMonitoringForMonitorUUID:(id)a3;
- (void)endTransactionWithUUID:(id)a3 completion:(id)a4;
- (void)extensionRequiresAuthentication:(id)a3 completion:(id)a4;
- (void)getConfiguration:(id)a3;
- (void)getExtensionIsLockedForUUID:(id)a3 completion:(id)a4;
- (void)getIsChallengeCurrentlyRequiredForBundle:(id)a3 completion:(id)a4;
- (void)getPerAppManagedProtectability:(id)a3;
- (void)getStateDumpWithCompletion:(id)a3;
- (void)initiateAuthenticationWithShieldingForBundle:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 completion:(id)a6;
- (void)initiateAuthenticationWithShieldingForBundle:(int)a3 completion:(void *)aBlock;
- (void)setBundleIdentifier:(id)a3 hidden:(BOOL)a4 completion:(id)a5;
- (void)setBundleIdentifier:(id)a3 locked:(BOOL)a4 completion:(id)a5;
@end

@implementation APVisionOSDummyServer

+ (id)sharedInstance
{
  if (qword_2692CA268 != -1) {
    swift_once();
  }
  v2 = (void *)qword_2692CF230;

  return v2;
}

- (id)dummyServiceConnectionForServiceName:(id)a3
{
  uint64_t v4 = sub_247DD2C20();
  id result = (id)sub_247D5C4DC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___APVisionOSDummyServer_serviceInfo), v4, v5);
  if (v9)
  {
    v10 = v7;
    v11 = v8;
    v12 = self;
    id v13 = objc_msgSend(v10, sel_endpoint);
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08D68]), sel_initWithListenerEndpoint_, v13);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_247D5AF88(v6, v7);

  return v9 & 1;
}

- (APVisionOSDummyServer)init
{
  return (APVisionOSDummyServer *)sub_247D5B158();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (void)getConfiguration:(id)a3
{
  uint64_t v4 = (void (**)(void *, id, void))_Block_copy(a3);
  id v5 = objc_allocWithZone((Class)APClientState);
  id v7 = self;
  id v6 = objc_msgSend(v5, sel_init);
  v4[2](v4, v6, 0);

  _Block_release(v4);
}

- (void)getPerAppManagedProtectability:(id)a3
{
  uint64_t v4 = (void (**)(void *, id, void))_Block_copy(a3);
  v8 = self;
  sub_247DBC700(MEMORY[0x263F8EE78]);
  id v5 = objc_allocWithZone((Class)APPerAppManagedProtectability);
  sub_247D3516C(0, (unint64_t *)&qword_2692C9F20);
  id v6 = (void *)sub_247DD2B70();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_initWithPerAppProtectability_, v6);

  v4[2](v4, v7, 0);
  _Block_release(v4);
}

- (void)setBundleIdentifier:(id)a3 hidden:(BOOL)a4 completion:(id)a5
{
}

- (void)setBundleIdentifier:(id)a3 locked:(BOOL)a4 completion:(id)a5
{
}

- (void)initiateAuthenticationWithShieldingForBundle:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 completion:(id)a6
{
  id v7 = _Block_copy(a6);
  v8 = (void (*)(void *, void))v7[2];
  char v9 = self;
  v8(v7, 0);
  _Block_release(v7);
}

- (void)beginTransactionForAccessOfBundle:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 transactionUUID:(id)a6 completion:(id)a7
{
  uint64_t v9 = sub_247DD28F0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v11);
  id v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = _Block_copy(a7);
  sub_247DD28D0();
  v15 = (void (*)(void *, void))v14[2];
  v16 = self;
  v15(v14, 0);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

- (void)endTransactionWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_247DD28F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  sub_247DD28D0();
  uint64_t v12 = (void (*)(void *, void))v11[2];
  id v13 = self;
  v12(v11, 0);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)getIsChallengeCurrentlyRequiredForBundle:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(void *, void *, void))_Block_copy(a4);
  sub_247D3516C(0, (unint64_t *)&qword_2692CA000);
  uint64_t v7 = self;
  uint64_t v6 = (void *)sub_247DD3020();
  v5[2](v5, v6, 0);

  _Block_release(v5);
}

- (void)authenticateUnconditionallyWithReason:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (a3) {
    sub_247DD2C20();
  }
  uint64_t v7 = (void (*)(void *, uint64_t, void))v6[2];
  uint64_t v8 = self;
  v7(v6, 1, 0);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)authenticateForBundle:(id)a3 interfacePresentationTarget:(id *)a4 completion:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = (void (*)(void *, void))v6[2];
  uint64_t v8 = self;
  v7(v6, 0);
  _Block_release(v6);
}

- (void)initiateAuthenticationWithShieldingForBundle:(int)a3 completion:(void *)aBlock
{
  id v5 = _Block_copy(aBlock);
  uint64_t v6 = (void (*)(void *, void))v5[2];
  id v7 = a1;
  v6(v5, 0);
  _Block_release(v5);
}

- (void)abortOngoingAuthWithCompletion:(void *)aBlock
{
  uint64_t v4 = _Block_copy(aBlock);
  id v5 = (void (*)(void *, void))v4[2];
  id v6 = a1;
  v5(v4, 0);
  _Block_release(v4);
}

- (void)getStateDumpWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void *, id, void))_Block_copy(a3);
  id v5 = objc_allocWithZone((Class)APClientState);
  id v6 = self;
  id v7 = objc_msgSend(v5, sel_init);
  id v8 = objc_allocWithZone((Class)APStateDump);
  uint64_t v9 = (objc_class *)_s17AccessListWrapperCMa();
  uint64_t v10 = (char *)objc_allocWithZone(v9);
  *(void *)&v10[OBJC_IVAR____TtCE13AppProtectionCSo11APStateDumpP33_08AD371E34EDC7245D13D99B4228357017AccessListWrapper_accesses] = MEMORY[0x263F8EE78];
  v13.receiver = v10;
  v13.super_class = v9;
  uint64_t v11 = [(APVisionOSDummyServer *)&v13 init];
  id v12 = objc_msgSend(v8, sel_initWithState_accesses_dtoEnabled_, v7, v11, 0);

  v4[2](v4, v12, 0);
  _Block_release(v4);
}

- (void)beginMonitoringForExtensionUUID:(id)a3 monitorUUID:(id)a4
{
  uint64_t v4 = sub_247DD28F0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v4, v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v10);
  id v12 = (char *)&v14 - v11;
  sub_247DD28D0();
  sub_247DD28D0();
  objc_super v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v9, v4);
  v13(v12, v4);
}

- (void)endMonitoringForMonitorUUID:(id)a3
{
  uint64_t v3 = sub_247DD28F0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247DD28D0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

- (void)getExtensionIsLockedForUUID:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_247DD28F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void (**)(void *, void *, void))_Block_copy(a4);
  sub_247DD28D0();
  sub_247D3516C(0, (unint64_t *)&qword_2692CA000);
  id v12 = self;
  objc_super v13 = (void *)sub_247DD3020();
  v11[2](v11, v13, 0);

  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)authenticateForExtensionWithUUID:(id)a3 reasonDescription:(id)a4 completion:(id)a5
{
  uint64_t v8 = sub_247DD28F0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10);
  id v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v13 = _Block_copy(a5);
  sub_247DD28D0();
  if (a4) {
    sub_247DD2C20();
  }
  uint64_t v14 = (void (*)(void *, uint64_t, void))v13[2];
  v15 = self;
  v14(v13, 1, 0);
  _Block_release(v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)extensionRequiresAuthentication:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_247DD28F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  sub_247DD28D0();
  id v12 = (void (*)(void *, uint64_t, void))v11[2];
  objc_super v13 = self;
  v12(v11, 1, 0);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

@end