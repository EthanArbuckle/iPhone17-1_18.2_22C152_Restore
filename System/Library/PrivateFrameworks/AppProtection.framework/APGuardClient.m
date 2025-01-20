@interface APGuardClient
- (_TtC13AppProtection13APGuardClient)init;
- (void)abortOngoingAuthWithCompletion:(id)a3;
- (void)authenticateForBundle:(id)a3 completion:(id)a4;
- (void)authenticateForBundle:(id)a3 interfacePresentationTarget:(id *)a4 completion:(id)a5;
- (void)authenticateForShieldUnlockOfBundle:(id)a3 completion:(id)a4;
- (void)authenticateUnconditionallyWithCompletion:(id)a3;
- (void)authenticateUnconditionallyWithReason:(id)a3 completion:(id)a4;
- (void)beginTransactionForAccessOfBundle:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 transactionUUID:(id)a6 completion:(id)a7;
- (void)endTransactionWithUUID:(id)a3 completion:(id)a4;
- (void)getIsChallengeCurrentlyRequiredForBundle:(id)a3 completion:(id)a4;
- (void)initiateAuthenticationWithShieldingForBundle:(id)a3 completion:(id)a4;
- (void)initiateAuthenticationWithShieldingForBundle:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 completion:(id)a6;
- (void)noteAllScenesDismissedForBundleID:(id)a3 completion:(id)a4;
@end

@implementation APGuardClient

- (void)initiateAuthenticationWithShieldingForBundle:(id)a3 completion:(id)a4
{
}

- (void)authenticateForBundle:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_247DD2C20();
  uint64_t v8 = v7;
  memset(v10, 0, sizeof(v10));
  char v11 = 1;
  _Block_copy(v5);
  v9 = self;
  sub_247D6CD44(v6, v8, 0, 0, (uint64_t)v10, (uint64_t)v9, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)initiateAuthenticationWithShieldingForBundle:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = sub_247DD2C20();
  uint64_t v12 = v11;
  _Block_copy(v9);
  v13 = self;
  sub_247D6D06C(v10, v12, (uint64_t)a4, a5, (uint64_t)v13, (void (**)(void, void))v9);
  _Block_release(v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (void)getIsChallengeCurrentlyRequiredForBundle:(id)a3 completion:(id)a4
{
}

- (void)beginTransactionForAccessOfBundle:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 transactionUUID:(id)a6 completion:(id)a7
{
  uint64_t v11 = sub_247DD28F0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11, v13);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  uint64_t v17 = sub_247DD2C20();
  uint64_t v19 = v18;
  sub_247DD28D0();
  _Block_copy(v16);
  v20 = self;
  sub_247D6D600(v17, v19, (uint64_t)a4, a5, (uint64_t)v15, (uint64_t)v20, (void (**)(void, void))v16);
  _Block_release(v16);
  _Block_release(v16);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
}

- (void)endTransactionWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_247DD28F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  sub_247DD28D0();
  _Block_copy(v11);
  uint64_t v12 = self;
  sub_247D6D8C8((uint64_t)v10, (uint64_t)v12, (void (**)(void, void))v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)authenticateUnconditionallyWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_247D6DB70(0, 0, (uint64_t)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)authenticateUnconditionallyWithReason:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (a3)
  {
    uint64_t v7 = sub_247DD2C20();
    a3 = v8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  _Block_copy(v6);
  uint64_t v9 = self;
  sub_247D6DB70(v7, (uint64_t)a3, (uint64_t)v9, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)authenticateForShieldUnlockOfBundle:(id)a3 completion:(id)a4
{
}

- (void)authenticateForBundle:(id)a3 interfacePresentationTarget:(id *)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_247DD2C20();
  uint64_t v10 = v9;
  if (a4)
  {
    long long v11 = *(_OWORD *)a4->var0;
    long long v12 = *(_OWORD *)&a4->var0[4];
  }
  else
  {
    long long v11 = 0uLL;
    long long v12 = 0uLL;
  }
  v14[0] = v11;
  v14[1] = v12;
  BOOL v15 = a4 == 0;
  _Block_copy(v7);
  uint64_t v13 = self;
  sub_247D6CD44(v8, v10, 0, 0, (uint64_t)v14, (uint64_t)v13, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)abortOngoingAuthWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v7[2] = sub_247D6F83C;
  v7[3] = v5;
  uint64_t v6 = self;
  sub_247D629F8((void (*)(id))sub_247D6F874, (uint64_t)v7, (void (*)(unsigned char *))sub_247D64C60);

  swift_release();
}

- (void)noteAllScenesDismissedForBundleID:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_247DD2C20();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  uint64_t v9 = sub_247D69074;
  uint64_t v10 = v6;
  uint64_t v7 = self;
  sub_247D629F8((void (*)(id))sub_247D6907C, (uint64_t)v8, (void (*)(unsigned char *))sub_247D69084);

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC13AppProtection13APGuardClient)init
{
  result = (_TtC13AppProtection13APGuardClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC13AppProtection13APGuardClient_delegate;
  sub_247D53450((uint64_t)v3);
}

@end