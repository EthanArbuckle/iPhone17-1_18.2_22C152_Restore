@interface CNUIPRLikenessLoadingPlaceholderProvider
- (CGImage)_cnui_circularImageForSize:(CGSize)a3 scale:(double)a4;
- (CGImage)_cnui_roundedRectImageForSize:(CGSize)a3 scale:(double)a4;
- (CGImage)renderCircularImageForSize:(CGSize)a3 scale:(double)a4;
- (CGImage)renderRoundedRectImageForSize:(CGSize)a3 scale:(double)a4;
- (CNCache)cache;
- (CNScheduler)resourceLock;
- (CNUIPRLikenessLoadingPlaceholderProvider)init;
- (id)_cnui_likenessForSize:(CGSize)a3 scale:(double)a4;
- (unint64_t)_cnui_likenessType;
@end

@implementation CNUIPRLikenessLoadingPlaceholderProvider

- (CGImage)_cnui_circularImageForSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8 = NSString;
  v9 = NSStringFromSize(a3);
  v10 = [v8 stringWithFormat:@"%@-Circular", v9];

  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v11 = [(CNUIPRLikenessLoadingPlaceholderProvider *)self resourceLock];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__CNUIPRLikenessLoadingPlaceholderProvider__cnui_circularImageForSize_scale___block_invoke;
  v16[3] = &unk_264019110;
  v18 = &v22;
  v16[4] = self;
  id v12 = v10;
  id v17 = v12;
  CGFloat v19 = width;
  CGFloat v20 = height;
  double v21 = a4;
  [v11 performBlock:v16];

  v13 = (const void *)v23[3];
  if (v13) {
    v14 = (CGImage *)CFAutorelease(v13);
  }
  else {
    v14 = 0;
  }

  _Block_object_dispose(&v22, 8);
  return v14;
}

- (CNScheduler)resourceLock
{
  return self->_resourceLock;
}

void __77__CNUIPRLikenessLoadingPlaceholderProvider__cnui_circularImageForSize_scale___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cache];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __77__CNUIPRLikenessLoadingPlaceholderProvider__cnui_circularImageForSize_scale___block_invoke_2;
  v5[3] = &unk_264017A50;
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 72);
  id v4 = [v2 objectForKey:v3 onCacheMiss:v5];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
}

- (CNCache)cache
{
  return self->_cache;
}

uint64_t __77__CNUIPRLikenessLoadingPlaceholderProvider__cnui_circularImageForSize_scale___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderCircularImageForSize:scale:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (CNUIPRLikenessLoadingPlaceholderProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)CNUIPRLikenessLoadingPlaceholderProvider;
  v2 = [(CNUIPRLikenessLoadingPlaceholderProvider *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F33660] synchronousSerialDispatchQueueWithName:@"com.apple.contacts.ContactsUICore.CNUIPRLikenessLoadingPlaceholderProvider"];
    resourceLock = v2->_resourceLock;
    v2->_resourceLock = (CNScheduler *)v3;

    v5 = (CNCache *)objc_alloc_init(MEMORY[0x263F33568]);
    cache = v2->_cache;
    v2->_cache = v5;

    uint64_t v7 = v2;
  }

  return v2;
}

- (CGImage)renderCircularImageForSize:(CGSize)a3 scale:(double)a4
{
  result = CNUICircularImageCreate(&__block_literal_global_60, a3.width, a3.height, a4);
  if (result)
  {
    return (CGImage *)CFAutorelease(result);
  }
  return result;
}

void __77__CNUIPRLikenessLoadingPlaceholderProvider_renderCircularImageForSize_scale___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, CGContext *a6, CGColorSpace *a7)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_resourceLock, 0);
}

- (CGImage)renderRoundedRectImageForSize:(CGSize)a3 scale:(double)a4
{
  result = CNUIRoundedRectImageCreate(&__block_literal_global_4_2, a3.width, a3.height, a4);
  if (result)
  {
    return (CGImage *)CFAutorelease(result);
  }
  return result;
}

void __80__CNUIPRLikenessLoadingPlaceholderProvider_renderRoundedRectImageForSize_scale___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, CGContext *a6, CGColorSpace *a7)
{
}

- (CGImage)_cnui_roundedRectImageForSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8 = NSString;
  objc_super v9 = NSStringFromSize(a3);
  v10 = [v8 stringWithFormat:@"%@-RoundedRect", v9];

  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v11 = [(CNUIPRLikenessLoadingPlaceholderProvider *)self resourceLock];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __80__CNUIPRLikenessLoadingPlaceholderProvider__cnui_roundedRectImageForSize_scale___block_invoke;
  v16[3] = &unk_264019110;
  v18 = &v22;
  v16[4] = self;
  id v12 = v10;
  id v17 = v12;
  CGFloat v19 = width;
  CGFloat v20 = height;
  double v21 = a4;
  [v11 performBlock:v16];

  v13 = (const void *)v23[3];
  if (v13) {
    v14 = (CGImage *)CFAutorelease(v13);
  }
  else {
    v14 = 0;
  }

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __80__CNUIPRLikenessLoadingPlaceholderProvider__cnui_roundedRectImageForSize_scale___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cache];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __80__CNUIPRLikenessLoadingPlaceholderProvider__cnui_roundedRectImageForSize_scale___block_invoke_2;
  v5[3] = &unk_264017A50;
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 72);
  id v4 = [v2 objectForKey:v3 onCacheMiss:v5];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
}

uint64_t __80__CNUIPRLikenessLoadingPlaceholderProvider__cnui_roundedRectImageForSize_scale___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderRoundedRectImageForSize:scale:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (id)_cnui_likenessForSize:(CGSize)a3 scale:(double)a4
{
  id v4 = -[CNUIPRLikenessLoadingPlaceholderProvider _cnui_circularImageForSize:scale:](self, "_cnui_circularImageForSize:scale:", a3.width, a3.height, a4);
  v5 = (void *)MEMORY[0x263F5D440];
  return (id)[v5 photoWithScope:2 image:v4];
}

- (unint64_t)_cnui_likenessType
{
  return 2;
}

@end