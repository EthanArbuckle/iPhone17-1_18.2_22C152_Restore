@interface AALoginAccountResponse
+ (BOOL)supportsSecureCoding;
- (AALoginAccountResponse)initWithCoder:(id)a3;
- (AALoginAccountResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (AALoginAccountResponse)initWithHttpStatus:(int64_t)a3 responseBody:(id)a4;
- (AALoginResponseAppleAccountInfo)appleAccountInfo;
- (AALoginResponseDataclasses)dataclasses;
- (AALoginResponseiCloudTokens)iCloudTokens;
- (NSDictionary)responseForDelegates;
- (NSNumber)status;
- (NSString)dsid;
- (NSString)statusMessage;
- (id)convertToLoginDelegatesResponse;
- (id)convertToProvisioningResponse;
- (id)responseParametersForServiceIdentifier:(id)a3;
- (void)_parseResponse:(int64_t)a3 responseBody:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AALoginAccountResponse

- (AALoginAccountResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AALoginAccountResponse;
  v4 = [(AAResponse *)&v9 initWithHTTPResponse:a3 data:a4 bodyIsPlist:1];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(NSHTTPURLResponse *)v4->super.super._httpResponse statusCode];
    v7 = [(AAResponse *)v5 responseDictionary];
    [(AALoginAccountResponse *)v5 _parseResponse:v6 responseBody:v7];
  }
  return v5;
}

- (AALoginAccountResponse)initWithHttpStatus:(int64_t)a3 responseBody:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AALoginAccountResponse;
  v7 = [(AALoginAccountResponse *)&v10 init];
  v8 = v7;
  if (v7) {
    [(AALoginAccountResponse *)v7 _parseResponse:a3 responseBody:v6];
  }

  return v8;
}

- (void)_parseResponse:(int64_t)a3 responseBody:(id)a4
{
  if (a3 == 200)
  {
    id v6 = [a4 objectForKey:@"status"];
    status = self->_status;
    self->_status = v6;

    v8 = [(AAResponse *)self responseDictionary];
    objc_super v9 = [v8 objectForKey:@"status-message"];
    statusMessage = self->_statusMessage;
    self->_statusMessage = v9;

    v11 = [(AAResponse *)self responseDictionary];
    v12 = [v11 objectForKey:@"delegates"];
    responseForDelegates = self->_responseForDelegates;
    self->_responseForDelegates = v12;

    v14 = [(AAResponse *)self responseDictionary];
    v15 = [v14 objectForKey:@"dsid"];
    dsid = self->_dsid;
    self->_dsid = v15;

    id v29 = [(NSDictionary *)self->_responseForDelegates objectForKeyedSubscript:@"com.apple.mobileme"];
    v17 = [v29 objectForKeyedSubscript:@"status-message"];
    if (v29 && ![v17 integerValue])
    {
      v18 = [v29 objectForKeyedSubscript:@"service-data"];
      v19 = [v18 objectForKey:@"appleAccountInfo"];
      v20 = (void *)[v19 copy];

      v21 = [[AALoginResponseAppleAccountInfo alloc] initWithDictionary:v20];
      appleAccountInfo = self->_appleAccountInfo;
      self->_appleAccountInfo = v21;

      v23 = [v18 objectForKey:@"tokens"];
      v24 = (void *)[v23 copy];

      v25 = [[AALoginResponseiCloudTokens alloc] initWithTokens:v24];
      iCloudTokens = self->_iCloudTokens;
      self->_iCloudTokens = v25;

      v27 = [[AALoginResponseDataclasses alloc] initWithiCloudServiceData:v18];
      dataclasses = self->_dataclasses;
      self->_dataclasses = v27;
    }
  }
}

- (id)responseParametersForServiceIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(AALoginAccountResponse *)self responseForDelegates];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)convertToProvisioningResponse
{
  v2 = [(AALoginAccountResponse *)self responseParametersForServiceIdentifier:@"com.apple.mobileme"];
  v3 = [v2 objectForKeyedSubscript:@"service-data"];

  id v4 = (void *)[v3 mutableCopy];
  [v4 setObject:v3 forKeyedSubscript:@"com.apple.mobileme"];
  v5 = [[AAProvisioningResponse alloc] initWithDictionary:v4];

  return v5;
}

- (id)convertToLoginDelegatesResponse
{
  v3 = [AALoginDelegatesResponse alloc];
  id v4 = [(AAResponse *)self httpResponse];
  v5 = [(AAResponse *)self data];
  id v6 = [(AAResponse *)v3 initWithHTTPResponse:v4 data:v5];

  return v6;
}

- (AALoginAccountResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AALoginAccountResponse;
  return [(AACodableResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AALoginAccountResponse;
  [(AACodableResponse *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)status
{
  return self->_status;
}

- (NSString)statusMessage
{
  return self->_statusMessage;
}

- (NSDictionary)responseForDelegates
{
  return self->_responseForDelegates;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (AALoginResponseAppleAccountInfo)appleAccountInfo
{
  return self->_appleAccountInfo;
}

- (AALoginResponseiCloudTokens)iCloudTokens
{
  return self->_iCloudTokens;
}

- (AALoginResponseDataclasses)dataclasses
{
  return self->_dataclasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataclasses, 0);
  objc_storeStrong((id *)&self->_iCloudTokens, 0);
  objc_storeStrong((id *)&self->_appleAccountInfo, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_responseForDelegates, 0);
  objc_storeStrong((id *)&self->_statusMessage, 0);

  objc_storeStrong((id *)&self->_status, 0);
}

@end