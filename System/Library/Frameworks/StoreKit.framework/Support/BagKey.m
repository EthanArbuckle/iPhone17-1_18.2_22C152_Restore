@interface BagKey
+ (NSString)addPushTypeURL;
+ (NSString)allowedCustomBuyParams;
+ (NSString)allowedCustomGatewaySheetOptions;
+ (NSString)appleIDLookupURL;
+ (NSString)buyProductURL;
+ (NSString)checkForMessagesURL;
+ (NSString)commerceUIURLPatterns;
+ (NSString)countryCode;
+ (NSString)createAppReceiptURL;
+ (NSString)createVPPReceiptURL;
+ (NSString)currencyCode;
+ (NSString)disableNewExternalGatewaySheet;
+ (NSString)disablePurchaseIntentNotifications;
+ (NSString)externalCustomLinkSheetURL;
+ (NSString)externalLinkAccountLearnMoreURL;
+ (NSString)externalLinkAccountSheetURL;
+ (NSString)externalLinkLearnMoreURL;
+ (NSString)externalLinkSheetURL;
+ (NSString)externalPurchaseLearnMoreURL;
+ (NSString)externalPurchaseSpringBoardAppDeleteAlertEnabled;
+ (NSString)externalPurchaseSupportedTokenTypes;
+ (NSString)externalPurchaseTokenCreate;
+ (NSString)externalPurchaseTokenStatus;
+ (NSString)externalPurchaseTokenV2;
+ (NSString)externalPurchaseTokenV2Refresh;
+ (NSString)externalPurchasesSheetURL;
+ (NSString)finishTransactionURL;
+ (NSString)hideableSystemApps;
+ (NSString)ignoreIAPQueueCheckSuppression;
+ (NSString)inAppBuyURL;
+ (NSString)languageTag;
+ (NSString)legacyClientMediaAPIRate;
+ (NSString)localizationInternalJetpackURL;
+ (NSString)localizationJetpackURL;
+ (NSString)manageSubscriptionsURL;
+ (NSString)mediaAPIHost;
+ (NSString)mediaAPISandboxHost;
+ (NSString)paymentAccountBindingEligibilityURL;
+ (NSString)paymentAccountBindingURL;
+ (NSString)pendingTransactionsCountURL;
+ (NSString)pendingTransactionsURL;
+ (NSString)productsBatchLimit;
+ (NSString)productsURL;
+ (NSString)pushEnvironment;
+ (NSString)receiptRefreshMinAge;
+ (NSString)redeemCodeURL;
+ (NSString)refundRequestURL;
+ (NSString)registerPushTokenURL;
+ (NSString)removePushTypeURL;
+ (NSString)restoreTransactionsURL;
+ (NSString)storefrontCountryCode;
+ (NSString)storefrontIdentifier;
+ (NSString)subscriptionStatusMaxAge;
+ (NSString)subscriptionStatusURL;
+ (NSString)timestamp;
+ (NSString)transactionReceiptsMaxAge;
+ (NSString)transactionReceiptsMaxCount;
+ (NSString)transactionReceiptsURL;
+ (NSString)transactionReceiptsURLv2;
+ (NSString)trustedDomains;
- (_TtC9storekitd6BagKey)init;
@end

@implementation BagKey

+ (NSString)allowedCustomBuyParams
{
  id v2 = sub_100171270(&qword_10039A060, (void **)&qword_1003B0028);

  return (NSString *)v2;
}

+ (NSString)allowedCustomGatewaySheetOptions
{
  id v2 = sub_100171270(&qword_10039A068, (void **)&qword_1003B0030);

  return (NSString *)v2;
}

+ (NSString)appleIDLookupURL
{
  id v2 = sub_100171270(&qword_10039A070, (void **)&qword_1003B0038);

  return (NSString *)v2;
}

+ (NSString)buyProductURL
{
  id v2 = sub_100171270(&qword_10039A078, (void **)&qword_1003B0040);

  return (NSString *)v2;
}

+ (NSString)checkForMessagesURL
{
  id v2 = sub_100171270(&qword_10039A080, (void **)&qword_1003B0048);

  return (NSString *)v2;
}

+ (NSString)commerceUIURLPatterns
{
  id v2 = sub_100171270(&qword_10039A088, (void **)&qword_1003B0050);

  return (NSString *)v2;
}

+ (NSString)countryCode
{
  id v2 = sub_100171270(&qword_10039A090, (void **)&qword_1003B0058);

  return (NSString *)v2;
}

+ (NSString)createAppReceiptURL
{
  id v2 = sub_100171270(&qword_10039A098, (void **)&qword_1003B0060);

  return (NSString *)v2;
}

+ (NSString)createVPPReceiptURL
{
  id v2 = sub_100171270(&qword_10039A0A0, (void **)&qword_1003B0068);

  return (NSString *)v2;
}

+ (NSString)currencyCode
{
  id v2 = sub_100171270(&qword_10039A0A8, (void **)&qword_1003B0070);

  return (NSString *)v2;
}

+ (NSString)disablePurchaseIntentNotifications
{
  id v2 = sub_100171270(&qword_10039A0B0, (void **)&qword_1003B0078);

  return (NSString *)v2;
}

+ (NSString)externalLinkSheetURL
{
  id v2 = sub_100171270(&qword_10039A0B8, (void **)&qword_1003B0080);

  return (NSString *)v2;
}

+ (NSString)externalLinkAccountLearnMoreURL
{
  id v2 = sub_100171270(&qword_10039A0C0, (void **)&qword_1003B0088);

  return (NSString *)v2;
}

+ (NSString)externalLinkAccountSheetURL
{
  id v2 = sub_100171270(&qword_10039A0C8, (void **)&qword_1003B0090);

  return (NSString *)v2;
}

+ (NSString)externalLinkLearnMoreURL
{
  id v2 = sub_100171270(&qword_10039A0D0, (void **)&qword_1003B0098);

  return (NSString *)v2;
}

+ (NSString)externalPurchaseLearnMoreURL
{
  id v2 = sub_100171270(&qword_10039A0D8, (void **)&qword_1003B00A0);

  return (NSString *)v2;
}

+ (NSString)externalPurchasesSheetURL
{
  id v2 = sub_100171270(&qword_10039A0E0, (void **)&qword_1003B00A8);

  return (NSString *)v2;
}

+ (NSString)externalCustomLinkSheetURL
{
  id v2 = sub_100171270(&qword_10039A0E8, (void **)&qword_1003B00B0);

  return (NSString *)v2;
}

+ (NSString)externalPurchaseSpringBoardAppDeleteAlertEnabled
{
  id v2 = sub_100171270(&qword_10039A0F0, (void **)&qword_1003B00B8);

  return (NSString *)v2;
}

+ (NSString)externalPurchaseTokenCreate
{
  id v2 = sub_100171270(&qword_10039A0F8, (void **)&qword_1003B00C0);

  return (NSString *)v2;
}

+ (NSString)externalPurchaseTokenV2
{
  id v2 = sub_100171270(&qword_10039A100, (void **)&qword_1003B00C8);

  return (NSString *)v2;
}

+ (NSString)externalPurchaseTokenV2Refresh
{
  id v2 = sub_100171270(&qword_10039A108, (void **)&qword_1003B00D0);

  return (NSString *)v2;
}

+ (NSString)externalPurchaseTokenStatus
{
  id v2 = sub_100171270(&qword_10039A110, (void **)&qword_1003B00D8);

  return (NSString *)v2;
}

+ (NSString)disableNewExternalGatewaySheet
{
  id v2 = sub_100171270(&qword_10039A118, (void **)&qword_1003B00E0);

  return (NSString *)v2;
}

+ (NSString)externalPurchaseSupportedTokenTypes
{
  id v2 = sub_100171270(&qword_10039A120, (void **)&qword_1003B00E8);

  return (NSString *)v2;
}

+ (NSString)finishTransactionURL
{
  id v2 = sub_100171270(&qword_10039A128, (void **)&qword_1003B00F0);

  return (NSString *)v2;
}

+ (NSString)hideableSystemApps
{
  id v2 = sub_100171270(&qword_10039A130, (void **)&qword_1003B00F8);

  return (NSString *)v2;
}

+ (NSString)ignoreIAPQueueCheckSuppression
{
  id v2 = sub_100171270(&qword_10039A138, (void **)&qword_1003B0100);

  return (NSString *)v2;
}

+ (NSString)inAppBuyURL
{
  id v2 = sub_100171270(&qword_10039A140, (void **)&qword_1003B0108);

  return (NSString *)v2;
}

+ (NSString)languageTag
{
  id v2 = sub_100171270(&qword_10039A148, (void **)&qword_1003B0110);

  return (NSString *)v2;
}

+ (NSString)legacyClientMediaAPIRate
{
  id v2 = sub_100171270(&qword_10039A150, (void **)&qword_1003B0118);

  return (NSString *)v2;
}

+ (NSString)localizationJetpackURL
{
  id v2 = sub_100171270(&qword_10039A158, (void **)&qword_1003B0120);

  return (NSString *)v2;
}

+ (NSString)localizationInternalJetpackURL
{
  id v2 = sub_100171270(&qword_10039A160, (void **)&qword_1003B0128);

  return (NSString *)v2;
}

+ (NSString)manageSubscriptionsURL
{
  id v2 = sub_100171270(&qword_10039A168, (void **)&qword_1003B0130);

  return (NSString *)v2;
}

+ (NSString)mediaAPIHost
{
  id v2 = sub_100171270(&qword_10039A170, (void **)&qword_1003B0138);

  return (NSString *)v2;
}

+ (NSString)mediaAPISandboxHost
{
  id v2 = sub_100171270(&qword_10039A178, (void **)&qword_1003B0140);

  return (NSString *)v2;
}

+ (NSString)paymentAccountBindingEligibilityURL
{
  id v2 = sub_100171270(&qword_10039A180, (void **)&qword_1003B0148);

  return (NSString *)v2;
}

+ (NSString)paymentAccountBindingURL
{
  id v2 = sub_100171270(&qword_10039A188, (void **)&qword_1003B0150);

  return (NSString *)v2;
}

+ (NSString)pendingTransactionsCountURL
{
  id v2 = sub_100171270(&qword_10039A190, (void **)&qword_1003B0158);

  return (NSString *)v2;
}

+ (NSString)pendingTransactionsURL
{
  id v2 = sub_100171270(&qword_10039A198, (void **)&qword_1003B0160);

  return (NSString *)v2;
}

+ (NSString)productsBatchLimit
{
  id v2 = sub_100171270(&qword_10039A1A0, (void **)&qword_1003B0168);

  return (NSString *)v2;
}

+ (NSString)productsURL
{
  id v2 = sub_100171270(&qword_10039A1A8, (void **)&qword_1003B0170);

  return (NSString *)v2;
}

+ (NSString)receiptRefreshMinAge
{
  id v2 = sub_100171270(&qword_10039A1B0, (void **)&qword_1003B0178);

  return (NSString *)v2;
}

+ (NSString)redeemCodeURL
{
  id v2 = sub_100171270(&qword_10039A1B8, (void **)&qword_1003B0180);

  return (NSString *)v2;
}

+ (NSString)refundRequestURL
{
  id v2 = sub_100171270(&qword_10039A1C0, (void **)&qword_1003B0188);

  return (NSString *)v2;
}

+ (NSString)restoreTransactionsURL
{
  id v2 = sub_100171270(&qword_10039A1C8, (void **)&qword_1003B0190);

  return (NSString *)v2;
}

+ (NSString)storefrontCountryCode
{
  id v2 = sub_100171270(&qword_10039A1D0, (void **)&qword_1003B0198);

  return (NSString *)v2;
}

+ (NSString)storefrontIdentifier
{
  id v2 = sub_100171270(&qword_10039A1D8, (void **)&qword_1003B01A0);

  return (NSString *)v2;
}

+ (NSString)subscriptionStatusMaxAge
{
  id v2 = sub_100171270(&qword_10039A1E0, (void **)&qword_1003B01A8);

  return (NSString *)v2;
}

+ (NSString)subscriptionStatusURL
{
  id v2 = sub_100171270(&qword_10039A1E8, (void **)&qword_1003B01B0);

  return (NSString *)v2;
}

+ (NSString)timestamp
{
  id v2 = sub_100171270(&qword_10039A1F0, (void **)&qword_1003B01B8);

  return (NSString *)v2;
}

+ (NSString)transactionReceiptsMaxAge
{
  id v2 = sub_100171270(&qword_10039A1F8, (void **)&qword_1003B01C0);

  return (NSString *)v2;
}

+ (NSString)transactionReceiptsMaxCount
{
  id v2 = sub_100171270(&qword_10039A200, (void **)&qword_1003B01C8);

  return (NSString *)v2;
}

+ (NSString)transactionReceiptsURL
{
  id v2 = sub_100171270(&qword_10039A208, (void **)&qword_1003B01D0);

  return (NSString *)v2;
}

+ (NSString)transactionReceiptsURLv2
{
  id v2 = sub_100171270(&qword_10039A210, (void **)&qword_1003B01D8);

  return (NSString *)v2;
}

+ (NSString)trustedDomains
{
  id v2 = sub_100171270(&qword_10039A218, (void **)&qword_1003B01E0);

  return (NSString *)v2;
}

+ (NSString)addPushTypeURL
{
  id v2 = sub_100171270(&qword_10039A220, (void **)&qword_1003B01E8);

  return (NSString *)v2;
}

+ (NSString)pushEnvironment
{
  id v2 = sub_100171270(&qword_10039A228, (void **)&qword_1003B01F0);

  return (NSString *)v2;
}

+ (NSString)registerPushTokenURL
{
  id v2 = sub_100171270(&qword_10039A230, (void **)&qword_1003B01F8);

  return (NSString *)v2;
}

+ (NSString)removePushTypeURL
{
  id v2 = sub_100171270(&qword_10039A238, (void **)&qword_1003B0200);

  return (NSString *)v2;
}

- (_TtC9storekitd6BagKey)init
{
  return (_TtC9storekitd6BagKey *)sub_100187AC4();
}

@end