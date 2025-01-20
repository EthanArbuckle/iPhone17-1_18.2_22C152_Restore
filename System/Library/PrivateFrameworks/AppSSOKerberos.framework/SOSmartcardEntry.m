@interface SOSmartcardEntry
- (NSData)persistientRef;
- (NSDictionary)attributes;
- (NSString)certName;
- (NSString)issuer;
- (NSString)tokenID;
- (NSString)upn;
- (__SecIdentity)identity;
- (void)setAttributes:(id)a3;
- (void)setCertName:(id)a3;
- (void)setIdentity:(__SecIdentity *)a3;
- (void)setIssuer:(id)a3;
- (void)setPersistientRef:(id)a3;
- (void)setTokenID:(id)a3;
- (void)setUpn:(id)a3;
@end

@implementation SOSmartcardEntry

- (NSString)upn
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUpn:(id)a3
{
}

- (NSString)certName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCertName:(id)a3
{
}

- (NSString)tokenID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTokenID:(id)a3
{
}

- (NSString)issuer
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIssuer:(id)a3
{
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAttributes:(id)a3
{
}

- (__SecIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(__SecIdentity *)a3
{
  self->_identity = a3;
}

- (NSData)persistientRef
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPersistientRef:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistientRef, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_tokenID, 0);
  objc_storeStrong((id *)&self->_certName, 0);
  objc_storeStrong((id *)&self->_upn, 0);
}

@end