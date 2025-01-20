@interface CKSQLiteCacheTableTrackingEntry
- (NSDate)oldestExpireDate;
- (NSNumber)dataSize;
- (NSNumber)entryCount;
- (NSString)tableName;
- (void)setDataSize:(id)a3;
- (void)setEntryCount:(id)a3;
- (void)setOldestExpireDate:(id)a3;
- (void)setTableName:(id)a3;
@end

@implementation CKSQLiteCacheTableTrackingEntry

- (NSString)tableName
{
  return self->_tableName;
}

- (void)setTableName:(id)a3
{
}

- (NSNumber)entryCount
{
  return self->_entryCount;
}

- (void)setEntryCount:(id)a3
{
}

- (NSNumber)dataSize
{
  return self->_dataSize;
}

- (void)setDataSize:(id)a3
{
}

- (NSDate)oldestExpireDate
{
  return self->_oldestExpireDate;
}

- (void)setOldestExpireDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldestExpireDate, 0);
  objc_storeStrong((id *)&self->_dataSize, 0);
  objc_storeStrong((id *)&self->_entryCount, 0);

  objc_storeStrong((id *)&self->_tableName, 0);
}

@end