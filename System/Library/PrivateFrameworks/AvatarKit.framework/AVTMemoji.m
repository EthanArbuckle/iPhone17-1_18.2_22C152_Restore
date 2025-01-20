@interface AVTMemoji
+ (AVTMemoji)memojiWithContentsOfURL:(id)a3 error:(id *)a4;
+ (AVTMemoji)memojiWithContentsOfURL:(id)a3 usageIntent:(unint64_t)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)memoji;
+ (id)neutralMemoji;
+ (id)neutralMemojiDataRepresentation;
+ (id)neutralMemojiDescriptor;
+ (id)neutralMemojiPresetsIdentifiersPerCategory;
- (AVTMemoji)init;
- (AVTMemoji)initWithCoder:(id)a3;
- (AVTMemoji)initWithDescriptor:(id)a3 usageIntent:(unint64_t)a4 error:(id *)a5;
- (BOOL)_addTorsoComponentInstanceIfNeeded;
- (BOOL)showsBody;
- (BOOL)usesSkinningForEyeOrientation;
- (CGImage)createSkinAO;
- (double)arOffset;
- (double)skinTextureSize;
- (float)arScale;
- (id)_assetNodesForComponentType:(int64_t)a3 includingBuiltInAssetNodes:(BOOL)a4 includingComponentAssetNode:(BOOL)a5;
- (id)_componentInstanceAssetNodesForDependencyOfType:(int64_t)a3 isAssetSpecific:(BOOL)a4;
- (id)_wrapDeformerDriverInfoForComponentType:(int64_t)a3;
- (id)allAssetNodesForComponentType:(int64_t)a3;
- (id)allBuiltinAssetNodes;
- (id)assetResourceCache;
- (id)avatarNode;
- (id)bodyComponentContainer;
- (id)bodyPose;
- (id)builtinAssetNodesForComponentType:(int64_t)a3;
- (id)colorPresetForCategory:(int64_t)a3;
- (id)colorPresetForCategory:(int64_t)a3 colorIndex:(unint64_t)a4;
- (id)componentForType:(int64_t)a3;
- (id)componentInstanceForType:(int64_t)a3;
- (id)componentWithType:(int64_t)a3;
- (id)components;
- (id)copyWithUsageIntent:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)effectiveMorphedNodeForTargetName:(id)a3;
- (id)eyebrowsColor;
- (id)facialhairColor;
- (id)hairColor;
- (id)handsComponentContainer;
- (id)headComponentContainer;
- (id)headNode;
- (id)lipsColor;
- (id)newDescriptor;
- (id)presetForCategory:(int64_t)a3;
- (id)resolvedPresetForCategory:(int64_t)a3;
- (id)secondaryColorPresetForCategory:(int64_t)a3;
- (id)skinColor;
- (id)specializationSettings;
- (id)stickerPhysicsStateIdentifier;
- (id)upperNodesIgnoredByDynamics;
- (id)wrapDeformedDriverNamed:(id)a3 forComponentType:(int64_t)a4;
- (unint64_t)usageIntent;
- (unint64_t)visibleBodyParts;
- (void)_addTorsoComponentInstanceIfNeeded;
- (void)_applyAllColorPresetsForCategory:(int64_t)a3;
- (void)_applyColorPresetForCategory:(int64_t)a3 colorIndex:(unint64_t)a4;
- (void)_applyMorphVariantsForLazyComponentInstanceOfType:(int64_t)a3 assetNode:(id)a4;
- (void)_invalidateAOImage;
- (void)_removeComponent:(id)a3;
- (void)_setAssetSpecificVariantDependenciesEnabled:(BOOL)a3 forPreset:(id)a4 dirtyComponents:(unint64_t)a5;
- (void)_setMorphWeight:(float)a3 forDependencyVariant:(id)a4 ofType:(int64_t)a5 isAssetSpecific:(BOOL)a6;
- (void)_setVariantDependenciesEnabled:(BOOL)a3 forPreset:(id)a4 dirtyComponents:(unint64_t)a5;
- (void)_update;
- (void)_updateAO;
- (void)_willDeactivateLazyComponentInstanceOfType:(int64_t)a3 assetNode:(id)a4;
- (void)addComponent:(id)a3 animated:(BOOL)a4;
- (void)addComponentAssetNode:(id)a3 toNode:(id)a4 forBodyParts:(unint64_t)a5;
- (void)addDerivedNodesMatchingStickerPattern:(id)a3 toArray:(id)a4 options:(unint64_t)a5;
- (void)applyVariantDependenciesForPreset:(id)a3 dirtyComponents:(unint64_t)a4;
- (void)componentDidChangeForType:(int64_t)a3 animated:(BOOL)a4;
- (void)componentMaterialDidUpdate:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateActiveWrapDeformerDriversForComponentType:(int64_t)a3 usingBlock:(id)a4;
- (void)invalidate;
- (void)morphTo:(id)a3;
- (void)randomize;
- (void)rebuildSpecializationSettings;
- (void)removeAllComponents;
- (void)removeComponentAssetNodeFromParentNode:(id)a3 forBodyParts:(unint64_t)a4;
- (void)removeComponentWithType:(int64_t)a3;
- (void)resetToDefault;
- (void)setBodyPose:(id)a3;
- (void)setColorPreset:(id)a3 forCategory:(int64_t)a4;
- (void)setColorPreset:(id)a3 forCategory:(int64_t)a4 colorIndex:(unint64_t)a5;
- (void)setComponentAssetNodeObservationForStickerBlock:(id)a3;
- (void)setInstance:(id)a3 forComponentType:(int64_t)a4;
- (void)setPreset:(id)a3 forCategory:(int64_t)a4;
- (void)setPreset:(id)a3 forCategory:(int64_t)a4 animated:(BOOL)a5;
- (void)setSecondaryColorPreset:(id)a3 forCategory:(int64_t)a4;
- (void)setShowsBody:(BOOL)a3;
- (void)setVisibleBodyParts:(unint64_t)a3;
- (void)unapplyVariantDependenciesForPreset:(id)a3 dirtyComponents:(unint64_t)a4;
- (void)update;
- (void)updateBodyPoseForSkinnerVariantsWithDirtyComponents:(unint64_t)a3;
- (void)updateEyeLashes;
- (void)updateHighlightsForComponentType:(int64_t)a3;
- (void)updateMorphVariantsInNodeHierarchy:(id)a3 componentType:(int64_t)a4 variant:(id)a5 weight:(float)a6;
- (void)updateMorphVariantsInStickerPropNodeHierarchy:(id)a3;
- (void)updateSkinMaterial:(id)a3;
- (void)updateWrapDeformerIsActiveForComponentType:(int64_t)a3;
@end

@implementation AVTMemoji

+ (id)neutralMemojiDataRepresentation
{
  if (neutralMemojiDataRepresentation_onceToken != -1) {
    dispatch_once(&neutralMemojiDataRepresentation_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)neutralMemojiDataRepresentation_neutralMemojiData;
  return v2;
}

void __44__AVTMemoji_neutralMemojiDataRepresentation__block_invoke()
{
  v0 = +[AVTResourceLocator sharedResourceLocator]();
  -[AVTResourceLocator pathForMemojiResource:ofType:isDirectory:](v0, @"editor_neutral", @"avt", 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v1 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3 options:8 error:0];
  v2 = (void *)neutralMemojiDataRepresentation_neutralMemojiData;
  neutralMemojiDataRepresentation_neutralMemojiData = v1;
}

+ (id)neutralMemojiDescriptor
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__AVTMemoji_neutralMemojiDescriptor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (neutralMemojiDescriptor_onceToken != -1) {
    dispatch_once(&neutralMemojiDescriptor_onceToken, block);
  }
  v2 = (void *)neutralMemojiDescriptor_neutralMemojiDescriptor;
  return v2;
}

void __36__AVTMemoji_neutralMemojiDescriptor__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) neutralMemojiDataRepresentation];
  uint64_t v1 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:0];
  v2 = [[AVTMemojiDescriptor alloc] initWithDictionaryRepresentation:v1 error:0 isResettingToDefault:1];
  id v3 = (void *)neutralMemojiDescriptor_neutralMemojiDescriptor;
  neutralMemojiDescriptor_neutralMemojiDescriptor = (uint64_t)v2;
}

+ (id)neutralMemoji
{
  v2 = [a1 neutralMemojiDescriptor];
  id v3 = [[AVTMemoji alloc] initWithDescriptor:v2 usageIntent:0 error:0];

  return v3;
}

+ (id)neutralMemojiPresetsIdentifiersPerCategory
{
  v2 = [a1 neutralMemojiDescriptor];
  if (v2)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:40];
    for (uint64_t i = 0; i != 40; ++i)
    {
      v5 = [v2 presetIdentifierForCategory:i];
      if (v5)
      {
        v6 = [NSNumber numberWithInteger:i];
        [v3 setObject:v5 forKeyedSubscript:v6];
      }
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)dealloc
{
  [(AVTMemoji *)self removeAllComponents];
  CGImageRelease(self->_combinedAOImage);
  self->_combinedAOImage = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVTMemoji;
  [(AVTAvatar *)&v3 dealloc];
}

- (void)removeAllComponents
{
  for (uint64_t i = 0; i != 42; ++i)
    [(AVTMemoji *)self removeComponentWithType:i];
}

- (void)resetToDefault
{
  id v3 = +[AVTMemoji neutralMemojiDescriptor];
  [v3 applyToMemoji:self];
}

- (id)newDescriptor
{
  id v3 = [AVTMemojiDescriptor alloc];
  return [(AVTMemojiDescriptor *)v3 initWithMemoji:self];
}

- (AVTMemoji)initWithDescriptor:(id)a3 usageIntent:(unint64_t)a4 error:(id *)a5
{
  v114[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v110.receiver = self;
  v110.super_class = (Class)AVTMemoji;
  v8 = [(AVTAvatar *)&v110 init];
  v9 = v8;
  if (v8)
  {
    v94 = v7;
    v8->_usageIntent = a4;
    v8->_updateLock._os_unfair_lock_opaque = 0;
    v8->_visibleBodyParts = 1;
    v10 = objc_alloc_init(AVTAssetResourceCache);
    resourceCache = v9->_resourceCache;
    v9->_resourceCache = v10;

    v12 = objc_alloc_init(AVTPresetStore);
    presetStore = v9->_presetStore;
    v9->_presetStore = v12;

    if (v9->_usageIntent == 2) {
      [(AVTAssetResourceCache *)v9->_resourceCache setPolicy:1];
    }
    v9->_componentDirtyMask = -1;
    v9->_componentAnimatedMask = 0;
    uint64_t v14 = [MEMORY[0x263F16A98] node];
    avatarNode = v9->_avatarNode;
    v9->_avatarNode = (SCNNode *)v14;

    [(SCNNode *)v9->_avatarNode setName:@"avatarNode"];
    v16 = (SCNNode *)objc_alloc_init(MEMORY[0x263F16A98]);
    headComponentContainer = v9->_headComponentContainer;
    v9->_headComponentContainer = v16;

    [(SCNNode *)v9->_headComponentContainer setName:@"head components"];
    v18 = (SCNNode *)objc_alloc_init(MEMORY[0x263F16A98]);
    bodyComponentContainer = v9->_bodyComponentContainer;
    v9->_bodyComponentContainer = v18;

    [(SCNNode *)v9->_bodyComponentContainer setName:@"body components"];
    [(SCNNode *)v9->_bodyComponentContainer setHidden:1];
    v20 = (SCNNode *)objc_alloc_init(MEMORY[0x263F16A98]);
    handsComponentContainer = v9->_handsComponentContainer;
    v9->_handsComponentContainer = v20;

    [(SCNNode *)v9->_handsComponentContainer setName:@"hands components"];
    [(SCNNode *)v9->_handsComponentContainer setHidden:1];
    [(SCNNode *)v9->_avatarNode addChildNode:v9->_headComponentContainer];
    [(SCNNode *)v9->_avatarNode addChildNode:v9->_bodyComponentContainer];
    v95 = v9;
    [(SCNNode *)v9->_avatarNode addChildNode:v9->_handsComponentContainer];
    +[AVTResourceLocator sharedResourceLocator]();
    v22 = (id *)objc_claimAutoreleasedReturnValue();
    v23 = -[AVTResourceLocator urlForMemojiAssetAtPath:isDirectory:](v22, @"eyes_mouth/eyes_mouth.aa", 1);

    v24 = [v23 URLByAppendingPathComponent:@"main.scnz" isDirectory:0];
    id v109 = 0;
    v25 = objc_msgSend(MEMORY[0x263F16AD8], "avt_rootNodeForSceneAtURL:options:error:", v24, 0, &v109);
    id v26 = v109;
    if (v26)
    {
      v27 = avt_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[AVTMemoji initWithDescriptor:usageIntent:error:](v24, v26);
      }
    }
    v28 = [v25 childNodes];
    v29 = [v28 objectAtIndexedSubscript:0];

    [v29 removeFromParentNode];
    [v29 enumerateHierarchyUsingBlock:&__block_literal_global_200];
    v30 = AVTPrecompiledMemojiAssetWithIdentifier(@"eyes_mouth");
    uint64_t v31 = [v30 objectForKeyedSubscript:@"specialization settings"];
    eyesAndTongueSpecializationSettings = v95->_eyesAndTongueSpecializationSettings;
    v95->_eyesAndTongueSpecializationSettings = (NSDictionary *)v31;

    if (!v95->_eyesAndTongueSpecializationSettings) {
      -[AVTMemoji initWithDescriptor:usageIntent:error:]();
    }

    id v33 = v29;
    uint64_t v34 = [v33 childNodeWithName:@"eyelashes" recursively:1];
    eyelashes = v95->_eyelashes;
    v95->_eyelashes = (SCNNode *)v34;

    v36 = [v33 childNodeWithName:@"L_eye" recursively:1];
    v37 = [v33 childNodeWithName:@"R_eye" recursively:1];
    v90 = v36;
    v38 = [v36 childNodeWithName:@"L_eye" recursively:0];
    v39 = [v38 geometry];
    uint64_t v40 = [v39 firstMaterial];
    eyeMaterialLeft = v95->_eyeMaterialLeft;
    v95->_eyeMaterialLeft = (SCNMaterial *)v40;

    v89 = v37;
    v42 = [v37 childNodeWithName:@"R_eye" recursively:0];
    v43 = [v42 geometry];
    uint64_t v44 = [v43 firstMaterial];
    eyeMaterialRight = v95->_eyeMaterialRight;
    v95->_eyeMaterialRight = (SCNMaterial *)v44;

    objc_msgSend(v33, "avt_enableSubdivisionOnHierarchyWithQuality:animoji:", 1, 0);
    p_eyesAndTongue = &v95->_eyesAndTongue;
    objc_storeStrong((id *)&v95->_eyesAndTongue, v29);
    v91 = v33;
    [(SCNNode *)v95->_headComponentContainer addChildNode:v33];
    v46 = +[AVTAssetLibrary sharedAssetLibrary];
    uint64_t v47 = [v46 assetWithType:0 identifier:@"head"];

    v48 = [AVTComponent alloc];
    v88 = (void *)v47;
    v114[0] = v47;
    v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v114 count:1];
    uint64_t v50 = [(AVTComponent *)v48 initWithType:0 assets:v49 morphVariant:0 imageVariant:0 materialVariant:0 morphVariantIntensity:0.0 bodyPoseVariantIntensity:0.0 textureAssetPresence:0.0];

    [(AVTMemoji *)v95 addComponent:v50 animated:0];
    v86 = (void *)v50;
    v51 = [[AVTComponentInstance alloc] initWithComponent:v50 assetResourceCache:v95->_resourceCache];
    [(AVTMemoji *)v95 setInstance:v51 forComponentType:0];
    v85 = v51;
    uint64_t v52 = [(AVTComponentInstance *)v51 assetNode];
    headNode = v95->_headNode;
    v95->_headNode = (SCNNode *)v52;

    [(SCNNode *)v95->_headNode setCastsShadow:1];
    [(SCNNode *)v95->_headNode setRenderingOrder:-1];
    [(SCNNode *)v95->_headComponentContainer addChildNode:v95->_headNode];
    v54 = +[AVTAssetLibrary sharedAssetLibrary];
    uint64_t v55 = [v54 assetWithType:34 identifier:@"body"];

    v56 = [AVTComponent alloc];
    v84 = (void *)v55;
    uint64_t v113 = v55;
    v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v113 count:1];
    uint64_t v58 = [(AVTComponent *)v56 initWithType:34 assets:v57 morphVariant:0 imageVariant:0 materialVariant:0 morphVariantIntensity:0.0 bodyPoseVariantIntensity:0.0 textureAssetPresence:0.0];

    v83 = (void *)v58;
    [(AVTMemoji *)v95 addComponent:v58 animated:0];
    +[AVTResourceLocator sharedResourceLocator]();
    v59 = (id *)objc_claimAutoreleasedReturnValue();
    v60 = -[AVTResourceLocator urlForMemojiAssetAtPath:isDirectory:](v59, @"skeleton.aa/main.scnz", 0);

    id v108 = 0;
    v61 = objc_msgSend(MEMORY[0x263F16AD8], "avt_rootNodeForSceneAtURL:options:error:", v60, 0, &v108);
    id v62 = v108;
    if (v62)
    {
      v63 = avt_default_log();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
        -[AVTMemoji initWithDescriptor:usageIntent:error:](v60, v62);
      }
    }
    v93 = v60;
    v92 = v61;
    uint64_t v64 = [v61 childNodeWithName:@"root_JNT" recursively:1];
    skeletonRootNode = v95->_skeletonRootNode;
    v95->_skeletonRootNode = (SCNNode *)v64;

    [(SCNNode *)v95->_skeletonRootNode removeFromParentNode];
    [(SCNNode *)v95->_avatarNode addChildNode:v95->_skeletonRootNode];
    v66 = v95->_headComponentContainer;
    v106[0] = MEMORY[0x263EF8330];
    v106[1] = 3221225472;
    v106[2] = __50__AVTMemoji_initWithDescriptor_usageIntent_error___block_invoke_233;
    v106[3] = &unk_26401F2B0;
    v67 = v95;
    v107 = v67;
    [(SCNNode *)v66 enumerateChildNodesUsingBlock:v106];
    v68 = objc_alloc_init(AVTCompositor);
    id v69 = v67[297];
    v67[297] = v68;

    v67[298] = (id)-1;
    v97 = +[AVTCompositor propertyNames];
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    v70 = [(SCNNode *)v95->_headNode geometry];
    v71 = [v70 materials];

    obuint64_t j = v71;
    uint64_t v72 = [v71 countByEnumeratingWithState:&v102 objects:v112 count:16];
    if (v72)
    {
      uint64_t v73 = v72;
      uint64_t v74 = *(void *)v103;
      do
      {
        for (uint64_t i = 0; i != v73; ++i)
        {
          if (*(void *)v103 != v74) {
            objc_enumerationMutation(obj);
          }
          uint64_t v76 = *(void *)(*((void *)&v102 + 1) + 8 * i);
          long long v98 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          id v77 = v97;
          uint64_t v78 = [v77 countByEnumeratingWithState:&v98 objects:v111 count:16];
          if (v78)
          {
            uint64_t v79 = v78;
            uint64_t v80 = *(void *)v99;
            do
            {
              for (uint64_t j = 0; j != v79; ++j)
              {
                if (*(void *)v99 != v80) {
                  objc_enumerationMutation(v77);
                }
                [v67[297] configureMaterial:v76 propertyNamed:*(void *)(*((void *)&v98 + 1) + 8 * j) memoji:v67];
              }
              uint64_t v79 = [v77 countByEnumeratingWithState:&v98 objects:v111 count:16];
            }
            while (v79);
          }
        }
        uint64_t v73 = [obj countByEnumeratingWithState:&v102 objects:v112 count:16];
      }
      while (v73);
    }

    [v67 resetToDefault];
    id v7 = v94;
    if (v94)
    {
      [v94 applyToMemoji:v67];
      +[AVTAvatarMemoryOptimizer optimizeMemoji:]((uint64_t)AVTAvatarMemoryOptimizer, v67);
      [v67 rebuildSpecializationSettings];
      [v67 _avatarNodeAndHeadNodeAreNowAvailable];
      v9 = v95;
      [v67 addCustomBehavioursInHierarchy:v95->_headNode forBodyParts:1];
      [v67 addCustomBehavioursInHierarchy:*p_eyesAndTongue forBodyParts:1];
      [v67 updateBindings];
      [v67 update];
    }
    else
    {
      [v67 rebuildSpecializationSettings];
      [v67 _avatarNodeAndHeadNodeAreNowAvailable];
      v9 = v95;
      [v67 addCustomBehavioursInHierarchy:v95->_headNode forBodyParts:1];
      [v67 addCustomBehavioursInHierarchy:*p_eyesAndTongue forBodyParts:1];
      [v67 updateBindings];
    }
  }
  return v9;
}

void __50__AVTMemoji_initWithDescriptor_usageIntent_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 name];
  uint64_t v3 = [v2 hasSuffix:@"_eye"];

  [v4 setCastsShadow:v3];
}

void __50__AVTMemoji_initWithDescriptor_usageIntent_error___block_invoke_233(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 336);
  id v3 = [a2 skinner];
  [v3 setSkeleton:v2];
}

- (AVTMemoji)init
{
  return [(AVTMemoji *)self initWithDescriptor:0 usageIntent:0 error:0];
}

+ (id)memoji
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (AVTMemoji)memojiWithContentsOfURL:(id)a3 error:(id *)a4
{
  return (AVTMemoji *)[a1 memojiWithContentsOfURL:a3 usageIntent:0 error:a4];
}

+ (AVTMemoji)memojiWithContentsOfURL:(id)a3 usageIntent:(unint64_t)a4 error:(id *)a5
{
  v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:a3 options:8 error:0];
  v9 = [a1 avatarWithDataRepresentation:v8 usageIntent:a4 error:a5];

  return (AVTMemoji *)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTMemoji *)self newDescriptor];
  [v4 encodeObject:v5 forKey:@"descriptor"];
}

- (AVTMemoji)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptor"];

  v6 = [(AVTMemoji *)self initWithDescriptor:v5 usageIntent:0 error:0];
  return v6;
}

- (double)arOffset
{
  return 2048.0;
}

- (float)arScale
{
  return 1.344;
}

- (id)assetResourceCache
{
  return self->_resourceCache;
}

- (id)componentForType:(int64_t)a3
{
  return self->_components[a3];
}

- (id)componentInstanceForType:(int64_t)a3
{
  return self->_componentInstances[a3];
}

- (unint64_t)usageIntent
{
  return self->_usageIntent;
}

- (id)copyWithUsageIntent:(unint64_t)a3
{
  unint64_t v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t usageIntent = self->_usageIntent;
  if (usageIntent != a3 && usageIntent != 0)
  {
    id v7 = avt_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v8 = self->_usageIntent;
      int v12 = 134218240;
      unint64_t v13 = v3;
      __int16 v14 = 2048;
      unint64_t v15 = v8;
      _os_log_impl(&dword_20B819000, v7, OS_LOG_TYPE_DEFAULT, "Can't make a copy with usage intent %lu of a Memoji whose usage intent is %lu", (uint8_t *)&v12, 0x16u);
    }

    unint64_t v3 = self->_usageIntent;
  }
  v9 = [[AVTMemojiDescriptor alloc] initWithMemoji:self];
  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDescriptor:v9 usageIntent:v3 error:0];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [(AVTMemoji *)self copyWithUsageIntent:self->_usageIntent];
}

- (id)headNode
{
  return self->_headNode;
}

- (id)avatarNode
{
  return self->_avatarNode;
}

- (id)headComponentContainer
{
  return self->_headComponentContainer;
}

- (id)bodyComponentContainer
{
  return self->_bodyComponentContainer;
}

- (id)handsComponentContainer
{
  return self->_handsComponentContainer;
}

- (id)skinColor
{
  id v2 = [(AVTMemoji *)self colorPresetForCategory:0];
  unint64_t v3 = [v2 baseColor];

  return v3;
}

- (id)hairColor
{
  id v2 = [(AVTMemoji *)self colorPresetForCategory:1];
  unint64_t v3 = [v2 baseColor];

  return v3;
}

- (id)eyebrowsColor
{
  id v2 = [(AVTMemoji *)self colorPresetForCategory:8];
  unint64_t v3 = [v2 baseColor];

  return v3;
}

- (id)facialhairColor
{
  id v2 = [(AVTMemoji *)self colorPresetForCategory:2];
  unint64_t v3 = [v2 baseColor];

  return v3;
}

- (id)lipsColor
{
  id v2 = [(AVTMemoji *)self colorPresetForCategory:10];
  unint64_t v3 = [v2 baseColor];

  return v3;
}

- (void)_invalidateAOImage
{
  self->_aoValid = 0;
  combinedAOImage = self->_combinedAOImage;
  if (combinedAOImage)
  {
    CGImageRelease(combinedAOImage);
    self->_combinedAOImage = 0;
  }
}

- (void)_applyAllColorPresetsForCategory:(int64_t)a3
{
  for (uint64_t i = 0; i != 3; ++i)
    [(AVTMemoji *)self _applyColorPresetForCategory:a3 colorIndex:i];
}

- (void)_applyColorPresetForCategory:(int64_t)a3 colorIndex:(unint64_t)a4
{
  if (a4 >= 3) {
    -[AVTMemoji _applyColorPresetForCategory:colorIndex:]();
  }
  colorPresets = self->_colorPresets;
  unint64_t v8 = (id *)self->_colorPresets[a3];
  id v22 = v8[a4];
  uint64_t v9 = AVTPresetCategoryToComponentType(a3);
  uint64_t v10 = [(AVTMemoji *)self componentWithType:v9];
  v11 = (void *)v10;
  if (a4 == 1)
  {
    if (a3 == 7)
    {
      if (v22)
      {
        __int16 v14 = [v22 makeMaterial];
        int v12 = v14;
        eyeMaterialLeft = self->_eyeMaterialLeft;
        goto LABEL_11;
      }
      id v19 = *v8;
      int v12 = [v19 makeMaterial];
      [v12 applyToSceneKitMaterial:self->_eyeMaterialLeft];
LABEL_23:

      goto LABEL_27;
    }
    if (!v10) {
      goto LABEL_28;
    }
    int v12 = [v22 makeMaterial];
    unint64_t v15 = v11;
    uint64_t v16 = v12;
    uint64_t v17 = 1;
LABEL_26:
    [v15 setMaterial:v16 atIndex:v17];
    [(AVTMemoji *)self componentMaterialDidUpdate:v11];
    goto LABEL_27;
  }
  if (a4)
  {
    if (!v10) {
      goto LABEL_28;
    }
    int v12 = [v22 makeMaterial];
    unint64_t v15 = v11;
    uint64_t v16 = v12;
    uint64_t v17 = 2;
    goto LABEL_26;
  }
  if (!v22) {
    goto LABEL_28;
  }
  if (a3 != 7)
  {
    if (v9 == 28)
    {
      int v12 = [v22 makeMaterial];
      [v11 setMaterial:v12 atIndex:0];
      [(AVTMemoji *)self componentMaterialDidUpdate:v11];
      v18 = [(AVTMemoji *)self componentWithType:34];
      id v19 = v18;
      if (v18)
      {
        [v18 setMaterial:v12 atIndex:0];
        [(AVTMemoji *)self componentMaterialDidUpdate:v19];
      }
      v20 = [(AVTMemoji *)self componentWithType:37];
      v21 = v20;
      if (v20)
      {
        [v20 setMaterial:v12 atIndex:0];
        [(AVTMemoji *)self componentMaterialDidUpdate:v21];
      }
      [(AVTCompositor *)self->_compositor skinColorDidChange];

      goto LABEL_23;
    }
    if (!v10) {
      goto LABEL_28;
    }
    int v12 = [v22 makeMaterial];
    unint64_t v15 = v11;
    uint64_t v16 = v12;
    uint64_t v17 = 0;
    goto LABEL_26;
  }
  int v12 = [v22 makeMaterial];
  [v12 applyToSceneKitMaterial:self->_eyeMaterialRight];
  if (!(*colorPresets)[22])
  {
    eyeMaterialLeft = self->_eyeMaterialLeft;
    __int16 v14 = v12;
LABEL_11:
    [v14 applyToSceneKitMaterial:eyeMaterialLeft];
  }
LABEL_27:

LABEL_28:
}

- (id)colorPresetForCategory:(int64_t)a3
{
  if (a3 < 40)
  {
    id v4 = self->_colorPresets[a3][0];
  }
  else
  {
    unint64_t v3 = avt_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[AVTMemojiDescriptor presetIdentifierForCategory:]();
    }

    id v4 = 0;
  }
  return v4;
}

- (id)secondaryColorPresetForCategory:(int64_t)a3
{
  if (a3 < 40)
  {
    id v4 = self->_colorPresets[a3][1];
  }
  else
  {
    unint64_t v3 = avt_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[AVTMemojiDescriptor presetIdentifierForCategory:]();
    }

    id v4 = 0;
  }
  return v4;
}

- (id)colorPresetForCategory:(int64_t)a3 colorIndex:(unint64_t)a4
{
  if (a3 < 40)
  {
    if (a4 >= 3) {
      -[AVTMemoji colorPresetForCategory:colorIndex:]();
    }
    id v5 = self->_colorPresets[a3][a4];
  }
  else
  {
    id v4 = avt_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AVTMemojiDescriptor presetIdentifierForCategory:]();
    }

    id v5 = 0;
  }
  return v5;
}

- (void)setColorPreset:(id)a3 forCategory:(int64_t)a4
{
}

- (void)setSecondaryColorPreset:(id)a3 forCategory:(int64_t)a4
{
}

- (void)setColorPreset:(id)a3 forCategory:(int64_t)a4 colorIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = v8;
  if (a4 >= 40)
  {
    avt_default_log();
    uint64_t v10 = (AVTMemoji *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_ERROR)) {
      -[AVTMemojiDescriptor presetIdentifierForCategory:]();
    }
LABEL_16:

    return;
  }
  if (v8)
  {
    if ([v8 category] != a4)
    {
      v11 = avt_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[AVTMemojiDescriptor setColorPreset:forCategory:colorIndex:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    if (a5 <= 2)
    {
LABEL_10:
      uint64_t v10 = self;
      objc_sync_enter(v10);
      id v19 = (id *)&v10->_colorPresets[a4][a5];
      if (*v19 != v9)
      {
        objc_storeStrong(v19, v9);
        [(AVTMemoji *)v10 _applyColorPresetForCategory:a4 colorIndex:a5];
        if (a5 == 1)
        {
          uint64_t v20 = AVTPresetCategoryToComponentType(a4);
          if (v20 != 42) {
            v10->_compositorComponentDirtyMask |= 1 << v20;
          }
        }
        [(AVTMemoji *)v10 invalidate];
      }
      objc_sync_exit(v10);
      goto LABEL_16;
    }
LABEL_24:
    -[AVTMemoji setColorPreset:forCategory:colorIndex:]();
  }
  if (a5 >= 3) {
    goto LABEL_24;
  }
  if (a5)
  {
    id v9 = +[AVTColorPreset fallbackColorPresetForNilPresetAndCategory:a4 colorIndex:a5];
    if (v9)
    {
      v21 = avt_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[AVTMemoji setColorPreset:forCategory:colorIndex:](a4, v21);
      }
    }
    goto LABEL_10;
  }
}

- (id)components
{
  unint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:42];
  uint64_t v4 = 0;
  components = self->_components;
  do
  {
    if (components[v4]) {
      objc_msgSend(v3, "addObject:");
    }
    ++v4;
  }
  while (v4 != 42);
  return v3;
}

- (id)componentWithType:(int64_t)a3
{
  if (a3 == 42)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = self->_components[a3];
  }
  return v4;
}

- (void)addComponent:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = v7;
  if (v7)
  {
    BOOL v15 = v4;
    id v9 = self->_components[[v7 type]];
    [(AVTMemoji *)self _removeComponent:v9];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = [v8 assets];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          [(AVTAssetResourceCache *)self->_resourceCache retainAsset:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }

    objc_storeStrong((id *)&self->_components[[v8 type]], a3);
    -[AVTMemoji componentDidChangeForType:animated:](self, "componentDidChangeForType:animated:", [v8 type], v15);
  }
}

- (void)removeComponentWithType:(int64_t)a3
{
  -[AVTMemoji componentWithType:](self, "componentWithType:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(AVTMemoji *)self _removeComponent:v5];
  [(AVTMemoji *)self componentDidChangeForType:a3 animated:0];
}

- (void)_removeComponent:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v6 = objc_msgSend(v4, "assets", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          [(AVTAssetResourceCache *)self->_resourceCache releaseAsset:*(void *)(*((void *)&v14 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    components = self->_components;
    uint64_t v12 = [v5 type];
    uint64_t v13 = components[v12];
    components[v12] = 0;
  }
}

- (void)invalidate
{
  if (!self->_needsUpdate)
  {
    p_updateLock = &self->_updateLock;
    os_unfair_lock_lock(&self->_updateLock);
    if (!self->_needsUpdate)
    {
      self->_needsUpdate = 1;
      id v4 = [(AVTMemoji *)self avatarNode];
      uint64_t v5 = 1 - [v4 movabilityHint];
      v6 = [(AVTMemoji *)self avatarNode];
      [v6 setMovabilityHint:v5];

      uint64_t v7 = [(AVTMemoji *)self avatarNode];
      uint64_t v8 = 1 - [v7 movabilityHint];
      uint64_t v9 = [(AVTMemoji *)self avatarNode];
      [v9 setMovabilityHint:v8];
    }
    os_unfair_lock_unlock(p_updateLock);
  }
}

- (void)componentDidChangeForType:(int64_t)a3 animated:(BOOL)a4
{
  if (a3 != 42)
  {
    self->_componentDirtyMask |= 1 << a3;
    if (a4) {
      self->_componentAnimatedMask |= 1 << a3;
    }
    [(AVTMemoji *)self invalidate];
  }
}

- (void)componentMaterialDidUpdate:(id)a3
{
  id v5 = a3;
  self->_compositorComponentDirtyMask |= 1 << [v5 type];
  if ([v5 type] != 28) {
    -[AVTComponentInstance updateMaterialsWithComponent:](self->_componentInstances[[v5 type]], "updateMaterialsWithComponent:", v5);
  }
  if ([v5 type] == 2)
  {
    uint64_t v4 = 4;
  }
  else if ([v5 type] == 11)
  {
    uint64_t v4 = 2048;
  }
  else
  {
    if ([v5 type] != 12) {
      goto LABEL_10;
    }
    uint64_t v4 = 4096;
  }
  self->_componentDirtyMask |= v4;
  [(AVTMemoji *)self invalidate];
LABEL_10:
}

- (BOOL)usesSkinningForEyeOrientation
{
  return 1;
}

- (void)randomize
{
  [MEMORY[0x263F16B08] lock];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  [(AVTMemoji *)v3 resetToDefault];
  [MEMORY[0x263F16B08] begin];
  [MEMORY[0x263F16B08] setAnimationDuration:0.75];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __22__AVTMemoji_randomize__block_invoke;
  v5[3] = &unk_264021120;
  v5[4] = v3;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __22__AVTMemoji_randomize__block_invoke_2;
  v4[3] = &unk_264021148;
  v4[4] = v3;
  _AVTMemojiRandomize(v5, v4);
  [MEMORY[0x263F16B08] commit];
  objc_sync_exit(v3);

  [MEMORY[0x263F16B08] unlock];
}

uint64_t __22__AVTMemoji_randomize__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setPreset:a2 forCategory:a3 animated:0];
}

uint64_t __22__AVTMemoji_randomize__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) setColorPreset:a2 forCategory:a3 colorIndex:a4];
}

- (void)setPreset:(id)a3 forCategory:(int64_t)a4
{
}

- (void)setPreset:(id)a3 forCategory:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = v8;
  if (v8)
  {
    if ([v8 category] != a4)
    {
      uint64_t v10 = avt_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AVTMemoji setPreset:forCategory:animated:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    long long v18 = self;
    objc_sync_enter(v18);
    uint64_t v19 = -[AVTPresetStore presetForCategory:]((id *)&v18->_presetStore->super.isa, a4);
    uint64_t v20 = v19;
    if (v19 != v9)
    {
      uint64_t v21 = [v19 identifier];
      id v22 = [v9 identifier];
      char v23 = [v21 isEqualToString:v22];

      if ((v23 & 1) == 0)
      {
        if (unint64_t)(a4 - 34) <= 5 && ((0x3Du >> (a4 - 34))) {
          BOOL v5 = 0;
        }
        v24 = -[AVTPresetStore setPreset:forCategory:]((char *)v18->_presetStore, v9, a4);
        for (unint64_t i = 0; i != 40; ++i)
        {
          if (((unint64_t)v24 >> i))
          {
            id v26 = -[AVTPresetStore resolvedPresetForCategory:]((id *)&v18->_presetStore->super.isa, i);
            v27 = v26;
            if (v26)
            {
              BOOL v28 = v26 == v9 && v5;
              [v26 applyPresetByChangingComponentsOfMemoji:v18 animated:v28];
              [(AVTMemoji *)v18 _applyAllColorPresetsForCategory:i];
            }
            else
            {
              uint64_t v29 = AVTPresetCategoryToComponentType(i);
              if (v29 != 42) {
                [(AVTMemoji *)v18 removeComponentWithType:v29];
              }
            }
          }
        }
      }
    }

    objc_sync_exit(v18);
  }
}

- (id)presetForCategory:(int64_t)a3
{
  return -[AVTPresetStore presetForCategory:]((id *)&self->_presetStore->super.isa, a3);
}

- (id)resolvedPresetForCategory:(int64_t)a3
{
  return -[AVTPresetStore resolvedPresetForCategory:]((id *)&self->_presetStore->super.isa, a3);
}

- (void)morphTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0;
  id v9 = v4;
  do
  {
    v6 = [v4 presetForCategory:v5];
    [(AVTMemoji *)self setPreset:v6 forCategory:v5 animated:1];

    for (uint64_t i = 0; i != 3; ++i)
    {
      id v8 = [v9 colorPresetForCategory:v5 colorIndex:i];
      [(AVTMemoji *)self setColorPreset:v8 forCategory:v5 colorIndex:i];
    }
    ++v5;
    id v4 = v9;
  }
  while (v5 != 40);
}

- (void)addComponentAssetNode:(id)a3 toNode:(id)a4 forBodyParts:(unint64_t)a5
{
  id v9 = a3;
  [a4 addChildNode:v9];
  [(AVTAvatar *)self addCustomBehavioursInHierarchy:v9 forBodyParts:a5];
  componentAssetNodeObservationForStickerBlock = (void (**)(id, AVTMemoji *, id, void))self->_componentAssetNodeObservationForStickerBlock;
  if (componentAssetNodeObservationForStickerBlock) {
    componentAssetNodeObservationForStickerBlock[2](componentAssetNodeObservationForStickerBlock, self, v9, 0);
  }
}

- (void)removeComponentAssetNodeFromParentNode:(id)a3 forBodyParts:(unint64_t)a4
{
  id v6 = a3;
  componentAssetNodeObservationForStickerBlock = (void (**)(id, AVTMemoji *, id, uint64_t))self->_componentAssetNodeObservationForStickerBlock;
  id v8 = v6;
  if (componentAssetNodeObservationForStickerBlock)
  {
    componentAssetNodeObservationForStickerBlock[2](componentAssetNodeObservationForStickerBlock, self, v6, 1);
    id v6 = v8;
  }
  [v6 removeFromParentNode];
  [(AVTAvatar *)self removeCustomBehavioursInHierarchy:v8 forBodyParts:a4];
}

- (double)skinTextureSize
{
  if (skinTextureSize_onceToken != -1) {
    dispatch_once(&skinTextureSize_onceToken, &__block_literal_global_244);
  }
  return 1024.0;
}

void __28__AVTMemoji_skinTextureSize__block_invoke()
{
  id v0 = [MEMORY[0x263F1C5C0] currentDevice];
  [v0 userInterfaceIdiom];
}

- (CGImage)createSkinAO
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  [(AVTMemoji *)self skinTextureSize];
  double v4 = v3;
  uint64_t v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
  id v6 = CGBitmapContextCreate(0, (unint64_t)v4, (unint64_t)v4, 8uLL, 4 * (unint64_t)v4, v5, 5u);
  CGColorSpaceRelease(v5);
  CGContextSetRGBFillColor(v6, 1.0, 1.0, 1.0, 1.0);
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  v29.size.width = v4;
  v29.size.height = v4;
  CGContextFillRect(v6, v29);
  uint64_t v21 = [(AVTMemoji *)self componentWithType:7];

  for (uint64_t i = 0; i != 42; ++i)
  {
    if (i != 5 || !v21)
    {
      id v8 = [(AVTMemoji *)self componentWithType:i];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v22 = v8;
      id v9 = [v8 assets];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v24;
        do
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = [*(id *)(*((void *)&v23 + 1) + 8 * j) ambientOcclusion];
            if (v14)
            {
              CFURLRef v15 = [NSURL fileURLWithPath:v14 isDirectory:0];
              uint64_t v16 = CGImageSourceCreateWithURL(v15, 0);

              if (v16)
              {
                CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v16, 0, 0);
                if (ImageAtIndex)
                {
                  long long v18 = ImageAtIndex;
                  CGContextSetBlendMode(v6, kCGBlendModeDarken);
                  v30.origin.x = 0.0;
                  v30.origin.y = 0.0;
                  v30.size.width = v4;
                  v30.size.height = v4;
                  CGContextDrawImage(v6, v30, v18);
                  CGImageRelease(v18);
                }
                CFRelease(v16);
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v11);
      }
    }
  }
  Image = CGBitmapContextCreateImage(v6);
  CGContextRelease(v6);
  return Image;
}

- (void)updateSkinMaterial:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v36 = a3;
  if (!self->_aoValid)
  {
    [(AVTMemoji *)self _updateAO];
    self->_aoValid = 1;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  double v4 = [(SCNNode *)self->_headNode geometry];
  uint64_t v5 = [v4 materials];

  obuint64_t j = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v39 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v10 = +[AVTResourceLocator sharedResourceLocator]();
        uint64_t v11 = -[AVTResourceLocator pathForMemojiResource:ofType:inDirectory:isDirectory:](v10, @"lips_MASK", @"heic", @"textures", 0);
        uint64_t v12 = [v9 multiply];
        [v12 setContents:v11];

        uint64_t v13 = [(AVTMemoji *)self facialhairColor];
        [v9 setValue:v13 forKey:@"facialhair_color"];

        uint64_t v14 = [(AVTMemoji *)self hairColor];
        [v9 setValue:v14 forKey:@"hair_color"];

        CFURLRef v15 = [(AVTMemoji *)self lipsColor];
        [v9 setValue:v15 forKey:@"lipstick_color"];

        uint64_t v16 = [(AVTMemoji *)self eyebrowsColor];
        [v9 setValue:v16 forKey:@"brow_color"];

        uint64_t v17 = [(AVTMemoji *)self componentWithType:5];
        [v17 textureAssetPresence];
        unsigned int v41 = v18;

        uint64_t v19 = [(AVTMemoji *)self componentWithType:3];
        [v19 textureAssetPresence];
        unsigned int v40 = v20;

        uint64_t v21 = [(AVTMemoji *)self componentWithType:1];
        [v21 textureAssetPresence];

        id v22 = [(AVTMemoji *)self componentWithType:31];
        long long v23 = [v22 materialAtIndex:0];
        long long v24 = [v23 additionalPropertyColors];
        long long v25 = [v24 objectForKeyedSubscript:@"lips_presence"];

        if (v25)
        {
          long long v26 = objc_msgSend(MEMORY[0x263F08D40], "avt_valueWithFloat4_usableWithKVCForSCNVector4:", COERCE_DOUBLE(__PAIR64__(v40, v41)));
          [v9 setValue:v26 forKey:@"hairBeardBrows_presence"];

          uint64_t v28 = objc_msgSend(MEMORY[0x263F08D40], "avt_valueWithFloat4_usableWithKVCForSCNVector4:", AVTGetColorComponents(v25, v27));
          CGRect v29 = v9;
          CGRect v30 = v28;
          uint64_t v31 = @"lips_presence";
        }
        else
        {
          v32 = [(AVTMemoji *)self colorPresetForCategory:10];
          [v32 variation];

          uint64_t v28 = objc_msgSend(MEMORY[0x263F08D40], "avt_valueWithFloat4_usableWithKVCForSCNVector4:", COERCE_DOUBLE(__PAIR64__(v40, v41)));
          CGRect v29 = v9;
          CGRect v30 = v28;
          uint64_t v31 = @"hairBeardBrowLips_presence";
        }
        [v29 setValue:v30 forKey:v31];

        id v33 = [(AVTMemoji *)self componentWithType:28];
        uint64_t v34 = [v33 materialAtIndex:0];
        v35 = [v34 additionalPropertyColors];
        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = __32__AVTMemoji_updateSkinMaterial___block_invoke;
        v42[3] = &unk_26401FCA0;
        v42[4] = v9;
        [v35 enumerateKeysAndObjectsUsingBlock:v42];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v7);
  }
}

void __32__AVTMemoji_updateSkinMaterial___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) valueForKey:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v8 = AVTGetColorComponents(v5, v7);
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = objc_msgSend(MEMORY[0x263F08D40], "avt_valueWithFloat4:", v8);
    [v9 setValue:v10 forKeyPath:v11];
  }
}

- (void)updateEyeLashes
{
  uint64_t v14 = self->_eyelashes;
  double v3 = [(AVTComponentInstance *)self->_componentInstances[2] assetImage];
  if (v3)
  {
    [(SCNNode *)v14 setHidden:0];
    double v4 = [(SCNNode *)v14 geometry];
    id v5 = [v4 firstMaterial];
    uint64_t v6 = [v5 transparent];
    [v6 setContents:v3];

    uint64_t v7 = [(AVTMemoji *)self componentWithType:2];
    double v8 = [v7 materialAtIndex:0];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 baseColor];
      id v11 = [(SCNNode *)v14 geometry];
      uint64_t v12 = [v11 firstMaterial];
      uint64_t v13 = [v12 diffuse];
      [v13 setContents:v10];
    }
  }
  else
  {
    [(SCNNode *)v14 setHidden:1];
  }
}

- (void)updateHighlightsForComponentType:(int64_t)a3
{
  if (a3 == 11)
  {
    uint64_t v5 = 5;
    uint64_t v6 = 15;
  }
  else
  {
    if (a3 != 12) {
      -[AVTMemoji updateHighlightsForComponentType:]();
    }
    uint64_t v5 = 3;
    uint64_t v6 = 16;
  }
  uint64_t v7 = [(AVTComponentInstance *)self->_componentInstances[v5] assetNode];
  if (v7)
  {
    double v8 = self->_colorPresets[v6][0];
    id v9 = [(AVTColorPreset *)v8 makeMaterial];
    uint64_t v10 = [v9 baseColor];
    id v11 = v10;
    long long v26 = v8;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x263F1C550] colorWithRed:0.803921569 green:0.803921569 blue:0.803921569 alpha:1.0];
    }
    uint64_t v13 = v12;

    id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    CFURLRef v15 = [v9 additionalPropertyColors];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __46__AVTMemoji_updateHighlightsForComponentType___block_invoke;
    v33[3] = &unk_26401FCA0;
    id v16 = v14;
    id v34 = v16;
    [v15 enumerateKeysAndObjectsUsingBlock:v33];

    uint64_t v17 = self->_components[v5];
    unsigned int v18 = self->_componentInstances[a3];
    uint64_t v19 = -[AVTPresetStore presetForCategory:]((id *)&self->_presetStore->super.isa, v6);
    unsigned int v20 = [v19 identifier];
    char v21 = [v20 isEqualToString:@"none"];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __46__AVTMemoji_updateHighlightsForComponentType___block_invoke_2;
    v27[3] = &unk_2640211C0;
    char v32 = v21 ^ 1;
    uint64_t v28 = v17;
    CGRect v29 = v18;
    id v30 = v13;
    id v31 = v16;
    id v22 = v16;
    id v23 = v13;
    long long v24 = v18;
    long long v25 = v17;
    [v7 enumerateHierarchyUsingBlock:v27];
  }
}

void __46__AVTMemoji_updateHighlightsForComponentType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(MEMORY[0x263F08D40], "avt_valueWithFloat4:", AVTGetColorComponents(a3, v6));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
}

void __46__AVTMemoji_updateHighlightsForComponentType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v35 = a2;
  double v3 = [v35 geometry];
  double v4 = [v3 materials];

  if (*(unsigned char *)(a1 + 64))
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v5 = [*(id *)(a1 + 32) assets];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v51 objects:v58 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      obuint64_t j = v4;
      uint64_t v8 = *(void *)v52;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v52 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          id v11 = [v35 name];
          id v12 = [v10 identifier];
          int v13 = [v11 isEqualToString:v12];

          if (v13)
          {
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v14 = obj;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v47 objects:v57 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v48;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v48 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v19 = *(void **)(*((void *)&v47 + 1) + 8 * j);
                  unsigned int v20 = [*(id *)(a1 + 40) assetImageForAsset:v10];
                  char v21 = [v19 emission];
                  [v21 setContents:v20];
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v47 objects:v57 count:16];
              }
              while (v16);
            }

            goto LABEL_19;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v51 objects:v58 count:16];
        if (v7) {
          continue;
        }
        break;
      }
LABEL_19:
      double v4 = obj;
    }
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v5 = v4;
    uint64_t v22 = [v5 countByEnumeratingWithState:&v43 objects:v56 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v44;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v44 != v24) {
            objc_enumerationMutation(v5);
          }
          long long v26 = [*(id *)(*((void *)&v43 + 1) + 8 * k) emission];
          [v26 setContents:0];
        }
        uint64_t v23 = [v5 countByEnumeratingWithState:&v43 objects:v56 count:16];
      }
      while (v23);
    }
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obja = v4;
  uint64_t v27 = [obja countByEnumeratingWithState:&v39 objects:v55 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v40;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(obja);
        }
        id v31 = *(void **)(*((void *)&v39 + 1) + 8 * m);
        uint64_t v32 = *(void *)(a1 + 48);
        id v33 = [v31 selfIllumination];
        [v33 setContents:v32];

        id v34 = *(void **)(a1 + 56);
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __46__AVTMemoji_updateHighlightsForComponentType___block_invoke_3;
        v38[3] = &unk_264021198;
        v38[4] = v31;
        [v34 enumerateKeysAndObjectsUsingBlock:v38];
      }
      uint64_t v28 = [obja countByEnumeratingWithState:&v39 objects:v55 count:16];
    }
    while (v28);
  }
}

uint64_t __46__AVTMemoji_updateHighlightsForComponentType___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forKey:a2];
}

- (void)_updateAO
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  unsigned int v20 = [(SCNNode *)self->_headComponentContainer childNodeWithName:@"head" recursively:1];
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__6;
  id v33 = __Block_byref_object_dispose__6;
  id v34 = 0;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __22__AVTMemoji__updateAO__block_invoke;
  v28[3] = &unk_26401F558;
  v28[4] = &v29;
  [v20 enumerateHierarchyUsingBlock:v28];
  id v2 = [(id)v30[5] ambientOcclusion];
  [v2 setContents:0];

  double v3 = [(id)v30[5] ambientOcclusion];
  [v3 setIntensity:1.5];

  uint64_t v22 = [(AVTMemoji *)self componentWithType:7];

  int v4 = 0;
  id v5 = 0;
  for (uint64_t i = 0; i != 42; ++i)
  {
    if (i != 5 || !v22)
    {
      uint64_t v7 = [(AVTMemoji *)self componentWithType:i];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v23 = v7;
      uint64_t v8 = [v7 assets];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v35 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v25;
        while (2)
        {
          for (uint64_t j = 0; j != v9; ++j)
          {
            if (*(void *)v25 != v10) {
              objc_enumerationMutation(v8);
            }
            id v12 = [*(id *)(*((void *)&v24 + 1) + 8 * j) ambientOcclusion];
            int v13 = v12;
            if (v12)
            {
              id v14 = v12;

              if (v4 > 0)
              {

                id v5 = (CGImage *)v14;
                ++v4;
                goto LABEL_16;
              }
              id v5 = (CGImage *)v14;
              ++v4;
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v35 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
  }
  if (v4 > 1)
  {
    uint64_t v15 = [(AVTMemoji *)self createSkinAO];
    self->_combinedAOImage = v15;
    uint64_t v16 = v15;

    id v5 = v16;
  }
  if (v5)
  {
    uint64_t v17 = [(id)v30[5] ambientOcclusion];
    [v17 setContents:v5];
  }
  else
  {
    unsigned int v18 = +[AVTResourceLocator sharedResourceLocator]();
    uint64_t v17 = -[AVTResourceLocator pathForMemojiResource:ofType:inDirectory:isDirectory:](v18, @"head_AO", @"heic", @"textures", 0);

    uint64_t v19 = [(id)v30[5] ambientOcclusion];
    [v19 setContents:v17];
  }
  _Block_object_dispose(&v29, 8);
}

void __22__AVTMemoji__updateAO__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  id v5 = [v10 geometry];

  if (v5)
  {
    uint64_t v6 = [v10 geometry];
    uint64_t v7 = [v6 firstMaterial];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a3 = 1;
  }
}

- (void)update
{
  if (self->_needsUpdate)
  {
    p_updateLocuint64_t k = &self->_updateLock;
    os_unfair_lock_lock(&self->_updateLock);
    if (self->_needsUpdate)
    {
      [(AVTMemoji *)self _update];
      [(AVTMemoji *)self rebuildSpecializationSettings];
    }
    os_unfair_lock_unlock(p_updateLock);
  }
}

- (void)setInstance:(id)a3 forComponentType:(int64_t)a4
{
  id v10 = a3;
  uint64_t v7 = self->_componentInstances[a4];
  uint64_t v8 = AVTAvatarBodyPartForComponentType(a4);
  uint64_t v9 = [(AVTComponentInstance *)v7 assetNode];
  [(AVTMemoji *)self removeComponentAssetNodeFromParentNode:v9 forBodyParts:v8];

  objc_storeStrong((id *)&self->_componentInstances[a4], a3);
  if (-[AVTComponentInstance has2DAsset](v7, "has2DAsset") || [v10 has2DAsset]) {
    self->_compositorComponentDirtyMask |= 1 << a4;
  }
  if ((unint64_t)a4 <= 8)
  {
    if (((1 << a4) & 0x3A) != 0)
    {
      if (!-[AVTComponentInstance has3DAsset](v7, "has3DAsset") && ![v10 has3DAsset]) {
        goto LABEL_11;
      }
    }
    else if (((1 << a4) & 0x1C0) == 0)
    {
      goto LABEL_11;
    }
    [(AVTMemoji *)self _invalidateAOImage];
  }
LABEL_11:
}

- (BOOL)_addTorsoComponentInstanceIfNeeded
{
  torsoNode = self->_torsoNode;
  if (!torsoNode)
  {
    components = self->_components;
    id v5 = self->_components[34];
    if (!v5)
    {
      uint64_t v6 = avt_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(AVTMemoji *)v6 _addTorsoComponentInstanceIfNeeded];
      }
    }
    id v14 = [[AVTComponentInstance alloc] initWithComponent:v5 assetResourceCache:self->_resourceCache];
    [(AVTMemoji *)self setInstance:v14 forComponentType:34];
    uint64_t v15 = [(AVTComponentInstance *)v14 assetNode];
    uint64_t v16 = self->_torsoNode;
    self->_torsoNode = v15;

    [(AVTMemoji *)self addComponentAssetNode:self->_torsoNode toNode:self->_bodyComponentContainer forBodyParts:2];
    [(AVTAvatar *)self resetPresentationConfigurationBehavioursInHierarchy:self->_torsoNode forBodyParts:2];
    uint64_t v17 = [(AVTComponent *)components[28] materialAtIndex:0];
    [(AVTComponent *)v5 setMaterial:v17 atIndex:0];
    [(AVTMemoji *)self componentMaterialDidUpdate:v5];
    bodyComponentContainer = self->_bodyComponentContainer;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __47__AVTMemoji__addTorsoComponentInstanceIfNeeded__block_invoke;
    v20[3] = &unk_26401F2B0;
    v20[4] = self;
    [(SCNNode *)bodyComponentContainer enumerateChildNodesUsingBlock:v20];
    [(AVTMemoji *)self _didInstantiateLazyComponentInstanceOfType:34 assetNode:self->_torsoNode];
  }
  return torsoNode == 0;
}

void __47__AVTMemoji__addTorsoComponentInstanceIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 336);
  id v3 = [a2 skinner];
  [v3 setSkeleton:v2];
}

- (id)_wrapDeformerDriverInfoForComponentType:(int64_t)a3
{
  if (a3 == 7)
  {
    uint64_t v3 = 352;
  }
  else
  {
    if (a3 != 35)
    {
      id v8 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 344;
  }
  int v4 = (void **)((char *)&self->super.super.isa + v3);
  id v5 = *(Class *)((char *)&self->super.super.isa + v3);
  if (!v5)
  {
    uint64_t v6 = objc_alloc_init(AVTMemojiWrapDeformerDriverInfo);
    uint64_t v7 = *v4;
    *int v4 = v6;

    id v5 = *v4;
  }
  id v8 = v5;
LABEL_9:
  return v8;
}

- (id)wrapDeformedDriverNamed:(id)a3 forComponentType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(AVTMemoji *)self _wrapDeformerDriverInfoForComponentType:a4];
  id v8 = (id *)v7;
  if (v7)
  {
    uint64_t v9 = [*(id *)(v7 + 8) objectForKeyedSubscript:v6];
    if (!v9)
    {
      uint64_t v10 = [NSString stringWithFormat:@"%@/%@.aa/main.scnz", @"drivers", v6];
      +[AVTResourceLocator sharedResourceLocator]();
      uint64_t v11 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = -[AVTResourceLocator urlForMemojiAssetAtPath:isDirectory:](v11, (uint64_t)v10, 0);

      id v33 = 0;
      uint64_t v9 = objc_msgSend(MEMORY[0x263F16AD8], "avt_nodeNamed:forSceneAtURL:options:error:", v6, v12, 0, &v33);
      id v13 = v33;
      if (v13)
      {
        id v14 = avt_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[AVTMemoji initWithDescriptor:usageIntent:error:](v12, v13);
        }
      }
      if (!v9)
      {
        uint64_t v15 = avt_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[AVTMemoji wrapDeformedDriverNamed:forComponentType:](v15, v16, v17, v18, v19, v20, v21, v22);
        }
      }
      [v9 setHidden:1];
      [v9 removeFromParentNode];
      [(SCNNode *)self->_bodyComponentContainer addChildNode:v9];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __54__AVTMemoji_wrapDeformedDriverNamed_forComponentType___block_invoke;
      v32[3] = &unk_26401F2B0;
      v32[4] = self;
      [v9 enumerateChildNodesUsingBlock:v32];
      [v8[1] setObject:v9 forKeyedSubscript:v6];
      if ((unint64_t)[v8[1] count] >= 9)
      {
        uint64_t v23 = avt_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[AVTMemoji wrapDeformedDriverNamed:forComponentType:](v23, v24, v25, v26, v27, v28, v29, v30);
        }
      }
      [(AVTMemoji *)self _didInstantiateLazyComponentInstanceOfType:a4 assetNode:v9];
      if (a4 == 7) {
        [(AVTAvatar *)self updateBindingsOfNode:v9];
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void __54__AVTMemoji_wrapDeformedDriverNamed_forComponentType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 336);
  id v3 = [a2 skinner];
  [v3 setSkeleton:v2];
}

- (void)enumerateActiveWrapDeformerDriversForComponentType:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(AVTMemoji *)self _wrapDeformerDriverInfoForComponentType:a3];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = (void *)v7[2];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __75__AVTMemoji_enumerateActiveWrapDeformerDriversForComponentType_usingBlock___block_invoke;
    v10[3] = &unk_2640211E8;
    uint64_t v11 = v7;
    id v12 = v6;
    [v9 enumerateKeysAndObjectsUsingBlock:v10];
  }
}

void __75__AVTMemoji_enumerateActiveWrapDeformerDriversForComponentType_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  if ([a3 unsignedIntegerValue] == 1)
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v6];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)updateWrapDeformerIsActiveForComponentType:(int64_t)a3
{
  id v5 = -[AVTMemoji _wrapDeformerDriverInfoForComponentType:](self, "_wrapDeformerDriverInfoForComponentType:");
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)v5[1];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke;
    v25[3] = &unk_264021210;
    id v8 = v5;
    id v26 = v8;
    [v7 enumerateKeysAndObjectsUsingBlock:v25];
    uint64_t v9 = self->_componentInstances[a3];
    uint64_t v10 = [(AVTComponentInstance *)v9 assetNode];
    uint64_t v11 = v10;
    if (a3 == 35)
    {
      -[SCNNode simdConvertTransform:fromNode:](self->_bodyComponentContainer, "simdConvertTransform:fromNode:", self->_skeletonRootNode, *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48));
      objc_msgSend(v11, "setSimdTransform:");
      if ((self->_visibleBodyParts & 2) == 0) {
        goto LABEL_10;
      }
    }
    else if ((self->_visibleBodyParts & 2) == 0)
    {
      uint64_t v18 = 0;
      uint64_t v19 = &v18;
      uint64_t v20 = 0x2020000000;
      char v21 = 0;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_325;
      v17[3] = &unk_26401F558;
      v17[4] = &v18;
      [v10 enumerateHierarchyUsingBlock:v17];
      if (*((unsigned char *)v19 + 24)) {
        [(AVTMemoji *)self _applyMorphVariantsForLazyComponentInstanceOfType:a3 assetNode:v11];
      }
      _Block_object_dispose(&v18, 8);
      goto LABEL_10;
    }
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_300;
    v22[3] = &unk_264021238;
    v22[4] = self;
    int64_t v24 = a3;
    uint64_t v23 = v8;
    [v11 enumerateHierarchyUsingBlock:v22];

LABEL_10:
    id v12 = (void *)v6[1];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_2;
    v13[3] = &unk_264021260;
    id v14 = v8;
    uint64_t v15 = self;
    int64_t v16 = a3;
    [v12 enumerateKeysAndObjectsUsingBlock:v13];
  }
}

void __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:");
  int v4 = v3;
  if (v3 && [v3 unsignedIntegerValue] == 1) {
    id v5 = &unk_26C00C4C0;
  }
  else {
    id v5 = &unk_26C00C4D8;
  }
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v5 forKeyedSubscript:v6];
}

void __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_300(uint64_t a1, void *a2)
{
  v27[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [v3 geometry];

  if (v4)
  {
    id v5 = [v3 valueForUndefinedKey:@"wrapDeformerDriverName"];
    if (!v5)
    {
LABEL_22:

      goto LABEL_23;
    }
    id v6 = [*(id *)(a1 + 32) wrapDeformedDriverNamed:v5 forComponentType:*(void *)(a1 + 48)];
    if (!v6)
    {
      uint64_t v7 = avt_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_300_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
    uint64_t v15 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:v5];
    int64_t v16 = v15;
    if (v15)
    {
      uint64_t v17 = [v15 unsignedIntegerValue];
      if (v17 == 1003)
      {
        uint64_t v18 = &unk_26C00C4F0;
        goto LABEL_12;
      }
      if (v17 != 1000)
      {
LABEL_13:
        uint64_t v19 = [v3 postSkinningDeformers];

        if (!v19)
        {
          uint64_t v20 = [v6 childNodeWithName:@"innerLayer" recursively:1];
          char v21 = [v6 childNodeWithName:@"outerLayer" recursively:1];
          uint64_t v22 = [v3 valueForUndefinedKey:@"wrapDeformerParameters"];
          uint64_t v23 = (void *)[objc_alloc(MEMORY[0x263F16A48]) initWithInnerLayerNode:v20 outerLayerNode:v21 parameters:v22];
          v27[0] = v23;
          int64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
          [v3 setPostSkinningDeformers:v24];

          uint64_t v25 = [v3 morpher];
          if (v25 && (![v22 bindingMode] || *(void *)(a1 + 48) == 7))
          {
            [v3 setValue:v25 forUndefinedKey:@"wrapDeformeMorpherBackup"];
            [v3 setMorpher:0];
          }
          id v26 = [v3 skinner];
          if (v26)
          {
            [v3 setValue:v26 forUndefinedKey:@"wrapDeformeSkinnerBackup"];
            [v3 setSkinner:0];
          }
        }
        goto LABEL_22;
      }
    }
    uint64_t v18 = &unk_26C00C508;
LABEL_12:
    [*(id *)(*(void *)(a1 + 40) + 16) setObject:v18 forKeyedSubscript:v5];
    goto LABEL_13;
  }
LABEL_23:
}

void __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_325(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 postSkinningDeformers];

  if (v3)
  {
    [v6 setPostSkinningDeformers:0];
    int v4 = [v6 valueForUndefinedKey:@"wrapDeformeMorpherBackup"];
    if (v4)
    {
      [v6 setMorpher:v4];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
    id v5 = [v6 valueForUndefinedKey:@"wrapDeformeSkinnerBackup"];
    if (v5) {
      [v6 setSkinner:v5];
    }
  }
}

void __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v5];
  if (!v7)
  {
    uint64_t v8 = avt_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_2_cold_2(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  switch([v7 unsignedIntegerValue])
  {
    case 1000:
      goto LABEL_14;
    case 1001:
      [*(id *)(*(void *)(a1 + 32) + 16) setObject:&unk_26C00C538 forKeyedSubscript:v5];
      [*(id *)(a1 + 40) _didActivateLazyComponentInstanceOfType:*(void *)(a1 + 48) assetNode:v6];
      uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 2416);
      if (v16) {
        (*(void (**)(void))(v16 + 16))();
      }
      break;
    case 1002:
      uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 16);
      uint64_t v19 = &unk_26C00C538;
      goto LABEL_15;
    case 1003:
      [*(id *)(*(void *)(a1 + 32) + 16) setObject:&unk_26C00C538 forKeyedSubscript:v5];
      [*(id *)(a1 + 40) _willDeactivateLazyComponentInstanceOfType:*(void *)(a1 + 48) assetNode:v6];
      if (*(void *)(*(void *)(a1 + 40) + 2416)) {
        [*(id *)(*(void *)(a1 + 32) + 16) setObject:&unk_26C00C520 forKeyedSubscript:v5];
      }
LABEL_14:
      uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 16);
      uint64_t v19 = &unk_26C00C520;
LABEL_15:
      [v18 setObject:v19 forKeyedSubscript:v5];
      break;
    default:
      uint64_t v17 = avt_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_2_cold_1(v17);
      }

      break;
  }
}

- (void)_update
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  self->_needsUpdate = 0;
  componentDirtyMasuint64_t k = self->_componentDirtyMask;
  if (!componentDirtyMask)
  {
    id v32 = 0;
    id v78 = 0;
    goto LABEL_68;
  }
  if ((componentDirtyMask & 0x400000000) != 0)
  {
    unint64_t visibleBodyParts = self->_visibleBodyParts;
    [(SCNNode *)self->_bodyComponentContainer setHidden:(visibleBodyParts & 2) == 0];
    if ((visibleBodyParts & 2) != 0
      && [(AVTMemoji *)self _addTorsoComponentInstanceIfNeeded])
    {
      self->_componentDirtyMask |= 0x800000080uLL;
    }
    [(AVTMemoji *)self updateWrapDeformerIsActiveForComponentType:35];
    [(AVTMemoji *)self updateWrapDeformerIsActiveForComponentType:7];
    componentDirtyMasuint64_t k = self->_componentDirtyMask;
  }
  if ((componentDirtyMask & 0x2000000000) != 0)
  {
    unint64_t v5 = self->_visibleBodyParts;
    [(SCNNode *)self->_handsComponentContainer setHidden:(v5 & 4) == 0];
    if ((v5 & 4) != 0) {
      [(AVTMemoji *)self _addHandsComponentInstanceIfNeeded];
    }
  }
  id v77 = 0;
  unint64_t v6 = 0;
  uint64_t v76 = 0;
  do
  {
    if (v6 > 0x25 || ((1 << v6) & 0x2400000001) == 0) && ((self->_componentDirtyMask >> v6))
    {
      uint64_t v7 = AVTBodyRegionForComponentType(v6);
      if (v7 != 1 || self->_torsoNode)
      {
        uint64_t v8 = [(AVTMemoji *)self componentWithType:v6];
        if (v8) {
          uint64_t v9 = [[AVTComponentInstance alloc] initWithComponent:v8 assetResourceCache:self->_resourceCache];
        }
        else {
          uint64_t v9 = 0;
        }
        [(AVTMemoji *)self setInstance:v9 forComponentType:v6];
        if (v6 == 35)
        {
          uint64_t v10 = self->_components[8];
          uint64_t v11 = [(AVTComponent *)v10 morphVariant];
          int v12 = [v11 isEqualToString:@"variant_age_child"];

          double v13 = 0.0;
          if (v12) {
            [(AVTComponent *)v10 morphVariantIntensity];
          }
          [(AVTComponentInstance *)v9 setSkinnerVariantIntensity:self->_skeletonRootNode skeleton:v13];
        }
        uint64_t v14 = [(AVTComponentInstance *)v9 assetNode];
        if (!v14) {
          goto LABEL_36;
        }
        if (v6 != 28) {
          [(AVTComponentInstance *)v9 updateMaterialsWithComponent:v8];
        }
        if (v7 == 1)
        {
          [(AVTMemoji *)self addComponentAssetNode:v14 toNode:self->_bodyComponentContainer forBodyParts:2];
          [(AVTAvatar *)self resetPresentationConfigurationBehavioursInHierarchy:v14 forBodyParts:2];
          id v15 = v77;
          if (!v77)
          {
            id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
            id v77 = v15;
          }
        }
        else
        {
          if (v7)
          {
LABEL_35:
            [(AVTMemoji *)self updateWrapDeformerIsActiveForComponentType:v6];
LABEL_36:

            goto LABEL_13;
          }
          [(AVTMemoji *)self addComponentAssetNode:v14 toNode:self->_headComponentContainer forBodyParts:1];
          id v15 = v76;
          if (!v76)
          {
            id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
            uint64_t v76 = v15;
          }
        }
        [v15 addObject:v14];
        goto LABEL_35;
      }
    }
LABEL_13:
    ++v6;
  }
  while (v6 != 42);
  [(AVTMemoji *)self updateEyeLashes];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v16 = v76;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v101 objects:v110 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v102;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v102 != v19) {
          objc_enumerationMutation(v16);
        }
        [(AVTAvatar *)self updateBindingsOfNode:*(void *)(*((void *)&v101 + 1) + 8 * i)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v101 objects:v110 count:16];
    }
    while (v18);
  }

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v21 = v77;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v97 objects:v109 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v98;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v98 != v24) {
          objc_enumerationMutation(v21);
        }
        [(AVTAvatar *)self updateBindingsOfNode:*(void *)(*((void *)&v97 + 1) + 8 * j)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v97 objects:v109 count:16];
    }
    while (v23);
  }

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v26 = v16;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v93 objects:v108 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v94;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v94 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void **)(*((void *)&v93 + 1) + 8 * k);
        v92[0] = MEMORY[0x263EF8330];
        v92[1] = 3221225472;
        v92[2] = __20__AVTMemoji__update__block_invoke;
        v92[3] = &unk_26401F2B0;
        v92[4] = self;
        [v31 enumerateHierarchyUsingBlock:v92];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v93 objects:v108 count:16];
    }
    while (v28);
  }

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v32 = v21;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v88 objects:v107 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v89;
    do
    {
      for (uint64_t m = 0; m != v34; ++m)
      {
        if (*(void *)v89 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v88 + 1) + 8 * m);
        v87[0] = MEMORY[0x263EF8330];
        v87[1] = 3221225472;
        v87[2] = __20__AVTMemoji__update__block_invoke_2;
        v87[3] = &unk_26401F2B0;
        v87[4] = self;
        [v37 enumerateHierarchyUsingBlock:v87];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v88 objects:v107 count:16];
    }
    while (v34);
  }
  id v78 = v26;

  if ([(AVTAvatar *)self optimizeForSnapshot])
  {
    v38 = [(AVTComponentInstance *)self->_componentInstances[5] assetNode];
    objc_msgSend(v38, "avt_enableSubdivisionOnHierarchyWithQuality:animoji:", 0, 0);

    long long v39 = [(AVTComponentInstance *)self->_componentInstances[3] assetNode];
    objc_msgSend(v39, "avt_enableSubdivisionOnHierarchyWithQuality:animoji:", 0, 0);
  }
LABEL_68:
  uint64_t v40 = 0;
  currentPresetsForVariants = self->_currentPresetsForVariants;
  do
    [(AVTMemoji *)self unapplyVariantDependenciesForPreset:currentPresetsForVariants[v40++] dirtyComponents:self->_componentDirtyMask];
  while (v40 != 40);
  for (uint64_t n = 0; n != 40; ++n)
  {
    uint64_t v43 = -[AVTPresetStore resolvedPresetForCategory:]((id *)&self->_presetStore->super.isa, n);
    [(AVTMemoji *)self applyVariantDependenciesForPreset:v43 dirtyComponents:self->_componentDirtyMask];
    long long v44 = currentPresetsForVariants[n];
    currentPresetsForVariants[n] = (AVTPreset *)v43;
  }
  unint64_t v45 = self->_componentDirtyMask;
  if ((v45 & 0x820) != 0) {
    [(AVTMemoji *)self updateHighlightsForComponentType:11];
  }
  unsigned int v74 = v45;
  BOOL v49 = (v45 & 0x1008) == 0;
  long long v46 = v78;
  if (!v49) {
    [(AVTMemoji *)self updateHighlightsForComponentType:12];
  }
  [(AVTMemoji *)self updateSkinMaterial:self->_headComponentContainer];
  [(AVTCompositor *)self->_compositor componentDidChangeForTypes:self->_compositorComponentDirtyMask];
  componentAnimatedMasuint64_t k = self->_componentAnimatedMask;
  if ((self->_componentDirtyMask & ~componentAnimatedMask) != 0)
  {
    uint64_t v48 = 0;
    unint64_t v73 = ~componentAnimatedMask;
    unint64_t v75 = self->_componentAnimatedMask;
    do
    {
      BOOL v49 = ((1 << v48) & componentAnimatedMask) != 0 || (self->_componentDirtyMask & (1 << v48)) == 0;
      if (!v49)
      {
        long long v50 = self->_components[v48];
        long long v51 = [(AVTComponent *)v50 morphVariant];
        if (v51)
        {
          long long v52 = [(AVTMemoji *)self allAssetNodesForComponentType:v48];
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          uint64_t v53 = [v52 countByEnumeratingWithState:&v83 objects:v106 count:16];
          if (v53)
          {
            uint64_t v54 = v53;
            uint64_t v55 = *(void *)v84;
            do
            {
              for (iuint64_t i = 0; ii != v54; ++ii)
              {
                if (*(void *)v84 != v55) {
                  objc_enumerationMutation(v52);
                }
                uint64_t v57 = *(void *)(*((void *)&v83 + 1) + 8 * ii);
                [(AVTComponent *)v50 morphVariantIntensity];
                -[AVTMemoji updateMorphVariantsInNodeHierarchy:componentType:variant:weight:](self, "updateMorphVariantsInNodeHierarchy:componentType:variant:weight:", v57, v48, v51);
              }
              uint64_t v54 = [v52 countByEnumeratingWithState:&v83 objects:v106 count:16];
            }
            while (v54);
          }

          long long v46 = v78;
          componentAnimatedMasuint64_t k = v75;
        }
      }
      ++v48;
    }
    while (v48 != 42);
    [(AVTMemoji *)self updateBodyPoseForSkinnerVariantsWithDirtyComponents:self->_componentDirtyMask & v73];
    componentAnimatedMasuint64_t k = self->_componentAnimatedMask;
  }
  if (componentAnimatedMask)
  {
    [MEMORY[0x263F16B08] begin];
    [MEMORY[0x263F16B08] setAnimationDuration:0.25];
    for (juint64_t j = 0; jj != 42; ++jj)
    {
      unint64_t v59 = self->_componentDirtyMask;
      unint64_t v60 = self->_componentAnimatedMask;
      if ((v59 & (1 << jj)) != 0 && (v60 & (1 << jj)) != 0)
      {
        id v62 = self->_components[jj];
        v63 = [(AVTComponent *)v62 morphVariant];
        if (v63)
        {
          uint64_t v64 = [(AVTMemoji *)self allAssetNodesForComponentType:jj];
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          uint64_t v65 = [v64 countByEnumeratingWithState:&v79 objects:v105 count:16];
          if (v65)
          {
            uint64_t v66 = v65;
            uint64_t v67 = *(void *)v80;
            do
            {
              for (kuint64_t k = 0; kk != v66; ++kk)
              {
                if (*(void *)v80 != v67) {
                  objc_enumerationMutation(v64);
                }
                uint64_t v69 = *(void *)(*((void *)&v79 + 1) + 8 * kk);
                [(AVTComponent *)v62 morphVariantIntensity];
                -[AVTMemoji updateMorphVariantsInNodeHierarchy:componentType:variant:weight:](self, "updateMorphVariantsInNodeHierarchy:componentType:variant:weight:", v69, jj, v63);
              }
              uint64_t v66 = [v64 countByEnumeratingWithState:&v79 objects:v105 count:16];
            }
            while (v66);
          }

          long long v46 = v78;
        }

        unint64_t v60 = self->_componentAnimatedMask;
        unint64_t v59 = self->_componentDirtyMask;
      }
      [(AVTMemoji *)self updateBodyPoseForSkinnerVariantsWithDirtyComponents:v59 & v60];
    }
    [MEMORY[0x263F16B08] commit];
  }
  if (![(AVTAvatar *)self optimizeForSnapshot])
  {
    BOOL v70 = self->_componentInstances[7] && self->_componentInstances[5] != 0;
    if (((self->_componentInstances[5] != 0) & (v74 >> 5)) != 0 || self->_hairPhysicsShouldIgnoreUpperNodes != v70)
    {
      self->_hairPhysicsShouldIgnoreUpperNodes = v70;
      v71 = [(AVTComponentInstance *)self->_componentInstances[5] assetNode];
      if (v71)
      {
        uint64_t v72 = [(AVTMemoji *)self upperNodesIgnoredByDynamics];
        [(AVTAvatar *)self removeDynamicsInHierarchy:v71];
        [(AVTAvatar *)self addDynamicsInHierarchy:v71 ignoringUpperNodes:v72];
      }
    }
  }
  self->_componentDirtyMasuint64_t k = 0;
  self->_componentAnimatedMasuint64_t k = 0;
  self->_compositorComponentDirtyMasuint64_t k = 0;
}

void __20__AVTMemoji__update__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 336);
  id v3 = [a2 skinner];
  [v3 setSkeleton:v2];
}

void __20__AVTMemoji__update__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 336);
  id v3 = [a2 skinner];
  [v3 setSkeleton:v2];
}

- (id)upperNodesIgnoredByDynamics
{
  if (self->_hairPhysicsShouldIgnoreUpperNodes
    && ([(AVTComponentInstance *)self->_componentInstances[5] assetNode],
        (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v3 = (void *)v2;
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__AVTMemoji_upperNodesIgnoredByDynamics__block_invoke;
    v7[3] = &unk_26401F2B0;
    id v5 = v4;
    id v8 = v5;
    [v3 enumerateHierarchyUsingBlock:v7];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

void __40__AVTMemoji_upperNodesIgnoredByDynamics__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 morpher];

  if (v3) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (id)allBuiltinAssetNodes
{
  v5[2] = *MEMORY[0x263EF8340];
  headNode = self->_headNode;
  v5[0] = self->_eyesAndTongue;
  v5[1] = headNode;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  return v3;
}

- (id)builtinAssetNodesForComponentType:(int64_t)a3
{
  return [(AVTMemoji *)self _assetNodesForComponentType:a3 includingBuiltInAssetNodes:1 includingComponentAssetNode:0];
}

- (id)allAssetNodesForComponentType:(int64_t)a3
{
  return [(AVTMemoji *)self _assetNodesForComponentType:a3 includingBuiltInAssetNodes:1 includingComponentAssetNode:1];
}

- (id)_assetNodesForComponentType:(int64_t)a3 includingBuiltInAssetNodes:(BOOL)a4 includingComponentAssetNode:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  memset(v22, 0, sizeof(v22));
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  if (!a4) {
    goto LABEL_15;
  }
  if (a3 > 27)
  {
    switch(a3)
    {
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
        goto LABEL_4;
      case 34:
        torsoNode = self->_torsoNode;
        if (torsoNode) {
          goto LABEL_6;
        }
        break;
      case 35:
        goto LABEL_14;
      case 38:
      case 39:
      case 40:
      case 41:
        uint64_t v10 = self->_torsoNode;
        if (v10)
        {
          uint64_t v21 = 1;
          *(void *)&v22[0] = v10;
        }
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __96__AVTMemoji__assetNodesForComponentType_includingBuiltInAssetNodes_includingComponentAssetNode___block_invoke_2;
        v16[3] = &unk_264021288;
        v16[4] = &v18;
        v16[5] = v22;
        [(AVTMemoji *)self enumerateActiveWrapDeformerDriversForComponentType:35 usingBlock:v16];
        break;
      default:
        goto LABEL_15;
    }
    goto LABEL_15;
  }
  switch(a3)
  {
    case 2:
      uint64_t v8 = 320;
LABEL_5:
      torsoNode = *(SCNNode **)((char *)&self->super.super.isa + v8);
LABEL_6:
      uint64_t v21 = 1;
      *(void *)&v22[0] = torsoNode;
      break;
    case 7:
LABEL_14:
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __96__AVTMemoji__assetNodesForComponentType_includingBuiltInAssetNodes_includingComponentAssetNode___block_invoke;
      v17[3] = &unk_264021288;
      v17[4] = &v18;
      void v17[5] = v22;
      [(AVTMemoji *)self enumerateActiveWrapDeformerDriversForComponentType:a3 usingBlock:v17];
      break;
    case 8:
LABEL_4:
      uint64_t v8 = 296;
      goto LABEL_5;
  }
LABEL_15:
  if (v5)
  {
    uint64_t v11 = self->_componentInstances[a3];
    int v12 = [(AVTComponentInstance *)v11 assetNode];
    if (v12)
    {
      uint64_t v13 = v19[3];
      v19[3] = v13 + 1;
      *((void *)v22 + v13) = v12;
    }
  }
  if (v19[3])
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v22);
  }
  else
  {
    uint64_t v14 = 0;
  }
  _Block_object_dispose(&v18, 8);
  return v14;
}

uint64_t __96__AVTMemoji__assetNodesForComponentType_includingBuiltInAssetNodes_includingComponentAssetNode___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 40);
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  *(void *)(v2 + 8 * v4) = a2;
  return result;
}

uint64_t __96__AVTMemoji__assetNodesForComponentType_includingBuiltInAssetNodes_includingComponentAssetNode___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 40);
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  *(void *)(v2 + 8 * v4) = a2;
  return result;
}

- (id)_componentInstanceAssetNodesForDependencyOfType:(int64_t)a3 isAssetSpecific:(BOOL)a4
{
  if (a3 == 42) {
    -[AVTMemoji _componentInstanceAssetNodesForDependencyOfType:isAssetSpecific:]();
  }
  if (self->_componentInstances[a3])
  {
    uint64_t v4 = -[AVTMemoji allAssetNodesForComponentType:](self, "allAssetNodesForComponentType:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)_setMorphWeight:(float)a3 forDependencyVariant:(id)a4 ofType:(int64_t)a5 isAssetSpecific:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a4;
  uint64_t v11 = [(AVTMemoji *)self _componentInstanceAssetNodesForDependencyOfType:a5 isAssetSpecific:v6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v20 + 1) + 8 * v15);
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __73__AVTMemoji__setMorphWeight_forDependencyVariant_ofType_isAssetSpecific___block_invoke;
        v17[3] = &unk_2640212B0;
        float v19 = a3;
        id v18 = v10;
        [v16 enumerateHierarchyUsingBlock:v17];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }
}

void __73__AVTMemoji__setMorphWeight_forDependencyVariant_ofType_isAssetSpecific___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 morpher];
  if (v3)
  {
    id v4 = v3;
    [v3 setWeight:*(void *)(a1 + 32) forTargetNamed:*(float *)(a1 + 40)];
    uint64_t v3 = v4;
  }
}

- (void)_setVariantDependenciesEnabled:(BOOL)a3 forPreset:(id)a4 dirtyComponents:(unint64_t)a5
{
  id v8 = a4;
  uint64_t v9 = AVTPresetCategoryToComponentType([v8 category]);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __70__AVTMemoji__setVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke;
  v20[3] = &unk_2640212D8;
  void v20[5] = a5;
  v20[6] = v9;
  BOOL v21 = a3;
  v20[4] = self;
  [v8 enumerateVariantDependenciesOfKind:0 block:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __70__AVTMemoji__setVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_2;
  v18[3] = &unk_2640212D8;
  v18[4] = self;
  v18[5] = a5;
  v18[6] = v9;
  BOOL v19 = a3;
  [v8 enumerateVariantDependenciesOfKind:1 block:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __70__AVTMemoji__setVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_3;
  v16[3] = &unk_2640212D8;
  v16[4] = self;
  v16[5] = a5;
  void v16[6] = v9;
  BOOL v17 = a3;
  [v8 enumerateVariantDependenciesOfKind:2 block:v16];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__AVTMemoji__setVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_4;
  v11[3] = &unk_264021300;
  unint64_t v13 = a5;
  uint64_t v14 = v9;
  BOOL v15 = a3;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v10 enumerateVisibilityDependencies:v11];
}

void __70__AVTMemoji__setVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke(uint64_t a1, unint64_t a2, void *a3, float a4)
{
  id v10 = a3;
  uint64_t v7 = AVTPresetCategoryToComponentType(a2);
  unint64_t v8 = *(void *)(a1 + 40);
  if ((v8 >> *(void *)(a1 + 48)) & 1) != 0 || ((v8 >> v7))
  {
    double v9 = 0.0;
    if (*(unsigned char *)(a1 + 56)) {
      *(float *)&double v9 = a4;
    }
    [*(id *)(a1 + 32) _setMorphWeight:v10 forDependencyVariant:v7 ofType:0 isAssetSpecific:v9];
  }
}

void __70__AVTMemoji__setVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_2(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = AVTPresetCategoryToComponentType(a2);
  id v7 = *(id *)(*(void *)(a1 + 32) + 384 + 8 * v6);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 40);
  if ((v9 >> *(void *)(a1 + 48)) & 1) != 0 || ((v9 >> v6))
  {
    memset(v15, 0, sizeof(v15));
    id v10 = objc_msgSend(v7, "assets", 0);
    if ([v10 countByEnumeratingWithState:v15 objects:v16 count:16]
      && [**((id **)&v15[0] + 1) is2DAsset])
    {
      if (*(unsigned char *)(a1 + 56)) {
        uint64_t v11 = v5;
      }
      else {
        uint64_t v11 = 0;
      }
      id v12 = *(void **)(a1 + 32);
      id v13 = v11;
      uint64_t v14 = [v12 componentInstanceForType:v6];
      [v14 setImageVariant:v13];

      *(void *)(*(void *)(a1 + 32) + 2384) |= 1 << v6;
    }
  }
}

void __70__AVTMemoji__setVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_3(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = AVTPresetCategoryToComponentType(a2);
  id v7 = *(id *)(*(void *)(a1 + 32) + 384 + 8 * v6);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 40);
  if ((v9 >> *(void *)(a1 + 48)) & 1) != 0 || ((v9 >> v6))
  {
    memset(v15, 0, sizeof(v15));
    id v10 = objc_msgSend(v7, "assets", 0);
    if ([v10 countByEnumeratingWithState:v15 objects:v16 count:16]
      && [**((id **)&v15[0] + 1) is3DAsset])
    {
      if (*(unsigned char *)(a1 + 56)) {
        uint64_t v11 = v5;
      }
      else {
        uint64_t v11 = 0;
      }
      id v12 = *(void **)(a1 + 32);
      id v13 = v11;
      uint64_t v14 = [v12 componentInstanceForType:v6];
      [v14 setMaterialVariant:v13];
    }
  }
}

void __70__AVTMemoji__setVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_4(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = AVTPresetCategoryToComponentType(a2);
  id v7 = *(id *)(*(void *)(a1 + 32) + 384 + 8 * v6);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 48);
  if ((v9 >> *(void *)(a1 + 56)) & 1) != 0 || ((v9 >> v6))
  {
    memset(v15, 0, sizeof(v15));
    id v10 = objc_msgSend(v7, "assets", 0);
    if ([v10 countByEnumeratingWithState:v15 objects:v16 count:16]
      && [**((id **)&v15[0] + 1) is3DAsset])
    {
      if (*(unsigned char *)(a1 + 64)) {
        uint64_t v11 = v5;
      }
      else {
        uint64_t v11 = 0;
      }
      id v12 = *(void **)(a1 + 32);
      id v13 = v11;
      uint64_t v14 = [v12 componentInstanceForType:v6];
      objc_msgSend(v14, "setVisibilityRules:dictatedByCategory:", v13, objc_msgSend(*(id *)(a1 + 40), "category"));
    }
  }
}

- (void)_setAssetSpecificVariantDependenciesEnabled:(BOOL)a3 forPreset:(id)a4 dirtyComponents:(unint64_t)a5
{
  id v8 = a4;
  uint64_t v9 = AVTPresetCategoryToComponentType([v8 category]);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__AVTMemoji__setAssetSpecificVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke;
  v14[3] = &unk_264021328;
  v14[4] = self;
  v14[5] = a5;
  v14[6] = v9;
  BOOL v15 = a3;
  [v8 enumerateAssetSpecificVariantDependenciesOfKind:0 block:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__AVTMemoji__setAssetSpecificVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_2;
  v12[3] = &unk_264021328;
  v12[4] = self;
  v12[5] = a5;
  v12[6] = v9;
  BOOL v13 = a3;
  [v8 enumerateAssetSpecificVariantDependenciesOfKind:1 block:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__AVTMemoji__setAssetSpecificVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_3;
  v10[3] = &unk_264021328;
  void v10[4] = self;
  v10[5] = a5;
  v10[6] = v9;
  BOOL v11 = a3;
  [v8 enumerateAssetSpecificVariantDependenciesOfKind:2 block:v10];
}

void __83__AVTMemoji__setAssetSpecificVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = *(id *)(*(void *)(a1 + 32) + 384 + 8 * a2);
  unint64_t v10 = *(void *)(a1 + 40);
  if ((v10 >> *(void *)(a1 + 48)) & 1) != 0 || ((v10 >> a2))
  {
    id v22 = v9;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    BOOL v11 = objc_msgSend(v9, "assets", a2);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      while (2)
      {
        id v15 = v8;
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v18 = [v17 identifier];
          int v19 = [v18 isEqualToString:v7];

          if (v19)
          {
            id v8 = v15;
            if ([v17 is3DAsset])
            {
              LODWORD(v20) = 1.0;
              if (!*(unsigned char *)(a1 + 56)) {
                *(float *)&double v20 = 0.0;
              }
              [*(id *)(a1 + 32) _setMorphWeight:v15 forDependencyVariant:v21 ofType:1 isAssetSpecific:v20];
            }
            goto LABEL_16;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        id v8 = v15;
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    id v9 = v22;
  }
}

void __83__AVTMemoji__setAssetSpecificVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = *(id *)(*(void *)(a1 + 32) + 384 + 8 * a2);
  unint64_t v10 = *(void *)(a1 + 40);
  if ((v10 >> *(void *)(a1 + 48)) & 1) != 0 || ((v10 >> a2))
  {
    id v25 = v9;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    BOOL v11 = objc_msgSend(v9, "assets", a2);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      while (2)
      {
        id v15 = v8;
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v18 = [v17 identifier];
          int v19 = [v18 isEqualToString:v7];

          if (v19)
          {
            id v8 = v15;
            if ([v17 is2DAsset])
            {
              if (*(unsigned char *)(a1 + 56)) {
                double v20 = v15;
              }
              else {
                double v20 = 0;
              }
              uint64_t v21 = *(void **)(a1 + 32);
              id v22 = v20;
              long long v23 = [v21 componentInstanceForType:v24];
              [v23 setImageVariant:v22];

              *(void *)(*(void *)(a1 + 32) + 2384) |= 1 << v24;
            }
            goto LABEL_17;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
        id v8 = v15;
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    id v9 = v25;
  }
}

void __83__AVTMemoji__setAssetSpecificVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = *(id *)(*(void *)(a1 + 32) + 384 + 8 * a2);
  unint64_t v10 = *(void *)(a1 + 40);
  if ((v10 >> *(void *)(a1 + 48)) & 1) != 0 || ((v10 >> a2))
  {
    id v26 = v9;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    BOOL v11 = objc_msgSend(v9, "assets", a2);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      while (2)
      {
        id v15 = v8;
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v18 = [v17 identifier];
          int v19 = [v18 isEqualToString:v7];

          if (v19)
          {
            int v20 = [v17 is3DAsset];
            id v8 = v15;
            if (v20)
            {
              if (*(unsigned char *)(a1 + 56)) {
                uint64_t v21 = v15;
              }
              else {
                uint64_t v21 = 0;
              }
              id v22 = *(void **)(a1 + 32);
              id v23 = v21;
              uint64_t v24 = [v22 componentInstanceForType:v25];
              [v24 setMaterialVariant:v23];
            }
            goto LABEL_17;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
        id v8 = v15;
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    id v9 = v26;
  }
}

- (void)applyVariantDependenciesForPreset:(id)a3 dirtyComponents:(unint64_t)a4
{
  id v6 = a3;
  [(AVTMemoji *)self _setVariantDependenciesEnabled:1 forPreset:v6 dirtyComponents:a4];
  [(AVTMemoji *)self _setAssetSpecificVariantDependenciesEnabled:1 forPreset:v6 dirtyComponents:a4];
}

- (void)unapplyVariantDependenciesForPreset:(id)a3 dirtyComponents:(unint64_t)a4
{
  id v6 = a3;
  [(AVTMemoji *)self _setVariantDependenciesEnabled:0 forPreset:v6 dirtyComponents:a4];
  [(AVTMemoji *)self _setAssetSpecificVariantDependenciesEnabled:0 forPreset:v6 dirtyComponents:a4];
}

- (void)updateMorphVariantsInNodeHierarchy:(id)a3 componentType:(int64_t)a4 variant:(id)a5 weight:(float)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = AVTComponentTypeToString(a4);
  if (v12)
  {
    uint64_t v13 = [@"variant_" stringByAppendingString:v12];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __77__AVTMemoji_updateMorphVariantsInNodeHierarchy_componentType_variant_weight___block_invoke;
    v19[3] = &unk_26401F238;
    id v14 = v11;
    id v20 = v14;
    float v22 = a6;
    id v15 = v13;
    id v21 = v15;
    [v10 enumerateHierarchyUsingBlock:v19];
    if (a4 == 8)
    {
      id v16 = self->_componentInstances[35];
      int v17 = [v14 isEqualToString:@"variant_age_child"];
      double v18 = 0.0;
      if (v17) {
        *(float *)&double v18 = a6;
      }
      [(AVTComponentInstance *)v16 setSkinnerVariantIntensity:self->_skeletonRootNode skeleton:v18];
    }
  }
}

void __77__AVTMemoji_updateMorphVariantsInNodeHierarchy_componentType_variant_weight___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 morpher];
  id v4 = [v3 targets];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__AVTMemoji_updateMorphVariantsInNodeHierarchy_componentType_variant_weight___block_invoke_2;
  v6[3] = &unk_264021350;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  int v10 = *(_DWORD *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __77__AVTMemoji_updateMorphVariantsInNodeHierarchy_componentType_variant_weight___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = [a2 name];
  if ([v7 isEqualToString:*(void *)(a1 + 32)])
  {
    id v5 = *(void **)(a1 + 40);
    double v6 = *(float *)(a1 + 56);
  }
  else
  {
    if (![v7 hasPrefix:*(void *)(a1 + 48)]) {
      goto LABEL_6;
    }
    id v5 = *(void **)(a1 + 40);
    double v6 = 0.0;
  }
  [v5 setWeight:a3 forTargetAtIndex:v6];
LABEL_6:
}

- (id)effectiveMorphedNodeForTargetName:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"variant_"])
  {
    id v5 = [v4 componentsSeparatedByString:@"_"];
    double v6 = [v5 objectAtIndexedSubscript:1];
    unint64_t v7 = AVTPresetCategoryFromString(v6);
    if (v7 <= 0x27)
    {
      if (((1 << v7) & 0x1E81) != 0)
      {
        id v8 = &OBJC_IVAR___AVTMemoji__headNode;
LABEL_7:
        id v9 = *(id *)((char *)&self->super.super.isa + *v8);

        goto LABEL_10;
      }
      if (((1 << v7) & 0xF000000000) != 0)
      {
        id v8 = &OBJC_IVAR___AVTMemoji__torsoNode;
        goto LABEL_7;
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)AVTMemoji;
  id v9 = [(AVTAvatar *)&v11 effectiveMorphedNodeForTargetName:v4];
LABEL_10:

  return v9;
}

- (void)_applyMorphVariantsForLazyComponentInstanceOfType:(int64_t)a3 assetNode:(id)a4
{
  id v6 = a4;
  unint64_t v7 = 0;
  if (a3 > 34)
  {
    if (a3 != 35)
    {
      unint64_t v8 = 0;
      if (a3 != 37) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    if (a3 == 7)
    {
      unint64_t v8 = 0x3C000000180;
      unint64_t v7 = 0x400000004;
      goto LABEL_9;
    }
    unint64_t v8 = 0;
    if (a3 != 34) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0;
  unint64_t v8 = 0x3C000000100;
LABEL_9:
  for (uint64_t i = 0; i != 42; ++i)
  {
    if ((v8 >> i))
    {
      int v10 = self->_components[i];
      objc_super v11 = [(AVTComponent *)v10 morphVariant];
      if (v11)
      {
        [(AVTComponent *)v10 morphVariantIntensity];
        -[AVTMemoji updateMorphVariantsInNodeHierarchy:componentType:variant:weight:](self, "updateMorphVariantsInNodeHierarchy:componentType:variant:weight:", v6, i, v11);
      }
    }
  }
  for (uint64_t j = 0; j != 40; ++j)
  {
    if ((v7 >> j))
    {
      uint64_t v13 = -[AVTPresetStore resolvedPresetForCategory:]((id *)&self->_presetStore->super.isa, j);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __73__AVTMemoji__applyMorphVariantsForLazyComponentInstanceOfType_assetNode___block_invoke;
      v14[3] = &unk_264021378;
      unint64_t v16 = v8;
      id v15 = v6;
      [v13 enumerateVariantDependenciesOfKind:0 block:v14];
    }
  }
}

void __73__AVTMemoji__applyMorphVariantsForLazyComponentInstanceOfType_assetNode___block_invoke(uint64_t a1, unint64_t a2, void *a3, float a4)
{
  id v7 = a3;
  if ((*(void *)(a1 + 40) >> AVTPresetCategoryToComponentType(a2)))
  {
    unint64_t v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __73__AVTMemoji__applyMorphVariantsForLazyComponentInstanceOfType_assetNode___block_invoke_2;
    v9[3] = &unk_2640212B0;
    float v11 = a4;
    id v10 = v7;
    [v8 enumerateHierarchyUsingBlock:v9];
  }
}

void __73__AVTMemoji__applyMorphVariantsForLazyComponentInstanceOfType_assetNode___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 morpher];
  if (v3)
  {
    id v4 = v3;
    [v3 setWeight:*(void *)(a1 + 32) forTargetNamed:*(float *)(a1 + 40)];
    uint64_t v3 = v4;
  }
}

- (void)_willDeactivateLazyComponentInstanceOfType:(int64_t)a3 assetNode:(id)a4
{
}

void __66__AVTMemoji__willDeactivateLazyComponentInstanceOfType_assetNode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 morpher];
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = [v2 targets];
    uint64_t v4 = [v3 count];

    uint64_t v2 = v6;
    if (v4)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        [v6 setWeight:i forTargetAtIndex:0.0];
        uint64_t v2 = v6;
      }
    }
  }
}

- (void)updateMorphVariantsInStickerPropNodeHierarchy:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(AVTMemoji *)self componentForType:8];
  id v5 = [v4 morphVariant];
  if (v5)
  {
    [v4 morphVariantIntensity];
    -[AVTMemoji updateMorphVariantsInNodeHierarchy:componentType:variant:weight:](self, "updateMorphVariantsInNodeHierarchy:componentType:variant:weight:", v6, 8, v5);
  }
}

- (BOOL)showsBody
{
  return (LOBYTE(self->_visibleBodyParts) >> 1) & 1;
}

- (void)setShowsBody:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  [(AVTMemoji *)self setVisibleBodyParts:self->_visibleBodyParts & 0xFFFFFFFFFFFFFFFDLL | v3];
}

- (unint64_t)visibleBodyParts
{
  return self->_visibleBodyParts;
}

- (void)setVisibleBodyParts:(unint64_t)a3
{
  unint64_t visibleBodyParts = self->_visibleBodyParts;
  if (visibleBodyParts != (a3 | 1))
  {
    self->_unint64_t visibleBodyParts = a3 | 1;
    char v5 = visibleBodyParts ^ a3;
    if (((visibleBodyParts ^ a3) & 2) != 0)
    {
      self->_componentDirtyMask |= 0x400000000uLL;
      [(AVTMemoji *)self invalidate];
    }
    if ((v5 & 4) != 0)
    {
      self->_componentDirtyMask |= 0x2000000000uLL;
      [(AVTMemoji *)self invalidate];
    }
  }
}

- (id)bodyPose
{
  return self->_bodyPose;
}

- (void)setBodyPose:(id)a3
{
  char v5 = (AVTAvatarBodyPose *)a3;
  p_bodyPose = &self->_bodyPose;
  if (self->_bodyPose != v5)
  {
    unint64_t v8 = v5;
    objc_storeStrong((id *)p_bodyPose, a3);
    if (v8)
    {
      p_bodyPose = (AVTAvatarBodyPose **)[(AVTMemoji *)self updateBodyPoseForSkinnerVariantsWithDirtyComponents:-1];
    }
    else
    {
      id v7 = +[AVTAvatarBodyPose neutralPose];
      [v7 applyToBodySkeletonWithRootJoint:self->_skeletonRootNode ageBodyPoseVariantIntensity:0.0 shoulderWidthBodyPoseVariantIntensity:0.0];
    }
    char v5 = v8;
  }
  MEMORY[0x270F9A758](p_bodyPose, v5);
}

- (void)updateBodyPoseForSkinnerVariantsWithDirtyComponents:(unint64_t)a3
{
  if ((a3 & 0x4000000100) != 0)
  {
    id v11 = [(AVTMemoji *)self componentForType:8];
    [v11 bodyPoseVariantIntensity];
    int v6 = v5;
    id v7 = [(AVTMemoji *)self componentForType:38];
    [v7 bodyPoseVariantIntensity];
    LODWORD(v9) = v8;
    LODWORD(v10) = v6;
    [(AVTAvatarBodyPose *)self->_bodyPose applyToBodySkeletonWithRootJoint:self->_skeletonRootNode ageBodyPoseVariantIntensity:v10 shoulderWidthBodyPoseVariantIntensity:v9];
  }
}

- (void)rebuildSpecializationSettings
{
  unint64_t v16 = self->_specializationSettings;
  specializationSettings = self->_specializationSettings;
  self->_specializationSettings = 0;

  AVTMergeSpecializationSettings(self->_specializationSettings, self->_eyesAndTongueSpecializationSettings);
  uint64_t v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  int v5 = self->_specializationSettings;
  self->_specializationSettings = v4;

  for (uint64_t i = 0; i != 40; ++i)
  {
    id v7 = -[AVTPresetStore resolvedPresetForCategory:]((id *)&self->_presetStore->super.isa, i);
    int v8 = self->_specializationSettings;
    double v9 = [v7 specializationSettings];
    AVTMergeSpecializationSettings(v8, v9);
    double v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    id v11 = self->_specializationSettings;
    self->_specializationSettings = v10;
  }
  uint64_t v12 = [(NSDictionary *)v16 objectForKeyedSubscript:@"dynamics"];
  uint64_t v13 = [(NSDictionary *)self->_specializationSettings objectForKeyedSubscript:@"dynamics"];
  if (([v12 isEqualToDictionary:v13] & 1) == 0) {
    [(AVTAvatar *)self physicsSpecializationSettingsDidChange];
  }
  id v14 = [(NSDictionary *)v16 objectForKeyedSubscript:@"ARKit disabled blendshapes"];
  id v15 = [(NSDictionary *)self->_specializationSettings objectForKeyedSubscript:@"ARKit disabled blendshapes"];
  if (([v14 isEqualToArray:v15] & 1) == 0) {
    [(AVTAvatar *)self disabledBlendshapesSpecializationSettingsDidChange];
  }
}

- (id)specializationSettings
{
  return self->_specializationSettings;
}

- (id)stickerPhysicsStateIdentifier
{
  return @"memoji";
}

- (void)setComponentAssetNodeObservationForStickerBlock:(id)a3
{
  if (self->_componentAssetNodeObservationForStickerBlock != a3)
  {
    self->_componentAssetNodeObservationForStickerBlocuint64_t k = (id)MEMORY[0x210539A20](a3, a2);
    MEMORY[0x270F9A758]();
  }
}

- (void)addDerivedNodesMatchingStickerPattern:(id)a3 toArray:(id)a4 options:(unint64_t)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  uint64_t v25 = __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke;
  id v26 = &unk_2640213A0;
  long long v27 = &v33;
  long long v28 = &v29;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v10 = v8;
    v25((uint64_t)v24, v10);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      double v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v37 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v10);
            }
            v25((uint64_t)v24, *(void **)(*((void *)&v20 + 1) + 8 * i));
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v37 count:16];
        }
        while (v11);
      }
    }
    else
    {
      double v10 = avt_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AVTMemoji addDerivedNodesMatchingStickerPattern:toArray:options:](v10);
      }
    }
  }

  if (*((unsigned char *)v34 + 24))
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke_355;
    v17[3] = &unk_2640213F0;
    unint64_t v19 = a5;
    id v18 = v9;
    [(AVTMemoji *)self enumerateActiveWrapDeformerDriversForComponentType:35 usingBlock:v17];
  }
  if (*((unsigned char *)v30 + 24))
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke_3;
    v14[3] = &unk_2640213F0;
    unint64_t v16 = a5;
    id v15 = v9;
    [(AVTMemoji *)self enumerateActiveWrapDeformerDriversForComponentType:7 usingBlock:v14];
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

void __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = AVTComponentTypeToString(0x23uLL);
  int v4 = [v9 hasPrefix:v3];

  if (v4)
  {
    int v5 = (unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v6 = v9;
  }
  else
  {
    id v7 = AVTComponentTypeToString(7uLL);
    int v8 = [v9 hasPrefix:v7];

    int v6 = v9;
    if (!v8) {
      goto LABEL_6;
    }
    int v5 = (unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  unsigned char *v5 = 1;
LABEL_6:
}

void __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke_355(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke_2;
  v4[3] = &unk_2640213C8;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v5 = v3;
  [a2 enumerateHierarchyUsingBlock:v4];
}

void __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (AVTNodeMatchesHierarchyEnumerationOptions(v3, *(void *)(a1 + 40))) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke_3(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke_4;
  v4[3] = &unk_2640213C8;
  id v3 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v5 = v3;
  [a2 enumerateHierarchyUsingBlock:v4];
}

void __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (AVTNodeMatchesHierarchyEnumerationOptions(v3, *(void *)(a1 + 40))) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_componentAssetNodeObservationForStickerBlock, 0);
  objc_storeStrong((id *)&self->_specializationSettings, 0);
  objc_storeStrong((id *)&self->_bodyPose, 0);
  objc_storeStrong((id *)&self->_compositor, 0);
  for (uint64_t i = 119; i != -1; --i)
    objc_storeStrong((id *)&self->_colorPresets[0][i], 0);
  for (uint64_t j = 39; j != -1; --j)
    objc_storeStrong((id *)&self->_currentPresetsForVariants[j], 0);
  objc_storeStrong((id *)&self->_presetStore, 0);
  for (uint64_t k = 41; k != -1; --k)
    objc_storeStrong((id *)&self->_componentInstances[k], 0);
  for (uint64_t m = 41; m != -1; --m)
    objc_storeStrong((id *)&self->_components[m], 0);
  objc_storeStrong((id *)&self->_eyesAndTongueSpecializationSettings, 0);
  objc_storeStrong((id *)&self->_eyeMaterialRight, 0);
  objc_storeStrong((id *)&self->_eyeMaterialLeft, 0);
  objc_storeStrong((id *)&self->_headwearWrapDeformerDriverInfo, 0);
  objc_storeStrong((id *)&self->_outfitWrapDeformerDriverInfo, 0);
  objc_storeStrong((id *)&self->_skeletonRootNode, 0);
  objc_storeStrong((id *)&self->_eyesAndTongue, 0);
  objc_storeStrong((id *)&self->_eyelashes, 0);
  objc_storeStrong((id *)&self->_avatarNode, 0);
  objc_storeStrong((id *)&self->_torsoNode, 0);
  objc_storeStrong((id *)&self->_headNode, 0);
  objc_storeStrong((id *)&self->_handsComponentContainer, 0);
  objc_storeStrong((id *)&self->_bodyComponentContainer, 0);
  objc_storeStrong((id *)&self->_headComponentContainer, 0);
  objc_storeStrong((id *)&self->_resourceCache, 0);
}

- (void)initWithDescriptor:usageIntent:error:.cold.1()
{
  __assert_rtn("-[AVTMemoji initWithDescriptor:usageIntent:error:]", "AVTMemoji.m", 1061, "_eyesAndTongueSpecializationSettings != nil");
}

- (void)initWithDescriptor:(void *)a1 usageIntent:(void *)a2 error:.cold.2(void *a1, void *a2)
{
  id v3 = [a1 path];
  int v4 = [a2 description];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_20B819000, v5, v6, "Error: could not load scene at %@ with error: %@", v7, v8, v9, v10, v11);
}

- (void)_applyColorPresetForCategory:colorIndex:.cold.1()
{
}

- (void)colorPresetForCategory:colorIndex:.cold.2()
{
}

- (void)setColorPreset:forCategory:colorIndex:.cold.2()
{
}

- (void)setColorPreset:(unint64_t)a1 forCategory:(NSObject *)a2 colorIndex:.cold.3(unint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = AVTPresetCategoryToString(a1);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_20B819000, a2, OS_LOG_TYPE_ERROR, "Error: Unreachable code: nil is not a valid secondary/tertiary color for %@", (uint8_t *)&v4, 0xCu);
}

- (void)setPreset:(uint64_t)a3 forCategory:(uint64_t)a4 animated:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateHighlightsForComponentType:.cold.1()
{
}

- (void)_addTorsoComponentInstanceIfNeeded
{
}

- (void)wrapDeformedDriverNamed:(uint64_t)a3 forComponentType:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)wrapDeformedDriverNamed:(uint64_t)a3 forComponentType:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_300_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B819000, log, OS_LOG_TYPE_ERROR, "Error: Unreachable code: Internal consistency error", v1, 2u);
}

void __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_componentInstanceAssetNodesForDependencyOfType:isAssetSpecific:.cold.1()
{
  __assert_rtn("-[AVTMemoji _componentInstanceAssetNodesForDependencyOfType:isAssetSpecific:]", "AVTMemoji.m", 3074, "dependencyComponentType != AVTComponentTypeNone");
}

- (void)addDerivedNodesMatchingStickerPattern:(os_log_t)log toArray:options:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B819000, log, OS_LOG_TYPE_ERROR, "Error: Unreachable code: Unexpected pattern", v1, 2u);
}

@end