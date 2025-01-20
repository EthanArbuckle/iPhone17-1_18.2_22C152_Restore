@interface AASecondaryAuthenticationResponse
- (AASecondaryAuthenticationResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSData)buddyML;
- (NSString)secondFactorToken;
@end

@implementation AASecondaryAuthenticationResponse

- (AASecondaryAuthenticationResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AASecondaryAuthenticationResponse;
  v8 = [(AAResponse *)&v13 initWithHTTPResponse:v6 data:v7];
  if (v8)
  {
    v9 = [v6 allHeaderFields];
    uint64_t v10 = [v9 valueForKey:@"X-Apple-2SV-Authenticate"];
    secondFactorToken = v8->_secondFactorToken;
    v8->_secondFactorToken = (NSString *)v10;

    objc_storeStrong((id *)&v8->_buddyML, a4);
  }

  return v8;
}

- (NSString)secondFactorToken
{
  return self->_secondFactorToken;
}

- (NSData)buddyML
{
  return self->_buddyML;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buddyML, 0);

  objc_storeStrong((id *)&self->_secondFactorToken, 0);
}

@end