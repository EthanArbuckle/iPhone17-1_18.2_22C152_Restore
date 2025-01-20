@interface IDSHomeKitCloudRelayUserAccessTokensMessage
- (NSArray)accessoryRequests;
- (NSArray)responseAccessTokens;
- (NSString)serviceUserID;
- (NSString)userHandle;
- (NSString)userID;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (void)handleResponseDictionary:(id)a3;
- (void)setAccessoryRequests:(id)a3;
- (void)setResponseAccessTokens:(id)a3;
- (void)setServiceUserID:(id)a3;
- (void)setUserHandle:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation IDSHomeKitCloudRelayUserAccessTokensMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)IDSHomeKitCloudRelayUserAccessTokensMessage;
  id v4 = [(IDSHomeKitCloudRelayUserAccessTokensMessage *)&v12 copyWithZone:a3];
  v5 = [(IDSHomeKitCloudRelayUserAccessTokensMessage *)self subService];
  [v4 setSubService:v5];

  v6 = [(IDSHomeKitCloudRelayUserAccessTokensMessage *)self serviceUserID];
  [v4 setServiceUserID:v6];

  v7 = [(IDSHomeKitCloudRelayUserAccessTokensMessage *)self userID];
  [v4 setUserID:v7];

  v8 = [(IDSHomeKitCloudRelayUserAccessTokensMessage *)self userHandle];
  [v4 setUserHandle:v8];

  v9 = [(IDSHomeKitCloudRelayUserAccessTokensMessage *)self accessoryRequests];
  [v4 setAccessoryRequests:v9];

  v10 = [(IDSHomeKitCloudRelayUserAccessTokensMessage *)self responseAccessTokens];
  [v4 setResponseAccessTokens:v10];

  return v4;
}

- (id)additionalMessageHeaders
{
  v8.receiver = self;
  v8.super_class = (Class)IDSHomeKitCloudRelayUserAccessTokensMessage;
  v3 = [(IDSHomeKitCloudRelayUserAccessTokensMessage *)&v8 additionalMessageHeaders];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSHomeKitCloudRelayUserAccessTokensMessage *)self subService];
  if (v5)
  {
    CFDictionarySetValue(Mutable, @"x-id-sub-service", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B3F8();
  }

  v6 = [(IDSHomeKitCloudRelayUserAccessTokensMessage *)self serviceUserID];
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"x-service-user-id", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B370();
  }

  return Mutable;
}

- (id)messageBody
{
  v3 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(IDSHomeKitCloudRelayUserAccessTokensMessage *)self userID];
  if (v4)
  {
    CFDictionarySetValue(v3, @"user-id", v4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B508();
  }

  v5 = [(IDSHomeKitCloudRelayUserAccessTokensMessage *)self userHandle];
  if (v5)
  {
    CFDictionarySetValue(v3, @"user-handle", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B480();
  }

  v6 = [(IDSHomeKitCloudRelayUserAccessTokensMessage *)self accessoryRequests];
  if (v6) {
    CFDictionarySetValue(v3, @"tokens", v6);
  }

  return v3;
}

- (id)bagKey
{
  return @"id-get-user-token";
}

- (void)handleResponseDictionary:(id)a3
{
  uint64_t v4 = [a3 _arrayForKey:@"access-tokens"];
  if (v4) {
    [(IDSHomeKitCloudRelayUserAccessTokensMessage *)self setResponseAccessTokens:v4];
  }

  _objc_release_x1();
}

- (NSString)serviceUserID
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setServiceUserID:(id)a3
{
}

- (NSString)userID
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setUserID:(id)a3
{
}

- (NSString)userHandle
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setUserHandle:(id)a3
{
}

- (NSArray)accessoryRequests
{
  return (NSArray *)objc_getProperty(self, a2, 256, 1);
}

- (void)setAccessoryRequests:(id)a3
{
}

- (NSArray)responseAccessTokens
{
  return (NSArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setResponseAccessTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseAccessTokens, 0);
  objc_storeStrong((id *)&self->_accessoryRequests, 0);
  objc_storeStrong((id *)&self->_userHandle, 0);
  objc_storeStrong((id *)&self->_userID, 0);

  objc_storeStrong((id *)&self->_serviceUserID, 0);
}

@end