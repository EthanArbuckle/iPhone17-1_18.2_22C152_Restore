@interface PKMetal3DObject
- (char)initWithCommandQueue:(void *)a3 modelFile:(void *)a4 library:(double)a5 pixelSize:(double)a6 maxTextureBlur:(double)a7;
- (void)_findMeshes:(void *)a1 meshes:(void *)a2;
- (void)renderIntoTexture:(void *)a3 commandBuffer:(int)a4 rollAngle:(double)a5 altitudeAngle:(double)a6 blendFactor:(double)a7 clear:;
@end

@implementation PKMetal3DObject

- (char)initWithCommandQueue:(void *)a3 modelFile:(void *)a4 library:(double)a5 pixelSize:(double)a6 maxTextureBlur:(double)a7
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v102 = a2;
  id v104 = a3;
  id v100 = a4;
  if (a1
    && (v114.receiver = a1,
        v114.super_class = (Class)PKMetal3DObject,
        v103 = (char *)objc_msgSendSuper2(&v114, sel_init),
        (v14 = v103) != 0))
  {
    uint64_t v15 = [v102 device];
    v16 = (void *)*((void *)v103 + 1);
    v113 = v103;
    *((void *)v103 + 1) = v15;

    objc_storeStrong((id *)v103 + 2, a2);
    v17 = (id *)(v103 + 56);
    objc_storeStrong((id *)v103 + 7, a4);
    uint64_t v18 = [v104 copy];
    v19 = (void *)*((void *)v103 + 17);
    *((void *)v103 + 17) = v18;

    *((double *)v103 + 12) = a5;
    *((double *)v103 + 13) = a6;
    *((double *)v103 + 14) = a7;
    v103[120] = 0;
    v103[122] = 0;
    int v20 = [v104 isEqualToString:@"Highlighter"];
    double v21 = 1.57079633;
    if (!v20) {
      double v21 = 0.0;
    }
    *((double *)v103 + 21) = v21;
    if ([v104 isEqualToString:@"Highlighter"]) {
      char v22 = 1;
    }
    else {
      char v22 = [v104 isEqualToString:@"FountainV3Pen"];
    }
    v103[121] = v22;
    *((void *)v103 + 16) = 0;
    v98 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v101 = [v98 URLForResource:*((void *)v103 + 17) withExtension:@"usdz"];
    if (!*((void *)v103 + 4))
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4F35358]);
      v24 = (void *)*((void *)v103 + 3);
      *((void *)v103 + 3) = v23;

      v25 = [*((id *)v103 + 3) attributes];
      v26 = [v25 objectAtIndexedSubscript:0];
      [v26 setFormat:30];

      v27 = [*((id *)v103 + 3) attributes];
      v28 = [v27 objectAtIndexedSubscript:0];
      [v28 setOffset:0];

      v29 = [*((id *)v103 + 3) attributes];
      v30 = [v29 objectAtIndexedSubscript:0];
      [v30 setBufferIndex:0];

      v31 = [*((id *)v103 + 3) layouts];
      v32 = [v31 objectAtIndexedSubscript:0];
      [v32 setStride:12];

      v33 = [*((id *)v103 + 3) layouts];
      v34 = [v33 objectAtIndexedSubscript:0];
      [v34 setStepRate:1];

      v35 = [*((id *)v103 + 3) layouts];
      v36 = [v35 objectAtIndexedSubscript:0];
      [v36 setStepFunction:1];

      v37 = (void *)[*v17 newFunctionWithName:@"shadowProjectVertex"];
      v38 = (void *)[*v17 newFunctionWithName:@"shadowProjectFragment"];
      id v39 = objc_alloc_init(MEMORY[0x1E4F352F0]);
      [v39 setLabel:@"PencilShadowProject"];
      [v39 setRasterSampleCount:1];
      [v39 setVertexFunction:v37];
      [v39 setFragmentFunction:v38];
      [v39 setVertexDescriptor:*((void *)v103 + 3)];
      v40 = [v39 colorAttachments];
      v41 = [v40 objectAtIndexedSubscript:0];

      [v41 setPixelFormat:10];
      v42 = (void *)*((void *)v103 + 1);
      v129[0] = 0;
      uint64_t v43 = [v42 newRenderPipelineStateWithDescriptor:v39 error:v129];
      id v44 = v129[0];
      v45 = (void *)*((void *)v103 + 4);
      *((void *)v103 + 4) = v43;

      if (!*((void *)v103 + 4))
      {
        v46 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
        {
          v96 = [v44 localizedDescription];
          *(_DWORD *)buf = 138412290;
          v131 = v96;
          _os_log_fault_impl(&dword_1C44F8000, v46, OS_LOG_TYPE_FAULT, "Failed to create pipeline state: %@", buf, 0xCu);
        }
      }
      [v41 setBlendingEnabled:1];
      [v41 setRgbBlendOperation:0];
      [v41 setAlphaBlendOperation:0];
      [v41 setSourceRGBBlendFactor:1];
      [v41 setSourceAlphaBlendFactor:1];
      [v41 setDestinationRGBBlendFactor:1];
      [v41 setDestinationAlphaBlendFactor:1];
      v47 = (void *)*((void *)v103 + 1);
      v128[0] = v44;
      uint64_t v48 = [v47 newRenderPipelineStateWithDescriptor:v39 error:v128];
      id v49 = v128[0];

      v50 = (void *)*((void *)v103 + 5);
      *((void *)v103 + 5) = v48;

      if (!*((void *)v103 + 5))
      {
        v51 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
        {
          v97 = [v49 localizedDescription];
          *(_DWORD *)buf = 138412290;
          v131 = v97;
          _os_log_fault_impl(&dword_1C44F8000, v51, OS_LOG_TYPE_FAULT, "Failed to create pipeline state: %@", buf, 0xCu);
        }
      }

      v14 = v103;
    }
    v99 = (void *)[objc_alloc(MEMORY[0x1E4F353B0]) initWithDevice:*((void *)v14 + 1)];
    if (!v99)
    {
      v52 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      {
        v95 = [0 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v131 = v95;
        _os_log_fault_impl(&dword_1C44F8000, v52, OS_LOG_TYPE_FAULT, "Failed to create buffer allocator: %@", buf, 0xCu);
      }
      v14 = v103;
    }
    v53 = MTKModelIOVertexDescriptorFromMetal(*((MTLVertexDescriptor **)v14 + 3));
    v54 = [v53 attributes];
    v55 = [v54 objectAtIndexedSubscript:0];
    [v55 setName:*MEMORY[0x1E4F35B90]];

    v56 = (void *)[objc_alloc(MEMORY[0x1E4F35BB0]) initWithURL:v101 vertexDescriptor:v53 bufferAllocator:v99];
    id v112 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v107 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v56);
    long long v123 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v120 = 0u;
    obuint64_t j = v56;
    uint64_t v57 = [obj countByEnumeratingWithState:&v120 objects:v129 count:16];
    if (v57)
    {
      uint64_t v108 = v57;
      id v58 = 0;
      uint64_t v106 = *(void *)v121;
      do
      {
        for (uint64_t i = 0; i != v108; ++i)
        {
          if (*(void *)v121 != v106) {
            objc_enumerationMutation(obj);
          }
          v59 = *(void **)(*((void *)&v120 + 1) + 8 * i);
          [v107 removeAllObjects];
          -[PKMetal3DObject _findMeshes:meshes:](v59, v107);
          long long v118 = 0u;
          long long v119 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          id v60 = v107;
          uint64_t v61 = [v60 countByEnumeratingWithState:&v116 objects:v128 count:16];
          if (v61)
          {
            uint64_t v62 = *(void *)v117;
            do
            {
              uint64_t v63 = 0;
              v64 = v58;
              do
              {
                if (*(void *)v117 != v62) {
                  objc_enumerationMutation(v60);
                }
                v65 = *(void **)(*((void *)&v116 + 1) + 8 * v63);
                [v65 setVertexDescriptor:v53];
                id v66 = objc_alloc(MEMORY[0x1E4F353A8]);
                uint64_t v67 = *((void *)v103 + 1);
                id v115 = v64;
                v68 = (void *)[v66 initWithMesh:v65 device:v67 error:&v115];
                id v58 = v115;

                if (v68)
                {
                  [v112 addObject:v68];
                }
                else
                {
                  v69 = os_log_create("com.apple.pencilkit", "");
                  if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
                  {
                    v70 = [v58 localizedDescription];
                    *(_DWORD *)buf = 138412290;
                    v131 = v70;
                    _os_log_fault_impl(&dword_1C44F8000, v69, OS_LOG_TYPE_FAULT, "Failed to create MTK mesh: %@", buf, 0xCu);
                  }
                }

                ++v63;
                v64 = v58;
              }
              while (v61 != v63);
              uint64_t v61 = [v60 countByEnumeratingWithState:&v116 objects:v128 count:16];
            }
            while (v61);
          }
        }
        uint64_t v108 = [obj countByEnumeratingWithState:&v120 objects:v129 count:16];
      }
      while (v108);
    }
    else
    {
      id v58 = 0;
    }

    uint64_t v71 = [v112 copy];
    v72 = (void *)*((void *)v103 + 6);
    *((void *)v103 + 6) = v71;

    id v73 = *((id *)v103 + 6);
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    id v74 = v73;
    uint64_t v75 = [v74 countByEnumeratingWithState:&v124 objects:buf count:16];
    if (v75)
    {
      uint64_t v76 = *(void *)v125;
      v77.i64[0] = 0x80000000800000;
      v77.i64[1] = 0x80000000800000;
      float32x4_t v110 = v77;
      float32x4_t v111 = (float32x4_t)vdupq_n_s32(0x7F7FFFFFu);
      do
      {
        for (uint64_t j = 0; j != v75; ++j)
        {
          if (*(void *)v125 != v76) {
            objc_enumerationMutation(v74);
          }
          v79 = [*(id *)(*((void *)&v124 + 1) + 8 * j) vertexBuffers];
          v80 = [v79 objectAtIndexedSubscript:0];

          if (v80
            && (unint64_t v81 = [v80 length],
                [v80 buffer],
                id v82 = objc_claimAutoreleasedReturnValue(),
                uint64_t v83 = [v82 contents],
                v82,
                v81 >= 0xC))
          {
            unint64_t v86 = v81 / 0xC;
            if (v81 / 0xC <= 1) {
              unint64_t v86 = 1;
            }
            v87 = (unsigned int *)(v83 + 8);
            float32x4_t v85 = v110;
            float32x4_t v84 = v111;
            do
            {
              v88.i64[0] = *((void *)v87 - 1);
              v84.i32[3] = 0;
              v88.i64[1] = *v87;
              float32x4_t v84 = vminnmq_f32(v84, v88);
              v85.i32[3] = 0;
              float32x4_t v85 = vmaxnmq_f32(v85, v88);
              v87 += 3;
              --v86;
            }
            while (v86);
          }
          else
          {
            float32x4_t v85 = v110;
            float32x4_t v84 = v111;
          }
          float32x4_t v110 = v85;
          float32x4_t v111 = v84;
        }
        uint64_t v75 = [v74 countByEnumeratingWithState:&v124 objects:buf count:16];
      }
      while (v75);
    }
    else
    {
      v89.i64[0] = 0x80000000800000;
      v89.i64[1] = 0x80000000800000;
      float32x4_t v110 = v89;
      float32x4_t v111 = (float32x4_t)vdupq_n_s32(0x7F7FFFFFu);
    }

    *((_DWORD *)v103 + 18) = v111.i32[2];
    *((void *)v103 + 8) = v111.i64[0];
    *((_DWORD *)v103 + 22) = v110.i32[2];
    *((void *)v103 + 10) = v110.i64[0];
    double v90 = *((double *)v103 + 12);
    double v91 = vsubq_f32(v110, v111).f32[0];
    double v92 = (v90 + *((double *)v103 + 14) * 2.0) * v91 / v90;
    double v93 = *((double *)v103 + 13) * v92 / v90;
    *((double *)v103 + 18) = v92;
    *((double *)v103 + 19) = v93;
    *((double *)v103 + 20) = (v92 - v91) * 0.75;
  }
  else
  {
    v113 = 0;
  }

  return v113;
}

- (void)_findMeshes:(void *)a1 meshes:(void *)a2
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 addObject:v3];
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v5 = objc_msgSend(v3, "children", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        -[PKMetal3DObject _findMeshes:meshes:](*(void *)(*((void *)&v9 + 1) + 8 * v8++), v4);
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)renderIntoTexture:(void *)a3 commandBuffer:(int)a4 rollAngle:(double)a5 altitudeAngle:(double)a6 blendFactor:(double)a7 clear:
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v104 = a2;
  id v103 = a3;
  if (a1)
  {
    id v105 = objc_alloc_init(MEMORY[0x1E4F352E0]);
    v13 = [v105 colorAttachments];
    uint64_t v14 = [v13 objectAtIndexedSubscript:0];
    [v14 setTexture:v104];

    uint64_t v15 = [v105 colorAttachments];
    [v15 objectAtIndexedSubscript:0];
    if (a4) {
      v16 = {;
    }
      [v16 setLoadAction:2];

      uint64_t v15 = [v105 colorAttachments];
      v17 = [v15 objectAtIndexedSubscript:0];
      objc_msgSend(v17, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
    }
    else {
      v17 = {;
    }
      [v17 setLoadAction:1];
    }

    uint64_t v18 = [v105 colorAttachments];
    v19 = [v18 objectAtIndexedSubscript:0];
    [v19 setStoreAction:1];

    id v102 = *(id *)(a1 + 48);
    id v20 = v105;
    id v91 = v103;
    double v92 = v20;
    double v21 = [v91 renderCommandEncoderWithDescriptor:v20];
    id v115 = v21;
    [v21 setLabel:@"PencilShadowRenderEncoder"];
    [v21 pushDebugGroup:@"PencilShadowDrawMeshes"];
    [v21 setFrontFacingWinding:1];
    [v21 setCullMode:2 * *(unsigned __int8 *)(a1 + 120)];
    uint64_t v22 = 40;
    if (a4) {
      uint64_t v22 = 32;
    }
    [v21 setRenderPipelineState:*(void *)(a1 + v22)];
    float v23 = a7;
    float v124 = v23;
    double v24 = *(float *)(a1 + 84);
    double v25 = *(double *)(a1 + 160);
    float32_t v26 = *(double *)(a1 + 128) - v24 - v25;
    v27.i32[0] = 0;
    v27.f32[1] = v26;
    v27.i32[2] = 0;
    float32x4_t v112 = v27;
    double v28 = 0.0;
    if (*(unsigned char *)(a1 + 121)) {
      double v28 = a5;
    }
    float v29 = *(double *)(a1 + 168) - v28;
    *(double *)v30.i64 = matrix4x4_rotation(v29, (float32x4_t)xmmword_1C482B4B0);
    simd_float4 v99 = v30;
    simd_float4 v100 = v31;
    *(_OWORD *)obuint64_t j = v33;
    simd_float4 v108 = v32;
    float v34 = 0.0;
    if (*(unsigned char *)(a1 + 122)) {
      float v34 = *(float *)(a1 + 72);
    }
    float32x4_t v35 = v112;
    v35.i32[3] = 1.0;
    float32x4_t v113 = v35;
    v35.f32[0] = v24 - v25;
    v36.i32[0] = 0;
    v36.i32[1] = v35.i32[0];
    v36.f32[2] = -v34;
    v36.i32[3] = 1.0;
    float32x4_t v97 = v36;
    float v37 = a6 * -0.8;
    *(double *)v38.i64 = matrix4x4_rotation(v37, (float32x4_t)xmmword_1C482A970);
    uint64_t v39 = 0;
    double v41 = *(double *)(a1 + 144);
    double v40 = *(double *)(a1 + 152);
    float v42 = v41 * -0.5;
    *(float *)&double v41 = v41 * 0.5;
    float v43 = -v40 - v25;
    float v44 = v25;
    float v45 = -v40;
    float v46 = *(float *)&v41 - v42;
    float v47 = v44 - v43;
    *(float *)&double v41 = v42 + *(float *)&v41;
    float v48 = v44 + v43;
    float v101 = 2.0 / v46;
    float32_t v49 = (float)-*(float *)&v41 / v46;
    float v50 = (float)-v48 / v47;
    __asm { FMOV            V7.4S, #1.0 }
    _Q7.f32[0] = v49;
    v126[0].columns[0] = v38;
    v126[0].columns[1] = v56;
    v126[0].columns[2] = v57;
    v126[0].columns[3] = v58;
    do
    {
      v127[0].columns[v39] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1C482A970, COERCE_FLOAT(*(_OWORD *)&v126[0].columns[v39])), (float32x4_t)xmmword_1C482B4B0, *(float32x2_t *)v126[0].columns[v39].f32, 1), (float32x4_t)xmmword_1C482B4C0, (float32x4_t)v126[0].columns[v39], 2), v97, (float32x4_t)v126[0].columns[v39], 3);
      ++v39;
    }
    while (v39 != 4);
    float v59 = v40;
    float v60 = v59 - v45;
    _Q7.f32[1] = v50;
    float32x4_t v110 = _Q7;
    float v98 = (float)-v45 / (float)(v59 - v45);
    v130.columns[0] = (simd_float4)_PromotedConst;
    v130.columns[1] = (simd_float4)unk_1C482B4F0;
    v130.columns[2] = (simd_float4)xmmword_1C482B500;
    float32x4_t v95 = (float32x4_t)v127[0].columns[0];
    float32x4_t v96 = (float32x4_t)v127[0].columns[1];
    float32x4_t v93 = (float32x4_t)v127[0].columns[3];
    float32x4_t v94 = (float32x4_t)v127[0].columns[2];
    v130.columns[3] = (simd_float4)v97;
    simd_float4x4 v131 = __invert_f4(v130);
    uint64_t v61 = 0;
    v126[0] = v131;
    do
    {
      v127[0].columns[v61] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v95, COERCE_FLOAT(*(_OWORD *)&v126[0].columns[v61])), v96, *(float32x2_t *)v126[0].columns[v61].f32, 1), v94, (float32x4_t)v126[0].columns[v61], 2), v93, (float32x4_t)v126[0].columns[v61], 3);
      ++v61;
    }
    while (v61 != 4);
    uint64_t v62 = 0;
    float32x4_t v63 = v110;
    v63.f32[2] = v98;
    float32x4_t v64 = (float32x4_t)v127[0].columns[0];
    float32x4_t v65 = (float32x4_t)v127[0].columns[1];
    float32x4_t v66 = (float32x4_t)v127[0].columns[2];
    float32x4_t v67 = (float32x4_t)v127[0].columns[3];
    v126[0].columns[0] = v99;
    v126[0].columns[1] = v100;
    v126[0].columns[2] = v108;
    v126[0].columns[3] = *(simd_float4 *)obj;
    do
    {
      v127[0].columns[v62] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v64, COERCE_FLOAT(*(_OWORD *)&v126[0].columns[v62])), v65, *(float32x2_t *)v126[0].columns[v62].f32, 1), v66, (float32x4_t)v126[0].columns[v62], 2), v67, (float32x4_t)v126[0].columns[v62], 3);
      ++v62;
    }
    while (v62 != 4);
    uint64_t v68 = 0;
    v69.i32[0] = 0;
    v69.i64[1] = 0;
    v126[0] = v127[0];
    do
    {
      v127[0].columns[v68] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1C482A970, COERCE_FLOAT(*(_OWORD *)&v126[0].columns[v68])), (float32x4_t)xmmword_1C482B4B0, *(float32x2_t *)v126[0].columns[v68].f32, 1), (float32x4_t)xmmword_1C482B4C0, (float32x4_t)v126[0].columns[v68], 2), v113, (float32x4_t)v126[0].columns[v68], 3);
      ++v68;
    }
    while (v68 != 4);
    uint64_t v70 = 0;
    v71.i64[0] = 0;
    v71.i32[3] = 0;
    v126[0] = v127[0];
    do
    {
      v69.f32[1] = 2.0 / v47;
      v71.f32[2] = -1.0 / v60;
      v127[0].columns[v70] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)LODWORD(v101), COERCE_FLOAT(*(_OWORD *)&v126[0].columns[v70])), v69, *(float32x2_t *)v126[0].columns[v70].f32, 1), v71, (float32x4_t)v126[0].columns[v70], 2), v63, (float32x4_t)v126[0].columns[v70], 3);
      ++v70;
    }
    while (v70 != 4);
    simd_float4x4 v125 = v127[0];
    [v21 setVertexBytes:&v125 length:64 atIndex:1];
    [v21 setFragmentBytes:&v124 length:4 atIndex:0];
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id obja = v102;
    uint64_t v111 = [obja countByEnumeratingWithState:&v120 objects:v127 count:16];
    if (v111)
    {
      uint64_t v109 = *(void *)v121;
      do
      {
        for (uint64_t i = 0; i != v111; ++i)
        {
          if (*(void *)v121 != v109) {
            objc_enumerationMutation(obja);
          }
          unint64_t v72 = 0;
          id v73 = *(void **)(*((void *)&v120 + 1) + 8 * i);
          while (1)
          {
            id v74 = [v73 vertexBuffers];
            BOOL v75 = v72 < [v74 count];

            if (!v75) {
              break;
            }
            uint64_t v76 = [v73 vertexBuffers];
            float32x4_t v77 = [(id)v76 objectAtIndexedSubscript:v72];

            v78 = [MEMORY[0x1E4F1CA98] null];
            LOBYTE(v76) = v77 == v78;

            if ((v76 & 1) == 0)
            {
              v79 = [v77 buffer];
              objc_msgSend(v115, "setVertexBuffer:offset:atIndex:", v79, objc_msgSend(v77, "offset"), v72);
            }
            ++v72;
          }
          long long v118 = 0u;
          long long v119 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          v80 = [v73 submeshes];
          uint64_t v81 = [v80 countByEnumeratingWithState:&v116 objects:v126 count:16];
          if (v81)
          {
            uint64_t v82 = *(void *)v117;
            do
            {
              for (uint64_t j = 0; j != v81; ++j)
              {
                if (*(void *)v117 != v82) {
                  objc_enumerationMutation(v80);
                }
                float32x4_t v84 = *(void **)(*((void *)&v116 + 1) + 8 * j);
                uint64_t v85 = [v84 primitiveType];
                uint64_t v86 = [v84 indexCount];
                uint64_t v87 = [v84 indexType];
                float32x4_t v88 = [v84 indexBuffer];
                float32x4_t v89 = [v88 buffer];
                double v90 = [v84 indexBuffer];
                objc_msgSend(v115, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", v85, v86, v87, v89, objc_msgSend(v90, "offset"));
              }
              uint64_t v81 = [v80 countByEnumeratingWithState:&v116 objects:v126 count:16];
            }
            while (v81);
          }
        }
        uint64_t v111 = [obja countByEnumeratingWithState:&v120 objects:v127 count:16];
      }
      while (v111);
    }

    [v115 popDebugGroup];
    [v115 endEncoding];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelFile, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_metalKitMeshes, 0);
  objc_storeStrong((id *)&self->_scenePipelineStateWithBlending, 0);
  objc_storeStrong((id *)&self->_scenePipelineState, 0);
  objc_storeStrong((id *)&self->_sceneVertexDescriptor, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end