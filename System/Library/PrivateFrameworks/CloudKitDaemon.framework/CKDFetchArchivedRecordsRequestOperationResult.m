@interface CKDFetchArchivedRecordsRequestOperationResult
- (CKDFetchArchivedRecordsRequestOperationResult)init;
- (NSData)resultServerChangeTokenData;
- (int64_t)status;
- (void)setResultServerChangeTokenData:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation CKDFetchArchivedRecordsRequestOperationResult

- (CKDFetchArchivedRecordsRequestOperationResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKDFetchArchivedRecordsRequestOperationResult;
  result = [(CKDFetchArchivedRecordsRequestOperationResult *)&v3 init];
  if (result) {
    result->_status = 1;
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

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
}

@end