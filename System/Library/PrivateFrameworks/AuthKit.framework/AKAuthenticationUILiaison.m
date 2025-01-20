@interface AKAuthenticationUILiaison
+ (AKAuthenticationUILiaison)sharedInstance;
- (AKAuthenticationSurrogateManager)surrogateManager;
- (AKAuthenticationUILiaison)init;
- (BOOL)_isBackgroundClient:(id)a3 eligibleForForegroundAuthenticationWithContext:(id)a4;
- (BOOL)_isFullUICapabilityRequiredFor2FA;
- (id)_notificationDictionaryForClient:(id)a3 context:(id)a4 needFullUI:(BOOL)a5;
- (id)_optionsForCreatingUserNotificationWithTitle:(id)a3 message:(id)a4 defaultButton:(id)a5 alternateButton:(id)a6 serviceType:(int64_t)a7;
- (id)_stringByAppendingBlameIfNecessary:(id)a3 withContext:(id)a4 client:(id)a5;
- (id)uiWorkQueue;
- (void)_performBlockWithClient:(id)a3 context:(id)a4 requireFullUICapability:(BOOL)a5 allowRedirectToSettings:(BOOL)a6 block:(id)a7;
- (void)_sendAnalyticsEvent:(id)a3 withError:(id)a4;
- (void)activateProximitySession:(id)a3 client:(id)a4 context:(id)a5 completion:(id)a6;
- (void)dismissBasicLoginUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)dismissKeepUsingUIForContext:(id)a3 client:(id)a4 withCompletion:(id)a5;
- (void)dismissNativeRecoveryUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)dismissProximityPairingUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)dismissSecondFactorUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)dismissServerProvidedUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)fetchUICapableContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)presentBasicLoginUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)presentBiometricOrPasscodeValidationForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)presentFidoAuthForContext:(id)a3 fidoContext:(id)a4 client:(id)a5 completion:(id)a6;
- (void)presentKeepUsingUIForContext:(id)a3 client:(id)a4 appleID:(id)a5 completion:(id)a6;
- (void)presentLoginAlertForContext:(id)a3 client:(id)a4 withError:(id)a5 title:(id)a6 message:(id)a7 completion:(id)a8;
- (void)presentNativeRecoveryUIForContext:(id)a3 recoveryContext:(id)a4 client:(id)a5 completion:(id)a6;
- (void)presentProximityBroadcastUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)presentProximityPairingUIForContext:(id)a3 client:(id)a4 event:(id)a5 completion:(id)a6;
- (void)presentProximityPairingUIForContext:(id)a3 client:(id)a4 verificationCode:(id)a5 completion:(id)a6;
- (void)presentProximityPinCodeUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)presentSecondFactorAlertForContext:(id)a3 client:(id)a4 withError:(id)a5 title:(id)a6 message:(id)a7 completion:(id)a8;
- (void)presentSecondFactorUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)presentServerProvidedUIForContext:(id)a3 client:(id)a4 withConfiguration:(id)a5 completion:(id)a6;
- (void)promptForAppleIDSettingsRedirectWithContext:(id)a3 client:(id)a4 needFullUI:(BOOL)a5 completion:(id)a6;
- (void)showProximityErrorForContext:(id)a3 client:(id)a4 completion:(id)a5;
@end

@implementation AKAuthenticationUILiaison

+ (AKAuthenticationUILiaison)sharedInstance
{
  if (qword_1002724E8 != -1) {
    dispatch_once(&qword_1002724E8, &stru_100229DE0);
  }
  v2 = (void *)qword_1002724E0;

  return (AKAuthenticationUILiaison *)v2;
}

- (AKAuthenticationUILiaison)init
{
  v9.receiver = self;
  v9.super_class = (Class)AKAuthenticationUILiaison;
  v2 = [(AKAuthenticationUILiaison *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[AKAccountManager sharedInstance];
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("AKUIWorkQueue", v5);
    clientUIWorkQueue = v2->_clientUIWorkQueue;
    v2->_clientUIWorkQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (AKAuthenticationSurrogateManager)surrogateManager
{
  return self->_surrogateManager;
}

- (void)fetchUICapableContext:(id)a3 client:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008B57C;
  v9[3] = &unk_100229E08;
  id v10 = a5;
  id v8 = v10;
  [(AKAuthenticationUILiaison *)self _performBlockWithClient:a4 context:a3 requireFullUICapability:1 allowRedirectToSettings:1 block:v9];
}

- (void)presentKeepUsingUIForContext:(id)a3 client:(id)a4 appleID:(id)a5 completion:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10008B7B8;
  v12[3] = &unk_100229E30;
  id v13 = a5;
  id v14 = a6;
  id v10 = v13;
  id v11 = v14;
  [(AKAuthenticationUILiaison *)self _performBlockWithClient:a4 context:a3 requireFullUICapability:1 allowRedirectToSettings:1 block:v12];
}

- (void)dismissKeepUsingUIForContext:(id)a3 client:(id)a4 withCompletion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008B9C4;
  v9[3] = &unk_100229E08;
  id v10 = a5;
  id v8 = v10;
  [(AKAuthenticationUILiaison *)self _performBlockWithClient:a4 context:a3 requireFullUICapability:1 allowRedirectToSettings:0 block:v9];
}

- (void)presentBasicLoginUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  +[AKCAAuthPromptReporter reportPromptByClient:v9 withContext:v8];
  if (+[AKAutoBugCapture shouldCapturePromptBugForContext:v8])
  {
    uint64_t v11 = AKBugCaptureSubTypePasswordPrompt;
    v12 = [v9 bundleID];
    id v13 = +[AKAutoBugCapture userInfoFromContext:v8];
    +[AKAutoBugCapture triggerAutoBugCaptureWithSubType:v11 andBundleID:v12 userInfo:v13];
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008BC74;
  v15[3] = &unk_100229E30;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [(AKAuthenticationUILiaison *)self _performBlockWithClient:v9 context:v8 requireFullUICapability:0 allowRedirectToSettings:1 block:v15];
}

- (void)dismissBasicLoginUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008C0DC;
  v9[3] = &unk_100229E08;
  id v10 = a5;
  id v8 = v10;
  [(AKAuthenticationUILiaison *)self _performBlockWithClient:a4 context:a3 requireFullUICapability:0 allowRedirectToSettings:0 block:v9];
}

- (void)presentLoginAlertForContext:(id)a3 client:(id)a4 withError:(id)a5 title:(id)a6 message:(id)a7 completion:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10008C43C;
  v20[3] = &unk_100229ED0;
  id v23 = a7;
  id v24 = a8;
  v20[4] = self;
  id v21 = v14;
  id v22 = v15;
  id v16 = v23;
  id v17 = v15;
  id v18 = v14;
  id v19 = v24;
  [(AKAuthenticationUILiaison *)self _performBlockWithClient:a4 context:a3 requireFullUICapability:0 allowRedirectToSettings:0 block:v20];
}

- (void)presentSecondFactorUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = [(AKAuthenticationUILiaison *)self _isFullUICapabilityRequiredFor2FA];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008C8F4;
  v13[3] = &unk_100229E08;
  id v14 = v8;
  id v12 = v8;
  [(AKAuthenticationUILiaison *)self _performBlockWithClient:v9 context:v10 requireFullUICapability:v11 allowRedirectToSettings:1 block:v13];
}

- (void)dismissSecondFactorUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = [(AKAuthenticationUILiaison *)self _isFullUICapabilityRequiredFor2FA];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008CB30;
  v13[3] = &unk_100229E08;
  id v14 = v8;
  id v12 = v8;
  [(AKAuthenticationUILiaison *)self _performBlockWithClient:v9 context:v10 requireFullUICapability:v11 allowRedirectToSettings:0 block:v13];
}

- (void)presentSecondFactorAlertForContext:(id)a3 client:(id)a4 withError:(id)a5 title:(id)a6 message:(id)a7 completion:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a4;
  id v19 = a3;
  BOOL v20 = [(AKAuthenticationUILiaison *)self _isFullUICapabilityRequiredFor2FA];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10008CDE0;
  v25[3] = &unk_100229EF8;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  id v24 = v17;
  [(AKAuthenticationUILiaison *)self _performBlockWithClient:v18 context:v19 requireFullUICapability:v20 allowRedirectToSettings:0 block:v25];
}

- (void)_sendAnalyticsEvent:(id)a3 withError:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (!v5) {
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:kAAFDidSucceed];
  }
  [v7 populateUnderlyingErrorsStartingWithRootError:v5];
  dispatch_queue_t v6 = +[AKAnalyticsReporterRTC rtcAnalyticsReporter];
  [v6 sendEvent:v7];
}

- (void)presentServerProvidedUIForContext:(id)a3 client:(id)a4 withConfiguration:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[AAFAnalyticsEvent ak_analyticsEventWithContext:v13 client:v12 eventName:@"com.apple.authkit.serverUIStart" error:0];
  id v15 = +[AKAnalyticsReporterRTC rtcAnalyticsReporter];
  [v15 sendEvent:v14];

  id v16 = +[AAFAnalyticsEvent ak_analyticsEventWithContext:v13 client:v12 eventName:@"com.apple.authkit.serverUIFinish" error:0];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10008D1D8;
  v25[3] = &unk_100229F20;
  void v25[4] = self;
  id v26 = v11;
  id v17 = v11;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10008D278;
  v21[3] = &unk_100229F98;
  id v23 = v10;
  id v24 = objc_retainBlock(v25);
  id v22 = v16;
  id v18 = v10;
  id v19 = v16;
  BOOL v20 = v24;
  [(AKAuthenticationUILiaison *)self _performBlockWithClient:v12 context:v13 requireFullUICapability:1 allowRedirectToSettings:1 block:v21];
}

- (void)dismissServerProvidedUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008D5F4;
  v9[3] = &unk_100229E08;
  id v10 = a5;
  id v8 = v10;
  [(AKAuthenticationUILiaison *)self _performBlockWithClient:a4 context:a3 requireFullUICapability:1 allowRedirectToSettings:0 block:v9];
}

- (void)presentNativeRecoveryUIForContext:(id)a3 recoveryContext:(id)a4 client:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = +[AAFAnalyticsEvent ak_analyticsEventWithContext:v13 client:v12 eventName:@"com.apple.authkit.nativeRecoveryStart" error:0];
  id v15 = +[AKAnalyticsReporterRTC rtcAnalyticsReporter];
  [v15 sendEvent:v14];

  id v16 = +[AAFAnalyticsEvent ak_analyticsEventWithContext:v13 client:v12 eventName:@"com.apple.authkit.nativeRecoveryFinish" error:0];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10008DA28;
  v25[3] = &unk_100229FC0;
  void v25[4] = self;
  id v26 = v11;
  id v17 = v11;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10008DAB4;
  v21[3] = &unk_100229F98;
  id v23 = v10;
  id v24 = objc_retainBlock(v25);
  id v22 = v16;
  id v18 = v10;
  id v19 = v16;
  BOOL v20 = v24;
  [(AKAuthenticationUILiaison *)self _performBlockWithClient:v12 context:v13 requireFullUICapability:1 allowRedirectToSettings:1 block:v21];
}

- (void)dismissNativeRecoveryUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008DE9C;
  v9[3] = &unk_100229E08;
  id v10 = a5;
  id v8 = v10;
  [(AKAuthenticationUILiaison *)self _performBlockWithClient:a4 context:a3 requireFullUICapability:1 allowRedirectToSettings:1 block:v9];
}

- (void)presentBiometricOrPasscodeValidationForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008E1D0;
  v9[3] = &unk_100229E08;
  id v10 = a5;
  id v8 = v10;
  [(AKAuthenticationUILiaison *)self _performBlockWithClient:a4 context:a3 requireFullUICapability:1 allowRedirectToSettings:1 block:v9];
}

- (void)presentFidoAuthForContext:(id)a3 fidoContext:(id)a4 client:(id)a5 completion:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10008E408;
  v12[3] = &unk_100229E30;
  id v13 = a4;
  id v14 = a6;
  id v10 = v13;
  id v11 = v14;
  [(AKAuthenticationUILiaison *)self _performBlockWithClient:a5 context:a3 requireFullUICapability:1 allowRedirectToSettings:1 block:v12];
}

- (void)presentProximityBroadcastUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10008E624;
  v10[3] = &unk_100228DD8;
  id v11 = a5;
  id v7 = v11;
  id v8 = a3;
  id v9 = [a4 proxyWithErrorHandler:v10];
  [v9 presentProximityBroadcastUIForContext:v8 completion:v7];
}

- (void)presentProximityPairingUIForContext:(id)a3 client:(id)a4 event:(id)a5 completion:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  if (sub_1000B60FC()) {
    sub_1000B66C4();
  }
  objc_opt_class();
  id v13 = v9;
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10008E7EC;
  v18[3] = &unk_100228DD8;
  id v19 = v10;
  id v15 = v10;
  id v16 = [v11 proxyWithErrorHandler:v18];

  id v17 = [v14 password];
  [v16 presentProximityPairingUIForContext:v12 verificationCode:v17 completion:v15];
}

- (void)presentProximityPairingUIForContext:(id)a3 client:(id)a4 verificationCode:(id)a5 completion:(id)a6
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008E940;
  v13[3] = &unk_100228DD8;
  id v14 = a6;
  id v9 = v14;
  id v10 = a5;
  id v11 = a3;
  id v12 = [a4 proxyWithErrorHandler:v13];
  [v12 presentProximityPairingUIForContext:v11 verificationCode:v10 completion:v9];
}

- (void)presentProximityPinCodeUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10008EA80;
  v10[3] = &unk_100228DD8;
  id v11 = a5;
  id v7 = v11;
  id v8 = a3;
  id v9 = [a4 proxyWithErrorHandler:v10];
  [v9 presentProximityPinCodeUIForContext:v8 completion:v7];
}

- (void)dismissProximityPairingUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10008EBC0;
  v10[3] = &unk_100228DD8;
  id v11 = a5;
  id v7 = v11;
  id v8 = a3;
  id v9 = [a4 proxyWithErrorHandler:v10];
  [v9 dismissProximityPairingUIForContext:v8 completion:v7];
}

- (void)activateProximitySession:(id)a3 client:(id)a4 context:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = [a4 proxyWithErrorHandler:&stru_100229FE0];
  [v12 activateProximitySession:v11 context:v10 completion:v9];
}

- (void)showProximityErrorForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [a4 proxyWithErrorHandler:&stru_10022A000];
  [v9 showProximityErrorForContext:v8 completion:v7];
}

- (void)_performBlockWithClient:(id)a3 context:(id)a4 requireFullUICapability:(BOOL)a5 allowRedirectToSettings:(BOOL)a6 block:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (getenv("__AKSYNCBUBBLE"))
  {
    id v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10018ABD4();
    }

    clientUIWorkQueue = self->_clientUIWorkQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008F454;
    block[3] = &unk_100228040;
    id v53 = v14;
    dispatch_async(clientUIWorkQueue, block);
    id v17 = v53;
LABEL_45:

    goto LABEL_46;
  }
  if (+[AAFDeviceInfo deviceIsAudioAccessory])
  {
    id v18 = _AKLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10018AA5C();
    }

    id v19 = self->_clientUIWorkQueue;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10008F4C4;
    v50[3] = &unk_100228040;
    id v51 = v14;
    dispatch_async(v19, v50);
    id v17 = v51;
    goto LABEL_45;
  }
  if ([v13 authenticationType] == (id)1)
  {
    BOOL v20 = _AKLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10018AA90();
    }

    id v21 = self->_clientUIWorkQueue;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10008F534;
    v48[3] = &unk_100228040;
    id v49 = v14;
    dispatch_async(v21, v48);
    id v17 = v49;
    goto LABEL_45;
  }
  id v22 = [v13 _capabilityForUIDisplay];
  id v23 = v22;
  if (v22 == (id)4 || v22 == (id)1)
  {
    id v26 = _AKLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Context cannot display full UI.", buf, 2u);
    }
  }
  else if (!v22)
  {
    id v24 = _AKLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10018AB6C();
    }

    v25 = self->_clientUIWorkQueue;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10008F5A4;
    v46[3] = &unk_100228040;
    id v47 = v14;
    dispatch_async(v25, v46);
    id v17 = v47;
    goto LABEL_45;
  }
  if ([v13 _performUIOutOfProcess])
  {
    id v27 = _AKLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Context requires out-of-process UI.", buf, 2u);
    }
  }
  if ([v13 isContextEligibleForPasscodeAuth]) {
    [v13 setPasscodeOnlyPolicy:1];
  }
  if (v23 == (id)4 || v23 == (id)1)
  {
    unsigned int v28 = [v13 _performUIOutOfProcess];
  }
  else
  {
    unsigned int v29 = [v13 _performUIOutOfProcess];
    unsigned int v28 = [v13 _performUIOutOfProcess];
    if (!v29)
    {
LABEL_42:
      v37 = _AKLogSystem();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Client is capable of displaying UI, no surrogate required...", buf, 2u);
      }

      v38 = self->_clientUIWorkQueue;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10008F614;
      v41[3] = &unk_10022A028;
      id v44 = v14;
      id v42 = v12;
      id v43 = v13;
      dispatch_async(v38, v41);

      id v17 = v44;
      goto LABEL_45;
    }
  }
  unsigned int v30 = v28;
  if ([(AKAuthenticationUILiaison *)self _isBackgroundClient:v12 eligibleForForegroundAuthenticationWithContext:v13])
  {
    v31 = _AKLogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[non-visionOS] Falling back to standard proxied foreground authentication", buf, 2u);
    }

    v32 = _AKLogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      sub_10018AAF8();
    }

    if (!v9) {
      goto LABEL_42;
    }
  }
  surrogateManager = self->_surrogateManager;
  if (!surrogateManager)
  {
    v34 = [[AKAuthenticationSurrogateManager alloc] initWithDelegate:self];
    v35 = self->_surrogateManager;
    self->_surrogateManager = v34;

    v36 = +[AKAuthenticationTrafficController sharedInstance];
    [v36 setSurrogateManager:self->_surrogateManager];

    surrogateManager = self->_surrogateManager;
  }
  if ([(AKAuthenticationSurrogateManager *)surrogateManager hasRegisteredSurrogateForContext:v13])
  {
    [(AKAuthenticationSurrogateManager *)self->_surrogateManager performUIWorkWithSurrogateContext:v13 uiWorkBlock:v14];
  }
  else
  {
    v39 = _AKLogSystem();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
    if (v30)
    {
      if (v40)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Out-of-process auth, no registered UI surrogate yet...", buf, 2u);
      }

      [(AKAuthenticationSurrogateManager *)self->_surrogateManager waitForRemoteViewServiceWithContext:v13 client:v12 uiWorkBlock:v14];
    }
    else
    {
      if (v40)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Background auth, no registered UI surrogate yet...", buf, 2u);
      }

      [(AKAuthenticationSurrogateManager *)self->_surrogateManager waitForSettingsWithContext:v13 client:v12 requireFullUICapability:v9 allowRedirectToSettings:v8 uiWorkBlock:v14];
    }
  }
LABEL_46:
}

- (BOOL)_isBackgroundClient:(id)a3 eligibleForForegroundAuthenticationWithContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MCProfileConnection sharedConnection];
  unsigned int v8 = [v7 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed];

  if (v8 == 2)
  {
    BOOL v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10018AC08();
    }
    goto LABEL_4;
  }
  if ([v6 _isForcedEligibleForForegroundAuthentication])
  {
    BOOL v10 = 1;
    goto LABEL_16;
  }
  if (![v6 _isProxyingForApp])
  {
    BOOL v10 = 0;
    goto LABEL_16;
  }
  if (([v5 isPermittedToProxy] & 1) == 0)
  {
    BOOL v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10018AC70();
    }
    goto LABEL_19;
  }
  if (([v5 isPermittedToProxyInitialAuth] & 1) == 0)
  {
    uint64_t v11 = [v6 username];
    if (!v11 || (v12 = (void *)v11, unsigned int v13 = [v6 isUsernameEditable], v12, v13))
    {
      BOOL v9 = _AKLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client %@ cannot proxy without specifying an immutable Apple ID.", (uint8_t *)&v16, 0xCu);
      }
LABEL_19:
      BOOL v10 = 0;
      goto LABEL_5;
    }
  }
  BOOL v9 = [v6 _proxiedAppBundleID];
  if (v9 && !+[AKClient isAppWithBundleIDForeground:v9])
  {
    id v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Ignoring FG proxying request because %@ is not currently foreground.", (uint8_t *)&v16, 0xCu);
    }

    goto LABEL_19;
  }
LABEL_4:
  BOOL v10 = 1;
LABEL_5:

LABEL_16:
  return v10;
}

- (id)_notificationDictionaryForClient:(id)a3 context:(id)a4 needFullUI:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [v9 username];
  unsigned int v11 = [v9 needsCredentialRecovery];
  id v12 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
  unsigned int v13 = v12;
  v77 = v10;
  if (v11)
  {
    v80 = [v12 localizedStringForKey:@"FORGOT_PASSWORD_ALERT_RESET_BUTTON" value:&stru_100233250 table:@"Localizable"];

    id v14 = @"FORGOT_PASSWORD_ALERT_MESSAGE";
    unsigned __int8 v15 = [@"FORGOT_PASSWORD_ALERT_MESSAGE" containsString:@"REBRAND"];
    if (v15)
    {
      int v16 = 0;
    }
    else
    {
      unsigned int v13 = +[AKFeatureManager sharedManager];
      if ([v13 isAABrandingEnabled])
      {
        id v14 = [@"FORGOT_PASSWORD_ALERT_MESSAGE" stringByAppendingString:@"_REBRAND"];
        int v16 = 1;
      }
      else
      {
        int v16 = 0;
      }
    }
    v32 = +[AKDevice deviceSpecificLocalizedStringWithKey:v14];
    if (v16) {

    }
    if ((v15 & 1) == 0) {
    v33 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    }
    v79 = [v33 localizedStringForKey:@"FORGOT_PASSWORD_ALERT_CANCEL_BUTTON" value:&stru_100233250 table:@"Localizable"];

    v34 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    v31 = [v34 localizedStringForKey:@"FORGOT_PASSWORD_ALERT_TITLE" value:&stru_100233250 table:@"Localizable"];

    BOOL v10 = v77;
    goto LABEL_56;
  }
  id v17 = @"Localizable";
  v79 = [v12 localizedStringForKey:@"PASSWORD_ALERT_SETTINGS_BUTTON" value:&stru_100233250 table:@"Localizable"];

  id v18 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
  v80 = [v18 localizedStringForKey:@"PASSWORD_ALERT_CANCEL_BUTTON" value:&stru_100233250 table:@"Localizable"];

  if (!v10)
  {
    id v23 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v24 = @"PASSWORD_ALERT_TITLE";
    unsigned __int8 v25 = [@"PASSWORD_ALERT_TITLE" containsString:@"REBRAND"];
    if (v25)
    {
      int v26 = 0;
    }
    else
    {
      id v17 = +[AKFeatureManager sharedManager];
      if ([(__CFString *)v17 isAABrandingEnabled])
      {
        id v24 = [@"PASSWORD_ALERT_TITLE" stringByAppendingString:@"_REBRAND"];
        int v26 = 1;
      }
      else
      {
        int v26 = 0;
      }
    }
    uint64_t v75 = [v23 localizedStringForKey:v24 value:&stru_100233250 table:@"Localizable"];
    if (v26) {

    }
    if ((v25 & 1) == 0) {
    v38 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    }
    v39 = @"PASSWORD_ALERT_MESSAGE";
    unsigned __int8 v40 = [@"PASSWORD_ALERT_MESSAGE" containsString:@"REBRAND"];
    if (v40)
    {
      int v41 = 0;
    }
    else
    {
      id v17 = +[AKFeatureManager sharedManager];
      if ([(__CFString *)v17 isAABrandingEnabled])
      {
        v39 = [@"PASSWORD_ALERT_MESSAGE" stringByAppendingString:@"_REBRAND"];
        int v41 = 1;
      }
      else
      {
        int v41 = 0;
      }
    }
    v32 = [v38 localizedStringForKey:v39 value:&stru_100233250 table:@"Localizable"];
    if (v41) {

    }
    if ((v40 & 1) == 0) {
    BOOL v10 = v77;
    }
LABEL_55:
    v31 = (void *)v75;
    goto LABEL_56;
  }
  if (!a5)
  {
    id v27 = +[AKDevice currentDevice];
    unsigned int v28 = [v27 isMultiUserMode];

    unsigned int v29 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    unsigned int v30 = v29;
    if (v28)
    {
      v31 = [v29 localizedStringForKey:@"PASSCODE_ALERT_TITLE_WITH_USERNAME" value:&stru_100233250 table:@"Localizable"];

      [v9 serviceType];
      v32 = AKSharedDevicePasscodePromptAlertMessageWithServiceType();
      goto LABEL_56;
    }
    v35 = @"PASSWORD_ALERT_TITLE_WITH_USERNAME";
    unsigned __int8 v36 = [@"PASSWORD_ALERT_TITLE_WITH_USERNAME" containsString:@"REBRAND"];
    if (v36)
    {
      int v37 = 0;
    }
    else
    {
      id v17 = +[AKFeatureManager sharedManager];
      if ([(__CFString *)v17 isAABrandingEnabled])
      {
        v35 = [@"PASSWORD_ALERT_TITLE_WITH_USERNAME" stringByAppendingString:@"_REBRAND"];
        int v37 = 1;
      }
      else
      {
        int v37 = 0;
      }
    }
    uint64_t v75 = [v30 localizedStringForKey:v35 value:&stru_100233250 table:@"Localizable"];
    if (v37) {

    }
    if ((v36 & 1) == 0) {
    v46 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    }
    id v47 = [v46 localizedStringForKey:@"PASSWORD_ALERT_MESSAGE_WITH_USERNAME" value:&stru_100233250 table:@"Localizable"];
    BOOL v10 = v77;
    v48 = +[AKUsernameFormatter formattedUsernameFromUsername:v77];
    v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v47, v48);

    goto LABEL_55;
  }
  id v19 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
  BOOL v20 = @"CONTINUE_AUTH_ALERT_TITLE";
  unsigned __int8 v21 = [@"CONTINUE_AUTH_ALERT_TITLE" containsString:@"REBRAND"];
  v73 = self;
  if (v21)
  {
    int v22 = 0;
  }
  else
  {
    id v17 = +[AKFeatureManager sharedManager];
    if ([(__CFString *)v17 isAABrandingEnabled])
    {
      BOOL v20 = [@"CONTINUE_AUTH_ALERT_TITLE" stringByAppendingString:@"_REBRAND"];
      int v22 = 1;
    }
    else
    {
      int v22 = 0;
    }
  }
  uint64_t v42 = [v19 localizedStringForKey:v20 value:&stru_100233250 table:@"Localizable"];
  if (v22) {

  }
  if ((v21 & 1) == 0) {
  id v43 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
  }
  id v44 = [v43 localizedStringForKey:@"CONTINUE_AUTH_ALERT_MESSAGE" value:&stru_100233250 table:@"Localizable"];
  BOOL v10 = v77;
  v45 = +[AKUsernameFormatter formattedUsernameFromUsername:v77];
  v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v44, v45);

  v31 = (void *)v42;
  self = v73;
LABEL_56:
  id v49 = [v9 _proxiedAppBundleID];

  v50 = _AKLogSystem();
  BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
  if (v49)
  {
    if (!v51) {
      goto LABEL_62;
    }
    v52 = [v9 _proxiedAppBundleID];
    id v53 = [v8 bundleID];
    *(_DWORD *)buf = 138543618;
    v82 = v52;
    __int16 v83 = 2114;
    v84 = v53;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Client %{public}@ requested authentication (via %{public}@).", buf, 0x16u);
  }
  else
  {
    if (!v51) {
      goto LABEL_62;
    }
    v52 = [v8 bundleID];
    *(_DWORD *)buf = 138543362;
    v82 = v52;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Client %{public}@ requested authentication.", buf, 0xCu);
  }

LABEL_62:
  [(AKAuthenticationUILiaison *)self _stringByAppendingBlameIfNecessary:v32 withContext:v9 client:v8];
  v55 = v54 = v9;

  v78 = v54;
  v56 = -[AKAuthenticationUILiaison _optionsForCreatingUserNotificationWithTitle:message:defaultButton:alternateButton:serviceType:](self, "_optionsForCreatingUserNotificationWithTitle:message:defaultButton:alternateButton:serviceType:", v31, v55, v79, v80, [v54 serviceType]);
  if (!v10) {
    goto LABEL_84;
  }
  v57 = +[AKDevice currentDevice];
  unsigned int v58 = [v57 isMultiUserMode];

  v59 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
  v60 = v59;
  id v74 = v8;
  v76 = v31;
  if (v58)
  {
    [v59 localizedStringForKey:@"PASSCODE_ALERT_TITLE_LOCKSCREEN" value:&stru_100233250 table:@"Localizable"];
    v62 = id v61 = v8;

    v63 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    v31 = [v63 localizedStringForKey:@"PASSCODE_ALERT_MESSAGE_LOCKSCREEN" value:&stru_100233250 table:@"Localizable"];
    v64 = [(AKAuthenticationUILiaison *)self _stringByAppendingBlameIfNecessary:v31 withContext:v78 client:v61];
  }
  else
  {
    v65 = @"PASSWORD_ALERT_TITLE_LOCKSCREEN";
    unsigned __int8 v66 = [@"PASSWORD_ALERT_TITLE_LOCKSCREEN" containsString:@"REBRAND"];
    if (v66)
    {
      int v67 = 0;
    }
    else
    {
      v31 = +[AKFeatureManager sharedManager];
      if ([v31 isAABrandingEnabled])
      {
        v65 = [@"PASSWORD_ALERT_TITLE_LOCKSCREEN" stringByAppendingString:@"_REBRAND"];
        int v67 = 1;
      }
      else
      {
        int v67 = 0;
      }
    }
    v62 = [v60 localizedStringForKey:v65 value:&stru_100233250 table:@"Localizable"];
    if (v67) {

    }
    if ((v66 & 1) == 0) {
    v63 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    }
    v68 = @"PASSWORD_ALERT_MESSAGE_LOCKSCREEN";
    unsigned __int8 v69 = [@"PASSWORD_ALERT_MESSAGE_LOCKSCREEN" containsString:@"REBRAND"];
    if (v69)
    {
      int v70 = 0;
    }
    else
    {
      v31 = +[AKFeatureManager sharedManager];
      if ([v31 isAABrandingEnabled])
      {
        v68 = [@"PASSWORD_ALERT_MESSAGE_LOCKSCREEN" stringByAppendingString:@"_REBRAND"];
        int v70 = 1;
      }
      else
      {
        int v70 = 0;
      }
    }
    v71 = [v63 localizedStringForKey:v68 value:&stru_100233250 table:@"Localizable"];
    v64 = [(AKAuthenticationUILiaison *)self _stringByAppendingBlameIfNecessary:v71 withContext:v78 client:v74];

    if (v70) {
    if (v69)
    }
      goto LABEL_83;
  }

LABEL_83:
  [v56 setObject:v62 forKeyedSubscript:SBUserNotificationLockScreenAlertHeaderKey];
  [v56 setObject:v64 forKeyedSubscript:SBUserNotificationLockScreenAlertMessageKey];

  id v8 = v74;
  v31 = v76;
  BOOL v10 = v77;
LABEL_84:

  return v56;
}

- (id)_optionsForCreatingUserNotificationWithTitle:(id)a3 message:(id)a4 defaultButton:(id)a5 alternateButton:(id)a6 serviceType:(int64_t)a7
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[AKAlertHandler sharedInstance];
  unsigned __int8 v15 = [v14 notificationDictionaryWithTitle:v13 message:v12 defaultButton:v11 alternateButton:v10];

  return v15;
}

- (id)_stringByAppendingBlameIfNecessary:(id)a3 withContext:(id)a4 client:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[AKDevice currentDevice];
  unsigned __int8 v11 = [v10 isInternalBuild];

  if (v11)
  {
    id v12 = [v8 _proxiedAppName];

    id v13 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v14 = v13;
    if (v12)
    {
      unsigned __int8 v15 = [v13 localizedStringForKey:@"PASSWORD_ALERT_MESSAGE_PROXY_INTERNAL_BLAME" value:&stru_100233250 table:@"Localizable"];
      int v16 = [v8 _proxiedAppName];
      id v17 = [v9 name];
      id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v16, v17);
    }
    else
    {
      unsigned __int8 v15 = [v13 localizedStringForKey:@"PASSWORD_ALERT_MESSAGE_INTERNAL_BLAME" value:&stru_100233250 table:@"Localizable"];
      int v16 = [v9 name];
      id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v16);
    }

    id v19 = [v7 stringByAppendingString:v18];
  }
  else
  {
    id v19 = v7;
  }

  return v19;
}

- (BOOL)_isFullUICapabilityRequiredFor2FA
{
  return 0;
}

- (id)uiWorkQueue
{
  return self->_clientUIWorkQueue;
}

- (void)promptForAppleIDSettingsRedirectWithContext:(id)a3 client:(id)a4 needFullUI:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, uint64_t, void))a6;
  if ([v10 shouldSkipSettingsLaunchAlert])
  {
    id v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Will not prompt user about redirect per auth context configuration.", buf, 2u);
    }

    v12[2](v12, 1, 0);
  }
  else
  {
    id v14 = +[AKDevice currentDevice];
    unsigned __int8 v15 = [v14 isBuddyFinished];

    if (v15)
    {
      uint64_t v16 = AKBugCaptureSubTypeSettingsRedirect;
      id v17 = [v11 bundleID];
      id v18 = +[AKAutoBugCapture userInfoFromContext:v10];
      +[AKAutoBugCapture triggerAutoBugCaptureWithSubType:v16 andBundleID:v17 userInfo:v18];

      id v19 = +[AKAuthenticationTrafficController sharedInstance];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100090864;
      v22[3] = &unk_10022A078;
      int v26 = v12;
      id v23 = v10;
      id v24 = self;
      id v25 = v11;
      BOOL v27 = a5;
      [v19 uplevelAuthenticationForUIWithContext:v23 client:v25 completion:v22];
    }
    else
    {
      BOOL v20 = _AKLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10018ACD8();
      }

      unsigned __int8 v21 = +[NSError ak_errorWithCode:-7014];
      ((void (**)(id, uint64_t, void *))v12)[2](v12, 0, v21);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_clientUIWorkQueue, 0);

  objc_storeStrong((id *)&self->_surrogateManager, 0);
}

@end