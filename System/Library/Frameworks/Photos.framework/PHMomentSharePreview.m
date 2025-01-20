@interface PHMomentSharePreview
- (CGRect)cropRect;
- (NSArray)curatedAssetIdentifiers;
- (NSArray)previewImageData;
- (NSData)thumbnailImageData;
- (NSString)keyAssetIdentifier;
- (PHAsset)keyAsset;
- (PHMomentSharePreview)initWithThumbnailImageData:(id)a3 previewData:(id)a4;
- (id)description;
- (void)setCropRect:(CGRect)a3;
- (void)setCuratedAssetIdentifiers:(id)a3;
- (void)setKeyAsset:(id)a3;
- (void)setPreviewImageData:(id)a3;
- (void)setThumbnailImageData:(id)a3;
@end

@implementation PHMomentSharePreview

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_previewImageData, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);

  objc_storeStrong((id *)&self->_previewData, 0);
}

- (void)setCuratedAssetIdentifiers:(id)a3
{
}

- (NSArray)curatedAssetIdentifiers
{
  return self->_curatedAssetIdentifiers;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setKeyAsset:(id)a3
{
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (void)setPreviewImageData:(id)a3
{
}

- (NSArray)previewImageData
{
  return self->_previewImageData;
}

- (void)setThumbnailImageData:(id)a3
{
}

- (NSData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (id)description
{
  v3 = NSString;
  NSUInteger v4 = [(NSData *)self->_thumbnailImageData length];
  v5 = [(NSArray *)self->_previewImageData firstObject];
  uint64_t v6 = [v5 length];
  v7 = [(PHMomentSharePreview *)self keyAssetIdentifier];
  v8 = NSStringFromRect(self->_cropRect);
  v9 = [v3 stringWithFormat:@"Thumbnail:%lu bytes Preview:%lu bytes Key Asset:%@ Crop rect:%@", v4, v6, v7, v8];

  return v9;
}

- (NSString)keyAssetIdentifier
{
  return (NSString *)[(CPLMomentSharePreviewData *)self->_previewData keyAssetIdentifier];
}

- (PHMomentSharePreview)initWithThumbnailImageData:(id)a3 previewData:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PHMomentSharePreview;
  v9 = [(PHMomentSharePreview *)&v28 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_thumbnailImageData, a3);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F598E0]) initWithData:v8];
    previewData = v10->_previewData;
    v10->_previewData = (CPLMomentSharePreviewData *)v11;

    uint64_t v13 = [(CPLMomentSharePreviewData *)v10->_previewData previewImageDatas];
    previewImageData = v10->_previewImageData;
    v10->_previewImageData = (NSArray *)v13;

    v15 = [(CPLMomentSharePreviewData *)v10->_previewData keyAssetIdentifier];
    if (v15)
    {
      v16 = +[PHPhotoLibrary sharedMomentSharePhotoLibrary];
      v17 = [v16 librarySpecificFetchOptions];

      v29[0] = v15;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      v19 = +[PHAsset fetchAssetsWithCloudIdentifiers:v18 options:v17];
      uint64_t v20 = [v19 firstObject];
      keyAsset = v10->_keyAsset;
      v10->_keyAsset = (PHAsset *)v20;
    }
    v22 = [(CPLMomentSharePreviewData *)v10->_previewData cropRectString];
    v23 = v22;
    if (v22) {
      v10->_cropRect = NSRectFromString(v22);
    }
    v24 = [(CPLMomentSharePreviewData *)v10->_previewData curatedAssetIdentifiers];
    if ([v24 count])
    {
      uint64_t v25 = [v24 copy];
      curatedAssetIdentifiers = v10->_curatedAssetIdentifiers;
      v10->_curatedAssetIdentifiers = (NSArray *)v25;
    }
  }

  return v10;
}

@end