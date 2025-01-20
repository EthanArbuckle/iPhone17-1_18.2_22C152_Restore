@interface AVTUIStickerPlaceholderProviderFactory
- (AVTUIStickerPlaceholderProviderFactory)initWithImageProvider:(id)a3;
- (NSMutableArray)queuedHandlers;
- (id)imageProvider;
- (id)placeholderProvider;
- (void)setQueuedHandlers:(id)a3;
@end

@implementation AVTUIStickerPlaceholderProviderFactory

- (AVTUIStickerPlaceholderProviderFactory)initWithImageProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTUIStickerPlaceholderProviderFactory;
  v5 = [(AVTUIStickerPlaceholderProviderFactory *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x210530210](v4);
    id imageProvider = v5->_imageProvider;
    v5->_id imageProvider = (id)v6;
  }
  return v5;
}

- (id)placeholderProvider
{
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__AVTUIStickerPlaceholderProviderFactory_placeholderProvider__block_invoke;
  v8[3] = &unk_263FF08E0;
  objc_copyWeak(&v9, &location);
  v2 = (void *)[v8 copy];
  uint64_t v6 = (void *)MEMORY[0x210530210](v2, v3, v4, v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

id __61__AVTUIStickerPlaceholderProviderFactory_placeholderProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained queuedHandlers];

  if (v5)
  {
    uint64_t v6 = [WeakRetained queuedHandlers];
    v7 = (void *)MEMORY[0x210530210](v3);
    [v6 addObject:v7];

    v8 = 0;
  }
  else
  {
    id v9 = (void *)MEMORY[0x263EFF980];
    v10 = (void *)MEMORY[0x210530210](v3);
    v11 = [v9 arrayWithObject:v10];
    [WeakRetained setQueuedHandlers:v11];

    objc_initWeak(&location, WeakRetained);
    v12 = [WeakRetained imageProvider];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __61__AVTUIStickerPlaceholderProviderFactory_placeholderProvider__block_invoke_2;
    v15[3] = &unk_263FF08B8;
    objc_copyWeak(&v17, &location);
    id v16 = v3;
    v13 = ((void (**)(void, void *, void))v12)[2](v12, v15, 0);

    v8 = (void *)MEMORY[0x210530210](v13);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __61__AVTUIStickerPlaceholderProviderFactory_placeholderProvider__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [WeakRetained queuedHandlers];

  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = objc_msgSend(WeakRetained, "queuedHandlers", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [WeakRetained setQueuedHandlers:0];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (NSMutableArray)queuedHandlers
{
  return self->_queuedHandlers;
}

- (void)setQueuedHandlers:(id)a3
{
}

- (id)imageProvider
{
  return self->_imageProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_queuedHandlers, 0);
}

@end