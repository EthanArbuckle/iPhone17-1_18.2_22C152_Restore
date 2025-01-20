@interface CKMomentSharePreviewAsset
- (BOOL)isPreviewImageDataAvailable;
- (CGRect)bestCropRectForAspectRatio:(double)a3;
- (CGRect)bestCropRectForAspectRatio:(double)a3 verticalContentMode:(int64_t)a4 cropMode:(int64_t)a5;
- (CGSize)size;
- (CKMomentSharePreviewAsset)init;
- (CKMomentSharePreviewAsset)initWithConfiguration:(id)a3;
- (CKMomentSharePreviewAsset)initWithMomentShare:(id)a3;
- (Class)defaultImageProviderClass;
- (NSData)previewImageData;
- (PHMomentShare)momentShare;
- (UIImage)previewImage;
- (double)aspectRatio;
- (int64_t)isContentEqualTo:(id)a3;
@end

@implementation CKMomentSharePreviewAsset

- (CKMomentSharePreviewAsset)init
{
}

- (CKMomentSharePreviewAsset)initWithConfiguration:(id)a3
{
  id v3 = a3;
  abort();
}

- (CKMomentSharePreviewAsset)initWithMomentShare:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKMomentSharePreviewAsset;
  v6 = [(CKMomentSharePreviewAsset *)&v9 initWithConfiguration:&__block_literal_global_125];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_momentShare, a3);
  }

  return v7;
}

- (Class)defaultImageProviderClass
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Implemented by subclasses" userInfo:0];
  objc_exception_throw(v2);
}

- (int64_t)isContentEqualTo:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    momentShare = self->_momentShare;
    v6 = [v4 momentShare];
    LODWORD(momentShare) = [(PHMomentShare *)momentShare isEqual:v6];

    if (momentShare) {
      int64_t v7 = 2;
    }
    else {
      int64_t v7 = 1;
    }
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

- (BOOL)isPreviewImageDataAvailable
{
  id v3 = [(PHMomentShare *)self->_momentShare preview];
  id v4 = [v3 thumbnailImageData];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(PHMomentShare *)self->_momentShare preview];
    int64_t v7 = [v6 previewImageData];
    v8 = [v7 firstObject];
    BOOL v5 = v8 != 0;
  }
  return v5;
}

- (NSData)previewImageData
{
  id v3 = [(PHMomentShare *)self->_momentShare preview];
  id v4 = [v3 previewImageData];
  BOOL v5 = [v4 firstObject];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(PHMomentShare *)self->_momentShare preview];
    id v7 = [v8 thumbnailImageData];
  }

  return (NSData *)v7;
}

- (UIImage)previewImage
{
  if (!self->_cachedImage
    && [(CKMomentSharePreviewAsset *)self isPreviewImageDataAvailable])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F42A80]);
    id v4 = [(CKMomentSharePreviewAsset *)self previewImageData];
    BOOL v5 = (UIImage *)[v3 initWithData:v4];
    cachedImage = self->_cachedImage;
    self->_cachedImage = v5;
  }
  id v7 = self->_cachedImage;

  return v7;
}

- (CGRect)bestCropRectForAspectRatio:(double)a3
{
  [(CKMomentSharePreviewAsset *)self bestCropRectForAspectRatio:0 verticalContentMode:3 cropMode:a3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)size
{
  id v2 = [(CKMomentSharePreviewAsset *)self previewImage];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)aspectRatio
{
  [(CKMomentSharePreviewAsset *)self size];
  double result = v2 / v3;
  if (v3 <= 0.0) {
    return 1.0;
  }
  return result;
}

- (CGRect)bestCropRectForAspectRatio:(double)a3 verticalContentMode:(int64_t)a4 cropMode:(int64_t)a5
{
  [(CKMomentSharePreviewAsset *)self aspectRatio];
  if (PXFloatApproximatelyEqualToFloat())
  {
    double v6 = *MEMORY[0x1E4F91008];
    double v7 = *(double *)(MEMORY[0x1E4F91008] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F91008] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F91008] + 24);
  }
  else
  {
    [(CKMomentSharePreviewAsset *)self size];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    v14 = [(PHMomentShare *)self->_momentShare preview];
    [v14 cropRect];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    v33.origin.x = v16;
    v33.origin.y = v18;
    v33.size.width = v20;
    v33.size.height = v22;
    BOOL IsEmpty = CGRectIsEmpty(v33);
    v24 = (double *)MEMORY[0x1E4F91008];
    if (IsEmpty)
    {
      CGFloat v25 = *MEMORY[0x1E4F1DB28];
      CGFloat v26 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat v27 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat v28 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      PXRectFlippedVertically();
      PXRectFlippedVertically();
      PXLargestSalientAspectFilledCropRect();
      CGFloat v25 = v29;
      CGFloat v26 = v30;
      CGFloat v27 = v31;
      CGFloat v28 = v32;
    }
    v34.origin.x = v25;
    v34.origin.y = v26;
    v34.size.width = v27;
    v34.size.height = v28;
    if (CGRectIsEmpty(v34)
      || (v35.origin.x = 0.0, v35.origin.y = 0.0, v35.size.width = v11, v35.size.height = v13, CGRectIsEmpty(v35)))
    {
      double v6 = *v24;
      double v7 = v24[1];
      double v8 = v24[2];
      double v9 = v24[3];
    }
    else
    {
      PXRectNormalize();
    }
  }
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentShare, 0);

  objc_storeStrong((id *)&self->_cachedImage, 0);
}

@end