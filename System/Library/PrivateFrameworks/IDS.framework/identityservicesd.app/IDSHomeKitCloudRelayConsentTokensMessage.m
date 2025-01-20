@interface IDSHomeKitCloudRelayConsentTokensMessage
- (NSArray)accessoryIDs;
- (NSArray)responseConsentTokens;
- (NSString)adminID;
- (NSString)expiry;
- (NSString)serviceUserID;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (void)handleResponseDictionary:(id)a3;
- (void)setAccessoryIDs:(id)a3;
- (void)setAdminID:(id)a3;
- (void)setExpiry:(id)a3;
- (void)setResponseConsentTokens:(id)a3;
- (void)setServiceUserID:(id)a3;
@end

@implementation IDSHomeKitCloudRelayConsentTokensMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)IDSHomeKitCloudRelayConsentTokensMessage;
  id v4 = [(IDSHomeKitCloudRelayConsentTokensMessage *)&v12 copyWithZone:a3];
  v5 = [(IDSHomeKitCloudRelayConsentTokensMessage *)self subService];
  [v4 setSubService:v5];

  v6 = [(IDSHomeKitCloudRelayConsentTokensMessage *)self serviceUserID];
  [v4 setServiceUserID:v6];

  v7 = [(IDSHomeKitCloudRelayConsentTokensMessage *)self accessoryIDs];
  [v4 setAccessoryIDs:v7];

  v8 = [(IDSHomeKitCloudRelayConsentTokensMessage *)self adminID];
  [v4 setAdminID:v8];

  v9 = [(IDSHomeKitCloudRelayConsentTokensMessage *)self expiry];
  [v4 setExpiry:v9];

  v10 = [(IDSHomeKitCloudRelayConsentTokensMessage *)self responseConsentTokens];
  [v4 setResponseConsentTokens:v10];

  return v4;
}

- (id)additionalMessageHeaders
{
  v8.receiver = self;
  v8.super_class = (Class)IDSHomeKitCloudRelayConsentTokensMessage;
  v3 = [(IDSHomeKitCloudRelayConsentTokensMessage *)&v8 additionalMessageHeaders];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSHomeKitCloudRelayConsentTokensMessage *)self subService];
  if (v5)
  {
    CFDictionarySetValue(Mutable, @"x-id-sub-service", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071E124();
  }

  v6 = [(IDSHomeKitCloudRelayConsentTokensMessage *)self serviceUserID];
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"x-service-user-id", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071E09C();
  }

  return Mutable;
}

- (id)messageBody
{
  v3 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(IDSHomeKitCloudRelayConsentTokensMessage *)self accessoryIDs];
  if (v4)
  {
    CFDictionarySetValue(v3, @"accessory-ids", v4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071ED84();
  }

  v5 = [(IDSHomeKitCloudRelayConsentTokensMessage *)self adminID];
  if (v5)
  {
    CFDictionarySetValue(v3, @"admin-id", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071ECFC();
  }

  v6 = [(IDSHomeKitCloudRelayConsentTokensMessage *)self expiry];
  if (v6) {
    CFDictionarySetValue(v3, @"expiry", v6);
  }

  return v3;
}

- (id)bagKey
{
  return @"id-get-consent-token";
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = [a3 _arrayForKey:@"consent-tokens"];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v4 = [(IDSHomeKitCloudRelayConsentTokensMessage *)self setResponseConsentTokens:v4];
    id v5 = v6;
  }

  _objc_release_x1(v4, v5);
}

- (NSString)serviceUserID
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setServiceUserID:(id)a3
{
}

- (NSArray)accessoryIDs
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAccessoryIDs:(id)a3
{
}

- (NSString)adminID
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setAdminID:(id)a3
{
}

- (NSString)expiry
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setExpiry:(id)a3
{
}

- (NSArray)responseConsentTokens
{
  return (NSArray *)objc_getProperty(self, a2, 272, 1);
}

- (void)setResponseConsentTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseConsentTokens, 0);
  objc_storeStrong((id *)&self->responseConsentTokens, 0);
  objc_storeStrong((id *)&self->_expiry, 0);
  objc_storeStrong((id *)&self->_adminID, 0);
  objc_storeStrong((id *)&self->_accessoryIDs, 0);

  objc_storeStrong((id *)&self->_serviceUserID, 0);
}

@end