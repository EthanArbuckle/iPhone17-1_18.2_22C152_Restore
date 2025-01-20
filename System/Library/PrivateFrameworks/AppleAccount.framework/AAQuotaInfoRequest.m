@interface AAQuotaInfoRequest
+ (Class)responseClass;
- (AAQuotaInfoRequest)initWithAccount:(id)a3;
- (ACAccount)account;
- (id)initDetailedRequestWithAccount:(id)a3;
- (id)urlRequest;
- (id)urlString;
@end

@implementation AAQuotaInfoRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v3 = [(ACAccount *)self->_account aa_personID];

  if (v3)
  {
    if (self->_isDetailedRequest) {
      v4 = @"storageInfoURL";
    }
    else {
      v4 = @"quotaInfoURL";
    }
    account = self->_account;
    v6 = v4;
    v7 = [(ACAccount *)account propertiesForDataclass:@"com.apple.Dataclass.Quota"];
    v8 = [v7 objectForKey:v6];

    v9 = [(ACAccount *)self->_account aa_personID];
    v10 = [v8 stringByReplacingOccurrencesOfString:@"$DS_PRS_ID$" withString:v9];

    v11 = +[AADeviceInfo udid];
    v12 = [v10 stringByReplacingOccurrencesOfString:@"$UDID$" withString:v11];

    v13 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
    v14 = [v12 stringByAddingPercentEncodingWithAllowedCharacters:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (AAQuotaInfoRequest)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAQuotaInfoRequest;
  v6 = [(AAQuotaInfoRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)initDetailedRequestWithAccount:(id)a3
{
  id result = [(AAQuotaInfoRequest *)self initWithAccount:a3];
  if (result) {
    *((unsigned char *)result + 64) = 1;
  }
  return result;
}

- (id)urlRequest
{
  v13.receiver = self;
  v13.super_class = (Class)AAQuotaInfoRequest;
  v3 = [(AARequest *)&v13 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"GET"];
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  id v5 = +[AADeviceInfo udid];
  [v4 setValue:v5 forHTTPHeaderField:@"X-Client-UDID"];

  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 infoDictionary];

  v8 = NSString;
  objc_super v9 = [v7 objectForKeyedSubscript:@"CFBundleName"];
  v10 = [v7 objectForKeyedSubscript:@"CFBundleVersion"];
  v11 = [v8 stringWithFormat:@"%@/%@ %@/%@", v9, v10, @"ProductName", @"ProductVersion"];

  [v4 addValue:v11 forHTTPHeaderField:@"User-agent"];

  return v4;
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
}

@end