@interface CNPhotoPickerRecentsProvider
+ (id)log;
+ (id)poseConfigurationFromAvatarRecord:(id)a3 contactImage:(id)a4;
+ (id)poseConfigurationFromContactImage:(id)a3;
- (BOOL)containsContactImage;
- (BOOL)containsMonogram;
- (CNPhotoPickerRecentsProvider)initWithVisualIdentity:(id)a3;
- (CNVisualIdentity)visualIdentity;
- (NSString)identifier;
- (id)defaultProviderItemWithContactImage:(id)a3 renderingQueue:(id)a4 callbackQueue:(id)a5;
- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8;
- (id)providerItemForContactImage:(id)a3 size:(CGSize)a4 scale:(double)a5 RTL:(BOOL)a6 renderingQueue:(id)a7 callbackQueue:(id)a8;
- (id)providerItemForContactImage:(id)a3 size:(CGSize)a4 scale:(double)a5 RTL:(BOOL)a6 renderingQueue:(id)a7 callbackQueue:(id)a8 fallbackToDefaultItem:(BOOL)a9;
- (void)setContainsContactImage:(BOOL)a3;
- (void)setContainsMonogram:(BOOL)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation CNPhotoPickerRecentsProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualIdentity, 0);

  objc_storeStrong((id *)&self->identifier, 0);
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (void)setContainsMonogram:(BOOL)a3
{
  self->_containsMonogram = a3;
}

- (BOOL)containsMonogram
{
  return self->_containsMonogram;
}

- (void)setContainsContactImage:(BOOL)a3
{
  self->_containsContactImage = a3;
}

- (BOOL)containsContactImage
{
  return self->_containsContactImage;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->identifier;
}

- (id)defaultProviderItemWithContactImage:(id)a3 renderingQueue:(id)a4 callbackQueue:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [CNPhotoPickerRecentsProviderItem alloc];
  v11 = [v9 imageData];
  v12 = [v9 variant];
  [v9 cropRect];
  v13 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:](v10, "initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:", v11, 0, 0, v12, v8, v7);

  v14 = [v9 identifier];

  [(CNPhotoPickerProviderItem *)v13 setRecentsIdentifier:v14];

  return v13;
}

- (id)providerItemForContactImage:(id)a3 size:(CGSize)a4 scale:(double)a5 RTL:(BOOL)a6 renderingQueue:(id)a7 callbackQueue:(id)a8 fallbackToDefaultItem:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v12 = a6;
  double height = a4.height;
  double width = a4.width;
  id v17 = a3;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = [v17 source];
  if (v20 == 4)
  {
    uint64_t v35 = *MEMORY[0x1E4F5A298];
    v36 = [v17 displayString];
    LODWORD(v35) = (*(uint64_t (**)(uint64_t, void *))(v35 + 16))(v35, v36);

    if (v35) {
      BOOL v37 = !v9;
    }
    else {
      BOOL v37 = 1;
    }
    if (v37)
    {
      v38 = [CNPhotoPickerEmojiProviderItem alloc];
      v39 = [v17 displayString];
      v40 = [v17 variant];
      v41 = +[CNPhotoPickerVariantsManager colorVariantWithColorNamed:v40];
      v30 = -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:](v38, "initWithStringRepresentation:backgroundColorVariant:size:", v39, v41, width, height);

      v42 = [v17 identifier];
      [(CNPhotoPickerProviderItem *)v30 setRecentsIdentifier:v42];

      goto LABEL_24;
    }
    goto LABEL_17;
  }
  if (v20 == 3)
  {
    v43 = [v17 variant];

    if (v43)
    {
      v44 = [CNPhotoPickerAnimojiProviderItem alloc];
      v45 = [v17 imageData];
      [v17 cropRect];
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;
      double v53 = v52;
      v54 = [v17 variant];
      v55 = +[CNPhotoPickerVariantsManager colorVariantWithColorNamed:v54];
      v30 = -[CNPhotoPickerAnimojiProviderItem initWithOriginalImageData:cropRect:backgroundColorVariant:](v44, "initWithOriginalImageData:cropRect:backgroundColorVariant:", v45, v55, v47, v49, v51, v53);

      v56 = [v17 identifier];
      [(CNPhotoPickerProviderItem *)v30 setRecentsIdentifier:v56];

      v57 = [v17 poseConfigurationData];

      if (!v57) {
        goto LABEL_24;
      }
      v58 = (void *)MEMORY[0x1E4F1BA30];
      v59 = [v17 sourceIdentifier];
      v21 = [v58 avatarRecordForIdentifier:v59];

      if (v21)
      {
        [(CNPhotoPickerEmojiProviderItem *)v30 setAvatarRecord:v21];
        v60 = [(id)objc_opt_class() poseConfigurationFromAvatarRecord:v21 contactImage:v17];
        [(CNPhotoPickerEmojiProviderItem *)v30 setPoseConfiguration:v60];
      }
      goto LABEL_23;
    }
    if (!v9)
    {
      v30 = 0;
      goto LABEL_24;
    }
LABEL_17:
    v30 = [(CNPhotoPickerRecentsProvider *)self defaultProviderItemWithContactImage:v17 renderingQueue:v18 callbackQueue:v19];
    goto LABEL_24;
  }
  if (v20 != 1) {
    goto LABEL_17;
  }
  v21 = +[CNAvatarImageRendererSettings defaultSettings];
  v22 = [[CNAvatarImageRenderer alloc] initWithSettings:v21];
  v23 = [v17 variant];

  if (v23)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F89D48]);
    v25 = [v17 variant];
    v26 = (void *)[v24 initWithColorName:v25];

    v27 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:color:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:color:", v12, 0, v26, width, height, a5);
    v28 = [CNPhotoPickerMonogramProviderItem alloc];
    v29 = [v17 imageData];
    v30 = -[CNPhotoPickerMonogramProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:renderingScope:avatarRenderer:isVariantOptionItem:](v28, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:renderingScope:avatarRenderer:isVariantOptionItem:", v29, 0, 0, v27, v22, 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

    v31 = [v17 displayString];
    [(CNPhotoPickerEmojiProviderItem *)v30 setMonogramText:v31];

    v32 = [(CNPhotoPickerRecentsProvider *)self visualIdentity];
    v33 = (void *)[v32 mutableCopy];
    [(CNPhotoPickerEmojiProviderItem *)v30 setVisualIdentity:v33];

    [(CNPhotoPickerEmojiProviderItem *)v30 setAvatarRenderer:v22];
    [(CNPhotoPickerEmojiProviderItem *)v30 setRenderingScope:v27];
    v34 = [v17 identifier];
    [(CNPhotoPickerProviderItem *)v30 setRecentsIdentifier:v34];
  }
  else if (v9)
  {
    v30 = [(CNPhotoPickerRecentsProvider *)self defaultProviderItemWithContactImage:v17 renderingQueue:v18 callbackQueue:v19];
  }
  else
  {
    v30 = 0;
  }

LABEL_23:
LABEL_24:

  return v30;
}

- (id)providerItemForContactImage:(id)a3 size:(CGSize)a4 scale:(double)a5 RTL:(BOOL)a6 renderingQueue:(id)a7 callbackQueue:(id)a8
{
  return -[CNPhotoPickerRecentsProvider providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:fallbackToDefaultItem:](self, "providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:fallbackToDefaultItem:", a3, a6, a7, a8, 0, a4.width, a4.height, a5);
}

- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v53[1] = *MEMORY[0x1E4F143B8];
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = [(CNPhotoPickerRecentsProvider *)self visualIdentity];
  id v19 = [v18 identifier];

  if (v19)
  {
    [(CNPhotoPickerRecentsProvider *)self setContainsContactImage:0];
    [(CNPhotoPickerRecentsProvider *)self setContainsMonogram:0];
    id v20 = objc_alloc_init(MEMORY[0x1E4F1B930]);
    v21 = (void *)MEMORY[0x1E4F1B920];
    v22 = [(CNPhotoPickerRecentsProvider *)self visualIdentity];
    v23 = [v22 identifier];
    v53[0] = v23;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
    v25 = [v21 recentImagesRequestForContactIdenfitiers:v24];

    id v51 = 0;
    v26 = [v20 performFetchRequest:v25 error:&v51];
    id v27 = v51;
    v28 = (void *)MEMORY[0x1E4F1CBF0];
    if (!v27 && v26)
    {
      uint64_t v45 = 0;
      double v46 = &v45;
      uint64_t v47 = 0x3032000000;
      double v48 = __Block_byref_object_copy__23816;
      double v49 = __Block_byref_object_dispose__23817;
      id v50 = 0;
      uint64_t v32 = MEMORY[0x1E4F143A8];
      uint64_t v33 = 3221225472;
      v34 = __101__CNPhotoPickerRecentsProvider_loadItemsForSize_scale_RTL_renderingQueue_callbackQueue_itemDelegate___block_invoke;
      uint64_t v35 = &unk_1E5498278;
      v36 = self;
      CGFloat v41 = width;
      CGFloat v42 = height;
      double v43 = a4;
      BOOL v44 = a5;
      id v37 = v15;
      id v38 = v16;
      v40 = &v45;
      id v39 = v17;
      v28 = objc_msgSend(v26, "_cn_compactMap:", &v32);
      if (v46[5])
      {
        uint64_t v52 = v46[5];
        v29 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v52, 1, v32, v33, v34, v35, v36, v37, v38);
        uint64_t v30 = [v29 arrayByAddingObjectsFromArray:v28];

        v28 = (void *)v30;
      }

      _Block_object_dispose(&v45, 8);
    }
  }
  else
  {
    v28 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v28;
}

id __101__CNPhotoPickerRecentsProvider_loadItemsForSize_scale_RTL_renderingQueue_callbackQueue_itemDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:", v3, *(unsigned __int8 *)(a1 + 96), *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v5 = v4;
  if (!v4) {
    goto LABEL_15;
  }
  [v4 cropRect];
  double v7 = v6;
  double v9 = v8;
  v10 = [*(id *)(a1 + 32) visualIdentity];
  [v10 cropRect];
  if (v7 == v12 && v9 == v11)
  {
    [v5 cropRect];
    double v16 = v15;
    id v17 = [*(id *)(a1 + 32) visualIdentity];
    [v17 cropRect];
    BOOL v14 = v16 == v18;
  }
  else
  {
    BOOL v14 = 0;
  }

  if ([v5 imageType] == 2 || (objc_msgSend(v5, "imageType") == 4 ? (int v19 = 1) : (int v19 = v14), v19 == 1))
  {
    id v20 = [v5 imageData];
    v21 = [*(id *)(a1 + 32) visualIdentity];
    v22 = [v21 imageData];
    int v23 = [v20 isEqualToData:v22];

    if (v23)
    {
      [*(id *)(a1 + 32) setContainsContactImage:1];
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v5);
LABEL_15:
      id v24 = 0;
      goto LABEL_19;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) setContainsMonogram:1];
  }
  v25 = [v3 lastUsedDate];
  [v5 setSortDate:v25];

  [v5 setDelegate:*(void *)(a1 + 56)];
  id v24 = v5;
LABEL_19:

  return v24;
}

- (CNPhotoPickerRecentsProvider)initWithVisualIdentity:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNPhotoPickerRecentsProvider;
  double v6 = [(CNPhotoPickerRecentsProvider *)&v13 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_visualIdentity, a3);
    double v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    identifier = v7->identifier;
    v7->identifier = (NSString *)v9;

    double v11 = v7;
  }

  return v7;
}

+ (id)poseConfigurationFromContactImage:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1BA30];
  id v5 = [v3 sourceIdentifier];
  double v6 = [v4 avatarRecordForIdentifier:v5];

  if (v6)
  {
    double v7 = (void *)MEMORY[0x1E4F1BA30];
    double v8 = [v3 poseConfigurationData];
    uint64_t v9 = [v7 poseConfigurationForData:v8 withAvatarRecord:v6];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)poseConfigurationFromAvatarRecord:(id)a3 contactImage:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1BA30];
  id v6 = a3;
  double v7 = [a4 poseConfigurationData];
  double v8 = [v5 poseConfigurationForData:v7 withAvatarRecord:v6];

  return v8;
}

+ (id)log
{
  if (log_cn_once_token_1_23829 != -1) {
    dispatch_once(&log_cn_once_token_1_23829, &__block_literal_global_23830);
  }
  v2 = (void *)log_cn_once_object_1_23831;

  return v2;
}

void __35__CNPhotoPickerRecentsProvider_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNPhotoPickerRecentsProvider");
  v1 = (void *)log_cn_once_object_1_23831;
  log_cn_once_object_1_23831 = (uint64_t)v0;
}

@end