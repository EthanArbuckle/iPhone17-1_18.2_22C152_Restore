@interface NTKSnowglobeAssetLibrary
+ (NTKSnowglobeAssetLibrary)sharedInstance;
- (MTLDevice)sharedDevice;
- (NTKSnowglobeAssetLibrary)init;
- (id)_copyAndConfigureDigitNode:(id)a3;
- (id)_lightMaterialContents;
- (id)_loadBackgroundObjects;
- (id)_loadDainty;
- (id)_loadDigitNumber:(unint64_t)a3;
- (id)createScene;
- (id)digitShaderModifier;
- (void)_applyCustomShadingToMaterial:(id)a3;
- (void)_configurePhysicsBodyForNode:(id)a3;
- (void)_fetchEyes:(id)a3;
- (void)_replaceEyesForNode:(id)a3 withCompletion:(id)a4;
- (void)digitNodeForNumber:(unint64_t)a3 queue:(id)a4 withCompletion:(id)a5;
- (void)loadDaintyOnQueue:(id)a3 withCompletion:(id)a4;
- (void)loadRandomBackgroundShapeOnQueue:(id)a3 withCompletion:(id)a4;
@end

@implementation NTKSnowglobeAssetLibrary

+ (NTKSnowglobeAssetLibrary)sharedInstance
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EA8FCEE0);
  WeakRetained = objc_loadWeakRetained(&qword_1EA8FCED8);
  if (!WeakRetained)
  {
    WeakRetained = objc_opt_new();
    objc_storeWeak(&qword_1EA8FCED8, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EA8FCEE0);

  return (NTKSnowglobeAssetLibrary *)WeakRetained;
}

- (NTKSnowglobeAssetLibrary)init
{
  v24.receiver = self;
  v24.super_class = (Class)NTKSnowglobeAssetLibrary;
  v2 = [(NTKSnowglobeAssetLibrary *)&v24 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    digitPools = v2->_digitPools;
    v2->_digitPools = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    v6 = 0;
    do
    {
      objc_initWeak(&location, v2);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = sub_1DAFE5B70;
      v21[3] = &unk_1E6BE4E50;
      objc_copyWeak(v22, &location);
      v22[1] = v6;
      v7 = +[NTKSnowglobePromise asyncPromiseWithBlock:v21];
      [v5 addObject:v7];

      objc_destroyWeak(v22);
      objc_destroyWeak(&location);
      ++v6;
    }
    while (v6 != (char *)10);
    uint64_t v8 = [v5 copy];
    digitPromises = v2->_digitPromises;
    v2->_digitPromises = (NSArray *)v8;

    objc_initWeak(&location, v2);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1DAFE5BF8;
    v19[3] = &unk_1E6BE4E78;
    objc_copyWeak(&v20, &location);
    uint64_t v10 = +[NTKSnowglobePromise asyncPromiseWithBlock:v19];
    backgroundObjectPromise = v2->_backgroundObjectPromise;
    v2->_backgroundObjectPromise = (NTKSnowglobePromise *)v10;

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1DAFE5C70;
    v17[3] = &unk_1E6BE4E78;
    objc_copyWeak(&v18, &location);
    uint64_t v12 = +[NTKSnowglobePromise asyncPromiseWithBlock:v17];
    daintyPromise = v2->_daintyPromise;
    v2->_daintyPromise = (NTKSnowglobePromise *)v12;

    v14 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    sharedDevice = v2->_sharedDevice;
    v2->_sharedDevice = v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)digitNodeForNumber:(unint64_t)a3 queue:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(NSArray *)self->_digitPromises objectAtIndex:a3];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1DAFE5DD0;
  v13[3] = &unk_1E6BE4EC8;
  id v14 = v8;
  v15 = self;
  id v16 = v9;
  unint64_t v17 = a3;
  id v11 = v9;
  id v12 = v8;
  [v10 fetchWithCompletion:v13];
}

- (id)_loadDigitNumber:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"digit_%i", a3);
  v4 = sub_1DAFE6140();
  v5 = [v4 URLForResource:v3 withExtension:@"scn" subdirectory:@"SceneKit Asset Catalog.scnassets"];

  id v13 = 0;
  v6 = [MEMORY[0x1E4F3B268] sceneWithURL:v5 options:0 error:&v13];
  id v7 = v13;
  if (v7)
  {
    id v8 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_1DAFDF000, v8, OS_LOG_TYPE_DEFAULT, "Snowglobe: Error loading digit scene: %@", buf, 0xCu);
    }
  }
  id v9 = [v6 rootNode];
  uint64_t v10 = [v9 childNodes];
  id v11 = [v10 objectAtIndexedSubscript:0];

  [v11 setSimdPosition:0.0];
  [v11 removeFromParentNode];

  return v11;
}

- (id)_copyAndConfigureDigitNode:(id)a3
{
  v4 = [a3 clone];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_1DAFE624C;
  id v11 = &unk_1E6BE4F18;
  id v5 = v4;
  id v12 = v5;
  id v13 = self;
  [(NTKSnowglobeAssetLibrary *)self _replaceEyesForNode:v5 withCompletion:&v8];
  -[NTKSnowglobeAssetLibrary _configurePhysicsBodyForNode:](self, "_configurePhysicsBodyForNode:", v5, v8, v9, v10, v11);
  id v6 = v5;

  return v6;
}

- (void)_applyCustomShadingToMaterial:(id)a3
{
  id v3 = a3;
  v4 = [v3 roughness];
  [v4 setContents:&unk_1F352BFC0];

  id v5 = [v3 metalness];
  [v5 setContents:&unk_1F352BFD0];

  [v3 setLightingModelName:*MEMORY[0x1E4F3B348]];
  id v7 = +[NTKSnowglobeAssetLibrary sharedInstance];
  id v6 = [v7 digitShaderModifier];
  [v3 setShaderModifiers:v6];
}

- (void)_configurePhysicsBodyForNode:(id)a3
{
  id v3 = a3;
  id v18 = [v3 childNodeWithName:@"Leg_1" recursively:1];
  v4 = [v3 childNodeWithName:@"Leg_2" recursively:1];
  id v5 = sub_1DAFE66B4((uint64_t)v4, v3);
  [v3 setPhysicsBody:v5];

  id v7 = sub_1DAFE66B4(v6, v18);
  [v18 setPhysicsBody:v7];

  uint64_t v8 = [v18 physicsBody];
  [v8 setMass:0.05];

  uint64_t v9 = [v18 physicsBody];
  [v9 setAngularDamping:0.95];

  uint64_t v10 = [v18 physicsBody];
  [v10 setCollisionBitMask:0];

  id v11 = [v18 physicsBody];
  [v11 setContactTestBitMask:0];

  id v13 = sub_1DAFE66B4(v12, v4);
  [v4 setPhysicsBody:v13];

  id v14 = [v4 physicsBody];
  [v14 setMass:0.05];

  id v15 = [v4 physicsBody];
  [v15 setAngularDamping:0.95];

  uint64_t v16 = [v4 physicsBody];
  [v16 setCollisionBitMask:0];

  unint64_t v17 = [v4 physicsBody];
  [v17 setContactTestBitMask:0];
}

- (void)_fetchEyes:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, SCNNode *, SCNNode *))a3;
  leftEye = self->_leftEye;
  if (!leftEye || (uint64_t v6 = self->_rightEye) == 0)
  {
    id v7 = sub_1DAFE6140();
    uint64_t v8 = [v7 URLForResource:@"eyes" withExtension:@"scn" subdirectory:@"SceneKit Asset Catalog.scnassets"];

    id v18 = 0;
    uint64_t v9 = [MEMORY[0x1E4F3B268] sceneWithURL:v8 options:0 error:&v18];
    id v10 = v18;
    if (v10)
    {
      id v11 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v10;
        _os_log_impl(&dword_1DAFDF000, v11, OS_LOG_TYPE_DEFAULT, "Snowglobe: Error loading lighting scene: %@", buf, 0xCu);
      }
    }
    uint64_t v12 = [v9 rootNode];
    id v13 = [v12 childNodeWithName:@"LeftEye" recursively:1];
    id v14 = self->_leftEye;
    self->_leftEye = v13;

    id v15 = [v9 rootNode];
    uint64_t v16 = [v15 childNodeWithName:@"RightEye" recursively:1];
    rightEye = self->_rightEye;
    self->_rightEye = v16;

    -[SCNNode setSimdScale:](self->_leftEye, "setSimdScale:");
    [(SCNNode *)self->_rightEye setSimdScale:*(double *)vdupq_n_s32(0x3BE33153u).i64];

    leftEye = self->_leftEye;
    uint64_t v6 = self->_rightEye;
  }
  v4[2](v4, leftEye, v6);
}

- (void)_replaceEyesForNode:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DAFE6AC8;
  v10[3] = &unk_1E6BE4F40;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NTKSnowglobeAssetLibrary *)self _fetchEyes:v10];
}

- (void)loadRandomBackgroundShapeOnQueue:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  backgroundObjectPromise = self->_backgroundObjectPromise;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DAFE6CB0;
  v11[3] = &unk_1E6BE4F90;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NTKSnowglobePromise *)backgroundObjectPromise fetchWithCompletion:v11];
}

- (id)_loadBackgroundObjects
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DAFDF000, v2, OS_LOG_TYPE_DEFAULT, "Loading Snowglobe background objects..", buf, 2u);
  }

  id v3 = sub_1DAFE6140();
  v4 = [v3 URLForResource:@"all_shapes" withExtension:@"scn" subdirectory:@"SceneKit Asset Catalog.scnassets"];

  id v22 = 0;
  id v5 = [MEMORY[0x1E4F3B268] sceneWithURL:v4 options:0 error:&v22];
  id v6 = v22;
  id v7 = _NTKLoggingObjectForDomain();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1DAFEF358((uint64_t)v6, v8);
    }
    id v9 = MEMORY[0x1E4F1CBF0];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DAFDF000, v8, OS_LOG_TYPE_DEFAULT, "Loaded Snowglobe background objects", buf, 2u);
    }

    id v10 = [v5 rootNode];
    id v11 = [v10 childNodes];
    id v12 = (void *)[v11 copy];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v12;
    uint64_t v13 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "removeFromParentNode", (void)v18);
        }
        uint64_t v14 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v14);
    }
    id v9 = v8;
  }

  return v9;
}

- (id)digitShaderModifier
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  shaderModifier = v2->_shaderModifier;
  if (!shaderModifier)
  {
    v4 = sub_1DAFE6140();
    id v5 = [v4 URLForResource:@"shadermodifier" withExtension:@"metal.snippet"];

    id v6 = [NSString stringWithContentsOfURL:v5 encoding:4 error:0];
    uint64_t v11 = *MEMORY[0x1E4F3B3E0];
    v12[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v8 = v2->_shaderModifier;
    v2->_shaderModifier = (NSDictionary *)v7;

    shaderModifier = v2->_shaderModifier;
  }
  id v9 = shaderModifier;
  objc_sync_exit(v2);

  return v9;
}

- (void)loadDaintyOnQueue:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  daintyPromise = self->_daintyPromise;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DAFE73DC;
  v11[3] = &unk_1E6BE4D98;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NTKSnowglobePromise *)daintyPromise fetchWithCompletion:v11];
}

- (id)_loadDainty
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DAFDF000, v2, OS_LOG_TYPE_DEFAULT, "Loading Dainty..", buf, 2u);
  }

  id v3 = sub_1DAFE6140();
  v4 = [v3 URLForResource:@"dainty" withExtension:@"scn" subdirectory:@"SceneKit Asset Catalog.scnassets"];

  id v13 = 0;
  id v5 = [MEMORY[0x1E4F3B268] sceneWithURL:v4 options:0 error:&v13];
  id v6 = v13;
  if (v6)
  {
    id v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_1DAFDF000, v7, OS_LOG_TYPE_DEFAULT, "Snowglobe: Error loading dainty scene: %@", buf, 0xCu);
    }
  }
  id v8 = [v5 rootNode];
  id v9 = [v8 childNodes];
  id v10 = [v9 objectAtIndexedSubscript:0];

  [v10 removeFromParentNode];
  uint64_t v11 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = v10 != 0;
    _os_log_impl(&dword_1DAFDF000, v11, OS_LOG_TYPE_DEFAULT, "Loaded Dainty %i", buf, 8u);
  }

  return v10;
}

- (id)createScene
{
  id v3 = [MEMORY[0x1E4F3B268] scene];
  v4 = [(NTKSnowglobeAssetLibrary *)self _lightMaterialContents];
  id v5 = [v3 lightingEnvironment];
  [v5 setContents:v4];

  id v6 = [v3 lightingEnvironment];
  [v6 setIntensity:2.0];

  return v3;
}

- (id)_lightMaterialContents
{
  id lightingMaterialContents = self->_lightingMaterialContents;
  if (lightingMaterialContents)
  {
    id v3 = lightingMaterialContents;
  }
  else
  {
    id v5 = sub_1DAFE6140();
    id v6 = [v5 URLForResource:@"snowglobe" withExtension:@"lighting" subdirectory:@"SceneKit Asset Catalog.scnassets"];

    id v15 = 0;
    id v7 = [MEMORY[0x1E4F3B220] precomputedLightingEnvironmentContentsWithURL:v6 error:&v15];
    id v8 = v15;
    id v9 = self->_lightingMaterialContents;
    self->_id lightingMaterialContents = v7;

    id v10 = self->_lightingMaterialContents;
    uint64_t v11 = _NTKLoggingObjectForDomain();
    id v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_1DAFDF000, v12, OS_LOG_TYPE_DEFAULT, "Loaded lighting environment successfully", v14, 2u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      sub_1DAFEF3D0((uint64_t)v8, v12);
    }

    id v3 = self->_lightingMaterialContents;
  }

  return v3;
}

- (MTLDevice)sharedDevice
{
  return self->_sharedDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDevice, 0);
  objc_storeStrong(&self->_lightingMaterialContents, 0);
  objc_storeStrong((id *)&self->_digitPools, 0);
  objc_storeStrong((id *)&self->_daintyPromise, 0);
  objc_storeStrong((id *)&self->_backgroundObjectPromise, 0);
  objc_storeStrong((id *)&self->_digitPromises, 0);
  objc_storeStrong((id *)&self->_shaderModifier, 0);
  objc_storeStrong((id *)&self->_rightEye, 0);

  objc_storeStrong((id *)&self->_leftEye, 0);
}

@end