@interface AMSPurchase
+ (BOOL)supportsSecureCoding;
+ (id)_authContextTitleForConfirmationStyle:(unint64_t)a3;
+ (id)defaultAuthenticationContextForRequest:(id)a3;
+ (id)purchaseFromPurchase:(id)a3;
- (ACAccount)account;
- (AMSBlindedData)blindedData;
- (AMSBuyParams)buyParams;
- (AMSProcessInfo)clientInfo;
- (AMSPurchase)initWithCoder:(id)a3;
- (AMSPurchase)initWithPurchaseType:(int64_t)a3 buyParams:(id)a4;
- (BOOL)asyncRecordEngagementEvent;
- (BOOL)ignoreRequirePasswordRestriction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPurchase:(id)a3;
- (BOOL)isRedownload;
- (BOOL)isUserInitiated;
- (BOOL)requiresAccount;
- (BOOL)requiresApplePayClassic;
- (BOOL)sendBlindedData;
- (BOOL)useJSONContentType;
- (NSDictionary)additionalHeaders;
- (NSDictionary)metricsOverlay;
- (NSDictionary)performanceMetricsOverlay;
- (NSNumber)ownerAccountId;
- (NSNumber)uniqueIdentifier;
- (NSString)URLBagKey;
- (NSString)callerBundleId;
- (NSString)clientCorrelationKey;
- (NSString)clientId;
- (NSString)logUUID;
- (NSString)presentingSceneBundleIdentifier;
- (NSString)presentingSceneIdentifier;
- (NSString)storefront;
- (NSXPCListenerEndpoint)paymentViewServiceListener;
- (id)_generateIdentifier;
- (id)authenticationContextForRequest:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)purchaseType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAdditionalHeaders:(id)a3;
- (void)setAsyncRecordEngagementEvent:(BOOL)a3;
- (void)setBlindedData:(id)a3;
- (void)setCallerBundleId:(id)a3;
- (void)setClientId:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setIgnoreRequirePasswordRestriction:(BOOL)a3;
- (void)setLogUUID:(id)a3;
- (void)setMetricsOverlay:(id)a3;
- (void)setOwnerAccountId:(id)a3;
- (void)setPaymentViewServiceListener:(id)a3;
- (void)setPerformanceMetricsOverlay:(id)a3;
- (void)setPresentingSceneBundleIdentifier:(id)a3;
- (void)setPresentingSceneIdentifier:(id)a3;
- (void)setRequiresAccount:(BOOL)a3;
- (void)setRequiresApplePayClassic:(BOOL)a3;
- (void)setSendBlindedData:(BOOL)a3;
- (void)setStorefront:(id)a3;
- (void)setURLBagKey:(id)a3;
- (void)setUseJSONContentType:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation AMSPurchase

- (AMSPurchase)initWithPurchaseType:(int64_t)a3 buyParams:(id)a4
{
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AMSPurchase;
  v8 = [(AMSPurchase *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_buyParams, a4);
    v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v10 UUIDString];
    clientCorrelationKey = v9->_clientCorrelationKey;
    v9->_clientCorrelationKey = (NSString *)v11;

    v9->_ignoreRequirePasswordRestriction = 0;
    uint64_t v13 = AMSGenerateLogCorrelationKey();
    logUUID = v9->_logUUID;
    v9->_logUUID = (NSString *)v13;

    v9->_purchaseType = a3;
    *(_WORD *)&v9->_requiresAccount = 0;
    uint64_t v15 = [(AMSPurchase *)v9 _generateIdentifier];
    uniqueIdentifier = v9->_uniqueIdentifier;
    v9->_uniqueIdentifier = (NSNumber *)v15;

    *(_WORD *)&v9->_userInitiated = 1;
    v9->_asyncRecordEngagementEvent = 0;
  }

  return v9;
}

- (NSString)logUUID
{
  logUUID = self->_logUUID;
  if (logUUID)
  {
    v3 = logUUID;
  }
  else
  {
    v3 = [(NSNumber *)self->_uniqueIdentifier stringValue];
  }
  return v3;
}

- (BOOL)isRedownload
{
  v2 = [(AMSBuyParams *)self->_buyParams objectForKeyedSubscript:@"pricingParameters"];
  char v3 = [v2 isEqualToString:@"STDRDL"];

  return v3;
}

- (BOOL)sendBlindedData
{
  char v3 = [(AMSPurchase *)self buyParams];
  v4 = [v3 objectForKeyedSubscript:0x1EDCAD608];
  if (objc_opt_respondsToSelector())
  {
    v5 = [(AMSPurchase *)self buyParams];
    v6 = [v5 objectForKeyedSubscript:0x1EDCAD608];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)setLogUUID:(id)a3
{
  v5 = (NSString *)a3;
  logUUID = self->_logUUID;
  p_logUUID = &self->_logUUID;
  if (logUUID != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_logUUID, a3);
    v5 = v8;
  }
}

- (void)setSendBlindedData:(BOOL)a3
{
  id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  v4 = [(AMSPurchase *)self buyParams];
  [v4 setObject:v5 forKeyedSubscript:0x1EDCAD608];
}

- (id)authenticationContextForRequest:(id)a3
{
  return +[AMSPurchase defaultAuthenticationContextForRequest:a3];
}

+ (id)defaultAuthenticationContextForRequest:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F4EF60]);
  id v5 = [v3 account];
  v6 = objc_msgSend(v5, "ams_altDSID");
  [v4 setAltDSID:v6];

  char v7 = [v3 account];
  v8 = objc_msgSend(v7, "ams_DSID");
  v9 = [v8 stringValue];
  [v4 setDSID:v9];

  v10 = [v3 account];
  uint64_t v11 = [v10 username];
  [v4 setIsUsernameEditable:v11 == 0];

  v12 = [v3 explanation];
  objc_msgSend(v4, "set_passwordPromptTitle:", v12);

  uint64_t v13 = [v3 message];
  [v4 setReason:v13];

  [v4 setShouldAllowAppleIDCreation:0];
  [v4 setAuthenticationType:2];
  [v4 setShouldUpdatePersistentServiceTokens:1];
  v14 = [v3 account];
  uint64_t v15 = [v14 username];
  [v4 setUsername:v15];

  [v4 setServiceType:2];
  if ([v4 isContextEligibleForPasscodeAuth])
  {
    v16 = +[AMSPurchase _authContextTitleForConfirmationStyle:](AMSPurchase, "_authContextTitleForConfirmationStyle:", objc_msgSend(v3, "ams_confirmationStyle"));
    [v4 setTitle:v16];
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = [(AMSPurchase *)self account];
  uint64_t v7 = [v6 copyWithZone:a3];
  v8 = (void *)v5[3];
  v5[3] = v7;

  v9 = [(AMSPurchase *)self additionalHeaders];
  uint64_t v10 = [v9 copyWithZone:a3];
  uint64_t v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = [(AMSPurchase *)self buyParams];
  uint64_t v13 = [v12 copyWithZone:a3];
  v14 = (void *)v5[5];
  v5[5] = v13;

  uint64_t v15 = [(AMSPurchase *)self callerBundleId];
  uint64_t v16 = [v15 copyWithZone:a3];
  v17 = (void *)v5[17];
  v5[17] = v16;

  objc_super v18 = [(AMSPurchase *)self clientCorrelationKey];
  uint64_t v19 = [v18 copyWithZone:a3];
  v20 = (void *)v5[6];
  v5[6] = v19;

  v21 = [(AMSPurchase *)self clientId];
  uint64_t v22 = [v21 copyWithZone:a3];
  v23 = (void *)v5[18];
  v5[18] = v22;

  v24 = [(AMSPurchase *)self clientInfo];
  uint64_t v25 = [v24 copyWithZone:a3];
  v26 = (void *)v5[7];
  v5[7] = v25;

  *((unsigned char *)v5 + 8) = [(AMSPurchase *)self ignoreRequirePasswordRestriction];
  v27 = [(AMSPurchase *)self logUUID];
  uint64_t v28 = [v27 copyWithZone:a3];
  v29 = (void *)v5[2];
  v5[2] = v28;

  v30 = [(AMSPurchase *)self metricsOverlay];
  uint64_t v31 = [v30 copyWithZone:a3];
  v32 = (void *)v5[9];
  v5[9] = v31;

  v33 = [(AMSPurchase *)self performanceMetricsOverlay];
  uint64_t v34 = [v33 copyWithZone:a3];
  v35 = (void *)v5[11];
  v5[11] = v34;

  v36 = [(AMSPurchase *)self ownerAccountId];
  uint64_t v37 = [v36 copyWithZone:a3];
  v38 = (void *)v5[8];
  v5[8] = v37;

  v39 = [(AMSPurchase *)self blindedData];
  uint64_t v40 = [v39 copyWithZone:a3];
  v41 = (void *)v5[20];
  v5[20] = v40;

  v5[14] = [(AMSPurchase *)self purchaseType];
  *((unsigned char *)v5 + 9) = [(AMSPurchase *)self requiresAccount];
  *((unsigned char *)v5 + 10) = [(AMSPurchase *)self requiresApplePayClassic];
  v42 = [(AMSPurchase *)self storefront];
  uint64_t v43 = [v42 copyWithZone:a3];
  v44 = (void *)v5[15];
  v5[15] = v43;

  v45 = [(AMSPurchase *)self uniqueIdentifier];
  uint64_t v46 = [v45 copyWithZone:a3];
  v47 = (void *)v5[16];
  v5[16] = v46;

  *((unsigned char *)v5 + 11) = [(AMSPurchase *)self isUserInitiated];
  *((unsigned char *)v5 + 12) = [(AMSPurchase *)self useJSONContentType];
  *((unsigned char *)v5 + 13) = [(AMSPurchase *)self asyncRecordEngagementEvent];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v19 = a3;
  id v4 = [(AMSPurchase *)self account];
  [v19 encodeObject:v4 forKey:@"account"];

  id v5 = [(AMSPurchase *)self additionalHeaders];
  [v19 encodeObject:v5 forKey:@"additionalHeaders"];

  v6 = [(AMSPurchase *)self blindedData];
  [v19 encodeObject:v6 forKey:@"blindedData"];

  uint64_t v7 = [(AMSPurchase *)self buyParams];
  [v19 encodeObject:v7 forKey:@"buyParams"];

  v8 = [(AMSPurchase *)self clientInfo];
  [v19 encodeObject:v8 forKey:@"clientInfo"];

  objc_msgSend(v19, "encodeBool:forKey:", -[AMSPurchase ignoreRequirePasswordRestriction](self, "ignoreRequirePasswordRestriction"), @"ignoreRequirePasswordRestriction");
  v9 = [(AMSPurchase *)self logUUID];
  [v19 encodeObject:v9 forKey:@"logUUID"];

  uint64_t v10 = [(AMSPurchase *)self ownerAccountId];
  [v19 encodeObject:v10 forKey:@"ownerAccountId"];

  uint64_t v11 = [(AMSPurchase *)self presentingSceneBundleIdentifier];
  [v19 encodeObject:v11 forKey:@"presentingSceneBundleIdentifier"];

  v12 = [(AMSPurchase *)self presentingSceneIdentifier];
  [v19 encodeObject:v12 forKey:@"presentingSceneIdentifier"];

  objc_msgSend(v19, "encodeInteger:forKey:", -[AMSPurchase purchaseType](self, "purchaseType"), @"purchaseType");
  objc_msgSend(v19, "encodeBool:forKey:", -[AMSPurchase requiresAccount](self, "requiresAccount"), @"requiresAccount");
  objc_msgSend(v19, "encodeBool:forKey:", -[AMSPurchase requiresApplePayClassic](self, "requiresApplePayClassic"), @"requiresApplePayClassic");
  uint64_t v13 = [(AMSPurchase *)self storefront];
  [v19 encodeObject:v13 forKey:@"storefront"];

  v14 = [(AMSPurchase *)self uniqueIdentifier];
  [v19 encodeObject:v14 forKey:@"uniqueIdentifier"];

  objc_msgSend(v19, "encodeBool:forKey:", -[AMSPurchase isUserInitiated](self, "isUserInitiated"), @"userInitiated");
  objc_msgSend(v19, "encodeBool:forKey:", -[AMSPurchase useJSONContentType](self, "useJSONContentType"), @"useJSONContentType");
  objc_msgSend(v19, "encodeBool:forKey:", -[AMSPurchase asyncRecordEngagementEvent](self, "asyncRecordEngagementEvent"), @"asyncRecordEngagementEvent");
  uint64_t v15 = [(AMSPurchase *)self metricsOverlay];

  if (v15)
  {
    uint64_t v16 = [(AMSPurchase *)self metricsOverlay];
    objc_msgSend(v19, "ams_encodeJSONDictionary:forKey:", v16, @"metricsOverlay");
  }
  v17 = [(AMSPurchase *)self performanceMetricsOverlay];

  if (v17)
  {
    objc_super v18 = [(AMSPurchase *)self performanceMetricsOverlay];
    objc_msgSend(v19, "ams_encodeJSONDictionary:forKey:", v18, @"performanceMetricsOverlay");
  }
}

- (AMSPurchase)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)AMSPurchase;
  id v5 = [(AMSPurchase *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account"];
    account = v5->_account;
    v5->_account = (ACAccount *)v6;

    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v4 decodeDictionaryWithKeysOfClass:v8 objectsOfClass:objc_opt_class() forKey:@"additionalHeaders"];
    additionalHeaders = v5->_additionalHeaders;
    v5->_additionalHeaders = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blindedData"];
    blindedData = v5->_blindedData;
    v5->_blindedData = (AMSBlindedData *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buyParams"];
    buyParams = v5->_buyParams;
    v5->_buyParams = (AMSBuyParams *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientInfo"];
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (AMSProcessInfo *)v15;

    v5->_ignoreRequirePasswordRestriction = [v4 decodeBoolForKey:@"ignoreRequirePasswordRestriction"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"logUUID"];
    logUUID = v5->_logUUID;
    v5->_logUUID = (NSString *)v17;

    uint64_t v19 = objc_msgSend(v4, "ams_decodeJSONDictionaryForKey:", @"metricsOverlay");
    metricsOverlay = v5->_metricsOverlay;
    v5->_metricsOverlay = (NSDictionary *)v19;

    uint64_t v21 = objc_msgSend(v4, "ams_decodeJSONDictionaryForKey:", @"performanceMetricsOverlay");
    performanceMetricsOverlay = v5->_performanceMetricsOverlay;
    v5->_performanceMetricsOverlay = (NSDictionary *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerAccountId"];
    ownerAccountId = v5->_ownerAccountId;
    v5->_ownerAccountId = (NSNumber *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"presentingSceneBundleIdentifier"];
    presentingSceneBundleIdentifier = v5->_presentingSceneBundleIdentifier;
    v5->_presentingSceneBundleIdentifier = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"presentingSceneIdentifier"];
    presentingSceneIdentifier = v5->_presentingSceneIdentifier;
    v5->_presentingSceneIdentifier = (NSString *)v27;

    v5->_purchaseType = [v4 decodeIntegerForKey:@"purchaseType"];
    v5->_requiresAccount = [v4 decodeBoolForKey:@"requiresAccount"];
    v5->_requiresApplePayClassic = [v4 decodeBoolForKey:@"requiresApplePayClassic"];
    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storefront"];
    storefront = v5->_storefront;
    v5->_storefront = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSNumber *)v31;

    v5->_userInitiated = [v4 decodeBoolForKey:@"userInitiated"];
    v5->_useJSONContentType = [v4 decodeBoolForKey:@"useJSONContentType"];
    v5->_asyncRecordEngagementEvent = [v4 decodeBoolForKey:@"asyncRecordEngagementEvent"];
  }

  return v5;
}

+ (id)purchaseFromPurchase:(id)a3
{
  id v3 = a3;
  id v4 = [AMSPurchase alloc];
  uint64_t v5 = [v3 purchaseType];
  uint64_t v6 = [v3 buyParams];
  uint64_t v7 = [(AMSPurchase *)v4 initWithPurchaseType:v5 buyParams:v6];

  uint64_t v8 = [v3 account];
  [(AMSPurchase *)v7 setAccount:v8];

  uint64_t v9 = [v3 additionalHeaders];
  [(AMSPurchase *)v7 setAdditionalHeaders:v9];

  uint64_t v10 = [v3 blindedData];
  [(AMSPurchase *)v7 setBlindedData:v10];

  uint64_t v11 = [v3 clientInfo];
  [(AMSPurchase *)v7 setClientInfo:v11];

  -[AMSPurchase setIgnoreRequirePasswordRestriction:](v7, "setIgnoreRequirePasswordRestriction:", [v3 ignoreRequirePasswordRestriction]);
  v12 = [v3 logUUID];
  [(AMSPurchase *)v7 setLogUUID:v12];

  uint64_t v13 = [v3 metricsOverlay];
  [(AMSPurchase *)v7 setMetricsOverlay:v13];

  v14 = [v3 performanceMetricsOverlay];
  [(AMSPurchase *)v7 setPerformanceMetricsOverlay:v14];

  uint64_t v15 = [v3 ownerAccountId];
  [(AMSPurchase *)v7 setOwnerAccountId:v15];

  uint64_t v16 = [v3 presentingSceneBundleIdentifier];
  [(AMSPurchase *)v7 setPresentingSceneBundleIdentifier:v16];

  uint64_t v17 = [v3 presentingSceneIdentifier];
  [(AMSPurchase *)v7 setPresentingSceneIdentifier:v17];

  -[AMSPurchase setRequiresAccount:](v7, "setRequiresAccount:", [v3 requiresAccount]);
  -[AMSPurchase setRequiresApplePayClassic:](v7, "setRequiresApplePayClassic:", [v3 requiresApplePayClassic]);
  objc_super v18 = [v3 storefront];
  [(AMSPurchase *)v7 setStorefront:v18];

  -[AMSPurchase setUserInitiated:](v7, "setUserInitiated:", [v3 isUserInitiated]);
  -[AMSPurchase setUseJSONContentType:](v7, "setUseJSONContentType:", [v3 useJSONContentType]);
  uint64_t v19 = [v3 asyncRecordEngagementEvent];

  [(AMSPurchase *)v7 setAsyncRecordEngagementEvent:v19];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v2 = NSString;
  id v3 = [(AMSPurchase *)self logUUID];
  id v4 = [v2 stringWithFormat:@"{ key: %@ }", v3];

  return v4;
}

- (unint64_t)hash
{
  v2 = [(AMSPurchase *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AMSPurchase *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(AMSPurchase *)self isEqualToPurchase:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToPurchase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSPurchase *)self uniqueIdentifier];
  BOOL v6 = [v4 uniqueIdentifier];

  LOBYTE(v4) = [v5 isEqualToNumber:v6];
  return (char)v4;
}

- (id)_generateIdentifier
{
  CFUUIDRef v2 = CFUUIDCreate(0);
  uint64_t v3 = *(_OWORD *)&CFUUIDGetUUIDBytes(v2);
  CFRelease(v2);
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = -v3;
  }
  return (id)[v4 numberWithLongLong:v5];
}

+ (id)_authContextTitleForConfirmationStyle:(unint64_t)a3
{
  if (a3 > 9) {
    uint64_t v3 = @"PASSCODE_AUTH_TITLE_DEFAULT";
  }
  else {
    uint64_t v3 = off_1E55A5938[a3];
  }
  id v4 = AMSLocalizedString(v3, 0);
  return v4;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
}

- (AMSBuyParams)buyParams
{
  return self->_buyParams;
}

- (NSString)clientCorrelationKey
{
  return self->_clientCorrelationKey;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (BOOL)ignoreRequirePasswordRestriction
{
  return self->_ignoreRequirePasswordRestriction;
}

- (void)setIgnoreRequirePasswordRestriction:(BOOL)a3
{
  self->_ignoreRequirePasswordRestriction = a3;
}

- (NSNumber)ownerAccountId
{
  return self->_ownerAccountId;
}

- (void)setOwnerAccountId:(id)a3
{
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

- (void)setMetricsOverlay:(id)a3
{
}

- (NSXPCListenerEndpoint)paymentViewServiceListener
{
  return self->_paymentViewServiceListener;
}

- (void)setPaymentViewServiceListener:(id)a3
{
}

- (NSDictionary)performanceMetricsOverlay
{
  return self->_performanceMetricsOverlay;
}

- (void)setPerformanceMetricsOverlay:(id)a3
{
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
}

- (int64_t)purchaseType
{
  return self->_purchaseType;
}

- (BOOL)requiresAccount
{
  return self->_requiresAccount;
}

- (void)setRequiresAccount:(BOOL)a3
{
  self->_requiresAccount = a3;
}

- (BOOL)requiresApplePayClassic
{
  return self->_requiresApplePayClassic;
}

- (void)setRequiresApplePayClassic:(BOOL)a3
{
  self->_requiresApplePayClassic = a3;
}

- (NSString)storefront
{
  return self->_storefront;
}

- (void)setStorefront:(id)a3
{
}

- (NSNumber)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)useJSONContentType
{
  return self->_useJSONContentType;
}

- (void)setUseJSONContentType:(BOOL)a3
{
  self->_useJSONContentType = a3;
}

- (BOOL)asyncRecordEngagementEvent
{
  return self->_asyncRecordEngagementEvent;
}

- (void)setAsyncRecordEngagementEvent:(BOOL)a3
{
  self->_asyncRecordEngagementEvent = a3;
}

- (NSString)callerBundleId
{
  return self->_callerBundleId;
}

- (void)setCallerBundleId:(id)a3
{
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setClientId:(id)a3
{
}

- (NSString)URLBagKey
{
  return self->_URLBagKey;
}

- (void)setURLBagKey:(id)a3
{
}

- (AMSBlindedData)blindedData
{
  return self->_blindedData;
}

- (void)setBlindedData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blindedData, 0);
  objc_storeStrong((id *)&self->_URLBagKey, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_callerBundleId, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_performanceMetricsOverlay, 0);
  objc_storeStrong((id *)&self->_paymentViewServiceListener, 0);
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
  objc_storeStrong((id *)&self->_ownerAccountId, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientCorrelationKey, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_logUUID, 0);
}

@end