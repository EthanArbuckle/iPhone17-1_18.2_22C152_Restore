@interface MDLObject(SceneKitAdditions)
- (id)_associatedSCNNode;
- (uint64_t)_updateAssociatedSCNNodeWithGeometrySetter:()SceneKitAdditions texturePathProvider:vertexAttributeNamed:materialPropertyNamed:;
@end

@implementation MDLObject(SceneKitAdditions)

- (id)_associatedSCNNode
{
  return objc_getAssociatedObject(a1, @"SCNSceneKitAssociatedObject");
}

- (uint64_t)_updateAssociatedSCNNodeWithGeometrySetter:()SceneKitAdditions texturePathProvider:vertexAttributeNamed:materialPropertyNamed:
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id AssociatedObject = objc_getAssociatedObject(a1, @"SCNSceneKitAssociatedObject");
  if (AssociatedObject)
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    obuint64_t j = (id)[a1 children];
    uint64_t v7 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      char v9 = 0;
      uint64_t v10 = *(void *)v69;
      unint64_t v11 = 0x263EFF000uLL;
      uint64_t v42 = *(void *)v69;
      uint64_t v43 = a3;
      do
      {
        uint64_t v12 = 0;
        uint64_t v44 = v8;
        do
        {
          if (*(void *)v69 != v10) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v68 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v47 = v12;
            if (v9)
            {
              v14 = scn_default_log();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
                -[MDLObject(SceneKitAdditions) _updateAssociatedSCNNodeWithGeometrySetter:texturePathProvider:vertexAttributeNamed:materialPropertyNamed:](&v66, v67, v14);
              }
            }
            id v15 = (id)objc_msgSend((id)objc_msgSend(AssociatedObject, "geometry"), "materials");
            v16 = +[SCNGeometry geometryWithMDLMesh:v13];
            v17 = (void *)[*(id *)(v11 + 2432) array];
            v18 = objc_msgSend(*(id *)(v11 + 2432), "arrayWithCapacity:", objc_msgSend(v15, "count"));
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            v19 = (void *)[v13 submeshes];
            uint64_t v20 = [v19 countByEnumeratingWithState:&v62 objects:v74 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v63;
              do
              {
                for (uint64_t i = 0; i != v21; ++i)
                {
                  if (*(void *)v63 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  v24 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                  if ([v24 material] && objc_msgSend(v24, "indexCount")) {
                    objc_msgSend(v18, "addObject:", objc_msgSend(v24, "material"));
                  }
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v62 objects:v74 count:16];
              }
              while (v21);
            }
            v46 = v15;
            v25 = objc_msgSend(*(id *)(v11 + 2432), "arrayWithCapacity:", objc_msgSend(v15, "count"));
            v26 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:&stru_26BF72F58];
            long long v58 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            uint64_t v27 = [v18 countByEnumeratingWithState:&v58 objects:v73 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v59;
              do
              {
                for (uint64_t j = 0; j != v28; ++j)
                {
                  if (*(void *)v59 != v29) {
                    objc_enumerationMutation(v18);
                  }
                  v31 = *(void **)(*((void *)&v58 + 1) + 8 * j);
                  id v32 = objc_getAssociatedObject(v31, @"SCNSceneKitAssociatedObject");
                  if (v32)
                  {
                    v33 = (void *)[v32 copy];
                    uint64_t v34 = [v33 _integrateModelKitComputedMaps:v31 withGeometry:v16 node:AssociatedObject texturePathProvider:a4 vertexAttributeNamed:a5 materialPropertyNamed:a6 filePath:v26];
                    if (v34) {
                      [v17 addObject:v34];
                    }
                    [v25 addObject:v33];
                  }
                  else
                  {
                    v35 = scn_default_log();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                      -[MDLObject(SceneKitAdditions) _updateAssociatedSCNNodeWithGeometrySetter:texturePathProvider:vertexAttributeNamed:materialPropertyNamed:](&v56, v57, v35);
                    }
                  }
                }
                uint64_t v28 = [v18 countByEnumeratingWithState:&v58 objects:v73 count:16];
              }
              while (v28);
            }

            [(SCNGeometry *)v16 setMaterials:v25];
            a3 = v43;
            if (v43) {
              (*(void (**)(uint64_t, id, SCNGeometry *, void *))(v43 + 16))(v43, AssociatedObject, v16, v17);
            }
            else {
              [AssociatedObject setGeometry:v16];
            }
            uint64_t v8 = v44;
            uint64_t v10 = v42;
            unint64_t v11 = 0x263EFF000;
            uint64_t v12 = v47;

            char v9 = 1;
          }
          ++v12;
        }
        while (v12 != v8);
        uint64_t v8 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
      }
      while (v8);
    }
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v36 = (void *)[a1 children];
  uint64_t result = [v36 countByEnumeratingWithState:&v52 objects:v72 count:16];
  if (result)
  {
    uint64_t v38 = result;
    uint64_t v39 = *(void *)v53;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v53 != v39) {
          objc_enumerationMutation(v36);
        }
        [*(id *)(*((void *)&v52 + 1) + 8 * v40++) _updateAssociatedSCNNodeWithGeometrySetter:a3 texturePathProvider:a4 vertexAttributeNamed:a5 materialPropertyNamed:a6];
      }
      while (v38 != v40);
      uint64_t result = [v36 countByEnumeratingWithState:&v52 objects:v72 count:16];
      uint64_t v38 = result;
    }
    while (result);
  }
  return result;
}

- (void)_updateAssociatedSCNNodeWithGeometrySetter:()SceneKitAdditions texturePathProvider:vertexAttributeNamed:materialPropertyNamed:.cold.1(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_1(&dword_20B249000, a3, (uint64_t)a3, "Error: failed to find MKMaterial corresponding SCNMaterial", a1);
}

- (void)_updateAssociatedSCNNodeWithGeometrySetter:()SceneKitAdditions texturePathProvider:vertexAttributeNamed:materialPropertyNamed:.cold.2(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_1(&dword_20B249000, a3, (uint64_t)a3, "Error: a MDLObject has more than 1 child mesh - not supported", a1);
}

@end