@interface IDSAuthenticateMessage
- (BOOL)allowsServerProvidedLenientAnisetteTimeout;
- (BOOL)requiresPushTokenKeys;
- (BOOL)wantsBAASigning;
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsHTTPHeaders;
- (IDSAuthenticateMessage)init;
- (NSData)csr;
- (NSData)responseCertificate;
- (NSDictionary)authenticationInfo;
- (NSString)realm;
- (NSString)responseUserID;
- (NSString)userID;
- (double)anisetteHeadersTimeout;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)handleResponseDictionary:(id)a3;
- (void)setAuthenticationInfo:(id)a3;
- (void)setCsr:(id)a3;
- (void)setRealm:(id)a3;
- (void)setResponseCertificate:(id)a3;
- (void)setResponseUserID:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation IDSAuthenticateMessage

- (IDSAuthenticateMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSAuthenticateMessage;
  v2 = [(IDSAuthenticateMessage *)&v6 init];
  if (v2)
  {
    IMGetConferenceSettings();
    id v3 = 0;
    v4 = [v3 lastObject];
    [(IDSAuthenticateMessage *)v2 setTopic:v4];

    [(IDSAuthenticateMessage *)v2 setWantsResponse:1];
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)IDSAuthenticateMessage;
  id v4 = [(IDSAuthenticateMessage *)&v12 copyWithZone:a3];
  v5 = [(IDSAuthenticateMessage *)self realm];
  [v4 setRealm:v5];

  objc_super v6 = [(IDSAuthenticateMessage *)self csr];
  [v4 setCsr:v6];

  v7 = [(IDSAuthenticateMessage *)self userID];
  [v4 setUserID:v7];

  v8 = [(IDSAuthenticateMessage *)self authenticationInfo];
  [v4 setAuthenticationInfo:v8];

  v9 = [(IDSAuthenticateMessage *)self responseUserID];
  [v4 setResponseUserID:v9];

  v10 = [(IDSAuthenticateMessage *)self responseCertificate];
  [v4 setResponseCertificate:v10];

  return v4;
}

- (BOOL)wantsBagKey
{
  return 1;
}

- (BOOL)wantsHTTPHeaders
{
  return 1;
}

- (BOOL)wantsCompressedBody
{
  return 1;
}

- (BOOL)wantsBinaryPush
{
  return 1;
}

- (BOOL)wantsBAASigning
{
  return 1;
}

- (int64_t)command
{
  return 96;
}

- (int64_t)responseCommand
{
  return 97;
}

- (id)bagKey
{
  v2 = [(IDSAuthenticateMessage *)self realm];
  id v3 = +[NSString stringWithFormat:@"id-authenticate-%@", v2];

  return v3;
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [v2 addObject:@"csr"];
  [v2 addObject:@"realm-user-id"];
  [v2 addObject:@"authentication-data"];

  return v2;
}

- (id)messageBody
{
  v9.receiver = self;
  v9.super_class = (Class)IDSAuthenticateMessage;
  id v3 = [(IDSAuthenticateMessage *)&v9 messageBody];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSAuthenticateMessage *)self csr];
  if (v5)
  {
    CFDictionarySetValue(Mutable, @"csr", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070BA40();
  }

  objc_super v6 = [(IDSAuthenticateMessage *)self userID];
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"realm-user-id", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B9B8();
  }

  v7 = [(IDSAuthenticateMessage *)self authenticationInfo];
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"authentication-data", v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B930();
  }

  return Mutable;
}

- (id)additionalMessageHeaders
{
  v9.receiver = self;
  v9.super_class = (Class)IDSAuthenticateMessage;
  id v3 = [(IDSAuthenticateMessage *)&v9 additionalMessageHeaders];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = _IDSIDProtocolVersionNumber();
  objc_super v6 = [v5 stringValue];

  if (v6)
  {
    CFDictionarySetValue(Mutable, @"x-protocol-version", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070BAC8();
  }

  v7 = [(IDSAuthenticateMessage *)self dsAuthID];
  if (v7) {
    CFDictionarySetValue(Mutable, @"x-ds-client-id", v7);
  }

  return Mutable;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (BOOL)allowsServerProvidedLenientAnisetteTimeout
{
  id v2 = [(IDSAuthenticateMessage *)self realm];
  unsigned __int8 v3 = [v2 isEqualToString:@"phone-number"];

  return v3;
}

- (BOOL)requiresPushTokenKeys
{
  return 0;
}

- (void)handleResponseDictionary:(id)a3
{
  id v8 = a3;
  if (_IMWillLog())
  {
    id v7 = v8;
    _IMAlwaysLog();
  }
  id v4 = objc_msgSend(v8, "objectForKey:", @"cert", v7);
  [(IDSAuthenticateMessage *)self setResponseCertificate:v4];

  v5 = [v8 objectForKey:@"user-id"];
  [(IDSAuthenticateMessage *)self setResponseUserID:v5];

  objc_super v6 = [v8 objectForKey:@"alert"];
  [(IDSAuthenticateMessage *)self setResponseAlertInfo:v6];
}

- (NSString)realm
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setRealm:(id)a3
{
}

- (NSData)csr
{
  return (NSData *)objc_getProperty(self, a2, 240, 1);
}

- (void)setCsr:(id)a3
{
}

- (NSDictionary)authenticationInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (void)setAuthenticationInfo:(id)a3
{
}

- (NSString)userID
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setUserID:(id)a3
{
}

- (NSData)responseCertificate
{
  return (NSData *)objc_getProperty(self, a2, 264, 1);
}

- (void)setResponseCertificate:(id)a3
{
}

- (NSString)responseUserID
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setResponseUserID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseUserID, 0);
  objc_storeStrong((id *)&self->_responseCertificate, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_authenticationInfo, 0);
  objc_storeStrong((id *)&self->_csr, 0);

  objc_storeStrong((id *)&self->_realm, 0);
}

@end