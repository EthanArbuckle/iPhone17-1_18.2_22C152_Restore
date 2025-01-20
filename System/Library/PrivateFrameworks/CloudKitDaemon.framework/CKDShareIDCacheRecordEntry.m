@interface CKDShareIDCacheRecordEntry
- (CKDShareIDCacheRecordEntry)initWithZoneRowID:(id)a3 recordName:(id)a4;
- (NSNumber)parentRowID;
- (NSNumber)rowID;
- (NSNumber)shareRowID;
- (NSNumber)zoneRowID;
- (NSString)recordName;
- (void)setParentRowID:(id)a3;
- (void)setRecordName:(id)a3;
- (void)setRowID:(id)a3;
- (void)setShareRowID:(id)a3;
- (void)setZoneRowID:(id)a3;
@end

@implementation CKDShareIDCacheRecordEntry

- (CKDShareIDCacheRecordEntry)initWithZoneRowID:(id)a3 recordName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKDShareIDCacheRecordEntry;
  v9 = [(CKDShareIDCacheRecordEntry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_zoneRowID, a3);
    objc_storeStrong((id *)&v10->_recordName, a4);
  }

  return v10;
}

- (NSNumber)rowID
{
  return self->_rowID;
}

- (void)setRowID:(id)a3
{
}

- (NSNumber)zoneRowID
{
  return self->_zoneRowID;
}

- (void)setZoneRowID:(id)a3
{
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setRecordName:(id)a3
{
}

- (NSNumber)shareRowID
{
  return self->_shareRowID;
}

- (void)setShareRowID:(id)a3
{
}

- (NSNumber)parentRowID
{
  return self->_parentRowID;
}

- (void)setParentRowID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentRowID, 0);
  objc_storeStrong((id *)&self->_shareRowID, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_zoneRowID, 0);
  objc_storeStrong((id *)&self->_rowID, 0);
}

@end