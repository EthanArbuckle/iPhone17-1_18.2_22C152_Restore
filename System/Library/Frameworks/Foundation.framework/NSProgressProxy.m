@interface NSProgressProxy
@end

@implementation NSProgressProxy

void __51___NSProgressProxy__setRemoteUserInfoValue_forKey___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x185308110]();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)_NSProgressProxy;
  objc_msgSendSuper2(&v5, sel__setRemoteUserInfoValue_forKey_, v4, v3);
}

void __45___NSProgressProxy__invokePublishingHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x185308110]();
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 136);
  if ((void *)v3 != v4)
  {
    objc_super v5 = (void *)v3;

    *(void *)(*(void *)(a1 + 32) + 136) = [v5 copy];
  }
}

void __46___NSProgressProxy__invokeUnpublishingHandler__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x185308110]();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 136);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();

    *(void *)(*(void *)(a1 + 32) + 136) = 0;
  }
}

void __45___NSProgressProxy__setRemoteValues_forKeys___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x185308110]();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)_NSProgressProxy;
  objc_msgSendSuper2(&v5, sel__setRemoteValues_forKeys_, v4, v3);
}

@end