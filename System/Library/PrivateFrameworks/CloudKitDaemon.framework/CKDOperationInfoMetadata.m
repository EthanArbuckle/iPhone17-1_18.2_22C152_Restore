@interface CKDOperationInfoMetadata
- (CKDOperationInfoMetadata)initWithOperationInfo:(id)a3 lastAttemptDate:(id)a4 retryNumber:(id)a5;
- (CKOperationInfo)operationInfo;
- (NSDate)lastAttemptDate;
- (NSNumber)retryNumber;
@end

@implementation CKDOperationInfoMetadata

- (CKDOperationInfoMetadata)initWithOperationInfo:(id)a3 lastAttemptDate:(id)a4 retryNumber:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CKDOperationInfoMetadata;
  v12 = [(CKDOperationInfoMetadata *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_operationInfo, a3);
    uint64_t v16 = objc_msgSend_copy(v10, v14, v15);
    lastAttemptDate = v13->_lastAttemptDate;
    v13->_lastAttemptDate = (NSDate *)v16;

    uint64_t v20 = objc_msgSend_copy(v11, v18, v19);
    retryNumber = v13->_retryNumber;
    v13->_retryNumber = (NSNumber *)v20;
  }
  return v13;
}

- (CKOperationInfo)operationInfo
{
  return self->_operationInfo;
}

- (NSDate)lastAttemptDate
{
  return self->_lastAttemptDate;
}

- (NSNumber)retryNumber
{
  return self->_retryNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryNumber, 0);
  objc_storeStrong((id *)&self->_lastAttemptDate, 0);
  objc_storeStrong((id *)&self->_operationInfo, 0);
}

@end