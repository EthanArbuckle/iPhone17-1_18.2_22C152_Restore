@interface AVTAvatarPoseAnimation
+ (id)animationFromDataRepresentation:(id)a3 keyPath:(id)a4;
+ (id)animationFromDictionaryRepresentation:(id)a3 keyPath:(id)a4;
+ (id)optimizeAnimation:(id)a3 target:(id)a4;
+ (void)dataRepresentationForAnimation:(id)a3 completionHandler:(id)a4;
+ (void)dictionaryRepresentationForAnimation:(id)a3 completionHandler:(id)a4;
+ (void)removeAllAnimationsFromAvatar:(id)a3;
- (AVTAvatarPose)staticPose;
- (AVTAvatarPoseAnimation)initWithAnimatedPoseRepresentationAtURL:(id)a3;
- (AVTAvatarPoseAnimation)initWithScene:(id)a3;
- (AVTAvatarPoseAnimation)initWithScene:(id)a3 usdaMetadata:(id *)a4;
- (AVTAvatarPoseAnimation)initWithSceneAtURL:(id)a3;
- (AVTAvatarPoseAnimation)initWithSceneAtURL:(id)a3 usdaMetadata:(id *)a4;
- (AVTAvatarPoseAnimation)initWithStaticPose:(id)a3 staticPhysicsStates:(id)a4;
- (AVTAvatarPoseAnimation)initWithStaticPoseRepresentation:(id)a3 animatedPoseRepresentation:(id)a4 staticPhysicsStatesRepresentation:(id)a5;
- (double)duration;
- (id)_addAnimationToAvatar:(id)a3 options:(unint64_t)a4 transitionInDuration:(double)a5 transitionOutDuration:(double)a6 isTransient:(BOOL)a7 completionQueue:(id)a8 completionHandler:(id)a9;
- (id)_initWithScene:(id)a3 usdaMetadata:(id *)a4 identifier:(id)a5;
- (id)_initWithStaticPoseRepresentation:(id)a3 animatedPoseRepresentation:(id)a4 staticPhysicsStatesRepresentation:(id)a5 identifier:(id)a6;
- (id)addToAvatar:(id)a3 options:(unint64_t)a4;
- (id)addToAvatar:(id)a3 options:(unint64_t)a4 transitionDuration:(double)a5;
- (id)addToAvatar:(id)a3 useStaticPhysicsState:(BOOL)a4;
- (id)addToAvatar:(id)a3 useStaticPhysicsState:(BOOL)a4 transitionDuration:(double)a5;
- (id)animatedPoseRepresentationWithAnimationRepresentationBuilder:(id)a3;
- (id)animatedPoseRepresentationWithDataAnimationRepresentation;
- (id)animatedPoseRepresentationWithDictionaryAnimationRepresentation;
- (id)animationsForAvatar:(id)a3;
- (id)physicalizedPose;
- (id)staticPoseRepresentation;
- (void)commonInitWithIdentifier:(id)a3;
- (void)playOnceOnAvatar:(id)a3 options:(unint64_t)a4 transitionInDuration:(double)a5 transitionOutDuration:(double)a6 completionQueue:(id)a7 completionHandler:(id)a8;
@end

@implementation AVTAvatarPoseAnimation

- (void)commonInitWithIdentifier:(id)a3
{
  id v9 = a3;
  if ([v9 length])
  {
    id v4 = v9;
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    uint64_t v6 = [v5 UUIDString];

    id v4 = (id)v6;
  }
  id v10 = v4;
  v7 = [@"kAVTPoseAnimation-" stringByAppendingString:v4];
  animationBaseKey = self->_animationBaseKey;
  self->_animationBaseKey = v7;
}

- (AVTAvatarPoseAnimation)initWithSceneAtURL:(id)a3
{
  memset(v4, 0, sizeof(v4));
  return [(AVTAvatarPoseAnimation *)self initWithSceneAtURL:a3 usdaMetadata:v4];
}

- (AVTAvatarPoseAnimation)initWithSceneAtURL:(id)a3 usdaMetadata:(id *)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [MEMORY[0x263F08850] defaultManager];
  v8 = [v6 path];
  int v9 = [v7 fileExistsAtPath:v8 isDirectory:0];

  if (v9)
  {
    uint64_t v21 = *MEMORY[0x263F16BC8];
    v22[0] = *MEMORY[0x263F16BD0];
    id v10 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    id v20 = 0;
    v11 = objc_msgSend(MEMORY[0x263F16AD8], "avt_newSceneWithURL:options:error:", v6, v10, &v20);
    id v12 = v20;
    objc_msgSend(v11, "avt_fixQuirksOfNewUSDSchemaWithOptions:handler:", 0, 0);
    if (v12)
    {
      v13 = avt_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[AVTAvatarPoseAnimation initWithSceneAtURL:usdaMetadata:](v6, v12, v13);
      }
    }
    v14 = [v6 lastPathComponent];
    v15 = [v14 stringByDeletingPathExtension];

    long long v16 = *(_OWORD *)&a4->var2;
    v19[0] = *(_OWORD *)&a4->var0;
    v19[1] = v16;
    self = (AVTAvatarPoseAnimation *)[(AVTAvatarPoseAnimation *)self _initWithScene:v11 usdaMetadata:v19 identifier:v15];

    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (AVTAvatarPoseAnimation)initWithScene:(id)a3
{
  memset(v4, 0, sizeof(v4));
  return (AVTAvatarPoseAnimation *)[(AVTAvatarPoseAnimation *)self _initWithScene:a3 usdaMetadata:v4 identifier:0];
}

- (AVTAvatarPoseAnimation)initWithScene:(id)a3 usdaMetadata:(id *)a4
{
  long long v4 = *(_OWORD *)&a4->var2;
  v6[0] = *(_OWORD *)&a4->var0;
  v6[1] = v4;
  return (AVTAvatarPoseAnimation *)[(AVTAvatarPoseAnimation *)self _initWithScene:a3 usdaMetadata:v6 identifier:0];
}

- (id)_initWithScene:(id)a3 usdaMetadata:(id *)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v31.receiver = self;
  v31.super_class = (Class)AVTAvatarPoseAnimation;
  id v10 = [(AVTAvatarPoseAnimation *)&v31 init];
  v11 = v10;
  if (v10)
  {
    [(AVTAvatarPoseAnimation *)v10 commonInitWithIdentifier:v9];
    id v12 = [[AVTAvatarPose alloc] initWithScene:v8];
    staticPose = v11->_staticPose;
    v11->_staticPose = v12;

    staticPhysicsStates = v11->_staticPhysicsStates;
    v11->_staticPhysicsStates = 0;

    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v17 = [v8 rootNode];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __65__AVTAvatarPoseAnimation__initWithScene_usdaMetadata_identifier___block_invoke;
    v25[3] = &unk_26401FF00;
    v18 = v11;
    v26 = v18;
    id v27 = v15;
    id v28 = v16;
    long long v19 = *(_OWORD *)&a4->var2;
    long long v29 = *(_OWORD *)&a4->var0;
    long long v30 = v19;
    id v20 = v16;
    id v21 = v15;
    [v17 enumerateHierarchyUsingBlock:v25];

    if ([v21 count]) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
    objc_storeStrong(v18 + 3, v22);
    if ([v20 count]) {
      v23 = v20;
    }
    else {
      v23 = 0;
    }
    objc_storeStrong(v18 + 4, v23);
  }
  return v11;
}

void __65__AVTAvatarPoseAnimation__initWithScene_usdaMetadata_identifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v4 = [v3 animationKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [v3 animationPlayerForKey:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        id v10 = [v9 animation];
        id v11 = (id)[(id)objc_opt_class() optimizeAnimation:v10 target:v3];
        id v12 = *(void **)(a1 + 40);
        v13 = *(void **)(a1 + 48);
        long long v14 = *(_OWORD *)(a1 + 72);
        v15[0] = *(_OWORD *)(a1 + 56);
        v15[1] = v14;
        addAnimation(v3, v10, v12, v13, (unsigned __int8 *)v15);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (AVTAvatarPoseAnimation)initWithAnimatedPoseRepresentationAtURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 lastPathComponent];
  uint64_t v6 = [v5 stringByDeletingPathExtension];

  uint64_t v7 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v4 error:0];
  id v8 = [(AVTAvatarPoseAnimation *)self _initWithStaticPoseRepresentation:0 animatedPoseRepresentation:v7 staticPhysicsStatesRepresentation:0 identifier:v6];

  return v8;
}

- (AVTAvatarPoseAnimation)initWithStaticPose:(id)a3 staticPhysicsStates:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarPoseAnimation;
  id v9 = [(AVTAvatarPoseAnimation *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    [(AVTAvatarPoseAnimation *)v9 commonInitWithIdentifier:0];
    objc_storeStrong((id *)&v10->_staticPose, a3);
    objc_storeStrong((id *)&v10->_staticPhysicsStates, a4);
  }

  return v10;
}

- (AVTAvatarPoseAnimation)initWithStaticPoseRepresentation:(id)a3 animatedPoseRepresentation:(id)a4 staticPhysicsStatesRepresentation:(id)a5
{
  return (AVTAvatarPoseAnimation *)[(AVTAvatarPoseAnimation *)self _initWithStaticPoseRepresentation:a3 animatedPoseRepresentation:a4 staticPhysicsStatesRepresentation:a5 identifier:0];
}

- (id)_initWithStaticPoseRepresentation:(id)a3 animatedPoseRepresentation:(id)a4 staticPhysicsStatesRepresentation:(id)a5 identifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v40.receiver = self;
  v40.super_class = (Class)AVTAvatarPoseAnimation;
  long long v14 = [(AVTAvatarPoseAnimation *)&v40 init];
  id v15 = v14;
  if (v14)
  {
    [(AVTAvatarPoseAnimation *)v14 commonInitWithIdentifier:v13];
    if (v10)
    {
      long long v16 = [[AVTAvatarPose alloc] initWithDictionaryRepresentation:v10];
      staticPose = v15->_staticPose;
      v15->_staticPose = v16;
    }
    if (v12)
    {
      long long v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v12, "count"));
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __132__AVTAvatarPoseAnimation__initWithStaticPoseRepresentation_animatedPoseRepresentation_staticPhysicsStatesRepresentation_identifier___block_invoke;
      v38[3] = &unk_26401FF28;
      long long v19 = v18;
      v39 = v19;
      [v12 enumerateKeysAndObjectsUsingBlock:v38];
      staticPhysicsStates = v15->_staticPhysicsStates;
      v15->_staticPhysicsStates = v19;
      uint64_t v21 = v19;
    }
    if (v11)
    {
      v22 = [v11 objectForKeyedSubscript:@"blendshapes"];
      uint64_t v23 = [v22 count];
      if (v23)
      {
        v24 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v23];
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __132__AVTAvatarPoseAnimation__initWithStaticPoseRepresentation_animatedPoseRepresentation_staticPhysicsStatesRepresentation_identifier___block_invoke_2;
        v36[3] = &unk_26401FF50;
        v25 = v24;
        v37 = v25;
        [v22 enumerateKeysAndObjectsUsingBlock:v36];
        blendshapeAnimations = v15->_blendshapeAnimations;
        v15->_blendshapeAnimations = v25;
        id v27 = v25;
      }
      id v28 = [v11 objectForKeyedSubscript:@"perNode"];
      if ([v28 count])
      {
        long long v29 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v23];
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __132__AVTAvatarPoseAnimation__initWithStaticPoseRepresentation_animatedPoseRepresentation_staticPhysicsStatesRepresentation_identifier___block_invoke_3;
        v34[3] = &unk_26401FF28;
        long long v30 = v29;
        v35 = v30;
        [v28 enumerateKeysAndObjectsUsingBlock:v34];
        perNodeAnimations = v15->_perNodeAnimations;
        v15->_perNodeAnimations = v30;
        v32 = v30;
      }
    }
  }

  return v15;
}

void __132__AVTAvatarPoseAnimation__initWithStaticPoseRepresentation_animatedPoseRepresentation_staticPhysicsStatesRepresentation_identifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[AVTAvatarPhysicsState alloc] initWithDictionaryRepresentation:v5];

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

void __132__AVTAvatarPoseAnimation__initWithStaticPoseRepresentation_animatedPoseRepresentation_staticPhysicsStatesRepresentation_identifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[AVTAvatarPoseAnimation animationFromDataRepresentation:a3 keyPath:0];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void __132__AVTAvatarPoseAnimation__initWithStaticPoseRepresentation_animatedPoseRepresentation_staticPhysicsStatesRepresentation_identifier___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x263EFF980];
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __132__AVTAvatarPoseAnimation__initWithStaticPoseRepresentation_animatedPoseRepresentation_staticPhysicsStatesRepresentation_identifier___block_invoke_4;
  v10[3] = &unk_26401FF50;
  id v11 = v8;
  id v9 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];

  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
}

void __132__AVTAvatarPoseAnimation__initWithStaticPoseRepresentation_animatedPoseRepresentation_staticPhysicsStatesRepresentation_identifier___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = +[AVTAvatarPoseAnimation animationFromDataRepresentation:a3 keyPath:a2];
  [*(id *)(a1 + 32) addObject:v4];
}

- (id)staticPoseRepresentation
{
  return [(AVTAvatarPose *)self->_staticPose dictionaryRepresentation];
}

- (id)animatedPoseRepresentationWithAnimationRepresentationBuilder:(id)a3
{
  id v4 = a3;
  if ([(NSDictionary *)self->_blendshapeAnimations count]
    || [(NSDictionary *)self->_perNodeAnimations count])
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if ([(NSDictionary *)self->_blendshapeAnimations count])
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      blendshapeAnimations = self->_blendshapeAnimations;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      _OWORD v19[2] = __87__AVTAvatarPoseAnimation_animatedPoseRepresentationWithAnimationRepresentationBuilder___block_invoke;
      v19[3] = &unk_26401FFA0;
      id v20 = v6;
      id v21 = v4;
      id v8 = v6;
      [(NSDictionary *)blendshapeAnimations enumerateKeysAndObjectsUsingBlock:v19];
      [v5 setObject:v8 forKeyedSubscript:@"blendshapes"];
    }
    if ([(NSDictionary *)self->_perNodeAnimations count])
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      perNodeAnimations = self->_perNodeAnimations;
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      id v15 = __87__AVTAvatarPoseAnimation_animatedPoseRepresentationWithAnimationRepresentationBuilder___block_invoke_3;
      long long v16 = &unk_26401FFF0;
      id v17 = v9;
      id v18 = v4;
      id v11 = v9;
      [(NSDictionary *)perNodeAnimations enumerateKeysAndObjectsUsingBlock:&v13];
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, @"perNode", v13, v14, v15, v16);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __87__AVTAvatarPoseAnimation_animatedPoseRepresentationWithAnimationRepresentationBuilder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __87__AVTAvatarPoseAnimation_animatedPoseRepresentationWithAnimationRepresentationBuilder___block_invoke_2;
  v9[3] = &unk_26401FF78;
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  id v7 = *(void (**)(uint64_t, uint64_t, void *))(v6 + 16);
  id v8 = v5;
  v7(v6, a3, v9);
}

uint64_t __87__AVTAvatarPoseAnimation_animatedPoseRepresentationWithAnimationRepresentationBuilder___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __87__AVTAvatarPoseAnimation_animatedPoseRepresentationWithAnimationRepresentationBuilder___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v13 = a2;
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        uint64_t v12 = *(void *)(a1 + 40);
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        _OWORD v15[2] = __87__AVTAvatarPoseAnimation_animatedPoseRepresentationWithAnimationRepresentationBuilder___block_invoke_4;
        v15[3] = &unk_26401FFC8;
        id v16 = v6;
        (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v11, v15);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v13];
}

uint64_t __87__AVTAvatarPoseAnimation_animatedPoseRepresentationWithAnimationRepresentationBuilder___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

- (id)animatedPoseRepresentationWithDataAnimationRepresentation
{
  return [(AVTAvatarPoseAnimation *)self animatedPoseRepresentationWithAnimationRepresentationBuilder:&__block_literal_global_7];
}

uint64_t __83__AVTAvatarPoseAnimation_animatedPoseRepresentationWithDataAnimationRepresentation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[AVTAvatarPoseAnimation dataRepresentationForAnimation:a2 completionHandler:a3];
}

- (id)animatedPoseRepresentationWithDictionaryAnimationRepresentation
{
  return [(AVTAvatarPoseAnimation *)self animatedPoseRepresentationWithAnimationRepresentationBuilder:&__block_literal_global_100];
}

uint64_t __89__AVTAvatarPoseAnimation_animatedPoseRepresentationWithDictionaryAnimationRepresentation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[AVTAvatarPoseAnimation dictionaryRepresentationForAnimation:a2 completionHandler:a3];
}

- (id)animationsForAvatar:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  uint64_t v22 = __46__AVTAvatarPoseAnimation_animationsForAvatar___block_invoke;
  uint64_t v23 = &unk_264020058;
  v24 = self;
  id v6 = v5;
  uint64_t v7 = 0;
  id v25 = v6;
  do
  {
    uint64_t v8 = AVTBlendShapeLocationFromARIndex(v7);
    uint64_t v9 = [v4 blendShapeIndexForARKitBlendShapeName:v8];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      if (v4) {
        [v4 morphInfoForARKitBlendShapeIndex:v9];
      }
      v18[0] = v19;
      v18[1] = v20;
      v22((uint64_t)v21, v8, (uint64_t)v18);
    }

    ++v7;
  }
  while (v7 != 52);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __46__AVTAvatarPoseAnimation_animationsForAvatar___block_invoke_111;
  v17[3] = &__block_descriptor_40_e15_v40__0_____qB_8lu32l8;
  v17[4] = v21;
  [v4 enumerateMorphInfoForCustomBlendShapeName:@"Emoji" usingBlock:v17];
  perNodeAnimations = self->_perNodeAnimations;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  _OWORD v15[2] = __46__AVTAvatarPoseAnimation_animationsForAvatar___block_invoke_2;
  v15[3] = &unk_2640200A0;
  id v11 = v6;
  id v16 = v11;
  [(NSDictionary *)perNodeAnimations enumerateKeysAndObjectsUsingBlock:v15];
  uint64_t v12 = v16;
  id v13 = v11;

  return v13;
}

void __46__AVTAvatarPoseAnimation_animationsForAvatar___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(unsigned char *)(a3 + 24))
  {
    id v5 = *(void **)(a3 + 8);
    id v6 = a2;
    id v12 = [v5 name];
    uint64_t v7 = [NSString stringWithFormat:@"/%@.morpher.weights[%ld]", v12, *(void *)(a3 + 16)];
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v6];

    if (v8)
    {
      id v9 = (id)[v8 copy];
      [v9 setKeyPath:v7];
      [*(id *)(a1 + 40) addObject:v9];
    }
    else
    {
      id v9 = objc_alloc_init(MEMORY[0x263F15760]);
      [v9 setFromValue:&unk_26C00C670];
      [v9 setToValue:&unk_26C00C670];
      [v9 setKeyPath:v7];
      uint64_t v10 = *(void **)(a1 + 40);
      id v11 = [MEMORY[0x263F169D8] animationWithCAAnimation:v9];
      [v10 addObject:v11];
    }
  }
}

uint64_t __46__AVTAvatarPoseAnimation_animationsForAvatar___block_invoke_111(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(uint64_t (**)(uint64_t, __CFString *, _OWORD *, uint64_t))(v4 + 16);
  long long v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  return v5(v4, @"Emoji", v8, a4);
}

void __46__AVTAvatarPoseAnimation_animationsForAvatar___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = a3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = (void *)[v10 copy];
        id v12 = NSString;
        id v13 = [v10 keyPath];
        uint64_t v14 = [v12 stringWithFormat:@"/%@.%@", v5, v13];
        [v11 setKeyPath:v14];

        [*(id *)(a1 + 32) addObject:v11];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

- (double)duration
{
  uint64_t v9 = 0;
  uint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  blendshapeAnimations = self->_blendshapeAnimations;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _OWORD v8[2] = __34__AVTAvatarPoseAnimation_duration__block_invoke;
  v8[3] = &unk_2640200C8;
  v8[4] = &v9;
  [(NSDictionary *)blendshapeAnimations enumerateKeysAndObjectsUsingBlock:v8];
  perNodeAnimations = self->_perNodeAnimations;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__AVTAvatarPoseAnimation_duration__block_invoke_2;
  v7[3] = &unk_2640200F0;
  v7[4] = &v9;
  [(NSDictionary *)perNodeAnimations enumerateKeysAndObjectsUsingBlock:v7];
  double v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __34__AVTAvatarPoseAnimation_duration__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v4 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = [a3 duration];
  if (v4 >= v6) {
    double v6 = v4;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  return result;
}

void __34__AVTAvatarPoseAnimation_duration__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        [*(id *)(*((void *)&v11 + 1) + 8 * v8) duration];
        if (v9 >= v10) {
          double v10 = v9;
        }
        *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v10;
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)addToAvatar:(id)a3 useStaticPhysicsState:(BOOL)a4
{
  return [(AVTAvatarPoseAnimation *)self _addAnimationToAvatar:a3 options:a4 transitionInDuration:0 transitionOutDuration:0 isTransient:0 completionQueue:0.0 completionHandler:0.0];
}

- (id)addToAvatar:(id)a3 useStaticPhysicsState:(BOOL)a4 transitionDuration:(double)a5
{
  return [(AVTAvatarPoseAnimation *)self _addAnimationToAvatar:a3 options:a4 transitionInDuration:0 transitionOutDuration:0 isTransient:0 completionQueue:a5 completionHandler:0.0];
}

- (id)addToAvatar:(id)a3 options:(unint64_t)a4
{
  return [(AVTAvatarPoseAnimation *)self _addAnimationToAvatar:a3 options:a4 transitionInDuration:0 transitionOutDuration:0 isTransient:0 completionQueue:0.0 completionHandler:0.0];
}

- (id)addToAvatar:(id)a3 options:(unint64_t)a4 transitionDuration:(double)a5
{
  return [(AVTAvatarPoseAnimation *)self _addAnimationToAvatar:a3 options:a4 transitionInDuration:0 transitionOutDuration:0 isTransient:0 completionQueue:a5 completionHandler:a5];
}

- (void)playOnceOnAvatar:(id)a3 options:(unint64_t)a4 transitionInDuration:(double)a5 transitionOutDuration:(double)a6 completionQueue:(id)a7 completionHandler:(id)a8
{
  id v8 = [(AVTAvatarPoseAnimation *)self _addAnimationToAvatar:a3 options:a4 transitionInDuration:1 transitionOutDuration:a7 isTransient:a8 completionQueue:a5 completionHandler:a6];
}

- (id)_addAnimationToAvatar:(id)a3 options:(unint64_t)a4 transitionInDuration:(double)a5 transitionOutDuration:(double)a6 isTransient:(BOOL)a7 completionQueue:(id)a8 completionHandler:(id)a9
{
  BOOL v85 = a7;
  uint64_t v122 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v80 = a8;
  id v83 = a9;
  if (self->_staticPose) {
    objc_msgSend(v15, "setPose:");
  }
  if (a4)
  {
    staticPhysicsStates = self->_staticPhysicsStates;
    long long v17 = [v15 stickerPhysicsStateIdentifier];
    long long v18 = [(NSDictionary *)staticPhysicsStates objectForKeyedSubscript:v17];

    [v15 resetToPhysicsState:v18 assumeRestStateIfNil:1];
  }
  long long v19 = [(AVTAvatarPoseAnimation *)self animationsForAvatar:v15];
  double v20 = 0.0;
  if ((a4 & 2) != 0)
  {
    CFAbsoluteTime v21 = CFAbsoluteTimeGetCurrent() + 0.05;
    double v22 = CACurrentMediaTime();
    double v20 = fmin(v22 - floor(v22), 1.0) + fmin(v21 - v22 - floor(v21 - v22), 1.0) + -1.0;
  }
  if ((a4 & 4) != 0) {
    double v23 = v20 + 2.5;
  }
  else {
    double v23 = v20;
  }
  if ((a4 & 8) != 0)
  {
    float v24 = (double)arc4random() / 4294967300.0;
    [(AVTAvatarPoseAnimation *)self duration];
    double v23 = v23 + v25 * v24;
  }
  if ((a4 >> 4) & 1 | v85) {
    double v26 = 1.0;
  }
  else {
    double v26 = INFINITY;
  }
  [(AVTAvatarPoseAnimation *)self duration];
  double v28 = v27;
  BOOL v29 = a5 + a6 <= v27;
  double v30 = v27 / (a5 + a6);
  double v31 = v30 * a5;
  double v32 = v30 * a6;
  if (a5 + a6 > v28) {
    double v33 = v32;
  }
  else {
    double v33 = a6;
  }
  if (!v29) {
    a5 = v31;
  }
  v87 = [v15 avatarNode];
  v34 = [v87 animationKeys];
  uint64_t v35 = [v34 count];
  v84 = self;
  v77 = v34;
  v78 = v15;
  if (v35)
  {
    v79 = v19;
    v86 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v35];
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v36 = v34;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v105 objects:v121 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v106;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v106 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = *(void **)(*((void *)&v105 + 1) + 8 * i);
          if ([v41 hasPrefix:@"kAVTPoseAnimation-"])
          {
            v42 = [v87 animationPlayerForKey:v41];
            v43 = v42;
            if (v42)
            {
              v44 = [v42 animation];
              v45 = v44;
              if (v44)
              {
                v46 = [v44 keyPath];
                if ([v46 length])
                {
                  id v47 = [v86 objectForKeyedSubscript:v46];
                  if (!v47)
                  {
                    id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
                    [v86 setObject:v47 forKeyedSubscript:v46];
                  }
                  [v47 addObject:v41];
                }
                else
                {
                  v50 = avt_default_log();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)&buf[4] = v41;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v45;
                  }

                  if (AVTLogAllowsInternalCrash()) {
                    goto LABEL_78;
                  }
                }
              }
              else
              {
                v49 = avt_default_log();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)&buf[4] = v41;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v43;
                }

                if (AVTLogAllowsInternalCrash())
                {
                  uint64_t v104 = 0;
                  long long v119 = 0u;
                  long long v120 = 0u;
                  long long v118 = 0u;
                  memset(buf, 0, sizeof(buf));
                  os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                  int v113 = 138412546;
                  v114 = v41;
                  __int16 v115 = 2112;
                  v116 = v43;
                  _os_log_send_and_compose_impl();
                  _os_crash_msg();
                  __break(1u);
LABEL_78:
                  uint64_t v104 = 0;
                  long long v119 = 0u;
                  long long v120 = 0u;
                  long long v118 = 0u;
                  memset(buf, 0, sizeof(buf));
                  os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                  int v113 = 138412546;
                  v114 = v41;
                  __int16 v115 = 2112;
                  v116 = v45;
                  _os_log_send_and_compose_impl();
                  _os_crash_msg();
                  __break(1u);
                }
              }

              self = v84;
            }
            else
            {
              v48 = avt_default_log();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v41;
                _os_log_fault_impl(&dword_20B819000, v48, OS_LOG_TYPE_FAULT, "Fault: Unreachable code: Animation for key \"%@\" has no player", buf, 0xCu);
              }

              if (AVTLogAllowsInternalCrash()) {
                -[AVTAvatarPoseAnimation _addAnimationToAvatar:options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:](&v113, buf);
              }
            }
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v105 objects:v121 count:16];
      }
      while (v38);
    }

    id v15 = v78;
    long long v19 = v79;
  }
  else
  {
    v86 = 0;
  }
  v51 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v19, "count"));
  v81 = [[AVTAvatarPoseAnimationController alloc] initWithAvatar:v15 animationKeys:v51];
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id obj = v19;
  uint64_t v52 = [obj countByEnumeratingWithState:&v100 objects:v112 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = 0;
    uint64_t v55 = *(void *)v101;
    float v56 = 1.0 - v33 / v28;
    double v57 = v56;
    do
    {
      for (uint64_t j = 0; j != v53; ++j)
      {
        if (*(void *)v101 != v55) {
          objc_enumerationMutation(obj);
        }
        v59 = *(void **)(*((void *)&v100 + 1) + 8 * j);
        v60 = [(NSString *)self->_animationBaseKey stringByAppendingFormat:@"-%ld", v54 + j];
        [v59 setDuration:v28];
        [v59 setRepeatCount:v26];
        [v59 setFillsForward:1];
        [v59 setFillsBackward:1];
        [v59 setBlendInDuration:a5];
        [v59 setTimeOffset:v23];
        [v59 setRemovedOnCompletion:0];
        if (![v51 count] && v85)
        {
          if (v23 != 0.0)
          {
            v61 = avt_default_log();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
              -[AVTAvatarPoseAnimation _addAnimationToAvatar:options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:](buf, &buf[4], v61);
            }
          }
          v62 = (void *)MEMORY[0x263F169E0];
          if (v33 <= 0.0)
          {
            v91[0] = MEMORY[0x263EF8330];
            v91[1] = 3221225472;
            v91[2] = __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke_2;
            v91[3] = &unk_264020168;
            v92 = v81;
            id v94 = v83;
            id v93 = v80;
            v71 = [v62 animationEventWithKeyTime:v91 block:1.0];
            v109 = v71;
            v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v109 count:1];
            [v59 setAnimationEvents:v72];

            v64 = v94;
            v73 = (id *)&v92;
          }
          else
          {
            v98[0] = MEMORY[0x263EF8330];
            v98[1] = 3221225472;
            v98[2] = __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke;
            v98[3] = &unk_264020118;
            v99[0] = v81;
            *(double *)&v99[1] = v33;
            uint64_t v63 = [v62 animationEventWithKeyTime:v98 block:v57];
            v64 = (void *)v63;
            if (v83)
            {
              v65 = v80;
              if (!v80)
              {
                v66 = avt_default_log();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                  -[AVTAvatarPoseAnimation _addAnimationToAvatar:options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:]((uint8_t *)&v113, &v114, v66);
                }

                v65 = 0;
              }
              v67 = (void *)MEMORY[0x263F169E0];
              v95[0] = MEMORY[0x263EF8330];
              v95[1] = 3221225472;
              v95[2] = __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke_125;
              v95[3] = &unk_264020140;
              id v96 = v65;
              id v97 = v83;
              v68 = [v67 animationEventWithKeyTime:v95 block:1.0];
              v111[0] = v64;
              v111[1] = v68;
              v69 = [MEMORY[0x263EFF8C0] arrayWithObjects:v111 count:2];
              [v59 setAnimationEvents:v69];

              v70 = v96;
            }
            else
            {
              uint64_t v110 = v63;
              v70 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v110 count:1];
              [v59 setAnimationEvents:v70];
            }

            v73 = (id *)v99;
          }

          self = v84;
        }
        [v87 addAnimation:v59 forKey:v60];
        [v51 addObject:v60];
        v74 = [v59 keyPath];
        [v86 removeObjectForKey:v74];
      }
      uint64_t v53 = [obj countByEnumeratingWithState:&v100 objects:v112 count:16];
      v54 += j;
    }
    while (v53);
  }

  v88[0] = MEMORY[0x263EF8330];
  v88[1] = 3221225472;
  v88[2] = __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke_127;
  v88[3] = &unk_264020190;
  id v89 = v87;
  double v90 = v33;
  id v75 = v87;
  [v86 enumerateKeysAndObjectsUsingBlock:v88];

  return v81;
}

uint64_t __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAnimationWithBlendOutDuration:*(double *)(a1 + 40)];
}

void __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke_125(uint64_t a1)
{
}

void __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeAnimationWithBlendOutDuration:0.0];
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    id v3 = *(NSObject **)(a1 + 40);
    if (!v3)
    {
      id v4 = avt_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke_2_cold_1(v4);
      }

      id v3 = *(NSObject **)(a1 + 40);
      v2 = *(void **)(a1 + 48);
    }
    dispatch_async(v3, v2);
  }
}

void __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke_127(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(a1 + 32) removeAnimationForKey:*(void *)(*((void *)&v9 + 1) + 8 * v8++) blendOutDuration:*(double *)(a1 + 40)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (id)animationFromDataRepresentation:(id)a3 keyPath:(id)a4
{
  id v4 = (void *)MEMORY[0x263F08928];
  id v5 = a3;
  uint64_t v6 = [v4 unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:0];

  return v6;
}

+ (void)dataRepresentationForAnimation:(id)a3 completionHandler:(id)a4
{
  id v5 = (void *)MEMORY[0x263F08910];
  uint64_t v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  id v9 = [v5 archivedDataWithRootObject:v7 requiringSecureCoding:0 error:0];
  uint64_t v8 = [v7 keyPath];

  v6[2](v6, v8, v9);
}

+ (id)animationFromDictionaryRepresentation:(id)a3 keyPath:(id)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"valuesByKeyTime"];
  uint64_t v8 = (void *)MEMORY[0x263EFF980];
  id v9 = [v7 allKeys];
  long long v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));

  long long v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v12 = [v7 allKeys];
  long long v13 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"self.floatValue" ascending:1];
  v27[0] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  id v15 = [v12 sortedArrayUsingDescriptors:v14];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __72__AVTAvatarPoseAnimation_animationFromDictionaryRepresentation_keyPath___block_invoke;
  v23[3] = &unk_2640201B8;
  id v24 = v10;
  id v25 = v7;
  id v26 = v11;
  id v16 = v11;
  id v17 = v7;
  id v18 = v10;
  [v15 enumerateObjectsUsingBlock:v23];
  long long v19 = [MEMORY[0x263F157D8] animationWithKeyPath:v5];

  double v20 = [v6 objectForKeyedSubscript:@"duration"];

  [v20 floatValue];
  [v19 setDuration:v21];

  [v19 setUsesSceneTimeBase:1];
  [v19 setValues:v16];
  [v19 setKeyTimes:v18];

  return v19;
}

void __72__AVTAvatarPoseAnimation_animationFromDictionaryRepresentation_keyPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = NSNumber;
  id v5 = a2;
  [v5 floatValue];
  id v6 = objc_msgSend(v4, "numberWithFloat:");
  [v3 addObject:v6];

  id v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 48) addObject:v11];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v11;
    if ([v7 count] == 3)
    {
      objc_msgSend(v7, "avt_float3");
      uint64_t v8 = *(void **)(a1 + 48);
      uint64_t v9 = objc_msgSend(MEMORY[0x263F08D40], "avt_valueWithFloat3_usableWithKVCForSCNVector3:");
    }
    else
    {
      if ([v7 count] != 4)
      {
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(v7, "avt_float4");
      uint64_t v8 = *(void **)(a1 + 48);
      uint64_t v9 = objc_msgSend(MEMORY[0x263F08D40], "avt_valueWithFloat4_usableWithKVCForSCNVector4:");
    }
    long long v10 = (void *)v9;
    [v8 addObject:v9];

    goto LABEL_9;
  }
LABEL_10:
}

+ (void)dictionaryRepresentationForAnimation:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, __CFString *, void *))a4;
  id v7 = [v5 caAnimation];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    +[AVTAvatarPoseAnimation dictionaryRepresentationForAnimation:completionHandler:]();
  }
  id v8 = v7;
  v72[0] = MEMORY[0x263EF8330];
  v72[1] = 3221225472;
  v73 = __81__AVTAvatarPoseAnimation_dictionaryRepresentationForAnimation_completionHandler___block_invoke_2;
  v74 = &unk_2640201E0;
  id v75 = v8;
  uint64_t v9 = [v8 keyPath];
  int v10 = [v9 isEqualToString:@"transform"];

  if (!v10)
  {
    v43 = [v8 keyPath];
    v61 = v6;
    id v64 = v5;
    if ([v43 isEqualToString:@"position"])
    {
    }
    else
    {
      v44 = [v8 keyPath];
      int v45 = [v44 isEqualToString:@"eulerAngles"];

      if (!v45)
      {
        v46 = (void (**)(uint64_t, void *))&__block_literal_global_161;
        goto LABEL_22;
      }
    }
    v46 = (void (**)(uint64_t, void *))&__block_literal_global_166;
LABEL_22:
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v48 = [v8 keyTimes];
    uint64_t v49 = [v48 count];

    if (v49)
    {
      unint64_t v50 = 0;
      do
      {
        v51 = objc_msgSend(v8, "keyTimes", v61);
        uint64_t v52 = [v51 objectAtIndexedSubscript:v50];
        uint64_t v53 = v73((uint64_t)v72, v52);
        uint64_t v54 = [v53 stringValue];

        uint64_t v55 = [v8 values];
        float v56 = [v55 objectAtIndexedSubscript:v50];
        double v57 = v46[2]((uint64_t)v46, v56);

        [v11 setObject:v57 forKeyedSubscript:v54];
        ++v50;
        v58 = [v8 keyTimes];
        unint64_t v59 = [v58 count];
      }
      while (v50 < v59);
    }
    objc_msgSend(v8, "keyPath", v61);
    long long v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    long long v13 = __81__AVTAvatarPoseAnimation_dictionaryRepresentationForAnimation_completionHandler___block_invoke((uint64_t)v12, v8, v11);
    id v6 = v62;
    v62[2](v62, v12, v13);
    id v5 = v64;
    goto LABEL_26;
  }
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v12 = (__CFString *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v13 = [MEMORY[0x263F16A98] node];
  [v13 simdPosition];
  float32x4_t v66 = v14;
  [v13 simdOrientation];
  float32x4_t v65 = v15;
  id v16 = [v8 keyTimes];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    v60 = v6;
    id v63 = v5;
    LOBYTE(v6) = 0;
    LOBYTE(v71) = 0;
    unint64_t v18 = 0;
    do
    {
      long long v19 = v11;
      double v20 = v12;
      float v21 = objc_msgSend(v8, "keyTimes", v60);
      double v22 = [v21 objectAtIndexedSubscript:v18];
      double v23 = v73((uint64_t)v72, v22);
      id v24 = [v23 stringValue];

      id v25 = [v8 values];
      id v26 = [v25 objectAtIndexedSubscript:v18];

      objc_msgSend(v26, "avt_float4x4Value");
      double v69 = v28;
      double v70 = v27;
      double v67 = v30;
      double v68 = v29;
      [MEMORY[0x263F16B08] begin];
      objc_msgSend(v13, "setSimdTransform:", v70, v69, v68, v67);
      [MEMORY[0x263F16B08] commit];
      if (v6)
      {
        LOBYTE(v6) = 1;
      }
      else
      {
        [v13 simdPosition];
        uint32x4_t v32 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(v66, v31));
        v32.i32[3] = v32.i32[2];
        LODWORD(v6) = vmaxvq_u32(v32) >> 31;
      }
      long long v12 = v20;
      if (v71)
      {
        unsigned int v33 = 1;
      }
      else
      {
        [v13 simdOrientation];
        unsigned int v33 = vmaxvq_u32((uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(v65, v34))) >> 31;
      }
      unsigned int v71 = v33;
      id v11 = v19;
      uint64_t v35 = (void *)MEMORY[0x263EFF8C0];
      [v13 simdPosition];
      id v36 = objc_msgSend(v35, "avt_arrayWithFloat3:");
      [v19 setObject:v36 forKeyedSubscript:v24];

      uint64_t v37 = (void *)MEMORY[0x263EFF8C0];
      [v13 simdOrientation];
      uint64_t v38 = objc_msgSend(v37, "avt_arrayWithFloat4:");
      [(__CFString *)v12 setObject:v38 forKeyedSubscript:v24];

      ++v18;
      uint64_t v39 = [v8 keyTimes];
      unint64_t v40 = [v39 count];
    }
    while (v18 < v40);
    if (v6)
    {
      v42 = __81__AVTAvatarPoseAnimation_dictionaryRepresentationForAnimation_completionHandler___block_invoke(v41, v8, v19);
      id v6 = v60;
      v60[2](v60, @"position", v42);

      id v5 = v63;
      if ((v71 & 1) == 0) {
        goto LABEL_26;
      }
      goto LABEL_20;
    }
    id v6 = v60;
    id v5 = v63;
    if (v71)
    {
LABEL_20:
      id v47 = __81__AVTAvatarPoseAnimation_dictionaryRepresentationForAnimation_completionHandler___block_invoke(v41, v8, v12);
      v6[2](v6, @"orientation", v47);
    }
  }
LABEL_26:
}

id __81__AVTAvatarPoseAnimation_dictionaryRepresentationForAnimation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 dictionary];
  id v8 = NSNumber;
  [v6 duration];
  double v10 = v9;

  *(float *)&double v11 = v10;
  long long v12 = [v8 numberWithFloat:v11];
  [v7 setObject:v12 forKeyedSubscript:@"duration"];

  [v7 setObject:v5 forKeyedSubscript:@"valuesByKeyTime"];
  return v7;
}

uint64_t __81__AVTAvatarPoseAnimation_dictionaryRepresentationForAnimation_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [v4 beginTime];
  double v7 = v6;
  [v5 floatValue];
  float v9 = v8;

  [*(id *)(a1 + 32) timeOffset];
  double v11 = v9 - v10;
  [*(id *)(a1 + 32) speed];
  double v13 = v7 + v11 / v12;
  return [v3 numberWithDouble:v13];
}

id __81__AVTAvatarPoseAnimation_dictionaryRepresentationForAnimation_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

id __81__AVTAvatarPoseAnimation_dictionaryRepresentationForAnimation_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v2, "avt_float3Value");
    objc_msgSend(MEMORY[0x263EFF8C0], "avt_arrayWithFloat3:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = v2;
  }
  id v4 = v3;

  return v4;
}

+ (id)optimizeAnimation:(id)a3 target:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 setUsesSceneTimeBase:1];
  [v5 _optimizeKeyframesWithTarget:v6];

  [v5 setUsesSceneTimeBase:0];
  return v5;
}

+ (void)removeAllAnimationsFromAvatar:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [a3 avatarNode];
  [v3 animationKeys];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        if (![*(id *)(*((void *)&v19 + 1) + 8 * i) hasPrefix:@"kAVTPoseAnimation-"])
        {

          long long v17 = 0u;
          long long v18 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          id v9 = v4;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v16;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v16 != v12) {
                  objc_enumerationMutation(v9);
                }
                float32x4_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * j);
                if (objc_msgSend(v14, "hasPrefix:", @"kAVTPoseAnimation-", (void)v15)) {
                  [v3 removeAnimationForKey:v14];
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }
            while (v11);
          }

          goto LABEL_20;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  [v3 removeAllAnimations];
LABEL_20:
}

- (id)physicalizedPose
{
  id v2 = [[AVTAvatarPhysicalizedPose alloc] initWithPose:self->_staticPose physicsStates:self->_staticPhysicsStates];
  return v2;
}

- (AVTAvatarPose)staticPose
{
  return self->_staticPose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationBaseKey, 0);
  objc_storeStrong((id *)&self->_perNodeAnimations, 0);
  objc_storeStrong((id *)&self->_blendshapeAnimations, 0);
  objc_storeStrong((id *)&self->_staticPhysicsStates, 0);
  objc_storeStrong((id *)&self->_staticPose, 0);
}

- (void)initWithSceneAtURL:(NSObject *)a3 usdaMetadata:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 path];
  uint64_t v6 = [a2 description];
  int v7 = 138412546;
  float v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_20B819000, a3, OS_LOG_TYPE_ERROR, "Error: could not load scene at %@ with error: %@", (uint8_t *)&v7, 0x16u);
}

- (void)_addAnimationToAvatar:(NSObject *)a3 options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:.cold.1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "completionQueue";
}

- (void)_addAnimationToAvatar:(NSObject *)a3 options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:.cold.2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "timeOffset == 0.0";
  OUTLINED_FUNCTION_0_2(&dword_20B819000, (int)a2, a3, "Error: Condition '%s' failed. Needs more work to support timeOffset + SCNAnimationEvent", a1);
}

- (void)_addAnimationToAvatar:(void *)a1 options:(_OWORD *)a2 transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:.cold.3(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "completionQueue";
}

+ (void)dictionaryRepresentationForAnimation:completionHandler:.cold.1()
{
}

@end