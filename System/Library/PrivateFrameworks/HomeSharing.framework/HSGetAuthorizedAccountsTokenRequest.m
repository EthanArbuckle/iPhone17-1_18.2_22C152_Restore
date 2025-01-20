@interface HSGetAuthorizedAccountsTokenRequest
+ (id)requestWithDSID:(unint64_t)a3 deviceGUID:(id)a4;
- (HSGetAuthorizedAccountsTokenRequest)initWithDSID:(unint64_t)a3 deviceGUID:(id)a4;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation HSGetAuthorizedAccountsTokenRequest

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = +[HSResponse responseWithResponse:a3];
  v4 = [v3 responseData];
  v5 = +[HSResponseDataParser parseResponseData:v4];

  v6 = [v5 objectForKey:@"com.apple.itunes.drm-token-data"];
  [v3 setTokenData:v6];

  return v3;
}

- (HSGetAuthorizedAccountsTokenRequest)initWithDSID:(unint64_t)a3 deviceGUID:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HSGetAuthorizedAccountsTokenRequest;
  v7 = [(HSRequest *)&v10 initWithAction:@"get-authorized-account-token"];
  if (v7)
  {
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
    [(HSRequest *)v7 setValue:v8 forArgument:@"dsid"];

    [(HSRequest *)v7 setValue:v6 forArgument:@"device-machine-guid"];
  }

  return v7;
}

+ (id)requestWithDSID:(unint64_t)a3 deviceGUID:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithDSID:a3 deviceGUID:v6];

  return v7;
}

@end