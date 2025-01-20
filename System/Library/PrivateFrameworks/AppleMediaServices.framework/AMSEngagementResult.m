@interface AMSEngagementResult
+ (BOOL)supportsSecureCoding;
+ (id)_updatedBodyFromValue:(id)a3 request:(id)a4;
- (AMSCarrierLinkResult)carrierLinkResult;
- (AMSEngagementResult)initWithCoder:(id)a3;
- (AMSEngagementResult)initWithModel:(id)a3;
- (AMSEngagementResult)initWithPath:(int64_t)a3;
- (AMSEngagementResult)initWithSelection:(id)a3;
- (AMSPurchaseResult)purchaseResult;
- (NSData)modelData;
- (NSDictionary)userInfo;
- (NSString)ams_buyParams;
- (id)ams_requestActionFromRequest:(id)a3;
- (id)expressCheckoutCardSelection;
- (id)modelForClass:(Class)a3 error:(id *)a4;
- (int64_t)expressCheckoutPath;
- (void)encodeWithCoder:(id)a3;
- (void)setCarrierLinkResult:(id)a3;
- (void)setModelData:(id)a3;
- (void)setPurchaseResult:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation AMSEngagementResult

- (AMSEngagementResult)initWithPath:(int64_t)a3
{
  return (AMSEngagementResult *)AMSEngagementResult.init(path:)(a3);
}

- (AMSEngagementResult)initWithSelection:(id)a3
{
  return (AMSEngagementResult *)AMSEngagementResult.init(selection:)(a3);
}

- (int64_t)expressCheckoutPath
{
  v2 = self;
  int64_t v3 = AMSEngagementResult.expressCheckoutPath()();

  return v3;
}

- (id)expressCheckoutCardSelection
{
  v2 = self;
  int64_t v3 = (void *)AMSEngagementResult.expressCheckoutCardSelection()();

  return v3;
}

- (NSString)ams_buyParams
{
  v2 = [(AMSEngagementResult *)self userInfo];
  int64_t v3 = [v2 objectForKeyedSubscript:@"buyParams"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (id)ams_requestActionFromRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(AMSEngagementResult *)self userInfo];
  v6 = [v5 objectForKeyedSubscript:@"requestAction"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v7 = 0;
    goto LABEL_7;
  }
  id v7 = v6;

  if (!v7)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_30;
  }
  v8 = [v7 objectForKeyedSubscript:@"url"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v9 = 0;
    goto LABEL_9;
  }
  id v9 = v8;

  if (!v9)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
LABEL_10:
  v12 = [v7 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if ([v13 isEqualToString:@"retry"])
  {
    if (v10) {
      +[AMSURLAction redirectActionWithURL:v10];
    }
    else {
    uint64_t v14 = +[AMSURLAction retryAction];
    }
  }
  else
  {
    uint64_t v14 = +[AMSURLAction proceedAction];
  }
  v11 = (void *)v14;
  v15 = [(AMSEngagementResult *)self ams_buyParams];

  if (v15)
  {
    v16 = +[AMSLogConfig sharedConfig];
    if (!v16)
    {
      v16 = +[AMSLogConfig sharedConfig];
    }
    v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_opt_class();
      AMSLogKey();
      id v19 = v9;
      v21 = v20 = v10;
      int v27 = 138543618;
      uint64_t v28 = v18;
      __int16 v29 = 2114;
      v30 = v21;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dropping updated body because buy params exist", (uint8_t *)&v27, 0x16u);

      v10 = v20;
      id v9 = v19;
    }
  }
  else
  {
    v22 = objc_opt_class();
    v16 = [v7 objectForKeyedSubscript:@"body"];
    v23 = [v22 _updatedBodyFromValue:v16 request:v4];
    [v11 setUpdatedBody:v23];
  }
  v24 = [v7 objectForKeyedSubscript:@"headers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v25 = v24;
  }
  else {
    id v25 = 0;
  }

  [v11 setUpdatedHeaders:v25];
LABEL_30:

  return v11;
}

+ (id)_updatedBodyFromValue:(id)a3 request:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v5 dataUsingEncoding:4];
    }
    else
    {
      v8 = [v6 allHTTPHeaderFields];
      id v9 = [v8 objectForKeyedSubscript:@"Content-Type"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = 0;
        id v7 = +[AMSData dataWithObject:encoding:error:](AMSData, "dataWithObject:encoding:error:", v5, +[AMSData dataEncodingFromContentType:v9], &v16);
        id v10 = v16;
        if (v10)
        {
          v11 = +[AMSLogConfig sharedConfig];
          if (!v11)
          {
            v11 = +[AMSLogConfig sharedConfig];
          }
          v12 = [v11 OSLogObject];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v13 = objc_opt_class();
            uint64_t v14 = AMSLogKey();
            *(_DWORD *)buf = 138543874;
            uint64_t v18 = v13;
            __int16 v19 = 2114;
            v20 = v14;
            __int16 v21 = 2114;
            id v22 = v10;
            _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode data from engagement request. %{public}@", buf, 0x20u);
          }
        }
      }
      else
      {
        id v7 = 0;
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (AMSEngagementResult)initWithModel:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementResult *)self init];
  if (v5)
  {
    uint64_t v6 = +[AMSEngagementUtils encodeModel:v4];
    modelData = v5->_modelData;
    v5->_modelData = (NSData *)v6;
  }
  return v5;
}

- (id)modelForClass:(Class)a3 error:(id *)a4
{
  uint64_t v6 = [(AMSEngagementResult *)self modelData];
  id v7 = +[AMSEngagementUtils modelFromData:v6 class:a3 error:a4];

  return v7;
}

- (AMSEngagementResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMSEngagementResult;
  id v5 = [(AMSEngagementResult *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyCarrierLinkResult"];
    carrierLinkResult = v5->_carrierLinkResult;
    v5->_carrierLinkResult = (AMSCarrierLinkResult *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyModelData"];
    modelData = v5->_modelData;
    v5->_modelData = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyPurchaseResult"];
    purchaseResult = v5->_purchaseResult;
    v5->_purchaseResult = (AMSPurchaseResult *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_PLISTClasses");
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"kCodingKeyUserInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementResult *)self carrierLinkResult];
  [v4 encodeObject:v5 forKey:@"kCodingKeyCarrierLinkResult"];

  uint64_t v6 = [(AMSEngagementResult *)self purchaseResult];
  [v4 encodeObject:v6 forKey:@"kCodingKeyPurchaseResult"];

  id v7 = [(AMSEngagementResult *)self modelData];
  [v4 encodeObject:v7 forKey:@"kCodingKeyModelData"];

  id v8 = [(AMSEngagementResult *)self userInfo];
  [v4 encodeObject:v8 forKey:@"kCodingKeyUserInfo"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSCarrierLinkResult)carrierLinkResult
{
  return self->_carrierLinkResult;
}

- (void)setCarrierLinkResult:(id)a3
{
}

- (AMSPurchaseResult)purchaseResult
{
  return self->_purchaseResult;
}

- (void)setPurchaseResult:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSData)modelData
{
  return self->_modelData;
}

- (void)setModelData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelData, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_purchaseResult, 0);
  objc_storeStrong((id *)&self->_carrierLinkResult, 0);
}

@end