@interface MDLMaterial
+ (id)decodeMaterialWithCoder:(id)a3 allocator:(id)a4;
- (BidirectionalScatteringDistributionFunction)bsdf;
- (MDLMaterial)baseMaterial;
- (MDLMaterial)init;
- (MDLMaterial)initWithName:(NSString *)name scatteringFunction:(MDLScatteringFunction *)scatteringFunction;
- (MDLMaterial)initWithName:(id)a3;
- (MDLMaterial)initWithName:(id)a3 physicallyPlausibleBSDF:(PhysicallyPlausibleDistribution *)a4;
- (MDLMaterialFace)materialFace;
- (MDLMaterialProperty)objectAtIndexedSubscript:(NSUInteger)idx;
- (MDLMaterialProperty)objectForKeyedSubscript:(NSString *)name;
- (MDLMaterialProperty)propertyNamed:(NSString *)name;
- (MDLMaterialProperty)propertyWithSemantic:(MDLMaterialSemantic)semantic;
- (MDLScatteringFunction)scatteringFunction;
- (NSArray)propertiesWithSemantic:(MDLMaterialSemantic)semantic;
- (NSString)name;
- (NSUInteger)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)conformToMatProperties;
- (void)encodeMaterialWithCoder:(id)a3 allocator:(id)a4;
- (void)loadTexturesUsingArchiveAssetResolver:(id)a3 cache:(id)a4;
- (void)loadTexturesUsingResolver:(id)a3 cache:(id)a4;
- (void)loadTexturesUsingResolver:(id)resolver;
- (void)removeAllProperties;
- (void)removeProperty:(MDLMaterialProperty *)property;
- (void)resolveTexturesWithResolver:(id)resolver;
- (void)setBaseMaterial:(MDLMaterial *)baseMaterial;
- (void)setMaterialFace:(MDLMaterialFace)materialFace;
- (void)setName:(NSString *)name;
- (void)setProperty:(MDLMaterialProperty *)property;
- (void)setScatteringFunction:(id)a3;
@end

@implementation MDLMaterial

- (MDLScatteringFunction)scatteringFunction
{
  scatteringFunction = self->_scatteringFunction;
  if (!scatteringFunction)
  {
    v4 = objc_opt_new();
    objc_msgSend_setScatteringFunction_(self, v5, (uint64_t)v4);

    scatteringFunction = self->_scatteringFunction;
  }

  return scatteringFunction;
}

- (void)setScatteringFunction:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_scatteringFunction, a3);
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  builtinProperties = self->_builtinProperties;
  self->_builtinProperties = v6;

  unsigned int outCount = 0;
  v8 = (objc_class *)objc_opt_class();
  v9 = class_copyPropertyList(v8, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      Attributes = (char *)property_getAttributes(v9[i]);
      if (strstr(Attributes, "MDLMaterialProperty"))
      {
        v12 = NSString;
        Name = property_getName(v9[i]);
        v15 = objc_msgSend_stringWithFormat_(v12, v14, @"%s", Name);
        v17 = objc_msgSend_valueForKey_(v5, v16, (uint64_t)v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend_addObject_(self->_builtinProperties, v18, (uint64_t)v17);
        }
      }
    }
  }
  free(v9);
  v21 = (objc_class *)objc_msgSend_superclass(v5, v19, v20);
  v22 = class_copyPropertyList(v21, &outCount);
  if (outCount)
  {
    for (unint64_t j = 0; j < outCount; ++j)
    {
      v24 = (char *)property_getAttributes(v22[j]);
      if (strstr(v24, "MDLMaterialProperty"))
      {
        v25 = NSString;
        v26 = property_getName(v22[j]);
        v28 = objc_msgSend_stringWithFormat_(v25, v27, @"%s", v26);
        v30 = objc_msgSend_valueForKey_(v5, v29, (uint64_t)v28);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend_addObject_(self->_builtinProperties, v31, (uint64_t)v30);
        }
      }
    }
  }
  free(v22);
}

- (void)resolveTexturesWithResolver:(id)resolver
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v4 = resolver;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v53 = self;
  v6 = self->_builtinProperties;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v62, v68, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v63;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v63 != v11) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v62 + 1) + 8 * v12);
        v14 = objc_msgSend_URLValue(v13, v8, v9);
        if (v14)
        {
        }
        else
        {
          v17 = objc_msgSend_stringValue(v13, v15, v16);
          if (v17)
          {
            v18 = objc_msgSend_stringValue(v13, v8, v9);
            BOOL v21 = objc_msgSend_length(v18, v19, v20) == 0;

            if (!v21) {
              objc_msgSend_addObject_(v5, v8, (uint64_t)v13);
            }
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v62, v68, 16);
      uint64_t v10 = v22;
    }
    while (v22);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v23 = v53->_userProperties;
  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v58, v67, 16);
  if (v27)
  {
    uint64_t v28 = *(void *)v59;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v59 != v28) {
          objc_enumerationMutation(v23);
        }
        v30 = *(void **)(*((void *)&v58 + 1) + 8 * v29);
        v31 = objc_msgSend_URLValue(v30, v25, v26);
        if (v31)
        {
        }
        else
        {
          v34 = objc_msgSend_stringValue(v30, v32, v33);
          if (v34)
          {
            v35 = objc_msgSend_stringValue(v30, v25, v26);
            BOOL v38 = objc_msgSend_length(v35, v36, v37) == 0;

            if (!v38) {
              objc_msgSend_addObject_(v5, v25, (uint64_t)v30);
            }
          }
        }
        ++v29;
      }
      while (v27 != v29);
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v58, v67, 16);
      uint64_t v27 = v39;
    }
    while (v39);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v40 = v5;
  uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v54, v66, 16);
  if (v44)
  {
    uint64_t v45 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v55 != v45) {
          objc_enumerationMutation(v40);
        }
        v47 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v48 = objc_msgSend_stringValue(v47, v42, v43);
        v50 = objc_msgSend_resolveAssetNamed_(v4, v49, (uint64_t)v48);
        objc_msgSend_setURLValue_(v47, v51, (uint64_t)v50);

        objc_msgSend_setType_(v47, v52, 1);
      }
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v42, (uint64_t)&v54, v66, 16);
    }
    while (v44);
  }
}

- (void)loadTexturesUsingArchiveAssetResolver:(id)a3 cache:(id)a4
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v62 = a3;
  id v6 = a4;
  id v63 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v7 = self->_builtinProperties;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v72, v78, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v73 != v12) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        v15 = objc_msgSend_stringValue(v14, v9, v10, v62);
        if (v15)
        {
          uint64_t v16 = objc_msgSend_stringValue(v14, v9, v10);
          BOOL v19 = objc_msgSend_length(v16, v17, v18) == 0;

          if (!v19) {
            objc_msgSend_addObject_(v63, v9, (uint64_t)v14);
          }
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v72, v78, 16);
    }
    while (v11);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v20 = self->_userProperties;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v68, v77, 16);
  if (v24)
  {
    uint64_t v25 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v69 != v25) {
          objc_enumerationMutation(v20);
        }
        uint64_t v27 = *(void **)(*((void *)&v68 + 1) + 8 * j);
        uint64_t v28 = objc_msgSend_stringValue(v27, v22, v23, v62);
        if (v28)
        {
          uint64_t v29 = objc_msgSend_stringValue(v27, v22, v23);
          BOOL v32 = objc_msgSend_length(v29, v30, v31) == 0;

          if (!v32) {
            objc_msgSend_addObject_(v63, v22, (uint64_t)v27);
          }
        }
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v68, v77, 16);
    }
    while (v24);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v33 = v63;
  uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v64, v76, 16);
  if (v37)
  {
    uint64_t v38 = *(void *)v65;
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v65 != v38) {
          objc_enumerationMutation(v33);
        }
        id v40 = *(void **)(*((void *)&v64 + 1) + 8 * k);
        if (!v6)
        {
          v47 = objc_msgSend_stringValue(*(void **)(*((void *)&v64 + 1) + 8 * k), v35, v36);
          uint64_t v49 = objc_msgSend_textureNamed_assetResolver_(MDLTexture, v50, (uint64_t)v47, v62);
          goto LABEL_30;
        }
        v41 = objc_msgSend_stringValue(*(void **)(*((void *)&v64 + 1) + 8 * k), v35, v36);
        uint64_t v43 = objc_msgSend_objectForKey_(v6, v42, (uint64_t)v41);
        BOOL v44 = v43 == 0;

        if (!v44)
        {
          v47 = objc_msgSend_stringValue(v40, v45, v46);
          uint64_t v49 = objc_msgSend_objectForKey_(v6, v48, (uint64_t)v47);
LABEL_30:
          v51 = (void *)v49;
          goto LABEL_32;
        }
        v52 = objc_msgSend_stringValue(v40, v45, v46);
        v51 = objc_msgSend_textureNamed_assetResolver_(MDLTexture, v53, (uint64_t)v52, v62);

        v47 = objc_msgSend_stringValue(v40, v54, v55);
        objc_msgSend_setObject_forKeyedSubscript_(v6, v56, (uint64_t)v51, v47);
LABEL_32:

        if (v51)
        {
          objc_msgSend_textureSamplerValue(v40, v57, v58);
          long long v60 = (MDLTextureSampler *)objc_claimAutoreleasedReturnValue();
          if (!v60) {
            long long v60 = objc_alloc_init(MDLTextureSampler);
          }
          objc_msgSend_setTexture_(v60, v59, (uint64_t)v51, v62);
          objc_msgSend_setTextureSamplerValue_(v40, v61, (uint64_t)v60);
        }
      }
      uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v35, (uint64_t)&v64, v76, 16);
    }
    while (v37);
  }
}

- (void)loadTexturesUsingResolver:(id)a3 cache:(id)a4
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v59 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_msgSend_resolveTexturesWithResolver_(self, v9, (uint64_t)v59);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v10 = self->_builtinProperties;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v68, v74, 16);
    if (v14)
    {
      uint64_t v15 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v69 != v15) {
            objc_enumerationMutation(v10);
          }
          v17 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend_URLValue(v17, v12, v13);
          BOOL v19 = v18 == 0;

          if (!v19) {
            objc_msgSend_addObject_(v8, v12, (uint64_t)v17);
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v68, v74, 16);
      }
      while (v14);
    }

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v20 = self->_userProperties;
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v64, v73, 16);
    if (v24)
    {
      uint64_t v25 = *(void *)v65;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v65 != v25) {
            objc_enumerationMutation(v20);
          }
          uint64_t v27 = *(void **)(*((void *)&v64 + 1) + 8 * j);
          uint64_t v28 = objc_msgSend_URLValue(v27, v22, v23);
          BOOL v29 = v28 == 0;

          if (!v29) {
            objc_msgSend_addObject_(v8, v22, (uint64_t)v27);
          }
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v64, v73, 16);
      }
      while (v24);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v30 = v8;
    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v60, v72, 16);
    if (!v34)
    {
LABEL_38:

      goto LABEL_39;
    }
    uint64_t v35 = *(void *)v61;
LABEL_23:
    uint64_t v36 = 0;
    while (1)
    {
      if (*(void *)v61 != v35) {
        objc_enumerationMutation(v30);
      }
      uint64_t v37 = *(void **)(*((void *)&v60 + 1) + 8 * v36);
      if (v6)
      {
        uint64_t v38 = objc_msgSend_URLValue(*(void **)(*((void *)&v60 + 1) + 8 * v36), v32, v33);
        id v40 = objc_msgSend_objectForKey_(v6, v39, (uint64_t)v38);
        BOOL v41 = v40 == 0;

        if (v41)
        {
          uint64_t v49 = objc_msgSend_URLValue(v37, v42, v43);
          v48 = objc_msgSend_textureWithURL_(MDLTexture, v50, (uint64_t)v49);

          BOOL v44 = objc_msgSend_URLValue(v37, v51, v52);
          objc_msgSend_setObject_forKeyedSubscript_(v6, v53, (uint64_t)v48, v44);
          goto LABEL_32;
        }
        BOOL v44 = objc_msgSend_URLValue(v37, v42, v43);
        uint64_t v46 = objc_msgSend_objectForKeyedSubscript_(v6, v45, (uint64_t)v44);
      }
      else
      {
        BOOL v44 = objc_msgSend_URLValue(*(void **)(*((void *)&v60 + 1) + 8 * v36), v32, v33);
        uint64_t v46 = objc_msgSend_textureWithURL_(MDLTexture, v47, (uint64_t)v44);
      }
      v48 = (void *)v46;
LABEL_32:

      if (v48)
      {
        objc_msgSend_textureSamplerValue(v37, v54, v55);
        long long v57 = (MDLTextureSampler *)objc_claimAutoreleasedReturnValue();
        if (!v57) {
          long long v57 = objc_alloc_init(MDLTextureSampler);
        }
        objc_msgSend_setTexture_(v57, v56, (uint64_t)v48);
        objc_msgSend_setTextureSamplerValue_(v37, v58, (uint64_t)v57);
      }
      if (v34 == ++v36)
      {
        uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v32, (uint64_t)&v60, v72, 16);
        if (!v34) {
          goto LABEL_38;
        }
        goto LABEL_23;
      }
    }
  }
  objc_msgSend_loadTexturesUsingArchiveAssetResolver_cache_(self, v7, (uint64_t)v59, v6);
LABEL_39:
}

- (void)loadTexturesUsingResolver:(id)resolver
{
}

- (MDLMaterial)init
{
  v11.receiver = self;
  v11.super_class = (Class)MDLMaterial;
  v2 = [(MDLMaterial *)&v11 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_26BF51EF0;

    uint64_t v5 = objc_opt_new();
    userProperties = v3->_userProperties;
    v3->_userProperties = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    objc_msgSend_setScatteringFunction_(v3, v8, (uint64_t)v7);

    uint64_t v9 = v3;
  }

  return v3;
}

- (MDLMaterial)initWithName:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MDLMaterial;
  uint64_t v5 = [(MDLMaterial *)&v15 init];
  v7 = v5;
  if (v5)
  {
    if (v4)
    {
      uint64_t v8 = objc_msgSend_stringWithString_(NSString, v6, (uint64_t)v4);
      name = v7->_name;
      v7->_name = (NSString *)v8;
    }
    else
    {
      name = v5->_name;
      v5->_name = (NSString *)&stru_26BF51EF0;
    }

    uint64_t v10 = objc_opt_new();
    userProperties = v7->_userProperties;
    v7->_userProperties = (NSMutableArray *)v10;

    scatteringFunction = v7->_scatteringFunction;
    v7->_scatteringFunction = 0;

    uint64_t v13 = v7;
  }

  return v7;
}

- (MDLMaterial)initWithName:(NSString *)name scatteringFunction:(MDLScatteringFunction *)scatteringFunction
{
  id v6 = name;
  v7 = scatteringFunction;
  v18.receiver = self;
  v18.super_class = (Class)MDLMaterial;
  uint64_t v8 = [(MDLMaterial *)&v18 init];
  uint64_t v10 = v8;
  if (v8)
  {
    if (v6)
    {
      uint64_t v11 = objc_msgSend_stringWithString_(NSString, v9, (uint64_t)v6);
      uint64_t v12 = v10->_name;
      v10->_name = (NSString *)v11;
    }
    else
    {
      uint64_t v12 = v8->_name;
      v8->_name = (NSString *)&stru_26BF51EF0;
    }

    uint64_t v13 = objc_opt_new();
    userProperties = v10->_userProperties;
    v10->_userProperties = (NSMutableArray *)v13;

    objc_msgSend_setScatteringFunction_(v10, v15, (uint64_t)v7);
    uint64_t v16 = v10;
  }

  return v10;
}

- (MDLMaterial)initWithName:(id)a3 physicallyPlausibleBSDF:(PhysicallyPlausibleDistribution *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MDLMaterial;
  v7 = [(MDLMaterial *)&v19 init];
  uint64_t v9 = v7;
  if (v7)
  {
    if (v6)
    {
      uint64_t v10 = objc_msgSend_stringWithString_(NSString, v8, (uint64_t)v6);
      name = v9->_name;
      v9->_name = (NSString *)v10;
    }
    else
    {
      name = v7->_name;
      v7->_name = (NSString *)&stru_26BF51EF0;
    }

    uint64_t v12 = objc_opt_new();
    userProperties = v9->_userProperties;
    v9->_userProperties = (NSMutableArray *)v12;

    uint64_t v14 = objc_opt_new();
    objc_msgSend_setScatteringFunction_(v9, v15, (uint64_t)v14);
    uint64_t v16 = v14[11];
    *(void *)(v16 + 112) = a4[1].var1.var2;
    *(float *)(v16 + 120) = a4[1].var1.var3;
    *(_OWORD *)(v16 + 96) = *(_OWORD *)&a4[1].var1.var0;
    *(void *)(v16 + 128) = *(void *)&a4[1].var1.var5;
    *(float *)(v16 + 136) = a4[1].var1.var7;
    v17 = v9;
  }
  return v9;
}

- (void)conformToMatProperties
{
  for (uint64_t i = 0; i != 192; i += 4)
  {
    id v4 = objc_msgSend_propertyWithSemantic_(self, a2, (uint64_t)(&off_263FFCDB0)[i + 1]);
    objc_msgSend_setName_(v4, v5, (uint64_t)(&off_263FFCDB0)[i + 3]);
  }
}

- (MDLMaterialProperty)propertyNamed:(NSString *)name
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = name;
  if (v4)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v5 = self->_userProperties;
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v39, v44, 16);
    if (v9)
    {
      uint64_t v10 = *(void *)v40;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend_name(v12, v7, v8);
        char isEqualToString = objc_msgSend_isEqualToString_(v4, v14, (uint64_t)v13);

        if (isEqualToString) {
          goto LABEL_20;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v39, v44, 16);
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v5 = self->_builtinProperties;
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v16, (uint64_t)&v35, v43, 16);
    if (v19)
    {
      uint64_t v20 = *(void *)v36;
LABEL_12:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v35 + 1) + 8 * v21);
        uint64_t v22 = objc_msgSend_name(v12, v17, v18, (void)v35);
        char v24 = objc_msgSend_isEqualToString_(v4, v23, (uint64_t)v22);

        if (v24) {
          break;
        }
        if (v19 == ++v21)
        {
          uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v17, (uint64_t)&v35, v43, 16);
          if (v19) {
            goto LABEL_12;
          }
          goto LABEL_18;
        }
      }
LABEL_20:
      id v32 = v12;
      goto LABEL_21;
    }
LABEL_18:

    uint64_t v27 = objc_msgSend_baseMaterial(self, v25, v26);
    BOOL v28 = v27 == 0;

    if (!v28)
    {
      objc_msgSend_baseMaterial(self, v29, v30);
      uint64_t v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_propertyNamed_(v5, v31, (uint64_t)v4);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
      uint64_t v33 = v32;

      goto LABEL_23;
    }
  }
  uint64_t v33 = 0;
LABEL_23:

  return (MDLMaterialProperty *)v33;
}

- (MDLMaterialProperty)propertyWithSemantic:(MDLMaterialSemantic)semantic
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v5 = self->_userProperties;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v31, v36, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v32;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v32 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
      if (v11[19] == semantic) {
        goto LABEL_19;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v31, v36, 16);
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = self->_builtinProperties;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v12, (uint64_t)&v27, v35, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
LABEL_11:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v28 != v15) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * v16);
      if (v11[19] == semantic) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v13, (uint64_t)&v27, v35, 16);
        if (v14) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_19:
    char v24 = v11;
    goto LABEL_20;
  }
LABEL_17:

  uint64_t v19 = objc_msgSend_baseMaterial(self, v17, v18, (void)v27);
  BOOL v20 = v19 == 0;

  if (!v20)
  {
    objc_msgSend_baseMaterial(self, v21, v22);
    uint64_t v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    char v24 = objc_msgSend_propertyWithSemantic_(v5, v23, semantic);
LABEL_20:
    uint64_t v25 = v24;

    goto LABEL_21;
  }
  uint64_t v25 = 0;
LABEL_21:

  return (MDLMaterialProperty *)v25;
}

- (NSArray)propertiesWithSemantic:(MDLMaterialSemantic)semantic
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF980], a2, semantic);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = self->_userProperties;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v36, v41, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        if (*(void *)(v12 + 152) == semantic) {
          objc_msgSend_addObject_(v5, v8, v12);
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v36, v41, 16);
    }
    while (v9);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v13 = self->_builtinProperties;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v32, v40, 16);
  if (v16)
  {
    uint64_t v17 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        if (*(void *)(v19 + 152) == semantic) {
          objc_msgSend_addObject_(v5, v15, v19, (void)v32);
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v32, v40, 16);
    }
    while (v16);
  }

  if (objc_msgSend_count(v5, v20, v21)
    || (objc_msgSend_baseMaterial(self, v22, v23),
        uint64_t v25 = objc_claimAutoreleasedReturnValue(),
        BOOL v26 = v25 == 0,
        v25,
        v26))
  {
    id v24 = v5;
  }
  else
  {
    long long v29 = objc_msgSend_baseMaterial(self, v27, v28);
    objc_msgSend_propertiesWithSemantic_(v29, v30, semantic);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v24;
}

- (void)setProperty:(MDLMaterialProperty *)property
{
  id v4 = property;
  if (v4)
  {
    uint64_t v11 = v4;
    v7 = objc_msgSend_name(v4, v5, v6);
    uint64_t v9 = objc_msgSend_propertyNamed_(self, v8, (uint64_t)v7);

    if (v9) {
      objc_msgSend_setProperties_(v9, v10, (uint64_t)v11);
    }
    else {
      objc_msgSend_addObject_(self->_userProperties, v10, (uint64_t)v11);
    }

    id v4 = v11;
  }
}

- (void)removeProperty:(MDLMaterialProperty *)property
{
}

- (void)removeAllProperties
{
  self->_userProperties = (NSMutableArray *)objc_opt_new();

  MEMORY[0x270F9A758]();
}

- (BidirectionalScatteringDistributionFunction)bsdf
{
  scatteringFunction = self->_scatteringFunction;
  if (!scatteringFunction)
  {
    id v4 = objc_opt_new();
    objc_msgSend_setScatteringFunction_(self, v5, (uint64_t)v4);

    scatteringFunction = self->_scatteringFunction;
  }
  return scatteringFunction->_bsdf.__ptr_.__value_;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0 = a3->var0;
  unint64_t v12 = 0;
  if (var0 < objc_msgSend_count(self->_builtinProperties, a2, (uint64_t)a3) && a5 != 0)
  {
    do
    {
      uint64_t v14 = objc_msgSend_objectAtIndexedSubscript_(self->_builtinProperties, v10, var0 + v12);
      a4[v12] = v14;

      unint64_t v15 = var0 + v12++ + 1;
    }
    while (v15 < objc_msgSend_count(self->_builtinProperties, v16, v17) && v12 < a5);
  }
  for (unint64_t i = var0 - objc_msgSend_count(self->_builtinProperties, v10, v11);
        i < objc_msgSend_count(self->_userProperties, v19, v20) && v12 < a5;
        ++i)
  {
    id v24 = objc_msgSend_objectAtIndexedSubscript_(self->_userProperties, v22, i);
    a4[v12] = v24;

    ++v12;
  }
  if (a5 > v12) {
    bzero(&a4[v12], 8 * (a5 - v12));
  }
  bzero(&unk_267690C90, 0x400uLL);
  a3->var1 = a4;
  a3->var2 = (unint64_t *)&unk_267690C90;
  a3->var0 += a5;
  return v12;
}

- (MDLMaterialProperty)objectAtIndexedSubscript:(NSUInteger)idx
{
  if (objc_msgSend_count(self->_builtinProperties, a2, idx) <= idx)
  {
    userProperties = self->_userProperties;
    uint64_t v9 = idx - objc_msgSend_count(self->_builtinProperties, v5, v6);
    objc_msgSend_objectAtIndexedSubscript_(userProperties, v10, v9);
    goto LABEL_5;
  }
  if (objc_msgSend_count(self->_builtinProperties, v5, v6) > idx)
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_builtinProperties, v7, idx);
    uint64_t v11 = LABEL_5:;
    goto LABEL_7;
  }
  uint64_t v11 = 0;
LABEL_7:

  return (MDLMaterialProperty *)v11;
}

- (MDLMaterialProperty)objectForKeyedSubscript:(NSString *)name
{
  uint64_t v5 = name;
  if (v5)
  {
    uint64_t v6 = objc_msgSend_propertyNamed_(self, v4, (uint64_t)v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (MDLMaterialProperty *)v6;
}

- (NSUInteger)count
{
  uint64_t v4 = objc_msgSend_count(self->_userProperties, a2, v2);
  return objc_msgSend_count(self->_builtinProperties, v5, v6) + v4;
}

- (void)encodeMaterialWithCoder:(id)a3 allocator:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_count(self->_userProperties, v7, v8);
  objc_msgSend_encodeInteger_forKey_(v26, v10, v9, @"userProperties.count");
  if (v9 >= 1)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      uint64_t v14 = objc_msgSend_objectAtIndexedSubscript_(self->_userProperties, v11, i);
      uint64_t v16 = objc_msgSend_stringWithFormat_(NSString, v15, @"userProperties[%ld]", i);
      objc_msgSend_encodeMaterialPropertyWithCoder_forKey_allocator_(v14, v17, (uint64_t)v26, v16, v6);
    }
  }
  uint64_t v18 = objc_msgSend_count(self->_builtinProperties, v11, v12);
  objc_msgSend_encodeInteger_forKey_(v26, v19, v18, @"builtinProperties.count");
  if (v18 >= 1)
  {
    for (uint64_t j = 0; j != v18; ++j)
    {
      uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(self->_builtinProperties, v20, j);
      id v24 = objc_msgSend_stringWithFormat_(NSString, v23, @"builtinProperties[%ld]", j);
      objc_msgSend_encodeMaterialPropertyWithCoder_forKey_allocator_(v22, v25, (uint64_t)v26, v24, v6);
    }
  }
}

+ (id)decodeMaterialWithCoder:(id)a3 allocator:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(MDLMaterial);
  uint64_t v10 = objc_msgSend_decodeIntegerForKey_(v5, v8, @"userProperties.count");
  if (v10 >= 1)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      uint64_t v12 = objc_msgSend_stringWithFormat_(NSString, v9, @"userProperties[%ld]", i);
      uint64_t v14 = objc_msgSend_decodeMaterialPropertyWithCoder_forKey_allocator_(MDLMaterialProperty, v13, (uint64_t)v5, v12, v6);

      objc_msgSend_addObject_(v7->_userProperties, v15, (uint64_t)v14);
    }
  }
  uint64_t v17 = objc_msgSend_decodeIntegerForKey_(v5, v9, @"builtinProperties.count");
  if (v17 >= 1)
  {
    for (uint64_t j = 0; j != v17; ++j)
    {
      uint64_t v19 = objc_msgSend_stringWithFormat_(NSString, v16, @"builtinProperties[%ld]", j);
      uint64_t v21 = objc_msgSend_decodeMaterialPropertyWithCoder_forKey_allocator_(MDLMaterialProperty, v20, (uint64_t)v5, v19, v6);

      objc_msgSend_addObject_(v7->_builtinProperties, v22, (uint64_t)v21);
    }
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (MDLMaterial)baseMaterial
{
  return self->_baseMaterial;
}

- (void)setBaseMaterial:(MDLMaterial *)baseMaterial
{
}

- (MDLMaterialFace)materialFace
{
  return self->_materialFace;
}

- (void)setMaterialFace:(MDLMaterialFace)materialFace
{
  self->_materialFace = materialFace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseMaterial, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_scatteringFunction, 0);
  objc_storeStrong((id *)&self->_builtinProperties, 0);

  objc_storeStrong((id *)&self->_userProperties, 0);
}

@end