@interface SCNScene(AVTExtension)
- (void)avt_fixQuirksOfNewUSDSchemaWithOptions:()AVTExtension handler:;
- (void)avt_removeDuplicateSkeletonRootWithHandler:()AVTExtension;
- (void)avt_removeFaceSetsExportedAsDummyNodesWithHandler:()AVTExtension;
- (void)avt_setInitialValuesExportedAsAnimationsWithWithOptions:()AVTExtension handler:;
@end

@implementation SCNScene(AVTExtension)

- (void)avt_fixQuirksOfNewUSDSchemaWithOptions:()AVTExtension handler:
{
  id v6 = a4;
  objc_msgSend(a1, "avt_setInitialValuesExportedAsAnimationsWithWithOptions:handler:", a3, v6);
  objc_msgSend(a1, "avt_removeDuplicateSkeletonRootWithHandler:", v6);
  objc_msgSend(a1, "avt_removeFaceSetsExportedAsDummyNodesWithHandler:", v6);
}

- (void)avt_setInitialValuesExportedAsAnimationsWithWithOptions:()AVTExtension handler:
{
  id v6 = a4;
  v7 = [a1 rootNode];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __90__SCNScene_AVTExtension__avt_setInitialValuesExportedAsAnimationsWithWithOptions_handler___block_invoke;
  v12 = &unk_264021088;
  id v13 = v6;
  uint64_t v14 = a3;
  id v8 = v6;
  [v7 enumerateHierarchyUsingBlock:&v9];

  objc_msgSend(MEMORY[0x263F16B08], "flush", v9, v10, v11, v12);
}

- (void)avt_removeDuplicateSkeletonRootWithHandler:()AVTExtension
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  v4 = a3;
  v43 = a1;
  v5 = [a1 rootNode];
  id v6 = [v5 childNodeWithName:@"skeleton_GRP" recursively:1];

  if (v6)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = [v6 childNodes];
    uint64_t v7 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
    if (!v7) {
      goto LABEL_10;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v52 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = [*(id *)(*((void *)&v51 + 1) + 8 * i) name];
        char v12 = [v11 hasPrefix:@"mindBlown_"];

        if (v12)
        {
LABEL_33:

          goto LABEL_34;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
    }
    while (v8);
LABEL_10:

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = [v6 childNodes];
    uint64_t v13 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
    if (!v13) {
      goto LABEL_33;
    }
    uint64_t v14 = v13;
    v42 = v6;
    uint64_t v15 = *(void *)v48;
    float32x4_t v40 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
    float32x4_t v41 = *(float32x4_t *)MEMORY[0x263EF89A8];
    float32x4_t v38 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
    float32x4_t v39 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 32);
LABEL_12:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v48 != v15) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v47 + 1) + 8 * v16);
      v18 = [v17 name];
      if ([v18 isEqualToString:@"root_JNT"]) {
        goto LABEL_21;
      }
      v19 = [v17 name];
      if ([v19 isEqualToString:@"bodyRoot_JNT"]) {
        break;
      }
      v20 = [v17 name];
      char v21 = [v20 isEqualToString:@"spineFk0_JNT"];

      if ((v21 & 1) == 0)
      {
        v18 = avt_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v37 = [v17 name];
          *(_DWORD *)buf = 136315394;
          v58 = "[rootJoint.name isEqualToString:AVT_SKINNER_ROOT_NAME] || [rootJoint.name isEqualToString:AVT_SKINNER_ME"
                "MOJI_FLATTENED_BODY_ROOT_NAME] || [rootJoint.name isEqualToString:AVT_SKINNER_MEMOJI_HIERARCHICAL_BODY_ROOT_NAME]";
          __int16 v59 = 2112;
          v60 = v37;
          _os_log_error_impl(&dword_20B819000, v18, OS_LOG_TYPE_ERROR, "Error: Condition '%s' failed. Skeleton group has unknown root joint \"%@\"", buf, 0x16u);
        }
        goto LABEL_21;
      }
LABEL_22:
      v22 = [v17 childNodes];
      v23 = [v22 firstObject];

      v24 = [v17 name];
      v25 = [v23 name];
      int v26 = [v24 isEqualToString:v25];

      if (v26)
      {
        [v17 simdTransform];
        if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v27, v41), (int8x16_t)vceqq_f32(v28, v40)), vandq_s8((int8x16_t)vceqq_f32(v29, v39), (int8x16_t)vceqq_f32(v30, v38)))) & 0x80000000) == 0)
        {
          v31 = avt_default_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            [(SCNScene(AVTExtension) *)v55 avt_removeDuplicateSkeletonRootWithHandler:v31];
          }
        }
        if (v4)
        {
          v32 = NSString;
          v33 = [v17 name];
          v34 = [v23 childNodes];
          v35 = [v32 stringWithFormat:@"Removed duplicate node \"%@\" (%ld child joints)", v33, objc_msgSend(v34, "count")];
          v4[2](v4, v35);
        }
        [v17 removeFromParentNode];
        [v23 removeFromParentNode];
        [v42 addChildNode:v23];
        v36 = [v43 rootNode];
        v45[0] = MEMORY[0x263EF8330];
        v45[1] = 3221225472;
        v45[2] = __69__SCNScene_AVTExtension__avt_removeDuplicateSkeletonRootWithHandler___block_invoke;
        v45[3] = &unk_26401F5D0;
        v45[4] = v17;
        id v46 = v23;
        [v36 enumerateHierarchyUsingBlock:v45];
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
        if (!v14)
        {
          id v6 = v42;
          goto LABEL_33;
        }
        goto LABEL_12;
      }
    }

LABEL_21:
    goto LABEL_22;
  }
LABEL_34:
}

- (void)avt_removeFaceSetsExportedAsDummyNodesWithHandler:()AVTExtension
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = [a1 rootNode];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __76__SCNScene_AVTExtension__avt_removeFaceSetsExportedAsDummyNodesWithHandler___block_invoke;
  v23[3] = &unk_26401F2B0;
  id v7 = v5;
  id v24 = v7;
  [v6 enumerateHierarchyUsingBlock:v23];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        char v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
        if (v4)
        {
          uint64_t v13 = NSString;
          uint64_t v14 = [*(id *)(*((void *)&v19 + 1) + 8 * v11) name];
          uint64_t v15 = [v12 parentNode];
          uint64_t v16 = [v15 name];
          v17 = [v13 stringWithFormat:@"Removed face set dummy node \"%@\" from \"%@\"", v14, v16];
          v4[2](v4, v17);
        }
        [v12 removeFromParentNode];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v9);
  }
}

- (void)avt_removeDuplicateSkeletonRootWithHandler:()AVTExtension .cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "simd_equal(rootJoint.simdTransform, matrix_identity_float4x4)";
  _os_log_error_impl(&dword_20B819000, log, OS_LOG_TYPE_ERROR, "Error: Condition '%s' failed. Root joint shouldn't have any transform", buf, 0xCu);
}

@end