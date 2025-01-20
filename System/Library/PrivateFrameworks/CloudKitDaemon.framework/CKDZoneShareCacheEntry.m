@interface CKDZoneShareCacheEntry
- (CKDZoneShareCacheEntry)initWithZoneRowID:(id)a3 shareRowID:(id)a4;
- (NSNumber)shareRowID;
- (NSNumber)zoneRowID;
- (void)setShareRowID:(id)a3;
- (void)setZoneRowID:(id)a3;
@end

@implementation CKDZoneShareCacheEntry

- (CKDZoneShareCacheEntry)initWithZoneRowID:(id)a3 shareRowID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKDZoneShareCacheEntry;
  v9 = [(CKDZoneShareCacheEntry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_zoneRowID, a3);
    objc_storeStrong((id *)&v10->_shareRowID, a4);
  }

  return v10;
}

- (NSNumber)zoneRowID
{
  return self->_zoneRowID;
}

- (void)setZoneRowID:(id)a3
{
}

- (NSNumber)shareRowID
{
  return self->_shareRowID;
}

- (void)setShareRowID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareRowID, 0);
  objc_storeStrong((id *)&self->_zoneRowID, 0);
}

@end