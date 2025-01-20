@interface CKDIdentityCacheTableEntry
- (CKUserIdentity)identity;
- (CKUserIdentityLookupInfo)lookupInfo;
- (NSNumber)rowid;
- (NSString)containerIdentifier;
- (NSString)dataSeparationHash;
- (void)setContainerIdentifier:(id)a3;
- (void)setDataSeparationHash:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setLookupInfo:(id)a3;
- (void)setRowid:(id)a3;
@end

@implementation CKDIdentityCacheTableEntry

- (NSNumber)rowid
{
  return self->_rowid;
}

- (void)setRowid:(id)a3
{
}

- (CKUserIdentityLookupInfo)lookupInfo
{
  return self->_lookupInfo;
}

- (void)setLookupInfo:(id)a3
{
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (NSString)dataSeparationHash
{
  return self->_dataSeparationHash;
}

- (void)setDataSeparationHash:(id)a3
{
}

- (CKUserIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_dataSeparationHash, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_lookupInfo, 0);
  objc_storeStrong((id *)&self->_rowid, 0);
}

@end