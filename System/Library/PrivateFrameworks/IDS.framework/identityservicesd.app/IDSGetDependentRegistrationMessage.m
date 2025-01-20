@interface IDSGetDependentRegistrationMessage
- (BOOL)requiresPushTokenKeys;
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsExtraTimeoutRetry;
- (BOOL)wantsHTTPHeaders;
- (IDSGetDependentRegistrationMessage)init;
- (NSArray)responseRegistrations;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int)maxTimeoutRetries;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)handleResponseDictionary:(id)a3;
- (void)setResponseRegistrations:(id)a3;
@end

@implementation IDSGetDependentRegistrationMessage

- (IDSGetDependentRegistrationMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSGetDependentRegistrationMessage;
  v2 = [(IDSGetDependentRegistrationMessage *)&v6 init];
  if (v2)
  {
    IMGetConferenceSettings();
    id v3 = 0;
    v4 = [v3 lastObject];
    [(IDSGetDependentRegistrationMessage *)v2 setTopic:v4];

    [(IDSGetDependentRegistrationMessage *)v2 setWantsResponse:1];
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IDSGetDependentRegistrationMessage;
  id v4 = [(IDSGetDependentRegistrationMessage *)&v8 copyWithZone:a3];
  v5 = [(IDSGetDependentRegistrationMessage *)self service];
  [v4 setService:v5];

  objc_super v6 = [(IDSGetDependentRegistrationMessage *)self responseRegistrations];
  [v4 setResponseRegistrations:v6];

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

- (int64_t)command
{
  return 96;
}

- (int64_t)responseCommand
{
  return 97;
}

- (BOOL)wantsExtraTimeoutRetry
{
  return 1;
}

- (int)maxTimeoutRetries
{
  return 2;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (id)bagKey
{
  return +[NSString stringWithFormat:@"id-get-dependent-registrations"];
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);

  return v2;
}

- (id)messageBody
{
  v7.receiver = self;
  v7.super_class = (Class)IDSGetDependentRegistrationMessage;
  id v3 = [(IDSGetDependentRegistrationMessage *)&v7 messageBody];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSGetDependentRegistrationMessage *)self service];
  if (v5) {
    CFDictionarySetValue(Mutable, @"service", v5);
  }

  return Mutable;
}

- (BOOL)requiresPushTokenKeys
{
  return 1;
}

- (void)handleResponseDictionary:(id)a3
{
  id v7 = a3;
  if (_IMWillLog())
  {
    id v6 = v7;
    _IMAlwaysLog();
  }
  id v4 = objc_msgSend(v7, "objectForKey:", @"registrations", v6);
  [(IDSGetDependentRegistrationMessage *)self setResponseRegistrations:v4];

  v5 = [v7 objectForKey:@"alert"];
  [(IDSGetDependentRegistrationMessage *)self setResponseAlertInfo:v5];
}

- (NSArray)responseRegistrations
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setResponseRegistrations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end