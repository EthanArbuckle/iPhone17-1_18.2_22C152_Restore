@interface CNPhotoPickerEmojiProvider
- (CNPhotoPickerEmojiProvider)initWithVisualIdentity:(id)a3;
- (CNPhotoPickerVariantsManager)variantsManager;
- (CNVisualIdentity)visualIdentity;
- (NSString)identifier;
- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8;
- (void)setIdentifier:(id)a3;
- (void)setVariantsManager:(id)a3;
@end

@implementation CNPhotoPickerEmojiProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_visualIdentity, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setVariantsManager:(id)a3
{
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
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
  double height = a3.height;
  double width = a3.width;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a5, a6, a7, a8, a3.width, a3.height, a4);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v12 = [(CNPhotoPickerEmojiProvider *)self variantsManager];
  v13 = [v12 defaultEmojis];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v19 = [CNPhotoPickerEmojiProviderItem alloc];
        v20 = [v18 emojiString];
        v21 = [v18 colorVariant];
        v22 = -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:](v19, "initWithStringRepresentation:backgroundColorVariant:size:", v20, v21, width, height);

        [v11 addObject:v22];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }

  return v11;
}

- (CNPhotoPickerEmojiProvider)initWithVisualIdentity:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNPhotoPickerEmojiProvider;
  v6 = [(CNPhotoPickerEmojiProvider *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_visualIdentity, a3);
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    v11 = objc_alloc_init(CNPhotoPickerVariantsManager);
    variantsManager = v7->_variantsManager;
    v7->_variantsManager = v11;

    v13 = v7;
  }

  return v7;
}

@end