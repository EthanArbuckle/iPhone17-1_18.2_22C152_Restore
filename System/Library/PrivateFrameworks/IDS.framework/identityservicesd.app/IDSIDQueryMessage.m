@interface IDSIDQueryMessage
- (BOOL)allowDualDelivery;
- (BOOL)hasRequiredKeys:(id *)a3;
- (BOOL)isForced;
- (BOOL)requiresPushTokenKeys;
- (BOOL)resultExpected;
- (BOOL)wantsBodySignature;
- (BOOL)wantsHTTPGet;
- (BOOL)wantsManagedRetries;
- (IDSIDQueryMessage)init;
- (NSArray)uris;
- (NSDictionary)responseIdentities;
- (NSString)requiredForMessaging;
- (NSString)weight;
- (double)anisetteHeadersTimeout;
- (id)additionalMessageHeaders;
- (id)additionalQueryStringParameters;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataUsageBundleIdentifier;
- (id)messageBody;
- (id)requiredKeys;
- (void)handleResponseDictionary:(id)a3;
- (void)setIsForced:(BOOL)a3;
- (void)setRequiredForMessaging:(id)a3;
- (void)setResponseIdentities:(id)a3;
- (void)setResultExpected:(BOOL)a3;
- (void)setURIs:(id)a3;
- (void)setWeight:(id)a3;
@end

@implementation IDSIDQueryMessage

- (IDSIDQueryMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)IDSIDQueryMessage;
  v2 = [(IDSIDQueryMessage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IDSIDQueryMessage *)v2 setTimeout:20.0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)IDSIDQueryMessage;
  id v4 = [(IDSIDQueryMessage *)&v10 copyWithZone:a3];
  objc_super v5 = [(IDSIDQueryMessage *)self uris];
  [v4 setURIs:v5];

  v6 = [(IDSIDQueryMessage *)self weight];
  [v4 setWeight:v6];

  v7 = [(IDSIDQueryMessage *)self responseIdentities];
  [v4 setResponseIdentities:v7];

  [(IDSIDQueryMessage *)self timeout];
  objc_msgSend(v4, "setTimeout:");
  v8 = [(IDSIDQueryMessage *)self requiredForMessaging];
  [v4 setRequiredForMessaging:v8];

  objc_msgSend(v4, "setResultExpected:", -[IDSIDQueryMessage resultExpected](self, "resultExpected"));
  objc_msgSend(v4, "setIsForced:", -[IDSIDQueryMessage isForced](self, "isForced"));
  return v4;
}

- (id)additionalQueryStringParameters
{
  v7.receiver = self;
  v7.super_class = (Class)IDSIDQueryMessage;
  v3 = [(IDSIDQueryMessage *)&v7 additionalQueryStringParameters];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  objc_super v5 = [(IDSIDQueryMessage *)self weight];
  if (v5) {
    CFDictionarySetValue(Mutable, @"weight", v5);
  }

  return Mutable;
}

- (id)additionalMessageHeaders
{
  v9.receiver = self;
  v9.super_class = (Class)IDSIDQueryMessage;
  v3 = [(IDSIDQueryMessage *)&v9 additionalMessageHeaders];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  objc_super v5 = [(IDSIDQueryMessage *)self service];
  if (v5) {
    CFDictionarySetValue(Mutable, @"x-id-service", v5);
  }

  v6 = [(IDSIDQueryMessage *)self subService];
  if (v6) {
    CFDictionarySetValue(Mutable, @"x-id-sub-service", v6);
  }

  objc_super v7 = [(IDSIDQueryMessage *)self requiredForMessaging];
  if (v7) {
    CFDictionarySetValue(Mutable, @"x-required-for-message", v7);
  }

  if (self->_resultExpected) {
    CFDictionarySetValue(Mutable, @"x-result-expected", @"true");
  }
  if (self->_isForced) {
    CFDictionarySetValue(Mutable, @"x-is-forced-query", @"true");
  }

  return Mutable;
}

- (BOOL)wantsManagedRetries
{
  return 0;
}

- (BOOL)wantsHTTPGet
{
  return 0;
}

- (BOOL)allowDualDelivery
{
  return 1;
}

- (BOOL)wantsBodySignature
{
  return 1;
}

- (id)dataUsageBundleIdentifier
{
  v2 = [(IDSIDQueryMessage *)self service];
  unsigned int v3 = [v2 isEqualToString:@"com.apple.madrid"];

  if (v3) {
    id v4 = kFZTextAppBundleIdentifier;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)bagKey
{
  return @"id-query";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);

  return v2;
}

- (id)messageBody
{
  unsigned int v3 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(IDSIDQueryMessage *)self uris];
  if (v4)
  {
    CFDictionarySetValue(v3, @"uris", v4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071B418();
  }

  return v3;
}

- (BOOL)hasRequiredKeys:(id *)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = [(IDSIDQueryMessage *)self selfURI];

  if (!v6)
  {
    _IMWarn();
    [v5 addObject:@"self URI"];
  }
  objc_super v7 = [(IDSIDQueryMessage *)self uris];
  id v8 = [v7 count];

  if (!v8)
  {
    _IMWarn();
    [v5 addObject:@"uris"];
  }
  if (*a3 && [v5 count]) {
    *a3 = v5;
  }
  if ([v5 count])
  {
    BOOL v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IDSIDQueryMessage;
    BOOL v9 = [(IDSIDQueryMessage *)&v11 hasRequiredKeys:a3];
  }

  return v9;
}

- (BOOL)requiresPushTokenKeys
{
  return 1;
}

- (void)handleResponseDictionary:(id)a3
{
  id v6 = a3;
  if (_IMWillLog())
  {
    id v5 = v6;
    _IMAlwaysLog();
  }
  id v4 = objc_msgSend(v6, "_dictionaryForKey:", @"results", v5);
  if (v4) {
    [(IDSIDQueryMessage *)self setResponseIdentities:v4];
  }
}

- (double)anisetteHeadersTimeout
{
  return 0.1;
}

- (NSArray)uris
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setURIs:(id)a3
{
}

- (NSString)weight
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setWeight:(id)a3
{
}

- (NSDictionary)responseIdentities
{
  return (NSDictionary *)objc_getProperty(self, a2, 256, 1);
}

- (void)setResponseIdentities:(id)a3
{
}

- (NSString)requiredForMessaging
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setRequiredForMessaging:(id)a3
{
}

- (BOOL)resultExpected
{
  return self->_resultExpected;
}

- (void)setResultExpected:(BOOL)a3
{
  self->_resultExpected = a3;
}

- (BOOL)isForced
{
  return self->_isForced;
}

- (void)setIsForced:(BOOL)a3
{
  self->_isForced = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredForMessaging, 0);
  objc_storeStrong((id *)&self->_responseIdentities, 0);
  objc_storeStrong((id *)&self->_weight, 0);

  objc_storeStrong((id *)&self->_uris, 0);
}

@end