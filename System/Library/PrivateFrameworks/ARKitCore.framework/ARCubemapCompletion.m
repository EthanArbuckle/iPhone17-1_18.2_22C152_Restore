@interface ARCubemapCompletion
+ (id)sharedInstance;
- (ARCubemapCompletion)init;
- (BOOL)generateHDROutput;
- (id).cxx_construct;
- (id)completeCubemap:(simd_float3)a3 cameraExposure:(simd_float3)a4 rotationWorldFromCube:(simd_float3)a5;
- (id)completeLatLongImage:(id)a3;
- (id)generateSeamSmoothingTexture;
- (id)grayCubemapOfSize:(unint64_t)a3;
- (id)toTexture:(id *)a3;
- (unsigned)srgbToLog:(unsigned __int8)a3;
- (vImage_Buffer)toVImageBuffer:(SEL)a3;
- (void)dealloc;
- (void)setGenerateHDROutput:(BOOL)a3;
@end

@implementation ARCubemapCompletion

+ (id)sharedInstance
{
  if (+[ARCubemapCompletion sharedInstance]::onceToken != -1) {
    dispatch_once(&+[ARCubemapCompletion sharedInstance]::onceToken, &__block_literal_global_89);
  }
  v2 = (void *)+[ARCubemapCompletion sharedInstance]::sharedInstance;
  return v2;
}

void __37__ARCubemapCompletion_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(ARCubemapCompletion);
  v1 = (void *)+[ARCubemapCompletion sharedInstance]::sharedInstance;
  +[ARCubemapCompletion sharedInstance]::sharedInstance = (uint64_t)v0;
}

- (ARCubemapCompletion)init
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  v113.receiver = self;
  v113.super_class = (Class)ARCubemapCompletion;
  v2 = [(ARCubemapCompletion *)&v113 init];
  if (!v2) {
    goto LABEL_37;
  }
  kdebug_trace();
  uint64_t v3 = objc_opt_new();
  v4 = (void *)*((void *)v2 + 15);
  *((void *)v2 + 15) = v3;

  uint64_t v5 = objc_opt_new();
  v6 = (void *)*((void *)v2 + 16);
  *((void *)v2 + 16) = v5;

  id v7 = MTLCreateSystemDefaultDevice();
  v8 = (void *)*((void *)v2 + 25);
  *((void *)v2 + 25) = v7;

  v2[224] = [*((id *)v2 + 25) supportsFamily:1004] ^ 1;
  uint64_t v9 = [v2 generateSeamSmoothingTexture];
  v10 = (void *)*((void *)v2 + 17);
  *((void *)v2 + 17) = v9;

  v108 = ARKitCoreBundle();
  if (v2[224]) {
    v11 = @"gan_model_pre_A11";
  }
  else {
    v11 = @"gan_model";
  }
  v109 = v11;
  v12 = _ARLogTechnique();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v2;
    __int16 v121 = 2112;
    v122 = v16;
    __int16 v123 = 2112;
    v124 = v109;
    _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@  model choice : %@", buf, 0x2Au);
  }
  v106 = [v108 pathForResource:v109 ofType:@"mlmodelc"];
  id v107 = [v106 stringByAppendingPathComponent:@"model.espresso.net"];
  uint64_t context = espresso_create_context();
  *((void *)v2 + 1) = context;
  v18 = (uint64_t *)(v2 + 8);
  if (context)
  {
    v19 = _ARLogTechnique();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v2;
      _os_log_impl(&dword_1B88A2000, v19, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Using ANE for Completion", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v22 = espresso_create_context();
    uint64_t *v18 = v22;
    if (!v22)
    {
      v45 = _ARLogGeneral();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = (objc_class *)objc_opt_class();
        v47 = NSStringFromClass(v46);
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v2;
        _os_log_impl(&dword_1B88A2000, v45, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Espresso context creation failed.", buf, 0x16u);
      }
      v42 = 0;
      goto LABEL_35;
    }
    v19 = _ARLogTechnique();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v2;
      _os_log_impl(&dword_1B88A2000, v19, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Using GPU for Completion", buf, 0x16u);
    }
  }

  if (espresso_context_set_low_precision_accumulation())
  {
    v25 = _ARLogTechnique();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v2;
      _os_log_impl(&dword_1B88A2000, v25, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Unable to set Espresso low precision accumulation.", buf, 0x16u);
    }
  }
  if (v2[224])
  {
    *((void *)v2 + 2) = espresso_create_plan();
    v28 = _ARLogTechnique();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v2;
      _os_log_impl(&dword_1B88A2000, v28, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Completion model espresso plan at low priority.", buf, 0x16u);
    }
  }
  else
  {
    *((void *)v2 + 2) = espresso_create_plan();
    v28 = _ARLogTechnique();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v32;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v2;
      _os_log_impl(&dword_1B88A2000, v28, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Completion model espresso plan at default priority.", buf, 0x16u);
    }
  }

  if (!*((void *)v2 + 2))
  {
    v36 = _ARLogGeneral();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v37);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v2;
      _os_log_impl(&dword_1B88A2000, v36, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Espresso plan creation failed.", buf, 0x16u);
    }
    espresso_context_destroy();
    goto LABEL_34;
  }
  [v107 UTF8String];
  if (espresso_plan_add_network())
  {
    v33 = _ARLogGeneral();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v34);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v2;
      _os_log_impl(&dword_1B88A2000, v33, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Adding plan to Espresso network failed.", buf, 0x16u);
    }
LABEL_33:

    espresso_context_destroy();
    espresso_plan_destroy();
    uint64_t *v18 = 0;
    *((void *)v2 + 2) = 0;
LABEL_34:
    v42 = v2;
LABEL_35:
    int v43 = 1;
    goto LABEL_36;
  }
  if (espresso_plan_build())
  {
    v33 = _ARLogGeneral();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v40 = (objc_class *)objc_opt_class();
      v41 = NSStringFromClass(v40);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v41;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v2;
      _os_log_impl(&dword_1B88A2000, v33, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Building Espresso plan failed.", buf, 0x16u);
    }
    goto LABEL_33;
  }
  *(int8x8_t *)v39.i8 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v2[224] == 0), 0x1FuLL)), (int8x8_t)0x3C008081BF800000, (int8x8_t)0x3B80808100000000);
  int32x4_t v48 = vzip1q_s32(v39, v39);
  v48.i32[2] = v39.i32[0];
  *(int32x4_t *)(v2 + 40) = v48;
  v2[56] = 1;
  espresso_network_query_blob_dimensions();
  uint64_t v49 = *(void *)&buf[8];
  *((void *)v2 + 23) = *(void *)buf;
  *((void *)v2 + 24) = v49;
  MEMORY[0x1BA9C6860](v2 + 88);
  size_t v50 = 3 * *((void *)v2 + 23) * *((void *)v2 + 24);
  v51 = (unint64_t *)(v2 + 64);
  std::vector<unsigned char>::reserve((unint64_t *)v2 + 8, v50);
  if (v50)
  {
    for (uint64_t i = 0; i != v50; ++i)
    {
      char v53 = arc4random_uniform(0xFFu);
      char v54 = v53;
      v56 = (unsigned char *)*((void *)v2 + 9);
      unint64_t v55 = *((void *)v2 + 10);
      if ((unint64_t)v56 >= v55)
      {
        unint64_t v58 = *v51;
        v59 = &v56[-*v51];
        unint64_t v60 = (unint64_t)(v59 + 1);
        if ((uint64_t)(v59 + 1) < 0) {
          std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v61 = v55 - v58;
        if (2 * v61 > v60) {
          unint64_t v60 = 2 * v61;
        }
        if (v61 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v62 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v62 = v60;
        }
        if (v62) {
          v63 = (char *)operator new(v62);
        }
        else {
          v63 = 0;
        }
        v64 = &v59[(void)v63];
        v65 = &v59[(void)v63];
        unsigned char *v65 = v54;
        v57 = v65 + 1;
        if (v56 != (unsigned char *)v58)
        {
          v66 = &v56[~v58];
          do
          {
            char v67 = *--v56;
            (v66--)[(void)v63] = v67;
          }
          while (v56 != (unsigned char *)v58);
          v56 = (unsigned char *)*v51;
          v64 = v63;
        }
        *((void *)v2 + 8) = v64;
        *((void *)v2 + 9) = v57;
        *((void *)v2 + 10) = &v63[v62];
        if (v56) {
          operator delete(v56);
        }
      }
      else
      {
        unsigned char *v56 = v53;
        v57 = v56 + 1;
      }
      *((void *)v2 + 9) = v57;
    }
  }
  if (v2[224])
  {
    v68 = (unint64_t *)(v2 + 232);
    std::vector<unsigned char>::reserve((unint64_t *)v2 + 29, 0x100uLL);
    for (int j = 0; j != 256; ++j)
    {
      char v70 = [v2 srgbToLog:j];
      char v71 = v70;
      v73 = (unsigned char *)*((void *)v2 + 30);
      unint64_t v72 = *((void *)v2 + 31);
      if ((unint64_t)v73 >= v72)
      {
        unint64_t v75 = *v68;
        v76 = &v73[-*v68];
        unint64_t v77 = (unint64_t)(v76 + 1);
        if ((uint64_t)(v76 + 1) < 0) {
          std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v78 = v72 - v75;
        if (2 * v78 > v77) {
          unint64_t v77 = 2 * v78;
        }
        if (v78 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v79 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v79 = v77;
        }
        if (v79) {
          v80 = (char *)operator new(v79);
        }
        else {
          v80 = 0;
        }
        v81 = &v76[(void)v80];
        v82 = &v76[(void)v80];
        unsigned char *v82 = v71;
        v74 = v82 + 1;
        if (v73 != (unsigned char *)v75)
        {
          v83 = &v73[~v75];
          do
          {
            char v84 = *--v73;
            (v83--)[(void)v80] = v84;
          }
          while (v73 != (unsigned char *)v75);
          v73 = (unsigned char *)*v68;
          v81 = v80;
        }
        *((void *)v2 + 29) = v81;
        *((void *)v2 + 30) = v74;
        *((void *)v2 + 31) = &v80[v79];
        if (v73) {
          operator delete(v73);
        }
      }
      else
      {
        unsigned char *v73 = v70;
        v74 = v73 + 1;
      }
      *((void *)v2 + 30) = v74;
    }
  }
  *((_DWORD *)v2 + 44) = 1063675494;
  *((void *)v2 + 19) = 0x3F747AE147AE147BLL;
  uint64_t v85 = [*((id *)v2 + 25) newCommandQueue];
  v86 = (void *)*((void *)v2 + 26);
  *((void *)v2 + 26) = v85;

  [*((id *)v2 + 26) setLabel:@"com.apple.arkit.cubemapcompletion.queue"];
  v2[60] = 1;
  if (espresso_plan_execute_sync())
  {
    v87 = _ARLogGeneral();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      v88 = (objc_class *)objc_opt_class();
      v89 = NSStringFromClass(v88);
      *(_DWORD *)v114 = 138543618;
      v115 = v89;
      __int16 v116 = 2048;
      v117 = v2;
      _os_log_impl(&dword_1B88A2000, v87, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Espresso warm-up failed...", v114, 0x16u);
    }
    espresso_context_destroy();
    espresso_plan_destroy();
    uint64_t *v18 = 0;
    *((void *)v2 + 2) = 0;
    v90 = v2;
    int v43 = 1;
    goto LABEL_98;
  }
  v91 = [v108 URLForResource:@"default" withExtension:@"metallib"];
  v92 = (void *)*((void *)v2 + 25);
  id v112 = 0;
  v93 = (void *)[v92 newLibraryWithURL:v91 error:&v112];
  id v94 = v112;
  [v93 setLabel:@"com.apple.arkit.cubemapcompletion.library"];
  if (!v93)
  {
    v99 = _ARLogGeneral();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      v100 = (objc_class *)objc_opt_class();
      v101 = NSStringFromClass(v100);
      *(_DWORD *)v114 = 138543874;
      v115 = v101;
      __int16 v116 = 2048;
      v117 = v2;
      __int16 v118 = 2112;
      id v119 = v94;
      _os_log_impl(&dword_1B88A2000, v99, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create MTLLibrary %@", v114, 0x20u);
    }
    goto LABEL_96;
  }
  v95 = (void *)*((void *)v2 + 25);
  if (v2[224])
  {
    v96 = (void *)[v93 newFunctionWithName:@"combine_buffers_to_hdr_pre_A11"];
    id v111 = v94;
    uint64_t v97 = [v95 newComputePipelineStateWithFunction:v96 error:&v111];
    id v98 = v111;
  }
  else
  {
    v96 = (void *)[v93 newFunctionWithName:@"combine_buffers_to_hdr"];
    id v110 = v94;
    uint64_t v97 = [v95 newComputePipelineStateWithFunction:v96 error:&v110];
    id v98 = v110;
  }
  v102 = (void *)*((void *)v2 + 27);
  *((void *)v2 + 27) = v97;
  id v94 = v98;

  if (!*((void *)v2 + 27))
  {
    v99 = _ARLogGeneral();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      v103 = (objc_class *)objc_opt_class();
      v104 = NSStringFromClass(v103);
      *(_DWORD *)v114 = 138543874;
      v115 = v104;
      __int16 v116 = 2048;
      v117 = v2;
      __int16 v118 = 2112;
      id v119 = v98;
      _os_log_impl(&dword_1B88A2000, v99, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create combine buffer to hdr pipeline state %@", v114, 0x20u);
    }
LABEL_96:

    v105 = v2;
    int v43 = 1;
    goto LABEL_97;
  }
  kdebug_trace();
  int v43 = 0;
LABEL_97:

LABEL_98:
  v42 = (ARCubemapCompletion *)v2;
LABEL_36:

  if (!v43) {
LABEL_37:
  }
    v42 = v2;

  return v42;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  free(self->_vImageBuffer.data);
  v3.receiver = self;
  v3.super_class = (Class)ARCubemapCompletion;
  [(ARCubemapCompletion *)&v3 dealloc];
}

- (unsigned)srgbToLog:(unsigned __int8)a3
{
  float v3 = powf((float)a3 / 255.0, 2.2);
  float v4 = (log10((float)(v3 / 0.18) + 1.0e-16) * 224.999985 + 445.0) / 1023.0;
  return (int)(float)(fmaxf(fminf(v4, 1.0), 0.0) * 255.0);
}

- (id)completeCubemap:(simd_float3)a3 cameraExposure:(simd_float3)a4 rotationWorldFromCube:(simd_float3)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a7;
  [v9 width];
  [v9 height];
  kdebug_trace();
  if (!*(unsigned char *)(a1 + 60))
  {
    v17 = objc_msgSend((id)a1, "grayCubemapOfSize:", objc_msgSend(v9, "width"));
    goto LABEL_14;
  }
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)(a1 + 256) = _D0;
  *(void *)(a1 + 264) = 1065353216;
  double v15 = *(double *)(a1 + 152);
  *(unsigned char *)(a1 + 144) = v15 > a2;
  if (v15 <= a2)
  {
    v16.columns[1] = a4;
    v16.columns[2] = a5;
    if (!*(unsigned char *)(a1 + 224))
    {
      int v18 = 128;
      goto LABEL_8;
    }
  }
  else
  {
    v16.columns[1] = a4;
    v16.columns[2] = a5;
    if (*(unsigned char *)(a1 + 224))
    {
      *(_DWORD *)(a1 + 268) = *(_DWORD *)(a1 + 192) / 2;
      *(int32x2_t *)(a1 + 256) = vdup_n_s32(0x3F7D70A4u);
      *(_DWORD *)(a1 + 264) = 1066192077;
    }
  }
  int v18 = 255;
LABEL_8:
  *(_DWORD *)(a1 + 160) = v18;
  v16.columns[0] = a3;
  v19 = *(void **)(a1 + 120);
  simd_float3x3 v36 = __invert_f3(v16);
  v20 = objc_msgSend(v19, "equirectangularTextureFromCubemapTexture:rotation:width:height:", v9, *(void *)(a1 + 184), *(void *)(a1 + 192), *(double *)v36.columns[0].i64, *(double *)v36.columns[1].i64, *(double *)v36.columns[2].i64);
  v21 = [(id)a1 completeLatLongImage:v20];
  if (v21)
  {
    uint64_t v22 = objc_msgSend(*(id *)(a1 + 120), "cubemapTextureFromEquirectangularTexture:rotation:size:", v21, objc_msgSend(v9, "height"), *(double *)a3.i64, *(double *)a4.i64, *(double *)a5.i64);
    v17 = objc_msgSend(*(id *)(a1 + 128), "blurCubemapTexture:roughness:rotation:", v22, *(void *)(a1 + 136), *(double *)a3.i64, *(double *)a4.i64, *(double *)a5.i64);
    [v17 width];
    [v17 height];
    kdebug_trace();
  }
  else
  {
    v23 = _ARLogGeneral();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      *(_DWORD *)buf = 138543618;
      v31 = v25;
      __int16 v32 = 2048;
      uint64_t v33 = a1;
      _os_log_impl(&dword_1B88A2000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not complete environment texture", buf, 0x16u);
    }
    v17 = objc_msgSend((id)a1, "grayCubemapOfSize:", objc_msgSend(v9, "width"));
  }

LABEL_14:
  return v17;
}

- (id)completeLatLongImage:(id)a3
{
  long long v22 = 0u;
  long long v23 = 0u;
  [(ARCubemapCompletion *)self toVImageBuffer:a3];
  long long v9 = v22;
  long long v10 = v23;
  if (espresso_network_bind_input_vimagebuffer_bgra8()
    || espresso_network_bind_buffer()
    || !self->_espresso_plan)
  {
    float v4 = 0;
  }
  else
  {
    kdebug_trace();
    int v6 = espresso_plan_execute_sync();
    float v4 = 0;
    if (!v6)
    {
      kdebug_trace();
      v7[8] = v19;
      v7[9] = v20;
      uint64_t v8 = v21;
      v7[4] = v15;
      v7[5] = v16;
      v7[6] = v17;
      v7[7] = v18;
      v7[0] = v11;
      v7[1] = v12;
      v7[2] = v13;
      v7[3] = v14;
      float v4 = [(ARCubemapCompletion *)self toTexture:v7];
    }
  }
  return v4;
}

- (vImage_Buffer)toVImageBuffer:(SEL)a3
{
  id v6 = a4;
  [v6 width];
  [v6 height];
  kdebug_trace();
  uint64_t v7 = [v6 width];
  uint64_t v8 = [v6 height];
  data = self->_vImageBuffer.data;
  size_t rowBytes = self->_vImageBuffer.rowBytes;
  memset(v33, 0, 24);
  v33[3] = v7;
  v33[4] = v8;
  v33[5] = 1;
  [v6 getBytes:data bytesPerRow:rowBytes fromRegion:v33 mipmapLevel:0];
  long long v13 = (char *)self->_vImageBuffer.data;
  size_t v14 = self->_vImageBuffer.rowBytes;
  begin = self->_randomNumbers.__begin_;
  *(void *)&self->_float g_avg = 0;
  self->_float r_avg = 0.0;
  if (v8)
  {
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    long long v18 = (unsigned __int8 *)(v13 + 1);
    do
    {
      long long v19 = v18;
      for (uint64_t i = v7; i; --i)
      {
        LOBYTE(v11) = v19[2];
        float v11 = (float)LODWORD(v11);
        LODWORD(v12) = 1132396544;
        float v21 = self->_alpha_threshold * 255.0;
        if (v21 < v11)
        {
          LOBYTE(v12) = *(v19 - 1);
          float g_avg = self->_g_avg;
          double v24 = (double)*(unint64_t *)&v12 / 255.0 + self->_r_avg;
          *(float *)&double v24 = v24;
          self->_float r_avg = *(float *)&v24;
          LOBYTE(v24) = *v19;
          double v25 = (double)*(unint64_t *)&v24 / 255.0 + g_avg;
          *(float *)&double v25 = v25;
          self->_float g_avg = *(float *)&v25;
          LOBYTE(v25) = v19[1];
          double v12 = (double)*(unint64_t *)&v25 / 255.0 + self->_b_avg;
          *(float *)&double v12 = v12;
          self->_float b_avg = *(float *)&v12;
          ++v17;
          LOBYTE(bias_mask) = self->_use_model_pre_A11;
          if (!(_BYTE)bias_mask) {
            goto LABEL_28;
          }
          *(v19 - 1) = self->_srgbToLogLUT_pre_A11.__begin_[*(v19 - 1)];
          unsigned __int8 *v19 = self->_srgbToLogLUT_pre_A11.__begin_[*v19];
          LOBYTE(v22) = self->_srgbToLogLUT_pre_A11.__begin_[v19[1]];
        }
        else if (self->_use_model_pre_A11)
        {
          LOBYTE(v12) = *begin;
          *(float *)&double v12 = (float)LODWORD(v12);
          if (v16 < self->_bias_height_pre_A11)
          {
            *(float *)&double v12 = self->_r_bias_pre_A11 * *(float *)&v12;
            if (*(float *)&v12 > 250.0) {
              *(float *)&double v12 = 250.0;
            }
          }
          *(v19 - 1) = (int)*(float *)&v12;
          LOBYTE(v12) = begin[1];
          *(float *)&double v12 = (float)LODWORD(v12);
          if (v16 < self->_bias_height_pre_A11)
          {
            *(float *)&double v12 = self->_g_bias_pre_A11 * *(float *)&v12;
            if (*(float *)&v12 > 250.0) {
              *(float *)&double v12 = 250.0;
            }
          }
          unsigned __int8 *v19 = (int)*(float *)&v12;
          LOBYTE(v12) = begin[2];
          *(float *)&double v12 = (float)LODWORD(v12);
          if (v16 < self->_bias_height_pre_A11)
          {
            *(float *)&double v12 = self->_b_bias_pre_A11 * *(float *)&v12;
            if (*(float *)&v12 > 250.0) {
              *(float *)&double v12 = 250.0;
            }
          }
          begin += 3;
          int v22 = (int)*(float *)&v12;
        }
        else
        {
          *(v19 - 1) = *begin;
          unsigned __int8 *v19 = begin[1];
          LOBYTE(v22) = begin[2];
          begin += 3;
        }
        v19[1] = v22;
        if (self->_use_model_pre_A11 && v16 < self->_bias_height_pre_A11)
        {
          if (v21 >= v11)
          {
            if (self->_outdoorScene) {
              LOBYTE(bias_mask) = -16;
            }
            else {
              LOBYTE(bias_mask) = -1;
            }
            goto LABEL_28;
          }
LABEL_27:
          LOBYTE(bias_mask) = 0;
          goto LABEL_28;
        }
        if (v21 < v11) {
          goto LABEL_27;
        }
        int bias_mask = self->_bias_mask;
LABEL_28:
        v19[2] = bias_mask;
        v19 += 4;
      }
      ++v16;
      v18 += v14;
    }
    while (v16 != v8);
    float r_avg = self->_r_avg;
    float v28 = self->_g_avg;
    float b_avg = self->_b_avg;
  }
  else
  {
    unint64_t v17 = 0;
    float b_avg = 0.0;
    float v28 = 0.0;
    float r_avg = 0.0;
  }
  float v30 = (float)v17;
  self->_float r_avg = powf(r_avg / (float)v17, 2.2);
  self->_float g_avg = powf(v28 / v30, 2.2);
  self->_float b_avg = powf(b_avg / v30, 2.2);
  kdebug_trace();
  long long v31 = *(_OWORD *)&self->_vImageBuffer.width;
  *(_OWORD *)&retstr->data = *(_OWORD *)&self->_vImageBuffer.data;
  *(_OWORD *)&retstr->width = v31;

  return result;
}

- (id)toTexture:(id *)a3
{
  kdebug_trace();
  unint64_t var4 = a3->var4;
  var0 = (float *)a3->var0;
  unint64_t var11 = a3->var11;
  v45 = (float *)a3->var0;
  v46 = a3;
  unint64_t var5 = a3->var5;
  unint64_t v50 = 4 * a3->var10;
  unint64_t v8 = 4 * a3->var9;
  unint64_t v48 = var4;
  if (var5)
  {
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    size_t rowBytes = self->_vImageBuffer.rowBytes;
    float v11 = 0.0;
    float v12 = 0.0;
    long long v13 = self;
    data = self->_vImageBuffer.data;
    float v15 = 0.0;
    do
    {
      uint64_t v51 = v10;
      if (var4)
      {
        uint64_t v16 = var0;
        uint64_t v17 = 3;
        do
        {
          if (!data[v17])
          {
            float v18 = *v16;
            if (v13->_use_model_pre_A11)
            {
              float v11 = v11 + __exp10((float)((float)(v18 * 1023.0) + -445.0) * 0.00444444456) * 0.180000007;
              float v12 = v12 + __exp10((float)((float)(v16[var11] * 1023.0) + -445.0) * 0.00444444456) * 0.180000007;
              float v15 = v15 + __exp10((float)((float)(v16[2 * var11] * 1023.0) + -445.0) * 0.00444444456) * 0.180000007;
            }
            else
            {
              float v11 = v11 + (float)(__exp10f(v18 + 1.0) + -1.0);
              float v12 = v12 + (float)(__exp10f(v16[var11] + 1.0) + -1.0);
              float v15 = v15 + (float)(__exp10f(v16[2 * var11] + 1.0) + -1.0);
            }
            ++v9;
          }
          uint64_t v16 = (float *)((char *)v16 + v8);
          v17 += 4;
          --var4;
        }
        while (var4);
      }
      unint64_t var4 = v48;
      data += rowBytes;
      uint64_t v10 = v51 + 1;
      var0 = (float *)((char *)var0 + v50);
    }
    while (v51 + 1 != var5);
  }
  else
  {
    long long v13 = self;
    unint64_t v9 = 0;
    float v15 = 0.0;
    float v12 = 0.0;
    float v11 = 0.0;
  }
  long long v19 = v13;
  float v20 = (float)((float)((float)(v13->_g_avg * 0.7152) + (float)(v13->_r_avg * 0.2126)) + (float)(v13->_b_avg * 0.0722))
      / (float)((float)((float)((float)(v12 / (float)v9) * 0.7152) + (float)((float)(v11 / (float)v9) * 0.2126))
              + (float)((float)(v15 / (float)v9) * 0.0722));
  v59[0] = v20;
  float v21 = v45;
  if (v13->_outdoorScene && var5)
  {
    unint64_t v22 = 0;
    float v23 = 0.05 / v20;
    do
    {
      if (var4)
      {
        unint64_t v24 = 0;
        float v25 = (double)v22 * 3.14159265 / (double)var5;
        float v26 = (float)(v25 + -0.7854) * (float)(v25 + -0.7854);
        v27 = v21;
        do
        {
          float v28 = (float)(1.0 - (float)((float)v24 / (float)var4)) * 6.28318531;
          float v29 = v26 + (float)((float)(v28 + -1.5708) * (float)(v28 + -1.5708));
          if (v29 < 0.017453)
          {
            float v30 = 1.0 - expf((float)(0.017453 - v29) / -0.017453);
            float *v27 = (float)((float)(1.0 - v30) * *v27) + (float)(v23 * v30);
            v27[var11] = (float)((float)(1.0 - v30) * v27[var11]) + (float)(v23 * v30);
            v27[2 * var11] = (float)((float)(1.0 - v30) * v27[2 * var11]) + (float)(v23 * v30);
          }
          ++v24;
          v27 = (float *)((char *)v27 + v8);
        }
        while (var4 != v24);
      }
      ++v22;
      float v21 = (float *)((char *)v21 + v50);
    }
    while (v22 != var5);
  }
  if (v19->_generateHDROutput)
  {
    +[ARKitUserDefaults floatForKey:@"com.apple.arkit.environmentTexturing.maxHDR"];
    BOOL generateHDROutput = v19->_generateHDROutput;
    int v58 = v32;
    uint64_t v33 = v46;
    if (generateHDROutput)
    {
      uint64_t v34 = 115;
      goto LABEL_28;
    }
  }
  else
  {
    int v58 = 1065353216;
    uint64_t v33 = v46;
  }
  uint64_t v34 = 81;
LABEL_28:
  v52 = [(MTLCommandQueue *)v19->_queue commandBuffer];
  v35 = [v52 computeCommandEncoder];
  simd_float3x3 v36 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:55 width:v48 height:var5 mipmapped:0];
  [v36 setUsage:7];
  v37 = (void *)[(MTLDevice *)v19->_device newTextureWithDescriptor:v36];
  v38 = (void *)[(MTLDevice *)v19->_device newTextureWithDescriptor:v36];
  int32x4_t v39 = (void *)[(MTLDevice *)v19->_device newTextureWithDescriptor:v36];
  [v37 setLabel:@"com.apple.arkit.cubemapcompletion.rplane"];
  [v38 setLabel:@"com.apple.arkit.cubemapcompletion.gplane"];
  [v39 setLabel:@"com.apple.arkit.cubemapcompletion.plane"];
  v40 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:v34 width:v48 height:var5 mipmapped:0];

  [v40 setUsage:7];
  v41 = (void *)[(MTLDevice *)v19->_device newTextureWithDescriptor:v40];
  [v41 setLabel:@"com.apple.arkit.cubemapcompletion.dst"];
  memset(v57, 0, 24);
  v57[3] = v48;
  v57[4] = var5;
  v57[5] = 1;
  [v37 replaceRegion:v57 mipmapLevel:0 withBytes:v33->var0 bytesPerRow:v33->var3[0]];
  memset(v56, 0, 24);
  v56[3] = v48;
  v56[4] = var5;
  v56[5] = 1;
  [v38 replaceRegion:v56 mipmapLevel:0 withBytes:(char *)v33->var0 + 4 * v33->var11 bytesPerRow:v33->var3[0]];
  memset(v55, 0, 24);
  v55[3] = v48;
  v55[4] = var5;
  v55[5] = 1;
  [v39 replaceRegion:v55 mipmapLevel:0 withBytes:(char *)v33->var0 + 8 * v33->var11 bytesPerRow:v33->var3[0]];
  [v35 setComputePipelineState:v19->_combineBuffersToHDR];
  [v35 setTexture:v37 atIndex:0];
  [v35 setTexture:v38 atIndex:1];
  [v35 setTexture:v39 atIndex:2];
  [v35 setTexture:v41 atIndex:3];
  [v35 setBytes:&v58 length:4 atIndex:0];
  [v35 setBytes:v59 length:4 atIndex:1];
  [v35 setBytes:v59 length:4 atIndex:2];
  [v35 setBytes:v59 length:4 atIndex:3];
  unint64_t v42 = [(MTLComputePipelineState *)v19->_combineBuffersToHDR threadExecutionWidth];
  unint64_t v43 = [(MTLComputePipelineState *)v19->_combineBuffersToHDR maxTotalThreadsPerThreadgroup];
  v54[0] = (v42 + [v41 width] - 1) / v42;
  v54[1] = (v43 / v42 + [v41 height] - 1) / (v43 / v42);
  v54[2] = 1;
  v53[0] = v42;
  v53[1] = v43 / v42;
  v53[2] = 1;
  [v35 dispatchThreadgroups:v54 threadsPerThreadgroup:v53];
  [v35 endEncoding];
  [v52 commit];
  [v52 waitUntilCompleted];
  [v41 width];
  [v41 height];
  kdebug_trace();

  return v41;
}

- (id)grayCubemapOfSize:(unint64_t)a3
{
  unint64_t v5 = 4 * a3;
  size_t v6 = 4 * a3 * a3;
  std::vector<unsigned char>::vector(__p, v6);
  if (a3)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      unint64_t v9 = a3;
      uint64_t v10 = v7;
      do
      {
        *((unsigned char *)__p[0] + v10) = 127;
        *((unsigned char *)__p[0] + v10 + 1) = 127;
        *((unsigned char *)__p[0] + v10 + 2) = 127;
        *((unsigned char *)__p[0] + v10 + 3) = -1;
        v10 += 4;
        --v9;
      }
      while (v9);
      ++v8;
      v7 += v5;
    }
    while (v8 != a3);
  }
  float v11 = [MEMORY[0x1E4F35330] textureCubeDescriptorWithPixelFormat:81 size:a3 mipmapped:0];
  [v11 setUsage:5];
  float v12 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v11];
  for (uint64_t i = 0; i != 6; ++i)
  {
    memset(v15, 0, 24);
    v15[3] = (void *)a3;
    v15[4] = (void *)a3;
    v15[5] = (void *)1;
    [v12 replaceRegion:v15 mipmapLevel:0 slice:i withBytes:__p[0] bytesPerRow:v5 bytesPerImage:v6];
  }

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v12;
}

- (id)generateSeamSmoothingTexture
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  float v3 = [MEMORY[0x1E4F35330] textureCubeDescriptorWithPixelFormat:10 size:8 mipmapped:0];
  float v4 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v3];
  [v4 setLabel:@"com.apple.arkit.cubemapcompletion.roughnesstexture"];
  v27[0] = xmmword_1B8A56524;
  v27[1] = unk_1B8A56534;
  v27[2] = xmmword_1B8A56544;
  v27[3] = unk_1B8A56554;
  memset(v21, 0, sizeof(v21));
  int64x2_t v22 = vdupq_n_s64(8uLL);
  uint64_t v23 = 1;
  [v4 replaceRegion:v21 mipmapLevel:0 slice:0 withBytes:v27 bytesPerRow:8 bytesPerImage:64];
  v26[0] = xmmword_1B8A56564;
  v26[1] = unk_1B8A56574;
  v26[2] = xmmword_1B8A56584;
  v26[3] = unk_1B8A56594;
  memset(v18, 0, sizeof(v18));
  int64x2_t v19 = vdupq_n_s64(8uLL);
  uint64_t v20 = 1;
  [v4 replaceRegion:v18 mipmapLevel:0 slice:2 withBytes:v26 bytesPerRow:8 bytesPerImage:64];
  v25[0] = xmmword_1B8A56564;
  v25[1] = unk_1B8A56574;
  v25[2] = xmmword_1B8A56584;
  v25[3] = unk_1B8A56594;
  memset(v15, 0, sizeof(v15));
  int64x2_t v16 = vdupq_n_s64(8uLL);
  uint64_t v17 = 1;
  [v4 replaceRegion:v15 mipmapLevel:0 slice:3 withBytes:v25 bytesPerRow:8 bytesPerImage:64];
  memset(v24, 0, sizeof(v24));
  memset(v12, 0, sizeof(v12));
  int64x2_t v13 = vdupq_n_s64(8uLL);
  uint64_t v14 = 1;
  [v4 replaceRegion:v12 mipmapLevel:0 slice:1 withBytes:v24 bytesPerRow:8 bytesPerImage:64];
  memset(v9, 0, sizeof(v9));
  int64x2_t v10 = vdupq_n_s64(8uLL);
  uint64_t v11 = 1;
  [v4 replaceRegion:v9 mipmapLevel:0 slice:4 withBytes:v24 bytesPerRow:8 bytesPerImage:64];
  memset(v6, 0, sizeof(v6));
  int64x2_t v7 = vdupq_n_s64(8uLL);
  uint64_t v8 = 1;
  [v4 replaceRegion:v6 mipmapLevel:0 slice:5 withBytes:v24 bytesPerRow:8 bytesPerImage:64];

  return v4;
}

- (BOOL)generateHDROutput
{
  return self->_generateHDROutput;
}

- (void)setGenerateHDROutput:(BOOL)a3
{
  self->_BOOL generateHDROutput = a3;
}

- (void).cxx_destruct
{
  begin = self->_srgbToLogLUT_pre_A11.__begin_;
  if (begin)
  {
    self->_srgbToLogLUT_pre_A11.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_combineBuffersToHDR, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_roughness, 0);
  objc_storeStrong((id *)&self->_sphericalBlur, 0);
  objc_storeStrong((id *)&self->_cubemapConverter, 0);
  float v4 = self->_randomNumbers.__begin_;
  if (v4)
  {
    self->_randomNumbers.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 30) = 0;
  *((void *)self + 31) = 0;
  *((void *)self + 29) = 0;
  return self;
}

@end