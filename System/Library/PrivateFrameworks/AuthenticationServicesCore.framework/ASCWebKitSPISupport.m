@interface ASCWebKitSPISupport
+ (BOOL)arePasskeysDisallowedForRelyingParty:(id)a3;
+ (BOOL)canCurrentProcessAccessPasskeysForRelyingParty:(id)a3;
+ (BOOL)shouldApplyWorkaroundFor134591531;
+ (BOOL)shouldUseAlternateCredentialStore;
+ (BOOL)shouldUseAlternateKeychainAttribute;
+ (id)alternateLargeBlobIfNecessaryForRelyingParty:(id)a3 clientDataHash:(id)a4;
+ (id)asTransportsFrom:(id)a3;
+ (id)entepriseAttestationIdentityPersistentReferenceForRelyingParty:(id)a3;
+ (id)wkTransportsFrom:(id)a3;
+ (void)getArePasskeysDisallowedForRelyingParty:(id)a3 withCompletionHandler:(id)a4;
+ (void)getCanCurrentProcessAccessPasskeysForRelyingParty:(id)a3 withCompletionHandler:(id)a4;
+ (void)getClientCapabilitiesForRelyingParty:(NSString *)a3 withCompletionHandler:(id)a4;
+ (void)getShouldUseAlternateCredentialStoreWithCompletionHandler:(id)a3;
+ (void)resetCredentialStore;
+ (void)setShouldUseAlternateCredentialStore:(BOOL)a3;
@end

@implementation ASCWebKitSPISupport

+ (BOOL)shouldUseAlternateCredentialStore
{
  v2 = getpwnam("_securityagent");
  if (v2) {
    int pw_uid = v2->pw_uid;
  }
  else {
    int pw_uid = 92;
  }
  if (getuid() == pw_uid) {
    return 0;
  }
  if (![MEMORY[0x263F662A0] isInternalInstall]) {
    return 1;
  }
  v5 = [MEMORY[0x263F08AB0] processInfo];
  v6 = [v5 processName];
  if (([v6 isEqualToString:@"AuthenticationServicesAgent"] & 1) == 0)
  {

    return 1;
  }
  v7 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
  int v8 = [v7 BOOLForKey:@"useLegacyPlatformAuthenticatorInternal"];

  if (!v8) {
    return 1;
  }
  v9 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v10)
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_219326000, v9, OS_LOG_TYPE_DEFAULT, "Using legacy platform authenticator due to syncingPlatformAuthenticatorEnabled", v11, 2u);
    return 0;
  }
  return result;
}

+ (void)setShouldUseAlternateCredentialStore:(BOOL)a3
{
  v3 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_219326000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring request to turn off passkeys.", v4, 2u);
  }
}

+ (BOOL)shouldUseAlternateKeychainAttribute
{
  return [MEMORY[0x263F662A0] isCredentialExchangeEnabled];
}

+ (void)getShouldUseAlternateCredentialStoreWithCompletionHandler:(id)a3
{
}

+ (BOOL)arePasskeysDisallowedForRelyingParty:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F086E0] mainBundle];
  v6 = [v5 bundleIdentifier];
  if (([v6 isEqualToString:@"com.apple.AuthenticationServicesCore.AuthenticationServicesAgent"] & 1) != 0
    || ([v6 isEqualToString:authenticationServicesViewServiceBundleIdentifier] & 1) != 0
    || [v6 isEqualToString:@"com.apple.Preferences"])
  {

LABEL_5:
    v7 = +[ASFeatureManager sharedManager];
    char v8 = [v7 arePasskeysDisallowedForRelyingParty:v4];
    goto LABEL_6;
  }
  int v10 = objc_msgSend(v5, "safari_isSafariFamilyApplicationBundle");

  if (v10) {
    goto LABEL_5;
  }
  v11 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219326000, v11, OS_LOG_TYPE_INFO, "Synchronously looking up passkey quirks.", buf, 2u);
  }
  v12 = dispatch_group_create();
  *(void *)buf = 0;
  v17 = buf;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  dispatch_group_enter(v12);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__ASCWebKitSPISupport_arePasskeysDisallowedForRelyingParty___block_invoke;
  v13[3] = &unk_26439F478;
  v15 = buf;
  v7 = v12;
  v14 = v7;
  [a1 getArePasskeysDisallowedForRelyingParty:v4 withCompletionHandler:v13];
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  char v8 = v17[24] != 0;

  _Block_object_dispose(buf, 8);
LABEL_6:

  return v8;
}

void __60__ASCWebKitSPISupport_arePasskeysDisallowedForRelyingParty___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (void)getArePasskeysDisallowedForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = getArePasskeysDisallowedForRelyingParty_withCompletionHandler__onceToken;
  id v7 = a3;
  if (v6 != -1) {
    dispatch_once(&getArePasskeysDisallowedForRelyingParty_withCompletionHandler__onceToken, &__block_literal_global_11);
  }
  char v8 = (void *)getArePasskeysDisallowedForRelyingParty_withCompletionHandler__agentProxy;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__ASCWebKitSPISupport_getArePasskeysDisallowedForRelyingParty_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_26439F4A0;
  id v11 = v5;
  id v9 = v5;
  [v8 getArePasskeysDisallowedForRelyingParty:v7 withCompletionHandler:v10];
}

uint64_t __85__ASCWebKitSPISupport_getArePasskeysDisallowedForRelyingParty_withCompletionHandler___block_invoke()
{
  getArePasskeysDisallowedForRelyingParty_withCompletionHandler__agentProxy = objc_alloc_init(ASCAgentProxy);

  return MEMORY[0x270F9A758]();
}

uint64_t __85__ASCWebKitSPISupport_getArePasskeysDisallowedForRelyingParty_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)canCurrentProcessAccessPasskeysForRelyingParty:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatch_group_enter(v5);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__ASCWebKitSPISupport_canCurrentProcessAccessPasskeysForRelyingParty___block_invoke;
  v8[3] = &unk_26439F478;
  int v10 = &v11;
  uint64_t v6 = v5;
  id v9 = v6;
  [a1 getCanCurrentProcessAccessPasskeysForRelyingParty:v4 withCompletionHandler:v8];
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(a1) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)a1;
}

void __70__ASCWebKitSPISupport_canCurrentProcessAccessPasskeysForRelyingParty___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (void)getCanCurrentProcessAccessPasskeysForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler__onceToken;
  id v7 = a3;
  if (v6 != -1) {
    dispatch_once(&getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler__onceToken, &__block_literal_global_20);
  }
  char v8 = (void *)getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler__agentProxy;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __95__ASCWebKitSPISupport_getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_26439F4A0;
  id v11 = v5;
  id v9 = v5;
  [v8 getCanCurrentProcessAccessPasskeysForRelyingParty:v7 withCompletionHandler:v10];
}

uint64_t __95__ASCWebKitSPISupport_getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler___block_invoke()
{
  getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler__agentProxy = objc_alloc_init(ASCAgentProxy);

  return MEMORY[0x270F9A758]();
}

uint64_t __95__ASCWebKitSPISupport_getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)resetCredentialStore
{
  v2 = objc_alloc_init(ASCAgentProxy);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__ASCWebKitSPISupport_resetCredentialStore__block_invoke;
  v4[3] = &unk_26439ED00;
  id v5 = v2;
  v3 = v2;
  [(ASCAgentProxy *)v3 clearAllPlatformPublicKeyCredentialsWithCompletionHandler:v4];
}

void __43__ASCWebKitSPISupport_resetCredentialStore__block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_DEFAULT, "Cleared credential store.", v1, 2u);
  }
}

+ (id)alternateLargeBlobIfNecessaryForRelyingParty:(id)a3 clientDataHash:(id)a4
{
  id v4 = a4;
  uint64_t v5 = sub_2193E2130();
  unint64_t v7 = v6;

  sub_219348A70(v5, v7);

  return 0;
}

+ (id)entepriseAttestationIdentityPersistentReferenceForRelyingParty:(id)a3
{
  sub_2193E2840();
  id v3 = objc_msgSend(self, sel_sharedManager);
  id v4 = (void *)sub_2193E2830();
  id v5 = objc_msgSend(v3, sel_entepriseAttestationIdentityPersistentReferenceForRelyingParty_, v4);

  if (v5)
  {
    uint64_t v6 = sub_2193E2130();
    unint64_t v8 = v7;
    swift_bridgeObjectRelease();

    id v9 = (void *)sub_2193E2110();
    sub_219348A70(v6, v8);
  }
  else
  {
    swift_bridgeObjectRelease();
    id v9 = 0;
  }

  return v9;
}

+ (void)getClientCapabilitiesForRelyingParty:(NSString *)a3 withCompletionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC27638);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_2193E2A60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  void v13[4] = &unk_267C19B18;
  v13[5] = v11;
  char v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267C19E00;
  v14[5] = v13;
  v15 = a3;
  sub_2193D88D4((uint64_t)v9, (uint64_t)&unk_267C19480, (uint64_t)v14);
  swift_release();
}

+ (BOOL)shouldApplyWorkaroundFor134591531
{
  id v2 = objc_msgSend(self, sel_processInfo);
  objc_msgSend(v2, sel_operatingSystemVersion);

  if (v4 == 15) {
    return v5 < 2;
  }
  else {
    return v4 < 15;
  }
}

+ (id)wkTransportsFrom:(id)a3
{
  uint64_t v3 = sub_2193E2A10();
  _sSo19ASCWebKitSPISupportC26AuthenticationServicesCoreE12wkTransports4fromSaySo8NSNumberCGSaySSG_tFZ_0(v3);
  swift_bridgeObjectRelease();
  sub_2193B1938();
  uint64_t v4 = (void *)sub_2193E2A00();
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)asTransportsFrom:(id)a3
{
  sub_2193B1938();
  unint64_t v3 = sub_2193E2A10();
  _sSo19ASCWebKitSPISupportC26AuthenticationServicesCoreE12asTransports4fromSaySSGSaySo8NSNumberCG_tFZ_0(v3);
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_2193E2A00();
  swift_bridgeObjectRelease();

  return v4;
}

@end