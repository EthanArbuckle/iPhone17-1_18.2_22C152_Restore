@interface CNPhotoPickerAnimojiProviderItem
+ (id)log;
- (AVTAvatarRecord)avatarRecord;
- (AVTAvatarRecordImageProvider)imageProvider;
- (AVTRenderingScope)renderingScope;
- (AVTStickerConfiguration)poseConfiguration;
- (BOOL)allowsMoveAndScale;
- (BOOL)allowsVariants;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldShowCaption;
- (CGAffineTransform)transformForMemojiMetadata;
- (CGSize)originalImageSize;
- (CNAvatarStickerGeneratorProvider)stickerGeneratorProvider;
- (CNPhotoPickerAnimojiProviderItem)initWithAvatarRecord:(id)a3 imageProvider:(id)a4 renderingScope:(id)a5 renderingQueue:(id)a6 callbackQueue:(id)a7;
- (CNPhotoPickerAnimojiProviderItem)initWithOriginalImageData:(id)a3 cropRect:(CGRect)a4;
- (CNPhotoPickerAnimojiProviderItem)initWithOriginalImageData:(id)a3 cropRect:(CGRect)a4 backgroundColorVariant:(id)a5;
- (CNPhotoPickerColorVariant)backgroundColorVariant;
- (NSData)_generatedImageData;
- (NSData)_originalImageData;
- (UIEdgeInsets)edgeInsets;
- (UIImage)loadingPlaceholderImage;
- (id)contactImageForMetadataStore;
- (id)copyWithColor:(id)a3;
- (id)copyWithPoseConfiguration:(id)a3 generatorProvider:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createVariantsItemsWithVariantsManager:(id)a3;
- (id)generateImageDataIfNeeded;
- (id)generateThumbnailImageDataIfNeeded;
- (id)imageData;
- (id)localizedVariantsTitle;
- (id)originalImageData;
- (id)renderAvatarWithBackgroundWithImage:(id)a3;
- (id)renderAvatarWithBackgroundWithImageData:(id)a3;
- (id)renderAvatarWithPoseWithSize:(double)a3;
- (id)renderDefaultAvatarImage;
- (id)variantIdentifier;
- (unint64_t)hash;
- (unint64_t)imageType;
- (void)applyVariantEffectToFullsizeImageWithCompletion:(id)a3;
- (void)generateAllImageDatasIfNeeded;
- (void)setAvatarRecord:(id)a3;
- (void)setBackgroundColorVariant:(id)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setImageProvider:(id)a3;
- (void)setLoadingPlaceholderImage:(id)a3;
- (void)setOriginalImageSize:(CGSize)a3;
- (void)setPoseConfiguration:(id)a3;
- (void)setRenderingScope:(id)a3;
- (void)setStickerGeneratorProvider:(id)a3;
- (void)set_generatedImageData:(id)a3;
- (void)set_originalImageData:(id)a3;
- (void)updateVisualIdentity:(id)a3;
@end

@implementation CNPhotoPickerAnimojiProviderItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_renderingScope, 0);
  objc_storeStrong((id *)&self->_stickerGeneratorProvider, 0);
  objc_storeStrong((id *)&self->_loadingPlaceholderImage, 0);
  objc_storeStrong((id *)&self->__generatedImageData, 0);
  objc_storeStrong((id *)&self->__originalImageData, 0);
  objc_storeStrong((id *)&self->_backgroundColorVariant, 0);
  objc_storeStrong((id *)&self->_poseConfiguration, 0);

  objc_storeStrong((id *)&self->_avatarRecord, 0);
}

- (void)setImageProvider:(id)a3
{
}

- (AVTAvatarRecordImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setRenderingScope:(id)a3
{
}

- (AVTRenderingScope)renderingScope
{
  return self->_renderingScope;
}

- (void)setStickerGeneratorProvider:(id)a3
{
}

- (CNAvatarStickerGeneratorProvider)stickerGeneratorProvider
{
  return self->_stickerGeneratorProvider;
}

- (void)setLoadingPlaceholderImage:(id)a3
{
}

- (UIImage)loadingPlaceholderImage
{
  return self->_loadingPlaceholderImage;
}

- (void)set_generatedImageData:(id)a3
{
}

- (NSData)_generatedImageData
{
  return self->__generatedImageData;
}

- (void)set_originalImageData:(id)a3
{
}

- (NSData)_originalImageData
{
  return self->__originalImageData;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setOriginalImageSize:(CGSize)a3
{
  self->_originalImageSize = a3;
}

- (CGSize)originalImageSize
{
  double width = self->_originalImageSize.width;
  double height = self->_originalImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBackgroundColorVariant:(id)a3
{
}

- (CNPhotoPickerColorVariant)backgroundColorVariant
{
  return self->_backgroundColorVariant;
}

- (void)setPoseConfiguration:(id)a3
{
}

- (AVTStickerConfiguration)poseConfiguration
{
  return self->_poseConfiguration;
}

- (void)setAvatarRecord:(id)a3
{
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x1E4F5A418];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__CNPhotoPickerAnimojiProviderItem_hash__block_invoke;
  v10[3] = &unk_1E549ADA8;
  v10[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CNPhotoPickerAnimojiProviderItem_hash__block_invoke_2;
  aBlock[3] = &unk_1E549ADA8;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__CNPhotoPickerAnimojiProviderItem_hash__block_invoke_3;
  v8[3] = &unk_1E549ADA8;
  v8[4] = self;
  v5 = _Block_copy(v8);
  unint64_t v6 = objc_msgSend(v3, "hashWithBlocks:", v10, v4, v5, 0);

  return v6;
}

uint64_t __40__CNPhotoPickerAnimojiProviderItem_hash__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) avatarRecord];
  v2 = [v1 identifier];
  uint64_t v3 = [v2 hash];

  return v3;
}

uint64_t __40__CNPhotoPickerAnimojiProviderItem_hash__block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) backgroundColorVariant];
  uint64_t v2 = [v1 hash];

  return v2;
}

uint64_t __40__CNPhotoPickerAnimojiProviderItem_hash__block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _originalImageData];
  uint64_t v2 = [v1 hash];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F5A3E0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__CNPhotoPickerAnimojiProviderItem_isEqual___block_invoke;
  v16[3] = &unk_1E549BCB0;
  v16[4] = self;
  id v17 = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__CNPhotoPickerAnimojiProviderItem_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E549BCB0;
  id v6 = v17;
  id v14 = v6;
  v15 = self;
  v7 = _Block_copy(aBlock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__CNPhotoPickerAnimojiProviderItem_isEqual___block_invoke_3;
  v11[3] = &unk_1E549BCB0;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  v9 = _Block_copy(v11);
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToOther:withBlocks:", self, v8, v16, v7, v9, 0);

  return (char)self;
}

uint64_t __44__CNPhotoPickerAnimojiProviderItem_isEqual___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) avatarRecord];
  v5 = [v4 identifier];
  if (!v5)
  {
    v1 = [*(id *)(a1 + 40) avatarRecord];
    uint64_t v2 = [v1 identifier];
    if (!v2)
    {
      uint64_t v10 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  id v6 = [*(id *)(a1 + 32) avatarRecord];
  v7 = [v6 identifier];
  id v8 = [*(id *)(a1 + 40) avatarRecord];
  v9 = [v8 identifier];
  uint64_t v10 = [v7 isEqual:v9];

  if (!v5) {
    goto LABEL_6;
  }
LABEL_7:

  return v10;
}

uint64_t __44__CNPhotoPickerAnimojiProviderItem_isEqual___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  id v3 = *(id *)(a1 + 32);
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [*(id *)(a1 + 40) backgroundColorVariant];
  if (!v6)
  {
    v1 = [v5 backgroundColorVariant];
    if (!v1)
    {
      uint64_t v9 = 1;
LABEL_9:

      goto LABEL_10;
    }
  }
  v7 = [*(id *)(a1 + 40) backgroundColorVariant];
  id v8 = [v5 backgroundColorVariant];
  uint64_t v9 = [v7 isEqual:v8];

  if (!v6) {
    goto LABEL_9;
  }
LABEL_10:

  return v9;
}

uint64_t __44__CNPhotoPickerAnimojiProviderItem_isEqual___block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _originalImageData];
  if (!v3)
  {
    v1 = [*(id *)(a1 + 40) _originalImageData];
    if (!v1)
    {
      uint64_t v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  id v4 = [*(id *)(a1 + 32) _originalImageData];
  id v5 = [*(id *)(a1 + 40) _originalImageData];
  uint64_t v6 = [v4 isEqual:v5];

  if (!v3) {
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

- (id)contactImageForMetadataStore
{
  id v3 = objc_alloc(MEMORY[0x1E4F1B918]);
  id v4 = [(CNPhotoPickerAnimojiProviderItem *)self _originalImageData];
  [(CNPhotoPickerProviderItem *)self cropRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [MEMORY[0x1E4F1C9C8] date];
  id v14 = objc_msgSend(v3, "initWithImageData:cropRect:lastUsedDate:", v4, v13, v6, v8, v10, v12);

  [v14 setSource:3];
  v15 = [(CNPhotoPickerAnimojiProviderItem *)self backgroundColorVariant];
  v16 = [v15 colorName];
  [v14 setVariant:v16];

  id v17 = [(CNPhotoPickerAnimojiProviderItem *)self avatarRecord];
  v18 = [v17 identifier];
  [v14 setSourceIdentifier:v18];

  v19 = (void *)MEMORY[0x1E4F1BA30];
  v20 = [(CNPhotoPickerAnimojiProviderItem *)self poseConfiguration];
  v21 = [v19 dataForPoseConfiguration:v20];
  [v14 setPoseConfigurationData:v21];

  return v14;
}

- (id)createVariantsItemsWithVariantsManager:(id)a3
{
  id v4 = a3;
  double v5 = [(CNPhotoPickerAnimojiProviderItem *)self _originalImageData];

  if (v5)
  {
    double v6 = [v4 avatarBackgrounds];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__CNPhotoPickerAnimojiProviderItem_createVariantsItemsWithVariantsManager___block_invoke_2;
    v14[3] = &unk_1E549A390;
    v14[4] = self;
    double v7 = objc_msgSend(v6, "_cn_map:", v14);
  }
  else
  {
    double v8 = [CNAvatarStickerGeneratorProvider alloc];
    double v9 = [(CNPhotoPickerAnimojiProviderItem *)self avatarRecord];
    double v10 = [(CNAvatarStickerGeneratorProvider *)v8 initWithAvatarRecord:v9];

    double v11 = [(CNPhotoPickerAnimojiProviderItem *)self avatarRecord];
    double v6 = +[CNPhotoPickerVariantsManager avatarPoseConfigurationsForAvatarRecord:v11];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __75__CNPhotoPickerAnimojiProviderItem_createVariantsItemsWithVariantsManager___block_invoke;
    v15[3] = &unk_1E549A368;
    v15[4] = self;
    v16 = v10;
    double v12 = v10;
    double v7 = objc_msgSend(v6, "_cn_map:", v15);
  }

  return v7;
}

id __75__CNPhotoPickerAnimojiProviderItem_createVariantsItemsWithVariantsManager___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) copyWithPoseConfiguration:a2 generatorProvider:*(void *)(a1 + 40)];

  return v2;
}

id __75__CNPhotoPickerAnimojiProviderItem_createVariantsItemsWithVariantsManager___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) copyWithColor:a2];

  return v2;
}

- (void)applyVariantEffectToFullsizeImageWithCompletion:(id)a3
{
  id v4 = a3;
  [(CNPhotoPickerProviderItem *)self setThumbnailImageData:0];
  double v5 = [(CNPhotoPickerProviderItem *)self renderingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__CNPhotoPickerAnimojiProviderItem_applyVariantEffectToFullsizeImageWithCompletion___block_invoke;
  v7[3] = &unk_1E549B710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __84__CNPhotoPickerAnimojiProviderItem_applyVariantEffectToFullsizeImageWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) generateImageDataIfNeeded];
  id v3 = [*(id *)(a1 + 32) callbackQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__CNPhotoPickerAnimojiProviderItem_applyVariantEffectToFullsizeImageWithCompletion___block_invoke_2;
  v4[3] = &unk_1E549B8A0;
  id v5 = *(id *)(a1 + 40);
  [v3 performBlock:v4];
}

uint64_t __84__CNPhotoPickerAnimojiProviderItem_applyVariantEffectToFullsizeImageWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)generateThumbnailImageDataIfNeeded
{
  id v3 = [(CNPhotoPickerAnimojiProviderItem *)self _originalImageData];
  if (v3)
  {
  }
  else
  {
    id v6 = [(CNPhotoPickerAnimojiProviderItem *)self poseConfiguration];

    if (v6)
    {
      id v5 = [(CNPhotoPickerAnimojiProviderItem *)self renderAvatarWithPoseWithSize:120.0];
      goto LABEL_8;
    }
  }
  id v4 = [(CNPhotoPickerProviderItem *)self thumbnailImageData];

  if (v4)
  {
    id v5 = [(CNPhotoPickerProviderItem *)self thumbnailImageData];
  }
  else
  {
    id v7 = [(CNPhotoPickerAnimojiProviderItem *)self generateImageDataIfNeeded];
    v9.receiver = self;
    v9.super_class = (Class)CNPhotoPickerAnimojiProviderItem;
    id v5 = [(CNPhotoPickerProviderItem *)&v9 generateThumbnailImageDataIfNeeded];
  }
LABEL_8:

  return v5;
}

- (void)generateAllImageDatasIfNeeded
{
  id v3 = [(CNPhotoPickerAnimojiProviderItem *)self generateImageDataIfNeeded];
  v4.receiver = self;
  v4.super_class = (Class)CNPhotoPickerAnimojiProviderItem;
  [(CNPhotoPickerProviderItem *)&v4 generateAllImageDatasIfNeeded];
}

- (id)generateImageDataIfNeeded
{
  id v3 = [(CNPhotoPickerAnimojiProviderItem *)self imageData];

  if (v3)
  {
    objc_super v4 = [(CNPhotoPickerAnimojiProviderItem *)self imageData];
    goto LABEL_12;
  }
  id v5 = [(CNPhotoPickerAnimojiProviderItem *)self _originalImageData];

  if (v5)
  {
    id v6 = [(CNPhotoPickerAnimojiProviderItem *)self backgroundColorVariant];

    objc_super v4 = [(CNPhotoPickerAnimojiProviderItem *)self _originalImageData];
    if (v6)
    {
      uint64_t v7 = [(CNPhotoPickerAnimojiProviderItem *)self renderAvatarWithBackgroundWithImageData:v4];

      objc_super v4 = (void *)v7;
    }
    goto LABEL_11;
  }
  id v8 = [(CNPhotoPickerAnimojiProviderItem *)self poseConfiguration];

  if (v8)
  {
    uint64_t v9 = [(CNPhotoPickerAnimojiProviderItem *)self renderAvatarWithPoseWithSize:420.0];
LABEL_10:
    objc_super v4 = (void *)v9;
    goto LABEL_11;
  }
  objc_super v4 = [(CNPhotoPickerAnimojiProviderItem *)self imageProvider];

  if (v4)
  {
    uint64_t v9 = [(CNPhotoPickerAnimojiProviderItem *)self renderDefaultAvatarImage];
    goto LABEL_10;
  }
LABEL_11:
  [(CNPhotoPickerAnimojiProviderItem *)self set_generatedImageData:v4];
LABEL_12:

  return v4;
}

- (id)renderAvatarWithBackgroundWithImage:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPhotoPickerAnimojiProviderItem *)self backgroundColorVariant];
  id v6 = [v5 color];
  uint64_t v7 = +[CNPhotoPickerVariantsManager colorGradientBackground:v6];

  id v8 = objc_opt_new();
  [v4 scale];
  objc_msgSend(v8, "setScale:");
  [v8 setOpaque:0];
  id v9 = objc_alloc(MEMORY[0x1E4FB17D8]);
  [v4 size];
  double v10 = objc_msgSend(v9, "initWithSize:format:", v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__CNPhotoPickerAnimojiProviderItem_renderAvatarWithBackgroundWithImage___block_invoke;
  v16[3] = &unk_1E549A340;
  id v17 = v7;
  id v18 = v4;
  id v11 = v4;
  id v12 = v7;
  v13 = [v10 imageWithActions:v16];
  id v14 = UIImagePNGRepresentation(v13);

  return v14;
}

void __72__CNPhotoPickerAnimojiProviderItem_renderAvatarWithBackgroundWithImage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 format];
  [v5 bounds];
  objc_msgSend(v3, "drawInRect:");

  id v6 = *(void **)(a1 + 40);
  id v7 = [v4 format];

  [v7 bounds];
  objc_msgSend(v6, "drawInRect:");
}

- (id)renderAvatarWithBackgroundWithImageData:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_imageWithDataPreservingScale:");
    id v5 = [(CNPhotoPickerAnimojiProviderItem *)self renderAvatarWithBackgroundWithImage:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)renderAvatarWithPoseWithSize:(double)a3
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__50261;
  v26 = __Block_byref_object_dispose__50262;
  id v27 = 0;
  id v5 = [(CNPhotoPickerAnimojiProviderItem *)self poseConfiguration];

  if (v5)
  {
    id v6 = [(CNPhotoPickerAnimojiProviderItem *)self poseConfiguration];
    [v6 loadIfNeeded];

    id v7 = [(CNPhotoPickerAnimojiProviderItem *)self stickerGeneratorProvider];

    if (!v7)
    {
      id v8 = [CNAvatarStickerGeneratorProvider alloc];
      id v9 = [(CNPhotoPickerAnimojiProviderItem *)self avatarRecord];
      double v10 = [(CNAvatarStickerGeneratorProvider *)v8 initWithAvatarRecord:v9];
      [(CNPhotoPickerAnimojiProviderItem *)self setStickerGeneratorProvider:v10];
    }
    id v11 = [(CNPhotoPickerAnimojiProviderItem *)self stickerGeneratorProvider];
    id v12 = [v11 generator];

    [v12 setAsync:0];
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    v13 = (void *)getAVTStickerGeneratorOptionsClass_softClass_50263;
    uint64_t v32 = getAVTStickerGeneratorOptionsClass_softClass_50263;
    if (!getAVTStickerGeneratorOptionsClass_softClass_50263)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __getAVTStickerGeneratorOptionsClass_block_invoke_50264;
      v28[3] = &unk_1E549AD00;
      v28[4] = &v29;
      __getAVTStickerGeneratorOptionsClass_block_invoke_50264((uint64_t)v28);
      v13 = (void *)v30[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v29, 8);
    id v15 = objc_alloc_init(v14);
    [v15 setCorrectClipping:1];
    v16 = [(CNPhotoPickerAnimojiProviderItem *)self poseConfiguration];
    [v16 size];
    [v15 setSizeMultiplier:a3 / v17];

    id v18 = [(CNPhotoPickerAnimojiProviderItem *)self poseConfiguration];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65__CNPhotoPickerAnimojiProviderItem_renderAvatarWithPoseWithSize___block_invoke;
    v21[3] = &unk_1E549A318;
    v21[4] = self;
    v21[5] = &v22;
    [v12 stickerImageWithConfiguration:v18 options:v15 completionHandler:v21];

    [(CNPhotoPickerAnimojiProviderItem *)self setStickerGeneratorProvider:0];
    id v19 = (id)v23[5];
  }
  else
  {
    id v19 = 0;
  }
  _Block_object_dispose(&v22, 8);

  return v19;
}

void __65__CNPhotoPickerAnimojiProviderItem_renderAvatarWithPoseWithSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 size];
  objc_msgSend(*(id *)(a1 + 32), "setOriginalImageSize:");
  +[CNAvatarImageUtilities transparencyInsetsForImage:v3 requiringFullOpacity:0];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "setEdgeInsets:");
  +[CNAvatarImageUtilities croppedAndCenteredAvatarImageForImage:usingTransparencyInsets:widthMultiplier:](CNAvatarImageUtilities, "croppedAndCenteredAvatarImageForImage:usingTransparencyInsets:widthMultiplier:", v3, v5, v7, v9, v11, 1.0);
  image = (UIImage *)objc_claimAutoreleasedReturnValue();

  uint64_t v12 = UIImagePNGRepresentation(image);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

- (id)renderDefaultAvatarImage
{
  id v3 = [(CNPhotoPickerAnimojiProviderItem *)self imageProvider];

  if (v3)
  {
    double v4 = [(CNPhotoPickerAnimojiProviderItem *)self imageProvider];
    double v5 = [(CNPhotoPickerAnimojiProviderItem *)self avatarRecord];
    double v6 = [(CNPhotoPickerAnimojiProviderItem *)self renderingScope];
    double v7 = [v4 imageForRecord:v5 scope:v6];

    double v8 = UIImagePNGRepresentation(v7);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (unint64_t)imageType
{
  return 3;
}

- (id)variantIdentifier
{
  id v2 = [(CNPhotoPickerAnimojiProviderItem *)self backgroundColorVariant];
  id v3 = [v2 colorName];

  return v3;
}

- (id)copyWithPoseConfiguration:(id)a3 generatorProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [CNPhotoPickerAnimojiProviderItem alloc];
  double v9 = [(CNPhotoPickerProviderItem *)self renderingQueue];
  double v10 = [(CNPhotoPickerProviderItem *)self callbackQueue];
  double v11 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:](v8, "initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:", 0, 0, 0, 0, v9, v10, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [(CNPhotoPickerAnimojiProviderItem *)self originalImageSize];
  -[CNPhotoPickerAnimojiProviderItem setOriginalImageSize:](v11, "setOriginalImageSize:");
  [(CNPhotoPickerAnimojiProviderItem *)self edgeInsets];
  -[CNPhotoPickerAnimojiProviderItem setEdgeInsets:](v11, "setEdgeInsets:");
  uint64_t v12 = [(CNPhotoPickerAnimojiProviderItem *)self avatarRecord];
  [(CNPhotoPickerAnimojiProviderItem *)v11 setAvatarRecord:v12];

  [(CNPhotoPickerAnimojiProviderItem *)v11 setPoseConfiguration:v7];
  [(CNPhotoPickerAnimojiProviderItem *)v11 setStickerGeneratorProvider:v6];

  uint64_t v13 = [(CNPhotoPickerAnimojiProviderItem *)self imageData];

  if (v13)
  {
    id v14 = (void *)MEMORY[0x1E4FB1818];
    id v15 = [(CNPhotoPickerAnimojiProviderItem *)self imageData];
    v16 = [v14 imageWithData:v15];
    double v17 = [v16 imageWithRenderingMode:2];
    [(CNPhotoPickerAnimojiProviderItem *)v11 setLoadingPlaceholderImage:v17];
  }
  return v11;
}

- (id)copyWithColor:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4FB1818];
  id v5 = a3;
  id v6 = [(CNPhotoPickerAnimojiProviderItem *)self _originalImageData];
  id v7 = objc_msgSend(v4, "cnui_imageWithDataPreservingScale:", v6);

  [(CNPhotoPickerProviderItem *)self cropRect];
  if (!CGRectEqualToRect(v30, *MEMORY[0x1E4F1DB28]))
  {
    id v8 = v7;
    double v9 = (CGImage *)[v8 CGImage];
    [(CNPhotoPickerProviderItem *)self cropRect];
    double v10 = CGImageCreateWithImageInRect(v9, v31);
    id v7 = [MEMORY[0x1E4FB1818] imageWithCGImage:v10];

    CGImageRelease(v10);
  }
  [v7 size];
  if (v11 > 256.0)
  {
    [v7 size];
    double v13 = v12 * 0.00390625;
    [v7 size];
    CGFloat v15 = v14 / v13;
    [v7 size];
    CGFloat v17 = v16 / v13;
    [v7 scale];
    CGFloat v19 = v18;
    v29.double width = v15;
    v29.double height = v17;
    UIGraphicsBeginImageContextWithOptions(v29, 0, v19);
    id v20 = UIGraphicsGetImageFromCurrentImageContext();
    objc_msgSend(v7, "drawInRect:", 0.0, 0.0, v15, v17);
    uint64_t v21 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    id v7 = (void *)v21;
  }
  uint64_t v22 = [CNPhotoPickerAnimojiProviderItem alloc];
  v23 = [(CNPhotoPickerAnimojiProviderItem *)self _originalImageData];
  [(CNPhotoPickerProviderItem *)self cropRect];
  uint64_t v24 = -[CNPhotoPickerAnimojiProviderItem initWithOriginalImageData:cropRect:](v22, "initWithOriginalImageData:cropRect:", v23);

  [(CNPhotoPickerAnimojiProviderItem *)v24 setBackgroundColorVariant:v5];
  v25 = [(CNPhotoPickerAnimojiProviderItem *)v24 renderAvatarWithBackgroundWithImage:v7];
  [(CNPhotoPickerProviderItem *)v24 setThumbnailImageData:v25];
  v26 = [(CNPhotoPickerAnimojiProviderItem *)self avatarRecord];
  [(CNPhotoPickerAnimojiProviderItem *)v24 setAvatarRecord:v26];

  id v27 = [(CNPhotoPickerAnimojiProviderItem *)self poseConfiguration];
  [(CNPhotoPickerAnimojiProviderItem *)v24 setPoseConfiguration:v27];

  [(CNPhotoPickerAnimojiProviderItem *)self originalImageSize];
  -[CNPhotoPickerAnimojiProviderItem setOriginalImageSize:](v24, "setOriginalImageSize:");
  [(CNPhotoPickerAnimojiProviderItem *)self edgeInsets];
  -[CNPhotoPickerAnimojiProviderItem setEdgeInsets:](v24, "setEdgeInsets:");

  return v24;
}

- (CNPhotoPickerAnimojiProviderItem)initWithAvatarRecord:(id)a3 imageProvider:(id)a4 renderingScope:(id)a5 renderingQueue:(id)a6 callbackQueue:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CNPhotoPickerAnimojiProviderItem;
  double v16 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:](&v19, sel_initWithImageData_thumbnailImageData_fullscreenImageData_imageFilterName_cropRect_renderingQueue_callbackQueue_, 0, 0, 0, 0, a6, a7, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  CGFloat v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_avatarRecord, a3);
    objc_storeStrong((id *)&v17->_imageProvider, a4);
    objc_storeStrong((id *)&v17->_renderingScope, a5);
  }

  return v17;
}

- (CNPhotoPickerAnimojiProviderItem)initWithOriginalImageData:(id)a3 cropRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v10 = a3;
  double v11 = [(CNPhotoPickerAnimojiProviderItem *)self imageData];
  v14.receiver = self;
  v14.super_class = (Class)CNPhotoPickerAnimojiProviderItem;
  double v12 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:](&v14, sel_initWithImageData_thumbnailImageData_fullscreenImageData_cropRect_, v11, 0, 0, x, y, width, height);

  if (v12) {
    objc_storeStrong((id *)&v12->__originalImageData, a3);
  }

  return v12;
}

- (CNPhotoPickerAnimojiProviderItem)initWithOriginalImageData:(id)a3 cropRect:(CGRect)a4 backgroundColorVariant:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = a3;
  id v13 = a5;
  objc_super v14 = [(CNPhotoPickerAnimojiProviderItem *)self imageData];
  v19.receiver = self;
  v19.super_class = (Class)CNPhotoPickerAnimojiProviderItem;
  id v15 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:](&v19, sel_initWithImageData_thumbnailImageData_fullscreenImageData_cropRect_, v14, 0, 0, x, y, width, height);

  if (v15)
  {
    objc_storeStrong((id *)&v15->__originalImageData, a3);
    objc_storeStrong((id *)&v15->_backgroundColorVariant, a5);
    id v16 = [(CNPhotoPickerAnimojiProviderItem *)v15 generateImageDataIfNeeded];
    CGFloat v17 = v15;
  }

  return v15;
}

- (CGAffineTransform)transformForMemojiMetadata
{
  [(CNPhotoPickerProviderItem *)self cropRect];
  double v6 = v5 / 3.0;
  [(CNPhotoPickerProviderItem *)self cropRect];
  double v8 = v7 / 3.0;
  [(CNPhotoPickerProviderItem *)self cropRect];
  double v10 = v9 / 3.0;
  [(CNPhotoPickerProviderItem *)self cropRect];
  double v12 = v11 / 3.0;
  id v13 = objc_alloc(MEMORY[0x1E4FB1818]);
  objc_super v14 = [(CNPhotoPickerAnimojiProviderItem *)self imageData];
  id v15 = (void *)[v13 initWithData:v14];

  [v15 size];
  double v17 = v16 / 3.0;
  [v15 size];
  double v19 = v18 / 3.0;
  v60.origin.double x = v6;
  v60.origin.double y = v8;
  v60.size.double width = v10;
  v60.size.double height = v12;
  if (CGRectEqualToRect(v60, *MEMORY[0x1E4F1DB28]))
  {
    double v8 = 0.0;
    double v12 = v19;
    double v10 = v17;
    double v6 = 0.0;
  }
  double v51 = v10;
  double v20 = v6;
  double v47 = v19;
  CGFloat v48 = v12;
  CGFloat v49 = v8;
  [(CNPhotoPickerAnimojiProviderItem *)self originalImageSize];
  double v22 = v21;
  [(CNPhotoPickerAnimojiProviderItem *)self originalImageSize];
  double v24 = v23;
  [(CNPhotoPickerAnimojiProviderItem *)self edgeInsets];
  double v26 = v25 / 3.0;
  [(CNPhotoPickerAnimojiProviderItem *)self edgeInsets];
  double v28 = v27 / 3.0;
  [(CNPhotoPickerAnimojiProviderItem *)self edgeInsets];
  double v30 = v29 / 3.0;
  [(CNPhotoPickerAnimojiProviderItem *)self edgeInsets];
  double v32 = v31 / 3.0;
  double v33 = floor(v17 / 1.1);
  double v34 = floor(v33 / (v22 / v24));
  if (v22 >= v24) {
    double v35 = v22;
  }
  else {
    double v35 = v24;
  }
  CGFloat v50 = v20;
  if (v33 != v34)
  {
    if (v35 == v33)
    {
      double v36 = (v33 - v34) * 0.5;
      double v26 = v26 + v36;
      double v30 = v30 + v36;
    }
    else
    {
      double v37 = (v34 - v33) * 0.5;
      double v28 = v28 + v37;
      double v32 = v32 + v37;
    }
  }
  CGFloat v38 = v35 - (v32 + v28);
  CGFloat v39 = v35 - (v30 + v26);
  double v40 = v35 * 0.5;
  v61.origin.double x = v28;
  v61.origin.double y = v26;
  v61.size.double width = v38;
  v61.size.double height = v39;
  double v41 = v40 - CGRectGetMidX(v61);
  v62.origin.double x = v28;
  v62.origin.double y = v26;
  v62.size.double width = v38;
  v62.size.double height = v39;
  CGFloat MidY = CGRectGetMidY(v62);
  memset(&v59, 0, sizeof(v59));
  CGAffineTransformMakeTranslation(&v59, v41 / v40, (v40 - MidY) / v40);
  v63.origin.double x = v50;
  v63.origin.double y = v49;
  v63.size.double width = v51;
  v63.size.double height = v48;
  double v43 = v17 * 0.5 - CGRectGetMidX(v63);
  v64.origin.double x = v50;
  v64.origin.double y = v49;
  v64.size.double width = v51;
  v64.size.double height = v48;
  CGFloat v44 = CGRectGetMidY(v64);
  memset(&v58, 0, sizeof(v58));
  CGAffineTransformMakeTranslation(&v58, v43 / (v17 * 0.5), (v47 * 0.5 - v44) / (v47 * 0.5));
  memset(&v57, 0, sizeof(v57));
  CGAffineTransform t1 = v59;
  CGAffineTransform t2 = v58;
  CGAffineTransformConcat(&v57, &t1, &t2);
  memset(&t1, 0, sizeof(t1));
  double v45 = v33 + -30.0;
  CGAffineTransformMakeScale(&t1, v33 / v45, v33 / v45);
  memset(&t2, 0, sizeof(t2));
  CGAffineTransformMakeScale(&t2, v45 / v51, v45 / v51);
  CGAffineTransform v53 = t1;
  memset(&v54, 0, sizeof(v54));
  CGAffineTransform v52 = t2;
  CGAffineTransformConcat(&v54, &v53, &v52);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransform v53 = v57;
  CGAffineTransform v52 = v54;
  CGAffineTransformConcat(retstr, &v53, &v52);

  return result;
}

- (void)updateVisualIdentity:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNPhotoPickerAnimojiProviderItem;
  [(CNPhotoPickerProviderItem *)&v16 updateVisualIdentity:v4];
  [v4 updateImageType:3];
  double v5 = [(CNPhotoPickerAnimojiProviderItem *)self backgroundColorVariant];

  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    [(CNPhotoPickerAnimojiProviderItem *)self transformForMemojiMetadata];
    double v6 = (void *)MEMORY[0x1E4F1BA30];
    double v7 = [(CNPhotoPickerAnimojiProviderItem *)self avatarRecord];
    double v8 = [(CNPhotoPickerAnimojiProviderItem *)self poseConfiguration];
    double v9 = [(CNPhotoPickerAnimojiProviderItem *)self backgroundColorVariant];
    double v10 = [v9 colorName];
    v12[0] = v13;
    v12[1] = v14;
    v12[2] = v15;
    double v11 = [v6 memojiMetadataDataForAvatarRecord:v7 poseConfiguration:v8 backgroundColorDescription:v10 cropTransform:v12];
    [v4 setMemojiMetadata:v11];
  }
  else
  {
    [v4 setMemojiMetadata:0];
  }
}

- (id)originalImageData
{
  return self->__originalImageData;
}

- (id)imageData
{
  id v3 = [(CNPhotoPickerAnimojiProviderItem *)self _generatedImageData];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNPhotoPickerAnimojiProviderItem;
    id v5 = [(CNPhotoPickerProviderItem *)&v8 imageData];
  }
  double v6 = v5;

  return v6;
}

- (BOOL)shouldShowCaption
{
  return 0;
}

- (BOOL)allowsMoveAndScale
{
  return 0;
}

- (id)localizedVariantsTitle
{
  id v2 = [(CNPhotoPickerAnimojiProviderItem *)self originalImageData];
  id v3 = CNContactsUIBundle();
  id v4 = v3;
  if (v2) {
    id v5 = @"PHOTO_SELECT_COLOR";
  }
  else {
    id v5 = @"PHOTO_ANIMOJI_SELECT_POSE";
  }
  double v6 = [v3 localizedStringForKey:v5 value:&stru_1ED8AC728 table:@"Localized"];

  return v6;
}

- (BOOL)allowsVariants
{
  id v2 = [(CNPhotoPickerAnimojiProviderItem *)self originalImageData];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CNPhotoPickerAnimojiProviderItem;
  id v4 = [(CNPhotoPickerProviderItem *)&v11 copyWithZone:a3];
  id v5 = [(CNPhotoPickerAnimojiProviderItem *)self _generatedImageData];
  objc_msgSend(v4, "set_generatedImageData:", v5);

  double v6 = [(CNPhotoPickerAnimojiProviderItem *)self _originalImageData];
  objc_msgSend(v4, "set_originalImageData:", v6);

  double v7 = [(CNPhotoPickerAnimojiProviderItem *)self backgroundColorVariant];
  [v4 setBackgroundColorVariant:v7];

  objc_super v8 = [(CNPhotoPickerAnimojiProviderItem *)self avatarRecord];
  [v4 setAvatarRecord:v8];

  double v9 = [(CNPhotoPickerAnimojiProviderItem *)self poseConfiguration];
  [v4 setPoseConfiguration:v9];

  [(CNPhotoPickerAnimojiProviderItem *)self originalImageSize];
  objc_msgSend(v4, "setOriginalImageSize:");
  [(CNPhotoPickerAnimojiProviderItem *)self edgeInsets];
  objc_msgSend(v4, "setEdgeInsets:");
  return v4;
}

+ (id)log
{
  if (log_cn_once_token_1_50309 != -1) {
    dispatch_once(&log_cn_once_token_1_50309, &__block_literal_global_50310);
  }
  id v2 = (void *)log_cn_once_object_1_50311;

  return v2;
}

void __39__CNPhotoPickerAnimojiProviderItem_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNPhotoPickerAnimojiProviderItem");
  v1 = (void *)log_cn_once_object_1_50311;
  log_cn_once_object_1_50311 = (uint64_t)v0;
}

@end