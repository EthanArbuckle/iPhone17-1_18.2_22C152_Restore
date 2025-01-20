@interface VNFaceBBoxAligner
+ (id)configurationOptionKeysForDetectorKey;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id).cxx_construct;
- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (void)dealloc;
@end

@implementation VNFaceBBoxAligner

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__VNFaceBBoxAligner_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNFaceBBoxAligner configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNFaceBBoxAligner configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNFaceBBoxAligner configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __58__VNFaceBBoxAligner_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceBBoxAligner;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"VNDetectorInitOption_ModelBackingStore"];
  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNFaceBBoxAligner configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNFaceBBoxAligner configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allCPUComputeDevices];
  v8[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFaceBoxAlignerModelFileHandle, 0);
  cntrl = self->mFaceBoxPoseAlignerImpl.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v184 = *MEMORY[0x1E4F143B8];
  __p = 0;
  uint64_t v169 = 0;
  uint64_t v170 = 0;
  id v143 = a5;
  BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
  v14 = [v143 objectForKeyedSubscript:@"VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinates_X"];
  [v14 doubleValue];
  v15 = [v143 objectForKeyedSubscript:@"VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinates_Y"];
  [v15 doubleValue];
  v16 = [v143 objectForKeyedSubscript:@"VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinates_Width"];
  [v16 doubleValue];
  double v18 = v17;
  v19 = [v143 objectForKeyedSubscript:@"VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinates_Height"];
  [v19 doubleValue];
  double v21 = v20;

  v22 = [v143 objectForKeyedSubscript:@"VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinatesMagnified_X"];
  [v22 doubleValue];
  double v24 = v23;
  v25 = [v143 objectForKeyedSubscript:@"VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinatesMagnified_Y"];
  [v25 doubleValue];
  double v27 = v26;
  v28 = [v143 objectForKeyedSubscript:@"VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinatesMagnified_Width"];
  [v28 doubleValue];
  double v30 = v29;
  v31 = [v143 objectForKeyedSubscript:@"VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinatesMagnified_Height"];
  [v31 doubleValue];
  double v33 = v32;
  double v141 = v27;
  double v142 = v24;

  *(float *)&long long v38 = (v30 - v18) * 0.5;
  *(float *)&long long v39 = (v33 - v21) * 0.5;
  *(float *)&uint64_t v34 = v18;
  float v35 = v21;
  *((float *)&v34 + 1) = v35;
  ptr = (unsigned __int8 *)self->mFaceBoxPoseAlignerImpl.__ptr_;
  float v37 = (float)Height;
  LODWORD(v174) = v38;
  *((float *)&v174 + 1) = (float)((float)Height - v35) - *(float *)&v39;
  *((void *)&v174 + 1) = v34;
  long long v175 = 0uLL;
  *((void *)&v38 + 1) = v34;
  DWORD1(v39) = 0;
  long long v172 = v174;
  long long v173 = 0uLL;
  uint64_t v40 = *(void *)ptr;
  float v41 = *(float *)&v38;
  if (*(void *)ptr)
  {
    uint64_t v42 = 0;
    uint64_t v43 = *((void *)ptr + 8);
    uint64_t v44 = *((void *)ptr + 1);
    float v45 = (float)Width + -1.0;
    float v46 = v37 + -1.0;
    float v47 = *(float *)&v173;
    float v48 = *((float *)&v172 + 3);
    float v49 = *((float *)&v172 + 2);
    float v50 = *((float *)&v172 + 1);
    *(void *)&long long v38 = *(void *)((char *)&v173 + 4);
    long long v154 = v38;
    float v153 = *((float *)&v173 + 3);
    uint64_t v51 = v44;
    uint64_t v146 = *(void *)ptr;
    uint64_t v147 = v44;
    do
    {
      uint64_t v52 = 0;
      uint64_t v177 = 0;
      float32x2_t v178 = 0;
      uint64_t v176 = 0;
      float v179 = 0.0;
      do
      {
        *(float *)((char *)&v176 + v52) = *(float *)(v43 + v52) + *(float *)((char *)&v176 + v52);
        v52 += 4;
      }
      while (v52 != 28);
      uint64_t v158 = v51;
      float v163 = v48;
      uint64_t v53 = v44 * v42;
      uint64_t v152 = v42 + 1;
      float v156 = v47;
      if (v44 * v42 >= (unint64_t)(v44 * (v42 + 1)))
      {
        __float2 v89 = __sincosf_stret(v47);
        float cosval = v89.__cosval;
        float sinval = v89.__sinval;
        float v88 = v156;
        float v58 = -v89.__sinval;
        float v59 = v163;
      }
      else
      {
        uint64_t v160 = *((void *)ptr + 11);
        int v54 = *((_DWORD *)ptr + 4);
        __float2 v57 = __sincosf_stret(v47);
        float cosval = v57.__cosval;
        float sinval = v57.__sinval;
        float v58 = -v57.__sinval;
        float v59 = v163;
        do
        {
          if (v54 > 0)
          {
            int v60 = 0;
            uint64_t v61 = *(void *)(v160 + 24 * v53);
            while (1)
            {
              int v62 = v60;
              if (*(unsigned char *)(v61 + 48 * v60 + 44)) {
                break;
              }
              v63 = (float *)(*((void *)ptr + 5) + 16 * *(void *)(v61 + 48 * v60 + 8));
              float v64 = *v63 + -0.5;
              float v65 = v63[1] + -0.5;
              float v66 = v41
                  + (float)((float)((float)((float)((float)(v65 * v58) + (float)(v57.__cosval * v64)) + 0.0) + 0.5) * v49);
              int v67 = ptr[33];
              if (v66 < 0.0)
              {
                unsigned __int8 v71 = ptr[33];
              }
              else
              {
                float v68 = v50
                    + (float)((float)((float)((float)((float)(v65 * v57.__cosval) + (float)(v57.__sinval * v64)) + 0.0)
                                    + 0.5)
                            * v163);
                BOOL v70 = v68 < 0.0 || v45 < v66 || v46 < v68;
                unsigned __int8 v71 = ptr[33];
                if (!v70)
                {
                  int v72 = BaseAddress[BytesPerRow * vcvtas_u32_f32(v68) + vcvtas_u32_f32(v66)];
                  unsigned __int8 v71 = v72 - (v72 == v67);
                }
              }
              float v73 = v63[2] + -0.5;
              float v74 = v63[3] + -0.5;
              float v75 = v41
                  + (float)((float)((float)((float)((float)(v74 * v58) + (float)(v57.__cosval * v73)) + 0.0) + 0.5) * v49);
              if (v75 < 0.0) {
                goto LABEL_40;
              }
              float v76 = v50
                  + (float)((float)((float)((float)((float)(v74 * v57.__cosval) + (float)(v57.__sinval * v73)) + 0.0)
                                  + 0.5)
                          * v163);
              BOOL v77 = v76 < 0.0 || v45 < v75;
              if (v77 || v46 < v76) {
                goto LABEL_40;
              }
              int v79 = BaseAddress[BytesPerRow * vcvtas_u32_f32(v76) + vcvtas_u32_f32(v75)];
              if (v67 == v71) {
                goto LABEL_40;
              }
              unsigned __int8 v80 = v79 - (v79 == v67);
              if (v67 == v80) {
                goto LABEL_40;
              }
              int v81 = v71 - v80;
              if (v81 >= 127) {
                int v81 = 127;
              }
              if (v81 <= -127) {
                LOBYTE(v81) = -127;
              }
              if (ptr[32] == v81)
              {
LABEL_40:
                v180 = 0;
                uint64_t v181 = 0;
                int v183 = 0;
                uint64_t v182 = 0;
                goto LABEL_43;
              }
              float v82 = *(float *)(v61 + 48 * v62);
              int v83 = (2 * v62) | 1;
              int v84 = 2 * v62 + 2;
              if (v82 >= (float)(char)v81) {
                int v60 = v83;
              }
              else {
                int v60 = v84;
              }
              if (v60 >= v54) {
                goto LABEL_43;
              }
            }
            uint64_t v85 = 0;
            uint64_t v86 = v61 + 48 * v62 + 16;
            do
            {
              *(_DWORD *)((char *)&v180 + v85) = *(_DWORD *)(v86 + v85);
              v85 += 4;
            }
            while (v85 != 28);
          }
LABEL_43:
          for (uint64_t i = 0; i != 28; i += 4)
            *(float *)((char *)&v176 + i) = *(float *)((char *)&v180 + i) + *(float *)((char *)&v176 + i);
          ++v53;
        }
        while (v53 != v158);
        float v88 = v156;
        uint64_t v40 = v146;
      }
      float v90 = (float)((float)(*((float *)&v176 + 1) * cosval) + (float)(sinval * *(float *)&v176)) + 0.0;
      *(float *)&uint64_t v176 = (float)((float)(*((float *)&v176 + 1) * v58) + (float)(cosval * *(float *)&v176)) + 0.0;
      *((float *)&v176 + 1) = v90;
      float v151 = (float)((float)(cosval * *((float *)&v177 + 1)) + (float)(sinval * *(float *)&v177)) + 0.0;
      *(float *)&uint64_t v177 = (float)((float)(*((float *)&v177 + 1) * v58) + (float)(cosval * *(float *)&v177)) + 0.0;
      *((float *)&v177 + 1) = v151;
      float v149 = *(float *)&v177;
      float v150 = (float)(v41 + (float)(v49 * 0.5)) + (float)(*(float *)&v176 * v49);
      float v148 = v59 * 0.5;
      float v161 = (float)(v50 + (float)(v59 * 0.5)) + (float)(v90 * v59);
      __float2 v91 = __sincosf_stret(v88 + -1.5708);
      float v92 = (float)((float)(v41 + (float)((float)(v49 * 0.5) * (float)(v91.__cosval + 1.0))) + (float)(v149 * v49))
          - v150;
      float v93 = (float)((float)(v50 + (float)(v148 * (float)(v91.__sinval + 1.0))) + (float)(v151 * v163)) - v161;
      float v47 = atan2f(v93, v92) + 1.5708;
      float v94 = sqrtf((float)(v93 * v93) + (float)(v92 * v92));
      float v41 = v150 - v94;
      float v50 = v161 - v94;
      float v48 = v94 + v94;
      *((void *)&v39 + 1) = *((void *)&v154 + 1);
      *(float32x2_t *)&long long v39 = vmla_f32(*(float32x2_t *)&v154, (float32x2_t)0x4100000041200000, v178);
      long long v154 = v39;
      float v153 = v153 + (float)(v179 * 8.0);
      uint64_t v44 = v147;
      uint64_t v51 = v158 + v147;
      v43 += 28;
      float v49 = v94 + v94;
      uint64_t v42 = v152;
    }
    while (v152 != v40);
    float v157 = v47;
    *((float *)&v172 + 3) = v94 + v94;
    float v95 = v94 + v94;
    float v96 = v94 + v94;
  }
  else
  {
    float v96 = *((float *)&v172 + 2);
    float v50 = *((float *)&v172 + 1);
    float v95 = *((float *)&v172 + 3);
    LODWORD(v39) = DWORD1(v173);
    float v157 = *(float *)&v173;
    float v153 = *((float *)&v173 + 3);
  }
  v180 = 0;
  uint64_t v181 = 0;
  uint64_t v182 = 0;
  double v155 = *(double *)&v39;
  float v97 = *(float *)&v39 + 3.0;
  if ((float)(*(float *)&v39 + 3.0) > 6.0) {
    float v97 = 6.0;
  }
  if (v97 >= 0.0) {
    float v98 = v97;
  }
  else {
    float v98 = 0.0;
  }
  float v99 = floorf(v98);
  if (v99 > 5.0) {
    float v99 = 5.0;
  }
  float v164 = v99;
  std::vector<_Geometry2D_point2D_>::resize(&v180);
  float v100 = v96 * 0.5;
  float v101 = v41 + (float)(v96 * 0.5);
  float v102 = v95;
  float v103 = v95 * 0.5;
  float v162 = (float)((float)(v96 * 0.5) - (float)(v50 + v103)) + (float)(v37 - v102);
  int v104 = (int)v164 + 1;
  float v159 = v101 - (float)(v96 * 0.5);
  float v105 = (float)v104 - v98;
  float v106 = v98 - (float)(int)v164;
  float v107 = v100 - v100;
  __float2 v108 = __sincosf_stret(v157);
  uint64_t v109 = 0;
  v110 = v180;
  float v111 = *((float *)&v172 + 3);
  v112 = (double *)((char *)&vision::mod::landmarksInPoses + 1008 * v104 + 8);
  v113 = (double *)((char *)&vision::mod::landmarksInPoses + 1008 * (int)v164 + 8);
  do
  {
    float v114 = *(v113 - 1);
    float v115 = *(v112 - 1);
    float v116 = *v113;
    float v117 = (float)(v106 * v115) + (float)(v114 * v105);
    double v118 = *v112;
    v112 += 2;
    float v119 = v118;
    float v120 = (float)(v107 + (float)(v117 * v96)) - v100;
    float v121 = (float)(v107 + (float)((float)((float)(v106 * v119) + (float)(v116 * v105)) * v111)) - v103;
    v122 = (float *)&v110[v109];
    float *v122 = v100 + (float)((float)((float)(v121 * (float)-v108.__sinval) + (float)(v108.__cosval * v120)) + 0.0);
    v122[1] = v102
            - (float)(v103 + (float)((float)((float)(v108.__cosval * v121) + (float)(v108.__sinval * v120)) + 0.0));
    v109 += 8;
    v113 += 2;
  }
  while (v109 != 504);
  uint64_t v166 = 0;
  uint64_t v167 = 0;
  v165 = 0;
  std::vector<_Geometry2D_point2D_>::__init_with_size[abi:ne180100]<_Geometry2D_point2D_*,_Geometry2D_point2D_*>(&v165, v110, v181, (v181 - (uint64_t)v110) >> 3);
  operator delete(v110);
  v123 = v165;
  std::vector<long long>::__assign_with_size[abi:ne180100]<long long *,long long *>((char *)&__p, v165, v166, (v166 - (uint64_t)v165) >> 3);
  v124 = VNCloneFaceObservationFromOptions((uint64_t)v143, a8);
  if (v124)
  {
    id v125 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v126 = (void *)[v125 initWithBytes:__p length:v169 - (void)__p];
    [v124 setAlignedMeanShape:v126];

    v127 = [(VNDetector *)self validatedImageBufferFromOptions:v143 error:a8];
    v128 = v127;
    if (v127)
    {
      unint64_t v129 = [v127 width];
      unint64_t v130 = [v128 height];
      HIDWORD(v132) = HIDWORD(v141);
      HIDWORD(v131) = HIDWORD(v142);
      float v133 = v142;
      *(float *)&double v131 = (float)(v159 + v133) / (float)v129;
      float v134 = v141;
      *(float *)&double v132 = (float)(v162 + v134) / (float)v130;
      *(float *)&double v135 = v96 / (float)v129;
      *(float *)&double v136 = v102 / (float)v130;
      objc_msgSend(v124, "setAlignedBoundingBox:", v131, v132, v136, v135);
      *(float *)&double v137 = v157;
      [v124 setAlignedRotationAngle:v137];
      [v124 setBoundingBoxAligned:1];
      [v124 setFaceOrientationIndex:v155];
      *(float *)&double v138 = v153;
      [v124 setFaceJunkinessIndex:v138];
      v171 = v124;
      v139 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v171 count:1];
    }
    else
    {
      v139 = 0;
    }
  }
  else
  {
    v139 = 0;
  }

  if (v123) {
    operator delete(v123);
  }
  if (__p) {
    operator delete(__p);
  }

  return v139;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12 = a4;
  v13 = [(VNDetector *)self validatedImageBufferFromOptions:v12 error:a8];
  if (v13)
  {
    v14 = +[VNValidationUtilities requiredFaceObservationInOptions:v12 error:a8];
    v15 = v14;
    if (!v14) {
      goto LABEL_6;
    }
    [v14 boundingBox];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    unint64_t v24 = [v13 width];
    unint64_t v25 = [v13 height];
    double v26 = v17 * (double)v24;
    double v27 = v21 * (double)v24;
    double v28 = v19 * (double)v25;
    double v29 = v23 * (double)v25;
    v47.origin.double x = v26;
    v47.origin.double y = v28;
    v47.size.double width = v27;
    v47.size.double height = v29;
    CGRect v48 = CGRectInset(v47, v27 * -0.5, v29 * -0.5);
    double x = v48.origin.x;
    double y = v48.origin.y;
    double width = v48.size.width;
    double height = v48.size.height;
    unsigned int v46 = -1;
    if (([v15 getFaceEXIFOrientation:&v46 error:a8] & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v34 = [NSNumber numberWithInt:v46];
    [v12 setObject:v34 forKeyedSubscript:@"VNImageBufferOption_FeatureOrientationRelativeToUpRight"];

    float v35 = (__CVBuffer *)objc_msgSend(v13, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)width, (unint64_t)height, 1278226488, v12, a8, x, y, width, height);
    *a7 = v35;
    if (v35)
    {
      v36 = [NSNumber numberWithDouble:v26];
      [v12 setObject:v36 forKeyedSubscript:@"VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinates_X"];

      float v37 = [NSNumber numberWithDouble:v28];
      [v12 setObject:v37 forKeyedSubscript:@"VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinates_Y"];

      long long v38 = [NSNumber numberWithDouble:v27];
      [v12 setObject:v38 forKeyedSubscript:@"VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinates_Width"];

      long long v39 = [NSNumber numberWithDouble:v29];
      [v12 setObject:v39 forKeyedSubscript:@"VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinates_Height"];

      uint64_t v40 = [NSNumber numberWithDouble:x];
      [v12 setObject:v40 forKeyedSubscript:@"VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinatesMagnified_X"];

      float v41 = [NSNumber numberWithDouble:y];
      [v12 setObject:v41 forKeyedSubscript:@"VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinatesMagnified_Y"];

      uint64_t v42 = [NSNumber numberWithDouble:width];
      [v12 setObject:v42 forKeyedSubscript:@"VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinatesMagnified_Width"];

      uint64_t v43 = [NSNumber numberWithDouble:height];
      [v12 setObject:v43 forKeyedSubscript:@"VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinatesMagnified_Height"];

      BOOL v44 = 1;
    }
    else
    {
LABEL_6:
      BOOL v44 = 0;
    }
  }
  else
  {
    BOOL v44 = 0;
  }

  return v44;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v15 = *(void *)&a3;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  double v20 = +[VNValidationUtilities requiredFaceObservationInOptions:v17 error:a7];
  double v21 = v20;
  if (v20)
  {
    if ([v20 isBoundingBoxAligned])
    {
      uint64_t v22 = VNCloneFaceObservationFromOptions((uint64_t)v17, a7);
      double v23 = (void *)v22;
      if (v22)
      {
        v27[0] = v22;
        unint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      }
      else
      {
        unint64_t v24 = 0;
      }
    }
    else
    {
      v26.receiver = self;
      v26.super_class = (Class)VNFaceBBoxAligner;
      unint64_t v24 = -[VNDetector internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](&v26, sel_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler_, v15, v17, v18, a7, v19, x, y, width, height);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }

  return v24;
}

- (void)dealloc
{
  if (self->_modelFilesWereMemmapped)
  {
    uint64_t v3 = VNBinModelFilePathFromModelNameAndThrow(@"faceBoxPoseAligner-current");
    v4 = +[VNModelFilesCache sharedInstance];
    [v4 unload:v3];
  }
  v5.receiver = self;
  v5.super_class = (Class)VNFaceBBoxAligner;
  [(VNDetector *)&v5 dealloc];
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v13.receiver = self;
  v13.super_class = (Class)VNFaceBBoxAligner;
  if (!-[VNDetector completeInitializationForSession:error:](&v13, sel_completeInitializationForSession_error_, a3)) {
    return 0;
  }
  self->_modelFilesWereMemmapped = [(VNDetector *)self backingStore] < 2;
  v6 = VNBinModelFilePathFromModelNameAndThrow(@"faceBoxPoseAligner-current");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__VNFaceBBoxAligner_completeInitializationForSession_error___block_invoke;
  v11[3] = &unk_1E5B1FCB8;
  v11[4] = self;
  id v12 = v6;
  id v7 = v6;
  v8 = _Block_copy(v11);
  char v9 = VNExecuteBlock(v8, (uint64_t)a4);

  return v9;
}

uint64_t __60__VNFaceBBoxAligner_completeInitializationForSession_error___block_invoke(uint64_t a1, void *a2)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 72))
  {
    v14 = (char *)[*(id *)(a1 + 40) UTF8String];
    uint64_t v15 = (char *)operator new(0xA0uLL);
    *(_OWORD *)(v15 + 8) = 0u;
    *(void *)uint64_t v15 = &unk_1EF7535E8;
    *((_OWORD *)v15 + 4) = 0u;
    *((_OWORD *)v15 + 7) = 0u;
    *((_OWORD *)v15 + 9) = 0u;
    *((_OWORD *)v15 + 5) = 0u;
    *((_OWORD *)v15 + 6) = 0u;
    *((void *)v15 + 16) = 0;
    *((void *)v15 + 17) = v15 + 144;
    long long v23 = 0u;
    long long v24 = 0u;
    int v25 = 1065353216;
    vision::mod::readBinSerializedModelValues(v14, vision::mod::FaceBoxPoseAligner<signed char>::modelFileInfo(void)::fileInfo, &v23);
    vision::mod::FaceBoxPoseAligner<signed char>::loadERTModel((uint64_t *)v15 + 3, &v23);
    vision::mod::FaceBoxPoseAligner<signed char>::loadGlobalShifts(&v23, (char **)v15 + 11);
    vision::mod::FaceBoxPoseAligner<signed char>::loadXYPairs((uint64_t)(v15 + 24), &v23, (char **)v15 + 8);
    vision::mod::FaceBoxPoseAligner<signed char>::loadDefaultPixelValue(&v23, v15 + 57);
    vision::mod::FaceBoxPoseAligner<signed char>::loadDefaultFeatureValue(&v23, v15 + 56);
    std::__hash_table<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>>>::~__hash_table((uint64_t)&v23);
    *(void *)&long long v16 = v15 + 24;
    *((void *)&v16 + 1) = v15;
    id v17 = *(std::__shared_weak_count **)(*(void *)(a1 + 32) + 64);
    *(_OWORD *)(*(void *)(a1 + 32) + 56) = v16;
    if (v17) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v17);
    }
LABEL_8:
    if (*(void *)(*(void *)(a1 + 32) + 56)) {
      return 1;
    }
    if (a2)
    {
      id v19 = +[VNError errorWithCode:9 message:@"Failed to allocate memory for face bounding box aligner model data"];
LABEL_14:
      id v20 = v19;
      uint64_t result = 0;
      *a2 = v20;
      return result;
    }
    return 0;
  }
  v4 = +[VNModelFilesCache sharedInstance];
  uint64_t v5 = [v4 load:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v5;

  v8 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v8)
  {
    char v9 = (unsigned __int16 *)[v8 baseAddress];
    uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 80) length];
    long long v23 = 0u;
    long long v24 = 0u;
    int v25 = 1065353216;
    cvml::util::binserialized_table_of_contents::init((cvml::util::binserialized_table_of_contents *)&v23, v9, v10);
    memset(v21, 0, sizeof(v21));
    int v22 = 1065353216;
    cvml::util::binserialized_contents::init_model_values((uint64_t)v21, (uint64_t)&v23, 0, vision::mod::FaceBoxPoseAligner<signed char>::modelFileInfo(void)::fileInfo);
    v11 = (char *)operator new(0xA0uLL);
    *(_OWORD *)(v11 + 8) = 0u;
    *(void *)v11 = &unk_1EF7535E8;
    *((_OWORD *)v11 + 4) = 0u;
    *((_OWORD *)v11 + 7) = 0u;
    *((_OWORD *)v11 + 9) = 0u;
    *((_OWORD *)v11 + 5) = 0u;
    *((_OWORD *)v11 + 6) = 0u;
    *((void *)v11 + 16) = 0;
    *((void *)v11 + 17) = v11 + 144;
    vision::mod::FaceBoxPoseAligner<signed char>::loadERTModel((uint64_t *)v11 + 3, v21);
    vision::mod::FaceBoxPoseAligner<signed char>::loadGlobalShifts(v21, (char **)v11 + 11);
    vision::mod::FaceBoxPoseAligner<signed char>::loadXYPairs((uint64_t)(v11 + 24), v21, (char **)v11 + 8);
    vision::mod::FaceBoxPoseAligner<signed char>::loadDefaultPixelValue(v21, v11 + 57);
    vision::mod::FaceBoxPoseAligner<signed char>::loadDefaultFeatureValue(v21, v11 + 56);
    *(void *)&long long v12 = v11 + 24;
    *((void *)&v12 + 1) = v11;
    objc_super v13 = *(std::__shared_weak_count **)(*(void *)(a1 + 32) + 64);
    *(_OWORD *)(*(void *)(a1 + 32) + 56) = v12;
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v13);
    }
    std::__hash_table<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>>>::~__hash_table((uint64_t)v21);
    std::__hash_table<std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>>>::~__hash_table((uint64_t)&v23);
    goto LABEL_8;
  }
  if (a2)
  {
    id v19 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Could not map face box aligner model"];
    goto LABEL_14;
  }
  return 0;
}

@end