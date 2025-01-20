@interface IDSHomeKitCloudRelayServiceUserIDsMessage
- (NSArray)responseServiceUserIDs;
- (NSString)userID;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (void)handleResponseDictionary:(id)a3;
- (void)setResponseServiceUserIDs:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation IDSHomeKitCloudRelayServiceUserIDsMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IDSHomeKitCloudRelayServiceUserIDsMessage;
  id v4 = [(IDSHomeKitCloudRelayServiceUserIDsMessage *)&v9 copyWithZone:a3];
  v5 = [(IDSHomeKitCloudRelayServiceUserIDsMessage *)self subService];
  [v4 setSubService:v5];

  v6 = [(IDSHomeKitCloudRelayServiceUserIDsMessage *)self responseServiceUserIDs];
  [v4 setResponseServiceUserIDs:v6];

  v7 = [(IDSHomeKitCloudRelayServiceUserIDsMessage *)self userID];
  [v4 setUserID:v7];

  return v4;
}

- (id)additionalMessageHeaders
{
  v7.receiver = self;
  v7.super_class = (Class)IDSHomeKitCloudRelayServiceUserIDsMessage;
  v3 = [(IDSHomeKitCloudRelayServiceUserIDsMessage *)&v7 additionalMessageHeaders];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSHomeKitCloudRelayServiceUserIDsMessage *)self subService];
  if (v5)
  {
    CFDictionarySetValue(Mutable, @"x-id-sub-service", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100720468();
  }

  return Mutable;
}

- (id)bagKey
{
  return @"id-get-service-user-id";
}

- (id)messageBody
{
  v3 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(IDSHomeKitCloudRelayServiceUserIDsMessage *)self userID];
  if (v4)
  {
    CFDictionarySetValue(v3, @"user-id", v4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100720504();
  }

  return v3;
}

- (void)handleResponseDictionary:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IDSHomeKitCloudRelayServiceUserIDsMessage;
  id v4 = a3;
  [(IDSHomeKitCloudRelayServiceUserIDsMessage *)&v9 handleResponseDictionary:v4];
  v5 = objc_msgSend(v4, "_stringForKey:", @"service-user-id", v9.receiver, v9.super_class);
  v6 = [v4 _numberForKey:@"expiry"];

  if (v5)
  {
    Mutable = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (!Mutable) {
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    CFDictionarySetValue(Mutable, @"service-user-id", v5);
    if (v6) {
      CFDictionarySetValue(Mutable, @"expiry", v6);
    }
    v8 = +[NSArray arrayWithObject:Mutable];
    [(IDSHomeKitCloudRelayServiceUserIDsMessage *)self setResponseServiceUserIDs:v8];
  }
}

- (NSArray)responseServiceUserIDs
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setResponseServiceUserIDs:(id)a3
{
}

- (NSString)userID
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setUserID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userID, 0);

  objc_storeStrong((id *)&self->_responseServiceUserIDs, 0);
}

@end