@interface AMSFinanceResponse
+ (id)valueForProtocolKey:(id)a3 inResponse:(id)a4;
- (ACAccount)account;
- (AMSFinanceAuthenticateResponse)cachedAuthenticateResponse;
- (AMSFinanceDialogResponse)cachedDialogResponse;
- (AMSFinancePaymentSheetResponse)cachedPaymentSheetResponse;
- (AMSFinanceResponse)initWithTaskInfo:(id)a3 decodedObject:(id)a4;
- (AMSURLTaskInfo)taskInfo;
- (BOOL)supportedProtocolVersion;
- (NSArray)actions;
- (NSArray)pingURLs;
- (NSDictionary)responseDictionary;
- (NSError)serverError;
- (NSURL)versionMismatchURL;
- (id)_performerForActionDictionary;
- (id)_performerForAuthenticate;
- (id)_performerForCreditDisplay;
- (id)_performerForDialog;
- (id)_performerForExpressCheckout;
- (id)_performerForPaymentSheetWithDelegateAuthentication:(BOOL)a3;
- (id)_valueForProtocolKey:(id)a3;
- (int64_t)dialogKind;
- (void)setCachedAuthenticateResponse:(id)a3;
- (void)setCachedDialogResponse:(id)a3;
- (void)setCachedPaymentSheetResponse:(id)a3;
- (void)setResponseDictionary:(id)a3;
- (void)setTaskInfo:(id)a3;
@end

@implementation AMSFinanceResponse

- (AMSFinanceResponse)initWithTaskInfo:(id)a3 decodedObject:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSFinanceResponse;
  v9 = [(AMSFinanceResponse *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_taskInfo, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v8;
    }
    else {
      v11 = 0;
    }
    objc_storeStrong((id *)&v10->_responseDictionary, v11);
    v10->_dialogKind = +[AMSFinanceDialogResponse dialogKindForTaskInfo:v10->_taskInfo withResponseDictionary:v10->_responseDictionary];
  }

  return v10;
}

- (BOOL)supportedProtocolVersion
{
  v2 = [(AMSFinanceResponse *)self _valueForProtocolKey:@"store-version"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 objectForKey:@"1.0"];
    if (v3
      || ([v2 objectForKey:@"*"], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v4 = [v3 objectForKey:@"redirect-url"];
      BOOL v5 = v4 == 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (NSError)serverError
{
  id v3 = [(AMSFinanceResponse *)self _valueForProtocolKey:@"failureType"];
  if (objc_opt_respondsToSelector())
  {
    v4 = [(AMSFinanceResponse *)self _valueForProtocolKey:@"failureType"];
    BOOL v5 = (void *)[v4 longLongValue];

    if (!v5) {
      goto LABEL_8;
    }
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v5];
    [v3 setObject:v6 forKeyedSubscript:@"AMSServerErrorCode"];

    id v7 = [(AMSFinanceResponse *)self _valueForProtocolKey:@"m-allowed"];
    [v3 setObject:v7 forKeyedSubscript:@"AMSServerAllowed"];

    id v8 = [(AMSFinanceResponse *)self responseDictionary];
    [v3 setObject:v8 forKeyedSubscript:@"AMSServerPayload"];

    v9 = [(AMSFinanceResponse *)self _valueForProtocolKey:@"customerMessage"];
    if (![(__CFString *)v9 length])
    {

      v9 = @"The server encountered an error";
    }
    BOOL v5 = AMSCustomError(@"AMSErrorDomain", 305, @"Server Error", v9, v3, 0);
  }
  else
  {
    BOOL v5 = 0;
  }

LABEL_8:
  return (NSError *)v5;
}

- (NSArray)pingURLs
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(AMSFinanceResponse *)self _valueForProtocolKey:@"pings"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [(AMSFinanceResponse *)self _valueForProtocolKey:@"ping"];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, 0);

    id v3 = (void *)v5;
  }
  v6 = [MEMORY[0x1E4F1CA48] array];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          objc_super v13 = [v12 host];

          if (v13) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  return (NSArray *)v6;
}

- (id)_valueForProtocolKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSFinanceResponse *)self responseDictionary];
  v6 = +[AMSFinanceResponse valueForProtocolKey:v4 inResponse:v5];

  return v6;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

+ (id)valueForProtocolKey:(id)a3 inResponse:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKey:@"protocol"];
  uint64_t v8 = [v7 objectForKey:v5];

  if (!v8)
  {
    uint64_t v8 = [v6 objectForKey:v5];
  }

  return v8;
}

- (NSArray)actions
{
  switch([(AMSFinanceResponse *)self dialogKind])
  {
    case 1:
    case 5:
      uint64_t v3 = [(AMSFinanceResponse *)self _performerForDialog];
      goto LABEL_9;
    case 2:
      uint64_t v3 = [(AMSFinanceResponse *)self _performerForAuthenticate];
      goto LABEL_9;
    case 3:
    case 4:
      id v4 = self;
      uint64_t v5 = 0;
      goto LABEL_7;
    case 6:
      id v4 = self;
      uint64_t v5 = 1;
LABEL_7:
      uint64_t v3 = [(AMSFinanceResponse *)v4 _performerForPaymentSheetWithDelegateAuthentication:v5];
      goto LABEL_9;
    case 7:
      uint64_t v3 = [(AMSFinanceResponse *)self _performerForExpressCheckout];
LABEL_9:
      id v6 = (void *)v3;
      break;
    default:
      id v6 = 0;
      break;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_msgSend(v7, "ams_addNullableObject:", v6);
  uint64_t v8 = [(AMSFinanceResponse *)self _performerForActionDictionary];
  objc_msgSend(v7, "ams_addNullableObject:", v8);

  uint64_t v9 = [(AMSFinanceResponse *)self _performerForCreditDisplay];
  objc_msgSend(v7, "ams_addNullableObject:", v9);

  return (NSArray *)v7;
}

- (int64_t)dialogKind
{
  return self->_dialogKind;
}

- (id)_performerForCreditDisplay
{
  uint64_t v3 = [(AMSFinanceResponse *)self _valueForProtocolKey:@"creditDisplay"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(AMSFinanceResponse *)self account];
    uint64_t v5 = [(AMSFinanceResponse *)self taskInfo];
    id v6 = +[AMSFinanceActionResponse actionWithUpdatedCreditString:v3 account:v4 taskInfo:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_performerForActionDictionary
{
  uint64_t v3 = [(AMSFinanceResponse *)self _valueForProtocolKey:@"action"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(AMSFinanceResponse *)self taskInfo];
    uint64_t v5 = +[AMSFinanceActionResponse actionWithActionDictionary:v3 taskInfo:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_cachedPaymentSheetResponse, 0);
  objc_storeStrong((id *)&self->_cachedDialogResponse, 0);
  objc_storeStrong((id *)&self->_cachedAuthenticateResponse, 0);
}

- (ACAccount)account
{
  uint64_t v3 = [(AMSFinanceResponse *)self _valueForProtocolKey:@"dsPersonId"];
  if (!v3)
  {
    uint64_t v3 = [(AMSFinanceResponse *)self _valueForProtocolKey:@"dsid"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "integerValue"));

    uint64_t v3 = (void *)v4;
  }
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F179C8];
    id v6 = [(AMSFinanceResponse *)self taskInfo];
    id v7 = [v6 properties];
    uint64_t v8 = [v7 clientInfo];
    uint64_t v9 = objc_msgSend(v5, "ams_sharedAccountStoreForProcessInfo:", v8);

    uint64_t v10 = objc_msgSend(v9, "ams_iTunesAccountWithDSID:", v3);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return (ACAccount *)v10;
}

- (NSURL)versionMismatchURL
{
  v2 = [(AMSFinanceResponse *)self _valueForProtocolKey:@"store-version"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 objectForKey:@"1.0"];
    if (!v3)
    {
      uint64_t v3 = [v2 objectForKey:@"*"];
    }
    uint64_t v4 = [v3 objectForKey:@"redirect-url"];
    if (v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSURL *)v5;
}

- (id)_performerForAuthenticate
{
  uint64_t v3 = [(AMSFinanceResponse *)self cachedAuthenticateResponse];

  if (v3)
  {
    uint64_t v4 = [(AMSFinanceResponse *)self cachedAuthenticateResponse];
  }
  else
  {
    if ([(AMSFinanceResponse *)self dialogKind] == 2)
    {
      uint64_t v5 = [AMSFinanceAuthenticateResponse alloc];
      id v6 = [(AMSFinanceResponse *)self responseDictionary];
      id v7 = [(AMSFinanceResponse *)self taskInfo];
      uint64_t v4 = [(AMSFinanceAuthenticateResponse *)v5 initWithResponseDictionary:v6 taskInfo:v7];
    }
    else
    {
      uint64_t v4 = 0;
    }
    [(AMSFinanceResponse *)self setCachedAuthenticateResponse:v4];
  }
  return v4;
}

- (id)_performerForDialog
{
  uint64_t v3 = [(AMSFinanceResponse *)self cachedDialogResponse];

  if (v3)
  {
    uint64_t v4 = [(AMSFinanceResponse *)self cachedDialogResponse];
    goto LABEL_10;
  }
  int64_t v5 = [(AMSFinanceResponse *)self dialogKind];
  if (v5 == 1)
  {
    uint64_t v10 = [AMSFinanceDialogResponse alloc];
    id v7 = [(AMSFinanceResponse *)self responseDictionary];
    uint64_t v8 = [(AMSFinanceResponse *)self taskInfo];
    uint64_t v9 = [(AMSFinanceDialogResponse *)v10 initWithResponseDictionary:v7 kind:1 taskInfo:v8];
  }
  else
  {
    if (v5 != 5)
    {
      uint64_t v4 = 0;
      goto LABEL_9;
    }
    id v6 = [AMSFinanceVerifyPurchaseResponse alloc];
    id v7 = [(AMSFinanceResponse *)self responseDictionary];
    uint64_t v8 = [(AMSFinanceResponse *)self taskInfo];
    uint64_t v9 = [(AMSFinanceVerifyPurchaseResponse *)v6 initWithPayload:v7 taskInfo:v8];
  }
  uint64_t v4 = (void *)v9;

LABEL_9:
  [(AMSFinanceResponse *)self setCachedDialogResponse:v4];
LABEL_10:
  return v4;
}

- (id)_performerForPaymentSheetWithDelegateAuthentication:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(AMSFinanceResponse *)self cachedPaymentSheetResponse];

  if (v5)
  {
    int64_t v5 = [(AMSFinanceResponse *)self cachedPaymentSheetResponse];
  }
  else
  {
    unint64_t v6 = [(AMSFinanceResponse *)self dialogKind];
    if (v6 <= 6 && ((1 << v6) & 0x58) != 0)
    {
      BOOL v7 = v6 == 4;
      uint64_t v8 = [AMSFinancePaymentSheetResponse alloc];
      uint64_t v9 = [(AMSFinanceResponse *)self responseDictionary];
      uint64_t v10 = [(AMSFinanceResponse *)self taskInfo];
      int64_t v5 = [(AMSFinancePaymentSheetResponse *)v8 initWithResponseDictionary:v9 confirmationOnly:v7 delegateAuthenticationRequired:v3 biometricSignatureRequired:1 taskInfo:v10];
    }
    [(AMSFinanceResponse *)self setCachedPaymentSheetResponse:v5];
  }
  return v5;
}

- (id)_performerForExpressCheckout
{
  BOOL v3 = [AMSFinanceExpressCheckoutResponse alloc];
  uint64_t v4 = [(AMSFinanceResponse *)self responseDictionary];
  int64_t v5 = [(AMSFinanceResponse *)self taskInfo];
  unint64_t v6 = [(AMSFinanceExpressCheckoutResponse *)v3 initWithResponseDictionary:v4 taskInfo:v5];

  return v6;
}

- (AMSFinanceAuthenticateResponse)cachedAuthenticateResponse
{
  return self->_cachedAuthenticateResponse;
}

- (void)setCachedAuthenticateResponse:(id)a3
{
}

- (AMSFinanceDialogResponse)cachedDialogResponse
{
  return self->_cachedDialogResponse;
}

- (void)setCachedDialogResponse:(id)a3
{
}

- (AMSFinancePaymentSheetResponse)cachedPaymentSheetResponse
{
  return self->_cachedPaymentSheetResponse;
}

- (void)setCachedPaymentSheetResponse:(id)a3
{
}

- (void)setResponseDictionary:(id)a3
{
}

- (AMSURLTaskInfo)taskInfo
{
  return self->_taskInfo;
}

- (void)setTaskInfo:(id)a3
{
}

@end