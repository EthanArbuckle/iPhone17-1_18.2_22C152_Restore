@interface CKDTransactionState
- (CKDAssetBatch)assetBatch;
- (CKDTransactionState)init;
- (NSMutableDictionary)itemsByAssetId;
- (NSMutableDictionary)itemsByAssetIdIgnoreRefSignature;
- (void)setAssetBatch:(id)a3;
- (void)setItemsByAssetId:(id)a3;
- (void)setItemsByAssetIdIgnoreRefSignature:(id)a3;
@end

@implementation CKDTransactionState

- (CKDTransactionState)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKDTransactionState;
  v2 = [(CKDTransactionState *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    itemsByAssetId = v2->_itemsByAssetId;
    v2->_itemsByAssetId = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    itemsByAssetIdIgnoreRefSignature = v2->_itemsByAssetIdIgnoreRefSignature;
    v2->_itemsByAssetIdIgnoreRefSignature = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (CKDAssetBatch)assetBatch
{
  return self->_assetBatch;
}

- (void)setAssetBatch:(id)a3
{
}

- (NSMutableDictionary)itemsByAssetId
{
  return self->_itemsByAssetId;
}

- (void)setItemsByAssetId:(id)a3
{
}

- (NSMutableDictionary)itemsByAssetIdIgnoreRefSignature
{
  return self->_itemsByAssetIdIgnoreRefSignature;
}

- (void)setItemsByAssetIdIgnoreRefSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsByAssetIdIgnoreRefSignature, 0);
  objc_storeStrong((id *)&self->_itemsByAssetId, 0);
  objc_storeStrong((id *)&self->_assetBatch, 0);
}

@end