@interface AVMicaPackage
+ (NSDictionary)classSubstitions;
+ (void)asynchronouslyPrepareMicaPackageWithName:(id)a3 layoutDirection:(int64_t)a4 completion:(id)a5;
- (AVMicaPackage)initWithPackageName:(id)a3 layoutDirection:(int64_t)a4;
- (CALayer)rootLayer;
- (CAStateController)stateController;
- (CGSize)targetSize;
- (CGSize)unscaledSize;
- (Class)CAMLParser:(id)a3 didFailToFindClassWithName:(id)a4;
- (NSString)packageName;
- (NSString)state;
- (id)_recursivelyFindSublayerWithName:(id)a3 rootLayer:(id)a4;
- (id)availableStates;
- (id)availableStatesOnLayer:(id)a3;
- (id)sublayerWithName:(id)a3;
- (int64_t)layoutDirection;
- (void)_loadRootLayerIfNeeded;
- (void)_recursivelyRemoveCompositingFiltersWithName:(id)a3 rootLayer:(id)a4;
- (void)_recursivelySetFillColor:(CGColor *)a3 rootLayer:(id)a4;
- (void)_setState:(id)a3;
- (void)removeCompositingFiltersWithName:(id)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setRootLayer:(id)a3;
- (void)setState:(id)a3 color:(CGColor *)a4;
- (void)setTargetSize:(CGSize)a3;
- (void)setUnscaledSize:(CGSize)a3;
- (void)transitionToStateWithName:(id)a3;
- (void)transitionToStateWithName:(id)a3 onLayer:(id)a4;
@end

@implementation AVMicaPackage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_packageName, 0);
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_rootLayer, 0);
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (CAStateController)stateController
{
  return self->_stateController;
}

- (NSString)packageName
{
  return self->_packageName;
}

- (void)setUnscaledSize:(CGSize)a3
{
  self->_unscaledSize = a3;
}

- (CGSize)unscaledSize
{
  double width = self->_unscaledSize.width;
  double height = self->_unscaledSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)state
{
  return self->_state;
}

- (void)setRootLayer:(id)a3
{
}

- (void)_loadRootLayerIfNeeded
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!self->_rootLayer)
  {
    v3 = [(AVMicaPackage *)self packageName];
    v4 = [(AVMicaPackage *)self packageName];
    if ([v4 isEqualToString:@"VolumeGlyph"])
    {
      int64_t v5 = [(AVMicaPackage *)self layoutDirection];

      if (v5 != 1) {
        goto LABEL_6;
      }
      [v3 stringByAppendingString:@"-RTL"];
      v3 = v4 = v3;
    }

LABEL_6:
    v6 = AVBundle();
    v7 = [v6 URLForResource:v3 withExtension:@"caml"];

    if (!v7)
    {
      v18 = _AVLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v25 = 138412290;
        v26 = v3;
        _os_log_error_impl(&dword_1B05B7000, v18, OS_LOG_TYPE_ERROR, "Unexpectedly missing URL for CAML file. %@", (uint8_t *)&v25, 0xCu);
      }

      goto LABEL_22;
    }
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      [MEMORY[0x1E4F39CF8] activateBackground:1];
    }
    v8 = [MEMORY[0x1E4F39BF8] parser];
    [v8 setDelegate:self];
    [v8 parseContentsOfURL:v7];
    v9 = [v8 result];
    rootLayer = self->_rootLayer;
    self->_rootLayer = v9;

    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
      [MEMORY[0x1E4F39CF8] commit];
    }
    v11 = (CAStateController *)[objc_alloc(MEMORY[0x1E4F39CB0]) initWithLayer:self->_rootLayer];
    stateController = self->_stateController;
    self->_stateController = v11;

    [(CAStateController *)self->_stateController setDelegate:self];
    [(CALayer *)self->_rootLayer bounds];
    self->_unscaledSize.double width = v13;
    self->_unscaledSize.double height = v14;
    v15 = [(AVMicaPackage *)self packageName];
    char v16 = [v15 isEqualToString:@"VolumeGlyph"];

    if (v16)
    {
      _Q0 = (CGSize)xmmword_1B07212F0;
    }
    else
    {
      v19 = [(AVMicaPackage *)self packageName];
      int v20 = [v19 isEqualToString:@"AVRoutePickerViewCircularAirPlayGlyph"];

      if (!v20)
      {
LABEL_19:
        if ([MEMORY[0x1E4F29060] isMainThread]) {
          -[AVMicaPackage setTargetSize:](self, "setTargetSize:", self->_unscaledSize.width, self->_unscaledSize.height);
        }

LABEL_22:
        return;
      }
      __asm { FMOV            V0.2D, #18.0 }
    }
    self->_unscaledSize = _Q0;
    goto LABEL_19;
  }
}

- (id)sublayerWithName:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(AVMicaPackage *)self rootLayer];
  v6 = [(AVMicaPackage *)self _recursivelyFindSublayerWithName:v4 rootLayer:v5];

  return v6;
}

- (id)availableStatesOnLayer:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  int64_t v5 = [v3 array];
  v6 = [v4 states];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__AVMicaPackage_availableStatesOnLayer___block_invoke;
  v9[3] = &unk_1E5FC3B50;
  id v7 = v5;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];

  return v7;
}

void __40__AVMicaPackage_availableStatesOnLayer___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  [v2 addObject:v3];
}

- (id)availableStates
{
  id v3 = [(AVMicaPackage *)self rootLayer];
  id v4 = [(AVMicaPackage *)self availableStatesOnLayer:v3];

  return v4;
}

- (void)transitionToStateWithName:(id)a3 onLayer:(id)a4
{
  id v6 = a4;
  id v9 = [v6 stateWithName:a3];
  id v7 = [(AVMicaPackage *)self stateController];
  LODWORD(v8) = 1.0;
  [v7 setState:v9 ofLayer:v6 transitionSpeed:v8];
}

- (void)transitionToStateWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(AVMicaPackage *)self rootLayer];
  [(AVMicaPackage *)self transitionToStateWithName:v4 onLayer:v5];
}

- (void)_recursivelyRemoveCompositingFiltersWithName:(id)a3 rootLayer:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [a4 sublayers];
  uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = [v11 compositingFilter];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          CGFloat v14 = [v11 compositingFilter];
          v15 = [v14 name];
          int v16 = [v15 isEqualToString:v6];

          if (v16) {
            [v11 setCompositingFilter:0];
          }
        }
        [(AVMicaPackage *)self _recursivelyRemoveCompositingFiltersWithName:v6 rootLayer:v11];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
}

- (void)_recursivelySetFillColor:(CGColor *)a3 rootLayer:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = objc_msgSend(a4, "sublayers", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v11 setFillColor:a3];
        }
        [(AVMicaPackage *)self _recursivelySetFillColor:a3 rootLayer:v11];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (id)_recursivelyFindSublayerWithName:(id)a3 rootLayer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = (id *)&v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__18195;
  long long v20 = __Block_byref_object_dispose__18196;
  id v21 = 0;
  uint64_t v8 = [v7 name];
  int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    objc_storeStrong(v17 + 5, a4);
  }
  else
  {
    uint64_t v10 = [v7 sublayers];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__AVMicaPackage__recursivelyFindSublayerWithName_rootLayer___block_invoke;
    v13[3] = &unk_1E5FC3B28;
    long long v15 = &v16;
    v13[4] = self;
    id v14 = v6;
    [v10 enumerateObjectsUsingBlock:v13];
  }
  id v11 = v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __60__AVMicaPackage__recursivelyFindSublayerWithName_rootLayer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) _recursivelyFindSublayerWithName:*(void *)(a1 + 40) rootLayer:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    *a4 = 1;
  }
}

- (void)_setState:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_state, "isEqualToString:"))
  {
    id v4 = (NSString *)[v6 copy];
    state = self->_state;
    self->_state = v4;

    [(AVMicaPackage *)self transitionToStateWithName:v6];
  }
}

- (Class)CAMLParser:(id)a3 didFailToFindClassWithName:(id)a4
{
  id v4 = a4;
  id v5 = [(id)objc_opt_class() classSubstitions];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return (Class)v6;
}

- (void)removeCompositingFiltersWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(AVMicaPackage *)self rootLayer];
  [(AVMicaPackage *)self _recursivelyRemoveCompositingFiltersWithName:v4 rootLayer:v5];
}

- (void)setState:(id)a3 color:(CGColor *)a4
{
  id v7 = a3;
  if (([v7 isEqualToString:@"on"] & 1) != 0
    || [v7 isEqualToString:@"off"])
  {
    [(AVMicaPackage *)self _setState:0];
  }
  [(AVMicaPackage *)self _setState:v7];
  if (a4)
  {
    id v6 = [(AVMicaPackage *)self rootLayer];
    [(AVMicaPackage *)self _recursivelySetFillColor:a4 rootLayer:v6];
  }
}

- (void)setTargetSize:(CGSize)a3
{
  if (self->_targetSize.width != a3.width || self->_targetSize.height != a3.height)
  {
    self->_targetSize = a3;
    double v5 = a3.width / self->_unscaledSize.width;
    double v6 = a3.height / self->_unscaledSize.height;
    if (v5 >= v6) {
      CGFloat v7 = v6;
    }
    else {
      CGFloat v7 = v5;
    }
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    uint64_t v8 = [(AVMicaPackage *)self rootLayer];
    CATransform3DMakeScale(&v9, v7, -v7, 1.0);
    [v8 setTransform:&v9];

    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (CALayer)rootLayer
{
  [(AVMicaPackage *)self _loadRootLayerIfNeeded];
  rootLayer = self->_rootLayer;

  return rootLayer;
}

- (AVMicaPackage)initWithPackageName:(id)a3 layoutDirection:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVMicaPackage;
  uint64_t v8 = [(AVMicaPackage *)&v11 init];
  CATransform3D v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_packageName, a3);
    v9->_layoutDirection = a4;
  }

  return v9;
}

+ (NSDictionary)classSubstitions
{
  if (classSubstitions_onceToken != -1) {
    dispatch_once(&classSubstitions_onceToken, &__block_literal_global_46_18207);
  }
  v2 = (void *)classSubstitions__substitutions;

  return (NSDictionary *)v2;
}

void __33__AVMicaPackage_classSubstitions__block_invoke()
{
  v3[11] = *MEMORY[0x1E4F143B8];
  v2[0] = @"LKState";
  v3[0] = objc_opt_class();
  v2[1] = @"LKEventHandler";
  v3[1] = objc_opt_class();
  v2[2] = @"LKStateAddAnimation";
  v3[2] = objc_opt_class();
  v2[3] = @"LKStateAddElement";
  v3[3] = objc_opt_class();
  v2[4] = @"LKStateElement";
  v3[4] = objc_opt_class();
  v2[5] = @"LKStateRemoveAnimation";
  v3[5] = objc_opt_class();
  v2[6] = @"LKStateRemoveElement";
  v3[6] = objc_opt_class();
  v2[7] = @"LKStateSetValue";
  v3[7] = objc_opt_class();
  v2[8] = @"LKStateSetProperty";
  v3[8] = objc_opt_class();
  v2[9] = @"LKStateTransition";
  v3[9] = objc_opt_class();
  v2[10] = @"LKStateTransitionElement";
  v3[10] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:11];
  v1 = (void *)classSubstitions__substitutions;
  classSubstitions__substitutions = v0;
}

+ (void)asynchronouslyPrepareMicaPackageWithName:(id)a3 layoutDirection:(int64_t)a4 completion:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void *)[a5 copy];
  if (asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion__onceToken != -1) {
    dispatch_once(&asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion__onceToken, &__block_literal_global_18253);
  }
  CATransform3D v9 = asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion__micaPackageCreationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__AVMicaPackage_asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion___block_invoke_2;
  block[3] = &unk_1E5FC3B00;
  id v14 = v8;
  int64_t v15 = a4;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __85__AVMicaPackage_asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion___block_invoke_2(uint64_t a1)
{
  v2 = [[AVMicaPackage alloc] initWithPackageName:*(void *)(a1 + 32) layoutDirection:*(void *)(a1 + 48)];
  [(AVMicaPackage *)v2 _loadRootLayerIfNeeded];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__AVMicaPackage_asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion___block_invoke_3;
  v5[3] = &unk_1E5FC4648;
  id v3 = *(id *)(a1 + 40);
  double v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __85__AVMicaPackage_asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __85__AVMicaPackage_asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.avkit.caml", v2);
  v1 = (void *)asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion__micaPackageCreationQueue;
  asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion__micaPackageCreationQueue = (uint64_t)v0;
}

@end