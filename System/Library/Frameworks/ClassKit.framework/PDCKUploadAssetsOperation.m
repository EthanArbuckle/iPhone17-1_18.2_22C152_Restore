@interface PDCKUploadAssetsOperation
@end

@implementation PDCKUploadAssetsOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_operationCompletionBlock, 0);
  objc_storeStrong(&self->_recordCompletionBlock, 0);
  objc_storeStrong(&self->_recordProgressBlock, 0);
  objc_storeStrong((id *)&self->_assetZoneID, 0);
  objc_storeStrong((id *)&self->_container, 0);

  objc_storeStrong((id *)&self->_cloudDatabase, 0);
}

@end