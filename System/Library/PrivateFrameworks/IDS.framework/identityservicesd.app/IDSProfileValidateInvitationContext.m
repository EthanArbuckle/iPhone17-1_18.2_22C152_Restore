@interface IDSProfileValidateInvitationContext
- (BOOL)wantsBAASigning;
- (BOOL)wantsExtraTimeoutRetry;
- (IDSProfileValidateInvitationContext)init;
- (NSDictionary)responseExtraInfo;
- (NSString)basePhoneNumber;
- (NSString)regionID;
- (NSString)responseBasePhoneNumber;
- (NSString)responseRegionID;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int)maxTimeoutRetries;
- (void)handleResponseDictionary:(id)a3;
- (void)setBasePhoneNumber:(id)a3;
- (void)setRegionID:(id)a3;
- (void)setResponseBasePhoneNumber:(id)a3;
- (void)setResponseExtraInfo:(id)a3;
- (void)setResponseRegionID:(id)a3;
@end

@implementation IDSProfileValidateInvitationContext

- (IDSProfileValidateInvitationContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)IDSProfileValidateInvitationContext;
  v2 = [(IDSProfileMessage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IDSProfileValidateInvitationContext *)v2 setTimeout:120.0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)IDSProfileValidateInvitationContext;
  id v4 = [(IDSProfileMessage *)&v11 copyWithZone:a3];
  objc_super v5 = [(IDSProfileValidateInvitationContext *)self basePhoneNumber];
  [v4 setBasePhoneNumber:v5];

  v6 = [(IDSProfileValidateInvitationContext *)self regionID];
  [v4 setRegionID:v6];

  v7 = [(IDSProfileValidateInvitationContext *)self responseBasePhoneNumber];
  [v4 setResponseBasePhoneNumber:v7];

  v8 = [(IDSProfileValidateInvitationContext *)self responseRegionID];
  [v4 setResponseRegionID:v8];

  v9 = [(IDSProfileValidateInvitationContext *)self responseExtraInfo];
  [v4 setResponseExtraInfo:v9];

  return v4;
}

- (BOOL)wantsExtraTimeoutRetry
{
  return 1;
}

- (int)maxTimeoutRetries
{
  return 2;
}

- (BOOL)wantsBAASigning
{
  return 1;
}

- (id)bagKey
{
  return @"vc-profile-validate-invitation-context";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [v2 addObject:@"base-phone-number"];
  [v2 addObject:@"region-id"];

  return v2;
}

- (id)messageBody
{
  v3 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(IDSProfileValidateInvitationContext *)self basePhoneNumber];
  if (v4)
  {
    CFDictionarySetValue(v3, @"base-phone-number", v4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100712F5C();
  }

  objc_super v5 = [(IDSProfileValidateInvitationContext *)self regionID];
  if (v5)
  {
    CFDictionarySetValue(v3, @"region-id", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100712EC0();
  }

  return v3;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  if (_IMWillLog())
  {
    id v8 = v4;
    _IMAlwaysLog();
  }
  v9.receiver = self;
  v9.super_class = (Class)IDSProfileValidateInvitationContext;
  -[IDSProfileMessage handleResponseDictionary:](&v9, "handleResponseDictionary:", v4, v8);
  objc_super v5 = [v4 objectForKey:@"region-id"];
  [(IDSProfileValidateInvitationContext *)self setResponseRegionID:v5];

  v6 = [v4 objectForKey:@"base-phone-number"];
  [(IDSProfileValidateInvitationContext *)self setResponseBasePhoneNumber:v6];

  v7 = [v4 objectForKey:@"extra"];
  [(IDSProfileValidateInvitationContext *)self setResponseExtraInfo:v7];
}

- (NSString)basePhoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setBasePhoneNumber:(id)a3
{
}

- (NSString)regionID
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setRegionID:(id)a3
{
}

- (NSString)responseBasePhoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setResponseBasePhoneNumber:(id)a3
{
}

- (NSString)responseRegionID
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (void)setResponseRegionID:(id)a3
{
}

- (NSDictionary)responseExtraInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 312, 1);
}

- (void)setResponseExtraInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseExtraInfo, 0);
  objc_storeStrong((id *)&self->_responseRegionID, 0);
  objc_storeStrong((id *)&self->_responseBasePhoneNumber, 0);
  objc_storeStrong((id *)&self->_regionID, 0);

  objc_storeStrong((id *)&self->_basePhoneNumber, 0);
}

@end