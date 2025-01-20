@interface AKSRPRequest
+ (BOOL)_performRequestWithURL:(id)a3 context:(id)a4 error:(__CFError *)a5;
- (AKSRPContextHelper)contextHelper;
- (AKSRPRequest)initWithURL:(id)a3 contextHelper:(id)a4 completionHandler:(id)a5;
- (NSDictionary)additionalHeaders;
- (NSDictionary)dispatchingInfo;
- (NSURL)url;
- (id)_tokenGenerationInfoForContext:(id)a3;
- (int64_t)responseCode;
- (void)_attachAdditionalHeaders:(id)a3 toContextHelper:(id)a4;
- (void)_performRequestWithContext:(id)a3 responseHandler:(id)a4;
- (void)executeWithResponseHandler:(id)a3;
- (void)handleResponseCode;
- (void)invalidateWithError:(id)a3;
- (void)setAdditionalHeaders:(id)a3;
- (void)setResponseCode:(int64_t)a3;
@end

@implementation AKSRPRequest

- (AKSRPRequest)initWithURL:(id)a3 contextHelper:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AKSRPRequest;
  v12 = [(AKSRPRequest *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeStrong((id *)&v13->_contextHelper, a4);
    id v14 = objc_retainBlock(v11);
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = v14;

    criticalTokenError = v13->_criticalTokenError;
    v13->_criticalTokenError = 0;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.akd.srp-request", v17);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v18;
  }
  return v13;
}

- (NSDictionary)dispatchingInfo
{
  id v3 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
  v4 = [(AKSRPContextHelper *)self->_contextHelper client];
  v5 = [v4 name];
  [v3 setObject:v5 forKeyedSubscript:@"capp"];

  v6 = [(AKSRPContextHelper *)self->_contextHelper authContext];
  v7 = [v6 _proxiedAppName];
  [v3 setObject:v7 forKeyedSubscript:@"papp"];

  v8 = [(AKSRPContextHelper *)self->_contextHelper authContext];
  id v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 serviceType]);
  [v3 setObject:v9 forKeyedSubscript:@"svct"];

  id v10 = [v3 copy];

  return (NSDictionary *)v10;
}

- (void)executeWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = [(AKSRPRequest *)self additionalHeaders];
  [(AKSRPRequest *)self _attachAdditionalHeaders:v5 toContextHelper:self->_contextHelper];

  contextHelper = self->_contextHelper;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C0074;
  v8[3] = &unk_100227DB0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(AKSRPContextHelper *)contextHelper authenticationParametersWithCompletion:v8];
}

- (void)handleResponseCode
{
  int64_t v3 = [(AKSRPRequest *)self responseCode];
  id v5 = [(AKSRPRequest *)self contextHelper];
  id v4 = [v5 altDSID];
  +[AKCommonResponseCodeHandler handleResponseCode:v3 altDSID:v4];
}

- (void)invalidateWithError:(id)a3
{
}

- (void)_performRequestWithContext:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C0424;
  block[3] = &unk_100227A18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (id)_tokenGenerationInfoForContext:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  id v6 = [v5 configurationParameters];

  id v7 = [v6 objectForKeyedSubscript:kAppleIDAuthSupportClientProvidedData];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  id v9 = +[AKAccountManager sharedInstance];
  id v10 = [(AKSRPContextHelper *)self->_contextHelper altDSID];
  id v11 = [v9 authKitAccountWithAltDSID:v10 error:0];

  objc_opt_class();
  id v12 = [v8 objectForKeyedSubscript:AKContinutationKeyGenKey];
  id v13 = 0;
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }

  id v14 = [v13 BOOLValue];
  objc_opt_class();
  id v15 = [v8 objectForKeyedSubscript:AKPasscodeIndicatorKey];
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  unsigned int v17 = [v16 BOOLValue];
  dispatch_queue_t v18 = [v9 passwordResetTokenForAccount:v11];
  id v19 = objc_alloc_init((Class)NSMutableDictionary);
  v20 = +[NSNumber numberWithBool:v14];
  [v19 setObject:v20 forKeyedSubscript:@"ckgen"];

  if (v17)
  {
    uint64_t v21 = [(AKSRPContextHelper *)self->_contextHelper password];
    if (v21) {
      int64_t v3 = (void *)v21;
    }
    else {
      int64_t v3 = 0;
    }
    if (v21) {
      BOOL v22 = v18 == 0;
    }
    else {
      BOOL v22 = 0;
    }
  }
  else
  {
    BOOL v22 = 0;
  }
  v23 = +[NSNumber numberWithInt:v22];
  [v19 setObject:v23 forKeyedSubscript:@"prkgen"];

  if (v17) {
  uint64_t v24 = AKAppProvidedContextKey;
  }
  v25 = [v8 objectForKeyedSubscript:AKAppProvidedContextKey];

  if (v25)
  {
    v26 = [v8 objectForKeyedSubscript:v24];
    [v19 setObject:v26 forKeyedSubscript:v24];

    uint64_t v27 = AKEphemeralAuthKey;
    v28 = [v8 objectForKeyedSubscript:AKEphemeralAuthKey];
    v29 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v28 BOOLValue]);
    [v19 setObject:v29 forKeyedSubscript:v27];

    uint64_t v30 = AKShortLivedTokenKey;
    v31 = [v8 objectForKeyedSubscript:AKShortLivedTokenKey];
    [v19 setObject:v31 forKeyedSubscript:v30];
  }

  return v19;
}

+ (BOOL)_performRequestWithURL:(id)a3 context:(id)a4 error:(__CFError *)a5
{
  id v6 = a3;
  [a4 underlyingContext];
  char v7 = AppleIDAuthSupportAuthenticate();

  return v7;
}

- (void)_attachAdditionalHeaders:(id)a3 toContextHelper:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if ([v9 count])
  {
    id v6 = +[NSMutableDictionary dictionaryWithDictionary:v9];
    char v7 = [v5 additionalHeaders];
    [v6 addEntriesFromDictionary:v7];

    id v8 = [v6 copy];
    [v5 setAdditionalHeaders:v8];
  }
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(int64_t)a3
{
  self->_responseCode = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (AKSRPContextHelper)contextHelper
{
  return self->_contextHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextHelper, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_criticalTokenError, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end