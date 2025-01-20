@interface CKDZoneIDCacheEntry
- (CKDZoneIDCacheEntry)initWithZoneIDString:(id)a3;
- (NSNumber)rowID;
- (NSString)zoneIDString;
- (void)setRowID:(id)a3;
- (void)setZoneIDString:(id)a3;
@end

@implementation CKDZoneIDCacheEntry

- (CKDZoneIDCacheEntry)initWithZoneIDString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKDZoneIDCacheEntry;
  v6 = [(CKDZoneIDCacheEntry *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_zoneIDString, a3);
  }

  return v7;
}

- (NSNumber)rowID
{
  return self->_rowID;
}

- (void)setRowID:(id)a3
{
}

- (NSString)zoneIDString
{
  return self->_zoneIDString;
}

- (void)setZoneIDString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIDString, 0);
  objc_storeStrong((id *)&self->_rowID, 0);
}

@end