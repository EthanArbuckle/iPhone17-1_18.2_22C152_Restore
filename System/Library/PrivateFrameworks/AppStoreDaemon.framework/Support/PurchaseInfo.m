@interface PurchaseInfo
- (ACAccount)account;
- (AMSBuyParams)buyParams;
- (AMSProcessInfo)clientInfo;
- (ASDPurchase)purchase;
- (BOOL)didShowPaymentSheet;
- (BOOL)disableBoosting;
- (BOOL)discoveredUpdate;
- (BOOL)generatedVendorID;
- (BOOL)ignoreRequirePasswordRestriction;
- (BOOL)isArcade;
- (BOOL)isDiscretionary;
- (BOOL)isMachineBased;
- (BOOL)isRemoteInstall;
- (BOOL)isUserInitiated;
- (BOOL)purchaseOnly;
- (BOOL)requireUniversal;
- (BOOL)requireVendorID;
- (BOOL)shouldCollectMetrics;
- (BOOL)suppressDialogs;
- (BOOL)suppressEvaluatorDialogs;
- (BOOL)useJSONContentType;
- (BOOL)useLocalAuthAndInteractiveDialogs;
- (BOOL)useLocalAuthAndSystemDialogs;
- (IXAppInstallCoordinator)coordinator;
- (NSArray)appCapabilities;
- (NSDictionary)additionalHeaders;
- (NSDictionary)metricsOverlay;
- (NSDictionary)qosMetricsFields;
- (NSNumber)holePunchSize;
- (NSNumber)installedAppSize;
- (NSNumber)installedExternalVersionID;
- (NSNumber)itemID;
- (NSNumber)metricsType;
- (NSNumber)originalPurchaserDSID;
- (NSNumber)purchaseID;
- (NSNumber)recoveryCount;
- (NSNumber)refreshInstallID;
- (NSString)appName;
- (NSString)bundleID;
- (NSString)companionBundleID;
- (NSString)installedVariantID;
- (NSString)itemName;
- (NSString)logCode;
- (NSString)presentingSceneBundleIdentifier;
- (NSString)presentingSceneIdentifier;
- (NSString)referrerName;
- (NSString)referrerURL;
- (NSString)temporaryBundleID;
- (NSString)vendorName;
- (NSURL)bundleURL;
- (NSURL)preflightURL;
- (NSUUID)externalID;
- (PurchaseInfo)init;
- (RequestPresenter)requestPresenter;
- (StoreItemResponse)itemResponse;
- (XDCDevice)device;
- (XPCRequestToken)requestToken;
- (_TtC9appstored6LogKey)batchLogKey;
- (_TtC9appstored6LogKey)logKey;
- (int64_t)clientType;
- (int64_t)expectedSoftwarePlatform;
- (int64_t)priority;
- (int64_t)purchaseState;
- (int64_t)purchaseType;
- (int64_t)updateType;
- (unint64_t)autoInstallOverride;
- (unint64_t)coordinatorImportance;
- (unint64_t)coordinatorIntent;
- (unint64_t)signpostID;
- (void)setAccount:(id)a3;
- (void)setAdditionalHeaders:(id)a3;
- (void)setAppCapabilities:(id)a3;
- (void)setAppName:(id)a3;
- (void)setArcade:(BOOL)a3;
- (void)setAutoInstallOverride:(unint64_t)a3;
- (void)setBatchLogKey:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setBundleURL:(id)a3;
- (void)setBuyParams:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setClientType:(int64_t)a3;
- (void)setCompanionBundleID:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setCoordinatorImportance:(unint64_t)a3;
- (void)setCoordinatorIntent:(unint64_t)a3;
- (void)setDevice:(id)a3;
- (void)setDidShowPaymentSheet:(BOOL)a3;
- (void)setDisableBoosting:(BOOL)a3;
- (void)setDiscoveredUpdate:(BOOL)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setExpectedSoftwarePlatform:(int64_t)a3;
- (void)setExternalID:(id)a3;
- (void)setGeneratedVendorID:(BOOL)a3;
- (void)setHolePunchSize:(id)a3;
- (void)setIgnoreRequirePasswordRestriction:(BOOL)a3;
- (void)setInstalledAppSize:(id)a3;
- (void)setInstalledExternalVersionID:(id)a3;
- (void)setInstalledVariantID:(id)a3;
- (void)setItemID:(id)a3;
- (void)setItemName:(id)a3;
- (void)setItemResponse:(id)a3;
- (void)setLogCode:(id)a3;
- (void)setMachineBased:(BOOL)a3;
- (void)setMetricsOverlay:(id)a3;
- (void)setMetricsType:(id)a3;
- (void)setOriginalPurchaserDSID:(id)a3;
- (void)setPreflightURL:(id)a3;
- (void)setPresentingSceneBundleIdentifier:(id)a3;
- (void)setPresentingSceneIdentifier:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setPurchase:(id)a3;
- (void)setPurchaseID:(id)a3;
- (void)setPurchaseOnly:(BOOL)a3;
- (void)setPurchaseState:(int64_t)a3;
- (void)setPurchaseType:(int64_t)a3;
- (void)setQosMetricsFields:(id)a3;
- (void)setRecoveryCount:(id)a3;
- (void)setReferrerName:(id)a3;
- (void)setReferrerURL:(id)a3;
- (void)setRefreshInstallID:(id)a3;
- (void)setRemoteInstall:(BOOL)a3;
- (void)setRequestToken:(id)a3;
- (void)setRequireUniversal:(BOOL)a3;
- (void)setRequireVendorID:(BOOL)a3;
- (void)setShouldCollectMetrics:(BOOL)a3;
- (void)setSuppressDialogs:(BOOL)a3;
- (void)setSuppressEvaluatorDialogs:(BOOL)a3;
- (void)setTemporaryBundleID:(id)a3;
- (void)setUpdateType:(int64_t)a3;
- (void)setUseJSONContentType:(BOOL)a3;
- (void)setUseLocalAuthAndInteractiveDialogs:(BOOL)a3;
- (void)setUseLocalAuthAndSystemDialogs:(BOOL)a3;
- (void)setVendorName:(id)a3;
- (void)updateGeneratedProperties;
- (void)updateLogKey;
@end

@implementation PurchaseInfo

- (ACAccount)account
{
  return (ACAccount *)sub_1002D0D74((os_unfair_lock_s *)self, @"account");
}

- (void)setAccount:(id)a3
{
}

- (NSDictionary)additionalHeaders
{
  return (NSDictionary *)sub_1002D0D74((os_unfair_lock_s *)self, @"additionalHeaders");
}

- (void)setAdditionalHeaders:(id)a3
{
}

- (NSArray)appCapabilities
{
  return (NSArray *)sub_1002D0D74((os_unfair_lock_s *)self, @"appCapabilities");
}

- (void)setAppCapabilities:(id)a3
{
}

- (NSString)appName
{
  return (NSString *)sub_1002D0D74((os_unfair_lock_s *)self, @"appName");
}

- (void)setAppName:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)sub_1002D0D74((os_unfair_lock_s *)self, @"bundleID");
}

- (void)setBundleID:(id)a3
{
}

- (NSURL)bundleURL
{
  return (NSURL *)sub_1002D0D74((os_unfair_lock_s *)self, @"bundleURL");
}

- (void)setBundleURL:(id)a3
{
}

- (AMSBuyParams)buyParams
{
  return (AMSBuyParams *)sub_1002D0D74((os_unfair_lock_s *)self, @"buyParams");
}

- (void)setBuyParams:(id)a3
{
}

- (AMSProcessInfo)clientInfo
{
  return (AMSProcessInfo *)sub_1002D0D74((os_unfair_lock_s *)self, @"clientInfo");
}

- (void)setClientInfo:(id)a3
{
}

- (NSString)companionBundleID
{
  return (NSString *)sub_1002D0D74((os_unfair_lock_s *)self, @"companionBundleID");
}

- (void)setCompanionBundleID:(id)a3
{
}

- (XDCDevice)device
{
  return (XDCDevice *)sub_1002D0D74((os_unfair_lock_s *)self, @"device");
}

- (void)setDevice:(id)a3
{
}

- (NSUUID)externalID
{
  return (NSUUID *)sub_1002D0D74((os_unfair_lock_s *)self, @"externalID");
}

- (void)setExternalID:(id)a3
{
}

- (NSNumber)holePunchSize
{
  return (NSNumber *)sub_1002D0D74((os_unfair_lock_s *)self, @"holePunchSize");
}

- (void)setHolePunchSize:(id)a3
{
}

- (NSString)itemName
{
  return (NSString *)sub_1002D0D74((os_unfair_lock_s *)self, @"itemName");
}

- (void)setItemName:(id)a3
{
}

- (StoreItemResponse)itemResponse
{
  return (StoreItemResponse *)sub_1002D0D74((os_unfair_lock_s *)self, @"itemResponse");
}

- (void)setItemResponse:(id)a3
{
}

- (NSNumber)installedAppSize
{
  return (NSNumber *)sub_1002D0D74((os_unfair_lock_s *)self, @"installedAppSize");
}

- (void)setInstalledAppSize:(id)a3
{
}

- (NSNumber)installedExternalVersionID
{
  return (NSNumber *)sub_1002D0D74((os_unfair_lock_s *)self, @"installedExternalVersionID");
}

- (void)setInstalledExternalVersionID:(id)a3
{
}

- (NSString)installedVariantID
{
  return (NSString *)sub_1002D0D74((os_unfair_lock_s *)self, @"installedVariantID");
}

- (void)setInstalledVariantID:(id)a3
{
}

- (NSNumber)itemID
{
  return (NSNumber *)sub_1002D0D74((os_unfair_lock_s *)self, @"itemID");
}

- (void)setItemID:(id)a3
{
}

- (NSString)logCode
{
  return (NSString *)sub_1002D0D74((os_unfair_lock_s *)self, @"logCode");
}

- (void)setLogCode:(id)a3
{
}

- (_TtC9appstored6LogKey)logKey
{
  return (_TtC9appstored6LogKey *)sub_1002D0D74((os_unfair_lock_s *)self, @"logKey");
}

- (NSNumber)metricsType
{
  return (NSNumber *)sub_1002D0D74((os_unfair_lock_s *)self, @"metricsType");
}

- (void)setMetricsType:(id)a3
{
}

- (NSDictionary)qosMetricsFields
{
  return (NSDictionary *)sub_1002D0D74((os_unfair_lock_s *)self, @"qosMetricsFields");
}

- (void)setQosMetricsFields:(id)a3
{
}

- (NSDictionary)metricsOverlay
{
  return (NSDictionary *)sub_1002D0D74((os_unfair_lock_s *)self, @"metricsOverlay");
}

- (void)setMetricsOverlay:(id)a3
{
}

- (NSNumber)originalPurchaserDSID
{
  return (NSNumber *)sub_1002D0D74((os_unfair_lock_s *)self, @"originalPurchaserDSID");
}

- (void)setOriginalPurchaserDSID:(id)a3
{
}

- (NSURL)preflightURL
{
  return (NSURL *)sub_1002D0D74((os_unfair_lock_s *)self, @"preflightURL");
}

- (void)setPreflightURL:(id)a3
{
}

- (NSString)presentingSceneBundleIdentifier
{
  return (NSString *)sub_1002D0D74((os_unfair_lock_s *)self, @"presentingSceneBundleIdentifier");
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
}

- (NSString)presentingSceneIdentifier
{
  return (NSString *)sub_1002D0D74((os_unfair_lock_s *)self, @"presentingSceneIdentifier");
}

- (void)setPresentingSceneIdentifier:(id)a3
{
}

- (ASDPurchase)purchase
{
  return (ASDPurchase *)sub_1002D0D74((os_unfair_lock_s *)self, @"purchase");
}

- (void)setPurchase:(id)a3
{
}

- (NSNumber)purchaseID
{
  return (NSNumber *)sub_1002D0D74((os_unfair_lock_s *)self, @"purchaseID");
}

- (void)setPurchaseID:(id)a3
{
}

- (NSNumber)recoveryCount
{
  return (NSNumber *)sub_1002D0D74((os_unfair_lock_s *)self, @"recoveryCount");
}

- (void)setRecoveryCount:(id)a3
{
}

- (NSString)referrerName
{
  return (NSString *)sub_1002D0D74((os_unfair_lock_s *)self, @"referrerName");
}

- (void)setReferrerName:(id)a3
{
}

- (NSString)referrerURL
{
  return (NSString *)sub_1002D0D74((os_unfair_lock_s *)self, @"referrerURL");
}

- (void)setReferrerURL:(id)a3
{
}

- (NSNumber)refreshInstallID
{
  return (NSNumber *)sub_1002D0D74((os_unfair_lock_s *)self, @"refreshInstallID");
}

- (void)setRefreshInstallID:(id)a3
{
}

- (XPCRequestToken)requestToken
{
  return (XPCRequestToken *)sub_1002D0D74((os_unfair_lock_s *)self, @"requestToken");
}

- (void)setRequestToken:(id)a3
{
}

- (NSString)temporaryBundleID
{
  return (NSString *)sub_1002D0D74((os_unfair_lock_s *)self, @"temporaryBundleID");
}

- (void)setTemporaryBundleID:(id)a3
{
}

- (NSString)vendorName
{
  return (NSString *)sub_1002D0D74((os_unfair_lock_s *)self, @"vendorName");
}

- (void)setVendorName:(id)a3
{
}

- (int64_t)clientType
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"clientType");
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)setClientType:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"clientType");
}

- (BOOL)didShowPaymentSheet
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"didShowPaymentSheet");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDidShowPaymentSheet:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"didShowPaymentSheet");
}

- (BOOL)disableBoosting
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"disableBoosting");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDisableBoosting:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"disableBoosting");
}

- (BOOL)discoveredUpdate
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"discoveredUpdate");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDiscoveredUpdate:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"discoveredUpdate");
}

- (BOOL)isDiscretionary
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"isDiscretionary");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDiscretionary:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"isDiscretionary");
}

- (int64_t)expectedSoftwarePlatform
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"expectedSoftwarePlatform");
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)setExpectedSoftwarePlatform:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"expectedSoftwarePlatform");
}

- (BOOL)generatedVendorID
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"generatedVendorID");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setGeneratedVendorID:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"generatedVendorID");
}

- (BOOL)ignoreRequirePasswordRestriction
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"ignoreRequirePasswordRestriction");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIgnoreRequirePasswordRestriction:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"ignoreRequirePasswordRestriction");
}

- (BOOL)isMachineBased
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"isMachineBased");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setMachineBased:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"isMachineBased");
}

- (int64_t)priority
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"priority");
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)setPriority:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"priority");
}

- (BOOL)purchaseOnly
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"purchaseOnly");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setPurchaseOnly:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"purchaseOnly");
}

- (int64_t)purchaseState
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"purchaseState");
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)setPurchaseState:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"purchaseState");
}

- (int64_t)purchaseType
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"purchaseType");
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)setPurchaseType:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"purchaseType");
}

- (BOOL)isRemoteInstall
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"isRemoteInstall");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setRemoteInstall:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"isRemoteInstall");
}

- (BOOL)requireUniversal
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"requireUniversal");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setRequireUniversal:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"requireUniversal");
}

- (BOOL)shouldCollectMetrics
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"shouldCollectMetrics");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setShouldCollectMetrics:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"shouldCollectMetrics");
}

- (BOOL)suppressDialogs
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"suppressDialogs");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSuppressDialogs:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"suppressDialogs");
}

- (BOOL)suppressEvaluatorDialogs
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"suppressEvaluatorDialogs");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSuppressEvaluatorDialogs:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"suppressEvaluatorDialogs");
}

- (int64_t)updateType
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"updateType");
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)setUpdateType:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"updateType");
}

- (BOOL)useJSONContentType
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"useJSONContentType");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setUseJSONContentType:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"useJSONContentType");
}

- (BOOL)useLocalAuthAndSystemDialogs
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"useLocalAuthAndSystemDialogs");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setUseLocalAuthAndSystemDialogs:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"useLocalAuthAndSystemDialogs");
}

- (IXAppInstallCoordinator)coordinator
{
  return (IXAppInstallCoordinator *)sub_1002D0D74((os_unfair_lock_s *)self, @"coordinator");
}

- (void)setCoordinator:(id)a3
{
}

- (unint64_t)autoInstallOverride
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"autoInstallOverride");
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (void)setAutoInstallOverride:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"autoInstallOverride");
}

- (unint64_t)coordinatorImportance
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"coordinatorImportance");
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (void)setCoordinatorImportance:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"coordinatorImportance");
}

- (unint64_t)coordinatorIntent
{
  v2 = sub_1002D0D74((os_unfair_lock_s *)self, @"coordinatorIntent");
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (void)setCoordinatorIntent:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  sub_1002D0DE8((uint64_t)self, v4, @"coordinatorIntent");
}

- (PurchaseInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)PurchaseInfo;
  v2 = [(ContextObject *)&v4 init];
  if (v2) {
    [(PurchaseInfo *)v2 setShouldCollectMetrics:+[QOSMetrics shouldCollectMetrics]];
  }
  return v2;
}

- (RequestPresenter)requestPresenter
{
  if ([(PurchaseInfo *)self suppressDialogs])
  {
    id v3 = objc_opt_new();
  }
  else
  {
    objc_super v4 = [(PurchaseInfo *)self requestToken];
    v5 = v4;
    if (v4 && ![v4 isInternal])
    {
      v6 = [v5 notificationClient];
      id v3 = sub_10033C1D8((uint64_t)CallerRequestPresenter, v6);
    }
    else
    {
      id v3 = objc_opt_new();
    }
  }
  return (RequestPresenter *)v3;
}

- (void)updateGeneratedProperties
{
  id v3 = [(PurchaseInfo *)self additionalHeaders];
  id v4 = [v3 mutableCopy];

  if (!v4) {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
  }
  uint64_t v5 = AMSHTTPHeaderUserAgent;
  v6 = [v4 objectForKeyedSubscript:AMSHTTPHeaderUserAgent];

  if (!v6)
  {
    v7 = [(PurchaseInfo *)self clientInfo];
    v8 = +[AMSUserAgent userAgentForProcessInfo:v7];
    [v4 setObject:v8 forKeyedSubscript:v5];
  }
  id v9 = [v4 copy];
  [(PurchaseInfo *)self setAdditionalHeaders:v9];

  [(PurchaseInfo *)self updateLogKey];
  v10 = [(PurchaseInfo *)self buyParams];
  if (os_variant_has_internal_content()) {
    [v10 setParameter:@"internal" forKey:@"OSBuildType"];
  }
  v11 = [v10 parameterForKey:@"ForceAppDRMMode"];

  if (!v11)
  {
    v12 = sub_1003F45A8();
    v13 = v12;
    if (v12
      && (([v12 isEqualToNumber:&off_10054CBE8] & 1) != 0
       || [v13 isEqualToNumber:&off_10054CC00]))
    {
      v14 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [(PurchaseInfo *)self logKey];
        *(_DWORD *)v19 = 138412546;
        *(void *)&v19[4] = v15;
        *(_WORD *)&v19[12] = 1024;
        *(_DWORD *)&v19[14] = [v13 intValue];
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%@] Setting ForceAppDRMMode: %d", v19, 0x12u);
      }
      [v10 setParameter:v13 forKey:@"ForceAppDRMMode"];
    }
  }
  [(PurchaseInfo *)self setBuyParams:v10];
  v16 = [(PurchaseInfo *)self externalID];
  v17 = v16;
  if (v16)
  {
    *(void *)v19 = 0;
    *(void *)&v19[8] = 0;
    [v16 getUUIDBytes:v19];
    v18 = *(_TtC9appstored6LogKey **)v19;
  }
  else
  {
    v18 = 0;
  }
  *(_TtC9appstored6LogKey **)((char *)&self->_batchLogKey + 4) = v18;
}

- (BOOL)isUserInitiated
{
  BOOL result = (!os_variant_has_internal_content()
         || ([(PurchaseInfo *)self clientInfo],
             id v3 = objc_claimAutoreleasedReturnValue(),
             [v3 bundleIdentifier],
             id v4 = objc_claimAutoreleasedReturnValue(),
             unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.asclient"],
             v4,
             v3,
             (v5 & 1) == 0))
        && ![(PurchaseInfo *)self isDiscretionary]
        && ![(PurchaseInfo *)self suppressDialogs];
  return result;
}

- (void)updateLogKey
{
  id v3 = [_TtC9appstored6LogKey alloc];
  id v9 = [(PurchaseInfo *)self batchLogKey];
  id v4 = [(PurchaseInfo *)self logCode];
  unsigned __int8 v5 = [(PurchaseInfo *)self externalID];
  v6 = [(PurchaseInfo *)self bundleID];
  v7 = [(PurchaseInfo *)self itemID];
  v8 = [(LogKey *)v3 initWithBatchLogKey:v9 logCode:v4 externalID:v5 bundleID:v6 itemID:v7];
  if (self) {
    sub_1002D0DE8((uint64_t)self, v8, @"logKey");
  }
}

- (BOOL)isArcade
{
  return *(unsigned char *)(&self->super._lock + 1) & 1;
}

- (void)setArcade:(BOOL)a3
{
  *((unsigned char *)&self->super._lock + 4) = a3;
}

- (_TtC9appstored6LogKey)batchLogKey
{
  return (_TtC9appstored6LogKey *)objc_getProperty(self, a2, 28, 1);
}

- (void)setBatchLogKey:(id)a3
{
}

- (BOOL)requireVendorID
{
  return *((unsigned char *)&self->super._lock + 5) & 1;
}

- (void)setRequireVendorID:(BOOL)a3
{
  *((unsigned char *)&self->super._lock + 5) = a3;
}

- (unint64_t)signpostID
{
  return *(unint64_t *)((char *)&self->_batchLogKey + 4);
}

- (BOOL)useLocalAuthAndInteractiveDialogs
{
  return *((unsigned char *)&self->super._lock + 6) & 1;
}

- (void)setUseLocalAuthAndInteractiveDialogs:(BOOL)a3
{
  *((unsigned char *)&self->super._lock + 6) = a3;
}

- (void).cxx_destruct
{
}

@end