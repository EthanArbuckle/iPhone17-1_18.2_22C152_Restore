@interface IDSValidateCredentialsMessage
- (NSData)authenticationDataSig;
- (NSNumber)responseOrigin;
- (NSNumber)responseStatus;
- (NSString)authenticationDataAuthToken;
- (NSString)authenticationDataUserID;
- (NSString)responseMessage;
- (NSString)responseUserID;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)handleResponseDictionary:(id)a3;
- (void)setAuthenticationDataAuthToken:(id)a3;
- (void)setAuthenticationDataSig:(id)a3;
- (void)setAuthenticationDataUserID:(id)a3;
- (void)setResponseMessage:(id)a3;
- (void)setResponseOrigin:(id)a3;
- (void)setResponseStatus:(id)a3;
- (void)setResponseUserID:(id)a3;
@end

@implementation IDSValidateCredentialsMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)IDSValidateCredentialsMessage;
  id v4 = [(IDSValidateCredentialsMessage *)&v13 copyWithZone:a3];
  v5 = [(IDSValidateCredentialsMessage *)self authenticationDataSig];
  [v4 setAuthenticationDataSig:v5];

  v6 = [(IDSValidateCredentialsMessage *)self authenticationDataAuthToken];
  [v4 setAuthenticationDataAuthToken:v6];

  v7 = [(IDSValidateCredentialsMessage *)self authenticationDataUserID];
  [v4 setAuthenticationDataUserID:v7];

  v8 = [(IDSValidateCredentialsMessage *)self responseMessage];
  [v4 setResponseMessage:v8];

  v9 = [(IDSValidateCredentialsMessage *)self responseUserID];
  [v4 setResponseUserID:v9];

  v10 = [(IDSValidateCredentialsMessage *)self responseStatus];
  [v4 setResponseStatus:v10];

  v11 = [(IDSValidateCredentialsMessage *)self responseOrigin];
  [v4 setResponseOrigin:v11];

  return v4;
}

- (id)additionalMessageHeaders
{
  v8.receiver = self;
  v8.super_class = (Class)IDSValidateCredentialsMessage;
  v3 = [(IDSValidateCredentialsMessage *)&v8 additionalMessageHeaders];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSValidateCredentialsMessage *)self pushCertificate];
  v6 = [v5 _FTStringFromBaseData];

  if (v6)
  {
    CFDictionarySetValue(Mutable, @"x-push-cert", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100710D2C();
  }

  return Mutable;
}

- (id)messageBody
{
  v3 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(IDSValidateCredentialsMessage *)self authenticationDataUserID];
  if (v4)
  {
    CFDictionarySetValue(v3, @"user-id", v4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100710DC8();
  }

  v5 = [(IDSValidateCredentialsMessage *)self authenticationDataSig];
  if (v5) {
    CFDictionarySetValue(v3, @"sig", v5);
  }

  v6 = [(IDSValidateCredentialsMessage *)self authenticationDataAuthToken];
  if (v6) {
    CFDictionarySetValue(v3, @"auth-token", v6);
  }

  id v7 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v3, @"authentication-data", 0);

  return v7;
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);

  return v2;
}

- (id)bagKey
{
  return @"id-validate-credentials";
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 _stringForKey:@"message"];
  [(IDSValidateCredentialsMessage *)self setResponseMessage:v5];

  v6 = [v4 _stringForKey:@"user-id"];
  [(IDSValidateCredentialsMessage *)self setResponseUserID:v6];

  id v7 = [v4 _numberForKey:@"status"];
  [(IDSValidateCredentialsMessage *)self setResponseStatus:v7];

  id v8 = [v4 _numberForKey:@"origin"];

  [(IDSValidateCredentialsMessage *)self setResponseOrigin:v8];
}

- (NSData)authenticationDataSig
{
  return (NSData *)objc_getProperty(self, a2, 232, 1);
}

- (void)setAuthenticationDataSig:(id)a3
{
}

- (NSString)authenticationDataAuthToken
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAuthenticationDataAuthToken:(id)a3
{
}

- (NSString)authenticationDataUserID
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setAuthenticationDataUserID:(id)a3
{
}

- (NSString)responseMessage
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setResponseMessage:(id)a3
{
}

- (NSString)responseUserID
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setResponseUserID:(id)a3
{
}

- (NSNumber)responseStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 272, 1);
}

- (void)setResponseStatus:(id)a3
{
}

- (NSNumber)responseOrigin
{
  return (NSNumber *)objc_getProperty(self, a2, 280, 1);
}

- (void)setResponseOrigin:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseOrigin, 0);
  objc_storeStrong((id *)&self->_responseStatus, 0);
  objc_storeStrong((id *)&self->_responseUserID, 0);
  objc_storeStrong((id *)&self->_responseMessage, 0);
  objc_storeStrong((id *)&self->_authenticationDataUserID, 0);
  objc_storeStrong((id *)&self->_authenticationDataAuthToken, 0);

  objc_storeStrong((id *)&self->_authenticationDataSig, 0);
}

@end