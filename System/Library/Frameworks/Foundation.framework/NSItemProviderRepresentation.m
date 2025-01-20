@interface NSItemProviderRepresentation
- (NSItemProviderRepresentation)initWithType:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5;
- (NSItemProviderRepresentation)initWithType_v2:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5;
- (NSString)typeIdentifier;
- (id)_loadWithOptions:(id)a3 completionBlock:(id)a4;
- (id)copyWithDoNothingLoaderBlock;
- (id)loadDataWithOptions:(id)a3 completionHandler:(id)a4;
- (id)loadDataWithOptions_v2:(id)a3 completionHandler:(id)a4;
- (id)loadFileCopyWithOptions:(id)a3 completionHandler:(id)a4;
- (id)loadFileCopyWithOptions_v2:(id)a3 completionHandler:(id)a4;
- (id)loadOpenInPlaceWithOptions:(id)a3 completionHandler:(id)a4;
- (id)loadOpenInPlaceWithOptions_v2:(id)a3 completionHandler:(id)a4;
- (id)loadWithOptions:(id)a3 completionHandler:(id)a4;
- (id)loadWithOptions_v2:(id)a3 completionHandler:(id)a4;
- (id)performProgressTrackingWithLoaderBlock:(id)a3 onCancelCallback:(id)a4;
- (int64_t)preferredRepresentation;
- (int64_t)visibility;
- (void)dealloc;
- (void)setLoaderBlock:(id)a3;
- (void)setLoaderBlock_v2:(id)a3;
- (void)setPreferredRepresentation:(int64_t)a3;
- (void)setVisibility:(int64_t)a3;
@end

@implementation NSItemProviderRepresentation

- (NSItemProviderRepresentation)initWithType_v2:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NSItemProviderRepresentation;
  v8 = [(NSItemProviderRepresentation *)&v10 init];
  if (v8)
  {
    v8->_typeIdentifier = (NSString *)[a3 copy];
    v8->_loader = (id)[a5 copy];
    v8->_visibility = 0;
    v8->_preferredRepresentation = a4;
  }
  return v8;
}

- (NSItemProviderRepresentation)initWithType:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__NSItemProviderRepresentation_initWithType_preferredRepresentation_loader___block_invoke;
  v6[3] = &unk_1E51F9B78;
  v6[4] = a5;
  return [(NSItemProviderRepresentation *)self initWithType_v2:a3 preferredRepresentation:a4 loader:v6];
}

uint64_t __76__NSItemProviderRepresentation_initWithType_preferredRepresentation_loader___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__NSItemProviderRepresentation_initWithType_preferredRepresentation_loader___block_invoke_2;
  v8[3] = &unk_1E51F9B50;
  v8[4] = a3;
  return (*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, v8, a4, a5, a6);
}

uint64_t __76__NSItemProviderRepresentation_initWithType_preferredRepresentation_loader___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  +[NSItemRepresentationLoadResult resultWithData:a2 urlWrapper:a3 cleanupHandler:a5 error:a4];
  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v6();
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSItemProviderRepresentation;
  [(NSItemProviderRepresentation *)&v3 dealloc];
}

- (id)copyWithDoNothingLoaderBlock
{
  v7[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc((Class)objc_opt_class());
  typeIdentifier = self->_typeIdentifier;
  int64_t preferredRepresentation = self->_preferredRepresentation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__NSItemProviderRepresentation_copyWithDoNothingLoaderBlock__block_invoke;
  v7[3] = &unk_1E51FC158;
  v7[4] = self;
  return (id)objc_msgSend(v3, "initWithType_v2:preferredRepresentation:loader:", typeIdentifier, preferredRepresentation, v7);
}

uint64_t __60__NSItemProviderRepresentation_copyWithDoNothingLoaderBlock__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[6] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__NSItemProviderRepresentation_copyWithDoNothingLoaderBlock__block_invoke_2;
    block[3] = &unk_1E51F7EE0;
    block[4] = *(void *)(a1 + 32);
    block[5] = a3;
    _NSIPDispatchAsyncCallback(block);
  }
  return 0;
}

uint64_t __60__NSItemProviderRepresentation_copyWithDoNothingLoaderBlock__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = +[NSItemRepresentationLoadResult resultWithError:_NSIPCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 16), 0)];
  id v3 = *(uint64_t (**)(uint64_t, NSItemRepresentationLoadResult *))(v1 + 16);

  return v3(v1, v2);
}

- (id)performProgressTrackingWithLoaderBlock:(id)a3 onCancelCallback:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = +[NSProgress discreteProgressWithTotalUnitCount:100];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke;
  v11[3] = &unk_1E51FC180;
  v11[4] = a4;
  v11[5] = v12;
  [(NSProgress *)v6 setCancellationHandler:v11];
  v7 = +[NSProgress discreteProgressWithTotalUnitCount:100];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_3;
  v10[3] = &unk_1E51FC1D0;
  v10[4] = v7;
  v10[5] = v12;
  uint64_t v8 = (*((uint64_t (**)(id, void *))a3 + 2))(a3, v10);
  if (v8) {
    [(NSProgress *)v6 addChild:v8 withPendingUnitCount:100];
  }
  else {
    [(NSProgress *)v6 addChild:v7 withPendingUnitCount:100];
  }
  _Block_object_dispose(v12, 8);
  return v6;
}

void __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_2;
  block[3] = &unk_1E51FC180;
  long long v2 = *(_OWORD *)(a1 + 32);
  _NSIPDispatchAsyncCallback(block);
}

uint64_t __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

void __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v4[7] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_4;
  v4[3] = &unk_1E51FC1A8;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[5] = a2;
  v4[6] = v3;
  v4[4] = v2;
  _NSIPDispatchAsyncCallback(v4);
}

uint64_t __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_4(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      uint64_t v3 = *(uint64_t (**)(void))(result + 16);
      return v3();
    }
  }
  return result;
}

- (id)_loadWithOptions:(id)a3 completionBlock:(id)a4
{
  v9[6] = *MEMORY[0x1E4F143B8];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3052000000;
  v9[3] = __Block_byref_object_copy__25;
  v9[4] = __Block_byref_object_dispose__25;
  v9[5] = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke;
  v8[3] = &unk_1E51FC1F8;
  v8[4] = v9;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_2;
  v7[3] = &unk_1E51FC2C0;
  v7[4] = self;
  v7[5] = a3;
  void v7[6] = a4;
  v7[7] = v8;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_4_69;
  v6[3] = &unk_1E51FC220;
  v6[4] = a4;
  v6[5] = v8;
  id v4 = [(NSItemProviderRepresentation *)self performProgressTrackingWithLoaderBlock:v7 onCancelCallback:v6];
  _Block_object_dispose(v9, 8);
  return v4;
}

void __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "totalUnitCount"));
  if (a2) {
    (*(void (**)(uint64_t))(a2 + 16))(a2);
  }
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 cleanupHandler];
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_4;
  v7[3] = &unk_1E51FC248;
  v7[4] = a2;
  long long v8 = *(_OWORD *)(a1 + 40);
  uint64_t v9 = v4;
  return (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v7);
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 40))
  {
    id v2 = (id)[*(id *)(a1 + 32) copy];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_5;
    v5[3] = &unk_1E51FC220;
    long long v6 = *(_OWORD *)(a1 + 48);
    [v2 setCleanupHandler:v5];
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v4();
  }
}

void __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_6;
  block[3] = &unk_1E51FC220;
  long long v2 = *(_OWORD *)(a1 + 32);
  _NSIPDispatchAsyncCallback(block);
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_65(void *a1)
{
  v5[5] = *MEMORY[0x1E4F143B8];
  if (a1[5])
  {
    long long v2 = +[NSItemRepresentationLoadResult resultWithError:_NSIPCannotLoadRepresentationError(*(void *)(a1[4] + 16), 0)];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_2_66;
    v5[3] = &unk_1E51F8650;
    void v5[4] = a1[6];
    [(NSItemRepresentationLoadResult *)v2 setCleanupHandler:v5];
    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(void))(a1[6] + 16);
    return v4();
  }
}

void __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_2_66(uint64_t a1)
{
  v1[5] = *MEMORY[0x1E4F143B8];
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_3_67;
  v1[3] = &unk_1E51F8650;
  v1[4] = *(void *)(a1 + 32);
  _NSIPDispatchAsyncCallback(v1);
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_3_67(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_4_69(uint64_t a1)
{
  v5[5] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    long long v2 = +[NSItemRepresentationLoadResult resultWithError:_NSIPDataTransferCancelledError(0)];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_5_70;
    v5[3] = &unk_1E51F8650;
    void v5[4] = *(void *)(a1 + 40);
    [(NSItemRepresentationLoadResult *)v2 setCleanupHandler:v5];
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
}

void __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_5_70(uint64_t a1)
{
  v1[5] = *MEMORY[0x1E4F143B8];
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_6_71;
  v1[3] = &unk_1E51F8650;
  v1[4] = *(void *)(a1 + 32);
  _NSIPDispatchAsyncCallback(v1);
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_6_71(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)loadWithOptions_v2:(id)a3 completionHandler:(id)a4
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__NSItemProviderRepresentation_loadWithOptions_v2_completionHandler___block_invoke;
  v5[3] = &unk_1E51FC2E8;
  void v5[4] = a4;
  return [(NSItemProviderRepresentation *)self _loadWithOptions:a3 completionBlock:v5];
}

void __69__NSItemProviderRepresentation_loadWithOptions_v2_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  block[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__NSItemProviderRepresentation_loadWithOptions_v2_completionHandler___block_invoke_2;
    block[3] = &unk_1E51F7EE0;
    void block[4] = a2;
    block[5] = v2;
    _NSIPDispatchAsyncCallback(block);
  }
}

uint64_t __69__NSItemProviderRepresentation_loadWithOptions_v2_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)loadWithOptions:(id)a3 completionHandler:(id)a4
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__NSItemProviderRepresentation_loadWithOptions_completionHandler___block_invoke;
  v5[3] = &unk_1E51FC2E8;
  void v5[4] = a4;
  return [(NSItemProviderRepresentation *)self loadWithOptions_v2:a3 completionHandler:v5];
}

uint64_t __66__NSItemProviderRepresentation_loadWithOptions_completionHandler___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    uint64_t v4 = [a2 data];
    uint64_t v5 = [a2 urlWrapper];
    uint64_t v6 = [a2 error];
    uint64_t v7 = [a2 cleanupHandler];
    long long v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 16);
    return v8(v2, v4, v5, v6, v7);
  }
  return result;
}

- (void)setLoaderBlock_v2:(id)a3
{
  self->_loader = (id)[a3 copy];
}

- (void)setLoaderBlock:(id)a3
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__NSItemProviderRepresentation_setLoaderBlock___block_invoke;
  v3[3] = &unk_1E51F9B78;
  v3[4] = a3;
  [(NSItemProviderRepresentation *)self setLoaderBlock_v2:v3];
}

uint64_t __47__NSItemProviderRepresentation_setLoaderBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__NSItemProviderRepresentation_setLoaderBlock___block_invoke_2;
  v8[3] = &unk_1E51FC310;
  v8[4] = a3;
  return (*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, v8, a4, a5, a6);
}

uint64_t __47__NSItemProviderRepresentation_setLoaderBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = +[NSItemRepresentationLoadResult resultWithData:a2 urlWrapper:a3 cleanupHandler:a6 error:a5];
  long long v8 = *(uint64_t (**)(uint64_t, NSItemRepresentationLoadResult *))(v6 + 16);

  return v8(v6, v7);
}

- (id)loadDataWithOptions_v2:(id)a3 completionHandler:(id)a4
{
  v14[7] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = +[NSProgress discreteProgressWithTotalUnitCount:100];
  if ([(NSItemProviderRepresentation *)self preferredRepresentation]) {
    long long v8 = +[NSProgress discreteProgressWithTotalUnitCount:100];
  }
  else {
    long long v8 = 0;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke;
  v14[3] = &unk_1E51FA068;
  v14[5] = v8;
  v14[6] = a4;
  v14[4] = self;
  uint64_t v9 = [(NSItemProviderRepresentation *)self _loadWithOptions:a3 completionBlock:v14];
  if (v8)
  {
    if ([(NSItemProviderRepresentation *)self preferredRepresentation] == 2)
    {
      [(NSProgress *)v7 addChild:v9 withPendingUnitCount:10];
      uint64_t v10 = v7;
      uint64_t v11 = v8;
      uint64_t v12 = 90;
    }
    else
    {
      [(NSProgress *)v7 addChild:v9 withPendingUnitCount:50];
      uint64_t v10 = v7;
      uint64_t v11 = v8;
      uint64_t v12 = 50;
    }
  }
  else
  {
    uint64_t v10 = v7;
    uint64_t v11 = v9;
    uint64_t v12 = 100;
  }
  [(NSProgress *)v10 addChild:v11 withPendingUnitCount:v12];
  return v7;
}

void __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 error];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__25;
  v25 = __Block_byref_object_dispose__25;
  uint64_t v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__25;
  v19 = __Block_byref_object_dispose__25;
  id v20 = 0;
  id v20 = (id)[a2 error];
  if (v4) {
    goto LABEL_5;
  }
  if ([a2 data])
  {
    uint64_t v5 = (NSError *)(id)[a2 data];
    uint64_t v6 = v22;
LABEL_4:
    v6[5] = (uint64_t)v5;
    goto LABEL_5;
  }
  if ([a2 urlWrapper])
  {
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke_2;
    v14[3] = &unk_1E51FC360;
    v14[4] = *(void *)(a1 + 32);
    v14[5] = a2;
    v14[6] = *(void *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "addChild:withPendingUnitCount:", _NSIPCoordinatedReadForUploading(v11, (uint64_t)v14), 100);
    goto LABEL_6;
  }
  uint64_t v12 = _NSIPNoLoaderAvailableError(*(void *)(*(void *)(a1 + 32) + 16), 0);
  if (v12)
  {

    uint64_t v5 = _NSIPCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 16), (uint64_t)v12);
    uint64_t v6 = v16;
    goto LABEL_4;
  }
LABEL_5:
  id v7 = (id)v22[5];
  id v8 = (id)v16[5];
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  uint64_t v9 = [a2 cleanupHandler];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke_4;
  block[3] = &unk_1E51FC388;
  uint64_t v10 = *(void *)(a1 + 48);
  void block[4] = a2;
  block[5] = v10;
  void block[7] = &v21;
  block[8] = &v15;
  block[6] = v9;
  _NSIPDispatchAsyncCallback(block);
LABEL_6:

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
}

void __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke_2(uint64_t a1, void *a2, NSError *a3)
{
  RepresentationError = a3;
  uint64_t v5 = 0;
  v14[1] = *(NSError **)MEMORY[0x1E4F143B8];
  v14[0] = a3;
  uint64_t v6 = a3;
  if (a2 && !a3)
  {
    char v13 = 0;
    id v7 = _NSIPCloneURLToTemporaryFolder(a2, *(void *)(*(void *)(a1 + 32) + 16), 0, &v13, v14);
    uint64_t v5 = 0;
    id v8 = v13;
    if (v13 && !v14[0])
    {
      uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7 options:1 error:v14];
      id v8 = v13;
    }
    if (v8)
    {
      uint64_t v9 = +[NSFileManager defaultManager];
      [(NSFileManager *)v9 removeItemAtURL:v13 error:0];
    }
    uint64_t v6 = v14[0];
  }
  if (v6) {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 16), (uint64_t)v6);
  }
  if (!(v5 | (unint64_t)RepresentationError)) {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 16), 0);
  }
  uint64_t v10 = [*(id *)(a1 + 40) cleanupHandler];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke_3;
  void v12[3] = &unk_1E51FC338;
  uint64_t v11 = *(void *)(a1 + 48);
  v12[4] = *(void *)(a1 + 40);
  v12[5] = v5;
  v12[6] = RepresentationError;
  v12[7] = v11;
  v12[8] = v10;
  _NSIPDispatchAsyncCallback(v12);
}

uint64_t __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    id v2 = (id)[*(id *)(a1 + 32) copyWithData:*(void *)(a1 + 40) urlWrapper:0 cleanupHandler:0 error:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v2 = (void *)[*(id *)(a1 + 32) copyWithData:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) urlWrapper:0 cleanupHandler:0 error:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (id)loadDataWithOptions:(id)a3 completionHandler:(id)a4
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__NSItemProviderRepresentation_loadDataWithOptions_completionHandler___block_invoke;
  v5[3] = &unk_1E51FC2E8;
  void v5[4] = a4;
  return [(NSItemProviderRepresentation *)self loadDataWithOptions_v2:a3 completionHandler:v5];
}

uint64_t __70__NSItemProviderRepresentation_loadDataWithOptions_completionHandler___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    uint64_t v4 = [a2 data];
    uint64_t v5 = [a2 error];
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    return v6(v2, v4, v5);
  }
  return result;
}

- (id)loadFileCopyWithOptions_v2:(id)a3 completionHandler:(id)a4
{
  void v14[7] = *MEMORY[0x1E4F143B8];
  id v7 = +[NSProgress discreteProgressWithTotalUnitCount:100];
  if ([(NSItemProviderRepresentation *)self preferredRepresentation]) {
    id v8 = +[NSProgress progressWithTotalUnitCount:100];
  }
  else {
    id v8 = 0;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke;
  v14[3] = &unk_1E51FC400;
  v14[5] = v8;
  v14[6] = a4;
  v14[4] = self;
  uint64_t v9 = [(NSItemProviderRepresentation *)self _loadWithOptions:a3 completionBlock:v14];
  if (v8)
  {
    if ([(NSItemProviderRepresentation *)self preferredRepresentation] == 2)
    {
      [(NSProgress *)v7 addChild:v9 withPendingUnitCount:10];
      uint64_t v10 = v7;
      uint64_t v11 = v8;
      uint64_t v12 = 90;
    }
    else
    {
      [(NSProgress *)v7 addChild:v9 withPendingUnitCount:50];
      uint64_t v10 = v7;
      uint64_t v11 = v8;
      uint64_t v12 = 50;
    }
  }
  else
  {
    uint64_t v10 = v7;
    uint64_t v11 = v9;
    uint64_t v12 = 100;
  }
  [(NSProgress *)v10 addChild:v11 withPendingUnitCount:v12];
  return v7;
}

uint64_t __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSError *)[a2 error];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v18 = __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_2;
  v19 = &unk_1E51FC3D8;
  uint64_t v5 = *(void *)(a1 + 48);
  id v20 = a2;
  uint64_t v21 = v5;
  if (v4) {
    goto LABEL_2;
  }
  if ([a2 data])
  {
    uint64_t v10 = _NSIPCreateTemporaryFolder();
    if (v10)
    {
      id v7 = v10;
      id v11 = (id)((uint64_t (*)(uint64_t))softLinkUTTypeCopyDescription_0[0])(*(void *)(*(void *)(a1 + 32) + 16));
      if (![v11 length]) {
        id v11 = (id)[(id)_NSFoundationBundle() localizedStringForKey:@"Document" value:&stru_1ECA5C228 table:@"Extension"];
      }
      uint64_t v8 = objc_msgSend(v7, "URLByAppendingPathComponent:", _NSIPFilenameWithProperExtension(v11, *(void *)(*(void *)(a1 + 32) + 16)));
      objc_msgSend((id)objc_msgSend(a2, "data"), "writeToURL:atomically:", v8, 1);
      uint64_t v6 = 0;
      goto LABEL_4;
    }
    uint64_t v14 = _NSOSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_181795000, v14, OS_LOG_TYPE_ERROR, "Cannot create temporary file.", buf, 2u);
    }
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 16), 0);
    goto LABEL_16;
  }
  if (![a2 urlWrapper])
  {
    RepresentationError = _NSIPNoLoaderAvailableError(*(void *)(*(void *)(a1 + 32) + 16), 0);
LABEL_16:
    if (!RepresentationError)
    {
      id v7 = 0;
      uint64_t v6 = 0;
      goto LABEL_3;
    }
    uint64_t v4 = _NSIPCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 16), (uint64_t)RepresentationError);
LABEL_2:
    uint64_t v6 = v4;
    id v7 = 0;
LABEL_3:
    uint64_t v8 = 0;
LABEL_4:
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
    return ((uint64_t (*)(void *, uint64_t, NSError *, char *, uint64_t))v18)(v17, v8, v6, v7, [a2 cleanupHandler]);
  }
  uint64_t v12 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_85;
  v16[3] = &unk_1E51FC360;
  v16[4] = *(void *)(a1 + 32);
  v16[5] = a2;
  v16[6] = v17;
  char v13 = _NSIPCoordinatedRead(v12, (uint64_t)v16);
  [*(id *)(a1 + 40) setCompletedUnitCount:50];
  return [*(id *)(a1 + 40) addChild:v13 withPendingUnitCount:50];
}

void __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  block[10] = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_3;
  block[3] = &unk_1E51FC3B0;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  void block[4] = a2;
  block[5] = v6;
  block[6] = a3;
  void block[7] = a4;
  block[8] = v5;
  void block[9] = a5;
  _NSIPDispatchAsyncCallback(block);
}

uint64_t __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 64))
  {
    if (*(void *)(a1 + 32)) {
      uint64_t v2 = [[NSSecurityScopedURLWrapper alloc] initWithURL:*(void *)(a1 + 32)];
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = (void *)[*(id *)(a1 + 40) copyWithData:0 urlWrapper:v2 cleanupHandler:0 error:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  if (*(void *)(a1 + 56)) {
    [+[NSFileManager defaultManager] removeItemAtURL:*(void *)(a1 + 56) error:0];
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_85(uint64_t a1, void *a2, NSError *a3)
{
  RepresentationError = a3;
  uint64_t v5 = 0;
  v12[1] = *(NSError **)MEMORY[0x1E4F143B8];
  id v11 = 0;
  v12[0] = a3;
  if (a2 && !a3)
  {
    uint64_t v6 = _NSIPCloneURLToTemporaryFolder(a2, *(void *)(*(void *)(a1 + 32) + 16), 0, &v11, v12);
    if (v6) {
      BOOL v7 = v12[0] == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      uint64_t v5 = v6;
    }
    else
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "urlWrapper"), "url");
      uint64_t v9 = _NSIPCannotCopyFileError(v8, 0, (uint64_t)v12[0]);
      v12[0] = v9;
      if (v9)
      {
        RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 16), (uint64_t)v9);
        uint64_t v5 = 0;
        return (*(uint64_t (**)(void, void *, NSError *, char *, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, RepresentationError, v11, [*(id *)(a1 + 40) cleanupHandler]);
      }
      uint64_t v5 = 0;
    }
    RepresentationError = 0;
  }
  return (*(uint64_t (**)(void, void *, NSError *, char *, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, RepresentationError, v11, [*(id *)(a1 + 40) cleanupHandler]);
}

- (id)loadFileCopyWithOptions:(id)a3 completionHandler:(id)a4
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__NSItemProviderRepresentation_loadFileCopyWithOptions_completionHandler___block_invoke;
  v5[3] = &unk_1E51FC2E8;
  void v5[4] = a4;
  return [(NSItemProviderRepresentation *)self loadFileCopyWithOptions_v2:a3 completionHandler:v5];
}

uint64_t __74__NSItemProviderRepresentation_loadFileCopyWithOptions_completionHandler___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
    uint64_t v5 = [a2 error];
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    return v6(v2, v4, v5);
  }
  return result;
}

- (id)loadOpenInPlaceWithOptions_v2:(id)a3 completionHandler:(id)a4
{
  void v5[6] = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke;
  v5[3] = &unk_1E51FC478;
  void v5[4] = self;
  v5[5] = a4;
  return [(NSItemProviderRepresentation *)self _loadWithOptions:a3 completionBlock:v5];
}

void __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *(NSError **)MEMORY[0x1E4F143B8];
  RepresentationError = (NSError *)[a2 error];
  uint64_t v5 = [a2 cleanupHandler];
  if (RepresentationError)
  {
    char v6 = 0;
    uint64_t v7 = 0;
    goto LABEL_19;
  }
  v17[0] = 0;
  if ([a2 data])
  {
    uint64_t v7 = _NSIPTemporaryFileName(*(__CFString **)(*(void *)(a1 + 32) + 16), v17);
    if (!v7)
    {
      TemporaryFileError = _NSIPCannotCreateTemporaryFileError(0, (uint64_t)v17[0]);
      uint64_t v9 = TemporaryFileError;
LABEL_14:
      v17[0] = TemporaryFileError;
      goto LABEL_15;
    }
    char v8 = objc_msgSend((id)objc_msgSend(a2, "data"), "writeToURL:options:error:", v7, 1, v17);
    uint64_t v9 = v17[0];
    if (v8)
    {
LABEL_15:
      if (v9) {
        RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 16), (uint64_t)v9);
      }
      else {
        RepresentationError = 0;
      }
      char v6 = 0;
      goto LABEL_19;
    }
    TemporaryFileError = _NSIPCannotCopyFileError(0, 0, (uint64_t)v17[0]);
LABEL_13:
    uint64_t v9 = TemporaryFileError;
    uint64_t v7 = 0;
    goto LABEL_14;
  }
  if (![a2 urlWrapper])
  {
    TemporaryFileError = _NSIPNoLoaderAvailableError(*(void *)(*(void *)(a1 + 32) + 16), 0);
    goto LABEL_13;
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "isReadonly") & 1) != 0
    || *(void *)(*(void *)(a1 + 32) + 32) == 1)
  {
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_2;
    v16[3] = &unk_1E51FC428;
    uint64_t v12 = *(void *)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    v16[5] = a2;
    v16[6] = v12;
    void v16[7] = v5;
    _NSIPCoordinatedRead(v11, (uint64_t)v16);
    return;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
  RepresentationError = 0;
  char v6 = 1;
LABEL_19:
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_5;
  v14[3] = &unk_1E51FC450;
  uint64_t v13 = *(void *)(a1 + 40);
  v14[4] = v7;
  v14[5] = a2;
  v14[6] = RepresentationError;
  void v14[7] = v13;
  char v15 = v6;
  void v14[8] = v5;
  _NSIPDispatchAsyncCallback(v14);
}

void __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v13[1] = *(char **)MEMORY[0x1E4F143B8];
  v13[0] = 0;
  if (a2 && !a3)
  {
    uint64_t v12 = 0;
    uint64_t v4 = _NSIPCloneURLToTemporaryFolder(a2, *(void *)(*(void *)(a1 + 32) + 16), 0, v13, &v12);
    if (v4) {
      BOOL v5 = v12 == 0;
    }
    else {
      BOOL v5 = 0;
    }
    int v6 = !v5;
    if (v5) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 0;
    }
    if (v6 == 1 && v12 == 0) {
      uint64_t v12 = _NSIPCannotCopyFileError(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "urlWrapper"), "url"), 0, 0);
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_3;
    v10[3] = &unk_1E51FC338;
    uint64_t v9 = *(void *)(a1 + 40);
    v10[4] = v7;
    v10[5] = v9;
    void v10[6] = 0;
    long long v11 = *(_OWORD *)(a1 + 48);
    _NSIPDispatchAsyncCallback(v10);
  }
}

uint64_t __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_3(uint64_t a1)
{
  void v7[5] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 56))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2)
    {
      uint64_t v3 = v7;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_4;
      v7[3] = &unk_1E51F71D0;
      v7[4] = v2;
      uint64_t v4 = [[NSSecurityScopedURLWrapper alloc] initWithURL:*(void *)(a1 + 32)];
    }
    else
    {
      uint64_t v3 = 0;
      uint64_t v4 = 0;
    }
    BOOL v5 = (void *)[*(id *)(a1 + 40) copyWithData:0 urlWrapper:v4 cleanupHandler:v3 error:*(void *)(a1 + 48)];
    [v5 setWasOpenedInPlace:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = +[NSFileManager defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);

  return [(NSFileManager *)v2 removeItemAtURL:v3 error:0];
}

NSProgress *__80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_5(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    if (*(void *)(a1 + 32)) {
      uint64_t v2 = [[NSSecurityScopedURLWrapper alloc] initWithURL:*(void *)(a1 + 32)];
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = (void *)[*(id *)(a1 + 40) copyWithData:0 urlWrapper:v2 cleanupHandler:0 error:*(void *)(a1 + 48)];
    [v3 setWasOpenedInPlace:*(unsigned __int8 *)(a1 + 72)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  uint64_t result = *(NSProgress **)(a1 + 64);
  if (result) {
    uint64_t result = (NSProgress *)((uint64_t (*)(void))result->_values)();
  }
  if (!*(void *)(a1 + 48) && !*(unsigned char *)(a1 + 72))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return _NSIPCoordinatedDelete(v5, (uint64_t)&__block_literal_global_74);
  }
  return result;
}

void __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    uint64_t v4 = +[NSFileManager defaultManager];
    [(NSFileManager *)v4 removeItemAtURL:a2 error:0];
  }
}

- (id)loadOpenInPlaceWithOptions:(id)a3 completionHandler:(id)a4
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_completionHandler___block_invoke;
  v5[3] = &unk_1E51FC2E8;
  void v5[4] = a4;
  return [(NSItemProviderRepresentation *)self loadOpenInPlaceWithOptions_v2:a3 completionHandler:v5];
}

uint64_t __77__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_completionHandler___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
    uint64_t v5 = [a2 wasOpenedInPlace];
    uint64_t v6 = [a2 error];
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 16);
    return v7(v2, v4, v5, v6);
  }
  return result;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(int64_t)a3
{
  self->_visibility = a3;
}

- (int64_t)preferredRepresentation
{
  return self->_preferredRepresentation;
}

- (void)setPreferredRepresentation:(int64_t)a3
{
  self->_int64_t preferredRepresentation = a3;
}

@end