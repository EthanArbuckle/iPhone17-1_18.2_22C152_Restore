@interface ARImageNoiseTexture
+ (id)sharedInstanceForCameraPosition:(int64_t)a3 longEdgeImageResolution:(unsigned int)a4;
- (ARImageNoiseTexture)initWithNoiseModel:(int)a3;
- (MTLTexture)texture;
- (float)snrToNoiseIntensity:(float)lastSNR;
@end

@implementation ARImageNoiseTexture

+ (id)sharedInstanceForCameraPosition:(int64_t)a3 longEdgeImageResolution:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (+[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::onceToken != -1) {
    dispatch_once(&+[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::onceToken, &__block_literal_global_124);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)+[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::semaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (+[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::currentCameraPosition != a3
    || +[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::currentLongEdgeImageResolution != v4)
  {
    v7 = [[ARImageNoiseTexture alloc] initWithNoiseModel:+[ARNoiseParameters modelIdentifierForDevicePosition:a3 longEdgeImageResolution:v4]];
    v8 = (void *)+[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::sharedInstance;
    +[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::sharedInstance = (uint64_t)v7;

    +[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::currentCameraPosition = a3;
    +[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::currentLongEdgeImageResolution = v4;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)+[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::semaphore);
  v9 = (void *)+[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::sharedInstance;
  return v9;
}

void __79__ARImageNoiseTexture_sharedInstanceForCameraPosition_longEdgeImageResolution___block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(1);
  v1 = (void *)+[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::semaphore;
  +[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::semaphore = (uint64_t)v0;
}

- (ARImageNoiseTexture)initWithNoiseModel:(int)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)ARImageNoiseTexture;
  id v4 = [(ARImageNoiseTexture *)&v22 init];
  *((void *)v4 + 1) = 0x41C80000C1200000;
  *((_DWORD *)v4 + 4) = 1092616192;
  *((_DWORD *)v4 + 8) = 2139095040;
  kdebug_trace();
  id v5 = MTLCreateSystemDefaultDevice();
  v6 = objc_opt_new();
  [v6 setTextureType:7];
  [v6 setPixelFormat:115];
  [v6 setWidth:256];
  [v6 setHeight:256];
  [v6 setDepth:(unint64_t)*((float *)v4 + 4)];
  [v6 setUsage:3];
  uint64_t v7 = [v5 newTextureWithDescriptor:v6];
  v8 = (void *)*((void *)v4 + 5);
  *((void *)v4 + 5) = v7;

  [*((id *)v4 + 5) setLabel:@"com.apple.arkit.imagenoisetexture"];
  if (a3 == 77)
  {
    if (_ARLogGeneral(void)::onceToken != -1) {
      dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_75_0);
    }
    v9 = (id)_ARLogGeneral(void)::logObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138543618;
      v24 = v11;
      __int16 v25 = 2048;
      id v26 = v4;
      _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No noise model available. Noise texture will be empty.", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v12 = ARCreateNonFixedPriorityDispatchQueue("com.apple.arkit.imageNoise");
    v13 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v12;

    v14 = *((void *)v4 + 3);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__ARImageNoiseTexture_initWithNoiseModel___block_invoke;
    block[3] = &unk_1E6188628;
    id v19 = v5;
    id v15 = v4;
    id v20 = v15;
    int v21 = a3;
    dispatch_async(v14, block);
    v16 = v20;
    v9 = v15;
  }
  return (ARImageNoiseTexture *)v4;
}

void __42__ARImageNoiseTexture_initWithNoiseModel___block_invoke(uint64_t a1)
{
  v1 = ARKitCoreBundle();
  uint64_t v2 = [v1 URLForResource:@"default" withExtension:@"metallib"];
  v80 = (void *)v2;
  if (!v2) {
    __assert_rtn("-[ARImageNoiseTexture initWithNoiseModel:]_block_invoke", "ARImageNoiseTexture.mm", 113, "url != nil");
  }
  v81 = (void *)[*(id *)(a1 + 32) newLibraryWithURL:v2 error:0];
  [v81 setLabel:@"com.apple.arkit.imagenoisetexture"];
  v3 = *(void **)(a1 + 32);
  id v4 = (void *)[v81 newFunctionWithName:@"repeat"];
  v86 = (void *)[v3 newComputePipelineStateWithFunction:v4 error:0];

  id v5 = *(void **)(a1 + 32);
  v6 = (void *)[v81 newFunctionWithName:@"noise_ycbcr_to_srgb"];
  v79 = v1;
  v85 = (void *)[v5 newComputePipelineStateWithFunction:v6 error:0];

  v83 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:125 width:256 height:256 mipmapped:0];
  [v83 setUsage:3];
  v88 = (void *)[*(id *)(a1 + 32) newTextureWithDescriptor:v83];
  [v83 setWidth:320];
  [v83 setHeight:320];
  [v83 setPixelFormat:25];
  v92 = (void *)[*(id *)(a1 + 32) newTextureWithDescriptor:v83];
  v89 = (void *)[*(id *)(a1 + 32) newTextureWithDescriptor:v83];
  uint64_t v7 = (void *)[*(id *)(a1 + 32) newTextureWithDescriptor:v83];
  v8 = (void *)[*(id *)(a1 + 32) newTextureWithDescriptor:v83];
  [v83 setPixelFormat:115];
  v9 = (void *)[*(id *)(a1 + 32) newTextureWithDescriptor:v83];
  [v83 setWidth:256];
  [v83 setHeight:256];
  v10 = (void *)[*(id *)(a1 + 32) newTextureWithDescriptor:v83];
  [v88 setLabel:@"com.apple.arkit.imagenoisetexture.noiseYCbCr"];
  [v92 setLabel:@"com.apple.arkit.imagenoisetexture.paddedNoiseY"];
  [v89 setLabel:@"com.apple.arkit.imagenoisetexture.paddedNoiseCb"];
  [v7 setLabel:@"com.apple.arkit.imagenoisetexture.paddedNoiseCr"];
  [v8 setLabel:@"com.apple.arkit.imagenoisetexture.paddedBlurBuffer"];
  [v9 setLabel:@"com.apple.arkit.imagenoisetexture.paddedNoiseTile"];
  [v10 setLabel:@"com.apple.arkit.imagenoisetexture.noiseTile"];
  v90 = v10;
  v91 = v9;
  v82 = v8;
  v87 = v7;

  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v11 = 5489;
  v124.__x_[0] = 5489;
  for (uint64_t i = 1; i != 624; ++i)
  {
    std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v11 = i + 1812433253 * (v11 ^ (v11 >> 30));
    v124.__x_[i] = v11;
  }
  v124.__i_ = 0;
  uint64_t v122 = 0x3F80000000000000;
  char v123 = 0;
  v13 = v92;
  std::vector<float>::vector(&v120, 0x40000uLL);
  v14 = (float *)v120;
  id v15 = v121;
  while (v14 != v15)
    *v14++ = std::normal_distribution<float>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v122, &v124, (float *)&v122);
  v78 = (void *)[*(id *)(a1 + 32) newCommandQueue];
  [v78 setLabel:@"com.apple.arkit.imageNoiseTexture.queue"];
  v16 = [v78 commandBuffer];
  [v78 setLabel:@"com.apple.arkit.imagenoisetexture.queue"];
  v17 = *(float **)(a1 + 40);
  *(float *)&double v19 = v17[2];
  *(float *)&double v18 = v17[3];
  *(float *)&double v20 = v17[4];
  v119 = 0;
  v118 = 0;
  __p = 0;
  float v21 = v17[3];
  if (v21 >= v17[2])
  {
    objc_super v22 = 0;
    float v23 = *(float *)&v18 - *(float *)&v19;
    LODWORD(v19) = -1.0;
    *(float *)&double v20 = *(float *)&v20 + -1.0;
    float v24 = v23 / *(float *)&v20;
    do
    {
      if (v22 >= v119)
      {
        __int16 v25 = (float *)__p;
        uint64_t v26 = ((char *)v22 - (unsigned char *)__p) >> 2;
        unint64_t v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 62) {
          std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v28 = (char *)v119 - (unsigned char *)__p;
        if (((char *)v119 - (unsigned char *)__p) >> 1 > v27) {
          unint64_t v27 = v28 >> 1;
        }
        if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v29 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v29 = v27;
        }
        if (v29)
        {
          v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v119, v29);
          objc_super v22 = v118;
          __int16 v25 = (float *)__p;
        }
        else
        {
          v30 = 0;
        }
        v31 = (float *)&v30[4 * v26];
        float *v31 = v21;
        v32 = v31 + 1;
        while (v22 != v25)
        {
          int v33 = *((_DWORD *)v22-- - 1);
          *((_DWORD *)v31-- - 1) = v33;
        }
        __p = v31;
        v118 = v32;
        v119 = (float *)&v30[4 * v29];
        if (v25) {
          operator delete(v25);
        }
        objc_super v22 = v32;
      }
      else
      {
        *v22++ = v21;
      }
      v118 = v22;
      float v21 = v21 - v24;
      LODWORD(v18) = *(_DWORD *)(*(void *)(a1 + 40) + 8);
    }
    while (v21 >= *(float *)&v18);
    if (v22 != __p)
    {
      unint64_t v34 = 0;
      int64x2_t v84 = vdupq_n_s64(0x100uLL);
      do
      {
        v35 = (void *)[v88 width];
        v36 = (void *)[v88 height];
        memset(v116, 0, 24);
        v116[3] = v35;
        v116[4] = v36;
        v116[5] = (void *)1;
        objc_msgSend(v88, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v116, 0, v120, 16 * objc_msgSend(v88, "width"));
        arkit::gaussianMixtureKernels(*(_DWORD *)(a1 + 48), (arkit *)0x29, (uint64_t)v113, *((float *)__p + v34));
        v37 = [v16 computeCommandEncoder];
        [v37 setLabel:@"com.apple.arkit.imagenoisetexture.repeatpipeline"];
        unint64_t v38 = [v86 threadExecutionWidth];
        unint64_t v39 = [v86 maxTotalThreadsPerThreadgroup];
        uint64_t v40 = [v13 width];
        uint64_t v41 = [v13 height];
        [v37 setComputePipelineState:v86];
        [v37 setTexture:v88 atIndex:0];
        [v37 setTexture:v13 atIndex:1];
        [v37 setTexture:v89 atIndex:2];
        [v37 setTexture:v87 atIndex:3];
        v106 = 0;
        LODWORD(v35) = [v13 width];
        int v42 = [v88 width];
        int v43 = [v92 height];
        int v44 = [v88 height];
        LODWORD(v45) = (v35 - v42) >> 1;
        HIDWORD(v45) = (v43 - v44) >> 1;
        v106 = v45;
        [v37 setBytes:&v106 length:8 atIndex:0];
        LODWORD(v109[1]) = 0;
        v109[0] = 0;
        *(float32x2_t *)&long long v46 = vsqrt_f32(*(float32x2_t *)v113[0]);
        DWORD2(v46) = sqrtf(*((float *)v113[0] + 2));
        *(_OWORD *)v109 = v46;
        [v37 setBytes:v109 length:16 atIndex:1];
        uint64_t v47 = v39 / v38 - 1;
        v112[0] = (v47 + v40) / (v39 / v38);
        v112[1] = (v47 + v41) / (v39 / v38);
        v112[2] = 1;
        v111[0] = v39 / v38;
        v111[1] = v39 / v38;
        v111[2] = 1;
        [v37 dispatchThreadgroups:v112 threadsPerThreadgroup:v111];
        [v37 endEncoding];
        v109[1] = 0;
        uint64_t v110 = 0;
        v109[0] = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v109, *(const void **)v114, *(void *)(v114 + 8), (uint64_t)(*(void *)(v114 + 8) - *(void *)v114) >> 2);
        v107 = 0;
        uint64_t v108 = 0;
        v106 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v106, *(const void **)(v114 + 24), *(void *)(v114 + 32), (uint64_t)(*(void *)(v114 + 32) - *(void *)(v114 + 24)) >> 2);
        v104 = 0;
        uint64_t v105 = 0;
        v103 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v103, *(const void **)(v114 + 48), *(void *)(v114 + 56), (uint64_t)(*(void *)(v114 + 56) - *(void *)(v114 + 48)) >> 2);
        id v48 = objc_alloc(MEMORY[0x1E4F35568]);
        v49 = objc_msgSend(v48, "initWithDevice:kernelWidth:kernelHeight:weights:", *(void *)(a1 + 32), ((char *)v109[1] - (char *)v109[0]) >> 2, 1);
        id v50 = objc_alloc(MEMORY[0x1E4F35568]);
        v51 = objc_msgSend(v50, "initWithDevice:kernelWidth:kernelHeight:weights:", *(void *)(a1 + 32), 1, ((char *)v109[1] - (char *)v109[0]) >> 2);
        id v52 = objc_alloc(MEMORY[0x1E4F35568]);
        v53 = objc_msgSend(v52, "initWithDevice:kernelWidth:kernelHeight:weights:", *(void *)(a1 + 32), (v107 - (unsigned char *)v106) >> 2, 1);
        id v54 = objc_alloc(MEMORY[0x1E4F35568]);
        v55 = objc_msgSend(v54, "initWithDevice:kernelWidth:kernelHeight:weights:", *(void *)(a1 + 32), 1, (v107 - (unsigned char *)v106) >> 2);
        id v56 = objc_alloc(MEMORY[0x1E4F35568]);
        v57 = objc_msgSend(v56, "initWithDevice:kernelWidth:kernelHeight:weights:", *(void *)(a1 + 32), (v104 - (unsigned char *)v103) >> 2, 1);
        id v58 = objc_alloc(MEMORY[0x1E4F35568]);
        v59 = objc_msgSend(v58, "initWithDevice:kernelWidth:kernelHeight:weights:", *(void *)(a1 + 32), 1, (v104 - (unsigned char *)v103) >> 2);
        [v49 encodeToCommandBuffer:v16 sourceTexture:v92 destinationTexture:v82];
        [v51 encodeToCommandBuffer:v16 sourceTexture:v82 destinationTexture:v92];
        [v53 encodeToCommandBuffer:v16 sourceTexture:v89 destinationTexture:v82];
        [v55 encodeToCommandBuffer:v16 sourceTexture:v82 destinationTexture:v89];
        [v57 encodeToCommandBuffer:v16 sourceTexture:v87 destinationTexture:v82];
        [v59 encodeToCommandBuffer:v16 sourceTexture:v82 destinationTexture:v87];

        if (v103)
        {
          v104 = v103;
          operator delete(v103);
        }
        v13 = v92;
        if (v106)
        {
          v107 = v106;
          operator delete(v106);
        }
        if (v109[0])
        {
          v109[1] = v109[0];
          operator delete(v109[0]);
        }
        v60 = [v16 computeCommandEncoder];
        unint64_t v61 = [v85 threadExecutionWidth];
        unint64_t v62 = [v85 maxTotalThreadsPerThreadgroup];
        uint64_t v63 = [v91 width];
        uint64_t v64 = [v91 height];
        [v60 setComputePipelineState:v85];
        [v60 setTexture:v92 atIndex:0];
        [v60 setTexture:v89 atIndex:1];
        [v60 setTexture:v87 atIndex:2];
        [v60 setTexture:v91 atIndex:3];
        long double v65 = powf(fmaxf(v115, 0.35), 2.2);
        float v66 = pow(v65, -0.545454545) * 0.454545438;
        float v67 = 0.23564758 / v65 / v66;
        *(float *)v109 = v67;
        [v60 setBytes:v109 length:4 atIndex:0];
        uint64_t v68 = v62 / v61 - 1;
        v102[0] = (v68 + v63) / (v62 / v61);
        v102[1] = (v68 + v64) / (v62 / v61);
        v102[2] = 1;
        v101[0] = v62 / v61;
        v101[1] = v62 / v61;
        v101[2] = 1;
        [v60 dispatchThreadgroups:v102 threadsPerThreadgroup:v101];
        [v60 endEncoding];

        v69 = [v16 blitCommandEncoder];
        uint64_t v70 = [v91 width];
        uint64_t v71 = [v90 width];
        uint64_t v72 = [v91 height];
        uint64_t v73 = [v90 height];
        v100[0] = (unint64_t)(v70 - v71) >> 1;
        v100[1] = (unint64_t)(v72 - v73) >> 1;
        v100[2] = 0;
        uint64_t v74 = [v90 width];
        uint64_t v75 = [v90 height];
        v99[0] = v74;
        v99[1] = v75;
        v99[2] = 1;
        memset(v98, 0, sizeof(v98));
        [v69 copyFromTexture:v91 sourceSlice:0 sourceLevel:0 sourceOrigin:v100 sourceSize:v99 toTexture:v90 destinationSlice:0 destinationLevel:0 destinationOrigin:v98];
        [v69 endEncoding];

        v76 = [v16 blitCommandEncoder];
        memset(v97, 0, sizeof(v97));
        int64x2_t v95 = v84;
        uint64_t v96 = 1;
        uint64_t v77 = *(void *)(*(void *)(a1 + 40) + 40);
        v94[0] = 0;
        v94[1] = 0;
        v94[2] = v34;
        [v76 copyFromTexture:v90 sourceSlice:0 sourceLevel:0 sourceOrigin:v97 sourceSize:&v95 toTexture:v77 destinationSlice:0 destinationLevel:0 destinationOrigin:v94];
        [v76 endEncoding];

        v109[0] = &v114;
        std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)v109);
        if (v113[0])
        {
          v113[1] = v113[0];
          operator delete(v113[0]);
        }
        ++v34;
      }
      while (v34 < ((char *)v118 - (unsigned char *)__p) >> 2);
    }
  }
  objc_msgSend(v16, "addCompletedHandler:", &__block_literal_global_52_0, v18, v20, v19);
  [v16 commit];
  if (__p)
  {
    v118 = (float *)__p;
    operator delete(__p);
  }

  if (v120)
  {
    v121 = (float *)v120;
    operator delete(v120);
  }
}

uint64_t __42__ARImageNoiseTexture_initWithNoiseModel___block_invoke_2()
{
  return kdebug_trace();
}

- (float)snrToNoiseIntensity:(float)lastSNR
{
  if (lastSNR == INFINITY) {
    lastSNR = self->_lastSNR;
  }
  self->_lastSNR = lastSNR;
  return (float)(self->_maxSNR - fmaxf(fminf(lastSNR, self->_maxSNR), self->_minSNR))
       / (float)(self->_maxSNR - self->_minSNR);
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texture, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end