@interface ENXPCClient
+ (ENXPCClient)clientWithAuditToken:(id *)a3 pid:(int)a4;
- (BOOL)entitledForDifferentialPrivacy;
- (BOOL)entitledForLogging;
- (BOOL)entitledForTestVerification;
- (BOOL)entitledToShowBuddy;
- (BOOL)entitledToSkipFileSigningVerification;
- (BOOL)entitledToSkipKeyReleasePrompt;
- (ENRegion)appRegion;
- (NSString)signingIdentity;
- (id)description;
- (int)accessLevel;
- (int)appAPIVersion;
- (int)pid;
- (void)activateWithAppAPIVersion:(int)a3 regionISO:(id)a4;
- (void)setAccessLevel:(int)a3;
- (void)setEntitledForLogging:(BOOL)a3;
- (void)setEntitledToShowBuddy:(BOOL)a3;
- (void)setEntitledToSkipFileSigningVerification:(BOOL)a3;
- (void)setEntitledToSkipKeyReleasePrompt:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setSigningIdentity:(id)a3;
@end

@implementation ENXPCClient

- (NSString)signingIdentity
{
  return self->_signingIdentity;
}

- (BOOL)entitledToSkipFileSigningVerification
{
  return self->_entitledToSkipFileSigningVerification;
}

- (BOOL)entitledForLogging
{
  return self->_entitledForLogging;
}

+ (ENXPCClient)clientWithAuditToken:(id *)a3 pid:(int)a4
{
  v5 = objc_alloc_init(ENXPCClient);
  v5->_pid = a4;
  uint64_t v6 = xpc_copy_code_signing_identity_for_token();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [MEMORY[0x1E4F29020] stringWithUTF8String:v6];
    free(v7);
  }
  else
  {
    v8 = 0;
  }
  if (v8) {
    v9 = v8;
  }
  else {
    v9 = &stru_1F2B29B10;
  }
  objc_storeStrong((id *)&v5->_signingIdentity, v9);
  v10 = (void *)xpc_copy_entitlement_for_token();
  v11 = v10;
  if (!v10) {
    goto LABEL_27;
  }
  if (xpc_dictionary_get_BOOL(v10, "com.apple.private.exposure-notification"))
  {
    int v12 = 4;
LABEL_14:
    v5->_accessLevel = v12;
    goto LABEL_15;
  }
  if (xpc_dictionary_get_BOOL(v11, "com.apple.developer.exposure-notification-test"))
  {
    int v12 = 3;
    goto LABEL_14;
  }
  if (xpc_dictionary_get_BOOL(v11, "com.apple.developer.exposure-notification"))
  {
    int v12 = 2;
    goto LABEL_14;
  }
LABEL_15:
  if (xpc_dictionary_get_BOOL(v11, "com.apple.developer.exposure-notification-test-skip-file-verification")) {
    v5->_entitledToSkipFileSigningVerification = 1;
  }
  if (xpc_dictionary_get_BOOL(v11, "com.apple.developer.exposure-notification-logging")) {
    v5->_entitledForLogging = 1;
  }
  if (xpc_dictionary_get_BOOL(v11, "com.apple.private.exposure-notification-differential-privacy")) {
    v5->_entitledForDifferentialPrivacy = 1;
  }
  if (xpc_dictionary_get_BOOL(v11, "com.apple.private.exposure-notification-bypass-key-release-prompt")) {
    v5->_entitledToSkipKeyReleasePrompt = 1;
  }
  if (xpc_dictionary_get_BOOL(v11, "com.apple.private.exposure-notification-test-verification")) {
    v5->_entitledForTestVerification = 1;
  }
  if (xpc_dictionary_get_BOOL(v11, "com.apple.private.exposure-notification-show-buddy")) {
    v5->_entitledToShowBuddy = 1;
  }
LABEL_27:

  return v5;
}

- (int)accessLevel
{
  return self->_accessLevel;
}

- (int)appAPIVersion
{
  return self->_appAPIVersion;
}

- (void)activateWithAppAPIVersion:(int)a3 regionISO:(id)a4
{
  self->_appAPIVersion = a3;
  if (a4)
  {
    v5 = [MEMORY[0x1E4F257A8] regionWithCode:a4];
    appRegion = self->_appRegion;
    self->_appRegion = v5;
    MEMORY[0x1F41817F8](v5, appRegion);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appRegion, 0);

  objc_storeStrong((id *)&self->_signingIdentity, 0);
}

- (int)pid
{
  return self->_pid;
}

- (id)description
{
  [(NSString *)self->_signingIdentity length];
  NSAppendPrintF_safe();
  id v9 = 0;
  NSAppendPrintF();
  id v3 = v9;

  NSAppendPrintF_safe();
  id v4 = v3;

  appRegion = self->_appRegion;
  if (appRegion)
  {
    v8 = appRegion;
    NSAppendPrintF_safe();
    id v6 = v4;

    id v4 = v6;
  }

  return v4;
}

- (void)setAccessLevel:(int)a3
{
  self->_accessLevel = a3;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void)setSigningIdentity:(id)a3
{
}

- (ENRegion)appRegion
{
  return self->_appRegion;
}

- (BOOL)entitledForDifferentialPrivacy
{
  return self->_entitledForDifferentialPrivacy;
}

- (void)setEntitledForLogging:(BOOL)a3
{
  self->_entitledForLogging = a3;
}

- (BOOL)entitledForTestVerification
{
  return self->_entitledForTestVerification;
}

- (void)setEntitledToSkipFileSigningVerification:(BOOL)a3
{
  self->_entitledToSkipFileSigningVerification = a3;
}

- (BOOL)entitledToSkipKeyReleasePrompt
{
  return self->_entitledToSkipKeyReleasePrompt;
}

- (void)setEntitledToSkipKeyReleasePrompt:(BOOL)a3
{
  self->_entitledToSkipKeyReleasePrompt = a3;
}

- (BOOL)entitledToShowBuddy
{
  return self->_entitledToShowBuddy;
}

- (void)setEntitledToShowBuddy:(BOOL)a3
{
  self->_entitledToShowBuddy = a3;
}

@end