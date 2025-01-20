@interface IDSAuthenticateUsersMessage
- (BOOL)allowsServerProvidedLenientAnisetteTimeout;
- (BOOL)requiresPushTokenKeys;
- (BOOL)wantsBAASigning;
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsHTTPHeaders;
- (IDSAuthenticateUsersMessage)init;
- (NSArray)authenticationResponses;
- (NSData)pushToken;
- (NSMutableArray)requests;
- (NSString)realm;
- (double)anisetteHeadersTimeout;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)_addRequestWithID:(id)a3 cert:(id)a4 sig:(id)a5 csr:(id)a6 tag:(id)a7;
- (void)addRequestWithID:(id)a3 cert:(id)a4;
- (void)addRequestWithID:(id)a3 sig:(id)a4 csr:(id)a5 tag:(id)a6;
- (void)handleResponseDictionary:(id)a3;
- (void)setAuthenticationResponses:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setRealm:(id)a3;
- (void)setRequests:(id)a3;
@end

@implementation IDSAuthenticateUsersMessage

- (IDSAuthenticateUsersMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSAuthenticateUsersMessage;
  v2 = [(IDSAuthenticateUsersMessage *)&v6 init];
  if (v2)
  {
    IMGetConferenceSettings();
    id v3 = 0;
    v4 = [v3 lastObject];
    [(IDSAuthenticateUsersMessage *)v2 setTopic:v4];

    [(IDSAuthenticateUsersMessage *)v2 setWantsResponse:1];
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)IDSAuthenticateUsersMessage;
  id v4 = [(IDSAuthenticateUsersMessage *)&v11 copyWithZone:a3];
  v5 = [(IDSAuthenticateUsersMessage *)self realm];
  [v4 setRealm:v5];

  objc_super v6 = [(IDSAuthenticateUsersMessage *)self requests];
  id v7 = [v6 copy];
  [v4 setRequests:v7];

  v8 = [(IDSAuthenticateUsersMessage *)self authenticationResponses];
  id v9 = [v8 copy];
  [v4 setAuthenticationResponses:v9];

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

- (BOOL)requiresPushTokenKeys
{
  return 1;
}

- (id)bagKey
{
  return @"id-authenticate-multiple-users";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [v2 addObject:@"authentication-requests"];
  [v2 addObject:@"push-token"];

  return v2;
}

- (id)messageBody
{
  v8.receiver = self;
  v8.super_class = (Class)IDSAuthenticateUsersMessage;
  id v3 = [(IDSAuthenticateUsersMessage *)&v8 messageBody];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSAuthenticateUsersMessage *)self requests];
  if (v5)
  {
    CFDictionarySetValue(Mutable, @"authentication-requests", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071A864();
  }

  objc_super v6 = [(IDSAuthenticateUsersMessage *)self pushToken];
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"push-token", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071A7DC();
  }

  return Mutable;
}

- (id)additionalMessageHeaders
{
  v7.receiver = self;
  v7.super_class = (Class)IDSAuthenticateUsersMessage;
  id v2 = [(IDSAuthenticateUsersMessage *)&v7 additionalMessageHeaders];
  Mutable = (__CFDictionary *)[v2 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  id v4 = _IDSIDProtocolVersionNumber();
  v5 = [v4 stringValue];

  if (v5)
  {
    CFDictionarySetValue(Mutable, @"x-protocol-version", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071A8EC();
  }

  return Mutable;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (BOOL)allowsServerProvidedLenientAnisetteTimeout
{
  return 1;
}

- (void)addRequestWithID:(id)a3 cert:(id)a4
{
}

- (void)addRequestWithID:(id)a3 sig:(id)a4 csr:(id)a5 tag:(id)a6
{
}

- (void)_addRequestWithID:(id)a3 cert:(id)a4 sig:(id)a5 csr:(id)a6 tag:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!self->_requests)
  {
    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    requests = self->_requests;
    self->_requests = v17;
  }
  v19 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v20 = v12;
  if (v20)
  {
    CFDictionarySetValue(v19, @"user-id", v20);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071A9FC();
  }

  id v21 = v15;
  if (v21)
  {
    CFDictionarySetValue(v19, @"csr", v21);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071A974();
  }

  if (v14) {
    CFDictionarySetValue(v19, @"sig", v14);
  }
  if (v13) {
    CFDictionarySetValue(v19, @"auth-cert", v13);
  }
  if (v16) {
    CFDictionarySetValue(v19, @"tag", v16);
  }
  [(NSMutableArray *)self->_requests addObject:v19];
}

- (void)handleResponseDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v15 = v3;
  id obj = [v3 _arrayForKey:@"authentication-responses"];
  id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      objc_super v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v8);
        v10 = objc_alloc_init(IDSAuthenticateUsersResponse);
        objc_super v11 = [v9 _dataForKey:@"cert"];
        [(IDSAuthenticateUsersResponse *)v10 setCert:v11];

        id v12 = [v9 _numberForKey:@"status"];
        -[IDSAuthenticateUsersResponse setResponseCode:](v10, "setResponseCode:", [v12 integerValue]);

        id v13 = [v9 _stringForKey:@"user-id"];
        [(IDSAuthenticateUsersResponse *)v10 setUserID:v13];

        [v4 addObject:v10];
        objc_super v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  [(IDSAuthenticateUsersMessage *)self setAuthenticationResponses:v4];
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSString)realm
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setRealm:(id)a3
{
}

- (NSMutableArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (NSArray)authenticationResponses
{
  return self->_authenticationResponses;
}

- (void)setAuthenticationResponses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationResponses, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_realm, 0);

  objc_storeStrong((id *)&self->_pushToken, 0);
}

@end