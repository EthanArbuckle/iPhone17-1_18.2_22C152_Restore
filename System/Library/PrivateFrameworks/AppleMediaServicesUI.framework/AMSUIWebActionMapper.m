@interface AMSUIWebActionMapper
+ (id)actionFromJSObject:(id)a3 context:(id)a4;
@end

@implementation AMSUIWebActionMapper

+ (id)actionFromJSObject:(id)a3 context:(id)a4
{
  v14[54] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (+[AMSUIActionRunner canHandle:v5 context:0])
  {
    v7 = [[AMSUIWebActionRunnerAction alloc] initWithJSObject:v5 context:v6];
  }
  else
  {
    v8 = [v5 objectForKeyedSubscript:@"actionClass"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    v13[0] = @"AMSAccountAction";
    v14[0] = objc_opt_class();
    v13[1] = @"AMSAcknowledgePrivacyAction";
    v14[1] = objc_opt_class();
    v13[2] = @"AMSApplicationLookupAction";
    v14[2] = objc_opt_class();
    v13[3] = @"AMSAppOverlayAction";
    v14[3] = objc_opt_class();
    v13[4] = @"AMSAuthenticateAction";
    v14[4] = objc_opt_class();
    v13[5] = @"AMSAuthorizeApplePayEnrollmentAction";
    v14[5] = objc_opt_class();
    v13[6] = @"AMSBagAction";
    v14[6] = objc_opt_class();
    v13[7] = @"AMSBusinessChatAction";
    v14[7] = objc_opt_class();
    v13[8] = @"AMSBuyAction";
    v14[8] = objc_opt_class();
    v13[9] = @"AMSCallbackAction";
    v14[9] = objc_opt_class();
    v13[10] = @"AMSCampaignAttributionAction";
    v14[10] = objc_opt_class();
    v13[11] = @"AMSCheckDownloadQueueAction";
    v14[11] = objc_opt_class();
    v13[12] = @"AMSDelegateAction";
    v14[12] = objc_opt_class();
    v13[13] = @"AMSDialogAction";
    v14[13] = objc_opt_class();
    v13[14] = @"AMSEngagementAction";
    v14[14] = objc_opt_class();
    v13[15] = @"AMSFamilyAction";
    v14[15] = objc_opt_class();
    v13[16] = @"AMSFetchAttestationVersionAction";
    v14[16] = objc_opt_class();
    v13[17] = @"AMSFetchCardDataAction";
    v14[17] = objc_opt_class();
    v13[18] = @"AMSFetchCardMetadataAction";
    v14[18] = objc_opt_class();
    v13[19] = @"AMSFetchMetricsIdentifierAction";
    v14[19] = objc_opt_class();
    v13[20] = @"AMSFetchTelephonyAction";
    v14[20] = objc_opt_class();
    v13[21] = @"AMSFetchTreatmentAreasAction";
    v14[21] = objc_opt_class();
    v13[22] = @"AMSFetchTreatmentOverridesAction";
    v14[22] = objc_opt_class();
    v13[23] = @"AMSFetchTreatmentsAction";
    v14[23] = objc_opt_class();
    v13[24] = @"AMSFlowAction";
    v14[24] = objc_opt_class();
    v13[25] = @"AMSLoadPluginAction";
    v14[25] = objc_opt_class();
    v13[26] = @"AMSLocalApproveAction";
    v14[26] = objc_opt_class();
    v13[27] = @"AMSLogAction";
    v14[27] = objc_opt_class();
    v13[28] = @"AMSMarketingItemAction";
    v14[28] = objc_opt_class();
    v13[29] = @"AMSMediaAction";
    v14[29] = objc_opt_class();
    v13[30] = @"AMSMediaQueryAction";
    v14[30] = objc_opt_class();
    v13[31] = @"AMSMetricsAction";
    v14[31] = objc_opt_class();
    v13[32] = @"AMSNetworkAction";
    v14[32] = objc_opt_class();
    v13[33] = @"AMSODIAssessmentAction";
    v14[33] = objc_opt_class();
    v13[34] = @"AMSODIAssessmentFeedbackAction";
    v14[34] = objc_opt_class();
    v13[35] = @"AMSOpenApplicationAction";
    v14[35] = objc_opt_class();
    v13[36] = @"AMSOpenFamilyCircleAction";
    v14[36] = objc_opt_class();
    v13[37] = @"AMSOpenSafariAction";
    v14[37] = objc_opt_class();
    v13[38] = @"AMSOpenURLAction";
    v14[38] = objc_opt_class();
    v13[39] = @"AMSOTPAction";
    v14[39] = objc_opt_class();
    v13[40] = @"AMSPaymentSetupAction";
    v14[40] = objc_opt_class();
    v13[41] = @"AMSPluginAction";
    v14[41] = objc_opt_class();
    v13[42] = @"AMSPresentPrivacySplashAction";
    v14[42] = objc_opt_class();
    v13[43] = @"AMSRemoveDeviceOfferAction";
    v14[43] = objc_opt_class();
    v13[44] = @"AMSRestrictedFeatureAction";
    v14[44] = objc_opt_class();
    v13[45] = @"AMSOverrideTreatmentsAction";
    v14[45] = objc_opt_class();
    v13[46] = @"AMSSendSMSAction";
    v14[46] = objc_opt_class();
    v13[47] = @"AMSSubscriptionAction";
    v14[47] = objc_opt_class();
    v13[48] = @"AMSSynchronizeTreatmentsAction";
    v14[48] = objc_opt_class();
    v13[49] = @"AMSItsMeTraceIDAction";
    v14[49] = objc_opt_class();
    v13[50] = @"AMSWalletPassAction";
    v14[50] = objc_opt_class();
    v13[51] = @"AMSVerifyCredentialsAction";
    v14[51] = objc_opt_class();
    v13[52] = @"AMSVerifyPaymentSetupFeatureAction";
    v14[52] = objc_opt_class();
    v13[53] = @"AMSVerifyPrivacyAcknowledgementAction";
    v14[53] = objc_opt_class();
    v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:54];
    v11 = (objc_class *)(id)[v10 objectForKeyedSubscript:v9];
    if (v11) {
      v7 = (AMSUIWebActionRunnerAction *)[[v11 alloc] initWithJSObject:v5 context:v6];
    }
    else {
      v7 = 0;
    }
  }
  return v7;
}

@end