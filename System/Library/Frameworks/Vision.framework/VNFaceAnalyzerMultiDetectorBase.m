@interface VNFaceAnalyzerMultiDetectorBase
+ (BOOL)producesObservationsForMultipleRequestClasses;
+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4;
+ (const)modelVersionForOptions:(id)a3;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (id)keyForDetectorWithConfigurationOptions:(id)a3;
+ (unint64_t)numberOfImageChannels;
+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3;
- (BOOL)_isFaceprintJunk:(shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)a3;
- (BOOL)_saveFaceAttributes:(void *)a3 toFaceObservation:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)_saveFaceprint:(shared_ptr<vision:(id)a4 :(id)a5 mod:(id *)a6 :ImageDescriptorBufferAbstract>)a3 toFaceObservation:options:error:;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id).cxx_construct;
- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (vImage_Buffer)prepare_vImageBufferForCVPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (void)_addFaceAnalysisResultsFromMap:(void *)a3 toFaceAttributeObject:(id)a4 forOriginatingRequestSpecifier:(id)a5;
@end

@implementation VNFaceAnalyzerMultiDetectorBase

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v5 error:a4];
  if (!v6)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_17;
  }
  if ([v6 specifiesRequestClass:objc_opt_class()])
  {
    uint64_t v7 = [v6 requestRevision];
    switch(v7)
    {
      case 4:
      case 5:
      case 6:
      case 7:
        goto LABEL_16;
      default:
        if (v7 != 100 && v7 != 101) {
          goto LABEL_13;
        }
        goto LABEL_16;
    }
  }
  if (![v6 specifiesRequestClass:objc_opt_class()])
  {
    if ([v6 specifiesRequestClass:objc_opt_class()])
    {
      unint64_t v8 = [v6 requestRevision] - 3737841664;
      if (v8 < 7 && ((0x6Fu >> v8) & 1) != 0) {
        goto LABEL_16;
      }
    }
    goto LABEL_13;
  }
  if ((unint64_t)([v6 requestRevision] - 3737841665) >= 6)
  {
LABEL_13:
    if (a4)
    {
      +[VNError errorForUnsupportedRequestSpecifier:v6];
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_15;
  }
LABEL_16:
  v9 = objc_opt_class();
LABEL_17:

  return (Class)v9;
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  return self;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v209[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v185.receiver = self;
  v185.super_class = (Class)VNFaceAnalyzerMultiDetectorBase;
  if (![(VNEspressoModelFileBasedDetector *)&v185 completeInitializationForSession:v6 error:a4])
  {
    BOOL v14 = 0;
    goto LABEL_297;
  }
  v177 = self;
  uint64_t v7 = [(VNDetector *)self configurationOptions];
  unint64_t v8 = [v7 objectForKeyedSubscript:@"VNDetectorOption_RequestDetectionLevel"];
  v176 = a4;
  uint64_t v9 = [v8 unsignedIntegerValue];

  uint64_t v10 = [(id)objc_opt_class() modelVersionForOptions:v7];
  size_t v11 = *(void *)(v10 + 8);
  if (v11 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  v12 = *(const void **)v10;
  if (v11 >= 0x17)
  {
    uint64_t v15 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17) {
      uint64_t v15 = v11 | 7;
    }
    uint64_t v16 = v15 + 1;
    p_dst = (void **)operator new(v15 + 1);
    size_t v183 = v11;
    int64_t v184 = v16 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_10;
  }
  HIBYTE(v184) = *(void *)(v10 + 8);
  p_dst = (void **)&__dst;
  if (v11) {
LABEL_10:
  }
    memmove(p_dst, v12, v11);
  *((unsigned char *)p_dst + v11) = 0;
  v175 = [(VNEspressoModelFileBasedDetector *)v177 espressoResources];
  uint64_t v18 = [v175 network];
  if (v18)
  {
    uint64_t v19 = v17;
    v20 = (char *)operator new(0x1A70uLL);
    v21 = v20;
    *(_OWORD *)(v20 + 8) = 0u;
    *(void *)v20 = &unk_1EF753A48;
    *((_DWORD *)v20 + 39) = 65568;
    v20[6644] = 0;
    *((void *)v20 + 837) = v20 + 6704;
    *((void *)v20 + 843) = v20 + 6752;
    *((void *)v20 + 15) = v18;
    *((void *)v20 + 16) = v18;
    *((void *)v20 + 17) = v19;
    size_t v22 = HIBYTE(v184);
    int v23 = SHIBYTE(v184);
    v24 = __dst;
    if (v184 < 0) {
      size_t v22 = v183;
    }
    *(_OWORD *)(v20 + 24) = 0uLL;
    v25 = (std::vector<std::string> *)(v20 + 24);
    *(_OWORD *)(v20 + 40) = 0uLL;
    *(_OWORD *)(v20 + 56) = 0uLL;
    *(_OWORD *)(v20 + 72) = 0uLL;
    *(_OWORD *)(v20 + 88) = 0uLL;
    *(_OWORD *)(v20 + 104) = 0uLL;
    *(void *)(v20 + 148) = 0xFFFFFFFF00000000;
    *((_DWORD *)v20 + 1660) = 0;
    *((_OWORD *)v20 + 419) = 0uLL;
    *((_OWORD *)v20 + 10) = 0uLL;
    *((_OWORD *)v20 + 11) = 0uLL;
    *((_OWORD *)v20 + 12) = 0uLL;
    *((_OWORD *)v20 + 13) = 0uLL;
    *((_OWORD *)v20 + 14) = 0uLL;
    *((_OWORD *)v20 + 15) = 0uLL;
    *((_OWORD *)v20 + 16) = 0uLL;
    *((_OWORD *)v20 + 17) = 0uLL;
    *((_OWORD *)v20 + 18) = 0uLL;
    *((_OWORD *)v20 + 19) = 0uLL;
    *((_DWORD *)v20 + 80) = 0;
    *((_DWORD *)v20 + 122) = 0;
    *(_OWORD *)(v20 + 456) = 0uLL;
    *(_OWORD *)(v20 + 472) = 0uLL;
    *(_OWORD *)(v20 + 424) = 0uLL;
    *(_OWORD *)(v20 + 440) = 0uLL;
    *(_OWORD *)(v20 + 392) = 0uLL;
    *(_OWORD *)(v20 + 408) = 0uLL;
    *(_OWORD *)(v20 + 360) = 0uLL;
    *(_OWORD *)(v20 + 376) = 0uLL;
    *(_OWORD *)(v20 + 328) = 0uLL;
    *(_OWORD *)(v20 + 344) = 0uLL;
    *((_DWORD *)v20 + 164) = 0;
    *((_OWORD *)v20 + 37) = 0uLL;
    *((_OWORD *)v20 + 38) = 0uLL;
    *((_OWORD *)v20 + 35) = 0uLL;
    *((_OWORD *)v20 + 36) = 0uLL;
    *((_OWORD *)v20 + 33) = 0uLL;
    *((_OWORD *)v20 + 34) = 0uLL;
    *((_OWORD *)v20 + 31) = 0uLL;
    *((_OWORD *)v20 + 32) = 0uLL;
    *((_OWORD *)v20 + 39) = 0uLL;
    *((_OWORD *)v20 + 40) = 0uLL;
    *((_DWORD *)v20 + 206) = 0;
    *(_OWORD *)(v20 + 792) = 0uLL;
    *(_OWORD *)(v20 + 808) = 0uLL;
    *(_OWORD *)(v20 + 760) = 0uLL;
    *(_OWORD *)(v20 + 776) = 0uLL;
    *(_OWORD *)(v20 + 728) = 0uLL;
    *(_OWORD *)(v20 + 744) = 0uLL;
    *(_OWORD *)(v20 + 696) = 0uLL;
    *(_OWORD *)(v20 + 712) = 0uLL;
    *(_OWORD *)(v20 + 664) = 0uLL;
    *(_OWORD *)(v20 + 680) = 0uLL;
    *((_OWORD *)v20 + 52) = 0uLL;
    *((_OWORD *)v20 + 53) = 0uLL;
    *((_OWORD *)v20 + 54) = 0uLL;
    *((_OWORD *)v20 + 55) = 0uLL;
    *((_OWORD *)v20 + 56) = 0uLL;
    *((_OWORD *)v20 + 57) = 0uLL;
    *((_OWORD *)v20 + 58) = 0uLL;
    *((_OWORD *)v20 + 59) = 0uLL;
    *((_OWORD *)v20 + 60) = 0uLL;
    *((_OWORD *)v20 + 61) = 0uLL;
    *((_DWORD *)v20 + 248) = 0;
    *((_DWORD *)v20 + 290) = 0;
    *(_OWORD *)(v20 + 1144) = 0uLL;
    *(_OWORD *)(v20 + 1128) = 0uLL;
    *(_OWORD *)(v20 + 1112) = 0uLL;
    *(_OWORD *)(v20 + 1096) = 0uLL;
    *(_OWORD *)(v20 + 1080) = 0uLL;
    *(_OWORD *)(v20 + 1064) = 0uLL;
    *(_OWORD *)(v20 + 1032) = 0uLL;
    *(_OWORD *)(v20 + 1048) = 0uLL;
    *(_OWORD *)(v20 + 1000) = 0uLL;
    *(_OWORD *)(v20 + 1016) = 0uLL;
    *((_DWORD *)v20 + 332) = 0;
    *((_OWORD *)v20 + 82) = 0uLL;
    *((_OWORD *)v20 + 81) = 0uLL;
    *((_OWORD *)v20 + 80) = 0uLL;
    *((_OWORD *)v20 + 79) = 0uLL;
    *((_OWORD *)v20 + 78) = 0uLL;
    *((_OWORD *)v20 + 77) = 0uLL;
    *((_OWORD *)v20 + 76) = 0uLL;
    *((_OWORD *)v20 + 75) = 0uLL;
    *((_OWORD *)v20 + 74) = 0uLL;
    *((_OWORD *)v20 + 73) = 0uLL;
    *((_DWORD *)v20 + 374) = 0;
    *(_OWORD *)(v20 + 1480) = 0uLL;
    *(_OWORD *)(v20 + 1464) = 0uLL;
    *(_OWORD *)(v20 + 1448) = 0uLL;
    *(_OWORD *)(v20 + 1432) = 0uLL;
    *(_OWORD *)(v20 + 1416) = 0uLL;
    *(_OWORD *)(v20 + 1400) = 0uLL;
    *(_OWORD *)(v20 + 1384) = 0uLL;
    *(_OWORD *)(v20 + 1368) = 0uLL;
    *(_OWORD *)(v20 + 1352) = 0uLL;
    *(_OWORD *)(v20 + 1336) = 0uLL;
    *((_DWORD *)v20 + 416) = 0;
    *((_OWORD *)v20 + 103) = 0uLL;
    *((_OWORD *)v20 + 102) = 0uLL;
    *((_OWORD *)v20 + 101) = 0uLL;
    *((_OWORD *)v20 + 100) = 0uLL;
    *((_OWORD *)v20 + 99) = 0uLL;
    *((_OWORD *)v20 + 98) = 0uLL;
    *((_OWORD *)v20 + 97) = 0uLL;
    *((_OWORD *)v20 + 96) = 0uLL;
    *((_OWORD *)v20 + 95) = 0uLL;
    *((_OWORD *)v20 + 94) = 0uLL;
    *((_DWORD *)v20 + 458) = 0;
    *(_OWORD *)(v20 + 1816) = 0uLL;
    *(_OWORD *)(v20 + 1800) = 0uLL;
    *(_OWORD *)(v20 + 1784) = 0uLL;
    *(_OWORD *)(v20 + 1768) = 0uLL;
    *(_OWORD *)(v20 + 1752) = 0uLL;
    *(_OWORD *)(v20 + 1736) = 0uLL;
    *(_OWORD *)(v20 + 1720) = 0uLL;
    *(_OWORD *)(v20 + 1704) = 0uLL;
    *(_OWORD *)(v20 + 1688) = 0uLL;
    *(_OWORD *)(v20 + 1672) = 0uLL;
    *((_DWORD *)v20 + 500) = 0;
    *((_OWORD *)v20 + 124) = 0uLL;
    *((_OWORD *)v20 + 123) = 0uLL;
    *((_OWORD *)v20 + 122) = 0uLL;
    *((_OWORD *)v20 + 121) = 0uLL;
    *((_OWORD *)v20 + 120) = 0uLL;
    *((_OWORD *)v20 + 119) = 0uLL;
    *((_OWORD *)v20 + 118) = 0uLL;
    *((_OWORD *)v20 + 117) = 0uLL;
    *((_OWORD *)v20 + 116) = 0uLL;
    *((_OWORD *)v20 + 115) = 0uLL;
    *((_DWORD *)v20 + 542) = 0;
    *(_OWORD *)(v20 + 2152) = 0uLL;
    *(_OWORD *)(v20 + 2136) = 0uLL;
    *(_OWORD *)(v20 + 2120) = 0uLL;
    *(_OWORD *)(v20 + 2104) = 0uLL;
    *(_OWORD *)(v20 + 2088) = 0uLL;
    *(_OWORD *)(v20 + 2072) = 0uLL;
    *(_OWORD *)(v20 + 2056) = 0uLL;
    *(_OWORD *)(v20 + 2040) = 0uLL;
    *(_OWORD *)(v20 + 2024) = 0uLL;
    *(_OWORD *)(v20 + 2008) = 0uLL;
    *((_DWORD *)v20 + 584) = 0;
    *((_OWORD *)v20 + 145) = 0uLL;
    *((_OWORD *)v20 + 144) = 0uLL;
    *((_OWORD *)v20 + 143) = 0uLL;
    *((_OWORD *)v20 + 142) = 0uLL;
    *((_OWORD *)v20 + 141) = 0uLL;
    *((_OWORD *)v20 + 140) = 0uLL;
    *((_OWORD *)v20 + 139) = 0uLL;
    *((_OWORD *)v20 + 138) = 0uLL;
    *((_OWORD *)v20 + 137) = 0uLL;
    *((_OWORD *)v20 + 136) = 0uLL;
    *((_DWORD *)v20 + 626) = 0;
    *(_OWORD *)(v20 + 2488) = 0uLL;
    *(_OWORD *)(v20 + 2472) = 0uLL;
    *(_OWORD *)(v20 + 2456) = 0uLL;
    *(_OWORD *)(v20 + 2440) = 0uLL;
    *(_OWORD *)(v20 + 2424) = 0uLL;
    *(_OWORD *)(v20 + 2408) = 0uLL;
    *(_OWORD *)(v20 + 2392) = 0uLL;
    *(_OWORD *)(v20 + 2376) = 0uLL;
    *(_OWORD *)(v20 + 2360) = 0uLL;
    *(_OWORD *)(v20 + 2344) = 0uLL;
    *((_DWORD *)v20 + 668) = 0;
    *((_OWORD *)v20 + 166) = 0uLL;
    *((_OWORD *)v20 + 165) = 0uLL;
    *((_OWORD *)v20 + 164) = 0uLL;
    *((_OWORD *)v20 + 163) = 0uLL;
    *((_OWORD *)v20 + 162) = 0uLL;
    *((_OWORD *)v20 + 161) = 0uLL;
    *((_OWORD *)v20 + 160) = 0uLL;
    *((_OWORD *)v20 + 159) = 0uLL;
    *((_OWORD *)v20 + 158) = 0uLL;
    *((_OWORD *)v20 + 157) = 0uLL;
    *((_DWORD *)v20 + 710) = 0;
    *(_OWORD *)(v20 + 2824) = 0uLL;
    *(_OWORD *)(v20 + 2808) = 0uLL;
    *(_OWORD *)(v20 + 2792) = 0uLL;
    *(_OWORD *)(v20 + 2776) = 0uLL;
    *(_OWORD *)(v20 + 2760) = 0uLL;
    *(_OWORD *)(v20 + 2744) = 0uLL;
    *(_OWORD *)(v20 + 2728) = 0uLL;
    *(_OWORD *)(v20 + 2712) = 0uLL;
    *(_OWORD *)(v20 + 2696) = 0uLL;
    *(_OWORD *)(v20 + 2680) = 0uLL;
    *((_DWORD *)v20 + 752) = 0;
    *((_OWORD *)v20 + 187) = 0uLL;
    *((_OWORD *)v20 + 186) = 0uLL;
    *((_OWORD *)v20 + 185) = 0uLL;
    *((_OWORD *)v20 + 184) = 0uLL;
    *((_OWORD *)v20 + 183) = 0uLL;
    *((_OWORD *)v20 + 182) = 0uLL;
    *((_OWORD *)v20 + 181) = 0uLL;
    *((_OWORD *)v20 + 180) = 0uLL;
    *((_OWORD *)v20 + 179) = 0uLL;
    *((_OWORD *)v20 + 178) = 0uLL;
    *((_DWORD *)v20 + 794) = 0;
    *(_OWORD *)(v20 + 3160) = 0uLL;
    *(_OWORD *)(v20 + 3144) = 0uLL;
    *(_OWORD *)(v20 + 3128) = 0uLL;
    *(_OWORD *)(v20 + 3112) = 0uLL;
    *(_OWORD *)(v20 + 3096) = 0uLL;
    *(_OWORD *)(v20 + 3080) = 0uLL;
    *(_OWORD *)(v20 + 3064) = 0uLL;
    *(_OWORD *)(v20 + 3048) = 0uLL;
    *(_OWORD *)(v20 + 3032) = 0uLL;
    *(_OWORD *)(v20 + 3016) = 0uLL;
    *((_DWORD *)v20 + 836) = 0;
    *((_OWORD *)v20 + 208) = 0uLL;
    *((_OWORD *)v20 + 207) = 0uLL;
    *((_OWORD *)v20 + 206) = 0uLL;
    *((_OWORD *)v20 + 205) = 0uLL;
    *((_OWORD *)v20 + 204) = 0uLL;
    *((_OWORD *)v20 + 203) = 0uLL;
    *((_OWORD *)v20 + 202) = 0uLL;
    *((_OWORD *)v20 + 201) = 0uLL;
    *((_OWORD *)v20 + 200) = 0uLL;
    *((_OWORD *)v20 + 199) = 0uLL;
    *((_DWORD *)v20 + 878) = 0;
    *(_OWORD *)(v20 + 3496) = 0uLL;
    *(_OWORD *)(v20 + 3480) = 0uLL;
    *(_OWORD *)(v20 + 3464) = 0uLL;
    *(_OWORD *)(v20 + 3448) = 0uLL;
    *(_OWORD *)(v20 + 3432) = 0uLL;
    *(_OWORD *)(v20 + 3416) = 0uLL;
    *(_OWORD *)(v20 + 3400) = 0uLL;
    *(_OWORD *)(v20 + 3384) = 0uLL;
    *(_OWORD *)(v20 + 3368) = 0uLL;
    *(_OWORD *)(v20 + 3352) = 0uLL;
    *((_DWORD *)v20 + 920) = 0;
    *((_OWORD *)v20 + 229) = 0uLL;
    *((_OWORD *)v20 + 228) = 0uLL;
    *((_OWORD *)v20 + 227) = 0uLL;
    *((_OWORD *)v20 + 226) = 0uLL;
    *((_OWORD *)v20 + 225) = 0uLL;
    *((_OWORD *)v20 + 224) = 0uLL;
    *((_OWORD *)v20 + 223) = 0uLL;
    *((_OWORD *)v20 + 222) = 0uLL;
    *((_OWORD *)v20 + 221) = 0uLL;
    *((_OWORD *)v20 + 220) = 0uLL;
    *((_DWORD *)v20 + 962) = 0;
    *((_DWORD *)v20 + 1004) = 0;
    *((_OWORD *)v20 + 250) = 0uLL;
    *((_OWORD *)v20 + 249) = 0uLL;
    *((_OWORD *)v20 + 248) = 0uLL;
    *((_OWORD *)v20 + 247) = 0uLL;
    *((_OWORD *)v20 + 246) = 0uLL;
    *((_OWORD *)v20 + 245) = 0uLL;
    *((_OWORD *)v20 + 244) = 0uLL;
    *((_OWORD *)v20 + 243) = 0uLL;
    *((_OWORD *)v20 + 242) = 0uLL;
    *((_OWORD *)v20 + 241) = 0uLL;
    *((_DWORD *)v20 + 1046) = 0;
    *(_OWORD *)(v20 + 4168) = 0uLL;
    *(_OWORD *)(v20 + 4152) = 0uLL;
    *(_OWORD *)(v20 + 4136) = 0uLL;
    *(_OWORD *)(v20 + 4120) = 0uLL;
    *(_OWORD *)(v20 + 4104) = 0uLL;
    *(_OWORD *)(v20 + 4088) = 0uLL;
    *(_OWORD *)(v20 + 4072) = 0uLL;
    *(_OWORD *)(v20 + 4056) = 0uLL;
    *(_OWORD *)(v20 + 4040) = 0uLL;
    *(_OWORD *)(v20 + 4024) = 0uLL;
    *((_DWORD *)v20 + 1088) = 0;
    *((_OWORD *)v20 + 271) = 0uLL;
    *((_OWORD *)v20 + 270) = 0uLL;
    *((_OWORD *)v20 + 269) = 0uLL;
    *((_OWORD *)v20 + 268) = 0uLL;
    *((_OWORD *)v20 + 267) = 0uLL;
    *((_OWORD *)v20 + 266) = 0uLL;
    *((_OWORD *)v20 + 265) = 0uLL;
    *((_OWORD *)v20 + 264) = 0uLL;
    *((_OWORD *)v20 + 263) = 0uLL;
    *((_OWORD *)v20 + 262) = 0uLL;
    *((_DWORD *)v20 + 1130) = 0;
    *(_OWORD *)(v20 + 4504) = 0uLL;
    *(_OWORD *)(v20 + 4488) = 0uLL;
    *(_OWORD *)(v20 + 4472) = 0uLL;
    *(_OWORD *)(v20 + 4456) = 0uLL;
    *(_OWORD *)(v20 + 4440) = 0uLL;
    *(_OWORD *)(v20 + 4424) = 0uLL;
    *(_OWORD *)(v20 + 4408) = 0uLL;
    *(_OWORD *)(v20 + 4392) = 0uLL;
    *(_OWORD *)(v20 + 4376) = 0uLL;
    *(_OWORD *)(v20 + 4360) = 0uLL;
    *((_DWORD *)v20 + 1172) = 0;
    *((_OWORD *)v20 + 292) = 0uLL;
    *((_OWORD *)v20 + 291) = 0uLL;
    *((_OWORD *)v20 + 290) = 0uLL;
    *((_OWORD *)v20 + 289) = 0uLL;
    *((_OWORD *)v20 + 288) = 0uLL;
    *((_OWORD *)v20 + 287) = 0uLL;
    *((_OWORD *)v20 + 286) = 0uLL;
    *((_OWORD *)v20 + 285) = 0uLL;
    *((_OWORD *)v20 + 284) = 0uLL;
    *((_OWORD *)v20 + 283) = 0uLL;
    *((_DWORD *)v20 + 1214) = 0;
    *(_OWORD *)(v20 + 4840) = 0uLL;
    *(_OWORD *)(v20 + 4824) = 0uLL;
    *(_OWORD *)(v20 + 4808) = 0uLL;
    *(_OWORD *)(v20 + 4792) = 0uLL;
    *(_OWORD *)(v20 + 4776) = 0uLL;
    *(_OWORD *)(v20 + 4760) = 0uLL;
    *(_OWORD *)(v20 + 4744) = 0uLL;
    *(_OWORD *)(v20 + 4728) = 0uLL;
    *(_OWORD *)(v20 + 4712) = 0uLL;
    *(_OWORD *)(v20 + 4696) = 0uLL;
    *((_DWORD *)v20 + 1256) = 0;
    *((_OWORD *)v20 + 313) = 0uLL;
    *((_OWORD *)v20 + 312) = 0uLL;
    *((_OWORD *)v20 + 311) = 0uLL;
    *((_OWORD *)v20 + 310) = 0uLL;
    *((_OWORD *)v20 + 309) = 0uLL;
    *((_OWORD *)v20 + 308) = 0uLL;
    *((_OWORD *)v20 + 307) = 0uLL;
    *((_OWORD *)v20 + 306) = 0uLL;
    *((_OWORD *)v20 + 305) = 0uLL;
    *((_OWORD *)v20 + 304) = 0uLL;
    *((_DWORD *)v20 + 1298) = 0;
    *(_OWORD *)(v20 + 5176) = 0uLL;
    *(_OWORD *)(v20 + 5160) = 0uLL;
    *(_OWORD *)(v20 + 5144) = 0uLL;
    *(_OWORD *)(v20 + 5128) = 0uLL;
    *(_OWORD *)(v20 + 5112) = 0uLL;
    *(_OWORD *)(v20 + 5096) = 0uLL;
    *(_OWORD *)(v20 + 5080) = 0uLL;
    *(_OWORD *)(v20 + 5064) = 0uLL;
    *(_OWORD *)(v20 + 5048) = 0uLL;
    *(_OWORD *)(v20 + 5032) = 0uLL;
    *((_DWORD *)v20 + 1340) = 0;
    *((_OWORD *)v20 + 334) = 0uLL;
    *((_OWORD *)v20 + 333) = 0uLL;
    *((_OWORD *)v20 + 332) = 0uLL;
    *((_OWORD *)v20 + 331) = 0uLL;
    *((_OWORD *)v20 + 330) = 0uLL;
    *((_OWORD *)v20 + 329) = 0uLL;
    *((_OWORD *)v20 + 328) = 0uLL;
    *((_OWORD *)v20 + 327) = 0uLL;
    *((_OWORD *)v20 + 326) = 0uLL;
    *((_OWORD *)v20 + 325) = 0uLL;
    *((_DWORD *)v20 + 1382) = 0;
    *(_OWORD *)(v20 + 5512) = 0uLL;
    *(_OWORD *)(v20 + 5496) = 0uLL;
    *(_OWORD *)(v20 + 5480) = 0uLL;
    *(_OWORD *)(v20 + 5464) = 0uLL;
    *(_OWORD *)(v20 + 5448) = 0uLL;
    *(_OWORD *)(v20 + 5432) = 0uLL;
    *(_OWORD *)(v20 + 5416) = 0uLL;
    *(_OWORD *)(v20 + 5400) = 0uLL;
    *(_OWORD *)(v20 + 5384) = 0uLL;
    *(_OWORD *)(v20 + 5368) = 0uLL;
    *((_DWORD *)v20 + 1424) = 0;
    *((_OWORD *)v20 + 355) = 0uLL;
    *((_OWORD *)v20 + 354) = 0uLL;
    *((_OWORD *)v20 + 353) = 0uLL;
    *((_OWORD *)v20 + 352) = 0uLL;
    *((_OWORD *)v20 + 351) = 0uLL;
    *((_OWORD *)v20 + 350) = 0uLL;
    *((_OWORD *)v20 + 349) = 0uLL;
    *((_OWORD *)v20 + 348) = 0uLL;
    *((_OWORD *)v20 + 347) = 0uLL;
    *((_OWORD *)v20 + 346) = 0uLL;
    *((_DWORD *)v20 + 1466) = 0;
    *(_OWORD *)(v20 + 5848) = 0uLL;
    *(_OWORD *)(v20 + 5832) = 0uLL;
    *(_OWORD *)(v20 + 5816) = 0uLL;
    *(_OWORD *)(v20 + 5800) = 0uLL;
    *(_OWORD *)(v20 + 5784) = 0uLL;
    *(_OWORD *)(v20 + 5768) = 0uLL;
    *(_OWORD *)(v20 + 5752) = 0uLL;
    *(_OWORD *)(v20 + 5736) = 0uLL;
    *(_OWORD *)(v20 + 5720) = 0uLL;
    *(_OWORD *)(v20 + 5704) = 0uLL;
    *((_DWORD *)v20 + 1508) = 0;
    *((_OWORD *)v20 + 376) = 0uLL;
    *((_OWORD *)v20 + 375) = 0uLL;
    *((_OWORD *)v20 + 374) = 0uLL;
    *((_OWORD *)v20 + 373) = 0uLL;
    *((_OWORD *)v20 + 372) = 0uLL;
    *((_OWORD *)v20 + 371) = 0uLL;
    *((_OWORD *)v20 + 370) = 0uLL;
    *((_OWORD *)v20 + 369) = 0uLL;
    *((_OWORD *)v20 + 368) = 0uLL;
    *((_OWORD *)v20 + 367) = 0uLL;
    *((_DWORD *)v20 + 1550) = 0;
    *(_OWORD *)(v20 + 6184) = 0uLL;
    *(_OWORD *)(v20 + 6168) = 0uLL;
    *(_OWORD *)(v20 + 6152) = 0uLL;
    *(_OWORD *)(v20 + 6136) = 0uLL;
    *(_OWORD *)(v20 + 6120) = 0uLL;
    *(_OWORD *)(v20 + 6104) = 0uLL;
    *(_OWORD *)(v20 + 6088) = 0uLL;
    *(_OWORD *)(v20 + 6072) = 0uLL;
    *(_OWORD *)(v20 + 6056) = 0uLL;
    *(_OWORD *)(v20 + 6040) = 0uLL;
    *((_DWORD *)v20 + 1616) = 0;
    *((_OWORD *)v20 + 403) = 0uLL;
    *((_OWORD *)v20 + 402) = 0uLL;
    *((_OWORD *)v20 + 401) = 0uLL;
    *((_OWORD *)v20 + 400) = 0uLL;
    *((_OWORD *)v20 + 399) = 0uLL;
    *((_OWORD *)v20 + 398) = 0uLL;
    *((_OWORD *)v20 + 397) = 0uLL;
    *((_OWORD *)v20 + 396) = 0uLL;
    *((_OWORD *)v20 + 395) = 0uLL;
    *((_OWORD *)v20 + 394) = 0uLL;
    *((_OWORD *)v20 + 393) = 0uLL;
    *((_OWORD *)v20 + 392) = 0uLL;
    *((_OWORD *)v20 + 391) = 0uLL;
    *((_OWORD *)v20 + 390) = 0uLL;
    *((_OWORD *)v20 + 389) = 0uLL;
    *((_OWORD *)v20 + 388) = 0uLL;
    *((_DWORD *)v20 + 1658) = 0;
    *(_OWORD *)(v20 + 6616) = 0uLL;
    *(_OWORD *)(v20 + 6600) = 0uLL;
    *(_OWORD *)(v20 + 6584) = 0uLL;
    *(_OWORD *)(v20 + 6568) = 0uLL;
    *(_OWORD *)(v20 + 6552) = 0uLL;
    *(_OWORD *)(v20 + 6536) = 0uLL;
    *(_OWORD *)(v20 + 6520) = 0uLL;
    *(_OWORD *)(v20 + 6504) = 0uLL;
    *(_OWORD *)(v20 + 6488) = 0uLL;
    *(_OWORD *)(v20 + 6472) = 0uLL;
    *(_OWORD *)(v20 + 6648) = 0uLL;
    *(_OWORD *)(v20 + 6664) = 0uLL;
    *(_OWORD *)(v20 + 6680) = 0uLL;
    *(_OWORD *)(v20 + 3832) = 0uLL;
    *(_OWORD *)(v20 + 3816) = 0uLL;
    *((_DWORD *)v20 + 1680) = 0;
    *(_OWORD *)(v20 + 6728) = 0uLL;
    *((_OWORD *)v20 + 422) = 0uLL;
    v20[144] = 0;
    *(_OWORD *)(v20 + 3800) = 0uLL;
    *(_OWORD *)(v20 + 3784) = 0uLL;
    *(_OWORD *)(v20 + 3688) = 0uLL;
    memset(&__p, 0, sizeof(__p));
    *(_OWORD *)(v20 + 3768) = 0uLL;
    *(_OWORD *)(v20 + 3752) = 0uLL;
    *(_OWORD *)(v20 + 3736) = 0uLL;
    *(_OWORD *)(v20 + 3720) = 0uLL;
    *(_OWORD *)(v20 + 3704) = 0uLL;
    if (v22 != 2)
    {
      if (v22 != 4) {
        goto LABEL_35;
      }
      BOOL v26 = v23 < 0;
      v27 = (void **)&__dst;
      if (v26) {
        v27 = v24;
      }
      if (*(_DWORD *)v27 == 825111670)
      {
        *((unsigned char *)&__p.__r_.__value_.__s + 23) = 3;
        qmemcpy(&__p, "3.0", 3);
        if (v20[87] < 0)
        {
          *((void *)v20 + 9) = 15;
          v34 = (char *)*((void *)v20 + 8);
        }
        else
        {
          v34 = v20 + 64;
          v20[87] = 15;
        }
        strcpy(v34, "1.3_lightweight");
        *((_DWORD *)v20 + 22) = 16842752;
LABEL_62:
        std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          std::string::size_type size = __p.__r_.__value_.__l.__size_;
        }
        if (size == 3)
        {
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            p_p = &__p;
          }
          if (LOWORD(p_p->__r_.__value_.__l.__data_) == 11826 && p_p->__r_.__value_.__s.__data_[2] == 50)
          {
            float v45 = 1.0;
            char v44 = 1;
          }
          else
          {
            BOOL v47 = LOWORD(p_p->__r_.__value_.__l.__data_) == 11827 && p_p->__r_.__value_.__s.__data_[2] == 48;
            float v45 = 0.0039216;
            if (!v47
              && (LOWORD(p_p->__r_.__value_.__l.__data_) != 11827 || p_p->__r_.__value_.__s.__data_[2] != 49)
              && (LOWORD(p_p->__r_.__value_.__l.__data_) != 11828 || p_p->__r_.__value_.__s.__data_[2] != 48))
            {
LABEL_94:
              syslog(5, "[Error] Failed to find the default network options for version . %s");
              goto LABEL_95;
            }
            char v44 = 0;
          }
        }
        else
        {
          if (size != 5) {
            goto LABEL_94;
          }
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            p_p = &__p;
          }
          if (LODWORD(p_p->__r_.__value_.__l.__data_) != 774975027 || p_p->__r_.__value_.__s.__data_[4] != 51) {
            goto LABEL_94;
          }
          char v44 = 0;
          float v45 = 0.0039216;
        }
        v20[97] = v44;
        v20[98] = v44;
        v20[99] = 0;
        *((float *)v20 + 23) = v45;
        v20[96] = 1;
        v51 = (unsigned __int16 *)(v20 + 64);
        uint64_t v52 = v20[87];
        int v53 = (char)v52;
        if ((v52 & 0x80u) != 0) {
          uint64_t v52 = *((void *)v20 + 9);
        }
        if (v52 == 15)
        {
          if (v53 < 0) {
            v51 = *(unsigned __int16 **)v51;
          }
          uint64_t v62 = *(void *)v51;
          uint64_t v63 = *(void *)((char *)v51 + 7);
          if (v62 == 0x6867696C5F332E31 && v63 == 0x7468676965777468)
          {
            std::string::basic_string[abi:ne180100]<0>(__v, "UNKNOWN_1");
            std::string::basic_string[abi:ne180100]<0>(&__v[24], "UNKNOWN_16");
            std::string::basic_string[abi:ne180100]<0>(&v189, "UNKNOWN_17");
            std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>(v25 + 276, (std::string *)__v, (long long *)((char *)&v190 + 8), 3uLL);
            for (uint64_t i = 0; i != -72; i -= 24)
            {
              if (*((char *)&v190 + i + 7) < 0) {
                operator delete(*(void **)((char *)&v189 + i));
              }
            }
          }
        }
        else if (v52 == 3)
        {
          if (v53 < 0) {
            v51 = *(unsigned __int16 **)v51;
          }
          BOOL v54 = *v51 == 11825 && *((unsigned char *)v51 + 2) == 48;
          if (v54 || (*v51 == 11825 ? (BOOL v55 = *((unsigned char *)v51 + 2) == 49) : (BOOL v55 = 0), v55))
          {
            std::string::basic_string[abi:ne180100]<0>(__v, "UNKNOWN_0");
            std::string::basic_string[abi:ne180100]<0>(&__v[24], "UNKNOWN_1");
            std::string::basic_string[abi:ne180100]<0>(&v189, "UNKNOWN_2");
            std::string::basic_string[abi:ne180100]<0>((void *)&v190 + 1, "UNKNOWN_3");
            std::string::basic_string[abi:ne180100]<0>(&v192, "UNKNOWN_4");
            std::string::basic_string[abi:ne180100]<0>((void *)&v193 + 1, "UNKNOWN_6");
            std::string::basic_string[abi:ne180100]<0>(&v195, "UNKNOWN_7");
            std::string::basic_string[abi:ne180100]<0>(v197, "UNKNOWN_5");
            std::string::basic_string[abi:ne180100]<0>(v198, "UNKNOWN_8");
            std::string::basic_string[abi:ne180100]<0>(v199, "UNKNOWN_9");
            std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>(v25 + 276, (std::string *)__v, &v200, 0xAuLL);
            for (uint64_t j = 0; j != -30; j -= 3)
            {
              if (SHIBYTE(v199[j + 2]) < 0) {
                operator delete((void *)v199[j]);
              }
            }
          }
          else if (*v51 == 11825 && *((unsigned char *)v51 + 2) == 50)
          {
            std::string::basic_string[abi:ne180100]<0>(__v, "UNKNOWN_0");
            std::string::basic_string[abi:ne180100]<0>(&__v[24], "UNKNOWN_1");
            std::string::basic_string[abi:ne180100]<0>(&v189, "UNKNOWN_2");
            std::string::basic_string[abi:ne180100]<0>((void *)&v190 + 1, "UNKNOWN_3");
            std::string::basic_string[abi:ne180100]<0>(&v192, "UNKNOWN_4");
            std::string::basic_string[abi:ne180100]<0>((void *)&v193 + 1, "UNKNOWN_6");
            std::string::basic_string[abi:ne180100]<0>(&v195, "UNKNOWN_7");
            std::string::basic_string[abi:ne180100]<0>(v197, "UNKNOWN_5");
            std::string::basic_string[abi:ne180100]<0>(v198, "UNKNOWN_8");
            std::string::basic_string[abi:ne180100]<0>(v199, "UNKNOWN_9");
            std::string::basic_string[abi:ne180100]<0>(&v200, "UNKNOWN_10");
            std::string::basic_string[abi:ne180100]<0>(v201, "UNKNOWN_11");
            std::string::basic_string[abi:ne180100]<0>(v202, "UNKNOWN_12");
            std::string::basic_string[abi:ne180100]<0>(v203, "UNKNOWN_13");
            std::string::basic_string[abi:ne180100]<0>(v204, "UNKNOWN_14");
            std::string::basic_string[abi:ne180100]<0>(v205, "UNKNOWN_15");
            std::string::basic_string[abi:ne180100]<0>(v206, "UNKNOWN_16");
            std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>(v25 + 276, (std::string *)__v, &v207, 0x11uLL);
            uint64_t v174 = 51;
            do
            {
              if ((char)__v[v174 * 8 - 1] < 0) {
                operator delete((void *)__p.__r_.__value_.__r.__words[v174 + 1]);
              }
              v174 -= 3;
            }
            while (v174 * 8);
          }
          else
          {
            BOOL v57 = *v51 == 11825 && *((unsigned char *)v51 + 2) == 51;
            if (v57
              || ((int v58 = *v51, v59 = *((unsigned __int8 *)v51 + 2), v58 == 11825) ? (v60 = v59 == 52) : (v60 = 0), v60))
            {
              std::string::basic_string[abi:ne180100]<0>(__v, "UNKNOWN_0");
              std::string::basic_string[abi:ne180100]<0>(&__v[24], "UNKNOWN_1");
              std::string::basic_string[abi:ne180100]<0>(&v189, "UNKNOWN_2");
              std::string::basic_string[abi:ne180100]<0>((void *)&v190 + 1, "UNKNOWN_3");
              std::string::basic_string[abi:ne180100]<0>(&v192, "UNKNOWN_4");
              std::string::basic_string[abi:ne180100]<0>((void *)&v193 + 1, "UNKNOWN_6");
              std::string::basic_string[abi:ne180100]<0>(&v195, "UNKNOWN_7");
              std::string::basic_string[abi:ne180100]<0>(v197, "UNKNOWN_5");
              std::string::basic_string[abi:ne180100]<0>(v198, "UNKNOWN_8");
              std::string::basic_string[abi:ne180100]<0>(v199, "UNKNOWN_9");
              std::string::basic_string[abi:ne180100]<0>(&v200, "UNKNOWN_10");
              std::string::basic_string[abi:ne180100]<0>(v201, "UNKNOWN_11");
              std::string::basic_string[abi:ne180100]<0>(v202, "UNKNOWN_12");
              std::string::basic_string[abi:ne180100]<0>(v203, "UNKNOWN_13");
              std::string::basic_string[abi:ne180100]<0>(v204, "UNKNOWN_14");
              std::string::basic_string[abi:ne180100]<0>(v205, "UNKNOWN_15");
              std::string::basic_string[abi:ne180100]<0>(v206, "UNKNOWN_16");
              std::string::basic_string[abi:ne180100]<0>(&v207, "UNKNOWN_17");
              std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>(v25 + 276, (std::string *)__v, (long long *)&v208, 0x12uLL);
              uint64_t v61 = 54;
              do
              {
                if ((char)__v[v61 * 8 - 1] < 0) {
                  operator delete((void *)__p.__r_.__value_.__r.__words[v61 + 1]);
                }
                v61 -= 3;
              }
              while (v61 * 8);
            }
          }
        }
        *((_DWORD *)v21 + 1660) = v9 != 2;
        if (v9 == 2)
        {
          v67 = (char *)operator new(0x48uLL);
          *((void *)v67 + 1) = 0;
          *((void *)v67 + 2) = 0;
          *(void *)v67 = &unk_1EF753968;
          v68 = v67 + 24;
          *(_OWORD *)(v67 + 40) = 0u;
          *(_OWORD *)(v67 + 56) = 0u;
          v69 = &unk_1EF7528E8;
          uint64_t v70 = 1;
        }
        else
        {
          v67 = (char *)operator new(0x50uLL);
          *((void *)v67 + 1) = 0;
          *((void *)v67 + 2) = 0;
          *(void *)v67 = &unk_1EF753930;
          v68 = v67 + 24;
          *(_OWORD *)(v67 + 40) = 0u;
          *(_OWORD *)(v67 + 56) = 0u;
          v69 = &unk_1EF7528B8;
          uint64_t v70 = 2;
          *((_DWORD *)v67 + 18) = 2;
        }
        *((void *)v67 + 3) = v69;
        *((void *)v67 + 4) = v70;
        v71 = (std::__shared_weak_count *)*((void *)v21 + 4);
        *((void *)v21 + 3) = v68;
        *((void *)v21 + 4) = v67;
        if (v71) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v71);
        }
        v50 = &CVML_status_ok;
LABEL_151:
        uint64_t v72 = *v50;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (((v72 + 128) & 0x80) != 0)
        {
          v178 = (char **)(v21 + 6208);
          v73 = (long long *)*((void *)v21 + 831);
          v74 = (long long *)*((void *)v21 + 832);
          if (v73 != v74)
          {
            v181 = (std::vector<std::string> *)(v21 + 6256);
            v180 = (std::vector<std::string> *)(v21 + 6280);
            v179 = (std::vector<std::string> *)(v21 + 6672);
            do
            {
              if (*((char *)v73 + 23) < 0)
              {
                std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v73, *((void *)v73 + 1));
              }
              else
              {
                long long v75 = *v73;
                __p.__r_.__value_.__r.__words[2] = *((void *)v73 + 2);
                *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v75;
              }
              std::operator+<char>();
              v76 = std::string::append(&v186, "_output", 7uLL);
              std::string::size_type v77 = v76->__r_.__value_.__r.__words[0];
              v209[0] = v76->__r_.__value_.__l.__size_;
              *(void *)((char *)v209 + 7) = *(std::string::size_type *)((char *)&v76->__r_.__value_.__r.__words[1] + 7);
              char v78 = HIBYTE(v76->__r_.__value_.__r.__words[2]);
              v76->__r_.__value_.__l.__size_ = 0;
              v76->__r_.__value_.__r.__words[2] = 0;
              v76->__r_.__value_.__r.__words[0] = 0;
              unint64_t v79 = *((void *)v21 + 783);
              unint64_t v80 = *((void *)v21 + 784);
              if (v79 >= v80)
              {
                unint64_t v83 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v79 - (unint64_t)v181->__begin_) >> 3);
                unint64_t v84 = v83 + 1;
                if (v83 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                }
                unint64_t v85 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v80 - (unint64_t)v181->__begin_) >> 3);
                if (2 * v85 > v84) {
                  unint64_t v84 = 2 * v85;
                }
                if (v85 >= 0x555555555555555) {
                  unint64_t v86 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v86 = v84;
                }
                *(void *)&__v[32] = v21 + 6272;
                if (v86) {
                  unint64_t v86 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<CGPoint>>>(v86);
                }
                else {
                  uint64_t v87 = 0;
                }
                unint64_t v88 = v86 + 24 * v83;
                *(void *)__v = v86;
                *(void *)&__v[8] = v88;
                *(void *)&__v[24] = v86 + 24 * v87;
                uint64_t v89 = v209[0];
                *(void *)unint64_t v88 = v77;
                *(void *)(v88 + 8) = v89;
                *(void *)(v88 + 15) = *(void *)((char *)v209 + 7);
                *(unsigned char *)(v88 + 23) = v78;
                *(void *)&__v[16] = v88 + 24;
                std::vector<std::string>::__swap_out_circular_buffer(v181, (std::__split_buffer<std::string> *)__v);
                unint64_t v82 = *((void *)v21 + 783);
                std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)__v);
              }
              else
              {
                uint64_t v81 = v209[0];
                *(void *)unint64_t v79 = v77;
                *(void *)(v79 + 8) = v81;
                *(void *)(v79 + 15) = *(void *)((char *)v209 + 7);
                *(unsigned char *)(v79 + 23) = v78;
                unint64_t v82 = v79 + 24;
                *((void *)v21 + 783) = v79 + 24;
              }
              *((void *)v21 + 783) = v82;
              if (SHIBYTE(v186.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v186.__r_.__value_.__l.__data_);
              }
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                std::string::size_type v90 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
              }
              else {
                std::string::size_type v90 = __p.__r_.__value_.__l.__size_;
              }
              std::string::basic_string[abi:ne180100]((uint64_t)&v186, v90 + 8);
              if ((v186.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                v91 = &v186;
              }
              else {
                v91 = (std::string *)v186.__r_.__value_.__r.__words[0];
              }
              if (v90)
              {
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  v92 = &__p;
                }
                else {
                  v92 = (std::string *)__p.__r_.__value_.__r.__words[0];
                }
                memmove(v91, v92, v90);
              }
              strcpy((char *)v91 + v90, "_fc/Relu");
              unint64_t v93 = *((void *)v21 + 786);
              unint64_t v94 = *((void *)v21 + 787);
              if (v93 >= v94)
              {
                unint64_t v96 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v93 - (unint64_t)v180->__begin_) >> 3);
                unint64_t v97 = v96 + 1;
                if (v96 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                }
                unint64_t v98 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v94 - (unint64_t)v180->__begin_) >> 3);
                if (2 * v98 > v97) {
                  unint64_t v97 = 2 * v98;
                }
                if (v98 >= 0x555555555555555) {
                  unint64_t v99 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v99 = v97;
                }
                *(void *)&__v[32] = v21 + 6296;
                if (v99) {
                  unint64_t v99 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<CGPoint>>>(v99);
                }
                else {
                  uint64_t v100 = 0;
                }
                unint64_t v101 = v99 + 24 * v96;
                *(void *)__v = v99;
                *(void *)&__v[8] = v101;
                *(void *)&__v[24] = v99 + 24 * v100;
                long long v102 = *(_OWORD *)&v186.__r_.__value_.__l.__data_;
                *(void *)(v101 + 16) = *((void *)&v186.__r_.__value_.__l + 2);
                *(_OWORD *)unint64_t v101 = v102;
                memset(&v186, 0, sizeof(v186));
                *(void *)&__v[16] = v101 + 24;
                std::vector<std::string>::__swap_out_circular_buffer(v180, (std::__split_buffer<std::string> *)__v);
                uint64_t v103 = *((void *)v21 + 786);
                std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)__v);
                int v104 = SHIBYTE(v186.__r_.__value_.__r.__words[2]);
                *((void *)v21 + 786) = v103;
                if (v104 < 0) {
                  operator delete(v186.__r_.__value_.__l.__data_);
                }
              }
              else
              {
                long long v95 = *(_OWORD *)&v186.__r_.__value_.__l.__data_;
                *(void *)(v93 + 16) = *((void *)&v186.__r_.__value_.__l + 2);
                *(_OWORD *)unint64_t v93 = v95;
                *((void *)v21 + 786) = v93 + 24;
              }
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                std::string::size_type v105 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
              }
              else {
                std::string::size_type v105 = __p.__r_.__value_.__l.__size_;
              }
              std::string::basic_string[abi:ne180100]((uint64_t)&v186, v105 + 10);
              if ((v186.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                v106 = &v186;
              }
              else {
                v106 = (std::string *)v186.__r_.__value_.__r.__words[0];
              }
              if (v105)
              {
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  v107 = &__p;
                }
                else {
                  v107 = (std::string *)__p.__r_.__value_.__r.__words[0];
                }
                memmove(v106, v107, v105);
              }
              strcpy((char *)v106 + v105, "_embedding");
              unint64_t v108 = *((void *)v21 + 835);
              unint64_t v109 = *((void *)v21 + 836);
              if (v108 >= v109)
              {
                unint64_t v111 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v108 - (unint64_t)v179->__begin_) >> 3);
                unint64_t v112 = v111 + 1;
                if (v111 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                }
                unint64_t v113 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v109 - (unint64_t)v179->__begin_) >> 3);
                if (2 * v113 > v112) {
                  unint64_t v112 = 2 * v113;
                }
                if (v113 >= 0x555555555555555) {
                  unint64_t v114 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v114 = v112;
                }
                *(void *)&__v[32] = v21 + 6688;
                if (v114) {
                  unint64_t v114 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<CGPoint>>>(v114);
                }
                else {
                  uint64_t v115 = 0;
                }
                unint64_t v116 = v114 + 24 * v111;
                *(void *)__v = v114;
                *(void *)&__v[8] = v116;
                *(void *)&__v[24] = v114 + 24 * v115;
                long long v117 = *(_OWORD *)&v186.__r_.__value_.__l.__data_;
                *(void *)(v116 + 16) = *((void *)&v186.__r_.__value_.__l + 2);
                *(_OWORD *)unint64_t v116 = v117;
                memset(&v186, 0, sizeof(v186));
                *(void *)&__v[16] = v116 + 24;
                std::vector<std::string>::__swap_out_circular_buffer(v179, (std::__split_buffer<std::string> *)__v);
                uint64_t v118 = *((void *)v21 + 835);
                std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)__v);
                int v119 = SHIBYTE(v186.__r_.__value_.__r.__words[2]);
                *((void *)v21 + 835) = v118;
                if (v119 < 0) {
                  operator delete(v186.__r_.__value_.__l.__data_);
                }
              }
              else
              {
                long long v110 = *(_OWORD *)&v186.__r_.__value_.__l.__data_;
                *(void *)(v108 + 16) = *((void *)&v186.__r_.__value_.__l + 2);
                *(_OWORD *)unint64_t v108 = v110;
                *((void *)v21 + 835) = v108 + 24;
              }
              uint64_t v196 = 0;
              long long v194 = 0u;
              long long v195 = 0u;
              long long v192 = 0u;
              long long v193 = 0u;
              long long v190 = 0u;
              long long v191 = 0u;
              long long v189 = 0u;
              memset(__v, 0, sizeof(__v));
              unint64_t v120 = *((void *)v21 + 777);
              unint64_t v121 = *((void *)v21 + 778);
              if (v120 >= v121)
              {
                unint64_t v123 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(v120 - (void)*v178) >> 3);
                unint64_t v124 = v123 + 1;
                if (v123 + 1 > 0x186186186186186) {
                  goto LABEL_309;
                }
                unint64_t v125 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(v121 - (void)*v178) >> 3);
                if (2 * v125 > v124) {
                  unint64_t v124 = 2 * v125;
                }
                if (v125 >= 0xC30C30C30C30C3) {
                  unint64_t v126 = 0x186186186186186;
                }
                else {
                  unint64_t v126 = v124;
                }
                if (v126) {
                  unint64_t v126 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<espresso_buffer_t>>(v126);
                }
                else {
                  uint64_t v127 = 0;
                }
                unint64_t v128 = v126 + 168 * v123;
                *(void *)(v128 + 160) = 0;
                *(_OWORD *)(v128 + 128) = 0u;
                *(_OWORD *)(v128 + 144) = 0u;
                *(_OWORD *)(v128 + 96) = 0u;
                *(_OWORD *)(v128 + 112) = 0u;
                *(_OWORD *)(v128 + 64) = 0u;
                *(_OWORD *)(v128 + 80) = 0u;
                *(_OWORD *)(v128 + 32) = 0u;
                *(_OWORD *)(v128 + 48) = 0u;
                *(_OWORD *)unint64_t v128 = 0u;
                *(_OWORD *)(v128 + 16) = 0u;
                v129 = (char *)*((void *)v21 + 777);
                v130 = (char *)*((void *)v21 + 776);
                unint64_t v131 = v128;
                if (v129 != v130)
                {
                  do
                  {
                    long long v132 = *(_OWORD *)(v129 - 168);
                    long long v133 = *(_OWORD *)(v129 - 152);
                    *(_OWORD *)(v131 - 136) = *(_OWORD *)(v129 - 136);
                    *(_OWORD *)(v131 - 152) = v133;
                    *(_OWORD *)(v131 - 168) = v132;
                    long long v134 = *(_OWORD *)(v129 - 120);
                    long long v135 = *(_OWORD *)(v129 - 104);
                    long long v136 = *(_OWORD *)(v129 - 88);
                    *(_OWORD *)(v131 - 72) = *(_OWORD *)(v129 - 72);
                    *(_OWORD *)(v131 - 88) = v136;
                    *(_OWORD *)(v131 - 104) = v135;
                    *(_OWORD *)(v131 - 120) = v134;
                    long long v137 = *(_OWORD *)(v129 - 56);
                    long long v138 = *(_OWORD *)(v129 - 40);
                    long long v139 = *(_OWORD *)(v129 - 24);
                    *(void *)(v131 - 8) = *((void *)v129 - 1);
                    *(_OWORD *)(v131 - 24) = v139;
                    *(_OWORD *)(v131 - 40) = v138;
                    *(_OWORD *)(v131 - 56) = v137;
                    v131 -= 168;
                    v129 -= 168;
                  }
                  while (v129 != v130);
                  v129 = *v178;
                }
                *((void *)v21 + 776) = v131;
                unint64_t v122 = v128 + 168;
                *((void *)v21 + 777) = v128 + 168;
                *((void *)v21 + 778) = v126 + 168 * v127;
                if (v129) {
                  operator delete(v129);
                }
              }
              else
              {
                *(void *)(v120 + 160) = 0;
                *(_OWORD *)(v120 + 128) = 0uLL;
                *(_OWORD *)(v120 + 144) = 0uLL;
                *(_OWORD *)(v120 + 96) = 0uLL;
                *(_OWORD *)(v120 + 112) = 0uLL;
                *(_OWORD *)(v120 + 64) = 0uLL;
                *(_OWORD *)(v120 + 80) = 0uLL;
                *(_OWORD *)(v120 + 32) = 0uLL;
                *(_OWORD *)(v120 + 48) = 0uLL;
                unint64_t v122 = v120 + 168;
                *(_OWORD *)unint64_t v120 = 0uLL;
                *(_OWORD *)(v120 + 16) = 0uLL;
              }
              *((void *)v21 + 777) = v122;
              unint64_t v140 = *((void *)v21 + 780);
              unint64_t v141 = *((void *)v21 + 781);
              if (v140 >= v141)
              {
                uint64_t v143 = *((void *)v21 + 779);
                unint64_t v144 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(v140 - v143) >> 3);
                unint64_t v145 = v144 + 1;
                if (v144 + 1 > 0x186186186186186) {
LABEL_309:
                }
                  std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                unint64_t v146 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(v141 - v143) >> 3);
                if (2 * v146 > v145) {
                  unint64_t v145 = 2 * v146;
                }
                if (v146 >= 0xC30C30C30C30C3) {
                  unint64_t v147 = 0x186186186186186;
                }
                else {
                  unint64_t v147 = v145;
                }
                if (v147) {
                  unint64_t v147 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<espresso_buffer_t>>(v147);
                }
                else {
                  uint64_t v148 = 0;
                }
                unint64_t v149 = v147 + 168 * v144;
                *(_OWORD *)(v149 + 96) = v192;
                *(_OWORD *)(v149 + 80) = v191;
                *(_OWORD *)(v149 + 64) = v190;
                *(_OWORD *)(v149 + 48) = v189;
                *(void *)(v149 + 160) = v196;
                *(_OWORD *)(v149 + 144) = v195;
                *(_OWORD *)(v149 + 128) = v194;
                *(_OWORD *)(v149 + 112) = v193;
                *(_OWORD *)unint64_t v149 = *(_OWORD *)__v;
                *(_OWORD *)(v149 + 16) = *(_OWORD *)&__v[16];
                *(_OWORD *)(v149 + 32) = *(_OWORD *)&__v[32];
                v150 = (char *)*((void *)v21 + 780);
                v151 = (char *)*((void *)v21 + 779);
                unint64_t v152 = v149;
                if (v150 != v151)
                {
                  do
                  {
                    long long v153 = *(_OWORD *)(v150 - 168);
                    long long v154 = *(_OWORD *)(v150 - 152);
                    *(_OWORD *)(v152 - 136) = *(_OWORD *)(v150 - 136);
                    *(_OWORD *)(v152 - 152) = v154;
                    *(_OWORD *)(v152 - 168) = v153;
                    long long v155 = *(_OWORD *)(v150 - 120);
                    long long v156 = *(_OWORD *)(v150 - 104);
                    long long v157 = *(_OWORD *)(v150 - 88);
                    *(_OWORD *)(v152 - 72) = *(_OWORD *)(v150 - 72);
                    *(_OWORD *)(v152 - 88) = v157;
                    *(_OWORD *)(v152 - 104) = v156;
                    *(_OWORD *)(v152 - 120) = v155;
                    long long v158 = *(_OWORD *)(v150 - 56);
                    long long v159 = *(_OWORD *)(v150 - 40);
                    long long v160 = *(_OWORD *)(v150 - 24);
                    *(void *)(v152 - 8) = *((void *)v150 - 1);
                    *(_OWORD *)(v152 - 24) = v160;
                    *(_OWORD *)(v152 - 40) = v159;
                    *(_OWORD *)(v152 - 56) = v158;
                    v152 -= 168;
                    v150 -= 168;
                  }
                  while (v150 != v151);
                  v150 = (char *)*((void *)v21 + 779);
                }
                *((void *)v21 + 779) = v152;
                unint64_t v142 = v149 + 168;
                *((void *)v21 + 780) = v149 + 168;
                *((void *)v21 + 781) = v147 + 168 * v148;
                if (v150) {
                  operator delete(v150);
                }
              }
              else
              {
                *(_OWORD *)(v140 + 112) = v193;
                *(_OWORD *)(v140 + 128) = v194;
                *(_OWORD *)(v140 + 144) = v195;
                *(void *)(v140 + 160) = v196;
                *(_OWORD *)(v140 + 48) = v189;
                *(_OWORD *)(v140 + 64) = v190;
                *(_OWORD *)(v140 + 80) = v191;
                *(_OWORD *)(v140 + 96) = v192;
                *(_OWORD *)unint64_t v140 = *(_OWORD *)__v;
                *(_OWORD *)(v140 + 16) = *(_OWORD *)&__v[16];
                *(_OWORD *)(v140 + 32) = *(_OWORD *)&__v[32];
                unint64_t v142 = v140 + 168;
              }
              *((void *)v21 + 780) = v142;
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
              v73 = (long long *)((char *)v73 + 24);
            }
            while (v73 != v74);
          }
          memset(__v, 0, 32);
          espresso_network_query_blob_dimensions();
          *((_DWORD *)v21 + 26) = *(_DWORD *)&__v[16];
          memset(__v, 0, 32);
          espresso_network_query_blob_dimensions();
          *((_DWORD *)v21 + 25) = *(_DWORD *)&__v[8] * *(_DWORD *)__v * *(_DWORD *)&__v[16];
          memset(__v, 0, 32);
          espresso_network_query_blob_dimensions();
          *((_DWORD *)v21 + 27) = *(_DWORD *)__v * *(_DWORD *)&__v[8] * *(_DWORD *)&__v[16];
          if (v21[88]
            && (espresso_network_bind_buffer() ? (uint64_t v32 = 9083) : (uint64_t v32 = 9088),
                v32 != 128))
          {
            syslog(5, "ERROR: Could not bind to faceprint output.");
          }
          else if (v21[89] {
                 && (espresso_network_bind_buffer() ? (uint64_t v32 = 9083) : (uint64_t v32 = 9088),
          }
                     v32 != 128))
          {
            syslog(5, "ERROR: Could not bind to faceprint confidence output.");
          }
          else if (v21[90] {
                 && (uint64_t v32 = vision::mod::FaceprintAndAttributes::bindFaceAttributes((uint64_t)v25, (void *)v21 + 782),
          }
                     v32 != 128))
          {
            syslog(5, "ERROR: Could not bind to face attribute output.");
          }
          else
          {
            if (!v21[91]
              || (uint64_t v32 = vision::mod::FaceprintAndAttributes::bindFaceAttributes((uint64_t)v25, (void *)v21 + 785),
                  v32 == 128))
            {
              uint64_t v161 = *((void *)v21 + 834);
              for (uint64_t k = *((void *)v21 + 835); v161 != k; v161 += 24)
              {
                if (*(char *)(v161 + 23) < 0)
                {
                  std::string::__init_copy_ctor_external((std::string *)__v, *(const std::string::value_type **)v161, *(void *)(v161 + 8));
                }
                else
                {
                  *(_OWORD *)__v = *(_OWORD *)v161;
                  *(void *)&__v[16] = *(void *)(v161 + 16);
                }
                v163 = operator new(0x90uLL);
                v163[1] = 0;
                v163[2] = 0;
                void *v163 = &unk_1EF7539A0;
                v163[4] = 0;
                v163[5] = 0;
                v163[8] = 0;
                v163[9] = 0;
                v163[6] = 0;
                v163[7] = v163 + 8;
                *((_OWORD *)v163 + 5) = 0u;
                *((_OWORD *)v163 + 6) = 0u;
                *((unsigned char *)v163 + 112) = 0;
                v163[3] = &unk_1EF752918;
                v163[15] = 0;
                *((_DWORD *)v163 + 32) = 1;
                v163[17] = 0;
                v164 = std::__tree<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)v21 + 843, __v, (uint64_t)__v);
                v165 = (std::__shared_weak_count *)v164[8];
                v164[7] = v163 + 3;
                v164[8] = v163;
                if (v165) {
                  std::__shared_weak_count::__release_shared[abi:nn180100](v165);
                }
                if ((__v[23] & 0x80000000) != 0) {
                  operator delete(*(void **)__v);
                }
              }
              v166 = operator new(0x90uLL);
              v166[1] = 0;
              v166[2] = 0;
              void *v166 = &unk_1EF7539A0;
              v166[4] = 0;
              v166[5] = 0;
              v166[9] = 0;
              v166[8] = 0;
              v166[6] = 0;
              v166[7] = v166 + 8;
              *((_OWORD *)v166 + 5) = 0u;
              *((_OWORD *)v166 + 6) = 0u;
              *((unsigned char *)v166 + 112) = 0;
              v166[3] = &unk_1EF752918;
              v166[15] = 0;
              *((_DWORD *)v166 + 32) = 1;
              v166[17] = 0;
              *((void *)v21 + 841) = v166 + 3;
              v167 = (std::__shared_weak_count *)*((void *)v21 + 842);
              *((void *)v21 + 842) = v166;
              if (v167) {
                std::__shared_weak_count::__release_shared[abi:nn180100](v167);
              }
LABEL_287:
              uint64_t v32 = 0;
              v31.__ptr_ = (FaceprintAndAttributes *)v25;
              v31.__cntrl_ = (__shared_weak_count *)v21;
              goto LABEL_289;
            }
            syslog(5, "ERROR: Could not bind to face attribute embedding output.");
          }
        }
        else
        {
          uint64_t v32 = (v72 + 128) | 0x2300;
        }
        if (v32 != 128)
        {
          syslog(5, "ERROR: Failed to initialize FaceprintAndAttribute object");
          std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v21);
          shared_ptr<vision::mod::FaceprintAndAttributes> v31 = (shared_ptr<vision::mod::FaceprintAndAttributes>)0;
          goto LABEL_289;
        }
        goto LABEL_287;
      }
      int v28 = *(_DWORD *)v27;
      int v29 = 845101174;
LABEL_20:
      if (v28 == v29)
      {
LABEL_21:
        *((unsigned char *)&__p.__r_.__value_.__s + 23) = 3;
        qmemcpy(&__p, "4.0", 3);
        if (v20[87] < 0)
        {
          *((void *)v20 + 9) = 3;
          v30 = (int *)*((void *)v20 + 8);
        }
        else
        {
          v30 = (int *)(v20 + 64);
          v20[87] = 3;
        }
        int v38 = 3419697;
LABEL_60:
        int *v30 = v38;
LABEL_61:
        *((_DWORD *)v20 + 22) = 16843009;
        goto LABEL_62;
      }
LABEL_35:
      syslog(5, "[Error] version %s is not supported");
LABEL_95:
      v50 = &CVML_status_invalidParameter;
      goto LABEL_151;
    }
    BOOL v26 = v23 < 0;
    v33 = (void **)&__dst;
    if (v26) {
      v33 = v24;
    }
    switch(*(_WORD *)v33)
    {
      case 0x3176:
        *((unsigned char *)&__p.__r_.__value_.__s + 23) = 3;
        qmemcpy(&__p, "2.2", 3);
        if (v20[87] < 0)
        {
          *((void *)v20 + 9) = 3;
          v35 = (int *)*((void *)v20 + 8);
        }
        else
        {
          v35 = (int *)(v20 + 64);
          v20[87] = 3;
        }
        int v37 = 3157553;
        break;
      case 0x3276:
        *((unsigned char *)&__p.__r_.__value_.__s + 23) = 3;
        qmemcpy(&__p, "2.2", 3);
        if (v20[87] < 0)
        {
          *((void *)v20 + 9) = 3;
          v35 = (int *)*((void *)v20 + 8);
        }
        else
        {
          v35 = (int *)(v20 + 64);
          v20[87] = 3;
        }
        int v37 = 3223089;
        break;
      case 0x3376:
        *((unsigned char *)&__p.__r_.__value_.__s + 23) = 3;
        qmemcpy(&__p, "2.2", 3);
        if (v20[87] < 0)
        {
          *((void *)v20 + 9) = 3;
          v36 = (_DWORD *)*((void *)v20 + 8);
        }
        else
        {
          v36 = v20 + 64;
          v20[87] = 3;
        }
        _DWORD *v36 = 3288625;
        v20[88] = 1;
        __int16 v40 = 257;
LABEL_54:
        *((_WORD *)v20 + 45) = v40;
        goto LABEL_62;
      default:
        switch(*(_WORD *)v33)
        {
          case 0x3476:
            *((unsigned char *)&__p.__r_.__value_.__s + 23) = 3;
            LOWORD(__p.__r_.__value_.__l.__data_) = 11827;
            std::string::value_type v39 = 48;
            break;
          case 0x3576:
            *((unsigned char *)&__p.__r_.__value_.__s + 23) = 3;
            LOWORD(__p.__r_.__value_.__l.__data_) = 11827;
            std::string::value_type v39 = 49;
            break;
          case 0x3676:
            *((unsigned char *)&__p.__r_.__value_.__s + 23) = 5;
            qmemcpy(&__p, "3.1.3", 5);
            if (v20[87] < 0)
            {
              *((void *)v20 + 9) = 3;
              v173 = (_DWORD *)*((void *)v20 + 8);
            }
            else
            {
              v173 = v20 + 64;
              v20[87] = 3;
            }
            _DWORD *v173 = 3354161;
            goto LABEL_61;
          case 0x3776:
          case 0x3876:
            goto LABEL_21;
          default:
            int v28 = *(unsigned __int16 *)v33;
            int v29 = 14710;
            goto LABEL_20;
        }
        __p.__r_.__value_.__s.__data_[2] = v39;
        if (v20[87] < 0)
        {
          *((void *)v20 + 9) = 3;
          v30 = (int *)*((void *)v20 + 8);
        }
        else
        {
          v30 = (int *)(v20 + 64);
          v20[87] = 3;
        }
        int v38 = 3354161;
        goto LABEL_60;
    }
    int *v35 = v37;
    __int16 v40 = 1;
    v20[88] = 1;
    goto LABEL_54;
  }
  syslog(5, "[Error] Cannot initialize FaceprintAndAttributes object with null plan");
  shared_ptr<vision::mod::FaceprintAndAttributes> v31 = (shared_ptr<vision::mod::FaceprintAndAttributes>)0;
  uint64_t v32 = -4;
LABEL_289:
  p_mMultiHeadedFaceClassifier = &v177->_mMultiHeadedFaceClassifier;
  cntrl = (std::__shared_weak_count *)v177->_mMultiHeadedFaceClassifier.__cntrl_;
  v177->_mMultiHeadedFaceClassifier = v31;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100](cntrl);
  }

  if (SHIBYTE(v184) < 0) {
    operator delete(__dst);
  }
  ptr = p_mMultiHeadedFaceClassifier->__ptr_;
  BOOL v14 = p_mMultiHeadedFaceClassifier->__ptr_ != 0;
  if (v176 && !ptr)
  {
    v171 = VNErrorForCVMLStatus((id)v32);
    id *v176 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Failure to create face multi-headed classifier." underlyingError:v171];
  }
LABEL_297:

  return v14;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 1111970369;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  if (+[VNFaceAnalyzerMultiDetectorBase espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::onceToken != -1) {
    dispatch_once(&+[VNFaceAnalyzerMultiDetectorBase espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::onceToken, &__block_literal_global_284);
  }
  v3 = (void *)+[VNFaceAnalyzerMultiDetectorBase espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::inputImageDimensionsBlobName;

  return v3;
}

uint64_t __100__VNFaceAnalyzerMultiDetectorBase_espressoModelInputImageDimensionsBlobNameForConfigurationOptions___block_invoke()
{
  +[VNFaceAnalyzerMultiDetectorBase espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::inputImageDimensionsBlobName = [[NSString alloc] initWithUTF8String:"data"];

  return MEMORY[0x1F41817F8]();
}

+ (const)modelVersionForOptions:(id)a3
{
  id v4 = a3;
  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  unint64_t v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v5 stringWithFormat:@"%@ must override %@", v7, v8];

  id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Method not implemented" reason:v9 userInfo:0];
  objc_exception_throw(v10);
}

+ (unint64_t)numberOfImageChannels
{
  return 4;
}

+ (id)keyForDetectorWithConfigurationOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 modelVersionForOptions:v4];
  size_t v6 = *(void *)(v5 + 8);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = *(const void **)v5;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    unint64_t v8 = (void **)operator new(v9 + 1);
    __dst[1] = (void *)v6;
    int64_t v19 = v10 | 0x8000000000000000;
    __dst[0] = v8;
    goto LABEL_8;
  }
  HIBYTE(v19) = *(void *)(v5 + 8);
  unint64_t v8 = __dst;
  if (v6) {
LABEL_8:
  }
    memmove(v8, v7, v6);
  *((unsigned char *)v8 + v6) = 0;
  id v11 = [NSString alloc];
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___VNFaceAnalyzerMultiDetectorBase;
  uint64_t v12 = objc_msgSendSuper2(&v17, sel_keyForDetectorWithConfigurationOptions_, v4);
  v13 = (void *)v12;
  BOOL v14 = __dst;
  if (v19 < 0) {
    BOOL v14 = (void **)__dst[0];
  }
  uint64_t v15 = (void *)[v11 initWithFormat:@"%@:%s", v12, v14];

  if (SHIBYTE(v19) < 0) {
    operator delete(__dst[0]);
  }

  return v15;
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__VNFaceAnalyzerMultiDetectorBase_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNFaceAnalyzerMultiDetectorBase configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNFaceAnalyzerMultiDetectorBase configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNFaceAnalyzerMultiDetectorBase configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __72__VNFaceAnalyzerMultiDetectorBase_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceAnalyzerMultiDetectorBase;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"VNDetectorOption_PreferBackgroundProcessing"];
  [v2 addObject:@"VNDetectorOption_RequestDetectionLevel"];
  uint64_t v3 = [v2 copy];
  id v4 = (void *)+[VNFaceAnalyzerMultiDetectorBase configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNFaceAnalyzerMultiDetectorBase configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (BOOL)producesObservationsForMultipleRequestClasses
{
  return 1;
}

- (void).cxx_destruct
{
  cntrl = self->_mMultiHeadedFaceClassifier.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (BOOL)_saveFaceAttributes:(void *)a3 toFaceObservation:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = +[VNValidationUtilities originatingRequestSpecifierForKey:@"VNFaceAnalyzerMultiDetectorProcessingOptionFaceAnalyzerOriginatingRequestSpecifier" inOptions:a5 error:a6];
  if (v11)
  {
    uint64_t v12 = -[VNFaceAttributes initWithRequestRevision:]([VNFaceAttributes alloc], "initWithRequestRevision:", [v11 requestRevision]);
    [(VNFaceAnalyzerMultiDetectorBase *)self _addFaceAnalysisResultsFromMap:a3 toFaceAttributeObject:v12 forOriginatingRequestSpecifier:v11];
    [v10 setFaceAttributes:v12];
  }
  return v11 != 0;
}

- (BOOL)_isFaceprintJunk:(shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)a3
{
  id v4 = NSString;
  objc_super v5 = (objc_class *)objc_opt_class();
  size_t v6 = NSStringFromClass(v5);
  uint64_t v7 = NSStringFromSelector(a2);
  uint64_t v8 = [v4 stringWithFormat:@"%@ must override %@", v6, v7];

  id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Method not implemented" reason:v8 userInfo:0];
  objc_exception_throw(v9);
}

- (BOOL)_saveFaceprint:(shared_ptr<vision:(id)a4 :(id)a5 mod:(id *)a6 :ImageDescriptorBufferAbstract>)a3 toFaceObservation:options:error:
{
  var0 = a3.var0;
  id v10 = a3.var1;
  id v11 = a4;
  char v37 = 0;
  if (+[VNValidationUtilities getBOOLValue:&v37 forKey:@"VNFaceAnalyzerMultiDetectorProcessingOptionFaceprintForceFaceprintCreation" inOptions:v11 withDefaultValue:0 error:a5])
  {
    uint64_t v12 = +[VNValidationUtilities originatingRequestSpecifierForKey:@"VNFaceAnalyzerMultiDetectorProcessingOptionFaceprintOriginatingRequestSpecifier" inOptions:v11 specifyingRequestClass:objc_opt_class() error:a5];
    if (v12)
    {
      if (v37)
      {
LABEL_4:
        size_t v13 = (*(uint64_t (**)(void))(**(void **)var0 + 104))();
        std::vector<unsigned char>::vector(__p, v13);
        BOOL v14 = __p[0];
        DataForKthDescriptor = (const void *)vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)var0, 0);
        memcpy(v14, DataForKthDescriptor, v13);
        int v33 = -1082130432;
        BOOL v16 = +[VNValidationUtilities getFloatValue:&v33 forKey:@"VNFaceAnalyzerMultiDetectorProcessingOptionFaceprintConfidence" inOptions:v11 error:a5];
        if (v16)
        {
          objc_super v17 = [VNFaceprint alloc];
          uint64_t v18 = __p[0];
          int v19 = v33;
          uint64_t v20 = [v12 requestRevision];
          LODWORD(v21) = v19;
          size_t v22 = [(VNFaceprint *)v17 initWithData:v18 elementCount:v13 >> 2 elementType:1 lengthInBytes:v13 confidence:v20 requestRevision:v21];
          [(__shared_weak_count *)v10 setFaceprint:v22];
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        goto LABEL_17;
      }
      int v23 = (std::__shared_weak_count *)*((void *)var0 + 1);
      v35 = *(vision::mod::ImageDescriptorBufferAbstract **)var0;
      v36 = v23;
      if (v23) {
        atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      BOOL v30 = [(VNFaceAnalyzerMultiDetectorBase *)self _isFaceprintJunk:&v35];
      if (v36)
      {
        std::__shared_weak_count::__release_shared[abi:nn180100](v36);
        if (!v30) {
          goto LABEL_4;
        }
      }
      else if (!v30)
      {
        goto LABEL_4;
      }
      VNValidatedLog(2, @"Poor quality face print candidate detected.  Not generating faceprint", v24, v25, v26, v27, v28, v29, v32);
      [(__shared_weak_count *)v10 setFaceprint:0];
      BOOL v16 = 1;
    }
    else
    {
      BOOL v16 = 0;
    }
LABEL_17:

    goto LABEL_18;
  }
  BOOL v16 = 0;
LABEL_18:

  return v16;
}

- (void)_addFaceAnalysisResultsFromMap:(void *)a3 toFaceAttributeObject:(id)a4 forOriginatingRequestSpecifier:(id)a5
{
  v374[5] = *MEMORY[0x1E4F143B8];
  id v338 = a4;
  id v7 = a5;
  uint64_t v8 = [v7 requestRevision];
  if (v8 == 3737841664)
  {
    id v9 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:3737841664];
    [v338 setAgeCategory:v9];

    id v10 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:3737841664];
    -[VNFaceAttributes setVN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq:]((uint64_t)v338, v10);

    id v11 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:3737841664];
    -[VNFaceAttributes setFacemaskCategory:]((uint64_t)v338, v11);

    uint64_t v12 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_1_unknown0" UTF8String]);
    v349[0] = v351;
    LODWORD(v13) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    BOOL v14 = [(VNClassificationObservation *)v12 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_1_unknown0" confidence:v13];
    v374[0] = v14;
    uint64_t v15 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_1_unknown1" UTF8String]);
    v347[0] = v349;
    LODWORD(v16) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    objc_super v17 = [(VNClassificationObservation *)v15 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_1_unknown1" confidence:v16];
    v374[1] = v17;
    uint64_t v18 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)[@"UNKNOWN_1_unknown2" UTF8String]);
    v345[0] = v347;
    LODWORD(v19) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    uint64_t v20 = [(VNClassificationObservation *)v18 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_1_unknown2" confidence:v19];
    v374[2] = v20;
    double v21 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)[@"UNKNOWN_1_unknown3" UTF8String]);
    __p[0] = v345;
    LODWORD(v22) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    int v23 = [(VNClassificationObservation *)v21 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_1_unknown3" confidence:v22];
    v374[3] = v23;
    uint64_t v24 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"UNKNOWN_1_unknown4" UTF8String]);
    v341[0] = __p;
    LODWORD(v25) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    uint64_t v26 = [(VNClassificationObservation *)v24 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_1_unknown4" confidence:v25];
    v374[4] = v26;
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v374 count:5];
    uint64_t v28 = [v338 ageCategory];
    [v28 setAllLabelsWithConfidences:v27];

    if (v344 < 0) {
      operator delete(__p[0]);
    }

    if (v346 < 0) {
      operator delete(v345[0]);
    }

    if (v348 < 0) {
      operator delete(v347[0]);
    }

    if (v350 < 0) {
      operator delete(v349[0]);
    }

    if (v352 < 0) {
      operator delete(v351[0]);
    }
    uint64_t v29 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_16_unknown0" UTF8String]);
    v349[0] = v351;
    LODWORD(v30) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v334 = [(VNClassificationObservation *)v29 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_16_unknown0" confidence:v30];
    v373[0] = v334;
    shared_ptr<vision::mod::FaceprintAndAttributes> v31 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_16_unknown1" UTF8String]);
    v347[0] = v349;
    LODWORD(v32) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    int v33 = [(VNClassificationObservation *)v31 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_16_unknown1" confidence:v32];
    v373[1] = v33;
    v34 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)[@"UNKNOWN_16_unknown2" UTF8String]);
    v345[0] = v347;
    LODWORD(v35) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    v36 = [(VNClassificationObservation *)v34 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_16_unknown2" confidence:v35];
    v373[2] = v36;
    char v37 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)[@"UNKNOWN_16_unknown3" UTF8String]);
    __p[0] = v345;
    LODWORD(v38) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    std::string::value_type v39 = [(VNClassificationObservation *)v37 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_16_unknown3" confidence:v38];
    v373[3] = v39;
    __int16 v40 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"UNKNOWN_16_unknown4" UTF8String]);
    v341[0] = __p;
    LODWORD(v41) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    v42 = [(VNClassificationObservation *)v40 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_16_unknown4" confidence:v41];
    v373[4] = v42;
    v43 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v341, (char *)[@"UNKNOWN_16_unknown5" UTF8String]);
    v339[0] = v341;
    LODWORD(v44) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v341, (_OWORD **)v339)+ 14);
    float v45 = [(VNClassificationObservation *)v43 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_16_unknown5" confidence:v44];
    v373[5] = v45;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v373 count:6];
    BOOL v47 = [v338 VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq];
    [v47 setAllLabelsWithConfidences:v46];

    if (v342 < 0) {
      operator delete(v341[0]);
    }

    if (v344 < 0) {
      operator delete(__p[0]);
    }

    if (v346 < 0) {
      operator delete(v345[0]);
    }

    if (v348 < 0) {
      operator delete(v347[0]);
    }

    if (v350 < 0) {
      operator delete(v349[0]);
    }

    if (v352 < 0) {
      operator delete(v351[0]);
    }
    v48 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_17_unknown0" UTF8String]);
    v349[0] = v351;
    LODWORD(v49) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v50 = [(VNClassificationObservation *)v48 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_17_unknown0" confidence:v49];
    v372[0] = v50;
    v51 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_17_unknown1" UTF8String]);
    v347[0] = v349;
    LODWORD(v52) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    int v53 = [(VNClassificationObservation *)v51 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_17_unknown1" confidence:v52];
    v372[1] = v53;
    BOOL v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v372 count:2];
    BOOL v55 = [v338 facemaskCategory];
    [v55 setAllLabelsWithConfidences:v54];

    if (v350 < 0) {
      operator delete(v349[0]);
    }
LABEL_182:

    if (v352 < 0) {
      operator delete(v351[0]);
    }
    goto LABEL_184;
  }
  v56 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
  [v338 setAgeCategory:v56];

  BOOL v57 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
  -[VNFaceAttributes setVN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE:]((uint64_t)v338, v57);

  int v58 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
  -[VNFaceAttributes setEyesCategory:]((uint64_t)v338, v58);

  int v59 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
  -[VNFaceAttributes setSmilingCategory:]((uint64_t)v338, v59);

  BOOL v60 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
  -[VNFaceAttributes setFaceHairCategory:]((uint64_t)v338, v60);

  uint64_t v61 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
  -[VNFaceAttributes setHairColorCategory:]((uint64_t)v338, v61);

  uint64_t v62 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
  -[VNFaceAttributes setBaldCategory:]((uint64_t)v338, v62);

  uint64_t v63 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
  -[VNFaceAttributes setGlassesCategory:]((uint64_t)v338, v63);

  v64 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
  -[VNFaceAttributes setMakeupEyesCategory:]((uint64_t)v338, v64);

  v65 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
  -[VNFaceAttributes setMakeupLipsCategory:]((uint64_t)v338, v65);

  if ((unint64_t)(v8 - 3737841665) <= 5 && v8 != 3737841668)
  {
    v66 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
    -[VNFaceAttributes setVN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB:]((uint64_t)v338, v66);

    v67 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
    -[VNFaceAttributes setVN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1:]((uint64_t)v338, v67);

    v68 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
    -[VNFaceAttributes setVN7CbCeAogPS2iHE6VQwu6H96xanljtMqk:]((uint64_t)v338, v68);

    v69 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
    -[VNFaceAttributes setVN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP:]((uint64_t)v338, v69);

    uint64_t v70 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
    -[VNFaceAttributes setVN2riiZbQrloRhCzYW56f0rk4N3ROe151S:]((uint64_t)v338, v70);

    v71 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
    -[VNFaceAttributes setVNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk:]((uint64_t)v338, v71);

    uint64_t v72 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
    -[VNFaceAttributes setVN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq:]((uint64_t)v338, v72);

    v73 = [[VNFaceAttributeCategory alloc] initWithRequestRevision:v8];
    -[VNFaceAttributes setFacemaskCategory:]((uint64_t)v338, v73);
  }
  v74 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_1_unknown0" UTF8String]);
  v349[0] = v351;
  LODWORD(v75) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  v76 = [(VNClassificationObservation *)v74 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_1_unknown0" confidence:v75];
  v371[0] = v76;
  std::string::size_type v77 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_1_unknown1" UTF8String]);
  v347[0] = v349;
  LODWORD(v78) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  unint64_t v79 = [(VNClassificationObservation *)v77 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_1_unknown1" confidence:v78];
  v371[1] = v79;
  unint64_t v80 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v347, (char *)[@"UNKNOWN_1_unknown2" UTF8String]);
  v345[0] = v347;
  LODWORD(v81) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
  unint64_t v82 = [(VNClassificationObservation *)v80 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_1_unknown2" confidence:v81];
  v371[2] = v82;
  unint64_t v83 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v345, (char *)[@"UNKNOWN_1_unknown3" UTF8String]);
  __p[0] = v345;
  LODWORD(v84) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
  unint64_t v85 = [(VNClassificationObservation *)v83 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_1_unknown3" confidence:v84];
  v371[3] = v85;
  unint64_t v86 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"UNKNOWN_1_unknown4" UTF8String]);
  v341[0] = __p;
  LODWORD(v87) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
  unint64_t v88 = [(VNClassificationObservation *)v86 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_1_unknown4" confidence:v87];
  v371[4] = v88;
  uint64_t v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v371 count:5];
  std::string::size_type v90 = [v338 ageCategory];
  [v90 setAllLabelsWithConfidences:v89];

  if (v344 < 0) {
    operator delete(__p[0]);
  }

  if (v346 < 0) {
    operator delete(v345[0]);
  }

  if (v348 < 0) {
    operator delete(v347[0]);
  }

  if (v350 < 0) {
    operator delete(v349[0]);
  }

  if (v352 < 0) {
    operator delete(v351[0]);
  }
  v91 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_6_unknown0" UTF8String]);
  v349[0] = v351;
  LODWORD(v92) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  unint64_t v93 = [(VNClassificationObservation *)v91 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_6_unknown0" confidence:v92];
  v370[0] = v93;
  unint64_t v94 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_6_unknown1" UTF8String]);
  v347[0] = v349;
  LODWORD(v95) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  unint64_t v96 = [(VNClassificationObservation *)v94 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_6_unknown1" confidence:v95];
  v370[1] = v96;
  unint64_t v97 = [MEMORY[0x1E4F1C978] arrayWithObjects:v370 count:2];
  unint64_t v98 = [v338 VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE];
  [v98 setAllLabelsWithConfidences:v97];

  if (v350 < 0) {
    operator delete(v349[0]);
  }

  if (v352 < 0) {
    operator delete(v351[0]);
  }
  unint64_t v99 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_3_unknown0" UTF8String]);
  v349[0] = v351;
  LODWORD(v100) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  unint64_t v101 = [(VNClassificationObservation *)v99 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_3_unknown0" confidence:v100];
  v369[0] = v101;
  long long v102 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_3_unknown1" UTF8String]);
  v347[0] = v349;
  LODWORD(v103) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  int v104 = [(VNClassificationObservation *)v102 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_3_unknown1" confidence:v103];
  v369[1] = v104;
  std::string::size_type v105 = [MEMORY[0x1E4F1C978] arrayWithObjects:v369 count:2];
  v106 = [v338 eyesCategory];
  [v106 setAllLabelsWithConfidences:v105];

  if (v350 < 0) {
    operator delete(v349[0]);
  }

  if (v352 < 0) {
    operator delete(v351[0]);
  }
  v107 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_7_unknown0" UTF8String]);
  v349[0] = v351;
  LODWORD(v108) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  unint64_t v109 = [(VNClassificationObservation *)v107 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_7_unknown0" confidence:v108];
  v368[0] = v109;
  long long v110 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_7_unknown1" UTF8String]);
  v347[0] = v349;
  LODWORD(v111) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  unint64_t v112 = [(VNClassificationObservation *)v110 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_7_unknown1" confidence:v111];
  v368[1] = v112;
  unint64_t v113 = [MEMORY[0x1E4F1C978] arrayWithObjects:v368 count:2];
  unint64_t v114 = [v338 smilingCategory];
  [v114 setAllLabelsWithConfidences:v113];

  if (v350 < 0) {
    operator delete(v349[0]);
  }

  if (v352 < 0) {
    operator delete(v351[0]);
  }
  uint64_t v115 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_4_unknown0" UTF8String]);
  v349[0] = v351;
  LODWORD(v116) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  long long v117 = [(VNClassificationObservation *)v115 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_4_unknown0" confidence:v116];
  v367[0] = v117;
  uint64_t v118 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_4_unknown1" UTF8String]);
  v347[0] = v349;
  LODWORD(v119) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  unint64_t v120 = [(VNClassificationObservation *)v118 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_4_unknown1" confidence:v119];
  v367[1] = v120;
  unint64_t v121 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v347, (char *)[@"UNKNOWN_4_unknown2" UTF8String]);
  v345[0] = v347;
  LODWORD(v122) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
  unint64_t v123 = [(VNClassificationObservation *)v121 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_4_unknown2" confidence:v122];
  v367[2] = v123;
  unint64_t v124 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v345, (char *)[@"UNKNOWN_4_unknown3" UTF8String]);
  __p[0] = v345;
  LODWORD(v125) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
  unint64_t v126 = [(VNClassificationObservation *)v124 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_4_unknown3" confidence:v125];
  v367[3] = v126;
  uint64_t v127 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"UNKNOWN_4_unknown4" UTF8String]);
  v341[0] = __p;
  LODWORD(v128) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
  v129 = [(VNClassificationObservation *)v127 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_4_unknown4" confidence:v128];
  v367[4] = v129;
  v130 = [MEMORY[0x1E4F1C978] arrayWithObjects:v367 count:5];
  unint64_t v131 = [v338 faceHairCategory];
  [v131 setAllLabelsWithConfidences:v130];

  if (v344 < 0) {
    operator delete(__p[0]);
  }

  if (v346 < 0) {
    operator delete(v345[0]);
  }

  if (v348 < 0) {
    operator delete(v347[0]);
  }

  if (v350 < 0) {
    operator delete(v349[0]);
  }

  if (v352 < 0) {
    operator delete(v351[0]);
  }
  long long v132 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_5_unknown0" UTF8String]);
  v349[0] = v351;
  LODWORD(v133) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  v335 = [(VNClassificationObservation *)v132 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_5_unknown0" confidence:v133];
  v366[0] = v335;
  long long v134 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_5_unknown1" UTF8String]);
  v347[0] = v349;
  LODWORD(v135) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  long long v136 = [(VNClassificationObservation *)v134 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_5_unknown1" confidence:v135];
  v366[1] = v136;
  long long v137 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v347, (char *)[@"UNKNOWN_5_unknown2" UTF8String]);
  v345[0] = v347;
  LODWORD(v138) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
  long long v139 = [(VNClassificationObservation *)v137 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_5_unknown2" confidence:v138];
  v366[2] = v139;
  unint64_t v140 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v345, (char *)[@"UNKNOWN_5_unknown3" UTF8String]);
  __p[0] = v345;
  LODWORD(v141) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
  unint64_t v142 = [(VNClassificationObservation *)v140 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_5_unknown3" confidence:v141];
  v366[3] = v142;
  uint64_t v143 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"UNKNOWN_5_unknown4" UTF8String]);
  v341[0] = __p;
  LODWORD(v144) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
  unint64_t v145 = [(VNClassificationObservation *)v143 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_5_unknown4" confidence:v144];
  v366[4] = v145;
  unint64_t v146 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v341, (char *)[@"UNKNOWN_5_unknown5" UTF8String]);
  v339[0] = v341;
  LODWORD(v147) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v341, (_OWORD **)v339)+ 14);
  uint64_t v148 = [(VNClassificationObservation *)v146 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_5_unknown5" confidence:v147];
  v366[5] = v148;
  unint64_t v149 = [MEMORY[0x1E4F1C978] arrayWithObjects:v366 count:6];
  v150 = [v338 hairColorCategory];
  [v150 setAllLabelsWithConfidences:v149];

  if (v342 < 0) {
    operator delete(v341[0]);
  }

  if (v344 < 0) {
    operator delete(__p[0]);
  }

  if (v346 < 0) {
    operator delete(v345[0]);
  }

  if (v348 < 0) {
    operator delete(v347[0]);
  }

  if (v350 < 0) {
    operator delete(v349[0]);
  }

  if (v352 < 0) {
    operator delete(v351[0]);
  }
  v151 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_2_unknown0" UTF8String]);
  v349[0] = v351;
  LODWORD(v152) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  long long v153 = [(VNClassificationObservation *)v151 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_2_unknown0" confidence:v152];
  v365[0] = v153;
  long long v154 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_2_unknown1" UTF8String]);
  v347[0] = v349;
  LODWORD(v155) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  long long v156 = [(VNClassificationObservation *)v154 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_2_unknown1" confidence:v155];
  v365[1] = v156;
  long long v157 = [MEMORY[0x1E4F1C978] arrayWithObjects:v365 count:2];
  long long v158 = [v338 baldCategory];
  [v158 setAllLabelsWithConfidences:v157];

  if (v350 < 0) {
    operator delete(v349[0]);
  }

  if (v352 < 0) {
    operator delete(v351[0]);
  }
  long long v159 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_0_unknown0" UTF8String]);
  v349[0] = v351;
  LODWORD(v160) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  uint64_t v161 = [(VNClassificationObservation *)v159 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_0_unknown0" confidence:v160];
  v364[0] = v161;
  v162 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_0_unknown1" UTF8String]);
  v347[0] = v349;
  LODWORD(v163) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  v164 = [(VNClassificationObservation *)v162 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_0_unknown1" confidence:v163];
  v364[1] = v164;
  v165 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v347, (char *)[@"UNKNOWN_0_unknown2" UTF8String]);
  v345[0] = v347;
  LODWORD(v166) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
  v167 = [(VNClassificationObservation *)v165 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_0_unknown2" confidence:v166];
  v364[2] = v167;
  v168 = [MEMORY[0x1E4F1C978] arrayWithObjects:v364 count:3];
  v169 = [v338 glassesCategory];
  [v169 setAllLabelsWithConfidences:v168];

  if (v348 < 0) {
    operator delete(v347[0]);
  }

  if (v350 < 0) {
    operator delete(v349[0]);
  }

  if (v352 < 0) {
    operator delete(v351[0]);
  }
  v170 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_8_unknown0" UTF8String]);
  v349[0] = v351;
  LODWORD(v171) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  v172 = [(VNClassificationObservation *)v170 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_8_unknown0" confidence:v171];
  v363[0] = v172;
  v173 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_8_unknown1" UTF8String]);
  v347[0] = v349;
  LODWORD(v174) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  v175 = [(VNClassificationObservation *)v173 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_8_unknown1" confidence:v174];
  v363[1] = v175;
  v176 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v347, (char *)[@"UNKNOWN_8_unknown2" UTF8String]);
  v345[0] = v347;
  LODWORD(v177) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
  v178 = [(VNClassificationObservation *)v176 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_8_unknown2" confidence:v177];
  v363[2] = v178;
  v179 = [MEMORY[0x1E4F1C978] arrayWithObjects:v363 count:3];
  v180 = [v338 makeupEyesCategory];
  [v180 setAllLabelsWithConfidences:v179];

  if (v348 < 0) {
    operator delete(v347[0]);
  }

  if (v350 < 0) {
    operator delete(v349[0]);
  }

  if (v352 < 0) {
    operator delete(v351[0]);
  }
  v181 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_9_unknown0" UTF8String]);
  v349[0] = v351;
  LODWORD(v182) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  size_t v183 = [(VNClassificationObservation *)v181 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_9_unknown0" confidence:v182];
  v362[0] = v183;
  int64_t v184 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_9_unknown1" UTF8String]);
  v347[0] = v349;
  LODWORD(v185) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  std::string v186 = [(VNClassificationObservation *)v184 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_9_unknown1" confidence:v185];
  v362[1] = v186;
  v187 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v347, (char *)[@"UNKNOWN_9_unknown2" UTF8String]);
  v345[0] = v347;
  LODWORD(v188) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
  long long v189 = [(VNClassificationObservation *)v187 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_9_unknown2" confidence:v188];
  v362[2] = v189;
  long long v190 = [MEMORY[0x1E4F1C978] arrayWithObjects:v362 count:3];
  long long v191 = [v338 makeupLipsCategory];
  [v191 setAllLabelsWithConfidences:v190];

  if (v348 < 0) {
    operator delete(v347[0]);
  }

  if (v350 < 0) {
    operator delete(v349[0]);
  }

  if (v352 < 0) {
    operator delete(v351[0]);
  }
  if ((unint64_t)(v8 - 3737841665) <= 5 && v8 != 3737841668)
  {
    long long v192 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_10_unknown0" UTF8String]);
    v349[0] = v351;
    LODWORD(v193) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    long long v194 = [(VNClassificationObservation *)v192 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_10_unknown0" confidence:v193];
    v361[0] = v194;
    long long v195 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_10_unknown1" UTF8String]);
    v347[0] = v349;
    LODWORD(v196) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v197 = [(VNClassificationObservation *)v195 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_10_unknown1" confidence:v196];
    v361[1] = v197;
    v198 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)[@"UNKNOWN_10_unknown2" UTF8String]);
    v345[0] = v347;
    LODWORD(v199) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    long long v200 = [(VNClassificationObservation *)v198 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_10_unknown2" confidence:v199];
    v361[2] = v200;
    v201 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)[@"UNKNOWN_10_unknown3" UTF8String]);
    __p[0] = v345;
    LODWORD(v202) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    v203 = [(VNClassificationObservation *)v201 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_10_unknown3" confidence:v202];
    v361[3] = v203;
    v204 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"UNKNOWN_10_unknown4" UTF8String]);
    v341[0] = __p;
    LODWORD(v205) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    v206 = [(VNClassificationObservation *)v204 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_10_unknown4" confidence:v205];
    v361[4] = v206;
    long long v207 = [MEMORY[0x1E4F1C978] arrayWithObjects:v361 count:5];
    uint64_t v208 = [v338 VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB];
    [v208 setAllLabelsWithConfidences:v207];

    if (v344 < 0) {
      operator delete(__p[0]);
    }

    if (v346 < 0) {
      operator delete(v345[0]);
    }

    if (v348 < 0) {
      operator delete(v347[0]);
    }

    if (v350 < 0) {
      operator delete(v349[0]);
    }

    if (v352 < 0) {
      operator delete(v351[0]);
    }
    v209 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_11_unknown0" UTF8String]);
    v349[0] = v351;
    LODWORD(v210) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v211 = [(VNClassificationObservation *)v209 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_11_unknown0" confidence:v210];
    v360[0] = v211;
    v212 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_11_unknown1" UTF8String]);
    v347[0] = v349;
    LODWORD(v213) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v214 = [(VNClassificationObservation *)v212 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_11_unknown1" confidence:v213];
    v360[1] = v214;
    v215 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)[@"UNKNOWN_11_unknown2" UTF8String]);
    v345[0] = v347;
    LODWORD(v216) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    v217 = [(VNClassificationObservation *)v215 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_11_unknown2" confidence:v216];
    v360[2] = v217;
    v218 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)[@"UNKNOWN_11_unknown3" UTF8String]);
    __p[0] = v345;
    LODWORD(v219) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    v220 = [(VNClassificationObservation *)v218 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_11_unknown3" confidence:v219];
    v360[3] = v220;
    v221 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"UNKNOWN_11_unknown4" UTF8String]);
    v341[0] = __p;
    LODWORD(v222) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    v223 = [(VNClassificationObservation *)v221 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_11_unknown4" confidence:v222];
    v360[4] = v223;
    v224 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v341, (char *)[@"UNKNOWN_11_unknown5" UTF8String]);
    v339[0] = v341;
    LODWORD(v225) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v341, (_OWORD **)v339)+ 14);
    v226 = [(VNClassificationObservation *)v224 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_11_unknown5" confidence:v225];
    v360[5] = v226;
    v227 = [MEMORY[0x1E4F1C978] arrayWithObjects:v360 count:6];
    v228 = [v338 VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1];
    [v228 setAllLabelsWithConfidences:v227];

    if (v342 < 0) {
      operator delete(v341[0]);
    }

    if (v344 < 0) {
      operator delete(__p[0]);
    }

    if (v346 < 0) {
      operator delete(v345[0]);
    }

    if (v348 < 0) {
      operator delete(v347[0]);
    }

    if (v350 < 0) {
      operator delete(v349[0]);
    }

    if (v352 < 0) {
      operator delete(v351[0]);
    }
    v229 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_13_unknown0" UTF8String]);
    v349[0] = v351;
    LODWORD(v230) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v336 = [(VNClassificationObservation *)v229 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_13_unknown0" confidence:v230];
    v359[0] = v336;
    v231 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_13_unknown1" UTF8String]);
    v347[0] = v349;
    LODWORD(v232) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v233 = [(VNClassificationObservation *)v231 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_13_unknown1" confidence:v232];
    v359[1] = v233;
    v234 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)[@"UNKNOWN_13_unknown2" UTF8String]);
    v345[0] = v347;
    LODWORD(v235) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    v236 = [(VNClassificationObservation *)v234 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_13_unknown2" confidence:v235];
    v359[2] = v236;
    v237 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)[@"UNKNOWN_13_unknown3" UTF8String]);
    __p[0] = v345;
    LODWORD(v238) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    v239 = [(VNClassificationObservation *)v237 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_13_unknown3" confidence:v238];
    v359[3] = v239;
    v240 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"UNKNOWN_13_unknown4" UTF8String]);
    v341[0] = __p;
    LODWORD(v241) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    v242 = [(VNClassificationObservation *)v240 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_13_unknown4" confidence:v241];
    v359[4] = v242;
    v243 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v341, (char *)[@"UNKNOWN_13_unknown5" UTF8String]);
    v339[0] = v341;
    LODWORD(v244) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v341, (_OWORD **)v339)+ 14);
    v245 = [(VNClassificationObservation *)v243 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_13_unknown5" confidence:v244];
    v359[5] = v245;
    v246 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v339, (char *)[@"UNKNOWN_13_unknown6" UTF8String]);
    v353 = v339;
    LODWORD(v247) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v339, (_OWORD **)&v353)+ 14);
    v248 = [(VNClassificationObservation *)v246 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_13_unknown6" confidence:v247];
    v359[6] = v248;
    v249 = [MEMORY[0x1E4F1C978] arrayWithObjects:v359 count:7];
    v250 = [v338 VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk];
    [v250 setAllLabelsWithConfidences:v249];

    if (v340 < 0) {
      operator delete(v339[0]);
    }

    if (v342 < 0) {
      operator delete(v341[0]);
    }

    if (v344 < 0) {
      operator delete(__p[0]);
    }

    if (v346 < 0) {
      operator delete(v345[0]);
    }

    if (v348 < 0) {
      operator delete(v347[0]);
    }

    if (v350 < 0) {
      operator delete(v349[0]);
    }

    if (v352 < 0) {
      operator delete(v351[0]);
    }
    v251 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_14_unknown0" UTF8String]);
    v349[0] = v351;
    LODWORD(v252) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v253 = [(VNClassificationObservation *)v251 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_14_unknown0" confidence:v252];
    v358[0] = v253;
    v254 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_14_unknown1" UTF8String]);
    v347[0] = v349;
    LODWORD(v255) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v256 = [(VNClassificationObservation *)v254 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_14_unknown1" confidence:v255];
    v358[1] = v256;
    v257 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)[@"UNKNOWN_14_unknown2" UTF8String]);
    v345[0] = v347;
    LODWORD(v258) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    v259 = [(VNClassificationObservation *)v257 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_14_unknown2" confidence:v258];
    v358[2] = v259;
    v260 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)[@"UNKNOWN_14_unknown3" UTF8String]);
    __p[0] = v345;
    LODWORD(v261) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    v262 = [(VNClassificationObservation *)v260 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_14_unknown3" confidence:v261];
    v358[3] = v262;
    v263 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"UNKNOWN_14_unknown4" UTF8String]);
    v341[0] = __p;
    LODWORD(v264) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    v265 = [(VNClassificationObservation *)v263 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_14_unknown4" confidence:v264];
    v358[4] = v265;
    v266 = [MEMORY[0x1E4F1C978] arrayWithObjects:v358 count:5];
    v267 = [v338 VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP];
    [v267 setAllLabelsWithConfidences:v266];

    if (v344 < 0) {
      operator delete(__p[0]);
    }

    if (v346 < 0) {
      operator delete(v345[0]);
    }

    if (v348 < 0) {
      operator delete(v347[0]);
    }

    if (v350 < 0) {
      operator delete(v349[0]);
    }

    if (v352 < 0) {
      operator delete(v351[0]);
    }
    v268 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_12_unknown0" UTF8String]);
    v349[0] = v351;
    LODWORD(v269) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v337 = [(VNClassificationObservation *)v268 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_12_unknown0" confidence:v269];
    v357[0] = v337;
    v270 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_12_unknown1" UTF8String]);
    v347[0] = v349;
    LODWORD(v271) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v272 = [(VNClassificationObservation *)v270 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_12_unknown1" confidence:v271];
    v357[1] = v272;
    v273 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)[@"UNKNOWN_12_unknown2" UTF8String]);
    v345[0] = v347;
    LODWORD(v274) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    v275 = [(VNClassificationObservation *)v273 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_12_unknown2" confidence:v274];
    v357[2] = v275;
    v276 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)[@"UNKNOWN_12_unknown3" UTF8String]);
    __p[0] = v345;
    LODWORD(v277) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    v278 = [(VNClassificationObservation *)v276 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_12_unknown3" confidence:v277];
    v357[3] = v278;
    v279 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"UNKNOWN_12_unknown4" UTF8String]);
    v341[0] = __p;
    LODWORD(v280) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    v281 = [(VNClassificationObservation *)v279 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_12_unknown4" confidence:v280];
    v357[4] = v281;
    v282 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v341, (char *)[@"UNKNOWN_12_unknown5" UTF8String]);
    v339[0] = v341;
    LODWORD(v283) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v341, (_OWORD **)v339)+ 14);
    v284 = [(VNClassificationObservation *)v282 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_12_unknown5" confidence:v283];
    v357[5] = v284;
    v285 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v339, (char *)[@"UNKNOWN_12_unknown6" UTF8String]);
    v353 = v339;
    LODWORD(v286) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v339, (_OWORD **)&v353)+ 14);
    v287 = [(VNClassificationObservation *)v285 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_12_unknown6" confidence:v286];
    v357[6] = v287;
    v288 = [MEMORY[0x1E4F1C978] arrayWithObjects:v357 count:7];
    v289 = [v338 VN2riiZbQrloRhCzYW56f0rk4N3ROe151S];
    [v289 setAllLabelsWithConfidences:v288];

    if (v340 < 0) {
      operator delete(v339[0]);
    }

    if (v342 < 0) {
      operator delete(v341[0]);
    }

    if (v344 < 0) {
      operator delete(__p[0]);
    }

    if (v346 < 0) {
      operator delete(v345[0]);
    }

    if (v348 < 0) {
      operator delete(v347[0]);
    }

    if (v350 < 0) {
      operator delete(v349[0]);
    }

    if (v352 < 0) {
      operator delete(v351[0]);
    }
    v290 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_15_unknown0" UTF8String]);
    v349[0] = v351;
    LODWORD(v291) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v292 = [(VNClassificationObservation *)v290 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_15_unknown0" confidence:v291];
    v356[0] = v292;
    v293 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_15_unknown1" UTF8String]);
    v347[0] = v349;
    LODWORD(v294) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v295 = [(VNClassificationObservation *)v293 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_15_unknown1" confidence:v294];
    v356[1] = v295;
    v296 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)[@"UNKNOWN_15_unknown2" UTF8String]);
    v345[0] = v347;
    LODWORD(v297) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    v298 = [(VNClassificationObservation *)v296 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_15_unknown2" confidence:v297];
    v356[2] = v298;
    v299 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)[@"UNKNOWN_15_unknown3" UTF8String]);
    __p[0] = v345;
    LODWORD(v300) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    v301 = [(VNClassificationObservation *)v299 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_15_unknown3" confidence:v300];
    v356[3] = v301;
    v302 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"UNKNOWN_15_unknown4" UTF8String]);
    v341[0] = __p;
    LODWORD(v303) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    v304 = [(VNClassificationObservation *)v302 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_15_unknown4" confidence:v303];
    v356[4] = v304;
    v305 = [MEMORY[0x1E4F1C978] arrayWithObjects:v356 count:5];
    v306 = [v338 VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk];
    [v306 setAllLabelsWithConfidences:v305];

    if (v344 < 0) {
      operator delete(__p[0]);
    }

    if (v346 < 0) {
      operator delete(v345[0]);
    }

    if (v348 < 0) {
      operator delete(v347[0]);
    }

    if (v350 < 0) {
      operator delete(v349[0]);
    }

    if (v352 < 0) {
      operator delete(v351[0]);
    }
    v307 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_16_unknown0" UTF8String]);
    v349[0] = v351;
    LODWORD(v308) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v309 = [(VNClassificationObservation *)v307 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_16_unknown0" confidence:v308];
    v355[0] = v309;
    v310 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_16_unknown1" UTF8String]);
    v347[0] = v349;
    LODWORD(v311) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v312 = [(VNClassificationObservation *)v310 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_16_unknown1" confidence:v311];
    v355[1] = v312;
    v313 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)[@"UNKNOWN_16_unknown2" UTF8String]);
    v345[0] = v347;
    LODWORD(v314) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    v315 = [(VNClassificationObservation *)v313 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_16_unknown2" confidence:v314];
    v355[2] = v315;
    v316 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)[@"UNKNOWN_16_unknown3" UTF8String]);
    __p[0] = v345;
    LODWORD(v317) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    v318 = [(VNClassificationObservation *)v316 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_16_unknown3" confidence:v317];
    v355[3] = v318;
    v319 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"UNKNOWN_16_unknown4" UTF8String]);
    v341[0] = __p;
    LODWORD(v320) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    v321 = [(VNClassificationObservation *)v319 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_16_unknown4" confidence:v320];
    v355[4] = v321;
    v322 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v341, (char *)[@"UNKNOWN_16_unknown5" UTF8String]);
    v339[0] = v341;
    LODWORD(v323) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v341, (_OWORD **)v339)+ 14);
    v324 = [(VNClassificationObservation *)v322 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_16_unknown5" confidence:v323];
    v355[5] = v324;
    v325 = [MEMORY[0x1E4F1C978] arrayWithObjects:v355 count:6];
    v326 = [v338 VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq];
    [v326 setAllLabelsWithConfidences:v325];

    if (v342 < 0) {
      operator delete(v341[0]);
    }

    if (v344 < 0) {
      operator delete(__p[0]);
    }

    if (v346 < 0) {
      operator delete(v345[0]);
    }

    if (v348 < 0) {
      operator delete(v347[0]);
    }

    if (v350 < 0) {
      operator delete(v349[0]);
    }

    if (v352 < 0) {
      operator delete(v351[0]);
    }
    v327 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)[@"UNKNOWN_17_unknown0" UTF8String]);
    v349[0] = v351;
    LODWORD(v328) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v50 = [(VNClassificationObservation *)v327 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_17_unknown0" confidence:v328];
    v354[0] = v50;
    v329 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)[@"UNKNOWN_17_unknown1" UTF8String]);
    v347[0] = v349;
    LODWORD(v330) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v331 = [(VNClassificationObservation *)v329 initWithOriginatingRequestSpecifier:v7 identifier:@"UNKNOWN_17_unknown1" confidence:v330];
    v354[1] = v331;
    v332 = [MEMORY[0x1E4F1C978] arrayWithObjects:v354 count:2];
    v333 = [v338 facemaskCategory];
    [v333 setAllLabelsWithConfidences:v332];

    if (v350 < 0) {
      operator delete(v349[0]);
    }
    goto LABEL_182;
  }
LABEL_184:
}

- (vImage_Buffer)prepare_vImageBufferForCVPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = +[VNError errorForUnimplementedMethod:a2 ofObject:self];
  }
  return 0;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v155 = a7;
  id v154 = a9;
  BOOL v160 = 0;
  if (!+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v160, @"VNFaceAnalyzerMultiDetectorProcessingOptionCreateFaceprint", v14, 0, a8)|| (double v152 = self, v159 = 0, !+[VNValidationUtilities getBOOLValue:&v159 forKey:@"VNFaceAnalyzerMultiDetectorProcessingOptionCreateFaceAnalyzer" inOptions:v14 withDefaultValue:0 error:a8]))
  {
    id v18 = 0;
    goto LABEL_172;
  }
  p_cache = &OBJC_METACLASS___VNFaceQualityGenerator.cache;
  +[VNError VNAssert:v160 || v159 log:@"Unexpected options parameter passed to face analyzer multi-detector"];
  long long v153 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  if (v160)
  {
    double v16 = VNCloneFaceObservationFromOptions((uint64_t)v14, a8);
    if (!v16)
    {
      id v18 = 0;
      goto LABEL_171;
    }
    [v153 addObject:v16];
    objc_super v17 = [v16 faceprint];
    BOOL v160 = v17 == 0;
  }
  else
  {
    double v16 = 0;
  }
  v151 = v16;
  if (v159)
  {
    double v19 = VNCloneFaceObservationFromOptions((uint64_t)v14, a8);
    if (!v19)
    {
      id v18 = 0;
      goto LABEL_170;
    }
    [v153 addObject:v19];
    uint64_t v20 = [v19 faceAttributes];
    v150 = v19;
    BOOL v159 = v20 == 0;
  }
  else
  {
    v150 = 0;
  }
  char v158 = 0;
  if (!+[VNValidationUtilities getBOOLValue:&v158 forKey:@"VNDetectorInternalProcessOption_RecordImageTooSmallWarning" inOptions:v14 withDefaultValue:0 error:a8])goto LABEL_168; {
  if (v158)
  }
  {
    dest.data = 0;
    if (!+[VNValidationUtilities getNSUIntegerValue:&dest forKey:@"VNDetectorInternalProcessOption_DesiredMinimumFacePrintingLongDimension" inOptions:v14 withDefaultValue:0 error:a8])goto LABEL_168; {
    data = dest.data;
    }
    id v22 = v155;
    int v23 = [NSNumber numberWithUnsignedLong:data];
    [v22 recordWarning:@"VNRequestWarningImageMinimumLongDimension" value:v23];

    id v24 = v22;
    id v25 = v16;
    uint64_t v26 = v25;
    if (v25)
    {
      v169[0].data = v25;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v169 count:1];
      [v24 recordWarning:@"VNRequestWarningImageTooSmallForFaceObservations" value:v27];
    }
  }
  uint64_t v28 = [(VNFaceAnalyzerMultiDetectorBase *)v152 prepare_vImageBufferForCVPixelBuffer:a4 error:a8];
  uint64_t v29 = (_OWORD *)v28;
  if (!v28) {
    goto LABEL_168;
  }
  unint64_t v145 = v14;
  unint64_t v146 = (_OWORD *)v28;
  ptr = v152->_mMultiHeadedFaceClassifier.__ptr_;
  if (*((unsigned char *)ptr + 6620))
  {
    shared_ptr<vision::mod::FaceprintAndAttributes> v31 = operator new(0x90uLL);
    v31[1] = 0;
    v31[2] = 0;
    *shared_ptr<vision::mod::FaceprintAndAttributes> v31 = &unk_1EF7539A0;
    v31[4] = 0;
    v31[5] = 0;
    v31[9] = 0;
    v31[8] = 0;
    v31[6] = 0;
    v31[7] = v31 + 8;
    *((_OWORD *)v31 + 5) = 0u;
    *((_OWORD *)v31 + 6) = 0u;
    *((unsigned char *)v31 + 112) = 0;
    v31[3] = &unk_1EF752918;
    v31[15] = 0;
    *((_DWORD *)v31 + 32) = 1;
    v31[17] = 0;
    *((void *)ptr + 838) = v31 + 3;
    double v32 = (std::__shared_weak_count *)*((void *)ptr + 839);
    *((void *)ptr + 839) = v31;
    if (v32) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v32);
    }
    *((_DWORD *)ptr + 1674) = 0;
  }
  *((unsigned char *)ptr + 6620) = 0;
  uint64_t v33 = vision::mod::ImageDescriptorAugmenterAbstract::augment(*(void **)ptr, v29, 4u);
  if ((v33 & 0x80) == 0) {
    goto LABEL_155;
  }
  vision::mod::ImageDescriptorAugmenterAbstract::getAugmentedImages((vision::mod::ImageDescriptorAugmenterAbstract *)v169, *(void *)ptr);
  v165[0] = 0;
  v165[1] = 0;
  v164 = (uint64_t *)v165;
  long long v34 = *(_OWORD *)&v169[0].data;
  uint64_t v142 = (uint64_t)(v169[0].height - (unint64_t)v169[0].data) >> 5;
  if ((int)v142 < 1)
  {
LABEL_88:
    if (*((unsigned char *)ptr + 66))
    {
      uint64_t v80 = *((void *)ptr + 774);
      uint64_t v81 = *((void *)ptr + 773);
      if (v80 != v81)
      {
        unint64_t v82 = 0;
        uint64_t v148 = a8;
        do
        {
          uint64_t v83 = *((void *)ptr + 828) + 24 * v82;
          if (*(char *)(v83 + 23) < 0)
          {
            uint64_t v83 = *(void *)v83;
            uint64_t v84 = *(void *)(*((void *)ptr + 828) + 24 * v82 + 8);
          }
          else
          {
            uint64_t v84 = *(unsigned __int8 *)(v83 + 23);
          }
          if (v84 == 9)
          {
            uint64_t v85 = *(void *)v83;
            int v86 = *(unsigned __int8 *)(v83 + 8);
            BOOL v88 = v85 == 0x5F4E574F4E4B4E55 && v86 == 57;
          }
          else
          {
            BOOL v88 = 0;
          }
          uint64_t v89 = *(void *)(v81 + 168 * v82 + 24)
              * *(void *)(v81 + 168 * v82 + 16)
              * *(void *)(v81 + 168 * v82 + 32)
              * *(void *)(v81 + 168 * v82 + 40);
          if ((int)v89 >= 1)
          {
            uint64_t v90 = 0;
            BOOL v91 = v89 == 2 && v88;
            uint64_t v92 = (*(_DWORD *)(v81 + 168 * v82 + 24)
                               * *(_DWORD *)(v81 + 168 * v82 + 16)
                               * *(_DWORD *)(v81 + 168 * v82 + 32)
                               * *(_DWORD *)(v81 + 168 * v82 + 40));
            do
            {
              int v93 = *(_DWORD *)(*(void *)(*((void *)ptr + 773) + 168 * v82) + 4 * v90);
              uint64_t v94 = *((void *)ptr + 828) + 24 * v82;
              if (*(char *)(v94 + 23) >= 0) {
                size_t v95 = *(unsigned __int8 *)(v94 + 23);
              }
              else {
                size_t v95 = *(void *)(v94 + 8);
              }
              std::string::basic_string[abi:ne180100]((uint64_t)&dest, v95 + 8);
              if ((dest.width & 0x8000000000000000) == 0) {
                p_vImage_Buffer dest = &dest;
              }
              else {
                p_vImage_Buffer dest = dest.data;
              }
              if (v95)
              {
                if (*(char *)(v94 + 23) >= 0) {
                  unint64_t v97 = (const void *)v94;
                }
                else {
                  unint64_t v97 = *(const void **)v94;
                }
                memmove(p_dest, v97, v95);
              }
              strcpy((char *)p_dest + v95, "_unknown");
              std::to_string((std::string *)&v166, v91 + v90);
              if ((v166.width & 0x8000000000000000) == 0) {
                unint64_t v98 = (const std::string::value_type *)&v166;
              }
              else {
                unint64_t v98 = (const std::string::value_type *)v166.data;
              }
              if ((v166.width & 0x8000000000000000) == 0) {
                vImagePixelCount width_high = HIBYTE(v166.width);
              }
              else {
                vImagePixelCount width_high = v166.height;
              }
              double v100 = std::string::append((std::string *)&dest, v98, width_high);
              long long v101 = *(_OWORD *)&v100->__r_.__value_.__l.__data_;
              v169[0].width = v100->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v169[0].data = v101;
              v100->__r_.__value_.__l.__size_ = 0;
              v100->__r_.__value_.__r.__words[2] = 0;
              v100->__r_.__value_.__r.__words[0] = 0;
              src.data = v169;
              *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)ptr + 834, v169, &src)+ 14) = v93;
              if (SHIBYTE(v169[0].width) < 0) {
                operator delete(v169[0].data);
              }
              if (SHIBYTE(v166.width) < 0) {
                operator delete(v166.data);
              }
              if (SHIBYTE(dest.width) < 0) {
                operator delete(dest.data);
              }
              ++v90;
            }
            while (v92 != v90);
            uint64_t v80 = *((void *)ptr + 774);
            uint64_t v81 = *((void *)ptr + 773);
          }
          ++v82;
          a8 = v148;
          p_cache = (void **)(&OBJC_METACLASS___VNFaceQualityGenerator + 16);
        }
        while (0xCF3CF3CF3CF3CF3DLL * ((v80 - v81) >> 3) > v82);
      }
    }
    if (!*((unsigned char *)ptr + 64)
      || (*(void *)(*((void *)ptr + 838) + 96) = *((int *)ptr + 19),
          uint64_t v33 = (*(uint64_t (**)(void, void))(**(void **)ptr + 24))(*(void *)ptr, 0),
          (v33 & 0x80) != 0))
    {
      if (*((unsigned char *)ptr + 65) && *((void *)&v34 + 1) != (void)v34) {
        *((float *)ptr + 1674) = *((float *)ptr + 1674) / (float)(unint64_t)v142;
      }
      if (!*((unsigned char *)ptr + 67) || (uint64_t v102 = *((void *)ptr + 831), v103 = *((void *)ptr + 832), v102 == v103))
      {
LABEL_148:
        *((unsigned char *)ptr + 6620) = 1;
        uint64_t v33 = 9088;
      }
      else
      {
        while (1)
        {
          if (*(char *)(v102 + 23) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)v169, *(const std::string::value_type **)v102, *(void *)(v102 + 8));
          }
          else
          {
            *(_OWORD *)&v169[0].data = *(_OWORD *)v102;
            v169[0].width = *(void *)(v102 + 16);
          }
          uint64_t v104 = *((int *)ptr + 21);
          std::__tree<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)ptr + 840, v169, (uint64_t)v169)[7][12] = v104;
          uint64_t v105 = *(void *)ptr;
          v106 = std::__tree<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v164, v169, (uint64_t)v169)[7];
          v107 = std::__tree<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)ptr + 840, v169, (uint64_t)v169);
          uint64_t v33 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v105 + 24))(v105, v106, v107[7]);
          if (SHIBYTE(v169[0].width) < 0) {
            operator delete(v169[0].data);
          }
          if ((v33 & 0x80) == 0) {
            break;
          }
          v102 += 24;
          if (v102 == v103) {
            goto LABEL_148;
          }
        }
      }
      uint64_t v29 = v146;
    }
    else
    {
      uint64_t v29 = v146;
    }
    goto LABEL_153;
  }
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = ((v169[0].height - (unint64_t)v169[0].data) >> 5);
  uint64_t v141 = 4221;
  __asm { FMOV            V0.4S, #1.0 }
  int32x4_t v143 = _Q0;
  uint64_t v144 = v37;
  while (1)
  {
    uint64_t v147 = v37 - 1;
    v42 = (_OWORD *)(v34 + 32 * (v37 - 1));
    long long v43 = v42[1];
    *(_OWORD *)&src.data = *v42;
    *(_OWORD *)&src.width = v43;
    int32x4_t v161 = 0uLL;
    LODWORD(v162) = 0;
    if (*((int *)ptr + 20) >= 2)
    {
      if (src.height)
      {
        uint64_t v44 = 0;
        uint64_t v45 = 0;
        uint64_t v46 = 0;
        uint64_t v47 = 0;
        v48 = (char *)src.data + 2;
        do
        {
          double v49 = (unsigned __int8 *)v48;
          for (vImagePixelCount i = src.width; i; --i)
          {
            v45 += *(v49 - 2);
            v46 += *(v49 - 1);
            unsigned int v51 = *v49;
            v49 += 4;
            v47 += v51;
          }
          ++v44;
          v48 += src.rowBytes;
        }
        while (v44 != src.height);
      }
      else
      {
        uint64_t v47 = 0;
        uint64_t v46 = 0;
        uint64_t v45 = 0;
      }
      float v56 = (float)(src.width * src.height);
      float v57 = (float)v45 / v56;
      float v58 = (float)v46 / v56;
      v161.i32[3] = *((_DWORD *)ptr + 17);
      float v59 = (float)v47 / v56;
      if (*((unsigned char *)ptr + 75))
      {
        *(float *)v161.i32 = -v57;
        *(float *)&v161.i32[1] = -v58;
        float v60 = -v59;
      }
      else
      {
        if (!*((unsigned char *)ptr + 74))
        {
LABEL_51:
          LOBYTE(v162) = *((unsigned char *)ptr + 73);
          v169[0] = src;
          int v61 = espresso_network_bind_input_vimagebuffer_bgra8();
          goto LABEL_54;
        }
        float v60 = (float)(v57 + (float)(v59 + v58)) / -3.0;
        *(float *)v161.i32 = v60;
        *(float *)&v161.i32[1] = v60;
      }
      *(float *)&v161.i32[2] = v60;
      goto LABEL_51;
    }
    memset(&dest, 0, sizeof(dest));
    MEMORY[0x1A6257F80](&dest, src.width, src.height, 8, 0);
    if (!src.data || !src.width || !src.height || src.rowBytes < 2) {
      goto LABEL_152;
    }
    *(void *)matrix = 0x4C0096001DLL;
    *(void *)pre_bias = 0;
    if (vImageMatrixMultiply_ARGB8888ToPlanar8(&src, &dest, matrix, 256, pre_bias, 0, 0)) {
      break;
    }
    if (dest.height)
    {
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      BOOL v54 = (unsigned __int8 *)dest.data;
      do
      {
        if (dest.width)
        {
          vImagePixelCount v55 = 0;
          do
          {
            v53 += v54[v55];
            v55 += 4;
          }
          while (dest.width > v55);
        }
        ++v52;
        v54 += dest.rowBytes;
      }
      while (v52 != dest.height);
    }
    else
    {
      uint64_t v53 = 0;
    }
    int32x4_t v62 = v143;
    *(float *)v62.i32 = (float)-(float)v53 / (float)(dest.width * dest.height);
    int32x4_t v63 = vzip1q_s32(v62, v62);
    *(float *)&v63.i32[2] = (float)-(float)v53 / (float)(dest.width * dest.height);
    int32x4_t v161 = v63;
    LOBYTE(v162) = 0;
    vImage_Buffer v166 = dest;
    int v61 = espresso_network_bind_input_vimagebuffer_planar8();
LABEL_54:
    if (v61 || espresso_plan_execute_sync())
    {
      uint64_t v33 = 9086;
      goto LABEL_153;
    }
    if (*((unsigned char *)ptr + 64))
    {
      v64 = malloc_type_malloc(4 * *((int *)ptr + 19), 0x100004052888210uLL);
      std::shared_ptr<float>::shared_ptr[abi:ne180100]<float,void (*)(void *),void>(&v166, (uint64_t)v64);
    }
    if (*((unsigned char *)ptr + 65)) {
      *((float *)ptr + 1674) = **((float **)ptr + 806) + *((float *)ptr + 1674);
    }
    if (*((unsigned char *)ptr + 67))
    {
      uint64_t v149 = v36;
      dest.height = 0;
      dest.width = 0;
      dest.data = &dest.height;
      uint64_t v65 = *((void *)ptr + 831);
      if (v65 != *((void *)ptr + 832))
      {
        if (*(char *)(v65 + 23) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)v169, *(const std::string::value_type **)v65, *(void *)(v65 + 8));
        }
        else
        {
          *(_OWORD *)&v169[0].data = *(_OWORD *)v65;
          v169[0].width = *(void *)(v65 + 16);
        }
        v66 = malloc_type_malloc(4 * *((int *)ptr + 21), 0x100004052888210uLL);
        std::shared_ptr<float>::shared_ptr[abi:ne180100]<float,void (*)(void *),void>(&v166, (uint64_t)v66);
      }
      uint64_t v67 = *((void *)ptr + 832);
      uint64_t v68 = *((void *)ptr + 831);
      if (v67 != v68)
      {
        unint64_t v69 = 0;
        LODWORD(v70) = *((_DWORD *)ptr + 21);
        do
        {
          if ((int)v70 >= 1)
          {
            uint64_t v71 = 0;
            do
            {
              int v72 = *(_DWORD *)(*(void *)(*((void *)ptr + 776) + 168 * v69) + 4 * v71);
              *((_DWORD *)std::__tree<std::__value_type<std::string,std::shared_ptr<float>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<float>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<float>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&dest, (void *)(*((void *)ptr + 831) + 24 * v69), *((void *)ptr + 831) + 24 * v69)[7]+ v71++) = v72;
              uint64_t v70 = *((int *)ptr + 21);
            }
            while (v71 < v70);
            uint64_t v67 = *((void *)ptr + 832);
            uint64_t v68 = *((void *)ptr + 831);
          }
          ++v69;
        }
        while (0xAAAAAAAAAAAAAAABLL * ((v67 - v68) >> 3) > v69);
      }
      uint64_t v73 = *((void *)ptr + 831);
      uint64_t v74 = *((void *)ptr + 832);
      while (v73 != v74)
      {
        if (*(char *)(v73 + 23) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)&v166, *(const std::string::value_type **)v73, *(void *)(v73 + 8));
        }
        else
        {
          *(_OWORD *)&v166.data = *(_OWORD *)v73;
          v166.width = *(void *)(v73 + 16);
        }
        double v75 = operator new(8uLL);
        *double v75 = v35;
        v161.i64[1] = (uint64_t)(v75 + 1);
        v162 = v75 + 1;
        v161.i64[0] = (uint64_t)v75;
        v76 = std::__tree<std::__value_type<std::string,std::shared_ptr<float>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<float>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<float>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&dest, &v166, (uint64_t)&v166);
        uint64_t v77 = *((int *)ptr + 21);
        vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v169, &v161, v76[7], 4 * v77, 1, 0);
        int v171 = 1;
        v172 = 0;
        v169[0].data = &unk_1EF752918;
        uint64_t v170 = v77 & 0x3FFFFFFFFFFFFFFFLL;
        if (!v35)
        {
          uint64_t DeepCopy = vision::mod::ImageDescriptorBufferAbstract::createDeepCopy((vision::mod::ImageDescriptorBufferAbstract *)v169);
          std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>::shared_ptr[abi:ne180100]<vision::mod::ImageDescriptorBufferAbstract,void>(matrix, DeepCopy);
        }
        double v78 = std::__tree<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v164, &v166, (uint64_t)&v166);
        (*(void (**)(uint64_t *, vImage_Buffer *))(*v78[7] + 40))(v78[7], v169);
        v169[0].data = &unk_1EF752918;
        free(v172);
        vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(&v169[0].data);
        operator delete(v75);
        if (SHIBYTE(v166.width) < 0) {
          operator delete(v166.data);
        }
        v73 += 24;
      }
      std::__tree<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>>>::destroy((void *)dest.height);
      uint64_t v29 = v146;
      uint64_t v36 = v149;
    }
    ++v35;
    uint64_t v37 = v147;
    if (v35 == v144) {
      goto LABEL_88;
    }
  }
  uint64_t v141 = 4218;
LABEL_152:
  uint64_t v33 = v141;
LABEL_153:
  std::__tree<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>>>::destroy(v165[0]);
  if ((void)v34) {
    operator delete((void *)v34);
  }
LABEL_155:
  if (v33 != 128)
  {
    id v14 = v145;
    if (a8)
    {
      unint64_t v112 = NSString;
      espresso_plan_get_error_info();
      std::string::basic_string[abi:ne180100]<0>(v169, v113);
      if ((v169[0].width & 0x8000000000000000) == 0) {
        unint64_t v114 = v169;
      }
      else {
        unint64_t v114 = (vImage_Buffer *)v169[0].data;
      }
      uint64_t v115 = objc_msgSend(v112, "stringWithFormat:", @"Could not run network. Error = %s", v114);
      if (SHIBYTE(v169[0].width) < 0) {
        operator delete(v169[0].data);
      }
      double v116 = VNErrorForCVMLStatus((id)v33);
      *a8 = +[VNError errorForInternalErrorWithLocalizedDescription:v115 underlyingError:v116];
    }
    free(v29);
    goto LABEL_168;
  }
  free(v29);
  id v14 = v145;
  if (!v160) {
    goto LABEL_208;
  }
  uint64_t v108 = (uint64_t)v152->_mMultiHeadedFaceClassifier.__ptr_;
  if (!*(unsigned char *)(v108 + 64))
  {
    if (a8)
    {
      id v118 = [p_cache + 458 errorForInternalErrorWithLocalizedDescription:@"Error calculating print"];
LABEL_216:
      id v18 = 0;
      *a8 = v118;
      goto LABEL_169;
    }
LABEL_168:
    id v18 = 0;
    goto LABEL_169;
  }
  double DescriptorBuffer = vision::mod::FaceprintAndAttributes::createDescriptorBuffer((vision::mod::FaceprintAndAttributes *)&dest, v108);
  long long v110 = v152->_mMultiHeadedFaceClassifier.__ptr_;
  if (*((unsigned char *)v110 + 6620))
  {
    (*(void (**)(void *, void, double))(*(void *)dest.data + 40))(dest.data, *((void *)v110 + 838), DescriptorBuffer);
    double v111 = &CVML_status_ok;
  }
  else
  {
    double v111 = &CVML_status_IOError;
  }
  uint64_t v119 = *v111 + 128;
  if ((*(unsigned char *)v111 + 0x80) != 128)
  {
    if (a8)
    {
      double v122 = NSString;
      espresso_plan_get_error_info();
      std::string::basic_string[abi:ne180100]<0>(v169, v123);
      if ((v169[0].width & 0x8000000000000000) == 0) {
        unint64_t v124 = v169;
      }
      else {
        unint64_t v124 = (vImage_Buffer *)v169[0].data;
      }
      double v125 = objc_msgSend(v122, "stringWithFormat:", @"Could not get print output. Error = %s", v124);
      if (SHIBYTE(v169[0].width) < 0) {
        operator delete(v169[0].data);
      }
      goto LABEL_203;
    }
LABEL_204:
    int v128 = 1;
    goto LABEL_205;
  }
  unint64_t v120 = v152->_mMultiHeadedFaceClassifier.__ptr_;
  if (!*((unsigned char *)v120 + 65))
  {
    LODWORD(DescriptorBuffer) = 1.0;
    goto LABEL_192;
  }
  if (*((unsigned char *)v120 + 6620))
  {
    LODWORD(DescriptorBuffer) = *((_DWORD *)v120 + 1674);
    unint64_t v121 = &CVML_status_ok;
  }
  else
  {
    unint64_t v121 = &CVML_status_IOError;
    LODWORD(DescriptorBuffer) = 1.0;
  }
  uint64_t v119 = *v121 + 128;
  if ((*(unsigned char *)v121 + 0x80) != 128)
  {
    if (a8)
    {
      v129 = NSString;
      espresso_plan_get_error_info();
      std::string::basic_string[abi:ne180100]<0>(v169, v130);
      if ((v169[0].width & 0x8000000000000000) == 0) {
        unint64_t v131 = v169;
      }
      else {
        unint64_t v131 = (vImage_Buffer *)v169[0].data;
      }
      double v125 = objc_msgSend(v129, "stringWithFormat:", @"Could not get confidence output. Error = %s", v131);
      if (SHIBYTE(v169[0].width) < 0) {
        operator delete(v169[0].data);
      }
LABEL_203:
      long long v132 = VNErrorForCVMLStatus((id)(v119 | 0x2300));
      *a8 = [p_cache + 458 errorForInternalErrorWithLocalizedDescription:v125 underlyingError:v132];

      goto LABEL_204;
    }
    goto LABEL_204;
  }
LABEL_192:
  unint64_t v126 = [NSNumber numberWithFloat:DescriptorBuffer];
  [v145 setValue:v126 forKey:@"VNFaceAnalyzerMultiDetectorProcessingOptionFaceprintConfidence"];

  long long v156 = dest.data;
  height = (std::__shared_weak_count *)dest.height;
  if (dest.height) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(dest.height + 8), 1uLL, memory_order_relaxed);
  }
  BOOL v127 = [(VNFaceAnalyzerMultiDetectorBase *)v152 _saveFaceprint:&v156 toFaceObservation:v151 options:v145 error:a8];
  if (height) {
    std::__shared_weak_count::__release_shared[abi:nn180100](height);
  }
  int v128 = !v127;
LABEL_205:
  if (dest.height) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)dest.height);
  }
  if (v128) {
    goto LABEL_168;
  }
LABEL_208:
  if (!v159) {
    goto LABEL_213;
  }
  uint64_t v133 = (uint64_t)v152->_mMultiHeadedFaceClassifier.__ptr_;
  if (!*(unsigned char *)(v133 + 66))
  {
    if (a8)
    {
      id v118 = [p_cache + 458 errorForInternalErrorWithLocalizedDescription:@"Error classifying attributes"];
      goto LABEL_216;
    }
    goto LABEL_168;
  }
  *(_OWORD *)&v169[0].height = 0uLL;
  v169[0].data = &v169[0].height;
  FaceAttributesOutput = (void *)vision::mod::FaceprintAndAttributes::getFaceAttributesOutput(v133, (uint64_t **)v169);
  if (FaceAttributesOutput != 128)
  {
    if (a8)
    {
      double v135 = NSString;
      espresso_plan_get_error_info();
      std::string::basic_string[abi:ne180100]<0>(&dest, v136);
      if ((dest.width & 0x8000000000000000) == 0) {
        long long v137 = &dest;
      }
      else {
        long long v137 = dest.data;
      }
      double v138 = objc_msgSend(v135, "stringWithFormat:", @"Could not get attributes output. Error = %s", v137);
      if (SHIBYTE(dest.width) < 0) {
        operator delete(dest.data);
      }
      long long v139 = p_cache + 458;
      unint64_t v140 = VNErrorForCVMLStatus(FaceAttributesOutput);
      *a8 = [v139 errorForInternalErrorWithLocalizedDescription:v138 underlyingError:v140];
    }
    goto LABEL_224;
  }
  if (![(VNFaceAnalyzerMultiDetectorBase *)v152 _saveFaceAttributes:v169 toFaceObservation:v150 options:v145 error:a8])
  {
LABEL_224:
    std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::destroy((char *)v169[0].height);
    goto LABEL_168;
  }
  std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::destroy((char *)v169[0].height);
LABEL_213:
  id v18 = v153;
LABEL_169:

  double v16 = v151;
LABEL_170:

LABEL_171:
LABEL_172:

  return v18;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12 = a4;
  double v13 = [(VNDetector *)self validatedImageBufferFromOptions:v12 error:a8];
  if (v13)
  {
    id v14 = +[VNValidationUtilities requiredFaceObservationInOptions:v12 error:a8];
    if (v14
      && ([v13 orientation], (VNSetFaceOrientationInOptionsDictionary(v14, v12, a8) & 1) != 0)
      && ([v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"], -[VNFaceAnalyzerMultiDetectorBase calculateCropRectForInputFace:imageBuffer:options:error:](self, "calculateCropRectForInputFace:imageBuffer:options:error:", v14, v13, v12, a8), double x = v22.origin.x, y = v22.origin.y, width = v22.size.width, height = v22.size.height, !CGRectIsNull(v22)))
    {
      double v21 = (__CVBuffer *)objc_msgSend(v13, "croppedBufferWithWidth:height:format:cropRect:options:error:", -[VNEspressoModelFileBasedDetector networkRequiredInputImageWidth](self, "networkRequiredInputImageWidth"), -[VNEspressoModelFileBasedDetector networkRequiredInputImageHeight](self, "networkRequiredInputImageHeight"), objc_msgSend((id)objc_opt_class(), "networkRequiredInputImagePixelFormatForConfigurationOptions:", v12), v12, a8, x, y, width, height);
      *a7 = v21;
      BOOL v19 = v21 != 0;
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v15 = *(void *)&a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  BOOL v33 = 0;
  if (!+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v33, @"VNFaceAnalyzerMultiDetectorProcessingOptionCreateFaceprint", v17, 0, a7)|| (BOOL v32 = 0, !+[VNValidationUtilities getBOOLValue:&v32 forKey:@"VNFaceAnalyzerMultiDetectorProcessingOptionCreateFaceAnalyzer" inOptions:v17 withDefaultValue:0 error:a7]))
  {
    id v24 = 0;
    goto LABEL_24;
  }
  +[VNError VNAssert:v33 || v32 log:@"Unexpected options parameter passed to face analyzer multi-detector"];
  uint64_t v20 = +[VNValidationUtilities requiredFaceObservationInOptions:v17 error:a7];
  double v21 = v20;
  if (v20)
  {
    CGRect v22 = [v20 faceprint];
    if (v22)
    {
      int v23 = [v21 faceAttributes];
      if (v23)
      {

        goto LABEL_10;
      }
      int v29 = v33 || v32;

      if (v29) {
        goto LABEL_20;
      }
    }
    else if (v33 || v32)
    {
LABEL_20:
      v31.receiver = self;
      v31.super_class = (Class)VNFaceAnalyzerMultiDetectorBase;
      -[VNDetector internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](&v31, sel_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler_, v15, v17, v18, a7, v19, x, y, width, height);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
LABEL_10:
    id v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    if (v33)
    {
      uint64_t v26 = VNCloneFaceObservationFromOptions((uint64_t)v17, a7);
      if (!v26)
      {
        id v24 = 0;
        goto LABEL_22;
      }
      [v25 addObject:v26];
      uint64_t v27 = [v26 faceprint];
      BOOL v33 = v27 == 0;
    }
    else
    {
      uint64_t v26 = 0;
    }
    if (v32)
    {
      VNCloneFaceObservationFromOptions((uint64_t)v17, a7);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
LABEL_18:

LABEL_22:
        goto LABEL_23;
      }
      [v25 addObject:v24];
      uint64_t v28 = [v24 faceAttributes];
      BOOL v32 = v28 == 0;
    }
    id v24 = v25;
    goto LABEL_18;
  }
  id v24 = 0;
LABEL_23:

LABEL_24:

  return v24;
}

@end