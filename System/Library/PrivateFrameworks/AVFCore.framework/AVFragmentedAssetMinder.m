@interface AVFragmentedAssetMinder
+ (AVFragmentedAssetMinder)fragmentedAssetMinderWithAsset:(AVAsset *)asset mindingInterval:(NSTimeInterval)mindingInterval;
- (AVFragmentedAssetMinder)init;
- (AVFragmentedAssetMinder)initWithAsset:(AVAsset *)asset mindingInterval:(NSTimeInterval)mindingInterval;
- (BOOL)_throwsWhenAlreadyMindedAssetIsAdded;
- (NSArray)assets;
- (NSTimeInterval)mindingInterval;
- (void)_setMindingInterval:(double)a3 removeAllAssets:(BOOL)a4;
- (void)addFragmentedAsset:(AVAsset *)asset;
- (void)dealloc;
- (void)removeFragmentedAsset:(AVAsset *)asset;
- (void)setMindingInterval:(NSTimeInterval)mindingInterval;
@end

@implementation AVFragmentedAssetMinder

+ (AVFragmentedAssetMinder)fragmentedAssetMinderWithAsset:(AVAsset *)asset mindingInterval:(NSTimeInterval)mindingInterval
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAsset:asset mindingInterval:mindingInterval];
  return (AVFragmentedAssetMinder *)v4;
}

- (AVFragmentedAssetMinder)init
{
  v7.receiver = self;
  v7.super_class = (Class)AVFragmentedAssetMinder;
  v2 = [(AVFragmentedAssetMinder *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVFragmentedAssetMinderInternal);
    v2->_fragmentedAssetMinder = v3;
    if (!v3
      || (v2->_fragmentedAssetMinder->assets = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]),
          v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM),
          v2->_fragmentedAssetMinder->accessSerializer = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avfragmentedassetminder", v4), v2->_fragmentedAssetMinder->mindingInterval = 10.0, fragmentedAssetMinder = v2->_fragmentedAssetMinder, !fragmentedAssetMinder->assets)|| fragmentedAssetMinder->mindingInterval == 0.0)
    {

      return 0;
    }
  }
  return v2;
}

- (AVFragmentedAssetMinder)initWithAsset:(AVAsset *)asset mindingInterval:(NSTimeInterval)mindingInterval
{
  v6 = [(AVFragmentedAssetMinder *)self init];
  objc_super v7 = v6;
  if (v6)
  {
    [(AVFragmentedAssetMinder *)v6 setMindingInterval:mindingInterval];
    [(AVFragmentedAssetMinder *)v7 addFragmentedAsset:asset];
  }
  return v7;
}

- (void)dealloc
{
  [(AVFragmentedAssetMinder *)self _setMindingInterval:1 removeAllAssets:0.0];
  fragmentedAssetMinder = self->_fragmentedAssetMinder;
  if (fragmentedAssetMinder)
  {

    fragmentedAssetMinder = self->_fragmentedAssetMinder;
    accessSerializer = fragmentedAssetMinder->accessSerializer;
    if (accessSerializer)
    {
      dispatch_release(accessSerializer);
      fragmentedAssetMinder = self->_fragmentedAssetMinder;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVFragmentedAssetMinder;
  [(AVFragmentedAssetMinder *)&v5 dealloc];
}

- (BOOL)_throwsWhenAlreadyMindedAssetIsAdded
{
  return 1;
}

- (NSArray)assets
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__15;
  uint64_t v11 = 0;
  accessSerializer = self->_fragmentedAssetMinder->accessSerializer;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__AVFragmentedAssetMinder_assets__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerializer, v5);
  v3 = (NSArray *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__AVFragmentedAssetMinder_assets__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 8) allObjects];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSTimeInterval)mindingInterval
{
  return self->_fragmentedAssetMinder->mindingInterval;
}

- (void)setMindingInterval:(NSTimeInterval)mindingInterval
{
}

- (void)_setMindingInterval:(double)a3 removeAllAssets:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a3 >= 0.0) {
    double v6 = a3;
  }
  else {
    double v6 = 0.0;
  }
  if (v6 > 0.0 && v6 < 0.001)
  {
    v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v25 = (void *)[v16 exceptionWithName:v17, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"An %@ cannot mind fragmented assets more frequently than once per millisecond (requested interval was %f)", v20, v21, v22, v23, v24, (uint64_t)v19), 0 reason userInfo];
    objc_exception_throw(v25);
  }
  fragmentedAssetMinder = self->_fragmentedAssetMinder;
  if (v6 != fragmentedAssetMinder->mindingInterval || a4)
  {
    fragmentedAssetMinder->mindingInterval = v6;
    v9 = [(AVFragmentedAssetMinder *)self assets];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          [v14 _setFragmentMindingInterval:v6];
          if (v4) {
            [v14 _setIsAssociatedWithFragmentMinder:0];
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v11);
    }
  }
}

- (void)addFragmentedAsset:(AVAsset *)asset
{
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  if (![(AVAsset *)asset _mindsFragments])
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    uint64_t v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"An %@ cannot mind instances of %@", v14, v15, v16, v17, v18, (uint64_t)v12);
    goto LABEL_10;
  }
  int v6 = [(AVAsset *)asset isAssociatedWithFragmentMinder];
  accessSerializer = self->_fragmentedAssetMinder->accessSerializer;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AVFragmentedAssetMinder_addFragmentedAsset___block_invoke;
  block[3] = &unk_1E57B3C08;
  block[5] = asset;
  block[6] = &v30;
  block[4] = self;
  char v29 = v6;
  dispatch_sync(accessSerializer, block);
  if (v6)
  {
    if (!*((unsigned char *)v31 + 24))
    {
      if (![(AVFragmentedAssetMinder *)self _throwsWhenAlreadyMindedAssetIsAdded])
      {
        uint64_t v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        NSLog(&cfstr_Addfragmenteda.isa, v9);
        goto LABEL_8;
      }
      uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      uint64_t v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      uint64_t v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"%@ cannot add an %@ that's already being minded by another fragment minder", v23, v24, v25, v26, v27, (uint64_t)v21);
LABEL_10:
      objc_exception_throw((id)[v10 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0]);
    }
  }
  else if (!*((unsigned char *)v31 + 24))
  {
    [(AVAsset *)asset _setFragmentMindingInterval:self->_fragmentedAssetMinder->mindingInterval];
    [(AVAsset *)asset _setIsAssociatedWithFragmentMinder:1];
  }
LABEL_8:
  _Block_object_dispose(&v30, 8);
}

uint64_t __46__AVFragmentedAssetMinder_addFragmentedAsset___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 8) containsObject:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) && !*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    BOOL v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 8);
    return [v4 addObject:v3];
  }
  return result;
}

- (void)removeFragmentedAsset:(AVAsset *)asset
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  if (![(AVAsset *)asset _mindsFragments])
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    uint64_t v16 = (void *)[v7 exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"An %@ cannot mind instances of %@", v11, v12, v13, v14, v15, (uint64_t)v9), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  accessSerializer = self->_fragmentedAssetMinder->accessSerializer;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AVFragmentedAssetMinder_removeFragmentedAsset___block_invoke;
  block[3] = &unk_1E57B3270;
  block[5] = asset;
  block[6] = &v18;
  block[4] = self;
  dispatch_sync(accessSerializer, block);
  if (*((unsigned char *)v19 + 24))
  {
    [(AVAsset *)asset _setFragmentMindingInterval:0.0];
    [(AVAsset *)asset _setIsAssociatedWithFragmentMinder:0];
  }
  _Block_object_dispose(&v18, 8);
}

uint64_t __49__AVFragmentedAssetMinder_removeFragmentedAsset___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(*(void *)(a1[4] + 8) + 8) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v3 = a1[5];
    BOOL v4 = *(void **)(*(void *)(a1[4] + 8) + 8);
    return [v4 removeObject:v3];
  }
  return result;
}

@end