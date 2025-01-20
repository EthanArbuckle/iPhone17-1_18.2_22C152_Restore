@interface CKMediaItemMaker
- (CKMediaItemMaker)initWithAssetStreamHandle:(id)a3;
- (CKMediaItemMaker)initWithCloudAssetsAssetStreamHandle:(id)a3;
- (CKMediaItemMaker)initWithData:(id)a3 error:(id *)a4;
- (_TtC8CloudKit17AssetStreamHandle)assetStreamHandle;
- (_TtC8CloudKit28CloudAssetsAssetStreamHandle)cloudAssetsAssetStreamHandle;
- (id)dataRepresentationWithError:(id *)a3;
- (id)makeAVAssetExportSession:(id)a3 options:(id)a4 presetName:(id)a5;
- (id)makeAVPlayerItemWithURL:(id)a3;
- (id)makeAVPlayerItemWithURL:(id)a3 options:(id)a4;
@end

@implementation CKMediaItemMaker

- (CKMediaItemMaker)initWithAssetStreamHandle:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKMediaItemMaker;
  v6 = [(CKMediaItemMaker *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetStreamHandle, a3);
    cloudAssetsAssetStreamHandle = v7->_cloudAssetsAssetStreamHandle;
    v7->_cloudAssetsAssetStreamHandle = 0;
  }
  return v7;
}

- (CKMediaItemMaker)initWithCloudAssetsAssetStreamHandle:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKMediaItemMaker;
  v6 = [(CKMediaItemMaker *)&v10 init];
  v7 = v6;
  if (v6)
  {
    assetStreamHandle = v6->_assetStreamHandle;
    v6->_assetStreamHandle = 0;

    objc_storeStrong((id *)&v7->_cloudAssetsAssetStreamHandle, a3);
  }

  return v7;
}

- (id)makeAVPlayerItemWithURL:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v11 = objc_msgSend_assetStreamHandle(self, v8, v9, v10);

  if (v11) {
    objc_msgSend_assetStreamHandle(self, v12, v13, v14);
  }
  else {
  v15 = objc_msgSend_cloudAssetsAssetStreamHandle(self, v12, v13, v14);
  }
  v17 = objc_msgSend_makeAVPlayerItemWith_options_(v15, v16, (uint64_t)v7, (uint64_t)v6);

  return v17;
}

- (id)makeAVPlayerItemWithURL:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_assetStreamHandle(self, v5, v6, v7);

  if (v8) {
    objc_msgSend_assetStreamHandle(self, v9, v10, v11);
  }
  else {
  v12 = objc_msgSend_cloudAssetsAssetStreamHandle(self, v9, v10, v11);
  }
  uint64_t v14 = objc_msgSend_makeAVPlayerItemWith_options_(v12, v13, (uint64_t)v4, 0);

  return v14;
}

- (id)makeAVAssetExportSession:(id)a3 options:(id)a4 presetName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v14 = objc_msgSend_assetStreamHandle(self, v11, v12, v13);

  if (v14) {
    objc_msgSend_assetStreamHandle(self, v15, v16, v17);
  }
  else {
  v18 = objc_msgSend_cloudAssetsAssetStreamHandle(self, v15, v16, v17);
  }
  v20 = objc_msgSend_makeAVAssetExportSessionWith_options_presetName_(v18, v19, (uint64_t)v10, (uint64_t)v9, v8);

  return v20;
}

- (CKMediaItemMaker)initWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKMediaItemMaker;
  uint64_t v7 = [(CKMediaItemMaker *)&v17 init];
  if (v7)
  {
    id v8 = [_TtC8CloudKit17AssetStreamHandle alloc];
    uint64_t v10 = objc_msgSend_initFrom_error_(v8, v9, (uint64_t)v6, (uint64_t)a4);
    assetStreamHandle = v7->_assetStreamHandle;
    v7->_assetStreamHandle = (_TtC8CloudKit17AssetStreamHandle *)v10;

    if (v7->_assetStreamHandle)
    {
      cloudAssetsAssetStreamHandle = v7->_cloudAssetsAssetStreamHandle;
      v7->_cloudAssetsAssetStreamHandle = 0;
    }
    else
    {
      uint64_t v13 = [_TtC8CloudKit28CloudAssetsAssetStreamHandle alloc];
      uint64_t v15 = objc_msgSend_initFrom_error_(v13, v14, (uint64_t)v6, (uint64_t)a4);
      cloudAssetsAssetStreamHandle = v7->_cloudAssetsAssetStreamHandle;
      v7->_cloudAssetsAssetStreamHandle = (_TtC8CloudKit28CloudAssetsAssetStreamHandle *)v15;
    }
  }
  return v7;
}

- (id)dataRepresentationWithError:(id *)a3
{
  id v6 = objc_msgSend_assetStreamHandle(self, a2, (uint64_t)a3, v3);

  if (v6) {
    objc_msgSend_assetStreamHandle(self, v7, v8, v9);
  }
  else {
  uint64_t v10 = objc_msgSend_cloudAssetsAssetStreamHandle(self, v7, v8, v9);
  }
  uint64_t v13 = objc_msgSend_serializedDataAndReturnError_(v10, v11, (uint64_t)a3, v12);

  return v13;
}

- (_TtC8CloudKit17AssetStreamHandle)assetStreamHandle
{
  return self->_assetStreamHandle;
}

- (_TtC8CloudKit28CloudAssetsAssetStreamHandle)cloudAssetsAssetStreamHandle
{
  return self->_cloudAssetsAssetStreamHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudAssetsAssetStreamHandle, 0);

  objc_storeStrong((id *)&self->_assetStreamHandle, 0);
}

@end