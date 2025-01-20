@interface AVTStickerConfiguration
+ (id)_availableStickerNamesForPuppetNamed:(id)a3 inStickerPack:(id)a4;
+ (id)_stickerConfigurationForPuppetNamed:(id)a3 inStickerPack:(id)a4 stickerName:(id)a5;
+ (id)_stickerConfigurationsForPuppetNamed:(id)a3 inStickerPack:(id)a4;
+ (id)allStickerPackNames;
+ (id)availableStickerNamesForMemojiInStickerPack:(id)a3;
+ (id)stickerConfigurationForMemojiInStickerPack:(id)a3 stickerName:(id)a4;
+ (id)stickerConfigurationsForAnimojiNamed:(id)a3;
+ (id)stickerConfigurationsForMemoji;
+ (id)stickerConfigurationsForMemojiInStickerPack:(id)a3;
+ (id)unavailableAnimojiNamesForStickerPack:(id)a3;
- (AVTAvatarBodyPose)bodyPose;
- (AVTAvatarPhysicalizedPose)physicalizedPose;
- (AVTAvatarPoseAnimation)poseAnimation;
- (AVTStickerCamera)camera;
- (AVTStickerConfiguration)initWithConfigDictionary:(id)a3 assetsPath:(id)a4 forStickerPack:(id)a5;
- (AVTStickerConfiguration)initWithConfigurationAtPath:(id)a3;
- (AVTStickerConfiguration)initWithConfigurationAtPath:(id)a3 forStickerPack:(id)a4;
- (AVTStickerConfiguration)initWithName:(id)a3 pose:(id)a4 bodyPose:(id)a5 props:(id)a6 shaders:(id)a7 camera:(id)a8 options:(id)a9;
- (AVTStickerConfiguration)initWithName:(id)a3 pose:(id)a4 props:(id)a5 shaders:(id)a6 camera:(id)a7 options:(id)a8;
- (AVTStickerConfiguration)initWithName:(id)a3 poseAnimation:(id)a4 bodyPose:(id)a5 props:(id)a6 shaders:(id)a7 camera:(id)a8 options:(id)a9;
- (BOOL)definesPoseOnly;
- (BOOL)hasLoadedFromConfiguration;
- (BOOL)hasProps;
- (BOOL)preRendered;
- (BOOL)showsBody;
- (CGSize)size;
- (NSArray)morpherOverrides;
- (NSArray)poseAdjustments;
- (NSArray)presetOverrides;
- (NSArray)props;
- (NSArray)shaderModifiers;
- (NSDictionary)configurationDictionary;
- (NSString)assetsPath;
- (NSString)emojiRepresentation;
- (NSString)localizedName;
- (NSString)name;
- (NSString)stickerPack;
- (id)description;
- (id)dictionaryWithTargetPath:(id)a3;
- (id)framingMode;
- (id)legacySizeOption;
- (unint64_t)stickerVersion;
- (void)_updateDictionary:(id)a3 withTargetPath:(id)a4;
- (void)loadIfNeeded;
- (void)setAssetsPath:(id)a3;
- (void)setBodyPose:(id)a3;
- (void)setCamera:(id)a3;
- (void)setConfigurationDictionary:(id)a3;
- (void)setHasLoadedFromConfiguration:(BOOL)a3;
- (void)setPhysicalizedPose:(id)a3;
- (void)setPoseAdjustments:(id)a3;
- (void)setProps:(id)a3;
- (void)setShaderModifiers:(id)a3;
- (void)setupOptions:(id)a3;
- (void)unload;
@end

@implementation AVTStickerConfiguration

+ (id)allStickerPackNames
{
  v4[5] = *MEMORY[0x263EF8340];
  v4[0] = @"stickers";
  v4[1] = @"stickersPrerelease";
  v4[2] = @"posesPack";
  v4[3] = @"posesPackPrerelease";
  v4[4] = @"memojiEditorThumbnails";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  return v2;
}

+ (id)stickerConfigurationsForMemoji
{
  return (id)[a1 _stickerConfigurationsForPuppetNamed:@"memoji" inStickerPack:@"stickers"];
}

+ (id)stickerConfigurationsForAnimojiNamed:(id)a3
{
  return (id)[a1 _stickerConfigurationsForPuppetNamed:a3 inStickerPack:@"stickers"];
}

+ (id)stickerConfigurationsForMemojiInStickerPack:(id)a3
{
  return (id)[a1 _stickerConfigurationsForPuppetNamed:@"memoji" inStickerPack:a3];
}

+ (id)_stickerConfigurationsForPuppetNamed:(id)a3 inStickerPack:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v19 = AVTPrecompiledStickerPackPlistForPuppetNamed(v6, a3);
  v7 = [v19 objectAtIndexedSubscript:1];
  id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = [*(id *)(*((void *)&v22 + 1) + 8 * i) stringByAppendingPathComponent:@"stickerConfiguration.json"];
        +[AVTResourceLocator sharedResourceLocator]();
        v13 = (id *)objc_claimAutoreleasedReturnValue();
        v14 = -[AVTResourceLocator urlForStickerResourceAtPath:isDirectory:](v13, (uint64_t)v12, 0);

        id v15 = objc_alloc((Class)a1);
        v16 = [v14 path];
        v17 = (void *)[v15 initWithConfigurationAtPath:v16 forStickerPack:v6];

        if (v17) {
          [v21 addObject:v17];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  return v21;
}

+ (id)stickerConfigurationForMemojiInStickerPack:(id)a3 stickerName:(id)a4
{
  return (id)[a1 _stickerConfigurationForPuppetNamed:@"memoji" inStickerPack:a3 stickerName:a4];
}

+ (id)_stickerConfigurationForPuppetNamed:(id)a3 inStickerPack:(id)a4 stickerName:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = AVTPrecompiledStickerPackPlistForPuppetNamed(v9, v8);
  v12 = [v11 objectAtIndexedSubscript:0];
  uint64_t v13 = [v12 indexOfObject:v10];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = avt_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v27 = v10;
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v8;
      _os_log_error_impl(&dword_20B819000, v14, OS_LOG_TYPE_ERROR, "Error: Failed to find sticker \"%@\" in pack \"%@\" for puppet named \"%@\"", buf, 0x20u);
    }

    id v15 = 0;
  }
  else
  {
    uint64_t v16 = v13;
    long long v25 = [v11 objectAtIndexedSubscript:1];
    v17 = [v25 objectAtIndexedSubscript:v16];
    v18 = [v17 stringByAppendingPathComponent:@"stickerConfiguration.json"];
    +[AVTResourceLocator sharedResourceLocator]();
    v19 = (id *)objc_claimAutoreleasedReturnValue();
    -[AVTResourceLocator urlForStickerResourceAtPath:isDirectory:](v19, (uint64_t)v18, 0);
    id v21 = v20 = v8;

    id v22 = objc_alloc((Class)a1);
    long long v23 = [v21 path];
    id v15 = (void *)[v22 initWithConfigurationAtPath:v23 forStickerPack:v9];

    id v8 = v20;
  }

  return v15;
}

+ (id)unavailableAnimojiNamesForStickerPack:(id)a3
{
  v3 = AVTPrecompiledStickerPackPlist(a3);
  v4 = [v3 objectForKeyedSubscript:@"unavailableAnimoji"];
  v5 = v4;
  if (!v4) {
    v4 = (void *)MEMORY[0x263EFFA68];
  }
  id v6 = v4;

  return v6;
}

+ (id)availableStickerNamesForMemojiInStickerPack:(id)a3
{
  return (id)[a1 _availableStickerNamesForPuppetNamed:@"memoji" inStickerPack:a3];
}

+ (id)_availableStickerNamesForPuppetNamed:(id)a3 inStickerPack:(id)a4
{
  v4 = AVTPrecompiledStickerPackPlistForPuppetNamed(a4, a3);
  v5 = [v4 objectAtIndexedSubscript:0];

  return v5;
}

- (AVTStickerConfiguration)initWithConfigurationAtPath:(id)a3
{
  return [(AVTStickerConfiguration *)self initWithConfigurationAtPath:a3 forStickerPack:@"stickers"];
}

- (AVTStickerConfiguration)initWithConfigurationAtPath:(id)a3 forStickerPack:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 stringByDeletingLastPathComponent];
  id v18 = 0;
  id v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6 options:8 error:&v18];
  id v10 = v18;
  if (!v9
    || (v11 = v10,
        id v17 = v10,
        [MEMORY[0x263F08900] JSONObjectWithData:v9 options:0 error:&v17],
        v12 = objc_claimAutoreleasedReturnValue(),
        id v13 = v17,
        v11,
        v13))
  {
    id v16 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488], @"Sticker Configuration could not be created, data not JSON or empty", 0 reason userInfo];
    objc_exception_throw(v16);
  }
  v14 = [(AVTStickerConfiguration *)self initWithConfigDictionary:v12 assetsPath:v8 forStickerPack:v7];

  return v14;
}

- (AVTStickerConfiguration)initWithConfigDictionary:(id)a3 assetsPath:(id)a4 forStickerPack:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 objectForKey:@"options"];
  id v13 = [v9 objectForKeyedSubscript:@"identifier"];
  if (!v13)
  {
    id v13 = [v10 lastPathComponent];
  }
  v14 = [(AVTStickerConfiguration *)self initWithName:v13 pose:0 bodyPose:0 props:0 shaders:0 camera:0 options:v12];
  id v15 = v14;
  if (v14)
  {
    v14->_hasLoadedFromConfiguration = 0;
    objc_storeStrong((id *)&v14->_configurationDictionary, a3);
    objc_storeStrong((id *)&v15->_assetsPath, a4);
    objc_storeStrong((id *)&v15->_stickerPack, a5);
  }

  return v15;
}

- (AVTStickerConfiguration)initWithName:(id)a3 poseAnimation:(id)a4 bodyPose:(id)a5 props:(id)a6 shaders:(id)a7 camera:(id)a8 options:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  id v22 = [a4 physicalizedPose];
  long long v23 = [(AVTStickerConfiguration *)self initWithName:v21 pose:v22 bodyPose:v20 props:v19 shaders:v18 camera:v17 options:v16];

  return v23;
}

- (AVTStickerConfiguration)initWithName:(id)a3 pose:(id)a4 props:(id)a5 shaders:(id)a6 camera:(id)a7 options:(id)a8
{
  return [(AVTStickerConfiguration *)self initWithName:a3 pose:a4 bodyPose:0 props:a5 shaders:a6 camera:a7 options:a8];
}

- (AVTStickerConfiguration)initWithName:(id)a3 pose:(id)a4 bodyPose:(id)a5 props:(id)a6 shaders:(id)a7 camera:(id)a8 options:(id)a9
{
  id v16 = a3;
  id v34 = a4;
  id v33 = a5;
  id v32 = a6;
  id v31 = a7;
  id v30 = a8;
  id v17 = a9;
  v35.receiver = self;
  v35.super_class = (Class)AVTStickerConfiguration;
  id v18 = [(AVTStickerConfiguration *)&v35 init];
  if (v18)
  {
    if (!v16)
    {
      id v19 = avt_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[AVTAnimoji initWithName:error:](v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    objc_storeStrong((id *)&v18->_name, a3);
    uint64_t v27 = AVTLocalizedStickerName(v16);
    localizedName = v18->_localizedName;
    v18->_localizedName = (NSString *)v27;

    objc_storeStrong((id *)&v18->_physicalizedPose, a4);
    objc_storeStrong((id *)&v18->_bodyPose, a5);
    objc_storeStrong((id *)&v18->_props, a6);
    objc_storeStrong((id *)&v18->_shaderModifiers, a7);
    objc_storeStrong((id *)&v18->_camera, a8);
    v18->_stickerVersion = 1;
    [(AVTStickerConfiguration *)v18 setupOptions:v17];
  }

  return v18;
}

- (id)framingMode
{
  if (self->_camera) {
    return 0;
  }
  else {
    return @"camera";
  }
}

- (BOOL)hasProps
{
  if ([(AVTStickerConfiguration *)self hasLoadedFromConfiguration]
    || ([(AVTStickerConfiguration *)self configurationDictionary],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    uint64_t v6 = [(NSArray *)self->_props count];
  }
  else
  {
    v4 = [(AVTStickerConfiguration *)self configurationDictionary];
    v5 = [v4 objectForKeyedSubscript:@"props"];

    uint64_t v6 = [v5 count];
  }
  return v6 != 0;
}

- (BOOL)showsBody
{
  if ([(AVTStickerConfiguration *)self hasLoadedFromConfiguration]
    || ([(AVTStickerConfiguration *)self configurationDictionary],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    bodyPose = self->_bodyPose;
  }
  else
  {
    v4 = [(AVTStickerConfiguration *)self configurationDictionary];
    bodyPose = [v4 objectForKeyedSubscript:@"body-pose"];
  }
  return bodyPose != 0;
}

- (BOOL)definesPoseOnly
{
  if ([(AVTStickerConfiguration *)self hasLoadedFromConfiguration]) {
    return ![(NSArray *)self->_props count] && self->_bodyPose == 0;
  }
  v3 = [(AVTStickerConfiguration *)self configurationDictionary];

  if (!v3)
  {
    return ![(NSArray *)self->_props count] && self->_bodyPose == 0;
  }
  else
  {
    v4 = [(AVTStickerConfiguration *)self configurationDictionary];
    v5 = [v4 objectForKeyedSubscript:@"props"];

    uint64_t v6 = [(AVTStickerConfiguration *)self configurationDictionary];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"body-pose"];

    BOOL v8 = ([v5 count] | v7) == 0;
  }
  return v8;
}

- (AVTAvatarPoseAnimation)poseAnimation
{
  v3 = [AVTAvatarPoseAnimation alloc];
  v4 = [(AVTAvatarPhysicalizedPose *)self->_physicalizedPose pose];
  v5 = [(AVTAvatarPhysicalizedPose *)self->_physicalizedPose physicsStates];
  uint64_t v6 = [(AVTAvatarPoseAnimation *)v3 initWithStaticPose:v4 staticPhysicsStates:v5];

  return v6;
}

- (void)setupOptions:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"size"];
  legacySizeOption = self->_legacySizeOption;
  self->_legacySizeOption = v5;

  if (self->_legacySizeOption && (setupOptions__done & 1) == 0)
  {
    setupOptions__done = 1;
    uint64_t v7 = avt_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AVTStickerConfiguration setupOptions:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  id v15 = [v4 valueForKey:@"presetOverrides"];
  v36 = v15;
  if ([v15 count])
  {
    id v35 = v4;
    id v16 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v15, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v42 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v23 = objc_msgSend(v17, "objectForKeyedSubscript:", v22, v35);
          uint64_t v24 = +[AVTStickerPresetOverride presetOverrideFromDictionary:v23 forCategoryName:v22];

          [(NSArray *)v16 addObject:v24];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v19);
    }

    presetOverrides = self->_presetOverrides;
    self->_presetOverrides = v16;

    id v4 = v35;
  }
  uint64_t v26 = objc_msgSend(v4, "valueForKey:", @"morpherOverrides", v35);
  if ([v26 count])
  {
    uint64_t v27 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v26, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v28 = v26;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v38 != v31) {
            objc_enumerationMutation(v28);
          }
          id v33 = +[AVTStickerMorpherOverride morpherOverrideFromDictionary:*(void *)(*((void *)&v37 + 1) + 8 * j)];
          [(NSArray *)v27 addObject:v33];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v30);
    }

    morpherOverrides = self->_morpherOverrides;
    self->_morpherOverrides = v27;

    id v15 = v36;
  }
}

- (NSString)emojiRepresentation
{
  return (NSString *)[(NSDictionary *)self->_configurationDictionary objectForKeyedSubscript:@"emoji"];
}

- (void)loadIfNeeded
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  if (![(AVTStickerConfiguration *)self hasLoadedFromConfiguration])
  {
    v3 = [(AVTStickerConfiguration *)self configurationDictionary];

    if (v3)
    {
      id v4 = self;
      objc_sync_enter(v4);
      if ([(AVTStickerConfiguration *)v4 hasLoadedFromConfiguration]
        || ([(AVTStickerConfiguration *)v4 configurationDictionary],
            v5 = objc_claimAutoreleasedReturnValue(),
            v5,
            !v5))
      {
LABEL_47:
        objc_sync_exit(v4);

        return;
      }
      uint64_t v6 = [(AVTStickerConfiguration *)v4 configurationDictionary];
      uint64_t v7 = [(AVTStickerConfiguration *)v4 assetsPath];
      uint64_t v8 = [(AVTStickerConfiguration *)v4 physicalizedPose];

      if (v8)
      {
LABEL_16:
        uint64_t v19 = [(AVTStickerConfiguration *)v4 bodyPose];
        BOOL v20 = v19 == 0;

        if (v20)
        {
          uint64_t v21 = [v6 objectForKeyedSubscript:@"body-pose"];
          if (v21)
          {
            uint64_t v22 = [[AVTAvatarBodyPose alloc] initWithDictionaryRepresentation:v21];
            [(AVTStickerConfiguration *)v4 setBodyPose:v22];
          }
        }
        uint64_t v23 = [(AVTStickerConfiguration *)v4 props];
        BOOL v24 = v23 == 0;

        if (v24)
        {
          uint64_t v25 = [v6 objectForKey:@"props"];
          uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v25, "count"));
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v27 = v25;
          uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:v58 count:16];
          if (v28)
          {
            uint64_t v29 = *(void *)v51;
            do
            {
              uint64_t v30 = 0;
              do
              {
                if (*(void *)v51 != v29) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v31 = +[AVTStickerProp propFromDictionary:*(void *)(*((void *)&v50 + 1) + 8 * v30) assetsPath:v7];
                if (v31) {
                  [v26 addObject:v31];
                }

                ++v30;
              }
              while (v28 != v30);
              uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:v58 count:16];
            }
            while (v28);
          }

          [(AVTStickerConfiguration *)v4 setProps:v26];
        }
        id v32 = [(AVTStickerConfiguration *)v4 shaderModifiers];
        BOOL v33 = v32 == 0;

        if (v33)
        {
          id v34 = [v6 objectForKey:@"shaders"];
          id v35 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v34, "count"));
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v36 = v34;
          uint64_t v37 = [v36 countByEnumeratingWithState:&v46 objects:v57 count:16];
          if (v37)
          {
            uint64_t v38 = *(void *)v47;
            do
            {
              uint64_t v39 = 0;
              do
              {
                if (*(void *)v47 != v38) {
                  objc_enumerationMutation(v36);
                }
                long long v40 = +[AVTStickerShaderModifier shaderModifierFromDictionary:assetsPath:](AVTStickerShaderModifier, "shaderModifierFromDictionary:assetsPath:", *(void *)(*((void *)&v46 + 1) + 8 * v39), v7, (void)v46);
                if (v40) {
                  [v35 addObject:v40];
                }

                ++v39;
              }
              while (v37 != v39);
              uint64_t v37 = [v36 countByEnumeratingWithState:&v46 objects:v57 count:16];
            }
            while (v37);
          }

          [(AVTStickerConfiguration *)v4 setShaderModifiers:v35];
        }
        long long v41 = [(AVTStickerConfiguration *)v4 camera];
        BOOL v42 = v41 == 0;

        if (v42)
        {
          long long v43 = [v6 objectForKey:@"camera"];
          if (v43)
          {
            long long v44 = +[AVTStickerCamera cameraFromDictionary:v43 assetsPath:v7];
            [(AVTStickerConfiguration *)v4 setCamera:v44];
          }
        }
        [(AVTStickerConfiguration *)v4 setHasLoadedFromConfiguration:1];

        goto LABEL_47;
      }
      uint64_t v9 = [v6 objectForKeyedSubscript:@"pose"];
      uint64_t v10 = [v6 objectForKeyedSubscript:@"physicsState"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = NSURL;
        uint64_t v12 = [v7 stringByAppendingPathComponent:v9];
        uint64_t v13 = [v11 fileURLWithPath:v12 isDirectory:0];

        uint64_t v14 = [[AVTAvatarPhysicalizedPose alloc] initWithSceneAtURL:v13];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          id v15 = [[AVTAvatarPhysicalizedPose alloc] initWithPoseRepresentation:v9 physicsStatesRepresentation:v10];
LABEL_12:
          [(AVTStickerConfiguration *)v4 setPhysicalizedPose:v15];
          id v16 = [v6 objectForKeyedSubscript:@"pose-adjustments"];
          if (v16)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v17 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v16, "count"));
              v55[0] = MEMORY[0x263EF8330];
              v55[1] = 3221225472;
              v55[2] = __39__AVTStickerConfiguration_loadIfNeeded__block_invoke;
              v55[3] = &unk_264020840;
              id v18 = v17;
              id v56 = v18;
              v54[0] = MEMORY[0x263EF8330];
              v54[1] = 3221225472;
              v54[2] = __39__AVTStickerConfiguration_loadIfNeeded__block_invoke_2;
              v54[3] = &__block_descriptor_40_e25_v32__0__NSString_8_16_B24lu32l8;
              v54[4] = v55;
              [v16 enumerateKeysAndObjectsUsingBlock:v54];
              [(AVTStickerConfiguration *)v4 setPoseAdjustments:v18];
            }
          }

          goto LABEL_16;
        }
        v45 = [AVTAvatarPhysicalizedPose alloc];
        uint64_t v13 = +[AVTAvatarPose neutralPose];
        uint64_t v14 = [(AVTAvatarPhysicalizedPose *)v45 initWithPose:v13 physicsStates:0];
      }
      id v15 = v14;

      goto LABEL_12;
    }
  }
}

void __39__AVTStickerConfiguration_loadIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v9 = [v5 objectForKeyedSubscript:@"pose"];
  uint64_t v6 = objc_alloc_init(AVTStickerPoseAdjustment);
  [(AVTStickerPoseAdjustment *)v6 setPresetCategory:a2];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"value"];

  [(AVTStickerPoseAdjustment *)v6 setPresetIdentifier:v7];
  uint64_t v8 = [[AVTAvatarPose alloc] initWithDictionaryRepresentation:v9];
  [(AVTStickerPoseAdjustment *)v6 setPose:v8];

  [*(id *)(a1 + 32) addObject:v6];
}

void __39__AVTStickerConfiguration_loadIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  AVTPresetCategoryFromString(a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
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
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)unload
{
  if ([(AVTStickerConfiguration *)self hasLoadedFromConfiguration])
  {
    v3 = [(AVTStickerConfiguration *)self configurationDictionary];

    if (v3)
    {
      id obj = self;
      objc_sync_enter(obj);
      if ([(AVTStickerConfiguration *)obj hasLoadedFromConfiguration])
      {
        id v4 = [(AVTStickerConfiguration *)obj configurationDictionary];

        if (v4)
        {
          [(AVTStickerConfiguration *)obj setPhysicalizedPose:0];
          [(AVTStickerConfiguration *)obj setBodyPose:0];
          [(AVTStickerConfiguration *)obj setPoseAdjustments:0];
          [(AVTStickerConfiguration *)obj setProps:0];
          [(AVTStickerConfiguration *)obj setShaderModifiers:0];
          [(AVTStickerConfiguration *)obj setCamera:0];
          [(AVTStickerConfiguration *)obj setHasLoadedFromConfiguration:0];
        }
      }
      objc_sync_exit(obj);
    }
  }
}

- (void)_updateDictionary:(id)a3 withTargetPath:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [(AVTStickerConfiguration *)self props];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [*(id *)(*((void *)&v15 + 1) + 8 * v13) dictionaryWithTargetPath:v7];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  [v6 setObject:v8 forKeyedSubscript:@"props"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(AVTStickerConfiguration *)self name];
  if ([(AVTStickerConfiguration *)self hasLoadedFromConfiguration])
  {
    id v6 = [(AVTStickerConfiguration *)self dictionaryWithTargetPath:@"/"];
    id v7 = [v6 description];
    uint64_t v8 = [v3 stringWithFormat:@"<%@ %p> \"%@\" %@", v4, self, v5, v7];
  }
  else
  {
    uint64_t v8 = [v3 stringWithFormat:@"<%@ %p> \"%@\" %@", v4, self, v5, @"Unloaded"];
  }

  return v8;
}

- (id)dictionaryWithTargetPath:(id)a3
{
  id v4 = a3;
  [(AVTStickerConfiguration *)self loadIfNeeded];
  configurationDictionary = self->_configurationDictionary;
  if (configurationDictionary)
  {
    uint64_t v6 = [(NSDictionary *)configurationDictionary mutableCopy];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v7 = (void *)v6;
  [(AVTStickerConfiguration *)self _updateDictionary:v6 withTargetPath:v4];

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (AVTAvatarPhysicalizedPose)physicalizedPose
{
  return self->_physicalizedPose;
}

- (void)setPhysicalizedPose:(id)a3
{
}

- (AVTAvatarBodyPose)bodyPose
{
  return self->_bodyPose;
}

- (void)setBodyPose:(id)a3
{
}

- (NSArray)props
{
  return self->_props;
}

- (void)setProps:(id)a3
{
}

- (NSArray)shaderModifiers
{
  return self->_shaderModifiers;
}

- (void)setShaderModifiers:(id)a3
{
}

- (AVTStickerCamera)camera
{
  return self->_camera;
}

- (void)setCamera:(id)a3
{
}

- (NSString)stickerPack
{
  return self->_stickerPack;
}

- (NSArray)morpherOverrides
{
  return self->_morpherOverrides;
}

- (NSArray)presetOverrides
{
  return self->_presetOverrides;
}

- (NSArray)poseAdjustments
{
  return self->_poseAdjustments;
}

- (void)setPoseAdjustments:(id)a3
{
}

- (unint64_t)stickerVersion
{
  return self->_stickerVersion;
}

- (NSDictionary)configurationDictionary
{
  return self->_configurationDictionary;
}

- (void)setConfigurationDictionary:(id)a3
{
}

- (NSString)assetsPath
{
  return self->_assetsPath;
}

- (void)setAssetsPath:(id)a3
{
}

- (BOOL)hasLoadedFromConfiguration
{
  return self->_hasLoadedFromConfiguration;
}

- (void)setHasLoadedFromConfiguration:(BOOL)a3
{
  self->_hasLoadedFromConfiguration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsPath, 0);
  objc_storeStrong((id *)&self->_configurationDictionary, 0);
  objc_storeStrong((id *)&self->_poseAdjustments, 0);
  objc_storeStrong((id *)&self->_presetOverrides, 0);
  objc_storeStrong((id *)&self->_morpherOverrides, 0);
  objc_storeStrong((id *)&self->_stickerPack, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_shaderModifiers, 0);
  objc_storeStrong((id *)&self->_props, 0);
  objc_storeStrong((id *)&self->_bodyPose, 0);
  objc_storeStrong((id *)&self->_physicalizedPose, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_legacySizeOption, 0);
}

- (id)legacySizeOption
{
  return self->_legacySizeOption;
}

- (CGSize)size
{
  if ((size_done & 1) == 0)
  {
    size_done = 1;
    v3 = avt_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[AVTStickerConfiguration setupOptions:](v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  legacySizeOption = self->_legacySizeOption;
  if (legacySizeOption)
  {
    [(NSNumber *)legacySizeOption floatValue];
    double v13 = v12;
  }
  else
  {
    double v13 = 140.0;
  }
  double v14 = v13;
  result.height = v14;
  result.width = v13;
  return result;
}

- (BOOL)preRendered
{
  if ((preRendered_done & 1) == 0)
  {
    preRendered_done = 1;
    v2 = avt_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      [(AVTStickerConfiguration(Deprecated) *)v2 preRendered];
    }
  }
  return 0;
}

- (void)setupOptions:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

@end