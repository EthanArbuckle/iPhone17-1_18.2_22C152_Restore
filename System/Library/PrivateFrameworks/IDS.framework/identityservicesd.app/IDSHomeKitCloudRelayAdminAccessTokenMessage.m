@interface IDSHomeKitCloudRelayAdminAccessTokenMessage
- (NSData)pairingToken;
- (NSData)responseAdminAcccessToken;
- (NSNumber)responseExpiry;
- (NSString)accessoryID;
- (NSString)responseAccessoryID;
- (NSString)serviceUserID;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (void)handleResponseDictionary:(id)a3;
- (void)setAccessoryID:(id)a3;
- (void)setPairingToken:(id)a3;
- (void)setResponseAccessoryID:(id)a3;
- (void)setResponseAdminAcccessToken:(id)a3;
- (void)setResponseExpiry:(id)a3;
- (void)setServiceUserID:(id)a3;
@end

@implementation IDSHomeKitCloudRelayAdminAccessTokenMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)IDSHomeKitCloudRelayAdminAccessTokenMessage;
  id v4 = [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)&v13 copyWithZone:a3];
  v5 = [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)self subService];
  [v4 setSubService:v5];

  v6 = [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)self serviceUserID];
  [v4 setServiceUserID:v6];

  v7 = [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)self accessoryID];
  [v4 setAccessoryID:v7];

  v8 = [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)self pairingToken];
  [v4 setPairingToken:v8];

  v9 = [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)self responseAccessoryID];
  [v4 setAccessoryID:v9];

  v10 = [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)self responseAdminAcccessToken];
  [v4 setResponseAdminAcccessToken:v10];

  v11 = [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)self responseExpiry];
  [v4 setResponseExpiry:v11];

  return v4;
}

- (id)additionalMessageHeaders
{
  v8.receiver = self;
  v8.super_class = (Class)IDSHomeKitCloudRelayAdminAccessTokenMessage;
  v3 = [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)&v8 additionalMessageHeaders];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)self subService];
  if (v5)
  {
    CFDictionarySetValue(Mutable, @"x-id-sub-service", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071E124();
  }

  v6 = [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)self serviceUserID];
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
  id v4 = [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)self accessoryID];
  if (v4)
  {
    CFDictionarySetValue(v3, @"accessory-id", v4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071E234();
  }

  v5 = [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)self pairingToken];
  if (v5)
  {
    CFDictionarySetValue(v3, @"pairing-token", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071E1AC();
  }

  return v3;
}

- (id)bagKey
{
  return @"id-get-admin-token";
}

- (void)handleResponseDictionary:(id)a3
{
  id v7 = a3;
  id v4 = [v7 _stringForKey:@"accessory-id"];
  if (v4) {
    [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)self setResponseAccessoryID:v4];
  }
  v5 = [v7 _dataForKey:@"access-token"];
  if (v5) {
    [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)self setResponseAdminAcccessToken:v5];
  }
  v6 = [v7 _numberForKey:@"expiry"];
  if (v6) {
    [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)self setResponseExpiry:v6];
  }
}

- (NSString)serviceUserID
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setServiceUserID:(id)a3
{
}

- (NSString)accessoryID
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAccessoryID:(id)a3
{
}

- (NSData)pairingToken
{
  return (NSData *)objc_getProperty(self, a2, 248, 1);
}

- (void)setPairingToken:(id)a3
{
}

- (NSString)responseAccessoryID
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setResponseAccessoryID:(id)a3
{
}

- (NSData)responseAdminAcccessToken
{
  return (NSData *)objc_getProperty(self, a2, 264, 1);
}

- (void)setResponseAdminAcccessToken:(id)a3
{
}

- (NSNumber)responseExpiry
{
  return (NSNumber *)objc_getProperty(self, a2, 272, 1);
}

- (void)setResponseExpiry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseExpiry, 0);
  objc_storeStrong((id *)&self->_responseAdminAcccessToken, 0);
  objc_storeStrong((id *)&self->_responseAccessoryID, 0);
  objc_storeStrong((id *)&self->_pairingToken, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);

  objc_storeStrong((id *)&self->_serviceUserID, 0);
}

@end