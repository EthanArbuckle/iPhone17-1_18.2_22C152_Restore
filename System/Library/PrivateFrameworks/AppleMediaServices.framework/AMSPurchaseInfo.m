@interface AMSPurchaseInfo
+ (BOOL)supportsSecureCoding;
- (ACAccount)account;
- (AMSBuyParams)buyParams;
- (AMSProcessInfo)clientInfo;
- (AMSPurchase)purchase;
- (AMSPurchaseDelegate)delegate;
- (AMSPurchaseInfo)initWithCoder:(id)a3;
- (AMSPurchaseInfo)initWithPurchase:(id)a3;
- (AMSPurchaseTask)activePurchaseTask;
- (BOOL)addKBSync;
- (BOOL)didShowPaymentSheet;
- (BOOL)hasBeenAuthedForBuy;
- (BOOL)hasRetriedOriginalOwnerAccount;
- (LAContext)localAuthContext;
- (NSDictionary)dialog;
- (NSDictionary)idmsTokens;
- (NSMutableDictionary)additionalHeaders;
- (NSNumber)expressCheckoutMode;
- (NSNumber)paymentMethodType;
- (NSString)clientCorrelationKey;
- (NSString)dialogId;
- (NSString)paymentToken;
- (NSURL)paymentServicesURL;
- (NSXPCListenerEndpoint)paymentViewServiceListener;
- (id)_purchaseStringForType:(int64_t)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccount:(id)a3;
- (void)setActivePurchaseTask:(id)a3;
- (void)setAddKBSync:(BOOL)a3;
- (void)setAdditionalHeaders:(id)a3;
- (void)setBuyParams:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDialog:(id)a3;
- (void)setDialogId:(id)a3;
- (void)setDidShowPaymentSheet:(BOOL)a3;
- (void)setExpressCheckoutMode:(id)a3;
- (void)setHasBeenAuthedForBuy:(BOOL)a3;
- (void)setHasRetriedOriginalOwnerAccount:(BOOL)a3;
- (void)setIdmsTokens:(id)a3;
- (void)setLocalAuthContext:(id)a3;
- (void)setPaymentMethodType:(id)a3;
- (void)setPaymentServicesURL:(id)a3;
- (void)setPaymentToken:(id)a3;
- (void)setPaymentViewServiceListener:(id)a3;
@end

@implementation AMSPurchaseInfo

- (AMSPurchaseInfo)initWithPurchase:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v52.receiver = self;
  v52.super_class = (Class)AMSPurchaseInfo;
  v6 = [(AMSPurchaseInfo *)&v52 init];
  v7 = v6;
  if (v6)
  {
    v6->_addKBSync = 1;
    v8 = [v5 additionalHeaders];
    uint64_t v9 = [v8 mutableCopy];
    additionalHeaders = v7->_additionalHeaders;
    v7->_additionalHeaders = (NSMutableDictionary *)v9;

    uint64_t v11 = [v5 buyParams];
    buyParams = v7->_buyParams;
    v7->_buyParams = (AMSBuyParams *)v11;

    uint64_t v13 = [v5 clientCorrelationKey];
    clientCorrelationKey = v7->_clientCorrelationKey;
    v7->_clientCorrelationKey = (NSString *)v13;

    v15 = [v5 buyParams];
    v16 = [v15 objectForKeyedSubscript:@"hasBeenAuthedForBuy"];
    if (objc_opt_respondsToSelector())
    {
      v17 = [v5 buyParams];
      v18 = [v17 objectForKeyedSubscript:@"hasBeenAuthedForBuy"];
      v7->_hasBeenAuthedForBuy = [v18 BOOLValue];
    }
    else
    {
      v7->_hasBeenAuthedForBuy = 0;
    }

    objc_storeStrong((id *)&v7->_purchase, a3);
    uint64_t v19 = [v5 account];
    account = v7->_account;
    v7->_account = (ACAccount *)v19;

    v7->_didShowPaymentSheet = 0;
    v21 = [v5 clientInfo];

    if (v21)
    {
      uint64_t v22 = [v5 clientInfo];
      clientInfo = v7->_clientInfo;
      v7->_clientInfo = (AMSProcessInfo *)v22;
    }
    else
    {
      v24 = [v5 callerBundleId];
      if (v24)
      {
        v25 = [AMSProcessInfo alloc];
        v26 = [v5 callerBundleId];
        uint64_t v27 = [(AMSProcessInfo *)v25 initWithBundleIdentifier:v26];
        p_clientInfo = (id *)&v7->_clientInfo;
        v28 = v7->_clientInfo;
        v7->_clientInfo = (AMSProcessInfo *)v27;
      }
      else
      {
        uint64_t v30 = +[AMSProcessInfo currentProcess];
        p_clientInfo = (id *)&v7->_clientInfo;
        v26 = v7->_clientInfo;
        v7->_clientInfo = (AMSProcessInfo *)v30;
      }

      clientInfo = [v5 clientId];
      [*p_clientInfo setProxyAppBundleID:clientInfo];
    }

    uint64_t v31 = [v5 account];
    if (v31)
    {
      v32 = (void *)v31;
      v33 = [v5 account];
      int v34 = objc_msgSend(v33, "ams_isiCloudAccount");

      if (v34)
      {
        v35 = (void *)MEMORY[0x1E4F179C8];
        v36 = [(AMSPurchaseInfo *)v7 clientInfo];
        v37 = objc_msgSend(v35, "ams_sharedAccountStoreForClient:", v36);

        v38 = [v5 account];
        v39 = objc_msgSend(v37, "ams_iTunesAccountForAccount:", v38);

        if (v39) {
          objc_storeStrong((id *)&v7->_account, v39);
        }
      }
    }
    if (+[AMSEphemeralDefaults purchaseAccountFallback]
      && !v7->_account)
    {
      v40 = (void *)MEMORY[0x1E4F179C8];
      v41 = [(AMSPurchaseInfo *)v7 clientInfo];
      v42 = objc_msgSend(v40, "ams_sharedAccountStoreForClient:", v41);

      uint64_t v43 = objc_msgSend(v42, "ams_activeiTunesAccount");
      v44 = v7->_account;
      v7->_account = (ACAccount *)v43;

      v45 = +[AMSLogConfig sharedConfig];
      if (!v45)
      {
        v45 = +[AMSLogConfig sharedConfig];
      }
      v46 = [v45 OSLogObject];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = objc_opt_class();
        id v48 = v47;
        v49 = AMSLogKey();
        v50 = v7->_account;
        *(_DWORD *)buf = 138543874;
        v54 = v47;
        __int16 v55 = 2114;
        v56 = v49;
        __int16 v57 = 2112;
        v58 = v50;
        _os_log_impl(&dword_18D554000, v46, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Falling back to active iTunes account: %@", buf, 0x20u);
      }
    }
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [(AMSPurchaseInfo *)self purchase];
  id v5 = [v4 logUUID];
  v6 = [(AMSPurchaseInfo *)self account];
  v7 = objc_msgSend(v6, "ams_DSID");
  v8 = [(AMSPurchaseInfo *)self _purchaseStringForType:[(AMSPurchase *)self->_purchase purchaseType]];
  uint64_t v9 = [(AMSPurchaseInfo *)self purchase];
  v10 = [v9 uniqueIdentifier];
  uint64_t v11 = [v3 stringWithFormat:@"{ logUUID: %@ accountId: %@ purchaseType: %@ purchaseId: %@ }", v5, v7, v8, v10];

  return v11;
}

- (id)_purchaseStringForType:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"Unknown";
  }
  else {
    return off_1E55A59B0[a3];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSPurchaseInfo *)self additionalHeaders];
  [v4 encodeObject:v5 forKey:@"kAdditionalHeaders"];

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSPurchaseInfo addKBSync](self, "addKBSync"), @"kAddKBSync");
  v6 = [(AMSPurchaseInfo *)self buyParams];
  [v4 encodeObject:v6 forKey:@"kBuyParams"];

  v7 = [(AMSPurchaseInfo *)self clientCorrelationKey];
  [v4 encodeObject:v7 forKey:@"kClientCorrelationKey"];

  v8 = [(AMSPurchaseInfo *)self clientInfo];
  [v4 encodeObject:v8 forKey:@"kClientInfo"];

  uint64_t v9 = [(AMSPurchaseInfo *)self dialog];
  [v4 encodeObject:v9 forKey:@"kDialog"];

  v10 = [(AMSPurchaseInfo *)self dialogId];
  [v4 encodeObject:v10 forKey:@"kDialogId"];

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSPurchaseInfo didShowPaymentSheet](self, "didShowPaymentSheet"), @"kDidShowPaymentSheet");
  uint64_t v11 = [(AMSPurchaseInfo *)self expressCheckoutMode];
  [v4 encodeObject:v11 forKey:@"kExpressCheckoutMode"];

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSPurchaseInfo hasBeenAuthedForBuy](self, "hasBeenAuthedForBuy"), @"kHasBeenAuthedForBuy");
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSPurchaseInfo hasRetriedOriginalOwnerAccount](self, "hasRetriedOriginalOwnerAccount"), @"kHasRetriedOriginalOwnerAccount");
  v12 = [(AMSPurchaseInfo *)self idmsTokens];
  [v4 encodeObject:v12 forKey:@"kIDMTokens"];

  uint64_t v13 = [(AMSPurchaseInfo *)self paymentServicesURL];
  [v4 encodeObject:v13 forKey:@"kPaymentServicesURL"];

  v14 = [(AMSPurchaseInfo *)self paymentToken];
  [v4 encodeObject:v14 forKey:@"kPaymentToken"];

  id v15 = [(AMSPurchaseInfo *)self purchase];
  [v4 encodeObject:v15 forKey:@"kPurchase"];
}

- (AMSPurchaseInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSPurchaseInfo *)self init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"kAdditionalHeaders"];
    v8 = (void *)[v7 mutableCopy];
    uint64_t v9 = v8;
    if (v8) {
      v10 = v8;
    }
    else {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    additionalHeaders = v5->_additionalHeaders;
    v5->_additionalHeaders = v10;

    v5->_addKBSync = [v4 decodeBoolForKey:@"kAddKBSync"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBuyParams"];
    buyParams = v5->_buyParams;
    v5->_buyParams = (AMSBuyParams *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kClientCorrelationKey"];
    clientCorrelationKey = v5->_clientCorrelationKey;
    v5->_clientCorrelationKey = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kClientInfo"];
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (AMSProcessInfo *)v16;

    v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"kDialog"];
    dialog = v5->_dialog;
    v5->_dialog = (NSDictionary *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDialogId"];
    dialogId = v5->_dialogId;
    v5->_dialogId = (NSString *)v21;

    v5->_didShowPaymentSheet = [v4 decodeBoolForKey:@"kDidShowPaymentSheet"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kExpressCheckoutMode"];
    expressCheckoutMode = v5->_expressCheckoutMode;
    v5->_expressCheckoutMode = (NSNumber *)v23;

    v5->_hasBeenAuthedForBuy = [v4 decodeBoolForKey:@"kHasBeenAuthedForBuy"];
    v5->_hasRetriedOriginalOwnerAccount = [v4 decodeBoolForKey:@"kHasRetriedOriginalOwnerAccount"];
    v25 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"kIDMTokens"];
    idmsTokens = v5->_idmsTokens;
    v5->_idmsTokens = (NSDictionary *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPaymentServicesURL"];
    paymentServicesURL = v5->_paymentServicesURL;
    v5->_paymentServicesURL = (NSURL *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPaymentToken"];
    paymentToken = v5->_paymentToken;
    v5->_paymentToken = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPurchase"];
    purchase = v5->_purchase;
    v5->_purchase = (AMSPurchase *)v32;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (AMSPurchaseTask)activePurchaseTask
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activePurchaseTask);
  return (AMSPurchaseTask *)WeakRetained;
}

- (void)setActivePurchaseTask:(id)a3
{
}

- (NSMutableDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
}

- (BOOL)addKBSync
{
  return self->_addKBSync;
}

- (void)setAddKBSync:(BOOL)a3
{
  self->_addKBSync = a3;
}

- (AMSBuyParams)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
}

- (NSString)clientCorrelationKey
{
  return self->_clientCorrelationKey;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (AMSPurchaseDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSPurchaseDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)dialog
{
  return self->_dialog;
}

- (void)setDialog:(id)a3
{
}

- (NSString)dialogId
{
  return self->_dialogId;
}

- (void)setDialogId:(id)a3
{
}

- (BOOL)didShowPaymentSheet
{
  return self->_didShowPaymentSheet;
}

- (void)setDidShowPaymentSheet:(BOOL)a3
{
  self->_didShowPaymentSheet = a3;
}

- (NSNumber)expressCheckoutMode
{
  return self->_expressCheckoutMode;
}

- (void)setExpressCheckoutMode:(id)a3
{
}

- (BOOL)hasBeenAuthedForBuy
{
  return self->_hasBeenAuthedForBuy;
}

- (void)setHasBeenAuthedForBuy:(BOOL)a3
{
  self->_hasBeenAuthedForBuy = a3;
}

- (BOOL)hasRetriedOriginalOwnerAccount
{
  return self->_hasRetriedOriginalOwnerAccount;
}

- (void)setHasRetriedOriginalOwnerAccount:(BOOL)a3
{
  self->_hasRetriedOriginalOwnerAccount = a3;
}

- (NSDictionary)idmsTokens
{
  return self->_idmsTokens;
}

- (void)setIdmsTokens:(id)a3
{
}

- (LAContext)localAuthContext
{
  return self->_localAuthContext;
}

- (void)setLocalAuthContext:(id)a3
{
}

- (NSURL)paymentServicesURL
{
  return self->_paymentServicesURL;
}

- (void)setPaymentServicesURL:(id)a3
{
}

- (NSString)paymentToken
{
  return self->_paymentToken;
}

- (void)setPaymentToken:(id)a3
{
}

- (AMSPurchase)purchase
{
  return self->_purchase;
}

- (NSXPCListenerEndpoint)paymentViewServiceListener
{
  return self->_paymentViewServiceListener;
}

- (void)setPaymentViewServiceListener:(id)a3
{
}

- (NSNumber)paymentMethodType
{
  return self->_paymentMethodType;
}

- (void)setPaymentMethodType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethodType, 0);
  objc_storeStrong((id *)&self->_paymentViewServiceListener, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_paymentToken, 0);
  objc_storeStrong((id *)&self->_paymentServicesURL, 0);
  objc_storeStrong((id *)&self->_localAuthContext, 0);
  objc_storeStrong((id *)&self->_idmsTokens, 0);
  objc_storeStrong((id *)&self->_expressCheckoutMode, 0);
  objc_storeStrong((id *)&self->_dialogId, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientCorrelationKey, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_destroyWeak((id *)&self->_activePurchaseTask);
  objc_storeStrong((id *)&self->_account, 0);
}

@end