@interface CKPendingMomentShareImageProvider
- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6;
- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
@end

@implementation CKPendingMomentShareImageProvider

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = (void (**)(id, id, void))a7;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v13 = objc_opt_isKindOfClass();
  if (isKindOfClass & 1) != 0 || (v13)
  {
    if (v11) {
      goto LABEL_4;
    }
LABEL_10:
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"CKPendingMomentShareImageProvider.m", 29, @"Invalid parameter not satisfying: %@", @"resultHandler" object file lineNumber description];

    if (isKindOfClass) {
      goto LABEL_5;
    }
LABEL_11:
    id v14 = [v10 placeholderImage];
    v11[2](v11, v14, 0);
    goto LABEL_12;
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"CKPendingMomentShareImageProvider.m", 28, @"Invalid parameter not satisfying: %@", @"isPreviewAsset || isPlaceholderAsset" object file lineNumber description];

  if (!v11) {
    goto LABEL_10;
  }
LABEL_4:
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_11;
  }
LABEL_5:
  id v14 = v10;
  if ([v14 isPreviewImageDataAvailable])
  {
    v15 = [v14 previewImage];
    v11[2](v11, v15, 0);
  }
  else
  {
    v16 = NSString;
    v17 = [v14 momentShare];
    v15 = [v16 stringWithFormat:@"No preview image data available for moment share: %@", v17];

    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28228];
    v28[0] = v15;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v20 = [v18 errorWithDomain:@"CKPendingMomentShareImageProviderErrorDomain" code:-1 userInfo:v19];

    uint64_t v25 = *MEMORY[0x1E4F39698];
    v26 = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    ((void (**)(id, id, void *))v11)[2](v11, 0, v21);
  }
LABEL_12:

  return 0;
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  return 0;
}

@end