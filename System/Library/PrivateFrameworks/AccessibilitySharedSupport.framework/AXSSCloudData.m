@interface AXSSCloudData
- (CKServerChangeToken)serverChangeToken;
- (NSArray)recordIDsToDelete;
- (NSArray)recordsToUpdate;
- (OS_os_transaction)openTransaction;
- (void)setOpenTransaction:(id)a3;
- (void)setRecordIDsToDelete:(id)a3;
- (void)setRecordsToUpdate:(id)a3;
- (void)setServerChangeToken:(id)a3;
@end

@implementation AXSSCloudData

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
}

- (NSArray)recordsToUpdate
{
  return self->_recordsToUpdate;
}

- (void)setRecordsToUpdate:(id)a3
{
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(id)a3
{
}

- (OS_os_transaction)openTransaction
{
  return self->_openTransaction;
}

- (void)setOpenTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openTransaction, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToUpdate, 0);

  objc_storeStrong((id *)&self->_serverChangeToken, 0);
}

@end