@interface AVTAnimoji
+ (BOOL)supportsSecureCoding;
+ (id)_scenePathForPuppetNamed:(id)a3;
+ (id)_sceneURLForPuppetDirectoryURL:(id)a3;
+ (id)animojiNamed:(id)a3;
+ (id)animojiNames;
+ (id)animojiWithContentsOfURL:(id)a3;
+ (id)thumbnailForAnimojiNamed:(id)a3 options:(id)a4;
+ (void)preloadAnimojiNamed:(id)a3;
- (AVTAnimoji)initWithCoder:(id)a3;
- (AVTAnimoji)initWithDescriptor:(id)a3 usageIntent:(unint64_t)a4 error:(id *)a5;
- (AVTAnimoji)initWithName:(id)a3 error:(id *)p_isa;
- (NSString)name;
- (NSURL)url;
- (id)_sceneURL;
- (id)avatarNode;
- (id)cameraNode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)headNode;
- (id)lightingNode;
- (id)modelNode;
- (id)newDescriptor;
- (id)specializationSettings;
- (unint64_t)usageIntent;
- (void)_load;
- (void)configureForBestAnimationQuality;
- (void)encodeWithCoder:(id)a3;
- (void)loadIfNeeded;
- (void)setName:(id)a3;
- (void)setUrl:(id)a3;
- (void)update;
@end

@implementation AVTAnimoji

+ (id)animojiNames
{
  if (animojiNames_onceToken != -1) {
    dispatch_once(&animojiNames_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)animojiNames_names;
  return v2;
}

void __26__AVTAnimoji_animojiNames__block_invoke()
{
  v0 = (void *)animojiNames_names;
  animojiNames_names = (uint64_t)&unk_26C00C690;
}

+ (id)_scenePathForPuppetNamed:(id)a3
{
  id v3 = a3;
  v4 = +[AVTResourceLocator sharedResourceLocator]();
  v5 = -[AVTResourceLocator pathForAnimojiResource:ofType:inDirectory:isDirectory:](v4, (uint64_t)v3, @"scnz", (uint64_t)v3, 0);

  return v5;
}

+ (id)_sceneURLForPuppetDirectoryURL:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F08850] defaultManager];
  v5 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:0 error:0];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "lastPathComponent", (void)v21);
        v13 = [v12 stringByDeletingPathExtension];
        v14 = [v3 lastPathComponent];
        int v15 = [v13 isEqualToString:v14];

        if (v15)
        {
          v16 = [v11 pathExtension];
          if ([v16 isEqualToString:@"scnz"])
          {

LABEL_13:
            id v19 = v11;
            goto LABEL_14;
          }
          v17 = [v11 pathExtension];
          char v18 = [v17 isEqualToString:@"scn"];

          if (v18) {
            goto LABEL_13;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v19 = 0;
LABEL_14:

  return v19;
}

- (id)_sceneURL
{
  if (self->_url)
  {
    v2 = [(id)objc_opt_class() _sceneURLForPuppetDirectoryURL:self->_url];
  }
  else if (self->_name)
  {
    id v3 = NSURL;
    v4 = [(id)objc_opt_class() _scenePathForPuppetNamed:self->_name];
    v2 = [v3 fileURLWithPath:v4 isDirectory:0];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)_load
{
  __assert_rtn("-[AVTAnimoji _load]", "AVTAnimoji.m", 239, "_name != nil");
}

- (void)loadIfNeeded
{
  if (!self->_avatarNode) {
    [(AVTAnimoji *)self _load];
  }
}

- (id)avatarNode
{
  [(AVTAnimoji *)self loadIfNeeded];
  avatarNode = self->_avatarNode;
  return avatarNode;
}

- (id)headNode
{
  return self->_headNode;
}

- (id)modelNode
{
  return [(SCNNode *)self->_avatarNode childNodeWithName:@"model" recursively:1];
}

- (void)update
{
  v2 = [(AVTAnimoji *)self avatarNode];
}

+ (id)animojiWithContentsOfURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setUrl:v3];

  return v4;
}

- (AVTAnimoji)initWithName:(id)a3 error:(id *)p_isa
{
  v45[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = [(id)objc_opt_class() animojiNames];
    char v9 = [v8 containsObject:v7];

    if (v9)
    {
      v41.receiver = self;
      v41.super_class = (Class)AVTAnimoji;
      v10 = [(AVTAvatar *)&v41 init];
      self = v10;
      if (!v10)
      {
LABEL_6:
        self = self;
        p_isa = (id *)&self->super.super.isa;
        goto LABEL_17;
      }
      p_name = &v10->_name;
      objc_storeStrong((id *)&v10->_name, a3);
      v12 = [(id)objc_opt_class() _scenePathForPuppetNamed:*p_name];
      if (v12)
      {

        goto LABEL_6;
      }
      v34 = avt_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[AVTAnimoji initWithName:error:]((uint64_t)&self->_name, v34, v35, v36, v37, v38, v39, v40);
      }
    }
    else
    {
      if (p_isa)
      {
        long long v23 = (void *)MEMORY[0x263F087E8];
        uint64_t v42 = *MEMORY[0x263F08320];
        long long v24 = [NSString stringWithFormat:@"Unknown Animoji name \"%@\"", v7];
        v43 = v24;
        v25 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        *p_isa = [v23 errorWithDomain:@"AVTErrorDomain" code:3 userInfo:v25];
      }
      uint64_t v26 = avt_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[AVTAnimoji initWithName:error:]((uint64_t)v7, v26, v27, v28, v29, v30, v31, v32);
      }
    }
LABEL_16:
    p_isa = 0;
    goto LABEL_17;
  }
  v13 = avt_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[AVTAnimoji initWithName:error:](v13, v14, v15, v16, v17, v18, v19, v20);
  }

  if (p_isa)
  {
    long long v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v44 = *MEMORY[0x263F08320];
    v45[0] = @"Can't instanciate AVTAnimoji with nil name";
    long long v22 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
    *p_isa = [v21 errorWithDomain:@"AVTErrorDomain" code:3 userInfo:v22];

    goto LABEL_16;
  }
LABEL_17:

  return (AVTAnimoji *)p_isa;
}

+ (id)animojiNamed:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v3 error:0];

  return v4;
}

- (id)newDescriptor
{
  id v3 = [AVTAnimojiDescriptor alloc];
  return [(AVTAnimojiDescriptor *)v3 initWithAnimoji:self];
}

- (AVTAnimoji)initWithDescriptor:(id)a3 usageIntent:(unint64_t)a4 error:(id *)a5
{
  id v7 = [a3 name];
  uint64_t v8 = [(AVTAnimoji *)self initWithName:v7 error:a5];

  return v8;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p, %@>", v5, self, self->_name];

  return v6;
}

+ (id)thumbnailForAnimojiNamed:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKeyedSubscript:@"AVTAnimojiThumbnailLargeSizeKey"];

  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"AVTAnimojiThumbnailLargeSizeKey"];

    int v9 = [(__CFString *)v8 BOOLValue];
    v10 = AVTFramingModeCamera;
    if (!v9) {
      v10 = AVTFramingModeGrid;
    }
    v11 = *v10;
  }
  else
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"AVTAnimojiThumbnailCameraKey"];

    v11 = @"cameraGrid";
    if (v8) {
      v11 = v8;
    }
  }
  v12 = v11;

  v13 = [v5 stringByAppendingString:@"-"];
  uint64_t v14 = [v13 stringByAppendingString:v12];

  uint64_t v15 = +[AVTResourceLocator sharedResourceLocator]();
  uint64_t v16 = -[AVTResourceLocator pathForAnimojiResource:ofType:inDirectory:isDirectory:](v15, (uint64_t)v14, @"atx", (uint64_t)v5, 0);

  uint64_t v17 = [MEMORY[0x263F1C6B0] imageWithContentsOfFile:v16];

  return v17;
}

- (unint64_t)usageIntent
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  [(AVTAnimoji *)self loadIfNeeded];
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  [v4 setName:self->_name];
  uint64_t v5 = [(NSDictionary *)self->_specializationSettings copy];
  id v6 = v4[35];
  v4[35] = (id)v5;

  id v7 = [(AVTAnimoji *)self avatarNode];
  uint64_t v8 = AVTCloneNodesAndMaterials(v7);
  id v9 = v4[33];
  v4[33] = (id)v8;

  uint64_t v10 = [v4[33] childNodeWithName:@"head" recursively:1];
  id v11 = v4[32];
  v4[32] = (id)v10;

  [v4 _avatarNodeAndHeadNodeAreNowAvailable];
  [v4 resetCustomBehaviours];
  [v4 updateBindings];
  uint64_t v12 = [(SCNNode *)self->_lightingNode clone];
  id v13 = v4[31];
  v4[31] = (id)v12;

  uint64_t v14 = [(SCNNode *)self->_cameraNode clone];
  id v15 = v4[34];
  v4[34] = (id)v14;

  [v4[33] enumerateHierarchyUsingBlock:&__block_literal_global_189];
  return v4;
}

uint64_t __27__AVTAnimoji_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPhysicsBody:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAnimoji *)self newDescriptor];
  [v4 encodeObject:v5 forKey:@"descriptor"];
}

- (AVTAnimoji)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptor"];

  id v6 = [(AVTAnimoji *)self initWithDescriptor:v5 usageIntent:0 error:0];
  return v6;
}

+ (void)preloadAnimojiNamed:(id)a3
{
  id v4 = +[AVTAnimoji puppetNamed:a3 options:0];
  [a1 preloadPuppet:v4];
}

- (id)lightingNode
{
  [(AVTAnimoji *)self loadIfNeeded];
  lightingNode = self->_lightingNode;
  return lightingNode;
}

- (id)cameraNode
{
  [(AVTAnimoji *)self loadIfNeeded];
  cameraNode = self->_cameraNode;
  return cameraNode;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setName:(id)a3
{
}

- (id)specializationSettings
{
  return self->_specializationSettings;
}

- (void)configureForBestAnimationQuality
{
  id v3 = [(AVTAnimoji *)self name];
  if ([v3 isEqualToString:@"shark"])
  {
  }
  else
  {
    id v4 = [(AVTAnimoji *)self name];
    int v5 = [v4 isEqualToString:@"lion"];

    if (!v5) {
      return;
    }
  }
  avatarNode = self->_avatarNode;
  [(SCNNode *)avatarNode enumerateHierarchyUsingBlock:&__block_literal_global_195];
}

void __46__AVTAnimoji_configureForBestAnimationQuality__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 morpher];
  LODWORD(v2) = 981668463;
  [v3 setWeightIncrementalThreshold:v2];
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_specializationSettings, 0);
  objc_storeStrong((id *)&self->_cameraNode, 0);
  objc_storeStrong((id *)&self->_avatarNode, 0);
  objc_storeStrong((id *)&self->_headNode, 0);
  objc_storeStrong((id *)&self->_lightingNode, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithName:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithName:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithName:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end