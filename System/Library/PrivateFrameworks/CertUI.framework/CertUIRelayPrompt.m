@interface CertUIRelayPrompt
+ (id)_actualCenter;
- (BOOL)_launchSheetApp;
- (BOOL)allowCertificateTrust;
- (BOOL)isCertificateTrustRestricted;
- (BOOL)showCertificateDetails;
- (BOOL)showContinue;
- (CPDistributedMessagingDelayedReplyContext)replyContext;
- (CertUIRelayPrompt)initWithMessageInfo:(id)a3 localizedOriginatingAppName:(id)a4 replyContext:(id)a5;
- (NSString)localizedOriginatingAppName;
- (id)_copyCancelOnlyUserNotificationInfo;
- (id)_copyUserNotificationInfo;
- (id)_hostname;
- (id)_localizedUntrustedCertAcceptNotAllowedMessage;
- (id)_localizedUntrustedCertAlertMessage;
- (id)_localizedUntrustedCertAlertTitle;
- (id)_replyDictionaryWithCertUIResponse:(int)a3;
- (id)trustDigest;
- (void)_actualMessagingCenter:(id)a3 receivedReply:(id)a4 error:(id)a5 context:(void *)a6;
- (void)_invokeCompletionWithReply:(id)a3;
- (void)_receivedCancelOnlyResponseForNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4;
- (void)_receivedResponseForNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4;
- (void)_showAlert;
- (void)_showDetails;
- (void)dealloc;
- (void)setLocalizedOriginatingAppName:(id)a3;
- (void)setReplyContext:(id)a3;
- (void)showPromptWithCompletion:(id)a3;
@end

@implementation CertUIRelayPrompt

- (CertUIRelayPrompt)initWithMessageInfo:(id)a3 localizedOriginatingAppName:(id)a4 replyContext:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CertUIRelayPrompt;
  v8 = [(CertUIRelayPrompt *)&v10 init];
  if (v8)
  {
    v8->_messageInfo = (NSDictionary *)[a3 copy];
    v8->_localizedOriginatingAppName = (NSString *)a4;
    v8->_replyContext = (CPDistributedMessagingDelayedReplyContext *)a5;
  }
  return v8;
}

- (void)dealloc
{
  id completion = self->_completion;
  if (completion) {
    _Block_release(completion);
  }
  v4.receiver = self;
  v4.super_class = (Class)CertUIRelayPrompt;
  [(CertUIRelayPrompt *)&v4 dealloc];
}

+ (id)_actualCenter
{
  return +[CPDistributedMessagingCenter centerNamed:kCertUIMessagingCenterActualName];
}

- (id)_replyDictionaryWithCertUIResponse:(int)a3
{
  v3 = +[NSNumber numberWithInt:*(void *)&a3];
  uint64_t v4 = kCertUITrustResponseKey;

  return +[NSDictionary dictionaryWithObject:v3 forKey:v4];
}

- (void)_invokeCompletionWithReply:(id)a3
{
  id completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a3);
    _Block_release(self->_completion);
    self->_id completion = 0;
  }
}

- (BOOL)_launchSheetApp
{
  int v2 = SBSLaunchApplicationWithIdentifier();
  if (v2)
  {
    v3 = _CertUILogObjects[1];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed launching app %d", (uint8_t *)v5, 8u);
    }
  }
  return v2 == 0;
}

- (void)_actualMessagingCenter:(id)a3 receivedReply:(id)a4 error:(id)a5 context:(void *)a6
{
}

- (void)_showDetails
{
  if ([(CertUIRelayPrompt *)self _launchSheetApp])
  {
    id v3 = +[CertUIRelayPrompt _actualCenter];
    uint64_t v4 = kCertUIPresentTrustInfoMessage;
    objc_msgSend(v3, "sendMessageAndReceiveReplyName:userInfo:toTarget:selector:context:", v4);
  }
  else
  {
    [(CertUIRelayPrompt *)self _invokeCompletionWithReply:0];
  }
}

- (void)_receivedResponseForNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  if ((a4 & 3) == 2)
  {
    [(CertUIRelayPrompt *)self _showDetails];
  }
  else
  {
    if ((a4 & 3) == 1) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = [(CertUIRelayPrompt *)self _replyDictionaryWithCertUIResponse:v5];
    [(CertUIRelayPrompt *)self _invokeCompletionWithReply:v6];
  }
}

- (void)_receivedCancelOnlyResponseForNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  id v5 = -[CertUIRelayPrompt _replyDictionaryWithCertUIResponse:](self, "_replyDictionaryWithCertUIResponse:", 0, a4);

  [(CertUIRelayPrompt *)self _invokeCompletionWithReply:v5];
}

- (id)_hostname
{
  return [(NSDictionary *)self->_messageInfo objectForKey:kCertUITrustHostnameKey];
}

- (id)trustDigest
{
  return [(NSDictionary *)self->_messageInfo objectForKey:kCertUITrustDigestKey];
}

- (id)_localizedUntrustedCertAlertTitle
{
  int v2 = +[NSBundle bundleWithIdentifier:@"com.apple.CertUI"];

  return [(NSBundle *)v2 localizedStringForKey:@"UNTRUSTED_CERT_TITLE" value:&stru_100008390 table:0];
}

- (id)_localizedUntrustedCertAlertMessage
{
  id v3 = [+[NSBundle bundleWithIdentifier:@"com.apple.CertUI"] localizedStringForKey:@"UNTRUSTED_CERT_MESSAGE" value:&stru_100008390 table:0];
  uint64_t v4 = [+[NSBundle bundleWithIdentifier:@"com.apple.CertUI"] localizedStringForKey:@"UNTRUSTED_CERT_MESSAGE_NO_APP_NAME" value:&stru_100008390 table:0];
  if (v3 && [(CertUIRelayPrompt *)self localizedOriginatingAppName]) {
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, [(CertUIRelayPrompt *)self _hostname], [(CertUIRelayPrompt *)self localizedOriginatingAppName]);
  }
  if (!v4) {
    return 0;
  }
  id v6 = _CertUILogObjects[1];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Untrusted certificate alert is being shown but no localized app name has been retrieved from the audit token.", buf, 2u);
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, [(CertUIRelayPrompt *)self _hostname], v7);
}

- (id)_localizedUntrustedCertAcceptNotAllowedMessage
{
  id v3 = [+[NSBundle bundleWithIdentifier:@"com.apple.CertUI"] localizedStringForKey:@"UNTRUSTED_CERT_MESSAGE_NO_ACCEPT" value:&stru_100008390 table:0];
  uint64_t v4 = [+[NSBundle bundleWithIdentifier:@"com.apple.CertUI"] localizedStringForKey:@"UNTRUSTED_CERT_MESSAGE_NO_ACCEPT_NO_APP_NAME" value:&stru_100008390 table:0];
  if (v3 && [(CertUIRelayPrompt *)self localizedOriginatingAppName]) {
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, [(CertUIRelayPrompt *)self _hostname], [(CertUIRelayPrompt *)self localizedOriginatingAppName]);
  }
  if (!v4) {
    return 0;
  }
  id v6 = _CertUILogObjects[1];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Untrusted certificate alert is being shown but no localized app name has been retrieved from the audit token.", buf, 2u);
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, [(CertUIRelayPrompt *)self _hostname], v7);
}

- (BOOL)isCertificateTrustRestricted
{
  id v2 = +[MCProfileConnection sharedConnection];
  return [v2 effectiveBoolValueForSetting:MCFeatureUntrustedTLSPromptAllowed] == 2;
}

- (BOOL)allowCertificateTrust
{
  id v3 = [(NSDictionary *)self->_messageInfo objectForKey:kCertUITrustAllowCertificateTrustKey];
  if ([(CertUIRelayPrompt *)self isCertificateTrustRestricted]) {
    return 0;
  }
  if (!v3) {
    return 1;
  }

  return [v3 BOOLValue];
}

- (BOOL)showContinue
{
  unsigned int v3 = [(CertUIRelayPrompt *)self allowCertificateTrust];
  if (v3)
  {
    id v4 = [(NSDictionary *)self->_messageInfo objectForKey:kCertUITrustShowContinueKey];
    if (v4)
    {
      LOBYTE(v3) = [v4 BOOLValue];
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)showCertificateDetails
{
  id v2 = [(NSDictionary *)self->_messageInfo objectForKey:kCertUITrustShowCertificateDetailsKey];
  if (!v2) {
    return 1;
  }

  return [v2 BOOLValue];
}

- (id)_copyUserNotificationInfo
{
  id v3 = objc_alloc((Class)NSMutableDictionary);
  id v4 = objc_msgSend(v3, "initWithObjectsAndKeys:", SBUserNotificationAllowInSetupKey, &__kCFBooleanTrue, SBUserNotificationDismissOnLock, &__kCFBooleanTrue, SBUserNotificationDontDismissOnUnlock, &__kCFBooleanTrue, SBUserNotificationPendWhileKeyBagLockedKey, 0);
  id v5 = [(CertUIRelayPrompt *)self _localizedUntrustedCertAlertTitle];
  if (v5) {
    [v4 setObject:v5 forKey:kCFUserNotificationAlertHeaderKey];
  }
  id v6 = [+[NSBundle bundleWithIdentifier:@"com.apple.CertUI"] localizedStringForKey:@"CANCEL" value:&stru_100008390 table:0];
  if (v6) {
    [v4 setObject:v6 forKey:kCFUserNotificationDefaultButtonTitleKey];
  }
  uint64_t v7 = [+[NSBundle bundleWithIdentifier:@"com.apple.CertUI"] localizedStringForKey:@"CONTINUE" value:&stru_100008390 table:0];
  if ([(CertUIRelayPrompt *)self showContinue] && v7) {
    [v4 setObject:v7 forKey:kCFUserNotificationAlternateButtonTitleKey];
  }
  v8 = [+[NSBundle bundleWithIdentifier:@"com.apple.CertUI"] localizedStringForKey:@"DETAILS" value:&stru_100008390 table:0];
  if ([(CertUIRelayPrompt *)self showCertificateDetails] && v8) {
    [v4 setObject:v8 forKey:kCFUserNotificationOtherButtonTitleKey];
  }
  if ([(CertUIRelayPrompt *)self allowCertificateTrust]) {
    id v9 = [(CertUIRelayPrompt *)self _localizedUntrustedCertAlertMessage];
  }
  else {
    id v9 = [(CertUIRelayPrompt *)self _localizedUntrustedCertAcceptNotAllowedMessage];
  }
  if (v9) {
    [v4 setObject:v9 forKey:kCFUserNotificationAlertMessageKey];
  }
  return v4;
}

- (id)_copyCancelOnlyUserNotificationInfo
{
  id v3 = objc_alloc((Class)NSMutableDictionary);
  id v4 = objc_msgSend(v3, "initWithObjectsAndKeys:", SBUserNotificationAllowInSetupKey, &__kCFBooleanTrue, SBUserNotificationDismissOnLock, &__kCFBooleanTrue, SBUserNotificationDontDismissOnUnlock, &__kCFBooleanTrue, SBUserNotificationPendWhileKeyBagLockedKey, 0);
  id v5 = [(CertUIRelayPrompt *)self _localizedUntrustedCertAlertTitle];
  if (v5) {
    [v4 setObject:v5 forKey:kCFUserNotificationAlertHeaderKey];
  }
  id v6 = [(CertUIRelayPrompt *)self _localizedUntrustedCertAcceptNotAllowedMessage];
  if (v6) {
    [v4 setObject:v6 forKey:kCFUserNotificationAlertMessageKey];
  }
  return v4;
}

- (void)_showAlert
{
  if ([(CertUIRelayPrompt *)self isCertificateTrustRestricted])
  {
    id v3 = [(CertUIRelayPrompt *)self _copyCancelOnlyUserNotificationInfo];
    id v4 = &selRef__receivedCancelOnlyResponseForNotification_responseFlags_;
  }
  else
  {
    id v3 = [(CertUIRelayPrompt *)self _copyUserNotificationInfo];
    id v4 = &selRef__receivedResponseForNotification_responseFlags_;
  }
  id v5 = v3;
  sub_10000629C((const __CFDictionary *)v3, self, (uint64_t)*v4);
}

- (void)showPromptWithCompletion:(id)a3
{
  self->_id completion = _Block_copy(a3);

  [(CertUIRelayPrompt *)self _showAlert];
}

- (CPDistributedMessagingDelayedReplyContext)replyContext
{
  return self->_replyContext;
}

- (void)setReplyContext:(id)a3
{
}

- (NSString)localizedOriginatingAppName
{
  return self->_localizedOriginatingAppName;
}

- (void)setLocalizedOriginatingAppName:(id)a3
{
}

@end