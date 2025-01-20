@interface CNPhotoPickerProviderItem
+ (id)generateImageDataWithData:(id)a3 filterName:(id)a4;
+ (id)generateThumbnailImageDataWithData:(id)a3 cropRect:(CGRect)a4;
+ (id)thumbnailViewForImage:(id)a3;
- (BOOL)allowsEditing;
- (BOOL)allowsMoveAndScale;
- (BOOL)allowsVariants;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldShowCaption;
- (CGRect)cropRect;
- (CNPhotoPickerProviderItem)initWithImageData:(id)a3 thumbnailImageData:(id)a4 fullscreenImageData:(id)a5 cropRect:(CGRect)a6;
- (CNPhotoPickerProviderItem)initWithImageData:(id)a3 thumbnailImageData:(id)a4 fullscreenImageData:(id)a5 imageFilterName:(id)a6 cropRect:(CGRect)a7 renderingQueue:(id)a8 callbackQueue:(id)a9;
- (CNPhotoPickerProviderItemDelegate)delegate;
- (CNScheduler)callbackQueue;
- (CNScheduler)renderingQueue;
- (NSData)filteredImageData;
- (NSData)fullscreenImageData;
- (NSData)imageData;
- (NSData)originalImageData;
- (NSData)thumbnailImageData;
- (NSDate)sortDate;
- (NSString)assetIdentifier;
- (NSString)imageFilterName;
- (NSString)localizedVariantDisplayName;
- (NSString)localizedVariantsTitle;
- (NSString)recentsIdentifier;
- (UIImage)croppedFullSizeImage;
- (UIImage)fullSizeImage;
- (UIImage)loadingPlaceholderImage;
- (UIImage)thumbnailImage;
- (id)contactImageForMetadataStore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)generatePhotoFilterVariants;
- (id)generateThumbnailImageDataIfNeeded;
- (id)generateThumbnailImageDataWithData:(id)a3;
- (id)rotateImageDataIfNeeded:(id)a3;
- (unint64_t)hash;
- (unint64_t)imageType;
- (void)applyVariantEffectToFullsizeImageWithCompletion:(id)a3;
- (void)clearThumbnailImage;
- (void)fullSizeViewWithCompletion:(id)a3;
- (void)generateAllImageDatasIfNeeded;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setAssetIdentifier:(id)a3;
- (void)setCroppedFullSizeImage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFilteredImageData:(id)a3;
- (void)setFullSizeImage:(id)a3;
- (void)setFullscreenImageData:(id)a3;
- (void)setImageData:(id)a3;
- (void)setImageFilterName:(id)a3;
- (void)setLoadingPlaceholderImage:(id)a3;
- (void)setLocalizedVariantDisplayName:(id)a3;
- (void)setRecentsIdentifier:(id)a3;
- (void)setSortDate:(id)a3;
- (void)setThumbnailImage:(id)a3;
- (void)setThumbnailImageData:(id)a3;
- (void)thumbnailViewWithCompletion:(id)a3;
- (void)thumbnailViewWithPlaceholderProvider:(id)a3 completion:(id)a4;
- (void)updateContact:(id)a3;
- (void)updateVisualIdentity:(id)a3;
@end

@implementation CNPhotoPickerProviderItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageFilterName, 0);
  objc_storeStrong((id *)&self->_filteredImageData, 0);
  objc_storeStrong((id *)&self->_fullscreenImageData, 0);
  objc_storeStrong((id *)&self->_loadingPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_croppedFullSizeImage, 0);
  objc_storeStrong((id *)&self->_fullSizeImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sortDate, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_renderingQueue, 0);
  objc_storeStrong((id *)&self->_localizedVariantDisplayName, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_recentsIdentifier, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);

  objc_storeStrong((id *)&self->_imageData, 0);
}

- (void)setImageFilterName:(id)a3
{
}

- (NSString)imageFilterName
{
  return self->_imageFilterName;
}

- (void)setFilteredImageData:(id)a3
{
}

- (NSData)filteredImageData
{
  return self->_filteredImageData;
}

- (void)setFullscreenImageData:(id)a3
{
}

- (NSData)fullscreenImageData
{
  return self->_fullscreenImageData;
}

- (void)setLoadingPlaceholderImage:(id)a3
{
}

- (UIImage)loadingPlaceholderImage
{
  return self->_loadingPlaceholderImage;
}

- (void)setThumbnailImage:(id)a3
{
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setCroppedFullSizeImage:(id)a3
{
}

- (void)setFullSizeImage:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (CNPhotoPickerProviderItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPhotoPickerProviderItemDelegate *)WeakRetained;
}

- (void)setSortDate:(id)a3
{
}

- (NSDate)sortDate
{
  return self->_sortDate;
}

- (CNScheduler)callbackQueue
{
  return self->_callbackQueue;
}

- (CNScheduler)renderingQueue
{
  return self->_renderingQueue;
}

- (void)setLocalizedVariantDisplayName:(id)a3
{
}

- (NSString)localizedVariantDisplayName
{
  return self->_localizedVariantDisplayName;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
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

- (void)setAssetIdentifier:(id)a3
{
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setRecentsIdentifier:(id)a3
{
}

- (NSString)recentsIdentifier
{
  return self->_recentsIdentifier;
}

- (void)setThumbnailImageData:(id)a3
{
}

- (NSData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (void)setImageData:(id)a3
{
}

- (unint64_t)hash
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__CNPhotoPickerProviderItem_hash__block_invoke;
  v3[3] = &unk_1E549ADA8;
  v3[4] = self;
  return objc_msgSend(MEMORY[0x1E4F5A418], "hashWithBlocks:", v3, 0);
}

uint64_t __33__CNPhotoPickerProviderItem_hash__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) imageData];
  uint64_t v2 = [v1 hash];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F5A3E0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __37__CNPhotoPickerProviderItem_isEqual___block_invoke;
  v15[3] = &unk_1E549BCB0;
  v15[4] = self;
  id v16 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __37__CNPhotoPickerProviderItem_isEqual___block_invoke_2;
  v12 = &unk_1E549BCB0;
  v13 = self;
  id v14 = v16;
  id v6 = v16;
  v7 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToOther:withBlocks:", self, v6, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

uint64_t __37__CNPhotoPickerProviderItem_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) imageData];
  v3 = [*(id *)(a1 + 40) imageData];
  uint64_t v4 = [v2 isEqualToData:v3];

  return v4;
}

BOOL __37__CNPhotoPickerProviderItem_isEqual___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) cropRect];
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  [*(id *)(a1 + 40) cropRect];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v18 = v3;
  uint64_t v19 = v5;
  uint64_t v20 = v7;
  uint64_t v21 = v9;

  return CGRectEqualToRect(*(CGRect *)&v18, *(CGRect *)&v11);
}

- (id)contactImageForMetadataStore
{
  id v3 = objc_alloc(MEMORY[0x1E4F1B918]);
  uint64_t v4 = [(CNPhotoPickerProviderItem *)self originalImageData];
  [(CNPhotoPickerProviderItem *)self cropRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v14 = objc_msgSend(v3, "initWithImageData:cropRect:lastUsedDate:", v4, v13, v6, v8, v10, v12);

  uint64_t v15 = [(CNPhotoPickerProviderItem *)self imageFilterName];
  [v14 setVariant:v15];

  [v14 setSource:2];

  return v14;
}

- (unint64_t)imageType
{
  return 1;
}

- (id)rotateImageDataIfNeeded:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_imageWithDataPreservingScale:", v3);
  if ([v4 imageOrientation])
  {
    [v4 size];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    [v4 scale];
    CGFloat v10 = v9;
    v18.double width = v6;
    v18.double height = v8;
    UIGraphicsBeginImageContextWithOptions(v18, 0, v10);
    [v4 size];
    double v12 = v11;
    [v4 size];
    objc_msgSend(v4, "drawInRect:", 0.0, 0.0, v12, v13);
    UIGraphicsGetImageFromCurrentImageContext();
    uint64_t v14 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    UIImageJPEGRepresentation(v14, 0.8);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = v3;
  }

  return v15;
}

- (id)generatePhotoFilterVariants
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(CNPhotoPickerProviderItem *)self thumbnailImageData];

  if (v4)
  {
    double v5 = [(CNPhotoPickerProviderItem *)self thumbnailImageData];
  }
  else
  {
    CGFloat v6 = [(CNPhotoPickerProviderItem *)self originalImageData];
    double v5 = [(CNPhotoPickerProviderItem *)self generateThumbnailImageDataWithData:v6];
  }
  double v7 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_imageWithDataPreservingScale:", v5);
  [v7 size];
  if (v8 > 256.0 || ([v7 size], double v9 = 1.0, v10 > 256.0))
  {
    [v7 size];
    double v12 = v11;
    [v7 size];
    if (v12 >= v13) {
      double v14 = v13;
    }
    else {
      double v14 = v12;
    }
    double v9 = 256.0 / v14;
  }
  id v15 = objc_alloc((Class)objc_opt_class());
  uint64_t v16 = [(CNPhotoPickerProviderItem *)self originalImageData];
  uint64_t v17 = [(CNPhotoPickerProviderItem *)self originalImageData];
  [(CNPhotoPickerProviderItem *)self cropRect];
  CGSize v18 = objc_msgSend(v15, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v16, v5, v17);

  [v18 setImageFilterName:0];
  uint64_t v19 = CNContactsUIBundle();
  uint64_t v20 = [v19 localizedStringForKey:@"PHOTO_FILTER_ORIGINAL_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  [v18 setLocalizedVariantDisplayName:v20];

  objc_msgSend(v3, "_cn_addNonNilObject:", v18);
  [v7 scale];
  double v22 = v21;
  [v7 size];
  double v24 = v9 * v23;
  [v7 size];
  double v26 = v9 * v25;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __56__CNPhotoPickerProviderItem_generatePhotoFilterVariants__block_invoke;
  v31[3] = &unk_1E54989A0;
  v31[4] = self;
  id v27 = v3;
  id v32 = v27;
  +[CNPhotoPickerImageWithEffectGenerator imagesByApplyingEffectsToImageData:withScaleFactor:originalImageScale:cropRect:completion:](CNPhotoPickerImageWithEffectGenerator, "imagesByApplyingEffectsToImageData:withScaleFactor:originalImageScale:cropRect:completion:", v5, v31, v9, v22, 0.0, 0.0, v24, v26);
  v28 = v32;
  id v29 = v27;

  return v29;
}

void __56__CNPhotoPickerProviderItem_generatePhotoFilterVariants__block_invoke(uint64_t a1, UIImage *a2, void *a3)
{
  id v5 = a3;
  UIImageJPEGRepresentation(a2, 0.8);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = objc_alloc((Class)objc_opt_class());
  double v7 = [*(id *)(a1 + 32) originalImageData];
  double v8 = [*(id *)(a1 + 32) originalImageData];
  [*(id *)(a1 + 32) cropRect];
  double v9 = objc_msgSend(v6, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v7, v12, v8);

  [v9 setImageFilterName:v5];
  double v10 = +[CNPhotoPickerImageWithEffectGenerator displayNameForFilterNamed:v5];

  [v9 setLocalizedVariantDisplayName:v10];
  double v11 = [*(id *)(a1 + 32) assetIdentifier];
  [v9 setAssetIdentifier:v11];

  objc_msgSend(*(id *)(a1 + 40), "_cn_addNonNilObject:", v9);
}

- (void)updateVisualIdentity:(id)a3
{
  id v9 = a3;
  [v9 setMemojiMetadata:0];
  [(CNPhotoPickerProviderItem *)self generateAllImageDatasIfNeeded];
  uint64_t v4 = [(CNPhotoPickerProviderItem *)self imageData];
  [v9 setImageData:v4];

  id v5 = [(CNPhotoPickerProviderItem *)self imageData];
  id v6 = objc_msgSend(v5, "_cn_md5Hash");
  [v9 setImageHash:v6];

  [(CNPhotoPickerProviderItem *)self cropRect];
  objc_msgSend(v9, "setCropRect:");
  double v7 = [(CNPhotoPickerProviderItem *)self thumbnailImageData];
  [v9 setThumbnailImageData:v7];

  double v8 = [(CNPhotoPickerProviderItem *)self fullscreenImageData];
  [v9 setFullscreenImageData:v8];

  [v9 updateImageType:1];
}

- (void)updateContact:(id)a3
{
  id v4 = a3;
  id v5 = [[CNVisualIdentity alloc] initWithContact:v4];
  [(CNPhotoPickerProviderItem *)self updateVisualIdentity:v5];
  [(CNVisualIdentity *)v5 updateImageForContact:v4];
}

- (void)applyVariantEffectToFullsizeImageWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(CNPhotoPickerProviderItem *)self imageFilterName];

  if (v5)
  {
    [(CNPhotoPickerProviderItem *)self setThumbnailImageData:0];
    id v6 = [(CNPhotoPickerProviderItem *)self renderingQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__CNPhotoPickerProviderItem_applyVariantEffectToFullsizeImageWithCompletion___block_invoke;
    v7[3] = &unk_1E549B710;
    v7[4] = self;
    double v8 = v4;
    [v6 performBlock:v7];
  }
  else
  {
    v4[2](v4);
  }
}

void __77__CNPhotoPickerProviderItem_applyVariantEffectToFullsizeImageWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) generateAllImageDatasIfNeeded];
  uint64_t v2 = [*(id *)(a1 + 32) callbackQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__CNPhotoPickerProviderItem_applyVariantEffectToFullsizeImageWithCompletion___block_invoke_2;
  v3[3] = &unk_1E549B8A0;
  id v4 = *(id *)(a1 + 40);
  [v2 performBlock:v3];
}

uint64_t __77__CNPhotoPickerProviderItem_applyVariantEffectToFullsizeImageWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (UIImage)croppedFullSizeImage
{
  croppedFullSizeImage = self->_croppedFullSizeImage;
  if (!croppedFullSizeImage)
  {
    id v4 = [(CNPhotoPickerProviderItem *)self fullSizeImage];

    if (!v4)
    {
      double v8 = 0;
      goto LABEL_9;
    }
    [(CNPhotoPickerProviderItem *)self cropRect];
    BOOL v5 = CGRectEqualToRect(v16, *MEMORY[0x1E4F1DB28]);
    id v6 = [(CNPhotoPickerProviderItem *)self fullSizeImage];
    if (v5)
    {
      double v7 = self->_croppedFullSizeImage;
      self->_croppedFullSizeImage = v6;
    }
    else
    {
      id v9 = v6;
      double v10 = [(UIImage *)v9 CGImage];
      [(CNPhotoPickerProviderItem *)self cropRect];
      double v11 = CGImageCreateWithImageInRect(v10, v17);

      id v12 = [MEMORY[0x1E4FB1818] imageWithCGImage:v11];
      double v13 = self->_croppedFullSizeImage;
      self->_croppedFullSizeImage = v12;

      CGImageRelease(v11);
    }
    croppedFullSizeImage = self->_croppedFullSizeImage;
  }
  double v8 = croppedFullSizeImage;
LABEL_9:

  return v8;
}

- (UIImage)fullSizeImage
{
  fullSizeImage = self->_fullSizeImage;
  if (!fullSizeImage)
  {
    id v4 = [(CNPhotoPickerProviderItem *)self imageData];
    if (![v4 length])
    {
      BOOL v5 = [(CNPhotoPickerProviderItem *)self fullscreenImageData];
      uint64_t v6 = [v5 length];

      if (v6) {
        [(CNPhotoPickerProviderItem *)self fullscreenImageData];
      }
      else {
      uint64_t v7 = [(CNPhotoPickerProviderItem *)self thumbnailImageData];
      }

      id v4 = (void *)v7;
    }
    double v8 = [MEMORY[0x1E4FB1818] imageWithData:v4];
    id v9 = self->_fullSizeImage;
    self->_fullSizeImage = v8;

    fullSizeImage = self->_fullSizeImage;
  }

  return fullSizeImage;
}

- (void)fullSizeViewWithCompletion:(id)a3
{
  id v9 = (void (**)(id, void *))a3;
  id v4 = [(CNPhotoPickerProviderItem *)self imageData];
  if (v4)
  {

LABEL_4:
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [(CNPhotoPickerProviderItem *)self croppedFullSizeImage];
    double v8 = [v6 thumbnailViewForImage:v7];
    v9[2](v9, v8);

    goto LABEL_5;
  }
  BOOL v5 = [(CNPhotoPickerProviderItem *)self fullscreenImageData];

  if (v5) {
    goto LABEL_4;
  }
  [(CNPhotoPickerProviderItem *)self thumbnailViewWithCompletion:v9];
LABEL_5:
}

- (void)thumbnailViewWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  BOOL v5 = [(CNPhotoPickerProviderItem *)self thumbnailImage];

  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [(CNPhotoPickerProviderItem *)self thumbnailImage];
    double v8 = [v6 thumbnailViewForImage:v7];
    v4[2](v4, v8);
  }
  else
  {
    id v9 = [(CNPhotoPickerProviderItem *)self renderingQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__CNPhotoPickerProviderItem_thumbnailViewWithCompletion___block_invoke;
    v10[3] = &unk_1E549B710;
    v10[4] = self;
    double v11 = v4;
    [v9 performBlock:v10];
  }
}

void __57__CNPhotoPickerProviderItem_thumbnailViewWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) generateThumbnailImageDataIfNeeded];
  id v3 = [MEMORY[0x1E4FB1818] imageWithData:v2];
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__CNPhotoPickerProviderItem_thumbnailViewWithCompletion___block_invoke_2;
  v7[3] = &unk_1E549AFF8;
  BOOL v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 performBlock:v7];
}

void __57__CNPhotoPickerProviderItem_thumbnailViewWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setThumbnailImage:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [(id)objc_opt_class() thumbnailViewForImage:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)thumbnailViewWithPlaceholderProvider:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *))a3;
  id v7 = a4;
  id v8 = [(CNPhotoPickerProviderItem *)self loadingPlaceholderImage];

  if (v8)
  {
    id v9 = objc_opt_class();
    double v10 = [(CNPhotoPickerProviderItem *)self loadingPlaceholderImage];
    double v11 = [v9 thumbnailViewForImage:v10];
    v6[2](v6, v11);
  }
  else
  {
    v6[2](v6, 0);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__CNPhotoPickerProviderItem_thumbnailViewWithPlaceholderProvider_completion___block_invoke;
  v13[3] = &unk_1E5498978;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [(CNPhotoPickerProviderItem *)self thumbnailViewWithCompletion:v13];
}

void __77__CNPhotoPickerProviderItem_thumbnailViewWithPlaceholderProvider_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v3 loadingPlaceholderImage];
    (*(void (**)(uint64_t, id, BOOL))(v2 + 16))(v2, v4, v5 != 0);
  }
}

- (void)clearThumbnailImage
{
}

- (id)generateThumbnailImageDataWithData:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  [(CNPhotoPickerProviderItem *)self cropRect];
  id v6 = objc_msgSend(v5, "generateThumbnailImageDataWithData:cropRect:", v4);

  return v6;
}

- (id)generateThumbnailImageDataIfNeeded
{
  id v3 = [(CNPhotoPickerProviderItem *)self thumbnailImageData];

  if (!v3)
  {
    [(CNPhotoPickerProviderItem *)self cropRect];
    BOOL v4 = CGRectEqualToRect(v9, *MEMORY[0x1E4F1DB28]);
    id v5 = [(CNPhotoPickerProviderItem *)self imageData];
    if (v4)
    {
      [(CNPhotoPickerProviderItem *)self setThumbnailImageData:v5];
    }
    else
    {
      id v6 = [(CNPhotoPickerProviderItem *)self generateThumbnailImageDataWithData:v5];
      [(CNPhotoPickerProviderItem *)self setThumbnailImageData:v6];
    }
  }

  return [(CNPhotoPickerProviderItem *)self thumbnailImageData];
}

- (void)generateAllImageDatasIfNeeded
{
  uint64_t v3 = [(CNPhotoPickerProviderItem *)self imageData];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    uint64_t v5 = [(CNPhotoPickerProviderItem *)self thumbnailImageData];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [(CNPhotoPickerProviderItem *)self fullscreenImageData];

      if (v7) {
        return;
      }
    }
    else
    {
    }
  }
  id v8 = [(CNPhotoPickerProviderItem *)self generateThumbnailImageDataIfNeeded];
  CGRect v9 = [(CNPhotoPickerProviderItem *)self fullscreenImageData];

  if (!v9)
  {
    id v10 = [(CNPhotoPickerProviderItem *)self imageData];
    [(CNPhotoPickerProviderItem *)self setFullscreenImageData:v10];
  }
}

- (NSData)originalImageData
{
  return self->_imageData;
}

- (NSData)imageData
{
  p_filteredImageData = &self->_filteredImageData;
  filteredImageData = self->_filteredImageData;
  if (!filteredImageData)
  {
    if (self->_imageFilterName)
    {
      uint64_t v5 = [(id)objc_opt_class() generateImageDataWithData:self->_imageData filterName:self->_imageFilterName];
      id v6 = self->_filteredImageData;
      self->_filteredImageData = v5;
    }
    else
    {
      p_filteredImageData = &self->_imageData;
    }
    filteredImageData = *p_filteredImageData;
  }
  id v7 = filteredImageData;

  return v7;
}

- (NSString)localizedVariantsTitle
{
  uint64_t v2 = CNContactsUIBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"PHOTO_SELECT_FILTER" value:&stru_1ED8AC728 table:@"Localized"];

  return (NSString *)v3;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (BOOL)shouldShowCaption
{
  return 1;
}

- (BOOL)allowsMoveAndScale
{
  return 1;
}

- (BOOL)allowsVariants
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  imageData = self->_imageData;
  id v6 = [(CNPhotoPickerProviderItem *)self thumbnailImageData];
  id v7 = [(CNPhotoPickerProviderItem *)self fullscreenImageData];
  [(CNPhotoPickerProviderItem *)self cropRect];
  id v8 = objc_msgSend(v4, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", imageData, v6, v7);

  [v8 setImageFilterName:self->_imageFilterName];
  [v8 setAssetIdentifier:self->_assetIdentifier];
  return v8;
}

- (CNPhotoPickerProviderItem)initWithImageData:(id)a3 thumbnailImageData:(id)a4 fullscreenImageData:(id)a5 imageFilterName:(id)a6 cropRect:(CGRect)a7 renderingQueue:(id)a8 callbackQueue:(id)a9
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v19 = a3;
  id v30 = a4;
  id v29 = a5;
  id v20 = a6;
  id v21 = a8;
  id v22 = a9;
  v31.receiver = self;
  v31.super_class = (Class)CNPhotoPickerProviderItem;
  double v23 = [(CNPhotoPickerProviderItem *)&v31 init];
  double v24 = v23;
  if (v23)
  {
    uint64_t v25 = -[CNPhotoPickerProviderItem rotateImageDataIfNeeded:](v23, "rotateImageDataIfNeeded:", v19, v29, v30);
    imageData = v24->_imageData;
    v24->_imageData = (NSData *)v25;

    objc_storeStrong((id *)&v24->_thumbnailImageData, a4);
    objc_storeStrong((id *)&v24->_fullscreenImageData, a5);
    objc_storeStrong((id *)&v24->_imageFilterName, a6);
    v24->_cropRect.origin.CGFloat x = x;
    v24->_cropRect.origin.CGFloat y = y;
    v24->_cropRect.size.CGFloat width = width;
    v24->_cropRect.size.CGFloat height = height;
    objc_storeStrong((id *)&v24->_renderingQueue, a8);
    objc_storeStrong((id *)&v24->_callbackQueue, a9);
    v24->_allowsEditing = 1;
    id v27 = v24;
  }

  return v24;
}

- (CNPhotoPickerProviderItem)initWithImageData:(id)a3 thumbnailImageData:(id)a4 fullscreenImageData:(id)a5 cropRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  CGRect v16 = +[CNUIContactsEnvironment currentEnvironment];
  CGRect v17 = [v16 defaultSchedulerProvider];
  CGSize v18 = (void *)[v17 newSerialSchedulerWithName:@"com.apple.ContactsUI.PhotoPickerProviderItem.renderingQueue"];
  id v19 = [v17 mainThreadScheduler];
  id v20 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:](self, "initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:", v15, v14, v13, 0, v18, v19, x, y, width, height);

  return v20;
}

+ (id)thumbnailViewForImage:(id)a3
{
  id v3 = a3;
  [v3 size];
  double v5 = fmax(v4, 90.0);
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, v5, v5);
  [v6 setAutoresizingMask:18];
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", 0.0, 0.0, v5, v5);
  [v6 center];
  objc_msgSend(v7, "setCenter:");
  [v7 setAutoresizingMask:18];
  [v7 setContentMode:2];
  [v7 setImage:v3];

  [v6 addSubview:v7];

  return v6;
}

+ (id)generateThumbnailImageDataWithData:(id)a3 cropRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v8 = a3;
  if (v8)
  {
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    if (CGRectEqualToRect(v16, *MEMORY[0x1E4F1DB28]))
    {
      id v9 = v8;
    }
    else
    {
      id v10 = [MEMORY[0x1E4FB1818] imageWithData:v8];
      double v11 = (CGImage *)[v10 CGImage];
      v17.origin.CGFloat x = x;
      v17.origin.CGFloat y = y;
      v17.size.CGFloat width = width;
      v17.size.CGFloat height = height;
      id v12 = CGImageCreateWithImageInRect(v11, v17);
      id v13 = [MEMORY[0x1E4FB1818] imageWithCGImage:v12];

      CGImageRelease(v12);
      UIImageJPEGRepresentation(v13, 0.8);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)generateImageDataWithData:(id)a3 filterName:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1E018];
  id v7 = a4;
  id v8 = [v6 contextWithOptions:0];
  id v9 = +[CNPhotoPickerImageWithEffectGenerator imageByApplyingEffect:v7 withContext:v8 toImageData:v5];

  if (v9)
  {
    UIImageJPEGRepresentation(v9, 0.8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v5;
  }
  double v11 = v10;

  return v11;
}

@end