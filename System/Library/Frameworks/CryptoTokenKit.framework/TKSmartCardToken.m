@interface TKSmartCardToken
- (NSData)AID;
- (TKSmartCard)smartCard;
- (TKSmartCardToken)initWithSmartCard:(TKSmartCard *)smartCard AID:(NSData *)AID instanceID:(NSString *)instanceID tokenDriver:(TKSmartCardTokenDriver *)tokenDriver;
- (id)keepAlive;
- (void)setKeepAlive:(id)a3;
@end

@implementation TKSmartCardToken

- (TKSmartCardToken)initWithSmartCard:(TKSmartCard *)smartCard AID:(NSData *)AID instanceID:(NSString *)instanceID tokenDriver:(TKSmartCardTokenDriver *)tokenDriver
{
  v10 = smartCard;
  v11 = AID;
  v20.receiver = self;
  v20.super_class = (Class)TKSmartCardToken;
  v12 = [(TKToken *)&v20 initWithTokenDriver:tokenDriver instanceID:instanceID];
  if (v12)
  {
    v13 = [(TKSmartCard *)v10 slot];
    uint64_t v14 = [v13 makeSmartCard];
    v15 = v12->_smartCard;
    v12->_smartCard = (TKSmartCard *)v14;

    objc_storeStrong((id *)&v12->_AID, AID);
    v16 = [TKTokenKeychainContents alloc];
    v17 = [(TKToken *)v12 configuration];
    v18 = [(TKTokenKeychainContents *)v16 initWithConfiguration:v17];
    [(TKToken *)v12 setKeychainContents:v18];
  }
  return v12;
}

- (NSData)AID
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (TKSmartCard)smartCard
{
  return self->_smartCard;
}

- (id)keepAlive
{
  return self->_keepAlive;
}

- (void)setKeepAlive:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_smartCard, 0);

  objc_storeStrong((id *)&self->_AID, 0);
}

@end