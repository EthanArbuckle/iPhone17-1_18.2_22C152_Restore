@interface CKRecordFetchAggregatorOperationInfo
- (BOOL)fetchAssetContents;
- (BOOL)fetchMergeableValues;
- (BOOL)forceDecryptionAttempt;
- (BOOL)preserveOrdering;
- (CKRecordFetchAggregatorOperationInfo)init;
- (NSDictionary)assetTransferOptionsByRecordTypeAndKey;
- (NSSet)desiredKeys;
- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3;
- (void)setDesiredKeys:(id)a3;
- (void)setFetchAssetContents:(BOOL)a3;
- (void)setFetchMergeableValues:(BOOL)a3;
- (void)setForceDecryptionAttempt:(BOOL)a3;
- (void)setPreserveOrdering:(BOOL)a3;
@end

@implementation CKRecordFetchAggregatorOperationInfo

- (CKRecordFetchAggregatorOperationInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKRecordFetchAggregatorOperationInfo;
  result = [(CKOperationInfo *)&v3 init];
  if (result)
  {
    result->_fetchAssetContents = 1;
    result->_fetchMergeableValues = 1;
  }
  return result;
}

- (BOOL)fetchAssetContents
{
  return self->_fetchAssetContents;
}

- (void)setFetchAssetContents:(BOOL)a3
{
  self->_fetchAssetContents = a3;
}

- (BOOL)fetchMergeableValues
{
  return self->_fetchMergeableValues;
}

- (void)setFetchMergeableValues:(BOOL)a3
{
  self->_fetchMergeableValues = a3;
}

- (BOOL)preserveOrdering
{
  return self->_preserveOrdering;
}

- (void)setPreserveOrdering:(BOOL)a3
{
  self->_preserveOrdering = a3;
}

- (NSSet)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
}

- (NSDictionary)assetTransferOptionsByRecordTypeAndKey
{
  return self->_assetTransferOptionsByRecordTypeAndKey;
}

- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3
{
}

- (BOOL)forceDecryptionAttempt
{
  return self->_forceDecryptionAttempt;
}

- (void)setForceDecryptionAttempt:(BOOL)a3
{
  self->_forceDecryptionAttempt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
}

@end