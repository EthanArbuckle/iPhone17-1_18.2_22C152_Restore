@interface AVTRendererViewTransitionTechnique
- (AVTRendererViewTransitionTechnique)initWithSceneRenderer:(id)a3;
- (MTLTexture)snapshotTexture;
- (SCNTechnique)technique;
- (float)framebufferTextureOpacity;
- (void)setFramebufferTextureOpacity:(float)a3;
- (void)setSnapshotTexture:(id)a3;
@end

@implementation AVTRendererViewTransitionTechnique

- (AVTRendererViewTransitionTechnique)initWithSceneRenderer:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AVTRendererViewTransitionTechnique;
  v5 = [(AVTRendererViewTransitionTechnique *)&v22 init];
  if (v5)
  {
    v6 = [v4 device];
    [v4 colorPixelFormat];
    +[AVTMetalHelper helperForDevice:]((uint64_t)AVTMetalHelper, v6);
    v7 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    +[AVTResourceLocator sharedResourceLocator]();
    v8 = (id *)objc_claimAutoreleasedReturnValue();
    v9 = -[AVTResourceLocator urlForFrameworkResourceAtPath:isDirectory:](v8, @"ViewTransitionTechniqueGeneric.json", 0);

    v10 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v9 options:1 error:0];
    v11 = [MEMORY[0x263F08900] JSONObjectWithData:v10 options:1 error:0];
    v12 = [v11 objectForKeyedSubscript:@"passes"];
    v13 = [v12 objectForKeyedSubscript:@"ScenePass"];
    uint64_t v14 = [v4 antialiasingMode];
    if (v14 == 1) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 1;
    }
    if (v14 == 2) {
      uint64_t v16 = 4;
    }
    else {
      uint64_t v16 = v15;
    }
    v17 = [NSNumber numberWithInteger:v16];
    [v13 setObject:v17 forKeyedSubscript:@"samples"];

    uint64_t v18 = [MEMORY[0x263F16B00] techniqueWithDictionary:v11];
    technique = v5->_technique;
    v5->_technique = (SCNTechnique *)v18;

    v20 = -[AVTMetalHelper library](v7);
    [(SCNTechnique *)v5->_technique setLibrary:v20];
  }
  return v5;
}

- (SCNTechnique)technique
{
  return self->_technique;
}

- (float)framebufferTextureOpacity
{
  return self->_framebufferTextureOpacity;
}

- (void)setFramebufferTextureOpacity:(float)a3
{
  if (self->_framebufferTextureOpacity != a3)
  {
    self->_framebufferTextureOpacity = a3;
    objc_msgSend(NSNumber, "numberWithFloat:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(SCNTechnique *)self->_technique setObject:v4 forKeyedSubscript:@"opacity_symbol"];
  }
}

- (MTLTexture)snapshotTexture
{
  return self->_snapshotTexture;
}

- (void)setSnapshotTexture:(id)a3
{
  v5 = (MTLTexture *)a3;
  p_snapshotTexture = &self->_snapshotTexture;
  if (self->_snapshotTexture != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_snapshotTexture, a3);
    id v7 = objc_alloc_init(MEMORY[0x263F16A88]);
    [v7 setContents:self->_snapshotTexture];
    [(SCNTechnique *)self->_technique setObject:v7 forKeyedSubscript:@"snapshot_symbol"];

    v5 = v8;
  }
  MEMORY[0x270F9A758](p_snapshotTexture, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_technique, 0);
  objc_storeStrong((id *)&self->_snapshotTexture, 0);
}

@end