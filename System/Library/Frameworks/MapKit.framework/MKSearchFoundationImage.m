@interface MKSearchFoundationImage
- (BOOL)isEqual:(id)a3;
- (id)initIconWithSize:(unint64_t)a3 mapItem:(id)a4;
- (void)loadImageDataWithCompletionAndErrorHandler:(id)a3;
- (void)loadImageDataWithCompletionHandler:(id)a3;
@end

@implementation MKSearchFoundationImage

- (id)initIconWithSize:(unint64_t)a3 mapItem:(id)a4
{
  id v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)MKSearchFoundationImage;
  v7 = [(MKSearchFoundationImage *)&v24 init];
  if (v7)
  {
    v8 = +[MKSystemController sharedInstance];
    [v8 screenScale];
    uint64_t v10 = v9;

    objc_msgSend(v7, "setSize:", 60.0, 60.0);
    if ([v6 _parsecSectionType] == 2)
    {
      [v7 size];
      v11 = objc_msgSend(v6, "_bestBrandIconURLForSize:allowSmaller:", 1);
      uint64_t v12 = [v11 copy];
      uint64_t v13 = 112;
    }
    else
    {
      v11 = [v6 _styleAttributes];
      uint64_t v12 = [v11 copy];
      uint64_t v13 = 120;
    }
    v14 = *(void **)&v7[v13];
    *(void *)&v7[v13] = v12;

    dispatch_group_t v15 = dispatch_group_create();
    v16 = (void *)*((void *)v7 + 13);
    *((void *)v7 + 13) = v15;

    dispatch_group_enter(*((dispatch_group_t *)v7 + 13));
    v17 = dispatch_get_global_queue(25, 0);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __52__MKSearchFoundationImage_initIconWithSize_mapItem___block_invoke;
    v19[3] = &unk_1E54BCAE8;
    v20 = v7;
    id v21 = v6;
    unint64_t v22 = a3;
    uint64_t v23 = v10;
    dispatch_async(v17, v19);
  }
  return v7;
}

void __52__MKSearchFoundationImage_initIconWithSize_mapItem___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18C139870]();
  if (!*(void *)(*(void *)(a1 + 32) + 112)
    || (objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfURL:"),
        (v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = +[MKIconManager imageForMapItem:*(void *)(a1 + 40) size:*(void *)(a1 + 48) forScale:2 format:*(double *)(a1 + 56)];
    v3 = UIImagePNGRepresentation(v4);
  }
  [*(id *)(a1 + 32) setImageData:v3];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 104));
}

- (void)loadImageDataWithCompletionAndErrorHandler:(id)a3
{
  id v4 = a3;
  group = self->_group;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__MKSearchFoundationImage_loadImageDataWithCompletionAndErrorHandler___block_invoke;
  v7[3] = &unk_1E54B8360;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_group_notify(group, MEMORY[0x1E4F14428], v7);
}

void __70__MKSearchFoundationImage_loadImageDataWithCompletionAndErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) imageData];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)loadImageDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__MKSearchFoundationImage_loadImageDataWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E54BCB10;
  id v7 = v4;
  id v5 = v4;
  [(MKSearchFoundationImage *)self loadImageDataWithCompletionAndErrorHandler:v6];
}

uint64_t __62__MKSearchFoundationImage_loadImageDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKSearchFoundationImage;
  if ([(MKSearchFoundationImage *)&v8 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ((url = self->_url) != 0 && v4[14] || (url = self->_styleAttribute) != 0 && v4[15]))
  {
    char v6 = objc_msgSend(url, "isEqual:");
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttribute, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

@end