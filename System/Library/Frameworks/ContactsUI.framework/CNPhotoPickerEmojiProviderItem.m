@interface CNPhotoPickerEmojiProviderItem
+ (id)addNewEmojiProviderItemWithSize:(CGSize)a3;
+ (id)suggestedEmojiItemsForString:(id)a3 variantsManager:(id)a4 size:(CGSize)a5 locale:(id)a6;
+ (id)thumbnailViewForImage:(id)a3;
- (BOOL)allowsMoveAndScale;
- (BOOL)allowsVariants;
- (CGSize)size;
- (CNPhotoPickerColorVariant)backgroundColorVariant;
- (CNPhotoPickerEmojiProviderItem)initWithStringRepresentation:(id)a3 backgroundColorVariant:(id)a4 size:(CGSize)a5;
- (NSData)dataRepresentation;
- (NSString)stringRepresentation;
- (UIColor)backgroundColor;
- (id)contactImageForMetadataStore;
- (id)copyWithStringRepresentation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createVariantsItemsWithVariantsManager:(id)a3;
- (id)generateImageRepresentationForEmojiString:(id)a3;
- (id)generateThumbnailImageDataIfNeeded;
- (id)imageData;
- (id)thumbnailImageData;
- (id)updatedProviderItemWithText:(id)a3;
- (id)updatedProviderItemWithText:(id)a3 backgroundColorVariant:(id)a4;
- (unint64_t)imageType;
- (void)setBackgroundColorVariant:(id)a3;
- (void)setDataRepresentation:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setStringRepresentation:(id)a3;
- (void)updateVisualIdentity:(id)a3;
@end

@implementation CNPhotoPickerEmojiProviderItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColorVariant, 0);
  objc_storeStrong((id *)&self->_dataRepresentation, 0);

  objc_storeStrong((id *)&self->_stringRepresentation, 0);
}

- (void)setBackgroundColorVariant:(id)a3
{
}

- (CNPhotoPickerColorVariant)backgroundColorVariant
{
  return self->_backgroundColorVariant;
}

- (void)setDataRepresentation:(id)a3
{
}

- (NSData)dataRepresentation
{
  return self->_dataRepresentation;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setStringRepresentation:(id)a3
{
}

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (id)createVariantsItemsWithVariantsManager:(id)a3
{
  id v4 = a3;
  if ([(CNPhotoPickerEmojiProviderItem *)self allowsVariants])
  {
    v5 = [v4 avatarBackgrounds];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__CNPhotoPickerEmojiProviderItem_createVariantsItemsWithVariantsManager___block_invoke;
    v8[3] = &unk_1E549A390;
    v8[4] = self;
    v6 = objc_msgSend(v5, "_cn_map:", v8);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

id __73__CNPhotoPickerEmojiProviderItem_createVariantsItemsWithVariantsManager___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 stringRepresentation];
  v5 = [v2 updatedProviderItemWithText:v4 backgroundColorVariant:v3];

  return v5;
}

- (id)updatedProviderItemWithText:(id)a3 backgroundColorVariant:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [CNPhotoPickerEmojiProviderItem alloc];
  [(CNPhotoPickerEmojiProviderItem *)self size];
  v9 = -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:](v8, "initWithStringRepresentation:backgroundColorVariant:size:", v7, v6);

  return v9;
}

- (id)updatedProviderItemWithText:(id)a3
{
  id v4 = a3;
  v5 = [CNPhotoPickerEmojiProviderItem alloc];
  id v6 = [(CNPhotoPickerEmojiProviderItem *)self backgroundColorVariant];
  [(CNPhotoPickerEmojiProviderItem *)self size];
  id v7 = -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:](v5, "initWithStringRepresentation:backgroundColorVariant:size:", v4, v6);

  return v7;
}

- (id)generateImageRepresentationForEmojiString:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v5 = &stru_1ED8AC728;
  if (a3) {
    v5 = (__CFString *)a3;
  }
  id v6 = v5;
  id v7 = a3;
  v30.double width = 190.0;
  v30.double height = 190.0;
  UIGraphicsBeginImageContextWithOptions(v30, 0, 3.0);
  v8 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 0.0, 0.0, 190.0, 190.0);
  [v8 addClip];
  v9 = [(CNPhotoPickerEmojiProviderItem *)self backgroundColorVariant];

  if (!v9)
  {
    v10 = objc_alloc_init(CNPhotoPickerVariantsManager);
    v11 = [(CNPhotoPickerVariantsManager *)v10 randomColorVariant];
    [(CNPhotoPickerEmojiProviderItem *)self setBackgroundColorVariant:v11];
  }
  v12 = [(CNPhotoPickerEmojiProviderItem *)self backgroundColorVariant];
  v13 = [v12 color];
  v14 = +[CNPhotoPickerVariantsManager colorGradientBackground:v13];

  objc_msgSend(v14, "drawInRect:", 0.0, 0.0, 190.0, 190.0);
  v15 = +[CNUIFontRepository visualIdentityEditorTextFont];
  v16 = [v15 fontWithSize:120.0];

  id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v27 = *MEMORY[0x1E4FB06F8];
  v28[0] = v16;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  v19 = (void *)[v17 initWithString:v6 attributes:v18];

  [v19 size];
  double v21 = v20;
  double v23 = v22;
  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.double width = 190.0;
  v31.size.double height = 190.0;
  CGFloat v24 = CGRectGetMidX(v31) - v21 * 0.5;
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.double width = 190.0;
  v32.size.double height = 190.0;
  objc_msgSend(v19, "drawInRect:", v24, CGRectGetMidY(v32) - v23 * 0.5, v21, v23);
  v25 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v25;
}

- (id)contactImageForMetadataStore
{
  id v3 = objc_alloc(MEMORY[0x1E4F1B918]);
  id v4 = [(CNPhotoPickerEmojiProviderItem *)self imageData];
  v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = objc_msgSend(v3, "initWithImageData:cropRect:lastUsedDate:", v4, v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [v6 setSource:4];
  id v7 = [(CNPhotoPickerEmojiProviderItem *)self backgroundColorVariant];
  v8 = [v7 colorName];
  [v6 setVariant:v8];

  v9 = [(CNPhotoPickerEmojiProviderItem *)self stringRepresentation];
  [v6 setDisplayString:v9];

  return v6;
}

- (id)generateThumbnailImageDataIfNeeded
{
  id v3 = [(CNPhotoPickerEmojiProviderItem *)self dataRepresentation];

  if (v3) {
    goto LABEL_2;
  }
  uint64_t v5 = *MEMORY[0x1E4F5A2A0];
  id v6 = [(CNPhotoPickerEmojiProviderItem *)self stringRepresentation];
  if ((*(unsigned int (**)(uint64_t, void *))(v5 + 16))(v5, v6))
  {
  }
  else
  {
    id v7 = [(CNPhotoPickerEmojiProviderItem *)self thumbnailImageData];

    if (v7)
    {
      v13.receiver = self;
      v13.super_class = (Class)CNPhotoPickerEmojiProviderItem;
      id v8 = [(CNPhotoPickerProviderItem *)&v13 generateThumbnailImageDataIfNeeded];
LABEL_2:
      id v4 = [(CNPhotoPickerEmojiProviderItem *)self thumbnailImageData];
      goto LABEL_8;
    }
  }
  v9 = [(CNPhotoPickerEmojiProviderItem *)self stringRepresentation];
  v10 = [(CNPhotoPickerEmojiProviderItem *)self generateImageRepresentationForEmojiString:v9];
  v11 = UIImagePNGRepresentation(v10);
  [(CNPhotoPickerEmojiProviderItem *)self setDataRepresentation:v11];

  id v4 = [(CNPhotoPickerEmojiProviderItem *)self dataRepresentation];
LABEL_8:

  return v4;
}

- (id)thumbnailImageData
{
  id v3 = [(CNPhotoPickerEmojiProviderItem *)self dataRepresentation];

  if (v3)
  {
    id v4 = [(CNPhotoPickerEmojiProviderItem *)self dataRepresentation];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CNPhotoPickerEmojiProviderItem;
    id v4 = [(CNPhotoPickerProviderItem *)&v6 thumbnailImageData];
  }

  return v4;
}

- (id)imageData
{
  uint64_t v3 = *MEMORY[0x1E4F5A298];
  id v4 = [(CNPhotoPickerEmojiProviderItem *)self stringRepresentation];
  if ((*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4))
  {
    uint64_t v5 = [(CNPhotoPickerEmojiProviderItem *)self dataRepresentation];

    if (!v5)
    {
      v9.receiver = self;
      v9.super_class = (Class)CNPhotoPickerEmojiProviderItem;
      objc_super v6 = [(CNPhotoPickerProviderItem *)&v9 imageData];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = [(CNPhotoPickerEmojiProviderItem *)self generateThumbnailImageDataIfNeeded];
  objc_super v6 = [(CNPhotoPickerEmojiProviderItem *)self dataRepresentation];
LABEL_6:

  return v6;
}

- (void)updateVisualIdentity:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNPhotoPickerEmojiProviderItem;
  id v3 = a3;
  [(CNPhotoPickerProviderItem *)&v4 updateVisualIdentity:v3];
  objc_msgSend(v3, "updateImageType:", 4, v4.receiver, v4.super_class);
}

- (UIColor)backgroundColor
{
  v2 = [(CNPhotoPickerEmojiProviderItem *)self backgroundColorVariant];
  id v3 = [v2 color];

  return (UIColor *)v3;
}

- (unint64_t)imageType
{
  return 4;
}

- (BOOL)allowsMoveAndScale
{
  return 0;
}

- (BOOL)allowsVariants
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNPhotoPickerEmojiProviderItem;
  id v4 = [(CNPhotoPickerProviderItem *)&v9 copyWithZone:a3];
  [(CNPhotoPickerEmojiProviderItem *)self size];
  objc_msgSend(v4, "setSize:");
  uint64_t v5 = [(CNPhotoPickerEmojiProviderItem *)self stringRepresentation];
  [v4 setStringRepresentation:v5];

  objc_super v6 = [(CNPhotoPickerEmojiProviderItem *)self dataRepresentation];
  [v4 setDataRepresentation:v6];

  id v7 = [(CNPhotoPickerEmojiProviderItem *)self backgroundColorVariant];
  [v4 setBackgroundColorVariant:v7];

  return v4;
}

- (id)copyWithStringRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [CNPhotoPickerEmojiProviderItem alloc];
  objc_super v6 = [(CNPhotoPickerEmojiProviderItem *)self backgroundColorVariant];
  [(CNPhotoPickerEmojiProviderItem *)self size];
  id v7 = -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:](v5, "initWithStringRepresentation:backgroundColorVariant:size:", v4, v6);

  return v7;
}

- (CNPhotoPickerEmojiProviderItem)initWithStringRepresentation:(id)a3 backgroundColorVariant:(id)a4 size:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v8 = (CNPhotoPickerVariantsManager *)a3;
  id v10 = a3;
  id v11 = a4;
  v12 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:](self, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", 0, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_stringRepresentation, v8);
    v14 = v11;
    if (!v11)
    {
      id v8 = objc_alloc_init(CNPhotoPickerVariantsManager);
      v14 = [(CNPhotoPickerVariantsManager *)v8 randomColorVariant];
    }
    objc_storeStrong((id *)&v13->_backgroundColorVariant, v14);
    if (!v11)
    {
    }
    v13->_size.CGFloat width = width;
    v13->_size.CGFloat height = height;
    v15 = v13;
  }

  return v13;
}

+ (id)suggestedEmojiItemsForString:(id)a3 variantsManager:(id)a4 size:(CGSize)a5 locale:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    id v29 = v10;
    uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F610B0]) initWithQueryString:v10 andLocale:v12];
    objc_super v13 = [v27 tokens];
    id v28 = v12;
    v14 = [v12 languageCode];
    v15 = (const void *)CEMCreateEmojiLocaleData();

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v13;
    uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v32)
    {
      uint64_t v31 = *(void *)v34;
      v16 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_4:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v34 != v31) {
          objc_enumerationMutation(obj);
        }
        if ((unint64_t)[v16 count] > 2) {
          break;
        }
        uint64_t EmojiTokensForString = CEMEmojiLocaleDataCreateEmojiTokensForString();
        if (EmojiTokensForString)
        {
          CFArrayRef v19 = (const __CFArray *)EmojiTokensForString;
          for (CFIndex i = 0; i < CFArrayGetCount(v19); ++i)
          {
            CFArrayGetValueAtIndex(v19, i);
            double v21 = [CNPhotoPickerEmojiProviderItem alloc];
            uint64_t String = CEMEmojiTokenGetString();
            double v23 = [v11 randomColorVariant];
            CGFloat v24 = -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:](v21, "initWithStringRepresentation:backgroundColorVariant:size:", String, v23, width, height);

            uint64_t v25 = [v16 arrayByAddingObject:v24];

            v16 = (void *)v25;
          }
          CFRelease(v19);
        }
        if (++v17 == v32)
        {
          uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v32) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    else
    {
      v16 = (void *)MEMORY[0x1E4F1CBF0];
    }

    if (v15) {
      CFRelease(v15);
    }

    id v12 = v28;
    id v10 = v29;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

+ (id)thumbnailViewForImage:(id)a3
{
  id v3 = a3;
  [v3 size];
  double v5 = v4;
  objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, v5, v5);
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

+ (id)addNewEmojiProviderItemWithSize:(CGSize)a3
{
  id v3 = -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:]([CNPhotoPickerEmojiProviderItem alloc], "initWithStringRepresentation:backgroundColorVariant:size:", &stru_1ED8AC728, 0, a3.width, a3.height);

  return v3;
}

@end