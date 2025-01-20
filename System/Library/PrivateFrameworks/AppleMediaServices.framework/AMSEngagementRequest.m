@interface AMSEngagementRequest
+ (BOOL)supportsSecureCoding;
- (ACAccount)account;
- (AMSEngagementRequest)init;
- (AMSEngagementRequest)initWithCoder:(id)a3;
- (AMSEngagementRequest)initWithJSONDictionary:(id)a3;
- (AMSEngagementRequest)initWithModel:(id)a3;
- (AMSEngagementRequest)initWithModel:(id)a3 destinationStyle:(int64_t)a4;
- (AMSEngagementRequest)initWithRequestDictionary:(id)a3;
- (BOOL)anonymousMetrics;
- (BOOL)failOnDismiss;
- (BOOL)silentlyCheckURL;
- (BOOL)suppressInteractiveModalDismissal;
- (NSData)modelData;
- (NSDictionary)clientData;
- (NSDictionary)metricsOverlay;
- (NSString)logKey;
- (NSURL)URL;
- (NSURL)originatingURL;
- (id)_accountFromDictionary:(id)a3;
- (id)modelForClass:(Class)a3 error:(id *)a4;
- (int64_t)_engagementPresentationStyleFromDictionary:(id)a3;
- (int64_t)destinationStyle;
- (int64_t)presentationStyle;
- (void)applyOverlayMetrics:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)replaceOverlayMetrics:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAnonymousMetrics:(BOOL)a3;
- (void)setClientData:(id)a3;
- (void)setDestinationStyle:(int64_t)a3;
- (void)setFailOnDismiss:(BOOL)a3;
- (void)setLogKey:(id)a3;
- (void)setModelData:(id)a3;
- (void)setOriginatingURL:(id)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)setSilentlyCheckURL:(BOOL)a3;
- (void)setSuppressInteractiveModalDismissal:(BOOL)a3;
- (void)setURL:(id)a3;
@end

@implementation AMSEngagementRequest

- (AMSEngagementRequest)init
{
  v7.receiver = self;
  v7.super_class = (Class)AMSEngagementRequest;
  v2 = [(AMSEngagementRequest *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_anonymousMetrics = 0;
    uint64_t v4 = AMSLogKey();
    logKey = v3->_logKey;
    v3->_logKey = (NSString *)v4;

    *(_WORD *)&v3->_failOnDismiss = 1;
    v3->_suppressInteractiveModalDismissal = 0;
    v3->_destinationStyle = 0;
  }
  return v3;
}

- (AMSEngagementRequest)initWithModel:(id)a3
{
  id v4 = a3;
  v5 = [(AMSEngagementRequest *)self init];
  if (v5)
  {
    uint64_t v6 = +[AMSEngagementUtils encodeModel:v4];
    modelData = v5->_modelData;
    v5->_modelData = (NSData *)v6;
  }
  return v5;
}

- (AMSEngagementRequest)initWithModel:(id)a3 destinationStyle:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = [(AMSEngagementRequest *)self init];
  if (v7)
  {
    uint64_t v8 = +[AMSEngagementUtils encodeModel:v6];
    modelData = v7->_modelData;
    v7->_modelData = (NSData *)v8;

    v7->_destinationStyle = a4;
  }

  return v7;
}

- (AMSEngagementRequest)initWithRequestDictionary:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(AMSEngagementRequest *)self init];
  if (v5)
  {
    id v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    objc_super v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = objc_opt_class();
      v9 = AMSLogKey();
      v10 = AMSHashIfNeeded(v4);
      *(_DWORD *)buf = 138543874;
      uint64_t v44 = v8;
      __int16 v45 = 2114;
      v46 = v9;
      __int16 v47 = 2114;
      v48 = v10;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Decoding engagement request from dict: %{public}@", buf, 0x20u);
    }
    account = [v4 objectForKeyedSubscript:@"account"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = account;

      if (!v12) {
        goto LABEL_11;
      }
      uint64_t v13 = [(AMSEngagementRequest *)v5 _accountFromDictionary:v12];
      account = v5->_account;
      v5->_account = (ACAccount *)v13;
    }
    else
    {
      id v12 = 0;
    }

LABEL_11:
    v42 = v12;
    clientData = [v4 objectForKeyedSubscript:@"clientData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = clientData;

      if (!v15)
      {
        v41 = 0;
LABEL_16:
        v17 = [v4 objectForKeyedSubscript:@"failOnDismiss"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = v17;

          if (v18) {
            v5->_failOnDismiss = [v18 BOOLValue];
          }
        }
        else
        {

          id v18 = 0;
        }
        logKey = [v4 objectForKeyedSubscript:@"logKey"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = logKey;

          if (!v20)
          {
            id v40 = 0;
LABEL_25:
            metricsOverlay = [v4 objectForKeyedSubscript:@"metricsOverlay"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v23 = metricsOverlay;

              if (!v23)
              {
                v24 = 0;
LABEL_30:
                v25 = [v4 objectForKeyedSubscript:@"destinationStyle"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v26 = v25;

                  if (v26) {
                    v5->_destinationStyle = [v26 integerValue];
                  }
                }
                else
                {

                  id v26 = 0;
                }
                originatingURL = [v4 objectForKeyedSubscript:@"originatingURL"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v28 = originatingURL;

                  if (!v28) {
                    goto LABEL_39;
                  }
                  uint64_t v29 = [MEMORY[0x1E4F1CB10] URLWithString:v28];
                  originatingURL = v5->_originatingURL;
                  v5->_originatingURL = (NSURL *)v29;
                }
                else
                {
                  id v28 = 0;
                }

LABEL_39:
                v30 = [v4 objectForKeyedSubscript:@"presentationStyle"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v31 = v30;

                  if (v31) {
                    v5->_presentationStyle = [v31 integerValue];
                  }
                }
                else
                {

                  id v31 = 0;
                }
                v32 = [v4 objectForKeyedSubscript:@"silentlyCheckURL"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v33 = v32;

                  if (v33) {
                    v5->_silentlyCheckURL = [v33 BOOLValue];
                  }
                }
                else
                {

                  id v33 = 0;
                }
                v34 = [v4 objectForKeyedSubscript:@"suppressInteractiveModalDismissal"];
                if (objc_opt_respondsToSelector())
                {
                  v35 = [v4 objectForKeyedSubscript:@"suppressInteractiveModalDismissal"];
                  v5->_suppressInteractiveModalDismissal = [v35 BOOLValue];
                }
                else
                {
                  v5->_suppressInteractiveModalDismissal = 0;
                }

                URL = [v4 objectForKeyedSubscript:@"URL"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v37 = URL;

                  if (!v37)
                  {
LABEL_55:

                    goto LABEL_56;
                  }
                  uint64_t v38 = [MEMORY[0x1E4F1CB10] URLWithString:v37];
                  URL = v5->_URL;
                  v5->_URL = (NSURL *)v38;
                }
                else
                {
                  id v37 = 0;
                }

                goto LABEL_55;
              }
              v24 = (NSDictionary *)v23;
              metricsOverlay = v5->_metricsOverlay;
              v5->_metricsOverlay = v24;
            }
            else
            {
              v24 = 0;
            }

            goto LABEL_30;
          }
          id v21 = v20;
          logKey = v5->_logKey;
          id v40 = v21;
          v5->_logKey = (NSString *)v21;
        }
        else
        {
          id v40 = 0;
        }

        goto LABEL_25;
      }
      v16 = (NSDictionary *)v15;
      clientData = v5->_clientData;
      v41 = v16;
      v5->_clientData = v16;
    }
    else
    {
      v41 = 0;
    }

    goto LABEL_16;
  }
LABEL_56:

  return v5;
}

- (AMSEngagementRequest)initWithJSONDictionary:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = objc_alloc_init(AMSEngagementRequest);
    objc_super v7 = [v5 objectForKeyedSubscript:@"failOnDismiss"];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [v5 objectForKeyedSubscript:@"failOnDismiss"];
      -[AMSEngagementRequest setFailOnDismiss:](v6, "setFailOnDismiss:", [v8 BOOLValue]);
    }
    else
    {
      [(AMSEngagementRequest *)v6 setFailOnDismiss:0];
    }

    v10 = [v5 objectForKeyedSubscript:@"clientData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    [(AMSEngagementRequest *)v6 setClientData:v11];
    id v12 = [v5 objectForKeyedSubscript:@"metricsOverlay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    [(AMSEngagementRequest *)v6 setMetricsOverlay:v13];
    v14 = [v5 objectForKeyedSubscript:@"destinationStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    -[AMSEngagementRequest setDestinationStyle:](v6, "setDestinationStyle:", [v15 integerValue]);
    v16 = [v5 objectForKeyedSubscript:@"suppressInteractiveModalDismissal"];
    if (objc_opt_respondsToSelector())
    {
      v17 = [v5 objectForKeyedSubscript:@"suppressInteractiveModalDismissal"];
      -[AMSEngagementRequest setSuppressInteractiveModalDismissal:](v6, "setSuppressInteractiveModalDismissal:", [v17 BOOLValue]);
    }
    else
    {
      [(AMSEngagementRequest *)v6 setSuppressInteractiveModalDismissal:0];
    }

    [(AMSEngagementRequest *)v6 setPresentationStyle:[(AMSEngagementRequest *)v6 _engagementPresentationStyleFromDictionary:v5]];
    id v18 = [v5 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v19 = 0;
      v9 = 0;
LABEL_31:

      goto LABEL_32;
    }
    id v19 = v18;

    if (!v19)
    {
      v9 = 0;
LABEL_32:

      goto LABEL_33;
    }
    id v20 = [MEMORY[0x1E4F1CB10] URLWithString:v19];
    [(AMSEngagementRequest *)v6 setURL:v20];

    id v21 = [v5 objectForKeyedSubscript:@"account"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v18 = 0;
      goto LABEL_29;
    }
    id v18 = v21;

    if (v18)
    {
      id v21 = [v18 objectForKeyedSubscript:@"dsid"];
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_29:

        goto LABEL_30;
      }
      v22 = [v18 objectForKeyedSubscript:@"dsid"];
      uint64_t v23 = [v22 integerValue];

      if (v23 != -1)
      {
        v24 = (void *)MEMORY[0x1E4F179C8];
        v25 = +[AMSProcessInfo currentProcess];
        id v21 = objc_msgSend(v24, "ams_sharedAccountStoreForClient:", v25);

        id v26 = [MEMORY[0x1E4F28ED0] numberWithInteger:v23];
        v27 = objc_msgSend(v21, "ams_iTunesAccountWithDSID:", v26);
        [(AMSEngagementRequest *)v6 setAccount:v27];

        goto LABEL_29;
      }
    }
LABEL_30:
    v9 = v6;
    goto LABEL_31;
  }
  v9 = 0;
LABEL_33:

  return v9;
}

- (void)applyOverlayMetrics:(id)a3
{
  if (self->_metricsOverlay) {
    metricsOverlay = self->_metricsOverlay;
  }
  else {
    metricsOverlay = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  self->_metricsOverlay = [(NSDictionary *)metricsOverlay ams_dictionaryByAddingEntriesFromDictionary:a3];
  MEMORY[0x1F41817F8]();
}

- (void)replaceOverlayMetrics:(id)a3
{
}

- (id)modelForClass:(Class)a3 error:(id *)a4
{
  id v6 = [(AMSEngagementRequest *)self modelData];
  objc_super v7 = +[AMSEngagementUtils modelFromData:v6 class:a3 error:a4];

  return v7;
}

- (id)_accountFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"dsid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;

    if (v5)
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v5, "integerValue"));
      goto LABEL_6;
    }
  }
  else
  {

    id v5 = 0;
  }
  uint64_t v6 = 0;
LABEL_6:
  objc_super v7 = [v3 objectForKeyedSubscript:@"username"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = 0;
  }

  v9 = [v3 objectForKeyedSubscript:@"accountPreSet"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  id v11 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v12 = v11;
  if (v6 | v8)
  {
    id v13 = objc_msgSend(v11, "ams_iTunesAccountWithAltDSID:DSID:username:", 0, v6, v8);
    if (!v13)
    {
      v14 = [v12 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17890]];
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F179B0]) initWithAccountType:v14];
    }
    id v15 = objc_msgSend(v13, "ams_DSID");

    if (!v15) {
      objc_msgSend(v13, "ams_setDSID:", v6);
    }
    v16 = [v13 username];

    if (!v16) {
      [v13 setUsername:v8];
    }
  }
  else if ([v10 isEqualToString:@"activeItunes"])
  {
    id v13 = objc_msgSend(v12, "ams_activeiTunesAccount");
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (AMSEngagementRequest)initWithCoder:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)AMSEngagementRequest;
  id v5 = [(AMSEngagementRequest *)&v29 init];
  if (v5)
  {
    uint64_t v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    objc_super v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = objc_opt_class();
      v9 = AMSLogKey();
      id v10 = [v4 debugDescription];
      id v11 = AMSHashIfNeeded(v10);
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v8;
      __int16 v32 = 2114;
      id v33 = v9;
      __int16 v34 = 2114;
      v35 = v11;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Decoding engagement request: %{public}@", buf, 0x20u);
    }
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account"];
    account = v5->_account;
    v5->_account = (ACAccount *)v12;

    v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"clientData"];
    clientData = v5->_clientData;
    v5->_clientData = (NSDictionary *)v15;

    v5->_failOnDismiss = [v4 decodeBoolForKey:@"failOnDismiss"];
    v5->_suppressInteractiveModalDismissal = [v4 decodeBoolForKey:@"suppressInteractiveModalDismissal"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"logKey"];
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v17;

    id v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"metricsOverlay"];
    metricsOverlay = v5->_metricsOverlay;
    v5->_metricsOverlay = (NSDictionary *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelData"];
    modelData = v5->_modelData;
    v5->_modelData = (NSData *)v22;

    v5->_destinationStyle = [v4 decodeIntegerForKey:@"destinationStyle"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatingURL"];
    originatingURL = v5->_originatingURL;
    v5->_originatingURL = (NSURL *)v24;

    v5->_presentationStyle = [v4 decodeIntegerForKey:@"presentationStyle"];
    v5->_silentlyCheckURL = [v4 decodeBoolForKey:@"silentlyCheckURL"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v26;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementRequest *)self account];
  [v4 encodeObject:v5 forKey:@"account"];

  uint64_t v6 = [(AMSEngagementRequest *)self clientData];
  [v4 encodeObject:v6 forKey:@"clientData"];

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSEngagementRequest failOnDismiss](self, "failOnDismiss"), @"failOnDismiss");
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSEngagementRequest suppressInteractiveModalDismissal](self, "suppressInteractiveModalDismissal"), @"suppressInteractiveModalDismissal");
  objc_super v7 = [(AMSEngagementRequest *)self logKey];
  [v4 encodeObject:v7 forKey:@"logKey"];

  uint64_t v8 = [(AMSEngagementRequest *)self metricsOverlay];
  [v4 encodeObject:v8 forKey:@"metricsOverlay"];

  v9 = [(AMSEngagementRequest *)self modelData];
  [v4 encodeObject:v9 forKey:@"modelData"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSEngagementRequest destinationStyle](self, "destinationStyle"), @"destinationStyle");
  id v10 = [(AMSEngagementRequest *)self originatingURL];
  [v4 encodeObject:v10 forKey:@"originatingURL"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSEngagementRequest presentationStyle](self, "presentationStyle"), @"presentationStyle");
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSEngagementRequest silentlyCheckURL](self, "silentlyCheckURL"), @"silentlyCheckURL");
  id v11 = [(AMSEngagementRequest *)self URL];
  [v4 encodeObject:v11 forKey:@"URL"];
}

- (int64_t)_engagementPresentationStyleFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 valueForKey:@"style"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;

    if (v5)
    {
LABEL_7:
      if (_MergedGlobals_104 != -1) {
        dispatch_once(&_MergedGlobals_104, &__block_literal_global_49);
      }
      uint64_t v6 = [(id)qword_1EB38D898 valueForKey:v5];
      objc_super v7 = v6;
      if (v6) {
        int64_t v8 = [v6 integerValue];
      }
      else {
        int64_t v8 = 0;
      }

      goto LABEL_14;
    }
  }
  else
  {
  }
  id v5 = [v3 valueForKeyPath:@"clientData.style"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v5;

    if (!v5)
    {
      int64_t v8 = 0;
      goto LABEL_15;
    }
    goto LABEL_7;
  }
  int64_t v8 = 0;
LABEL_14:

LABEL_15:
  return v8;
}

void __67__AMSEngagementRequest__engagementPresentationStyleFromDictionary___block_invoke()
{
  v0 = (void *)qword_1EB38D898;
  qword_1EB38D898 = (uint64_t)&unk_1EDD01A98;
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

- (BOOL)anonymousMetrics
{
  return self->_anonymousMetrics;
}

- (void)setAnonymousMetrics:(BOOL)a3
{
  self->_anonymousMetrics = a3;
}

- (NSDictionary)clientData
{
  return self->_clientData;
}

- (void)setClientData:(id)a3
{
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (BOOL)failOnDismiss
{
  return self->_failOnDismiss;
}

- (void)setFailOnDismiss:(BOOL)a3
{
  self->_failOnDismiss = a3;
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

- (NSURL)originatingURL
{
  return self->_originatingURL;
}

- (void)setOriginatingURL:(id)a3
{
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (BOOL)silentlyCheckURL
{
  return self->_silentlyCheckURL;
}

- (void)setSilentlyCheckURL:(BOOL)a3
{
  self->_silentlyCheckURL = a3;
}

- (int64_t)destinationStyle
{
  return self->_destinationStyle;
}

- (void)setDestinationStyle:(int64_t)a3
{
  self->_destinationStyle = a3;
}

- (BOOL)suppressInteractiveModalDismissal
{
  return self->_suppressInteractiveModalDismissal;
}

- (void)setSuppressInteractiveModalDismissal:(BOOL)a3
{
  self->_suppressInteractiveModalDismissal = a3;
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
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_originatingURL, 0);
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_clientData, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end