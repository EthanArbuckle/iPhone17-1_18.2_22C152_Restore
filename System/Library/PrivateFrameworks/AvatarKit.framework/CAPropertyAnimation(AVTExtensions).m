@interface CAPropertyAnimation(AVTExtensions)
- (uint64_t)avt_isUseless;
@end

@implementation CAPropertyAnimation(AVTExtensions)

- (uint64_t)avt_isUseless
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = a1;
    v3 = [v2 keyPath];
    v4 = [v3 lastPathComponent];
    int v5 = [v4 isEqualToString:@"position"];

    if (v5)
    {
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      v6 = [v2 values];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v96 objects:v105 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v97;
        float32x4_t v73 = (float32x4_t)vdupq_n_s32(0x3A83126Fu);
LABEL_5:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v97 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v96 + 1) + 8 * v10), "avt_float3Value");
          uint32x4_t v12 = (uint32x4_t)vcgtq_f32(vabsq_f32(v11), v73);
          v12.i32[3] = v12.i32[2];
          if ((vmaxvq_u32(v12) & 0x80000000) != 0) {
            break;
          }
          if (v8 == ++v10)
          {
            uint64_t v8 = [v6 countByEnumeratingWithState:&v96 objects:v105 count:16];
            uint64_t v13 = 1;
            if (v8) {
              goto LABEL_5;
            }
            goto LABEL_73;
          }
        }
LABEL_71:
        uint64_t v13 = 0;
LABEL_73:

LABEL_74:
        return v13;
      }
      goto LABEL_72;
    }
    v14 = [v2 keyPath];
    v15 = [v14 lastPathComponent];
    int v16 = [v15 isEqualToString:@"eulerAngles"];

    if (v16)
    {
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      v6 = [v2 values];
      uint64_t v17 = [v6 countByEnumeratingWithState:&v92 objects:v104 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v93;
        float32x4_t v74 = (float32x4_t)vdupq_n_s32(0x3A83126Fu);
LABEL_16:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v93 != v19) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v92 + 1) + 8 * v20), "avt_float3Value");
          uint32x4_t v22 = (uint32x4_t)vcgtq_f32(vabsq_f32(v21), v74);
          v22.i32[3] = v22.i32[2];
          if ((vmaxvq_u32(v22) & 0x80000000) != 0) {
            goto LABEL_71;
          }
          if (v18 == ++v20)
          {
            uint64_t v18 = [v6 countByEnumeratingWithState:&v92 objects:v104 count:16];
            uint64_t v13 = 1;
            if (v18) {
              goto LABEL_16;
            }
            goto LABEL_73;
          }
        }
      }
LABEL_72:
      uint64_t v13 = 1;
      goto LABEL_73;
    }
    v23 = [v2 keyPath];
    v24 = [v23 lastPathComponent];
    if ([v24 hasSuffix:@"eulerAngles.x"]) {
      goto LABEL_26;
    }
    v25 = [v2 keyPath];
    v26 = [v25 lastPathComponent];
    if ([v26 hasSuffix:@"eulerAngles.y"])
    {

LABEL_26:
      goto LABEL_27;
    }
    v32 = [v2 keyPath];
    v33 = [v32 lastPathComponent];
    char v34 = [v33 hasSuffix:@"eulerAngles.z"];

    if (v34)
    {
LABEL_27:
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      v6 = [v2 values];
      uint64_t v27 = [v6 countByEnumeratingWithState:&v88 objects:v103 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v89;
LABEL_29:
        uint64_t v30 = 0;
        while (1)
        {
          if (*(void *)v89 != v29) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v88 + 1) + 8 * v30) floatValue];
          if (fabsf(v31) > 0.001) {
            goto LABEL_71;
          }
          if (v28 == ++v30)
          {
            uint64_t v28 = [v6 countByEnumeratingWithState:&v88 objects:v103 count:16];
            uint64_t v13 = 1;
            if (v28) {
              goto LABEL_29;
            }
            goto LABEL_73;
          }
        }
      }
      goto LABEL_72;
    }
    v35 = [v2 keyPath];
    v36 = [v35 lastPathComponent];
    int v37 = [v36 isEqualToString:@"scale"];

    if (v37)
    {
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      v6 = [v2 values];
      uint64_t v38 = [v6 countByEnumeratingWithState:&v84 objects:v102 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v85;
        __asm { FMOV            V1.4S, #-1.0 }
        float32x4_t v72 = (float32x4_t)vdupq_n_s32(0x3A83126Fu);
        float32x4_t v75 = _Q1;
LABEL_40:
        uint64_t v46 = 0;
        while (1)
        {
          if (*(void *)v85 != v40) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v84 + 1) + 8 * v46), "avt_float3Value", *(_OWORD *)&v72);
          uint32x4_t v48 = (uint32x4_t)vcgtq_f32(vabsq_f32(vaddq_f32(v47, v75)), v72);
          v48.i32[3] = v48.i32[2];
          if ((vmaxvq_u32(v48) & 0x80000000) != 0) {
            goto LABEL_71;
          }
          if (v39 == ++v46)
          {
            uint64_t v39 = [v6 countByEnumeratingWithState:&v84 objects:v102 count:16];
            uint64_t v13 = 1;
            if (v39) {
              goto LABEL_40;
            }
            goto LABEL_73;
          }
        }
      }
      goto LABEL_72;
    }
    v49 = [v2 keyPath];
    v50 = [v49 lastPathComponent];
    if (([v50 hasSuffix:@"scale.x"] & 1) == 0)
    {
      v51 = [v2 keyPath];
      v52 = [v51 lastPathComponent];
      if (([v52 hasSuffix:@"scale.y"] & 1) == 0)
      {
        v58 = [v2 keyPath];
        v59 = [v58 lastPathComponent];
        char v60 = [v59 hasSuffix:@"scale.z"];

        if ((v60 & 1) == 0)
        {
          v61 = [v2 keyPath];
          v62 = [v61 lastPathComponent];
          int v63 = [v62 isEqualToString:@"orientation"];

          if (!v63)
          {
            uint64_t v13 = 0;
            goto LABEL_74;
          }
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          v6 = [v2 values];
          uint64_t v64 = [v6 countByEnumeratingWithState:&v76 objects:v100 count:16];
          if (v64)
          {
            uint64_t v65 = v64;
            uint64_t v66 = *(void *)v77;
LABEL_64:
            uint64_t v67 = 0;
            while (1)
            {
              if (*(void *)v77 != v66) {
                objc_enumerationMutation(v6);
              }
              objc_msgSend(*(id *)(*((void *)&v76 + 1) + 8 * v67), "avt_float4Value");
              float32x4_t v69 = vmulq_f32(v68, v68);
              float v70 = atan2f(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v69, 2), vaddq_f32(v69, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v69.f32, 1))).f32[0]), v68.f32[3]);
              if (fabsf(v70 + v70) > 0.001) {
                goto LABEL_71;
              }
              if (v65 == ++v67)
              {
                uint64_t v65 = [v6 countByEnumeratingWithState:&v76 objects:v100 count:16];
                uint64_t v13 = 1;
                if (v65) {
                  goto LABEL_64;
                }
                goto LABEL_73;
              }
            }
          }
          goto LABEL_72;
        }
        goto LABEL_51;
      }
    }
LABEL_51:
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v6 = [v2 values];
    uint64_t v53 = [v6 countByEnumeratingWithState:&v80 objects:v101 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v81;
LABEL_53:
      uint64_t v56 = 0;
      while (1)
      {
        if (*(void *)v81 != v55) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v80 + 1) + 8 * v56) floatValue];
        if (fabsf(v57 + -1.0) > 0.001) {
          goto LABEL_71;
        }
        if (v54 == ++v56)
        {
          uint64_t v54 = [v6 countByEnumeratingWithState:&v80 objects:v101 count:16];
          uint64_t v13 = 1;
          if (v54) {
            goto LABEL_53;
          }
          goto LABEL_73;
        }
      }
    }
    goto LABEL_72;
  }
  return 0;
}

@end