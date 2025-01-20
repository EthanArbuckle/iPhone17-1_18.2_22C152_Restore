@interface CKDPCSSQLCacheEntry
- (CKDPCSData)CKDPCSData;
- (NSNumber)databaseScope;
- (NSNumber)itemType;
- (NSString)accountID;
- (NSString)identifier;
- (NSString)parentID;
- (NSString)serviceName;
- (NSString)shareID;
- (NSString)zoneID;
- (void)setAccountID:(id)a3;
- (void)setCKDPCSData:(id)a3;
- (void)setDatabaseScope:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setItemType:(id)a3;
- (void)setParentID:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setShareID:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKDPCSSQLCacheEntry

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(id)a3
{
}

- (NSNumber)itemType
{
  return self->_itemType;
}

- (void)setItemType:(id)a3
{
}

- (CKDPCSData)CKDPCSData
{
  return self->_CKDPCSData;
}

- (void)setCKDPCSData:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (NSString)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
}

- (NSString)shareID
{
  return self->_shareID;
}

- (void)setShareID:(id)a3
{
}

- (NSString)parentID
{
  return self->_parentID;
}

- (void)setParentID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentID, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_CKDPCSData, 0);
  objc_storeStrong((id *)&self->_itemType, 0);
  objc_storeStrong((id *)&self->_databaseScope, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end