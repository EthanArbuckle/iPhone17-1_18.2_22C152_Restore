@interface CKDFetchZoneChangesRequestOperationResult
- (BOOL)hasPendingArchivedRecords;
- (CKDFetchZoneChangesRequestOperationResult)init;
- (NSData)resultClientChangeTokenData;
- (NSData)resultServerChangeTokenData;
- (NSSet)syncObligationZoneIDs;
- (int64_t)status;
- (void)setHasPendingArchivedRecords:(BOOL)a3;
- (void)setResultClientChangeTokenData:(id)a3;
- (void)setResultServerChangeTokenData:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setSyncObligationZoneIDs:(id)a3;
@end

@implementation CKDFetchZoneChangesRequestOperationResult

- (CKDFetchZoneChangesRequestOperationResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKDFetchZoneChangesRequestOperationResult;
  result = [(CKDFetchZoneChangesRequestOperationResult *)&v3 init];
  if (result) {
    result->_status = -1;
  }
  return result;
}

- (NSData)resultServerChangeTokenData
{
  return self->_resultServerChangeTokenData;
}

- (void)setResultServerChangeTokenData:(id)a3
{
}

- (NSData)resultClientChangeTokenData
{
  return self->_resultClientChangeTokenData;
}

- (void)setResultClientChangeTokenData:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BOOL)hasPendingArchivedRecords
{
  return self->_hasPendingArchivedRecords;
}

- (void)setHasPendingArchivedRecords:(BOOL)a3
{
  self->_hasPendingArchivedRecords = a3;
}

- (NSSet)syncObligationZoneIDs
{
  return self->_syncObligationZoneIDs;
}

- (void)setSyncObligationZoneIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncObligationZoneIDs, 0);
  objc_storeStrong((id *)&self->_resultClientChangeTokenData, 0);
  objc_storeStrong((id *)&self->_resultServerChangeTokenData, 0);
}

@end