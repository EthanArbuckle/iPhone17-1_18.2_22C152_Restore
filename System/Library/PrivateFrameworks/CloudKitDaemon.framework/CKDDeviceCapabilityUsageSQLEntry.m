@interface CKDDeviceCapabilityUsageSQLEntry
- (NSDate)lastSent;
- (NSDate)lastUsed;
- (NSDate)sending;
- (NSNumber)itemType;
- (NSNumber)rowID;
- (NSString)IDString;
- (unint64_t)failureCount;
- (void)setFailureCount:(unint64_t)a3;
- (void)setIDString:(id)a3;
- (void)setItemType:(id)a3;
- (void)setLastSent:(id)a3;
- (void)setLastUsed:(id)a3;
- (void)setRowID:(id)a3;
- (void)setSending:(id)a3;
@end

@implementation CKDDeviceCapabilityUsageSQLEntry

- (NSNumber)rowID
{
  return self->_rowID;
}

- (void)setRowID:(id)a3
{
}

- (NSString)IDString
{
  return self->_IDString;
}

- (void)setIDString:(id)a3
{
}

- (NSNumber)itemType
{
  return self->_itemType;
}

- (void)setItemType:(id)a3
{
}

- (NSDate)lastUsed
{
  return self->_lastUsed;
}

- (void)setLastUsed:(id)a3
{
}

- (NSDate)lastSent
{
  return self->_lastSent;
}

- (void)setLastSent:(id)a3
{
}

- (NSDate)sending
{
  return self->_sending;
}

- (void)setSending:(id)a3
{
}

- (unint64_t)failureCount
{
  return self->_failureCount;
}

- (void)setFailureCount:(unint64_t)a3
{
  self->_failureCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sending, 0);
  objc_storeStrong((id *)&self->_lastSent, 0);
  objc_storeStrong((id *)&self->_lastUsed, 0);
  objc_storeStrong((id *)&self->_itemType, 0);
  objc_storeStrong((id *)&self->_IDString, 0);
  objc_storeStrong((id *)&self->_rowID, 0);
}

@end