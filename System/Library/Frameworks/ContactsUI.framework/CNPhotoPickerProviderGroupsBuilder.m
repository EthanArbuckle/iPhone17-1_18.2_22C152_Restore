@interface CNPhotoPickerProviderGroupsBuilder
+ (id)builderWithVisualIdentity:(id)a3 avatarStore:(id)a4 environment:(id)a5 contactViewCache:(id)a6 photoPickerConfiguration:(id)a7;
- (AVTAvatarStore)avatarStore;
- (BOOL)includeAddAnimojiItem;
- (BOOL)includeAddEmojiItem;
- (BOOL)includeAnimoji;
- (BOOL)includeContactImage;
- (BOOL)includeFaces;
- (BOOL)includeMonograms;
- (BOOL)includePhotoFromLibraryItem;
- (BOOL)includeRecents;
- (BOOL)includeTakePhotoItem;
- (BOOL)includeUnifiedContactImages;
- (BOOL)includesAnyPhotoContent;
- (BOOL)includesEmojiContent;
- (BOOL)shouldOrderEmojiBeforeAnimoji;
- (CNContactViewCache)contactViewCache;
- (CNPhotoPickerProviderGroupsBuilder)initWithVisualIdentity:(id)a3 avatarStore:(id)a4 environment:(id)a5 contactViewCache:(id)a6;
- (CNUIContactsEnvironment)environment;
- (CNVisualIdentity)visualIdentity;
- (id)addItemsContentGroup;
- (id)animojiContentGroup;
- (id)build;
- (id)emojiContentGroup;
- (id)injectedItemsGroup;
- (id)photoContentGroup;
- (void)setIncludeAddAnimojiItem:(BOOL)a3;
- (void)setIncludeAddEmojiItem:(BOOL)a3;
- (void)setIncludeAnimoji:(BOOL)a3;
- (void)setIncludeContactImage:(BOOL)a3;
- (void)setIncludeFaces:(BOOL)a3;
- (void)setIncludeMonograms:(BOOL)a3;
- (void)setIncludePhotoFromLibraryItem:(BOOL)a3;
- (void)setIncludeRecents:(BOOL)a3;
- (void)setIncludeTakePhotoItem:(BOOL)a3;
- (void)setIncludeUnifiedContactImages:(BOOL)a3;
- (void)setIncludesEmojiContent:(BOOL)a3;
- (void)setShouldOrderEmojiBeforeAnimoji:(BOOL)a3;
@end

@implementation CNPhotoPickerProviderGroupsBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);

  objc_storeStrong((id *)&self->_visualIdentity, 0);
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (void)setIncludeAddEmojiItem:(BOOL)a3
{
  self->_includeAddEmojiItem = a3;
}

- (BOOL)includeAddEmojiItem
{
  return self->_includeAddEmojiItem;
}

- (void)setIncludesEmojiContent:(BOOL)a3
{
  self->_includesEmojiContent = a3;
}

- (BOOL)includesEmojiContent
{
  return self->_includesEmojiContent;
}

- (void)setShouldOrderEmojiBeforeAnimoji:(BOOL)a3
{
  self->_shouldOrderEmojiBeforeAnimoji = a3;
}

- (BOOL)shouldOrderEmojiBeforeAnimoji
{
  return self->_shouldOrderEmojiBeforeAnimoji;
}

- (void)setIncludeRecents:(BOOL)a3
{
  self->_includeRecents = a3;
}

- (BOOL)includeRecents
{
  return self->_includeRecents;
}

- (void)setIncludeAddAnimojiItem:(BOOL)a3
{
  self->_includeAddAnimojiItem = a3;
}

- (BOOL)includeAddAnimojiItem
{
  return self->_includeAddAnimojiItem;
}

- (void)setIncludeAnimoji:(BOOL)a3
{
  self->_includeAnimoji = a3;
}

- (BOOL)includeAnimoji
{
  return self->_includeAnimoji;
}

- (void)setIncludeFaces:(BOOL)a3
{
  self->_includeFaces = a3;
}

- (BOOL)includeFaces
{
  return self->_includeFaces;
}

- (void)setIncludeMonograms:(BOOL)a3
{
  self->_includeMonograms = a3;
}

- (BOOL)includeMonograms
{
  return self->_includeMonograms;
}

- (void)setIncludePhotoFromLibraryItem:(BOOL)a3
{
  self->_includePhotoFromLibraryItem = a3;
}

- (BOOL)includePhotoFromLibraryItem
{
  return self->_includePhotoFromLibraryItem;
}

- (void)setIncludeTakePhotoItem:(BOOL)a3
{
  self->_includeTakePhotoItem = a3;
}

- (BOOL)includeTakePhotoItem
{
  return self->_includeTakePhotoItem;
}

- (void)setIncludeUnifiedContactImages:(BOOL)a3
{
  self->_includeUnifiedContactImages = a3;
}

- (BOOL)includeUnifiedContactImages
{
  return self->_includeUnifiedContactImages;
}

- (void)setIncludeContactImage:(BOOL)a3
{
  self->_includeContactImage = a3;
}

- (BOOL)includeContactImage
{
  return self->_includeContactImage;
}

- (id)build
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(CNPhotoPickerProviderGroupsBuilder *)self includeTakePhotoItem]
    || [(CNPhotoPickerProviderGroupsBuilder *)self includePhotoFromLibraryItem]
    || [(CNPhotoPickerProviderGroupsBuilder *)self includeMonograms]
    && [(CNPhotoPickerProviderGroupsBuilder *)self includesEmojiContent])
  {
    v4 = [(CNPhotoPickerProviderGroupsBuilder *)self addItemsContentGroup];
    [v3 addObject:v4];
  }
  if ([(CNPhotoPickerProviderGroupsBuilder *)self includesAnyPhotoContent])
  {
    v5 = [(CNPhotoPickerProviderGroupsBuilder *)self photoContentGroup];
    [v3 addObject:v5];
  }
  v6 = [MEMORY[0x1E4F1CA48] array];
  if ([(CNPhotoPickerProviderGroupsBuilder *)self includeAnimoji])
  {
    v7 = [(CNPhotoPickerProviderGroupsBuilder *)self animojiContentGroup];
    [v6 addObject:v7];
  }
  if ([(CNPhotoPickerProviderGroupsBuilder *)self includesEmojiContent])
  {
    v8 = [(CNPhotoPickerProviderGroupsBuilder *)self emojiContentGroup];
    [v6 addObject:v8];
  }
  if ([(CNPhotoPickerProviderGroupsBuilder *)self shouldOrderEmojiBeforeAnimoji])
  {
    v9 = objc_msgSend(v6, "_cn_reversed");
    [v3 addObjectsFromArray:v9];
  }
  else
  {
    [v3 addObjectsFromArray:v6];
  }

  return v3;
}

- (id)emojiContentGroup
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [CNPhotoPickerEmojiProvider alloc];
  v4 = [(CNPhotoPickerProviderGroupsBuilder *)self visualIdentity];
  v5 = [(CNPhotoPickerEmojiProvider *)v3 initWithVisualIdentity:v4];

  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v7 = [(CNPhotoPickerProviderGroupsBuilder *)self environment];
  v8 = +[CNPhotoPickerProviderGroup emojiGroupWithProviders:v6 environment:v7 allowAddItem:[(CNPhotoPickerProviderGroupsBuilder *)self includeAddEmojiItem]];

  return v8;
}

- (id)animojiContentGroup
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [CNPhotoPickerAnimojiProvider alloc];
  v4 = [(CNPhotoPickerProviderGroupsBuilder *)self visualIdentity];
  v5 = [(CNPhotoPickerProviderGroupsBuilder *)self avatarStore];
  v6 = [(CNPhotoPickerAnimojiProvider *)v3 initWithVisualIdentity:v4 avatarStore:v5];

  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = [(CNPhotoPickerProviderGroupsBuilder *)self environment];
  v9 = +[CNPhotoPickerProviderGroup animojiGroupWithProviders:v7 environment:v8 allowAddItem:[(CNPhotoPickerProviderGroupsBuilder *)self includeAddAnimojiItem]];

  return v9;
}

- (id)photoContentGroup
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(CNPhotoPickerProviderGroupsBuilder *)self includeMonograms])
  {
    v4 = [CNPhotoPickerMonogramProvider alloc];
    v5 = [(CNPhotoPickerProviderGroupsBuilder *)self visualIdentity];
    v6 = [(CNPhotoPickerMonogramProvider *)v4 initWithVisualIdentity:v5];
    [v3 addObject:v6];
  }
  if ([(CNPhotoPickerProviderGroupsBuilder *)self includeContactImage])
  {
    v7 = [CNPhotoPickerAccountPhotoProvider alloc];
    v8 = [(CNPhotoPickerProviderGroupsBuilder *)self visualIdentity];
    v9 = [(CNPhotoPickerAccountPhotoProvider *)v7 initWithVisualIdentity:v8 includeUnifiedContactImages:[(CNPhotoPickerProviderGroupsBuilder *)self includeUnifiedContactImages]];
    [v3 addObject:v9];
  }
  if ([(CNPhotoPickerProviderGroupsBuilder *)self includeRecents])
  {
    v10 = [CNPhotoPickerRecentsProvider alloc];
    v11 = [(CNPhotoPickerProviderGroupsBuilder *)self visualIdentity];
    v12 = [(CNPhotoPickerRecentsProvider *)v10 initWithVisualIdentity:v11];
    [v3 addObject:v12];
  }
  if ([(CNPhotoPickerProviderGroupsBuilder *)self includeFaces])
  {
    v13 = [CNPhotoPickerPhotoFacesProvider alloc];
    v14 = [(CNPhotoPickerProviderGroupsBuilder *)self visualIdentity];
    v15 = [(CNPhotoPickerPhotoFacesProvider *)v13 initWithVisualIdentity:v14];
    [v3 addObject:v15];
  }
  v16 = [(CNPhotoPickerProviderGroupsBuilder *)self environment];
  v17 = +[CNPhotoPickerProviderGroup suggestionsGroupWithProviders:v3 environment:v16 allowAddItem:0];

  return v17;
}

- (id)injectedItemsGroup
{
  v2 = [(CNPhotoPickerProviderGroupsBuilder *)self environment];
  v3 = +[CNPhotoPickerProviderGroup injectedItemsGroupWithEnvironment:v2];

  return v3;
}

- (id)addItemsContentGroup
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [CNPhotoPickerAddItemsProvider alloc];
  v4 = [(CNPhotoPickerProviderGroupsBuilder *)self visualIdentity];
  v5 = [(CNPhotoPickerAddItemsProvider *)v3 initWithVisualIdentity:v4 allowsTakePhotoItem:[(CNPhotoPickerProviderGroupsBuilder *)self includeTakePhotoItem] allowsPhotoFromLibraryItem:[(CNPhotoPickerProviderGroupsBuilder *)self includePhotoFromLibraryItem] allowsMonograms:[(CNPhotoPickerProviderGroupsBuilder *)self includeMonograms] allowsEmoji:[(CNPhotoPickerProviderGroupsBuilder *)self includesEmojiContent]];

  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v7 = [(CNPhotoPickerProviderGroupsBuilder *)self environment];
  v8 = +[CNPhotoPickerProviderGroup addItemsGroupWithProviders:v6 environment:v7];

  return v8;
}

- (BOOL)includesAnyPhotoContent
{
  if ([(CNPhotoPickerProviderGroupsBuilder *)self includeTakePhotoItem]
    || [(CNPhotoPickerProviderGroupsBuilder *)self includePhotoFromLibraryItem]
    || [(CNPhotoPickerProviderGroupsBuilder *)self includeContactImage]
    || [(CNPhotoPickerProviderGroupsBuilder *)self includeUnifiedContactImages]
    || [(CNPhotoPickerProviderGroupsBuilder *)self includeFaces])
  {
    return 1;
  }

  return [(CNPhotoPickerProviderGroupsBuilder *)self includeMonograms];
}

- (CNPhotoPickerProviderGroupsBuilder)initWithVisualIdentity:(id)a3 avatarStore:(id)a4 environment:(id)a5 contactViewCache:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CNPhotoPickerProviderGroupsBuilder;
  v15 = [(CNPhotoPickerProviderGroupsBuilder *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_visualIdentity, a3);
    objc_storeStrong((id *)&v16->_avatarStore, a4);
    objc_storeStrong((id *)&v16->_environment, a5);
    objc_storeStrong((id *)&v16->_contactViewCache, a6);
    v17 = v16;
  }

  return v16;
}

+ (id)builderWithVisualIdentity:(id)a3 avatarStore:(id)a4 environment:(id)a5 contactViewCache:(id)a6 photoPickerConfiguration:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = [[CNPhotoPickerProviderGroupsBuilder alloc] initWithVisualIdentity:v11 avatarStore:v15 environment:v14 contactViewCache:v13];

  -[CNPhotoPickerProviderGroupsBuilder setIncludeContactImage:](v16, "setIncludeContactImage:", [v12 includeContactImage]);
  -[CNPhotoPickerProviderGroupsBuilder setIncludeUnifiedContactImages:](v16, "setIncludeUnifiedContactImages:", [v12 includeUnifiedContactImages]);
  if ([v12 allowPhotoCapture]) {
    BOOL v17 = +[CNPhotoPickerCapabilities allowsCameraAccess];
  }
  else {
    BOOL v17 = 0;
  }
  [(CNPhotoPickerProviderGroupsBuilder *)v16 setIncludeTakePhotoItem:v17];
  if ([v12 allowPhotoFromLibrary]) {
    BOOL v18 = +[CNPhotoPickerCapabilities allowsPhotoLibraryAccess];
  }
  else {
    BOOL v18 = 0;
  }
  [(CNPhotoPickerProviderGroupsBuilder *)v16 setIncludePhotoFromLibraryItem:v18];
  -[CNPhotoPickerProviderGroupsBuilder setIncludeMonograms:](v16, "setIncludeMonograms:", [v12 includeMonograms]);
  if ([v12 includeFaces]) {
    BOOL v19 = +[CNPhotoPickerCapabilities allowsPhotoLibraryAccess];
  }
  else {
    BOOL v19 = 0;
  }
  [(CNPhotoPickerProviderGroupsBuilder *)v16 setIncludeFaces:v19];
  if ([v12 includeAnimoji])
  {
    BOOL v20 = +[CNPhotoPickerCapabilities allowsAvatarUI];
    if (v15) {
      BOOL v21 = v20;
    }
    else {
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
  }
  [(CNPhotoPickerProviderGroupsBuilder *)v16 setIncludeAnimoji:v21];
  BOOL v22 = [(CNPhotoPickerProviderGroupsBuilder *)v16 includeAnimoji]
     && [v12 allowAnimojiCreation]
     && +[CNPhotoPickerCapabilities allowsAvatarStoreAccess];
  [(CNPhotoPickerProviderGroupsBuilder *)v16 setIncludeAddAnimojiItem:v22];
  -[CNPhotoPickerProviderGroupsBuilder setIncludeRecents:](v16, "setIncludeRecents:", [v12 includeRecents]);
  -[CNPhotoPickerProviderGroupsBuilder setIncludesEmojiContent:](v16, "setIncludesEmojiContent:", [v12 includeEmoji]);
  -[CNPhotoPickerProviderGroupsBuilder setIncludeAddEmojiItem:](v16, "setIncludeAddEmojiItem:", [v12 includeEmoji]);
  -[CNPhotoPickerProviderGroupsBuilder setShouldOrderEmojiBeforeAnimoji:](v16, "setShouldOrderEmojiBeforeAnimoji:", [v11 identityType] == 1);

  return v16;
}

@end