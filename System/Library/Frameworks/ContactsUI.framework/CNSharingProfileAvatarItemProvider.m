@interface CNSharingProfileAvatarItemProvider
+ (id)animojiItemWithRecord:(id)a3 stickerConfiguration:(id)a4 backgroundColor:(id)a5;
+ (id)compositeImageForImage:(id)a3 backgroundImage:(id)a4;
+ (id)contactImageItemWithContact:(id)a3 renderer:(id)a4 logger:(id)a5 type:(int64_t)a6;
+ (id)descriptorForRequiredKeys;
+ (id)monogramImageItemWithContact:(id)a3 monogramColor:(id)a4 renderer:(id)a5 RTL:(BOOL)a6;
+ (id)originalAnimojiImageForRecord:(id)a3 stickerConfiguration:(id)a4 size:(CGSize)a5;
+ (id)silhouetteImageItemWithRenderer:(id)a3;
+ (id)unposedImageForAvatarRecord:(id)a3;
- (AVTAvatarRecord)avatarRecord;
- (BOOL)contactHasImageOfPhotoType:(id)a3;
- (BOOL)contactIsFromFullPhotoPicker;
- (BOOL)shouldIncludeAnimoji;
- (BOOL)shouldIncludeMonogram;
- (BOOL)shouldIncludePhoto;
- (BOOL)shouldIncludeSilhouette;
- (BOOL)useRTL;
- (CNAvatarImageRenderer)renderer;
- (CNContact)contact;
- (CNPhotoPickerColorVariant)animojiColor;
- (CNPhotoPickerVariantsManager)variantsManager;
- (CNSharingProfileAvatarItem)animojiItem;
- (CNSharingProfileAvatarItem)monogramItem;
- (CNSharingProfileAvatarItem)photoItem;
- (CNSharingProfileAvatarItem)previousAnimojiItem;
- (CNSharingProfileAvatarItem)previousPhotoItem;
- (CNSharingProfileAvatarItem)silhouetteItem;
- (CNSharingProfileAvatarItemProvider)initWithContact:(id)a3 avatarRecord:(id)a4 logger:(id)a5;
- (CNSharingProfileAvatarItemProviderConfiguration)configuration;
- (CNSharingProfileLogger)logger;
- (NSArray)avatarItems;
- (NSArray)items;
- (NSData)memojiMetadata;
- (PRMonogramColor)monogramColor;
- (id)animojColor;
- (void)buildItems;
- (void)clearCachedItems;
- (void)pickRandomColors;
- (void)setAnimojiColor:(id)a3;
- (void)setAnimojiItem:(id)a3;
- (void)setAvatarRecord:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactIsFromFullPhotoPicker:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setLogger:(id)a3;
- (void)setMemojiMetadata:(id)a3;
- (void)setMonogramColor:(id)a3;
- (void)setMonogramItem:(id)a3;
- (void)setPhotoItem:(id)a3;
- (void)setPreviousAnimojiItem:(id)a3;
- (void)setPreviousPhotoItem:(id)a3;
- (void)setRenderer:(id)a3;
- (void)setShouldIncludeAnimoji:(BOOL)a3;
- (void)setShouldIncludeMonogram:(BOOL)a3;
- (void)setShouldIncludePhoto:(BOOL)a3;
- (void)setShouldIncludeSilhouette:(BOOL)a3;
- (void)setSilhouetteItem:(id)a3;
- (void)setUseRTL:(BOOL)a3;
- (void)setVariantsManager:(id)a3;
- (void)updateWithContact:(id)a3 fromFullPhotoPicker:(BOOL)a4;
@end

@implementation CNSharingProfileAvatarItemProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animojiColor, 0);
  objc_storeStrong((id *)&self->_previousPhotoItem, 0);
  objc_storeStrong((id *)&self->_previousAnimojiItem, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_monogramItem, 0);
  objc_storeStrong((id *)&self->_photoItem, 0);
  objc_storeStrong((id *)&self->_animojiItem, 0);

  objc_storeStrong((id *)&self->_silhouetteItem, 0);
}

- (CNPhotoPickerColorVariant)animojiColor
{
  return self->_animojiColor;
}

- (void)setUseRTL:(BOOL)a3
{
  self->_useRTL = a3;
}

- (BOOL)useRTL
{
  return self->_useRTL;
}

- (void)setPreviousPhotoItem:(id)a3
{
}

- (CNSharingProfileAvatarItem)previousPhotoItem
{
  return self->_previousPhotoItem;
}

- (void)setPreviousAnimojiItem:(id)a3
{
}

- (CNSharingProfileAvatarItem)previousAnimojiItem
{
  return self->_previousAnimojiItem;
}

- (void)setContactIsFromFullPhotoPicker:(BOOL)a3
{
  self->_contactIsFromFullPhotoPicker = a3;
}

- (BOOL)contactIsFromFullPhotoPicker
{
  return self->_contactIsFromFullPhotoPicker;
}

- (void)setItems:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setVariantsManager:(id)a3
{
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setRenderer:(id)a3
{
}

- (CNAvatarImageRenderer)renderer
{
  return self->_renderer;
}

- (void)setAvatarRecord:(id)a3
{
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setLogger:(id)a3
{
}

- (CNSharingProfileLogger)logger
{
  return self->_logger;
}

- (CNSharingProfileAvatarItemProviderConfiguration)configuration
{
  return self->_configuration;
}

- (void)setMonogramItem:(id)a3
{
}

- (void)setPhotoItem:(id)a3
{
}

- (void)setAnimojiItem:(id)a3
{
}

- (void)setSilhouetteItem:(id)a3
{
}

- (void)setShouldIncludeMonogram:(BOOL)a3
{
  self->_shouldIncludeMonogram = a3;
}

- (BOOL)shouldIncludeMonogram
{
  return self->_shouldIncludeMonogram;
}

- (void)setShouldIncludePhoto:(BOOL)a3
{
  self->_shouldIncludePhoto = a3;
}

- (BOOL)shouldIncludePhoto
{
  return self->_shouldIncludePhoto;
}

- (void)setShouldIncludeAnimoji:(BOOL)a3
{
  self->_shouldIncludeAnimoji = a3;
}

- (BOOL)shouldIncludeAnimoji
{
  return self->_shouldIncludeAnimoji;
}

- (void)setShouldIncludeSilhouette:(BOOL)a3
{
  self->_shouldIncludeSilhouette = a3;
}

- (BOOL)shouldIncludeSilhouette
{
  return self->_shouldIncludeSilhouette;
}

- (void)clearCachedItems
{
  silhouetteItem = self->_silhouetteItem;
  self->_silhouetteItem = 0;

  animojiItem = self->_animojiItem;
  self->_animojiItem = 0;

  photoItem = self->_photoItem;
  self->_photoItem = 0;

  monogramItem = self->_monogramItem;
  self->_monogramItem = 0;

  items = self->_items;
  self->_items = 0;
}

- (CNSharingProfileAvatarItem)monogramItem
{
  monogramItem = self->_monogramItem;
  if (!monogramItem)
  {
    if (self->_shouldIncludeMonogram)
    {
      [(CNSharingProfileAvatarItemProvider *)self buildItems];
      monogramItem = self->_monogramItem;
    }
    else
    {
      monogramItem = 0;
    }
  }

  return monogramItem;
}

- (CNSharingProfileAvatarItem)photoItem
{
  photoItem = self->_photoItem;
  if (!photoItem)
  {
    if (self->_shouldIncludePhoto)
    {
      [(CNSharingProfileAvatarItemProvider *)self buildItems];
      photoItem = self->_photoItem;
    }
    else
    {
      photoItem = 0;
    }
  }

  return photoItem;
}

- (CNSharingProfileAvatarItem)animojiItem
{
  animojiItem = self->_animojiItem;
  if (!animojiItem)
  {
    if (self->_shouldIncludeAnimoji)
    {
      [(CNSharingProfileAvatarItemProvider *)self buildItems];
      animojiItem = self->_animojiItem;
    }
    else
    {
      animojiItem = 0;
    }
  }

  return animojiItem;
}

- (CNSharingProfileAvatarItem)silhouetteItem
{
  silhouetteItem = self->_silhouetteItem;
  if (!silhouetteItem)
  {
    if (self->_shouldIncludeSilhouette)
    {
      [(CNSharingProfileAvatarItemProvider *)self buildItems];
      silhouetteItem = self->_silhouetteItem;
    }
    else
    {
      silhouetteItem = 0;
    }
  }

  return silhouetteItem;
}

- (NSData)memojiMetadata
{
  return [(CNSharingProfileAvatarItemProviderConfiguration *)self->_configuration memojiMetadata];
}

- (void)setMemojiMetadata:(id)a3
{
  id v6 = a3;
  v4 = [(CNSharingProfileAvatarItemProviderConfiguration *)self->_configuration memojiMetadata];
  char v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0) {
    [(CNSharingProfileAvatarItemProviderConfiguration *)self->_configuration setMemojiMetadata:v6];
  }
}

- (id)animojColor
{
  return [(CNSharingProfileAvatarItemProviderConfiguration *)self->_configuration animojiColor];
}

- (void)setAnimojiColor:(id)a3
{
  id v6 = a3;
  id v4 = [(CNSharingProfileAvatarItemProviderConfiguration *)self->_configuration animojiColor];

  char v5 = v6;
  if (v4 != v6)
  {
    [(CNSharingProfileAvatarItemProviderConfiguration *)self->_configuration setAnimojiColor:v6];
    char v5 = v6;
  }
}

- (PRMonogramColor)monogramColor
{
  return [(CNSharingProfileAvatarItemProviderConfiguration *)self->_configuration monogramColor];
}

- (void)setMonogramColor:(id)a3
{
  id v6 = a3;
  id v4 = [(CNSharingProfileAvatarItemProviderConfiguration *)self->_configuration monogramColor];

  char v5 = v6;
  if (v4 != v6)
  {
    [(CNSharingProfileAvatarItemProviderConfiguration *)self->_configuration setMonogramColor:v6];
    char v5 = v6;
  }
}

- (void)updateWithContact:(id)a3 fromFullPhotoPicker:(BOOL)a4
{
  v7 = (CNContact *)a3;
  contact = self->_contact;
  self->_contactIsFromFullPhotoPicker = a4;
  if (contact != v7)
  {
    v9 = v7;
    objc_storeStrong((id *)&self->_contact, a3);
    [(CNSharingProfileAvatarItemProvider *)self clearCachedItems];
    v7 = v9;
  }
}

- (void)buildItems
{
  id v50 = [MEMORY[0x1E4F1CA48] array];
  if (self->_shouldIncludeSilhouette)
  {
    if (self->_silhouetteItem
      || ([(id)objc_opt_class() silhouetteImageItemWithRenderer:self->_renderer],
          v3 = (CNSharingProfileAvatarItem *)objc_claimAutoreleasedReturnValue(),
          silhouetteItem = self->_silhouetteItem,
          self->_silhouetteItem = v3,
          silhouetteItem,
          self->_silhouetteItem))
    {
      objc_msgSend(v50, "addObject:");
    }
  }
  if (self->_shouldIncludeAnimoji)
  {
    if (self->_animojiItem)
    {
LABEL_16:
      v21 = [(CNSharingProfileAvatarItemProviderConfiguration *)self->_configuration memojiMetadata];
      [(CNSharingProfileAvatarItem *)self->_animojiItem setMemojiMetadata:v21];

      [v50 addObject:self->_animojiItem];
      animojiItem = self->_animojiItem;
      if (self->_previousAnimojiItem != animojiItem) {
        objc_storeStrong((id *)&self->_previousAnimojiItem, animojiItem);
      }
      goto LABEL_18;
    }
    if ([(CNContact *)self->_contact imageDataAvailable]
      && [(CNContact *)self->_contact hasImageOfType:3])
    {
      char v5 = objc_opt_class();
      contact = self->_contact;
      renderer = self->_renderer;
      v8 = [(CNSharingProfileAvatarItemProvider *)self logger];
      v9 = [v5 contactImageItemWithContact:contact renderer:renderer logger:v8 type:3];

      [(CNSharingProfileAvatarItem *)v9 setWasSetFromFullPhotoPicker:self->_contactIsFromFullPhotoPicker];
      v10 = self->_animojiItem;
      self->_animojiItem = v9;
    }
    else
    {
      previousAnimojiItem = self->_previousAnimojiItem;
      if (previousAnimojiItem)
      {
        v12 = previousAnimojiItem;
        v10 = self->_animojiItem;
        self->_animojiItem = v12;
      }
      else
      {
        if (!self->_avatarRecord) {
          goto LABEL_15;
        }
        v10 = +[CNPhotoPickerVariantsManager sharingProfileAvatarPoseConfigurationForAvatarRecord:](CNPhotoPickerVariantsManager, "sharingProfileAvatarPoseConfigurationForAvatarRecord:");
        v13 = objc_opt_class();
        avatarRecord = self->_avatarRecord;
        v15 = [(CNSharingProfileAvatarItemProviderConfiguration *)self->_configuration animojiColor];
        v16 = [v15 color];
        v17 = [v13 animojiItemWithRecord:avatarRecord stickerConfiguration:v10 backgroundColor:v16];

        v18 = [(CNSharingProfileAvatarItemProviderConfiguration *)self->_configuration animojiColor];
        v19 = [v18 colorName];
        [(CNSharingProfileAvatarItem *)v17 setVariantIdentifier:v19];

        v20 = self->_animojiItem;
        self->_animojiItem = v17;
      }
    }

LABEL_15:
    if (!self->_animojiItem) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
LABEL_18:
  if (!self->_shouldIncludePhoto) {
    goto LABEL_29;
  }
  if (!self->_photoItem)
  {
    if ([(CNSharingProfileAvatarItemProvider *)self contactHasImageOfPhotoType:self->_contact])
    {
      uint64_t v23 = objc_opt_class();
      v24 = self->_contact;
      v25 = self->_renderer;
      v26 = [(CNSharingProfileAvatarItemProvider *)self logger];
      v27 = (void *)v23;
      v28 = v24;
      v29 = v25;
      v30 = v26;
      uint64_t v31 = 4;
    }
    else
    {
      if ([(CNContact *)self->_contact rawImageType] != 4)
      {
        previousPhotoItem = self->_previousPhotoItem;
        if (!previousPhotoItem)
        {
LABEL_26:
          if (!self->_photoItem) {
            goto LABEL_29;
          }
          goto LABEL_27;
        }
        v35 = previousPhotoItem;
LABEL_25:
        photoItem = self->_photoItem;
        self->_photoItem = v35;

        goto LABEL_26;
      }
      uint64_t v32 = objc_opt_class();
      v33 = self->_contact;
      v34 = self->_renderer;
      v26 = [(CNSharingProfileAvatarItemProvider *)self logger];
      v27 = (void *)v32;
      v28 = v33;
      v29 = v34;
      v30 = v26;
      uint64_t v31 = 5;
    }
    v35 = [v27 contactImageItemWithContact:v28 renderer:v29 logger:v30 type:v31];

    [(CNSharingProfileAvatarItem *)v35 setWasSetFromFullPhotoPicker:self->_contactIsFromFullPhotoPicker];
    goto LABEL_25;
  }
LABEL_27:
  objc_msgSend(v50, "addObject:");
  v37 = self->_photoItem;
  if (self->_previousPhotoItem != v37) {
    objc_storeStrong((id *)&self->_previousPhotoItem, v37);
  }
LABEL_29:
  if (self->_shouldIncludeMonogram)
  {
    monogramItem = self->_monogramItem;
    if (!monogramItem)
    {
      v39 = objc_opt_class();
      v40 = self->_contact;
      v41 = [(CNSharingProfileAvatarItemProviderConfiguration *)self->_configuration monogramColor];
      v42 = [v39 monogramImageItemWithContact:v40 monogramColor:v41 renderer:self->_renderer RTL:0];

      if ([(CNContact *)self->_contact rawImageType] == 2)
      {
        BOOL v43 = [(CNSharingProfileAvatarItem *)v42 wasSetFromFullPhotoPicker]
           || self->_contactIsFromFullPhotoPicker;
        [(CNSharingProfileAvatarItem *)v42 setWasSetFromFullPhotoPicker:v43];
      }
      v45 = [(CNSharingProfileAvatarItemProviderConfiguration *)self->_configuration monogramColor];
      v46 = [v45 colorName];
      [(CNSharingProfileAvatarItem *)v42 setVariantIdentifier:v46];

      v47 = self->_monogramItem;
      self->_monogramItem = v42;

      monogramItem = self->_monogramItem;
    }
    [v50 addObject:monogramItem];
  }
  v48 = (NSArray *)[v50 copy];
  items = self->_items;
  self->_items = v48;
}

- (BOOL)contactHasImageOfPhotoType:(id)a3
{
  id v3 = a3;
  if ([v3 imageDataAvailable]) {
    BOOL v4 = [v3 rawImageType] == 1 || objc_msgSend(v3, "rawImageType") == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSArray)avatarItems
{
  [(CNSharingProfileAvatarItemProvider *)self buildItems];
  items = self->_items;

  return items;
}

- (void)setConfiguration:(id)a3
{
  char v5 = (CNSharingProfileAvatarItemProviderConfiguration *)a3;
  if (v5)
  {
    configuration = self->_configuration;
    p_configuration = &self->_configuration;
    if (configuration != v5)
    {
      v8 = v5;
      objc_storeStrong((id *)p_configuration, a3);
      char v5 = v8;
    }
  }
}

- (void)pickRandomColors
{
  variantsManager = self->_variantsManager;
  if (!variantsManager)
  {
    BOOL v4 = objc_alloc_init(CNPhotoPickerVariantsManager);
    char v5 = self->_variantsManager;
    self->_variantsManager = v4;

    variantsManager = self->_variantsManager;
  }
  id v6 = [(CNPhotoPickerVariantsManager *)variantsManager avatarBackgrounds];
  int v7 = [v6 count];

  uint64_t v8 = arc4random_uniform(v7 - 1);
  v9 = [(CNPhotoPickerVariantsManager *)self->_variantsManager avatarBackgrounds];
  v10 = [v9 objectAtIndexedSubscript:v8 + 1];
  [(CNSharingProfileAvatarItemProviderConfiguration *)self->_configuration setAnimojiColor:v10];

  id v12 = [MEMORY[0x1E4F89D48] availableColors];
  v11 = objc_msgSend(v12, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v12, "count") - 1) + 1);
  [(CNSharingProfileAvatarItemProviderConfiguration *)self->_configuration setMonogramColor:v11];
}

- (CNSharingProfileAvatarItemProvider)initWithContact:(id)a3 avatarRecord:(id)a4 logger:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CNSharingProfileAvatarItemProvider;
  id v12 = [(CNSharingProfileAvatarItemProvider *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contact, a3);
    objc_storeStrong((id *)&v13->_avatarRecord, a4);
    objc_storeStrong((id *)&v13->_logger, a5);
    v14 = +[CNAvatarImageRendererSettings defaultSettings];
    v15 = [[CNAvatarImageRenderer alloc] initWithSettings:v14];
    renderer = v13->_renderer;
    v13->_renderer = v15;

    *(_WORD *)&v13->_shouldIncludeAnimoji = 257;
    v13->_shouldIncludeMonogram = 1;
    v17 = objc_alloc_init(CNSharingProfileAvatarItemProviderConfiguration);
    configuration = v13->_configuration;
    v13->_configuration = v17;

    v13->_useRTL = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1;
    [(CNSharingProfileAvatarItemProvider *)v13 pickRandomColors];
    v19 = v13;
  }
  return v13;
}

+ (id)compositeImageForImage:(id)a3 backgroundImage:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 size];
  double v8 = v7;
  [v6 size];
  double v10 = v9;
  [v6 scale];
  CGFloat v12 = v11;
  v17.width = v8;
  v17.height = v10;
  UIGraphicsBeginImageContextWithOptions(v17, 0, v12);
  id v13 = UIGraphicsGetImageFromCurrentImageContext();
  objc_msgSend(v5, "drawInRect:", 0.0, 0.0, v8, v10);

  objc_msgSend(v6, "drawInRect:", 0.0, 0.0, v8, v10);
  v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v14;
}

+ (id)unposedImageForAvatarRecord:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  BOOL v4 = (void *)getAVTAvatarRecordImageProviderClass_softClass_32498;
  uint64_t v20 = getAVTAvatarRecordImageProviderClass_softClass_32498;
  if (!getAVTAvatarRecordImageProviderClass_softClass_32498)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __getAVTAvatarRecordImageProviderClass_block_invoke_32499;
    v15 = &unk_1E549AD00;
    v16 = &v17;
    __getAVTAvatarRecordImageProviderClass_block_invoke_32499((uint64_t)&v12);
    BOOL v4 = (void *)v18[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v17, 8);
  id v6 = objc_alloc_init(v5);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  double v7 = (void *)getAVTRenderingScopeClass_softClass_32500;
  uint64_t v20 = getAVTRenderingScopeClass_softClass_32500;
  if (!getAVTRenderingScopeClass_softClass_32500)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __getAVTRenderingScopeClass_block_invoke_32501;
    v15 = &unk_1E549AD00;
    v16 = &v17;
    __getAVTRenderingScopeClass_block_invoke_32501((uint64_t)&v12);
    double v7 = (void *)v18[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v17, 8);
  double v9 = [v8 largeThumbnailScope];
  double v10 = [v6 imageForRecord:v3 scope:v9];

  return v10;
}

+ (id)animojiItemWithRecord:(id)a3 stickerConfiguration:(id)a4 backgroundColor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [CNSharingProfileAvatarItem alloc];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __97__CNSharingProfileAvatarItemProvider_animojiItemWithRecord_stickerConfiguration_backgroundColor___block_invoke;
  v21[3] = &unk_1E5499130;
  id v25 = a1;
  id v22 = v8;
  id v23 = v9;
  id v24 = v10;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __97__CNSharingProfileAvatarItemProvider_animojiItemWithRecord_stickerConfiguration_backgroundColor___block_invoke_2;
  v17[3] = &unk_1E5499158;
  id v19 = v23;
  id v20 = a1;
  id v18 = v22;
  id v12 = v23;
  id v13 = v22;
  id v14 = v10;
  v15 = [(CNSharingProfileAvatarItem *)v11 initWithImageProvider:v21 originalImageProvider:v17 type:2];

  return v15;
}

id __97__CNSharingProfileAvatarItemProvider_animojiItemWithRecord_stickerConfiguration_backgroundColor___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 56), "originalAnimojiImageForRecord:stickerConfiguration:size:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  id v3 = +[CNPhotoPickerVariantsManager colorGradientBackground:*(void *)(a1 + 48)];
  BOOL v4 = [*(id *)(a1 + 56) compositeImageForImage:v2 backgroundImage:v3];

  return v4;
}

uint64_t __97__CNSharingProfileAvatarItemProvider_animojiItemWithRecord_stickerConfiguration_backgroundColor___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "originalAnimojiImageForRecord:stickerConfiguration:size:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

+ (id)originalAnimojiImageForRecord:(id)a3 stickerConfiguration:(id)a4 size:(CGSize)a5
{
  double width = a5.width;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v9)
  {
    [v9 loadIfNeeded];
    double v11 = [[CNAvatarStickerGeneratorProvider alloc] initWithAvatarRecord:v8];
    id v12 = [(CNAvatarStickerGeneratorProvider *)v11 generator];
    [v12 setAsync:0];
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    id v13 = (void *)getAVTStickerGeneratorOptionsClass_softClass;
    uint64_t v29 = getAVTStickerGeneratorOptionsClass_softClass;
    if (!getAVTStickerGeneratorOptionsClass_softClass)
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v22 = (uint64_t)__getAVTStickerGeneratorOptionsClass_block_invoke;
      id v23 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E549AD00;
      id v24 = (void (*)(uint64_t))&v26;
      __getAVTStickerGeneratorOptionsClass_block_invoke((uint64_t)&v20);
      id v13 = (void *)v27[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v26, 8);
    id v15 = objc_alloc_init(v14);
    [v10 size];
    [v15 setSizeMultiplier:width / v16];
    uint64_t v20 = 0;
    uint64_t v21 = (uint64_t)&v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__32517;
    id v24 = __Block_byref_object_dispose__32518;
    id v25 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __94__CNSharingProfileAvatarItemProvider_originalAnimojiImageForRecord_stickerConfiguration_size___block_invoke;
    v19[3] = &unk_1E5499108;
    v19[4] = &v20;
    [v12 stickerImageWithConfiguration:v10 options:v15 completionHandler:v19];
    id v17 = *(id *)(v21 + 40);
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v17 = [a1 unposedImageForAvatarRecord:v8];
  }

  return v17;
}

void __94__CNSharingProfileAvatarItemProvider_originalAnimojiImageForRecord_stickerConfiguration_size___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[CNAvatarImageUtilities croppedAndCenteredAvatarImageForImage:a2 widthMultiplier:1.0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (id)monogramImageItemWithContact:(id)a3 monogramColor:(id)a4 renderer:(id)a5 RTL:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  if (![v12 imageDataAvailable])
  {
    id v13 = v10;
    uint64_t v14 = 0;
    goto LABEL_5;
  }
  if ([v12 hasImageOfType:2])
  {
    id v13 = 0;
    uint64_t v14 = 1;
LABEL_5:
    id v15 = v12;
    goto LABEL_7;
  }
  id v15 = (void *)[v12 mutableCopy];
  [v15 removePhoto];
  id v13 = v10;

  uint64_t v14 = 0;
LABEL_7:
  double v16 = [CNSharingProfileAvatarItem alloc];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __94__CNSharingProfileAvatarItemProvider_monogramImageItemWithContact_monogramColor_renderer_RTL___block_invoke;
  id v25 = &unk_1E54990E0;
  BOOL v29 = a6;
  char v30 = v14;
  id v26 = v13;
  id v27 = v11;
  id v28 = v15;
  id v17 = v15;
  id v18 = v11;
  id v19 = v13;
  uint64_t v20 = [(CNSharingProfileAvatarItem *)v16 initWithImageProvider:&v22 type:1];
  -[CNSharingProfileAvatarItem setWasSetFromFullPhotoPicker:](v20, "setWasSetFromFullPhotoPicker:", v14, v22, v23, v24, v25);

  return v20;
}

id __94__CNSharingProfileAvatarItemProvider_monogramImageItemWithContact_monogramColor_renderer_RTL___block_invoke(uint64_t a1, double a2, double a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v6 scale];
  id v8 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:color:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:color:", *(unsigned __int8 *)(a1 + 56), 0, *(void *)(a1 + 32), a2, a3, v7);

  id v9 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 57))
  {
    v13[0] = *(void *)(a1 + 48);
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v11 = [v9 avatarImageForContacts:v10 scope:v8];
  }
  else
  {
    id v11 = [*(id *)(a1 + 40) renderMonogramForContact:*(void *)(a1 + 48) color:*(void *)(a1 + 32) scope:v8 prohibitedSources:0];
  }

  return v11;
}

+ (id)contactImageItemWithContact:(id)a3 renderer:(id)a4 logger:(id)a5 type:(int64_t)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [CNSharingProfileAvatarItem alloc];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__CNSharingProfileAvatarItemProvider_contactImageItemWithContact_renderer_logger_type___block_invoke;
  v15[3] = &unk_1E54990B8;
  id v16 = v9;
  id v17 = v8;
  id v11 = v8;
  id v12 = v9;
  id v13 = [(CNSharingProfileAvatarItem *)v10 initWithImageProvider:v15 type:a6];

  return v13;
}

id __87__CNSharingProfileAvatarItemProvider_contactImageItemWithContact_renderer_logger_type___block_invoke(uint64_t a1, double a2, double a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v6 scale];
  id v8 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, a2, a3, v7);

  id v9 = *(void **)(a1 + 32);
  v13[0] = *(void *)(a1 + 40);
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v11 = [v9 avatarImageForContacts:v10 scope:v8];

  return v11;
}

+ (id)silhouetteImageItemWithRenderer:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [CNSharingProfileAvatarItem alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__CNSharingProfileAvatarItemProvider_silhouetteImageItemWithRenderer___block_invoke;
  v8[3] = &unk_1E5499090;
  id v9 = v3;
  id v5 = v3;
  id v6 = [(CNSharingProfileAvatarItem *)v4 initWithImageProvider:v8 type:0];

  return v6;
}

id __70__CNSharingProfileAvatarItemProvider_silhouetteImageItemWithRenderer___block_invoke(uint64_t a1, double a2, double a3)
{
  id v5 = [*(id *)(a1 + 32) placeholderImageProvider];
  id v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v6 scale];
  id v8 = objc_msgSend(v5, "imageForSize:scale:", a2, a3, v7);

  return v8;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_32530 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_32530, &__block_literal_global_32531);
  }
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_1_32532;

  return v2;
}

void __63__CNSharingProfileAvatarItemProvider_descriptorForRequiredKeys__block_invoke()
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v0 = +[CNVisualIdentityPickerViewController descriptorForRequiredKeys];
  uint64_t v1 = *MEMORY[0x1E4F1AE28];
  v8[0] = v0;
  v8[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1ADE8];
  v8[2] = *MEMORY[0x1E4F1AF98];
  v8[3] = v2;
  void v8[4] = *MEMORY[0x1E4F1AE20];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:5];

  uint64_t v4 = (void *)MEMORY[0x1E4F1B8F8];
  id v5 = [NSString stringWithUTF8String:"+[CNSharingProfileAvatarItemProvider descriptorForRequiredKeys]_block_invoke"];
  uint64_t v6 = [v4 descriptorWithKeyDescriptors:v3 description:v5];

  double v7 = (void *)descriptorForRequiredKeys_cn_once_object_1_32532;
  descriptorForRequiredKeys_cn_once_object_1_32532 = v6;
}

@end