@interface FlickerResourceArbiterClientDelegate
- (FlickerResourceArbiterClientDelegate)init;
- (H16ISPFlickerDetectorContext)flickerContext;
- (ResourceArbiterClient)arbiterClient;
- (void)cleanup;
- (void)releaseResourceAccess;
- (void)requestResourceAccess;
- (void)resourceAccessResult:(BOOL)a3;
- (void)resourceAccessRevoked;
- (void)setFlickerContext:(H16ISPFlickerDetectorContext *)a3;
@end

@implementation FlickerResourceArbiterClientDelegate

- (FlickerResourceArbiterClientDelegate)init
{
  v5.receiver = self;
  v5.super_class = (Class)FlickerResourceArbiterClientDelegate;
  v2 = [(FlickerResourceArbiterClientDelegate *)&v5 init];
  if (v2)
  {
    v3 = (ResourceArbiterClient *)[objc_alloc(MEMORY[0x263F8BB18]) initWithID:1];
    v2->_arbiterClient = v3;
    [(ResourceArbiterClient *)v3 setDelegate:v2];
    v2->_flickerContext = 0;
  }
  return v2;
}

- (void)cleanup
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_12_0(&dword_24680F000, v0, v1, "FlickerDetector: FlickerResourceArbiterClientDelegate cleanup at shutting down\n\n", v2, v3, v4, v5, v6);
}

- (void)requestResourceAccess
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_12_0(&dword_24680F000, v0, v1, "FlickerDetector: Requested resource access\n\n", v2, v3, v4, v5, v6);
}

- (void)releaseResourceAccess
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_12_0(&dword_24680F000, v0, v1, "FlickerDetector: Released resource access\n\n", v2, v3, v4, v5, v6);
}

- (void)resourceAccessResult:(BOOL)a3
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  if (a3)
  {
    unint64_t v4 = 0x26B11B000uLL;
    uint64_t v5 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
    uint8_t v6 = &_os_log_internal;
    if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == &_os_log_internal)
    {
      uint64_t v5 = os_log_create("com.apple.isp", "general");
      GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v5;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 1;
      _os_log_impl(&dword_24680F000, v5, OS_LOG_TYPE_DEFAULT, "FlickerDetector: ArbiterClient resource access granted=%d\n\n", buf, 8u);
    }
    flickerContext = self->_flickerContext;
    if (flickerContext)
    {
      p_var23 = &flickerContext->var23;
      pthread_mutex_lock(&flickerContext->var23);
      if (flickerContext->var22 || (p_var2 = &flickerContext->var2, flickerContext->var2))
      {
LABEL_9:
        pthread_mutex_unlock(p_var23);
        return;
      }
      *(_OWORD *)&inDesc.componentType = xmmword_2469DB070;
      inDesc.componentFlagsMask = 0;
      Next = AudioComponentFindNext(0, &inDesc);
      if (!Next)
      {
        v14 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v14 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v14;
        }
        uint64_t v13 = 3758097136;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[FlickerResourceArbiterClientDelegate resourceAccessResult:].cold.4();
        }
        goto LABEL_44;
      }
      if (AudioComponentInstanceNew(Next, &flickerContext->var2))
      {
        v12 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v12 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v12;
        }
        uint64_t v13 = 3758097084;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[FlickerResourceArbiterClientDelegate resourceAccessResult:]8();
        }
        goto LABEL_44;
      }
      bzero(buf, 0x28uLL);
      var0 = flickerContext->var0;
      *(void *)buf = **((void **)flickerContext->var0 + 1);
      if (*(_DWORD *)var0 == 1) {
        int v16 = 1;
      }
      else {
        int v16 = 2;
      }
      unsigned int v119 = v16;
      int v120 = 32;
      int v117 = 1;
      int v118 = 4 * v16;
      int v116 = 4 * v16;
      uint64_t v115 = 0x96C70636DLL;
      if (AudioUnitSetProperty(flickerContext->var2, 8u, 2u, 1u, buf, 0x28u))
      {
        v17 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v17 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v17;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[FlickerResourceArbiterClientDelegate resourceAccessResult:]7();
        }
LABEL_43:
        uint64_t v13 = 3758097084;
LABEL_44:
        DisposeAudioCaptureSession(flickerContext);
        v20 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v20 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v20;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[FlickerResourceArbiterClientDelegate resourceAccessResult:](v13, v20, v21, v22, v23, v24, v25, v26);
        }
        goto LABEL_48;
      }
      if (AudioUnitSetProperty(flickerContext->var2, 0xEu, 0, 0, &flickerContext->var4, 4u))
      {
        v18 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v18 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v18;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[FlickerResourceArbiterClientDelegate resourceAccessResult:]6();
        }
        goto LABEL_43;
      }
      UInt32 ioDataSize = 4;
      if (AudioUnitGetProperty(*p_var2, 0xEu, 0, 0, &flickerContext->var4, &ioDataSize))
      {
        v19 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v19 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v19;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[FlickerResourceArbiterClientDelegate resourceAccessResult:]5();
        }
        goto LABEL_43;
      }
      inData[1] = flickerContext;
      switch(*(_DWORD *)flickerContext->var0)
      {
        case 1:
          v28 = inputCallbackForHawking;
          break;
        case 2:
          v28 = inputCallbackForPenrose;
          break;
        case 6:
          v28 = inputCallbackForGrimaldi;
          break;
        case 9:
          v28 = inputCallbackForGrimaldi_iPad;
          break;
        case 0xA:
          v28 = inputCallbackForGrimaldiHighFreq;
          break;
        default:
          v28 = inputCallbackForPenrose2;
          break;
      }
      inData[0] = v28;
      if (AudioUnitSetProperty(*p_var2, 0x7D5u, 0, 0, inData, 0x10u))
      {
        v29 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v29 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v29;
        }
        uint64_t v13 = 3758097084;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[FlickerResourceArbiterClientDelegate resourceAccessResult:]4();
        }
        goto LABEL_44;
      }
      OSStatus v30 = AudioUnitInitialize(*p_var2);
      if (v30)
      {
        OSStatus v31 = v30;
        v32 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v32 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v32;
        }
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[FlickerResourceArbiterClientDelegate resourceAccessResult:]3();
        }
        if (v31 == 1852794999)
        {
          v33 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
          if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
          {
            v33 = os_log_create("com.apple.isp", "general");
            GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v33;
          }
          uint64_t v13 = 3758097088;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            -[FlickerResourceArbiterClientDelegate resourceAccessResult:]2();
          }
        }
        else
        {
          uint64_t v13 = 3758097084;
        }
        goto LABEL_44;
      }
      if (AudioUnitSetProperty(flickerContext->var2, 0x7E6u, 1u, 1u, &flickerContext->var19, 4u))
      {
        v34 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v34 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v34;
        }
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[FlickerResourceArbiterClientDelegate resourceAccessResult:]1();
        }
      }
      UInt32 ioDataSize = 40;
      if (AudioUnitGetProperty(flickerContext->var2, 8u, 2u, 1u, &flickerContext->var3, &ioDataSize))
      {
        v35 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v35 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v35;
        }
        uint64_t v13 = 3758097084;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[FlickerResourceArbiterClientDelegate resourceAccessResult:]0();
        }
        goto LABEL_44;
      }
      if (memcmp(&flickerContext->var3, buf, 0x28uLL))
      {
        v36 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v36 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v36;
        }
        uint64_t v13 = 3758097084;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          -[FlickerResourceArbiterClientDelegate resourceAccessResult:]9();
        }
        goto LABEL_44;
      }
      if ((flickerContext->var3.mFormatFlags & 1) != 0 && flickerContext->var3.mBytesPerFrame != 4 * v119)
      {
        v72 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v72 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v72;
        }
        uint64_t v13 = 3758097084;
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
          -[FlickerResourceArbiterClientDelegate resourceAccessResult:]8((uint64_t)&flickerContext->var3.mBytesPerFrame, v72, v73, v74, v75, v76, v77, v78);
        }
        goto LABEL_44;
      }
      v37 = (double *)*((void *)flickerContext->var0 + 1);
      double v38 = *v37;
      double v39 = v37[1];
      double v40 = v37[2];
      v41 = (photometer_flicker_result *)malloc_type_calloc(1uLL, 0x110uLL, 0x1000040368141FCuLL);
      int v42 = (int)(log2((double)(v40* (double)(2 * (flickerContext->var3.mSampleRate * 0.125))/ v38)+ -0.5)+ 1.0);
      flickerContext->var16 = v42;
      p_var16 = &flickerContext->var16;
      flickerContext->var18.var6 = v41;
      unint64_t mBitsPerChannel = flickerContext->var3.mBitsPerChannel;
      size_t mBytesPerFrame = flickerContext->var3.mBytesPerFrame;
      size_t count = (1 << v42);
      unsigned int v46 = (v38 * (double)count / v40 * 0.5);
      v47 = malloc_type_calloc(v46, mBytesPerFrame, 0xDD5A25E2uLL);
      flickerContext->var5.mData = v47;
      if (!v47)
      {
        v70 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v70 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v70;
        }
        uint64_t v71 = 3758097085;
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
          -[FlickerResourceArbiterClientDelegate resourceAccessResult:].cold.6();
        }
        goto LABEL_158;
      }
      flickerContext->var5.mDataByteSize = mBytesPerFrame * v46;
      int v48 = 2 * v46;
      v49 = malloc_type_calloc(2 * v46, mBytesPerFrame, 0xF17B5014uLL);
      flickerContext->var6.mData = v49;
      if (!v49)
      {
        v79 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v79 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v79;
        }
        uint64_t v71 = 3758097085;
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
          -[FlickerResourceArbiterClientDelegate resourceAccessResult:].cold.7();
        }
        goto LABEL_158;
      }
      flickerContext->var6.mDataByteSize = v48 * mBytesPerFrame;
      size_t v50 = mBitsPerChannel >> 3;
      v51 = malloc_type_calloc(count, v50, 0x80B47EEEuLL);
      flickerContext->var10.mData = v51;
      if (!v51)
      {
        v80 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v80 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v80;
        }
        uint64_t v71 = 3758097085;
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
          -[FlickerResourceArbiterClientDelegate resourceAccessResult:].cold.8();
        }
        goto LABEL_158;
      }
      v52 = malloc_type_calloc(count, v50, 0x1512EAD1uLL);
      flickerContext->var11.mData = v52;
      if (!v52)
      {
        v81 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v81 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v81;
        }
        uint64_t v71 = 3758097085;
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
          -[FlickerResourceArbiterClientDelegate resourceAccessResult:].cold.9();
        }
        goto LABEL_158;
      }
      flickerContext->var10.mDataByteSize = v50 << v42;
      flickerContext->var11.mDataByteSize = v50 << v42;
      v53 = malloc_type_calloc((v39 * (double)v46 / v38), v50, 0xF265BEBFuLL);
      flickerContext->var12.mData = v53;
      if (!v53)
      {
        v82 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v82 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v82;
        }
        uint64_t v71 = 3758097085;
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
          -[FlickerResourceArbiterClientDelegate resourceAccessResult:]0();
        }
        goto LABEL_158;
      }
      flickerContext->var12.mDataByteSize = v50 * (v39 * (double)v46 / v38);
      if (*(_DWORD *)flickerContext->var0 != 1)
      {
        v54 = malloc_type_calloc(2 * v46, v50, 0xDB7BE8E4uLL);
        flickerContext->var8.mData = v54;
        if (!v54)
        {
          v84 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
          if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
          {
            v84 = os_log_create("com.apple.isp", "general");
            GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v84;
          }
          uint64_t v71 = 3758097085;
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
            -[FlickerResourceArbiterClientDelegate resourceAccessResult:]6();
          }
          goto LABEL_158;
        }
        flickerContext->var8.mDataByteSize = v48 * v50;
        v55 = malloc_type_calloc(2 * v46, v50, 0xA48A8574uLL);
        flickerContext->var9.mData = v55;
        if (!v55)
        {
          v93 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
          if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
          {
            v93 = os_log_create("com.apple.isp", "general");
            GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v93;
          }
          uint64_t v71 = 3758097085;
          if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
            -[FlickerResourceArbiterClientDelegate resourceAccessResult:]7();
          }
          goto LABEL_158;
        }
        flickerContext->var9.mDataByteSize = v48 * v50;
      }
      size_t v56 = (count + 2);
      v57 = malloc_type_calloc(v56, v50, 0x9E813901uLL);
      flickerContext->var13.mData = v57;
      if (v57)
      {
        flickerContext->var13.mDataByteSize = v56 * v50;
        v58 = (CPastFlickerHistory *)malloc_type_calloc(1uLL, 0x14CuLL, 0x10000403F9E400DuLL);
        flickerContext->var15 = v58;
        if (v58)
        {
          *((_DWORD *)v58 + 2) = 0;
          *(void *)v58 = 5;
          vDSP_Length v59 = *p_var16;
          if ((int)v59 >= 4 && (FFTSetup fftsetup = vDSP_create_fftsetup(v59, 0), (flickerContext->var17 = fftsetup) != 0))
          {
            if (*(_DWORD *)flickerContext->var0 == 1)
            {
LABEL_162:
              unint64_t v4 = 0x26B11B000;
LABEL_48:
              if (*p_var2 && AudioOutputUnitStart(*p_var2))
              {
                v27 = *(NSObject **)(v4 + 1976);
                if (v27 == v6)
                {
                  v27 = os_log_create("com.apple.isp", "general");
                  *(void *)(v4 + 1976) = v27;
                }
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                  -[FlickerResourceArbiterClientDelegate resourceAccessResult:]();
                }
              }
              goto LABEL_9;
            }
            v61 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(1uLL, 0x340uLL, 0x1090040C959C1BCuLL);
            flickerContext->var26 = v61;
            if (v61)
            {
              size_t v62 = ((112 << v42) + 4096);
              flickerContext->var14.mDataByteSize = v62;
              p_mDataByteSize = &flickerContext->var14.mDataByteSize;
              v64 = malloc_type_calloc(1uLL, v62, 0x1A70811BuLL);
              flickerContext->var14.mData = v64;
              if (v64)
              {
                float v65 = -0.389;
                float v66 = -0.3895;
                switch(*(_DWORD *)flickerContext->var0)
                {
                  case 3:
                    break;
                  case 4:
                    float v65 = -19.021;
                    float v66 = -18.175;
                    break;
                  case 5:
                    float v65 = -24.91;
                    float v66 = -25.06;
                    break;
                  case 6:
                  case 9:
                  case 0xA:
                    fun_get_calibration_param((uint64_t)flickerContext->var32, (uint64_t)flickerContext->var33, (uint64_t)flickerContext->var26 + 716);
                    float v66 = 0.0;
                    if (*(_DWORD *)flickerContext->var0 == 10)
                    {
                      var26 = flickerContext->var26;
                      v68.i32[0] = *((_DWORD *)var26 + 186);
                      if (v68.f32[0] < -7130316.8)
                      {
                        v68.i32[1] = *((_DWORD *)var26 + 187);
                        v68.i64[1] = *((void *)var26 + 94);
                        float32x4_t v69 = (float32x4_t)vdupq_n_s32(0x3F333333u);
                        *(float32x4_t *)((char *)var26 + 744) = vmulq_f32(v68, v69);
                        *(float32x4_t *)((char *)var26 + 760) = vmulq_f32(*(float32x4_t *)((char *)var26 + 760), v69);
                        *((float32x2_t *)var26 + 97) = vmul_f32(*(float32x2_t *)((char *)var26 + 776), *(float32x2_t *)v69.f32);
                        *(float32x2_t *)((char *)var26 + 716) = vdiv_f32(*(float32x2_t *)((char *)var26 + 716), *(float32x2_t *)v69.f32);
                      }
                    }
                    goto LABEL_176;
                  case 7:
                    float v66 = -0.6268;
                    float v65 = -0.6268;
                    break;
                  default:
                    float v66 = 0.0;
LABEL_176:
                    float v65 = 0.0;
                    break;
                }
                flicker_detection_init((uint64_t)flickerContext->var26, (int)v38, (int)(v38 / v40), count, count >> 1, (uint64_t)flickerContext->var14.mData, v66, v65);
                goto LABEL_162;
              }
              v109 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
              if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
              {
                v109 = os_log_create("com.apple.isp", "general");
                GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v109;
              }
              if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
                [(FlickerResourceArbiterClientDelegate *)(uint64_t)p_mDataByteSize resourceAccessResult:v109];
              }
              uint64_t v71 = 3758097085;
              UInt32 *p_mDataByteSize = 0;
            }
            else
            {
              v101 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
              if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
              {
                v101 = os_log_create("com.apple.isp", "general");
                GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v101;
              }
              uint64_t v71 = 3758097085;
              if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
                -[FlickerResourceArbiterClientDelegate resourceAccessResult:]4(v101, v102, v103, v104, v105, v106, v107, v108);
              }
            }
          }
          else
          {
            v85 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
            if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
            {
              v85 = os_log_create("com.apple.isp", "general");
              GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v85;
            }
            uint64_t v71 = 3758097086;
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
              -[FlickerResourceArbiterClientDelegate resourceAccessResult:]3((uint64_t)p_var16, v85, v86, v87, v88, v89, v90, v91);
            }
          }
        }
        else
        {
          v92 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
          if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
          {
            v92 = os_log_create("com.apple.isp", "general");
            GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v92;
          }
          uint64_t v71 = 3758097085;
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
            -[FlickerResourceArbiterClientDelegate resourceAccessResult:]2();
          }
        }
      }
      else
      {
        v83 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
        if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
        {
          v83 = os_log_create("com.apple.isp", "general");
          GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v83;
        }
        uint64_t v71 = 3758097085;
        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
          [(FlickerResourceArbiterClientDelegate *)v56 resourceAccessResult:v83];
        }
      }
LABEL_158:
      v94 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
      if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
      {
        v94 = os_log_create("com.apple.isp", "general");
        GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v94;
      }
      if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
        -[FlickerResourceArbiterClientDelegate resourceAccessResult:].cold.5(v71, v94, v95, v96, v97, v98, v99, v100);
      }
      goto LABEL_162;
    }
    v10 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
    if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == v6)
    {
      v10 = os_log_create("com.apple.isp", "general");
      GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v10;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FlickerResourceArbiterClientDelegate resourceAccessResult:]();
    }
  }
}

- (void)resourceAccessRevoked
{
  uint64_t v3 = GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog;
  if (GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog == &_os_log_internal)
  {
    uint64_t v3 = os_log_create("com.apple.isp", "general");
    GetCameraUserspaceLogStream(CameraUserspaceLoggingCategory)::_generalLog = (uint64_t)v3;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_24680F000, v3, OS_LOG_TYPE_DEFAULT, "FlickerDetector: ArbiterClient resource access revoked \n\n", v4, 2u);
  }
  StopAudioCaptureSession(self->_flickerContext);
  [(FlickerResourceArbiterClientDelegate *)self releaseResourceAccess];
}

- (ResourceArbiterClient)arbiterClient
{
  return self->_arbiterClient;
}

- (H16ISPFlickerDetectorContext)flickerContext
{
  return self->_flickerContext;
}

- (void)setFlickerContext:(H16ISPFlickerDetectorContext *)a3
{
  self->_flickerContext = a3;
}

- (void)resourceAccessResult:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_24680F000, v0, v1, "StartAudioCaptureSession: invalid context \n\n", v2, v3, v4, v5, v6);
}

- (void)resourceAccessResult:.cold.2()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_0(&dword_24680F000, v0, v1, "AudioOutputUnitStart returned 0x%08lx\n\n", v2, v3, v4, v5, v6);
}

- (void)resourceAccessResult:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_24680F000, a2, a3, "PrepareAudioCaptureSession returned 0x%08x\n\n", a5, a6, a7, a8, 0);
}

- (void)resourceAccessResult:.cold.4()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_24680F000, v0, v1, "AudioComponentFindNext: no component found \n\n", v2, v3, v4, v5, v6);
}

- (void)resourceAccessResult:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_24680F000, a2, a3, "AllocateFlickerDetectorBuffers returned 0x%08x\n\n", a5, a6, a7, a8, 0);
}

- (void)resourceAccessResult:.cold.6()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_2(&dword_24680F000, v0, v1, "Unable to allocate accumulator buffer: nAccumulatedSamples==%d, frameSizeBytes==%zd \n\n", v2, v3);
}

- (void)resourceAccessResult:.cold.7()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_2(&dword_24680F000, v0, v1, "Unable to allocate running buffer: nAccumulatedSamples==%d, frameSizeBytes==%zd \n\n", v2, v3);
}

- (void)resourceAccessResult:.cold.8()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_2(&dword_24680F000, v0, v1, "Unable to allocate resampling buffer: nResampledSamples==%d, sampleSizeBytes==%zd \n\n", v2, v3);
}

- (void)resourceAccessResult:.cold.9()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_2(&dword_24680F000, v0, v1, "Unable to allocate resampling IR buffer: nResampledSamples==%d, sampleSizeBytes==%zd \n\n", v2, v3);
}

- (void)resourceAccessResult:.cold.10()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_2(&dword_24680F000, v0, v1, "Unable to allocate wave matching resampling buffer: nResampledSamples==%d, sampleSizeBytes==%zd \n\n", v2, v3);
}

- (void)resourceAccessResult:(os_log_t)log .cold.11(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_24680F000, log, OS_LOG_TYPE_ERROR, "Unable to allocate fftBuffer: nFFTBufferSamples==%zd, sampleSizeBytes==%zd \n\n", (uint8_t *)&v3, 0x16u);
}

- (void)resourceAccessResult:.cold.12()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_2(&dword_24680F000, v0, v1, "Unable to allocate pAlgorithmHistory: nAccumulatedSamples==%d, sampleSizeBytes==%zd \n\n", v2, v3);
}

- (void)resourceAccessResult:(uint64_t)a3 .cold.13(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_24680F000, a2, a3, "Unable to create fft setup : bins == %d \n\n", a5, a6, a7, a8, 0);
}

- (void)resourceAccessResult:(uint64_t)a3 .cold.14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_24680F000, a1, a3, "Unable to allocate pContext->pControl: size ==%zd\n\n", a5, a6, a7, a8, 0);
}

- (void)resourceAccessResult:(NSObject *)a3 .cold.15(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LOWORD(v3) = 2048;
  *(void *)((char *)&v3 + 2) = a2;
  OUTLINED_FUNCTION_3_2(&dword_24680F000, a2, a3, "Unable to allocate scratchBuffer: scratchBuffer.mDataByteSize==%d, sampleSizeBytes==%zd \n\n", 67109376, (size_t)v3);
}

- (void)resourceAccessResult:.cold.16()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_2(&dword_24680F000, v0, v1, "Unable to allocate visual buffer: nRunningBufferSamples==%d, sampleSizeBytes==%zd \n\n", v2, v3);
}

- (void)resourceAccessResult:.cold.17()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_2(&dword_24680F000, v0, v1, "Unable to allocate IR buffer: nRunningBufferSamples==%d, sampleSizeBytes==%zd \n\n", v2, v3);
}

- (void)resourceAccessResult:(uint64_t)a3 .cold.18(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)resourceAccessResult:.cold.19()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_24680F000, v0, v1, "Retrieved format mismatches desired data format! \n\n", v2, v3, v4, v5, v6);
}

- (void)resourceAccessResult:.cold.20()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_0(&dword_24680F000, v0, v1, "Get input stream format on AURemoteIO returned 0x%08lx \n\n", v2, v3, v4, v5, v6);
}

- (void)resourceAccessResult:.cold.21()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_14();
  _os_log_error_impl(&dword_24680F000, v0, OS_LOG_TYPE_ERROR, "%s - Set Volume Scalar returned 0x%08lx\n", (uint8_t *)v1, 0x16u);
}

- (void)resourceAccessResult:.cold.22()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_24680F000, v0, v1, "AudioUnitInitialize :  kAudioServicesNoHardwareError \n\n", v2, v3, v4, v5, v6);
}

- (void)resourceAccessResult:.cold.23()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_0(&dword_24680F000, v0, v1, "AudioUnitInitialize returned 0x%08lx\n\n", v2, v3, v4, v5, v6);
}

- (void)resourceAccessResult:.cold.24()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_0(&dword_24680F000, v0, v1, "Set Render Callback on AURemoteIO returned 0x%08lx \n\n", v2, v3, v4, v5, v6);
}

- (void)resourceAccessResult:.cold.25()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_0(&dword_24680F000, v0, v1, "Get Maximum Frames Per Slice on AURemoteIO returned 0x%08lx \n\n", v2, v3, v4, v5, v6);
}

- (void)resourceAccessResult:.cold.26()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_0(&dword_24680F000, v0, v1, "Set Max Frames Per Slice on AURemoteIO returned 0x%08lx\n \n", v2, v3, v4, v5, v6);
}

- (void)resourceAccessResult:.cold.27()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_0(&dword_24680F000, v0, v1, "Set Input IO Format on AURemoteIO returned 0x%08lx \n\n", v2, v3, v4, v5, v6);
}

- (void)resourceAccessResult:.cold.28()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_0(&dword_24680F000, v0, v1, "AudioComponentInstanceNew returned 0x%08lx\n\n", v2, v3, v4, v5, v6);
}

@end