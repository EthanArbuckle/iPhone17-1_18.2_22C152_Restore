@interface MDLObject(SCNModelIO)
+ (id)objectWithSCNNode:()SCNModelIO bufferAllocator:;
+ (uint64_t)objectWithSCNNode:()SCNModelIO;
@end

@implementation MDLObject(SCNModelIO)

+ (uint64_t)objectWithSCNNode:()SCNModelIO
{
  return [a1 objectWithSCNNode:a3 bufferAllocator:0];
}

+ (id)objectWithSCNNode:()SCNModelIO bufferAllocator:
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = objc_alloc_init(a1);
  v7 = objc_opt_new();
  [v6 setTransform:v7];

  if (a3)
  {
    [a3 transform];
    int8x16_t v9 = v39;
    LODWORD(v10) = v40.i32[0];
    __int32 v11 = v39.i32[3];
    __int32 v12 = v40.i32[1];
    __int32 v14 = v41.i32[0];
    int8x16_t v13 = v42;
    int8x16_t v15 = vextq_s8(v42, (int8x16_t)vtrn2q_s32(v41, (int32x4_t)v42), 4uLL);
    int8x16_t v16 = (int8x16_t)vzip2q_s64((int64x2_t)v41, v40);
    int8x16_t v8 = vextq_s8(v9, v9, 8uLL);
    *(int8x8_t *)v8.i8 = vext_s8(*(int8x8_t *)v39.i8, *(int8x8_t *)v8.i8, 4uLL);
  }
  else
  {
    int8x16_t v13 = 0uLL;
    v8.i64[0] = 0;
    __int32 v12 = 0;
    int32x4_t v41 = 0u;
    int8x16_t v42 = 0u;
    int8x16_t v39 = 0u;
    int64x2_t v40 = 0u;
    __int32 v14 = 0;
    LODWORD(v10) = 0;
    __int32 v11 = 0;
    int8x16_t v9 = 0uLL;
    int8x16_t v15 = 0uLL;
    int8x16_t v16 = 0uLL;
  }
  int8x16_t v17 = vextq_s8(vextq_s8(v9, v9, 4uLL), v8, 0xCuLL);
  v17.i32[3] = v11;
  HIDWORD(v10) = v12;
  int8x16_t v18 = vextq_s8(v15, v16, 8uLL);
  v18.i32[0] = v14;
  v19 = objc_msgSend(v6, "transform", v10, v16.i64[1], vextq_s8(vextq_s8(v13, v13, 4uLL), v15, 0xCuLL), *(_OWORD *)&v18, *(_OWORD *)&v17);
  objc_msgSend(v19, "setMatrix:", v34, v31, v33, v32);
  objc_msgSend(v6, "setName:", objc_msgSend(a3, "name"));
  objc_setAssociatedObject(v6, @"SCNSceneKitAssociatedObject", a3, (void *)0x301);
  objc_setAssociatedObject(a3, @"SCNSceneKitAssociatedObject", v6, 0);
  uint64_t v20 = [a3 camera];
  if (v20) {
    objc_msgSend(v6, "addChild:", objc_msgSend(MEMORY[0x263F135F0], "cameraWithSCNCamera:", v20));
  }
  v21 = (void *)[a3 light];
  if (v21)
  {
    v22 = v21;
    if (objc_msgSend((id)objc_msgSend(v21, "type"), "isEqualToString:", @"probe")) {
      uint64_t v23 = [MEMORY[0x263F13600] lightProbeWithSCNLight:v22 node:a3];
    }
    else {
      uint64_t v23 = [MEMORY[0x263F135F8] lightWithSCNLight:v22];
    }
    [v6 addChild:v23];
  }
  uint64_t v24 = [a3 geometry];
  if (v24) {
    objc_msgSend(v6, "addChild:", objc_msgSend(MEMORY[0x263F13618], "meshWithSCNGeometry:bufferAllocator:", v24, a4));
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v25 = (void *)[a3 childNodes];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(v25);
        }
        objc_msgSend(v6, "addChild:", objc_msgSend(MEMORY[0x263F13638], "objectWithSCNNode:bufferAllocator:", *(void *)(*((void *)&v35 + 1) + 8 * i), a4));
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v27);
  }
  return v6;
}

@end