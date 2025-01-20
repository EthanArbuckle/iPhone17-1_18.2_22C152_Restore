@interface SCNNode
@end

@implementation SCNNode

void __77__SCNNode_AVTExtension__avt_enableSubdivisionOnHierarchyWithQuality_animoji___block_invoke()
{
  id v0 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.UIKit"];
  avt_enableSubdivisionOnHierarchyWithQuality_animoji__disableSubdivision = [v0 BOOLForKey:@"avatarKit.disableSubdivision"];
}

void __77__SCNNode_AVTExtension__avt_enableSubdivisionOnHierarchyWithQuality_animoji___block_invoke_2()
{
  id v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1 == 1) {
    avt_enableSubdivisionOnHierarchyWithQuality_animoji__forceHighQuality = 1;
  }
}

void __77__SCNNode_AVTExtension__avt_enableSubdivisionOnHierarchyWithQuality_animoji___block_invoke_3(uint64_t a1, void *a2)
{
  id v12 = a2;
  v3 = [v12 geometry];
  if (v3)
  {
    v4 = [v12 name];
    v5 = v4;
    if (*(unsigned char *)(a1 + 40)
      || ([v4 isEqualToString:@"L_eye"] & 1) == 0
      && ([v5 isEqualToString:@"R_eye"] & 1) == 0)
    {
      if ([v5 hasSuffix:@"Teeth"])
      {
        unint64_t v6 = avt_enableSubdivisionOnHierarchyWithQuality_animoji__forceHighQuality;
      }
      else
      {
        char v7 = [v5 isEqualToString:@"tongue"];
        unint64_t v6 = avt_enableSubdivisionOnHierarchyWithQuality_animoji__forceHighQuality;
        if ((avt_enableSubdivisionOnHierarchyWithQuality_animoji__forceHighQuality & 1) == 0 && (v7 & 1) == 0) {
          unint64_t v6 = *(void *)(a1 + 32);
        }
      }
      if (!*(unsigned char *)(a1 + 40)
        && (([v5 containsString:@"headwear_crown"] & 1) != 0
         || [v5 containsString:@"headwear_jewels"]))
      {
        unint64_t v6 = 2;
      }
      v8 = [v3 tessellator];
      v9 = [v3 tessellator];

      if (!v9)
      {
        id v10 = objc_alloc_init(MEMORY[0x263F16A40]);

        [v3 setTessellator:v10];
        [v3 setWantsAdaptiveSubdivision:1];
        v8 = v10;
      }
      if (v6 <= 2)
      {
        double v11 = dbl_20B890560[v6];
        [v3 setSubdivisionLevel:qword_20B890548[v6]];
        [v8 setTessellationFactorScale:v11];
      }
    }
  }
}

void __75__SCNNode_AVTExtension__avt_setGeometryPrimitiveRangesFromFaceIndexRanges___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  unint64_t v6 = [v5 count];
  char v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v6 >> 1];
  if (v6 >= 2)
  {
    if (v6 >> 1 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v6 >> 1;
    }
    uint64_t v9 = 1;
    do
    {
      id v10 = [v5 objectAtIndexedSubscript:v9 - 1];
      uint64_t v11 = [v10 unsignedIntegerValue];

      id v12 = [v5 objectAtIndexedSubscript:v9];
      uint64_t v13 = [v12 unsignedIntegerValue];

      v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v11, v13);
      [v7 addObject:v14];

      v9 += 2;
      --v8;
    }
    while (v8);
  }
  [v15 setPrimitiveRanges:v7];
}

@end