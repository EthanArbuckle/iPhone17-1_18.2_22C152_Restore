@interface VNGenerateInstanceMaskDetector
+ (id)configurationOptionKeysForDetectorKey;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3;
+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3;
+ (void)fullyPopulateConfigurationOptions:(id)a3;
+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3;
- (BOOL)_createLowResMaskFromLowResImage:(__CVBuffer *)a3 outMaskPixelBuffer:(__CVBuffer *)a4 outInstanceMaskPixelBuffer:(__CVBuffer *)a5 outNumComponents:(unint64_t *)a6 outConfidenceScore:(float *)a7 error:(id *)a8;
- (BOOL)_filterUsingConnectedComponentsFromSegmentation:(id *)a3 outInstanceMask:(__CVBuffer *)a4 numComponents:(unint64_t *)a5;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNGenerateInstanceMaskDetector

+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3
{
  return 0;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 1111970369;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return @"input_image";
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"subject_lifting_gen1_rev5_gv8dsz6vxu_multihead_int8.espresso";
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allGPUAndNeuralEngineComputeDevices];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3
{
  id v4 = a3;
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___VNGenerateInstanceMaskDetector;
  objc_msgSendSuper2(&v5, sel_recordDefaultConfigurationOptionsInDictionary_, v4);
  [v4 setObject:&unk_1EF7A7CA0 forKeyedSubscript:@"VNEspressoModelFileBasedDetectorOption_InputBlobNames"];
  [v4 setObject:&unk_1EF7A7CB8 forKeyedSubscript:@"VNEspressoModelFileBasedDetectorOption_OutputBlobNames"];
}

+ (void)fullyPopulateConfigurationOptions:(id)a3
{
  id v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNGenerateInstanceMaskDetector;
  objc_msgSendSuper2(&v7, sel_fullyPopulateConfigurationOptions_, v4);
  objc_super v5 = [v4 objectForKeyedSubscript:@"VNGenerateInstanceMaskDetectorCreationOptionGatingOnly"];
  int v6 = [v5 BOOLValue];

  if (v6) {
    [v4 setObject:&unk_1EF7A7C88 forKeyedSubscript:@"VNEspressoModelFileBasedDetectorOption_OutputBlobNames"];
  }
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__VNGenerateInstanceMaskDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNGenerateInstanceMaskDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNGenerateInstanceMaskDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNGenerateInstanceMaskDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __71__VNGenerateInstanceMaskDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNGenerateInstanceMaskDetector;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"VNGenerateInstanceMaskDetectorCreationOptionGatingOnly"];
  uint64_t v3 = [v2 copy];
  id v4 = (void *)+[VNGenerateInstanceMaskDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNGenerateInstanceMaskDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v51[1] = *MEMORY[0x1E4F143B8];
  id v18 = a5;
  id v19 = a7;
  id v20 = a9;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  uint64_t v35 = 0;
  v36 = (float *)&v35;
  uint64_t v37 = 0x2020000000;
  int v38 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __132__VNGenerateInstanceMaskDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
  aBlock[3] = &unk_1E5B1C2B0;
  aBlock[4] = self;
  aBlock[5] = &v47;
  aBlock[6] = &v43;
  aBlock[7] = &v39;
  aBlock[8] = &v35;
  aBlock[9] = a4;
  v21 = _Block_copy(aBlock);
  if ((VNExecuteBlock(v21, (uint64_t)a8) & 1) == 0)
  {
    v28 = 0;
    v27 = 0;
    v24 = 0;
    v29 = 0;
LABEL_10:
    int v30 = 2;
    goto LABEL_15;
  }
  if (!self->_gatingOnly && (v36[6] < 0.16 || (unint64_t)v40[3] < 2))
  {
    v28 = 0;
    v27 = 0;
    v24 = 0;
    v29 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_10;
  }
  v22 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v18 error:a8];
  if (v22)
  {
    if (self->_gatingOnly)
    {
      v23 = [VNClassificationObservation alloc];
      v24 = 0;
      *(float *)&double v25 = v36[6];
      v26 = [(VNClassificationObservation *)v23 initWithOriginatingRequestSpecifier:v22 identifier:@"VNGenerateInstanceMaskGate" confidence:v25];
      v27 = v26;
    }
    else
    {
      v31 = [VNInstanceMaskObservation alloc];
      v26 = -[VNInstanceMaskObservation initWithOriginatingRequestSpecifier:lowResMask:instanceMask:numComponents:regionOfInterest:](v31, "initWithOriginatingRequestSpecifier:lowResMask:instanceMask:numComponents:regionOfInterest:", v22, v48[3], v44[3], v40[3], x, y, width, height);
      *(float *)&double v32 = v36[6];
      [(VNObservation *)v26 setConfidence:v32];
      v27 = 0;
      v24 = v26;
    }
    v28 = v26;
    int v30 = 0;
  }
  else
  {
    v28 = 0;
    v27 = 0;
    v24 = 0;
    int v30 = 1;
  }

  v29 = 0;
LABEL_15:
  CVPixelBufferRelease((CVPixelBufferRef)v48[3]);
  v48[3] = 0;
  CVPixelBufferRelease((CVPixelBufferRef)v44[3]);
  v44[3] = 0;
  if (!v30)
  {
    v51[0] = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  return v29;
}

uint64_t __132__VNGenerateInstanceMaskDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _createLowResMaskFromLowResImage:*(void *)(a1 + 72) outMaskPixelBuffer:*(void *)(*(void *)(a1 + 40) + 8) + 24 outInstanceMaskPixelBuffer:*(void *)(*(void *)(a1 + 48) + 8) + 24 outNumComponents:*(void *)(*(void *)(a1 + 56) + 8) + 24 outConfidenceScore:*(void *)(*(void *)(a1 + 64) + 8) + 24 error:a2];
}

- (BOOL)_createLowResMaskFromLowResImage:(__CVBuffer *)a3 outMaskPixelBuffer:(__CVBuffer *)a4 outInstanceMaskPixelBuffer:(__CVBuffer *)a5 outNumComponents:(unint64_t *)a6 outConfidenceScore:(float *)a7 error:(id *)a8
{
  LODWORD(v14) = [(VNEspressoModelFileBasedDetector *)self bindLockedPixelBuffer:a3 toNetworkInputBlobName:@"input_image" error:a8];
  if (v14)
  {
    LODWORD(v14) = [(VNEspressoModelFileBasedDetector *)self executePlanAndReturnError:a8];
    if (v14)
    {
      float v15 = *(float *)self->_outputConfidenceEspressoBuffer.data;
      *a7 = v15;
      if (v15 < 0.16
        || self->_gatingOnly
        || (LODWORD(v14) = [(VNGenerateInstanceMaskDetector *)self _filterUsingConnectedComponentsFromSegmentation:&self->_outputMaskEspressoBuffer outInstanceMask:a5 numComponents:a6], v14)&& (*a6 < 2|| (v14 = +[VNEspressoHelpers createCVPixelBufferWithPixelFormat:1278226534 fromImageInEspressoBuffer:&self->_outputMaskEspressoBuffer error:a8], (*a4 = v14) != 0)))
      {
        LOBYTE(v14) = 1;
      }
    }
  }
  return (char)v14;
}

- (BOOL)_filterUsingConnectedComponentsFromSegmentation:(id *)a3 outInstanceMask:(__CVBuffer *)a4 numComponents:(unint64_t *)a5
{
  BOOL v5 = 0;
  if (!a4) {
    return v5;
  }
  int v6 = a5;
  if (!a5) {
    return v5;
  }
  objc_super v7 = a4;
  CVPixelBufferRef pixelBuffer = 0;
  int v9 = VNCVPixelBufferCreateUsingIOSurface(a3->var4, a3->var5, 0x4C303038u, 0, &pixelBuffer);
  BOOL v5 = v9 == 0;
  if (v9) {
    return v5;
  }
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  if (Width != a3->var4 || Height != a3->var5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A6255EF0](exception, "Image and label dimensions must match.");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  size_t v14 = BytesPerRow;
  var0 = (char *)a3->var0;
  unint64_t v84 = 4 * a3->var10;
  bzero(BaseAddress, BytesPerRow * Height);
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  *(_OWORD *)v87 = 0u;
  long long v88 = 0u;
  v82 = var0;
  if (!Height)
  {
    unint64_t v51 = 1;
    goto LABEL_76;
  }
  v76 = v7;
  v77 = v6;
  v16 = 0;
  v17 = 0;
  unint64_t v18 = 0;
  id v19 = 0;
  uint64_t v80 = 0;
  if (Width <= 1) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = Width;
  }
  unsigned int v83 = 1;
  size_t v21 = Width;
  uint64_t v78 = v20;
  while (!v21)
  {
LABEL_68:
    if (++v80 == Height)
    {
      unint64_t v51 = v83;
      if (v19) {
        operator delete(v19);
      }
      goto LABEL_74;
    }
  }
  uint64_t v22 = 0;
  v23 = &var0[v80 * v84];
  v24 = &BaseAddress[v80 * v14];
  v79 = v23;
  while (1)
  {
    if (v24[v22] || *(float *)&v23[4 * v22] < 0.4) {
      goto LABEL_66;
    }
    unsigned int v25 = v83;
    v24[v22] = v83;
    uint64_t v81 = v22;
    if ((unint64_t)v17 >= v18)
    {
      uint64_t v27 = (v17 - v16) >> 4;
      unint64_t v28 = v27 + 1;
      if ((unint64_t)(v27 + 1) >> 60) {
        std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
      }
      if ((uint64_t)(v18 - (void)v16) >> 3 > v28) {
        unint64_t v28 = (uint64_t)(v18 - (void)v16) >> 3;
      }
      if (v18 - (unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v29 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v29 = v28;
      }
      if (v29) {
        unint64_t v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v29);
      }
      else {
        uint64_t v30 = 0;
      }
      v31 = (void *)(v29 + 16 * v27);
      void *v31 = v80;
      v31[1] = v22;
      if (v17 == v16)
      {
        v33 = (char *)(v29 + 16 * v27);
      }
      else
      {
        unint64_t v32 = v29 + 16 * v27;
        do
        {
          v33 = (char *)(v32 - 16);
          *(_OWORD *)(v32 - 16) = *((_OWORD *)v17 - 1);
          v17 -= 16;
          v32 -= 16;
        }
        while (v17 != v16);
      }
      unint64_t v18 = v29 + 16 * v30;
      v26 = (char *)(v31 + 2);
      if (v16)
      {
        unint64_t v34 = v29 + 16 * v30;
        operator delete(v16);
        unint64_t v18 = v34;
      }
      v16 = v33;
      var0 = v82;
      unsigned int v25 = v83;
    }
    else
    {
      *(void *)v17 = v80;
      *((void *)v17 + 1) = v22;
      v26 = v17 + 16;
    }
    v17 = v16;
    while (v16 != v26)
    {
      uint64_t v35 = 0;
      uint64_t v36 = *((void *)v26 - 2);
      uint64_t v37 = *((void *)v26 - 1);
      v26 -= 16;
      v87[0] = (void *)(v36 - 1);
      v87[1] = (void *)(v37 - 1);
      *(void *)&long long v88 = v36 - 1;
      *((void *)&v88 + 1) = v37;
      *(void *)&long long v90 = v36;
      *((void *)&v90 + 1) = v37 - 1;
      *(void *)&long long v91 = v36;
      *((void *)&v91 + 1) = v37 - 1;
      *(void *)&long long v92 = v36 + 1;
      *((void *)&v92 + 1) = v37 - 1;
      *(void *)&long long v89 = v36 - 1;
      *((void *)&v89 + 1) = v37 + 1;
      *(void *)&long long v93 = v36 + 1;
      *((void *)&v93 + 1) = v37;
      int v38 = v87;
      *(void *)&long long v94 = v36 + 1;
      *((void *)&v94 + 1) = v37 + 1;
      do
      {
        size_t v39 = (size_t)*v38;
        if (((unint64_t)*v38 & 0x8000000000000000) == 0 && v39 < Height)
        {
          unint64_t v40 = (unint64_t)v87[2 * v35 + 1];
          if ((v40 & 0x8000000000000000) == 0 && v40 < Width)
          {
            uint64_t v41 = v38[1];
            uint64_t v42 = &BaseAddress[v39 * v14];
            if (!*((unsigned char *)v41 + (void)v42) && *(float *)&var0[4 * (void)v41 + v39 * v84] > 0.4)
            {
              *((unsigned char *)v41 + (void)v42) = v25;
              if ((unint64_t)v26 >= v18)
              {
                uint64_t v43 = (v26 - v16) >> 4;
                unint64_t v44 = v43 + 1;
                if ((unint64_t)(v43 + 1) >> 60) {
                  std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                }
                if ((uint64_t)(v18 - (void)v16) >> 3 > v44) {
                  unint64_t v44 = (uint64_t)(v18 - (void)v16) >> 3;
                }
                if (v18 - (unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v45 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v45 = v44;
                }
                if (v45) {
                  unint64_t v45 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v45);
                }
                else {
                  uint64_t v46 = 0;
                }
                uint64_t v47 = (_OWORD *)(v45 + 16 * v43);
                *uint64_t v47 = *(_OWORD *)v38;
                if (v26 == v16)
                {
                  uint64_t v49 = (char *)(v45 + 16 * v43);
                }
                else
                {
                  unint64_t v48 = v45 + 16 * v43;
                  do
                  {
                    uint64_t v49 = (char *)(v48 - 16);
                    *(_OWORD *)(v48 - 16) = *((_OWORD *)v26 - 1);
                    v26 -= 16;
                    v48 -= 16;
                  }
                  while (v26 != v16);
                }
                unint64_t v18 = v45 + 16 * v46;
                v26 = (char *)(v47 + 1);
                if (v16)
                {
                  unint64_t v50 = v45 + 16 * v46;
                  operator delete(v16);
                  unint64_t v18 = v50;
                }
                v16 = v49;
                var0 = v82;
                unsigned int v25 = v83;
              }
              else
              {
                *(_OWORD *)v26 = *(_OWORD *)v38;
                v26 += 16;
              }
            }
          }
        }
        ++v35;
        int v38 = &v87[2 * v35];
      }
      while (v35 != 8);
      v17 = v26;
    }
    if (v25 == 255) {
      break;
    }
    unsigned int v83 = v25 + 1;
    id v19 = v16;
    uint64_t v20 = v78;
    v23 = v79;
    uint64_t v22 = v81;
    v24 = &BaseAddress[v80 * v14];
LABEL_66:
    if (++v22 == v20)
    {
      size_t v21 = Width;
      goto LABEL_68;
    }
  }
  if (v16) {
    operator delete(v16);
  }
  unint64_t v51 = 256;
LABEL_74:
  objc_super v7 = v76;
  int v6 = v77;
LABEL_76:
  std::vector<unsigned long>::vector(v87, v51);
  size_t v52 = Width * Height;
  if (Width * Height)
  {
    v53 = v87[0];
    v54 = BaseAddress;
    do
    {
      int v55 = *v54++;
      ++v53[v55];
      --v52;
    }
    while (v52);
  }
  std::vector<unsigned char>::vector(__p, v51, kBackgroundLabel);
  v56 = (unint64_t *)((char *)v87[0] + 8);
  v57 = (unint64_t *)((char *)v87[0] + 16);
  if ((char *)v87[0] + 8 != v87[1] && v57 != v87[1])
  {
    unint64_t v59 = *v56;
    v60 = (unint64_t *)((char *)v87[0] + 16);
    do
    {
      unint64_t v62 = *v60++;
      unint64_t v61 = v62;
      BOOL v63 = v59 >= v62;
      if (v59 <= v62) {
        unint64_t v59 = v61;
      }
      if (!v63) {
        v56 = v57;
      }
      v57 = v60;
    }
    while (v60 != v87[1]);
  }
  if (v51 < 2)
  {
    uint64_t v67 = 1;
    if (!Height) {
      goto LABEL_104;
    }
    goto LABEL_97;
  }
  unint64_t v64 = (unint64_t)(float)((float)*v56 * 0.3);
  uint64_t v65 = 1;
  int v66 = 1;
  uint64_t v67 = 1;
  do
  {
    if (*((void *)v87[0] + v65) >= v64)
    {
      *((unsigned char *)__p[0] + v65) = v66++;
      ++v67;
    }
    ++v65;
  }
  while (v51 != v65);
  if (Height)
  {
LABEL_97:
    for (uint64_t i = 0; i != Height; ++i)
    {
      if (Width)
      {
        v69 = &v82[i * v84];
        size_t v70 = Width;
        do
        {
          uint64_t v71 = *BaseAddress;
          v72 = __p[0];
          unsigned __int8 v73 = *((unsigned char *)__p[0] + v71);
          if (!v73)
          {
            *(_DWORD *)v69 = 0;
            unsigned __int8 v73 = v72[v71];
          }
          *BaseAddress++ = v73;
          v69 += 4;
          --v70;
        }
        while (v70);
      }
    }
  }
LABEL_104:
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  __CFString *v7 = pixelBuffer;
  *int v6 = v67;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v87[0])
  {
    v87[1] = v87[0];
    operator delete(v87[0]);
  }
  return v5;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v13 = *(void *)&a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v19 = a4;
  id v20 = a6;
  id v21 = a9;
  [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
  v23.receiver = self;
  v23.super_class = (Class)VNGenerateInstanceMaskDetector;
  LOBYTE(a8) = -[VNEspressoModelFileBasedDetector createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:](&v23, sel_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler_, v19, v13, v20, a7, a8, v21, x, y, width, height);

  return (char)a8;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VNGenerateInstanceMaskDetector;
  if (!-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v10, sel_completeInitializationForSession_error_, a3))return 0; {
  int v6 = [(VNDetector *)self configurationOptions];
  }
  objc_super v7 = [v6 objectForKeyedSubscript:@"VNGenerateInstanceMaskDetectorCreationOptionGatingOnly"];
  self->_gatingOnldouble y = [v7 BOOLValue];

  BOOL v8 = (self->_gatingOnly
     || [(VNEspressoModelFileBasedDetector *)self bindBuffer:&self->_outputMaskEspressoBuffer toNetworkOutputBlobName:@"saliency" error:a4])&& [(VNEspressoModelFileBasedDetector *)self bindBuffer:&self->_outputConfidenceEspressoBuffer toNetworkOutputBlobName:@"gating_confidence" error:a4];

  return v8;
}

@end