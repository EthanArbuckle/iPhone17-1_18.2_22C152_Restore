@interface SCNNode(AVTExtension)
- (void)avt_enableSubdivisionOnHierarchyWithQuality:()AVTExtension animoji:;
- (void)avt_setGeometryPrimitiveRangesFromFaceIndexRanges:()AVTExtension;
@end

@implementation SCNNode(AVTExtension)

- (void)avt_enableSubdivisionOnHierarchyWithQuality:()AVTExtension animoji:
{
  if (avt_enableSubdivisionOnHierarchyWithQuality_animoji__onceToken != -1) {
    dispatch_once(&avt_enableSubdivisionOnHierarchyWithQuality_animoji__onceToken, &__block_literal_global_21);
  }
  if (avt_enableSubdivisionOnHierarchyWithQuality_animoji__onceTokenPad != -1) {
    dispatch_once(&avt_enableSubdivisionOnHierarchyWithQuality_animoji__onceTokenPad, &__block_literal_global_68);
  }
  if (!avt_enableSubdivisionOnHierarchyWithQuality_animoji__disableSubdivision)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __77__SCNNode_AVTExtension__avt_enableSubdivisionOnHierarchyWithQuality_animoji___block_invoke_3;
    v7[3] = &__block_descriptor_41_e21_v24__0__SCNNode_8_B16l;
    char v8 = a4;
    v7[4] = a3;
    [a1 enumerateHierarchyUsingBlock:v7];
  }
}

- (void)avt_setGeometryPrimitiveRangesFromFaceIndexRanges:()AVTExtension
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v15 + 1) + 8 * v10) count])
          {

            v11 = [a1 geometry];
            v12 = [v11 geometryElements];
            v13[0] = MEMORY[0x263EF8330];
            v13[1] = 3221225472;
            v13[2] = __75__SCNNode_AVTExtension__avt_setGeometryPrimitiveRangesFromFaceIndexRanges___block_invoke;
            v13[3] = &unk_2640210D0;
            id v14 = v6;
            [v12 enumerateObjectsUsingBlock:v13];

            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    [a1 setGeometry:0];
  }
LABEL_12:
}

@end