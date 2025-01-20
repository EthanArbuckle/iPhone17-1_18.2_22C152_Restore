@interface AFUIRemoteImageRepresentation
+ (NSArray)writableTypeIdentifiersForItemProvider;
- (AFUIRemoteImageRepresentation)initWithImageURL:(id)a3;
- (NSURL)imageURL;
- (UIImage)image;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (void)_commonInit;
- (void)setImage:(id)a3;
- (void)setImageURL:(id)a3;
@end

@implementation AFUIRemoteImageRepresentation

- (AFUIRemoteImageRepresentation)initWithImageURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFUIRemoteImageRepresentation;
  v5 = [(AFUIRemoteImageRepresentation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v6;

    [(AFUIRemoteImageRepresentation *)v5 _commonInit];
  }

  return v5;
}

- (void)_commonInit
{
  self->_queue = (OS_dispatch_queue *)dispatch_queue_create("ImageItemProvider Downloader", 0);

  MEMORY[0x270F9A758]();
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F01A60];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __93__AFUIRemoteImageRepresentation_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v9[3] = &unk_264691BC8;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(queue, v9);

  return 0;
}

void __93__AFUIRemoteImageRepresentation_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  id v12 = 0;
  v3 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v2 options:0 error:&v12];
  id v4 = v12;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __93__AFUIRemoteImageRepresentation_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_2;
  v8[3] = &unk_264691BA0;
  id v5 = *(id *)(a1 + 40);
  id v10 = v4;
  id v11 = v5;
  id v9 = v3;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __93__AFUIRemoteImageRepresentation_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end