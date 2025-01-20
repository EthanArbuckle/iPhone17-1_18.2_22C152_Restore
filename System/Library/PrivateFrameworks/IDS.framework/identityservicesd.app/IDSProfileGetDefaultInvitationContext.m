@interface IDSProfileGetDefaultInvitationContext
- (BOOL)responseValidated;
- (BOOL)wantsBAASigning;
- (IDSProfileGetDefaultInvitationContext)init;
- (NSDictionary)responseExtraInfo;
- (NSString)responseBasePhoneNumber;
- (NSString)responseRegionID;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)handleResponseDictionary:(id)a3;
- (void)setResponseBasePhoneNumber:(id)a3;
- (void)setResponseExtraInfo:(id)a3;
- (void)setResponseRegionID:(id)a3;
- (void)setResponseValidated:(BOOL)a3;
@end

@implementation IDSProfileGetDefaultInvitationContext

- (IDSProfileGetDefaultInvitationContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)IDSProfileGetDefaultInvitationContext;
  v2 = [(IDSProfileMessage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IDSProfileGetDefaultInvitationContext *)v2 setTimeout:240.0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IDSProfileGetDefaultInvitationContext;
  id v4 = [(IDSProfileMessage *)&v9 copyWithZone:a3];
  objc_super v5 = [(IDSProfileGetDefaultInvitationContext *)self responseBasePhoneNumber];
  [v4 setResponseBasePhoneNumber:v5];

  v6 = [(IDSProfileGetDefaultInvitationContext *)self responseRegionID];
  [v4 setResponseRegionID:v6];

  v7 = [(IDSProfileGetDefaultInvitationContext *)self responseExtraInfo];
  [v4 setResponseExtraInfo:v7];

  objc_msgSend(v4, "setResponseValidated:", -[IDSProfileGetDefaultInvitationContext responseValidated](self, "responseValidated"));
  return v4;
}

- (id)bagKey
{
  return @"vc-profile-get-default-invitation-context";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);

  return v2;
}

- (id)messageBody
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);

  return v2;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (BOOL)wantsBAASigning
{
  return 1;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  if (_IMWillLog())
  {
    id v9 = v4;
    _IMAlwaysLog();
  }
  v10.receiver = self;
  v10.super_class = (Class)IDSProfileGetDefaultInvitationContext;
  -[IDSProfileMessage handleResponseDictionary:](&v10, "handleResponseDictionary:", v4, v9);
  objc_super v5 = [v4 objectForKey:@"region-id"];
  [(IDSProfileGetDefaultInvitationContext *)self setResponseRegionID:v5];

  v6 = [v4 objectForKey:@"base-phone-number"];
  [(IDSProfileGetDefaultInvitationContext *)self setResponseBasePhoneNumber:v6];

  v7 = [v4 objectForKey:@"extra"];
  [(IDSProfileGetDefaultInvitationContext *)self setResponseExtraInfo:v7];

  v8 = [v4 objectForKey:@"validated"];
  -[IDSProfileGetDefaultInvitationContext setResponseValidated:](self, "setResponseValidated:", [v8 intValue] != 0);
}

- (NSString)responseBasePhoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setResponseBasePhoneNumber:(id)a3
{
}

- (NSString)responseRegionID
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setResponseRegionID:(id)a3
{
}

- (NSDictionary)responseExtraInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 304, 1);
}

- (void)setResponseExtraInfo:(id)a3
{
}

- (BOOL)responseValidated
{
  return self->_responseValidated;
}

- (void)setResponseValidated:(BOOL)a3
{
  self->_responseValidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseExtraInfo, 0);
  objc_storeStrong((id *)&self->_responseRegionID, 0);

  objc_storeStrong((id *)&self->_responseBasePhoneNumber, 0);
}

@end