@interface ContextPluginACM
- (BOOL)_isBiometricOnlyPolicy:(int64_t)a3;
- (BOOL)_isEvent:(int64_t)a3 contributingToResult:(id)a4;
- (BOOL)_setPragueInstructions:(id)a3 signature:(id)a4 error:(id *)a5;
- (BOOL)_shouldAvoidRemovingCredentialType:(unsigned int)a3;
- (BOOL)_shouldFailOnAcmStatus:(int)a3 action:(id)a4 failureHandler:(id)a5;
- (BOOL)_shouldRetryEvaluationForError:(id)a3 options:(id)a4;
- (BOOL)_updateACMContextWithOptions:(id)a3 policy:(int64_t)a4 error:(id *)a5;
- (BOOL)_validatePassword:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 originator:(id)a6 request:(id)a7 callerName:(id)a8 callerBundleId:(id)a9 reply:(id)a10;
- (ContextPluginACM)initWithACMContext:(__ACMHandle *)a3 contextOwner:(BOOL)a4 module:(id)a5;
- (__ACMHandle)acmContext;
- (id)_acmParamForPolicy:(int64_t)a3 options:(id)a4 userId:(unsigned int)a5 secondPass:(BOOL)a6;
- (id)_decodeOperation:(id)a3;
- (id)_fillConstraint:(id)a3 options:(id)a4 userId:(id)a5 error:(id *)a6;
- (id)_operationAsString:(id)a3 error:(id *)a4;
- (id)_unsatisfiedListForRequirement:(__ACMRequirement *)a3;
- (id)_updateRecoveryRetryCountIfNeeded:(id)a3 request:(id)a4 userId:(id)a5;
- (unsigned)_credentialTypeForEvent:(int64_t)a3;
- (unsigned)_credentialTypeForRequirementType:(unsigned int)a3;
- (unsigned)_requirementTypeForCredentialType:(int64_t)a3;
- (unsigned)instanceId;
- (void)_evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 callerName:(id)a9 callerBundleId:(id)a10 reply:(id)a11;
- (void)_evaluateCtkPolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 originator:(id)a6 request:(id)a7 reply:(id)a8;
- (void)_evaluateOperation:(id)a3 aclRef:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 validate:(BOOL)a9 callerName:(id)a10 callerBundleId:(id)a11 reply:(id)a12;
- (void)_handleAcmRequirement:(const __ACMRequirement *)a3 policy:(int64_t)a4 constraintData:(id)a5 operation:(id)a6 internalInfo:(id)a7 uiDelegate:(id)a8 originator:(id)a9 request:(id)a10 reply:(id)a11;
- (void)_handleCTKACL:(id)a3 tokenId:(id)a4 operation:(id)a5 options:(id)a6 originator:(id)a7 request:(id)a8 callerName:(id)a9 callerBundleId:(id)a10 reply:(id)a11;
- (void)_parseInstructions:(id)a3 completion:(id)a4;
- (void)_paymentOperationWithInstructions:(id)a3 originatorId:(unint64_t)a4 reply:(id)a5;
- (void)_releaseGracefully:(BOOL)a3;
- (void)_removeRequestedCredentials:(__ACMRequirement *)a3;
- (void)_setACMHelper:(id)a3;
- (void)_setAuthenticationManager:(id)a3;
- (void)_setLegacyInstructions:(id)a3 originatorId:(unint64_t)a4 reply:(id)a5;
- (void)_setMechanismManager:(id)a3;
- (void)_setOptions:(id)a3 forInternalOperation:(int64_t)a4 originatorId:(unint64_t)a5 reply:(id)a6;
- (void)_validateACL:(id)a3 evaluateOperation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 callerName:(id)a9 callerBundleId:(id)a10 reply:(id)a11;
- (void)_validateOperation:(id)a3 aclRef:(id)a4 evaluateOperation:(id)a5 options:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 reply:(id)a10;
- (void)_validateOperations:(id)a3 aclRef:(id)a4 evaluateOperation:(id)a5 options:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 currentResult:(id)a10 reply:(id)a11;
- (void)_verifyACMPolicy:(char *)a3 acmParameter:(id)a4 maxGlobalCredentialAge:(unsigned int)a5 retryAllowed:(BOOL)a6 reply:(id)a7;
- (void)authMethodWithReply:(id)a3;
- (void)checkCredentialSatisfied:(int64_t)a3 policy:(int64_t)a4 reply:(id)a5;
- (void)credentialOfType:(int64_t)a3 originator:(id)a4 reply:(id)a5;
- (void)dealloc;
- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 callerName:(id)a9 callerBundleId:(id)a10 reply:(id)a11;
- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 reply:(id)a9;
- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 originator:(id)a6 request:(id)a7 reply:(id)a8;
- (void)externalizedContextWithReply:(id)a3;
- (void)finishedAuthenticationForPolicy:(int64_t)a3 constraintData:(id)a4 operation:(id)a5 internalInfo:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 availabilityEvents:(id)a10 result:(id)a11 error:(id)a12 reply:(id)a13;
- (void)forciblyInvalidate;
- (void)isCredentialSet:(int64_t)a3 originator:(id)a4 reply:(id)a5;
- (void)resetEvent:(int64_t)a3 originator:(id)a4 reply:(id)a5;
- (void)setCredential:(id)a3 type:(int64_t)a4 options:(id)a5 originator:(id)a6 reply:(id)a7;
- (void)setOptions:(id)a3 forInternalOperation:(int64_t)a4 originator:(id)a5 reply:(id)a6;
- (void)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 reply:(id)a6;
@end

@implementation ContextPluginACM

- (void)externalizedContextWithReply:(id)a3
{
  id v4 = a3;
  acmContext = self->_acmContext;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_86B4;
  v7[3] = &unk_2CB38;
  id v8 = v4;
  id v6 = v4;
  ACMContextGetExternalForm(acmContext, (uint64_t)v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctkCallerBundleId, 0);
  objc_storeStrong((id *)&self->_ctkCallerName, 0);
  objc_storeStrong((id *)&self->_ctkCallerOptions, 0);
  objc_storeStrong((id *)&self->_ctkPin, 0);
  objc_storeStrong((id *)&self->_authenticationManager, 0);
  objc_storeStrong((id *)&self->_mechanismManager, 0);

  objc_storeStrong((id *)&self->_acmHelper, 0);
}

- (void)dealloc
{
  [(ContextPluginACM *)self _releaseGracefully:1];
  v3.receiver = self;
  v3.super_class = (Class)ContextPluginACM;
  [(ContextPluginACM *)&v3 dealloc];
}

- (void)_releaseGracefully:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(ContextPluginACM *)self module];
  if (v3) {
    id v6 = "gracefully";
  }
  else {
    id v6 = "forcibly";
  }
  v7 = +[NSString stringWithFormat:@"released %s", v6];
  [v5 untrackPlugin:self reason:v7];

  acmContext = self->_acmContext;
  if (acmContext)
  {
    int TrackingNumber = ACMContextGetTrackingNumber((uint64_t)acmContext);
    v10 = sub_30F8();
    v11 = v10;
    if (v3) {
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
    }
    else {
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    }
    if (os_log_type_enabled(v10, v12))
    {
      *(_DWORD *)buf = 67109634;
      int v17 = TrackingNumber;
      __int16 v18 = 2082;
      v19 = v6;
      __int16 v20 = 1024;
      unsigned int v21 = [(ContextPluginACM *)self contextOwner];
      _os_log_impl(&dword_0, v11, v12, "Deleting ACMContext:%u %{public}s, destroy:%d", buf, 0x18u);
    }

    int v13 = ACMContextDelete(self->_acmContext, (int)[(ContextPluginACM *)self contextOwner]);
    if (v13)
    {
      int v14 = v13;
      v15 = sub_30F8();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        sub_223F4(TrackingNumber, v14, v15);
      }
    }
    self->_acmContext = 0;
    [(LAACMHelper *)self->_acmHelper clear];
  }
}

- (unsigned)instanceId
{
  return self->_instanceId;
}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 originator:(id)a6 request:(id)a7 reply:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  objc_initWeak(location, v16);
  v19 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v16 userId]);
  __int16 v20 = [(ContextPluginACM *)self _updateRecoveryRetryCountIfNeeded:v14 request:v17 userId:v19];
  v41 = v14;

  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_7BD8;
  v53[3] = &unk_2C570;
  v53[4] = self;
  id v21 = v20;
  id v54 = v21;
  id v43 = v17;
  id v55 = v43;
  v58[1] = (id)a3;
  id v42 = v15;
  id v56 = v42;
  objc_copyWeak(v58, location);
  id v40 = v18;
  id v57 = v40;
  v22 = objc_retainBlock(v53);
  if (a3 == 1024)
  {
    v23 = +[LAPasscodeHelper sharedInstance];
    unsigned __int8 v24 = objc_msgSend(v23, "isPasscodeSetForUser:error:", objc_msgSend(v16, "userId"), 0);

    if ((v24 & 1) == 0)
    {
      v25 = +[LAPasscodeHelper sharedInstance];
      v26 = [(ContextPluginACM *)self cachedExternalizedContext];
      v27 = [v26 externalizedContext];
      v28 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v16 userId]);
      id v29 = objc_msgSend(v25, "verifyPasswordUsingAKS:acmContext:userId:policy:options:bioLockoutRecovery:", 0, v27, v28, 1024, v21, objc_msgSend(v43, "isRecoveringFromBiolockout"));

      if (v29)
      {
        v30 = +[LAErrorHelper internalErrorWithMessage:@"Unable to verify empty password"];
        ((void (*)(void *, void, void *))v22[2])(v22, 0, v30);
LABEL_13:

        goto LABEL_14;
      }
    }
LABEL_7:
    id v31 = +[LAACMHelper acmPolicyForPolicy:a3];
    if (v31)
    {
      v32 = [v21 objectForKey:&off_2E590];
      [v32 doubleValue];
      double v34 = v33;

      v30 = -[ContextPluginACM _acmParamForPolicy:options:userId:secondPass:](self, "_acmParamForPolicy:options:userId:secondPass:", a3, v21, [v16 userId], 0);
      id v52 = 0;
      unsigned __int8 v35 = [(ContextPluginACM *)self _updateACMContextWithOptions:v21 policy:a3 error:&v52];
      id v36 = v52;
      if ((v35 & 1) == 0)
      {
        v37 = +[NSString stringWithFormat:@"Unable to set data on ACM context with error %@", v36];
        v38 = +[LAErrorHelper parameterErrorWithMessage:v37];
        ((void (*)(void *, void, void *))v22[2])(v22, 0, v38);
      }
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_33B0;
      v44[3] = &unk_2C5C0;
      v50 = v22;
      id v45 = v43;
      v46 = self;
      int64_t v51 = a3;
      id v47 = v16;
      id v48 = v21;
      id v49 = v42;
      [(ContextPluginACM *)self _verifyACMPolicy:v31 acmParameter:v30 maxGlobalCredentialAge:(v34 * 1000.0) retryAllowed:1 reply:v44];

      v39 = v50;
    }
    else
    {
      v30 = +[NSNumber numberWithInteger:a3];
      id v36 = +[NSString stringWithFormat:@"Can't find ACM policy for: %@", v30];
      v39 = +[LAErrorHelper parameterErrorWithMessage:v36];
      ((void (*)(void *, void, void *))v22[2])(v22, 0, v39);
    }

    goto LABEL_13;
  }
  if (a3 != 1009) {
    goto LABEL_7;
  }
  [(ContextPluginACM *)self _evaluateCtkPolicy:1009 options:v21 uiDelegate:v42 originator:v16 request:v43 reply:v22];
LABEL_14:

  objc_destroyWeak(v58);
  objc_destroyWeak(location);
}

- (void)_verifyACMPolicy:(char *)a3 acmParameter:(id)a4 maxGlobalCredentialAge:(unsigned int)a5 retryAllowed:(BOOL)a6 reply:(id)a7
{
  uint64_t v7 = *(void *)&a5;
  id v11 = a7;
  acmHelper = self->_acmHelper;
  id v13 = a4;
  id v14 = [v13 acmParameters];
  id v15 = [v13 count];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_3298;
  v17[3] = &unk_2C638;
  id v18 = v11;
  v19 = a3;
  id v16 = v11;
  [(LAACMHelper *)acmHelper preflightPolicy:a3 parameters:v14 parametersCount:v15 maxGlobalCredentialAge:v7 processRequirement:v17];
}

- (id)_updateRecoveryRetryCountIfNeeded:(id)a3 request:(id)a4 userId:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v7 objectForKeyedSubscript:&off_2E6C8];
  if (v10)
  {
    id v11 = +[BiometryHelper sharedInstance];
    id v20 = 0;
    unsigned __int8 v12 = [v11 isLockedOutForUser:v9 request:v8 error:&v20];
    id v13 = v20;

    if (v12)
    {
      id v14 = [v10 integerValue];
      id v21 = &off_2E6C8;
      if ((uint64_t)v14 <= 1) {
        uint64_t v15 = 1;
      }
      else {
        uint64_t v15 = (uint64_t)v14;
      }
      id v16 = +[NSNumber numberWithInteger:v15 - 1];
      v22 = v16;
      id v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v18 = [v7 dictionaryByMergingWith:v17];
    }
    else
    {
      id v18 = v7;
    }
  }
  else
  {
    id v18 = v7;
  }

  return v18;
}

- (BOOL)_updateACMContextWithOptions:(id)a3 policy:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (+[LAUtils isLocationBasedPolicy:a4])
  {
    id v9 = [v8 objectForKeyedSubscript:&off_2E518];
    v10 = [v8 objectForKeyedSubscript:&off_2E530];
    id v11 = [v8 objectForKeyedSubscript:&off_2E548];
    unsigned __int8 v12 = [v8 objectForKeyedSubscript:&off_2E560];
    id v13 = [v8 objectForKeyedSubscript:&off_2E578];
    if (([v9 BOOLValue] & 1) != 0
      || ([v10 BOOLValue] & 1) != 0
      || ([v11 BOOLValue] & 1) != 0
      || ([v12 BOOLValue] & 1) != 0
      || [v13 BOOLValue])
    {
      id v14 = LACLogDTO();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "DTOContextConfig update will start", (uint8_t *)&v24, 2u);
      }

      *(_DWORD *)((char *)&v25 + 7) = 0;
      if (objc_msgSend(v9, "BOOLValue", 0, 0, *((void *)&v25 + 1))) {
        LOBYTE(v25) = 1;
      }
      if ([v10 BOOLValue])
      {
        LACDTBiometryWatchdogGlobalFallbackTime();
        unint64_t v24 = (unint64_t)(v15 * 1000.0);
      }
      if (objc_msgSend(v11, "BOOLValue", v24, (void)v25)) {
        BYTE1(v25) = 1;
      }
      if ([v12 BOOLValue]) {
        *(void *)((char *)&v25 + 2) = (unint64_t)(LACDTOEnablementGracePeriodTime * 1000.0);
      }
      if ([v13 BOOLValue]) {
        BYTE10(v25) = 1;
      }
      id v16 = [objc_alloc((Class)LACSecureData) initWithBytes:&v24 length:19];
      unsigned int v17 = [(LAACMHelper *)self->_acmHelper setData:v16 type:9 error:a5];
      id v18 = LACLogDTO();
      v19 = v18;
      if (v17) {
        os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      }
      else {
        os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      }
      if (os_log_type_enabled(v18, v20))
      {
        id v21 = *a5;
        *(_DWORD *)buf = 138543362;
        id v27 = v21;
        _os_log_impl(&dword_0, v19, v20, "DTOConfig update did finish err=%{public}@", buf, 0xCu);
      }
    }
  }
  BOOL v22 = *a5 == 0;

  return v22;
}

- (BOOL)_shouldFailOnAcmStatus:(int)a3 action:(id)a4 failureHandler:(id)a5
{
  id v6 = *(void **)&a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, uint64_t))a5;
  switch((int)v6)
  {
    case -28:
      CFStringRef v10 = @"Unapproved hardware";
      uint64_t v11 = -1;
      uint64_t v12 = 30;
      goto LABEL_11;
    case -27:
    case -26:
    case -24:
    case -20:
    case -19:
    case -18:
    case -17:
    case -16:
    case -15:
      goto LABEL_15;
    case -25:
      id v6 = +[NSString stringWithFormat:@"%@ on ACMContext %u failed: %d", v8, [(ContextPluginACM *)self instanceId], 4294967271];
      uint64_t v13 = +[LAErrorHelper errorWithCode:-1011 subcode:0 message:v6];
      goto LABEL_16;
    case -23:
      CFStringRef v10 = @"Owner is not present.";
      uint64_t v11 = -1;
      uint64_t v12 = 25;
      goto LABEL_11;
    case -22:
      CFStringRef v10 = @"Developer mode transition disabled";
      uint64_t v11 = -1;
      uint64_t v12 = 24;
      goto LABEL_11;
    case -21:
      CFStringRef v10 = @"Pay is Locked";
      uint64_t v11 = -1;
      uint64_t v12 = 23;
      goto LABEL_11;
    case -14:
      CFStringRef v10 = @"Not available";
      uint64_t v11 = -1020;
      uint64_t v12 = 0;
LABEL_11:
      uint64_t v14 = +[LAErrorHelper errorWithCode:v11 subcode:v12 message:v10];
      goto LABEL_12;
    default:
      if (v6 != -3)
      {
        if (!v6) {
          goto LABEL_18;
        }
        goto LABEL_15;
      }
      if (!+[LAUtils isDaytona])
      {
LABEL_15:
        id v6 = +[NSString stringWithFormat:@"%@ on ACMContext %u failed: %d", v8, [(ContextPluginACM *)self instanceId], v6];
        uint64_t v13 = +[LAErrorHelper internalErrorWithMessage:v6];
LABEL_16:
        double v15 = (void *)v13;
        v9[2](v9, 0, v13);

        goto LABEL_17;
      }
      uint64_t v14 = +[LAErrorHelper errorDeviceDoesNotSupportAction:v8];
LABEL_12:
      id v6 = (void *)v14;
      v9[2](v9, 0, v14);
LABEL_17:

      LOBYTE(v6) = 1;
LABEL_18:

      return (char)v6;
  }
}

- (void)_handleAcmRequirement:(const __ACMRequirement *)a3 policy:(int64_t)a4 constraintData:(id)a5 operation:(id)a6 internalInfo:(id)a7 uiDelegate:(id)a8 originator:(id)a9 request:(id)a10 reply:(id)a11
{
  id v15 = a5;
  id v31 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  objc_initWeak(location, v18);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_7878;
  v44[3] = &unk_2C6B0;
  id v34 = v16;
  id v45 = v34;
  id v30 = v20;
  id v46 = v30;
  id v21 = objc_retainBlock(v44);
  id v22 = [objc_alloc((Class)ACMContextRecord) initWithACMContext:self->_acmContext cachedExternalizationDelegate:self];
  mechanismManager = self->_mechanismManager;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_7624;
  v35[3] = &unk_2C768;
  id v24 = v17;
  id v36 = v24;
  long long v25 = v21;
  id v42 = v25;
  v37 = self;
  v43[1] = (id)a4;
  id v29 = v15;
  id v38 = v29;
  id v26 = v18;
  id v39 = v26;
  id v27 = v19;
  id v40 = v27;
  id v28 = v31;
  id v41 = v28;
  objc_copyWeak(v43, location);
  [(MechanismManagerACM *)mechanismManager mechanismForACMRequirement:a3 acmContextRecord:v22 policy:a4 internalInfo:v34 uiDelegate:v24 originator:v26 request:v27 reply:v35];
  objc_destroyWeak(v43);

  objc_destroyWeak(location);
}

- (BOOL)_shouldRetryEvaluationForError:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 objectForKeyedSubscript:&off_2E6B0];
  CFStringRef v10 = [v8 objectForKeyedSubscript:&off_2E4E8];
  uint64_t v11 = [v8 objectForKeyedSubscript:&off_2E6C8];

  if (v11) {
    id v12 = [v11 integerValue];
  }
  else {
    id v12 = &dword_0 + 1;
  }
  unsigned int v13 = +[LAErrorHelper error:v7 hasCode:-8];
  unsigned int v14 = +[LAErrorHelper error:v7 hasCode:-1024];
  if (v13)
  {
    int v15 = 0;
    unsigned int v13 = 0;
    if ([v9 BOOLValue] && (uint64_t)v12 >= 1)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_96B0;
      v19[3] = &unk_2C660;
      id v4 = &v20;
      id v20 = v7;
      unsigned int v13 = sub_96B0((uint64_t)v19);
      int v15 = 1;
    }
  }
  else
  {
    int v15 = 0;
  }
  unsigned int v16 = (v14 | v13) & ~[v10 BOOLValue];
  if (v16 == 1)
  {
    id v17 = sub_30F8();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v22 = self;
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v25 = 2112;
      id v26 = v9;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ retries evaluation for error: %@ lockoutRecovery:%@ nonInteractive:%@", buf, 0x2Au);
    }
  }
  if (v15) {

  }
  return v16;
}

- (BOOL)_isBiometricOnlyPolicy:(int64_t)a3
{
  char v3 = a3 == 1008;
  if (a3 == 1003) {
    char v3 = 1;
  }
  if (a3 == 1) {
    return 1;
  }
  else {
    return v3;
  }
}

- (id)_acmParamForPolicy:(int64_t)a3 options:(id)a4 userId:(unsigned int)a5 secondPass:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  id v9 = a4;
  if (a3 == 1) {
    goto LABEL_4;
  }
  if (a3 != 1008)
  {
    if (+[LAUtils isApplePayPolicy:a3]) {
      BOOL v12 = !v6;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12 && +[DaemonUtils deviceHasPearl])
    {
      uint64_t v10 = +[LAManagedACMParameters acmParameterWithTimeOffset:500];
      goto LABEL_5;
    }
LABEL_12:
    uint64_t v11 = 0;
    goto LABEL_13;
  }
  if (!v6) {
    goto LABEL_12;
  }
LABEL_4:
  uint64_t v10 = +[LAManagedACMParameters acmParameterWithUserId:v7];
LABEL_5:
  uint64_t v11 = (void *)v10;
LABEL_13:
  if (+[LAUtils isLocationBasedPolicy:a3])
  {
    unsigned int v13 = [v9 objectForKeyedSubscript:&off_2E4E8];
    unsigned int v14 = [v13 BOOLValue];

    if (v14)
    {
      int v15 = +[LAManagedACMParameters acmParameterDoNotStartDTOTimers];
      uint64_t v16 = [v11 acmParameterByAppendingACMParameters:v15];
      id v17 = (void *)v16;
      if (v16) {
        id v18 = (void *)v16;
      }
      else {
        id v18 = v15;
      }
      id v19 = v18;

      uint64_t v11 = v19;
    }
  }
  id v20 = [v9 objectForKeyedSubscript:&off_2E500];
  id v21 = v20;
  if (v20)
  {
    [v20 floatValue];
    __int16 v23 = +[LAManagedACMParameters acmParameterWithTimeOffset:fmaxf((float)(600.0 - v22) * 1000.0, 0.0)];
    uint64_t v24 = [v11 acmParameterByAppendingACMParameters:v23];
    __int16 v25 = (void *)v24;
    if (v24) {
      id v26 = (void *)v24;
    }
    else {
      id v26 = v23;
    }
    id v27 = v26;

    uint64_t v11 = v27;
  }
  if (v11)
  {
    id v28 = sub_30F8();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138412290;
      id v31 = v11;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "Will use ACM parameter: %@", (uint8_t *)&v30, 0xCu);
    }
  }

  return v11;
}

- (ContextPluginACM)initWithACMContext:(__ACMHandle *)a3 contextOwner:(BOOL)a4 module:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)ContextPluginACM;
  BOOL v6 = [(ContextPluginACM *)&v15 initWithContextOwner:a4 underlyingPtr:a3 moduleRef:a5];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_acmContext = a3;
    v6->_instanceId = ACMContextGetTrackingNumber((uint64_t)a3);
    id v8 = (LAACMHelper *)[objc_alloc((Class)LAACMHelper) initWithACMContext:v7->_acmContext];
    acmHelper = v7->_acmHelper;
    v7->_acmHelper = v8;

    uint64_t v10 = +[MechanismManagerACM sharedInstance];
    mechanismManager = v7->_mechanismManager;
    v7->_mechanismManager = (MechanismManagerACM *)v10;

    uint64_t v12 = +[AuthenticationManager sharedInstance];
    authenticationManager = v7->_authenticationManager;
    v7->_authenticationManager = (AuthenticationManager *)v12;
  }
  return v7;
}

- (void)forciblyInvalidate
{
}

- (void)_evaluateCtkPolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 originator:(id)a6 request:(id)a7 reply:(id)a8
{
  id v13 = a4;
  id v61 = a5;
  id v63 = a6;
  id v64 = a7;
  id v65 = a8;
  unsigned int v14 = [v13 objectForKeyedSubscript:&off_2E5A8];
  if (v14)
  {
    uint64_t v81 = 0;
    v82 = &v81;
    uint64_t v83 = 0x2050000000;
    objc_super v15 = (void *)qword_31008;
    uint64_t v84 = qword_31008;
    if (!qword_31008)
    {
      v76 = _NSConcreteStackBlock;
      uint64_t v77 = 3221225472;
      v78 = sub_101A8;
      v79 = &unk_2CC68;
      v80 = &v81;
      sub_101A8((uint64_t)&v76);
      objc_super v15 = (void *)v82[3];
    }
    id v16 = v15;
    _Block_object_dispose(&v81, 8);
    uint64_t v81 = 0;
    v82 = &v81;
    uint64_t v83 = 0x2050000000;
    id v17 = (void *)qword_31018;
    uint64_t v84 = qword_31018;
    if (!qword_31018)
    {
      v76 = _NSConcreteStackBlock;
      uint64_t v77 = 3221225472;
      v78 = sub_10374;
      v79 = &unk_2CC68;
      v80 = &v81;
      sub_10374((uint64_t)&v76);
      id v17 = (void *)v82[3];
    }
    id v18 = v17;
    _Block_object_dispose(&v81, 8);
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_93CC;
    v71[3] = &unk_2C5E8;
    id v19 = v65;
    id v73 = v19;
    id v20 = v14;
    id v72 = v20;
    id v74 = v16;
    id v75 = v18;
    v59 = objc_retainBlock(v71);
    if (self->_ctkPin)
    {
      id v60 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", -[NSData bytes](self->_ctkPin, "bytes"), -[NSData length](self->_ctkPin, "length"), 4);
      ((void (*)(void *, id, void))v59[2])(v59, v60, 0);
LABEL_62:

      goto LABEL_63;
    }
    float v22 = [v13 objectForKeyedSubscript:&off_2E5F0];
    id v55 = v22;
    if (v22)
    {
      id v60 = v22;
      id v23 = [v60 intValue];
      if (v63) {
        [v63 auditToken];
      }
      else {
        memset(v70, 0, sizeof(v70));
      }
      id v69 = 0;
      id v57 = +[DaemonUtils callerDisplayNameWithPid:v23 auditToken:v70 bundleId:&v69];
      id v56 = (NSString *)v69;
    }
    else if (self->_ctkCallerSet)
    {
      id v60 = +[NSNumber numberWithInt:self->_ctkCallerProcessId];
      id v57 = self->_ctkCallerName;
      id v56 = self->_ctkCallerBundleId;
    }
    else
    {
      id v56 = 0;
      id v57 = 0;
      id v60 = 0;
    }
    if (self->_ctkCallerSet)
    {
      if (v13) {
        uint64_t v24 = v13;
      }
      else {
        uint64_t v24 = &__NSDictionary0__struct;
      }
      __int16 v25 = [v24 dictionaryByMergingWith:self->_ctkCallerOptions];
      v62 = +[NSMutableDictionary dictionaryWithDictionary:v25];
    }
    else
    {
      v62 = +[NSMutableDictionary dictionaryWithDictionary:v13];
    }
    [v62 removeObjectForKey:&off_2E5A8];
    id v26 = [v20 authenticationError];

    if (v26)
    {
      id v27 = [v20 authenticationError];
      [v62 setObject:v27 forKeyedSubscript:&off_2E608];
    }
    int64_t v51 = [v62 objectForKeyedSubscript:&off_2E620];
    id v54 = [v62 objectForKeyedSubscript:&off_2E638];
    id v52 = [v62 objectForKeyedSubscript:&off_2E650];
    v53 = [v62 objectForKeyedSubscript:&off_2E668];
    if (objc_opt_isKindOfClass())
    {
      id v28 = [v20 PINFormat];
      if (v28)
      {
        id v29 = v54;
        if (!v54)
        {
          uint64_t v30 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v28 minPINLength]);
          [v62 setObject:v30 forKey:&off_2E638];
          id v29 = (void *)v30;
        }
        id v54 = v29;
        if (!v52)
        {
          id v52 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v28 maxPINLength]);
          [v62 setObject:v52 forKey:&off_2E650];
          id v29 = v54;
        }
        if (!v53)
        {
          +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v28 charset]);
          v53 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
          [v62 setObject:v53 forKey:&off_2E668];
          id v29 = v54;
        }
        if (!v51 && v29 && [v29 isEqualToNumber:v52]) {
          [v62 setObject:v54 forKey:&off_2E620];
        }
      }
      id v31 = [v20 localizedPINLabel];

      if (v31)
      {
        v32 = [v20 localizedPINLabel];
        [v62 setObject:v32 forKey:&off_2E680];
      }
    }
    else
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        unsigned __int8 v35 = +[NSString stringWithFormat:@"Unsupported auth operation: %@", v20];
        id v42 = +[LAErrorHelper parameterErrorWithMessage:v35];
        (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v42);
LABEL_61:

        goto LABEL_62;
      }
      if (!v53)
      {
        [v62 setObject:&off_2E698 forKey:&off_2E668];
        v53 = &off_2E698;
      }
      double v33 = [v20 localizedPasswordLabel];

      if (!v33)
      {
LABEL_44:
        id v34 = [(ContextPluginACM *)self createInternalInfoWithPolicy:a3 policyOptions:v62 request:v64 originator:v63];
        unsigned __int8 v35 = +[NSMutableDictionary dictionaryWithDictionary:v34];

        if (v60)
        {
          [v35 setObject:v60 forKey:@"ProcessId"];
          if (!v57)
          {
            id v36 = +[InstalledAppsCache sharedInstance];
            v37 = objc_msgSend(v36, "binaryNameForPid:", objc_msgSend(v60, "intValue"));

            if (v37) {
              [v35 setObject:v37 forKey:@"CallerName"];
            }

            goto LABEL_51;
          }
        }
        else if (!v57)
        {
LABEL_51:
          if (v56) {
            [v35 setObject:v56 forKey:@"CallerId"];
          }
          [v35 setObject:&__kCFBooleanTrue forKey:@"CTKPIN"];
          id v38 = [v64 payload];
          id v39 = [v38 mutableCopy];
          id v40 = v39;
          if (v39) {
            id v41 = v39;
          }
          else {
            id v41 = (id)objc_opt_new();
          }
          id v42 = v41;

          [v42 setObject:v35 forKeyedSubscript:LACEvaluationRequestPayloadKeyInternalInfo];
          [v64 updatePayload:v42];
          v85[0] = @"AcmContextRecord";
          id v43 = [objc_alloc((Class)ACMContextRecord) initWithACMContext:self->_acmContext cachedExternalizationDelegate:self];
          v85[1] = @"UserId";
          v86[0] = v43;
          v44 = objc_msgSend(v35, "objectForKeyedSubscript:");
          v86[1] = v44;
          id v45 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:2];

          mechanismManager = self->_mechanismManager;
          id v68 = 0;
          id v47 = [(MechanismManagerACM *)mechanismManager loadMechanism:2 initParams:v45 request:v64 className:@"MechanismPassphrase" error:&v68];
          id v48 = v68;
          if (v47)
          {
            id v49 = [objc_alloc((Class)MechanismUI) initWithNonUiMechanism:v47 eventProcessing:0 policy:a3 internalInfo:v35 request:v64];
            authenticationManager = self->_authenticationManager;
            v66[0] = _NSConcreteStackBlock;
            v66[1] = 3221225472;
            v66[2] = sub_954C;
            v66[3] = &unk_2C610;
            v67 = v59;
            [(AuthenticationManager *)authenticationManager authenticateForPolicy:a3 constraintData:0 internalInfo:v35 uiDelegate:v61 originator:v63 request:v64 mechanism:v49 reply:v66];
          }
          else
          {
            ((void (*)(void *, void, id))v59[2])(v59, 0, v48);
          }

          goto LABEL_61;
        }
        [v35 setObject:v57 forKey:@"CallerName"];
        goto LABEL_51;
      }
      id v28 = [v20 localizedPasswordLabel];
      [v62 setObject:v28 forKey:&off_2E680];
    }

    goto LABEL_44;
  }
  id v21 = +[LAErrorHelper parameterErrorWithMessage:@"Missing auth operation."];
  (*((void (**)(id, void, void *))v65 + 2))(v65, 0, v21);

LABEL_63:
}

- (void)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 reply:(id)a6
{
  id v7 = a6;
  id v8 = +[LAErrorHelper errorNotSupported];
  (*((void (**)(id, void, id))a6 + 2))(v7, 0, v8);
}

- (id)_unsatisfiedListForRequirement:(__ACMRequirement *)a3
{
  if (ACMRequirementGetState(a3, a2) == 2)
  {
    BOOL v6 = 0;
  }
  else if (ACMRequirementGetType(a3, v5) == 7)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_9A84;
    v12[3] = &unk_2C790;
    v12[4] = self;
    id v13 = (id)objc_opt_new();
    id v8 = v13;
    ACMRequirementGetSubrequirements((int *)a3, (uint64_t)v12);
    BOOL v6 = [v8 componentsJoinedByString:@", "];
  }
  else
  {
    uint64_t Type = ACMRequirementGetType(a3, v7);
    BOOL v6 = +[NSString stringWithFormat:@"%d:%d", Type, ACMRequirementGetState(a3, v10)];
  }

  return v6;
}

- (void)finishedAuthenticationForPolicy:(int64_t)a3 constraintData:(id)a4 operation:(id)a5 internalInfo:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 availabilityEvents:(id)a10 result:(id)a11 error:(id)a12 reply:(id)a13
{
  id v56 = a4;
  id v57 = a5;
  id v55 = a6;
  id v18 = a7;
  id v54 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  objc_initWeak(location, self);
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_A074;
  v73[3] = &unk_2C800;
  id v24 = v18;
  id v74 = v24;
  id v25 = v20;
  id v75 = v25;
  objc_copyWeak(&v78, location);
  v76 = self;
  id v26 = v23;
  id v77 = v26;
  id v27 = objc_retainBlock(v73);
  id v28 = v27;
  v53 = v19;
  if (v21)
  {
    id v47 = v26;
    id v48 = v25;
    id v50 = v22;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_A2E0;
    v63[3] = &unk_2C828;
    id v29 = v27;
    v63[4] = self;
    id v71 = v29;
    int64_t v72 = a3;
    id v30 = v57;
    id v64 = v30;
    id v49 = v21;
    id v31 = v21;
    id v65 = v31;
    id v32 = v55;
    id v66 = v32;
    id v67 = v19;
    id v33 = v56;
    id v68 = v33;
    id v69 = v24;
    id v70 = v54;
    id v52 = objc_retainBlock(v63);
    id v34 = [v32 objectForKey:@"GlobalCredential"];
    unsigned int v46 = [v34 unsignedIntValue];

    if (a3)
    {
      if (a3 == 1008) {
        [v31 objectForKeyedSubscript:@"UserId"];
      }
      else {
      unsigned __int8 v35 = [v32 objectForKeyedSubscript:@"UserId"];
      }
      id v40 = [v35 unsignedIntValue];

      id v41 = [v32 objectForKeyedSubscript:@"Options"];
      id v38 = [(ContextPluginACM *)self _acmParamForPolicy:a3 options:v41 userId:v40 secondPass:1];

      acmHelper = self->_acmHelper;
      id v43 = +[LAACMHelper acmPolicyForPolicy:a3];
      id v44 = [v38 acmParameters];
      id v45 = [v38 count];
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_A694;
      v61[3] = &unk_2C850;
      v62 = v52;
      [(LAACMHelper *)acmHelper preflightPolicy:v43 parameters:v44 parametersCount:v45 maxGlobalCredentialAge:v46 processRequirement:v61];
      v37 = v62;
    }
    else
    {
      if (!v33)
      {
        id v38 = +[LAErrorHelper internalErrorWithMessage:@"Unexpected result type."];
        ((void (*)(void *, void, id))v29[2])(v29, 0, v38);
        goto LABEL_12;
      }
      id v60 = 0;
      v37 = [(ContextPluginACM *)self _operationAsString:v30 error:&v60];
      id v38 = v60;
      if (v37)
      {
        id v39 = self->_acmHelper;
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        id v58[2] = sub_A6BC;
        v58[3] = &unk_2C878;
        v59 = v52;
        [(LAACMHelper *)v39 verifyAclConstraint:v33 operation:v37 preflight:1 parameters:0 parametersCount:0 maxGlobalCredentialAge:v46 processRequirement:v58];
      }
      else
      {
        ((void (*)(void *, void, id))v29[2])(v29, 0, v50);
      }
    }

LABEL_12:
    id v36 = v57;
    id v25 = v48;
    id v21 = v49;
    id v22 = v50;
    id v26 = v47;
    goto LABEL_13;
  }
  ((void (*)(void *, void, id))v27[2])(v27, 0, v22);
  id v36 = v57;
LABEL_13:

  objc_destroyWeak(&v78);
  objc_destroyWeak(location);
}

- (BOOL)_isEvent:(int64_t)a3 contributingToResult:(id)a4
{
  if ((unint64_t)(a3 - 1) > 8) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_255D8[a3 - 1];
  }
  id v5 = a4;
  BOOL v6 = +[NSNumber numberWithInteger:v4];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  LOBYTE(v5) = [v7 BOOLValue];
  return (char)v5;
}

- (unsigned)_credentialTypeForRequirementType:(unsigned int)a3
{
  signed int v4 = a3 - 1;
  if (a3 - 1 < 0x1B && ((0x6047C07u >> v4) & 1) != 0) {
    return dword_25620[v4];
  }
  id v5 = sub_30F8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_2247C(a3, v5);
  }

  return 0;
}

- (void)_removeRequestedCredentials:(__ACMRequirement *)a3
{
  uint64_t Type = ACMRequirementGetType(a3, a2);
  if (Type == 7)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_A9D8;
    v15[3] = &unk_2C8C0;
    v15[4] = self;
    ACMRequirementGetSubrequirements((int *)a3, (uint64_t)v15);
  }
  else
  {
    uint64_t v7 = Type;
    if (ACMRequirementGetState(a3, v6) == 1)
    {
      uint64_t v8 = [(ContextPluginACM *)self _credentialTypeForRequirementType:v7];
      if (v8)
      {
        uint64_t v9 = v8;
        acmHelper = self->_acmHelper;
        id v14 = 0;
        unsigned __int8 v11 = [(LAACMHelper *)acmHelper removeCredentialsOfType:v9 error:&v14];
        id v12 = v14;
        if ((v11 & 1) == 0)
        {
          id v13 = sub_30F8();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_224F4((uint64_t)v12, v7, v13);
          }
        }
      }
      else
      {
        id v12 = 0;
      }
    }
  }
}

- (id)_decodeOperation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    signed int v4 = (char *)[v3 integerValue];
    switch((unint64_t)v4)
    {
      case 0uLL:
      case 2uLL:
        id v5 = &stru_2D508;
        goto LABEL_13;
      case 1uLL:
      case 4uLL:
        uint64_t v7 = &off_2CFC8;
        goto LABEL_11;
      case 3uLL:
        uint64_t v7 = &off_2CFE8;
        goto LABEL_11;
      case 5uLL:
        uint64_t v7 = &off_2D008;
LABEL_11:
        uint64_t v6 = *v7;
        goto LABEL_12;
      default:
        if (v4 == stru_3D8.segname) {
          id v5 = @"oacl";
        }
        else {
          id v5 = 0;
        }
        goto LABEL_13;
    }
  }
  uint64_t v6 = (__CFString *)v3;
LABEL_12:
  id v5 = v6;
LABEL_13:

  return v5;
}

- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 reply:(id)a9
{
  id v36 = a3;
  id v14 = a4;
  id v15 = a5;
  id v33 = a6;
  id v16 = a7;
  id v35 = a8;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_AE94;
  v52[3] = &unk_2C610;
  id v32 = a9;
  id v53 = v32;
  id v34 = objc_retainBlock(v52);
  id v17 = [v15 objectForKey:&off_2E4E8];
  LOBYTE(a6) = [v17 BOOLValue];

  if (a6)
  {
    id v18 = 0;
    id v19 = 0;
  }
  else
  {
    id v20 = [v16 processId];
    id v21 = [v15 objectForKeyedSubscript:&off_2E788];
    if (v21
      && [v16 checkEntitlement:@"com.apple.private.LocalAuthentication.CallerPID"])
    {
      id v20 = [v21 intValue];
    }
    if (v16) {
      [v16 auditToken];
    }
    else {
      memset(v51, 0, sizeof(v51));
    }
    id v50 = 0;
    id v18 = +[DaemonUtils callerDisplayNameWithPid:v20 auditToken:v51 bundleId:&v50];
    id v19 = v50;
    id v22 = [v15 objectForKeyedSubscript:&off_2E7A0];
    if (v22
      && [v16 checkEntitlement:@"com.apple.private.LocalAuthentication.CallerName"])
    {
      id v23 = v22;

      id v18 = v23;
    }
  }
  objc_initWeak(&location, v16);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_AF24;
  v38[3] = &unk_2C910;
  id v39 = v14;
  id v40 = self;
  id v24 = v36;
  id v41 = v24;
  id v25 = v15;
  id v42 = v25;
  id v26 = v33;
  id v43 = v26;
  objc_copyWeak(&v48, &location);
  id v27 = v35;
  id v44 = v27;
  id v28 = v18;
  id v45 = v28;
  id v29 = v19;
  id v46 = v29;
  id v30 = v34;
  id v47 = v30;
  id v31 = v39;
  [(ContextPluginACM *)self evaluateACL:v24 operation:v39 options:v25 uiDelegate:v26 originator:v16 request:v27 callerName:v28 callerBundleId:v29 reply:v38];

  objc_destroyWeak(&v48);
  objc_destroyWeak(&location);
}

- (void)_handleCTKACL:(id)a3 tokenId:(id)a4 operation:(id)a5 options:(id)a6 originator:(id)a7 request:(id)a8 callerName:(id)a9 callerBundleId:(id)a10 reply:(id)a11
{
  id v34 = a3;
  id v37 = a4;
  id v35 = a5;
  id v31 = a6;
  id v36 = a7;
  id v17 = a8;
  id v32 = a9;
  id v33 = a10;
  id v18 = a11;
  id v19 = [v17 log];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v37;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ handles CTK request using tokenId:%{public}@", buf, 0x16u);
  }

  id v20 = objc_alloc((Class)LAContext);
  id v21 = [(ContextPluginACM *)self cachedExternalizedContext];
  id v22 = [v21 externalizedContext];
  id v23 = [v20 initWithExternalizedContext:v22];

  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x2050000000;
  id v24 = (void *)qword_31020;
  uint64_t v49 = qword_31020;
  if (!qword_31020)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_103CC;
    int64_t v51 = &unk_2CC68;
    id v52 = &v46;
    sub_103CC((uint64_t)buf);
    id v24 = (void *)v47[3];
  }
  id v25 = v24;
  _Block_object_dispose(&v46, 8);
  id v26 = [[v25 alloc] initWithTokenID:v37];
  id v45 = 0;
  id v27 = [v26 sessionWithLAContext:v23 error:&v45];
  id v28 = v45;

  if (v27)
  {
    CFRetain(v27);
    self->_ctkCallerSet = 1;
    objc_storeStrong((id *)&self->_ctkCallerOptions, a6);
    self->_ctkCallerProcessId = objc_msgSend(v36, "processId", v31, v32, v33);
    objc_storeStrong((id *)&self->_ctkCallerName, a9);
    objc_storeStrong((id *)&self->_ctkCallerBundleId, a10);
    id v29 = [v17 log];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "TKClientTokenSession created successfully.", buf, 2u);
    }

    id v30 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_B5F0;
    block[3] = &unk_2C938;
    id v39 = v27;
    id v40 = v34;
    id v41 = v35;
    id v42 = self;
    id v44 = v18;
    id v43 = v17;
    dispatch_async(v30, block);
  }
  else
  {
    (*((void (**)(id, void, id))v18 + 2))(v18, 0, v28);
  }
}

- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 callerName:(id)a9 callerBundleId:(id)a10 reply:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v36 = a5;
  id v35 = a6;
  id v37 = a7;
  id v40 = a8;
  id v38 = a9;
  id v39 = a10;
  id v19 = a11;
  id v20 = [(ContextPluginACM *)self _decodeOperation:v18];
  if (v20)
  {
    uint64_t v51 = 0;
    id v21 = (void *)SecAccessControlCreateFromData();
    if (v21)
    {
      id v22 = SecAccessControlGetProtection();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v52 = 0;
        id v53 = &v52;
        uint64_t v54 = 0x2020000000;
        id v23 = (id *)qword_31028;
        uint64_t v55 = qword_31028;
        if (!qword_31028)
        {
          *(void *)&long long buf = _NSConcreteStackBlock;
          *((void *)&buf + 1) = 3221225472;
          id v57 = sub_10424;
          v58 = &unk_2CC68;
          v59 = &v52;
          id v24 = (void *)sub_10200();
          id v25 = dlsym(v24, "TKAccessControlProtectionTokenIDKey");
          *(void *)(v59[1] + 24) = v25;
          qword_31028 = *(void *)(v59[1] + 24);
          id v23 = (id *)v53[3];
        }
        _Block_object_dispose(&v52, 8);
        if (!v23)
        {
          sub_2257C();
          __break(1u);
        }
        id v26 = *v23;
        id v27 = [v22 objectForKey:v26];

        id v28 = [v40 log];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v27;
          _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "ACL is protected by TKToken: %{public}@", (uint8_t *)&buf, 0xCu);
        }

        id v29 = dispatch_get_global_queue(0, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_BC64;
        block[3] = &unk_2C988;
        void block[4] = self;
        id v42 = v17;
        id v43 = v27;
        id v44 = v20;
        id v45 = v36;
        id v46 = v37;
        id v47 = v40;
        id v48 = v38;
        id v49 = v39;
        id v50 = v19;
        id v30 = v27;
        dispatch_async(v29, block);
      }
      else
      {
        id v34 = [v40 log];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v22;
          _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "ACL protection: %{public}@", (uint8_t *)&buf, 0xCu);
        }

        if ([v20 isEqualToString:&stru_2D508]) {
          [(ContextPluginACM *)self _validateACL:v21 evaluateOperation:v20 options:v36 uiDelegate:v35 originator:v37 request:v40 callerName:v38 callerBundleId:v39 reply:v19];
        }
        else {
          [(ContextPluginACM *)self _evaluateACL:v21 operation:v20 options:v36 uiDelegate:v35 originator:v37 request:v40 callerName:v38 callerBundleId:v39 reply:v19];
        }
      }
    }
    else
    {
      id v22 = +[NSString stringWithFormat:@"Invalid ACL: '%@'", v17];
      id v33 = +[LAErrorHelper parameterErrorWithMessage:v22];
      (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v33);
    }
  }
  else
  {
    id v31 = +[NSString stringWithFormat:@"Invalid operation: %@", v18];
    id v32 = +[LAErrorHelper parameterErrorWithMessage:v31];
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v32);
  }
}

- (void)_evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 callerName:(id)a9 callerBundleId:(id)a10 reply:(id)a11
{
  id v16 = a3;
  id v33 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  objc_initWeak(location, v19);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_C060;
  v34[3] = &unk_2C9D8;
  id v31 = v23;
  id v42 = v31;
  id v24 = v16;
  id v35 = v24;
  id v36 = self;
  id v25 = v17;
  id v37 = v25;
  id v26 = v18;
  id v38 = v26;
  objc_copyWeak(&v43, location);
  id v27 = v20;
  id v39 = v27;
  id v28 = v21;
  id v40 = v28;
  id v29 = v22;
  id v41 = v29;
  LOBYTE(v30) = 0;
  [(ContextPluginACM *)self _evaluateOperation:v33 aclRef:v24 options:v25 uiDelegate:v26 originator:v19 request:v27 validate:v30 callerName:v28 callerBundleId:v29 reply:v34];

  objc_destroyWeak(&v43);
  objc_destroyWeak(location);
}

- (id)_fillConstraint:(id)a3 options:(id)a4 userId:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_C978;
  v69[3] = &unk_2C9F8;
  v69[4] = a6;
  id v13 = objc_retainBlock(v69);
  id v14 = +[NSMutableDictionary dictionary];
  id v15 = [v10 objectForKey:@"cbio"];
  if (!v15)
  {
LABEL_14:
    id v16 = [v11 objectForKey:&off_2E590];
    if (!v16)
    {
LABEL_25:
      id v63 = v11;
      id v36 = [v10 objectForKey:@"cup"];
      unsigned int v37 = [v36 BOOLValue];

      if (v37)
      {
        if (!v15
          || ([v10 objectForKey:@"pkofn"],
              id v38 = objc_claimAutoreleasedReturnValue(),
              id v39 = (char *)[v38 integerValue],
              v38,
              v39 == (unsigned char *)&dword_0 + 2))
        {
          id v40 = +[LAPasscodeHelper sharedInstance];
          id v66 = 0;
          unsigned int v41 = objc_msgSend(v40, "isPasscodeSetForUser:error:", objc_msgSend(v12, "unsignedIntValue"), &v66);
          id v42 = v66;

          if (!v41)
          {
            ((void (*)(void *, id))v13[2])(v13, v42);
            id v29 = (id)objc_claimAutoreleasedReturnValue();
            id v11 = v63;
LABEL_45:

            goto LABEL_46;
          }
        }
      }
      id v61 = v14;
      id v42 = [v10 objectForKey:@"cpo"];
      if (v42)
      {
        id v43 = +[LAPasscodeHelper sharedInstance];
        id v44 = v12;
        id v65 = 0;
        unsigned int v45 = objc_msgSend(v43, "isPasscodeSetForUser:error:", objc_msgSend(v12, "unsignedIntValue"), &v65);
        id v46 = v65;

        if (!v45)
        {
          ((void (*)(void *, id))v13[2])(v13, v46);
          id v29 = (id)objc_claimAutoreleasedReturnValue();
          id v11 = v63;
          goto LABEL_44;
        }

        id v12 = v44;
      }
      id v44 = v12;
      id v46 = [v10 objectForKey:@"ckon"];
      id v11 = v63;
      if (v46)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v51 = +[LAErrorHelper internalErrorWithMessage:@"Kofn constraint must be a dictionary."];
          ((void (*)(void *, void *))v13[2])(v13, v51);
          id v29 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_44;
        }
        id v64 = 0;
        id v47 = [(ContextPluginACM *)self _fillConstraint:v46 options:v63 userId:v44 error:&v64];
        id v48 = v64;
        if (!v47)
        {
          uint64_t v52 = ((void (*)(void *, id))v13[2])(v13, v48);
          id v53 = v48;
          id v29 = (id)v52;

          goto LABEL_44;
        }
        if ([v47 count])
        {
          id v49 = [v46 dictionaryByMergingWith:v47];
          [v61 setObject:v49 forKey:@"ckon"];

          id v11 = v63;
        }
      }
      id v50 = (id)((uint64_t (*)(void *, void))v13[2])(v13, 0);
      id v29 = v61;
LABEL_44:

      id v12 = v44;
      id v14 = v61;
      goto LABEL_45;
    }
    id v27 = [v10 objectForKey:@"pgcma"];
    if (!v27)
    {
      id v28 = [v14 objectForKey:@"cbio"];
      if (v28)
      {

LABEL_23:
        [v16 doubleValue];
        id v35 = +[NSNumber numberWithUnsignedInteger:(unint64_t)(v34 * 1000.0)];
        [v14 setObject:v35 forKey:@"pgcma"];

        goto LABEL_24;
      }
      id v33 = [v10 objectForKey:@"cpo"];

      if (v33) {
        goto LABEL_23;
      }
    }
LABEL_24:

    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v16 = +[LAErrorHelper internalErrorWithMessage:@"Bio constraint must be a dictionary."];
    ((void (*)(void *, void *))v13[2])(v13, v16);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_46;
  }
  id v16 = +[NSMutableDictionary dictionary];
  id v17 = [v15 objectForKey:@"pbioc"];
  id v18 = v17;
  if (!v17 || [v17 length])
  {
    id v57 = v12;
LABEL_6:
    id v19 = [v15 objectForKey:@"pbioh"];
    id v20 = v19;
    id v62 = v11;
    if (v19 && ![v19 length])
    {
      v58 = self;
      id v21 = +[BiometryHelper sharedInstance];
      uint64_t v68 = 0;
      uint64_t v22 = [v21 biometryDatabaseHashForUser:v57 error:&v68];

      if (!v22)
      {
        id v20 = +[LAErrorHelper internalErrorWithMessage:@"Failed to get bio database hash."];
        ((void (*)(void *, void *))v13[2])(v13, v20);
        id v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_50:

        id v12 = v57;
        goto LABEL_46;
      }
      [v16 setObject:v22 forKey:@"pbioh"];
      id v20 = (void *)v22;
      self = v58;
    }
    if (![v16 count])
    {
LABEL_13:

      id v11 = v62;
      id v12 = v57;
      goto LABEL_14;
    }
    v59 = self;
    id v23 = +[BiometryHelper sharedInstance];
    id v67 = 0;
    unsigned int v24 = [v23 isEnrolledWithoutHardware:v57 error:&v67];
    id v25 = v67;

    if (v24)
    {
      id v26 = [v15 dictionaryByMergingWith:v16];
      [v14 setObject:v26 forKey:@"cbio"];

      self = v59;
      goto LABEL_13;
    }
    ((void (*)(void *, id))v13[2])(v13, v25);
    id v29 = (id)objc_claimAutoreleasedReturnValue();

    id v11 = v62;
    goto LABEL_50;
  }
  id v60 = v14;
  +[BiometryHelper sharedInstance];
  id v31 = v30 = v12;
  uint64_t v32 = [v31 catacombUUID:v30];

  if (v32)
  {
    id v57 = v30;
    [v16 setObject:v32 forKey:@"pbioc"];
    id v18 = (void *)v32;
    id v14 = v60;
    goto LABEL_6;
  }
  uint64_t v55 = +[NSString stringWithFormat:@"Failed to get bio catacomb UUID for user %@.", v30];
  id v56 = +[LAErrorHelper internalErrorWithMessage:v55];
  ((void (*)(void *, void *))v13[2])(v13, v56);
  id v29 = (id)objc_claimAutoreleasedReturnValue();

  id v12 = v30;
  id v14 = v60;
LABEL_46:

  return v29;
}

- (void)_evaluateOperation:(id)a3 aclRef:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 validate:(BOOL)a9 callerName:(id)a10 callerBundleId:(id)a11 reply:(id)a12
{
  id v18 = a3;
  id v19 = a4;
  id v66 = a5;
  id v64 = a6;
  id v67 = a7;
  id v20 = a8;
  id v65 = a10;
  id v21 = a11;
  uint64_t v22 = (void (**)(id, void *, void))a12;
  id v23 = [v20 log];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    __int16 v91 = 2114;
    id v92 = v18;
    _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ evaluates operation: %{public}@", buf, 0x16u);
  }

  if (![v18 isEqualToString:&stru_2D508])
  {
    id v63 = v21;
    id v26 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v67 userId]);
    id v27 = [(ContextPluginACM *)self _updateRecoveryRetryCountIfNeeded:v66 request:v20 userId:v26];

    Constraint = (const void *)SecAccessControlGetConstraint();
    if (!Constraint)
    {
      if (a9)
      {
        v22[2](v22, &__NSDictionary0__struct, 0);
      }
      else
      {
        +[NSString stringWithFormat:@"ACL operation is not allowed: '%@'", v18];
        v35 = double v34 = v27;
        id v36 = +[LAErrorHelper errorWithCode:-1009 message:v35];
        ((void (**)(id, void *, void *))v22)[2](v22, 0, v36);

        id v27 = v34;
      }
      unsigned int v24 = v64;
      id v25 = v65;
      goto LABEL_34;
    }
    id v29 = (void *)CFRetain(Constraint);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v57 = v27;
      id v30 = [v27 objectForKeyedSubscript:&off_2E7B8];
      id v31 = v30;
      if (v30)
      {
        id v32 = v30;
      }
      else
      {
        +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v67 userId]);
        id v32 = (id)objc_claimAutoreleasedReturnValue();
      }
      unsigned int v37 = v32;

      id v85 = 0;
      id v27 = v57;
      id v33 = [(ContextPluginACM *)self _fillConstraint:v29 options:v57 userId:v37 error:&v85];
      id v38 = v85;
      if (v33)
      {
        id v61 = v38;
        uint64_t v55 = v29;
        *(void *)long long buf = 0;
        if (![v33 count]) {
          goto LABEL_18;
        }
        v87 = v33;
        v88 = &off_2E7D0;
        id v86 = v18;
        id v39 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
        v89 = v39;
        id v40 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
        BOOL v41 = sub_124E8((uint64_t)v19, v40, buf);

        id v21 = v63;
        id v27 = v57;
        if (v41)
        {
LABEL_18:

          id v29 = v55;
          goto LABEL_19;
        }
        id v60 = v33;
        id v49 = *(void **)buf;
        v22[2](v22, 0, *(void *)buf);

        id v48 = v37;
        unsigned int v24 = v64;
        id v25 = v65;
        id v29 = v55;
      }
      else
      {
        id v47 = v38;
        ((void (**)(id, void *, id))v22)[2](v22, 0, v38);
        id v48 = v47;
        id v60 = v37;
        unsigned int v24 = v64;
        id v25 = v65;
      }
LABEL_33:

LABEL_34:
      goto LABEL_35;
    }
    id v33 = &__NSDictionary0__struct;
LABEL_19:
    id v62 = (void *)SecAccessControlCopyConstraintData();
    id v42 = [v27 objectForKey:&off_2E590];
    id v60 = v33;
    id v56 = v42;
    if (v42)
    {
      [v42 doubleValue];
      unsigned int v53 = (v43 * 1000.0);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v58 = v19;
        id v44 = v29;
        unsigned int v45 = [v29 objectForKey:@"pgcma"];
        id v46 = v45;
        if (v45) {
          unsigned int v53 = [v45 unsignedIntValue];
        }
        else {
          unsigned int v53 = 0;
        }

        id v29 = v44;
        id v19 = v58;
      }
      else
      {
        unsigned int v53 = 0;
      }
    }
    id v84 = 0;
    uint64_t v50 = [(ContextPluginACM *)self _operationAsString:v18 error:&v84];
    id v51 = v84;
    v59 = (void *)v50;
    uint64_t v54 = v51;
    if (v50)
    {
      acmHelper = self->_acmHelper;
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_D0D8;
      v68[3] = &unk_2CA48;
      uint64_t v81 = v22;
      id v69 = v20;
      id v70 = v29;
      id v71 = v67;
      BOOL v83 = a9;
      id v72 = v60;
      id v73 = self;
      id v74 = v27;
      id v25 = v65;
      id v75 = v65;
      id v76 = v63;
      unsigned int v82 = v53;
      id v77 = v62;
      id v78 = v18;
      unsigned int v24 = v64;
      id v79 = v64;
      id v80 = v19;
      id v21 = v63;
      [(LAACMHelper *)acmHelper verifyAclConstraint:v77 operation:v59 preflight:1 parameters:0 parametersCount:0 maxGlobalCredentialAge:v53 processRequirement:v68];
    }
    else
    {
      ((void (**)(id, void *, id))v22)[2](v22, 0, v51);
      unsigned int v24 = v64;
      id v25 = v65;
    }

    id v48 = v62;
    goto LABEL_33;
  }
  v22[2](v22, &__NSDictionary0__struct, 0);
  unsigned int v24 = v64;
  id v25 = v65;
LABEL_35:
}

- (id)_operationAsString:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = +[NSString stringWithFormat:@"Invalid operation: %@", v5];
    uint64_t v7 = +[LAErrorHelper internalErrorWithMessage:v8];

    id v6 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v6 = v5;
  uint64_t v7 = 0;
  if (a4) {
LABEL_5:
  }
    *a4 = v7;
LABEL_6:

  return v6;
}

- (void)_validateACL:(id)a3 evaluateOperation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 callerName:(id)a9 callerBundleId:(id)a10 reply:(id)a11
{
  id v16 = a3;
  id v28 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  unsigned int v24 = SecAccessControlGetConstraints();
  if (v24)
  {
    objc_initWeak(location, v19);
    id v26 = [v24 keyEnumerator];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_DA00;
    v29[3] = &unk_2CA70;
    v36[1] = v16;
    id v35 = v23;
    v29[4] = self;
    id v30 = v17;
    id v31 = v18;
    objc_copyWeak(v36, location);
    id v32 = v20;
    id v33 = v21;
    id v34 = v22;
    id v25 = v28;
    [(ContextPluginACM *)self _validateOperations:v26 aclRef:v16 evaluateOperation:v28 options:v30 uiDelegate:v31 originator:v19 request:v32 currentResult:&__NSDictionary0__struct reply:v29];

    objc_destroyWeak(v36);
    objc_destroyWeak(location);
  }
  else
  {
    (*((void (**)(id, void *, void))v23 + 2))(v23, &__NSDictionary0__struct, 0);
    id v25 = v28;
  }
}

- (void)_validateOperations:(id)a3 aclRef:(id)a4 evaluateOperation:(id)a5 options:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 currentResult:(id)a10 reply:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = v16;
  id v33 = v19;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  uint64_t v26 = [v20 nextObject];
  id v31 = (void *)v26;
  id v32 = v18;
  if (v26)
  {
    id v27 = (void *)v26;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_DE94;
    v34[3] = &unk_2CA98;
    id v45 = v25;
    id v35 = v24;
    id v36 = v27;
    unsigned int v37 = self;
    id v38 = v20;
    id v39 = v17;
    id v40 = v18;
    id v41 = v33;
    id v42 = v21;
    id v43 = v22;
    id v44 = v23;
    [(ContextPluginACM *)self _validateOperation:v36 aclRef:v39 evaluateOperation:v40 options:v41 uiDelegate:v42 originator:v43 request:v44 reply:v34];

    id v28 = v45;
  }
  else
  {
    id v47 = v24;
    CFStringRef v48 = @"Result";
    id v46 = &off_2E7D0;
    id v28 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    id v49 = v28;
    id v29 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    (*((void (**)(id, void *, void))v25 + 2))(v25, v29, 0);
  }
}

- (void)_validateOperation:(id)a3 aclRef:(id)a4 evaluateOperation:(id)a5 options:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 reply:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = (void (**)(id, void *, void))a10;
  id v23 = a5;
  id v24 = [v21 log];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v28 = self;
    __int16 v29 = 2114;
    id v30 = v16;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ validates operation: %{public}@", buf, 0x16u);
  }

  unsigned int v25 = [v16 isEqual:v23];
  if (v25)
  {
    v22[2](v22, &__NSDictionary0__struct, 0);
  }
  else
  {
    LOBYTE(v26) = 1;
    [(ContextPluginACM *)self _evaluateOperation:v16 aclRef:v17 options:v18 uiDelegate:v19 originator:v20 request:v21 validate:v26 callerName:0 callerBundleId:0 reply:v22];
  }
}

- (BOOL)_validatePassword:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 originator:(id)a6 request:(id)a7 callerName:(id)a8 callerBundleId:(id)a9 reply:(id)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = (void (**)(id, void, id))a10;
  acmHelper = self->_acmHelper;
  v50[0] = 0;
  unsigned __int8 v23 = [(LAACMHelper *)acmHelper isCredentialOfTypeSet:2 error:v50];
  id v24 = v50[0];
  if ((v23 & 1) == 0)
  {
    id v39 = v17;
    id v40 = v16;
    unsigned int v25 = [v15 objectForKey:&off_2E4E8];
    unsigned int v26 = [v25 BOOLValue];

    if (v26)
    {
      id v27 = +[LAErrorHelper errorWithCode:-1004 message:@"User interaction is required."];
      v21[2](v21, 0, v27);
      id v16 = v40;
    }
    else
    {
      id v16 = v40;
      if (!self->_applicationPasswordWasSet)
      {
        id v17 = v39;
        if (self->_applicationPasswordCounter < 5)
        {
          [(ContextPluginACM *)self createInternalInfo:v15 skipCallerIdentification:v19 != 0 callerBundleId:0 request:v18 originator:v39];
          unsigned int v37 = (id *)objc_claimAutoreleasedReturnValue();
          if (v19) {
            [v37 setObject:v19 forKey:@"CallerName"];
          }
          if (v20) {
            [v37 setObject:v20 forKey:@"CallerId"];
          }
          id v34 = [v18 payload];
          id v29 = [v34 mutableCopy];
          id v33 = v19;
          if (v29)
          {
            id v30 = v29;
            id v31 = v29;
          }
          else
          {
            id v30 = 0;
            id v31 = (id)objc_opt_new();
          }
          id v36 = v31;

          [v36 setObject:v37 forKeyedSubscript:LACEvaluationRequestPayloadKeyInternalInfo];
          [v18 updatePayload:v36];
          objc_initWeak(&location, v39);
          id v35 = [objc_alloc((Class)ACMContextRecord) initWithACMContext:self->_acmContext cachedExternalizationDelegate:self];
          mechanismManager = self->_mechanismManager;
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_E594;
          v41[3] = &unk_2CB10;
          id v42 = v15;
          id v43 = self;
          id v27 = v37;
          id v44 = v27;
          id v45 = v40;
          objc_copyWeak(&v48, &location);
          id v46 = v18;
          id v47 = v21;
          id v17 = v39;
          [(MechanismManagerACM *)mechanismManager mechanismForApplicationPasswordMode:a3 acmContextRecord:v35 options:v42 internalInfo:v27 uiDelegate:v45 originator:v39 request:v46 reply:v41];
          id v19 = v33;

          objc_destroyWeak(&v48);
          objc_destroyWeak(&location);

          id v16 = v40;
        }
        else
        {
          self->_applicationPasswordCounter = 0;
          id v27 = +[LAErrorHelper errorWithCode:-1 message:@"Application retry limit exceeded."];
          v21[2](v21, 0, v27);
        }
        goto LABEL_7;
      }
      id v27 = +[LAErrorHelper errorWithCode:-1 message:@"Missing application password."];
      v21[2](v21, 0, v27);
    }
    id v17 = v39;
LABEL_7:
  }
  return v23;
}

- (void)isCredentialSet:(int64_t)a3 originator:(id)a4 reply:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void (**)(id, BOOL, void *))a5;
  uint64_t v10 = 13;
  switch(a3)
  {
    case -9:
      goto LABEL_8;
    case -6:
      uint64_t v10 = 14;
      goto LABEL_8;
    case -3:
      ctkPin = self->_ctkPin;
      if (ctkPin)
      {
        id v12 = ctkPin;
        goto LABEL_11;
      }
      id v12 = +[NSNull null];
      if (v12)
      {
LABEL_11:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = +[LAErrorHelper errorWithCode:-1008 message:@"Credential not set"];
        }
        else
        {
          id v15 = 0;
        }
        goto LABEL_15;
      }
LABEL_13:
      id v14 = +[LAErrorHelper parameterErrorWithMessage:@"Unsupported credential type"];
LABEL_14:
      id v15 = v14;
      id v12 = 0;
LABEL_15:
      v9[2](v9, v15 == 0, v15);

      return;
    case -2:
    case 0:
      uint64_t v10 = 2;
      goto LABEL_8;
    case -1:
      if ([v8 checkEntitlement:@"com.apple.private.CoreAuthentication.SPI"])
      {
        uint64_t v10 = 1;
LABEL_8:
        acmHelper = self->_acmHelper;
        id v16 = 0;
        [(LAACMHelper *)acmHelper isCredentialOfTypeSet:v10 error:&v16];
        id v14 = v16;
      }
      else
      {
        id v14 = +[LAErrorHelper missingEntitlementError:@"com.apple.private.CoreAuthentication.SPI"];
      }
      goto LABEL_14;
    default:
      goto LABEL_13;
  }
}

- (void)setCredential:(id)a3 type:(int64_t)a4 options:(id)a5 originator:(id)a6 reply:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, id, id))a7;
  switch(a4)
  {
    case -11:
      acmHelper = self->_acmHelper;
      uint64_t v50 = 0;
      id v18 = [(LAACMHelper *)acmHelper addCredential:21 scope:1 property:1001 data:v13 error:&v50];
      id v19 = v50;
      goto LABEL_33;
    case -9:
      if (v13)
      {
        id v23 = v13;
        id v24 = +[LACSecureData secureDataWithBytes:length:](LACSecureData, "secureDataWithBytes:length:", [v23 bytes], objc_msgSend(v23, "length"));
        unsigned int v25 = self->_acmHelper;
        id v56 = 0;
        id v18 = [(LAACMHelper *)v25 addExtractablePassphrase:v24 scope:1 error:&v56];
        id v22 = v56;

        goto LABEL_34;
      }
      id v40 = self->_acmHelper;
      uint64_t v55 = 0;
      id v18 = [(LAACMHelper *)v40 removeCredentialsOfType:13 error:&v55];
      id v19 = v55;
      goto LABEL_33;
    case -8:
      id v32 = self->_acmHelper;
      if (v13)
      {
        id v33 = +[LACSecureData secureDataWithData:v13];
      }
      else
      {
        id v33 = 0;
      }
      id v52 = 0;
      id v18 = [(LAACMHelper *)v32 setData:v33 type:5 error:&v52];
      id v22 = v52;
      if (v13) {

      }
      goto LABEL_34;
    case -6:
      if (![v15 checkEntitlement:@"com.apple.private.LocalAuthentication.RGBCapture"])
      {
        CFStringRef v39 = @"com.apple.private.LocalAuthentication.RGBCapture";
        goto LABEL_22;
      }
      id v34 = self->_acmHelper;
      if (v13)
      {
        uint64_t v54 = 0;
        id v18 = [(LAACMHelper *)v34 addCredential:14 scope:1 error:&v54];
        id v19 = v54;
      }
      else
      {
        unsigned int v53 = 0;
        id v18 = [(LAACMHelper *)v34 removeCredentialsOfType:14 error:&v53];
        id v19 = v53;
      }
      goto LABEL_33;
    case -3:
      objc_storeStrong((id *)&self->_ctkPin, a3);
      id v22 = 0;
      goto LABEL_30;
    case -1:
      if (![v15 checkEntitlement:@"com.apple.private.CoreAuthentication.SPI"])
      {
        CFStringRef v39 = @"com.apple.private.CoreAuthentication.SPI";
LABEL_22:
        id v22 = +[LAErrorHelper missingEntitlementError:v39];
        goto LABEL_23;
      }
      if (v13)
      {
        unsigned int v26 = +[LAPasscodeHelper sharedInstance];
        uint64_t v27 = +[LACSecureData secureDataWithData:v13];
        id v49 = [(ContextPluginACM *)self cachedExternalizedContext];
        id v28 = [v49 externalizedContext];
        id v29 = [v14 objectForKeyedSubscript:&off_2E7B8];
        if (v29)
        {
          id v30 = (void *)v27;
          id v31 = [v26 verifyPasswordUsingAKS:v27 acmContext:v28 userId:v29 policy:0 options:v14 bioLockoutRecovery:0];
        }
        else
        {
          +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v15 userId]);
          id v43 = v48 = v26;
          id v30 = (void *)v27;
          id v31 = [v48 verifyPasswordUsingAKS:v27 acmContext:v28 userId:v43 policy:0 options:v14 bioLockoutRecovery:0];

          unsigned int v26 = v48;
        }

        if (v31)
        {
          id v20 = +[NSString stringWithFormat:@"Password rejected (%d)", v31];
          id v22 = +[LAErrorHelper errorWithCode:-1 message:v20];
LABEL_4:

LABEL_23:
          id v18 = 0;
          goto LABEL_34;
        }
        id v44 = [(ContextPluginACM *)self resultInfo];
        CFStringRef v61 = @"Result";
        v59 = &off_2E800;
        id v60 = &__kCFBooleanTrue;
        id v18 = &dword_0 + 1;
        id v45 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
        id v62 = v45;
        id v46 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        id v47 = [v44 dictionaryByMergingWith:v46];
        [(ContextPluginACM *)self setResultInfo:v47];

        id v22 = 0;
      }
      else
      {
        id v42 = self->_acmHelper;
        id v51 = 0;
        id v18 = [(LAACMHelper *)v42 removeCredentialsOfType:1 error:&v51];
        id v19 = v51;
LABEL_33:
        id v22 = v19;
      }
LABEL_34:
      v16[2](v16, v18, v22);

      return;
    case 0:
      if (v13)
      {
        id v35 = v13;
        id v36 = +[LACSecureData secureDataWithBytes:length:](LACSecureData, "secureDataWithBytes:length:", [v35 bytes], objc_msgSend(v35, "length"));
        unsigned int v37 = self->_acmHelper;
        id v58 = 0;
        unsigned __int8 v38 = [(LAACMHelper *)v37 replacePassphraseCredentialWithPurpose:0 passphrase:v36 scope:1 error:&v58];
        id v22 = v58;

        id v18 = 0;
        if ((v38 & 1) == 0) {
          goto LABEL_34;
        }
      }
      else
      {
        id v41 = self->_acmHelper;
        id v57 = 0;
        id v18 = [(LAACMHelper *)v41 removeCredentialsOfType:2 error:&v57];
        id v22 = v57;
        if (!v18) {
          goto LABEL_34;
        }
      }
      self->_applicationPasswordWasSet = v13 != 0;
LABEL_30:
      id v18 = &dword_0 + 1;
      goto LABEL_34;
    default:
      id v20 = +[NSNumber numberWithInteger:a4];
      id v21 = +[NSString stringWithFormat:@"Unsupported credentialType: %@", v20];
      id v22 = +[LAErrorHelper parameterErrorWithMessage:v21];

      goto LABEL_4;
  }
}

- (void)credentialOfType:(int64_t)a3 originator:(id)a4 reply:(id)a5
{
  if (a3 == -9)
  {
    acmHelper = self->_acmHelper;
    id v14 = 0;
    uint64_t v7 = (void (**)(id, void *, id))a5;
    id v8 = [(LAACMHelper *)acmHelper credentialOfType:13 property:701 error:&v14];
    id v9 = v14;
    v7[2](v7, v8, v9);
  }
  else
  {
    id v11 = a5;
    id v13 = +[NSString stringWithFormat:@"Unsupported credentialType: %d", a3];
    id v12 = +[LAErrorHelper parameterErrorWithMessage:v13];
    (*((void (**)(id, void, void *))a5 + 2))(v11, 0, v12);
  }
}

- (void)checkCredentialSatisfied:(int64_t)a3 policy:(int64_t)a4 reply:(id)a5
{
  acmHelper = self->_acmHelper;
  id v9 = (void (**)(id, id, id))a5;
  id v12 = 0;
  id v10 = [(LAACMHelper *)acmHelper verifyRequirementOfType:[(ContextPluginACM *)self _requirementTypeForCredentialType:a3] policy:+[LAACMHelper acmPolicyForPolicy:a4] error:&v12];
  id v11 = v12;
  v9[2](v9, v10, v11);
}

- (unsigned)_requirementTypeForCredentialType:(int64_t)a3
{
  if (a3 == -1) {
    return 1;
  }
  else {
    return 2 * (a3 == -2);
  }
}

- (void)setOptions:(id)a3 forInternalOperation:(int64_t)a4 originator:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = [v11 originatorId];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_F3C8;
  v17[3] = &unk_2CB60;
  objc_copyWeak(v20, &location);
  id v14 = v10;
  id v18 = v14;
  v20[1] = (id)a4;
  v20[2] = v13;
  id v15 = v12;
  id v19 = v15;
  v16.receiver = self;
  v16.super_class = (Class)ContextPluginACM;
  [(ContextPluginACM *)&v16 setOptions:v14 forInternalOperation:a4 originator:v11 reply:v17];

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

- (void)_setOptions:(id)a3 forInternalOperation:(int64_t)a4 originatorId:(unint64_t)a5 reply:(id)a6
{
  id v16 = a3;
  id v10 = (void (**)(id, void, void *))a6;
  if (a4 == 1)
  {
    id v11 = v16;
    if (v16 && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), id v11 = v16, (isKindOfClass & 1) != 0))
    {
      [(ContextPluginACM *)self _paymentOperationWithInstructions:v16 originatorId:a5 reply:v10];
    }
    else
    {
      id v15 = +[LAErrorHelper parameterErrorForMissingOrInvalidObject:v11 name:"options"];
      v10[2](v10, 0, v15);
    }
  }
  else
  {
    id v13 = +[NSString stringWithFormat:@"Unsupported internal operation: %d", a4];
    id v14 = +[LAErrorHelper internalErrorWithMessage:v13];
    v10[2](v10, 0, v14);
  }
}

- (void)_paymentOperationWithInstructions:(id)a3 originatorId:(unint64_t)a4 reply:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_F660;
  v9[3] = &unk_2CBB0;
  id v10 = self;
  id v11 = a3;
  id v12 = a5;
  unint64_t v13 = a4;
  id v7 = v11;
  id v8 = v12;
  [(ContextPluginACM *)v10 _parseInstructions:v7 completion:v9];
}

- (void)_parseInstructions:(id)a3 completion:(id)a4
{
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_FBE4;
  id v20[3] = &unk_2CBD8;
  id v5 = a4;
  id v21 = v5;
  id v6 = a3;
  id v7 = objc_retainBlock(v20);
  id v19 = 0;
  id v8 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:0 error:&v19];

  id v9 = v19;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v8;
      id v11 = [v10 objectForKeyedSubscript:@"fortifiedInstructions"];
      if (v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v12 = +[LAErrorHelper parameterErrorForMissingOrInvalidObject:v11 name:"instructions"];
          ((void (*)(void *, void *))v7[2])(v7, v12);
LABEL_27:

          goto LABEL_28;
        }
      }
      id v12 = [v10 objectForKeyedSubscript:@"fortifiedSignature"];
      if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v17 = "signature";
        id v18 = v12;
      }
      else
      {
        BOOL v13 = v11 != 0;
        if (v12) {
          BOOL v14 = v11 != 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (v12) {
          BOOL v13 = 0;
        }
        if (!v13 && v14)
        {
          if (v11)
          {
            id v15 = +[LACSecureData secureDataWithData:v11];
            if (v12) {
              goto LABEL_16;
            }
          }
          else
          {
            id v15 = 0;
            if (v12)
            {
LABEL_16:
              id v16 = +[LACSecureData secureDataWithData:v12];
              (*((void (**)(id, void, void, void *, void *))v5 + 2))(v5, 0, 0, v15, v16);

              if (!v11) {
                goto LABEL_27;
              }
              goto LABEL_26;
            }
          }
          (*((void (**)(id, void, void, void *, void))v5 + 2))(v5, 0, 0, v15, 0);
          if (!v11) {
            goto LABEL_27;
          }
LABEL_26:

          goto LABEL_27;
        }
        if (v11) {
          id v17 = "signature";
        }
        else {
          id v17 = "instructions";
        }
        id v18 = 0;
      }
      id v15 = +[LAErrorHelper parameterErrorForMissingOrInvalidObject:v18 name:v17];
      ((void (*)(void *, void *))v7[2])(v7, v15);
      goto LABEL_26;
    }
  }
  id v10 = +[LAErrorHelper parameterErrorForMissingOrInvalidObject:v8 name:"plist"];
  ((void (*)(void *, id))v7[2])(v7, v10);
LABEL_28:
}

- (BOOL)_setPragueInstructions:(id)a3 signature:(id)a4 error:(id *)a5
{
  id v8 = a4;
  acmHelper = self->_acmHelper;
  id v18 = 0;
  unsigned int v10 = [(LAACMHelper *)acmHelper setData:a3 type:1 error:&v18];
  id v11 = v18;
  if (!v10)
  {
    BOOL v15 = 0;
    goto LABEL_9;
  }
  id v12 = self->_acmHelper;
  id v17 = v11;
  unsigned int v13 = [(LAACMHelper *)v12 setData:v8 type:3 error:&v17];
  id v14 = v17;

  if (!v13)
  {
    BOOL v15 = 0;
LABEL_8:
    id v11 = v14;
    goto LABEL_9;
  }
  if (!a5)
  {
    BOOL v15 = 1;
    goto LABEL_8;
  }
  id v11 = v14;
  *a5 = v11;
  BOOL v15 = 1;
LABEL_9:

  return v15;
}

- (void)_setLegacyInstructions:(id)a3 originatorId:(unint64_t)a4 reply:(id)a5
{
  id v6 = a5;
  id v7 = +[LAErrorHelper errorNotSupported];
  (*((void (**)(id, void, id))a5 + 2))(v6, 0, v7);
}

- (unsigned)_credentialTypeForEvent:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8) {
    return 0;
  }
  else {
    return dword_2568C[a3 - 1];
  }
}

- (void)resetEvent:(int64_t)a3 originator:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  unsigned int v10 = sub_30F8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v21 = a3;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "resetEvent:%d", buf, 8u);
  }

  BOOL v11 = 0;
  id v12 = 0;
  uint64_t v13 = 1;
  do
  {
    if ((!a3 || v13 == [(ContextPluginACM *)self _credentialTypeForEvent:a3])
      && ![(ContextPluginACM *)self _shouldAvoidRemovingCredentialType:v13])
    {
      if ([(LAACMHelper *)self->_acmHelper isCredentialOfTypeSet:v13 error:0])
      {
        acmHelper = self->_acmHelper;
        id v19 = v12;
        unsigned int v15 = [(LAACMHelper *)acmHelper removeCredentialsOfType:v13 error:&v19];
        id v16 = v19;

        id v12 = v16;
        if (!v15) {
          break;
        }
      }
    }
    int v17 = v13 + 1;
    BOOL v11 = v13 > 0x11;
    uint64_t v13 = (v13 + 1);
  }
  while (v17 != 19);
  if (!a3)
  {
    ctkPin = self->_ctkPin;
    self->_ctkPin = 0;

    if (!v11) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v11) {
LABEL_12:
  }
    [(ContextPluginACM *)self setResultInfo:&__NSDictionary0__struct];
LABEL_13:
  ((void (**)(id, BOOL, void *))v9)[2](v9, v11, v12);
}

- (BOOL)_shouldAvoidRemovingCredentialType:(unsigned int)a3
{
  return (a3 < 0x10) & (0x9400u >> a3);
}

- (void)authMethodWithReply:(id)a3
{
  id v4 = a3;
  acmContext = self->_acmContext;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010;
  v7[3] = &unk_2CC00;
  id v8 = v4;
  id v6 = v4;
  ACMGetAclAuthMethod((__n128 *)acmContext, (uint64_t)v7);
}

- (void)_setACMHelper:(id)a3
{
}

- (void)_setMechanismManager:(id)a3
{
}

- (void)_setAuthenticationManager:(id)a3
{
}

- (__ACMHandle)acmContext
{
  return self->_acmContext;
}

@end