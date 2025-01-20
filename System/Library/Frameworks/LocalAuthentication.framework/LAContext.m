@interface LAContext
+ (BOOL)supportsSecureCoding;
+ (id)_optionsForEvent:(int64_t)a3;
+ (unsigned)newCommandId;
+ (unsigned)newInstanceId;
+ (void)notifyEvent:(int64_t)a3;
+ (void)notifyEvent:(int64_t)a3 completionHandler:(id)a4;
- (BOOL)_setCredential:(id)a3 type:(int64_t)a4 log:(int64_t)a5 cid:(unsigned int)a6 error:(id *)a7;
- (BOOL)_useModernAuthorizationSheet;
- (BOOL)canEvaluatePolicy:(LAPolicy)policy error:(NSError *)error;
- (BOOL)checkContextValidWithError:(id *)a3;
- (BOOL)interactionNotAllowed;
- (BOOL)isCredentialSet:(LACredentialType)type;
- (BOOL)isEqual:(id)a3;
- (BOOL)setCredential:(NSData *)credential type:(LACredentialType)type;
- (BOOL)setCredential:(id)a3 type:(int64_t)a4 error:(id *)a5;
- (BOOL)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (LABiometryType)biometryType;
- (LAClient)client;
- (LAContext)init;
- (LAContext)initWithCoder:(id)a3;
- (LAContext)initWithExternalizedContext:(id)a3;
- (LAContext)initWithExternalizedContext:(id)a3 uiDelegate:(id)a4;
- (LAContext)initWithExternalizedContext:(id)a3 userSession:(unsigned int *)a4;
- (LAContext)initWithUIDelegate:(id)a3;
- (LADomainState)domainState;
- (LAUIDelegate)uiDelegate;
- (NSData)evaluatedPolicyDomainState;
- (NSData)externalizedContext;
- (NSHashTable)observers;
- (NSNumber)maxBiometryFailures;
- (NSNumber)touchIDAuthenticationRetryLimit;
- (NSString)localizedCancelTitle;
- (NSString)localizedFallbackTitle;
- (NSString)localizedReason;
- (NSTimeInterval)touchIDAuthenticationAllowableReuseDuration;
- (id)_evaluatePolicy:(int64_t)a3 options:(id)a4 log:(int64_t)a5 cid:(unsigned int)a6 error:(id *)a7;
- (id)_evaluationMechanismsFromReturnedError:(id)a3 error:(id *)a4;
- (id)_fetchDomainStateWithOptions:(id)a3 error:(id *)a4;
- (id)_hashWithBundleIdentifier:(id)a3;
- (id)_publicErrorFromInternalError:(id)a3 options:(id)a4;
- (id)_serverPropertyValueForOption:(int64_t)a3;
- (id)_serverPropertyValueForOption:(int64_t)a3 log:(int64_t)a4;
- (id)credentialOfType:(int64_t)a3 error:(id *)a4;
- (id)description;
- (id)domainStateWithOptions:(id)a3;
- (id)evaluateAccessControl:(__SecAccessControl *)a3 aksOperation:(void *)a4 options:(id)a5 error:(id *)a6;
- (id)evaluateAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 options:(id)a5 error:(id *)a6;
- (id)evaluatePolicy:(int64_t)a3 options:(id)a4 error:(id *)a5;
- (id)evaluationMechanismsForAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 error:(id *)a5;
- (id)evaluationMechanismsForPolicy:(int64_t)a3 error:(id *)a4;
- (id)optionAllowEmptyPasscode;
- (id)optionAllowEnablementGracePeriod;
- (id)optionAllowUnapprovedSensor;
- (id)optionAuthenticationCallbackReason;
- (id)optionAuthenticationCallbackURL;
- (id)optionAuthenticationIdentifier;
- (id)optionAuthenticationReason;
- (id)optionAuthenticationTitle;
- (id)optionBeginRatchetLocalizedText;
- (id)optionBeginRatchetLocalizedTitle;
- (id)optionBeginRatchetShowsLocationWarning;
- (id)optionBeginSecurityDelayImmediately;
- (id)optionBiometryLockoutRecovery;
- (id)optionBiometryLockoutRecoveryRetries;
- (id)optionBodyText;
- (id)optionCallerAuditToken;
- (id)optionCallerAuditTokenUsage;
- (id)optionCallerIconBundlePath;
- (id)optionCallerIconPath;
- (id)optionCallerName;
- (id)optionCallerPID;
- (id)optionCancelVisible;
- (id)optionCheckApplePayEnabled;
- (id)optionCountdownLocalizedText;
- (id)optionDTO;
- (id)optionDisableMacCompanion;
- (id)optionEventProcessing;
- (id)optionFaceDetectLength;
- (id)optionFallbackToNoAuthentication;
- (id)optionFallbackVisible;
- (id)optionFingerMustBeOff;
- (id)optionLightweightUI;
- (id)optionLightweightUIMode;
- (id)optionMatchForUnlock;
- (id)optionMaxBiometryFailures;
- (id)optionMaxCredentialAge;
- (id)optionNoCountdownUI;
- (id)optionNoFailureUI;
- (id)optionNoGracePeriodUI;
- (id)optionNotInteractive;
- (id)optionPINCharset;
- (id)optionPINFirst;
- (id)optionPINLabel;
- (id)optionPINLength;
- (id)optionPINMaxLength;
- (id)optionPINMinLength;
- (id)optionPINTitle;
- (id)optionPasscodeScreenBlur;
- (id)optionPasscodeScreenStyle;
- (id)optionPasscodeTitle;
- (id)optionPasswordAuthenticationReason;
- (id)optionPhysicalButtonTitle;
- (id)optionPresentationContext;
- (id)optionPresentationStyle;
- (id)optionPresentingEmbeddedUI;
- (id)optionReturnBiometryDatabaseHash;
- (id)optionSecurePassphrase;
- (id)optionSharedValidity;
- (id)optionSkipDoublePress;
- (id)optionSoftwareUpdateManifest;
- (id)optionSoftwareUpdateStashMode;
- (id)optionTKAuthOperationError;
- (id)optionTimeout;
- (id)optionTintColor;
- (id)optionTransitionStyle;
- (id)optionUseModernUI;
- (id)optionUseShortExpirationTimer;
- (id)optionUserCancel;
- (id)optionUserFallback;
- (id)uuid;
- (unint64_t)hash;
- (unsigned)instanceId;
- (void)_evaluateAccessControl:(__SecAccessControl *)a3 operation:(id)a4 options:(id)a5 log:(int64_t)a6 cid:(unsigned int)a7 synchronous:(BOOL)a8 reply:(id)a9;
- (void)_evaluatePolicy:(int64_t)a3 options:(id)a4 log:(int64_t)a5 cid:(unsigned int)a6 synchronous:(BOOL)a7 reply:(id)a8;
- (void)_evaluatePolicy:(int64_t)a3 options:(id)a4 synchronous:(BOOL)a5 reply:(id)a6;
- (void)_notifyObserversAfterInvalidation;
- (void)_setCredential:(id)a3 type:(int64_t)a4 log:(int64_t)a5 cid:(unsigned int)a6 reply:(id)a7;
- (void)_setServerPropertyForOption:(int64_t)a3 value:(id)a4;
- (void)_setServerPropertyForOption:(int64_t)a3 value:(id)a4 log:(int64_t)a5;
- (void)addContextObserver:(id)a3;
- (void)authMethodWithReply:(id)a3;
- (void)authorizeOperation:(int64_t)a3 protectedBy:(__SecAccessControl *)a4 options:(id)a5 reply:(id)a6;
- (void)bootstrapServiceType:(id)a3 completionHandler:(id)a4;
- (void)checkCanEvaluateRight:(id)a3 reply:(id)a4;
- (void)credentialOfType:(int64_t)a3 reply:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)evaluateAccessControl:(SecAccessControlRef)accessControl operation:(LAAccessControlOperation)operation localizedReason:(NSString *)localizedReason reply:(void *)reply;
- (void)evaluateAccessControl:(__SecAccessControl *)a3 aksOperation:(void *)a4 options:(id)a5 reply:(id)a6;
- (void)evaluateAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 options:(id)a5 reply:(id)a6;
- (void)evaluatePolicy:(LAPolicy)policy localizedReason:(NSString *)localizedReason reply:(void *)reply;
- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 reply:(id)a5;
- (void)evaluateRight:(id)a3 localizedReason:(id)a4 reply:(id)a5;
- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5;
- (void)invalidate;
- (void)optionsForInternalOperation:(int64_t)a3 reply:(id)a4;
- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5;
- (void)prearmTouchIDWithReply:(id)a3;
- (void)removeContextObserver:(id)a3;
- (void)resetProcessedEvent:(int64_t)a3 reply:(id)a4;
- (void)resetWithReply:(id)a3;
- (void)retryProcessedEvent:(int64_t)a3 reply:(id)a4;
- (void)setBiometryType:(int64_t)a3;
- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6;
- (void)setCredential:(id)a3 type:(int64_t)a4 reply:(id)a5;
- (void)setEvaluatedPolicyDomainState:(id)a3;
- (void)setExternalizedContext:(id)a3;
- (void)setInteractionNotAllowed:(BOOL)interactionNotAllowed;
- (void)setLocalizedCancelTitle:(NSString *)localizedCancelTitle;
- (void)setLocalizedFallbackTitle:(NSString *)localizedFallbackTitle;
- (void)setLocalizedReason:(NSString *)localizedReason;
- (void)setMaxBiometryFailures:(NSNumber *)maxBiometryFailures;
- (void)setObservers:(id)a3;
- (void)setOptionAllowEmptyPasscode:(id)a3;
- (void)setOptionAllowEnablementGracePeriod:(id)a3;
- (void)setOptionAllowUnapprovedSensor:(id)a3;
- (void)setOptionAuthenticationCallbackReason:(id)a3;
- (void)setOptionAuthenticationCallbackURL:(id)a3;
- (void)setOptionAuthenticationIdentifier:(id)a3;
- (void)setOptionAuthenticationReason:(id)a3;
- (void)setOptionAuthenticationTitle:(id)a3;
- (void)setOptionBeginRatchetLocalizedText:(id)a3;
- (void)setOptionBeginRatchetLocalizedTitle:(id)a3;
- (void)setOptionBeginRatchetShowsLocationWarning:(id)a3;
- (void)setOptionBeginSecurityDelayImmediately:(id)a3;
- (void)setOptionBiometryLockoutRecovery:(id)a3;
- (void)setOptionBiometryLockoutRecoveryRetries:(id)a3;
- (void)setOptionBodyText:(id)a3;
- (void)setOptionCallerAuditToken:(id)a3;
- (void)setOptionCallerAuditTokenUsage:(id)a3;
- (void)setOptionCallerIconBundlePath:(id)a3;
- (void)setOptionCallerIconPath:(id)a3;
- (void)setOptionCallerName:(id)a3;
- (void)setOptionCallerPID:(id)a3;
- (void)setOptionCancelVisible:(id)a3;
- (void)setOptionCheckApplePayEnabled:(id)a3;
- (void)setOptionCountdownLocalizedText:(id)a3;
- (void)setOptionDTO:(id)a3;
- (void)setOptionDisableMacCompanion:(id)a3;
- (void)setOptionEventProcessing:(id)a3;
- (void)setOptionFaceDetectLength:(id)a3;
- (void)setOptionFallbackToNoAuthentication:(id)a3;
- (void)setOptionFallbackVisible:(id)a3;
- (void)setOptionFingerMustBeOff:(id)a3;
- (void)setOptionLightweightUI:(id)a3;
- (void)setOptionLightweightUIMode:(id)a3;
- (void)setOptionMatchForUnlock:(id)a3;
- (void)setOptionMaxBiometryFailures:(id)a3;
- (void)setOptionMaxCredentialAge:(id)a3;
- (void)setOptionNoCountdownUI:(id)a3;
- (void)setOptionNoFailureUI:(id)a3;
- (void)setOptionNoGracePeriodUI:(id)a3;
- (void)setOptionNotInteractive:(id)a3;
- (void)setOptionPINCharset:(id)a3;
- (void)setOptionPINFirst:(id)a3;
- (void)setOptionPINLabel:(id)a3;
- (void)setOptionPINLength:(id)a3;
- (void)setOptionPINMaxLength:(id)a3;
- (void)setOptionPINMinLength:(id)a3;
- (void)setOptionPINTitle:(id)a3;
- (void)setOptionPasscodeScreenBlur:(id)a3;
- (void)setOptionPasscodeScreenStyle:(id)a3;
- (void)setOptionPasscodeTitle:(id)a3;
- (void)setOptionPasswordAuthenticationReason:(id)a3;
- (void)setOptionPhysicalButtonTitle:(id)a3;
- (void)setOptionPresentationContext:(id)a3;
- (void)setOptionPresentationStyle:(id)a3;
- (void)setOptionPresentingEmbeddedUI:(id)a3;
- (void)setOptionReturnBiometryDatabaseHash:(id)a3;
- (void)setOptionSecurePassphrase:(id)a3;
- (void)setOptionSharedValidity:(id)a3;
- (void)setOptionSkipDoublePress:(id)a3;
- (void)setOptionSoftwareUpdateManifest:(id)a3;
- (void)setOptionSoftwareUpdateStashMode:(id)a3;
- (void)setOptionTKAuthOperationError:(id)a3;
- (void)setOptionTimeout:(id)a3;
- (void)setOptionTintColor:(id)a3;
- (void)setOptionTransitionStyle:(id)a3;
- (void)setOptionUseModernUI:(id)a3;
- (void)setOptionUseShortExpirationTimer:(id)a3;
- (void)setOptionUserCancel:(id)a3;
- (void)setOptionUserFallback:(id)a3;
- (void)setOptions:(id)a3 forInternalOperation:(int64_t)a4 reply:(id)a5;
- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 reply:(id)a5;
- (void)setTouchIDAuthenticationAllowableReuseDuration:(NSTimeInterval)touchIDAuthenticationAllowableReuseDuration;
- (void)setTouchIDAuthenticationRetryLimit:(id)a3;
- (void)setUiDelegate:(id)a3;
@end

@implementation LAContext

- (LAContext)initWithExternalizedContext:(id)a3
{
  return [(LAContext *)self initWithExternalizedContext:a3 userSession:0];
}

uint64_t __53__LAContext_initWithExternalizedContext_userSession___block_invoke()
{
  return MEMORY[0x1F40ECD80](1);
}

- (LAContext)init
{
  return [(LAContext *)self initWithExternalizedContext:0];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = LALogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_1BED06000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocated", buf, 0xCu);
  }

  [(LAClient *)self->_client invalidateWithMessage:@"context dealloc"];
  v4.receiver = self;
  v4.super_class = (Class)LAContext;
  [(LAContext *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_externalizedContext, 0);
  objc_storeStrong((id *)&self->_evaluatedPolicyDomainState, 0);
  objc_storeStrong((id *)&self->_maxBiometryFailures, 0);
  objc_storeStrong((id *)&self->_domainStateCache, 0);

  objc_storeStrong((id *)&self->_prearmContext, 0);
}

- (LAContext)initWithExternalizedContext:(id)a3 userSession:(unsigned int *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)LAContext;
  uint64_t v7 = [(LAContext *)&v15 init];
  if (!v7) {
    goto LABEL_15;
  }
  if (initWithExternalizedContext_userSession__onceToken != -1) {
    dispatch_once(&initWithExternalizedContext_userSession__onceToken, &__block_literal_global_15);
  }
  v8 = LALogForCategory();
  if (v6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"with externalized context %x", objc_msgSend(v6, "hash"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!a4) {
      goto LABEL_10;
    }
LABEL_8:
    unsigned int v10 = *a4;
    if (v10 != geteuid()) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Invalid uid: %d", *a4);
    }
    goto LABEL_10;
  }
  v9 = @"new";
  if (a4) {
    goto LABEL_8;
  }
LABEL_10:
  unsigned int v11 = +[LAContext newCommandId];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    __int16 v18 = 1024;
    LODWORD(v19) = v11;
    _os_log_impl(&dword_1BED06000, v8, OS_LOG_TYPE_DEFAULT, "Creating LAContext %{public}@ cid:%u", buf, 0x12u);
  }
  v7->_instanceId = +[LAContext newInstanceId];
  v12 = [[LAClient alloc] initWithExternalizedContext:v6 userSession:a4 context:v7];
  client = v7->_client;
  v7->_client = v12;

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v17 = v7;
    __int16 v18 = 2114;
    v19 = v9;
    __int16 v20 = 1024;
    unsigned int v21 = v11;
    _os_log_impl(&dword_1BED06000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ created %{public}@ cid:%u", buf, 0x1Cu);
  }

LABEL_15:
  return v7;
}

+ (unsigned)newInstanceId
{
  return ++_instanceCounter_0;
}

- (BOOL)canEvaluatePolicy:(LAPolicy)policy error:(NSError *)error
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v29 = &unk_1F19EC808;
  v30[0] = MEMORY[0x1E4F1CC38];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  uint64_t v8 = +[LAContext newCommandId];
  v9 = LALogForPolicy();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    int v22 = policy;
    __int16 v23 = 2114;
    v24 = self;
    __int16 v25 = 1024;
    int v26 = v8;
    _os_log_impl(&dword_1BED06000, v9, OS_LOG_TYPE_INFO, "canEvaluatePolicy:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  id v20 = 0;
  unsigned int v10 = [(LAContext *)self _evaluatePolicy:policy options:v7 log:0 cid:v8 error:&v20];
  id v11 = v20;
  if (v10) {
    int v12 = 1;
  }
  else {
    int v12 = [MEMORY[0x1E4F30B90] error:v11 hasCode:-1004];
  }
  v13 = [(LAContext *)self _publicErrorFromInternalError:v11 options:v7];

  if (error)
  {
    if (v12) {
      v14 = 0;
    }
    else {
      v14 = v13;
    }
    *error = (NSError *)v14;
  }
  objc_super v15 = v9;
  if (v12)
  {
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    v17 = [(__CFString *)v13 domain];
    if ([v17 isEqualToString:@"com.apple.LocalAuthentication"]) {
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    }
    else {
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    }
  }
  if (os_log_type_enabled(v15, v16))
  {
    __int16 v18 = @"YES";
    *(_DWORD *)buf = 67109890;
    if (!v12) {
      __int16 v18 = v13;
    }
    int v22 = policy;
    __int16 v23 = 2114;
    v24 = self;
    __int16 v25 = 1024;
    int v26 = v8;
    __int16 v27 = 2114;
    v28 = v18;
    _os_log_impl(&dword_1BED06000, v15, v16, "canEvaluatePolicy:%d on %{public}@ cid:%u returned %{public}@", buf, 0x22u);
  }

  return v12;
}

+ (unsigned)newCommandId
{
  return ++_commandCounter;
}

- (id)_publicErrorFromInternalError:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  uint64_t v8 = [v7 domain];
  int v9 = [v8 isEqualToString:@"com.apple.LocalAuthentication"];

  unsigned int v10 = v7;
  if (v9)
  {
    uint64_t v11 = [v7 code];
    uint64_t v12 = [v7 code];
    if (v12 == -4)
    {
      v13 = [v7 userInfo];
      v14 = [v13 objectForKeyedSubscript:@"Subcode"];

      if (v14 && (unint64_t)([v14 integerValue] - 12) <= 2)
      {
        objc_super v15 = [v6 objectForKeyedSubscript:&unk_1F19EC7D8];
        os_log_type_t v16 = v15;
        uint64_t v11 = -3;
        if (v15 && ![v15 length]) {
          uint64_t v11 = -2;
        }
      }
    }
    else if (v12 == -1018)
    {
      uint64_t v11 = -6;
    }
    v17 = (void *)MEMORY[0x1E4F30B90];
    __int16 v18 = [v7 userInfo];
    v19 = [v18 objectForKey:*MEMORY[0x1E4F28228]];
    unsigned int v10 = [v17 errorWithCode:v11 message:v19];
  }

  return v10;
}

- (id)_evaluatePolicy:(int64_t)a3 options:(id)a4 log:(int64_t)a5 cid:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a4;
  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x3032000000;
  __int16 v25 = __Block_byref_object_copy__4;
  int v26 = __Block_byref_object_dispose__4;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  id v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__LAContext__evaluatePolicy_options_log_cid_error___block_invoke;
  v15[3] = &unk_1E63C51F8;
  v15[4] = &v22;
  v15[5] = &v16;
  [(LAContext *)self _evaluatePolicy:a3 options:v12 log:a5 cid:v8 synchronous:1 reply:v15];
  if (a7) {
    *a7 = (id) v17[5];
  }
  id v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);

  return v13;
}

- (void)_evaluatePolicy:(int64_t)a3 options:(id)a4 log:(int64_t)a5 cid:(unsigned int)a6 synchronous:(BOOL)a7 reply:(id)a8
{
  BOOL v9 = a7;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a8;
  if (a5)
  {
    uint64_t v16 = [(LAContext *)self description];
    v17 = LALogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = "async";
      *(_DWORD *)buf = 67110146;
      int v27 = a3;
      if (v9) {
        uint64_t v18 = "sync";
      }
      __int16 v28 = 2114;
      id v29 = v14;
      __int16 v30 = 2114;
      v31 = v16;
      __int16 v32 = 2082;
      v33 = v18;
      __int16 v34 = 1024;
      unsigned int v35 = a6;
      _os_log_impl(&dword_1BED06000, v17, OS_LOG_TYPE_DEFAULT, "evaluatePolicy:%d options:%{public}@ on %{public}@ (%{public}s) cid:%u", buf, 0x2Cu);
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__LAContext__evaluatePolicy_options_log_cid_synchronous_reply___block_invoke;
  v21[3] = &unk_1E63C51D0;
  v21[4] = self;
  id v22 = v16;
  unsigned int v25 = a6;
  id v23 = v15;
  int64_t v24 = a5;
  id v19 = v15;
  id v20 = v16;
  [(LAContext *)self _evaluatePolicy:a3 options:v14 synchronous:v9 reply:v21];
}

void __55__LAContext__evaluatePolicy_options_synchronous_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)MEMORY[0x1E4F30B90];
  id v6 = a2;
  id v7 = [v5 redactInternalError:a3];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

- (void)_evaluatePolicy:(int64_t)a3 options:(id)a4 synchronous:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  client = self->_client;
  id v12 = a4;
  id v13 = [(LAContext *)self uiDelegate];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__LAContext__evaluatePolicy_options_synchronous_reply___block_invoke;
  v15[3] = &unk_1E63C3E88;
  id v16 = v10;
  id v14 = v10;
  [(LAClient *)client evaluatePolicy:a3 options:v12 uiDelegate:v13 synchronous:v6 reply:v15];
}

- (id)description
{
  v3 = [(LAContext *)self uiDelegate];

  uint64_t v4 = NSString;
  uint64_t v5 = [(LAContext *)self instanceId];
  uint64_t v6 = [(LAClient *)self->_client proxyId];
  id v7 = (void *)v6;
  if (v3)
  {
    uint64_t v8 = [(LAContext *)self uiDelegate];
    BOOL v9 = [v4 stringWithFormat:@"LAContext[%u:%@ uiDelegate:%@]", v5, v7, v8];
  }
  else
  {
    BOOL v9 = [v4 stringWithFormat:@"LAContext[%u:%@]", v5, v6];
  }

  return v9;
}

- (LAUIDelegate)uiDelegate
{
  return [(LAClient *)self->_client uiDelegate];
}

- (unsigned)instanceId
{
  return self->_instanceId;
}

void __63__LAContext__evaluatePolicy_options_log_cid_synchronous_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = *(void **)(a1 + 32);
  if (v5)
  {
    BOOL v9 = [v5 objectForKey:&unk_1F19EC7C0];
    id v10 = [v8 _hashWithBundleIdentifier:v9];
    [*(id *)(a1 + 32) setEvaluatedPolicyDomainState:v10];
  }
  else
  {
    uint64_t v11 = [v6 userInfo];
    id v12 = [v11 objectForKey:@"BiometryDatabaseHash"];
    id v13 = [v8 _hashWithBundleIdentifier:v12];
    [*(id *)(a1 + 32) setEvaluatedPolicyDomainState:v13];

    id v14 = [v7 userInfo];
    BOOL v9 = [v14 objectForKeyedSubscript:@"BiometryType"];

    if (!v9) {
      goto LABEL_6;
    }
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "integerValue"));
    id v10 = (void *)_cachedBiometryType;
    _cachedBiometryType = v15;
  }

LABEL_6:
  if (*(void *)(a1 + 56))
  {
    id v16 = LALogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      int v18 = *(_DWORD *)(a1 + 64);
      if (v5) {
        id v19 = v5;
      }
      else {
        id v19 = v7;
      }
      int v21 = 138543874;
      uint64_t v22 = v17;
      __int16 v23 = 1024;
      int v24 = v18;
      __int16 v25 = 2114;
      id v26 = v19;
      _os_log_impl(&dword_1BED06000, v16, OS_LOG_TYPE_DEFAULT, "evaluatePolicy on %{public}@ cid:%u returned %{public}@", (uint8_t *)&v21, 0x1Cu);
    }
  }
  uint64_t v20 = *(void *)(a1 + 48);
  if (v20) {
    (*(void (**)(uint64_t, id, void *))(v20 + 16))(v20, v5, v7);
  }
}

void __51__LAContext__evaluatePolicy_options_log_cid_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)setEvaluatedPolicyDomainState:(id)a3
{
}

- (id)_hashWithBundleIdentifier:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F72F50];
    uint64_t v4 = (void *)MEMORY[0x1E4F28B50];
    id v5 = a3;
    id v6 = [v4 mainBundle];
    uint64_t v7 = [v6 bundleIdentifier];
    uint64_t v8 = [v3 saltHash:v5 withBundleID:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)authorizeOperation:(int64_t)a3 protectedBy:(__SecAccessControl *)a4 options:(id)a5 reply:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = [v10 objectForKeyedSubscript:&unk_1F19EC700];
  id v13 = (void *)[v10 mutableCopy];
  [v13 setObject:0 forKeyedSubscript:&unk_1F19EC700];
  uint64_t v24 = 0;
  __int16 v25 = &v24;
  uint64_t v26 = 0x2050000000;
  id v14 = (void *)getLAContextUITrampolineClass_softClass;
  uint64_t v27 = getLAContextUITrampolineClass_softClass;
  if (!getLAContextUITrampolineClass_softClass)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __getLAContextUITrampolineClass_block_invoke;
    v23[3] = &unk_1E63C3EB0;
    v23[4] = &v24;
    __getLAContextUITrampolineClass_block_invoke((uint64_t)v23);
    id v14 = (void *)v25[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v24, 8);
  if ([(LAContext *)self _useModernAuthorizationSheet]
    && v15
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __73__LAContext_Authorization__authorizeOperation_protectedBy_options_reply___block_invoke;
    v21[3] = &unk_1E63C3E88;
    id v16 = &v22;
    id v22 = v11;
    id v17 = v11;
    [v15 evaluateAccessControl:a4 context:self operation:a3 options:v13 presentationContext:v12 reply:v21];
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__LAContext_Authorization__authorizeOperation_protectedBy_options_reply___block_invoke_2;
    v19[3] = &unk_1E63C3E88;
    id v16 = &v20;
    id v20 = v11;
    id v18 = v11;
    [(LAContext *)self evaluateAccessControl:a4 operation:a3 options:v13 reply:v19];
  }
}

uint64_t __73__LAContext_Authorization__authorizeOperation_protectedBy_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__LAContext_Authorization__authorizeOperation_protectedBy_options_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)evaluateRight:(id)a3 localizedReason:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v10 setContext:self];
  [v10 authorizeWithLocalizedReason:v9 completion:v8];
}

- (void)checkCanEvaluateRight:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setContext:self];
  [v7 checkCanAuthorizeWithCompletion:v6];
}

- (BOOL)_useModernAuthorizationSheet
{
  return 0;
}

+ (void)notifyEvent:(int64_t)a3
{
}

+ (void)notifyEvent:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (notifyEvent_completionHandler__onceToken != -1) {
    dispatch_once(&notifyEvent_completionHandler__onceToken, &__block_literal_global_9);
  }
  id v6 = LALogForCategory();
  unsigned int v7 = +[LAContext newCommandId];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = a3;
    LOWORD(v19) = 1024;
    *(_DWORD *)((char *)&v19 + 2) = v7;
    _os_log_impl(&dword_1BED06000, v6, OS_LOG_TYPE_DEFAULT, "notifyEvent:%d cid:%u", buf, 0xEu);
  }
  *(void *)buf = 0;
  id v19 = buf;
  uint64_t v20 = 0x3032000000;
  int v21 = __Block_byref_object_copy__4;
  id v22 = __Block_byref_object_dispose__4;
  id v23 = (id)objc_opt_new();
  id v8 = (void *)*((void *)v19 + 5);
  id v9 = +[LAContext _optionsForEvent:a3];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__LAContext_notifyEvent_completionHandler___block_invoke_6;
  v12[3] = &unk_1E63C5120;
  id v10 = v6;
  unsigned int v17 = v7;
  id v13 = v10;
  id v15 = buf;
  int64_t v16 = a3;
  id v11 = v5;
  id v14 = v11;
  [v8 notifyEvent:a3 options:v9 reply:v12];

  _Block_object_dispose(buf, 8);
}

uint64_t __43__LAContext_notifyEvent_completionHandler___block_invoke()
{
  return MEMORY[0x1F40ECD80](1);
}

void __43__LAContext_notifyEvent_completionHandler___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 56);
    int v8 = *(_DWORD *)(a1 + 64);
    id v9 = @"success";
    if (!a2) {
      id v9 = v5;
    }
    v13[0] = 67109634;
    v13[1] = v7;
    __int16 v14 = 1024;
    int v15 = v8;
    __int16 v16 = 2114;
    unsigned int v17 = v9;
    _os_log_impl(&dword_1BED06000, v6, OS_LOG_TYPE_INFO, "notifyEvent:%d cid:%u returned %{public}@", (uint8_t *)v13, 0x18u);
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v12 + 16))(v12, a2, v5);
  }
}

+ (id)_optionsForEvent:(int64_t)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ((a3 | 2) == 2)
  {
    id v6 = &unk_1F19EC7A8;
    v3 = [MEMORY[0x1E4F1C9C8] date];
    v7[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (LAContext)initWithUIDelegate:(id)a3
{
  return [(LAContext *)self initWithExternalizedContext:0 uiDelegate:a3];
}

- (LAContext)initWithExternalizedContext:(id)a3 uiDelegate:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(LAContext *)self initWithExternalizedContext:a3];
  [(LAContext *)v7 setUiDelegate:v6];

  return v7;
}

- (LAContext)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)LAContext;
  id v5 = [(LAContext *)&v18 init];
  if (v5)
  {
    if (initWithCoder__onceToken != -1) {
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_28);
    }
    id v6 = [v4 connection];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    int v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Token"];
    id v9 = (void *)MEMORY[0x1E4F30BB0];
    if (v6) {
      [v6 auditToken];
    }
    else {
      memset(v17, 0, sizeof(v17));
    }
    uint64_t v10 = [v9 auditTokenToData:v17];
    v5->_instanceId = +[LAContext newInstanceId];
    id v11 = [[LAClient alloc] initWithUUID:v7 token:v8 senderAuditTokenData:v10 context:v5];
    client = v5->_client;
    v5->_client = v11;

    id v13 = LALogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v7 hash];
      int v15 = [v8 hash];
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v5;
      __int16 v21 = 1024;
      int v22 = v14;
      __int16 v23 = 1024;
      int v24 = v15;
      _os_log_impl(&dword_1BED06000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ created with uuid: %x token: %x", buf, 0x18u);
    }
  }
  return v5;
}

uint64_t __27__LAContext_initWithCoder___block_invoke()
{
  return MEMORY[0x1F40ECD80](1);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)LAContext;
  if ([(LAContext *)&v9 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(LAClient *)self->_client uuid];
      uint64_t v7 = [v4[9] uuid];
      char v5 = [v6 isEqual:v7];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [(LAClient *)self->_client uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = LALogForCategory();
  unsigned int v6 = +[LAContext newCommandId];
  uint64_t v7 = [(LAContext *)self description];
  int v8 = [v4 connection];
  objc_super v9 = [(LAClient *)self->_client uuid];
  [v4 encodeObject:v9 forKey:@"UUID"];

  uint64_t v10 = [v8 processIdentifier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v29 = v7;
    __int16 v30 = 1024;
    int v31 = v10;
    __int16 v32 = 1024;
    unsigned int v33 = v6;
    _os_log_impl(&dword_1BED06000, v5, OS_LOG_TYPE_DEFAULT, "Encoding %{public}@ for transfer to pid:%d cid:%u", buf, 0x18u);
  }
  if (v10)
  {
    id v11 = (void *)MEMORY[0x1E4F30BB0];
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(v22, 0, sizeof(v22));
    }
    int v14 = [v11 auditTokenToData:v22];
    client = self->_client;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    objc_super v17[2] = __29__LAContext_encodeWithCoder___block_invoke_46;
    v17[3] = &unk_1E63C5170;
    objc_super v18 = v5;
    id v19 = v7;
    int v20 = v10;
    unsigned int v21 = v6;
    id v15 = v7;
    id v13 = v5;
    [(LAClient *)client allowTransferToProcess:v10 receiverAuditTokenData:v14 reply:v17];
  }
  else
  {
    uint64_t v12 = self->_client;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __29__LAContext_encodeWithCoder___block_invoke;
    v23[3] = &unk_1E63C5148;
    id v24 = v4;
    uint64_t v25 = v5;
    id v26 = v7;
    unsigned int v27 = v6;
    id v13 = v7;
    int v14 = v5;
    [(LAClient *)v12 tokenForTransferToUnknownProcess:v23];

    id v15 = v24;
  }
}

void __29__LAContext_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) encodeObject:v5 forKey:@"Token"];
    uint64_t v7 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      objc_super v9 = v7;
      int v10 = [v5 hash];
      int v11 = *(_DWORD *)(a1 + 56);
      int v12 = 138543874;
      uint64_t v13 = v8;
      __int16 v14 = 1024;
      int v15 = v10;
      __int16 v16 = 1024;
      int v17 = v11;
      _os_log_impl(&dword_1BED06000, v9, OS_LOG_TYPE_INFO, "Encoded %{public}@ for transfer with token:%x cid:%u", (uint8_t *)&v12, 0x18u);
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(a1 + 40), OS_LOG_TYPE_ERROR))
  {
    __29__LAContext_encodeWithCoder___block_invoke_cold_1();
  }
}

void __29__LAContext_encodeWithCoder___block_invoke_46(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(a1 + 32);
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __29__LAContext_encodeWithCoder___block_invoke_46_cold_1(a1, v6);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __29__LAContext_encodeWithCoder___block_invoke_46_cold_2();
  }
}

- (void)invalidate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = LALogForCategory();
  unsigned int v4 = +[LAContext newCommandId];
  id v5 = [(LAContext *)self description];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    int v15 = v5;
    __int16 v16 = 1024;
    unsigned int v17 = v4;
    _os_log_impl(&dword_1BED06000, v3, OS_LOG_TYPE_INFO, "Invalidating %{public}@ cid:%u", buf, 0x12u);
  }
  client = self->_client;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __23__LAContext_invalidate__block_invoke;
  v10[3] = &unk_1E63C5198;
  v10[4] = self;
  int v11 = v3;
  id v12 = v5;
  unsigned int v13 = v4;
  id v7 = v5;
  uint64_t v8 = v3;
  objc_super v9 = self;
  [(LAClient *)client invalidateWithReply:v10];
}

void __23__LAContext_invalidate__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = 0;

  if (a2)
  {
    [*(id *)(a1 + 32) _notifyObserversAfterInvalidation];
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
  }
  objc_super v9 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = *(_DWORD *)(a1 + 56);
    id v12 = @"success";
    if (!a2) {
      id v12 = v5;
    }
    int v13 = 138543874;
    uint64_t v14 = v10;
    __int16 v15 = 1024;
    int v16 = v11;
    __int16 v17 = 2114;
    uint64_t v18 = v12;
    _os_log_impl(&dword_1BED06000, v9, v8, "invalidate %{public}@ cid:%u internally returned %{public}@", (uint8_t *)&v13, 0x1Cu);
  }
}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(LAContext *)self _evaluatePolicy:a3 options:v9 log:LALogCategoryForPolicy() cid:+[LAContext newCommandId] synchronous:0 reply:v8];
}

- (id)evaluatePolicy:(int64_t)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(LAContext *)self _evaluatePolicy:a3 options:v8 log:LALogCategoryForPolicy() cid:+[LAContext newCommandId] error:a5];

  return v9;
}

- (void)evaluatePolicy:(LAPolicy)policy localizedReason:(NSString *)localizedReason reply:(void *)reply
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = localizedReason;
  id v9 = reply;
  [(LAContext *)self setEvaluatedPolicyDomainState:0];
  if (![(NSString *)v8 length]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Non-empty localizedReason must be provided."];
  }
  __int16 v17 = &unk_1F19EC7F0;
  v18[0] = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  uint64_t v11 = +[LAContext newCommandId];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__LAContext_evaluatePolicy_localizedReason_reply___block_invoke;
  v14[3] = &unk_1E63C5230;
  id v15 = v10;
  id v16 = v9;
  v14[4] = self;
  id v12 = v10;
  id v13 = v9;
  [(LAContext *)self _evaluatePolicy:policy options:v12 log:8 cid:v11 synchronous:0 reply:v14];
}

void __50__LAContext_evaluatePolicy_localizedReason_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  BOOL v4 = a2 != 0;
  id v5 = [*(id *)(a1 + 32) _publicErrorFromInternalError:a3 options:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, BOOL, id))(v3 + 16))(v3, v4, v5);
}

- (id)_evaluationMechanismsFromReturnedError:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    id v8 = [v5 userInfo];
    id v9 = [v8 objectForKey:@"AvailableMechanisms"];
    uint64_t v10 = [v7 setWithArray:v9];

    uint64_t v11 = 0;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v11 = [MEMORY[0x1E4F30B90] errorWithCode:-1011 message:@"No authentication required."];
  uint64_t v10 = 0;
  if (a4) {
LABEL_3:
  }
    *a4 = v11;
LABEL_4:

  return v10;
}

- (id)evaluationMechanismsForPolicy:(int64_t)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = +[LAContext newCommandId];
  id v8 = LALogForPolicy();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    int v18 = a3;
    __int16 v19 = 2114;
    int v20 = self;
    __int16 v21 = 1024;
    int v22 = v7;
    _os_log_impl(&dword_1BED06000, v8, OS_LOG_TYPE_INFO, "evaluationMechanismsForPolicy:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  uint64_t v25 = &unk_1F19EC808;
  v26[0] = MEMORY[0x1E4F1CC38];
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  id v16 = 0;
  id v10 = [(LAContext *)self _evaluatePolicy:a3 options:v9 log:0 cid:v7 error:&v16];
  id v11 = v16;

  id v12 = [(LAContext *)self _evaluationMechanismsFromReturnedError:v11 error:a4];
  os_log_type_t v13 = 16 * (v12 == 0);
  if (os_log_type_enabled(v8, v13))
  {
    if (v12) {
      id v14 = v12;
    }
    else {
      id v14 = v11;
    }
    *(_DWORD *)buf = 67109890;
    int v18 = a3;
    __int16 v19 = 2114;
    int v20 = self;
    __int16 v21 = 1024;
    int v22 = v7;
    __int16 v23 = 2114;
    id v24 = v14;
    _os_log_impl(&dword_1BED06000, v8, v13, "evaluationMechanismsForPolicy:%d on %{public}@ cid:%u returned %{public}@", buf, 0x22u);
  }

  return v12;
}

- (id)evaluationMechanismsForAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 error:(id *)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v9 = LALogForCategory();
  unsigned int v10 = +[LAContext newCommandId];
  id v11 = [(LAContext *)self description];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v21 = a3;
    __int16 v22 = 2114;
    __int16 v23 = v11;
    __int16 v24 = 1024;
    unsigned int v25 = v10;
    _os_log_impl(&dword_1BED06000, v9, OS_LOG_TYPE_INFO, "evaluationMechanismsForAccessControl:%@ on %{public}@ cid:%u", buf, 0x1Cu);
  }
  __int16 v28 = &unk_1F19EC808;
  v29[0] = MEMORY[0x1E4F1CC38];
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  id v19 = 0;
  id v13 = [(LAContext *)self evaluateAccessControl:a3 operation:a4 options:v12 error:&v19];
  id v14 = v19;

  id v15 = [(LAContext *)self _evaluationMechanismsFromReturnedError:v14 error:a5];
  os_log_type_t v16 = 16 * (v15 == 0);
  if (os_log_type_enabled(v9, v16))
  {
    if (v15) {
      id v17 = v15;
    }
    else {
      id v17 = v14;
    }
    *(_DWORD *)buf = 138413058;
    __int16 v21 = a3;
    __int16 v22 = 2114;
    __int16 v23 = v11;
    __int16 v24 = 1024;
    unsigned int v25 = v10;
    __int16 v26 = 2114;
    id v27 = v17;
    _os_log_impl(&dword_1BED06000, v9, v16, "evaluationMechanismsForAccessControl:%@ on %{public}@ cid:%u returned %{public}@", buf, 0x26u);
  }

  return v15;
}

- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = LALogForCategory();
  unsigned int v11 = +[LAContext newCommandId];
  id v12 = [(LAContext *)self description];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    int v26 = a3;
    __int16 v27 = 2114;
    id v28 = v8;
    __int16 v29 = 2114;
    __int16 v30 = v12;
    __int16 v31 = 1024;
    unsigned int v32 = v11;
    _os_log_impl(&dword_1BED06000, v10, OS_LOG_TYPE_INFO, "failProcessedEvent:%d failureError:%{public}@ on %{public}@ cid:%u", buf, 0x22u);
  }
  client = self->_client;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __51__LAContext_failProcessedEvent_failureError_reply___block_invoke;
  v18[3] = &unk_1E63C5260;
  id v22 = v9;
  int64_t v23 = a3;
  id v19 = v10;
  id v20 = v8;
  unsigned int v24 = v11;
  id v21 = v12;
  id v14 = v9;
  id v15 = v12;
  id v16 = v8;
  id v17 = v10;
  [(LAClient *)client failProcessedEvent:a3 failureError:v16 reply:v18];
}

void __51__LAContext_failProcessedEvent_failureError_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(a1 + 32);
  if (a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = *(_DWORD *)(a1 + 72);
    id v12 = @"success";
    if (!a2) {
      id v12 = v5;
    }
    v14[0] = 67110146;
    v14[1] = v8;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    __int16 v17 = 2114;
    uint64_t v18 = v10;
    __int16 v19 = 1024;
    int v20 = v11;
    __int16 v21 = 2114;
    id v22 = v12;
    _os_log_impl(&dword_1BED06000, v6, v7, "failProcessedEvent:%d failureError:%{public}@ on %{public}@ cid:%u returned %{public}@", (uint8_t *)v14, 0x2Cu);
  }
  uint64_t v13 = *(void *)(a1 + 56);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v13 + 16))(v13, a2, v5);
  }
}

- (void)retryProcessedEvent:(int64_t)a3 reply:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  os_log_type_t v7 = LALogForCategory();
  unsigned int v8 = +[LAContext newCommandId];
  uint64_t v9 = [(LAContext *)self description];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    int v21 = a3;
    __int16 v22 = 2114;
    uint64_t v23 = v9;
    __int16 v24 = 1024;
    unsigned int v25 = v8;
    _os_log_impl(&dword_1BED06000, v7, OS_LOG_TYPE_INFO, "retryProcessEvent:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  client = self->_client;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _DWORD v14[2] = __39__LAContext_retryProcessedEvent_reply___block_invoke;
  v14[3] = &unk_1E63C5288;
  __int16 v15 = v7;
  id v16 = v9;
  unsigned int v19 = v8;
  id v17 = v6;
  int64_t v18 = a3;
  id v11 = v6;
  id v12 = v9;
  uint64_t v13 = v7;
  [(LAClient *)client retryProcessedEvent:a3 reply:v14];
}

void __39__LAContext_retryProcessedEvent_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(NSObject **)(a1 + 32);
  if (a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = *(_DWORD *)(a1 + 64);
    id v11 = @"success";
    if (!a2) {
      id v11 = v5;
    }
    v13[0] = 67109890;
    v13[1] = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 1024;
    int v17 = v10;
    __int16 v18 = 2114;
    unsigned int v19 = v11;
    _os_log_impl(&dword_1BED06000, v6, v7, "retryProcessEvent:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v13, 0x22u);
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v12 + 16))(v12, a2, v5);
  }
}

- (void)resetProcessedEvent:(int64_t)a3 reply:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  os_log_type_t v7 = LALogForCategory();
  unsigned int v8 = +[LAContext newCommandId];
  uint64_t v9 = [(LAContext *)self description];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    int v21 = a3;
    __int16 v22 = 2114;
    uint64_t v23 = v9;
    __int16 v24 = 1024;
    unsigned int v25 = v8;
    _os_log_impl(&dword_1BED06000, v7, OS_LOG_TYPE_INFO, "resetProcessedEvent:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  client = self->_client;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _DWORD v14[2] = __39__LAContext_resetProcessedEvent_reply___block_invoke;
  v14[3] = &unk_1E63C5288;
  uint64_t v15 = v7;
  id v16 = v9;
  unsigned int v19 = v8;
  id v17 = v6;
  int64_t v18 = a3;
  id v11 = v6;
  id v12 = v9;
  uint64_t v13 = v7;
  [(LAClient *)client resetProcessedEvent:a3 reply:v14];
}

void __39__LAContext_resetProcessedEvent_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(NSObject **)(a1 + 32);
  if (a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = *(_DWORD *)(a1 + 64);
    id v11 = @"success";
    if (!a2) {
      id v11 = v5;
    }
    v13[0] = 67109890;
    v13[1] = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 1024;
    int v17 = v10;
    __int16 v18 = 2114;
    unsigned int v19 = v11;
    _os_log_impl(&dword_1BED06000, v6, v7, "resetProcessedEvent:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v13, 0x22u);
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v12 + 16))(v12, a2, v5);
  }
}

- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = LALogForCategory();
  unsigned int v10 = +[LAContext newCommandId];
  id v11 = [(LAContext *)self description];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    int v23 = a3;
    __int16 v24 = 1024;
    BOOL v25 = v5;
    __int16 v26 = 2114;
    __int16 v27 = v11;
    __int16 v28 = 1024;
    unsigned int v29 = v10;
    _os_log_impl(&dword_1BED06000, v9, OS_LOG_TYPE_INFO, "pauseProcessedEvent:%d pause:%d on %{public}@ cid:%u", buf, 0x1Eu);
  }
  client = self->_client;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__LAContext_pauseProcessedEvent_pause_reply___block_invoke;
  v16[3] = &unk_1E63C5288;
  int v17 = v9;
  id v18 = v11;
  unsigned int v21 = v10;
  id v19 = v8;
  int64_t v20 = a3;
  id v13 = v8;
  id v14 = v11;
  uint64_t v15 = v9;
  [(LAClient *)client pauseProcessedEvent:a3 pause:v5 reply:v16];
}

void __45__LAContext_pauseProcessedEvent_pause_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = a3;
  id v6 = *(NSObject **)(a1 + 32);
  if (a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = *(_DWORD *)(a1 + 64);
    id v11 = @"success";
    if (!a2) {
      id v11 = v5;
    }
    v13[0] = 67109890;
    v13[1] = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 1024;
    int v17 = v10;
    __int16 v18 = 2114;
    id v19 = v11;
    _os_log_impl(&dword_1BED06000, v6, v7, "pauseProcessedEvent:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v13, 0x22u);
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v12 + 16))(v12, a2, v5);
  }
}

- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a3;
  uint64_t v12 = LALogForCategory();
  unsigned int v13 = +[LAContext newCommandId];
  __int16 v14 = [(LAContext *)self description];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    int v27 = a4;
    __int16 v28 = 1024;
    int v29 = a5;
    __int16 v30 = 2114;
    __int16 v31 = v14;
    __int16 v32 = 1024;
    unsigned int v33 = v13;
    _os_log_impl(&dword_1BED06000, v12, OS_LOG_TYPE_INFO, "setCredential:forProcessedEvent:%d credentialType:%d on %{public}@ cid:%u", buf, 0x1Eu);
  }
  client = self->_client;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__LAContext_setCredential_forProcessedEvent_credentialType_reply___block_invoke;
  v19[3] = &unk_1E63C52B0;
  int64_t v23 = a4;
  int64_t v24 = a5;
  uint64_t v20 = v12;
  id v21 = v14;
  unsigned int v25 = v13;
  id v22 = v10;
  id v16 = v10;
  id v17 = v14;
  __int16 v18 = v12;
  [(LAClient *)client setCredential:v11 forProcessedEvent:a4 credentialType:a5 reply:v19];
}

void __66__LAContext_setCredential_forProcessedEvent_credentialType_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v5 = a3;
  id v6 = *(NSObject **)(a1 + 32);
  if (a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = *(_DWORD *)(a1 + 72);
    uint64_t v12 = @"success";
    if (!a2) {
      uint64_t v12 = v5;
    }
    v14[0] = 67110146;
    v14[1] = v8;
    __int16 v15 = 1024;
    int v16 = v9;
    __int16 v17 = 2114;
    uint64_t v18 = v10;
    __int16 v19 = 1024;
    int v20 = v11;
    __int16 v21 = 2114;
    id v22 = v12;
    _os_log_impl(&dword_1BED06000, v6, v7, "setCredential:forProcessedEvent:%d credentialType:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v14, 0x28u);
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v13 + 16))(v13, a2, v5);
  }
}

- (void)evaluateAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 options:(id)a5 reply:(id)a6
{
  uint64_t v10 = NSNumber;
  id v11 = a6;
  id v12 = a5;
  id v13 = [v10 numberWithInteger:a4];
  [(LAContext *)self _evaluateAccessControl:a3 operation:v13 options:v12 log:LALogCategoryForOptions() cid:+[LAContext newCommandId] synchronous:0 reply:v11];
}

- (void)evaluateAccessControl:(__SecAccessControl *)a3 aksOperation:(void *)a4 options:(id)a5 reply:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  [(LAContext *)self _evaluateAccessControl:a3 operation:a4 options:v11 log:LALogCategoryForOptions() cid:+[LAContext newCommandId] synchronous:0 reply:v10];
}

- (void)_evaluateAccessControl:(__SecAccessControl *)a3 operation:(id)a4 options:(id)a5 log:(int64_t)a6 cid:(unsigned int)a7 synchronous:(BOOL)a8 reply:(id)a9
{
  BOOL v25 = a8;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a9;
  if (a6)
  {
    __int16 v17 = [(LAContext *)self description];
    uint64_t v18 = LALogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = "async";
      *(_DWORD *)buf = 138544642;
      unsigned int v33 = a3;
      if (v25) {
        __int16 v19 = "sync";
      }
      __int16 v34 = 2114;
      id v35 = v14;
      __int16 v36 = 2114;
      id v37 = v15;
      __int16 v38 = 2114;
      v39 = v17;
      __int16 v40 = 2082;
      v41 = v19;
      __int16 v42 = 1024;
      unsigned int v43 = a7;
      _os_log_impl(&dword_1BED06000, v18, OS_LOG_TYPE_DEFAULT, "evaluateAccessControl:%{public}@ operation:%{public}@ options:%{public}@ on %{public}@ (%{public}s) cid:%u", buf, 0x3Au);
    }

    if (a3) {
      goto LABEL_7;
    }
LABEL_9:
    int v20 = 0;
    goto LABEL_10;
  }
  __int16 v17 = 0;
  if (!a3) {
    goto LABEL_9;
  }
LABEL_7:
  int v20 = (void *)SecAccessControlCopyData();
LABEL_10:
  client = self->_client;
  id v22 = [(LAContext *)self uiDelegate];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  void v26[2] = __80__LAContext__evaluateAccessControl_operation_options_log_cid_synchronous_reply___block_invoke;
  v26[3] = &unk_1E63C52D8;
  int v29 = a3;
  int64_t v30 = a6;
  unsigned int v31 = a7;
  id v27 = v17;
  id v28 = v16;
  id v23 = v16;
  id v24 = v17;
  [(LAClient *)client evaluateACL:v20 operation:v14 options:v15 uiDelegate:v22 synchronous:v25 reply:v26];
}

void __80__LAContext__evaluateAccessControl_operation_options_log_cid_synchronous_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    *(void *)id v13 = 0;
    if (!LAUpdateAccessControl(*(void *)(a1 + 48), v5, v13))
    {

      os_log_type_t v7 = *(void **)v13;
      id v5 = 0;
      id v6 = v7;
    }
  }
  if (*(void *)(a1 + 56))
  {
    uint64_t v8 = LALogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = *(_DWORD *)(a1 + 64);
      if (v5) {
        id v11 = v5;
      }
      else {
        id v11 = v6;
      }
      *(_DWORD *)id v13 = 138543874;
      *(void *)&v13[4] = v9;
      __int16 v14 = 1024;
      int v15 = v10;
      __int16 v16 = 2114;
      id v17 = v11;
      _os_log_impl(&dword_1BED06000, v8, OS_LOG_TYPE_DEFAULT, "evaluateAccessControl on %{public}@ cid:%u returned %{public}@", v13, 0x1Cu);
    }
  }
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, id, id))(v12 + 16))(v12, v5, v6);
  }
}

- (void)evaluateAccessControl:(SecAccessControlRef)accessControl operation:(LAAccessControlOperation)operation localizedReason:(NSString *)localizedReason reply:(void *)reply
{
  v22[1] = *MEMORY[0x1E4F143B8];
  int v10 = localizedReason;
  id v11 = reply;
  if (![(NSString *)v10 length]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Non-empty localizedReason must be provided."];
  }
  __int16 v21 = &unk_1F19EC7F0;
  v22[0] = v10;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  id v13 = [NSNumber numberWithInteger:operation];
  uint64_t v14 = LALogCategoryForOptions();
  uint64_t v15 = +[LAContext newCommandId];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __67__LAContext_evaluateAccessControl_operation_localizedReason_reply___block_invoke;
  v18[3] = &unk_1E63C5230;
  id v19 = v12;
  id v20 = v11;
  void v18[4] = self;
  id v16 = v12;
  id v17 = v11;
  [(LAContext *)self _evaluateAccessControl:accessControl operation:v13 options:v16 log:v14 cid:v15 synchronous:0 reply:v18];
}

void __67__LAContext_evaluateAccessControl_operation_localizedReason_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    BOOL v4 = a2 != 0;
    id v5 = [*(id *)(a1 + 32) _publicErrorFromInternalError:a3 options:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, BOOL, id))(v3 + 16))(v3, v4, v5);
  }
}

- (id)evaluateAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a5;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  __int16 v26 = __Block_byref_object_copy__4;
  id v27 = __Block_byref_object_dispose__4;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__4;
  __int16 v21 = __Block_byref_object_dispose__4;
  id v22 = 0;
  id v11 = [NSNumber numberWithInteger:a4];
  uint64_t v12 = LALogCategoryForOptions();
  uint64_t v13 = +[LAContext newCommandId];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__LAContext_evaluateAccessControl_operation_options_error___block_invoke;
  v16[3] = &unk_1E63C51F8;
  void v16[4] = &v23;
  v16[5] = &v17;
  [(LAContext *)self _evaluateAccessControl:a3 operation:v11 options:v10 log:v12 cid:v13 synchronous:1 reply:v16];

  if (a6) {
    *a6 = (id) v18[5];
  }
  id v14 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v14;
}

void __59__LAContext_evaluateAccessControl_operation_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)evaluateAccessControl:(__SecAccessControl *)a3 aksOperation:(void *)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__4;
  __int16 v26 = __Block_byref_object_dispose__4;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__4;
  id v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v11 = LALogCategoryForOptions();
  uint64_t v12 = +[LAContext newCommandId];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__LAContext_evaluateAccessControl_aksOperation_options_error___block_invoke;
  v15[3] = &unk_1E63C51F8;
  void v15[4] = &v22;
  v15[5] = &v16;
  [(LAContext *)self _evaluateAccessControl:a3 operation:a4 options:v10 log:v11 cid:v12 synchronous:1 reply:v15];
  if (a6) {
    *a6 = (id) v17[5];
  }
  id v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);

  return v13;
}

void __62__LAContext_evaluateAccessControl_aksOperation_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (LABiometryType)biometryType
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (_cachedBiometryType)
  {
    LABiometryType v2 = [(id)_cachedBiometryType integerValue];
  }
  else
  {
    uint64_t v3 = [(LAContext *)self domainState];
    BOOL v4 = [v3 biometry];
    LABiometryType v2 = [v4 biometryType];
  }
  id v5 = LALogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v2;
    _os_log_impl(&dword_1BED06000, v5, OS_LOG_TYPE_DEFAULT, "returned biometryType: %d", (uint8_t *)v7, 8u);
  }

  return v2;
}

- (LADomainState)domainState
{
  return (LADomainState *)[(LAContext *)self domainStateWithOptions:0];
}

- (id)domainStateWithOptions:(id)a3
{
  id v4 = a3;
  domainStateCache = self->_domainStateCache;
  if (!domainStateCache)
  {
    objc_initWeak(&location, self);
    id v6 = objc_alloc(MEMORY[0x1E4F72F30]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __36__LAContext_domainStateWithOptions___block_invoke;
    v15[3] = &unk_1E63C5300;
    objc_copyWeak(&v16, &location);
    void v15[4] = self;
    uint64_t v7 = (LACCacheSync *)[v6 initWithTimeout:v15 block:0.5];
    uint64_t v8 = self->_domainStateCache;
    self->_domainStateCache = v7;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    domainStateCache = self->_domainStateCache;
  }
  uint64_t v9 = [(LACCacheSync *)domainStateCache valueWithParameter:v4 error:0];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    uint64_t v12 = [LADomainState alloc];
    id v11 = [(LADomainState *)v12 initWithResult:MEMORY[0x1E4F1CC08]];
  }
  id v13 = v11;

  return v13;
}

id __36__LAContext_domainStateWithOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v7 = [*(id *)(a1 + 32) _fetchDomainStateWithOptions:v5 error:a3];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_fetchDomainStateWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = LALogCategoryForOptions();
  if (v7)
  {
    uint64_t v8 = [(LAContext *)self description];
    uint64_t v9 = LALogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1BED06000, v9, OS_LOG_TYPE_DEFAULT, "DomainState on %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__4;
  __int16 v36 = __Block_byref_object_dispose__4;
  id v37 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  int64_t v30 = __Block_byref_object_copy__4;
  unsigned int v31 = __Block_byref_object_dispose__4;
  id v32 = 0;
  client = self->_client;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __48__LAContext__fetchDomainStateWithOptions_error___block_invoke;
  uint64_t v22 = &unk_1E63C5328;
  uint64_t v26 = v7;
  id v11 = v8;
  id v23 = v11;
  p_long long buf = &buf;
  uint64_t v25 = &v27;
  [(LAClient *)client getDomainStateWithOptions:v6 synchronous:1 reply:&v19];
  uint64_t v12 = [LADomainState alloc];
  id v13 = -[LADomainState initWithResult:](v12, "initWithResult:", *(void *)(*((void *)&buf + 1) + 40), v19, v20, v21, v22);
  id v14 = NSNumber;
  uint64_t v15 = [(LADomainState *)v13 biometry];
  uint64_t v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "biometryType"));
  uint64_t v17 = (void *)_cachedBiometryType;
  _cachedBiometryType = v16;

  if (a4) {
    *a4 = (id) v28[5];
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&buf, 8);

  return v13;
}

void __48__LAContext__fetchDomainStateWithOptions_error___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1[7])
  {
    uint64_t v7 = LALogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      if (v5) {
        id v9 = v5;
      }
      else {
        id v9 = v6;
      }
      int v15 = 138543618;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      id v18 = v9;
      _os_log_impl(&dword_1BED06000, v7, OS_LOG_TYPE_DEFAULT, "DomainState on %{public}@ returned: %{public}@", (uint8_t *)&v15, 0x16u);
    }
  }
  uint64_t v10 = *(void *)(a1[5] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
  id v12 = v5;

  uint64_t v13 = *(void *)(a1[6] + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (BOOL)setCredential:(NSData *)credential type:(LACredentialType)type
{
  id v6 = credential;
  LOBYTE(type) = [(LAContext *)self _setCredential:v6 type:type log:1 cid:+[LAContext newCommandId] error:0];

  return type;
}

- (BOOL)setCredential:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  LOBYTE(a5) = [(LAContext *)self _setCredential:v8 type:a4 log:16 cid:+[LAContext newCommandId] error:a5];

  return (char)a5;
}

- (BOOL)_setCredential:(id)a3 type:(int64_t)a4 log:(int64_t)a5 cid:(unsigned int)a6 error:(id *)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = [(LAContext *)self description];
  uint64_t v13 = LALogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = a4;
    LOWORD(v31) = 2114;
    *(void *)((char *)&v31 + 2) = v12;
    WORD5(v31) = 1024;
    HIDWORD(v31) = a6;
    _os_log_impl(&dword_1BED06000, v13, OS_LOG_TYPE_INFO, "setCredential:type:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  *(void *)long long buf = 0;
  *(void *)&long long v31 = buf;
  *((void *)&v31 + 1) = 0x3032000000;
  id v32 = __Block_byref_object_copy__4;
  unsigned int v33 = __Block_byref_object_dispose__4;
  id v34 = 0;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  client = self->_client;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __47__LAContext__setCredential_type_log_cid_error___block_invoke;
  v22[3] = &unk_1E63C5350;
  uint64_t v16 = v13;
  id v23 = v16;
  id v17 = v11;
  id v24 = v17;
  int64_t v28 = a4;
  id v18 = v12;
  unsigned int v29 = a6;
  id v25 = v18;
  uint64_t v27 = buf;
  uint64_t v19 = v14;
  uint64_t v26 = v19;
  [(LAClient *)client setCredential:v17 type:a4 reply:v22];
  dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  if (a7) {
    *a7 = *(id *)(v31 + 40);
  }
  BOOL v20 = *(void *)(v31 + 40) == 0;

  _Block_object_dispose(buf, 8);
  return v20;
}

void __47__LAContext__setCredential_type_log_cid_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(NSObject **)(a1 + 32);
  if (a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    BOOL v9 = *(void *)(a1 + 40) != 0;
    uint64_t v10 = *(void *)(a1 + 72);
    int v11 = *(_DWORD *)(a1 + 80);
    id v12 = @"success";
    if (!a2) {
      id v12 = v5;
    }
    v16[0] = 67110146;
    v16[1] = v9;
    __int16 v17 = 1024;
    int v18 = v10;
    __int16 v19 = 2114;
    uint64_t v20 = v8;
    __int16 v21 = 1024;
    int v22 = v11;
    __int16 v23 = 2114;
    id v24 = v12;
    _os_log_impl(&dword_1BED06000, v6, v7, "setCredential:%d type:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v16, 0x28u);
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  dispatch_semaphore_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v5;
  int v15 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (void)setCredential:(id)a3 type:(int64_t)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(LAContext *)self _setCredential:v9 type:a4 log:16 cid:+[LAContext newCommandId] reply:v8];
}

- (void)_setCredential:(id)a3 type:(int64_t)a4 log:(int64_t)a5 cid:(unsigned int)a6 reply:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  uint64_t v13 = [(LAContext *)self description];
  dispatch_semaphore_t v14 = LALogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109634;
    int v28 = a4;
    __int16 v29 = 2114;
    int64_t v30 = v13;
    __int16 v31 = 1024;
    unsigned int v32 = a6;
    _os_log_impl(&dword_1BED06000, v14, OS_LOG_TYPE_INFO, "setCredential:type:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  client = self->_client;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__LAContext__setCredential_type_log_cid_reply___block_invoke;
  v20[3] = &unk_1E63C5260;
  __int16 v21 = v14;
  id v22 = v11;
  id v24 = v12;
  int64_t v25 = a4;
  unsigned int v26 = a6;
  id v23 = v13;
  id v16 = v12;
  id v17 = v13;
  id v18 = v11;
  __int16 v19 = v14;
  [(LAClient *)client setCredential:v18 type:a4 reply:v20];
}

void __47__LAContext__setCredential_type_log_cid_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(NSObject **)(a1 + 32);
  if (a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    BOOL v9 = *(void *)(a1 + 40) != 0;
    uint64_t v10 = *(void *)(a1 + 64);
    int v11 = *(_DWORD *)(a1 + 72);
    id v12 = @"success";
    if (!a2) {
      id v12 = v5;
    }
    v14[0] = 67110146;
    v14[1] = v9;
    __int16 v15 = 1024;
    int v16 = v10;
    __int16 v17 = 2114;
    uint64_t v18 = v8;
    __int16 v19 = 1024;
    int v20 = v11;
    __int16 v21 = 2114;
    id v22 = v12;
    _os_log_impl(&dword_1BED06000, v6, v7, "setCredential:%d type:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v14, 0x28u);
  }
  uint64_t v13 = *(void *)(a1 + 56);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v13 + 16))(v13, a2, v5);
  }
}

- (void)credentialOfType:(int64_t)a3 reply:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  os_log_type_t v7 = LALogForCategory();
  unsigned int v8 = +[LAContext newCommandId];
  BOOL v9 = [(LAContext *)self description];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109634;
    int v21 = a3;
    __int16 v22 = 2114;
    uint64_t v23 = v9;
    __int16 v24 = 1024;
    unsigned int v25 = v8;
    _os_log_impl(&dword_1BED06000, v7, OS_LOG_TYPE_INFO, "credentialOfType:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  client = self->_client;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _DWORD v14[2] = __36__LAContext_credentialOfType_reply___block_invoke;
  v14[3] = &unk_1E63C5378;
  __int16 v15 = v7;
  id v16 = v9;
  unsigned int v19 = v8;
  id v17 = v6;
  int64_t v18 = a3;
  id v11 = v6;
  id v12 = v9;
  uint64_t v13 = v7;
  [(LAClient *)client credentialOfType:a3 reply:v14];
}

void __36__LAContext_credentialOfType_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 || [MEMORY[0x1E4F30B90] error:v6 hasCode:-1008])
  {
    os_log_type_t v7 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = *(_DWORD *)(a1 + 64);
      v11[0] = 67109634;
      v11[1] = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      __int16 v14 = 1024;
      int v15 = v10;
      _os_log_impl(&dword_1BED06000, v7, OS_LOG_TYPE_DEFAULT, "credentialOfType:%d on %{public}@ cid:%u returned", (uint8_t *)v11, 0x18u);
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR))
  {
    __36__LAContext_credentialOfType_reply___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)credentialOfType:(int64_t)a3 error:(id *)a4
{
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3032000000;
  __int16 v24 = __Block_byref_object_copy__4;
  unsigned int v25 = __Block_byref_object_dispose__4;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  int64_t v18 = __Block_byref_object_copy__4;
  unsigned int v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _DWORD v11[2] = __36__LAContext_credentialOfType_error___block_invoke;
  v11[3] = &unk_1E63C53A0;
  uint64_t v13 = &v21;
  __int16 v14 = &v15;
  uint64_t v8 = v7;
  __int16 v12 = v8;
  [(LAContext *)self credentialOfType:a3 reply:v11];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = (id) v16[5];
  }
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __36__LAContext_credentialOfType_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isCredentialSet:(LACredentialType)type
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = LALogForCategory();
  unsigned int v6 = +[LAContext newCommandId];
  uint64_t v7 = [(LAContext *)self description];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = type;
    LOWORD(v23) = 2114;
    *(void *)((char *)&v23 + 2) = v7;
    WORD5(v23) = 1024;
    HIDWORD(v23) = v6;
    _os_log_impl(&dword_1BED06000, v5, OS_LOG_TYPE_INFO, "isCredentialSet:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  *(void *)long long buf = 0;
  *(void *)&long long v23 = buf;
  *((void *)&v23 + 1) = 0x2020000000;
  char v24 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  client = self->_client;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __29__LAContext_isCredentialSet___block_invoke;
  v15[3] = &unk_1E63C53C8;
  unsigned int v19 = buf;
  int v10 = v8;
  uint64_t v16 = v10;
  id v11 = v5;
  uint64_t v17 = v11;
  LACredentialType v20 = type;
  id v12 = v7;
  id v18 = v12;
  unsigned int v21 = v6;
  [(LAClient *)client isCredentialSet:type reply:v15];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v13 = *(unsigned char *)(v23 + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v13;
}

void __29__LAContext_isCredentialSet___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  unsigned int v6 = *(id *)(a1 + 40);
  if (a2)
  {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else if ([MEMORY[0x1E4F30B90] error:v5 hasCode:-1008])
  {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = *(void *)(a1 + 64);
    int v9 = *(_DWORD *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 48);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      id v11 = @"YES";
    }
    else {
      id v11 = v5;
    }
    v12[0] = 67109890;
    v12[1] = v8;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    __int16 v15 = 1024;
    int v16 = v9;
    __int16 v17 = 2114;
    id v18 = v11;
    _os_log_impl(&dword_1BED06000, v6, v7, "isCredentialSet:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v12, 0x22u);
  }
}

- (void)setOptions:(id)a3 forInternalOperation:(int64_t)a4 reply:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = LALogForCategory();
  unsigned int v11 = +[LAContext newCommandId];
  id v12 = [(LAContext *)self description];
  __int16 v13 = v10;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109890;
    int v27 = [v8 hash];
    __int16 v28 = 1024;
    int v29 = a4;
    __int16 v30 = 2114;
    __int16 v31 = v12;
    __int16 v32 = 1024;
    unsigned int v33 = v11;
    _os_log_impl(&dword_1BED06000, v13, OS_LOG_TYPE_INFO, "setOptions:%x forInternalOperation:%d on %{public}@ cid:%u", buf, 0x1Eu);
  }

  client = self->_client;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__LAContext_setOptions_forInternalOperation_reply___block_invoke;
  v19[3] = &unk_1E63C5260;
  LACredentialType v20 = v13;
  id v21 = v8;
  id v23 = v9;
  int64_t v24 = a4;
  unsigned int v25 = v11;
  id v22 = v12;
  id v15 = v9;
  id v16 = v12;
  id v17 = v8;
  id v18 = v13;
  [(LAClient *)client setOptions:v17 forInternalOperation:a4 reply:v19];
}

void __51__LAContext_setOptions_forInternalOperation_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unsigned int v6 = *(void **)(a1 + 32);
  if (a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = v6;
    int v10 = [v8 hash];
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 48);
    int v13 = *(_DWORD *)(a1 + 72);
    uint64_t v14 = @"success";
    if (!a2) {
      uint64_t v14 = v5;
    }
    v16[0] = 67110146;
    v16[1] = v10;
    __int16 v17 = 1024;
    int v18 = v11;
    __int16 v19 = 2114;
    uint64_t v20 = v12;
    __int16 v21 = 1024;
    int v22 = v13;
    __int16 v23 = 2114;
    int64_t v24 = v14;
    _os_log_impl(&dword_1BED06000, v9, v7, "setOptions:%x forInternalOperation:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v16, 0x28u);
  }
  uint64_t v15 = *(void *)(a1 + 56);
  if (v15) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v15 + 16))(v15, a2, v5);
  }
}

- (void)optionsForInternalOperation:(int64_t)a3 reply:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  os_log_type_t v7 = LALogForCategory();
  unsigned int v8 = +[LAContext newCommandId];
  id v9 = [(LAContext *)self description];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109634;
    int v21 = a3;
    __int16 v22 = 2114;
    __int16 v23 = v9;
    __int16 v24 = 1024;
    unsigned int v25 = v8;
    _os_log_impl(&dword_1BED06000, v7, OS_LOG_TYPE_INFO, "optionsForInternalOperation:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  client = self->_client;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _DWORD v14[2] = __47__LAContext_optionsForInternalOperation_reply___block_invoke;
  v14[3] = &unk_1E63C53F0;
  uint64_t v15 = v7;
  id v16 = v9;
  unsigned int v19 = v8;
  id v17 = v6;
  int64_t v18 = a3;
  id v11 = v6;
  id v12 = v9;
  int v13 = v7;
  [(LAClient *)client optionsForInternalOperation:a3 reply:v14];
}

void __47__LAContext_optionsForInternalOperation_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_log_type_t v7 = *(id *)(a1 + 32);
  os_log_type_t v8 = 16 * (v5 == 0);
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = *(_DWORD *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = *(_DWORD *)(a1 + 64);
    if (v5)
    {
      id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "hash"));
    }
    else
    {
      id v12 = v6;
    }
    v13[0] = 67109890;
    v13[1] = v9;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    __int16 v16 = 1024;
    int v17 = v11;
    __int16 v18 = 2114;
    unsigned int v19 = v12;
    _os_log_impl(&dword_1BED06000, v7, v8, "optionsForInternalOperation:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v13, 0x22u);
    if (v5) {
  }
    }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)prearmTouchIDWithReply:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LALogForCategory();
  unsigned int v6 = +[LAContext newCommandId];
  os_log_type_t v7 = [(LAContext *)self description];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543618;
    __int16 v18 = v7;
    __int16 v19 = 1024;
    unsigned int v20 = v6;
    _os_log_impl(&dword_1BED06000, v5, OS_LOG_TYPE_INFO, "prearmTouchIDWithReply on %{public}@ cid:%u", buf, 0x12u);
  }
  client = self->_client;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  _DWORD v12[2] = __36__LAContext_prearmTouchIDWithReply___block_invoke;
  v12[3] = &unk_1E63C5418;
  void v12[4] = self;
  int v13 = v5;
  unsigned int v16 = v6;
  id v14 = v7;
  id v15 = v4;
  id v9 = v4;
  id v10 = v7;
  int v11 = v5;
  [(LAClient *)client prearmTouchIdWithReply:v12];
}

void __36__LAContext_prearmTouchIDWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  os_log_type_t v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
  }
  id v9 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = *(_DWORD *)(a1 + 64);
    id v12 = @"success";
    if (!v6) {
      id v12 = v7;
    }
    int v13 = 138543874;
    uint64_t v14 = v10;
    __int16 v15 = 1024;
    int v16 = v11;
    __int16 v17 = 2114;
    __int16 v18 = v12;
    _os_log_impl(&dword_1BED06000, v9, v8, "prearmTouchIDWithReply on %{public}@ cid:%u returned %{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)resetWithReply:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LALogForCategory();
  unsigned int v6 = +[LAContext newCommandId];
  os_log_type_t v7 = [(LAContext *)self description];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543618;
    __int16 v18 = v7;
    __int16 v19 = 1024;
    unsigned int v20 = v6;
    _os_log_impl(&dword_1BED06000, v5, OS_LOG_TYPE_INFO, "resetWithReply on %{public}@ cid:%u", buf, 0x12u);
  }
  client = self->_client;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  _DWORD v12[2] = __28__LAContext_resetWithReply___block_invoke;
  v12[3] = &unk_1E63C5440;
  int v13 = v5;
  id v14 = v7;
  unsigned int v16 = v6;
  id v15 = v4;
  id v9 = v4;
  id v10 = v7;
  int v11 = v5;
  [(LAClient *)client resetProcessedEvent:0 reply:v12];
}

void __28__LAContext_resetWithReply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unsigned int v6 = *(NSObject **)(a1 + 32);
  if (a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = *(_DWORD *)(a1 + 56);
    id v10 = @"success";
    if (!a2) {
      id v10 = v5;
    }
    int v12 = 138543874;
    uint64_t v13 = v8;
    __int16 v14 = 1024;
    int v15 = v9;
    __int16 v16 = 2114;
    __int16 v17 = v10;
    _os_log_impl(&dword_1BED06000, v6, v7, "resetWithReply on %{public}@ cid:%u returned %{public}@", (uint8_t *)&v12, 0x1Cu);
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v11 + 16))(v11, a2, v5);
  }
}

- (void)authMethodWithReply:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LALogForCategory();
  unsigned int v6 = +[LAContext newCommandId];
  os_log_type_t v7 = [(LAContext *)self description];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543618;
    uint64_t v18 = v7;
    __int16 v19 = 1024;
    unsigned int v20 = v6;
    _os_log_impl(&dword_1BED06000, v5, OS_LOG_TYPE_INFO, "authMethodWithReply on %{public}@ cid:%u", buf, 0x12u);
  }
  client = self->_client;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  _DWORD v12[2] = __33__LAContext_authMethodWithReply___block_invoke;
  v12[3] = &unk_1E63C5468;
  uint64_t v13 = v5;
  id v14 = v7;
  unsigned int v16 = v6;
  id v15 = v4;
  id v9 = v4;
  id v10 = v7;
  uint64_t v11 = v5;
  [(LAClient *)client authMethodWithReply:v12];
}

void __33__LAContext_authMethodWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_log_type_t v7 = *(id *)(a1 + 32);
  os_log_type_t v8 = 16 * (v5 == 0);
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = *(_DWORD *)(a1 + 56);
    if (v5)
    {
      uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "hash"));
    }
    else
    {
      uint64_t v11 = v6;
    }
    int v12 = 138543874;
    uint64_t v13 = v9;
    __int16 v14 = 1024;
    int v15 = v10;
    __int16 v16 = 2114;
    __int16 v17 = v11;
    _os_log_impl(&dword_1BED06000, v7, v8, "authMethodWithReply on %{public}@ cid:%u returned %{public}@", (uint8_t *)&v12, 0x1Cu);
    if (v5) {
  }
    }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 reply:(id)a5
{
  BOOL v6 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = LALogForCategory();
  unsigned int v10 = +[LAContext newCommandId];
  uint64_t v11 = [(LAContext *)self description];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109890;
    BOOL v24 = v6;
    __int16 v25 = 1024;
    int v26 = a4;
    __int16 v27 = 2114;
    __int16 v28 = v11;
    __int16 v29 = 1024;
    unsigned int v30 = v10;
    _os_log_impl(&dword_1BED06000, v9, OS_LOG_TYPE_INFO, "setShowingCoachingHint:%d event:%d on %{public}@ cid:%u", buf, 0x1Eu);
  }
  client = self->_client;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  _DWORD v16[2] = __48__LAContext_setShowingCoachingHint_event_reply___block_invoke;
  v16[3] = &unk_1E63C5490;
  BOOL v22 = v6;
  __int16 v17 = v9;
  id v18 = v11;
  unsigned int v21 = v10;
  id v19 = v8;
  int64_t v20 = a4;
  id v13 = v8;
  id v14 = v11;
  int v15 = v9;
  [(LAClient *)client setShowingCoachingHint:v6 event:a4 reply:v16];
}

void __48__LAContext_setShowingCoachingHint_event_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = *(NSObject **)(a1 + 32);
  if (a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    int v8 = *(unsigned __int8 *)(a1 + 68);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = *(_DWORD *)(a1 + 64);
    int v12 = @"success";
    if (!a2) {
      int v12 = v5;
    }
    v14[0] = 67110146;
    v14[1] = v8;
    __int16 v15 = 1024;
    int v16 = v9;
    __int16 v17 = 2114;
    uint64_t v18 = v10;
    __int16 v19 = 1024;
    int v20 = v11;
    __int16 v21 = 2114;
    BOOL v22 = v12;
    _os_log_impl(&dword_1BED06000, v6, v7, "setShowingCoachingHint:%d event:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v14, 0x28u);
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v13 + 16))(v13, a2, v5);
  }
}

- (BOOL)checkContextValidWithError:(id *)a3
{
  if (a3)
  {
    *a3 = [(LAClient *)self->_client permanentError];
  }
  id v5 = [(LAClient *)self->_client permanentError];
  BOOL v6 = v5 == 0;

  return v6;
}

- (BOOL)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  int v12 = LALogForCategory();
  unsigned int v13 = +[LAContext newCommandId];
  id v14 = [(LAContext *)self description];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138544386;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v35) = a5;
    WORD2(v35) = 2114;
    *(void *)((char *)&v35 + 6) = v14;
    HIWORD(v35) = 1024;
    LODWORD(v36) = v13;
    _os_log_impl(&dword_1BED06000, v12, OS_LOG_TYPE_INFO, "verifyFileVaultUser:%{public}@ volumeUuid:%{public}@ options:%u on %{public}@ cid:%u", buf, 0x2Cu);
  }
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v35 = __Block_byref_object_copy__4;
  *((void *)&v35 + 1) = __Block_byref_object_dispose__4;
  id v36 = 0;
  client = self->_client;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __58__LAContext_verifyFileVaultUser_volumeUuid_options_error___block_invoke;
  v22[3] = &unk_1E63C54B8;
  int v16 = v12;
  uint64_t v23 = v16;
  id v17 = v10;
  id v24 = v17;
  id v18 = v11;
  id v25 = v18;
  id v19 = v14;
  unsigned int v29 = v13;
  id v26 = v19;
  __int16 v27 = &v30;
  __int16 v28 = buf;
  [(LAClient *)client verifyFileVaultUser:v17 volumeUuid:v18 options:a5 reply:v22];
  if (a6) {
    *a6 = *(id *)(*(void *)&buf[8] + 40);
  }
  BOOL v20 = *((unsigned char *)v31 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v30, 8);

  return v20;
}

void __58__LAContext_verifyFileVaultUser_volumeUuid_options_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = *(NSObject **)(a1 + 32);
  if (a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    int v11 = *(_DWORD *)(a1 + 80);
    int v12 = @"success";
    if (!a2) {
      int v12 = v5;
    }
    int v15 = 138544386;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    __int16 v21 = 1024;
    int v22 = v11;
    __int16 v23 = 2114;
    id v24 = v12;
    _os_log_impl(&dword_1BED06000, v6, v7, "verifyFileVaultUser:%{public}@ volumeUuid:%{public}@ on %{public}@ cid:%u returned %{public}@", (uint8_t *)&v15, 0x30u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
  uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v5;
}

- (id)_serverPropertyValueForOption:(int64_t)a3
{
  return [(LAContext *)self _serverPropertyValueForOption:a3 log:16];
}

- (id)_serverPropertyValueForOption:(int64_t)a3 log:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v6 = LALogForCategory();
  unsigned int v7 = +[LAContext newCommandId];
  uint64_t v8 = [(LAContext *)self description];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109634;
    int v19 = a3;
    __int16 v20 = 2114;
    __int16 v21 = v8;
    __int16 v22 = 1024;
    unsigned int v23 = v7;
    _os_log_impl(&dword_1BED06000, v6, OS_LOG_TYPE_INFO, "serverPropertyValueForOption:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  client = self->_client;
  id v17 = 0;
  uint64_t v10 = [(LAClient *)client serverPropertyForOption:a3 error:&v17];
  id v11 = v17;
  int v12 = [MEMORY[0x1E4F1CA98] null];
  int v13 = [v10 isEqual:v12];

  if (v13)
  {

    uint64_t v10 = 0;
  }
  os_log_type_t v14 = 16 * (v11 != 0);
  if (os_log_type_enabled(v6, v14))
  {
    if (v11) {
      id v15 = v11;
    }
    else {
      id v15 = v10;
    }
    *(_DWORD *)long long buf = 67109890;
    int v19 = a3;
    __int16 v20 = 2114;
    __int16 v21 = v8;
    __int16 v22 = 1024;
    unsigned int v23 = v7;
    __int16 v24 = 2114;
    id v25 = v15;
    _os_log_impl(&dword_1BED06000, v6, v14, "serverPropertyValueForOption:%d on %{public}@ cid:%u returned %{public}@", buf, 0x22u);
  }

  return v10;
}

- (void)_setServerPropertyForOption:(int64_t)a3 value:(id)a4
{
}

- (void)_setServerPropertyForOption:(int64_t)a3 value:(id)a4 log:(int64_t)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = LALogForCategory();
  unsigned int v9 = +[LAContext newCommandId];
  uint64_t v10 = [(LAContext *)self description];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109890;
    int v19 = a3;
    __int16 v20 = 2114;
    id v21 = v7;
    __int16 v22 = 2114;
    unsigned int v23 = v10;
    __int16 v24 = 1024;
    unsigned int v25 = v9;
    _os_log_impl(&dword_1BED06000, v8, OS_LOG_TYPE_INFO, "setServerPropertyForOption:%d value:%{public}@ on %{public}@ cid:%u", buf, 0x22u);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BED06000, v8, OS_LOG_TYPE_INFO, "Invalidating domain state cache", buf, 2u);
  }
  [(LACCacheSync *)self->_domainStateCache invalidate];
  client = self->_client;
  int v12 = v7;
  if (!v7)
  {
    int v12 = [MEMORY[0x1E4F1CA98] null];
  }
  id v17 = 0;
  BOOL v13 = [(LAClient *)client setServerPropertyForOption:a3 value:v12 error:&v17];
  os_log_type_t v14 = (__CFString *)v17;
  if (!v7) {

  }
  os_log_type_t v15 = 16 * (v14 != 0);
  if (os_log_type_enabled(v8, v15))
  {
    uint64_t v16 = @"success";
    *(_DWORD *)long long buf = 67110146;
    if (!v13) {
      uint64_t v16 = v14;
    }
    int v19 = a3;
    __int16 v20 = 2114;
    id v21 = v7;
    __int16 v22 = 2114;
    unsigned int v23 = v10;
    __int16 v24 = 1024;
    unsigned int v25 = v9;
    __int16 v26 = 2114;
    __int16 v27 = v16;
    _os_log_impl(&dword_1BED06000, v8, v15, "setServerPropertyForOption:%d value:%{public}@ on %{public}@ cid:%u returned %{public}@", buf, 0x2Cu);
  }
}

- (NSString)localizedFallbackTitle
{
  return (NSString *)[(LAContext *)self _serverPropertyValueForOption:1 log:8];
}

- (void)setLocalizedFallbackTitle:(NSString *)localizedFallbackTitle
{
}

- (NSString)localizedCancelTitle
{
  return (NSString *)[(LAContext *)self _serverPropertyValueForOption:1018 log:8];
}

- (void)setLocalizedCancelTitle:(NSString *)localizedCancelTitle
{
}

- (NSNumber)touchIDAuthenticationRetryLimit
{
  return (NSNumber *)[(LAContext *)self _serverPropertyValueForOption:1003];
}

- (void)setTouchIDAuthenticationRetryLimit:(id)a3
{
}

- (NSTimeInterval)touchIDAuthenticationAllowableReuseDuration
{
  LABiometryType v2 = [(LAContext *)self _serverPropertyValueForOption:1017 log:8];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setTouchIDAuthenticationAllowableReuseDuration:(NSTimeInterval)touchIDAuthenticationAllowableReuseDuration
{
  id v4 = [NSNumber numberWithDouble:touchIDAuthenticationAllowableReuseDuration];
  [(LAContext *)self _setServerPropertyForOption:1017 value:v4 log:8];
}

- (NSData)externalizedContext
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v3 = LALogForCategory();
  unsigned int v4 = +[LAContext newCommandId];
  id v5 = [(LAContext *)self description];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543618;
    int v12 = v5;
    __int16 v13 = 1024;
    unsigned int v14 = v4;
    _os_log_impl(&dword_1BED06000, v3, OS_LOG_TYPE_INFO, "externalizedContext on %{public}@ cid:%u", (uint8_t *)&v11, 0x12u);
  }
  BOOL v6 = [(LAClient *)self->_client externalizedContext];
  id v7 = v3;
  os_log_type_t v8 = 16 * (v6 == 0);
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = [v6 hash];
    int v11 = 138543874;
    int v12 = v5;
    __int16 v13 = 1024;
    unsigned int v14 = v4;
    __int16 v15 = 1024;
    int v16 = v9;
    _os_log_impl(&dword_1BED06000, v7, v8, "externalizedContext on %{public}@ cid:%u returned %x", (uint8_t *)&v11, 0x18u);
  }

  return (NSData *)v6;
}

- (id)uuid
{
  return [(LAClient *)self->_client uuid];
}

- (void)setUiDelegate:(id)a3
{
}

- (void)bootstrapServiceType:(id)a3 completionHandler:(id)a4
{
}

- (void)addContextObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(LAContext *)self observers];

  if (!v5)
  {
    BOOL v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(LAContext *)self setObservers:v6];
  }
  id v7 = [(LAContext *)self observers];
  [v7 addObject:v4];
}

- (void)removeContextObserver:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(LAContext *)self observers];
  if (v4)
  {
    id v5 = (void *)v4;
    BOOL v6 = [(LAContext *)self observers];
    int v7 = [v6 containsObject:v9];

    if (v7)
    {
      os_log_type_t v8 = [(LAContext *)self observers];
      [v8 removeObject:v9];
    }
  }
}

- (void)_notifyObserversAfterInvalidation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  double v3 = LALogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [(LAContext *)self observers];
    *(_DWORD *)long long buf = 67109378;
    int v23 = [v4 count];
    __int16 v24 = 2114;
    unsigned int v25 = self;
    _os_log_impl(&dword_1BED06000, v3, OS_LOG_TYPE_INFO, "Will notify %d observers of changes in %{public}@", buf, 0x12u);
  }
  id v5 = (void *)MEMORY[0x1E4F1C978];
  BOOL v6 = [(LAContext *)self observers];
  uint64_t v7 = [v6 allObjects];
  os_log_type_t v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v10 = [v5 arrayWithArray:v9];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v16, "contextDidBecomeInvalid:", self, (void)v17);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (id)optionNotInteractive
{
  return [(LAContext *)self _serverPropertyValueForOption:1000];
}

- (void)setOptionNotInteractive:(id)a3
{
}

- (id)optionTimeout
{
  return [(LAContext *)self _serverPropertyValueForOption:1001];
}

- (void)setOptionTimeout:(id)a3
{
}

- (id)optionCallerName
{
  return [(LAContext *)self _serverPropertyValueForOption:1021];
}

- (void)setOptionCallerName:(id)a3
{
}

- (id)optionCallerPID
{
  return [(LAContext *)self _serverPropertyValueForOption:1027];
}

- (void)setOptionCallerPID:(id)a3
{
}

- (id)optionMaxCredentialAge
{
  return [(LAContext *)self _serverPropertyValueForOption:1077];
}

- (void)setOptionMaxCredentialAge:(id)a3
{
}

- (id)optionUseShortExpirationTimer
{
  return [(LAContext *)self _serverPropertyValueForOption:1061];
}

- (void)setOptionUseShortExpirationTimer:(id)a3
{
}

- (id)optionFallbackToNoAuthentication
{
  return [(LAContext *)self _serverPropertyValueForOption:1062];
}

- (void)setOptionFallbackToNoAuthentication:(id)a3
{
}

- (id)optionAuthenticationCallbackReason
{
  return [(LAContext *)self _serverPropertyValueForOption:1063];
}

- (void)setOptionAuthenticationCallbackReason:(id)a3
{
}

- (id)optionAuthenticationCallbackURL
{
  return [(LAContext *)self _serverPropertyValueForOption:1064];
}

- (void)setOptionAuthenticationCallbackURL:(id)a3
{
}

- (id)optionAuthenticationIdentifier
{
  return [(LAContext *)self _serverPropertyValueForOption:1066];
}

- (void)setOptionAuthenticationIdentifier:(id)a3
{
}

- (id)optionBeginRatchetLocalizedTitle
{
  return [(LAContext *)self _serverPropertyValueForOption:1069];
}

- (void)setOptionBeginRatchetLocalizedTitle:(id)a3
{
}

- (id)optionBeginRatchetLocalizedText
{
  return [(LAContext *)self _serverPropertyValueForOption:1070];
}

- (void)setOptionBeginRatchetLocalizedText:(id)a3
{
}

- (id)optionBeginRatchetShowsLocationWarning
{
  return [(LAContext *)self _serverPropertyValueForOption:1071];
}

- (void)setOptionBeginRatchetShowsLocationWarning:(id)a3
{
}

- (id)optionCountdownLocalizedText
{
  return [(LAContext *)self _serverPropertyValueForOption:1072];
}

- (void)setOptionCountdownLocalizedText:(id)a3
{
}

- (id)optionDTO
{
  return [(LAContext *)self _serverPropertyValueForOption:1068];
}

- (void)setOptionDTO:(id)a3
{
}

- (id)optionNoGracePeriodUI
{
  return [(LAContext *)self _serverPropertyValueForOption:1073];
}

- (void)setOptionNoGracePeriodUI:(id)a3
{
}

- (id)optionNoCountdownUI
{
  return [(LAContext *)self _serverPropertyValueForOption:1074];
}

- (void)setOptionNoCountdownUI:(id)a3
{
}

- (id)optionBeginSecurityDelayImmediately
{
  return [(LAContext *)self _serverPropertyValueForOption:1075];
}

- (void)setOptionBeginSecurityDelayImmediately:(id)a3
{
}

- (id)optionAllowEmptyPasscode
{
  return [(LAContext *)self _serverPropertyValueForOption:1081];
}

- (void)setOptionAllowEmptyPasscode:(id)a3
{
}

- (id)optionAllowEnablementGracePeriod
{
  return [(LAContext *)self _serverPropertyValueForOption:1082];
}

- (void)setOptionAllowEnablementGracePeriod:(id)a3
{
}

- (id)optionAllowUnapprovedSensor
{
  return [(LAContext *)self _serverPropertyValueForOption:1085];
}

- (void)setOptionAllowUnapprovedSensor:(id)a3
{
}

- (id)optionUserFallback
{
  return [(LAContext *)self _serverPropertyValueForOption:1];
}

- (void)setOptionUserFallback:(id)a3
{
}

- (id)optionAuthenticationReason
{
  return [(LAContext *)self _serverPropertyValueForOption:2];
}

- (void)setOptionAuthenticationReason:(id)a3
{
}

- (id)optionMaxBiometryFailures
{
  return [(LAContext *)self _serverPropertyValueForOption:1003];
}

- (void)setOptionMaxBiometryFailures:(id)a3
{
}

- (id)optionPresentationStyle
{
  return [(LAContext *)self _serverPropertyValueForOption:1005];
}

- (void)setOptionPresentationStyle:(id)a3
{
}

- (id)optionTransitionStyle
{
  return [(LAContext *)self _serverPropertyValueForOption:1006];
}

- (void)setOptionTransitionStyle:(id)a3
{
}

- (id)optionReturnBiometryDatabaseHash
{
  return [(LAContext *)self _serverPropertyValueForOption:1015];
}

- (void)setOptionReturnBiometryDatabaseHash:(id)a3
{
}

- (id)optionCancelVisible
{
  return [(LAContext *)self _serverPropertyValueForOption:1010];
}

- (void)setOptionCancelVisible:(id)a3
{
}

- (id)optionFallbackVisible
{
  return [(LAContext *)self _serverPropertyValueForOption:1011];
}

- (void)setOptionFallbackVisible:(id)a3
{
}

- (id)optionPasscodeTitle
{
  return [(LAContext *)self _serverPropertyValueForOption:1037];
}

- (void)setOptionPasscodeTitle:(id)a3
{
}

- (id)optionPINTitle
{
  return [(LAContext *)self _serverPropertyValueForOption:1013];
}

- (void)setOptionPINTitle:(id)a3
{
}

- (id)optionPINLength
{
  return [(LAContext *)self _serverPropertyValueForOption:1014];
}

- (void)setOptionPINLength:(id)a3
{
}

- (id)optionPINFirst
{
  return [(LAContext *)self _serverPropertyValueForOption:1012];
}

- (void)setOptionPINFirst:(id)a3
{
}

- (id)optionSharedValidity
{
  return [(LAContext *)self _serverPropertyValueForOption:1017];
}

- (void)setOptionSharedValidity:(id)a3
{
}

- (id)optionUserCancel
{
  return [(LAContext *)self _serverPropertyValueForOption:1018];
}

- (void)setOptionUserCancel:(id)a3
{
}

- (id)optionTintColor
{
  return [(LAContext *)self _serverPropertyValueForOption:1020];
}

- (void)setOptionTintColor:(id)a3
{
}

- (id)optionBiometryLockoutRecovery
{
  return [(LAContext *)self _serverPropertyValueForOption:1024];
}

- (void)setOptionBiometryLockoutRecovery:(id)a3
{
}

- (id)optionSoftwareUpdateManifest
{
  return [(LAContext *)self _serverPropertyValueForOption:1026];
}

- (void)setOptionSoftwareUpdateManifest:(id)a3
{
}

- (id)optionSoftwareUpdateStashMode
{
  return [(LAContext *)self _serverPropertyValueForOption:1028];
}

- (void)setOptionSoftwareUpdateStashMode:(id)a3
{
}

- (id)optionPasswordAuthenticationReason
{
  return [(LAContext *)self _serverPropertyValueForOption:1031];
}

- (void)setOptionPasswordAuthenticationReason:(id)a3
{
}

- (id)optionPasscodeScreenStyle
{
  return [(LAContext *)self _serverPropertyValueForOption:1033];
}

- (void)setOptionPasscodeScreenStyle:(id)a3
{
}

- (id)optionPasscodeScreenBlur
{
  return [(LAContext *)self _serverPropertyValueForOption:1034];
}

- (void)setOptionPasscodeScreenBlur:(id)a3
{
}

- (id)optionFaceDetectLength
{
  return [(LAContext *)self _serverPropertyValueForOption:1032];
}

- (void)setOptionFaceDetectLength:(id)a3
{
}

- (id)optionCallerAuditToken
{
  return [(LAContext *)self _serverPropertyValueForOption:1038];
}

- (void)setOptionCallerAuditToken:(id)a3
{
}

- (id)optionCallerAuditTokenUsage
{
  return [(LAContext *)self _serverPropertyValueForOption:1080];
}

- (void)setOptionCallerAuditTokenUsage:(id)a3
{
}

- (id)optionNoFailureUI
{
  return [(LAContext *)self _serverPropertyValueForOption:1039];
}

- (void)setOptionNoFailureUI:(id)a3
{
}

- (id)optionFingerMustBeOff
{
  return [(LAContext *)self _serverPropertyValueForOption:1040];
}

- (void)setOptionFingerMustBeOff:(id)a3
{
}

- (id)optionPhysicalButtonTitle
{
  return [(LAContext *)self _serverPropertyValueForOption:1041];
}

- (void)setOptionPhysicalButtonTitle:(id)a3
{
}

- (id)optionCallerIconPath
{
  return [(LAContext *)self _serverPropertyValueForOption:1042];
}

- (void)setOptionCallerIconPath:(id)a3
{
}

- (id)optionCallerIconBundlePath
{
  return [(LAContext *)self _serverPropertyValueForOption:1042];
}

- (void)setOptionCallerIconBundlePath:(id)a3
{
}

- (id)optionMatchForUnlock
{
  return [(LAContext *)self _serverPropertyValueForOption:1043];
}

- (void)setOptionMatchForUnlock:(id)a3
{
}

- (id)optionPINMinLength
{
  return [(LAContext *)self _serverPropertyValueForOption:1046];
}

- (void)setOptionPINMinLength:(id)a3
{
}

- (id)optionPINMaxLength
{
  return [(LAContext *)self _serverPropertyValueForOption:1047];
}

- (void)setOptionPINMaxLength:(id)a3
{
}

- (id)optionPINCharset
{
  return [(LAContext *)self _serverPropertyValueForOption:1048];
}

- (void)setOptionPINCharset:(id)a3
{
}

- (id)optionBodyText
{
  return [(LAContext *)self _serverPropertyValueForOption:1050];
}

- (void)setOptionBodyText:(id)a3
{
}

- (id)optionTKAuthOperationError
{
  return [(LAContext *)self _serverPropertyValueForOption:1051];
}

- (void)setOptionTKAuthOperationError:(id)a3
{
}

- (id)optionPINLabel
{
  return [(LAContext *)self _serverPropertyValueForOption:1052];
}

- (void)setOptionPINLabel:(id)a3
{
}

- (id)optionCheckApplePayEnabled
{
  return [(LAContext *)self _serverPropertyValueForOption:1053];
}

- (void)setOptionCheckApplePayEnabled:(id)a3
{
}

- (id)optionPresentingEmbeddedUI
{
  return [(LAContext *)self _serverPropertyValueForOption:1056];
}

- (void)setOptionPresentingEmbeddedUI:(id)a3
{
}

- (id)optionPresentationContext
{
  return [(LAContext *)self _serverPropertyValueForOption:1059];
}

- (void)setOptionPresentationContext:(id)a3
{
}

- (id)optionBiometryLockoutRecoveryRetries
{
  return [(LAContext *)self _serverPropertyValueForOption:1067];
}

- (void)setOptionBiometryLockoutRecoveryRetries:(id)a3
{
}

- (id)optionUseModernUI
{
  return [(LAContext *)self _serverPropertyValueForOption:1057];
}

- (void)setOptionUseModernUI:(id)a3
{
}

- (id)optionLightweightUI
{
  return [(LAContext *)self _serverPropertyValueForOption:1079];
}

- (void)setOptionLightweightUI:(id)a3
{
}

- (id)optionLightweightUIMode
{
  return [(LAContext *)self _serverPropertyValueForOption:1087];
}

- (void)setOptionLightweightUIMode:(id)a3
{
}

- (id)optionDisableMacCompanion
{
  return [(LAContext *)self _serverPropertyValueForOption:1084];
}

- (void)setOptionDisableMacCompanion:(id)a3
{
}

- (NSString)localizedReason
{
  return (NSString *)[(LAContext *)self _serverPropertyValueForOption:2 log:8];
}

- (void)setLocalizedReason:(NSString *)localizedReason
{
}

- (id)optionAuthenticationTitle
{
  return [(LAContext *)self _serverPropertyValueForOption:1030];
}

- (void)setOptionAuthenticationTitle:(id)a3
{
}

- (id)optionSecurePassphrase
{
  return [(LAContext *)self _serverPropertyValueForOption:1044];
}

- (void)setOptionSecurePassphrase:(id)a3
{
}

- (id)optionSkipDoublePress
{
  return [(LAContext *)self _serverPropertyValueForOption:1054];
}

- (void)setOptionSkipDoublePress:(id)a3
{
}

- (BOOL)interactionNotAllowed
{
  LABiometryType v2 = [(LAContext *)self _serverPropertyValueForOption:1000 log:8];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setInteractionNotAllowed:(BOOL)interactionNotAllowed
{
  id v4 = [NSNumber numberWithBool:interactionNotAllowed];
  [(LAContext *)self _setServerPropertyForOption:1000 value:v4 log:8];
}

- (id)optionEventProcessing
{
  return [(LAContext *)self _serverPropertyValueForOption:1007];
}

- (void)setOptionEventProcessing:(id)a3
{
}

- (NSNumber)maxBiometryFailures
{
  return self->_maxBiometryFailures;
}

- (void)setMaxBiometryFailures:(NSNumber *)maxBiometryFailures
{
}

- (void)setBiometryType:(int64_t)a3
{
  self->_biometryType = a3;
}

- (NSData)evaluatedPolicyDomainState
{
  return self->_evaluatedPolicyDomainState;
}

- (void)setExternalizedContext:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (LAClient)client
{
  return self->_client;
}

void __29__LAContext_encodeWithCoder___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x12u);
}

void __29__LAContext_encodeWithCoder___block_invoke_46_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = *(_DWORD *)(a1 + 48);
  int v4 = *(_DWORD *)(a1 + 52);
  int v5 = 138543874;
  uint64_t v6 = v2;
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_debug_impl(&dword_1BED06000, a2, OS_LOG_TYPE_DEBUG, "Encoded %{public}@ for transfer to pid:%d cid:%u", (uint8_t *)&v5, 0x18u);
}

void __29__LAContext_encodeWithCoder___block_invoke_46_cold_2()
{
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x18u);
}

void __36__LAContext_credentialOfType_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x22u);
}

@end