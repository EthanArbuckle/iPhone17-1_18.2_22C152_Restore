id *gpuImageBufferCreate(id *a1, uint64_t a2, void *a3, void *a4, unint64_t a5, unsigned int a6)
{
  id v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v13;
  void *v14;
  id *v15;

  v9 = *a1;
  if (a2)
  {
    v10 = a5;
    v11 = [v9 newBufferWithBytesNoCopy:a2 length:a5 * (void)a3 options:0x100000 deallocator:0];
  }
  else
  {
    v13 = [v9 minimumLinearTextureAlignmentForPixelFormat:70];
    v10 = (v13 + (a6 >> 3) * (void)a4 - 1) / v13 * v13;
    v11 = [*a1 newBufferWithLength:v10 * (void)a3 options:0];
  }
  v14 = (void *)v11;
  if (v11)
  {
    v15 = (id *)malloc_type_malloc(0x20uLL, 0x1080040ABB4582EuLL);
    v15[1] = a3;
    v15[2] = a4;
    v15[3] = (id)v10;
    objc_storeStrong(v15, v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void sub_247227EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void gpuImageBufferDestroy(void **a1)
{
  v2 = *a1;
  *a1 = 0;

  free(a1);
}

__n128 gpuImageBufferGetInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = [*(id *)a1 contents];
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  return result;
}

uint64_t gpuImageBufferGetHeight(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t gpuImageBufferGetWidth(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t gpuImageBufferGetRowBytes(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t gpuImageBufferGetData(id *a1)
{
  return [*a1 contents];
}

uint64_t gpuImageMatrixMultiply_ARGB8888(uint64_t a1, void *a2, uint64_t a3, __int16 *a4, int a5, int16x4_t *a6, int32x4_t *a7)
{
  context = (void *)MEMORY[0x24C54E580]();
  id v14 = *(id *)(*(void *)(*(void *)(a1 + 16) + 16) + 280);
  id v15 = *(id *)(a1 + 8);
  unint64_t v16 = [v14 threadExecutionWidth];
  unint64_t v17 = [v14 maxTotalThreadsPerThreadgroup];
  float v18 = 1.0 / (float)a5;
  v19.i16[0] = *a4;
  v19.i16[1] = a4[4];
  v19.i16[2] = a4[8];
  v19.i16[3] = a4[12];
  v20.i16[0] = a4[1];
  v20.i16[1] = a4[5];
  v20.i16[2] = a4[9];
  v20.i16[3] = a4[13];
  v21.i16[0] = a4[2];
  v21.i16[1] = a4[6];
  v21.i16[2] = a4[10];
  v21.i16[3] = a4[14];
  v22.i16[0] = a4[3];
  v22.i16[1] = a4[7];
  v22.i16[2] = a4[11];
  v22.i16[3] = a4[15];
  v33[0] = vmulq_n_f32(vcvtq_f32_s32(vmovl_s16(v19)), v18);
  v33[1] = vmulq_n_f32(vcvtq_f32_s32(vmovl_s16(v20)), v18);
  v33[2] = vmulq_n_f32(vcvtq_f32_s32(vmovl_s16(v21)), v18);
  v33[3] = vmulq_n_f32(vcvtq_f32_s32(vmovl_s16(v22)), v18);
  uint64_t v23 = *(void *)(a3 + 24);
  int v34 = a2[3];
  int v35 = v23;
  __int16 v36 = 0;
  if (a6)
  {
    LOBYTE(v36) = 1;
    v33[4] = vdivq_f32(vcvtq_f32_s32(vmovl_s16(*a6)), (float32x4_t)vdupq_n_s32(0x437F0000u));
  }
  if (a7)
  {
    HIBYTE(v36) = 1;
    float32x4_t v24 = vcvtq_f32_s32(*a7);
    v25.i64[0] = 0x3000000030000000;
    v25.i64[1] = 0x3000000030000000;
    v25.i32[0] = vmulq_f32(v24, v25).u32[0];
    float32x4_t v26 = vdivq_f32(v24, (float32x4_t)vdupq_n_s32(0x4F00000Cu));
    v26.i32[0] = v25.i32[0];
    v33[5] = vmulq_n_f32(v26, v18);
  }
  objc_msgSend(v15, "setComputePipelineState:", v14, context);
  [v15 setBuffer:*a2 offset:0 atIndex:0];
  [v15 setBuffer:*(void *)a3 offset:0 atIndex:1];
  [v15 setBytes:v33 length:112 atIndex:2];
  int8x16_t v31 = vextq_s8(*(int8x16_t *)(a3 + 8), *(int8x16_t *)(a3 + 8), 8uLL);
  uint64_t v32 = 1;
  v30[0] = v16;
  v30[1] = v17 / v16;
  v30[2] = 1;
  [v15 dispatchThreads:&v31 threadsPerThreadgroup:v30];

  return 0;
}

void sub_2472281E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t gpuImagePiecewisePolynomial_PlanarF(uint64_t a1, uint64_t a2, void *a3, void *a4, int *a5, int a6, unsigned int a7)
{
  if (a7 > 1) {
    return -5;
  }
  id v15 = *(id *)(a1 + 8);
  id v16 = *(id *)(*(void *)(*(void *)(a1 + 16) + 16) + 400);
  context = (void *)MEMORY[0x24C54E580]([v15 setComputePipelineState:v16]);
  unint64_t v17 = [v16 threadExecutionWidth];
  unint64_t v18 = [v16 maxTotalThreadsPerThreadgroup];
  [v15 setBuffer:*(void *)a2 offset:0 atIndex:0];
  [v15 setBuffer:*a3 offset:0 atIndex:1];
  int v19 = a6 + 1;
  uint64_t v20 = 4 * (a6 + 1);
  [v15 setBytes:*a4 length:v20 atIndex:2];
  if (a7 == 1)
  {
    [v15 setBytes:a4[1] length:v20 atIndex:3];
    int v21 = a5[2];
    int v30 = a5[1];
    int v32 = v21;
  }
  else
  {
    int v28 = 0;
    [v15 setBytes:&v28 length:4 atIndex:3];
    int v30 = 2139095040;
    int v32 = a5[1];
  }
  int v31 = *a5;
  v29[0] = *(void *)(a2 + 24);
  v29[1] = v19;
  [v15 setBytes:v29 length:20 atIndex:4];
  if ((int)v20 <= 0) {
    int v22 = -(-(int)v20 & 0xF);
  }
  else {
    int v22 = v20 & 0xF;
  }
  uint64_t v23 = (int)v20 - v22 + 16;
  [v15 setThreadgroupMemoryLength:v23 atIndex:2];
  [v15 setThreadgroupMemoryLength:v23 atIndex:3];
  int8x16_t v26 = vextq_s8(*(int8x16_t *)(a2 + 8), *(int8x16_t *)(a2 + 8), 8uLL);
  uint64_t v27 = 1;
  v25[0] = v17;
  v25[1] = v18 / v17;
  v25[2] = 1;
  [v15 dispatchThreads:&v26 threadsPerThreadgroup:v25];

  return 0;
}

void sub_247228400(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *gpuCreateSession(char a1, int *a2)
{
  id v4 = MTLCreateSystemDefaultDevice();
  if (v4)
  {
    if (gpuIsAppleFamily())
    {
      v5 = (void *)[v4 newCommandQueue];
      if (!v5 && *a2) {
        *a2 = -4;
      }
      v6 = gpuGetLibrary(v4);
      if (v6)
      {
        if (v5)
        {
          v7 = (id *)malloc_type_calloc(1uLL, 0x18uLL, 0xA0040114AFA65uLL);
          v8 = v7;
          if (v7)
          {
            objc_storeStrong(v7, v4);
            objc_storeStrong(v8 + 1, v5);
            if (a1)
            {
              id v9 = v4;
              id v10 = v6;
              v11 = (void **)malloc_type_calloc(1uLL, 0x1A0uLL, 0x8004090B23163uLL);
              if (v11)
              {
                uint64_t v12 = [v10 newFunctionWithName:@"histogram_argb8"];
                v13 = (void *)v12;
                if (v12) {
                  uint64_t v12 = [v9 newComputePipelineStateWithFunction:v12 error:0];
                }
                id v14 = *v11;
                *v11 = (void *)v12;

                id v15 = (void *)[v10 newFunctionWithName:@"fill_histogram_buffer_kernel"];
                uint64_t v16 = [v9 newComputePipelineStateWithFunction:v15 error:0];
                unint64_t v17 = v11[1];
                v11[1] = (void *)v16;

                unint64_t v18 = (void *)[v10 newFunctionWithName:@"copy_histogram_buffer_kernel"];
                uint64_t v19 = [v9 newComputePipelineStateWithFunction:v18 error:0];
                uint64_t v20 = v11[2];
                v11[2] = (void *)v19;

                int v21 = (void *)[v10 newFunctionWithName:@"box_horizontal_edge_mode_background_argb8_3x1"];
                uint64_t v22 = [v9 newComputePipelineStateWithFunction:v21 error:0];
                uint64_t v23 = v11[3];
                v11[3] = (void *)v22;

                float32x4_t v24 = (void *)[v10 newFunctionWithName:@"box_horizontal_edge_mode_extend_argb8_3x1"];
                uint64_t v25 = [v9 newComputePipelineStateWithFunction:v24 error:0];
                int8x16_t v26 = v11[4];
                v11[4] = (void *)v25;

                uint64_t v27 = (void *)[v10 newFunctionWithName:@"box_horizontal_edge_mode_background_argb8_3x1_widthLEMaxTGSize"];
                uint64_t v28 = [v9 newComputePipelineStateWithFunction:v27 error:0];
                v29 = v11[5];
                v11[5] = (void *)v28;

                int v30 = (void *)[v10 newFunctionWithName:@"box_horizontal_edge_mode_extend_argb8_3x1_widthLEMaxTGSize"];
                uint64_t v31 = [v9 newComputePipelineStateWithFunction:v30 error:0];
                int v32 = v11[6];
                v11[6] = (void *)v31;

                v33 = (void *)[v10 newFunctionWithName:@"box_vertical_edge_mode_background_argb8_1x3"];
                uint64_t v34 = [v9 newComputePipelineStateWithFunction:v33 error:0];
                int v35 = v11[7];
                v11[7] = (void *)v34;

                __int16 v36 = (void *)[v10 newFunctionWithName:@"box_vertical_edge_mode_extend_argb8_1x3"];
                uint64_t v37 = [v9 newComputePipelineStateWithFunction:v36 error:0];
                v38 = v11[8];
                v11[8] = (void *)v37;

                v39 = (void *)[v10 newFunctionWithName:@"box_edge_mode_background_argb_3x3"];
                uint64_t v40 = [v9 newComputePipelineStateWithFunction:v39 error:0];
                v41 = v11[9];
                v11[9] = (void *)v40;

                v42 = (void *)[v10 newFunctionWithName:@"box_edge_mode_extend_argb_3x3"];
                uint64_t v43 = [v9 newComputePipelineStateWithFunction:v42 error:0];
                v44 = v11[10];
                v11[10] = (void *)v43;

                v45 = (void *)[v10 newFunctionWithName:@"box_edge_mode_background_argb_NxM"];
                uint64_t v46 = [v9 newComputePipelineStateWithFunction:v45 error:0];
                v47 = v11[11];
                v11[11] = (void *)v46;

                v48 = (void *)[v10 newFunctionWithName:@"box_edge_mode_extend_argb_NxM"];
                uint64_t v49 = [v9 newComputePipelineStateWithFunction:v48 error:0];
                v50 = v11[12];
                v11[12] = (void *)v49;

                v51 = (void *)[v10 newFunctionWithName:@"box_edge_mode_background_texture_argb_3x3"];
                uint64_t v52 = [v9 newComputePipelineStateWithFunction:v51 error:0];
                v53 = v11[13];
                v11[13] = (void *)v52;

                v54 = (void *)[v10 newFunctionWithName:@"box_edge_mode_extend_texture_argb_3x3"];
                uint64_t v55 = [v9 newComputePipelineStateWithFunction:v54 error:0];
                v56 = v11[14];
                v11[14] = (void *)v55;

                v57 = (void *)[v10 newFunctionWithName:@"box_edge_mode_background_argb_simd_NxM"];
                uint64_t v58 = [v9 newComputePipelineStateWithFunction:v57 error:0];
                v59 = v11[15];
                v11[15] = (void *)v58;

                v60 = (void *)[v10 newFunctionWithName:@"box_edge_mode_extend_argb_simd_NxM"];
                uint64_t v61 = [v9 newComputePipelineStateWithFunction:v60 error:0];
                v62 = v11[16];
                v11[16] = (void *)v61;

                v63 = (void *)[v10 newFunctionWithName:@"imageconvolution_separable_edge_mode_background_argb_Nx1"];
                uint64_t v64 = [v9 newComputePipelineStateWithFunction:v63 error:0];
                v65 = v11[17];
                v11[17] = (void *)v64;

                v66 = (void *)[v10 newFunctionWithName:@"imageconvolution_separable_edge_mode_extend_argb_Nx1"];
                uint64_t v67 = [v9 newComputePipelineStateWithFunction:v66 error:0];
                v68 = v11[18];
                v11[18] = (void *)v67;

                v69 = (void *)[v10 newFunctionWithName:@"imageconvolution_separable_edge_mode_background_argb_1xM"];
                uint64_t v70 = [v9 newComputePipelineStateWithFunction:v69 error:0];
                v71 = v11[19];
                v11[19] = (void *)v70;

                v72 = (void *)[v10 newFunctionWithName:@"imageconvolution_separable_edge_mode_extend_argb_1xM"];
                uint64_t v73 = [v9 newComputePipelineStateWithFunction:v72 error:0];
                v74 = v11[20];
                v11[20] = (void *)v73;

                v75 = (void *)[v10 newFunctionWithName:@"imageconvolution_separable_edge_mode_background_argb_3x3"];
                uint64_t v76 = [v9 newComputePipelineStateWithFunction:v75 error:0];
                v77 = v11[23];
                v11[23] = (void *)v76;

                v78 = (void *)[v10 newFunctionWithName:@"imageconvolution_separable_edge_mode_extend_argb_3x3"];
                uint64_t v79 = [v9 newComputePipelineStateWithFunction:v78 error:0];
                v80 = v11[24];
                v11[24] = (void *)v79;

                v81 = (void *)[v10 newFunctionWithName:@"imageconvolution_separable_edge_mode_background_argb_NxM"];
                uint64_t v82 = [v9 newComputePipelineStateWithFunction:v81 error:0];
                v83 = v11[21];
                v11[21] = (void *)v82;

                v84 = (void *)[v10 newFunctionWithName:@"imageconvolution_separable_edge_mode_extend_argb_NxM"];
                uint64_t v85 = [v9 newComputePipelineStateWithFunction:v84 error:0];
                v86 = v11[22];
                v11[22] = (void *)v85;

                v87 = (void *)[v10 newFunctionWithName:@"imageconvolution_separable_edge_mode_background_texture_argb_3x3"];
                uint64_t v88 = [v9 newComputePipelineStateWithFunction:v87 error:0];
                v89 = v11[25];
                v11[25] = (void *)v88;

                v90 = (void *)[v10 newFunctionWithName:@"imageconvolution_separable_edge_mode_extend_texture_argb_3x3"];
                uint64_t v91 = [v9 newComputePipelineStateWithFunction:v90 error:0];
                v92 = v11[26];
                v11[26] = (void *)v91;

                v93 = (void *)[v10 newFunctionWithName:@"imageconvolution_edge_mode_background_texture_argb8_3x3"];
                uint64_t v94 = [v9 newComputePipelineStateWithFunction:v93 error:0];
                v95 = v11[31];
                v11[31] = (void *)v94;

                v96 = (void *)[v10 newFunctionWithName:@"imageconvolution_edge_mode_extend_texture_argb8_3x3"];
                uint64_t v97 = [v9 newComputePipelineStateWithFunction:v96 error:0];
                v98 = v11[32];
                v11[32] = (void *)v97;

                v99 = (void *)[v10 newFunctionWithName:@"imageconvolution_edge_mode_background_texture_argb8"];
                uint64_t v100 = [v9 newComputePipelineStateWithFunction:v99 error:0];
                v101 = v11[33];
                v11[33] = (void *)v100;

                v102 = (void *)[v10 newFunctionWithName:@"imageconvolution_edge_mode_extend_texture_argb8"];
                uint64_t v103 = [v9 newComputePipelineStateWithFunction:v102 error:0];
                v104 = v11[34];
                v11[34] = (void *)v103;

                v105 = (void *)[v10 newFunctionWithName:@"imageconvolution_edge_mode_background_argb8_3x3"];
                uint64_t v106 = [v9 newComputePipelineStateWithFunction:v105 error:0];
                v107 = v11[29];
                v11[29] = (void *)v106;

                v108 = (void *)[v10 newFunctionWithName:@"imageconvolution_edge_mode_extend_argb8_3x3"];
                uint64_t v109 = [v9 newComputePipelineStateWithFunction:v108 error:0];
                v110 = v11[30];
                v11[30] = (void *)v109;

                v111 = (void *)[v10 newFunctionWithName:@"imageconvolution_edge_mode_background_argb8"];
                uint64_t v112 = [v9 newComputePipelineStateWithFunction:v111 error:0];
                v113 = v11[27];
                v11[27] = (void *)v112;

                v114 = (void *)[v10 newFunctionWithName:@"imageconvolution_edge_mode_extend_argb8"];
                uint64_t v115 = [v9 newComputePipelineStateWithFunction:v114 error:0];
                v116 = v11[28];
                v11[28] = (void *)v115;

                v117 = (void *)[v10 newFunctionWithName:@"matrix_multiply_argb8"];
                uint64_t v118 = [v9 newComputePipelineStateWithFunction:v117 error:0];
                v119 = v11[35];
                v11[35] = (void *)v118;

                v120 = (void *)[v10 newFunctionWithName:@"permute_argb8"];
                uint64_t v121 = [v9 newComputePipelineStateWithFunction:v120 error:0];
                v122 = v11[36];
                v11[36] = (void *)v121;

                v123 = (void *)[v10 newFunctionWithName:@"alpha_blend_argb8"];
                uint64_t v124 = [v9 newComputePipelineStateWithFunction:v123 error:0];
                v125 = v11[37];
                v11[37] = (void *)v124;

                v126 = (void *)[v10 newFunctionWithName:@"premultiplied_alpha_blend_argb8"];
                uint64_t v127 = [v9 newComputePipelineStateWithFunction:v126 error:0];
                v128 = v11[38];
                v11[38] = (void *)v127;

                v129 = (void *)[v10 newFunctionWithName:@"nonpremultiplied_to_premultiplied_alpha_blend_argb8"];
                uint64_t v130 = [v9 newComputePipelineStateWithFunction:v129 error:0];
                v131 = v11[39];
                v11[39] = (void *)v130;

                v132 = (void *)[v10 newFunctionWithName:@"premultiplied_const_alpha_blend_argb8"];
                uint64_t v133 = [v9 newComputePipelineStateWithFunction:v132 error:0];
                v134 = v11[40];
                v11[40] = (void *)v133;

                v135 = (void *)[v10 newFunctionWithName:@"premultiply_RGBA8888"];
                uint64_t v136 = [v9 newComputePipelineStateWithFunction:v135 error:0];
                v137 = v11[41];
                v11[41] = (void *)v136;

                v138 = (void *)[v10 newFunctionWithName:@"premultiply_ARGB8888"];
                uint64_t v139 = [v9 newComputePipelineStateWithFunction:v138 error:0];
                v140 = v11[42];
                v11[42] = (void *)v139;

                v141 = (void *)[v10 newFunctionWithName:@"unpremultiply_RGBA8888"];
                uint64_t v142 = [v9 newComputePipelineStateWithFunction:v141 error:0];
                v143 = v11[43];
                v11[43] = (void *)v142;

                v144 = (void *)[v10 newFunctionWithName:@"unpremultiply_ARGB8888"];
                uint64_t v145 = [v9 newComputePipelineStateWithFunction:v144 error:0];
                v146 = v11[44];
                v11[44] = (void *)v145;

                v147 = (void *)[v10 newFunctionWithName:@"deinterleave_argb8"];
                uint64_t v148 = [v9 newComputePipelineStateWithFunction:v147 error:0];
                v149 = v11[45];
                v11[45] = (void *)v148;

                v150 = (void *)[v10 newFunctionWithName:@"interleave_argb8"];
                uint64_t v151 = [v9 newComputePipelineStateWithFunction:v150 error:0];
                v152 = v11[46];
                v11[46] = (void *)v151;

                v153 = (void *)[v10 newFunctionWithName:@"piecewise_gamma_planarf"];
                uint64_t v154 = [v9 newComputePipelineStateWithFunction:v153 error:0];
                v155 = v11[47];
                v11[47] = (void *)v154;

                v156 = (void *)[v10 newFunctionWithName:@"populate_gamma_lookup_planar8"];
                uint64_t v157 = [v9 newComputePipelineStateWithFunction:v156 error:0];
                v158 = v11[48];
                v11[48] = (void *)v157;

                v159 = (void *)[v10 newFunctionWithName:@"table_lookup_planar8"];
                uint64_t v160 = [v9 newComputePipelineStateWithFunction:v159 error:0];
                v161 = v11[49];
                v11[49] = (void *)v160;

                v162 = (void *)[v10 newFunctionWithName:@"polynomial_planarF"];
                uint64_t v163 = [v9 newComputePipelineStateWithFunction:v162 error:0];
                v164 = v11[50];
                v11[50] = (void *)v163;

                v165 = (void *)[v10 newFunctionWithName:@"rotate_90_argb8"];
                uint64_t v166 = [v9 newComputePipelineStateWithFunction:v165 error:0];
                v167 = v11[51];
                v11[51] = (void *)v166;
              }
              v8[2] = v11;
            }
            goto LABEL_24;
          }
          if (*a2)
          {
            v8 = 0;
            int v168 = -1;
            goto LABEL_22;
          }
        }
      }
      else if (*a2)
      {
        v8 = 0;
        int v168 = -4;
LABEL_22:
        *a2 = v168;
LABEL_24:

        goto LABEL_25;
      }
      v8 = 0;
      goto LABEL_24;
    }
    goto LABEL_17;
  }
  if (!*a2)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_25;
  }
  v8 = 0;
  *a2 = -2;
LABEL_25:

  return v8;
}

void sub_2472291D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t gpuBlockInfoGetSession(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

id *gpuExecuteBlockBegin(id *a1)
{
  v2 = (void *)MEMORY[0x24C54E580]();
  v3 = (id *)malloc_type_calloc(1uLL, 0x18uLL, 0xA0040114AFA65uLL);
  v3[2] = a1;
  uint64_t v4 = [a1[1] commandBuffer];
  id v5 = *v3;
  id *v3 = (id)v4;

  uint64_t v6 = [*v3 computeCommandEncoderWithDispatchType:0];
  id v7 = v3[1];
  v3[1] = (id)v6;

  return v3;
}

void gpuExecuteBlockEnd(id *a1)
{
  v2 = (void *)MEMORY[0x24C54E580]();
  [a1[1] endEncoding];
  [*a1 commit];
  [*a1 waitUntilCompleted];
  id v3 = *a1;
  *a1 = 0;

  id v4 = a1[1];
  a1[1] = 0;

  free(a1);
}

void gpuExecuteBlockEndWithCompletionHandler(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x24C54E580]();
  [a1[1] endEncoding];
  id v5 = *a1;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __gpuExecuteBlockEndWithCompletionHandler_block_invoke;
  v9[3] = &unk_26520A070;
  id v6 = v3;
  id v10 = v6;
  [v5 addCompletedHandler:v9];
  [*a1 commitAndWaitUntilSubmitted];
  id v7 = *a1;
  *a1 = 0;

  id v8 = a1[1];
  a1[1] = 0;

  free(a1);
}

void sub_247229418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t __gpuExecuteBlockEndWithCompletionHandler_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t gpuImageRotate90_ARGB8888(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int *a5)
{
  id v10 = *(id *)(a1 + 8);
  id v11 = *(id *)(*(void *)(*(void *)(a1 + 16) + 16) + 408);
  uint64_t v12 = (void *)MEMORY[0x24C54E580]([v10 setComputePipelineState:v11]);
  unint64_t v13 = [v11 threadExecutionWidth];
  unint64_t v14 = [v11 maxTotalThreadsPerThreadgroup];
  [v10 setBuffer:*(void *)a2 offset:0 atIndex:0];
  [v10 setBuffer:*(void *)a3 offset:0 atIndex:1];
  int v15 = *(_DWORD *)(a2 + 16);
  int v16 = *(_DWORD *)(a2 + 8);
  v65[0] = v15;
  v65[1] = v16;
  int v17 = *(_DWORD *)(a3 + 16);
  v65[2] = *(void *)(a2 + 24);
  int v18 = *(_DWORD *)(a3 + 8);
  uint64_t v19 = *(void *)(a3 + 24);
  int v67 = v17;
  int v68 = v18;
  int v69 = v19;
  uint64_t v20 = 0x100000000;
  int v21 = -1;
  int v22 = 1;
  switch(a4)
  {
    case 0:
      goto LABEL_48;
    case 1:
      uint64_t v20 = 1;
      int v21 = 1;
      goto LABEL_3;
    case 2:
      a4 = 1;
      int v22 = -1;
LABEL_48:
      if (v17 >= v15) {
        int v42 = v17 - v15;
      }
      else {
        int v42 = v17 - v15 + 1;
      }
      int v43 = v18 - v16;
      int v72 = v22;
      int v73 = 0;
      if (v18 >= v16) {
        int v44 = v18 - v16;
      }
      else {
        int v44 = v43 + 1;
      }
      LODWORD(v66) = a4;
      HIDWORD(v66) = a4;
      int v45 = v42 >> 1;
      int v46 = v44 >> 1;
      int v70 = v42 >> 1;
      int v71 = v46;
      if (v17 != v15)
      {
        int v47 = v17 & 1;
        if (v47 != (v15 & 1))
        {
          if (v17) {
            int v48 = (v42 >> 1) & 1;
          }
          else {
            int v48 = 0;
          }
          if (v15) {
            int v48 = !(v45 & 1);
          }
          if ((v17 - v15 + 1) <= 2) {
            int v49 = 0;
          }
          else {
            int v49 = v48;
          }
          if (v45) {
            int v47 = v15 & 1;
          }
          unsigned int v50 = v47 + v45;
          if (v50 <= 1) {
            unsigned int v50 = 1;
          }
          int v51 = v49 + v50;
          int v70 = v51;
          if (v17 < v15)
          {
            if (v15 - v17 != 3 || (v15 & 1) == 0) {
              int v53 = -1;
            }
            else {
              int v53 = -2;
            }
            int v70 = v51 + v53;
          }
        }
      }
      if (v18 != v16)
      {
        int v54 = v18 & 1;
        int v36 = v16 & 1;
        if (v54 != v36)
        {
          unsigned int v55 = v43 + 1;
          if (v18) {
            int v56 = v46 & 1;
          }
          else {
            int v56 = 0;
          }
          if (v16) {
            int v56 = !(v46 & 1);
          }
          if (v55 <= 2) {
            int v57 = 0;
          }
          else {
            int v57 = v56;
          }
          if (v46) {
            int v54 = v16 & 1;
          }
          unsigned int v58 = v54 + v46;
          if (v58 <= 1) {
            unsigned int v58 = 1;
          }
          unsigned int v41 = v57 + v58;
          int v71 = v57 + v58;
          if (v18 < v16) {
            goto LABEL_91;
          }
        }
      }
      goto LABEL_98;
    case 3:
LABEL_3:
      int v72 = 0;
      int v73 = v21;
      uint64_t v66 = v20;
      break;
    default:
      break;
  }
  int v23 = v17 - v16;
  if (v17 < v16) {
    ++v23;
  }
  int v24 = v18 - v15;
  if (v18 >= v15) {
    int v25 = v18 - v15;
  }
  else {
    int v25 = v24 + 1;
  }
  int v26 = v23 >> 1;
  int v27 = v25 >> 1;
  int v70 = v26;
  int v71 = v25 >> 1;
  if (v17 != v16)
  {
    int v28 = v17 & 1;
    if (v28 != (v16 & 1))
    {
      if (v17) {
        int v29 = v26 & 1;
      }
      else {
        int v29 = 0;
      }
      if (v16) {
        int v29 = !(v26 & 1);
      }
      if ((v17 - v16 + 1) <= 2) {
        int v30 = 0;
      }
      else {
        int v30 = v29;
      }
      if (v26) {
        int v28 = v16 & 1;
      }
      unsigned int v31 = v28 + v26;
      if (v31 <= 1) {
        unsigned int v31 = 1;
      }
      int v32 = v30 + v31;
      int v70 = v32;
      if (v17 < v16)
      {
        if (v16 - v17 != 3 || (v16 & 1) == 0) {
          int v34 = -1;
        }
        else {
          int v34 = -2;
        }
        int v70 = v32 + v34;
      }
    }
  }
  if (v18 != v15)
  {
    int v35 = v18 & 1;
    int v36 = v15 & 1;
    if (v35 != v36)
    {
      unsigned int v37 = v24 + 1;
      if (v18) {
        int v38 = (v25 >> 1) & 1;
      }
      else {
        int v38 = 0;
      }
      if (v15) {
        int v38 = !(v27 & 1);
      }
      if (v37 <= 2) {
        int v39 = 0;
      }
      else {
        int v39 = v38;
      }
      if (v27) {
        int v35 = v15 & 1;
      }
      unsigned int v40 = v35 + v27;
      if (v40 <= 1) {
        unsigned int v40 = 1;
      }
      unsigned int v41 = v39 + v40;
      int v71 = v39 + v40;
      if (v18 < v15)
      {
        int v16 = v15;
LABEL_91:
        if (v16 - v18 != 3 || v36 == 0) {
          int v60 = -1;
        }
        else {
          int v60 = -2;
        }
        int v71 = v41 + v60;
      }
    }
  }
LABEL_98:
  int v74 = *a5;
  objc_msgSend(v10, "setBytes:length:atIndex:", v65, 52, 2, *(double *)&v20);
  int8x16_t v63 = vextq_s8(*(int8x16_t *)(a3 + 8), *(int8x16_t *)(a3 + 8), 8uLL);
  uint64_t v64 = 1;
  v62[0] = v13;
  v62[1] = v14 / v13;
  v62[2] = 1;
  [v10 dispatchThreads:&v63 threadsPerThreadgroup:v62];

  return 0;
}

void sub_247229824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t gpuImagePiecewiseGamma_Planar8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, long long *a5, unsigned int a6, float a7)
{
  id v14 = *(id *)(a1 + 8);
  int v15 = (void *)MEMORY[0x24C54E580]();
  uint64_t v16 = a2[1];
  v30[0] = a2[2];
  v30[1] = v16;
  long long v31 = *a5;
  int v17 = *(_DWORD *)(a4 + 8);
  float v32 = a7;
  int v33 = v17;
  float v34 = (float)a6 / 255.0;
  [v14 setComputePipelineState:*(void *)(*(void *)(*(void *)(a1 + 16) + 16) + 384)];
  int v18 = (void *)[**(id **)(a1 + 16) newBufferWithLength:256 options:32];
  [v14 setBuffer:v18 offset:0 atIndex:0];
  [v14 setBytes:v30 length:40 atIndex:1];
  long long v28 = xmmword_24723D370;
  uint64_t v29 = 1;
  long long v26 = xmmword_24723D370;
  uint64_t v27 = 1;
  [v14 dispatchThreads:&v28 threadsPerThreadgroup:&v26];
  id v19 = *(id *)(*(void *)(*(void *)(a1 + 16) + 16) + 392);
  [v14 setComputePipelineState:v19];
  unint64_t v20 = [v19 threadExecutionWidth];
  unint64_t v21 = [v19 maxTotalThreadsPerThreadgroup];
  [v14 setBuffer:*a2 offset:0 atIndex:0];
  [v14 setBuffer:*(void *)a3 offset:0 atIndex:1];
  [v14 setBuffer:v18 offset:0 atIndex:2];
  [v14 setBytes:a3 + 24 length:8 atIndex:3];
  int8x16_t v24 = vextq_s8(*(int8x16_t *)(a3 + 8), *(int8x16_t *)(a3 + 8), 8uLL);
  uint64_t v25 = 1;
  v23[0] = v20;
  v23[1] = v21 / v20;
  v23[2] = 1;
  [v14 dispatchThreads:&v24 threadsPerThreadgroup:v23];

  return 0;
}

void sub_247229A58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t gpuImagePiecewiseGamma_PlanarF(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, void *a5, float a6, float a7)
{
  id v14 = *(id *)(a1 + 8);
  id v15 = *(id *)(*(void *)(*(void *)(a1 + 16) + 16) + 376);
  uint64_t v16 = (void *)MEMORY[0x24C54E580]([v14 setComputePipelineState:v15]);
  unint64_t v17 = [v15 threadExecutionWidth];
  unint64_t v18 = [v15 maxTotalThreadsPerThreadgroup];
  uint64_t v19 = a2[3];
  uint64_t v20 = *a2;
  uint64_t v21 = a2[1];
  v27[0] = a2[2];
  v27[1] = v21;
  *(void *)&long long v22 = *a5;
  *((void *)&v22 + 1) = *(void *)a4;
  v27[2] = v19;
  long long v28 = v22;
  LODWORD(v22) = *(_DWORD *)(a4 + 8);
  float v29 = a6;
  int v30 = v22;
  float v31 = a7;
  [v14 setBuffer:v20 offset:0 atIndex:0];
  [v14 setBuffer:*a3 offset:0 atIndex:1];
  [v14 setBytes:v27 length:40 atIndex:2];
  int8x16_t v25 = vextq_s8(*(int8x16_t *)(a2 + 1), *(int8x16_t *)(a2 + 1), 8uLL);
  uint64_t v26 = 1;
  v24[0] = v17;
  v24[1] = v18 / v17;
  v24[2] = 1;
  [v14 dispatchThreads:&v25 threadsPerThreadgroup:v24];

  return 0;
}

void sub_247229BF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t gpuImageHistogramCalculation_ARGB8888(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x24C54E580]();
  uint64_t v7 = *(void *)(a1 + 16);
  id v8 = *(void **)(v7 + 16);
  uint64_t v9 = a3[1];
  if (v9 != *a3 + 2048 || (uint64_t v10 = a3[2], v10 != v9 + 2048))
  {
    long long v52 = 0u;
    long long v53 = 0u;
LABEL_4:
    uint64_t v11 = objc_msgSend(*(id *)v7, "newBufferWithBytesNoCopy:length:options:deallocator:");
    uint64_t v12 = (void *)v52;
    *(void *)&long long v52 = v11;

    uint64_t v13 = [**(id **)(a1 + 16) newBufferWithBytesNoCopy:a3[1] length:2048 options:0x100000 deallocator:0];
    id v14 = (void *)*((void *)&v52 + 1);
    *((void *)&v52 + 1) = v13;

    uint64_t v15 = [**(id **)(a1 + 16) newBufferWithBytesNoCopy:a3[2] length:2048 options:0x100000 deallocator:0];
    uint64_t v16 = (void *)v53;
    *(void *)&long long v53 = v15;

    uint64_t v17 = [**(id **)(a1 + 16) newBufferWithBytesNoCopy:a3[3] length:2048 options:0x100000 deallocator:0];
    int v18 = 0;
    uint64_t v19 = (void *)*((void *)&v53 + 1);
    *((void *)&v53 + 1) = v17;
    goto LABEL_5;
  }
  uint64_t v34 = a3[3];
  long long v52 = 0u;
  long long v53 = 0u;
  if (v34 != v10 + 2048) {
    goto LABEL_4;
  }
  uint64_t v35 = objc_msgSend(*(id *)v7, "newBufferWithBytesNoCopy:length:options:deallocator:");
  uint64_t v19 = (void *)v52;
  *(void *)&long long v52 = v35;
  int v18 = 1;
LABEL_5:

  id v20 = *(id *)(a1 + 8);
  int v21 = *(_DWORD *)(a2 + 8);
  int v47 = *(void *)(a2 + 16);
  int v48 = v21;
  int v22 = *(_DWORD *)(a2 + 24);
  int v24 = v21 + 15;
  BOOL v23 = v21 < -15;
  int v25 = v21 + 30;
  if (!v23) {
    int v25 = v24;
  }
  int v49 = *(_DWORD *)(a2 + 24);
  int v50 = v25 >> 4;
  int v51 = (v25 >> 4) * v22;
  uint64_t v26 = (void *)[**(id **)(a1 + 16) newBufferWithLength:4096 options:32];
  [v20 setComputePipelineState:*(void *)(*(void *)(*(void *)(a1 + 16) + 16) + 8)];
  [v20 setBuffer:v26 offset:0 atIndex:0];
  int64x2_t v45 = vdupq_n_s64(1uLL);
  uint64_t v46 = 1;
  long long v43 = xmmword_24723D370;
  uint64_t v44 = 1;
  [v20 dispatchThreadgroups:&v45 threadsPerThreadgroup:&v43];
  [v20 setComputePipelineState:*v8];
  [v20 setBuffer:*(void *)a2 offset:0 atIndex:0];
  [v20 setBuffer:v26 offset:0 atIndex:1];
  [v20 setBuffer:v26 offset:1024 atIndex:2];
  [v20 setBuffer:v26 offset:2048 atIndex:3];
  [v20 setBuffer:v26 offset:3072 atIndex:4];
  [v20 setBytes:&v47 length:24 atIndex:5];
  [v20 setThreadgroupMemoryLength:4096 atIndex:0];
  int v27 = v47 + 510;
  if (v47 >= -255) {
    int v27 = v47 + 255;
  }
  uint64_t v28 = (uint64_t)v27 >> 8;
  int v29 = v48 + 30;
  if (v48 >= -15) {
    int v29 = v48 + 15;
  }
  v42[0] = v28;
  v42[1] = (uint64_t)v29 >> 4;
  v42[2] = 1;
  long long v40 = xmmword_24723D370;
  uint64_t v41 = 1;
  [v20 dispatchThreadgroups:v42 threadsPerThreadgroup:&v40];
  [v20 setComputePipelineState:*(void *)(*(void *)(*(void *)(a1 + 16) + 16) + 16)];
  [v20 setBuffer:v26 offset:0 atIndex:0];
  [v20 setBuffer:(void)v52 offset:0 atIndex:1];
  if (v18)
  {
    [v20 setBuffer:(void)v52 offset:2048 atIndex:2];
    [v20 setBuffer:(void)v52 offset:4096 atIndex:3];
    uint64_t v30 = v52;
    uint64_t v31 = 6144;
  }
  else
  {
    [v20 setBuffer:*((void *)&v52 + 1) offset:0 atIndex:2];
    [v20 setBuffer:(void)v53 offset:0 atIndex:3];
    uint64_t v31 = 0;
    uint64_t v30 = *((void *)&v53 + 1);
  }
  [v20 setBuffer:v30 offset:v31 atIndex:4];
  long long v38 = xmmword_24723D380;
  uint64_t v39 = 1;
  long long v36 = xmmword_24723D370;
  uint64_t v37 = 1;
  [v20 dispatchThreadgroups:&v38 threadsPerThreadgroup:&v36];

  for (uint64_t i = 24; i != -8; i -= 8)
  return 0;
}

void sub_24722A030(_Unwind_Exception *a1)
{
  for (uint64_t i = 24; i != -8; i -= 8)
  _Unwind_Resume(a1);
}

uint64_t gpuImageConvert_ARGB8888toPlanar8(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v12 = *(id *)(a1 + 8);
  id v13 = *(id *)(*(void *)(*(void *)(a1 + 16) + 16) + 360);
  id v14 = (void *)MEMORY[0x24C54E580]([v12 setComputePipelineState:v13]);
  unint64_t v15 = [v13 threadExecutionWidth];
  unint64_t v16 = [v13 maxTotalThreadsPerThreadgroup];
  [v12 setBuffer:*(void *)a2 offset:0 atIndex:0];
  [v12 setBuffer:*a3 offset:0 atIndex:1];
  [v12 setBuffer:*a4 offset:0 atIndex:2];
  [v12 setBuffer:*a5 offset:0 atIndex:3];
  [v12 setBuffer:*a6 offset:0 atIndex:4];
  [v12 setBytes:a2 + 16 length:4 atIndex:5];
  [v12 setBytes:a2 + 24 length:4 atIndex:6];
  [v12 setBytes:a3 + 3 length:4 atIndex:7];
  int8x16_t v19 = vextq_s8(*(int8x16_t *)(a2 + 8), *(int8x16_t *)(a2 + 8), 8uLL);
  uint64_t v20 = 1;
  v18[0] = v15;
  v18[1] = v16 / v15;
  v18[2] = 1;
  [v12 dispatchThreads:&v19 threadsPerThreadgroup:v18];

  return 0;
}

void sub_24722A204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t gpuImageConvert_Planar8toARGB8888(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v12 = *(id *)(a1 + 8);
  id v13 = *(id *)(*(void *)(*(void *)(a1 + 16) + 16) + 368);
  id v14 = (void *)MEMORY[0x24C54E580]([v12 setComputePipelineState:v13]);
  unint64_t v15 = [v13 threadExecutionWidth];
  unint64_t v16 = [v13 maxTotalThreadsPerThreadgroup];
  [v12 setBuffer:*a2 offset:0 atIndex:0];
  [v12 setBuffer:*a3 offset:0 atIndex:1];
  [v12 setBuffer:*a4 offset:0 atIndex:2];
  [v12 setBuffer:*a5 offset:0 atIndex:3];
  [v12 setBuffer:*(void *)a6 offset:0 atIndex:4];
  [v12 setBytes:a6 + 16 length:4 atIndex:5];
  [v12 setBytes:a2 + 3 length:4 atIndex:6];
  [v12 setBytes:a6 + 24 length:4 atIndex:7];
  int8x16_t v19 = vextq_s8(*(int8x16_t *)(a6 + 8), *(int8x16_t *)(a6 + 8), 8uLL);
  uint64_t v20 = 1;
  v18[0] = v15;
  v18[1] = v16 / v15;
  v18[2] = 1;
  [v12 dispatchThreads:&v19 threadsPerThreadgroup:v18];

  return 0;
}

void sub_24722A3B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t gpuImagePermuteChannels_ARGB8888(uint64_t a1, void *a2, uint64_t a3, __int32 *a4)
{
  id v8 = *(id *)(a1 + 8);
  uint64_t v9 = (void *)MEMORY[0x24C54E580]([v8 setComputePipelineState:*(void *)(*(void *)(*(void *)(a1 + 16) + 16) + 288)]);
  unint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 16) + 16) + 288) threadExecutionWidth];
  unint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 16) + 16) + 288) maxTotalThreadsPerThreadgroup];
  v12.i32[0] = *a4;
  v13.i64[0] = 0x1800000018;
  v13.i64[1] = 0x1800000018;
  int32x4_t v18 = vsubq_s32(v13, (int32x4_t)vshll_n_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v12), 3uLL));
  [v8 setBuffer:*a2 offset:0 atIndex:0];
  [v8 setBuffer:*(void *)a3 offset:0 atIndex:1];
  [v8 setBytes:a3 + 16 length:4 atIndex:2];
  [v8 setBytes:a3 + 24 length:4 atIndex:3];
  [v8 setBytes:&v18 length:16 atIndex:4];
  int8x16_t v16 = vextq_s8(*(int8x16_t *)(a3 + 8), *(int8x16_t *)(a3 + 8), 8uLL);
  uint64_t v17 = 1;
  v15[0] = v10;
  v15[1] = v11 / v10;
  v15[2] = 1;
  [v8 dispatchThreads:&v16 threadsPerThreadgroup:v15];

  return 0;
}

void sub_24722A524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t gpuImageAlphaBlend_ARGB8888(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  return 0;
}

void gpuImageBlend(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a1;
  id v10 = a2;
  unint64_t v11 = (void *)MEMORY[0x24C54E580]([v10 setComputePipelineState:v9]);
  unint64_t v12 = [v9 threadExecutionWidth];
  unint64_t v13 = [v9 maxTotalThreadsPerThreadgroup];
  [v10 setBuffer:*a3 offset:0 atIndex:0];
  [v10 setBuffer:*a4 offset:0 atIndex:1];
  [v10 setBuffer:*(void *)a5 offset:0 atIndex:2];
  [v10 setBytes:a5 + 16 length:4 atIndex:3];
  [v10 setBytes:a5 + 24 length:4 atIndex:4];
  int8x16_t v15 = vextq_s8(*(int8x16_t *)(a5 + 8), *(int8x16_t *)(a5 + 8), 8uLL);
  uint64_t v16 = 1;
  v14[0] = v12;
  v14[1] = v13 / v12;
  v14[2] = 1;
  [v10 dispatchThreads:&v15 threadsPerThreadgroup:v14];
}

void sub_24722A69C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t gpuImagePremultipliedAlphaBlend_ARGB8888(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  return 0;
}

uint64_t gpuImageNonpremultipliedToPremultiplied_ARGB8888(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  return 0;
}

uint64_t gpuImagePremultipliedConstAlphaBlend_ARGB8888(uint64_t a1, void *a2, void *a3, uint64_t a4, float a5)
{
  float v11 = a5;
  id v9 = *(id *)(*(void *)(*(void *)(a1 + 16) + 16) + 320);
  [*(id *)(a1 + 8) setBytes:&v11 length:4 atIndex:5];
  gpuImageBlend(v9, *(void **)(a1 + 8), a2, a3, a4);

  return 0;
}

void sub_24722A7B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL gpuIsAppleFamily()
{
  return (_get_cpu_capabilities() & 0x78000000) != 0;
}

id gpuGetLibrary(void *a1)
{
  v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  id v3 = [v1 bundleWithIdentifier:@"com.apple.vectornumerics.AccelerateGPU"];
  id v4 = [v3 pathForResource:@"default" ofType:@"metallib"];
  id v5 = [v4 stringByResolvingSymlinksInPath];
  id v6 = [NSURL URLWithString:v5];
  uint64_t v7 = (void *)[v2 newLibraryWithURL:v6 error:0];

  return v7;
}

uint64_t gpuImageTentConvolve_ARGB8888(uint64_t a1, void *a2, void *a3, __int16 a4, __int16 a5, unsigned int a6, unsigned int a7, int *a8, unsigned int a9)
{
  if (a6 < 2)
  {
    int32x4_t v18 = 0;
  }
  else
  {
    uint64_t v17 = (float *)malloc_type_malloc(4 * a6, 0x100004052888210uLL);
    if (!v17) {
      return -2;
    }
    int32x4_t v18 = v17;
    float v19 = (float)((a6 >> 1) + 1);
    uint64_t v20 = (int)v19;
    if ((int)v20 >= 1)
    {
      uint64_t v21 = 0;
      unsigned int v22 = a6 - 1;
      do
      {
        float v23 = (float)((float)((float)((float)(int)v21 + 1.0) / v19) + 0.0) / v19;
        v17[v21] = v23;
        v17[v22] = v23;
        ++v21;
        --v22;
      }
      while (v20 != v21);
    }
  }
  if (a7 >= 2)
  {
    int v24 = (float *)malloc_type_malloc(4 * a7, 0x100004052888210uLL);
    if (v24)
    {
      int v25 = v24;
      float v26 = (float)((a7 >> 1) + 1);
      uint64_t v27 = (int)v26;
      if ((int)v27 >= 1)
      {
        uint64_t v28 = 0;
        unsigned int v29 = a7 - 1;
        do
        {
          float v30 = (float)((float)((float)((float)(int)v28 + 1.0) / v26) + 0.0) / v26;
          v24[v28] = v30;
          v24[v29] = v30;
          ++v28;
          --v29;
        }
        while (v27 != v28);
      }
      goto LABEL_15;
    }
    return -2;
  }
  int v25 = 0;
LABEL_15:
  uint64_t v31 = gpuImageSeparableConvolution_ARGB8888(a1, a2, a3, a4, a5, v18, a6, v25, a7, a8, a9);
  if (v18) {
    free(v18);
  }
  if (v25) {
    free(v25);
  }
  return v31;
}

uint64_t gpuImagePremultiplyData_ARGB8888(uint64_t a1, void *a2, uint64_t a3)
{
  return 0;
}

void gpuImagePremultiplyUnpremultiply(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = (void *)MEMORY[0x24C54E580]([v8 setComputePipelineState:v7]);
  unint64_t v10 = [v7 threadExecutionWidth];
  unint64_t v11 = [v7 maxTotalThreadsPerThreadgroup];
  [v8 setBuffer:*a3 offset:0 atIndex:0];
  [v8 setBuffer:*(void *)a4 offset:0 atIndex:1];
  [v8 setBytes:a3 + 3 length:4 atIndex:2];
  int8x16_t v13 = vextq_s8(*(int8x16_t *)(a4 + 8), *(int8x16_t *)(a4 + 8), 8uLL);
  uint64_t v14 = 1;
  v12[0] = v10;
  v12[1] = v11 / v10;
  v12[2] = 1;
  [v8 dispatchThreads:&v13 threadsPerThreadgroup:v12];
}

void sub_24722ABAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t gpuImagePremultiplyData_RGBA8888(uint64_t a1, void *a2, uint64_t a3)
{
  return 0;
}

uint64_t gpuImageUnpremultiplyData_ARGB8888(uint64_t a1, void *a2, uint64_t a3)
{
  return 0;
}

uint64_t gpuImageUnpremultiplyData_RGBA8888(uint64_t a1, void *a2, uint64_t a3)
{
  return 0;
}

uint64_t gpuImageConvolution_ARGB8888(uint64_t a1, void *a2, void *a3, __int16 a4, __int16 a5, float *a6, unsigned int a7, unsigned int a8, int *a9, unsigned int a10)
{
  if (a9) {
    int v18 = *a9;
  }
  else {
    int v18 = 0;
  }
  context = (void *)MEMORY[0x24C54E580]();
  if (a7 == 1 && a8 == 1)
  {
    [*(id *)(a1 + 8) endEncoding];
    float v19 = [*(id *)a1 blitCommandEncoder];
    [v19 copyFromBuffer:*a2 sourceOffset:0 toBuffer:*a3 destinationOffset:0 size:a3[1] * a3[3]];
    [v19 endEncoding];
    uint64_t v20 = [*(id *)a1 computeCommandEncoderWithDispatchType:0];
    uint64_t v21 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v20;

LABEL_7:
    return 0;
  }
  if (a7 == 1)
  {
    float v23 = 0;
  }
  else
  {
    if (a8 != 1)
    {
      uint64_t v51 = *(void *)(*(void *)(a1 + 16) + 16);
      char v25 = [(id)*a2 contents];
      char v26 = [(id)*a3 contents];
      int v50 = a6;
      if ((a2[3] & 0xF) != 0 || (a3[3] & 0xF) != 0)
      {
        BOOL v27 = 0;
        uint64_t v28 = (a10 >> 3) & 1;
      }
      else
      {
        uint64_t v28 = (a10 >> 3) & 1;
        BOOL v30 = ((a10 >> 3) & 1) != 0 || v18 == 0;
        BOOL v31 = (v26 & 0xF) == 0 && v30;
        BOOL v27 = (v25 & 0xF) == 0 && v31;
      }
      BOOL v33 = a7 != 3 || a8 != 3;
      uint64_t v34 = 216;
      if (v27) {
        uint64_t v34 = 264;
      }
      uint64_t v35 = (id *)(v51 + v34 + 8 * v28);
      uint64_t v36 = 232;
      if (v27) {
        uint64_t v36 = 248;
      }
      uint64_t v37 = v51 + v36 + 8 * v28;
      BOOL v48 = v33;
      if (!v33) {
        uint64_t v35 = (id *)v37;
      }
      id v38 = *v35;
      id v39 = *(id *)(a1 + 8);
      BOOL v49 = v27;
      if (v27)
      {
        id v47 = v38;
        uint64_t v46 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:70 width:a2[2] height:a2[1] mipmapped:0];
        long long v52 = (void *)[(id)*a2 newTextureWithDescriptor:v46 offset:0 bytesPerRow:a2[3]];
        long long v40 = v50;
        uint64_t v41 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:70 width:a3[2] height:a3[1] mipmapped:0];
        long long v53 = (void *)[(id)*a3 newTextureWithDescriptor:v41 offset:0 bytesPerRow:a3[3]];

        int v42 = v47;
      }
      else
      {
        long long v52 = 0;
        long long v53 = 0;
        int v42 = v38;
        long long v40 = v50;
      }
      int16x4_t v59 = vrev32_s16(vmovn_s32(vuzp1q_s32(*(int32x4_t *)(a2 + 1), *(int32x4_t *)(a3 + 1))));
      __int16 v60 = a4;
      __int16 v61 = a5;
      uint64_t v43 = a3[3];
      int v62 = a2[3];
      int v63 = v43;
      int v67 = v18;
      BOOL v66 = v18 == 0;
      unsigned __int16 v64 = a7 >> 1;
      unsigned __int16 v65 = a8 >> 1;
      [v39 setComputePipelineState:v42];
      if (v49)
      {
        [v39 setTexture:v52 atIndex:0];
        [v39 setTexture:v53 atIndex:1];
      }
      else
      {
        [v39 setBuffer:*a2 offset:0 atIndex:0];
        [v39 setBuffer:*a3 offset:0 atIndex:1];
      }
      [v39 setBytes:v40 length:4 * a8 * a7 atIndex:2];
      [v39 setBytes:&v59 length:32 atIndex:3];
      if (v49)
      {
        if (v48) {
          [v39 setThreadgroupMemoryLength:4 * a8 * a7 atIndex:0];
        }
        v58[0] = ((unint64_t)v59.u16[2] + 63) >> 6;
        v58[1] = ((unint64_t)v59.u16[3] + 63) >> 6;
        v58[2] = 1;
        uint64_t v57 = 32;
        uint64_t v44 = v58;
        int64x2_t v45 = &v57;
      }
      else
      {
        [v39 setThreadgroupMemoryLength:((8 * v64 + 128) * (unint64_t)(2 * v65 + 32)) & 0x3FFFFFFF0 atIndex:0];
        v56[0] = ((unint64_t)v59.u16[2] + 31) >> 5;
        v56[1] = ((unint64_t)v59.u16[3] + 31) >> 5;
        v56[2] = 1;
        uint64_t v55 = 32;
        uint64_t v44 = v56;
        int64x2_t v45 = &v55;
      }
      *(_OWORD *)(v45 + 1) = xmmword_24723D390;
      objc_msgSend(v39, "dispatchThreadgroups:threadsPerThreadgroup:", v44);

      goto LABEL_7;
    }
    float v23 = a6;
    a6 = 0;
  }
  uint64_t v24 = gpuImageSeparableConvolution_ARGB8888(a1, a2, a3, a4, a5, v23, a7, a6, a8, a9, a10);
  return v24;
}

void sub_24722B0F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

uint64_t gpuImageSeparableConvolution_ARGB8888(uint64_t a1, void *a2, void *a3, __int16 a4, __int16 a5, float *a6, unsigned int a7, float *a8, unsigned int a9, int *a10, unsigned int a11)
{
  if (a10) {
    int v67 = *a10;
  }
  else {
    int v67 = 0;
  }
  float v18 = 1.0;
  float v19 = 1.0;
  if (a6) {
    float v19 = *a6;
  }
  unsigned int v20 = a9;
  if (a8) {
    float v18 = *a8;
  }
  uint64_t v21 = (void *)MEMORY[0x24C54E580]();
  unsigned int v22 = v21;
  BOOL v24 = a7 == 1 && a9 == 1;
  if (!v24 || v19 != 1.0 || v18 != 1.0)
  {
    if (v24 && (v19 != 1.0 || v18 != 1.0))
    {
      uint64_t v35 = (float *)malloc_type_malloc(0xCuLL, 0x100004052888210uLL);
      if (v35)
      {
        unint64_t v27 = (unint64_t)v35;
        __int16 v63 = a5;
        unint64_t v65 = 0;
        unsigned int v66 = a7;
        *uint64_t v35 = 0.0;
        v35[1] = v19 * v18;
        v35[2] = 0.0;
        unsigned int v20 = 3;
LABEL_48:
        uint64_t v37 = (a11 >> 3) & 1;
        context = (void *)MEMORY[0x24C54E580]();
        uint64_t v38 = *(void *)(*(void *)(a1 + 16) + 16);
        char v39 = [(id)*a2 contents];
        char v40 = [(id)*a3 contents];
        if (v66 == 3 && v20 == 3)
        {
          if ((a2[3] & 0xF) == 0 && (a3[3] & 0xF) == 0 && (v39 & 0xF) == 0 && (v40 & 0xF) == 0)
          {
            int v46 = v67;
            if (v37) {
              BOOL v56 = 1;
            }
            else {
              BOOL v56 = v67 == 0;
            }
            int v57 = v56;
            int v61 = v57;
            uint64_t v58 = v38 + 8 * v37;
            int16x4_t v59 = (id *)(v58 + 200);
            uint64_t v41 = (id *)(v58 + 184);
            if (v56) {
              uint64_t v41 = v59;
            }
            unsigned int v42 = v66;
            goto LABEL_58;
          }
          int v61 = 0;
          uint64_t v41 = (id *)(v38 + 8 * v37 + 184);
          unsigned int v42 = v66;
        }
        else
        {
          uint64_t v43 = v38 + 8 * v37;
          uint64_t v44 = (id *)(v43 + 168);
          uint64_t v41 = (id *)(v43 + 136);
          if (v20 != 1) {
            uint64_t v41 = v44;
          }
          uint64_t v45 = v38 + 8 * v37 + 152;
          unsigned int v42 = v66;
          if (v66 == 1) {
            uint64_t v41 = (id *)v45;
          }
          int v61 = 0;
        }
        int v46 = v67;
LABEL_58:
        id v47 = *v41;
        id v48 = *(id *)(a1 + 8);
        int16x4_t v73 = vrev32_s16(vmovn_s32(vuzp1q_s32(*(int32x4_t *)(a2 + 1), *(int32x4_t *)(a3 + 1))));
        __int16 v74 = a4;
        __int16 v75 = v63;
        uint64_t v49 = a3[3];
        int v76 = a2[3];
        int v77 = v49;
        int v78 = v46;
        unsigned __int16 v79 = v42 >> 1;
        unsigned __int16 v80 = v20 >> 1;
        if (v20 * v42 <= 0x31)
        {
          unint64_t v51 = (unint64_t)[v47 maxTotalThreadsPerThreadgroup] >> 5;
          uint64_t v50 = 32;
          if (v51 >= 0x20) {
            unint64_t v51 = 32;
          }
        }
        else
        {
          uint64_t v50 = 16;
          unint64_t v51 = 16;
        }
        unint64_t v69 = v51;
        [v48 setComputePipelineState:v47];
        if (v61)
        {
          int v62 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:70 width:a2[2] height:a2[1] mipmapped:0];
          unsigned __int16 v64 = (void *)[(id)*a2 newTextureWithDescriptor:v62 offset:0 bytesPerRow:a2[3]];
          long long v52 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:70 width:a3[2] height:a3[1] mipmapped:0];
          long long v53 = (void *)[(id)*a3 newTextureWithDescriptor:v52 offset:0 bytesPerRow:a3[3]];
          [v48 setTexture:v64 atIndex:0];
          [v48 setTexture:v53 atIndex:1];
        }
        else
        {
          [v48 setBuffer:*a2 offset:0 atIndex:0];
          [v48 setBuffer:*a3 offset:0 atIndex:1];
        }
        [v48 setBytes:&v73 length:28 atIndex:2];
        if (v65 | (unint64_t)a6)
        {
          if (v65) {
            uint64_t v54 = (float *)v65;
          }
          else {
            uint64_t v54 = a6;
          }
          [v48 setBytes:v54 length:4 * v42 atIndex:3];
        }
        else
        {
          int v72 = 1065353216;
          [v48 setBytes:&v72 length:4 * v42 atIndex:3];
        }
        if (v27 | (unint64_t)a8)
        {
          if (v27) {
            uint64_t v55 = (float *)v27;
          }
          else {
            uint64_t v55 = a8;
          }
          [v48 setBytes:v55 length:4 * v20 atIndex:4];
        }
        else
        {
          int v72 = 1065353216;
          [v48 setBytes:&v72 length:4 * v20 atIndex:4];
        }
        [v48 setThreadgroupMemoryLength:(8 * v79 + 4 * v50) * (v69 + 2 * v80) atIndex:0];
        v71[0] = (v50 + v73.u16[2] - 1) / v50;
        v71[1] = (v69 + v73.u16[3] - 1) / v69;
        v71[2] = 1;
        v70[0] = v50;
        v70[1] = v69;
        v70[2] = 1;
        [v48 dispatchThreadgroups:v71 threadsPerThreadgroup:v70];

        if (v65) {
          free((void *)v65);
        }
        if (v27) {
          free((void *)v27);
        }
        return 0;
      }
      return -2;
    }
    unint64_t v27 = 0;
    if (a7 == 1 && a8 && v19 != 1.0)
    {
      uint64_t v28 = (char *)malloc_type_malloc(4 * a9, 0x100004052888210uLL);
      if (!v28) {
        return -2;
      }
      unint64_t v27 = (unint64_t)v28;
      if (!a9)
      {
        __int16 v63 = a5;
        unint64_t v65 = 0;
        goto LABEL_47;
      }
      for (uint64_t i = 0; i != a9; ++i)
        *(float *)&v28[i * 4] = v19 * a8[i];
    }
    if (a6 && a9 == 1)
    {
      if (v18 == 1.0)
      {
        __int16 v63 = a5;
        unint64_t v65 = 0;
        unsigned int v66 = a7;
LABEL_45:
        unsigned int v20 = 1;
        goto LABEL_48;
      }
      BOOL v30 = (char *)malloc_type_malloc(4 * a7, 0x100004052888210uLL);
      if (v30)
      {
        unint64_t v65 = (unint64_t)v30;
        unsigned int v66 = a7;
        __int16 v63 = a5;
        if (a7)
        {
          uint64_t v31 = 0;
          do
          {
            *(float *)&v30[v31 * 4] = v18 * a6[v31];
            ++v31;
          }
          while (a7 != v31);
        }
        goto LABEL_45;
      }
      return -2;
    }
    __int16 v63 = a5;
    unint64_t v65 = 0;
LABEL_47:
    unsigned int v66 = a7;
    goto LABEL_48;
  }
  [*(id *)(a1 + 8) endEncoding];
  float v32 = [*(id *)a1 blitCommandEncoder];
  [v32 copyFromBuffer:*a2 sourceOffset:0 toBuffer:*a3 destinationOffset:0 size:a3[1] * a3[3]];
  [v32 endEncoding];
  uint64_t v33 = [*(id *)a1 computeCommandEncoderWithDispatchType:0];
  uint64_t v34 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v33;

  return 0;
}

void sub_24722B788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t gpuImageBoxConvolve_ARGB8888(uint64_t a1, void *a2, void *a3, __int16 a4, __int16 a5, unsigned int a6, unsigned int a7, int *a8, unsigned int a9)
{
  if (a8) {
    int v16 = *a8;
  }
  else {
    int v16 = 0;
  }
  uint64_t v17 = (void *)MEMORY[0x24C54E580]();
  if (a6 == 1 && a7 == 1)
  {
    [*(id *)(a1 + 8) endEncoding];
    float v18 = [*(id *)a1 blitCommandEncoder];
    [v18 copyFromBuffer:*a2 sourceOffset:0 toBuffer:*a3 destinationOffset:0 size:a3[1] * a3[3]];
    [v18 endEncoding];
    uint64_t v19 = [*(id *)a1 computeCommandEncoderWithDispatchType:0];
    unsigned int v20 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v19;

    goto LABEL_50;
  }
  int v73 = v16;
  __int16 v70 = a4;
  uint64_t v21 = (a9 >> 3) & 1;
  uint64_t v22 = *(void *)(*(void *)(a1 + 16) + 16);
  char v23 = [(id)*a2 contents];
  char v24 = [(id)*a3 contents];
  __int16 v72 = a5;
  if (a6 < 2 || a7 < 2)
  {
    if (a6 == 3)
    {
      unint64_t v28 = [*(id *)(v22 + 24) maxTotalThreadsPerThreadgroup];
      unint64_t v29 = a3[2];
      BOOL v30 = v29 > v28;
      BOOL v67 = v29 <= v28;
      uint64_t v31 = (id *)(v22 + 8 * v21 + 40);
      if (v30) {
        uint64_t v31 = (id *)(v22 + 24 + 8 * v21);
      }
      id v75 = *v31;
      id v76 = 0;
      id v26 = 0;
      id v74 = 0;
      unint64_t v27 = 0;
      int v69 = 0;
      unint64_t v32 = a3[2];
      uint64_t v33 = 512;
      if (v32 > 0x200) {
        uint64_t v33 = v28;
      }
      BOOL v30 = v32 > 0x100;
      uint64_t v34 = 256;
      if (v30) {
        uint64_t v34 = v33;
      }
      uint64_t v66 = v34;
      goto LABEL_30;
    }
    if (a7 == 3)
    {
      id v76 = *(id *)(v22 + 8 * v21 + 56);
      uint64_t v37 = [v76 maxTotalThreadsPerThreadgroup];
      id v74 = 0;
      id v75 = 0;
      id v26 = 0;
      uint64_t v66 = 0;
      BOOL v67 = 0;
      int v69 = 0;
      unint64_t v38 = a3[2];
      uint64_t v39 = 512;
      if (v38 > 0x200) {
        uint64_t v39 = v37;
      }
      if (v38 <= 0x100) {
        unint64_t v27 = 256;
      }
      else {
        unint64_t v27 = v39;
      }
      goto LABEL_30;
    }
    uint64_t v41 = v22 + 8 * v21;
    id v26 = *(id *)(v41 + 120);
    uint64_t v36 = *(void **)(v41 + 88);
LABEL_32:
    id v74 = v36;
    id v75 = 0;
    id v76 = 0;
    uint64_t v66 = 0;
    unint64_t v27 = 0;
    BOOL v67 = 0;
    int v69 = 0;
    uint64_t v40 = 36;
    goto LABEL_33;
  }
  if (a6 != 3 || a7 != 3)
  {
    uint64_t v35 = v22 + 8 * v21;
    id v26 = *(id *)(v35 + 120);
    uint64_t v36 = *(void **)(v35 + 88);
    goto LABEL_32;
  }
  if ((a2[3] & 0xF) != 0 || (a3[3] & 0xF) != 0 || (v23 & 0xF) != 0 || (v24 & 0xF) != 0)
  {
    int v69 = 0;
    char v25 = (id *)(v22 + 8 * v21 + 72);
  }
  else
  {
    if (v21) {
      _ZF = 1;
    }
    else {
      _ZF = v73 == 0;
    }
    int v63 = _ZF;
    int v69 = v63;
    uint64_t v64 = v22 + 8 * v21;
    unint64_t v65 = (id *)(v64 + 104);
    char v25 = (id *)(v64 + 72);
    if (_ZF) {
      char v25 = v65;
    }
  }
  id v26 = *v25;
  id v75 = 0;
  id v76 = 0;
  id v74 = 0;
  uint64_t v66 = 0;
  unint64_t v27 = 0;
  BOOL v67 = 0;
LABEL_30:
  uint64_t v40 = 24;
LABEL_33:
  uint64_t v68 = v40;
  id v42 = *(id *)(a1 + 8);
  uint64_t v43 = v42;
  int16x4_t v89 = vrev32_s16(vmovn_s32(vuzp1q_s32(*(int32x4_t *)(a2 + 1), *(int32x4_t *)(a3 + 1))));
  __int16 v90 = v70;
  __int16 v91 = v72;
  uint64_t v44 = a3[3];
  int v92 = a2[3];
  int v93 = v44;
  int v94 = v73;
  unsigned __int16 v95 = a6 >> 1;
  unsigned __int16 v96 = a7 >> 1;
  int v71 = v26;
  if (v26)
  {
    __asm { FMOV            V1.2S, #1.0 }
    float32x2_t v97 = vdiv_f32(_D1, vcvt_f32_u32((uint32x2_t)__PAIR64__(a7, a6)));
    if (a7 * a6 <= 0x31)
    {
      id v53 = v26;
      unint64_t v54 = [v26 maxTotalThreadsPerThreadgroup];
      uint64_t v49 = 32;
      if (v54 >> 5 >= 0x20) {
        unint64_t v50 = 32;
      }
      else {
        unint64_t v50 = v54 >> 5;
      }
      id v51 = v53;
    }
    else
    {
      uint64_t v49 = 16;
      unint64_t v50 = 16;
      id v51 = v74;
    }
    long long v52 = v75;
    objc_msgSend(v43, "setComputePipelineState:", v51, v66);
    if (v69)
    {
      uint64_t v55 = v17;
      BOOL v56 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:70 width:a2[2] height:a2[1] mipmapped:0];
      int v57 = (void *)[(id)*a2 newTextureWithDescriptor:v56 offset:0 bytesPerRow:a2[3]];
      uint64_t v58 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:70 width:a3[2] height:a3[1] mipmapped:0];
      int16x4_t v59 = (void *)[(id)*a3 newTextureWithDescriptor:v58 offset:0 bytesPerRow:a3[3]];
      [v43 setTexture:v57 atIndex:0];
      [v43 setTexture:v59 atIndex:1];

      uint64_t v17 = v55;
      long long v52 = v75;
    }
    else
    {
      [v43 setBuffer:*a2 offset:0 atIndex:0];
      [v43 setBuffer:*a3 offset:0 atIndex:1];
    }
    [v43 setBytes:&v89 length:v68 atIndex:2];
    [v43 setThreadgroupMemoryLength:(8 * v95 + 4 * v49) * (v50 + 2 * v96) atIndex:0];
    v78[0] = (v49 + v89.u16[2] - 1) / v49;
    v78[1] = (v50 + v89.u16[3] - 1) / v50;
    v78[2] = 1;
    v77[0] = v49;
    v77[1] = v50;
    v77[2] = 1;
    [v43 dispatchThreadgroups:v78 threadsPerThreadgroup:v77];
  }
  else
  {
    long long v52 = v75;
    if (v76)
    {
      [v42 setComputePipelineState:v76];
      [v43 setBuffer:*a2 offset:0 atIndex:0];
      [v43 setBuffer:*a3 offset:0 atIndex:1];
      [v43 setBytes:&v89 length:24 atIndex:2];
      v88[0] = (v27 + v89.u16[2] - 1) / v27;
      v88[1] = ((unint64_t)v89.u16[3] + 31) >> 5;
      v88[2] = 1;
      unint64_t v86 = v27;
      int64x2_t v87 = vdupq_n_s64(1uLL);
      [v43 dispatchThreadgroups:v88 threadsPerThreadgroup:&v86];
    }
    if (v75)
    {
      [v43 setComputePipelineState:v75];
      [v43 setBuffer:*a2 offset:0 atIndex:0];
      [v43 setBuffer:*a3 offset:0 atIndex:1];
      [v43 setBytes:&v89 length:24 atIndex:2];
      if (v67)
      {
        [v43 setThreadgroupMemoryLength:4 * v89.u16[2] + 8 atIndex:0];
        uint64_t v84 = v89.u16[3];
        int64x2_t v85 = vdupq_n_s64(1uLL);
        uint64_t v82 = v66;
        int64x2_t v83 = v85;
        [v43 dispatchThreadgroups:&v84 threadsPerThreadgroup:&v82];
      }
      else
      {
        unint64_t v61 = [v75 maxTotalThreadsPerThreadgroup];
        [v43 setThreadgroupMemoryLength:4 * v61 + 8 atIndex:0];
        v81[0] = (v61 + v89.u16[2] - 1) / v61;
        v81[1] = v89.u16[3];
        v81[2] = 1;
        unint64_t v79 = v61;
        int64x2_t v80 = vdupq_n_s64(1uLL);
        [v43 dispatchThreadgroups:v81 threadsPerThreadgroup:&v79];
      }
    }
  }

LABEL_50:
  return 0;
}

void sub_24722BEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

uint64_t gpu_ssyr2k(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, gpu *a17, gpu *a18, uint64_t a19, char *a20,gpu *a21,gpu *a22,unint64_t a23,uint64_t a24,unint64_t a25,int a26,BOOL a27,gpu *a28,unint64_t a29,uint64_t a30,char *a31,uint64_t a32,unint64_t *a33,id *a34,long long a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,int64_t a48,char *a49,unint64_t a50,char *a51,int64_t a52,unint64_t a53,int a54,float a55,long long a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,id a61,uint64_t a62,uint64_t a63)
{
  int v153 = MEMORY[0x270FA5388]();
  STACK[0x1618] = *MEMORY[0x263EF8340];
  STACK[0x13F8] = v79;
  STACK[0x13F0] = v80;
  if (v73 < 128) {
    return 0;
  }
  unint64_t v81 = v76;
  unint64_t v82 = v75;
  uint64_t v83 = v74;
  uint64_t v84 = v73;
  float v85 = v78;
  int v86 = v77;
  int v87 = v72;
  *(_OWORD *)&STACK[0x15E0] = 0u;
  *(_OWORD *)&STACK[0x15F0] = 0u;
  *(_OWORD *)&STACK[0x15C0] = 0u;
  *(_OWORD *)&STACK[0x15D0] = 0u;
  *(_OWORD *)&STACK[0x15A0] = 0u;
  *(_OWORD *)&STACK[0x15B0] = 0u;
  *(_OWORD *)&STACK[0x1580] = 0u;
  *(_OWORD *)&STACK[0x1590] = 0u;
  *(_OWORD *)&STACK[0x1560] = 0u;
  *(_OWORD *)&STACK[0x1570] = 0u;
  *(_OWORD *)&STACK[0x1540] = 0u;
  *(_OWORD *)&STACK[0x1550] = 0u;
  *(_OWORD *)&STACK[0x1520] = 0u;
  *(_OWORD *)&STACK[0x1530] = 0u;
  *(_OWORD *)&STACK[0x1500] = 0u;
  *(_OWORD *)&STACK[0x1510] = 0u;
  *(_OWORD *)&STACK[0x14E0] = 0u;
  *(_OWORD *)&STACK[0x14F0] = 0u;
  *(_OWORD *)&STACK[0x14C0] = 0u;
  *(_OWORD *)&STACK[0x14D0] = 0u;
  *(_OWORD *)&STACK[0x14A0] = 0u;
  *(_OWORD *)&STACK[0x14B0] = 0u;
  *(_OWORD *)&STACK[0x1480] = 0u;
  *(_OWORD *)&STACK[0x1490] = 0u;
  *(_OWORD *)&STACK[0x1460] = 0u;
  *(_OWORD *)&STACK[0x1470] = 0u;
  *(_OWORD *)&STACK[0x1440] = 0u;
  *(_OWORD *)&STACK[0x1450] = 0u;
  *(_OWORD *)&STACK[0x1420] = 0u;
  *(_OWORD *)&STACK[0x1430] = 0u;
  if (v74 <= 0) {
    uint64_t v88 = -(-v74 & 7);
  }
  else {
    uint64_t v88 = v74 & 7;
  }
  *(_OWORD *)&STACK[0x1400] = 0uLL;
  *(_OWORD *)&STACK[0x1410] = 0uLL;
  if (v88 >= 1)
  {
    int16x4_t v89 = (_DWORD *)&STACK[0x1400] - v88 + 8;
    uint64_t v90 = -v88;
    __int16 v91 = &STACK[0x1400] - 4 * v88 + 64;
    uint64_t v92 = 64;
    do
    {
      _DWORD *v89 = 1065353216;
      v89 += 9;
      *(_DWORD *)__int16 v91 = 1065353216;
      __int16 v91 = (unint64_t *)((char *)v91 + 36);
      ++v92;
    }
    while (v90 + v92 != 64);
  }
  uint64_t v93 = v72 ? v73 : v74;
  int v94 = (gpu *)blas::memory::aligned_alloc<float>(8 * v73, 0x20uLL, &STACK[0x13E8]);
  if (!STACK[0x13E8]) {
    return 0;
  }
  if (v87)
  {
    GPUHardwareInfo = gpu::getGPUHardwareInfo(v94);
    if (v153)
    {
      a32 = *((void *)GPUHardwareInfo + 29);
      unsigned __int16 v96 = gpu::getGPUHardwareInfo((gpu *)GPUHardwareInfo) + 15;
    }
    else
    {
      a32 = *((void *)GPUHardwareInfo + 33);
      unsigned __int16 v96 = gpu::getGPUHardwareInfo((gpu *)GPUHardwareInfo) + 17;
    }
  }
  else
  {
    v98 = gpu::getGPUHardwareInfo(v94);
    if (v153)
    {
      a32 = *((void *)v98 + 27);
      unsigned __int16 v96 = gpu::getGPUHardwareInfo((gpu *)v98) + 14;
    }
    else
    {
      a32 = *((void *)v98 + 31);
      unsigned __int16 v96 = gpu::getGPUHardwareInfo((gpu *)v98) + 16;
    }
  }
  v99 = *(unint64_t **)v96;
  unint64_t v100 = STACK[0x13E8];
  STACK[0x1360] = v82;
  STACK[0x1368] = (unint64_t)&STACK[0x13F8];
  STACK[0x1370] = v81;
  STACK[0x1378] = (unint64_t)&STACK[0x13F0];
  v101 = a18;
  STACK[0x1380] = (unint64_t)a17;
  STACK[0x1388] = (unint64_t)&a18;
  STACK[0x1390] = (unint64_t)&STACK[0x1400];
  STACK[0x1398] = v100;
  unint64_t v102 = 4 * v93 * STACK[0x13F0];
  STACK[0x1320] = 4 * v93 * STACK[0x13F8];
  STACK[0x1328] = 8;
  STACK[0x1330] = v102;
  STACK[0x1338] = 8;
  *(_OWORD *)&STACK[0x1348] = xmmword_24723D3A0;
  STACK[0x1340] = 4 * v84 * (void)v101;
  STACK[0x1358] = 32 * v84;
  gpu::hostToDevicePointers<float const*,long const*,float const*,long const*,float *,long const*,float (*)[128],float *,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long>(&STACK[0x1360], (uint64_t)&STACK[0x1320], (uint64_t)&STACK[0x13A0]);
  v104 = &STACK[0x13A8];
  uint64_t v97 = LOBYTE(STACK[0x13A0]) != 0;
  if (LOBYTE(STACK[0x13A0]))
  {
    a34 = (id *)&STACK[0x13A8];
    if ((double)v84 * (double)v84 * (double)v83 <= 8589934590.0)
    {
      if ((v84 & 0x7F) != 0)
      {
        v138 = (gpu *)(v84 & 0x7FFFFFFFFFFFFFE0);
        unint64_t v139 = v84 & 0x7FFFFFFFFFFFFF80;
        if ((v84 & 0x1F) != 0)
        {
          gpu::launchSizeGEMM_32x128(v138, v139, 0, (uint64_t)&STACK[0xF08]);
          STACK[0xF38] = a32;
          STACK[0xF40] = 0;
          STACK[0xF50] = 0;
          STACK[0xF48] = 0;
          STACK[0xF58] = v83;
          LODWORD(STACK[0xF60]) = v86;
          *(float *)&STACK[0xF64] = v85;
          a33 = &STACK[0xF68];
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xF68], (id *)&STACK[0x13A8]);
          long long v140 = *(_OWORD *)&STACK[0xF18];
          *(_OWORD *)&STACK[0xFA8] = *(_OWORD *)&STACK[0xF08];
          *(_OWORD *)&STACK[0xFB8] = v140;
          *(_OWORD *)&STACK[0xFC8] = *(_OWORD *)&STACK[0xF28];
          gpu::launchSizeGEMM_32x128(v138, v84 - v139, 1, (uint64_t)&STACK[0xE28]);
          STACK[0xE58] = (unint64_t)v99;
          STACK[0xE60] = 0;
          STACK[0xE68] = (unint64_t)v138;
          STACK[0xE70] = v139;
          STACK[0xE78] = v84;
          STACK[0xE80] = 0;
          STACK[0xE88] = v83;
          LODWORD(STACK[0xE90]) = v86;
          *(float *)&STACK[0xE94] = v85;
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xE98], (id *)&STACK[0x13A8]);
          long long v141 = *(_OWORD *)&STACK[0xE38];
          *(_OWORD *)&STACK[0xED8] = *(_OWORD *)&STACK[0xE28];
          *(_OWORD *)&STACK[0xEE8] = v141;
          *(_OWORD *)&STACK[0xEF8] = *(_OWORD *)&STACK[0xE48];
          gpu::launchSizeGEMM_32x128((gpu *)(v84 - (void)v138), v139, 1, (uint64_t)&STACK[0xD48]);
          STACK[0xD78] = (unint64_t)v99;
          STACK[0xD80] = (unint64_t)v138;
          STACK[0xD88] = v84;
          STACK[0xD90] = 0;
          STACK[0xD98] = v139;
          STACK[0xDA0] = 0;
          STACK[0xDA8] = v83;
          LODWORD(STACK[0xDB0]) = v86;
          *(float *)&STACK[0xDB4] = v85;
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xDB8], (id *)&STACK[0x13A8]);
          long long v142 = *(_OWORD *)&STACK[0xD58];
          *(_OWORD *)&STACK[0xDF8] = *(_OWORD *)&STACK[0xD48];
          *(_OWORD *)&STACK[0xE08] = v142;
          *(_OWORD *)&STACK[0xE18] = *(_OWORD *)&STACK[0xD68];
          gpu::launchSizeGEMM_32x128((gpu *)(v84 - (void)v138), v84 - v139, 1, (uint64_t)&STACK[0xC68]);
          STACK[0xC98] = (unint64_t)v99;
          STACK[0xCA0] = (unint64_t)v138;
          STACK[0xCA8] = v84;
          STACK[0xCB0] = v139;
          STACK[0xCB8] = v84;
          STACK[0xCC0] = 0;
          STACK[0xCC8] = v83;
          LODWORD(STACK[0xCD0]) = v86;
          *(float *)&STACK[0xCD4] = v85;
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xCD8], (id *)&STACK[0x13A8]);
          long long v143 = *(_OWORD *)&STACK[0xC78];
          *(_OWORD *)&STACK[0xD18] = *(_OWORD *)&STACK[0xC68];
          *(_OWORD *)&STACK[0xD28] = v143;
          *(_OWORD *)&STACK[0xD38] = *(_OWORD *)&STACK[0xC88];
          _ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0ELm1ELm2ELm3EEEEJNS_5tupleIJPN3MTL20ComputePipelineStateENS3_IJllllffEEENS3_IJN2NS9SharedPtrINS4_6BufferEEESB_SB_SB_SB_SB_SB_SB_EEENS_4pairINS4_4SizeESE_EEEEENS3_IJS6_NS3_IJllllllffEEESC_SF_EEESI_SI_EEC2B8ne180100IJLm0ELm1ELm2ELm3EEJSG_SI_SI_SI_EJEJEJSG_SI_SI_SI_EEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSM_IJDpT2_EEEDpOT3_((uint64_t)&STACK[0xFD8], (uint64_t)&STACK[0xF38], (uint64_t)&STACK[0xE58], (uint64_t)&STACK[0xD78], (uint64_t)&STACK[0xC98]);
          v104 = &STACK[0x13A8];
          gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>((uint64_t *)&STACK[0xFD8]);
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x1218]);
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x1168]);
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x10B8]);
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x1008]);
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xCD8]);
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xDB8]);
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xE98]);
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)a33);
          uint64_t v97 = v97;
          goto LABEL_107;
        }
        gpu::launchSizeGEMM_32x128(v138, v139, 0, (uint64_t)&STACK[0xC98]);
        STACK[0xD78] = a32;
        STACK[0xD80] = 0;
        STACK[0xD90] = 0;
        STACK[0xD88] = 0;
        STACK[0xD98] = v83;
        LODWORD(STACK[0xDA0]) = v86;
        *(float *)&STACK[0xDA4] = v85;
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xDA8], (id *)&STACK[0x13A8]);
        long long v145 = *(_OWORD *)&STACK[0xCA8];
        *(_OWORD *)&STACK[0xDE8] = *(_OWORD *)&STACK[0xC98];
        *(_OWORD *)&STACK[0xDF8] = v145;
        *(_OWORD *)&STACK[0xE08] = *(_OWORD *)&STACK[0xCB8];
        gpu::launchSizeGEMM_32x128(v138, v84 - v139, 1, (uint64_t)&STACK[0xF38]);
        STACK[0xE58] = (unint64_t)v99;
        STACK[0xE60] = 0;
        STACK[0xE68] = (unint64_t)v138;
        STACK[0xE70] = v139;
        STACK[0xE78] = v84;
        STACK[0xE80] = 0;
        STACK[0xE88] = v83;
        LODWORD(STACK[0xE90]) = v86;
        *(float *)&STACK[0xE94] = v85;
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xE98], (id *)&STACK[0x13A8]);
        long long v146 = *(_OWORD *)&STACK[0xF48];
        *(_OWORD *)&STACK[0xED8] = *(_OWORD *)&STACK[0xF38];
        *(_OWORD *)&STACK[0xEE8] = v146;
        *(_OWORD *)&STACK[0xEF8] = *(_OWORD *)&STACK[0xF58];
        _ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0ELm1EEEEJNS_5tupleIJPN3MTL20ComputePipelineStateENS3_IJllllffEEENS3_IJN2NS9SharedPtrINS4_6BufferEEESB_SB_SB_SB_SB_SB_SB_EEENS_4pairINS4_4SizeESE_EEEEENS3_IJS6_NS3_IJllllllffEEESC_SF_EEEEEC2B8ne180100IJLm0ELm1EEJSG_SI_EJEJEJSG_SI_EEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSM_IJDpT2_EEEDpOT3_((uint64_t)&STACK[0xB18], (uint64_t)&STACK[0xD78], (uint64_t)&STACK[0xE58]);
        gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>((uint64_t *)&STACK[0xB18]);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xBF8]);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xB48]);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xE98]);
        v144 = &STACK[0xDA8];
      }
      else
      {
        STACK[0x1300] = 0;
        STACK[0x12F8] = 0;
        STACK[0x1308] = 0;
        STACK[0x1310] = v83;
        LODWORD(STACK[0x1318]) = v86;
        *(float *)&STACK[0x131C] = v85;
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x12B8], (id *)&STACK[0x13A8]);
        gpu::launchSizeGEMM_32x128((gpu *)v84, v84, 1, (uint64_t)&STACK[0x1288]);
        gpu::launchWithByteArgs<std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(a32, (long long *)&STACK[0x12F8], (id *)&STACK[0x12B8], (long long *)&STACK[0x1288]);
        v144 = &STACK[0x12B8];
      }
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v144);
      goto LABEL_107;
    }
    a33 = v99;
    unsigned int v149 = v97;
    id v105 = gpu::batchSetup(v103);
    int64_t v106 = 0;
    int64_t v150 = v84;
    while (1)
    {
      uint64_t v107 = v84 - v106;
      if (v84 - v106 >= 2048) {
        uint64_t v107 = 2048;
      }
      a28 = (gpu *)v107;
      int64_t v108 = v153 ? 0 : v106;
      int64_t v109 = v153 ? v106 : v84;
      if (v108 < v109 || v153 != 0) {
        break;
      }
LABEL_99:
      v106 += 2048;
      uint64_t v84 = v150;
      if (v106 >= v150)
      {
        gpu::launch(v105);
        uint64_t v97 = v149;
        goto LABEL_107;
      }
    }
    a29 = a28 & 0x7F;
    a31 = (char *)a28 - 128;
    v111 = (gpu *)((char *)a28 + 127);
    uint64_t v151 = (char *)a28 + 127;
    int64_t v152 = v109;
    if ((uint64_t)a28 >= 0) {
      v111 = a28;
    }
    unint64_t v112 = (unint64_t)v111 & 0xFFFFFFFFFFFFFF80;
    unint64_t v113 = ((unint64_t)v111 & 0xFFFFFFFFFFFFFF80) + v106;
    v114 = (char *)a28 + v106;
    uint64_t v115 = (gpu *)((char *)a28 + 31);
    if ((uint64_t)a28 >= 0) {
      uint64_t v115 = a28;
    }
    a24 = v112;
    a30 = (uint64_t)a28 - v112;
    a19 = a28 & 0x1F;
    v116 = (gpu *)((unint64_t)v115 & 0xFFFFFFFFFFFFFFE0);
    v158 = (char *)a28 - 32;
    a25 = (unint64_t)v116 + v106;
    a21 = v116;
    v161 = (gpu *)(a28 - v116);
    while (1)
    {
      uint64_t v117 = v109 - v108;
      if (v109 - v108 >= 2048) {
        uint64_t v117 = 2048;
      }
      a22 = (gpu *)v117;
      if (v83 >= 1) {
        break;
      }
LABEL_96:
      v108 += 2048;
      int64_t v109 = v152;
      BOOL v137 = v108 <= v152;
      if (!v153) {
        BOOL v137 = v108 < v152;
      }
      v104 = (unint64_t *)a34;
      if (!v137) {
        goto LABEL_99;
      }
    }
    int64_t v118 = 0;
    uint64_t v157 = a22 & 0x1F;
    v119 = (gpu *)((char *)a22 + 31);
    v155 = (char *)a22 + 31;
    if ((uint64_t)a22 >= 0) {
      v119 = a22;
    }
    a27 = (a22 & 0x1F | a29) == 0;
    unint64_t v120 = (unint64_t)v119 & 0xFFFFFFFFFFFFFFE0;
    if (a29) {
      BOOL v121 = (a22 & 0x1F) == 0;
    }
    else {
      BOOL v121 = 1;
    }
    BOOL vars8_4 = v121;
    uint64_t v154 = (char *)a22 - 32;
    BOOL v123 = (unint64_t)a22 - 32 < 0xFFFFFFFFFFFFFFC1 && (unint64_t)a31 < 0xFFFFFFFFFFFFFF01;
    BOOL v156 = v123;
    a23 = v120 + v108;
    a20 = (char *)a22 + v108;
    vars0 = (gpu *)v120;
    a18 = (gpu *)((char *)a22 - v120);
    uint64_t v124 = v83;
    while (1)
    {
      uint64_t v125 = v83;
      uint64_t v126 = v124 - 2048;
      if (v124 >= 2048) {
        uint64_t v127 = 2048;
      }
      else {
        uint64_t v127 = v124;
      }
      unint64_t v128 = v127 + v118;
      if (v118) {
        float v129 = 1.0;
      }
      else {
        float v129 = v85;
      }
      if (v108 == v106)
      {
        if (a29)
        {
          if (a19)
          {
            uint64_t v83 = v125;
            uint64_t v130 = a34;
            if ((unint64_t)a31 <= 0xFFFFFFFFFFFFFF00)
            {
              STACK[0xA58] = v106;
              STACK[0xA60] = v106;
              STACK[0xA68] = v118;
              STACK[0xA70] = v128;
              LODWORD(STACK[0xA78]) = v86;
              *(float *)&STACK[0xA7C] = v129;
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xA18], v130);
              gpu::launchSizeGEMM_32x128(a21, a24, 0, (uint64_t)&STACK[0x9E8]);
              gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v105, a32, (uint64_t)&STACK[0xA58], (id *)&STACK[0xA18], (long long *)&STACK[0x9E8]);
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xA18]);
            }
            if ((unint64_t)v158 <= 0xFFFFFFFFFFFFFFC0)
            {
              STACK[0x9B0] = v106;
              STACK[0x9B8] = a25;
              STACK[0x9C0] = v113;
              STACK[0x9C8] = (unint64_t)v114;
              STACK[0x9D0] = v118;
              STACK[0x9D8] = v128;
              LODWORD(STACK[0x9E0]) = v86;
              *(float *)&STACK[0x9E4] = v129;
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x970], v130);
              gpu::launchSizeGEMM_32x128(a21, a30, 1, (uint64_t)&STACK[0x940]);
              gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v105, (uint64_t)a33, (uint64_t)&STACK[0x9B0], (id *)&STACK[0x970], (long long *)&STACK[0x940]);
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x970]);
            }
            if ((unint64_t)a31 <= 0xFFFFFFFFFFFFFF00)
            {
              STACK[0x908] = a25;
              STACK[0x910] = (unint64_t)v114;
              STACK[0x918] = v106;
              STACK[0x920] = v113;
              STACK[0x928] = v118;
              STACK[0x930] = v128;
              LODWORD(STACK[0x938]) = v86;
              *(float *)&STACK[0x93C] = v129;
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x8C8], v130);
              gpu::launchSizeGEMM_32x128(v161, a24, 1, (uint64_t)&STACK[0x898]);
              gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v105, (uint64_t)a33, (uint64_t)&STACK[0x908], (id *)&STACK[0x8C8], (long long *)&STACK[0x898]);
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x8C8]);
            }
            STACK[0x860] = a25;
            STACK[0x868] = (unint64_t)v114;
            STACK[0x870] = v113;
            STACK[0x878] = (unint64_t)v114;
            STACK[0x880] = v118;
            STACK[0x888] = v128;
            LODWORD(STACK[0x890]) = v86;
            *(float *)&STACK[0x894] = v129;
            std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x820], v130);
            gpu::launchSizeGEMM_32x128(v161, a30, 1, (uint64_t)&STACK[0x7F0]);
            v131 = &STACK[0x820];
            gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v105, (uint64_t)a33, (uint64_t)&STACK[0x860], (id *)&STACK[0x820], (long long *)&STACK[0x7F0]);
          }
          else
          {
            uint64_t v83 = v125;
            v134 = a34;
            if ((unint64_t)a31 <= 0xFFFFFFFFFFFFFF00)
            {
              STACK[0x7C8] = v106;
              STACK[0x7D0] = v106;
              STACK[0x7D8] = v118;
              STACK[0x7E0] = v128;
              LODWORD(STACK[0x7E8]) = v86;
              *(float *)&STACK[0x7EC] = v129;
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x788], v134);
              gpu::launchSizeGEMM_32x128(a21, a24, 0, (uint64_t)&STACK[0x758]);
              gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v105, a32, (uint64_t)&STACK[0x7C8], (id *)&STACK[0x788], (long long *)&STACK[0x758]);
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x788]);
            }
            STACK[0x720] = v106;
            STACK[0x728] = a25;
            STACK[0x730] = v113;
            STACK[0x738] = (unint64_t)v114;
            STACK[0x740] = v118;
            STACK[0x748] = v128;
            LODWORD(STACK[0x750]) = v86;
            *(float *)&STACK[0x754] = v129;
            std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x6E0], v134);
            gpu::launchSizeGEMM_32x128(a21, a30, 1, (uint64_t)&STACK[0x6B0]);
            v131 = &STACK[0x6E0];
            gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v105, (uint64_t)a33, (uint64_t)&STACK[0x720], (id *)&STACK[0x6E0], (long long *)&STACK[0x6B0]);
          }
        }
        else
        {
          STACK[0xAF0] = v106;
          STACK[0xAF8] = v106;
          STACK[0xB00] = v118;
          STACK[0xB08] = v128;
          LODWORD(STACK[0xB10]) = v86;
          *(float *)&STACK[0xB14] = v129;
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xAB0], a34);
          gpu::launchSizeGEMM_32x128(a28, (uint64_t)a28, 1, (uint64_t)&STACK[0xA80]);
          uint64_t v83 = v125;
          v131 = &STACK[0xAB0];
          gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v105, a32, (uint64_t)&STACK[0xAF0], (id *)&STACK[0xAB0], (long long *)&STACK[0xA80]);
        }
      }
      else if (a27)
      {
        STACK[0x688] = v108;
        STACK[0x690] = v106;
        STACK[0x698] = v118;
        STACK[0x6A0] = v128;
        LODWORD(STACK[0x6A8]) = v86;
        *(float *)&STACK[0x6AC] = v129;
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x648], a34);
        gpu::launchSizeGEMM_32x128(a22, (uint64_t)a28, 1, (uint64_t)&STACK[0x618]);
        uint64_t v83 = v125;
        v131 = &STACK[0x648];
        gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v105, a32, (uint64_t)&STACK[0x688], (id *)&STACK[0x648], (long long *)&STACK[0x618]);
      }
      else
      {
        if (!vars8_4)
        {
          if (v156)
          {
            STACK[0x5F0] = v108;
            STACK[0x5F8] = v106;
            STACK[0x600] = v118;
            STACK[0x608] = v128;
            LODWORD(STACK[0x610]) = v86;
            *(float *)&STACK[0x614] = v129;
            std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x5B0], a34);
            gpu::launchSizeGEMM_32x128(vars0, a24, 1, (uint64_t)&STACK[0x580]);
            gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v105, a32, (uint64_t)&STACK[0x5F0], (id *)&STACK[0x5B0], (long long *)&STACK[0x580]);
            unint64_t v133 = v127 + v118;
            std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x5B0]);
            goto LABEL_85;
          }
          unint64_t v133 = v127 + v118;
          if ((unint64_t)v154 <= 0xFFFFFFFFFFFFFFC0)
          {
LABEL_85:
            STACK[0x548] = v108;
            STACK[0x550] = a23;
            STACK[0x558] = v113;
            STACK[0x560] = (unint64_t)v114;
            STACK[0x568] = v118;
            STACK[0x570] = v133;
            LODWORD(STACK[0x578]) = v86;
            *(float *)&STACK[0x57C] = v129;
            std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x508], a34);
            gpu::launchSizeGEMM_32x128(vars0, a30, 1, (uint64_t)&STACK[0x4D8]);
            gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v105, (uint64_t)a33, (uint64_t)&STACK[0x548], (id *)&STACK[0x508], (long long *)&STACK[0x4D8]);
            std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x508]);
          }
          uint64_t v83 = v125;
          v135 = a34;
          if ((unint64_t)a31 <= 0xFFFFFFFFFFFFFF00)
          {
            STACK[0x4A0] = a23;
            STACK[0x4A8] = (unint64_t)a20;
            STACK[0x4B0] = v106;
            STACK[0x4B8] = v113;
            STACK[0x4C0] = v118;
            STACK[0x4C8] = v128;
            LODWORD(STACK[0x4D0]) = v86;
            *(float *)&STACK[0x4D4] = v129;
            std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x460], v135);
            gpu::launchSizeGEMM_32x128(a18, a24, 1, (uint64_t)&STACK[0x430]);
            gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v105, (uint64_t)a33, (uint64_t)&STACK[0x4A0], (id *)&STACK[0x460], (long long *)&STACK[0x430]);
            std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x460]);
          }
          STACK[0x3F8] = a23;
          STACK[0x400] = (unint64_t)a20;
          STACK[0x408] = v113;
          STACK[0x410] = (unint64_t)v114;
          STACK[0x418] = v118;
          STACK[0x420] = v128;
          LODWORD(STACK[0x428]) = v86;
          *(float *)&STACK[0x42C] = v129;
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x3B8], v135);
          gpu::launchSizeGEMM_32x128(a18, a30, 1, (uint64_t)&STACK[0x388]);
          v131 = &STACK[0x3B8];
          gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v105, (uint64_t)a33, (uint64_t)&STACK[0x3F8], (id *)&STACK[0x3B8], (long long *)&STACK[0x388]);
          goto LABEL_89;
        }
        if (v157)
        {
          uint64_t v83 = v125;
          v132 = a34;
          if ((unint64_t)v155 >= 0x3F)
          {
            STACK[0x360] = v108;
            STACK[0x368] = v106;
            STACK[0x370] = v118;
            STACK[0x378] = v128;
            LODWORD(STACK[0x380]) = v86;
            *(float *)&STACK[0x384] = v129;
            std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x320], v132);
            gpu::launchSizeGEMM_32x128(vars0, (uint64_t)a28, 1, (uint64_t)&STACK[0x2F0]);
            gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v105, a32, (uint64_t)&STACK[0x360], (id *)&STACK[0x320], (long long *)&STACK[0x2F0]);
            std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x320]);
          }
          STACK[0x2B8] = a23;
          STACK[0x2C0] = (unint64_t)a20;
          STACK[0x2C8] = v106;
          STACK[0x2D0] = (unint64_t)v114;
          STACK[0x2D8] = v118;
          STACK[0x2E0] = v128;
          LODWORD(STACK[0x2E8]) = v86;
          *(float *)&STACK[0x2EC] = v129;
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&a80, v132);
          gpu::launchSizeGEMM_32x128(a18, (uint64_t)a28, 1, (uint64_t)&a75);
          v131 = (unint64_t *)&a80;
          gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v105, (uint64_t)a33, (uint64_t)&STACK[0x2B8], &a80, &a75);
        }
        else
        {
          uint64_t v83 = v125;
          if (!a29) {
            goto LABEL_90;
          }
          uint64_t v136 = a34;
          if ((unint64_t)v151 >= 0xFF)
          {
            a69 = v108;
            a70 = v106;
            a71 = v118;
            a72 = v128;
            a73 = v86;
            a74 = v129;
            std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&a61, a34);
            gpu::launchSizeGEMM_32x128(a22, a24, 1, (uint64_t)&a56);
            gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v105, a32, (uint64_t)&a69, &a61, &a56);
            std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&a61);
          }
          a48 = v108;
          a49 = a20;
          a50 = v113;
          a51 = v114;
          a52 = v118;
          a53 = v128;
          a54 = v86;
          a55 = v129;
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&a40, v136);
          gpu::launchSizeGEMM_32x128(a22, a30, 1, (uint64_t)&a35);
          v131 = (unint64_t *)&a40;
          gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v105, (uint64_t)a33, (uint64_t)&a48, &a40, &a35);
        }
      }
LABEL_89:
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v131);
LABEL_90:
      v118 += 2048;
      uint64_t v124 = v126;
      if (v118 >= v83) {
        goto LABEL_96;
      }
    }
  }
LABEL_107:
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v104);
  v147 = (void *)STACK[0x13E8];
  STACK[0x13E8] = 0;
  if (v147) {
    free(v147);
  }
  return v97;
}

void sub_24722CF28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v43 + 224);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v43 + 48);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v41);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v42);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(a41);
  uint64_t v45 = (void *)STACK[0x13E8];
  STACK[0x13E8] = 0;
  if (v45) {
    free(v45);
  }
  _Unwind_Resume(a1);
}

unint64_t blas::memory::aligned_alloc<float>@<X0>(unint64_t result@<X0>, size_t a2@<X1>, void *a3@<X8>)
{
  id v4 = 0;
  if (!(result >> 62))
  {
    if (4 * result)
    {
      memptr = 0;
      __n128 result = malloc_type_posix_memalign(&memptr, a2, 4 * result, 0x5346E28EuLL);
      id v4 = memptr;
      if (result) {
        id v4 = 0;
      }
    }
  }
  *a3 = v4;
  return result;
}

void gpu::hostToDevicePointers<float const*,long const*,float const*,long const*,float *,long const*,float (*)[128],float *,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  uint64_t v10 = a1[7];
  *(void *)&long long v16 = *a1;
  uint64_t v40 = v5;
  uint64_t v41 = v4;
  uint64_t v38 = v7;
  uint64_t v39 = v6;
  uint64_t v36 = v9;
  uint64_t v37 = v8;
  uint64_t v35 = v10;
  char v25 = (id *)&v20;
  id v26 = (char *)&v35;
  unint64_t v27 = (long long *)&v24;
  unint64_t v28 = (char *)&v36;
  unint64_t v29 = &v37;
  BOOL v30 = (char *)&v38;
  uint64_t v31 = &v39;
  unint64_t v32 = (char *)&v40;
  uint64_t v33 = &v41;
  uint64_t v34 = &v16;
  _ZZZN3gpu20hostToDevicePointersIJPKfPKlS2_S4_PfS4_PA128_fS5_EJmmmmmmmmEEEDaNSt3__15tupleIJDpT_EEENSA_IJDpT0_EEEENKUlS2_S4_S2_S4_S5_S4_S7_S5_E_clES2_S4_S2_S4_S5_S4_S7_S5_ENKUlmmmmmmmmE_clEmmmmmmmm((uint64_t)&v25, *(const void **)a2, *(const void **)(a2 + 8), *(const void **)(a2 + 16), *(const void **)(a2 + 24), *(const void **)(a2 + 32), *(const void **)(a2 + 40), *(const void **)(a2 + 48), *(void **)(a2 + 56));
  char v11 = v24 ^ 1;
  char v25 = (id *)&v20;
  id v26 = (char *)&v20 + 8;
  unint64_t v27 = &v21;
  unint64_t v28 = (char *)&v21 + 8;
  unint64_t v29 = (uint64_t *)&v22;
  BOOL v30 = (char *)&v22 + 8;
  uint64_t v31 = (uint64_t *)&v23;
  unint64_t v32 = (char *)&v23 + 8;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl[abi:ne180100]<std::tuple<NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&>,void>(&v16, &v25);
  *(unsigned char *)a3 = v11;
  long long v12 = v17;
  *(_OWORD *)(a3 + 8) = v16;
  *(_OWORD *)(a3 + 24) = v12;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v13 = v19;
  *(_OWORD *)(a3 + 40) = v18;
  *(_OWORD *)(a3 + 56) = v13;
  long long v18 = 0u;
  long long v19 = 0u;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&v16);
  for (uint64_t i = 56; i != -8; i -= 8)
  {
    int8x16_t v15 = *(void **)((char *)&v20 + i);
    if (v15) {
  }
    }
}

void sub_24722D268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  std::array<NS::SharedPtr<MTL::Buffer>,8ul>::~array((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t gpu::launchWithByteArgs<std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(uint64_t a1, long long *a2, id *a3, long long *a4)
{
  long long v11 = *a2;
  long long v12 = a2[1];
  uint64_t v13 = *((void *)a2 + 4);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v14, a3);
  long long v5 = a4[1];
  long long v18 = *a4;
  long long v19 = v5;
  long long v7 = *a4;
  long long v6 = a4[1];
  long long v20 = a4[2];
  long long v22 = v11;
  long long v23 = v12;
  v25[0] = v14;
  v25[1] = v15;
  v25[2] = v16;
  void v25[3] = v17;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v8 = a4[2];
  v25[5] = v6;
  v25[6] = v8;
  uint64_t v21 = a1;
  uint64_t v24 = v13;
  v25[4] = v7;
  gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>((uint64_t)&v21);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v25);
  return std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&v14);
}

void sub_24722D358(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v2);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v1);
  _Unwind_Resume(a1);
}

void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(uint64_t *a1)
{
  uint64_t v2 = (gpu *)objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v3 = objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v2) + 1), sel_commandBuffer);
  uint64_t v9 = &v10;
  id v10 = v3;
  uint64_t v4 = (gpu *)std::__invoke[abi:ne180100]<void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1},std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&>(&v9, a1, a1 + 20, a1 + 42, a1 + 64);
  long long v5 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v4) + 47), sel_setSignaledValue_, 0);
  long long v6 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v5) + 47), sel_signaledValue);
  id v7 = v10;
  GPUHardwareInfo = gpu::getGPUHardwareInfo(v6);
  long long v6 = (gpu *)((char *)v6 + 1);
  objc_msgSend(v7, sel_encodeSignalEvent_value_, *((void *)GPUHardwareInfo + 47), v6);
  objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(v10, sel_commitAndWaitUntilSubmitted)) + 47), sel_waitUntilSignaledValue_timeoutMS_, v6, 0xFFFFFFFFLL);
  if (v2) {
}
  }

void sub_24722D4AC(_Unwind_Exception *exception_object)
{
  if (v1) {

  }
  _Unwind_Resume(exception_object);
}

uint64_t std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>::~tuple(uint64_t a1)
{
  return a1;
}

void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(uint64_t *a1)
{
  uint64_t v2 = (gpu *)objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v3 = objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v2) + 1), sel_commandBuffer);
  long long v14 = &v15;
  id v15 = v3;
  id v4 = (id)*a1;
  long long v26 = *(_OWORD *)(a1 + 1);
  long long v27 = *(_OWORD *)(a1 + 3);
  uint64_t v5 = a1[5];
  id v25 = v4;
  uint64_t v28 = v5;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v29, (id *)a1 + 6);
  long long v6 = *((_OWORD *)a1 + 8);
  long long v30 = *((_OWORD *)a1 + 7);
  long long v31 = v6;
  long long v32 = *((_OWORD *)a1 + 9);
  uint64_t v16 = a1[20];
  long long v17 = *(_OWORD *)(a1 + 21);
  long long v18 = *(_OWORD *)(a1 + 23);
  long long v7 = *(_OWORD *)(a1 + 25);
  uint64_t v20 = a1[27];
  long long v19 = v7;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v21, (id *)a1 + 28);
  long long v8 = *((_OWORD *)a1 + 19);
  long long v22 = *((_OWORD *)a1 + 18);
  long long v23 = v8;
  long long v24 = *((_OWORD *)a1 + 20);
  gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(&v14, (uint64_t)&v25, (uint64_t)&v16);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v21);
  uint64_t v9 = (gpu *)std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v29);
  GPUHardwareInfo = gpu::getGPUHardwareInfo(v9);
  long long v11 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(*((id *)GPUHardwareInfo + 47), sel_setSignaledValue_, 0, v14))+ 47), sel_signaledValue);
  id v12 = v15;
  uint64_t v13 = gpu::getGPUHardwareInfo(v11);
  long long v11 = (gpu *)((char *)v11 + 1);
  objc_msgSend(v12, sel_encodeSignalEvent_value_, *((void *)v13 + 47), v11);
  objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(v15, sel_commitAndWaitUntilSubmitted)) + 47), sel_waitUntilSignaledValue_timeoutMS_, v11, 0xFFFFFFFFLL);
  if (v2) {
}
  }

void sub_24722D6F0(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v3);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v2);
  if (v1) {

  }
  _Unwind_Resume(a1);
}

void gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(void *a1, uint64_t a2, uint64_t a3, id *a4, long long *a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v11 = objc_msgSend(a1, sel_computeCommandEncoder);
  objc_msgSend(v11, sel_setComputePipelineState_, a2);
  uint64_t v12 = *(void *)(a3 + 8);
  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = *(void *)(a3 + 24);
  int v15 = *(_DWORD *)(a3 + 32);
  int v16 = *(_DWORD *)(a3 + 36);
  *(void *)&v24[0] = *(void *)a3;
  v23[0] = v12;
  *(void *)&long long v19 = v13;
  *(void *)&long long v17 = v14;
  int v21 = v16;
  int v22 = v15;
  objc_msgSend(v11, sel_setBytes_length_atIndex_, v24, 8, 0);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, v23, 8, 1);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v19, 8, 2);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v17, 8, 3);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v22, 4, 4);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v21, 4, 5);
  memset(v24, 0, sizeof(v24));
  *(void *)&long long v19 = v24;
  *((void *)&v19 + 1) = v23;
  std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>((void **)&v19, a4, a4 + 1, a4 + 2, a4 + 3, a4 + 4, a4 + 5, a4 + 6, a4 + 7);
  objc_msgSend(v11, sel_setBuffers_offsets_withRange_, v24, v23, 6, 8);
  long long v19 = *a5;
  uint64_t v20 = *((void *)a5 + 2);
  long long v17 = *(long long *)((char *)a5 + 24);
  uint64_t v18 = *((void *)a5 + 5);
  objc_msgSend(v11, sel_dispatchThreads_threadsPerThreadgroup_, &v19, &v17);
  objc_msgSend(v11, sel_endEncoding);
  if (v10) {
}
  }

void sub_24722D978(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(void *a1, uint64_t a2, uint64_t a3, id *a4, long long *a5)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v11 = objc_msgSend(a1, sel_computeCommandEncoder);
  objc_msgSend(v11, sel_setComputePipelineState_, a2);
  uint64_t v12 = *(void *)(a3 + 8);
  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = *(void *)(a3 + 24);
  uint64_t v15 = *(void *)(a3 + 32);
  uint64_t v16 = *(void *)(a3 + 40);
  int v17 = *(_DWORD *)(a3 + 48);
  int v18 = *(_DWORD *)(a3 + 52);
  *(void *)&v28[0] = *(void *)a3;
  uint64_t v26 = v15;
  v27[0] = v12;
  *(void *)&long long v21 = v13;
  *(void *)&long long v19 = v14;
  uint64_t v25 = v16;
  int v23 = v18;
  int v24 = v17;
  objc_msgSend(v11, sel_setBytes_length_atIndex_, v28, 8, 0);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, v27, 8, 1);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v21, 8, 2);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v19, 8, 3);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v26, 8, 4);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v25, 8, 5);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v24, 4, 6);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v23, 4, 7);
  memset(v28, 0, sizeof(v28));
  *(void *)&long long v21 = v28;
  *((void *)&v21 + 1) = v27;
  std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>((void **)&v21, a4, a4 + 1, a4 + 2, a4 + 3, a4 + 4, a4 + 5, a4 + 6, a4 + 7);
  objc_msgSend(v11, sel_setBuffers_offsets_withRange_, v28, v27, 8, 8);
  long long v21 = *a5;
  uint64_t v22 = *((void *)a5 + 2);
  long long v19 = *(long long *)((char *)a5 + 24);
  uint64_t v20 = *((void *)a5 + 5);
  objc_msgSend(v11, sel_dispatchThreads_threadsPerThreadgroup_, &v21, &v19);
  objc_msgSend(v11, sel_endEncoding);
  if (v10) {
}
  }

void sub_24722DC3C(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t std::array<NS::SharedPtr<MTL::Buffer>,8ul>::~array(uint64_t a1)
{
  for (uint64_t i = 56; i != -8; i -= 8)
  {
    uint64_t v3 = *(void **)(a1 + i);
    if (v3) {
  }
    }
  return a1;
}

void __clang_call_terminate(void *a1)
{
}

void _ZZZN3gpu20hostToDevicePointersIJPKfPKlS2_S4_PfS4_PA128_fS5_EJmmmmmmmmEEEDaNSt3__15tupleIJDpT_EEENSA_IJDpT0_EEEENKUlS2_S4_S2_S4_S5_S4_S7_S5_E_clES2_S4_S2_S4_S5_S4_S7_S5_ENKUlmmmmmmmmE_clEmmmmmmmm(uint64_t a1, const void *a2, const void *a3, const void *a4, const void *a5, const void *a6, const void *a7, const void *a8, void *a9)
{
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 72), a2, &v23);
  NS::SharedPtr<MTL::Buffer>::operator=(*(void ***)a1, &v23);
  **(unsigned char **)(a1 + 16) |= **(void **)a1 == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 64), a3, &v22);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 8), &v22);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 8) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 56), a4, &v21);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 16), &v21);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 16) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 48), a5, &v20);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 24), &v20);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 24) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 40), a6, &v19);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 32), &v19);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 32) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 32), a7, &v18);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 40), &v18);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 40) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 24), a8, &v17);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 48), &v17);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 48) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 8), a9, &v16);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 56), &v16);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 56) == 0;
  if (v16) {

  }
  if (v17) {
  if (v18)
  }

  if (v19) {
  if (v20)
  }

  if (v21) {
  if (v22)
  }

  if (v23) {
}
  }

void sub_24722DFC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, id a10, id a11, id a12, id a13, id a14, id a15, id a16)
{
  if (a9) {

  }
  if (a10) {
  if (a11)
  }

  if (a12) {
  if (a13)
  }

  if (a14) {
  if (a15)
  }

  if (a16) {
  _Unwind_Resume(exception_object);
  }
}

void **NS::SharedPtr<MTL::Buffer>::operator=(void **a1, void **a2)
{
  id v4 = *a1;
  uint64_t v5 = *a2;
  if (v4 == *a2)
  {
  }
  else
  {
    if (v4)
    {

      uint64_t v5 = *a2;
    }
    *a1 = v5;
  }
  *a2 = 0;
  return a1;
}

void *std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(void *result, void *a2)
{
  *__n128 result = *a2;
  *a2 = 0;
  result[1] = a2[1];
  a2[1] = 0;
  result[2] = a2[2];
  a2[2] = 0;
  result[3] = a2[3];
  a2[3] = 0;
  result[4] = a2[4];
  a2[4] = 0;
  result[5] = a2[5];
  a2[5] = 0;
  result[6] = a2[6];
  a2[6] = 0;
  result[7] = a2[7];
  a2[7] = 0;
  return result;
}

void *std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl[abi:ne180100]<std::tuple<NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&>,void>(void *a1, id **a2)
{
  *a1 = **a2;
  a1[1] = *a2[1];
  a1[2] = *a2[2];
  a1[3] = *a2[3];
  a1[4] = *a2[4];
  a1[5] = *a2[5];
  a1[6] = *a2[6];
  a1[7] = *a2[7];
  return a1;
}

void *std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  return a1;
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 56);
  if (v2) {

  }
  uint64_t v3 = *(void **)(a1 + 48);
  if (v3) {

  }
  id v4 = *(void **)(a1 + 40);
  if (v4) {

  }
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5) {

  }
  long long v6 = *(void **)(a1 + 24);
  if (v6) {

  }
  long long v7 = *(void **)(a1 + 16);
  if (v7) {

  }
  long long v8 = *(void **)(a1 + 8);
  if (v8) {

  }
  if (*(void *)a1) {
  return a1;
  }
}

uint64_t _ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0ELm1ELm2ELm3EEEEJNS_5tupleIJPN3MTL20ComputePipelineStateENS3_IJllllffEEENS3_IJN2NS9SharedPtrINS4_6BufferEEESB_SB_SB_SB_SB_SB_SB_EEENS_4pairINS4_4SizeESE_EEEEENS3_IJS6_NS3_IJllllllffEEESC_SF_EEESI_SI_EEC2B8ne180100IJLm0ELm1ELm2ELm3EEJSG_SI_SI_SI_EJEJEJSG_SI_SI_SI_EEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSM_IJDpT2_EEEDpOT3_(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)a1 = *(void *)a2;
  long long v10 = *(_OWORD *)(a2 + 8);
  long long v11 = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v11;
  *(_OWORD *)(a1 + 8) = v10;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl((void *)(a1 + 48), (void *)(a2 + 48));
  long long v12 = *(_OWORD *)(a2 + 112);
  long long v13 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v13;
  *(_OWORD *)(a1 + 112) = v12;
  *(void *)(a1 + 160) = *(void *)a3;
  long long v14 = *(_OWORD *)(a3 + 8);
  long long v15 = *(_OWORD *)(a3 + 24);
  long long v16 = *(_OWORD *)(a3 + 40);
  *(void *)(a1 + 216) = *(void *)(a3 + 56);
  *(_OWORD *)(a1 + 200) = v16;
  *(_OWORD *)(a1 + 184) = v15;
  *(_OWORD *)(a1 + 168) = v14;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl((void *)(a1 + 224), (void *)(a3 + 64));
  long long v17 = *(_OWORD *)(a3 + 128);
  long long v18 = *(_OWORD *)(a3 + 160);
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a3 + 144);
  *(_OWORD *)(a1 + 320) = v18;
  *(_OWORD *)(a1 + 288) = v17;
  *(void *)(a1 + 336) = *(void *)a4;
  long long v19 = *(_OWORD *)(a4 + 8);
  long long v20 = *(_OWORD *)(a4 + 24);
  long long v21 = *(_OWORD *)(a4 + 40);
  *(void *)(a1 + 392) = *(void *)(a4 + 56);
  *(_OWORD *)(a1 + 360) = v20;
  *(_OWORD *)(a1 + 376) = v21;
  *(_OWORD *)(a1 + 344) = v19;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl((void *)(a1 + 400), (void *)(a4 + 64));
  long long v22 = *(_OWORD *)(a4 + 128);
  long long v23 = *(_OWORD *)(a4 + 160);
  *(_OWORD *)(a1 + 480) = *(_OWORD *)(a4 + 144);
  *(_OWORD *)(a1 + 496) = v23;
  *(_OWORD *)(a1 + 464) = v22;
  *(void *)(a1 + 512) = *(void *)a5;
  long long v24 = *(_OWORD *)(a5 + 8);
  long long v25 = *(_OWORD *)(a5 + 24);
  long long v26 = *(_OWORD *)(a5 + 40);
  *(void *)(a1 + 568) = *(void *)(a5 + 56);
  *(_OWORD *)(a1 + 536) = v25;
  *(_OWORD *)(a1 + 552) = v26;
  *(_OWORD *)(a1 + 520) = v24;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl((void *)(a1 + 576), (void *)(a5 + 64));
  long long v27 = *(_OWORD *)(a5 + 128);
  long long v28 = *(_OWORD *)(a5 + 160);
  *(_OWORD *)(a1 + 656) = *(_OWORD *)(a5 + 144);
  *(_OWORD *)(a1 + 672) = v28;
  *(_OWORD *)(a1 + 640) = v27;
  return a1;
}

uint64_t _ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0ELm1EEEEJNS_5tupleIJPN3MTL20ComputePipelineStateENS3_IJllllffEEENS3_IJN2NS9SharedPtrINS4_6BufferEEESB_SB_SB_SB_SB_SB_SB_EEENS_4pairINS4_4SizeESE_EEEEENS3_IJS6_NS3_IJllllllffEEESC_SF_EEEEEC2B8ne180100IJLm0ELm1EEJSG_SI_EJEJEJSG_SI_EEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSM_IJDpT2_EEEDpOT3_(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  long long v6 = *(_OWORD *)(a2 + 8);
  long long v7 = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v7;
  *(_OWORD *)(a1 + 8) = v6;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl((void *)(a1 + 48), (void *)(a2 + 48));
  long long v8 = *(_OWORD *)(a2 + 112);
  long long v9 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v9;
  *(_OWORD *)(a1 + 112) = v8;
  *(void *)(a1 + 160) = *(void *)a3;
  long long v10 = *(_OWORD *)(a3 + 8);
  long long v11 = *(_OWORD *)(a3 + 24);
  long long v12 = *(_OWORD *)(a3 + 40);
  *(void *)(a1 + 216) = *(void *)(a3 + 56);
  *(_OWORD *)(a1 + 200) = v12;
  *(_OWORD *)(a1 + 184) = v11;
  *(_OWORD *)(a1 + 168) = v10;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl((void *)(a1 + 224), (void *)(a3 + 64));
  long long v13 = *(_OWORD *)(a3 + 128);
  long long v14 = *(_OWORD *)(a3 + 160);
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a3 + 144);
  *(_OWORD *)(a1 + 320) = v14;
  *(_OWORD *)(a1 + 288) = v13;
  return a1;
}

void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(uint64_t a1)
{
  uint64_t v2 = (gpu *)objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v3 = objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v2) + 1), sel_commandBuffer);
  uint64_t v9 = *(void *)a1;
  long long v10 = *(_OWORD *)(a1 + 8);
  long long v11 = *(_OWORD *)(a1 + 24);
  uint64_t v12 = *(void *)(a1 + 40);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v13, (id *)(a1 + 48));
  long long v4 = *(_OWORD *)(a1 + 128);
  long long v14 = *(_OWORD *)(a1 + 112);
  long long v15 = v4;
  long long v16 = *(_OWORD *)(a1 + 144);
  v19[0] = v10;
  v19[1] = v11;
  uint64_t v20 = v12;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v18, v13);
  v17[0] = v14;
  v17[1] = v15;
  v17[2] = v16;
  gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v3, v9, (uint64_t)v19, v18, v17);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v18);
  uint64_t v5 = (gpu *)std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v13);
  long long v6 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v5) + 47), sel_setSignaledValue_, 0);
  long long v7 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v6) + 47), sel_signaledValue);
  GPUHardwareInfo = gpu::getGPUHardwareInfo(v7);
  long long v7 = (gpu *)((char *)v7 + 1);
  objc_msgSend(v3, sel_encodeSignalEvent_value_, *((void *)GPUHardwareInfo + 47), v7);
  objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(v3, sel_commitAndWaitUntilSubmitted)) + 47), sel_waitUntilSignaledValue_timeoutMS_, v7, 0xFFFFFFFFLL);
  if (v2) {
}
  }

void sub_24722E730(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v3 - 160);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v2);
  if (v1) {

  }
  _Unwind_Resume(a1);
}

uint64_t std::__invoke[abi:ne180100]<void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1},std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&>(void ***a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  id v10 = (id)*a2;
  long long v51 = *(_OWORD *)(a2 + 1);
  long long v52 = *(_OWORD *)(a2 + 3);
  uint64_t v11 = a2[5];
  id v50 = v10;
  uint64_t v53 = v11;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v54, (id *)a2 + 6);
  long long v12 = *((_OWORD *)a2 + 8);
  long long v55 = *((_OWORD *)a2 + 7);
  long long v56 = v12;
  long long v57 = *((_OWORD *)a2 + 9);
  id v13 = (id)*a3;
  long long v42 = *(_OWORD *)(a3 + 1);
  long long v43 = *(_OWORD *)(a3 + 3);
  long long v14 = *(_OWORD *)(a3 + 5);
  uint64_t v15 = a3[7];
  id v41 = v13;
  uint64_t v45 = v15;
  long long v44 = v14;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v46, (id *)a3 + 8);
  long long v16 = *((_OWORD *)a3 + 9);
  long long v47 = *((_OWORD *)a3 + 8);
  long long v48 = v16;
  long long v33 = *(_OWORD *)(a4 + 1);
  long long v34 = *(_OWORD *)(a4 + 3);
  long long v35 = *(_OWORD *)(a4 + 5);
  long long v17 = *((_OWORD *)a3 + 10);
  uint64_t v18 = a4[7];
  id v32 = (id)*a4;
  uint64_t v36 = v18;
  long long v49 = v17;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v37, (id *)a4 + 8);
  long long v19 = *((_OWORD *)a4 + 9);
  long long v38 = *((_OWORD *)a4 + 8);
  long long v39 = v19;
  long long v40 = *((_OWORD *)a4 + 10);
  id v23 = (id)*a5;
  long long v24 = *(_OWORD *)(a5 + 1);
  long long v25 = *(_OWORD *)(a5 + 3);
  long long v20 = *(_OWORD *)(a5 + 5);
  uint64_t v27 = a5[7];
  long long v26 = v20;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v28, (id *)a5 + 8);
  long long v21 = *((_OWORD *)a5 + 9);
  long long v29 = *((_OWORD *)a5 + 8);
  long long v30 = v21;
  long long v31 = *((_OWORD *)a5 + 10);
  gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(a1, (uint64_t)&v50, (uint64_t)&v41, (uint64_t)&v32, (uint64_t)&v23);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v28);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v37);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v46);
  return std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v54);
}

void sub_24722E918(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v3);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v4);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v2);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v1);
  _Unwind_Resume(a1);
}

uint64_t gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(void ***a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = **a1;
  uint64_t v11 = *(void *)a2;
  long long v12 = *(_OWORD *)(a2 + 24);
  v41[0] = *(_OWORD *)(a2 + 8);
  v41[1] = v12;
  uint64_t v42 = *(void *)(a2 + 40);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v40, (id *)(a2 + 48));
  long long v13 = *(_OWORD *)(a2 + 128);
  v39[0] = *(_OWORD *)(a2 + 112);
  v39[1] = v13;
  v39[2] = *(_OWORD *)(a2 + 144);
  gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v10, v11, (uint64_t)v41, v40, v39);
  long long v14 = **a1;
  uint64_t v15 = *(void *)a3;
  long long v16 = *(_OWORD *)(a3 + 24);
  v37[0] = *(_OWORD *)(a3 + 8);
  v37[1] = v16;
  v37[2] = *(_OWORD *)(a3 + 40);
  uint64_t v38 = *(void *)(a3 + 56);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v36, (id *)(a3 + 64));
  long long v17 = *(_OWORD *)(a3 + 144);
  v35[0] = *(_OWORD *)(a3 + 128);
  v35[1] = v17;
  v35[2] = *(_OWORD *)(a3 + 160);
  gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v14, v15, (uint64_t)v37, v36, v35);
  uint64_t v18 = **a1;
  uint64_t v19 = *(void *)a4;
  long long v20 = *(_OWORD *)(a4 + 24);
  v33[0] = *(_OWORD *)(a4 + 8);
  v33[1] = v20;
  v33[2] = *(_OWORD *)(a4 + 40);
  uint64_t v34 = *(void *)(a4 + 56);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v32, (id *)(a4 + 64));
  long long v21 = *(_OWORD *)(a4 + 144);
  v31[0] = *(_OWORD *)(a4 + 128);
  v31[1] = v21;
  v31[2] = *(_OWORD *)(a4 + 160);
  gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v18, v19, (uint64_t)v33, v32, v31);
  long long v22 = **a1;
  uint64_t v23 = *(void *)a5;
  long long v24 = *(_OWORD *)(a5 + 24);
  v29[0] = *(_OWORD *)(a5 + 8);
  v29[1] = v24;
  _DWORD v29[2] = *(_OWORD *)(a5 + 40);
  uint64_t v30 = *(void *)(a5 + 56);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v28, (id *)(a5 + 64));
  long long v25 = *(_OWORD *)(a5 + 144);
  v27[0] = *(_OWORD *)(a5 + 128);
  v27[1] = v25;
  v27[2] = *(_OWORD *)(a5 + 160);
  gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v22, v23, (uint64_t)v29, v28, v27);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v28);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v32);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v36);
  return std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v40);
}

void sub_24722EB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&a15);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&a37);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&a59);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v59 - 176);
  _Unwind_Resume(a1);
}

uint64_t gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(void ***a1, uint64_t a2, uint64_t a3)
{
  long long v6 = **a1;
  uint64_t v7 = *(void *)a2;
  long long v8 = *(_OWORD *)(a2 + 24);
  v21[0] = *(_OWORD *)(a2 + 8);
  v21[1] = v8;
  uint64_t v22 = *(void *)(a2 + 40);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v20, (id *)(a2 + 48));
  long long v9 = *(_OWORD *)(a2 + 128);
  v19[0] = *(_OWORD *)(a2 + 112);
  v19[1] = v9;
  _OWORD v19[2] = *(_OWORD *)(a2 + 144);
  gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v6, v7, (uint64_t)v21, v20, v19);
  id v10 = **a1;
  uint64_t v11 = *(void *)a3;
  long long v12 = *(_OWORD *)(a3 + 24);
  v17[0] = *(_OWORD *)(a3 + 8);
  v17[1] = v12;
  v17[2] = *(_OWORD *)(a3 + 40);
  uint64_t v18 = *(void *)(a3 + 56);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v16, (id *)(a3 + 64));
  long long v13 = *(_OWORD *)(a3 + 144);
  v15[0] = *(_OWORD *)(a3 + 128);
  v15[1] = v13;
  v15[2] = *(_OWORD *)(a3 + 160);
  gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v10, v11, (uint64_t)v17, v16, v15);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v16);
  return std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v20);
}

void sub_24722EC60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)va);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v7 - 160);
  _Unwind_Resume(a1);
}

void std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>(void **a1, id *a2, id *a3, id *a4, id *a5, id *a6, id *a7, id *a8, id *a9)
{
  id v16 = *a2;
  id v17 = *a3;
  id v18 = *a4;
  id v19 = *a5;
  id v20 = *a6;
  id v21 = *a7;
  id v22 = *a8;
  id v23 = *a9;
  **a1 = v16;
  long long v24 = *a1;
  *a1[1] = 0;
  v24[1] = v17;
  long long v25 = *a1;
  a1[1][1] = 0;
  v25[2] = v18;
  long long v26 = *a1;
  a1[1][2] = 0;
  v26[3] = v19;
  uint64_t v27 = *a1;
  a1[1][3] = 0;
  v27[4] = v20;
  long long v28 = *a1;
  a1[1][4] = 0;
  v28[5] = v21;
  long long v29 = *a1;
  a1[1][5] = 0;
  v29[6] = v22;
  uint64_t v30 = *a1;
  a1[1][6] = 0;
  v30[7] = v23;
  a1[1][7] = 0;
  if (v23) {

  }
  if (v22) {
  if (v21)
  }

  if (v20) {
  if (v19)
  }

  if (v18) {
  if (v17)
  }

  if (v16) {
}
  }

void std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>(void **a1, id *a2, id *a3, id *a4, id *a5, id *a6, id *a7, id *a8, id *a9)
{
  id v16 = *a2;
  id v17 = *a3;
  id v18 = *a4;
  id v19 = *a5;
  id v20 = *a6;
  id v21 = *a7;
  id v22 = *a8;
  id v23 = *a9;
  **a1 = v16;
  long long v24 = *a1;
  *a1[1] = 0;
  v24[1] = v17;
  long long v25 = *a1;
  a1[1][1] = 0;
  v25[2] = v18;
  long long v26 = *a1;
  a1[1][2] = 0;
  v26[3] = v19;
  uint64_t v27 = *a1;
  a1[1][3] = 0;
  v27[4] = v20;
  long long v28 = *a1;
  a1[1][4] = 0;
  v28[5] = v21;
  long long v29 = *a1;
  a1[1][5] = 0;
  v29[6] = v22;
  uint64_t v30 = *a1;
  a1[1][6] = 0;
  v30[7] = v23;
  a1[1][7] = 0;
  if (v23) {

  }
  if (v22) {
  if (v21)
  }

  if (v20) {
  if (v19)
  }

  if (v18) {
  if (v17)
  }

  if (v16) {
}
  }

BOOL gpu_ssymm(gpu *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9, float a10, uint64_t a11, uint64_t a12)
{
  int v21 = (int)a1;
  uint64_t v22 = a12;
  uint64_t v53 = a8;
  uint64_t v54 = a6;
  if (!a1)
  {
    if (a3 > 127 || a4 > 31)
    {
      GPUHardwareInfo = gpu::getGPUHardwareInfo(a1);
      long long v24 = (uint64_t *)GPUHardwareInfo + 37;
      if (!a2) {
        long long v24 = (uint64_t *)(GPUHardwareInfo + 19);
      }
      uint64_t v25 = a4;
      goto LABEL_13;
    }
    return 0;
  }
  if (a3 <= 31 && a4 <= 127) {
    return 0;
  }
  id v23 = gpu::getGPUHardwareInfo(a1);
  long long v24 = (uint64_t *)v23 + 35;
  if (!a2) {
    long long v24 = (uint64_t *)(v23 + 18);
  }
  uint64_t v25 = a3;
LABEL_13:
  uint64_t v28 = *v24;
  v50[0] = a5;
  v50[1] = &v54;
  v50[2] = a7;
  v50[3] = &v53;
  v50[4] = a11;
  v50[5] = &a12;
  v49[0] = (const void *)(4 * v25 * a6);
  v49[1] = (const void *)8;
  v49[2] = (const void *)(4 * a4 * a8);
  v49[3] = (const void *)8;
  v49[4] = (const void *)(4 * a4 * v22);
  v49[5] = (const void *)8;
  gpu::hostToDevicePointers<float const*,long const*,float const*,long const*,float *,long const*,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long>(v50, v49, (uint64_t)v51);
  BOOL v26 = v51[0] != 0;
  if (v51[0])
  {
    if (v21)
    {
      *(void *)&long long v42 = 0;
      *((void *)&v42 + 1) = a3;
      uint64_t v43 = 0;
      uint64_t v44 = a4;
      uint64_t v45 = 0;
      int v46 = (gpu *)a3;
      float v47 = a9;
      float v48 = a10;
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v41, v52);
      gpu::launchSizeGEMM_32x128((gpu *)a3, a4, 1, (uint64_t)v40);
      long long v29 = v41;
      gpu::launchWithByteArgs<std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(v28, &v42, v41, v40);
    }
    else
    {
      *(void *)&long long v33 = 0;
      *((void *)&v33 + 1) = a3;
      uint64_t v34 = 0;
      uint64_t v35 = a4;
      uint64_t v36 = 0;
      uint64_t v37 = a4;
      float v38 = a9;
      float v39 = a10;
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v32, v52);
      gpu::launchSizeGEMM_128x32((gpu *)a3, a4, 1, (uint64_t)v31);
      long long v29 = v32;
      gpu::launchWithByteArgs<std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(v28, &v33, v32, v31);
    }
    std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v29);
  }
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v52);
  return v26;
}

void sub_24722F1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)va);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v8);
  _Unwind_Resume(a1);
}

void gpu::hostToDevicePointers<float const*,long const*,float const*,long const*,float *,long const*,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long>(void *a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  char v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  *(void *)&long long v13 = *a1;
  uint64_t v31 = v5;
  uint64_t v32 = v4;
  uint64_t v29 = v7;
  uint64_t v30 = v6;
  uint64_t v28 = v8;
  id v20 = (id *)&v16;
  int v21 = (char *)&v28;
  uint64_t v22 = (long long *)&v19;
  id v23 = (char *)&v29;
  long long v24 = &v30;
  uint64_t v25 = (char *)&v31;
  BOOL v26 = &v32;
  uint64_t v27 = &v13;
  _ZZZN3gpu20hostToDevicePointersIJPKfPKlS2_S4_PfS4_EJmmmmmmEEEDaNSt3__15tupleIJDpT_EEENS8_IJDpT0_EEEENKUlS2_S4_S2_S4_S5_S4_E_clES2_S4_S2_S4_S5_S4_ENKUlmmmmmmE_clEmmmmmm((uint64_t)&v20, *a2, a2[1], a2[2], a2[3], a2[4], a2[5]);
  char v9 = v19 ^ 1;
  id v20 = (id *)&v16;
  int v21 = (char *)&v16 + 8;
  uint64_t v22 = &v17;
  id v23 = (char *)&v17 + 8;
  long long v24 = (uint64_t *)&v18;
  uint64_t v25 = (char *)&v18 + 8;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl[abi:ne180100]<std::tuple<NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&>,void>(&v13, &v20);
  *(unsigned char *)a3 = v9;
  long long v10 = v14;
  *(_OWORD *)(a3 + 8) = v13;
  *(_OWORD *)(a3 + 24) = v10;
  long long v13 = 0u;
  long long v14 = 0u;
  *(_OWORD *)(a3 + 40) = v15;
  long long v15 = 0u;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&v13);
  for (uint64_t i = 40; i != -8; i -= 8)
  {
    long long v12 = *(void **)((char *)&v16 + i);
    if (v12) {
  }
    }
}

void sub_24722F324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::array<NS::SharedPtr<MTL::Buffer>,6ul>::~array((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t gpu::launchWithByteArgs<std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(uint64_t a1, long long *a2, id *a3, long long *a4)
{
  long long v12 = *a2;
  long long v13 = a2[1];
  long long v14 = a2[2];
  uint64_t v15 = *((void *)a2 + 6);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v16, a3);
  long long v5 = *a4;
  long long v6 = a4[2];
  long long v7 = *a4;
  long long v20 = a4[1];
  long long v21 = v6;
  long long v23 = v12;
  long long v24 = v13;
  long long v25 = v14;
  v27[0] = v16;
  v27[1] = v17;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v8 = v18;
  long long v18 = 0u;
  long long v19 = v5;
  long long v9 = a4[2];
  v27[4] = v20;
  v27[5] = v9;
  uint64_t v22 = a1;
  uint64_t v26 = v15;
  v27[2] = v8;
  long long v27[3] = v7;
  gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>((uint64_t)&v22);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v27);
  return std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&v16);
}

void sub_24722F41C(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v2);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v1);
  _Unwind_Resume(a1);
}

uint64_t std::array<NS::SharedPtr<MTL::Buffer>,6ul>::~array(uint64_t a1)
{
  for (uint64_t i = 40; i != -8; i -= 8)
  {
    uint64_t v3 = *(void **)(a1 + i);
    if (v3) {
  }
    }
  return a1;
}

void _ZZZN3gpu20hostToDevicePointersIJPKfPKlS2_S4_PfS4_EJmmmmmmEEEDaNSt3__15tupleIJDpT_EEENS8_IJDpT0_EEEENKUlS2_S4_S2_S4_S5_S4_E_clES2_S4_S2_S4_S5_S4_ENKUlmmmmmmE_clEmmmmmm(uint64_t a1, const void *a2, const void *a3, const void *a4, const void *a5, const void *a6, const void *a7)
{
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 56), a2, &v18);
  NS::SharedPtr<MTL::Buffer>::operator=(*(void ***)a1, &v18);
  **(unsigned char **)(a1 + 16) |= **(void **)a1 == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 48), a3, &v17);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 8), &v17);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 8) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 40), a4, &v16);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 16), &v16);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 16) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 32), a5, &v15);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 24), &v15);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 24) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 24), a6, &v14);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 32), &v14);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 32) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 8), a7, &v13);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 40), &v13);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 40) == 0;
  if (v13) {

  }
  if (v14) {
  if (v15)
  }

  if (v16) {
  if (v17)
  }

  if (v18) {
}
  }

void sub_24722F6B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, id a10, id a11, id a12, id a13, id a14)
{
  if (a9) {

  }
  if (a10) {
  if (a11)
  }

  if (a12) {
  if (a13)
  }

  if (a14) {
  _Unwind_Resume(exception_object);
  }
}

void *std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl[abi:ne180100]<std::tuple<NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&>,void>(void *a1, id **a2)
{
  *a1 = **a2;
  a1[1] = *a2[1];
  a1[2] = *a2[2];
  a1[3] = *a2[3];
  a1[4] = *a2[4];
  a1[5] = *a2[5];
  return a1;
}

void *std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  return a1;
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2) {

  }
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3) {

  }
  uint64_t v4 = *(void **)(a1 + 24);
  if (v4) {

  }
  long long v5 = *(void **)(a1 + 16);
  if (v5) {

  }
  long long v6 = *(void **)(a1 + 8);
  if (v6) {

  }
  if (*(void *)a1) {
  return a1;
  }
}

void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(uint64_t a1)
{
  uint64_t v2 = (gpu *)objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v3 = objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v2) + 1), sel_commandBuffer);
  uint64_t v9 = *(void *)a1;
  long long v10 = *(_OWORD *)(a1 + 8);
  long long v11 = *(_OWORD *)(a1 + 24);
  long long v12 = *(_OWORD *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 56);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v14, (id *)(a1 + 64));
  long long v4 = *(_OWORD *)(a1 + 128);
  long long v15 = *(_OWORD *)(a1 + 112);
  long long v16 = v4;
  long long v17 = *(_OWORD *)(a1 + 144);
  v20[0] = v10;
  v20[1] = v11;
  v20[2] = v12;
  uint64_t v21 = v13;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v19, v14);
  v18[0] = v15;
  v18[1] = v16;
  v18[2] = v17;
  gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v3, v9, (uint64_t)v20, v19, v18);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v19);
  long long v5 = (gpu *)std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v14);
  long long v6 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v5) + 47), sel_setSignaledValue_, 0);
  long long v7 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v6) + 47), sel_signaledValue);
  GPUHardwareInfo = gpu::getGPUHardwareInfo(v7);
  long long v7 = (gpu *)((char *)v7 + 1);
  objc_msgSend(v3, sel_encodeSignalEvent_value_, *((void *)GPUHardwareInfo + 47), v7);
  objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(v3, sel_commitAndWaitUntilSubmitted)) + 47), sel_waitUntilSignaledValue_timeoutMS_, v7, 0xFFFFFFFFLL);
  if (v2) {
}
  }

void sub_24722FADC(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v3 - 160);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v2);
  if (v1) {

  }
  _Unwind_Resume(a1);
}

void gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(void *a1, uint64_t a2, uint64_t a3, id *a4, long long *a5)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v11 = objc_msgSend(a1, sel_computeCommandEncoder);
  objc_msgSend(v11, sel_setComputePipelineState_, a2);
  uint64_t v12 = *(void *)(a3 + 8);
  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = *(void *)(a3 + 24);
  uint64_t v15 = *(void *)(a3 + 32);
  uint64_t v16 = *(void *)(a3 + 40);
  int v17 = *(_DWORD *)(a3 + 48);
  int v18 = *(_DWORD *)(a3 + 52);
  *(void *)&v28[0] = *(void *)a3;
  uint64_t v26 = v15;
  v27[0] = v12;
  *(void *)&long long v21 = v13;
  uint64_t v25 = v16;
  int v23 = v18;
  int v24 = v17;
  objc_msgSend(v11, sel_setBytes_length_atIndex_, v28, 8, 0, v14);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, v27, 8, 1);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v21, 8, 2);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v19, 8, 3);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v26, 8, 4);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v25, 8, 5);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v24, 4, 6);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v23, 4, 7);
  memset(v28, 0, sizeof(v28));
  *(void *)&long long v21 = v28;
  *((void *)&v21 + 1) = v27;
  std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>((void **)&v21, a4, a4 + 1, a4 + 2, a4 + 3, a4 + 4, a4 + 5);
  objc_msgSend(v11, sel_setBuffers_offsets_withRange_, v28, v27, 8, 6);
  long long v21 = *a5;
  uint64_t v22 = *((void *)a5 + 2);
  long long v19 = *(long long *)((char *)a5 + 24);
  uint64_t v20 = *((void *)a5 + 5);
  objc_msgSend(v11, sel_dispatchThreads_threadsPerThreadgroup_, &v21, &v19);
  objc_msgSend(v11, sel_endEncoding);
  if (v10) {
}
  }

void sub_24722FD90(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>(void **a1, id *a2, id *a3, id *a4, id *a5, id *a6, id *a7)
{
  id v13 = *a2;
  id v14 = *a3;
  id v15 = *a4;
  id v16 = *a5;
  id v17 = *a6;
  id v18 = *a7;
  **a1 = v13;
  long long v19 = *a1;
  *a1[1] = 0;
  v19[1] = v14;
  uint64_t v20 = *a1;
  a1[1][1] = 0;
  v20[2] = v15;
  long long v21 = *a1;
  a1[1][2] = 0;
  v21[3] = v16;
  uint64_t v22 = *a1;
  a1[1][3] = 0;
  v22[4] = v17;
  int v23 = *a1;
  a1[1][4] = 0;
  v23[5] = v18;
  a1[1][5] = 0;
  if (v18) {

  }
  if (v17) {
  if (v16)
  }

  if (v15) {
  if (v14)
  }

  if (v13) {
}
  }

BOOL gpu_saxpy(unint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  float v19 = a4;
  v14[0] = &v19;
  v14[1] = a2;
  v14[2] = a3;
  v13[0] = (const void *)4;
  v13[1] = (const void *)(4 * a1);
  v13[2] = (const void *)(4 * a1);
  gpu::hostToDevicePointers<float const*,float const*,float *,unsigned long,unsigned long,unsigned long>(v14, v13, (uint64_t)v15);
  int v6 = v15[0];
  if (v15[0])
  {
    long long v7 = (void *)*((void *)gpu::getGPUHardwareInfo(v5) + 3);
    std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v10, &v16);
    gpu::launchSize1D(v7, a1, (uint64_t)v9);
    gpu::launch<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(v7, &v10, v9);
    if (v12) {

    }
    if (v11) {
    if (v10)
    }
  }
  if (v18) {

  }
  if (v17) {
  if (v16)
  }

  return v6 != 0;
}

void sub_247230024(_Unwind_Exception *a1)
{
  std::pair<BOOL,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>::~pair((void *)(v1 - 72));
  _Unwind_Resume(a1);
}

void gpu::hostToDevicePointers<float const*,float const*,float *,unsigned long,unsigned long,unsigned long>(void *a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  char v14 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  *(void *)&long long v9 = *a1;
  uint64_t v20 = v5;
  uint64_t v21 = v4;
  id v15 = (id *)&v11;
  id v16 = &v20;
  id v17 = (uint64_t *)&v14;
  id v18 = &v21;
  float v19 = &v9;
  _ZZZN3gpu20hostToDevicePointersIJPKfS2_PfEJmmmEEEDaNSt3__15tupleIJDpT_EEENS6_IJDpT0_EEEENKUlS2_S2_S3_E_clES2_S2_S3_ENKUlmmmE_clEmmm((uint64_t)&v15, *a2, a2[1], a2[2]);
  char v6 = v14 ^ 1;
  id v15 = (id *)&v11;
  id v16 = &v12;
  id v17 = &v13;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl[abi:ne180100]<std::tuple<NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&>,void>(&v9, &v15);
  *(unsigned char *)a3 = v6;
  *(_OWORD *)(a3 + 8) = v9;
  *(void *)(a3 + 24) = v10;
  for (uint64_t i = 16; i != -8; i -= 8)
  {
    long long v8 = *(void **)((char *)&v11 + i);
    if (v8) {
  }
    }
}

void sub_24723011C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::array<NS::SharedPtr<MTL::Buffer>,3ul>::~array((uint64_t)va);
  _Unwind_Resume(a1);
}

void gpu::launch<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(void *a1, id *a2, long long *a3)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v6, a2);
  long long v4 = a3[1];
  long long v8 = *a3;
  long long v9 = v4;
  long long v10 = a3[2];
  id v11 = a1;
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v6;
  v6[0] = 0;
  v6[1] = 0;
  id v13 = v7;
  id v7 = 0;
  long long v15 = v4;
  long long v16 = v10;
  long long v14 = v8;
  gpu::launch<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(&v11);
  if (v13) {

  }
  if (v12[1]) {
  if (v12[0])
  }

  if (v7) {
  if (v6[1])
  }

  if (v6[0]) {
}
  }

void sub_24723020C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
}

uint64_t std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~tuple(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2) {

  }
  uint64_t v3 = *(void **)(a1 + 8);
  if (v3) {

  }
  if (*(void *)a1) {
  return a1;
  }
}

void *std::pair<BOOL,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>::~pair(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2) {

  }
  uint64_t v3 = (void *)a1[2];
  if (v3) {

  }
  long long v4 = (void *)a1[1];
  if (v4) {

  }
  return a1;
}

BOOL gpu_saxpby(unint64_t a1, uint64_t a2, uint64_t a3, float a4, float a5)
{
  float v22 = a5;
  float v23 = a4;
  v16[0] = &v23;
  v16[1] = a2;
  v16[2] = &v22;
  v16[3] = a3;
  v15[0] = (const void *)4;
  v15[1] = (const void *)(4 * a1);
  v15[2] = (const void *)4;
  long long v15[3] = (const void *)(4 * a1);
  gpu::hostToDevicePointers<float const*,float const*,float const*,float *,unsigned long,unsigned long,unsigned long,unsigned long>(v16, v15, (uint64_t)v17);
  int v7 = v17[0];
  if (v17[0])
  {
    long long v8 = (void *)*((void *)gpu::getGPUHardwareInfo(v6) + 2);
    std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v11, &v18);
    gpu::launchSize1D(v8, a1, (uint64_t)v10);
    gpu::launch<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>((uint64_t)v8, &v11, v10);
    if (v14) {

    }
    if (v13) {
    if (v12)
    }

    if (v11) {
  }
    }
  if (v21) {

  }
  if (v20) {
  if (v19)
  }

  if (v18) {
  return v7 != 0;
  }
}

void sub_247230400(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v1);
  _Unwind_Resume(a1);
}

void gpu::hostToDevicePointers<float const*,float const*,float const*,float *,unsigned long,unsigned long,unsigned long,unsigned long>(void *a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  char v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[3];
  *(void *)&v11[0] = *a1;
  uint64_t v22 = v5;
  uint64_t v23 = v4;
  uint64_t v21 = v6;
  long long v15 = (id *)&v12;
  long long v16 = (char *)&v21;
  id v17 = (long long *)&v14;
  id v18 = (char *)&v22;
  id v19 = &v23;
  id v20 = v11;
  _ZZZN3gpu20hostToDevicePointersIJPKfS2_S2_PfEJmmmmEEEDaNSt3__15tupleIJDpT_EEENS6_IJDpT0_EEEENKUlS2_S2_S2_S3_E_clES2_S2_S2_S3_ENKUlmmmmE_clEmmmm((uint64_t)&v15, *a2, a2[1], a2[2], a2[3]);
  char v7 = v14 ^ 1;
  long long v15 = (id *)&v12;
  long long v16 = (char *)&v12 + 8;
  id v17 = &v13;
  id v18 = (char *)&v13 + 8;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl[abi:ne180100]<std::tuple<NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&>,void>(v11, &v15);
  *(unsigned char *)a3 = v7;
  long long v8 = v11[1];
  *(_OWORD *)(a3 + 8) = v11[0];
  *(_OWORD *)(a3 + 24) = v8;
  for (uint64_t i = 24; i != -8; i -= 8)
  {
    long long v10 = *(void **)((char *)&v12 + i);
    if (v10) {
  }
    }
}

void sub_247230500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::array<NS::SharedPtr<MTL::Buffer>,4ul>::~array((uint64_t)va);
  _Unwind_Resume(a1);
}

void gpu::launch<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(uint64_t a1, id *a2, long long *a3)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v7, a2);
  long long v4 = a3[1];
  long long v9 = *a3;
  long long v10 = v4;
  long long v11 = a3[2];
  uint64_t v12 = a1;
  long long v5 = *(_OWORD *)v7;
  *(_OWORD *)char v7 = 0u;
  *(_OWORD *)long long v13 = v5;
  *(_OWORD *)char v14 = *(_OWORD *)v8;
  *(_OWORD *)long long v8 = 0u;
  long long v17 = v11;
  long long v15 = v9;
  long long v16 = v4;
  gpu::launch<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(&v12);
  if (v14[1]) {

  }
  if (v14[0]) {
  if (v13[1])
  }

  if (v13[0]) {
  if (v8[1])
  }

  if (v8[0]) {
  if (v7[1])
  }

  if (v7[0]) {
}
  }

void sub_24723062C(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v2);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v1);
  _Unwind_Resume(a1);
}

BOOL gpu_scopy(unint64_t a1, uint64_t a2, uint64_t a3)
{
  gpu::hostToDevicePointers<float const*,float *,unsigned long,unsigned long>(a2, a3, (const void *)(4 * a1), (const void *)(4 * a1), (uint64_t)v11);
  int v5 = v11[0];
  if (v11[0])
  {
    uint64_t v6 = (void *)*((void *)gpu::getGPUHardwareInfo(v4) + 4);
    std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v9, &v12);
    gpu::launchSize1D(v6, a1, (uint64_t)v8);
    gpu::launch<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>((uint64_t)v6, &v9, v8);
    if (v10) {

    }
    if (v9) {
  }
    }
  if (v13) {

  }
  if (v12) {
  return v5 != 0;
  }
}

void sub_247230718(_Unwind_Exception *a1)
{
  std::pair<BOOL,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>::~pair(v1 - 56);
  _Unwind_Resume(a1);
}

void gpu::hostToDevicePointers<float const*,float *,unsigned long,unsigned long>(uint64_t a1@<X0>, uint64_t a2@<X1>, const void *a3@<X2>, const void *a4@<X3>, uint64_t a5@<X8>)
{
  char v12 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  *(void *)&long long v9 = a1;
  uint64_t v17 = a2;
  id v13 = (id *)&v10;
  char v14 = &v17;
  long long v15 = &v12;
  long long v16 = &v9;
  _ZZZN3gpu20hostToDevicePointersIJPKfPfEJmmEEEDaNSt3__15tupleIJDpT_EEENS6_IJDpT0_EEEENKUlS2_S3_E_clES2_S3_ENKUlmmE_clEmm((uint64_t)&v13, a3, a4);
  char v6 = v12 ^ 1;
  id v13 = (id *)&v10;
  char v14 = &v11;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl[abi:ne180100]<std::tuple<NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&>,void>(&v9, &v13);
  *(unsigned char *)a5 = v6;
  *(_OWORD *)(a5 + 8) = v9;
  for (uint64_t i = 8; i != -8; i -= 8)
  {
    long long v8 = *(void **)((char *)&v10 + i);
    if (v8) {
  }
    }
}

void sub_2472307E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::array<NS::SharedPtr<MTL::Buffer>,2ul>::~array((uint64_t)va);
  _Unwind_Resume(a1);
}

void gpu::launch<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(uint64_t a1, id *a2, long long *a3)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v6, a2);
  long long v4 = a3[1];
  long long v7 = *a3;
  long long v8 = v4;
  long long v9 = a3[2];
  uint64_t v10 = a1;
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v6;
  long long v12 = v7;
  v6[0] = 0;
  v6[1] = 0;
  long long v13 = v4;
  long long v14 = v9;
  gpu::launch<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>((uint64_t)&v10);
  if (v11[1]) {

  }
  if (v11[0]) {
  if (v6[1])
  }

  if (v6[0]) {
}
  }

void sub_2472308AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

uint64_t std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~tuple(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2) {

  }
  if (*(void *)a1) {
  return a1;
  }
}

uint64_t std::pair<BOOL,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>::~pair(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2) {

  }
  uint64_t v3 = *(void **)(a1 + 8);
  if (v3) {

  }
  return a1;
}

BOOL gpu_scal(unint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  float v19 = a4;
  v14[0] = &v19;
  v14[1] = a2;
  id v14[2] = a3;
  v13[0] = (const void *)4;
  v13[1] = (const void *)(4 * a1);
  id v13[2] = (const void *)(4 * a1);
  gpu::hostToDevicePointers<float const*,float const*,float *,unsigned long,unsigned long,unsigned long>(v14, v13, (uint64_t)v15);
  int v6 = v15[0];
  if (v15[0])
  {
    long long v7 = (void *)*((void *)gpu::getGPUHardwareInfo(v5) + 5);
    std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v10, &v16);
    gpu::launchSize1D(v7, a1, (uint64_t)v9);
    gpu::launch<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(v7, &v10, v9);
    if (v12) {

    }
    if (v11) {
    if (v10)
    }
  }
  if (v18) {

  }
  if (v17) {
  if (v16)
  }

  return v6 != 0;
}

void sub_247230A58(_Unwind_Exception *a1)
{
  std::pair<BOOL,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>::~pair((void *)(v1 - 72));
  _Unwind_Resume(a1);
}

BOOL gpu_sset(unint64_t a1, uint64_t a2, float a3)
{
  float v14 = a3;
  gpu::hostToDevicePointers<float const*,float *,unsigned long,unsigned long>((uint64_t)&v14, a2, (const void *)4, (const void *)(4 * a1), (uint64_t)v11);
  int v5 = v11[0];
  if (v11[0])
  {
    int v6 = (void *)*((void *)gpu::getGPUHardwareInfo(v4) + 6);
    std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v9, &v12);
    gpu::launchSize1D(v6, a1, (uint64_t)v8);
    gpu::launch<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>((uint64_t)v6, &v9, v8);
    if (v10) {

    }
    if (v9) {
  }
    }
  if (v13) {

  }
  if (v12) {
  return v5 != 0;
  }
}

void sub_247230B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  std::pair<BOOL,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL gpu_srot(unint64_t a1, uint64_t a2, uint64_t a3, float a4, float a5)
{
  float v23 = a5;
  float v24 = a4;
  v17[0] = a2;
  v17[1] = a3;
  v17[2] = &v24;
  _OWORD v17[3] = &v23;
  v15[0] = (const void *)(4 * a1);
  v15[1] = (const void *)(4 * a1);
  int64x2_t v16 = vdupq_n_s64(4uLL);
  gpu::hostToDevicePointers<float const*,float const*,float const*,float *,unsigned long,unsigned long,unsigned long,unsigned long>(v17, v15, (uint64_t)v18);
  int v7 = v18[0];
  if (v18[0])
  {
    long long v8 = (void *)*((void *)gpu::getGPUHardwareInfo(v6) + 7);
    std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v11, &v19);
    gpu::launchSize1D(v8, a1, (uint64_t)v10);
    gpu::launch<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>((uint64_t)v8, &v11, v10);
    if (v14) {

    }
    if (v13) {
    if (v12)
    }

    if (v11) {
  }
    }
  if (v22) {

  }
  if (v21) {
  if (v20)
  }

  if (v19) {
  return v7 != 0;
  }
}

void sub_247230CA4(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v1);
  _Unwind_Resume(a1);
}

BOOL gpu_srotm(unint64_t a1, uint64_t a2, uint64_t a3, float *a4)
{
  v25[0] = a2;
  v25[1] = a3;
  v25[2] = a4;
  v24[0] = (const void *)(4 * a1);
  v24[1] = (const void *)(4 * a1);
  v24[2] = (const void *)20;
  gpu::hostToDevicePointers<float const*,float const*,float *,unsigned long,unsigned long,unsigned long>(v25, v24, (uint64_t)v26);
  int v7 = v26[0];
  if (v26[0])
  {
    if (*a4 >= 0.0)
    {
      if (*a4 == 0.0)
      {
        id v9 = (void *)*((void *)gpu::getGPUHardwareInfo(v6) + 9);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v17, &v27);
        gpu::launchSize1D(v9, a1, (uint64_t)v16);
        gpu::launch<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(v9, &v17, v16);
        if (v19) {

        }
        if (v18) {
        if (v17)
        }
      }
      else
      {
        id v10 = (void *)*((void *)gpu::getGPUHardwareInfo(v6) + 10);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v13, &v27);
        gpu::launchSize1D(v10, a1, (uint64_t)v12);
        gpu::launch<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(v10, &v13, v12);
        if (v15) {

        }
        if (v14) {
        if (v13)
        }
      }
    }
    else
    {
      long long v8 = (void *)*((void *)gpu::getGPUHardwareInfo(v6) + 8);
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v21, &v27);
      gpu::launchSize1D(v8, a1, (uint64_t)v20);
      gpu::launch<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(v8, &v21, v20);
      if (v23) {

      }
      if (v22) {
      if (v21)
      }
    }
  }
  if (v29) {

  }
  if (v28) {
  if (v27)
  }

  return v7 != 0;
}

void sub_247230E94(_Unwind_Exception *a1)
{
  std::pair<BOOL,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>::~pair((void *)(v1 - 80));
  _Unwind_Resume(a1);
}

uint64_t std::array<NS::SharedPtr<MTL::Buffer>,3ul>::~array(uint64_t a1)
{
  for (uint64_t i = 16; i != -8; i -= 8)
  {
    uint64_t v3 = *(void **)(a1 + i);
    if (v3) {
  }
    }
  return a1;
}

void _ZZZN3gpu20hostToDevicePointersIJPKfS2_PfEJmmmEEEDaNSt3__15tupleIJDpT_EEENS6_IJDpT0_EEEENKUlS2_S2_S3_E_clES2_S2_S3_ENKUlmmmE_clEmmm(uint64_t a1, const void *a2, const void *a3, const void *a4)
{
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 32), a2, &v9);
  NS::SharedPtr<MTL::Buffer>::operator=(*(void ***)a1, &v9);
  **(unsigned char **)(a1 + 16) |= **(void **)a1 == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 24), a3, &v8);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 8), &v8);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 8) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 8), a4, &v7);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 16), &v7);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 16) == 0;
  if (v7) {

  }
  if (v8) {
  if (v9)
  }
}

void sub_24723106C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, id a11, id a12)
{
  if (a10) {

  }
  if (a11) {
  if (a12)
  }

  _Unwind_Resume(exception_object);
}

void *std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl[abi:ne180100]<std::tuple<NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&>,void>(void *a1, id **a2)
{
  *a1 = **a2;
  a1[1] = *a2[1];
  a1[2] = *a2[2];
  return a1;
}

void *std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  return a1;
}

uint64_t std::array<NS::SharedPtr<MTL::Buffer>,4ul>::~array(uint64_t a1)
{
  for (uint64_t i = 24; i != -8; i -= 8)
  {
    uint64_t v3 = *(void **)(a1 + i);
    if (v3) {
  }
    }
  return a1;
}

void _ZZZN3gpu20hostToDevicePointersIJPKfS2_S2_PfEJmmmmEEEDaNSt3__15tupleIJDpT_EEENS6_IJDpT0_EEEENKUlS2_S2_S2_S3_E_clES2_S2_S2_S3_ENKUlmmmmE_clEmmmm(uint64_t a1, const void *a2, const void *a3, const void *a4, const void *a5)
{
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 40), a2, &v12);
  NS::SharedPtr<MTL::Buffer>::operator=(*(void ***)a1, &v12);
  **(unsigned char **)(a1 + 16) |= **(void **)a1 == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 32), a3, &v11);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 8), &v11);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 8) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 24), a4, &v10);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 16), &v10);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 16) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 8), a5, &v9);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 24), &v9);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 24) == 0;
  if (v9) {

  }
  if (v10) {
  if (v11)
  }

  if (v12) {
}
  }

void sub_247231344(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, id a10, id a11, id a12)
{
  if (a9) {

  }
  if (a10) {
  if (a11)
  }

  if (a12) {
  _Unwind_Resume(exception_object);
  }
}

void *std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl[abi:ne180100]<std::tuple<NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&>,void>(void *a1, id **a2)
{
  *a1 = **a2;
  a1[1] = *a2[1];
  a1[2] = *a2[2];
  a1[3] = *a2[3];
  return a1;
}

void *std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2) {

  }
  uint64_t v3 = *(void **)(a1 + 16);
  if (v3) {

  }
  long long v4 = *(void **)(a1 + 8);
  if (v4) {

  }
  if (*(void *)a1) {
  return a1;
  }
}

uint64_t std::array<NS::SharedPtr<MTL::Buffer>,2ul>::~array(uint64_t a1)
{
  for (uint64_t i = 8; i != -8; i -= 8)
  {
    uint64_t v3 = *(void **)(a1 + i);
    if (v3) {
  }
    }
  return a1;
}

void _ZZZN3gpu20hostToDevicePointersIJPKfPfEJmmEEEDaNSt3__15tupleIJDpT_EEENS6_IJDpT0_EEEENKUlS2_S3_E_clES2_S3_ENKUlmmE_clEmm(uint64_t a1, const void *a2, const void *a3)
{
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 24), a2, &v6);
  NS::SharedPtr<MTL::Buffer>::operator=(*(void ***)a1, &v6);
  **(unsigned char **)(a1 + 16) |= **(void **)a1 == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 8), a3, &v5);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 8), &v5);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 8) == 0;
  if (v5) {

  }
  if (v6) {
}
  }

void sub_247231608(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, id a10)
{
  if (a9) {

  }
  if (a10) {
  _Unwind_Resume(exception_object);
  }
}

void *std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl[abi:ne180100]<std::tuple<NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&>,void>(void *a1, id **a2)
{
  *a1 = **a2;
  a1[1] = *a2[1];
  return a1;
}

void *std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  return a1;
}

void gpu::launch<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(id *a1)
{
  uint64_t v2 = (gpu *)objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v3 = objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v2) + 1), sel_commandBuffer);
  id v9 = &v10;
  id v10 = v3;
  std::__invoke[abi:ne180100]<void gpu::launch<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1},std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&>(&v9, a1);
  id v5 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v4) + 47), sel_setSignaledValue_, 0);
  id v6 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v5) + 47), sel_signaledValue);
  id v7 = v10;
  GPUHardwareInfo = gpu::getGPUHardwareInfo(v6);
  id v6 = (gpu *)((char *)v6 + 1);
  objc_msgSend(v7, sel_encodeSignalEvent_value_, *((void *)GPUHardwareInfo + 47), v6);
  objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(v10, sel_commitAndWaitUntilSubmitted)) + 47), sel_waitUntilSignaledValue_timeoutMS_, v6, 0xFFFFFFFFLL);
  if (v2) {
}
  }

void sub_247231804(_Unwind_Exception *exception_object)
{
  if (v1) {

  }
  _Unwind_Resume(exception_object);
}

void std::__invoke[abi:ne180100]<void gpu::launch<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1},std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&>(void ***a1, id *a2)
{
  id v5 = *a2;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v6, a2 + 1);
  long long v4 = *((_OWORD *)a2 + 3);
  long long v9 = *((_OWORD *)a2 + 2);
  long long v10 = v4;
  long long v11 = *((_OWORD *)a2 + 4);
  gpu::launch<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(a1, (uint64_t)&v5);
  if (v8) {

  }
  if (v7) {
  if (v6)
  }
}

void sub_2472318B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void gpu::launch<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(void ***a1, uint64_t a2)
{
  id v3 = **a1;
  uint64_t v4 = *(void *)a2;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v7, (id *)(a2 + 8));
  long long v5 = *(_OWORD *)(a2 + 48);
  v6[0] = *(_OWORD *)(a2 + 32);
  v6[1] = v5;
  id v6[2] = *(_OWORD *)(a2 + 64);
  gpu::encodeCommands<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v3, v4, &v7, v6);
  if (v9) {

  }
  if (v8) {
  if (v7)
  }
}

void sub_247231960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~tuple((uint64_t)va);
  _Unwind_Resume(a1);
}

void gpu::encodeCommands<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(void *a1, uint64_t a2, id *a3, long long *a4)
{
  long long v15[3] = *MEMORY[0x263EF8340];
  id v8 = objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v9 = objc_msgSend(a1, sel_computeCommandEncoder);
  objc_msgSend(v9, sel_setComputePipelineState_, a2);
  memset(v15, 0, 24);
  *(void *)&long long v12 = v15;
  *((void *)&v12 + 1) = v14;
  std::__invoke[abi:ne180100]<void gpu::encodeCommands<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>((void **)&v12, a3, a3 + 1, a3 + 2);
  objc_msgSend(v9, sel_setBuffers_offsets_withRange_, v15, v14, 0, 3);
  long long v12 = *a4;
  uint64_t v13 = *((void *)a4 + 2);
  long long v10 = *(long long *)((char *)a4 + 24);
  uint64_t v11 = *((void *)a4 + 5);
  objc_msgSend(v9, sel_dispatchThreads_threadsPerThreadgroup_, &v12, &v10);
  objc_msgSend(v9, sel_endEncoding);
  if (v8) {
}
  }

void sub_247231AE4(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void std::__invoke[abi:ne180100]<void gpu::encodeCommands<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>(void **a1, id *a2, id *a3, id *a4)
{
  id v7 = *a2;
  id v8 = *a3;
  id v9 = *a4;
  **a1 = v7;
  long long v10 = *a1;
  *a1[1] = 0;
  v10[1] = v8;
  uint64_t v11 = *a1;
  a1[1][1] = 0;
  id v11[2] = v9;
  a1[1][2] = 0;
  if (v9) {

  }
  if (v8) {
  if (v7)
  }
}

void gpu::launch<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(uint64_t *a1)
{
  uint64_t v2 = (gpu *)objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v3 = objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v2) + 1), sel_commandBuffer);
  id v9 = &v10;
  id v10 = v3;
  std::__invoke[abi:ne180100]<void gpu::launch<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1},std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&>(&v9, a1);
  long long v5 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v4) + 47), sel_setSignaledValue_, 0);
  id v6 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v5) + 47), sel_signaledValue);
  id v7 = v10;
  GPUHardwareInfo = gpu::getGPUHardwareInfo(v6);
  id v6 = (gpu *)((char *)v6 + 1);
  objc_msgSend(v7, sel_encodeSignalEvent_value_, *((void *)GPUHardwareInfo + 47), v6);
  objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(v10, sel_commitAndWaitUntilSubmitted)) + 47), sel_waitUntilSignaledValue_timeoutMS_, v6, 0xFFFFFFFFLL);
  if (v2) {
}
  }

void sub_247231CF8(_Unwind_Exception *exception_object)
{
  if (v1) {

  }
  _Unwind_Resume(exception_object);
}

void std::__invoke[abi:ne180100]<void gpu::launch<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1},std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&>(void ***a1, uint64_t *a2)
{
  id v5 = (id)*a2;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v6, (id *)a2 + 1);
  long long v4 = *(_OWORD *)(a2 + 7);
  long long v10 = *(_OWORD *)(a2 + 5);
  long long v11 = v4;
  long long v12 = *(_OWORD *)(a2 + 9);
  gpu::launch<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(a1, (uint64_t)&v5);
  if (v9) {

  }
  if (v8) {
  if (v7)
  }

  if (v6) {
}
  }

void sub_247231DC8(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v1);
  _Unwind_Resume(a1);
}

void gpu::launch<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(void ***a1, uint64_t a2)
{
  id v3 = **a1;
  uint64_t v4 = *(void *)a2;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v7, (id *)(a2 + 8));
  long long v5 = *(_OWORD *)(a2 + 56);
  v6[0] = *(_OWORD *)(a2 + 40);
  v6[1] = v5;
  id v6[2] = *(_OWORD *)(a2 + 72);
  gpu::encodeCommands<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v3, v4, &v7, v6);
  if (v10) {

  }
  if (v9) {
  if (v8)
  }

  if (v7) {
}
  }

void sub_247231E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)va);
  _Unwind_Resume(a1);
}

void gpu::encodeCommands<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(void *a1, uint64_t a2, id *a3, long long *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v9 = objc_msgSend(a1, sel_computeCommandEncoder);
  objc_msgSend(v9, sel_setComputePipelineState_, a2);
  memset(v15, 0, sizeof(v15));
  *(void *)&long long v12 = v15;
  *((void *)&v12 + 1) = v14;
  std::__invoke[abi:ne180100]<void gpu::encodeCommands<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>((void **)&v12, a3, a3 + 1, a3 + 2, a3 + 3);
  objc_msgSend(v9, sel_setBuffers_offsets_withRange_, v15, v14, 0, 4);
  long long v12 = *a4;
  uint64_t v13 = *((void *)a4 + 2);
  long long v10 = *(long long *)((char *)a4 + 24);
  uint64_t v11 = *((void *)a4 + 5);
  objc_msgSend(v9, sel_dispatchThreads_threadsPerThreadgroup_, &v12, &v10);
  objc_msgSend(v9, sel_endEncoding);
  if (v8) {
}
  }

void sub_247232010(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void std::__invoke[abi:ne180100]<void gpu::encodeCommands<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>(void **a1, id *a2, id *a3, id *a4, id *a5)
{
  id v9 = *a2;
  id v10 = *a3;
  id v11 = *a4;
  id v12 = *a5;
  **a1 = v9;
  uint64_t v13 = *a1;
  *a1[1] = 0;
  v13[1] = v10;
  id v14 = *a1;
  a1[1][1] = 0;
  id v14[2] = v11;
  id v15 = *a1;
  a1[1][2] = 0;
  long long v15[3] = v12;
  a1[1][3] = 0;
  if (v12) {

  }
  if (v11) {
  if (v10)
  }

  if (v9) {
}
  }

void gpu::launch<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(uint64_t a1)
{
  uint64_t v2 = (gpu *)objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v3 = objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v2) + 1), sel_commandBuffer);
  id v9 = &v10;
  id v10 = v3;
  std::__invoke[abi:ne180100]<void gpu::launch<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1},std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&>(&v9, a1);
  long long v5 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v4) + 47), sel_setSignaledValue_, 0);
  id v6 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v5) + 47), sel_signaledValue);
  id v7 = v10;
  GPUHardwareInfo = gpu::getGPUHardwareInfo(v6);
  id v6 = (gpu *)((char *)v6 + 1);
  objc_msgSend(v7, sel_encodeSignalEvent_value_, *((void *)GPUHardwareInfo + 47), v6);
  objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(v10, sel_commitAndWaitUntilSubmitted)) + 47), sel_waitUntilSignaledValue_timeoutMS_, v6, 0xFFFFFFFFLL);
  if (v2) {
}
  }

void sub_24723225C(_Unwind_Exception *exception_object)
{
  if (v1) {

  }
  _Unwind_Resume(exception_object);
}

void std::__invoke[abi:ne180100]<void gpu::launch<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1},std::tuple<MTL::ComputePipelineState *,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&>(void ***a1, uint64_t a2)
{
  uint64_t v6 = *(void *)a2;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v7, (id *)(a2 + 8));
  long long v4 = *(_OWORD *)(a2 + 40);
  long long v9 = *(_OWORD *)(a2 + 24);
  long long v10 = v4;
  long long v11 = *(_OWORD *)(a2 + 56);
  long long v5 = **a1;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v13, &v7);
  v12[0] = v9;
  v12[1] = v10;
  id v12[2] = v11;
  gpu::encodeCommands<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v5, v6, &v13, v12);
  if (v14) {

  }
  if (v13) {
  if (v8)
  }

  if (v7) {
}
  }

void sub_24723235C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~tuple(v2 - 48);
  std::pair<BOOL,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

void gpu::encodeCommands<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(void *a1, uint64_t a2, id *a3, long long *a4)
{
  v17[2] = *MEMORY[0x263EF8340];
  id v8 = objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v9 = objc_msgSend(a1, sel_computeCommandEncoder);
  objc_msgSend(v9, sel_setComputePipelineState_, a2);
  id v10 = *a3;
  id v11 = a3[1];
  v17[0] = v10;
  v17[1] = v11;
  v16[0] = 0;
  v16[1] = 0;
  if (v11) {

  }
  if (v10) {
  objc_msgSend(v9, sel_setBuffers_offsets_withRange_, v17, v16, 0, 2);
  }
  long long v14 = *a4;
  uint64_t v15 = *((void *)a4 + 2);
  long long v12 = *(long long *)((char *)a4 + 24);
  uint64_t v13 = *((void *)a4 + 5);
  objc_msgSend(v9, sel_dispatchThreads_threadsPerThreadgroup_, &v14, &v12);
  objc_msgSend(v9, sel_endEncoding);
  if (v8) {
}
  }

void sub_2472324F0(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t gpu_ssyrk(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, gpu *a17, gpu *a18, uint64_t a19, uint64_t a20,gpu *a21,gpu *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,gpu *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,long long a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,id a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,int64_t a45,char *a46,unint64_t a47,uint64_t a48,int64_t a49,uint64_t a50,int a51,float a52,long long a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,id a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v182 = MEMORY[0x270FA5388]();
  STACK[0x1438] = *MEMORY[0x263EF8340];
  STACK[0x1218] = v74;
  STACK[0x1210] = v75;
  if (v68 < 128) {
    return 0;
  }
  unint64_t v76 = v71;
  unint64_t v77 = v70;
  uint64_t v78 = v68;
  float v79 = v73;
  int v80 = v72;
  int v81 = v67;
  *(_OWORD *)&STACK[0x1400] = 0u;
  *(_OWORD *)&STACK[0x1410] = 0u;
  *(_OWORD *)&STACK[0x13E0] = 0u;
  *(_OWORD *)&STACK[0x13F0] = 0u;
  *(_OWORD *)&STACK[0x13C0] = 0u;
  *(_OWORD *)&STACK[0x13D0] = 0u;
  *(_OWORD *)&STACK[0x13A0] = 0u;
  *(_OWORD *)&STACK[0x13B0] = 0u;
  *(_OWORD *)&STACK[0x1380] = 0u;
  *(_OWORD *)&STACK[0x1390] = 0u;
  *(_OWORD *)&STACK[0x1360] = 0u;
  *(_OWORD *)&STACK[0x1370] = 0u;
  *(_OWORD *)&STACK[0x1340] = 0u;
  *(_OWORD *)&STACK[0x1350] = 0u;
  *(_OWORD *)&STACK[0x1320] = 0u;
  *(_OWORD *)&STACK[0x1330] = 0u;
  *(_OWORD *)&STACK[0x1300] = 0u;
  *(_OWORD *)&STACK[0x1310] = 0u;
  *(_OWORD *)&STACK[0x12E0] = 0u;
  *(_OWORD *)&STACK[0x12F0] = 0u;
  *(_OWORD *)&STACK[0x12C0] = 0u;
  *(_OWORD *)&STACK[0x12D0] = 0u;
  *(_OWORD *)&STACK[0x12A0] = 0u;
  *(_OWORD *)&STACK[0x12B0] = 0u;
  *(_OWORD *)&STACK[0x1280] = 0u;
  *(_OWORD *)&STACK[0x1290] = 0u;
  *(_OWORD *)&STACK[0x1260] = 0u;
  *(_OWORD *)&STACK[0x1270] = 0u;
  *(_OWORD *)&STACK[0x1240] = 0u;
  *(_OWORD *)&STACK[0x1250] = 0u;
  int64_t v200 = v69;
  if (v69 <= 0) {
    uint64_t v82 = -(-v69 & 7);
  }
  else {
    uint64_t v82 = v69 & 7;
  }
  *(_OWORD *)&STACK[0x1220] = 0uLL;
  *(_OWORD *)&STACK[0x1230] = 0uLL;
  if (v82 >= 1)
  {
    uint64_t v83 = (_DWORD *)&STACK[0x1220] - v82 + 8;
    uint64_t v84 = -v82;
    float v85 = &STACK[0x1220] - 4 * v82 + 64;
    uint64_t v86 = 64;
    do
    {
      _DWORD *v83 = 1065353216;
      v83 += 9;
      *(_DWORD *)float v85 = 1065353216;
      float v85 = (unint64_t *)((char *)v85 + 36);
      ++v86;
    }
    while (v84 + v86 != 64);
  }
  uint64_t v87 = v67 ? v68 : v69;
  uint64_t v88 = (gpu *)blas::memory::aligned_alloc<float>(8 * v68, 0x20uLL, &STACK[0x1208]);
  if (!STACK[0x1208]) {
    return 0;
  }
  if (v81)
  {
    GPUHardwareInfo = gpu::getGPUHardwareInfo(v88);
    uint64_t v90 = v200;
    if (v182)
    {
      uint64_t v199 = *((void *)GPUHardwareInfo + 21);
      __int16 v91 = gpu::getGPUHardwareInfo((gpu *)GPUHardwareInfo) + 11;
    }
    else
    {
      uint64_t v199 = *((void *)GPUHardwareInfo + 25);
      __int16 v91 = gpu::getGPUHardwareInfo((gpu *)GPUHardwareInfo) + 13;
    }
  }
  else
  {
    uint64_t v93 = gpu::getGPUHardwareInfo(v88);
    uint64_t v90 = v200;
    if (v182)
    {
      uint64_t v199 = *((void *)v93 + 19);
      __int16 v91 = gpu::getGPUHardwareInfo((gpu *)v93) + 10;
    }
    else
    {
      uint64_t v199 = *((void *)v93 + 23);
      __int16 v91 = gpu::getGPUHardwareInfo((gpu *)v93) + 12;
    }
  }
  unint64_t v94 = *(void *)v91;
  unint64_t v95 = STACK[0x1208];
  STACK[0x11A0] = v77;
  STACK[0x11A8] = (unint64_t)&STACK[0x1218];
  STACK[0x11B0] = v76;
  STACK[0x11B8] = (unint64_t)&STACK[0x1210];
  STACK[0x11C0] = (unint64_t)&STACK[0x1220];
  STACK[0x11C8] = v95;
  unint64_t v96 = 4 * v78 * STACK[0x1210];
  STACK[0x1170] = 4 * v87 * STACK[0x1218];
  STACK[0x1178] = 8;
  *(_OWORD *)&STACK[0x1188] = xmmword_24723D3A0;
  STACK[0x1180] = v96;
  STACK[0x1198] = 32 * v78;
  gpu::hostToDevicePointers<float const*,long const*,float const*,long const*,float *,long const*,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long>(&STACK[0x11A0], (const void **)&STACK[0x1170], (uint64_t)&STACK[0x11D0]);
  uint64_t v92 = LOBYTE(STACK[0x11D0]) != 0;
  if (LOBYTE(STACK[0x11D0]))
  {
    if ((double)v78 * (double)v78 * (double)v90 > 8589934590.0)
    {
      uint64_t v98 = v94;
      BOOL v179 = LOBYTE(STACK[0x11D0]) != 0;
      id v99 = gpu::batchSetup(v97);
      int64_t v100 = 0;
      int64_t v180 = v78;
      while (1)
      {
        uint64_t v101 = v78 - v100;
        if (v78 - v100 >= 2048) {
          uint64_t v101 = 2048;
        }
        uint64_t v195 = v101;
        int64_t v102 = v182 ? 0 : v100;
        int64_t v103 = v182 ? v100 : v78;
        if (v102 < v103 || v182 != 0) {
          break;
        }
LABEL_99:
        v100 += 2048;
        uint64_t v78 = v180;
        if (v100 >= v180)
        {
          gpu::launch(v99);
          uint64_t v92 = v179;
          goto LABEL_107;
        }
      }
      uint64_t v196 = v101 & 0x7F;
      unint64_t v198 = v101 - 128;
      uint64_t v105 = v101 + 127;
      int64_t v181 = v103;
      if (v195 >= 0) {
        uint64_t v105 = v195;
      }
      unint64_t v106 = v105 & 0xFFFFFFFFFFFFFF80;
      unint64_t v107 = (v105 & 0xFFFFFFFFFFFFFF80) + v100;
      unint64_t v108 = v195 + v100;
      uint64_t v109 = v195 + 31;
      if (v195 >= 0) {
        uint64_t v109 = v195;
      }
      uint64_t v193 = v106;
      uint64_t v197 = v195 - v106;
      unint64_t v110 = v109 & 0xFFFFFFFFFFFFFFE0;
      unint64_t v194 = v110 + v100;
      v190 = (gpu *)v110;
      v187 = (gpu *)(v195 - v110);
      while (1)
      {
        uint64_t v111 = v103 - v102;
        if (v103 - v102 >= 2048) {
          uint64_t v111 = 2048;
        }
        v191 = (gpu *)v111;
        if (v90 >= 1) {
          break;
        }
LABEL_96:
        v102 += 2048;
        int64_t v103 = v181;
        BOOL v125 = v102 <= v181;
        if (!v182) {
          BOOL v125 = v102 < v181;
        }
        if (!v125) {
          goto LABEL_99;
        }
      }
      int64_t v112 = 0;
      uint64_t v184 = v111 & 0x1F;
      uint64_t v113 = v111 + 31;
      if (v111 >= 0) {
        uint64_t v113 = v111;
      }
      unint64_t v114 = v113 & 0xFFFFFFFFFFFFFFE0;
      if (v196) {
        BOOL v115 = (v111 & 0x1F) == 0;
      }
      else {
        BOOL v115 = 1;
      }
      BOOL vars8_4 = v115;
      BOOL v117 = (unint64_t)v191 - 32 < 0xFFFFFFFFFFFFFFC1 && v198 < 0xFFFFFFFFFFFFFF01;
      BOOL v183 = v117;
      unint64_t v192 = v114 + v102;
      unint64_t v189 = (unint64_t)v191 + v102;
      vars0 = (gpu *)v114;
      v188 = (gpu *)((char *)v191 - v114);
      uint64_t v118 = v90;
      while (1)
      {
        uint64_t v119 = v118 - 2048;
        if (v118 >= 2048) {
          uint64_t v120 = 2048;
        }
        else {
          uint64_t v120 = v118;
        }
        unint64_t v121 = v120 + v112;
        if (v112) {
          float v122 = 1.0;
        }
        else {
          float v122 = v79;
        }
        if (v102 == v100)
        {
          if (v196)
          {
            if ((v195 & 0x1F) != 0)
            {
              if (v198 <= 0xFFFFFFFFFFFFFF00)
              {
                STACK[0x968] = v100;
                STACK[0x970] = v100;
                STACK[0x978] = v112;
                STACK[0x980] = v121;
                LODWORD(STACK[0x988]) = v80;
                *(float *)&STACK[0x98C] = v122;
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x938], (id *)&STACK[0x11D8]);
                gpu::launchSizeGEMM_32x128(v190, v193, 0, (uint64_t)&STACK[0x908]);
                gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v99, v199, (uint64_t)&STACK[0x968], (id *)&STACK[0x938], (long long *)&STACK[0x908]);
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x938]);
              }
              if ((unint64_t)(v195 - 32) <= 0xFFFFFFFFFFFFFFC0)
              {
                STACK[0x8D0] = v100;
                STACK[0x8D8] = v194;
                STACK[0x8E0] = v107;
                STACK[0x8E8] = v108;
                STACK[0x8F0] = v112;
                STACK[0x8F8] = v121;
                LODWORD(STACK[0x900]) = v80;
                *(float *)&STACK[0x904] = v122;
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x8A0], (id *)&STACK[0x11D8]);
                gpu::launchSizeGEMM_32x128(v190, v197, 1, (uint64_t)&STACK[0x870]);
                gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v99, v98, (uint64_t)&STACK[0x8D0], (id *)&STACK[0x8A0], (long long *)&STACK[0x870]);
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x8A0]);
              }
              if (v198 <= 0xFFFFFFFFFFFFFF00)
              {
                STACK[0x838] = v194;
                STACK[0x840] = v108;
                STACK[0x848] = v100;
                STACK[0x850] = v107;
                STACK[0x858] = v112;
                STACK[0x860] = v121;
                LODWORD(STACK[0x868]) = v80;
                *(float *)&STACK[0x86C] = v122;
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x808], (id *)&STACK[0x11D8]);
                gpu::launchSizeGEMM_32x128(v187, v193, 1, (uint64_t)&STACK[0x7D8]);
                gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v99, v98, (uint64_t)&STACK[0x838], (id *)&STACK[0x808], (long long *)&STACK[0x7D8]);
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x808]);
              }
              STACK[0x7A0] = v194;
              STACK[0x7A8] = v108;
              STACK[0x7B0] = v107;
              STACK[0x7B8] = v108;
              STACK[0x7C0] = v112;
              STACK[0x7C8] = v121;
              LODWORD(STACK[0x7D0]) = v80;
              *(float *)&STACK[0x7D4] = v122;
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x770], (id *)&STACK[0x11D8]);
              gpu::launchSizeGEMM_32x128(v187, v197, 1, (uint64_t)&STACK[0x740]);
              BOOL v123 = &STACK[0x770];
              gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v99, v98, (uint64_t)&STACK[0x7A0], (id *)&STACK[0x770], (long long *)&STACK[0x740]);
            }
            else
            {
              if (v198 <= 0xFFFFFFFFFFFFFF00)
              {
                STACK[0x718] = v100;
                STACK[0x720] = v100;
                STACK[0x728] = v112;
                STACK[0x730] = v121;
                LODWORD(STACK[0x738]) = v80;
                *(float *)&STACK[0x73C] = v122;
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x6E8], (id *)&STACK[0x11D8]);
                gpu::launchSizeGEMM_32x128(v190, v193, 0, (uint64_t)&STACK[0x6B8]);
                gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v99, v199, (uint64_t)&STACK[0x718], (id *)&STACK[0x6E8], (long long *)&STACK[0x6B8]);
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x6E8]);
              }
              STACK[0x680] = v100;
              STACK[0x688] = v194;
              STACK[0x690] = v107;
              STACK[0x698] = v108;
              STACK[0x6A0] = v112;
              STACK[0x6A8] = v121;
              LODWORD(STACK[0x6B0]) = v80;
              *(float *)&STACK[0x6B4] = v122;
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x650], (id *)&STACK[0x11D8]);
              gpu::launchSizeGEMM_32x128(v190, v197, 1, (uint64_t)&STACK[0x620]);
              BOOL v123 = &STACK[0x650];
              gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v99, v98, (uint64_t)&STACK[0x680], (id *)&STACK[0x650], (long long *)&STACK[0x620]);
            }
          }
          else
          {
            STACK[0x9F0] = v100;
            STACK[0x9F8] = v100;
            STACK[0xA00] = v112;
            STACK[0xA08] = v121;
            LODWORD(STACK[0xA10]) = v80;
            *(float *)&STACK[0xA14] = v122;
            std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x9C0], (id *)&STACK[0x11D8]);
            gpu::launchSizeGEMM_32x128((gpu *)v195, v195, 1, (uint64_t)&STACK[0x990]);
            BOOL v123 = &STACK[0x9C0];
            gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v99, v199, (uint64_t)&STACK[0x9F0], (id *)&STACK[0x9C0], (long long *)&STACK[0x990]);
          }
        }
        else if (v184 | v196)
        {
          if (!vars8_4)
          {
            if (v183)
            {
              STACK[0x570] = v102;
              STACK[0x578] = v100;
              STACK[0x580] = v112;
              STACK[0x588] = v121;
              LODWORD(STACK[0x590]) = v80;
              *(float *)&STACK[0x594] = v122;
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x540], (id *)&STACK[0x11D8]);
              gpu::launchSizeGEMM_32x128(vars0, v193, 1, (uint64_t)&STACK[0x510]);
              gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v99, v199, (uint64_t)&STACK[0x570], (id *)&STACK[0x540], (long long *)&STACK[0x510]);
              unint64_t v124 = v120 + v112;
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x540]);
              goto LABEL_85;
            }
            unint64_t v124 = v120 + v112;
            if ((unint64_t)v191 - 32 <= 0xFFFFFFFFFFFFFFC0)
            {
LABEL_85:
              STACK[0x4D8] = v102;
              STACK[0x4E0] = v192;
              STACK[0x4E8] = v107;
              STACK[0x4F0] = v108;
              STACK[0x4F8] = v112;
              STACK[0x500] = v124;
              LODWORD(STACK[0x508]) = v80;
              *(float *)&STACK[0x50C] = v122;
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x4A8], (id *)&STACK[0x11D8]);
              gpu::launchSizeGEMM_32x128(vars0, v197, 1, (uint64_t)&STACK[0x478]);
              gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v99, v98, (uint64_t)&STACK[0x4D8], (id *)&STACK[0x4A8], (long long *)&STACK[0x478]);
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x4A8]);
            }
            if (v198 <= 0xFFFFFFFFFFFFFF00)
            {
              STACK[0x440] = v192;
              STACK[0x448] = v189;
              STACK[0x450] = v100;
              STACK[0x458] = v107;
              STACK[0x460] = v112;
              STACK[0x468] = v121;
              LODWORD(STACK[0x470]) = v80;
              *(float *)&STACK[0x474] = v122;
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x410], (id *)&STACK[0x11D8]);
              gpu::launchSizeGEMM_32x128(v188, v193, 1, (uint64_t)&STACK[0x3E0]);
              gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v99, v98, (uint64_t)&STACK[0x440], (id *)&STACK[0x410], (long long *)&STACK[0x3E0]);
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x410]);
            }
            STACK[0x3A8] = v192;
            STACK[0x3B0] = v189;
            STACK[0x3B8] = v107;
            STACK[0x3C0] = v108;
            STACK[0x3C8] = v112;
            STACK[0x3D0] = v121;
            LODWORD(STACK[0x3D8]) = v80;
            *(float *)&STACK[0x3DC] = v122;
            std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x378], (id *)&STACK[0x11D8]);
            gpu::launchSizeGEMM_32x128(v188, v197, 1, (uint64_t)&STACK[0x348]);
            BOOL v123 = &STACK[0x378];
            gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v99, v98, (uint64_t)&STACK[0x3A8], (id *)&STACK[0x378], (long long *)&STACK[0x348]);
            goto LABEL_89;
          }
          if (v184)
          {
            if ((unint64_t)v191 + 31 >= 0x3F)
            {
              STACK[0x320] = v102;
              STACK[0x328] = v100;
              STACK[0x330] = v112;
              STACK[0x338] = v121;
              LODWORD(STACK[0x340]) = v80;
              *(float *)&STACK[0x344] = v122;
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x2F0], (id *)&STACK[0x11D8]);
              gpu::launchSizeGEMM_32x128(vars0, v195, 1, (uint64_t)&STACK[0x2C0]);
              gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v99, v199, (uint64_t)&STACK[0x320], (id *)&STACK[0x2F0], (long long *)&STACK[0x2C0]);
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x2F0]);
            }
            STACK[0x288] = v192;
            STACK[0x290] = v189;
            STACK[0x298] = v100;
            STACK[0x2A0] = v108;
            STACK[0x2A8] = v112;
            STACK[0x2B0] = v121;
            LODWORD(STACK[0x2B8]) = v80;
            *(float *)&STACK[0x2BC] = v122;
            std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&a75, (id *)&STACK[0x11D8]);
            gpu::launchSizeGEMM_32x128(v188, v195, 1, (uint64_t)&a70);
            BOOL v123 = (unint64_t *)&a75;
            gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v99, v98, (uint64_t)&STACK[0x288], &a75, &a70);
          }
          else
          {
            if (!v196) {
              goto LABEL_90;
            }
            if ((unint64_t)(v195 + 127) >= 0xFF)
            {
              a64 = v102;
              a65 = v100;
              a66 = v112;
              a67 = v120 + v112;
              a68 = v80;
              a69 = v122;
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&a58, (id *)&STACK[0x11D8]);
              gpu::launchSizeGEMM_32x128(v191, v193, 1, (uint64_t)&a53);
              gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v99, v199, (uint64_t)&a64, &a58, &a53);
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&a58);
            }
            a45 = v102;
            a46 = (char *)v191 + v102;
            a47 = v107;
            a48 = v195 + v100;
            a49 = v112;
            a50 = v120 + v112;
            a51 = v80;
            a52 = v122;
            std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&a39, (id *)&STACK[0x11D8]);
            gpu::launchSizeGEMM_32x128(v191, v197, 1, (uint64_t)&a34);
            BOOL v123 = (unint64_t *)&a39;
            gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v99, v98, (uint64_t)&a45, &a39, &a34);
          }
        }
        else
        {
          STACK[0x5F8] = v102;
          STACK[0x600] = v100;
          STACK[0x608] = v112;
          STACK[0x610] = v121;
          LODWORD(STACK[0x618]) = v80;
          *(float *)&STACK[0x61C] = v122;
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x5C8], (id *)&STACK[0x11D8]);
          gpu::launchSizeGEMM_32x128(v191, v195, 1, (uint64_t)&STACK[0x598]);
          BOOL v123 = &STACK[0x5C8];
          gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v99, v199, (uint64_t)&STACK[0x5F8], (id *)&STACK[0x5C8], (long long *)&STACK[0x598]);
        }
LABEL_89:
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v123);
LABEL_90:
        v112 += 2048;
        uint64_t v118 = v119;
        uint64_t v90 = v200;
        if (v112 >= v200) {
          goto LABEL_96;
        }
      }
    }
    if ((v78 & 0x7F) != 0)
    {
      uint64_t v126 = (gpu *)(v78 & 0x7FFFFFFFFFFFFFE0);
      unint64_t v127 = v78 & 0x7FFFFFFFFFFFFF80;
      if ((v78 & 0x1F) != 0)
      {
        gpu::launchSizeGEMM_32x128(v126, v127, 0, (uint64_t)&STACK[0xDB8]);
        STACK[0xDE8] = v199;
        STACK[0xDF0] = 0;
        STACK[0xE00] = 0;
        STACK[0xDF8] = 0;
        STACK[0xE08] = v200;
        LODWORD(STACK[0xE10]) = v80;
        *(float *)&STACK[0xE14] = v79;
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xE18], (id *)&STACK[0x11D8]);
        long long v128 = *(_OWORD *)&STACK[0xDC8];
        *(_OWORD *)&STACK[0xE48] = *(_OWORD *)&STACK[0xDB8];
        *(_OWORD *)&STACK[0xE58] = v128;
        *(_OWORD *)&STACK[0xE68] = *(_OWORD *)&STACK[0xDD8];
        gpu::launchSizeGEMM_32x128(v126, v78 - v127, 1, (uint64_t)&STACK[0xCE8]);
        STACK[0xD18] = v94;
        STACK[0xD20] = 0;
        STACK[0xD28] = (unint64_t)v126;
        STACK[0xD30] = v127;
        STACK[0xD38] = v78;
        STACK[0xD40] = 0;
        STACK[0xD48] = v200;
        LODWORD(STACK[0xD50]) = v80;
        *(float *)&STACK[0xD54] = v79;
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xD58], (id *)&STACK[0x11D8]);
        long long v129 = *(_OWORD *)&STACK[0xCF8];
        *(_OWORD *)&STACK[0xD88] = *(_OWORD *)&STACK[0xCE8];
        *(_OWORD *)&STACK[0xD98] = v129;
        *(_OWORD *)&STACK[0xDA8] = *(_OWORD *)&STACK[0xD08];
        gpu::launchSizeGEMM_32x128((gpu *)(v78 - (void)v126), v127, 1, (uint64_t)&STACK[0xC18]);
        STACK[0xC48] = v94;
        STACK[0xC50] = (unint64_t)v126;
        STACK[0xC58] = v78;
        STACK[0xC60] = 0;
        STACK[0xC68] = v127;
        STACK[0xC70] = 0;
        STACK[0xC78] = v200;
        LODWORD(STACK[0xC80]) = v80;
        *(float *)&STACK[0xC84] = v79;
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xC88], (id *)&STACK[0x11D8]);
        long long v130 = *(_OWORD *)&STACK[0xC28];
        *(_OWORD *)&STACK[0xCB8] = *(_OWORD *)&STACK[0xC18];
        *(_OWORD *)&STACK[0xCC8] = v130;
        *(_OWORD *)&STACK[0xCD8] = *(_OWORD *)&STACK[0xC38];
        gpu::launchSizeGEMM_32x128((gpu *)(v78 - (void)v126), v78 - v127, 1, (uint64_t)&STACK[0xB48]);
        STACK[0xB78] = v94;
        STACK[0xB80] = (unint64_t)v126;
        STACK[0xB88] = v78;
        STACK[0xB90] = v127;
        STACK[0xB98] = v78;
        STACK[0xBA0] = 0;
        STACK[0xBA8] = v200;
        LODWORD(STACK[0xBB0]) = v80;
        *(float *)&STACK[0xBB4] = v79;
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xBB8], (id *)&STACK[0x11D8]);
        long long v131 = *(_OWORD *)&STACK[0xB58];
        long long v132 = *(_OWORD *)&STACK[0xB68];
        long long v133 = *(_OWORD *)&STACK[0xB68];
        *(_OWORD *)&STACK[0xBF8] = *(_OWORD *)&STACK[0xB58];
        *(_OWORD *)&STACK[0xC08] = v132;
        long long v134 = *(_OWORD *)&STACK[0xE00];
        *(_OWORD *)&STACK[0xE80] = *(_OWORD *)&STACK[0xDF0];
        *(_OWORD *)&STACK[0xE90] = v134;
        long long v135 = *(_OWORD *)&STACK[0xE28];
        *(_OWORD *)&STACK[0xEA8] = *(_OWORD *)&STACK[0xE18];
        *(_OWORD *)&STACK[0xEB8] = v135;
        *(_OWORD *)&STACK[0xE18] = 0u;
        *(_OWORD *)&STACK[0xE28] = 0u;
        long long v136 = *(_OWORD *)&STACK[0xE38];
        *(_OWORD *)&STACK[0xE38] = 0u;
        long long v137 = *(_OWORD *)&STACK[0xE58];
        long long v138 = *(_OWORD *)&STACK[0xE48];
        *(_OWORD *)&STACK[0xEF8] = *(_OWORD *)&STACK[0xE68];
        *(_OWORD *)&STACK[0xEE8] = v137;
        *(_OWORD *)&STACK[0xEC8] = v136;
        *(_OWORD *)&STACK[0xED8] = v138;
        long long v139 = *(_OWORD *)&STACK[0xD20];
        long long v140 = *(_OWORD *)&STACK[0xD30];
        *(_OWORD *)&STACK[0xF30] = *(_OWORD *)&STACK[0xD40];
        *(_OWORD *)&STACK[0xF20] = v140;
        *(_OWORD *)&STACK[0xF10] = v139;
        long long v141 = *(_OWORD *)&STACK[0xD68];
        *(_OWORD *)&STACK[0xF48] = *(_OWORD *)&STACK[0xD58];
        *(_OWORD *)&STACK[0xF58] = v141;
        *(_OWORD *)&STACK[0xD58] = 0u;
        *(_OWORD *)&STACK[0xD68] = 0u;
        long long v142 = *(_OWORD *)&STACK[0xD78];
        *(_OWORD *)&STACK[0xD78] = 0u;
        long long v143 = *(_OWORD *)&STACK[0xD88];
        long long v144 = *(_OWORD *)&STACK[0xD98];
        *(_OWORD *)&STACK[0xF98] = *(_OWORD *)&STACK[0xDA8];
        *(_OWORD *)&STACK[0xF88] = v144;
        *(_OWORD *)&STACK[0xF68] = v142;
        *(_OWORD *)&STACK[0xF78] = v143;
        long long v145 = *(_OWORD *)&STACK[0xC50];
        long long v146 = *(_OWORD *)&STACK[0xC70];
        *(_OWORD *)&STACK[0xFC0] = *(_OWORD *)&STACK[0xC60];
        *(_OWORD *)&STACK[0xFD0] = v146;
        *(_OWORD *)&STACK[0xFB0] = v145;
        long long v147 = *(_OWORD *)&STACK[0xC98];
        *(_OWORD *)&STACK[0xFE8] = *(_OWORD *)&STACK[0xC88];
        *(_OWORD *)&STACK[0xFF8] = v147;
        *(_OWORD *)&STACK[0xC88] = 0u;
        *(_OWORD *)&STACK[0xC98] = 0u;
        long long v148 = *(_OWORD *)&STACK[0xCA8];
        *(_OWORD *)&STACK[0xCA8] = 0u;
        long long v149 = *(_OWORD *)&STACK[0xCB8];
        long long v150 = *(_OWORD *)&STACK[0xCC8];
        *(_OWORD *)&STACK[0x1038] = *(_OWORD *)&STACK[0xCD8];
        *(_OWORD *)&STACK[0x1028] = v150;
        *(_OWORD *)&STACK[0x1008] = v148;
        *(_OWORD *)&STACK[0x1018] = v149;
        long long v151 = *(_OWORD *)&STACK[0xB80];
        long long v152 = *(_OWORD *)&STACK[0xBA0];
        *(_OWORD *)&STACK[0x1060] = *(_OWORD *)&STACK[0xB90];
        *(_OWORD *)&STACK[0x1070] = v152;
        *(_OWORD *)&STACK[0x1050] = v151;
        long long v153 = *(_OWORD *)&STACK[0xBC8];
        *(_OWORD *)&STACK[0x1088] = *(_OWORD *)&STACK[0xBB8];
        *(_OWORD *)&STACK[0x1098] = v153;
        *(_OWORD *)&STACK[0xBB8] = 0u;
        *(_OWORD *)&STACK[0xBC8] = 0u;
        long long v154 = *(_OWORD *)&STACK[0xBD8];
        long long v155 = *(_OWORD *)&STACK[0xB48];
        *(_OWORD *)&STACK[0xBE8] = *(_OWORD *)&STACK[0xB48];
        *(_OWORD *)&STACK[0xBD8] = 0u;
        unint64_t v156 = STACK[0xE10];
        STACK[0xE78] = STACK[0xDE8];
        STACK[0xEA0] = v156;
        unint64_t v157 = STACK[0xD50];
        STACK[0xF08] = STACK[0xD18];
        STACK[0xF40] = v157;
        unint64_t v158 = STACK[0xC80];
        STACK[0xFA8] = STACK[0xC48];
        STACK[0xFE0] = v158;
        unint64_t v159 = STACK[0xBB0];
        STACK[0x1048] = STACK[0xB78];
        STACK[0x1080] = v159;
        *(_OWORD *)&STACK[0x10D8] = v133;
        *(_OWORD *)&STACK[0x10C8] = v131;
        *(_OWORD *)&STACK[0x10A8] = v154;
        *(_OWORD *)&STACK[0x10B8] = v155;
        gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>((uint64_t *)&STACK[0xE78]);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x1088]);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xFE8]);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xF48]);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xEA8]);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xBB8]);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xC88]);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xD58]);
        uint64_t v160 = &STACK[0xE18];
      }
      else
      {
        gpu::launchSizeGEMM_32x128(v126, v127, 0, (uint64_t)&STACK[0xB78]);
        STACK[0xC48] = v199;
        STACK[0xC50] = 0;
        STACK[0xC60] = 0;
        STACK[0xC58] = 0;
        STACK[0xC68] = v90;
        LODWORD(STACK[0xC70]) = v80;
        *(float *)&STACK[0xC74] = v79;
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xC78], (id *)&STACK[0x11D8]);
        long long v161 = *(_OWORD *)&STACK[0xB88];
        *(_OWORD *)&STACK[0xCA8] = *(_OWORD *)&STACK[0xB78];
        *(_OWORD *)&STACK[0xCB8] = v161;
        *(_OWORD *)&STACK[0xCC8] = *(_OWORD *)&STACK[0xB98];
        gpu::launchSizeGEMM_32x128(v126, v78 - v127, 1, (uint64_t)&STACK[0xDE8]);
        STACK[0xD18] = v94;
        STACK[0xD20] = 0;
        STACK[0xD28] = (unint64_t)v126;
        STACK[0xD30] = v127;
        STACK[0xD38] = v78;
        STACK[0xD40] = 0;
        STACK[0xD48] = v90;
        LODWORD(STACK[0xD50]) = v80;
        *(float *)&STACK[0xD54] = v79;
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xD58], (id *)&STACK[0x11D8]);
        long long v162 = *(_OWORD *)&STACK[0xDF8];
        long long v163 = *(_OWORD *)&STACK[0xE08];
        long long v164 = *(_OWORD *)&STACK[0xE08];
        *(_OWORD *)&STACK[0xD98] = *(_OWORD *)&STACK[0xDF8];
        *(_OWORD *)&STACK[0xDA8] = v163;
        long long v165 = *(_OWORD *)&STACK[0xC60];
        *(_OWORD *)&STACK[0xA20] = *(_OWORD *)&STACK[0xC50];
        *(_OWORD *)&STACK[0xA30] = v165;
        long long v166 = *(_OWORD *)&STACK[0xC88];
        *(_OWORD *)&STACK[0xA48] = *(_OWORD *)&STACK[0xC78];
        *(_OWORD *)&STACK[0xA58] = v166;
        *(_OWORD *)&STACK[0xC78] = 0u;
        *(_OWORD *)&STACK[0xC88] = 0u;
        long long v167 = *(_OWORD *)&STACK[0xC98];
        *(_OWORD *)&STACK[0xC98] = 0u;
        long long v168 = *(_OWORD *)&STACK[0xCB8];
        long long v169 = *(_OWORD *)&STACK[0xCA8];
        *(_OWORD *)&STACK[0xA98] = *(_OWORD *)&STACK[0xCC8];
        *(_OWORD *)&STACK[0xA88] = v168;
        *(_OWORD *)&STACK[0xA68] = v167;
        *(_OWORD *)&STACK[0xA78] = v169;
        long long v170 = *(_OWORD *)&STACK[0xD20];
        long long v171 = *(_OWORD *)&STACK[0xD30];
        *(_OWORD *)&STACK[0xAD0] = *(_OWORD *)&STACK[0xD40];
        *(_OWORD *)&STACK[0xAC0] = v171;
        *(_OWORD *)&STACK[0xAB0] = v170;
        long long v172 = *(_OWORD *)&STACK[0xD68];
        *(_OWORD *)&STACK[0xAE8] = *(_OWORD *)&STACK[0xD58];
        *(_OWORD *)&STACK[0xAF8] = v172;
        *(_OWORD *)&STACK[0xD58] = 0u;
        *(_OWORD *)&STACK[0xD68] = 0u;
        long long v173 = *(_OWORD *)&STACK[0xD78];
        long long v174 = *(_OWORD *)&STACK[0xDE8];
        *(_OWORD *)&STACK[0xD88] = *(_OWORD *)&STACK[0xDE8];
        *(_OWORD *)&STACK[0xD78] = 0u;
        unint64_t v175 = STACK[0xC70];
        STACK[0xA18] = STACK[0xC48];
        STACK[0xA40] = v175;
        unint64_t v176 = STACK[0xD50];
        STACK[0xAA8] = STACK[0xD18];
        STACK[0xAE0] = v176;
        *(_OWORD *)&STACK[0xB38] = v164;
        *(_OWORD *)&STACK[0xB28] = v162;
        *(_OWORD *)&STACK[0xB08] = v173;
        *(_OWORD *)&STACK[0xB18] = v174;
        gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>((uint64_t *)&STACK[0xA18]);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xAE8]);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xA48]);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xD58]);
        uint64_t v160 = &STACK[0xC78];
      }
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v160);
      uint64_t v92 = v92;
    }
    else
    {
      STACK[0x1150] = 0;
      STACK[0x1148] = 0;
      STACK[0x1158] = 0;
      STACK[0x1160] = v90;
      LODWORD(STACK[0x1168]) = v80;
      *(float *)&STACK[0x116C] = v79;
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x1118], (id *)&STACK[0x11D8]);
      gpu::launchSizeGEMM_32x128((gpu *)v78, v78, 1, (uint64_t)&STACK[0x10E8]);
      gpu::launchWithByteArgs<std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(v199, (long long *)&STACK[0x1148], (id *)&STACK[0x1118], (long long *)&STACK[0x10E8]);
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x1118]);
    }
  }
LABEL_107:
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x11D8]);
  v177 = (void *)STACK[0x1208];
  STACK[0x1208] = 0;
  if (v177) {
    free(v177);
  }
  return v92;
}

void sub_247233894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v44);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v43);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v42);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v41);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(a41);
  int v46 = (void *)STACK[0x1208];
  STACK[0x1208] = 0;
  if (v46) {
    free(v46);
  }
  _Unwind_Resume(a1);
}

uint64_t gpu::launchWithByteArgs<std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(uint64_t a1, long long *a2, id *a3, long long *a4)
{
  long long v12 = *a2;
  long long v13 = a2[1];
  uint64_t v14 = *((void *)a2 + 4);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v15, a3);
  long long v5 = *a4;
  long long v6 = a4[2];
  long long v7 = *a4;
  long long v19 = a4[1];
  long long v20 = v6;
  long long v22 = v12;
  long long v23 = v13;
  v25[0] = v15;
  v25[1] = v16;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v8 = v17;
  long long v17 = 0u;
  long long v18 = v5;
  long long v9 = a4[2];
  v25[4] = v19;
  v25[5] = v9;
  uint64_t v21 = a1;
  uint64_t v24 = v14;
  v25[2] = v8;
  void v25[3] = v7;
  gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>((uint64_t)&v21);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v25);
  return std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&v15);
}

void sub_247233AFC(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v2);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v1);
  _Unwind_Resume(a1);
}

void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(uint64_t *a1)
{
  uint64_t v2 = (gpu *)objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v3 = objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v2) + 1), sel_commandBuffer);
  long long v9 = &v10;
  id v10 = v3;
  long long v4 = (gpu *)std::__invoke[abi:ne180100]<void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1},std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&>(&v9, a1, a1 + 18, a1 + 38, a1 + 58);
  long long v5 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v4) + 47), sel_setSignaledValue_, 0);
  long long v6 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v5) + 47), sel_signaledValue);
  id v7 = v10;
  GPUHardwareInfo = gpu::getGPUHardwareInfo(v6);
  long long v6 = (gpu *)((char *)v6 + 1);
  objc_msgSend(v7, sel_encodeSignalEvent_value_, *((void *)GPUHardwareInfo + 47), v6);
  objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(v10, sel_commitAndWaitUntilSubmitted)) + 47), sel_waitUntilSignaledValue_timeoutMS_, v6, 0xFFFFFFFFLL);
  if (v2) {
}
  }

void sub_247233C50(_Unwind_Exception *exception_object)
{
  if (v1) {

  }
  _Unwind_Resume(exception_object);
}

uint64_t std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>::~tuple(uint64_t a1)
{
  return a1;
}

void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(uint64_t *a1)
{
  uint64_t v2 = (gpu *)objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v3 = objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v2) + 1), sel_commandBuffer);
  uint64_t v14 = &v15;
  id v15 = v3;
  id v4 = (id)*a1;
  long long v26 = *(_OWORD *)(a1 + 1);
  long long v27 = *(_OWORD *)(a1 + 3);
  uint64_t v5 = a1[5];
  id v25 = v4;
  uint64_t v28 = v5;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v29, (id *)a1 + 6);
  long long v6 = *((_OWORD *)a1 + 7);
  long long v30 = *((_OWORD *)a1 + 6);
  long long v31 = v6;
  long long v32 = *((_OWORD *)a1 + 8);
  uint64_t v16 = a1[18];
  long long v17 = *(_OWORD *)(a1 + 19);
  long long v18 = *(_OWORD *)(a1 + 21);
  long long v7 = *(_OWORD *)(a1 + 23);
  uint64_t v20 = a1[25];
  long long v19 = v7;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v21, (id *)a1 + 26);
  long long v8 = *((_OWORD *)a1 + 17);
  long long v22 = *((_OWORD *)a1 + 16);
  long long v23 = v8;
  long long v24 = *((_OWORD *)a1 + 18);
  gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(&v14, (uint64_t)&v25, (uint64_t)&v16);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v21);
  long long v9 = (gpu *)std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v29);
  GPUHardwareInfo = gpu::getGPUHardwareInfo(v9);
  id v11 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(*((id *)GPUHardwareInfo + 47), sel_setSignaledValue_, 0, v14))+ 47), sel_signaledValue);
  id v12 = v15;
  long long v13 = gpu::getGPUHardwareInfo(v11);
  id v11 = (gpu *)((char *)v11 + 1);
  objc_msgSend(v12, sel_encodeSignalEvent_value_, *((void *)v13 + 47), v11);
  objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(v15, sel_commitAndWaitUntilSubmitted)) + 47), sel_waitUntilSignaledValue_timeoutMS_, v11, 0xFFFFFFFFLL);
  if (v2) {
}
  }

void sub_247233E94(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v3);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v2);
  if (v1) {

  }
  _Unwind_Resume(a1);
}

void gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(void *a1, uint64_t a2, uint64_t a3, id *a4, long long *a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v11 = objc_msgSend(a1, sel_computeCommandEncoder);
  objc_msgSend(v11, sel_setComputePipelineState_, a2);
  uint64_t v12 = *(void *)(a3 + 8);
  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = *(void *)(a3 + 24);
  int v15 = *(_DWORD *)(a3 + 32);
  int v16 = *(_DWORD *)(a3 + 36);
  *(void *)&v24[0] = *(void *)a3;
  v23[0] = v12;
  *(void *)&long long v19 = v13;
  int v21 = v16;
  int v22 = v15;
  objc_msgSend(v11, sel_setBytes_length_atIndex_, v24, 8, 0, v14);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, v23, 8, 1);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v19, 8, 2);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v17, 8, 3);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v22, 4, 4);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v21, 4, 5);
  memset(v24, 0, sizeof(v24));
  *(void *)&long long v19 = v24;
  *((void *)&v19 + 1) = v23;
  std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>((void **)&v19, a4, a4 + 1, a4 + 2, a4 + 3, a4 + 4, a4 + 5);
  objc_msgSend(v11, sel_setBuffers_offsets_withRange_, v24, v23, 6, 6);
  long long v19 = *a5;
  uint64_t v20 = *((void *)a5 + 2);
  long long v17 = *(long long *)((char *)a5 + 24);
  uint64_t v18 = *((void *)a5 + 5);
  objc_msgSend(v11, sel_dispatchThreads_threadsPerThreadgroup_, &v19, &v17);
  objc_msgSend(v11, sel_endEncoding);
  if (v10) {
}
  }

void sub_247234108(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(uint64_t a1)
{
  uint64_t v2 = (gpu *)objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v3 = objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v2) + 1), sel_commandBuffer);
  uint64_t v9 = *(void *)a1;
  long long v10 = *(_OWORD *)(a1 + 8);
  long long v11 = *(_OWORD *)(a1 + 24);
  uint64_t v12 = *(void *)(a1 + 40);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v13, (id *)(a1 + 48));
  long long v4 = *(_OWORD *)(a1 + 112);
  long long v14 = *(_OWORD *)(a1 + 96);
  long long v15 = v4;
  long long v16 = *(_OWORD *)(a1 + 128);
  v19[0] = v10;
  v19[1] = v11;
  uint64_t v20 = v12;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v18, v13);
  v17[0] = v14;
  v17[1] = v15;
  v17[2] = v16;
  gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v3, v9, (uint64_t)v19, v18, v17);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v18);
  uint64_t v5 = (gpu *)std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v13);
  long long v6 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v5) + 47), sel_setSignaledValue_, 0);
  long long v7 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v6) + 47), sel_signaledValue);
  GPUHardwareInfo = gpu::getGPUHardwareInfo(v7);
  long long v7 = (gpu *)((char *)v7 + 1);
  objc_msgSend(v3, sel_encodeSignalEvent_value_, *((void *)GPUHardwareInfo + 47), v7);
  objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(v3, sel_commitAndWaitUntilSubmitted)) + 47), sel_waitUntilSignaledValue_timeoutMS_, v7, 0xFFFFFFFFLL);
  if (v2) {
}
  }

void sub_247234304(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v3 - 144);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v2);
  if (v1) {

  }
  _Unwind_Resume(a1);
}

uint64_t std::__invoke[abi:ne180100]<void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1},std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&>(void ***a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  id v10 = (id)*a2;
  long long v51 = *(_OWORD *)(a2 + 1);
  long long v52 = *(_OWORD *)(a2 + 3);
  uint64_t v11 = a2[5];
  id v50 = v10;
  uint64_t v53 = v11;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v54, (id *)a2 + 6);
  long long v12 = *((_OWORD *)a2 + 7);
  long long v55 = *((_OWORD *)a2 + 6);
  long long v56 = v12;
  long long v57 = *((_OWORD *)a2 + 8);
  id v13 = (id)*a3;
  long long v42 = *(_OWORD *)(a3 + 1);
  long long v43 = *(_OWORD *)(a3 + 3);
  long long v14 = *(_OWORD *)(a3 + 5);
  uint64_t v15 = a3[7];
  id v41 = v13;
  uint64_t v45 = v15;
  long long v44 = v14;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v46, (id *)a3 + 8);
  long long v16 = *((_OWORD *)a3 + 8);
  long long v47 = *((_OWORD *)a3 + 7);
  long long v48 = v16;
  long long v33 = *(_OWORD *)(a4 + 1);
  long long v34 = *(_OWORD *)(a4 + 3);
  long long v35 = *(_OWORD *)(a4 + 5);
  long long v17 = *((_OWORD *)a3 + 9);
  uint64_t v18 = a4[7];
  id v32 = (id)*a4;
  uint64_t v36 = v18;
  long long v49 = v17;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v37, (id *)a4 + 8);
  long long v19 = *((_OWORD *)a4 + 8);
  long long v38 = *((_OWORD *)a4 + 7);
  long long v39 = v19;
  long long v40 = *((_OWORD *)a4 + 9);
  id v23 = (id)*a5;
  long long v24 = *(_OWORD *)(a5 + 1);
  long long v25 = *(_OWORD *)(a5 + 3);
  long long v20 = *(_OWORD *)(a5 + 5);
  uint64_t v27 = a5[7];
  long long v26 = v20;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v28, (id *)a5 + 8);
  long long v21 = *((_OWORD *)a5 + 8);
  long long v29 = *((_OWORD *)a5 + 7);
  long long v30 = v21;
  long long v31 = *((_OWORD *)a5 + 9);
  gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(a1, (uint64_t)&v50, (uint64_t)&v41, (uint64_t)&v32, (uint64_t)&v23);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v28);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v37);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v46);
  return std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v54);
}

void sub_2472344EC(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v3);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v4);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v2);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v1);
  _Unwind_Resume(a1);
}

uint64_t gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(void ***a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = **a1;
  uint64_t v11 = *(void *)a2;
  long long v12 = *(_OWORD *)(a2 + 24);
  v41[0] = *(_OWORD *)(a2 + 8);
  v41[1] = v12;
  uint64_t v42 = *(void *)(a2 + 40);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v40, (id *)(a2 + 48));
  long long v13 = *(_OWORD *)(a2 + 112);
  v39[0] = *(_OWORD *)(a2 + 96);
  v39[1] = v13;
  v39[2] = *(_OWORD *)(a2 + 128);
  gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v10, v11, (uint64_t)v41, v40, v39);
  long long v14 = **a1;
  uint64_t v15 = *(void *)a3;
  long long v16 = *(_OWORD *)(a3 + 24);
  v37[0] = *(_OWORD *)(a3 + 8);
  v37[1] = v16;
  v37[2] = *(_OWORD *)(a3 + 40);
  uint64_t v38 = *(void *)(a3 + 56);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v36, (id *)(a3 + 64));
  long long v17 = *(_OWORD *)(a3 + 128);
  v35[0] = *(_OWORD *)(a3 + 112);
  v35[1] = v17;
  v35[2] = *(_OWORD *)(a3 + 144);
  gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v14, v15, (uint64_t)v37, v36, v35);
  uint64_t v18 = **a1;
  uint64_t v19 = *(void *)a4;
  long long v20 = *(_OWORD *)(a4 + 24);
  v33[0] = *(_OWORD *)(a4 + 8);
  v33[1] = v20;
  v33[2] = *(_OWORD *)(a4 + 40);
  uint64_t v34 = *(void *)(a4 + 56);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v32, (id *)(a4 + 64));
  long long v21 = *(_OWORD *)(a4 + 128);
  v31[0] = *(_OWORD *)(a4 + 112);
  v31[1] = v21;
  v31[2] = *(_OWORD *)(a4 + 144);
  gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v18, v19, (uint64_t)v33, v32, v31);
  int v22 = **a1;
  uint64_t v23 = *(void *)a5;
  long long v24 = *(_OWORD *)(a5 + 24);
  v29[0] = *(_OWORD *)(a5 + 8);
  v29[1] = v24;
  _DWORD v29[2] = *(_OWORD *)(a5 + 40);
  uint64_t v30 = *(void *)(a5 + 56);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v28, (id *)(a5 + 64));
  long long v25 = *(_OWORD *)(a5 + 128);
  v27[0] = *(_OWORD *)(a5 + 112);
  v27[1] = v25;
  v27[2] = *(_OWORD *)(a5 + 144);
  gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v22, v23, (uint64_t)v29, v28, v27);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v28);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v32);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v36);
  return std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v40);
}

void sub_2472346F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&a15);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&a35);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&a55);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v55 - 160);
  _Unwind_Resume(a1);
}

uint64_t gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(void ***a1, uint64_t a2, uint64_t a3)
{
  long long v6 = **a1;
  uint64_t v7 = *(void *)a2;
  long long v8 = *(_OWORD *)(a2 + 24);
  v21[0] = *(_OWORD *)(a2 + 8);
  v21[1] = v8;
  uint64_t v22 = *(void *)(a2 + 40);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v20, (id *)(a2 + 48));
  long long v9 = *(_OWORD *)(a2 + 112);
  v19[0] = *(_OWORD *)(a2 + 96);
  v19[1] = v9;
  _OWORD v19[2] = *(_OWORD *)(a2 + 128);
  gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v6, v7, (uint64_t)v21, v20, v19);
  id v10 = **a1;
  uint64_t v11 = *(void *)a3;
  long long v12 = *(_OWORD *)(a3 + 24);
  v17[0] = *(_OWORD *)(a3 + 8);
  v17[1] = v12;
  v17[2] = *(_OWORD *)(a3 + 40);
  uint64_t v18 = *(void *)(a3 + 56);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v16, (id *)(a3 + 64));
  long long v13 = *(_OWORD *)(a3 + 128);
  v15[0] = *(_OWORD *)(a3 + 112);
  v15[1] = v13;
  _OWORD v15[2] = *(_OWORD *)(a3 + 144);
  gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v10, v11, (uint64_t)v17, v16, v15);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v16);
  return std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v20);
}

void sub_247234834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)va);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v7 - 144);
  _Unwind_Resume(a1);
}

void std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>(void **a1, id *a2, id *a3, id *a4, id *a5, id *a6, id *a7)
{
  id v13 = *a2;
  id v14 = *a3;
  id v15 = *a4;
  id v16 = *a5;
  id v17 = *a6;
  id v18 = *a7;
  **a1 = v13;
  uint64_t v19 = *a1;
  *a1[1] = 0;
  v19[1] = v14;
  long long v20 = *a1;
  a1[1][1] = 0;
  v20[2] = v15;
  long long v21 = *a1;
  a1[1][2] = 0;
  v21[3] = v16;
  uint64_t v22 = *a1;
  a1[1][3] = 0;
  v22[4] = v17;
  uint64_t v23 = *a1;
  a1[1][4] = 0;
  v23[5] = v18;
  a1[1][5] = 0;
  if (v18) {

  }
  if (v17) {
  if (v16)
  }

  if (v15) {
  if (v14)
  }

  if (v13) {
}
  }

BOOL gpu_strmm(gpu *a1, int a2, char a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9, uint64_t a10, uint64_t a11)
{
  int v19 = (int)a1;
  if (!a1)
  {
    if (a5 > 127 || a6 > 31)
    {
      GPUHardwareInfo = gpu::getGPUHardwareInfo(a1);
      long long v21 = (uint64_t *)(GPUHardwareInfo + 21);
      if (a2) {
        long long v21 = (uint64_t *)GPUHardwareInfo + 41;
      }
      uint64_t v22 = a6;
      goto LABEL_13;
    }
    return 0;
  }
  if (a5 <= 31 && a6 <= 127) {
    return 0;
  }
  long long v20 = gpu::getGPUHardwareInfo(a1);
  long long v21 = (uint64_t *)(v20 + 20);
  if (a2) {
    long long v21 = (uint64_t *)v20 + 39;
  }
  uint64_t v22 = a5;
LABEL_13:
  uint64_t v25 = *v21;
  gpu::hostToDevicePointers<float const*,float *,unsigned long,unsigned long>(a7, a10, (const void *)(4 * a8 * v22), (const void *)(4 * a6 * a11), (uint64_t)v69);
  if (v69[0])
  {
    long long v26 = (id *)std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v62, &v70);
    gpu::createGPUOnlyBuffers<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v26, (uint64_t)v64);
    if (v63) {

    }
    if (v62) {
    BOOL v23 = v64[0] != 0;
    }
    if (v64[0])
    {
      if (v19)
      {
        *(void *)&long long v51 = 0;
        *((void *)&v51 + 1) = a5;
        uint64_t v52 = 0;
        uint64_t v53 = a6;
        uint64_t v54 = 0;
        uint64_t v55 = (gpu *)a5;
        char v56 = a3;
        char v57 = a4;
        float v58 = a9;
        int v59 = 0;
        uint64_t v60 = a8;
        uint64_t v61 = a11;
        id v50 = v71;
        std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v46, &v65);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v48, &v67);
        gpu::launchSizeGEMM_32x128((gpu *)a5, a6, 1, (uint64_t)v45);
        gpu::launchWithByteArgsAndGPUCopy<std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>>(v25, &v51, &v50, &v46, v45);
        if (v49) {

        }
        if (v48) {
        if (v47)
        }

        if (v46) {
        if (v50)
        }
      }
      else
      {
        *(void *)&long long v34 = 0;
        *((void *)&v34 + 1) = a5;
        uint64_t v35 = 0;
        uint64_t v36 = a6;
        uint64_t v37 = 0;
        uint64_t v38 = a6;
        char v39 = a3;
        char v40 = a4;
        float v41 = a9;
        int v42 = 0;
        uint64_t v43 = a8;
        uint64_t v44 = a11;
        id v33 = v71;
        std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v29, &v65);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v31, &v67);
        gpu::launchSizeGEMM_128x32((gpu *)a5, a6, 1, (uint64_t)v28);
        gpu::launchWithByteArgsAndGPUCopy<std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>>(v25, &v34, &v33, &v29, v28);
        if (v32) {

        }
        if (v31) {
        if (v30)
        }

        if (v29) {
        if (v33)
        }
      }
    }
    if (v68) {

    }
    if (v67) {
    if (v66)
    }

    if (v65) {
  }
    }
  else
  {
    BOOL v23 = 0;
  }
  if (v71) {

  }
  if (v70) {
  return v23;
  }
}

void sub_247234CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)va);
  std::tuple<NS::SharedPtr<MTL::Buffer>>::~tuple((void **)va1);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v8);
  std::pair<BOOL,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>::~pair(v9 - 128);
  _Unwind_Resume(a1);
}

void gpu::createGPUOnlyBuffers<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(id *a1@<X0>, uint64_t a2@<X8>)
{
  char v14 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  *(void *)&long long v10 = &v12;
  *((void *)&v10 + 1) = &v14;
  _ZNSt3__18__invokeB8ne180100IZN3gpu20createGPUOnlyBuffersIJN2NS9SharedPtrIN3MTL6BufferEEES7_EEEDaNS_5tupleIJDpT_EEEEUlS7_S7_E_JRKS7_SF_EEEDTclclsr3stdE7declvalIT_EEspclsr3stdE7declvalIT0_EEEEOSG_DpOSH_((uint64_t)&v10, a1, a1 + 1);
  char v4 = v14 ^ 1;
  *(void *)&long long v10 = &v12;
  *((void *)&v10 + 1) = &v13;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl[abi:ne180100]<std::tuple<NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&>,void>(v9, (id **)&v10);
  long long v5 = *(_OWORD *)v9;
  *(_OWORD *)uint64_t v9 = 0u;
  long long v10 = v5;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v11, a1);
  *(unsigned char *)a2 = v4;
  long long v6 = v11;
  *(_OWORD *)(a2 + 8) = v10;
  *(_OWORD *)(a2 + 24) = v6;
  long long v10 = 0u;
  long long v11 = 0u;
  if (v9[1]) {

  }
  if (v9[0]) {
  for (uint64_t i = 8; i != -8; i -= 8)
  }
  {
    uint64_t v8 = *(void **)((char *)&v12 + i);
    if (v8) {
  }
    }
}

void sub_247234E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::array<NS::SharedPtr<MTL::Buffer>,2ul>::~array((uint64_t)va);
  _Unwind_Resume(a1);
}

void gpu::launchWithByteArgsAndGPUCopy<std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>>(uint64_t a1, _OWORD *a2, id *a3, id *a4, long long *a5)
{
  uint64_t v30 = a1;
  _ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0ELm1ELm2ELm3ELm4EEEEJPN3MTL20ComputePipelineStateENS_5tupleIJllllllbbffllEEENS6_IJN2NS9SharedPtrINS3_6BufferEEEEEENS_4pairINS6_IJSB_SB_EEESE_EENSD_INS3_4SizeESG_EEEEC2B8ne180100IJLm0ELm1ELm2ELm3ELm4EEJS5_S7_SC_SF_SH_EJEJEJRS5_RS7_RSC_RSF_RSH_EEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSQ_IJDpT2_EEEDpOT3_((uint64_t)&v6, &v30, a2, a3, a4, a5);
  long long v20 = v8;
  long long v21 = v9;
  long long v22 = v10;
  long long v23 = v11;
  long long v19 = v7;
  long long v5 = *(_OWORD *)v13;
  long long v24 = *(_OWORD *)v12;
  *(_OWORD *)uint64_t v12 = 0u;
  *(_OWORD *)uint64_t v13 = 0u;
  long long v25 = v5;
  uint64_t v18 = v6;
  id v26 = v14;
  id v14 = 0;
  long long v29 = v17;
  long long v28 = v16;
  long long v27 = v15;
  gpu::launchWithByteArgsAndGPUCopy<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>>>((uint64_t)&v18);
  if (v26) {

  }
  if (*((void *)&v25 + 1)) {
  if ((void)v25)
  }

  if (*((void *)&v24 + 1)) {
  if ((void)v24)
  }

  if (v14) {
  if (v13[1])
  }

  if (v13[0]) {
  if (v12[1])
  }

  if (v12[0]) {
}
  }

void sub_247234FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

void **std::tuple<NS::SharedPtr<MTL::Buffer>>::~tuple(void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {

  }
  return a1;
}

void _ZNSt3__18__invokeB8ne180100IZN3gpu20createGPUOnlyBuffersIJN2NS9SharedPtrIN3MTL6BufferEEES7_EEEDaNS_5tupleIJDpT_EEEEUlS7_S7_E_JRKS7_SF_EEEDTclclsr3stdE7declvalIT_EEspclsr3stdE7declvalIT0_EEEEOSG_DpOSH_(uint64_t a1, id *a2, id *a3)
{
  id v6 = *a2;
  id v5 = *a3;
  _ZZN3gpu20createGPUOnlyBuffersIJN2NS9SharedPtrIN3MTL6BufferEEES5_EEEDaNSt3__15tupleIJDpT_EEEENKUlS5_S5_E_clES5_S5_(a1, &v6, &v5);
  if (v5) {

  }
  if (v6) {
}
  }

void sub_247235078(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, id a10)
{
  if (a9) {

  }
  if (a10) {
  _Unwind_Resume(exception_object);
  }
}

void _ZZN3gpu20createGPUOnlyBuffersIJN2NS9SharedPtrIN3MTL6BufferEEES5_EEEDaNSt3__15tupleIJDpT_EEEENKUlS5_S5_E_clES5_S5_(uint64_t a1, id *a2, id *a3)
{
  gpu::allocGPUOnlyBuffer((gpu *)objc_msgSend(*a2, sel_length), &v6);
  NS::SharedPtr<MTL::Buffer>::operator=(*(void ***)a1, &v6);
  **(unsigned char **)(a1 + 8) |= **(void **)a1 == 0;
  gpu::allocGPUOnlyBuffer((gpu *)objc_msgSend(*a3, sel_length), &v5);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 8), &v5);
  **(unsigned char **)(a1 + 8) |= *(void *)(*(void *)a1 + 8) == 0;
  if (v5) {

  }
  if (v6) {
}
  }

void sub_247235184(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, id a10)
{
  if (a9) {

  }
  if (a10) {
  _Unwind_Resume(exception_object);
  }
}

void gpu::launchWithByteArgsAndGPUCopy<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>>>(uint64_t a1)
{
  uint64_t v2 = (gpu *)objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v3 = objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v2) + 1), sel_commandBuffer);
  long long v9 = &v10;
  id v10 = v3;
  std::__invoke[abi:ne180100]<void gpu::launchWithByteArgsAndGPUCopy<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>>)#1},std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>> const&>(&v9, a1);
  id v5 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v4) + 47), sel_setSignaledValue_, 0);
  id v6 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v5) + 47), sel_signaledValue);
  id v7 = v10;
  GPUHardwareInfo = gpu::getGPUHardwareInfo(v6);
  id v6 = (gpu *)((char *)v6 + 1);
  objc_msgSend(v7, sel_encodeSignalEvent_value_, *((void *)GPUHardwareInfo + 47), v6);
  objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(v10, sel_commitAndWaitUntilSubmitted)) + 47), sel_waitUntilSignaledValue_timeoutMS_, v6, 0xFFFFFFFFLL);
  if (v2) {
}
  }

void sub_2472352E8(_Unwind_Exception *exception_object)
{
  if (v1) {

  }
  _Unwind_Resume(exception_object);
}

uint64_t std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>>>::~tuple(uint64_t a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(a1 + 96);
  uint64_t v2 = *(void **)(a1 + 88);
  if (v2) {

  }
  return a1;
}

void std::__invoke[abi:ne180100]<void gpu::launchWithByteArgsAndGPUCopy<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>>)#1},std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>> const&>(void ***a1, uint64_t a2)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul>,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>>::__tuple_impl((uint64_t)v3, a2);
  gpu::launchWithByteArgsAndGPUCopy<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(a1, (uint64_t)v3);
  if (v8) {

  }
  if (v7) {
  if (v6)
  }

  if (v5) {
  if (v4)
  }
}

void sub_2472353D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void gpu::launchWithByteArgsAndGPUCopy<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(void ***a1, uint64_t a2)
{
  id v3 = **a1;
  uint64_t v4 = *(void *)a2;
  long long v5 = *(_OWORD *)(a2 + 24);
  long long v6 = *(_OWORD *)(a2 + 56);
  id v14[2] = *(_OWORD *)(a2 + 40);
  void v14[3] = v6;
  v14[4] = *(_OWORD *)(a2 + 72);
  v14[0] = *(_OWORD *)(a2 + 8);
  v14[1] = v5;
  id v13 = *(id *)(a2 + 88);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v9, (id *)(a2 + 96));
  std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v11, (id *)(a2 + 112));
  long long v7 = *(_OWORD *)(a2 + 144);
  v8[0] = *(_OWORD *)(a2 + 128);
  v8[1] = v7;
  id v8[2] = *(_OWORD *)(a2 + 160);
  gpu::encodeCommands<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v3, v4, (uint64_t)v14, &v13, &v9, v8);
  if (v12) {

  }
  if (v11) {
  if (v10)
  }

  if (v9) {
  if (v13)
  }
}

void sub_2472354E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)va);
  std::tuple<NS::SharedPtr<MTL::Buffer>>::~tuple((void **)va1);
  _Unwind_Resume(a1);
}

void gpu::encodeCommands<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(void *a1, uint64_t a2, uint64_t a3, id *a4, id *a5, long long *a6)
{
  v22[3] = *MEMORY[0x263EF8340];
  id v12 = objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v16 = objc_msgSend(a1, sel_blitCommandEncoder);
  *(void *)&long long v19 = &v16;
  *((void *)&v19 + 1) = a5;
  std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>((uint64_t)&v19, a5, a5 + 1);
  objc_msgSend(v16, sel_endEncoding);
  id v15 = objc_msgSend(a1, sel_computeCommandEncoder);
  objc_msgSend(v15, sel_setComputePipelineState_, a2);
  *(void *)&long long v19 = &v15;
  gpu::encodeCommands<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>)::{lambda(long,long,long,long,long,long,BOOL,BOOL,float,float,long,long)#1}::operator()((id **)&v19, *(void *)a3, *(void *)(a3 + 8), *(void *)(a3 + 16), *(void *)(a3 + 24), *(void *)(a3 + 32), *(void *)(a3 + 40), *(unsigned char *)(a3 + 48), *(float *)(a3 + 52), *(float *)(a3 + 56), *(unsigned char *)(a3 + 49), *(void *)(a3 + 64), *(void *)(a3 + 72));
  memset(v22, 0, 24);
  uint64_t v14 = 0;
  id v13 = *a4;
  v22[0] = v13;
  v21[0] = 0;
  uint64_t v14 = 1;
  if (v13) {

  }
  *(void *)&long long v19 = v22;
  *((void *)&v19 + 1) = v21;
  long long v20 = &v14;
  std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#2},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>((uint64_t *)&v19, a5, a5 + 1);
  objc_msgSend(v15, sel_setBuffers_offsets_withRange_, v22, v21, 12, 3);
  long long v19 = *a6;
  long long v20 = (uint64_t *)*((void *)a6 + 2);
  long long v17 = *(long long *)((char *)a6 + 24);
  uint64_t v18 = *((void *)a6 + 5);
  objc_msgSend(v15, sel_dispatchThreads_threadsPerThreadgroup_, &v19, &v17);
  objc_msgSend(v15, sel_endEncoding);
  if (v12) {
}
  }

void sub_24723572C(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>(uint64_t a1, id *a2, id *a3)
{
  id v7 = *a2;
  id v6 = *a3;
  uint64_t v5 = *(void *)(a1 + 8);
  v8[0] = *(id **)a1;
  v8[1] = &v6;
  id v8[2] = &v7;
  std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1}::operator() const(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>(v8, (id *)(v5 + 16), (id *)(v5 + 24));
  if (v6) {

  }
  if (v7) {
}
  }

void sub_247235800(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, id a11)
{
  if (a10) {

  }
  if (a11) {
  _Unwind_Resume(exception_object);
  }
}

void std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1}::operator() const(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>(id **a1, id *a2, id *a3)
{
  id v5 = *a2;
  id v6 = *a3;
  objc_msgSend(**a1, sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, v5, 0, *a1[2], 0, objc_msgSend(*a1[2], sel_length));
  objc_msgSend(**a1, sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, v6, 0, *a1[1], 0, objc_msgSend(*a1[1], sel_length));
  if (v6) {

  }
  if (v5) {
}
  }

void sub_247235934(_Unwind_Exception *exception_object)
{
  if (v2) {

  }
  if (v1) {
  _Unwind_Resume(exception_object);
  }
}

id gpu::encodeCommands<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>)::{lambda(long,long,long,long,long,long,BOOL,BOOL,float,float,long,long)#1}::operator()(id **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, float a9, float a10, char a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v23 = va_arg(va1, void);
  uint64_t v21 = a3;
  uint64_t v22 = a2;
  uint64_t v19 = a5;
  uint64_t v20 = a4;
  uint64_t v17 = a7;
  uint64_t v18 = a6;
  char v16 = a8;
  char v15 = a11;
  float v13 = a10;
  float v14 = a9;
  objc_msgSend(**a1, sel_setBytes_length_atIndex_, &v22, 8, 0);
  objc_msgSend(**a1, sel_setBytes_length_atIndex_, &v21, 8, 1);
  objc_msgSend(**a1, sel_setBytes_length_atIndex_, &v20, 8, 2);
  objc_msgSend(**a1, sel_setBytes_length_atIndex_, &v19, 8, 3);
  objc_msgSend(**a1, sel_setBytes_length_atIndex_, &v18, 8, 4);
  objc_msgSend(**a1, sel_setBytes_length_atIndex_, &v17, 8, 5);
  objc_msgSend(**a1, sel_setBytes_length_atIndex_, &v16, 1, 6);
  objc_msgSend(**a1, sel_setBytes_length_atIndex_, &v15, 1, 7);
  objc_msgSend(**a1, sel_setBytes_length_atIndex_, &v14, 4, 8);
  objc_msgSend(**a1, sel_setBytes_length_atIndex_, &v13, 4, 9);
  objc_msgSend(**a1, sel_setBytes_length_atIndex_, va, 8, 10);
  return objc_msgSend(**a1, sel_setBytes_length_atIndex_, va1, 8, 11);
}

void std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#2},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>(uint64_t *a1, id *a2, id *a3)
{
  id v5 = *a2;
  id v6 = *a3;
  *(void *)(*a1 + 8 * *(void *)a1[2]) = v5;
  id v7 = (uint64_t *)a1[2];
  uint64_t v8 = *a1;
  *(void *)(a1[1] + 8 * *v7) = 0;
  uint64_t v9 = *v7 + 1;
  uint64_t *v7 = v9;
  *(void *)(v8 + 8 * v9) = v6;
  id v10 = (void *)a1[2];
  *(void *)(a1[1] + 8 * (*v10)++) = 0;
  if (v6) {

  }
  if (v5) {
}
  }

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul>,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,BOOL,BOOL,float,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>>,std::pair<std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>,std::pair<MTL::Size,MTL::Size>>::__tuple_impl(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  long long v4 = *(_OWORD *)(a2 + 24);
  long long v5 = *(_OWORD *)(a2 + 40);
  long long v6 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = v6;
  *(_OWORD *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 24) = v4;
  *(void *)(a1 + 88) = *(id *)(a2 + 88);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl((void *)(a1 + 96), (id *)(a2 + 96));
  std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl((void *)(a1 + 112), (id *)(a2 + 112));
  long long v7 = *(_OWORD *)(a2 + 128);
  long long v8 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v8;
  *(_OWORD *)(a1 + 128) = v7;
  return a1;
}

uint64_t _ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0ELm1ELm2ELm3ELm4EEEEJPN3MTL20ComputePipelineStateENS_5tupleIJllllllbbffllEEENS6_IJN2NS9SharedPtrINS3_6BufferEEEEEENS_4pairINS6_IJSB_SB_EEESE_EENSD_INS3_4SizeESG_EEEEC2B8ne180100IJLm0ELm1ELm2ELm3ELm4EEJS5_S7_SC_SF_SH_EJEJEJRS5_RS7_RSC_RSF_RSH_EEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSQ_IJDpT2_EEEDpOT3_(uint64_t a1, void *a2, _OWORD *a3, id *a4, id *a5, long long *a6)
{
  *(void *)a1 = *a2;
  *(_OWORD *)(a1 + 8) = *a3;
  long long v9 = a3[1];
  long long v10 = a3[2];
  long long v11 = a3[3];
  *(_OWORD *)(a1 + 72) = a3[4];
  *(_OWORD *)(a1 + 56) = v11;
  *(_OWORD *)(a1 + 40) = v10;
  *(_OWORD *)(a1 + 24) = v9;
  *(void *)(a1 + 88) = *a4;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl((void *)(a1 + 96), a5);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl((void *)(a1 + 112), a5 + 2);
  long long v12 = *a6;
  long long v13 = a6[2];
  *(_OWORD *)(a1 + 144) = a6[1];
  *(_OWORD *)(a1 + 160) = v13;
  *(_OWORD *)(a1 + 128) = v12;
  return a1;
}

uint64_t gpu_sgemm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, uint64_t a17, unint64_t a18, gpu *a19, unint64_t a20,unint64_t a21,unint64_t a22,unint64_t *a23,uint64_t a24,unint64_t *a25,uint64_t a26,id *a27,long long a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,int64_t a40,unint64_t a41,unint64_t a42,unint64_t a43,int64_t a44,unint64_t a45,int a46,float a47,long long a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,id a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,int64_t a60,int64_t a61,int64_t a62,unint64_t a63)
{
  id v71 = (gpu *)MEMORY[0x270FA5388]();
  unint64_t v77 = v76;
  unint64_t v79 = v78;
  unint64_t v81 = v80;
  float v83 = v82;
  int v85 = v84;
  char v86 = v72;
  char v87 = (char)v71;
  uint64_t v88 = (id *)a19;
  uint64_t v89 = a17;
  STACK[0x11F8] = *MEMORY[0x263EF8340];
  STACK[0xFD8] = v78;
  uint64_t v182 = v73;
  if (v73 > 31 || v74 >= 128)
  {
    a27 = v88;
    uint64_t v181 = v74;
    *(_OWORD *)&STACK[0x11D0] = 0u;
    *(_OWORD *)&STACK[0x11C0] = 0u;
    *(_OWORD *)&STACK[0x11B0] = 0u;
    *(_OWORD *)&STACK[0x11A0] = 0u;
    *(_OWORD *)&STACK[0x1190] = 0u;
    *(_OWORD *)&STACK[0x1180] = 0u;
    *(_OWORD *)&STACK[0x1170] = 0u;
    *(_OWORD *)&STACK[0x1160] = 0u;
    *(_OWORD *)&STACK[0x1150] = 0u;
    *(_OWORD *)&STACK[0x1140] = 0u;
    *(_OWORD *)&STACK[0x1130] = 0u;
    *(_OWORD *)&STACK[0x1120] = 0u;
    *(_OWORD *)&STACK[0x1110] = 0u;
    *(_OWORD *)&STACK[0x1100] = 0u;
    *(_OWORD *)&STACK[0x10F0] = 0u;
    *(_OWORD *)&STACK[0x10E0] = 0u;
    *(_OWORD *)&STACK[0x10D0] = 0u;
    *(_OWORD *)&STACK[0x10C0] = 0u;
    *(_OWORD *)&STACK[0x10B0] = 0u;
    *(_OWORD *)&STACK[0x10A0] = 0u;
    *(_OWORD *)&STACK[0x1090] = 0u;
    *(_OWORD *)&STACK[0x1080] = 0u;
    *(_OWORD *)&STACK[0x1070] = 0u;
    *(_OWORD *)&STACK[0x1060] = 0u;
    *(_OWORD *)&STACK[0x1050] = 0u;
    *(_OWORD *)&STACK[0x1040] = 0u;
    *(_OWORD *)&STACK[0x1030] = 0u;
    *(_OWORD *)&STACK[0x1020] = 0u;
    *(_OWORD *)&STACK[0x1010] = 0u;
    *(_OWORD *)&STACK[0x1000] = 0u;
    *(_OWORD *)&STACK[0xFF0] = 0u;
    a26 = v75;
    if (v75 <= 0) {
      uint64_t v91 = -(-v75 & 7);
    }
    else {
      uint64_t v91 = v75 & 7;
    }
    *(_OWORD *)&STACK[0xFE0] = 0uLL;
    if (v91 >= 1)
    {
      uint64_t v92 = (_DWORD *)&STACK[0xFE0] - v91 + 8;
      uint64_t v93 = -v91;
      unint64_t v94 = &STACK[0xFE0] - 4 * v91 + 64;
      uint64_t v95 = 64;
      do
      {
        _DWORD *v92 = 1065353216;
        v92 += 9;
        *(_DWORD *)unint64_t v94 = 1065353216;
        unint64_t v94 = (unint64_t *)((char *)v94 + 36);
        ++v95;
      }
      while (v93 + v95 != 64);
    }
    unint64_t v96 = a18;
    if (v72) {
      uint64_t v97 = a26;
    }
    else {
      uint64_t v97 = v74;
    }
    if (v71) {
      uint64_t v98 = v73;
    }
    else {
      uint64_t v98 = a26;
    }
    GPUHardwareInfo = gpu::getGPUHardwareInfo(v71);
    if (v87)
    {
      if (v86)
      {
        a23 = (unint64_t *)*((void *)GPUHardwareInfo + 17);
        int64_t v100 = gpu::getGPUHardwareInfo((gpu *)GPUHardwareInfo) + 9;
      }
      else
      {
        a23 = (unint64_t *)*((void *)GPUHardwareInfo + 15);
        int64_t v100 = gpu::getGPUHardwareInfo((gpu *)GPUHardwareInfo) + 8;
      }
    }
    else if (v86)
    {
      a23 = (unint64_t *)*((void *)GPUHardwareInfo + 13);
      int64_t v100 = gpu::getGPUHardwareInfo((gpu *)GPUHardwareInfo) + 7;
    }
    else
    {
      a23 = (unint64_t *)*((void *)GPUHardwareInfo + 11);
      int64_t v100 = gpu::getGPUHardwareInfo((gpu *)GPUHardwareInfo) + 6;
    }
    uint64_t v101 = *(unint64_t **)v100;
    STACK[0xF60] = v81;
    STACK[0xF68] = (unint64_t)&STACK[0xFD8];
    STACK[0xF70] = v77;
    STACK[0xF78] = (unint64_t)&a17;
    STACK[0xF80] = v96;
    STACK[0xF88] = (unint64_t)&a19;
    STACK[0xF90] = (unint64_t)&STACK[0xFE0];
    uint64_t v102 = v181;
    uint64_t v103 = 4 * v181 * (void)a27;
    STACK[0xF28] = 4 * v98 * v79;
    STACK[0xF30] = 8;
    STACK[0xF38] = 4 * v97 * v89;
    STACK[0xF40] = 8;
    STACK[0xF48] = v103;
    *(_OWORD *)&STACK[0xF50] = xmmword_24723D3A0;
    gpu::hostToDevicePointers<float const*,long const*,float const*,long const*,float *,long const*,float (*)[128],unsigned long,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long>(&STACK[0xF60], (const void **)&STACK[0xF28], (uint64_t)&STACK[0xF98]);
    a27 = (id *)&STACK[0xFA0];
    uint64_t v90 = LOBYTE(STACK[0xF98]) != 0;
    if (!LOBYTE(STACK[0xF98])) {
      goto LABEL_96;
    }
    uint64_t v105 = v182;
    if ((double)v182 * (double)v181 * (double)a26 > 8589934590.0)
    {
      a25 = v101;
      unsigned int v180 = v90;
      id v106 = gpu::batchSetup(v104);
      uint64_t v107 = a26;
      if (v181 >= 1)
      {
        int64_t v108 = 0;
        while (1)
        {
          uint64_t v109 = v102 - v108;
          if (v102 - v108 >= 2048) {
            uint64_t v109 = 2048;
          }
          a24 = v109;
          if (v105 >= 1) {
            break;
          }
LABEL_77:
          v108 += 2048;
          uint64_t v102 = v181;
          if (v108 >= v181) {
            goto LABEL_78;
          }
        }
        int64_t v110 = 0;
        uint64_t v111 = a24 + 127;
        unint64_t v183 = a24 + 127;
        uint64_t v184 = a24 & 0x7F;
        if (a24 >= 0) {
          uint64_t v111 = a24;
        }
        unint64_t v112 = v111 & 0xFFFFFFFFFFFFFF80;
        unint64_t vars0 = a24 - 128;
        a21 = v112 + v108;
        a22 = a24 + v108;
        uint64_t v185 = v112;
        a17 = a24 - v112;
        while (1)
        {
          uint64_t v113 = v105 - v110 >= 2048 ? 2048 : v105 - v110;
          if (v107 >= 1) {
            break;
          }
LABEL_76:
          v110 += 2048;
          uint64_t v105 = v182;
          if (v110 >= v182) {
            goto LABEL_77;
          }
        }
        int64_t v114 = 0;
        uint64_t v115 = v113 + 31;
        if (v113 >= 0) {
          uint64_t v115 = v113;
        }
        unint64_t v116 = v115 & 0xFFFFFFFFFFFFFFE0;
        if (v184) {
          BOOL v117 = (v113 & 0x1F) == 0;
        }
        else {
          BOOL v117 = 1;
        }
        HIDWORD(a18) = v117;
        BOOL v119 = (unint64_t)(v113 - 32) < 0xFFFFFFFFFFFFFFC1 && vars0 < 0xFFFFFFFFFFFFFF01;
        BOOL v186 = v119;
        unint64_t v120 = v116 + v110;
        a20 = v113 + v110;
        uint64_t vars8 = (gpu *)v116;
        a19 = (gpu *)(v113 - v116);
        uint64_t v121 = v107;
        while (1)
        {
          uint64_t v122 = v121 - 2048;
          if (v121 >= 2048) {
            uint64_t v123 = 2048;
          }
          else {
            uint64_t v123 = v121;
          }
          unint64_t v124 = v123 + v114;
          if (v114) {
            float v125 = 1.0;
          }
          else {
            float v125 = v83;
          }
          if (v113 & 0x1F | v184)
          {
            if ((a18 & 0x100000000) == 0)
            {
              if (v186)
              {
                STACK[0x580] = v110;
                STACK[0x588] = v108;
                STACK[0x590] = v114;
                STACK[0x598] = v124;
                LODWORD(STACK[0x5A0]) = v85;
                *(float *)&STACK[0x5A4] = v125;
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x548], a27);
                gpu::launchSizeGEMM_32x128(vars8, v185, 1, (uint64_t)&STACK[0x518]);
                gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v106, (uint64_t)a23, (uint64_t)&STACK[0x580], (id *)&STACK[0x548], (long long *)&STACK[0x518]);
                unint64_t v128 = v123 + v114;
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x548]);
                goto LABEL_65;
              }
              unint64_t v128 = v123 + v114;
              if ((unint64_t)(v113 - 32) <= 0xFFFFFFFFFFFFFFC0)
              {
LABEL_65:
                STACK[0x4E0] = v110;
                STACK[0x4E8] = v120;
                STACK[0x4F0] = a21;
                STACK[0x4F8] = a22;
                STACK[0x500] = v114;
                STACK[0x508] = v128;
                LODWORD(STACK[0x510]) = v85;
                *(float *)&STACK[0x514] = v125;
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x4A8], a27);
                gpu::launchSizeGEMM_32x128(vars8, a17, 1, (uint64_t)&STACK[0x478]);
                gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v106, (uint64_t)a25, (uint64_t)&STACK[0x4E0], (id *)&STACK[0x4A8], (long long *)&STACK[0x478]);
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x4A8]);
              }
              long long v129 = a27;
              if (vars0 <= 0xFFFFFFFFFFFFFF00)
              {
                STACK[0x440] = v120;
                STACK[0x448] = a20;
                STACK[0x450] = v108;
                STACK[0x458] = a21;
                STACK[0x460] = v114;
                STACK[0x468] = v124;
                LODWORD(STACK[0x470]) = v85;
                *(float *)&STACK[0x474] = v125;
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x408], v129);
                gpu::launchSizeGEMM_32x128(a19, v185, 1, (uint64_t)&STACK[0x3D8]);
                gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v106, (uint64_t)a25, (uint64_t)&STACK[0x440], (id *)&STACK[0x408], (long long *)&STACK[0x3D8]);
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x408]);
              }
              STACK[0x3A0] = v120;
              STACK[0x3A8] = a20;
              STACK[0x3B0] = a21;
              STACK[0x3B8] = a22;
              STACK[0x3C0] = v114;
              STACK[0x3C8] = v124;
              LODWORD(STACK[0x3D0]) = v85;
              *(float *)&STACK[0x3D4] = v125;
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x368], v129);
              gpu::launchSizeGEMM_32x128(a19, a17, 1, (uint64_t)&STACK[0x338]);
              uint64_t v126 = &STACK[0x368];
              gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v106, (uint64_t)a25, (uint64_t)&STACK[0x3A0], (id *)&STACK[0x368], (long long *)&STACK[0x338]);
              goto LABEL_69;
            }
            if ((v113 & 0x1F) != 0)
            {
              unint64_t v127 = a27;
              if ((unint64_t)(v113 + 31) >= 0x3F)
              {
                STACK[0x310] = v110;
                STACK[0x318] = v108;
                STACK[0x320] = v114;
                STACK[0x328] = v124;
                LODWORD(STACK[0x330]) = v85;
                *(float *)&STACK[0x334] = v125;
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x2D8], v127);
                gpu::launchSizeGEMM_32x128(vars8, a24, 1, (uint64_t)&STACK[0x2A8]);
                gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v106, (uint64_t)a23, (uint64_t)&STACK[0x310], (id *)&STACK[0x2D8], (long long *)&STACK[0x2A8]);
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x2D8]);
              }
              a78 = v120;
              a79 = a20;
              STACK[0x280] = v108;
              STACK[0x288] = a22;
              STACK[0x290] = v114;
              STACK[0x298] = v124;
              LODWORD(STACK[0x2A0]) = v85;
              *(float *)&STACK[0x2A4] = v125;
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&a71, v127);
              gpu::launchSizeGEMM_32x128(a19, a24, 1, (uint64_t)&a66);
              uint64_t v126 = (unint64_t *)&a71;
              gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v106, (uint64_t)a25, (uint64_t)&a78, &a71, &a66);
            }
            else
            {
              long long v130 = a27;
              if (!v184) {
                goto LABEL_70;
              }
              if (v183 >= 0xFF)
              {
                a60 = v110;
                a61 = v108;
                a62 = v114;
                a63 = v124;
                a64 = v85;
                a65 = v125;
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&a53, a27);
                gpu::launchSizeGEMM_32x128((gpu *)v113, v185, 1, (uint64_t)&a48);
                gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v106, (uint64_t)a23, (uint64_t)&a60, &a53, &a48);
                std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&a53);
              }
              a40 = v110;
              a41 = a20;
              a42 = a21;
              a43 = a22;
              a44 = v114;
              a45 = v124;
              a46 = v85;
              a47 = v125;
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&a33, v130);
              gpu::launchSizeGEMM_32x128((gpu *)v113, a17, 1, (uint64_t)&a28);
              uint64_t v126 = (unint64_t *)&a33;
              gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v106, (uint64_t)a25, (uint64_t)&a40, &a33, &a28);
            }
          }
          else
          {
            STACK[0x610] = v110;
            STACK[0x618] = v108;
            STACK[0x620] = v114;
            STACK[0x628] = v124;
            LODWORD(STACK[0x630]) = v85;
            *(float *)&STACK[0x634] = v125;
            std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x5D8], a27);
            gpu::launchSizeGEMM_32x128((gpu *)v113, a24, 1, (uint64_t)&STACK[0x5A8]);
            uint64_t v126 = &STACK[0x5D8];
            gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v106, (uint64_t)a23, (uint64_t)&STACK[0x610], (id *)&STACK[0x5D8], (long long *)&STACK[0x5A8]);
          }
LABEL_69:
          std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v126);
LABEL_70:
          v114 += 2048;
          uint64_t v121 = v122;
          uint64_t v107 = a26;
          if (v114 >= a26) {
            goto LABEL_76;
          }
        }
      }
LABEL_78:
      gpu::launch(v106);
      uint64_t v90 = v180;
LABEL_96:
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)a27);
      return v90;
    }
    if (!(v181 & 0x7F | v182 & 0x1F))
    {
      STACK[0xF08] = 0;
      STACK[0xF00] = 0;
      STACK[0xF10] = 0;
      long long v141 = a27;
      STACK[0xF18] = a26;
      LODWORD(STACK[0xF20]) = v85;
      *(float *)&STACK[0xF24] = v83;
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xEC8], v141);
      gpu::launchSizeGEMM_32x128((gpu *)v182, v181, 1, (uint64_t)&STACK[0xE98]);
      gpu::launchWithByteArgs<std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>((uint64_t)a23, (long long *)&STACK[0xF00], (id *)&STACK[0xEC8], (long long *)&STACK[0xE98]);
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xEC8]);
      goto LABEL_96;
    }
    if ((v182 & 0x1F) != 0 && (v181 & 0x7F) != 0)
    {
      uint64_t v131 = v182 + 31;
      if (v182 >= 0) {
        uint64_t v131 = v182;
      }
      long long v132 = (gpu *)(v131 & 0xFFFFFFFFFFFFFFE0);
      uint64_t v133 = v181 + 127;
      if (v181 >= 0) {
        uint64_t v133 = v181;
      }
      unint64_t v134 = v133 & 0xFFFFFFFFFFFFFF80;
      gpu::launchSizeGEMM_32x128(v132, v133 & 0xFFFFFFFFFFFFFF80, 0, (uint64_t)&STACK[0xB40]);
      STACK[0xB70] = (unint64_t)a23;
      STACK[0xB78] = 0;
      STACK[0xB88] = 0;
      STACK[0xB80] = 0;
      unint64_t v135 = a26;
      long long v136 = a27;
      STACK[0xB90] = a26;
      LODWORD(STACK[0xB98]) = v85;
      *(float *)&STACK[0xB9C] = v83;
      a25 = &STACK[0xBA0];
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xBA0], v136);
      *(_OWORD *)&STACK[0xBD8] = *(_OWORD *)&STACK[0xB40];
      *(_OWORD *)&STACK[0xBE8] = *(_OWORD *)&STACK[0xB50];
      *(_OWORD *)&STACK[0xBF8] = *(_OWORD *)&STACK[0xB60];
      gpu::launchSizeGEMM_32x128(v132, v181 - v134, 1, (uint64_t)&STACK[0xA68]);
      STACK[0xA98] = (unint64_t)v101;
      STACK[0xAA0] = 0;
      STACK[0xAA8] = (unint64_t)v132;
      STACK[0xAB0] = v134;
      STACK[0xAB8] = v181;
      STACK[0xAC0] = 0;
      STACK[0xAC8] = v135;
      LODWORD(STACK[0xAD0]) = v85;
      *(float *)&STACK[0xAD4] = v83;
      a24 = (uint64_t)&STACK[0xAD8];
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xAD8], v136);
      long long v137 = *(_OWORD *)&STACK[0xA78];
      *(_OWORD *)&STACK[0xB10] = *(_OWORD *)&STACK[0xA68];
      *(_OWORD *)&STACK[0xB20] = v137;
      *(_OWORD *)&STACK[0xB30] = *(_OWORD *)&STACK[0xA88];
      gpu::launchSizeGEMM_32x128((gpu *)(v182 - (void)v132), v134, 1, (uint64_t)&STACK[0x990]);
      STACK[0x9C0] = (unint64_t)v101;
      STACK[0x9C8] = (unint64_t)v132;
      STACK[0x9D0] = v182;
      STACK[0x9D8] = 0;
      STACK[0x9E0] = v134;
      STACK[0x9E8] = 0;
      STACK[0x9F0] = v135;
      LODWORD(STACK[0x9F8]) = v85;
      *(float *)&STACK[0x9FC] = v83;
      a23 = &STACK[0xA00];
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xA00], v136);
      *(_OWORD *)&STACK[0xA38] = *(_OWORD *)&STACK[0x990];
      *(_OWORD *)&STACK[0xA48] = *(_OWORD *)&STACK[0x9A0];
      *(_OWORD *)&STACK[0xA58] = *(_OWORD *)&STACK[0x9B0];
      gpu::launchSizeGEMM_32x128((gpu *)(v182 - (void)v132), v181 - v134, 1, (uint64_t)&STACK[0x8B8]);
      STACK[0x8E8] = (unint64_t)v101;
      STACK[0x8F0] = (unint64_t)v132;
      STACK[0x8F8] = v182;
      STACK[0x900] = v134;
      STACK[0x908] = v181;
      STACK[0x910] = 0;
      STACK[0x918] = v135;
      LODWORD(STACK[0x920]) = v85;
      *(float *)&STACK[0x924] = v83;
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x928], v136);
      long long v138 = *(_OWORD *)&STACK[0x8C8];
      *(_OWORD *)&STACK[0x960] = *(_OWORD *)&STACK[0x8B8];
      *(_OWORD *)&STACK[0x970] = v138;
      *(_OWORD *)&STACK[0x980] = *(_OWORD *)&STACK[0x8D8];
      _ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0ELm1ELm2ELm3EEEEJNS_5tupleIJPN3MTL20ComputePipelineStateENS3_IJllllffEEENS3_IJN2NS9SharedPtrINS4_6BufferEEESB_SB_SB_SB_SB_SB_EEENS_4pairINS4_4SizeESE_EEEEENS3_IJS6_NS3_IJllllllffEEESC_SF_EEESI_SI_EEC2B8ne180100IJLm0ELm1ELm2ELm3EEJSG_SI_SI_SI_EJEJEJSG_SI_SI_SI_EEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSM_IJDpT2_EEEDpOT3_((uint64_t)&STACK[0xC08], (uint64_t)&STACK[0xB70], (uint64_t)&STACK[0xA98], (uint64_t)&STACK[0x9C0], (uint64_t)&STACK[0x8E8]);
      gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>((uint64_t *)&STACK[0xC08]);
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xE30]);
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xD88]);
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xCE0]);
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xC38]);
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x928]);
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)a23);
      long long v139 = (unint64_t *)a24;
    }
    else
    {
      if ((v182 & 0x1F) != 0)
      {
        a25 = v101;
        uint64_t v142 = v182 + 31;
        if (v182 >= 0) {
          uint64_t v142 = v182;
        }
        long long v143 = (gpu *)(v142 & 0xFFFFFFFFFFFFFFE0);
        uint64_t v144 = v181 + 127;
        if (v181 >= 0) {
          uint64_t v144 = v181;
        }
        gpu::launchSizeGEMM_32x128(v143, v144 & 0xFFFFFFFFFFFFFF80, 0, (uint64_t)&STACK[0x8E8]);
        STACK[0x9C0] = (unint64_t)a23;
        STACK[0x9C8] = 0;
        STACK[0x9D8] = 0;
        STACK[0x9D0] = 0;
        unint64_t v145 = a26;
        long long v146 = a27;
        STACK[0x9E0] = a26;
        LODWORD(STACK[0x9E8]) = v85;
        *(float *)&STACK[0x9EC] = v83;
        a24 = (uint64_t)&STACK[0x9F0];
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x9F0], v146);
        long long v147 = *(_OWORD *)&STACK[0x8F8];
        *(_OWORD *)&STACK[0xA28] = *(_OWORD *)&STACK[0x8E8];
        *(_OWORD *)&STACK[0xA38] = v147;
        *(_OWORD *)&STACK[0xA48] = *(_OWORD *)&STACK[0x908];
        gpu::launchSizeGEMM_32x128((gpu *)(v182 - (void)v143), v181, 1, (uint64_t)&STACK[0xB70]);
        STACK[0xA98] = (unint64_t)a25;
        STACK[0xAA0] = (unint64_t)v143;
        STACK[0xAA8] = v182;
        STACK[0xAB0] = 0;
        STACK[0xAB8] = v181;
        STACK[0xAC0] = 0;
        STACK[0xAC8] = v145;
        LODWORD(STACK[0xAD0]) = v85;
        *(float *)&STACK[0xAD4] = v83;
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xAD8], v146);
        long long v148 = *(_OWORD *)&STACK[0xB80];
        *(_OWORD *)&STACK[0xB10] = *(_OWORD *)&STACK[0xB70];
        long long v149 = *(_OWORD *)&STACK[0xB70];
        *(_OWORD *)&STACK[0xB20] = *(_OWORD *)&STACK[0xB80];
        *(_OWORD *)&STACK[0xB30] = *(_OWORD *)&STACK[0xB90];
        long long v150 = *(_OWORD *)&STACK[0x9D8];
        *(_OWORD *)&STACK[0x780] = *(_OWORD *)&STACK[0x9C8];
        *(_OWORD *)&STACK[0x790] = v150;
        unint64_t v151 = STACK[0x9E8];
        unint64_t v152 = STACK[0xA20];
        STACK[0x778] = STACK[0x9C0];
        STACK[0x7A0] = v151;
        long long v153 = *(_OWORD *)&STACK[0xA00];
        *(_OWORD *)&STACK[0x7A8] = *(_OWORD *)&STACK[0x9F0];
        *(_OWORD *)&STACK[0x7B8] = v153;
        *(_OWORD *)&STACK[0x7C8] = *(_OWORD *)&STACK[0xA10];
        *(_OWORD *)&STACK[0x800] = *(_OWORD *)&STACK[0xA48];
        long long v154 = *(_OWORD *)&STACK[0xA28];
        *(_OWORD *)&STACK[0x7F0] = *(_OWORD *)&STACK[0xA38];
        *(_OWORD *)&STACK[0x7E0] = v154;
        long long v155 = *(_OWORD *)&STACK[0xAA0];
        *(_OWORD *)&STACK[0x838] = *(_OWORD *)&STACK[0xAC0];
        *(_OWORD *)&STACK[0x828] = *(_OWORD *)&STACK[0xAB0];
        *(_OWORD *)&STACK[0x818] = v155;
        long long v156 = *(_OWORD *)&STACK[0xAE8];
        *(_OWORD *)&STACK[0x850] = *(_OWORD *)&STACK[0xAD8];
        *(_OWORD *)&STACK[0x9F0] = 0u;
        *(_OWORD *)&STACK[0xA00] = 0u;
        *(_OWORD *)&STACK[0xA10] = 0u;
        STACK[0xA20] = 0;
        unint64_t v157 = STACK[0xA98];
        unint64_t v158 = STACK[0xAD0];
        STACK[0x7D8] = v152;
        STACK[0x810] = v157;
        *(_OWORD *)&STACK[0x860] = v156;
        *(_OWORD *)&STACK[0xAD8] = 0u;
        *(_OWORD *)&STACK[0xAE8] = 0u;
        *(_OWORD *)&STACK[0x870] = *(_OWORD *)&STACK[0xAF8];
        *(_OWORD *)&STACK[0xAF8] = 0u;
        unint64_t v159 = STACK[0xB08];
        STACK[0x848] = v158;
        STACK[0x880] = v159;
        STACK[0xB08] = 0;
        *(_OWORD *)&STACK[0x8A8] = *(_OWORD *)&STACK[0xB90];
        *(_OWORD *)&STACK[0x898] = v148;
        *(_OWORD *)&STACK[0x888] = v149;
        gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>((uint64_t *)&STACK[0x778]);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x850]);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x7A8]);
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0xAD8]);
        long long v140 = (unint64_t *)a24;
        goto LABEL_95;
      }
      if ((v181 & 0x7F) == 0) {
        goto LABEL_96;
      }
      uint64_t v161 = v182 + 31;
      if (v182 >= 0) {
        uint64_t v161 = v182;
      }
      long long v162 = (gpu *)(v161 & 0xFFFFFFFFFFFFFFE0);
      uint64_t v163 = v181 + 127;
      if (v181 >= 0) {
        uint64_t v163 = v181;
      }
      unint64_t v164 = v163 & 0xFFFFFFFFFFFFFF80;
      gpu::launchSizeGEMM_32x128(v162, v163 & 0xFFFFFFFFFFFFFF80, 0, (uint64_t)&STACK[0x8E8]);
      STACK[0x9C0] = (unint64_t)a23;
      STACK[0x9C8] = 0;
      STACK[0x9D8] = 0;
      STACK[0x9D0] = 0;
      unint64_t v165 = a26;
      long long v166 = a27;
      STACK[0x9E0] = a26;
      LODWORD(STACK[0x9E8]) = v85;
      *(float *)&STACK[0x9EC] = v83;
      a25 = &STACK[0x9F0];
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0x9F0], v166);
      long long v167 = *(_OWORD *)&STACK[0x8F8];
      *(_OWORD *)&STACK[0xA28] = *(_OWORD *)&STACK[0x8E8];
      *(_OWORD *)&STACK[0xA38] = v167;
      *(_OWORD *)&STACK[0xA48] = *(_OWORD *)&STACK[0x908];
      gpu::launchSizeGEMM_32x128(v162, v181 - v164, 1, (uint64_t)&STACK[0xB70]);
      STACK[0xA98] = (unint64_t)v101;
      STACK[0xAA0] = 0;
      STACK[0xAA8] = (unint64_t)v162;
      STACK[0xAB0] = v164;
      STACK[0xAB8] = v181;
      STACK[0xAC0] = 0;
      STACK[0xAC8] = v165;
      LODWORD(STACK[0xAD0]) = v85;
      *(float *)&STACK[0xAD4] = v83;
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&STACK[0xAD8], v166);
      long long v168 = *(_OWORD *)&STACK[0xB80];
      *(_OWORD *)&STACK[0xB10] = *(_OWORD *)&STACK[0xB70];
      long long v169 = *(_OWORD *)&STACK[0xB70];
      *(_OWORD *)&STACK[0xB20] = *(_OWORD *)&STACK[0xB80];
      *(_OWORD *)&STACK[0xB30] = *(_OWORD *)&STACK[0xB90];
      long long v170 = *(_OWORD *)&STACK[0x9D8];
      *(_OWORD *)&STACK[0x640] = *(_OWORD *)&STACK[0x9C8];
      *(_OWORD *)&STACK[0x650] = v170;
      unint64_t v171 = STACK[0x9E8];
      unint64_t v172 = STACK[0xA20];
      STACK[0x638] = STACK[0x9C0];
      STACK[0x660] = v171;
      long long v173 = *(_OWORD *)&STACK[0xA00];
      *(_OWORD *)&STACK[0x668] = *(_OWORD *)&STACK[0x9F0];
      *(_OWORD *)&STACK[0x678] = v173;
      *(_OWORD *)&STACK[0x688] = *(_OWORD *)&STACK[0xA10];
      *(_OWORD *)&STACK[0x6C0] = *(_OWORD *)&STACK[0xA48];
      long long v174 = *(_OWORD *)&STACK[0xA28];
      *(_OWORD *)&STACK[0x6B0] = *(_OWORD *)&STACK[0xA38];
      *(_OWORD *)&STACK[0x6A0] = v174;
      long long v175 = *(_OWORD *)&STACK[0xAA0];
      *(_OWORD *)&STACK[0x6F8] = *(_OWORD *)&STACK[0xAC0];
      *(_OWORD *)&STACK[0x6E8] = *(_OWORD *)&STACK[0xAB0];
      *(_OWORD *)&STACK[0x6D8] = v175;
      long long v176 = *(_OWORD *)&STACK[0xAE8];
      *(_OWORD *)&STACK[0x710] = *(_OWORD *)&STACK[0xAD8];
      *(_OWORD *)&STACK[0x9F0] = 0u;
      *(_OWORD *)&STACK[0xA00] = 0u;
      *(_OWORD *)&STACK[0xA10] = 0u;
      STACK[0xA20] = 0;
      unint64_t v177 = STACK[0xA98];
      unint64_t v178 = STACK[0xAD0];
      STACK[0x698] = v172;
      STACK[0x6D0] = v177;
      *(_OWORD *)&STACK[0x720] = v176;
      *(_OWORD *)&STACK[0xAD8] = 0u;
      *(_OWORD *)&STACK[0xAE8] = 0u;
      *(_OWORD *)&STACK[0x730] = *(_OWORD *)&STACK[0xAF8];
      *(_OWORD *)&STACK[0xAF8] = 0u;
      unint64_t v179 = STACK[0xB08];
      STACK[0x708] = v178;
      STACK[0x740] = v179;
      STACK[0xB08] = 0;
      *(_OWORD *)&STACK[0x768] = *(_OWORD *)&STACK[0xB90];
      *(_OWORD *)&STACK[0x758] = v168;
      *(_OWORD *)&STACK[0x748] = v169;
      gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>((uint64_t *)&STACK[0x638]);
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x710]);
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&STACK[0x668]);
      long long v139 = &STACK[0xAD8];
    }
    std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v139);
    long long v140 = a25;
LABEL_95:
    std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v140);
    uint64_t v90 = v90;
    goto LABEL_96;
  }
  return 0;
}

void sub_247236C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v37);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v36);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v35);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(a33);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(a35);
  _Unwind_Resume(a1);
}

void gpu::hostToDevicePointers<float const*,long const*,float const*,long const*,float *,long const*,float (*)[128],unsigned long,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long>(void *a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  char v22 = 0;
  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  *(void *)&long long v14 = *a1;
  uint64_t v36 = v5;
  uint64_t v37 = v4;
  uint64_t v34 = v7;
  uint64_t v35 = v6;
  uint64_t v32 = v9;
  uint64_t v33 = v8;
  uint64_t v23 = (id *)&v18;
  long long v24 = (char *)&v32;
  long long v25 = (long long *)&v22;
  id v26 = (char *)&v33;
  long long v27 = &v34;
  long long v28 = (char *)&v35;
  long long v29 = &v36;
  uint64_t v30 = &v37;
  id v31 = &v14;
  _ZZZN3gpu20hostToDevicePointersIJPKfPKlS2_S4_PfS4_PA128_fEJmmmmmmmEEEDaNSt3__15tupleIJDpT_EEENSA_IJDpT0_EEEENKUlS2_S4_S2_S4_S5_S4_S7_E_clES2_S4_S2_S4_S5_S4_S7_ENKUlmmmmmmmE_clEmmmmmmm((uint64_t)&v23, *a2, a2[1], a2[2], a2[3], a2[4], a2[5], a2[6]);
  char v10 = v22 ^ 1;
  uint64_t v23 = (id *)&v18;
  long long v24 = (char *)&v18 + 8;
  long long v25 = &v19;
  id v26 = (char *)&v19 + 8;
  long long v27 = (uint64_t *)&v20;
  long long v28 = (char *)&v20 + 8;
  long long v29 = &v21;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl[abi:ne180100]<std::tuple<NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&>,void>(&v14, &v23);
  *(unsigned char *)a3 = v10;
  long long v11 = v15;
  *(_OWORD *)(a3 + 8) = v14;
  *(_OWORD *)(a3 + 24) = v11;
  long long v14 = 0u;
  long long v15 = 0u;
  *(_OWORD *)(a3 + 40) = v16;
  long long v16 = 0u;
  *(void *)(a3 + 56) = v17;
  uint64_t v17 = 0;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&v14);
  for (uint64_t i = 48; i != -8; i -= 8)
  {
    long long v13 = *(void **)((char *)&v18 + i);
    if (v13) {
  }
    }
}

void sub_247236F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  std::array<NS::SharedPtr<MTL::Buffer>,7ul>::~array((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t gpu::launchWithByteArgs<std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(uint64_t a1, long long *a2, id *a3, long long *a4)
{
  long long v9 = *a2;
  long long v10 = a2[1];
  uint64_t v11 = *((void *)a2 + 4);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v12, a3);
  long long v5 = a4[1];
  long long v16 = *a4;
  long long v6 = *a4;
  long long v17 = a4[1];
  long long v18 = a4[2];
  long long v20 = v9;
  long long v21 = v10;
  v23[0] = v12;
  v23[1] = v13;
  v23[2] = v14;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v27 = a4[2];
  uint64_t v19 = a1;
  uint64_t v22 = v11;
  uint64_t v24 = v15;
  uint64_t v15 = 0;
  long long v26 = v5;
  long long v25 = v6;
  gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>((uint64_t)&v19);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v23);
  return std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&v12);
}

void sub_247237018(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v2);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v1);
  _Unwind_Resume(a1);
}

void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(uint64_t *a1)
{
  uint64_t v2 = (gpu *)objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v3 = objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v2) + 1), sel_commandBuffer);
  long long v9 = &v10;
  id v10 = v3;
  uint64_t v4 = (gpu *)std::__invoke[abi:ne180100]<void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1},std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&>(&v9, a1, a1 + 19, a1 + 40, a1 + 61);
  long long v5 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v4) + 47), sel_setSignaledValue_, 0);
  long long v6 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v5) + 47), sel_signaledValue);
  id v7 = v10;
  GPUHardwareInfo = gpu::getGPUHardwareInfo(v6);
  long long v6 = (gpu *)((char *)v6 + 1);
  objc_msgSend(v7, sel_encodeSignalEvent_value_, *((void *)GPUHardwareInfo + 47), v6);
  objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(v10, sel_commitAndWaitUntilSubmitted)) + 47), sel_waitUntilSignaledValue_timeoutMS_, v6, 0xFFFFFFFFLL);
  if (v2) {
}
  }

void sub_24723716C(_Unwind_Exception *exception_object)
{
  if (v1) {

  }
  _Unwind_Resume(exception_object);
}

uint64_t std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>::~tuple(uint64_t a1)
{
  return a1;
}

void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(uint64_t *a1)
{
  uint64_t v2 = (gpu *)objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v3 = objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v2) + 1), sel_commandBuffer);
  uint64_t v15 = &v16;
  id v16 = v3;
  id v4 = (id)*a1;
  long long v5 = *(_OWORD *)(a1 + 3);
  long long v27 = *(_OWORD *)(a1 + 1);
  long long v28 = v5;
  uint64_t v6 = a1[5];
  id v26 = v4;
  uint64_t v29 = v6;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v30, (id *)a1 + 6);
  long long v31 = *(_OWORD *)(a1 + 13);
  long long v32 = *(_OWORD *)(a1 + 15);
  long long v33 = *(_OWORD *)(a1 + 17);
  long long v7 = *((_OWORD *)a1 + 11);
  long long v18 = *((_OWORD *)a1 + 10);
  uint64_t v17 = a1[19];
  long long v19 = v7;
  long long v8 = *((_OWORD *)a1 + 12);
  uint64_t v21 = a1[26];
  long long v20 = v8;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v22, (id *)a1 + 27);
  long long v9 = *((_OWORD *)a1 + 18);
  long long v23 = *((_OWORD *)a1 + 17);
  long long v24 = v9;
  long long v25 = *((_OWORD *)a1 + 19);
  gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(&v15, (uint64_t)&v26, (uint64_t)&v17);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v22);
  id v10 = (gpu *)std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v30);
  GPUHardwareInfo = gpu::getGPUHardwareInfo(v10);
  long long v12 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(*((id *)GPUHardwareInfo + 47), sel_setSignaledValue_, 0, v15))+ 47), sel_signaledValue);
  id v13 = v16;
  long long v14 = gpu::getGPUHardwareInfo(v12);
  long long v12 = (gpu *)((char *)v12 + 1);
  objc_msgSend(v13, sel_encodeSignalEvent_value_, *((void *)v14 + 47), v12);
  objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(v16, sel_commitAndWaitUntilSubmitted)) + 47), sel_waitUntilSignaledValue_timeoutMS_, v12, 0xFFFFFFFFLL);
  if (v2) {
}
  }

void sub_2472373B8(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v3);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v2);
  if (v1) {

  }
  _Unwind_Resume(a1);
}

void gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(void *a1, uint64_t a2, uint64_t a3, id *a4, long long *a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v11 = objc_msgSend(a1, sel_computeCommandEncoder);
  objc_msgSend(v11, sel_setComputePipelineState_, a2);
  uint64_t v12 = *(void *)(a3 + 8);
  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = *(void *)(a3 + 24);
  int v15 = *(_DWORD *)(a3 + 32);
  int v16 = *(_DWORD *)(a3 + 36);
  *(void *)&v24[0] = *(void *)a3;
  v23[0] = v12;
  *(void *)&long long v19 = v13;
  int v21 = v16;
  int v22 = v15;
  objc_msgSend(v11, sel_setBytes_length_atIndex_, v24, 8, 0, v14);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, v23, 8, 1);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v19, 8, 2);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v17, 8, 3);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v22, 4, 4);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v21, 4, 5);
  uint64_t v25 = 0;
  memset(v24, 0, sizeof(v24));
  *(void *)&long long v19 = v24;
  *((void *)&v19 + 1) = v23;
  std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>((void **)&v19, a4, a4 + 1, a4 + 2, a4 + 3, a4 + 4, a4 + 5, a4 + 6);
  objc_msgSend(v11, sel_setBuffers_offsets_withRange_, v24, v23, 6, 7);
  long long v19 = *a5;
  uint64_t v20 = *((void *)a5 + 2);
  long long v17 = *(long long *)((char *)a5 + 24);
  uint64_t v18 = *((void *)a5 + 5);
  objc_msgSend(v11, sel_dispatchThreads_threadsPerThreadgroup_, &v19, &v17);
  objc_msgSend(v11, sel_endEncoding);
  if (v10) {
}
  }

void sub_24723763C(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(void *a1, uint64_t a2, uint64_t a3, id *a4, long long *a5)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v11 = objc_msgSend(a1, sel_computeCommandEncoder);
  objc_msgSend(v11, sel_setComputePipelineState_, a2);
  uint64_t v12 = *(void *)(a3 + 8);
  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = *(void *)(a3 + 24);
  uint64_t v15 = *(void *)(a3 + 32);
  uint64_t v16 = *(void *)(a3 + 40);
  int v17 = *(_DWORD *)(a3 + 48);
  int v18 = *(_DWORD *)(a3 + 52);
  *(void *)&v28[0] = *(void *)a3;
  uint64_t v26 = v15;
  v27[0] = v12;
  *(void *)&long long v21 = v13;
  uint64_t v25 = v16;
  int v23 = v18;
  int v24 = v17;
  objc_msgSend(v11, sel_setBytes_length_atIndex_, v28, 8, 0, v14);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, v27, 8, 1);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v21, 8, 2);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v19, 8, 3);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v26, 8, 4);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v25, 8, 5);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v24, 4, 6);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v23, 4, 7);
  uint64_t v29 = 0;
  memset(v28, 0, sizeof(v28));
  *(void *)&long long v21 = v28;
  *((void *)&v21 + 1) = v27;
  std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>((void **)&v21, a4, a4 + 1, a4 + 2, a4 + 3, a4 + 4, a4 + 5, a4 + 6);
  objc_msgSend(v11, sel_setBuffers_offsets_withRange_, v28, v27, 8, 7);
  long long v21 = *a5;
  uint64_t v22 = *((void *)a5 + 2);
  long long v19 = *(long long *)((char *)a5 + 24);
  uint64_t v20 = *((void *)a5 + 5);
  objc_msgSend(v11, sel_dispatchThreads_threadsPerThreadgroup_, &v21, &v19);
  objc_msgSend(v11, sel_endEncoding);
  if (v10) {
}
  }

void sub_2472378FC(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t std::array<NS::SharedPtr<MTL::Buffer>,7ul>::~array(uint64_t a1)
{
  for (uint64_t i = 48; i != -8; i -= 8)
  {
    uint64_t v3 = *(void **)(a1 + i);
    if (v3) {
  }
    }
  return a1;
}

void _ZZZN3gpu20hostToDevicePointersIJPKfPKlS2_S4_PfS4_PA128_fEJmmmmmmmEEEDaNSt3__15tupleIJDpT_EEENSA_IJDpT0_EEEENKUlS2_S4_S2_S4_S5_S4_S7_E_clES2_S4_S2_S4_S5_S4_S7_ENKUlmmmmmmmE_clEmmmmmmm(uint64_t a1, const void *a2, const void *a3, const void *a4, const void *a5, const void *a6, const void *a7, const void *a8)
{
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 64), a2, &v21);
  NS::SharedPtr<MTL::Buffer>::operator=(*(void ***)a1, &v21);
  **(unsigned char **)(a1 + 16) |= **(void **)a1 == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 56), a3, &v20);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 8), &v20);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 8) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 48), a4, &v19);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 16), &v19);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 16) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 40), a5, &v18);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 24), &v18);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 24) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 32), a6, &v17);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 32), &v17);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 32) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 24), a7, &v16);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 40), &v16);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 40) == 0;
  gpu::allocDeviceBuffer(**(gpu ***)(a1 + 8), a8, &v15);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)(*(void *)a1 + 48), &v15);
  **(unsigned char **)(a1 + 16) |= *(void *)(*(void *)a1 + 48) == 0;
  if (v15) {

  }
  if (v16) {
  if (v17)
  }

  if (v18) {
  if (v19)
  }

  if (v20) {
  if (v21)
  }
}

void sub_247237C18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, id a11, id a12, id a13, id a14, id a15, id a16)
{
  if (a10) {

  }
  if (a11) {
  if (a12)
  }

  if (a13) {
  if (a14)
  }

  if (a15) {
  if (a16)
  }

  _Unwind_Resume(exception_object);
}

void *std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl[abi:ne180100]<std::tuple<NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&,NS::SharedPtr<MTL::Buffer>&>,void>(void *a1, id **a2)
{
  *a1 = **a2;
  a1[1] = *a2[1];
  a1[2] = *a2[2];
  a1[3] = *a2[3];
  a1[4] = *a2[4];
  a1[5] = *a2[5];
  a1[6] = *a2[6];
  return a1;
}

void *std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  return a1;
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2) {

  }
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3) {

  }
  id v4 = *(void **)(a1 + 32);
  if (v4) {

  }
  long long v5 = *(void **)(a1 + 24);
  if (v5) {

  }
  uint64_t v6 = *(void **)(a1 + 16);
  if (v6) {

  }
  long long v7 = *(void **)(a1 + 8);
  if (v7) {

  }
  if (*(void *)a1) {
  return a1;
  }
}

uint64_t _ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0ELm1ELm2ELm3EEEEJNS_5tupleIJPN3MTL20ComputePipelineStateENS3_IJllllffEEENS3_IJN2NS9SharedPtrINS4_6BufferEEESB_SB_SB_SB_SB_SB_EEENS_4pairINS4_4SizeESE_EEEEENS3_IJS6_NS3_IJllllllffEEESC_SF_EEESI_SI_EEC2B8ne180100IJLm0ELm1ELm2ELm3EEJSG_SI_SI_SI_EJEJEJSG_SI_SI_SI_EEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSM_IJDpT2_EEEDpOT3_(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>::__tuple_impl(a1, a2);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>::__tuple_impl(v9 + 152, a3);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>::__tuple_impl(a1 + 320, a4);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>::__tuple_impl(a1 + 488, a5);
  return a1;
}

__n128 std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>::__tuple_impl(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  long long v2 = *(_OWORD *)(a2 + 8);
  long long v3 = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v3;
  *(_OWORD *)(a1 + 8) = v2;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a2 + 56) = 0;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a2 + 64) = 0;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a2 + 72) = 0;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a2 + 80) = 0;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a2 + 88) = 0;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a2 + 96) = 0;
  __n128 result = *(__n128 *)(a2 + 104);
  long long v5 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = v5;
  *(__n128 *)(a1 + 104) = result;
  return result;
}

__n128 std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>::__tuple_impl(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  long long v2 = *(_OWORD *)(a2 + 8);
  long long v3 = *(_OWORD *)(a2 + 24);
  long long v4 = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v4;
  *(_OWORD *)(a1 + 24) = v3;
  *(_OWORD *)(a1 + 8) = v2;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a2 + 64) = 0;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a2 + 72) = 0;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a2 + 80) = 0;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a2 + 88) = 0;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a2 + 96) = 0;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a2 + 104) = 0;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a2 + 112) = 0;
  __n128 result = *(__n128 *)(a2 + 120);
  long long v6 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 136) = v6;
  *(__n128 *)(a1 + 120) = result;
  return result;
}

void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(uint64_t a1)
{
  long long v2 = (gpu *)objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v3 = objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v2) + 1), sel_commandBuffer);
  uint64_t v9 = *(void *)a1;
  long long v10 = *(_OWORD *)(a1 + 8);
  long long v11 = *(_OWORD *)(a1 + 24);
  uint64_t v12 = *(void *)(a1 + 40);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v13, (id *)(a1 + 48));
  long long v4 = *(_OWORD *)(a1 + 120);
  long long v14 = *(_OWORD *)(a1 + 104);
  long long v15 = v4;
  long long v16 = *(_OWORD *)(a1 + 136);
  v19[0] = v10;
  v19[1] = v11;
  uint64_t v20 = v12;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v18, v13);
  v17[0] = v14;
  v17[1] = v15;
  v17[2] = v16;
  gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v3, v9, (uint64_t)v19, v18, v17);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v18);
  long long v5 = (gpu *)std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v13);
  long long v6 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v5) + 47), sel_setSignaledValue_, 0);
  long long v7 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v6) + 47), sel_signaledValue);
  GPUHardwareInfo = gpu::getGPUHardwareInfo(v7);
  long long v7 = (gpu *)((char *)v7 + 1);
  objc_msgSend(v3, sel_encodeSignalEvent_value_, *((void *)GPUHardwareInfo + 47), v7);
  objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(v3, sel_commitAndWaitUntilSubmitted)) + 47), sel_waitUntilSignaledValue_timeoutMS_, v7, 0xFFFFFFFFLL);
  if (v2) {
}
  }

void sub_247238218(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v3 - 168);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v2);
  if (v1) {

  }
  _Unwind_Resume(a1);
}

uint64_t std::__invoke[abi:ne180100]<void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1},std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&>(void ***a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  id v10 = (id)*a2;
  long long v11 = *(_OWORD *)(a2 + 3);
  long long v52 = *(_OWORD *)(a2 + 1);
  long long v53 = v11;
  uint64_t v12 = a2[5];
  id v51 = v10;
  uint64_t v54 = v12;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v55, (id *)a2 + 6);
  long long v56 = *(_OWORD *)(a2 + 13);
  long long v57 = *(_OWORD *)(a2 + 15);
  long long v58 = *(_OWORD *)(a2 + 17);
  id v13 = (id)*a3;
  long long v14 = *(_OWORD *)(a3 + 3);
  long long v43 = *(_OWORD *)(a3 + 1);
  long long v44 = v14;
  long long v15 = *(_OWORD *)(a3 + 5);
  uint64_t v16 = a3[7];
  id v42 = v13;
  uint64_t v46 = v16;
  long long v45 = v15;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v47, (id *)a3 + 8);
  long long v48 = *(_OWORD *)(a3 + 15);
  long long v49 = *(_OWORD *)(a3 + 17);
  long long v50 = *(_OWORD *)(a3 + 19);
  id v17 = (id)*a4;
  long long v18 = *(_OWORD *)(a4 + 3);
  long long v34 = *(_OWORD *)(a4 + 1);
  long long v35 = v18;
  long long v19 = *(_OWORD *)(a4 + 5);
  uint64_t v20 = a4[7];
  id v33 = v17;
  uint64_t v37 = v20;
  long long v36 = v19;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v38, (id *)a4 + 8);
  long long v39 = *(_OWORD *)(a4 + 15);
  long long v40 = *(_OWORD *)(a4 + 17);
  long long v41 = *(_OWORD *)(a4 + 19);
  id v24 = (id)*a5;
  long long v21 = *(_OWORD *)(a5 + 3);
  long long v25 = *(_OWORD *)(a5 + 1);
  long long v26 = v21;
  long long v22 = *(_OWORD *)(a5 + 5);
  uint64_t v28 = a5[7];
  long long v27 = v22;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v29, (id *)a5 + 8);
  long long v30 = *(_OWORD *)(a5 + 15);
  long long v31 = *(_OWORD *)(a5 + 17);
  long long v32 = *(_OWORD *)(a5 + 19);
  gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(a1, (uint64_t)&v51, (uint64_t)&v42, (uint64_t)&v33, (uint64_t)&v24);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v29);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v38);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v47);
  return std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v55);
}

void sub_247238418(_Unwind_Exception *a1)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v3);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v4);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v2);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v1);
  _Unwind_Resume(a1);
}

uint64_t gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(void ***a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = **a1;
  uint64_t v11 = *(void *)a2;
  long long v12 = *(_OWORD *)(a2 + 24);
  v41[0] = *(_OWORD *)(a2 + 8);
  v41[1] = v12;
  uint64_t v42 = *(void *)(a2 + 40);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v40, (id *)(a2 + 48));
  long long v13 = *(_OWORD *)(a2 + 120);
  v39[0] = *(_OWORD *)(a2 + 104);
  v39[1] = v13;
  v39[2] = *(_OWORD *)(a2 + 136);
  gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v10, v11, (uint64_t)v41, v40, v39);
  long long v14 = **a1;
  uint64_t v15 = *(void *)a3;
  long long v16 = *(_OWORD *)(a3 + 24);
  v37[0] = *(_OWORD *)(a3 + 8);
  v37[1] = v16;
  v37[2] = *(_OWORD *)(a3 + 40);
  uint64_t v38 = *(void *)(a3 + 56);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v36, (id *)(a3 + 64));
  long long v17 = *(_OWORD *)(a3 + 136);
  v35[0] = *(_OWORD *)(a3 + 120);
  v35[1] = v17;
  v35[2] = *(_OWORD *)(a3 + 152);
  gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v14, v15, (uint64_t)v37, v36, v35);
  long long v18 = **a1;
  uint64_t v19 = *(void *)a4;
  long long v20 = *(_OWORD *)(a4 + 24);
  v33[0] = *(_OWORD *)(a4 + 8);
  v33[1] = v20;
  v33[2] = *(_OWORD *)(a4 + 40);
  uint64_t v34 = *(void *)(a4 + 56);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v32, (id *)(a4 + 64));
  long long v21 = *(_OWORD *)(a4 + 136);
  v31[0] = *(_OWORD *)(a4 + 120);
  v31[1] = v21;
  v31[2] = *(_OWORD *)(a4 + 152);
  gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v18, v19, (uint64_t)v33, v32, v31);
  long long v22 = **a1;
  uint64_t v23 = *(void *)a5;
  long long v24 = *(_OWORD *)(a5 + 24);
  v29[0] = *(_OWORD *)(a5 + 8);
  v29[1] = v24;
  _DWORD v29[2] = *(_OWORD *)(a5 + 40);
  uint64_t v30 = *(void *)(a5 + 56);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v28, (id *)(a5 + 64));
  long long v25 = *(_OWORD *)(a5 + 136);
  v27[0] = *(_OWORD *)(a5 + 120);
  v27[1] = v25;
  v27[2] = *(_OWORD *)(a5 + 152);
  gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v22, v23, (uint64_t)v29, v28, v27);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v28);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v32);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v36);
  return std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v40);
}

void sub_24723862C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&a16);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&a38);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)&a60);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v60 - 168);
  _Unwind_Resume(a1);
}

uint64_t gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>,std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1}::operator()(void ***a1, uint64_t a2, uint64_t a3)
{
  long long v6 = **a1;
  uint64_t v7 = *(void *)a2;
  long long v8 = *(_OWORD *)(a2 + 24);
  v21[0] = *(_OWORD *)(a2 + 8);
  v21[1] = v8;
  uint64_t v22 = *(void *)(a2 + 40);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v20, (id *)(a2 + 48));
  long long v9 = *(_OWORD *)(a2 + 120);
  v19[0] = *(_OWORD *)(a2 + 104);
  v19[1] = v9;
  _OWORD v19[2] = *(_OWORD *)(a2 + 136);
  gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v6, v7, (uint64_t)v21, v20, v19);
  id v10 = **a1;
  uint64_t v11 = *(void *)a3;
  long long v12 = *(_OWORD *)(a3 + 24);
  v17[0] = *(_OWORD *)(a3 + 8);
  v17[1] = v12;
  v17[2] = *(_OWORD *)(a3 + 40);
  uint64_t v18 = *(void *)(a3 + 56);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v16, (id *)(a3 + 64));
  long long v13 = *(_OWORD *)(a3 + 136);
  v15[0] = *(_OWORD *)(a3 + 120);
  v15[1] = v13;
  _OWORD v15[2] = *(_OWORD *)(a3 + 152);
  gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v10, v11, (uint64_t)v17, v16, v15);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v16);
  return std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)v20);
}

void sub_247238778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl((uint64_t)va);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~__tuple_impl(v8 - 152);
  _Unwind_Resume(a1);
}

void std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>(void **a1, id *a2, id *a3, id *a4, id *a5, id *a6, id *a7, id *a8)
{
  id v15 = *a2;
  id v16 = *a3;
  id v17 = *a4;
  id v18 = *a5;
  id v19 = *a6;
  id v20 = *a7;
  id v21 = *a8;
  **a1 = v15;
  uint64_t v22 = *a1;
  *a1[1] = 0;
  v22[1] = v16;
  uint64_t v23 = *a1;
  a1[1][1] = 0;
  v23[2] = v17;
  long long v24 = *a1;
  a1[1][2] = 0;
  _OWORD v24[3] = v18;
  long long v25 = *a1;
  a1[1][3] = 0;
  v25[4] = v19;
  long long v26 = *a1;
  a1[1][4] = 0;
  v26[5] = v20;
  long long v27 = *a1;
  a1[1][5] = 0;
  void v27[6] = v21;
  a1[1][6] = 0;
  if (v21) {

  }
  if (v20) {
  if (v19)
  }

  if (v18) {
  if (v17)
  }

  if (v16) {
  if (v15)
  }
}

void std::__invoke[abi:ne180100]<void gpu::encodeCommands<long,long,long,long,long,long,float,float,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(MTL::CommandBuffer *,MTL::ComputePipelineState *,std::tuple<long,long,long,long,long,long,float,float>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>)::{lambda(NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>)#1},NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&,NS::SharedPtr<MTL::Buffer> const&>(void **a1, id *a2, id *a3, id *a4, id *a5, id *a6, id *a7, id *a8)
{
  id v15 = *a2;
  id v16 = *a3;
  id v17 = *a4;
  id v18 = *a5;
  id v19 = *a6;
  id v20 = *a7;
  id v21 = *a8;
  **a1 = v15;
  uint64_t v22 = *a1;
  *a1[1] = 0;
  v22[1] = v16;
  uint64_t v23 = *a1;
  a1[1][1] = 0;
  v23[2] = v17;
  long long v24 = *a1;
  a1[1][2] = 0;
  _OWORD v24[3] = v18;
  long long v25 = *a1;
  a1[1][3] = 0;
  v25[4] = v19;
  long long v26 = *a1;
  a1[1][4] = 0;
  v26[5] = v20;
  long long v27 = *a1;
  a1[1][5] = 0;
  void v27[6] = v21;
  a1[1][6] = 0;
  if (v21) {

  }
  if (v20) {
  if (v19)
  }

  if (v18) {
  if (v17)
  }

  if (v16) {
  if (v15)
  }
}

uint64_t MTL::CopyAllDevices(MTL *this)
{
  return 0;
}

uint64_t MTL::CopyAllDevicesWithObserver(uint64_t a1, uint64_t a2)
{
  v4[4] = *MEMORY[0x263EF8340];
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x4802000000;
  v3[3] = __Block_byref_object_copy_;
  v3[4] = __Block_byref_object_dispose_;
  std::__function::__value_func<void ()(MTL::Device *,NS::String *)>::__value_func[abi:ne180100]((uint64_t)v4, a2);
  _Block_object_dispose(v3, 8);
  std::__function::__value_func<void ()(MTL::Device *,NS::String *)>::~__value_func[abi:ne180100](v4);
  return 0;
}

uint64_t __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(MTL::Device *,NS::String *)>::__value_func[abi:ne180100](a1 + 40, a2 + 40);
}

void *__Block_byref_object_dispose_(uint64_t a1)
{
  return std::__function::__value_func<void ()(MTL::Device *,NS::String *)>::~__value_func[abi:ne180100]((void *)(a1 + 40));
}

uint64_t ___ZN3MTL26CopyAllDevicesWithObserverEPPN2NS6ObjectERKNSt3__18functionIFvPNS_6DeviceEPNS0_6StringEEEE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return std::function<void ()(MTL::Device *,NS::String *)>::operator()(*(void *)(*(void *)(a1 + 32) + 8) + 40, a2, a3);
}

uint64_t std::function<void ()(MTL::Device *,NS::String *)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a3;
  uint64_t v6 = a2;
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v3 + 48))(v3, &v6, &v5);
}

long long *gpu::getGPUHardwareInfo(gpu *this)
{
  {
    xmmword_269242130 = 0u;
    unk_269242140 = 0u;
    xmmword_269242110 = 0u;
    unk_269242120 = 0u;
    xmmword_2692420F0 = 0u;
    unk_269242100 = 0u;
    xmmword_2692420D0 = 0u;
    unk_2692420E0 = 0u;
    xmmword_2692420B0 = 0u;
    unk_2692420C0 = 0u;
    xmmword_269242090 = 0u;
    unk_2692420A0 = 0u;
    xmmword_269242070 = 0u;
    unk_269242080 = 0u;
    xmmword_269242050 = 0u;
    unk_269242060 = 0u;
    xmmword_269242030 = 0u;
    unk_269242040 = 0u;
    xmmword_269242010 = 0u;
    unk_269242020 = 0u;
    xmmword_269241FF0 = 0u;
    unk_269242000 = 0u;
    gpu::getGPUHardwareInfo(void)::info = 0u;
    *(_OWORD *)&qword_269241FE0 = 0u;
    __cxa_atexit((void (*)(void *))gpu::GPUHardwareInfo::~GPUHardwareInfo, &gpu::getGPUHardwareInfo(void)::info, &dword_247227000);
  }
  if (gpu::getGPUHardwareInfo(void)::token != -1) {
    dispatch_once(&gpu::getGPUHardwareInfo(void)::token, &__block_literal_global);
  }
  return &gpu::getGPUHardwareInfo(void)::info;
}

void ___ZN3gpu18getGPUHardwareInfoEv_block_invoke()
{
  id v0 = objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  v20[0] = MTLCreateSystemDefaultDevice();
  NS::SharedPtr<MTL::Buffer>::operator=((void **)&gpu::getGPUHardwareInfo(void)::info, v20);
  if (v20[0]) {

  }
  v20[0] = objc_msgSend((id)gpu::getGPUHardwareInfo(void)::info, sel_newCommandQueue);
  NS::SharedPtr<MTL::Buffer>::operator=((void **)&gpu::getGPUHardwareInfo(void)::info + 1, v20);
  if (v20[0]) {

  }
  id v1 = objc_msgSend(NSString, sel_stringWithCString_encoding_, "com.apple.vectornumerics.AccelerateGPU", 1);
  id v2 = objc_msgSend(MEMORY[0x263F086E0], sel_bundleWithIdentifier_, v1);
  id v3 = objc_msgSend(NSString, sel_stringWithCString_encoding_, "GPUBLAS", 1);
  id v4 = objc_msgSend(objc_msgSend(v2, sel_pathForResource_ofType_, v3, objc_msgSend(NSString, sel_stringWithCString_encoding_, "metallib", 1)), sel_stringByResolvingSymlinksInPath);
  id v5 = objc_msgSend(NSURL, sel_URLWithString_, v4);
  uint64_t v65 = 0;
  id v6 = objc_msgSend((id)gpu::getGPUHardwareInfo(void)::info, sel_newLibraryWithURL_error_, v5, &v65);
  if (!v6)
  {
    byte_269242150 = 0;
    if (!v0) {
      return;
    }
    goto LABEL_38;
  }
  std::string::basic_string[abi:ne180100]<0>(v20, "saxpby");
  std::string::basic_string[abi:ne180100]<0>(v21, "saxpy");
  std::string::basic_string[abi:ne180100]<0>(v22, "scopy");
  std::string::basic_string[abi:ne180100]<0>(v23, "sscal");
  std::string::basic_string[abi:ne180100]<0>(v24, "sset");
  std::string::basic_string[abi:ne180100]<0>(v25, "srot");
  std::string::basic_string[abi:ne180100]<0>(v26, "srotm_lt0");
  std::string::basic_string[abi:ne180100]<0>(v27, "srotm_eq0");
  std::string::basic_string[abi:ne180100]<0>(v28, "srotm_general");
  std::string::basic_string[abi:ne180100]<0>(v29, "sgemmNN_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v30, "sgemmNN_32x128_edge");
  std::string::basic_string[abi:ne180100]<0>(v31, "sgemmNT_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v32, "sgemmNT_32x128_edge");
  std::string::basic_string[abi:ne180100]<0>(v33, "sgemmTN_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v34, "sgemmTN_32x128_edge");
  std::string::basic_string[abi:ne180100]<0>(v35, "sgemmTT_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v36, "sgemmTT_32x128_edge");
  std::string::basic_string[abi:ne180100]<0>(v37, "ssyrkUN_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v38, "ssyrkUN_32x128_edge");
  std::string::basic_string[abi:ne180100]<0>(v39, "ssyrkUT_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v40, "ssyrkUT_32x128_edge");
  std::string::basic_string[abi:ne180100]<0>(v41, "ssyrkLN_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v42, "ssyrkLN_32x128_edge");
  std::string::basic_string[abi:ne180100]<0>(v43, "ssyrkLT_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v44, "ssyrkLT_32x128_edge");
  std::string::basic_string[abi:ne180100]<0>(v45, "ssyr2kUN_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v46, "ssyr2kUN_32x128_edge");
  std::string::basic_string[abi:ne180100]<0>(v47, "ssyr2kUT_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v48, "ssyr2kUT_32x128_edge");
  std::string::basic_string[abi:ne180100]<0>(v49, "ssyr2kLN_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v50, "ssyr2kLN_32x128_edge");
  std::string::basic_string[abi:ne180100]<0>(v51, "ssyr2kLT_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v52, "ssyr2kLT_32x128_edge");
  std::string::basic_string[abi:ne180100]<0>(v53, "ssymmLU_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v54, "ssymmLL_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v55, "ssymmRU_128x32_main");
  std::string::basic_string[abi:ne180100]<0>(v56, "ssymmRL_128x32_main");
  std::string::basic_string[abi:ne180100]<0>(v57, "strmmLU_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v58, "strmmLL_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v59, "strmmRU_128x32_main");
  std::string::basic_string[abi:ne180100]<0>(v60, "strmmRL_128x32_main");
  std::string::basic_string[abi:ne180100]<0>(v61, "strsmLU_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v62, "strsmLL_32x128_main");
  std::string::basic_string[abi:ne180100]<0>(v63, "strsmRU_128x32_main");
  std::string::basic_string[abi:ne180100]<0>(v64, "strsmRL_128x32_main");
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  long long v9 = NSString;
  while (1)
  {
    id v10 = (std::string *)&v20[v7];
    if (SHIBYTE(v20[v7 + 2]) < 0) {
      std::string::__init_copy_ctor_external(&v19, v10->__r_.__value_.__l.__data_, v10->__r_.__value_.__l.__size_);
    }
    else {
      std::string v19 = *v10;
    }
    uint64_t v11 = (v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &v19
        : (std::string *)v19.__r_.__value_.__r.__words[0];
    id v12 = objc_msgSend(v6, sel_newFunctionWithName_, objc_msgSend(v9, sel_stringWithCString_encoding_, v11, 1));
    if (v12)
    {
      id v18 = 0;
      id v17 = objc_msgSend((id)gpu::getGPUHardwareInfo(void)::info, sel_newComputePipelineStateWithFunction_error_, v12, &v18);
      NS::SharedPtr<MTL::Buffer>::operator=((void **)&gpu::getGPUHardwareInfo(void)::info + v8 + 2, &v17);
      if (v17) {

      }
      if (*((void *)&gpu::getGPUHardwareInfo(void)::info + v8 + 2))
      {
        int v13 = 0;
        ++v8;
      }
      else
      {
        puts("\n compilation failed: ");
        printf("\n %s", (const char *)objc_msgSend(objc_msgSend(v18, sel_localizedDescription), sel_cStringUsingEncoding_, 1));
        byte_269242150 = 0;
        int v13 = 1;
      }
    }
    else
    {
      puts("\n *** compilation failed *** ");
      byte_269242150 = 0;
      int v13 = 1;
    }
    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v19.__r_.__value_.__l.__data_);
    }
    if (v13) {
      break;
    }
    v7 += 3;
    if (v7 == 135)
    {
      v19.__r_.__value_.__r.__words[0] = (std::string::size_type)objc_msgSend((id)gpu::getGPUHardwareInfo(void)::info, sel_newSharedEvent);
      NS::SharedPtr<MTL::Buffer>::operator=((void **)&qword_269242148, (void **)&v19.__r_.__value_.__l.__data_);
      if (v19.__r_.__value_.__r.__words[0]) {

      }
      long long v14 = (void *)gpu::getGPUHardwareInfo(void)::info;
      if ((objc_msgSend((id)gpu::getGPUHardwareInfo(void)::info, sel_respondsToSelector_, sel_debugDescription) & 1) != 0|| objc_msgSend(v14, sel_methodSignatureForSelector_, sel_debugDescription))
      {
        id v15 = objc_msgSend(v14, sel_debugDescription);
      }
      else
      {
        id v15 = 0;
      }
      byte_269242150 = objc_msgSend(v15, sel_rangeOfString_options_, objc_msgSend(NSString, sel_stringWithCString_encoding_, "Apple", 1), 1) != (id)0x7FFFFFFFFFFFFFFFLL;
      qword_269242158 = (uint64_t)objc_msgSend((id)gpu::getGPUHardwareInfo(void)::info, sel_maxThreadgroupMemoryLength);
      qword_269242160 = (uint64_t)objc_msgSend((id)qword_269241FE0, sel_threadExecutionWidth);
      break;
    }
  }
  uint64_t v16 = 135;
  do
  {
    if (SHIBYTE(v20[v16 - 1]) < 0) {
      operator delete(*(void **)((char *)&v19.__r_.__value_.__l.__data_ + v16 * 8));
    }
    v16 -= 3;
  }
  while (v16 * 8);

  if (v0) {
LABEL_38:
  }
}

void sub_24723953C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, id a12, id a13, uint64_t a14, id __p, uint64_t a16, int a17, __int16 a18, char a19, char a20,id a21)
{
  uint64_t v22 = 1080;
  while (1)
  {
    if (*((char *)&a21 + v22 - 1) < 0) {
      operator delete(*(id *)((char *)&a21 + v22 - 24));
    }
    v22 -= 24;
    if (!v22)
    {

      if (a11) {
      _Unwind_Resume(a1);
      }
    }
  }
}

id gpu::batchSetup(gpu *this)
{
  gpu::getGPUHardwareInfo(this);
  id v1 = (void *)*((void *)&gpu::getGPUHardwareInfo(void)::info + 1);

  return objc_msgSend(v1, sel_commandBuffer);
}

void gpu::launch(void *a1)
{
  id v2 = (gpu *)objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  gpu::getGPUHardwareInfo(v2);
  gpu::getGPUHardwareInfo((gpu *)objc_msgSend((id)qword_269242148, sel_setSignaledValue_, 0));
  id v3 = (gpu *)objc_msgSend((id)qword_269242148, sel_signaledValue);
  gpu::getGPUHardwareInfo(v3);
  id v3 = (gpu *)((char *)v3 + 1);
  objc_msgSend(a1, sel_encodeSignalEvent_value_, qword_269242148, v3);
  gpu::getGPUHardwareInfo((gpu *)objc_msgSend(a1, sel_commitAndWaitUntilSubmitted));
  objc_msgSend((id)qword_269242148, sel_waitUntilSignaledValue_timeoutMS_, v3, 0xFFFFFFFFLL);
  if (v2) {
}
  }

void sub_2472397B8(_Unwind_Exception *exception_object)
{
  if (v1) {

  }
  _Unwind_Resume(exception_object);
}

id gpu::allocDeviceBuffer@<X0>(gpu *this@<X0>, const void *a2@<X1>, void *a3@<X8>)
{
  gpu::getGPUHardwareInfo(this);
  id result = objc_msgSend((id)gpu::getGPUHardwareInfo(void)::info, sel_newBufferWithBytesNoCopy_length_options_deallocator_, this, a2, 0x100000, 0);
  *a3 = result;
  return result;
}

id gpu::allocGPUOnlyBuffer@<X0>(gpu *this@<X0>, void *a2@<X8>)
{
  gpu::getGPUHardwareInfo(this);
  id result = objc_msgSend((id)gpu::getGPUHardwareInfo(void)::info, sel_newBufferWithLength_options_, this, 32);
  *a2 = result;
  return result;
}

id gpu::launchSize1D@<X0>(void *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id result = objc_msgSend(a1, sel_maxTotalThreadsPerThreadgroup);
  *(void *)a3 = a2;
  int64x2_t v6 = vdupq_n_s64(1uLL);
  if ((unint64_t)result >= a2) {
    unint64_t v7 = a2;
  }
  else {
    unint64_t v7 = (unint64_t)result;
  }
  *(int64x2_t *)(a3 + 8) = v6;
  *(void *)(a3 + 24) = v7;
  *(int64x2_t *)(a3 + 32) = v6;
  return result;
}

double gpu::launchSizeGEMM_32x128@<D0>(gpu *this@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v4 = (uint64_t)this + 31;
  if (!a3) {
    uint64_t v4 = (uint64_t)this;
  }
  uint64_t v5 = a2 + 127;
  if (!a3) {
    uint64_t v5 = a2;
  }
  *(void *)a4 = 16 * (v4 / 32);
  *(void *)(a4 + 8) = 8 * (v5 / 128);
  *(void *)&double result = 1;
  *(_OWORD *)(a4 + 16) = xmmword_24723D3C0;
  *(_OWORD *)(a4 + 32) = xmmword_24723D3D0;
  return result;
}

double gpu::launchSizeGEMM_128x32@<D0>(gpu *this@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v4 = (uint64_t)this + 127;
  if (!a3) {
    uint64_t v4 = (uint64_t)this;
  }
  uint64_t v5 = a2 + 31;
  if (!a3) {
    uint64_t v5 = a2;
  }
  *(void *)a4 = 16 * (v4 / 128);
  *(void *)(a4 + 8) = 8 * (v5 / 32);
  *(void *)&double result = 1;
  *(_OWORD *)(a4 + 16) = xmmword_24723D3C0;
  *(_OWORD *)(a4 + 32) = xmmword_24723D3D0;
  return result;
}

uint64_t apple_gpu_is_supported(gpu *a1)
{
  return byte_269242150;
}

void gpu::GPUHardwareInfo::~GPUHardwareInfo(gpu::GPUHardwareInfo *this)
{
  id v2 = (void *)*((void *)this + 47);
  if (v2) {

  }
  for (uint64_t i = 368; i != 8; i -= 8)
  {
    uint64_t v4 = *(void **)((char *)this + i);
    if (v4) {
  }
    }
  uint64_t v5 = (void *)*((void *)this + 1);
  if (v5) {

  }
  if (*(void *)this) {
}
  }

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    int64x2_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    int64x2_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26520A050, MEMORY[0x263F8C060]);
}

void sub_247239B24(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  size_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    size_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

uint64_t std::__function::__value_func<void ()(MTL::Device *,NS::String *)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

{
  void *v3;
  uint64_t v4;

  uint64_t v3 = (void *)(a2 + 24);
  size_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }
  gpu *v3 = 0;
  return a1;
}

void *std::__function::__value_func<void ()(MTL::Device *,NS::String *)>::~__value_func[abi:ne180100](void *a1)
{
  id v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x24C54E460);
}

BOOL gpu_strsm(gpu *a1, int a2, char a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9, uint64_t a10, uint64_t a11)
{
  int v19 = (int)a1;
  if (!a1)
  {
    if (a5 > 127 || a6 > 31)
    {
      GPUHardwareInfo = gpu::getGPUHardwareInfo(a1);
      id v21 = (uint64_t *)(GPUHardwareInfo + 23);
      if (a2) {
        id v21 = (uint64_t *)GPUHardwareInfo + 45;
      }
      uint64_t v22 = a6;
      goto LABEL_13;
    }
    return 0;
  }
  if (a5 <= 31 && a6 <= 127) {
    return 0;
  }
  id v20 = gpu::getGPUHardwareInfo(a1);
  id v21 = (uint64_t *)(v20 + 22);
  if (a2) {
    id v21 = (uint64_t *)v20 + 43;
  }
  uint64_t v22 = a5;
LABEL_13:
  uint64_t v25 = *v21;
  gpu::hostToDevicePointers<float const*,float *,unsigned long,unsigned long>(a7, a10, (const void *)(4 * a8 * v22), (const void *)(4 * a6 * a11), (uint64_t)v45);
  BOOL v23 = v45[0] != 0;
  if (v45[0])
  {
    if (v19)
    {
      *(void *)&long long v39 = a5;
      *((void *)&v39 + 1) = a6;
      char v40 = a3;
      char v41 = a4;
      float v42 = a9;
      uint64_t v43 = a8;
      uint64_t v44 = a11;
      std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v37, &v46);
      gpu::launchSizeGEMM_32x128((gpu *)0x20, a6, 1, (uint64_t)v36);
      gpu::launchWithByteArgs<std::tuple<long,long,BOOL,BOOL,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(v25, &v39, &v37, v36);
      if (v38) {

      }
      if (v37) {
    }
      }
    else
    {
      *(void *)&long long v30 = a5;
      *((void *)&v30 + 1) = a6;
      char v31 = a3;
      char v32 = a4;
      float v33 = a9;
      uint64_t v34 = a8;
      uint64_t v35 = a11;
      std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v28, &v46);
      gpu::launchSizeGEMM_128x32((gpu *)a5, 32, 1, (uint64_t)v27);
      gpu::launchWithByteArgs<std::tuple<long,long,BOOL,BOOL,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(v25, &v30, &v28, v27);
      if (v29) {

      }
      if (v28) {
    }
      }
  }
  if (v47) {

  }
  if (v46) {
  return v23;
  }
}

void sub_24723A030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~tuple((uint64_t)va);
  std::pair<BOOL,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>::~pair(v7 - 128);
  _Unwind_Resume(a1);
}

void gpu::launchWithByteArgs<std::tuple<long,long,BOOL,BOOL,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>>(uint64_t a1, long long *a2, id *a3, long long *a4)
{
  long long v11 = *a2;
  long long v12 = a2[1];
  uint64_t v13 = *((void *)a2 + 4);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(v14, a3);
  long long v5 = a4[1];
  long long v15 = *a4;
  long long v16 = v5;
  long long v7 = *a4;
  long long v6 = a4[1];
  long long v17 = a4[2];
  uint64_t v18 = a1;
  long long v19 = v11;
  long long v20 = v12;
  uint64_t v21 = v13;
  long long v8 = a4[2];
  long long v24 = v6;
  long long v25 = v8;
  long long v9 = *(_OWORD *)v14;
  v14[0] = 0;
  v14[1] = 0;
  *(_OWORD *)uint64_t v22 = v9;
  long long v23 = v7;
  gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,BOOL,BOOL,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>((uint64_t)&v18);
  if (v22[1]) {

  }
  if (v22[0]) {
  if (v14[1])
  }

  if (v14[0]) {
}
  }

void sub_24723A138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
}

void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,BOOL,BOOL,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(uint64_t a1)
{
  id v2 = (gpu *)objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v3 = objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v2) + 1), sel_commandBuffer);
  long long v9 = &v10;
  id v10 = v3;
  std::__invoke[abi:ne180100]<void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,BOOL,BOOL,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,BOOL,BOOL,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,BOOL,BOOL,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1},std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,BOOL,BOOL,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&>(&v9, a1);
  long long v5 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v4) + 47), sel_setSignaledValue_, 0);
  long long v6 = (gpu *)objc_msgSend(*((id *)gpu::getGPUHardwareInfo(v5) + 47), sel_signaledValue);
  id v7 = v10;
  GPUHardwareInfo = gpu::getGPUHardwareInfo(v6);
  long long v6 = (gpu *)((char *)v6 + 1);
  objc_msgSend(v7, sel_encodeSignalEvent_value_, *((void *)GPUHardwareInfo + 47), v6);
  objc_msgSend(*((id *)gpu::getGPUHardwareInfo((gpu *)objc_msgSend(v10, sel_commitAndWaitUntilSubmitted)) + 47), sel_waitUntilSignaledValue_timeoutMS_, v6, 0xFFFFFFFFLL);
  if (v2) {
}
  }

void sub_24723A280(_Unwind_Exception *exception_object)
{
  if (v1) {

  }
  _Unwind_Resume(exception_object);
}

uint64_t std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,BOOL,BOOL,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>::~tuple(uint64_t a1)
{
  id v2 = *(void **)(a1 + 56);
  if (v2) {

  }
  id v3 = *(void **)(a1 + 48);
  if (v3) {

  }
  return a1;
}

void std::__invoke[abi:ne180100]<void gpu::launchWithByteArgs<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,BOOL,BOOL,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>(std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,BOOL,BOOL,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>)::{lambda(std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,BOOL,BOOL,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>)#1},std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,BOOL,BOOL,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>> const&>(void ***a1, uint64_t a2)
{
  uint64_t v6 = *(void *)a2;
  long long v7 = *(_OWORD *)(a2 + 8);
  long long v8 = *(_OWORD *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 40);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v10, (id *)(a2 + 48));
  long long v4 = *(_OWORD *)(a2 + 80);
  long long v12 = *(_OWORD *)(a2 + 64);
  long long v13 = v4;
  long long v14 = *(_OWORD *)(a2 + 96);
  long long v5 = **a1;
  v18[0] = v7;
  v18[1] = v8;
  uint64_t v19 = v9;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul>,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::__tuple_impl(&v16, &v10);
  v15[0] = v12;
  v15[1] = v13;
  _OWORD v15[2] = v14;
  gpu::encodeCommands<long,long,BOOL,BOOL,float,long,long,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(v5, v6, (uint64_t)v18, &v16, v15);
  if (v17) {

  }
  if (v16) {
  if (v11)
  }

  if (v10) {
}
  }

void sub_24723A3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>::~tuple(v9 - 96);
  std::tuple<std::tuple<MTL::ComputePipelineState *,std::tuple<long,long,BOOL,BOOL,float,long,long>,std::tuple<NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>,std::pair<MTL::Size,MTL::Size>>>::~tuple((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void gpu::encodeCommands<long,long,BOOL,BOOL,float,long,long,NS::SharedPtr<MTL::Buffer>,NS::SharedPtr<MTL::Buffer>>(void *a1, uint64_t a2, uint64_t a3, id *a4, long long *a5)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = objc_msgSend(objc_msgSend(MEMORY[0x263F086B0], sel_alloc), sel_init);
  id v11 = objc_msgSend(a1, sel_computeCommandEncoder);
  objc_msgSend(v11, sel_setComputePipelineState_, a2);
  uint64_t v12 = *(void *)(a3 + 8);
  char v13 = *(unsigned char *)(a3 + 16);
  char v14 = *(unsigned char *)(a3 + 17);
  int v15 = *(_DWORD *)(a3 + 20);
  id v16 = *(void **)(a3 + 24);
  uint64_t v17 = *(void *)(a3 + 32);
  *(void *)&long long v22 = *(void *)a3;
  char v26 = v13;
  char v25 = v14;
  int v24 = v15;
  id v28 = v16;
  v27[0] = v17;
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v22, 8, 0, v12);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v20, 8, 1);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v26, 1, 2);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v25, 1, 3);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v24, 4, 4);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, &v28, 8, 5);
  objc_msgSend(v11, sel_setBytes_length_atIndex_, v27, 8, 6);
  id v28 = 0;
  id v29 = 0;
  id v18 = *a4;
  id v19 = a4[1];
  id v28 = v18;
  id v29 = v19;
  v27[0] = 0;
  v27[1] = 0;
  if (v19) {

  }
  if (v18) {
  objc_msgSend(v11, sel_setBuffers_offsets_withRange_, &v28, v27, 7, 2);
  }
  long long v22 = *a5;
  uint64_t v23 = *((void *)a5 + 2);
  long long v20 = *(long long *)((char *)a5 + 24);
  uint64_t v21 = *((void *)a5 + 5);
  objc_msgSend(v11, sel_dispatchThreads_threadsPerThreadgroup_, &v22, &v20);
  objc_msgSend(v11, sel_endEncoding);
  if (v10) {
}
  }

void sub_24723A670(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t _get_cpu_capabilities()
{
  return MEMORY[0x270ED7FF8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}