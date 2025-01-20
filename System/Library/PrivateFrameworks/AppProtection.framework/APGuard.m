@interface APGuard
+ (id)sharedGuard;
- (APGuard)init;
- (BOOL)authenticateSyncForSubject:(id)a3 error:(id *)a4;
- (BOOL)authenticateSyncUnconditionallyWithError:(id *)a3;
- (BOOL)authenticateSyncUnconditionallyWithReason:(id)a3 error:(id *)a4;
- (BOOL)extensionRequiresAuthentication:(id)a3;
- (BOOL)initiateSyncAuthenticationWithShieldingForSubject:(id)a3 error:(id *)a4;
- (BOOL)initiateSyncAuthenticationWithShieldingForSubject:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 error:(id *)a6;
- (void)abortOngoingAuthWithCompletion:(id)a3;
- (void)authenticateForExtension:(id)a3 completion:(id)a4;
- (void)authenticateForExtension:(id)a3 reasonDescription:(id)a4 completion:(id)a5;
- (void)authenticateForShieldDismissalForSubject:(id)a3 completion:(id)a4;
- (void)authenticateForSubject:(id)a3 completion:(id)a4;
- (void)authenticateForSubject:(id)a3 interfacePresentationTarget:(id *)a4 completion:(id)a5;
- (void)authenticateForSubject:(id)a3 relayingAuditToken:(BOOL)a4 completion:(id)a5;
- (void)authenticateUnconditionallyWithCompletion:(id)a3;
- (void)authenticateUnconditionallyWithReason:(id)a3 completion:(id)a4;
- (void)getIsChallengeCurrentlyRequiredForSubject:(id)a3 completion:(id)a4;
- (void)initiateAuthenticationWithShieldingForSubject:(id)a3 completion:(id)a4;
- (void)initiateAuthenticationWithShieldingForSubject:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 completion:(id)a6;
- (void)noteAllScenesDismissedForBundleID:(id)a3 completion:(id)a4;
@end

@implementation APGuard

+ (id)sharedGuard
{
  if (qword_26B138C48 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B138C50;
  return v2;
}

- (void)authenticateForShieldDismissalForSubject:(id)a3 completion:(id)a4
{
}

- (void)authenticateForExtension:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_247D727AC(v8, 0, 0, (void (**)(char *, uint64_t))sub_247D6F838, v7);

  swift_release();
}

- (void)authenticateForExtension:(id)a3 reasonDescription:(id)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_247DD2C20();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  id v12 = a3;
  v13 = self;
  sub_247D727AC(v12, v8, v10, (void (**)(char *, uint64_t))sub_247D68F44, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (BOOL)extensionRequiresAuthentication:(id)a3
{
  id v4 = a3;
  v5 = self;
  char v6 = sub_247D74964(v4);

  return v6 & 1;
}

- (APGuard)init
{
  v3.receiver = self;
  v3.super_class = (Class)APGuard;
  return [(APGuard *)&v3 init];
}

- (void)initiateAuthenticationWithShieldingForSubject:(id)a3 completion:(id)a4
{
}

- (void)authenticateForSubject:(id)a3 completion:(id)a4
{
  char v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_247D76764(v8, (uint64_t)sub_247D6F838, v7);

  swift_release();
}

- (void)authenticateForSubject:(id)a3 relayingAuditToken:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  uint64_t v11 = self;
  long long v12 = 0uLL;
  long long v13 = 0uLL;
  if (v5)
  {
    v14 = (long long *)APGetAuditTokenForSelf();
    if (!v14)
    {
      __break(1u);
      return;
    }
    long long v12 = *v14;
    long long v13 = v14[1];
  }
  v15[0] = v12;
  v15[1] = v13;
  BOOL v16 = !v5;
  sub_247D7AD2C(v10, (uint64_t)v15, (uint64_t)sub_247D6F838, v9);

  swift_release();
}

- (void)initiateAuthenticationWithShieldingForSubject:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 completion:(id)a6
{
  unint64_t v9 = *(void *)a4->var0;
  unint64_t v10 = *(void *)&a4->var0[2];
  unint64_t v11 = *(void *)&a4->var0[4];
  unint64_t v12 = *(void *)&a4->var0[6];
  long long v13 = _Block_copy(a6);
  _Block_copy(v13);
  id v14 = a3;
  v15 = self;
  sub_247D7B0C8(v14, v9, v10, v11, v12, a5, v13);
  _Block_release(v13);
  _Block_release(v13);
}

- (void)getIsChallengeCurrentlyRequiredForSubject:(id)a3 completion:(id)a4
{
  char v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  unint64_t v9 = self;
  sub_247D7B7D8(v8, sub_247D6E4DC, v7);

  swift_release();
}

- (void)authenticateUnconditionallyWithCompletion:(id)a3
{
}

- (void)authenticateUnconditionallyWithReason:(id)a3 completion:(id)a4
{
}

- (BOOL)initiateSyncAuthenticationWithShieldingForSubject:(id)a3 error:(id *)a4
{
  return sub_247D77960(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_247D7BF64);
}

- (BOOL)authenticateSyncForSubject:(id)a3 error:(id *)a4
{
  return sub_247D77960(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_247D7C240);
}

- (BOOL)initiateSyncAuthenticationWithShieldingForSubject:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)a4->var0;
  uint64_t v9 = *(void *)&a4->var0[2];
  uint64_t v10 = *(void *)&a4->var0[4];
  unint64_t v11 = *(void *)&a4->var0[6];
  id v12 = a3;
  long long v13 = self;
  sub_247D7C464(v12, v8, v9, v10, v11, a5);

  return 1;
}

- (BOOL)authenticateSyncUnconditionallyWithError:(id *)a3
{
  return 1;
}

- (BOOL)authenticateSyncUnconditionallyWithReason:(id)a3 error:(id *)a4
{
  sub_247DD2C20();
  BOOL v5 = self;
  sub_247D7CA30();
  swift_bridgeObjectRelease();

  return 1;
}

- (void)authenticateForSubject:(id)a3 interfacePresentationTarget:(id *)a4 completion:(id)a5
{
  long long v13 = *(_OWORD *)a4->var0;
  uint64_t v7 = *(void *)&a4->var0[4];
  uint64_t v8 = *(void *)&a4->var0[6];
  uint64_t v9 = _Block_copy(a5);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  long long v14 = v13;
  uint64_t v15 = v7;
  uint64_t v16 = v8;
  char v17 = 0;
  id v11 = a3;
  id v12 = self;
  sub_247D7AD2C(v11, (uint64_t)&v14, (uint64_t)sub_247D6F838, v10);

  swift_release();
}

- (void)abortOngoingAuthWithCompletion:(id)a3
{
}

- (void)noteAllScenesDismissedForBundleID:(id)a3 completion:(id)a4
{
}

@end