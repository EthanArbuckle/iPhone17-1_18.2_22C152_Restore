@interface AMSDaemonConnectionInterface
+ (id)_accountCachedServerDataInterface;
+ (id)_accountSignOutInterface;
+ (id)_cookieServiceInterface;
+ (id)_deviceMessengerClientInterface;
+ (id)_deviceMessengerServiceInterface;
+ (id)_dismissQRDialogServiceInterface;
+ (id)_fraudReportServiceInterface;
+ (id)_keychainServiceInterface;
+ (id)_paymentConfirmationInterface;
+ (id)_paymentValidationServiceInterface;
+ (id)_purchaseServiceInterface;
+ (id)_securityClientInterface;
+ (id)_securityServiceInterface;
+ (id)interface;
+ (void)_configureURLPresentationDelegateClasses:(id)a3;
+ (void)_setUpSecurityInterfaceApplePayClassic:(id)a3;
+ (void)_setUpSecurityInterfaceBiometricSelectors:(id)a3;
+ (void)_setUpSecurityInterfaceDeviceIdentitySelectors:(id)a3;
+ (void)_setUpSecurityInterfaceHandleResponseSelector:(id)a3;
+ (void)_setUpSecurityInterfaceSignedHeadersSelector:(id)a3;
+ (void)_setUpSecurityInterfaceSilentEnrollmentSelector:(id)a3;
@end

@implementation AMSDaemonConnectionInterface

+ (id)_accountCachedServerDataInterface
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD51068];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v11[0] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_getDataForAccountIDs_reply_ argumentIndex:0 ofReply:1];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v8 = objc_msgSend(v6, "setWithArray:", v7, v10[0]);
  [v2 setClasses:v8 forSelector:sel_getDataForAccountIDs_reply_ argumentIndex:0 ofReply:0];

  [v2 setClass:objc_opt_class() forSelector:sel_setAutoPlayState_forAccountID_reply_ argumentIndex:1 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_setAutoPlayState_forAccountID_reply_ argumentIndex:1 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_setPersonalizationState_forAccountID_reply_ argumentIndex:1 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_setPersonalizationState_forAccountID_reply_ argumentIndex:1 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_queueMetricsEventNotingExpiry_appID_reply_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_queueMetricsEventNotingExpiry_appID_reply_ argumentIndex:1 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_queueMetricsEventNotingExpiry_appID_reply_ argumentIndex:1 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_manualSyncForAccountID_reply_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_manualSyncForAccountID_reply_ argumentIndex:1 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_accountAuthSyncForAccountID_reply_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_accountAuthSyncForAccountID_reply_ argumentIndex:1 ofReply:1];
  return v2;
}

void __41__AMSDaemonConnectionInterface_interface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD51128];
  v3 = (void *)_MergedGlobals_94;
  _MergedGlobals_94 = v2;

  v4 = (void *)_MergedGlobals_94;
  v5 = [*(id *)(a1 + 32) _accountCachedServerDataInterface];
  [v4 setInterface:v5 forSelector:sel_getAccountCachedServerDataServiceProxyWithReplyHandler_ argumentIndex:0 ofReply:1];

  v6 = (void *)_MergedGlobals_94;
  v7 = [*(id *)(a1 + 32) _accountSignOutInterface];
  [v6 setInterface:v7 forSelector:sel_getAccountSignOutServiceProxyWithReplyHandler_ argumentIndex:0 ofReply:1];

  v8 = (void *)_MergedGlobals_94;
  v9 = [*(id *)(a1 + 32) _cookieServiceInterface];
  [v8 setInterface:v9 forSelector:sel_getCookieServiceProxyWithReplyHandler_ argumentIndex:0 ofReply:1];

  v10 = (void *)_MergedGlobals_94;
  v11 = [*(id *)(a1 + 32) _deviceMessengerClientInterface];
  [v10 setInterface:v11 forSelector:sel_getDeviceMessengerServiceProxyWithDelegate_replyHandler_ argumentIndex:0 ofReply:0];

  v12 = (void *)_MergedGlobals_94;
  v13 = [*(id *)(a1 + 32) _deviceMessengerServiceInterface];
  [v12 setInterface:v13 forSelector:sel_getDeviceMessengerServiceProxyWithDelegate_replyHandler_ argumentIndex:0 ofReply:1];

  v14 = (void *)_MergedGlobals_94;
  v15 = [*(id *)(a1 + 32) _dismissQRDialogServiceInterface];
  [v14 setInterface:v15 forSelector:sel_getDismissQRDialogServiceProxyWithReplyHandler_ argumentIndex:0 ofReply:1];

  v16 = (void *)_MergedGlobals_94;
  v17 = [*(id *)(a1 + 32) _fraudReportServiceInterface];
  [v16 setInterface:v17 forSelector:sel_getFraudReportServiceProxyWithReplyHandler_ argumentIndex:0 ofReply:1];

  v18 = (void *)_MergedGlobals_94;
  v19 = [*(id *)(a1 + 32) _keychainServiceInterface];
  [v18 setInterface:v19 forSelector:sel_getKeychainServiceProxyWithReplyHandler_ argumentIndex:0 ofReply:1];

  v20 = (void *)_MergedGlobals_94;
  v21 = [*(id *)(a1 + 32) _paymentConfirmationInterface];
  [v20 setInterface:v21 forSelector:sel_getPaymentConfirmationServiceProxyWithReplyHandler_ argumentIndex:0 ofReply:1];

  v22 = (void *)_MergedGlobals_94;
  v23 = [*(id *)(a1 + 32) _paymentValidationServiceInterface];
  [v22 setInterface:v23 forSelector:sel_getPaymentValidationServiceProxyWithReplyHandler_ argumentIndex:0 ofReply:1];

  v24 = (void *)_MergedGlobals_94;
  v25 = [*(id *)(a1 + 32) _purchaseServiceInterface];
  [v24 setInterface:v25 forSelector:sel_getPurchaseServiceProxyWithReplyHandler_ argumentIndex:0 ofReply:1];

  v26 = (void *)_MergedGlobals_94;
  v27 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD51188];
  [v26 setInterface:v27 forSelector:sel_getPushNotificationServiceProxyWithReplyHandler_ argumentIndex:0 ofReply:1];

  v28 = (void *)_MergedGlobals_94;
  v29 = [*(id *)(a1 + 32) _securityClientInterface];
  [v28 setInterface:v29 forSelector:sel_getSecurityServiceProxyWithDelegate_replyHandler_ argumentIndex:0 ofReply:0];

  v30 = (void *)_MergedGlobals_94;
  id v31 = [*(id *)(a1 + 32) _securityServiceInterface];
  [v30 setInterface:v31 forSelector:sel_getSecurityServiceProxyWithDelegate_replyHandler_ argumentIndex:0 ofReply:1];
}

+ (id)_securityServiceInterface
{
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD51548];
  [v3 setClass:objc_opt_class() forSelector:sel_performBiometricTokenUpdateWithAccount_clientInfo_additionalDialogMetrics_shouldGenerateKeysOnly_shouldRequestConfirmation_userInitiated_completion_ argumentIndex:0 ofReply:0];
  [v3 setClass:objc_opt_class() forSelector:sel_performBiometricTokenUpdateWithAccount_clientInfo_additionalDialogMetrics_shouldGenerateKeysOnly_shouldRequestConfirmation_userInitiated_completion_ argumentIndex:1 ofReply:0];
  v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_PLISTClasses");
  [v3 setClasses:v4 forSelector:sel_performBiometricTokenUpdateWithAccount_clientInfo_additionalDialogMetrics_shouldGenerateKeysOnly_shouldRequestConfirmation_userInitiated_completion_ argumentIndex:2 ofReply:0];

  [v3 setClass:objc_opt_class() forSelector:sel_performBiometricTokenUpdateWithAccount_clientInfo_additionalDialogMetrics_shouldGenerateKeysOnly_shouldRequestConfirmation_userInitiated_completion_ argumentIndex:1 ofReply:1];
  [v3 setClass:objc_opt_class() forSelector:sel_performDevicePasscodeVerificationWithCompletion_ argumentIndex:1 ofReply:1];
  [v3 setClass:objc_opt_class() forSelector:sel_signChallengeForRequest_completion_ argumentIndex:0 ofReply:0];
  [v3 setClass:objc_opt_class() forSelector:sel_signChallengeForRequest_completion_ argumentIndex:0 ofReply:1];
  [a1 _setUpSecurityInterfaceApplePayClassic:v3];
  [a1 _setUpSecurityInterfaceBiometricSelectors:v3];
  [a1 _setUpSecurityInterfaceDeviceIdentitySelectors:v3];
  [a1 _setUpSecurityInterfaceHandleResponseSelector:v3];
  [a1 _setUpSecurityInterfaceSignedHeadersSelector:v3];
  [a1 _setUpSecurityInterfaceSilentEnrollmentSelector:v3];
  return v3;
}

+ (void)_setUpSecurityInterfaceSilentEnrollmentSelector:(id)a3
{
  id v3 = a3;
  [v3 setClass:objc_opt_class() forSelector:sel_performSilentEnrollmentWithRequest_logKey_completion_ argumentIndex:0 ofReply:0];
  [v3 setClass:objc_opt_class() forSelector:sel_performSilentEnrollmentWithRequest_logKey_completion_ argumentIndex:1 ofReply:0];
  [v3 setClass:objc_opt_class() forSelector:sel_performSilentEnrollmentWithRequest_logKey_completion_ argumentIndex:0 ofReply:1];
  [v3 setClass:objc_opt_class() forSelector:sel_performSilentEnrollmentWithRequest_logKey_completion_ argumentIndex:1 ofReply:1];
}

+ (void)_setUpSecurityInterfaceSignedHeadersSelector:(id)a3
{
  id v4 = a3;
  [v4 setClass:objc_opt_class() forSelector:sel_signedHeadersForRequest_buyParams_completion_ argumentIndex:0 ofReply:0];
  [v4 setClass:objc_opt_class() forSelector:sel_signedHeadersForRequest_buyParams_completion_ argumentIndex:1 ofReply:0];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_PLISTClasses");
  [v4 setClasses:v3 forSelector:sel_signedHeadersForRequest_buyParams_completion_ argumentIndex:0 ofReply:1];

  [v4 setClass:objc_opt_class() forSelector:sel_signedHeadersForRequest_buyParams_completion_ argumentIndex:1 ofReply:1];
}

+ (void)_setUpSecurityInterfaceHandleResponseSelector:(id)a3
{
  id v3 = a3;
  [v3 setClass:objc_opt_class() forSelector:sel_handleResponse_completion_ argumentIndex:0 ofReply:0];
  [v3 setClass:objc_opt_class() forSelector:sel_handleResponse_completion_ argumentIndex:0 ofReply:1];
}

+ (void)_setUpSecurityInterfaceDeviceIdentitySelectors:(id)a3
{
  id v6 = a3;
  [v6 setClass:objc_opt_class() forSelector:sel_performClientCertChainRequestWithOptions_completion_ argumentIndex:0 ofReply:0];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v6 setClasses:v5 forSelector:sel_performClientCertChainRequestWithOptions_completion_ argumentIndex:0 ofReply:1];

  [v6 setClass:objc_opt_class() forSelector:sel_performClientCertChainRequestWithOptions_completion_ argumentIndex:1 ofReply:1];
}

+ (void)_setUpSecurityInterfaceBiometricSelectors:(id)a3
{
  id v3 = a3;
  [v3 setClass:objc_opt_class() forSelector:sel_deleteAllKeysWithCompletion_ argumentIndex:1 ofReply:1];
  [v3 setClass:objc_opt_class() forSelector:sel_isActionSupportedForType_account_options_completion_ argumentIndex:1 ofReply:0];
  [v3 setClass:objc_opt_class() forSelector:sel_isActionSupportedForType_account_options_completion_ argumentIndex:2 ofReply:0];
  [v3 setClass:objc_opt_class() forSelector:sel_isActionSupportedForType_account_options_completion_ argumentIndex:1 ofReply:1];
  [v3 setClass:objc_opt_class() forSelector:sel_isBiometricsAvailableForAccount_completion_ argumentIndex:0 ofReply:0];
  [v3 setClass:objc_opt_class() forSelector:sel_isBiometricsAvailableForAccount_completion_ argumentIndex:1 ofReply:1];
  [v3 setClass:objc_opt_class() forSelector:sel_isIdentityMapValidWithCompletion_ argumentIndex:1 ofReply:1];
  [v3 setClass:objc_opt_class() forSelector:sel_saveIdentityMapWithCompletion_ argumentIndex:0 ofReply:1];
}

+ (void)_setUpSecurityInterfaceApplePayClassic:(id)a3
{
  id v9 = a3;
  [v9 setClass:objc_opt_class() forSelector:sel_shouldAttemptApplePayWithCountryCode_paymentNetworks_completion_ argumentIndex:0 ofReply:0];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v9 setClasses:v5 forSelector:sel_shouldAttemptApplePayWithCountryCode_paymentNetworks_completion_ argumentIndex:1 ofReply:0];

  [v9 setClass:objc_opt_class() forSelector:sel_shouldAttemptApplePayWithCountryCode_paymentNetworks_completion_ argumentIndex:1 ofReply:1];
  [v9 setClass:objc_opt_class() forSelector:sel_shouldAttemptApplePayWithAccount_options_countryCode_paymentNetworks_completion_ argumentIndex:0 ofReply:0];
  [v9 setClass:objc_opt_class() forSelector:sel_shouldAttemptApplePayWithAccount_options_countryCode_paymentNetworks_completion_ argumentIndex:1 ofReply:0];
  [v9 setClass:objc_opt_class() forSelector:sel_shouldAttemptApplePayWithAccount_options_countryCode_paymentNetworks_completion_ argumentIndex:2 ofReply:0];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v9 setClasses:v8 forSelector:sel_shouldAttemptApplePayWithAccount_options_countryCode_paymentNetworks_completion_ argumentIndex:3 ofReply:0];

  [v9 setClass:objc_opt_class() forSelector:sel_shouldAttemptApplePayWithAccount_options_countryCode_paymentNetworks_completion_ argumentIndex:1 ofReply:1];
  [v9 setClass:objc_opt_class() forSelector:sel_paymentServicesMerchantURLWithCompletion_ argumentIndex:0 ofReply:1];
  [v9 setClass:objc_opt_class() forSelector:sel_paymentServicesMerchantURLWithCompletion_ argumentIndex:1 ofReply:1];
}

+ (id)_securityClientInterface
{
  id v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD514E8];
  [a1 _configureURLPresentationDelegateClasses:v3];
  return v3;
}

+ (id)_purchaseServiceInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD51488];
  [v2 setClass:objc_opt_class() forSelector:sel_cachedFDSForPurchaseIdentifier_logKey_completion_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_cachedFDSForPurchaseIdentifier_logKey_completion_ argumentIndex:1 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_cachedFDSForPurchaseIdentifier_logKey_completion_ argumentIndex:0 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_cachedFDSForPurchaseIdentifier_logKey_completion_ argumentIndex:1 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_cacheFDS_forPurchaseIdentifier_logKey_completion_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_cacheFDS_forPurchaseIdentifier_logKey_completion_ argumentIndex:1 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_cacheFDS_forPurchaseIdentifier_logKey_completion_ argumentIndex:2 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_cacheFDS_forPurchaseIdentifier_logKey_completion_ argumentIndex:0 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_generateFDSWithRequest_completion_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_generateFDSWithRequest_completion_ argumentIndex:0 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_generateFDSWithRequest_completion_ argumentIndex:1 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_partialFDSAssessmentForRequest_completion_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_partialFDSAssessmentForRequest_completion_ argumentIndex:0 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_partialFDSAssessmentForRequest_completion_ argumentIndex:1 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_createODISessionWithSessionIdentifier_accountType_bundleIdentifier_completion_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_createODISessionWithSessionIdentifier_accountType_bundleIdentifier_completion_ argumentIndex:2 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_createODISessionWithSessionIdentifier_accountType_bundleIdentifier_completion_ argumentIndex:0 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_createODISessionWithSessionIdentifier_accountType_bundleIdentifier_completion_ argumentIndex:1 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_getODIAssessmentForSessionIdentifier_clearCache_completion_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_getODIAssessmentForSessionIdentifier_clearCache_completion_ argumentIndex:0 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_getODIAssessmentForSessionIdentifier_clearCache_completion_ argumentIndex:1 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_provideFeedbackOnPayloadOutcome_sessionIdentifier_clearCache_completion_ argumentIndex:1 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_provideFeedbackOnPayloadOutcome_sessionIdentifier_clearCache_completion_ argumentIndex:0 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_updateODIWithAttributes_forSessionIdentifier_completion_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_updateODIWithAttributes_forSessionIdentifier_completion_ argumentIndex:1 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_updateODIWithAttributes_forSessionIdentifier_completion_ argumentIndex:0 ofReply:1];
  return v2;
}

+ (id)_paymentValidationServiceInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD51428];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_paymentHardwareStatusHeaderWithCompletion_ argumentIndex:0 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_paymentHardwareStatusHeaderWithCompletion_ argumentIndex:1 ofReply:1];

  return v2;
}

+ (id)_paymentConfirmationInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD513C8];
}

+ (id)_keychainServiceInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD51368];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  [v2 setClass:objc_opt_class() forSelector:sel_getPublicKeyHeaderWithAccount_options_signatureResult_completion_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_getPublicKeyHeaderWithAccount_options_signatureResult_completion_ argumentIndex:1 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_getPublicKeyHeaderWithAccount_options_signatureResult_completion_ argumentIndex:2 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_getPublicKeyHeaderWithAccount_options_signatureResult_completion_ argumentIndex:0 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_getPublicKeyHeaderWithAccount_options_signatureResult_completion_ argumentIndex:1 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_testKeychainWithCompletion_ argumentIndex:0 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_testKeychainWithCompletion_ argumentIndex:1 ofReply:1];

  return v2;
}

+ (id)_fraudReportServiceInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD51308];
  [v2 setClass:objc_opt_class() forSelector:sel_performFraudReportRefreshWithOptions_completion_ argumentIndex:0 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_performFraudReportRefreshWithOptions_completion_ argumentIndex:1 ofReply:1];
  return v2;
}

+ (id)_dismissQRDialogServiceInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD512A8];
  [v2 setClass:objc_opt_class() forSelector:sel_observeQRDialogDismissalNotificationForIdentifier_completion_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_removeQRDialogDismissalObserverForIdentifier_completion_ argumentIndex:0 ofReply:0];
  return v2;
}

+ (id)_deviceMessengerServiceInterface
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD51248];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  uint64_t v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_getMessagesWithPurpose_completion_ argumentIndex:0 ofReply:1];

  [v2 setClass:objc_opt_class() forSelector:sel_getMessagesWithPurpose_completion_ argumentIndex:1 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_sendMessage_completion_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_sendMessage_completion_ argumentIndex:1 ofReply:1];
  return v2;
}

+ (id)_deviceMessengerClientInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD185D8];
  [v2 setClass:objc_opt_class() forSelector:sel_deviceMessengerDidClearMessage_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_deviceMessengerDidReceiveReply_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_deviceMessengerDidReceiveMessage_ argumentIndex:0 ofReply:0];
  return v2;
}

+ (id)_cookieServiceInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD117D0];
  [v2 setClass:objc_opt_class() forSelector:sel_clearDanglingCookieDatabasesWithCompletion_ argumentIndex:1 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_getCookieDatabasePathForAccount_withCompletion_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_getCookieDatabasePathForAccount_withCompletion_ argumentIndex:0 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_getCookieDatabasePathForAccount_withCompletion_ argumentIndex:1 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_getCookiePropertiesForAccount_withCompletion_ argumentIndex:0 ofReply:0];
  id v3 = objc_msgSend(MEMORY[0x1E4F18D28], "ams_propertyXPCClasses");
  [v2 setClasses:v3 forSelector:sel_getCookiePropertiesForAccount_withCompletion_ argumentIndex:0 ofReply:1];

  [v2 setClass:objc_opt_class() forSelector:sel_getCookiePropertiesForAccount_withCompletion_ argumentIndex:1 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_getCookiePropertiesForAccount_cookieDatabaseOnly_withCompletion_ argumentIndex:0 ofReply:0];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F18D28], "ams_propertyXPCClasses");
  [v2 setClasses:v4 forSelector:sel_getCookiePropertiesForAccount_cookieDatabaseOnly_withCompletion_ argumentIndex:0 ofReply:1];

  [v2 setClass:objc_opt_class() forSelector:sel_getCookiePropertiesForAccount_cookieDatabaseOnly_withCompletion_ argumentIndex:1 ofReply:1];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F18D28], "ams_propertyXPCClasses");
  [v2 setClasses:v5 forSelector:sel_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion_ argumentIndex:0 ofReply:0];

  id v6 = objc_msgSend(MEMORY[0x1E4F18D28], "ams_propertyXPCClasses");
  [v2 setClasses:v6 forSelector:sel_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion_ argumentIndex:1 ofReply:0];

  [v2 setClass:objc_opt_class() forSelector:sel_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion_ argumentIndex:2 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion_ argumentIndex:1 ofReply:1];
  return v2;
}

+ (void)_configureURLPresentationDelegateClasses:(id)a3
{
  id v3 = a3;
  [v3 setClass:objc_opt_class() forSelector:sel_handleAuthenticateRequest_completion_ argumentIndex:0 ofReply:0];
  [v3 setClass:objc_opt_class() forSelector:sel_handleAuthenticateRequest_completion_ argumentIndex:0 ofReply:1];
  [v3 setClass:objc_opt_class() forSelector:sel_handleAuthenticateRequest_completion_ argumentIndex:1 ofReply:1];
  [v3 setClass:objc_opt_class() forSelector:sel_handleDialogRequest_completion_ argumentIndex:0 ofReply:0];
  [v3 setClass:objc_opt_class() forSelector:sel_handleDialogRequest_completion_ argumentIndex:0 ofReply:1];
  [v3 setClass:objc_opt_class() forSelector:sel_handleDialogRequest_completion_ argumentIndex:1 ofReply:1];
}

+ (id)_accountSignOutInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD511E8];
  [v2 setClass:objc_opt_class() forSelector:sel_performAccountSignOutTasksForAccountWithID_ argumentIndex:0 ofReply:0];
  return v2;
}

+ (id)interface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__AMSDaemonConnectionInterface_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB38D768 != -1) {
    dispatch_once(&qword_1EB38D768, block);
  }
  uint64_t v2 = (void *)_MergedGlobals_94;
  return v2;
}

@end