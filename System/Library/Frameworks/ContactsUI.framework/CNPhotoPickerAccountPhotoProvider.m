@interface CNPhotoPickerAccountPhotoProvider
- (BOOL)includeUnifiedContactImages;
- (CNPhotoPickerAccountPhotoProvider)initWithVisualIdentity:(id)a3;
- (CNPhotoPickerAccountPhotoProvider)initWithVisualIdentity:(id)a3 includeUnifiedContactImages:(BOOL)a4;
- (CNVisualIdentity)visualIdentity;
- (NSString)identifier;
- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8;
- (id)providerItemForVisualIdentity:(id)a3 forSize:(CGSize)a4 scale:(double)a5 RTL:(BOOL)a6 renderingQueue:(id)a7 callbackQueue:(id)a8 itemDelegate:(id)a9;
- (void)setIdentifier:(id)a3;
- (void)setIncludeUnifiedContactImages:(BOOL)a3;
@end

@implementation CNPhotoPickerAccountPhotoProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualIdentity, 0);

  objc_storeStrong((id *)&self->identifier, 0);
}

- (void)setIncludeUnifiedContactImages:(BOOL)a3
{
  self->_includeUnifiedContactImages = a3;
}

- (BOOL)includeUnifiedContactImages
{
  return self->_includeUnifiedContactImages;
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
  return self->identifier;
}

- (id)providerItemForVisualIdentity:(id)a3 forSize:(CGSize)a4 scale:(double)a5 RTL:(BOOL)a6 renderingQueue:(id)a7 callbackQueue:(id)a8 itemDelegate:(id)a9
{
  BOOL v11 = a6;
  double height = a4.height;
  double width = a4.width;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a3;
  uint64_t v20 = [v19 contactImageType];
  if (v20 == 4)
  {
    v28 = [CNPhotoPickerEmojiProviderItem alloc];
    v29 = [v19 imageData];
    v30 = [v19 thumbnailImageData];
    v31 = [v19 fullscreenImageData];
    [v19 cropRect];
    uint64_t v32 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:](v28, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v29, v30, v31);
  }
  else
  {
    if (v20 == 3)
    {
      v33 = CNPhotoPickerAnimojiProviderItem;
    }
    else
    {
      if (v20 == 2)
      {
        v37 = +[CNAvatarImageRendererSettings defaultSettings];
        v21 = [[CNAvatarImageRenderer alloc] initWithSettings:v37];
        v22 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:color:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:color:", v11, 0, 0, width, height, a5);
        v23 = [CNPhotoPickerMonogramProviderItem alloc];
        v24 = [v19 imageData];
        v25 = [v19 thumbnailImageData];
        v26 = [v19 fullscreenImageData];
        v27 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:](v23, "initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:", v24, v25, v26, 0, v16, v17, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

        [(CNPhotoPickerMonogramProviderItem *)v27 setHasUnknownColor:1];
        [(CNPhotoPickerMonogramProviderItem *)v27 setAvatarRenderer:v21];
        [(CNPhotoPickerMonogramProviderItem *)v27 setRenderingScope:v22];
        [(CNPhotoPickerMonogramProviderItem *)v27 setIsContactImage:1];
        [(CNPhotoPickerMonogramProviderItem *)v27 setVisualIdentity:v19];

        goto LABEL_10;
      }
      v33 = CNPhotoPickerProviderItem;
    }
    id v34 = [v33 alloc];
    v29 = [v19 imageData];
    v30 = [v19 thumbnailImageData];
    v31 = [v19 fullscreenImageData];
    [v19 cropRect];
    uint64_t v32 = objc_msgSend(v34, "initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:", v29, v30, v31, 0, v16, v17);
  }
  v27 = (CNPhotoPickerMonogramProviderItem *)v32;

  [(CNPhotoPickerProviderItem *)v27 setDelegate:v18];
LABEL_10:
  char v35 = [v19 imageAllowsEditing];

  if ((v35 & 1) == 0) {
    [(CNPhotoPickerProviderItem *)v27 setAllowsEditing:0];
  }

  return v27;
}

- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8
{
  BOOL v10 = a5;
  double height = a3.height;
  double width = a3.width;
  v42[1] = *MEMORY[0x1E4F143B8];
  id v36 = a6;
  id v15 = a7;
  id v16 = a8;
  id v35 = [MEMORY[0x1E4F1CA48] array];
  if ([(CNPhotoPickerAccountPhotoProvider *)self includeUnifiedContactImages])
  {
    id v17 = [(CNPhotoPickerAccountPhotoProvider *)self visualIdentity];
    if ([v17 hasLinkedContacts])
    {
      id v18 = [(CNPhotoPickerAccountPhotoProvider *)self visualIdentity];
      id v19 = [v18 linkedContacts];
    }
    else
    {
      id v19 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v34 = v19;
  uint64_t v20 = objc_msgSend(v19, "_cn_map:", &__block_literal_global_36744);
  v21 = [(CNPhotoPickerAccountPhotoProvider *)self visualIdentity];
  v42[0] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  v33 = (void *)v20;
  v23 = [v22 arrayByAddingObjectsFromArray:v20];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v24 = v23;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v30 = [v29 imageData];

        if (v30)
        {
          v31 = -[CNPhotoPickerAccountPhotoProvider providerItemForVisualIdentity:forSize:scale:RTL:renderingQueue:callbackQueue:itemDelegate:](self, "providerItemForVisualIdentity:forSize:scale:RTL:renderingQueue:callbackQueue:itemDelegate:", v29, v10, v36, v15, v16, width, height, a4);
          [v35 addObject:v31];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v26);
  }

  return v35;
}

CNVisualIdentity *__106__CNPhotoPickerAccountPhotoProvider_loadItemsForSize_scale_RTL_renderingQueue_callbackQueue_itemDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[CNVisualIdentity alloc] initWithContact:v2];

  return v3;
}

- (CNPhotoPickerAccountPhotoProvider)initWithVisualIdentity:(id)a3
{
  return [(CNPhotoPickerAccountPhotoProvider *)self initWithVisualIdentity:a3 includeUnifiedContactImages:1];
}

- (CNPhotoPickerAccountPhotoProvider)initWithVisualIdentity:(id)a3 includeUnifiedContactImages:(BOOL)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNPhotoPickerAccountPhotoProvider;
  v8 = [(CNPhotoPickerAccountPhotoProvider *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_visualIdentity, a3);
    v9->_includeUnifiedContactImages = a4;
    BOOL v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v10 UUIDString];
    identifier = v9->identifier;
    v9->identifier = (NSString *)v11;

    v13 = v9;
  }

  return v9;
}

@end