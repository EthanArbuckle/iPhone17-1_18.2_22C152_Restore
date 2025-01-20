@interface VNContoursDetector
+ (id)configurationOptionKeysForDetectorKey;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNContoursDetector

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__VNContoursDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNContoursDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNContoursDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNContoursDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __59__VNContoursDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNContoursDetector;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNContoursDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNContoursDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allCPUAndGPUComputeDevices];
  v8[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ciContrastWithPivotFilter, 0);

  objc_storeStrong((id *)&self->_ciContrastFromAvgFilter, 0);
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v108 = a5;
  v106 = a8;
  v107 = +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:");
  if (!v107) {
    goto LABEL_122;
  }
  unsigned __int8 v113 = 1;
  if (!+[VNValidationUtilities getBOOLValue:&v113 forKey:@"VNContourDetectorProcessOption_DetectDarkOnLight" inOptions:v108 withDefaultValue:1 error:a8])goto LABEL_122; {
  char v112 = 1;
  }
  if (!+[VNValidationUtilities getBOOLValue:&v112 forKey:@"VNContourDetectorProcessOption_InHierarchy" inOptions:v108 withDefaultValue:1 error:a8])goto LABEL_122; {
  size_t Width = CVPixelBufferGetWidth(a4);
  }
  size_t Height = CVPixelBufferGetHeight(a4);
  if (!self) {
    goto LABEL_123;
  }
  unint64_t v14 = Height;
  int v15 = v113;
  char v16 = v112;
  CVPixelBufferRef pixelBuffer = a4;
  if (a4)
  {
    CVPixelBufferRetain(a4);
    v17 = pixelBuffer;
  }
  else
  {
    v17 = 0;
  }
  size_t v18 = CVPixelBufferGetWidth(v17);
  size_t v19 = CVPixelBufferGetHeight(pixelBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  BaseAddress = 0;
  size_t v116 = v19;
  size_t v117 = v18;
  size_t v118 = BytesPerRow;
  CVPixelBufferRef texture = 0;
  apple::vision::CVPixelBufferWrapper::BaseAddressLock<1ull>::BaseAddressLock(&v120, pixelBuffer);
  BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(pixelBuffer);
  if (texture) {
    CVPixelBufferRelease(texture);
  }
  CVPixelBufferRef texture = pixelBuffer;
  CVPixelBufferRef pixelBuffer = 0;
  apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&pixelBuffer);
  v121[0] = 1;
  uint64_t v122 = 0x3EA1E89B3FEE76C9;
  char v125 = 0;
  int v126 = 0;
  char v127 = 0;
  memset(v128, 0, sizeof(v128));
  *(void *)&v128[13] = operator new(0x8000uLL);
  *(void *)&v128[15] = *(void *)&v128[13];
  *(void *)&v128[17] = *(void *)&v128[13] + 0x8000;
  char v129 = v16;
  v100 = self;
  if (!apple::vision::libraries::autotrace::EPolygonList::init((apple::vision::libraries::autotrace::EPolygonList *)&v123))
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v99 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v99, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
  }
  size_t v21 = v116;
  v111 = BaseAddress;
  size_t v22 = v117;
  int v23 = v118;
  bzero(v131, 0x400uLL);
  uint64_t v30 = v23;
  if (v21)
  {
    uint64_t v31 = 0;
    v32 = v111;
    do
    {
      if (v22)
      {
        for (uint64_t i = 0; i != v22; ++i)
          ++v131[v32[i]];
      }
      ++v31;
      v32 += v23;
    }
    while (v31 != v21);
  }
  uint64_t v34 = 0;
  int v35 = 0;
  int v36 = 0;
  double v37 = (double)Width;
  double v38 = (double)v14;
  do
  {
    int v39 = v131[v34];
    if (v39 <= v35) {
      int v40 = v35;
    }
    else {
      int v40 = v131[v34];
    }
    if (v39 <= v36) {
      int v41 = v36;
    }
    else {
      int v41 = v131[v34];
    }
    if (v39 <= v36) {
      int v35 = v40;
    }
    else {
      int v35 = v36;
    }
    ++v34;
    int v36 = v41;
  }
  while (v34 != 256);
  uint64_t v42 = 0;
  v43 = 0;
  int v44 = 0;
  v45 = v111;
  int v46 = v41 + v35;
  while (2)
  {
    uint64_t v47 = 0;
    int v48 = 0;
    do
    {
      if (!v42 || v22 == v47)
      {
        BOOL v50 = 0;
        if (v21 == v42 || v22 == v47)
        {
LABEL_43:
          int v52 = 0;
          goto LABEL_45;
        }
        int v49 = 255;
        if (v15)
        {
LABEL_38:
          char v51 = v45[v47];
          goto LABEL_42;
        }
      }
      else
      {
        int v49 = v43[v47];
        if (v15)
        {
          if (v21 != v42) {
            goto LABEL_38;
          }
LABEL_40:
          char v51 = -1;
          goto LABEL_42;
        }
        v49 ^= 0xFFu;
        if (v21 == v42) {
          goto LABEL_40;
        }
      }
      char v51 = ~v45[v47];
LABEL_42:
      BOOL v50 = (v51 & 0x80) == 0;
      if (v49 >= 128) {
        goto LABEL_43;
      }
      int v52 = 4;
LABEL_45:
      int v53 = v52 | v50;
      int v54 = v53 | v48;
      BOOL v55 = v54 == 9 || v54 == 6;
      if (v55) {
        int v56 = 2;
      }
      else {
        int v56 = 1;
      }
      int v57 = v56 + v44;
      if (v54 == 15) {
        int v57 = v44;
      }
      if (v54) {
        int v44 = v57;
      }
      int v48 = 2 * v53;
      ++v47;
    }
    while (v22 + 1 != v47);
    v43 = v45;
    v45 += v23;
    BOOL v55 = v21 == v42++;
    if (!v55) {
      continue;
    }
    break;
  }
  uint64_t v58 = 0;
  v110 = 0;
  v121[0] = (float)((float)((int)v21 * (int)v22 - v46) / (float)v44) < 4.5;
  uint64_t v101 = v23;
  while (2)
  {
    uint64_t v59 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    v128[0] = 0;
    float v109 = (float)(int)v58 + -0.5;
    unsigned int v63 = 255;
    int v64 = 255;
LABEL_60:
    int v65 = v64;
    int v66 = v63;
    if (!v58 || v22 == v59)
    {
      int v64 = 255;
      unsigned __int8 v67 = -1;
      unsigned int v63 = 255;
      if (v21 == v58 || v22 == v59) {
        goto LABEL_72;
      }
      if (v15) {
        goto LABEL_68;
      }
LABEL_71:
      unsigned int v63 = v111[v59] ^ 0xFF;
      goto LABEL_72;
    }
    int v64 = v110[v59];
    if (!v15)
    {
      unsigned __int8 v67 = ~(_BYTE)v64;
      unsigned int v63 = 255;
      int v64 = ~(_BYTE)v64;
      if (v21 == v58) {
        goto LABEL_72;
      }
      goto LABEL_71;
    }
    if (v21 == v58)
    {
      unsigned int v63 = 255;
      goto LABEL_69;
    }
LABEL_68:
    unsigned int v63 = v111[v59];
LABEL_69:
    unsigned __int8 v67 = v64;
LABEL_72:
    int v68 = v64 < 128;
    int v69 = (v63 >> 7) ^ 1;
    int v70 = v60 | (4 * v68) | v69;
    if (v70) {
      BOOL v71 = v70 == 15;
    }
    else {
      BOOL v71 = 1;
    }
    if (v71)
    {
LABEL_104:
      int v60 = (2 * v70) & 0xA;
      ++v59;
      int v61 = (v63 >> 7) ^ 1;
      int v62 = v64 < 128;
      if (v22 + 1 == v59)
      {
        if (*(void *)&v128[1])
        {
          *(void *)&v128[3] = *(void *)&v128[1];
          operator delete(*(void **)&v128[1]);
        }
        *(_OWORD *)&v128[1] = *(_OWORD *)&v128[7];
        *(void *)&v128[5] = *(void *)&v128[11];
        uint64_t v30 = v101;
        memset(&v128[7], 0, 24);
        v110 = v111;
        v111 += v101;
        BOOL v55 = v21 == v58++;
        if (v55)
        {
          int v89 = v123;
          if (v123 >= 1)
          {
            int v90 = 0;
            v91 = v124;
            do
            {
              if (!*((unsigned char *)v91 + 21) && *((_DWORD *)v91 + 8) == -1)
              {
                apple::vision::libraries::autotrace::encodePolygonData((apple::vision::libraries::autotrace *)v121, v91, v24);
                int v89 = v123;
              }
              ++v90;
              v91 = (apple::vision::libraries::autotrace::BitmapToContourEnvironment *)((char *)v91 + 40);
            }
            while (v90 < v89);
          }
          size_t v92 = ((v128[19] + 7) >> 3);
          v93 = malloc_type_malloc((v92 + 8), 0x7D47F6A3uLL);
          v94 = v93;
          if (v93)
          {
            _DWORD *v93 = v92;
            v93[1] = v128[19];
            memcpy(v93 + 2, *(const void **)&v128[13], v92);
          }
          goto LABEL_118;
        }
        continue;
      }
      goto LABEL_60;
    }
    break;
  }
  float v72 = 0.0;
  float v73 = 0.0;
  if (v62 != v68) {
    float v73 = (float)(127.5 - (float)v65) / (float)(v64 - v65);
  }
  if (v62 != v61) {
    float v72 = (float)(127.5 - (float)v65) / (float)(v66 - v65);
  }
  float v74 = 0.0;
  float v75 = 0.0;
  if (v64 < 128 != ((v63 & 0x80u) == 0)) {
    float v75 = (float)(127.5 - (float)v67) / (float)(int)(v63 - v64);
  }
  if (v61 != v69) {
    float v74 = (float)(127.5 - (float)v66) / (float)(int)(v63 - v66);
  }
  int v76 = v66 + v65 + v64 + v63;
  v78.f32[0] = (float)(int)v59 + -0.5;
  v77.f32[0] = v78.f32[0] + v73;
  v77.f32[1] = (float)(int)v58 + -0.5;
  *(float *)&double v80 = v78.f32[0] + v74;
  v78.f32[1] = v109 + v72;
  *(float *)&double v79 = (float)(int)v59 + 0.5;
  *((float *)&v79 + 1) = v109 + v75;
  *((float *)&v80 + 1) = (float)(int)v58 + 0.5;
  switch(v70)
  {
    case 1:
      unsigned __int8 v81 = apple::vision::libraries::autotrace::actionF((uint64_t)v121, 0, *(int8x8_t *)&v79, *(int8x8_t *)&v80);
      goto LABEL_103;
    case 2:
    case 13:
      unsigned __int8 v81 = apple::vision::libraries::autotrace::actionD((uint64_t)v121, v78, v80, v30, (uint64_t)v24, v25, v26, v27, v28, v29);
      goto LABEL_103;
    case 3:
    case 12:
      unsigned __int8 v81 = apple::vision::libraries::autotrace::actionE((uint64_t)v121, v78, v79, v30, (uint64_t)v24, v25, v26, v27, v28, v29);
      goto LABEL_103;
    case 4:
    case 11:
      unsigned __int8 v81 = apple::vision::libraries::autotrace::actionB((uint64_t)v121, v77, v79, v30, (uint64_t)v24, v25, v26, v27, v28, v29);
      goto LABEL_103;
    case 5:
    case 10:
      unsigned __int8 v81 = apple::vision::libraries::autotrace::actionC((uint64_t)v121, v77, v80, v30, (uint64_t)v24, v25, v26, v27, v28, v29);
      goto LABEL_103;
    case 6:
      int8x8_t v103 = *(int8x8_t *)&v80;
      float32x2_t v105 = v77;
      double v102 = v79;
      if (v76 > 510)
      {
        if (!apple::vision::libraries::autotrace::actionD((uint64_t)v121, v78, v80, v30, (uint64_t)v24, v25, v26, v27, v28, v29))goto LABEL_117; {
        goto LABEL_102;
        }
      }
      if (!apple::vision::libraries::autotrace::actionA((uint64_t)v121, v77, v78, v30, (uint64_t)v24, v25, v26, v27, v28, v29))goto LABEL_117; {
      unsigned __int8 v81 = apple::vision::libraries::autotrace::actionF((uint64_t)v121, 1, *(int8x8_t *)&v102, v103);
      }
      goto LABEL_103;
    case 7:
    case 8:
      unsigned __int8 v81 = apple::vision::libraries::autotrace::actionA((uint64_t)v121, v77, v78, v30, (uint64_t)v24, v25, v26, v27, v28, v29);
      goto LABEL_103;
    case 9:
      int8x8_t v104 = *(int8x8_t *)&v80;
      float32x2_t v105 = v77;
      double v102 = v79;
      if (v76 <= 510)
      {
        if (!apple::vision::libraries::autotrace::actionD((uint64_t)v121, v78, v80, v30, (uint64_t)v24, v25, v26, v27, v28, v29))goto LABEL_117; {
LABEL_102:
        }
        unsigned __int8 v81 = apple::vision::libraries::autotrace::actionB((uint64_t)v121, v105, v102, v82, v83, v84, v85, v86, v87, v88);
      }
      else
      {
        if (!apple::vision::libraries::autotrace::actionA((uint64_t)v121, v77, v78, v30, (uint64_t)v24, v25, v26, v27, v28, v29))goto LABEL_117; {
        unsigned __int8 v81 = apple::vision::libraries::autotrace::actionF((uint64_t)v121, 0, *(int8x8_t *)&v102, v104);
        }
      }
LABEL_103:
      if (v81) {
        goto LABEL_104;
      }
LABEL_117:
      v94 = 0;
      break;
    case 14:
      if (apple::vision::libraries::autotrace::actionF((uint64_t)v121, 1, *(int8x8_t *)&v79, *(int8x8_t *)&v80))goto LABEL_104; {
      goto LABEL_117;
      }
    default:
      goto LABEL_104;
  }
LABEL_118:
  apple::vision::libraries::autotrace::BitmapToContourEnvironment::~BitmapToContourEnvironment((apple::vision::libraries::autotrace::BitmapToContourEnvironment *)v121);
  apple::vision::CVPixelBufferWrapper::BaseAddressLock<1ull>::~BaseAddressLock(&v120);
  apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&texture);
  if (v94)
  {
    v95 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v94 length:(*v94 + 8) freeWhenDone:1];
    v96 = -[VNContoursObservation initWithOriginatingRequestSpecifier:compressedPoints:imageSize:]([VNContoursObservation alloc], "initWithOriginatingRequestSpecifier:compressedPoints:imageSize:", v107, v95, v37, v38);
    [(VNDetector *)v100 recordImageCropQuickLookInfoFromOptions:v108 toObservation:v96];
    v130 = v96;
    self = [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:1];

    goto LABEL_123;
  }
  if (v106)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"VNContourDetector: Error extracting contours"];
    self = 0;
    id *v106 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_123;
  }
LABEL_122:
  self = 0;
LABEL_123:

  return self;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v68[1] = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  v17 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v16 error:a8];
  if (!v17)
  {
    BOOL v26 = 0;
    goto LABEL_11;
  }
  size_t v18 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
  size_t v19 = v18;
  if (v18)
  {
    unint64_t v20 = [v18 width];
    double v21 = width * (double)v20;
    double v22 = (double)(unint64_t)[v19 height];
    double v23 = height * v22;
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __116__VNContoursDetector_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke;
    v60[3] = &unk_1E5B20040;
    v60[4] = self;
    if (+[VNValidationUtilities validateNonZeroImageWidth:(unint64_t)v21 height:(unint64_t)v23 componentNameProvidingBlock:v60 error:a8])
    {
      char v59 = 0;
      if (+[VNValidationUtilities getBOOLValue:&v59 forKey:@"VNContourDetectorProcessOption_ForceUseInputCVPixelBufferDirectly" inOptions:v16 withDefaultValue:0 error:a8])
      {
        if (v59)
        {
          v24 = (__CVBuffer *)[v19 originalPixelBuffer];
          if (v24)
          {
            id v25 = 0;
            *a7 = CVPixelBufferRetain(v24);
LABEL_26:
            [(VNDetector *)self recordImageCropQuickLookInfoToOptions:v16 cacheKey:v25 imageBuffer:v19];
            BOOL v26 = 1;
LABEL_31:

            goto LABEL_9;
          }
          if (a8)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:@"VNContourDetector: Original buffer could not be found"];
            id v25 = 0;
            BOOL v26 = 0;
            *a8 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_31;
          }
          id v25 = 0;
LABEL_30:
          BOOL v26 = 0;
          goto LABEL_31;
        }
        id v58 = 0;
        id v28 = v19;
        id v29 = v16;
        int v56 = v28;
        if (!self)
        {
          v33 = 0;
LABEL_25:

          id v25 = v58;
          *a7 = v33;
          if (v33) {
            goto LABEL_26;
          }
          goto LABEL_30;
        }
        int v57 = [(id)objc_opt_class() computeDeviceForComputeStage:@"VNComputeStageMain" configurationOptions:v29 error:a8];
        if (!v57
          || (unint64_t v66 = 512,
              !+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:withDefaultValue:error:", &v66, @"VNContourDetectorProcessOption_MaximumImageDimension", v29, 512, a8))|| (float v65 = 2.0, LODWORD(v30) = 2.0, !+[VNValidationUtilities getFloatValue:&v65 forKey:@"VNContourDetectorProcessOption_ContrastAdjustment" inOptions:v29 withDefaultValue:a8 error:v30]))
        {
          v33 = 0;
LABEL_24:

          goto LABEL_25;
        }
        double v31 = (double)v66 / v23;
        if ((double)v66 / v21 < v31) {
          double v31 = (double)v66 / v21;
        }
        double v32 = fmin(v31, 1.0);
        v33 = (__CVBuffer *)objc_msgSend(v28, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:", vcvtad_u64_f64(v21 * v32), vcvtad_u64_f64(v23 * v32), 1278226488, 2, v29, a8, x * (double)v20, y * v22, v21, v23, 0, 0, 0, &v58);
        if (!v33 || v65 == 1.0) {
          goto LABEL_24;
        }
        id v55 = (id)[objc_alloc(MEMORY[0x1E4F1E050]) initWithCVPixelBuffer:v33];
        CVPixelBufferRelease(v33);
        float v64 = 0.5;
        LODWORD(v34) = 0.5;
        if (+[VNValidationUtilities getFloatValue:&v64 forKey:@"VNContourDetectorProcessOption_ContrastPivot" inOptions:v29 withDefaultValue:a8 error:v34])
        {
          *(float *)&double v35 = v64;
          if (v64 == 0.5)
          {
            uint64_t v67 = *MEMORY[0x1E4F1E458];
            *(float *)&double v35 = v65;
            int v53 = [NSNumber numberWithFloat:v35];
            v68[0] = v53;
            int v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
            uint64_t v51 = [v55 imageByApplyingFilter:@"CIColorControls" withInputParameters:v36];

            id v55 = (id)v51;
          }
          else if (v64 == -1.0)
          {
            -[VNCIFilter setInputImage:](self->_ciContrastFromAvgFilter, "setInputImage:", v55, v35);
            *(float *)&double v42 = v65;
            v43 = [NSNumber numberWithFloat:v42];
            [(VNCIContrastFromAverageColorFilter *)self->_ciContrastFromAvgFilter setInputContrast:v43];

            uint64_t v44 = [(VNCIContrastFromAverageColorFilter *)self->_ciContrastFromAvgFilter outputImage];

            id v55 = (id)v44;
            [(VNCIFilter *)self->_ciContrastFromAvgFilter setInputImage:0];
          }
          else
          {
            -[VNCIFilter setInputImage:](self->_ciContrastWithPivotFilter, "setInputImage:", v55, v35);
            *(float *)&double v37 = v65;
            double v38 = [NSNumber numberWithFloat:v37];
            [(VNCIContrastWithPivotColorFilter *)self->_ciContrastWithPivotFilter setInputContrast:v38];

            *(float *)&double v39 = v64;
            int v40 = [NSNumber numberWithFloat:v39];
            [(VNCIContrastWithPivotColorFilter *)self->_ciContrastWithPivotFilter setInputPivot:v40];

            uint64_t v41 = [(VNCIContrastWithPivotColorFilter *)self->_ciContrastWithPivotFilter outputImage];

            id v55 = (id)v41;
            [(VNCIFilter *)self->_ciContrastWithPivotFilter setInputImage:0];
          }
          if (!v55)
          {
            if (a8)
            {
              id v49 = +[VNError errorForInternalErrorWithLocalizedDescription:@"VNContourDetector: Failed to adjust contrast"];
              BOOL v50 = 0;
              v33 = 0;
              *a8 = v49;
            }
            else
            {
              BOOL v50 = 0;
              v33 = 0;
            }
            goto LABEL_47;
          }
          [v55 extent];
          v33 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, (unint64_t)v45, (unint64_t)v46, 1278226488, a8);
          if (v33)
          {
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __114__VNContoursDetector__highContastMonoCVPixelBufferFromImageBuffer_cropRect_options_pixelBufferRepsCacheKey_error___block_invoke;
            aBlock[3] = &unk_1E5B1E4B8;
            id v55 = v55;
            id v62 = v55;
            unsigned int v63 = v33;
            int v54 = _Block_copy(aBlock);
            uint64_t v47 = +[VNValidationUtilities requiredSessionInOptions:v29 error:a8];
            int v48 = v47;
            if (v47)
            {
              int v52 = [v47 vnciContextManager];
              if ((-[VNCIContextManager performBlock:usingAvailableContextForComputeDevice:error:]((uint64_t)v52, v54, v57, a8) & 1) == 0)
              {
                CVPixelBufferRelease(v33);
                v33 = 0;
              }
            }
            else
            {
              v33 = 0;
            }
          }
        }
        else
        {
          v33 = 0;
        }
        BOOL v50 = v55;
LABEL_47:

        goto LABEL_24;
      }
    }
  }
  BOOL v26 = 0;
LABEL_9:

LABEL_11:
  return v26;
}

NSString *__116__VNContoursDetector_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v0);
}

uint64_t __114__VNContoursDetector__highContastMonoCVPixelBufferFromImageBuffer_cropRect_options_pixelBufferRepsCacheKey_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void **)(a2 + 8);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  [v4 render:*(void *)(a1 + 32) toCVPixelBuffer:*(void *)(a1 + 40)];

  return 1;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNContoursDetector;
  if (![(VNDetector *)&v13 completeInitializationForSession:v6 error:a4]) {
    goto LABEL_7;
  }
  v7 = objc_alloc_init(VNCIContrastWithPivotColorFilter);
  ciContrastWithPivotFilter = self->_ciContrastWithPivotFilter;
  self->_ciContrastWithPivotFilter = v7;

  v9 = objc_alloc_init(VNCIContrastFromAverageColorFilter);
  ciContrastFromAvgFilter = self->_ciContrastFromAvgFilter;
  self->_ciContrastFromAvgFilter = v9;

  if (!self->_ciContrastWithPivotFilter || !self->_ciContrastFromAvgFilter)
  {
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"VNContourDetector: Failed to create image filters"];
      BOOL v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    BOOL v11 = 0;
    goto LABEL_8;
  }
  BOOL v11 = 1;
LABEL_8:

  return v11;
}

@end