@interface CNPhotoPickerMonogramProvider
+ (id)generateMonogramItemForVisualIdentity:(id)a3 size:(CGSize)a4 scale:(double)a5 RTL:(BOOL)a6 isVariantOptionItem:(BOOL)a7 backgroundColor:(id)a8;
+ (id)providerItemForVisualIdentity:(id)a3 size:(CGSize)a4 RTL:(BOOL)a5;
+ (id)providerItemForVisualIdentity:(id)a3 size:(CGSize)a4 scale:(double)a5 RTL:(BOOL)a6 backgroundColor:(id)a7;
+ (id)providerItemWithRandomBackgroundColorForVisualIdentity:(id)a3 size:(CGSize)a4 RTL:(BOOL)a5;
- (CNPhotoPickerMonogramProvider)initWithVisualIdentity:(id)a3;
- (CNVisualIdentity)visualIdentity;
- (NSString)identifier;
- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8;
- (void)setIdentifier:(id)a3;
@end

@implementation CNPhotoPickerMonogramProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualIdentity, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8
{
  BOOL v8 = a5;
  double height = a3.height;
  double width = a3.width;
  v21[1] = *MEMORY[0x1E4F143B8];
  v13 = (objc_class *)MEMORY[0x1E4F89D48];
  id v14 = a8;
  v15 = (void *)[[v13 alloc] initWithRandomColor];
  v16 = objc_opt_class();
  v17 = [(CNPhotoPickerMonogramProvider *)self visualIdentity];
  v18 = objc_msgSend(v16, "providerItemForVisualIdentity:size:scale:RTL:backgroundColor:", v17, v8, v15, width, height, a4);

  [v18 setDelegate:v14];
  v21[0] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

  return v19;
}

- (CNPhotoPickerMonogramProvider)initWithVisualIdentity:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNPhotoPickerMonogramProvider;
  v6 = [(CNPhotoPickerMonogramProvider *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_visualIdentity, a3);
    BOOL v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    v11 = v7;
  }

  return v7;
}

+ (id)generateMonogramItemForVisualIdentity:(id)a3 size:(CGSize)a4 scale:(double)a5 RTL:(BOOL)a6 isVariantOptionItem:(BOOL)a7 backgroundColor:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  double height = a4.height;
  double width = a4.width;
  id v14 = a8;
  id v15 = a3;
  v16 = +[CNAvatarImageRendererSettings defaultSettings];
  v17 = [[CNAvatarImageRenderer alloc] initWithSettings:v16];
  v18 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:color:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:color:", v9, 0, v14, width, height, a5);

  v19 = [CNPhotoPickerMonogramProviderItem alloc];
  v20 = -[CNPhotoPickerMonogramProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:renderingScope:avatarRenderer:isVariantOptionItem:](v19, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:renderingScope:avatarRenderer:isVariantOptionItem:", 0, 0, 0, v18, v17, v8, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CNPhotoPickerMonogramProviderItem *)v20 setVisualIdentity:v15];

  return v20;
}

+ (id)providerItemForVisualIdentity:(id)a3 size:(CGSize)a4 scale:(double)a5 RTL:(BOOL)a6 backgroundColor:(id)a7
{
  BOOL v7 = a6;
  double height = a4.height;
  double width = a4.width;
  id v12 = a7;
  id v13 = a3;
  id v14 = [v13 abbreviatedName];
  BOOL v15 = +[CNUIStringUtilities stringIsSingleEmoji:v14];

  if (v15)
  {
    v16 = [CNPhotoPickerEmojiProviderItem alloc];
    uint64_t v17 = [v13 abbreviatedName];

    v18 = -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:](v16, "initWithStringRepresentation:backgroundColorVariant:size:", v17, 0, width, height);
    id v13 = (id)v17;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "generateMonogramItemForVisualIdentity:size:scale:RTL:isVariantOptionItem:backgroundColor:", v13, v7, 0, v12, width, height, a5);
    v18 = (CNPhotoPickerEmojiProviderItem *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

+ (id)providerItemWithRandomBackgroundColorForVisualIdentity:(id)a3 size:(CGSize)a4 RTL:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  BOOL v9 = (objc_class *)MEMORY[0x1E4F89D48];
  id v10 = a3;
  v11 = (void *)[[v9 alloc] initWithRandomColor];
  id v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v12 scale];
  id v14 = objc_msgSend(a1, "providerItemForVisualIdentity:size:scale:RTL:backgroundColor:", v10, v5, v11, width, height, v13);

  return v14;
}

+ (id)providerItemForVisualIdentity:(id)a3 size:(CGSize)a4 RTL:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  BOOL v9 = (void *)MEMORY[0x1E4FB1BA8];
  id v10 = a3;
  v11 = [v9 mainScreen];
  [v11 scale];
  double v13 = objc_msgSend(a1, "providerItemForVisualIdentity:size:scale:RTL:backgroundColor:", v10, v5, 0, width, height, v12);

  return v13;
}

@end