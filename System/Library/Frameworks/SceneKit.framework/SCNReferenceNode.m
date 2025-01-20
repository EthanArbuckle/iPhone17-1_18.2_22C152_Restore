@interface SCNReferenceNode
+ (BOOL)supportsSecureCoding;
+ (SCNReferenceNode)referenceNodeWithURL:(NSURL *)referenceURL;
- (BOOL)_isAReference;
- (BOOL)_isNameUnique:(id)a3;
- (BOOL)isLoaded;
- (NSURL)referenceURL;
- (SCNReferenceLoadingPolicy)loadingPolicy;
- (SCNReferenceNode)initWithCoder:(NSCoder *)aDecoder;
- (SCNReferenceNode)initWithURL:(NSURL *)referenceURL;
- (id)_catalog;
- (id)_loadReferencedSceneWithURL:(id)a3 catalog:(id)a4;
- (id)_resolveURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)overrides;
- (void)_applyOverride:(id)a3 forKeyPath:(id)a4;
- (void)_applyOverrides;
- (void)_applyUnsharing:(id)a3 alreadyShared:(id)a4;
- (void)_diffNode:(id)a3 with:(id)a4 path:(id)a5;
- (void)_diffObject:(id)a3 with:(id)a4 path:(id)a5;
- (void)_loadWithCatalog:(id)a3;
- (void)_loadWithURL:(id)a3;
- (void)_loadWithURL:(id)a3 catalog:(id)a4;
- (void)addOverride:(id)a3 forKeyPath:(id)a4;
- (void)collectOverrides;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)load;
- (void)removeAllOverrides;
- (void)removeForKeyPath:(id)a3;
- (void)setLoadingPolicy:(SCNReferenceLoadingPolicy)loadingPolicy;
- (void)setOverride:(id)a3 forKeyPath:(id)a4;
- (void)setOverrides:(id)a3;
- (void)setReferenceURL:(NSURL *)referenceURL;
- (void)unload;
@end

@implementation SCNReferenceNode

- (SCNReferenceNode)initWithURL:(NSURL *)referenceURL
{
  v7.receiver = self;
  v7.super_class = (Class)SCNReferenceNode;
  v4 = [(SCNNode *)&v7 init];
  v5 = v4;
  if (v4) {
    [(SCNReferenceNode *)v4 setReferenceURL:referenceURL];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNReferenceNode;
  [(SCNNode *)&v3 dealloc];
}

+ (SCNReferenceNode)referenceNodeWithURL:(NSURL *)referenceURL
{
  objc_super v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithURL:referenceURL];

  return (SCNReferenceNode *)v3;
}

- (void)_diffObject:(id)a3 with:(id)a4 path:(id)a5
{
  id v19 = a5;
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (_diffObject_with_path__onceToken != -1) {
    dispatch_once(&_diffObject_with_path__onceToken, &__block_literal_global_38);
  }
  v5 = (objc_class *)objc_opt_class();
  unsigned int outCount = 0;
  v6 = class_copyPropertyList(v5, &outCount);
  objc_super v7 = (void *)[MEMORY[0x263EFF980] array];
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      v9 = v6[i];
      Attributes = property_getAttributes(v9);
      if (strcmp((const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", Attributes), "componentsSeparatedByString:", @","), "objectAtIndex:", 0), "substringFromIndex:", 1), "UTF8String"), "{CATransform3D=dddddddddddddddd}"))
      {
        objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", Attributes), "rangeOfString:", @",R,");
        if (v11 != 3) {
          objc_msgSend(v7, "addObject:", objc_msgSend(NSString, "stringWithUTF8String:", property_getName(v9)));
        }
      }
    }
  }
  free(v6);
  [(SCNReferenceNode *)self willChangeValueForKey:@"overrides"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v12 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v7);
        }
        v15 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        if ((objc_msgSend((id)_diffObject_with_path__skippedProperies, "containsObject:", v15, v19) & 1) == 0
          && ([v15 hasPrefix:@"_"] & 1) == 0
          && ([v15 hasPrefix:@"ide_"] & 1) == 0
          && ([v15 hasPrefix:@"ske_"] & 1) == 0
          && ([v15 hasPrefix:@"simd"] & 1) == 0)
        {
          v16 = (void *)[a3 valueForKey:v15];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v17 = (void *)[a4 valueForKey:v15];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = (void *)[v16 lastPathComponent];
              v17 = (void *)[v17 lastPathComponent];
            }
            else
            {
              v18 = v16;
            }
            if (([v18 isEqual:v17] & 1) == 0) {
              -[NSMutableDictionary setValue:forKey:](self->_overrides, "setValue:forKey:", v16, objc_msgSend((id)objc_msgSend(v19, "stringByAppendingString:", @"."), "stringByAppendingString:", v15));
            }
          }
        }
      }
      uint64_t v12 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v12);
  }
  [(SCNReferenceNode *)self didChangeValueForKey:@"overrides", v19];
}

id __42__SCNReferenceNode__diffObject_with_path___block_invoke()
{
  id result = (id)[MEMORY[0x263EFFA08] setWithArray:&unk_26BFC1768];
  _diffObject_with_path__skippedProperies = (uint64_t)result;
  return result;
}

- (BOOL)_isNameUnique:(id)a3
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__SCNReferenceNode__isNameUnique___block_invoke;
  v5[3] = &unk_2640069C8;
  v5[4] = a3;
  v5[5] = &v6;
  [(SCNNode *)self enumerateHierarchyUsingBlock:v5];
  BOOL v3 = *((_DWORD *)v7 + 6) == 1;
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__SCNReferenceNode__isNameUnique___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", *(void *)(a1 + 32));
  if (result)
  {
    if (++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 2) {
      *a3 = 1;
    }
  }
  return result;
}

- (void)_diffNode:(id)a3 with:(id)a4 path:(id)a5
{
  if ([a3 name]
    && (objc_msgSend((id)objc_msgSend(a3, "name"), "containsString:", @".") & 1) == 0
    && -[SCNReferenceNode _isNameUnique:](self, "_isNameUnique:", [a3 name]))
  {
    a5 = (id)objc_msgSend(@"/", "stringByAppendingString:", objc_msgSend(a3, "name"));
  }
  id v24 = a4;
  [(SCNReferenceNode *)self _diffObject:a3 with:a4 path:a5];
  id v23 = a3;
  if ([a3 geometry] && objc_msgSend(a4, "geometry"))
  {
    -[SCNReferenceNode _diffObject:with:path:](self, "_diffObject:with:path:", [a3 geometry], objc_msgSend(a4, "geometry"), objc_msgSend((id)objc_msgSend(a5, "stringByAppendingString:", @"."), "stringByAppendingString:", @"geometry"));
    uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "materials"), "count");
    if (v9 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(v24, "geometry"), "materials"), "count"))
    {
      v28 = objc_msgSend((id)objc_msgSend(a3, "geometry"), "materials");
      v27 = objc_msgSend((id)objc_msgSend(v24, "geometry"), "materials");
      if (v9)
      {
        uint64_t v10 = 0;
        uint64_t v25 = v9;
        id v26 = a5;
        do
        {
          uint64_t v11 = (void *)[v28 objectAtIndexedSubscript:v10];
          uint64_t v12 = (void *)[v27 objectAtIndexedSubscript:v10];
          uint64_t v29 = v10;
          uint64_t v13 = (void *)[(id)objc_msgSend(a5 stringByAppendingString:@".", "stringByAppendingString:", objc_msgSend(NSString, "stringWithFormat:", @"geometry.materials[%d]", v10)];
          [(SCNReferenceNode *)self _diffObject:v11 with:v12 path:v13];
          v14 = (void *)[v11 properties];
          v15 = (void *)[v12 properties];
          uint64_t v16 = [v14 count];
          if ([v15 count] == v16)
          {
            if (v16)
            {
              for (uint64_t i = 0; i != v16; ++i)
                -[SCNReferenceNode _diffObject:with:path:](self, "_diffObject:with:path:", [v14 objectAtIndexedSubscript:i], objc_msgSend(v15, "objectAtIndexedSubscript:", i), objc_msgSend((id)objc_msgSend(v13, "stringByAppendingString:", @"."), "stringByAppendingString:", objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", i), "slotName")));
            }
          }
          else
          {
            v18 = scn_default_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[SCNReferenceNode _diffNode:with:path:](&buf, v31, v18);
            }
          }
          ++v10;
          a5 = v26;
        }
        while (v29 + 1 != v25);
      }
    }
    else
    {
      id v19 = scn_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[SCNReferenceNode _diffNode:with:path:]();
      }
    }
  }
  if (objc_msgSend((id)objc_msgSend(v23, "particleSystems"), "count")
    && objc_msgSend((id)objc_msgSend(v24, "particleSystems"), "count"))
  {
    -[SCNReferenceNode _diffObject:with:path:](self, "_diffObject:with:path:", objc_msgSend((id)objc_msgSend(v23, "particleSystems"), "objectAtIndexedSubscript:", 0), objc_msgSend((id)objc_msgSend(v24, "particleSystems"), "objectAtIndexedSubscript:", 0), objc_msgSend((id)objc_msgSend(a5, "stringByAppendingString:", @"."), "stringByAppendingString:", @"particleSystems[0]"));
  }
  uint64_t v20 = objc_msgSend((id)objc_msgSend(v23, "childNodes"), "count");
  if (v20 == objc_msgSend((id)objc_msgSend(v24, "childNodes"), "count"))
  {
    if (v20)
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        a5 = (id)[(id)objc_msgSend(a5 stringByAppendingString:@".", "stringByAppendingString:", objc_msgSend(NSString, "stringWithFormat:", @"[%d]", j)];
        -[SCNReferenceNode _diffNode:with:path:](self, "_diffNode:with:path:", objc_msgSend((id)objc_msgSend(v23, "childNodes"), "objectAtIndexedSubscript:", j), objc_msgSend((id)objc_msgSend(v24, "childNodes"), "objectAtIndexedSubscript:", j), a5);
      }
    }
  }
  else
  {
    v22 = scn_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[SCNReferenceNode _diffNode:with:path:]();
    }
  }
}

- (void)collectOverrides
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: inconsistency - hierarchy changed - can't diff reference node", v2, v3, v4, v5, v6);
}

- (void)addOverride:(id)a3 forKeyPath:(id)a4
{
  [(SCNReferenceNode *)self willChangeValueForKey:@"overrides"];
  overrides = self->_overrides;
  if (!overrides)
  {
    overrides = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    self->_overrides = overrides;
  }
  [(NSMutableDictionary *)overrides setObject:a3 forKey:a4];

  [(SCNReferenceNode *)self didChangeValueForKey:@"overrides"];
}

- (void)removeForKeyPath:(id)a3
{
  [(SCNReferenceNode *)self willChangeValueForKey:@"overrides"];
  [(NSMutableDictionary *)self->_overrides removeObjectForKey:a3];
  if (![(NSMutableDictionary *)self->_overrides count])
  {

    self->_overrides = 0;
  }

  [(SCNReferenceNode *)self didChangeValueForKey:@"overrides"];
}

- (void)removeAllOverrides
{
  [(SCNReferenceNode *)self willChangeValueForKey:@"overrides"];
  [(NSMutableDictionary *)self->_overrides removeAllObjects];

  self->_overrides = 0;

  [(SCNReferenceNode *)self didChangeValueForKey:@"overrides"];
}

- (id)overrides
{
  return self->_overrides;
}

- (void)setOverrides:(id)a3
{
  [(SCNReferenceNode *)self willChangeValueForKey:@"overrides"];

  self->_overrides = (NSMutableDictionary *)[a3 mutableCopy];

  [(SCNReferenceNode *)self didChangeValueForKey:@"overrides"];
}

- (void)_applyOverride:(id)a3 forKeyPath:(id)a4
{
}

- (void)_applyUnsharing:(id)a3 alreadyShared:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a4, "containsObject:")) {
    return;
  }
  [a4 addObject:a3];
  uint64_t v7 = [a3 rangeOfString:@"." options:4];
  if (v8 != 1) {
    return;
  }
  uint64_t v9 = v7;
  uint64_t v10 = v7 + 1;
  if (v7 + 1 >= (unint64_t)[a3 length]) {
    return;
  }
  uint64_t v11 = [a3 substringToIndex:v9];
  uint64_t v12 = (void *)[a3 substringFromIndex:v10];
  id v13 = [(SCNNode *)self valueForKeyPath:v11];
  if (!v13) {
    return;
  }
  id v14 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v12 isEqualToString:@"geometry"])
    {
      v15 = objc_msgSend((id)objc_msgSend(v14, "geometry"), "copy");
      [v14 setGeometry:v15];
LABEL_11:

      goto LABEL_12;
    }
    if ([v12 isEqualToString:@"particleSystems[0]"])
    {
      uint64_t v16 = objc_msgSend((id)objc_msgSend(v14, "particleSystems"), "firstObject");
      if (v16)
      {
        v17 = v16;
        v15 = (void *)[v16 copy];
        [v14 removeParticleSystem:v17];
        [v14 addParticleSystem:v15];
        goto LABEL_11;
      }
    }
  }
LABEL_12:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return;
  }
  if (([a4 containsObject:v11] & 1) == 0)
  {
    [(SCNReferenceNode *)self _applyUnsharing:v11 alreadyShared:a4];
    id v14 = [(SCNNode *)self valueForKeyPath:v11];
  }
  if ([v12 isEqualToString:@"firstMaterial"])
  {
    unint64_t v18 = 0;
    goto LABEL_17;
  }
  if ([v12 isEqualToString:@"materials"])
  {
    id v19 = (id)objc_msgSend((id)objc_msgSend(v14, "materials"), "copy");
    [v14 setMaterials:v19];
  }
  else
  {
    uint64_t v21 = [v12 rangeOfString:@"["];
    if (v22 == 1)
    {
      id v23 = (void *)[v12 substringFromIndex:v21 + 1];
      uint64_t v24 = [v23 rangeOfString:@"]"];
      if (v25 == 1)
      {
        unint64_t v18 = objc_msgSend((id)objc_msgSend(v23, "substringToIndex:", v24), "integerValue");
LABEL_17:
        if (v18 >= objc_msgSend((id)objc_msgSend(v14, "materials"), "count"))
        {
          uint64_t v20 = scn_default_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint8_t buf = 138412802;
            id v30 = a3;
            __int16 v31 = 1024;
            int v32 = v18;
            __int16 v33 = 1024;
            int v34 = objc_msgSend((id)objc_msgSend(v14, "materials"), "count");
            _os_log_error_impl(&dword_20B249000, v20, OS_LOG_TYPE_ERROR, "Error: failed to evaluate key path %@ - material index %d out of bounds (%d)", buf, 0x18u);
          }
        }
        else
        {
          id v28 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "materials"), "objectAtIndexedSubscript:", v18), "copy");
          objc_msgSend(v14, "replaceMaterialAtIndex:withMaterial:", v18);
        }
        return;
      }
      v27 = scn_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[SCNReferenceNode _applyUnsharing:alreadyShared:]();
      }
    }
    else
    {
      id v26 = scn_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[SCNReferenceNode _applyUnsharing:alreadyShared:]();
      }
    }
  }
}

- (void)_applyOverrides
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  overrides = self->_overrides;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__SCNReferenceNode__applyOverrides__block_invoke;
  v7[3] = &unk_2640069F0;
  v7[4] = self;
  v7[5] = v3;
  [(NSMutableDictionary *)overrides enumerateKeysAndObjectsUsingBlock:v7];
  uint64_t v5 = self->_overrides;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__SCNReferenceNode__applyOverrides__block_invoke_2;
  v6[3] = &unk_264006110;
  v6[4] = self;
  [(NSMutableDictionary *)v5 enumerateKeysAndObjectsUsingBlock:v6];
}

uint64_t __35__SCNReferenceNode__applyOverrides__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _applyUnsharing:a2 alreadyShared:*(void *)(a1 + 40)];
}

uint64_t __35__SCNReferenceNode__applyOverrides__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _applyOverride:a3 forKeyPath:a2];
}

- (void)setOverride:(id)a3 forKeyPath:(id)a4
{
  [(SCNReferenceNode *)self willChangeValueForKey:@"overrides"];
  if (!self->_overrides) {
    self->_overrides = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  [(SCNReferenceNode *)self didChangeValueForKey:@"overrides"];

  [(SCNReferenceNode *)self _applyOverride:a3 forKeyPath:a4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNReferenceNode;
  uint64_t v4 = [(SCNNode *)&v6 copyWithZone:a3];
  [v4 setReferenceURL:self->_referenceURL];
  [v4 setLoadingPolicy:self->_loadingPolicy];
  v4[37] = [(NSURL *)self->_catalogURL copy];
  v4[35] = [(NSMutableDictionary *)self->_overrides mutableCopy];
  return v4;
}

- (BOOL)_isAReference
{
  return 1;
}

- (NSURL)referenceURL
{
  return self->_referenceURL;
}

- (void)setReferenceURL:(NSURL *)referenceURL
{
  id v3 = self->_referenceURL;
  if (v3 != referenceURL)
  {

    self->_referenceURL = (NSURL *)[(NSURL *)referenceURL copy];
  }
}

- (id)_catalog
{
  if (!self->_catalogURL
    || (id result = +[SCNAssetCatalog assetCatalogWithURL:](SCNAssetCatalog, "assetCatalogWithURL:")) == 0)
  {
    id result = (id)SCNGetResourceBundle();
    if (result)
    {
      uint64_t v3 = [result bundleURL];
      return +[SCNAssetCatalog assetCatalogWithURL:v3];
    }
  }
  return result;
}

- (id)_resolveURL
{
  referenceURL = self->_referenceURL;
  if (!referenceURL) {
    return 0;
  }
  if ([(NSURL *)self->_referenceURL scheme] && ![(NSURL *)referenceURL isFileURL]) {
    return referenceURL;
  }
  uint64_t v4 = [(NSURL *)referenceURL relativePath];
  if ([(NSString *)v4 isAbsolutePath]) {
    return referenceURL;
  }
  sourceDocumentURL = self->_sourceDocumentURL;
  if (sourceDocumentURL)
  {
    uint64_t v5 = [[(NSURL *)sourceDocumentURL URLByDeletingLastPathComponent] URLByAppendingPathComponent:v4];
    if (C3DFileMayExistAtURL((const __CFURL *)v5)) {
      return v5;
    }
  }
  catalogURL = self->_catalogURL;
  uint64_t v5 = referenceURL;
  if (!catalogURL) {
    return v5;
  }

  return [(NSURL *)catalogURL URLByAppendingPathComponent:v4];
}

- (void)unload
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(SCNNode *)self childNodes];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) removeFromParentNode];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  self->_loaded = 0;
}

- (BOOL)isLoaded
{
  return self->_loaded;
}

- (void)load
{
}

- (id)_loadReferencedSceneWithURL:(id)a3 catalog:(id)a4
{
  if (a3)
  {
    if (a4 || (a4 = [(SCNReferenceNode *)self _catalog]) != 0)
    {
      return (id)[a4 sceneWithURL:a3];
    }
    else
    {
      return +[SCNScene sceneWithURL:a3 options:0 error:0];
    }
  }
  else
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNReferenceNode _loadReferencedSceneWithURL:catalog:]();
    }
    return 0;
  }
}

- (void)_loadWithCatalog:(id)a3
{
  if (!self->_loaded)
  {
    id v5 = [(SCNReferenceNode *)self _resolveURL];
    [(SCNReferenceNode *)self _loadWithURL:v5 catalog:a3];
  }
}

- (void)_loadWithURL:(id)a3
{
}

- (void)_loadWithURL:(id)a3 catalog:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v7 = +[SCNTransaction valueForKey:@"SCNReferenceLoadingStack"];
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      +[SCNTransaction setValue:v7 forKey:@"SCNReferenceLoadingStack"];
    }
    if ([v7 containsObject:a3])
    {
      long long v8 = scn_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SCNReferenceNode _loadWithURL:catalog:]();
      }
    }
    else
    {
      [v7 addObject:a3];
      id v10 = [(SCNReferenceNode *)self _loadReferencedSceneWithURL:a3 catalog:a4];
      [v7 removeObject:a3];
      if (v10)
      {
        self->_loaded = 1;
        long long v11 = self;
        if (C3DWasLinkedBeforeMajorOSYear2017())
        {
          long long v11 = +[SCNNode node];
          [(SCNNode *)v11 setName:@"referenceRoot"];
        }
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "rootNode"), "clone"), "childNodes", 0);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v18;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v18 != v15) {
                objc_enumerationMutation(v12);
              }
              [(SCNNode *)v11 addChildNode:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v14);
        }
        -[SCNNode _copyAnimationsFrom:](v11, "_copyAnimationsFrom:", [v10 rootNode]);
        if (v11 != self) {
          [(SCNNode *)self addChildNode:v11];
        }
        [(SCNReferenceNode *)self _applyOverrides];
      }
    }
  }
  else
  {
    long long v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNReferenceNode _loadReferencedSceneWithURL:catalog:]();
    }
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p url=%@>", NSStringFromClass(v4), self, self->_referenceURL];
}

- (void)encodeWithCoder:(id)a3
{
  referenceURL = self->_referenceURL;
  if (referenceURL) {
    [a3 encodeObject:referenceURL forKey:@"referenceURL"];
  }
  [a3 encodeInteger:self->_loadingPolicy forKey:@"loadingPolicy"];
  overrides = self->_overrides;
  if (overrides) {
    [a3 encodeObject:overrides forKey:@"overrides"];
  }
  v7.receiver = self;
  v7.super_class = (Class)SCNReferenceNode;
  [(SCNNode *)&v7 encodeWithCoder:a3];
}

- (SCNReferenceNode)initWithCoder:(NSCoder *)aDecoder
{
  v9[2] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)SCNReferenceNode;
  uint64_t v4 = -[SCNNode initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x263EFFA08];
    v9[0] = objc_opt_class();
    v9[1] = objc_opt_class();
    -[SCNReferenceNode setReferenceURL:](v4, "setReferenceURL:", -[NSCoder decodeObjectOfClasses:forKey:](aDecoder, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v9, 2)), @"referenceURL"));
    [(SCNReferenceNode *)v4 setLoadingPolicy:[(NSCoder *)aDecoder decodeIntegerForKey:@"loadingPolicy"]];
    v4->_overrides = (NSMutableDictionary *)objc_msgSend(-[NSCoder decodeObjectOfClasses:forKey:](aDecoder, "decodeObjectOfClasses:forKey:", SCNUserInfoClasses(), @"overrides"), "mutableCopy");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void *)[(NSCoder *)aDecoder assetCatalog];
      v4->_catalogURL = (NSURL *)(id)[v6 catalogURL];
      v4->_sourceDocumentURL = (NSURL *)(id)[(NSCoder *)aDecoder documentURL];
    }
    else
    {
      uint64_t v6 = 0;
    }
    if (![(NSCoder *)aDecoder containsValueForKey:@"childNodes"] && !v4->_loadingPolicy) {
      [(SCNReferenceNode *)v4 _loadWithCatalog:v6];
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCNReferenceLoadingPolicy)loadingPolicy
{
  return self->_loadingPolicy;
}

- (void)setLoadingPolicy:(SCNReferenceLoadingPolicy)loadingPolicy
{
  self->_loadingPolicy = loadingPolicy;
}

- (void)_diffNode:with:path:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: inconsistency - hierarchy doesn't match - can't diff reference node", v2, v3, v4, v5, v6);
}

- (void)_diffNode:(uint8_t *)buf with:(unsigned char *)a2 path:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: inconsistency - material has custom properties - can't diff reference node", buf, 2u);
}

- (void)_diffNode:with:path:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: inconsistency - material count doesn't match - can't diff reference node", v2, v3, v4, v5, v6);
}

- (void)_applyUnsharing:alreadyShared:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: failed to parse key path %@ - missing ']'", v2, v3, v4, v5, v6);
}

- (void)_applyUnsharing:alreadyShared:.cold.2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: failed to parse key path %@ - missing '['", v2, v3, v4, v5, v6);
}

- (void)_loadReferencedSceneWithURL:catalog:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: failed to locate scene reference %@", v2, v3, v4, v5, v6);
}

- (void)_loadWithURL:catalog:.cold.2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: failed to resolve referenced scene (%@) cycle detected", v2, v3, v4, v5, v6);
}

@end