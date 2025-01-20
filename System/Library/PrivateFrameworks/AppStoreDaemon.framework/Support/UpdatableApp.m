@interface UpdatableApp
- (BOOL)hasEvidOverride;
- (BOOL)isB2BCustomApp;
- (NSNumber)downloaderDSID;
- (NSNumber)purchaserDSID;
- (NSNumber)storeExternalVersionID;
- (NSNumber)storeItemID;
- (NSNumber)storefrontID;
- (NSString)description;
@end

@implementation UpdatableApp

- (NSString)description
{
  return +[NSString stringWithFormat:@"{ bundleID: %@ itemID: %@ }", self->_bundleID, self->_storeItemID];
}

- (NSNumber)downloaderDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)hasEvidOverride
{
  return self->_hasEvidOverride;
}

- (BOOL)isB2BCustomApp
{
  return self->_isB2BCustomApp;
}

- (NSNumber)purchaserDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)storeExternalVersionID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)storeItemID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)storefrontID
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_storeItemID, 0);
  objc_storeStrong((id *)&self->_storeExternalVersionID, 0);
  objc_storeStrong((id *)&self->_purchaserDSID, 0);
  objc_storeStrong((id *)&self->_downloaderDSID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end