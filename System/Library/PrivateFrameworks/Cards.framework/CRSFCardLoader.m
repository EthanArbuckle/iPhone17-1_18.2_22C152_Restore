@interface CRSFCardLoader
+ (id)sharedLoader;
- (CRSFCardLoader)init;
- (void)loadSFCard:(id)a3 completion:(id)a4;
@end

@implementation CRSFCardLoader

+ (id)sharedLoader
{
  if (sharedLoader_onceToken != -1) {
    dispatch_once(&sharedLoader_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedLoader_cardLoader;
  return v2;
}

uint64_t __30__CRSFCardLoader_sharedLoader__block_invoke()
{
  sharedLoader_cardLoader = objc_alloc_init(CRSFCardLoader);
  return MEMORY[0x270F9A758]();
}

- (CRSFCardLoader)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRSFCardLoader;
  v2 = [(CRSFCardLoader *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    loadedCards = v2->_loadedCards;
    v2->_loadedCards = v3;
  }
  return v2;
}

- (void)loadSFCard:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = [v6 cardId];
  v9 = [(NSCache *)self->_loadedCards objectForKey:v8];
  if (v9)
  {
    if (v7) {
      v7[2](v7, v9);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    v11 = v7;
    SFResourceLoaderLoadCard();

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __40__CRSFCardLoader_loadSFCard_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      NSLog(&cfstr_CardFailedToLo.isa, a1[4], v6);
    }
    else
    {
      v9 = (void *)*((void *)WeakRetained + 1);
      id v10 = [a1[4] cardId];
      [v9 setObject:v5 forKey:v10];

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __40__CRSFCardLoader_loadSFCard_completion___block_invoke_2;
      block[3] = &unk_2647EEF78;
      id v13 = a1[5];
      id v12 = v5;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __40__CRSFCardLoader_loadSFCard_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void).cxx_destruct
{
}

@end