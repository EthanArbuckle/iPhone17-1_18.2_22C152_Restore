@interface CKMomentSharePlaceholderAsset
+ (CKMomentSharePlaceholderAsset)sharedInstance;
+ (id)placeholderImage;
- (CGRect)bestCropRectForAspectRatio:(double)a3;
- (CGSize)size;
- (CKMomentSharePlaceholderAsset)init;
- (Class)defaultImageProviderClass;
- (UIImage)placeholderImage;
- (double)aspectRatio;
- (int64_t)isContentEqualTo:(id)a3;
@end

@implementation CKMomentSharePlaceholderAsset

+ (CKMomentSharePlaceholderAsset)sharedInstance
{
  if (sharedInstance_predicate != -1) {
    dispatch_once(&sharedInstance_predicate, &__block_literal_global_251);
  }
  v2 = (void *)sharedInstance__sharedInstance;

  return (CKMomentSharePlaceholderAsset *)v2;
}

void __47__CKMomentSharePlaceholderAsset_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CKMomentSharePlaceholderAsset);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;
}

- (CKMomentSharePlaceholderAsset)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKMomentSharePlaceholderAsset;
  return [(CKMomentSharePlaceholderAsset *)&v3 init];
}

- (Class)defaultImageProviderClass
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Implemented by subclasses" userInfo:0];
  objc_exception_throw(v2);
}

- (int64_t)isContentEqualTo:(id)a3
{
  if (!a3) {
    return 1;
  }
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (id)placeholderImage
{
  if (placeholderImage_predicate != -1) {
    dispatch_once(&placeholderImage_predicate, &__block_literal_global_256_1);
  }
  id v2 = (void *)placeholderImage__placeholderImage;

  return v2;
}

void __49__CKMomentSharePlaceholderAsset_placeholderImage__block_invoke()
{
  id v2 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F42A80], "px_imageFromSolidColor:", v2);
  v1 = (void *)placeholderImage__placeholderImage;
  placeholderImage__placeholderImage = v0;
}

- (UIImage)placeholderImage
{
  id v2 = objc_opt_class();

  return (UIImage *)[v2 placeholderImage];
}

- (CGRect)bestCropRectForAspectRatio:(double)a3
{
  [(CKMomentSharePlaceholderAsset *)self size];
  PXRectWithAspectRatioFittingRect();

  PXRectNormalize();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)size
{
  id v2 = [(CKMomentSharePlaceholderAsset *)self placeholderImage];
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
  [(CKMomentSharePlaceholderAsset *)self size];
  double result = v2 / v3;
  if (v3 <= 0.0) {
    return 1.0;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end