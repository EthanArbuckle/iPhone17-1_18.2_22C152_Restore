@interface CKDBackingExplicitCredentialsAccount
+ (id)explicitCredentialsAccountWithEmail:(id)a3 password:(id)a4 recoveryKey:(id)a5 propertyOverrides:(id)a6 overridesByDataclass:(id)a7;
- (ACAccount)ckAccount;
- (ACAccount)fakeCKAccount;
- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6;
- (BOOL)isDataclassEnabled:(id)a3;
- (CKDBackingExplicitCredentialsAccount)initWithAppleAccount:(id)a3 hsa2RecoveryKey:(id)a4 hsa2AccountPassword:(id)a5;
- (NSString)hsa2AccountPassword;
- (NSString)hsa2DevicePassword;
- (NSString)hsa2RecoveryKey;
- (NSString)password;
- (id)cloudKitAuthTokenWithError:(id *)a3;
- (id)iCloudAuthTokenWithError:(id *)a3;
- (int64_t)accountType;
- (void)_setOverridesOnVettingContext:(id)a3;
- (void)renewAuthTokenWithOptions:(id)a3 completionHandler:(id)a4;
- (void)setFakeCKAccount:(id)a3;
- (void)setHsa2DevicePassword:(id)a3;
- (void)updateAccountPropertiesAndSaveAccount:(id)a3;
@end

@implementation CKDBackingExplicitCredentialsAccount

- (int64_t)accountType
{
  return 2;
}

- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = self;
  id v14 = a5;
  CKDBackingExplicitCredentialsAccount.authenticationController(_:shouldContinueWithAuthenticationResults:error:for:)((uint64_t)v14, a4, a5);

  return 0;
}

+ (id)explicitCredentialsAccountWithEmail:(id)a3 password:(id)a4 recoveryKey:(id)a5 propertyOverrides:(id)a6 overridesByDataclass:(id)a7
{
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  if (a5)
  {
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a5 = v17;
  }
  else
  {
    uint64_t v16 = 0;
  }
  if (a6) {
    a6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a7) {
    a7 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v18 = (void *)static CKDBackingExplicitCredentialsAccount.explicitCredentialsAccount(withEmail:password:recoveryKey:propertyOverrides:overridesByDataclass:)(v10, v12, v13, v15, v16, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v18;
}

- (BOOL)isDataclassEnabled:(id)a3
{
  return 1;
}

- (void)renewAuthTokenWithOptions:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v5);
  v7 = self;
  sub_1C4D314F8(v6, v7, (char *)v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)updateAccountPropertiesAndSaveAccount:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  uint64_t v6 = self;
  sub_1C4D2EB24((uint64_t)&unk_1EA3CBF40, v5);
}

- (void)_setOverridesOnVettingContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CKDBackingExplicitCredentialsAccount.setOverrides(on:)(v4);
}

- (ACAccount)ckAccount
{
  v2 = self;
  id v3 = CKDBackingExplicitCredentialsAccount.ckAccount.getter();

  return (ACAccount *)v3;
}

- (NSString)password
{
  v2 = self;
  CKDBackingExplicitCredentialsAccount.password.getter();
  uint64_t v4 = v3;
  uint64_t v6 = v5;

  v7 = (void *)MEMORY[0x1C87879B0](v4, v6);
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (id)cloudKitAuthTokenWithError:(id *)a3
{
  return sub_1C4D348A8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))CKDBackingExplicitCredentialsAccount.cloudKitAuthToken());
}

- (id)iCloudAuthTokenWithError:(id *)a3
{
  return sub_1C4D348A8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))CKDBackingExplicitCredentialsAccount.iCloudAuthToken());
}

- (CKDBackingExplicitCredentialsAccount)initWithAppleAccount:(id)a3 hsa2RecoveryKey:(id)a4 hsa2AccountPassword:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKDBackingExplicitCredentialsAccount;
  unint64_t v11 = [(CKDBackingAccount *)&v14 initWithAppleAccount:a3];
  unint64_t v12 = v11;
  if (v9 && v11)
  {
    objc_storeStrong((id *)&v11->_hsa2RecoveryKey, a4);
    objc_storeStrong((id *)&v12->_hsa2AccountPassword, a5);
  }

  return v12;
}

- (ACAccount)fakeCKAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFakeCKAccount:(id)a3
{
}

- (NSString)hsa2DevicePassword
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHsa2DevicePassword:(id)a3
{
}

- (NSString)hsa2RecoveryKey
{
  return self->_hsa2RecoveryKey;
}

- (NSString)hsa2AccountPassword
{
  return self->_hsa2AccountPassword;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hsa2AccountPassword, 0);
  objc_storeStrong((id *)&self->_hsa2RecoveryKey, 0);
  objc_storeStrong((id *)&self->_hsa2DevicePassword, 0);
  objc_storeStrong((id *)&self->_fakeCKAccount, 0);
}

@end