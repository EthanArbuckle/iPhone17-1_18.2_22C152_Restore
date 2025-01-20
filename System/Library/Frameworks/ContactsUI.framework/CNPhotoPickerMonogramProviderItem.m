@interface CNPhotoPickerMonogramProviderItem
- (BOOL)allowsEditing;
- (BOOL)allowsMoveAndScale;
- (BOOL)allowsVariants;
- (BOOL)hasUnknownColor;
- (BOOL)isContactImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGrayMonogramItem;
- (BOOL)isVariantOptionItem;
- (BOOL)shouldShowCaption;
- (CNAvatarImageRenderer)avatarRenderer;
- (CNAvatarImageRenderingScope)renderingScope;
- (CNPhotoPickerMonogramProviderItem)initWithImageData:(id)a3 thumbnailImageData:(id)a4 fullscreenImageData:(id)a5 cropRect:(CGRect)a6 renderingScope:(id)a7 avatarRenderer:(id)a8 isVariantOptionItem:(BOOL)a9;
- (CNVisualIdentity)visualIdentity;
- (NSData)monogramData;
- (NSString)monogramText;
- (UIColor)backgroundColor;
- (id)contactImageForMetadataStore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createColorVariantItems;
- (id)createColorVariantItemsExcludingSelf;
- (id)createVariantsItemsWithVariantsManager:(id)a3;
- (id)generateMonogramData;
- (id)generateMonogramImage;
- (id)generateThumbnailImageDataIfNeeded;
- (id)imageData;
- (id)localizedVariantsTitle;
- (id)monogramVariantItemForColor:(id)a3;
- (id)thumbnailImageData;
- (id)updatedProviderItemWithText:(id)a3;
- (id)variantIdentifier;
- (unint64_t)hash;
- (unint64_t)imageType;
- (void)renderMonogramData;
- (void)setAvatarRenderer:(id)a3;
- (void)setHasUnknownColor:(BOOL)a3;
- (void)setIsContactImage:(BOOL)a3;
- (void)setIsVariantOptionItem:(BOOL)a3;
- (void)setMonogramData:(id)a3;
- (void)setMonogramText:(id)a3;
- (void)setRenderingScope:(id)a3;
- (void)setVisualIdentity:(id)a3;
- (void)updateVisualIdentity:(id)a3;
- (void)updateWithMonogramData:(id)a3;
@end

@implementation CNPhotoPickerMonogramProviderItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogramData, 0);
  objc_storeStrong((id *)&self->_renderingScope, 0);
  objc_storeStrong((id *)&self->_avatarRenderer, 0);
  objc_storeStrong((id *)&self->_visualIdentity, 0);

  objc_storeStrong((id *)&self->_monogramText, 0);
}

- (void)setIsVariantOptionItem:(BOOL)a3
{
  self->_isVariantOptionItem = a3;
}

- (BOOL)isVariantOptionItem
{
  return self->_isVariantOptionItem;
}

- (void)setMonogramData:(id)a3
{
}

- (NSData)monogramData
{
  return self->_monogramData;
}

- (void)setHasUnknownColor:(BOOL)a3
{
  self->_hasUnknownColor = a3;
}

- (BOOL)hasUnknownColor
{
  return self->_hasUnknownColor;
}

- (void)setIsContactImage:(BOOL)a3
{
  self->_isContactImage = a3;
}

- (BOOL)isContactImage
{
  return self->_isContactImage;
}

- (void)setRenderingScope:(id)a3
{
}

- (CNAvatarImageRenderingScope)renderingScope
{
  return self->_renderingScope;
}

- (void)setAvatarRenderer:(id)a3
{
}

- (CNAvatarImageRenderer)avatarRenderer
{
  return self->_avatarRenderer;
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (void)setMonogramText:(id)a3
{
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CNPhotoPickerMonogramProviderItem_hash__block_invoke;
  v7[3] = &unk_1E549ADA8;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__CNPhotoPickerMonogramProviderItem_hash__block_invoke_2;
  aBlock[3] = &unk_1E549ADA8;
  v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __41__CNPhotoPickerMonogramProviderItem_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) visualIdentity];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __41__CNPhotoPickerMonogramProviderItem_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) renderingScope];
  uint64_t v3 = [v2 color];
  unint64_t v4 = [v3 colorName];
  uint64_t v5 = [v1 objectHash:v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v6 = objc_opt_class();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__CNPhotoPickerMonogramProviderItem_isEqual___block_invoke;
  v16[3] = &unk_1E549BCB0;
  v16[4] = self;
  id v17 = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__CNPhotoPickerMonogramProviderItem_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E549BCB0;
  aBlock[4] = self;
  id v7 = v17;
  id v15 = v7;
  v8 = _Block_copy(aBlock);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__CNPhotoPickerMonogramProviderItem_isEqual___block_invoke_3;
  v12[3] = &unk_1E549BCB0;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  v10 = _Block_copy(v12);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v9, v6, self, v16, v8, v10, 0);

  return (char)self;
}

uint64_t __45__CNPhotoPickerMonogramProviderItem_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) visualIdentity];
  if (!v3)
  {
    v1 = [*(id *)(a1 + 40) visualIdentity];
    if (!v1)
    {
      uint64_t v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  id v4 = [*(id *)(a1 + 32) visualIdentity];
  uint64_t v5 = [*(id *)(a1 + 40) visualIdentity];
  uint64_t v6 = [v4 isEqual:v5];

  if (!v3) {
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

uint64_t __45__CNPhotoPickerMonogramProviderItem_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) renderingScope];
  uint64_t v3 = [v2 color];
  id v4 = [v3 colorName];
  if (!v4)
  {
    v16 = [*(id *)(a1 + 40) renderingScope];
    id v15 = [v16 color];
    uint64_t v5 = [v15 colorName];
    if (!v5)
    {
      v14 = 0;
      uint64_t v12 = 1;
LABEL_7:

      goto LABEL_8;
    }
    v14 = (void *)v5;
  }
  uint64_t v6 = [*(id *)(a1 + 32) renderingScope];
  id v7 = [v6 color];
  v8 = [v7 colorName];
  id v9 = [*(id *)(a1 + 40) renderingScope];
  v10 = [v9 color];
  v11 = [v10 colorName];
  uint64_t v12 = [v8 isEqual:v11];

  if (!v4) {
    goto LABEL_7;
  }
LABEL_8:

  return v12;
}

uint64_t __45__CNPhotoPickerMonogramProviderItem_isEqual___block_invoke_3(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasUnknownColor];
  return v2 ^ [*(id *)(a1 + 40) hasUnknownColor] ^ 1;
}

- (id)updatedProviderItemWithText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNPhotoPickerMonogramProviderItem *)self visualIdentity];
  [v5 setAbbreviatedName:v4];

  uint64_t v6 = [(CNPhotoPickerMonogramProviderItem *)self renderingScope];
  id v7 = [v6 color];
  v8 = [(CNPhotoPickerMonogramProviderItem *)self monogramVariantItemForColor:v7];

  return v8;
}

- (id)contactImageForMetadataStore
{
  id v3 = objc_alloc(MEMORY[0x1E4F1B918]);
  id v4 = [(CNPhotoPickerMonogramProviderItem *)self imageData];
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v6 = objc_msgSend(v3, "initWithImageData:cropRect:lastUsedDate:", v4, v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [v6 setSource:1];
  id v7 = [(CNPhotoPickerMonogramProviderItem *)self renderingScope];
  v8 = [v7 color];

  if (v8)
  {
    id v9 = [(CNPhotoPickerMonogramProviderItem *)self renderingScope];
    v10 = [v9 color];
    v11 = [v10 colorName];
    [v6 setVariant:v11];
  }
  uint64_t v12 = [(CNPhotoPickerMonogramProviderItem *)self monogramText];
  [v6 setDisplayString:v12];

  return v6;
}

- (id)createColorVariantItemsExcludingSelf
{
  id v3 = [(CNPhotoPickerMonogramProviderItem *)self createColorVariantItems];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__CNPhotoPickerMonogramProviderItem_createColorVariantItemsExcludingSelf__block_invoke;
  v6[3] = &unk_1E549B0E8;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "_cn_filter:", v6);

  return v4;
}

uint64_t __73__CNPhotoPickerMonogramProviderItem_createColorVariantItemsExcludingSelf__block_invoke(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 variantIdentifier];
  uint64_t v5 = [v3 variantIdentifier];

  uint64_t v6 = [v4 isEqualToString:v5] ^ 1;
  return v6;
}

- (id)createColorVariantItems
{
  id v3 = [MEMORY[0x1E4F89D48] availableColors];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__CNPhotoPickerMonogramProviderItem_createColorVariantItems__block_invoke;
  v7[3] = &unk_1E549A8C8;
  v7[4] = self;
  id v4 = objc_msgSend(v3, "_cn_map:", v7);
  uint64_t v5 = objc_msgSend(v4, "_cn_filter:", &__block_literal_global_54221);

  return v5;
}

uint64_t __60__CNPhotoPickerMonogramProviderItem_createColorVariantItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) monogramVariantItemForColor:a2];
}

BOOL __60__CNPhotoPickerMonogramProviderItem_createColorVariantItems__block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = [a2 monogramData];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)createVariantsItemsWithVariantsManager:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(CNPhotoPickerMonogramProviderItem *)self allowsVariants])
  {
    id v4 = [(CNPhotoPickerMonogramProviderItem *)self monogramVariantItemForColor:0];
    v9[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    uint64_t v6 = [(CNPhotoPickerMonogramProviderItem *)self createColorVariantItems];
    id v7 = [v5 arrayByAddingObjectsFromArray:v6];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (id)monogramVariantItemForColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNPhotoPickerMonogramProviderItem *)self renderingScope];
  [v5 pointSize];
  double v7 = v6;
  double v9 = v8;
  v10 = [(CNPhotoPickerMonogramProviderItem *)self renderingScope];
  [v10 scale];
  double v12 = v11;
  id v13 = [(CNPhotoPickerMonogramProviderItem *)self renderingScope];
  uint64_t v14 = [v13 rightToLeft];
  id v15 = [(CNPhotoPickerMonogramProviderItem *)self renderingScope];
  v16 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:color:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:color:", v14, [v15 avatarViewStyle], v4, v7, v9, v12);

  id v17 = [CNPhotoPickerMonogramProviderItem alloc];
  v18 = [(CNPhotoPickerMonogramProviderItem *)self avatarRenderer];
  v19 = -[CNPhotoPickerMonogramProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:renderingScope:avatarRenderer:isVariantOptionItem:](v17, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:renderingScope:avatarRenderer:isVariantOptionItem:", 0, 0, 0, v16, v18, 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  v20 = [(CNPhotoPickerProviderItem *)self delegate];
  [(CNPhotoPickerProviderItem *)v19 setDelegate:v20];

  v21 = [(CNPhotoPickerMonogramProviderItem *)self visualIdentity];
  v22 = (void *)[v21 mutableCopy];
  [(CNPhotoPickerMonogramProviderItem *)v19 setVisualIdentity:v22];

  return v19;
}

- (void)updateVisualIdentity:(id)a3
{
  id v10 = a3;
  [v10 clearImage];
  id v4 = [(CNPhotoPickerMonogramProviderItem *)self monogramData];
  [v10 setImageData:v4];

  uint64_t v5 = [(CNPhotoPickerMonogramProviderItem *)self monogramData];
  double v6 = objc_msgSend(v5, "_cn_md5Hash");
  [v10 setImageHash:v6];

  double v7 = [(CNPhotoPickerMonogramProviderItem *)self thumbnailImageData];
  [v10 setThumbnailImageData:v7];

  double v8 = [(CNPhotoPickerMonogramProviderItem *)self visualIdentity];
  double v9 = [v8 abbreviatedName];
  [v10 setAbbreviatedName:v9];

  [v10 updateImageType:2];
  [v10 setMemojiMetadata:0];
}

- (void)updateWithMonogramData:(id)a3
{
  [(CNPhotoPickerMonogramProviderItem *)self setMonogramData:a3];
  [(CNPhotoPickerProviderItem *)self clearThumbnailImage];
  id v4 = [(CNPhotoPickerProviderItem *)self delegate];
  [v4 providerItemDidUpdate:self];
}

- (NSString)monogramText
{
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))() & 1) == 0)
  {
    BOOL v3 = [(CNPhotoPickerMonogramProviderItem *)self visualIdentity];
    id v4 = [v3 abbreviatedName];
    monogramText = self->_monogramText;
    self->_monogramText = v4;
  }
  double v6 = self->_monogramText;

  return v6;
}

- (void)renderMonogramData
{
  id v3 = [(CNPhotoPickerMonogramProviderItem *)self generateMonogramData];
  [(CNPhotoPickerMonogramProviderItem *)self updateWithMonogramData:v3];
}

- (id)generateMonogramData
{
  int v2 = [(CNPhotoPickerMonogramProviderItem *)self generateMonogramImage];
  id v3 = UIImagePNGRepresentation(v2);

  return v3;
}

- (id)generateMonogramImage
{
  BOOL v3 = [(CNPhotoPickerMonogramProviderItem *)self isVariantOptionItem];
  if (v3) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *MEMORY[0x1E4F5A298];
  double v6 = [(CNPhotoPickerMonogramProviderItem *)self monogramText];
  if ((*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6))
  {
    double v7 = [(CNPhotoPickerMonogramProviderItem *)self visualIdentity];
    double v8 = [v7 abbreviatedName];
  }
  else
  {
    double v8 = [(CNPhotoPickerMonogramProviderItem *)self monogramText];
  }

  if (v3 && (*(unsigned int (**)(uint64_t, void *))(v5 + 16))(v5, v8))
  {
    double v9 = [(CNPhotoPickerMonogramProviderItem *)self renderingScope];
    id v10 = [v9 color];
    double v11 = [v10 color];
    double v12 = +[CNPhotoPickerVariantsManager monogramColorGradientBackground:v11];
  }
  else
  {
    double v9 = [(CNPhotoPickerMonogramProviderItem *)self avatarRenderer];
    id v10 = [(CNPhotoPickerMonogramProviderItem *)self renderingScope];
    double v11 = [v10 color];
    id v13 = [(CNPhotoPickerMonogramProviderItem *)self renderingScope];
    double v12 = [v9 renderMonogramForString:v8 color:v11 scope:v13 prohibitedSources:v4];
  }

  return v12;
}

- (id)generateThumbnailImageDataIfNeeded
{
  BOOL v3 = [(CNPhotoPickerMonogramProviderItem *)self monogramData];
  if (v3)
  {
  }
  else if (![(CNPhotoPickerMonogramProviderItem *)self isContactImage])
  {
    [(CNPhotoPickerMonogramProviderItem *)self renderMonogramData];
  }

  return [(CNPhotoPickerMonogramProviderItem *)self thumbnailImageData];
}

- (id)thumbnailImageData
{
  uint64_t v3 = [(CNPhotoPickerMonogramProviderItem *)self monogramData];
  if (v3
    && (uint64_t v4 = (void *)v3,
        BOOL v5 = [(CNPhotoPickerMonogramProviderItem *)self isContactImage],
        v4,
        !v5))
  {
    double v6 = [(CNPhotoPickerMonogramProviderItem *)self monogramData];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNPhotoPickerMonogramProviderItem;
    double v6 = [(CNPhotoPickerProviderItem *)&v8 thumbnailImageData];
  }

  return v6;
}

- (id)imageData
{
  uint64_t v3 = [(CNPhotoPickerMonogramProviderItem *)self monogramData];
  if (v3
    && (uint64_t v4 = (void *)v3,
        BOOL v5 = [(CNPhotoPickerMonogramProviderItem *)self isContactImage],
        v4,
        !v5))
  {
    double v6 = [(CNPhotoPickerMonogramProviderItem *)self monogramData];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNPhotoPickerMonogramProviderItem;
    double v6 = [(CNPhotoPickerProviderItem *)&v8 imageData];
  }

  return v6;
}

- (id)variantIdentifier
{
  int v2 = [(CNPhotoPickerMonogramProviderItem *)self renderingScope];
  uint64_t v3 = [v2 color];
  uint64_t v4 = [v3 colorName];

  return v4;
}

- (id)localizedVariantsTitle
{
  int v2 = CNContactsUIBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"PHOTO_SELECT_COLOR" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

- (BOOL)isGrayMonogramItem
{
  int v2 = [(CNPhotoPickerMonogramProviderItem *)self renderingScope];
  uint64_t v3 = [v2 color];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)allowsMoveAndScale
{
  return 0;
}

- (BOOL)allowsEditing
{
  if ([(CNPhotoPickerMonogramProviderItem *)self allowsVariants]
    || (BOOL v3 = [(CNPhotoPickerMonogramProviderItem *)self allowsMoveAndScale]))
  {
    v5.receiver = self;
    v5.super_class = (Class)CNPhotoPickerMonogramProviderItem;
    LOBYTE(v3) = [(CNPhotoPickerProviderItem *)&v5 allowsEditing];
  }
  return v3;
}

- (BOOL)shouldShowCaption
{
  return 0;
}

- (UIColor)backgroundColor
{
  id v3 = objc_alloc(MEMORY[0x1E4F89D48]);
  BOOL v4 = [(CNPhotoPickerMonogramProviderItem *)self renderingScope];
  objc_super v5 = [v4 color];
  double v6 = [v5 colorName];
  double v7 = (void *)[v3 initWithColorName:v6];
  objc_super v8 = [v7 color];

  if (!v8)
  {
    objc_super v8 = [MEMORY[0x1E4F89D48] defaultGradientStartColor];
  }

  return (UIColor *)v8;
}

- (unint64_t)imageType
{
  return 2;
}

- (BOOL)allowsVariants
{
  id v3 = [(CNPhotoPickerMonogramProviderItem *)self monogramVariantItemForColor:0];
  BOOL v4 = [v3 monogramData];
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(CNPhotoPickerMonogramProviderItem *)self isVariantOptionItem];
  }

  return v5;
}

- (void)setVisualIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_visualIdentity, a3);

  [(CNPhotoPickerMonogramProviderItem *)self renderMonogramData];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CNPhotoPickerMonogramProviderItem;
  id v4 = [(CNPhotoPickerProviderItem *)&v10 copyWithZone:a3];
  BOOL v5 = [(CNPhotoPickerMonogramProviderItem *)self renderingScope];
  [v4 setRenderingScope:v5];

  double v6 = [(CNPhotoPickerMonogramProviderItem *)self avatarRenderer];
  [v4 setAvatarRenderer:v6];

  double v7 = [(CNPhotoPickerMonogramProviderItem *)self visualIdentity];
  [v4 setVisualIdentity:v7];

  objc_super v8 = [(CNPhotoPickerMonogramProviderItem *)self monogramData];
  [v4 setMonogramData:v8];

  objc_msgSend(v4, "setIsVariantOptionItem:", -[CNPhotoPickerMonogramProviderItem isVariantOptionItem](self, "isVariantOptionItem"));
  return v4;
}

- (CNPhotoPickerMonogramProviderItem)initWithImageData:(id)a3 thumbnailImageData:(id)a4 fullscreenImageData:(id)a5 cropRect:(CGRect)a6 renderingScope:(id)a7 avatarRenderer:(id)a8 isVariantOptionItem:(BOOL)a9
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v17 = a7;
  id v18 = a8;
  v19 = [(CNPhotoPickerMonogramProviderItem *)self imageData];
  v23.receiver = self;
  v23.super_class = (Class)CNPhotoPickerMonogramProviderItem;
  v20 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:](&v23, sel_initWithImageData_thumbnailImageData_fullscreenImageData_cropRect_, v19, 0, 0, x, y, width, height);

  if (v20)
  {
    objc_storeStrong((id *)&v20->_renderingScope, a7);
    objc_storeStrong((id *)&v20->_avatarRenderer, a8);
    v20->_isVariantOptionItem = a9;
    v21 = v20;
  }

  return v20;
}

@end