@interface AVTAsset
- ($3C463231000E010C6CB72584ADC5493D)uvRemappingInfo;
- (AVTAsset)initWithType:(int64_t)a3 identifier:(id)a4 path:(id)a5;
- (BOOL)is2DAsset;
- (BOOL)is3DAsset;
- (NSDictionary)layers;
- (NSDictionary)specializationSettings;
- (NSString)ambientOcclusion;
- (NSString)identifier;
- (id)assetImageForAsset:(id)a3;
- (id)description;
- (id)instantiateResource;
- (id)resourceByCachingIfNeeded:(BOOL)a3;
- (int64_t)componentType;
- (unint64_t)editableColorCount;
- (void)decrUseCount;
- (void)enumerateVariantDependenciesOfKind:(unint64_t)a3 block:(id)a4;
- (void)freeCache;
- (void)incrUseCount;
- (void)instantiateResource;
@end

@implementation AVTAsset

- (AVTAsset)initWithType:(int64_t)a3 identifier:(id)a4 path:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v82.receiver = self;
  v82.super_class = (Class)AVTAsset;
  v11 = [(AVTAsset *)&v82 init];
  v12 = v11;
  if (v11)
  {
    v11->_componentType = a3;
    objc_storeStrong((id *)&v11->_identifier, a4);
    v12->_cacheLock._os_unfair_lock_opaque = 0;
    v13 = AVTPrecompiledMemojiAssetWithIdentifier(v12->_identifier);
    if (!v13)
    {
      v14 = avt_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[AVTAsset initWithType:identifier:path:](v14);
      }
    }
    uint64_t v15 = [v13 objectForKeyedSubscript:@"variantDependencies-morph"];
    morphVariantDependencies = v12->_morphVariantDependencies;
    v12->_morphVariantDependencies = (NSDictionary *)v15;

    uint64_t v17 = [v13 objectForKeyedSubscript:@"variantDependencies-image"];
    imageVariantDependencies = v12->_imageVariantDependencies;
    v12->_imageVariantDependencies = (NSDictionary *)v17;

    uint64_t v19 = [v13 objectForKeyedSubscript:@"variantDependencies-material"];
    materialVariantDependencies = v12->_materialVariantDependencies;
    v12->_materialVariantDependencies = (NSDictionary *)v19;

    v21 = [v13 objectForKeyedSubscript:@"layers"];
    if (v21)
    {
      id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v79[0] = MEMORY[0x263EF8330];
      v79[1] = 3221225472;
      v79[2] = __41__AVTAsset_initWithType_identifier_path___block_invoke;
      v79[3] = &unk_26401F9A8;
      v23 = (NSDictionary *)v22;
      v80 = v23;
      id v81 = v10;
      [v21 enumerateKeysAndObjectsUsingBlock:v79];
      layers = v12->_layers;
      v12->_layers = v23;
      v25 = v23;
    }
    v70 = v21;
    id v71 = v9;
    v26 = [v13 objectForKeyedSubscript:@"uvRemapping"];
    v69 = v26;
    if (v26)
    {
      v27 = v26;
      v28 = [v26 objectForKeyedSubscript:@"transform"];
      v29 = [v27 objectForKeyedSubscript:@"mirroringEnabled"];
      v12->_uvRemappingInfo.mirroringEnabled = [v29 BOOLValue];

      v30 = [v28 objectAtIndexedSubscript:0];
      [v30 floatValue];
      unsigned int v74 = v31;
      v32 = [v28 objectAtIndexedSubscript:1];
      [v32 floatValue];
      unint64_t v75 = __PAIR64__(v33, v74);
      [v28 objectAtIndexedSubscript:2];
      v35 = id v34 = v10;
      [v35 floatValue];
      unsigned int v72 = v36;
      v37 = [v28 objectAtIndexedSubscript:3];
      [v37 floatValue];
      unint64_t v73 = __PAIR64__(v38, v72);
      v39 = [v28 objectAtIndexedSubscript:4];
      [v39 floatValue];
      unsigned int v68 = v40;
      v41 = [v28 objectAtIndexedSubscript:5];
      [v41 floatValue];
      v12[1].super.isa = (Class)v75;
      v12[1]._identifier = (NSString *)v73;
      v12[1]._resourcePath = (NSString *)__PAIR64__(v42, v68);

      id v10 = v34;
    }
    else
    {
      v12->_uvRemappingInfo.mirroringEnabled = 0;
      v12[1].super.isa = (Class)1065353216;
      v12[1]._identifier = (NSString *)0x3F80000000000000;
      v12[1]._resourcePath = 0;
    }
    v43 = [v13 objectForKeyedSubscript:@"main"];
    uint64_t v44 = [v10 stringByAppendingPathComponent:v43];
    resourcePath = v12->_resourcePath;
    v12->_resourcePath = (NSString *)v44;

    v46 = [(NSString *)v12->_resourcePath pathExtension];
    if ([v46 hasPrefix:@"scn"])
    {
      v47 = [v13 objectForKeyedSubscript:@"accentColors"];
      v48 = v47;
      v49 = v70;
      id v9 = v71;
      if (v47) {
        uint64_t v50 = [v47 unsignedIntegerValue];
      }
      else {
        uint64_t v50 = 1;
      }
      v12->_editableColorCount = v50;
      v12->_resourceType = 0;
    }
    else
    {
      v12->_resourceType = 1;
      v49 = v70;
      id v9 = v71;
    }
    v51 = [v13 objectForKeyedSubscript:@"ao"];
    if (v51)
    {
      uint64_t v52 = [v10 stringByAppendingPathComponent:v51];
      ambientOcclusion = v12->_ambientOcclusion;
      v12->_ambientOcclusion = (NSString *)v52;
    }
    uint64_t v54 = [v13 objectForKeyedSubscript:@"mainPerAsset"];
    perAssetMain = v12->_perAssetMain;
    v12->_perAssetMain = (NSDictionary *)v54;

    if (v12->_perAssetMain)
    {
      id v56 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v57 = v12->_perAssetMain;
      v76[0] = MEMORY[0x263EF8330];
      v76[1] = 3221225472;
      v76[2] = __41__AVTAsset_initWithType_identifier_path___block_invoke_2;
      v76[3] = &unk_26401F9D0;
      id v77 = v56;
      id v78 = v10;
      id v58 = v56;
      [(NSDictionary *)v57 enumerateKeysAndObjectsUsingBlock:v76];
      uint64_t v59 = [v58 copy];
      v60 = v12->_perAssetMain;
      v12->_perAssetMain = (NSDictionary *)v59;
    }
    v61 = [v13 objectForKeyedSubscript:@"highTessellation"];

    if (v61)
    {
      v62 = [v13 objectForKeyedSubscript:@"highTessellation"];
      v12->_forceHighTessellation = [v62 BOOLValue];
    }
    uint64_t v63 = [v13 objectForKeyedSubscript:@"specialization settings"];
    specializationSettings = v12->_specializationSettings;
    v12->_specializationSettings = (NSDictionary *)v63;

    uint64_t v65 = [v13 objectForKeyedSubscript:@"wrapDeformerInfo"];
    wrapDeformerDriverNames = v12->_wrapDeformerDriverNames;
    v12->_wrapDeformerDriverNames = (NSDictionary *)v65;
  }
  return v12;
}

void __41__AVTAsset_initWithType_identifier_path___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 stringByAppendingPathComponent:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

void __41__AVTAsset_initWithType_identifier_path___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 stringByAppendingPathComponent:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (void)enumerateVariantDependenciesOfKind:(unint64_t)a3 block:(id)a4
{
  v13[3] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v13[0] = self->_morphVariantDependencies;
  v13[1] = self->_imageVariantDependencies;
  v13[2] = self->_materialVariantDependencies;
  id v7 = (void *)v13[a3];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__AVTAsset_enumerateVariantDependenciesOfKind_block___block_invoke;
  v11[3] = &unk_26401FA20;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  [v9 enumerateKeysAndObjectsUsingBlock:v11];

  for (uint64_t i = 2; i != -1; --i)
}

void __53__AVTAsset_enumerateVariantDependenciesOfKind_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = AVTComponentTypeFromString(a2);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__AVTAsset_enumerateVariantDependenciesOfKind_block___block_invoke_2;
  v7[3] = &unk_26401F9F8;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __53__AVTAsset_enumerateVariantDependenciesOfKind_block___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2, a3);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p \"%@\">", v5, self, self->_identifier];

  return v6;
}

- (void)incrUseCount
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  ++self->_refCount;
  os_unfair_lock_unlock(p_cacheLock);
}

- (void)freeCache
{
  self->_cachedResource = 0;
  MEMORY[0x270F9A758]();
}

- (void)decrUseCount
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B819000, log, OS_LOG_TYPE_ERROR, "Error: Unreachable code: error in AVTAsset refCount", v1, 2u);
}

- (BOOL)is2DAsset
{
  return self->_resourceType == 1;
}

- (BOOL)is3DAsset
{
  return self->_resourceType == 0;
}

- (id)instantiateResource
{
  p_resourceType = &self->_resourceType;
  if (self->_resourceType == 1)
  {
    p_isa = self->_resourcePath;
  }
  else if (self->_resourceType)
  {
    id v10 = avt_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(AVTAsset *)p_resourceType instantiateResource];
    }

    p_isa = 0;
  }
  else
  {
    p_resourcePath = (uint64_t *)&self->_resourcePath;
    id v5 = [NSURL fileURLWithPath:self->_resourcePath isDirectory:0];
    id v20 = 0;
    uint64_t v6 = objc_msgSend(MEMORY[0x263F16AD8], "avt_rootNodeForSceneAtURL:options:error:", v5, 0, &v20);
    id v7 = v20;
    if (v7)
    {
      id v8 = avt_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(AVTAsset *)(uint64_t *)&self->_resourcePath instantiateResource];
      }
      p_isa = 0;
    }
    else
    {
      v11 = [v6 childNodes];
      id v8 = [v11 objectAtIndexedSubscript:0];

      [v8 removeFromParentNode];
      if (v8)
      {
        if (self->_forceHighTessellation)
        {
          BOOL v12 = 1;
        }
        else
        {
          unint64_t componentType = self->_componentType;
          BOOL v12 = componentType > 0x1B || ((1 << componentType) & 0xC000068) == 0;
        }
        [v8 avt_enableSubdivisionOnHierarchyWithQuality:v12 animoji:0];
        if (self->_wrapDeformerDriverNames)
        {
          uint64_t v15 = [(NSString *)self->_resourcePath stringByDeletingLastPathComponent];
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __31__AVTAsset_instantiateResource__block_invoke;
          v18[3] = &unk_26401F5D0;
          v18[4] = self;
          id v19 = v15;
          id v16 = v15;
          [v8 enumerateHierarchyUsingBlock:v18];
        }
        id v8 = v8;
        p_isa = (NSString *)&v8->isa;
      }
      else
      {
        v13 = avt_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          [(AVTAsset *)p_resourcePath instantiateResource];
        }

        p_isa = 0;
      }
    }
  }
  return p_isa;
}

void __31__AVTAsset_instantiateResource__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 geometry];

  if (v4)
  {
    id v5 = [v3 name];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 128) objectForKeyedSubscript:v5];
    id v7 = *(void **)(a1 + 40);
    id v8 = [NSString stringWithFormat:@"%@_%@.wrapdata", v5, v6];
    uint64_t v9 = [v7 stringByAppendingPathComponent:v8];

    id v10 = [MEMORY[0x263F08850] defaultManager];
    int v11 = [v10 fileExistsAtPath:v9];

    if (v11)
    {
      id v17 = 0;
      BOOL v12 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v9 options:1 error:&v17];
      id v13 = v17;
      id v16 = v13;
      v14 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:&v16];
      id v15 = v16;

      [v3 setValue:v14 forUndefinedKey:@"wrapDeformerParameters"];
      [v3 setValue:v6 forUndefinedKey:@"wrapDeformerDriverName"];
    }
  }
}

- (id)resourceByCachingIfNeeded:(BOOL)a3
{
  if (!a3)
  {
    uint64_t v9 = [(AVTAsset *)self instantiateResource];
    goto LABEL_14;
  }
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  if (!self->_cachedResource)
  {
    id v5 = [(AVTAsset *)self instantiateResource];
    id cachedResource = self->_cachedResource;
    self->_id cachedResource = v5;
  }
  p_resourceType = &self->_resourceType;
  if (self->_resourceType == 1)
  {
    id v8 = self->_cachedResource;
  }
  else
  {
    if (self->_resourceType)
    {
      id v10 = avt_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(AVTAsset *)p_resourceType instantiateResource];
      }

      uint64_t v9 = 0;
      goto LABEL_13;
    }
    AVTCloneNodesAndMaterials(self->_cachedResource);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = v8;
LABEL_13:
  os_unfair_lock_unlock(p_cacheLock);
LABEL_14:
  return v9;
}

- (id)assetImageForAsset:(id)a3
{
  perAssetMain = self->_perAssetMain;
  v4 = [a3 identifier];
  id v5 = [(NSDictionary *)perAssetMain objectForKeyedSubscript:v4];

  return v5;
}

- (int64_t)componentType
{
  return self->_componentType;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)specializationSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (NSDictionary)layers
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- ($3C463231000E010C6CB72584ADC5493D)uvRemappingInfo
{
  objc_copyStruct(v2, &self->_uvRemappingInfo, 32, 1, 0);
  return v3;
}

- (unint64_t)editableColorCount
{
  return self->_editableColorCount;
}

- (NSString)ambientOcclusion
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perAssetMain, 0);
  objc_storeStrong((id *)&self->_wrapDeformerDriverNames, 0);
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_specializationSettings, 0);
  objc_storeStrong(&self->_cachedResource, 0);
  objc_storeStrong((id *)&self->_highlights, 0);
  objc_storeStrong((id *)&self->_ambientOcclusion, 0);
  objc_storeStrong((id *)&self->_materialVariantDependencies, 0);
  objc_storeStrong((id *)&self->_imageVariantDependencies, 0);
  objc_storeStrong((id *)&self->_morphVariantDependencies, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithType:(os_log_t)log identifier:path:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "plist";
}

- (void)instantiateResource
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  id v5 = [a2 description];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_20B819000, a3, OS_LOG_TYPE_ERROR, "Error: could not load scene at %@ with error: %@", (uint8_t *)&v6, 0x16u);
}

@end