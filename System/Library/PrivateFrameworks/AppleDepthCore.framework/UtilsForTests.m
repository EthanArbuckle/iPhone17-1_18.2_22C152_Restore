@interface UtilsForTests
+ (BaselineTestStats_s)compareBuffer:(__CVBuffer *)a3 offset:(CGSize)a4 toRefBuffer:(__CVBuffer *)a5 ignoreRefZeros:(BOOL)a6;
+ (BaselineTestStats_s)compareBuffer:(__CVBuffer *)a3 offset:(CGSize)a4 toRefBuffer:(__CVBuffer *)a5 ignoreResultZeros:(BOOL)a6 ignoreRefZeros:(BOOL)a7 outlierPercentile:(float)a8;
+ (BaselineTestStats_s)compareBuffer:(__CVBuffer *)a3 toRefBuffer:(__CVBuffer *)a4 ignoreRefZeros:(BOOL)a5;
+ (BaselineTestStats_s)compareBuffer:(__CVBuffer *)a3 toRefBuffer:(__CVBuffer *)a4 ignoreRefZeros:(BOOL)a5 outlierPercentile:(float)a6;
+ (BaselineTestStats_s)compareBuffer:(__CVBuffer *)a3 toRefBuffer:(__CVBuffer *)a4 ignoreResultZeros:(BOOL)a5 ignoreRefZeros:(BOOL)a6;
+ (BaselineTestStats_s)compareResults:(__CVBuffer *)a3 toBaseLineInPath:(id)a4 ignoreRefZeros:(BOOL)a5;
+ (BaselineTestStats_s)compareResults:(__CVBuffer *)a3 toBaseLineInPath:(id)a4 ignoreRefZeros:(BOOL)a5 outlierPercentile:(float)a6;
+ (BaselineTestStats_s)compareVImageBuffer:(vImage_Buffer *)a3 pixelTypeResult:(unsigned int)a4 offset:(CGSize)a5 toRefBuffer:(vImage_Buffer *)a6 pixelTypeRef:(unsigned int)a7 ignoreResultZeros:(BOOL)a8 ignoreRefZeros:(BOOL)a9 outlierPercentile:(float)a10;
+ (id)createJasperCameraCalibration;
+ (id)createSuperWideCameraCalibration;
+ (id)createSyntheticCameraCalibrationNilDistortion;
+ (id)createSyntheticCameraCalibrationWithDistortion:(id)a3;
+ (id)createSyntheticCameraCalibrationXThetaDistortion;
+ (id)createWideCameraCalibrationWithPolynomials;
+ (id)getJasperPointCloudFromPath:(id)a3;
+ (id)getNewTempFilePathWithExtension:(id)a3;
+ (id)pointsArrayFromFilePath:(id)a3;
+ (unint64_t)preferredEspressoEngine;
+ (vector<float,)pointsVectorFromFilePath:(id)a2;
@end

@implementation UtilsForTests

+ (id)getNewTempFilePathWithExtension:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F08850] defaultManager];
  v5 = 0;
  do
  {
    v6 = NSTemporaryDirectory();
    v7 = [MEMORY[0x263F08C38] UUID];
    v8 = [v7 UUIDString];
    v9 = [v6 stringByAppendingPathComponent:v8];
    v10 = [v9 stringByAppendingPathExtension:v3];

    v5 = v10;
  }
  while (([v4 fileExistsAtPath:v10] & 1) != 0);

  return v10;
}

+ (id)createSyntheticCameraCalibrationXThetaDistortion
{
  v2 = -[ADXThetaDistortionModel initWithDistortionCenter:XThetaType:]([ADXThetaDistortionModel alloc], "initWithDistortionCenter:XThetaType:", 0, 240.0, 320.0);
  id v3 = +[UtilsForTests createSyntheticCameraCalibrationWithDistortion:v2];

  return v3;
}

+ (id)createSyntheticCameraCalibrationNilDistortion
{
  return +[UtilsForTests createSyntheticCameraCalibrationWithDistortion:0];
}

+ (id)createSyntheticCameraCalibrationWithDistortion:(id)a3
{
  id v3 = a3;
  v4 = [ADMutableCameraCalibration alloc];
  LODWORD(v5) = 1008981770;
  v6 = -[ADCameraCalibration initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:](v4, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", v3, *(double *)&_PromotedConst, unk_247F26470, 5.76460897e17, *(double *)&_PromotedConst_1793, unk_247F264A0, 0.0, unk_247F264C0, v5, 0x407E000000000000, 0x4084000000000000);

  return v6;
}

+ (id)createWideCameraCalibrationWithPolynomials
{
  long long v7 = xmmword_247F25740;
  long long v8 = unk_247F25750;
  long long v9 = xmmword_247F25760;
  long long v10 = unk_247F25770;
  v2 = -[ADPolynomialsLensDistortionModel initWithDistortionCenter:andPolynomials:]([ADPolynomialsLensDistortionModel alloc], "initWithDistortionCenter:andPolynomials:", &v7, 1272.26655, 957.504985);
  id v3 = [ADMutableCameraCalibration alloc];
  LODWORD(v4) = 985834580;
  double v5 = -[ADCameraCalibration initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:](v3, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", v2, *(double *)&_PromotedConst_1794, unk_247F264E0, 4.63031801e21, *(double *)&_PromotedConst_1795, unk_247F26510, 1.88571355e-19, unk_247F26530, v4, 0x40A4000000000000, 0x409E000000000000, v7, v8, v9, v10);

  return v5;
}

+ (id)createSuperWideCameraCalibration
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  memcpy(__dst, &unk_247F24F40, sizeof(__dst));
  memcpy(v10, &unk_247F25340, sizeof(v10));
  v2 = [ADMillimeterRadiusPairsLensDistortionModel alloc];
  id v3 = [MEMORY[0x263EFF8F8] dataWithBytes:__dst length:1024];
  double v4 = [MEMORY[0x263EFF8F8] dataWithBytes:v10 length:1024];
  double v5 = -[ADMillimeterRadiusPairsLensDistortionModel initWithDistortionCenter:distortedRadii:undistortedRadii:](v2, "initWithDistortionCenter:distortedRadii:undistortedRadii:", v3, v4, 2084.05811, 1403.30347);

  v6 = [ADMutableCameraCalibration alloc];
  LODWORD(v7) = 980151802;
  long long v8 = -[ADCameraCalibration initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:](v6, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", v5, *(double *)&_PromotedConst_1796, unk_247F26550, 7.41717015e22, *(double *)&_PromotedConst_1797, unk_247F26580, 4.84969978e-20, unk_247F265A0, v7, 0x40B0400000000000, 0x40A5F00000000000);

  return v8;
}

+ (id)createJasperCameraCalibration
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  memcpy(__dst, &unk_247F24740, sizeof(__dst));
  memcpy(v10, &unk_247F24B40, sizeof(v10));
  v2 = [ADMillimeterRadiusPairsLensDistortionModel alloc];
  id v3 = [MEMORY[0x263EFF8F8] dataWithBytes:__dst length:1024];
  double v4 = [MEMORY[0x263EFF8F8] dataWithBytes:v10 length:1024];
  double v5 = -[ADMillimeterRadiusPairsLensDistortionModel initWithDistortionCenter:distortedRadii:undistortedRadii:](v2, "initWithDistortionCenter:distortedRadii:undistortedRadii:", v3, v4, 65.5749545, 89.8015503);

  v6 = [ADMutableCameraCalibration alloc];
  LODWORD(v7) = 1009067670;
  long long v8 = -[ADCameraCalibration initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:](v6, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", v5, *(double *)&_PromotedConst_1798, unk_247F265C0, 2.20156376e13, *(double *)&_PromotedConst_1793, unk_247F264A0, 0.0, unk_247F264C0, v7, 0x4061800000000000, 0x4066800000000000);

  return v8;
}

+ (id)pointsArrayFromFilePath:(id)a3
{
  id v3 = a3;
  double v4 = [MEMORY[0x263EFF980] array];
  double v5 = objc_opt_class();
  if (v5)
  {
    [v5 pointsVectorFromFilePath:v3];
    double v7 = __p;
    if (v14 != (unsigned char *)__p)
    {
      unint64_t v8 = 0;
      unsigned int v9 = 1;
      do
      {
        LODWORD(v6) = v7[v8];
        long long v10 = [NSNumber numberWithFloat:v6];
        [v4 addObject:v10];

        unint64_t v8 = v9;
        double v7 = __p;
        ++v9;
      }
      while (v8 < (v14 - (unsigned char *)__p) >> 2);
    }
  }
  else
  {
    __p = 0;
  }
  v11 = (void *)[v4 copy];
  if (__p) {
    operator delete(__p);
  }

  return v11;
}

+ (vector<float,)pointsVectorFromFilePath:(id)a2
{
  v42[19] = *MEMORY[0x263EF8340];
  id v5 = a4;
  [v5 UTF8String];
  uint64_t v6 = MEMORY[0x263F8C308] + 64;
  v42[0] = MEMORY[0x263F8C308] + 64;
  double v7 = (void *)MEMORY[0x263F8C2A8];
  uint64_t v8 = *(void *)(MEMORY[0x263F8C2A8] + 16);
  v40[0] = *(void *)(MEMORY[0x263F8C2A8] + 8);
  *(void *)((char *)v40 + *(void *)(v40[0] - 24)) = v8;
  v40[1] = 0;
  unsigned int v9 = (std::ios_base *)((char *)v40 + *(void *)(v40[0] - 24));
  std::ios_base::init(v9, v41);
  uint64_t v10 = MEMORY[0x263F8C308] + 24;
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  v40[0] = v10;
  v42[0] = v6;
  MEMORY[0x24C5705D0](v41);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)v40 + *(void *)(v40[0] - 24)), *(_DWORD *)&v41[*(void *)(v40[0] - 24) + 16] | 4);
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  if (!*(_DWORD *)&v41[*(void *)(v40[0] - 24) + 16])
  {
    std::string::basic_string[abi:ne180100]<0>(__p, ", ");
    v11 = (void *)(v40[0] - 24);
    if ((v41[*(void *)(v40[0] - 24) + 16] & 2) != 0) {
      goto LABEL_58;
    }
    int v12 = 0;
    while (1)
    {
      memset(&v36, 0, sizeof(v36));
      std::ios_base::getloc((const std::ios_base *)((char *)v40 + *v11));
      v13 = std::locale::use_facet(&v39, MEMORY[0x263F8C108]);
      unsigned __int8 v14 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 10);
      std::locale::~locale(&v39);
      MEMORY[0x24C5705F0](&v39, v40, 1);
      if (!LOBYTE(v39.__locale_)) {
        goto LABEL_23;
      }
      if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
      {
        *v36.__r_.__value_.__l.__data_ = 0;
        v36.__r_.__value_.__l.__size_ = 0;
      }
      else
      {
        v36.__r_.__value_.__s.__data_[0] = 0;
        *((unsigned char *)&v36.__r_.__value_.__s + 23) = 0;
      }
      uint64_t v15 = 0;
      while (1)
      {
        v16 = *(void **)&v41[*(void *)(v40[0] - 24) + 24];
        v17 = (unsigned char *)v16[3];
        if (v17 != (unsigned char *)v16[4])
        {
          v16[3] = v17 + 1;
          LOBYTE(v16) = *v17;
          goto LABEL_14;
        }
        LODWORD(v16) = (*(uint64_t (**)(void *))(*v16 + 80))(v16);
        if (v16 == -1) {
          break;
        }
LABEL_14:
        if (v14 == v16)
        {
          int v18 = 0;
          goto LABEL_22;
        }
        std::string::push_back(&v36, (std::string::value_type)v16);
        ++v15;
        if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0 && v36.__r_.__value_.__l.__size_ == 0x7FFFFFFFFFFFFFF7)
        {
          int v18 = 4;
          goto LABEL_22;
        }
      }
      if (v15) {
        int v18 = 2;
      }
      else {
        int v18 = 6;
      }
LABEL_22:
      std::ios_base::clear((std::ios_base *)((char *)v40 + *(void *)(v40[0] - 24)), *(_DWORD *)&v41[*(void *)(v40[0] - 24) + 16] | v18);
LABEL_23:
      if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
      {
        if (!v36.__r_.__value_.__l.__size_) {
          goto LABEL_55;
        }
        int v35 = v12;
        v19 = (std::string *)v36.__r_.__value_.__r.__words[0];
LABEL_28:
        if (v38 >= 0) {
          v20 = __p;
        }
        else {
          v20 = (void **)__p[0];
        }
        v21 = strtok((char *)v19, (const char *)v20);
        if (v21)
        {
          var1 = retstr->var1;
          var0 = retstr->var2.var0;
          v24 = retstr->var0;
          do
          {
            float v25 = atof(v21);
            if (var1 >= var0)
            {
              uint64_t v27 = var1 - v24;
              unint64_t v28 = v27 + 1;
              if ((unint64_t)(v27 + 1) >> 62) {
                std::vector<Element *>::__throw_length_error[abi:ne180100]();
              }
              if (((char *)var0 - (char *)v24) >> 1 > v28) {
                unint64_t v28 = ((char *)var0 - (char *)v24) >> 1;
              }
              if ((unint64_t)((char *)var0 - (char *)v24) >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v29 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v29 = v28;
              }
              if (v29) {
                unint64_t v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v29);
              }
              else {
                uint64_t v30 = 0;
              }
              v31 = (float *)(v29 + 4 * v27);
              float *v31 = v25;
              v26 = v31 + 1;
              while (var1 != v24)
              {
                int v32 = *((_DWORD *)var1-- - 1);
                *((_DWORD *)v31-- - 1) = v32;
              }
              var0 = (float *)(v29 + 4 * v30);
              retstr->var0 = v31;
              retstr->var1 = v26;
              retstr->var2.var0 = var0;
              if (v24) {
                operator delete(v24);
              }
              v24 = v31;
            }
            else
            {
              float *var1 = v25;
              v26 = var1 + 1;
            }
            retstr->var1 = v26;
            if (v38 >= 0) {
              v33 = __p;
            }
            else {
              v33 = (void **)__p[0];
            }
            v21 = strtok(0, (const char *)v33);
            var1 = v26;
          }
          while (v21);
        }
        int v12 = v35 + 1;
        if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
LABEL_55:
        }
          operator delete(v36.__r_.__value_.__l.__data_);
      }
      else if (*((unsigned char *)&v36.__r_.__value_.__s + 23))
      {
        int v35 = v12;
        v19 = &v36;
        goto LABEL_28;
      }
      v11 = (void *)(v40[0] - 24);
      if ((v41[*(void *)(v40[0] - 24) + 16] & 2) != 0 || v12 == -1)
      {
LABEL_58:
        if (!std::filebuf::close()) {
          std::ios_base::clear((std::ios_base *)((char *)v40 + *(void *)(v40[0] - 24)), *(_DWORD *)&v41[*(void *)(v40[0] - 24) + 16] | 4);
        }
        double v7 = (void *)MEMORY[0x263F8C2A8];
        if (v38 < 0) {
          operator delete(__p[0]);
        }
        break;
      }
    }
  }
  v40[0] = *v7;
  *(void *)((char *)v40 + *(void *)(v40[0] - 24)) = v7[3];
  MEMORY[0x24C5705E0](v41);
  std::istream::~istream();
  MEMORY[0x24C5706E0](v42);

  return result;
}

+ (id)getJasperPointCloudFromPath:(id)a3
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v80 = a3;
  if ([v80 hasSuffix:@".txt"])
  {
    id v3 = +[UtilsForTests pointsArrayFromFilePath:v80];
    if ([v3 count])
    {
      id v81 = [MEMORY[0x263EFF9A0] dictionary];
      id v87 = v3;
      uint64_t v4 = [v3 count];
      uint64_t v70 = (uint64_t)&v70;
      uint64_t v5 = MEMORY[0x270FA5388](v4);
      v76 = &v70 - 4 * v6;
      uint64_t v7 = MEMORY[0x270FA5388](v5);
      v75 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v9 = MEMORY[0x270FA5388](v7);
      v73 = (char *)&v70 - v10;
      uint64_t v78 = v11;
      uint64_t v12 = MEMORY[0x270FA5388](v9);
      v74 = (char *)&v70 - v13;
      uint64_t v14 = MEMORY[0x270FA5388](v12);
      v86 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v16 = MEMORY[0x270FA5388](v14);
      v72 = &v70 - 4 * v17;
      uint64_t v77 = v18;
      uint64_t v19 = MEMORY[0x270FA5388](v16);
      v71 = &v70 - 4 * v20;
      uint64_t v21 = MEMORY[0x270FA5388](v19);
      v85 = (char *)&v70 - v22;
      uint64_t v23 = MEMORY[0x270FA5388](v21);
      v84 = (char *)&v70 - v24;
      uint64_t v25 = MEMORY[0x270FA5388](v23);
      v83 = (char *)&v70 - v26;
      uint64_t v79 = v27;
      unint64_t v28 = MEMORY[0x270FA5388](v25);
      v82 = (char *)&v70 - v30;
      if (v28 >= 3)
      {
        uint64_t v31 = 0;
        uint64_t v32 = 0;
        if (v29 <= 1) {
          uint64_t v33 = 1;
        }
        else {
          uint64_t v33 = v29;
        }
        v34 = (double *)(v76 + 2);
        int v35 = v75 + 1;
        std::string v36 = v74 + 1;
        v37 = v73 + 1;
        char v38 = v71 + 2;
        __asm { FMOV            V11.2S, #1.0 }
        v44 = v72 + 2;
        do
        {
          v45 = [v87 objectAtIndexedSubscript:v31];
          [v45 floatValue];
          float v47 = v46;

          v48 = [v87 objectAtIndexedSubscript:v31 + 1];
          [v48 floatValue];
          float v50 = v49;

          v51 = [v87 objectAtIndexedSubscript:v31 + 2];
          [v51 floatValue];
          int v53 = v52;

          *(v34 - 2) = v47;
          *(v34 - 1) = v50;
          double *v34 = v47;
          v34[1] = v50;
          v34 += 4;
          *(void *)&v86[8 * v32] = _D11;
          *(_WORD *)(v35 - 1) = 256;
          *((_DWORD *)v44 - 2) = v53;
          *(v44 - 2) = 0;
          *((_DWORD *)v44 + 2) = v53;
          *(void *)&v85[8 * v32] = _D11;
          void *v44 = 0;
          v44 += 4;
          *(void *)&v84[8 * v32] = _D11;
          *(void *)&v83[8 * v32] = _D11;
          *(v38 - 2) = 0;
          *(v38 - 1) = 0;
          v54 = &v82[8 * v32];
          *(v36 - 1) = v32;
          *std::string v36 = v32;
          v36 += 2;
          ++v32;
          v31 += 3;
          *char v38 = 0;
          v38[1] = 0;
          v38 += 4;
          v35 += 2;
          *(_WORD *)(v37 - 1) = 0;
          v37 += 2;
          *(void *)v54 = 0;
        }
        while (v33 != v32);
      }
      id v3 = v87;
      v55 = [NSNumber numberWithUnsignedInteger:v78];
      [v81 setObject:v55 forKeyedSubscript:@"Size"];

      v56 = [MEMORY[0x263EFF8F8] dataWithBytes:v76 length:v77];
      [v81 setObject:v56 forKeyedSubscript:@"CameraPixels"];

      v57 = [MEMORY[0x263EFF8F8] dataWithBytes:v75 length:v78];
      [v81 setObject:v57 forKeyedSubscript:@"EchoIds"];

      v58 = [MEMORY[0x263EFF8F8] dataWithBytes:v74 length:v78];
      [v81 setObject:v58 forKeyedSubscript:@"SpotIds"];

      v59 = [MEMORY[0x263EFF8F8] dataWithBytes:v73 length:v78];
      [v81 setObject:v59 forKeyedSubscript:@"BankIds"];

      v60 = [MEMORY[0x263EFF8F8] dataWithBytes:v86 length:v79];
      [v81 setObject:v60 forKeyedSubscript:@"Confidences"];

      v61 = [MEMORY[0x263EFF8F8] dataWithBytes:v72 length:v77];
      [v81 setObject:v61 forKeyedSubscript:@"Points"];

      v62 = [MEMORY[0x263EFF8F8] dataWithBytes:v71 length:v77];
      [v81 setObject:v62 forKeyedSubscript:@"UndistortedCameraPixels"];

      v63 = [MEMORY[0x263EFF8F8] dataWithBytes:v85 length:v79];
      [v81 setObject:v63 forKeyedSubscript:@"EuclideanDistances"];

      v64 = [MEMORY[0x263EFF8F8] dataWithBytes:v84 length:v79];
      [v81 setObject:v64 forKeyedSubscript:@"Intensities"];

      v65 = [MEMORY[0x263EFF8F8] dataWithBytes:v83 length:v79];
      [v81 setObject:v65 forKeyedSubscript:@"SignalToNoiseRatios"];

      v66 = [MEMORY[0x263EFF8F8] dataWithBytes:v82 length:v79];
      [v81 setObject:v66 forKeyedSubscript:@"Flags"];

      v67 = [ADJasperPointCloud alloc];
      v68 = [(ADJasperPointCloud *)v67 initWithDictionaryRepresentation:v81];
    }
    else
    {
      v68 = 0;
    }
  }
  else
  {
    v68 = +[ADJasperPointCloud pointCloudFromFile:v80];
  }

  return v68;
}

+ (BaselineTestStats_s)compareResults:(__CVBuffer *)a3 toBaseLineInPath:(id)a4 ignoreRefZeros:(BOOL)a5 outlierPercentile:(float)a6
{
  uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:a4];
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  float v13 = 0.0;
  if (PixelFormatType <= 1717856626)
  {
    if (PixelFormatType == 843264104)
    {
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      float v19 = compareRawBuffers<half,half>((uint64_t)BaseAddress, BytesPerRow, [v9 bytes], 4 * Width, 2 * Width, Height, 0, a5, a6);
      goto LABEL_12;
    }
    if (PixelFormatType != 1278226536)
    {
      float v14 = 0.0;
      float v15 = 0.0;
      float v16 = 0.0;
      if (PixelFormatType != 1717855600) {
        goto LABEL_13;
      }
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (PixelFormatType == 1717856627)
  {
LABEL_10:
    uint64_t v23 = CVPixelBufferGetBaseAddress(a3);
    size_t v24 = CVPixelBufferGetBytesPerRow(a3);
    float v19 = compareRawBuffers<float,float>((uint64_t)v23, v24, [v9 bytes], 4 * Width, Width, Height, 0, a5, a6);
    goto LABEL_12;
  }
  if (PixelFormatType == 1751410032 || (float v14 = 0.0, v15 = 0.0, v16 = 0.0, PixelFormatType == 1751411059))
  {
LABEL_9:
    uint64_t v17 = CVPixelBufferGetBaseAddress(a3);
    size_t v18 = CVPixelBufferGetBytesPerRow(a3);
    float v19 = compareRawBuffers<half,half>((uint64_t)v17, v18, [v9 bytes], 2 * Width, Width, Height, 0, a5, a6);
LABEL_12:
    float v13 = v19;
    float v14 = v20;
    float v15 = v21;
    float v16 = v22;
  }
LABEL_13:
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);

  float v27 = v13;
  float v28 = v14;
  float v29 = v15;
  float v30 = v16;
  result.var3 = v30;
  result.var2 = v29;
  result.var1 = v28;
  result.var0 = v27;
  return result;
}

+ (BaselineTestStats_s)compareResults:(__CVBuffer *)a3 toBaseLineInPath:(id)a4 ignoreRefZeros:(BOOL)a5
{
  LODWORD(v5) = 1064514355;
  +[UtilsForTests compareResults:a3 toBaseLineInPath:a4 ignoreRefZeros:a5 outlierPercentile:v5];
  result.var3 = v9;
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

+ (BaselineTestStats_s)compareBuffer:(__CVBuffer *)a3 offset:(CGSize)a4 toRefBuffer:(__CVBuffer *)a5 ignoreResultZeros:(BOOL)a6 ignoreRefZeros:(BOOL)a7 outlierPercentile:(float)a8
{
  if (!a3 || !a5)
  {
    NSLog(&cfstr_InvalidParamsN.isa, a2, a4.width, a4.height);
    float v21 = 0.0;
    float v22 = 1.0e17;
    goto LABEL_12;
  }
  BOOL v10 = a7;
  BOOL v11 = a6;
  double height = a4.height;
  double width = a4.width;
  size_t v16 = CVPixelBufferGetWidth(a3);
  size_t v46 = CVPixelBufferGetHeight(a3);
  size_t v17 = CVPixelBufferGetWidth(a5);
  size_t v18 = CVPixelBufferGetHeight(a5);
  signed int PixelFormatType = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(a3);
  uint64_t v20 = CVPixelBufferGetPixelFormatType(a5);
  float v21 = 0.0;
  float v22 = 1.0e17;
  if (v16 != v17)
  {
LABEL_12:
    float v23 = 1.0e17;
    float v24 = 1.0e17;
    goto LABEL_15;
  }
  float v23 = 1.0e17;
  float v24 = 1.0e17;
  if (v46 == v18)
  {
    uint64_t v25 = v20;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a5, 1uLL);
    uint64_t v26 = PixelBufferUtils::planeCountForPixelFormat(PixelFormatType);
    if (v26)
    {
      float v27 = (__CVBuffer *)v26;
      float v28 = 0;
      float v29 = (float)(unint64_t)v26;
      float v30 = (CGRect *)MEMORY[0x263F001A8];
      float v24 = 0.0;
      float v23 = 0.0;
      float v22 = 0.0;
      do
      {
        PixelBufferUtils::asVImageBuffer(a3, v28, *v30, &v52);
        PixelBufferUtils::asVImageBuffer(a5, v28, *v30, &v51);
        vImage_Buffer v48 = v52;
        vImage_Buffer v47 = v51;
        *(float *)&double v31 = a8;
        objc_msgSend(a1, "compareVImageBuffer:pixelTypeResult:offset:toRefBuffer:pixelTypeRef:ignoreResultZeros:ignoreRefZeros:outlierPercentile:", &v48, PixelFormatType, &v47, v25, v11, v10, width, height, v31);
        float v22 = v22 + (float)(v35 / v29);
        if (v23 < v32) {
          float v23 = v32;
        }
        float v24 = v24 + (float)(v33 / v29);
        float v21 = v21 + (float)(v34 / v29);
        float v28 = (__CVBuffer *)((char *)v28 + 1);
      }
      while (v27 != v28);
    }
    else
    {
      std::string v36 = (CGRect *)MEMORY[0x263F001A8];
      PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x263F001A8], &v52);
      PixelBufferUtils::asVImageBuffer(a5, *v36, &v51);
      vImage_Buffer v50 = v52;
      vImage_Buffer v49 = v51;
      *(float *)&double v37 = a8;
      objc_msgSend(a1, "compareVImageBuffer:pixelTypeResult:offset:toRefBuffer:pixelTypeRef:ignoreResultZeros:ignoreRefZeros:outlierPercentile:", &v50, PixelFormatType, &v49, v25, v11, v10, width, height, v37);
      float v22 = v38;
      float v23 = v39;
      float v24 = v40;
      float v21 = v41;
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    CVPixelBufferUnlockBaseAddress(a5, 1uLL);
  }
LABEL_15:
  float v42 = v22;
  float v43 = v23;
  float v44 = v24;
  float v45 = v21;
  result.var3 = v45;
  result.var2 = v44;
  result.var1 = v43;
  result.var0 = v42;
  return result;
}

+ (BaselineTestStats_s)compareVImageBuffer:(vImage_Buffer *)a3 pixelTypeResult:(unsigned int)a4 offset:(CGSize)a5 toRefBuffer:(vImage_Buffer *)a6 pixelTypeRef:(unsigned int)a7 ignoreResultZeros:(BOOL)a8 ignoreRefZeros:(BOOL)a9 outlierPercentile:(float)a10
{
  BOOL v11 = *(PixelBufferUtils **)&a7;
  double height = a5.height;
  double width = a5.width;
  uint64_t v17 = PixelBufferUtils::componentsPerPixelForPixelFormat(*(PixelBufferUtils **)&a4, 0);
  if (v17 != PixelBufferUtils::componentsPerPixelForPixelFormat(v11, 0))
  {
    NSLog(&cfstr_InvalidParamsC.isa);
    __assert_rtn("+[UtilsForTests compareVImageBuffer:pixelTypeResult:offset:toRefBuffer:pixelTypeRef:ignoreResultZeros:ignoreRefZeros:outlierPercentile:]", "UtilsForTests.mm", 210, "0");
  }
  unint64_t v18 = (unint64_t)((double)a3->width - fabs(width));
  if (width < 0.0) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = (int)width;
  }
  if (width < 0.0) {
    uint64_t v20 = (int)-width;
  }
  else {
    uint64_t v20 = 0;
  }
  unint64_t v150 = (unint64_t)((double)a3->height - fabs(height));
  uint64_t v21 = (int)height;
  uint64_t v22 = (int)-height;
  if (height >= 0.0) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v21 = 0;
  }
  size_t rowBytes = a3->rowBytes;
  a3->data = (char *)a3->data + rowBytes * v22;
  size_t v24 = a6->rowBytes;
  uint64_t v25 = (char *)a6->data + v24 * v21;
  a6->data = v25;
  if ((int)a4 <= 1717855599)
  {
    if (a4 == 1278226534) {
      goto LABEL_18;
    }
    int v26 = 1380410945;
  }
  else
  {
    if (a4 == 1717855600 || a4 == 1919365990) {
      goto LABEL_18;
    }
    int v26 = 1717856627;
  }
  if (a4 != v26) {
    goto LABEL_28;
  }
LABEL_18:
  if ((int)v11 > 1717855599)
  {
    if (v11 == 1717855600 || v11 == 1919365990) {
      goto LABEL_25;
    }
    int v27 = 1717856627;
LABEL_24:
    if (v11 == v27) {
      goto LABEL_25;
    }
LABEL_28:
    uint64_t v140 = v20;
    int v36 = isF16Type(a4);
    if (v36 && isF16Type((int)v11))
    {
      float v28 = compareRawBuffers<half,half>((uint64_t)a3->data + 2 * v140, rowBytes, (uint64_t)&v25[2 * v19], v24, v17 * v18, v150, a8, a9, a10);
      goto LABEL_26;
    }
    if ((int)a4 <= 1717855599)
    {
      if (a4 != 1278226534)
      {
        int v37 = 1380410945;
LABEL_37:
        if (a4 != v37) {
          goto LABEL_87;
        }
      }
    }
    else if (a4 != 1717855600 && a4 != 1919365990)
    {
      int v37 = 1717856627;
      goto LABEL_37;
    }
    if (v11 == 825306677 || v11 == 1647392359 || v11 == 825437747)
    {
      if (a10 > 0.0 && a10 <= 1.0)
      {
        if (v150)
        {
          size_t v144 = rowBytes;
          size_t v147 = v24;
          float v38 = 0;
          uint64_t v39 = v19;
          float v40 = 0;
          unint64_t v41 = 0;
          uint64_t v42 = 0;
          unsigned int v43 = 0;
          v141 = (char *)a3->data + 4 * v140;
          v137 = &v25[2 * v39];
          BOOL v44 = a8;
          while (!v18)
          {
            vImage_Buffer v49 = v40;
LABEL_85:
            float v40 = v49;
            uint64_t v42 = ++v43;
            if (v43 >= v150) {
              goto LABEL_143;
            }
          }
          LODWORD(v45) = 0;
          size_t v46 = &v137[v42 * v147];
          vImage_Buffer v47 = (float *)&v141[v42 * v144];
          while (1)
          {
            float v48 = *v47;
            if (*v47 != 0.0 || !v44)
            {
              if (*(_WORD *)v46)
              {
                float v50 = fabsf((float)((float)*(unsigned __int16 *)v46 - v48) / (float)*(unsigned __int16 *)v46);
                if ((unint64_t)v40 >= v41)
                {
                  uint64_t v51 = v40 - v38;
                  unint64_t v52 = v51 + 1;
                  if ((unint64_t)(v51 + 1) >> 62) {
                    goto LABEL_244;
                  }
                  if ((uint64_t)(v41 - (void)v38) >> 1 > v52) {
                    unint64_t v52 = (uint64_t)(v41 - (void)v38) >> 1;
                  }
                  if (v41 - (unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v53 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v53 = v52;
                  }
                  if (v53) {
                    unint64_t v53 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v53);
                  }
                  else {
                    uint64_t v54 = 0;
                  }
                  v56 = (float *)(v53 + 4 * v51);
                  float *v56 = v50;
                  vImage_Buffer v49 = v56 + 1;
                  while (v40 != v38)
                  {
                    int v57 = *((_DWORD *)v40-- - 1);
                    *((_DWORD *)v56-- - 1) = v57;
                  }
LABEL_67:
                  unint64_t v41 = v53 + 4 * v54;
                  if (v38) {
                    operator delete(v38);
                  }
                  float v38 = v56;
                  BOOL v44 = a8;
                  goto LABEL_70;
                }
LABEL_62:
                *float v40 = v50;
                vImage_Buffer v49 = v40 + 1;
                goto LABEL_70;
              }
              if (!a9)
              {
                float v55 = v48 / 0.0001;
                float v50 = fabsf(v55);
                if ((unint64_t)v40 >= v41)
                {
                  uint64_t v58 = v40 - v38;
                  unint64_t v59 = v58 + 1;
                  if ((unint64_t)(v58 + 1) >> 62) {
LABEL_244:
                  }
                    std::vector<Element *>::__throw_length_error[abi:ne180100]();
                  if ((uint64_t)(v41 - (void)v38) >> 1 > v59) {
                    unint64_t v59 = (uint64_t)(v41 - (void)v38) >> 1;
                  }
                  if (v41 - (unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v53 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v53 = v59;
                  }
                  if (v53) {
                    unint64_t v53 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v53);
                  }
                  else {
                    uint64_t v54 = 0;
                  }
                  v56 = (float *)(v53 + 4 * v58);
                  float *v56 = v50;
                  vImage_Buffer v49 = v56 + 1;
                  while (v40 != v38)
                  {
                    int v60 = *((_DWORD *)v40-- - 1);
                    *((_DWORD *)v56-- - 1) = v60;
                  }
                  goto LABEL_67;
                }
                goto LABEL_62;
              }
            }
            vImage_Buffer v49 = v40;
LABEL_70:
            unint64_t v45 = (v45 + 1);
            ++v47;
            v46 += 2;
            float v40 = v49;
            if (v45 >= v18) {
              goto LABEL_85;
            }
          }
        }
        float v38 = 0;
        vImage_Buffer v49 = 0;
LABEL_143:
        int v91 = (int)(float)((float)(unint64_t)(v49 - v38) * a10);
        if (v91 > 0)
        {
          std::__sort<std::__less<float,float> &,float *>();
          if (v91 < 2)
          {
            uint64_t v96 = 0;
            float v92 = 0.0;
          }
          else
          {
            float v92 = 0.0;
            v93 = v38;
            uint64_t v94 = (v91 - 1);
            do
            {
              float v95 = *v93++;
              float v92 = v92 + v95;
              --v94;
            }
            while (v94);
            uint64_t v96 = (v91 - 1);
          }
          float v29 = (float)(v92 / (float)(v91 - 1)) * 100.0;
          float v124 = v38[v96] * 100.0;
          float v125 = v92 * 100.0;
          float v30 = (float)v91;
          goto LABEL_237;
        }
LABEL_233:
        float v30 = 0.0;
        float v29 = 1.0e17;
        float v124 = 1.0e17;
        float v125 = 0.0;
        *(float *)&int v32 = 1.0e17;
        float v33 = 0.0;
        if (!v38) {
          goto LABEL_27;
        }
        goto LABEL_237;
      }
LABEL_198:
      NSLog(&cfstr_CannotCompareW.isa, a10);
      float v30 = 0.0;
      float v29 = 1.0e17;
      *(float *)&int v32 = 1.0e17;
      float v33 = 0.0;
      goto LABEL_27;
    }
LABEL_87:
    if (v36 && (v11 == 825306677 || v11 == 1647392359 || v11 == 825437747))
    {
      if (a10 <= 0.0 || a10 > 1.0) {
        goto LABEL_198;
      }
      if (v150)
      {
        size_t v145 = rowBytes;
        size_t v148 = v24;
        float v38 = 0;
        uint64_t v61 = v19;
        v62 = 0;
        unint64_t v63 = 0;
        unint64_t v64 = 0;
        int v65 = 0;
        v138 = (char *)a3->data + 2 * v140;
        v142 = &v25[2 * v61];
        unint64_t v66 = v17 * v18;
        BOOL v67 = a8;
        while (1)
        {
          int v68 = v65;
          if (v66) {
            break;
          }
          uint64_t v77 = v62;
LABEL_136:
          unint64_t v64 = (v68 + 1);
          v62 = v77;
          int v65 = v68 + 1;
          if (v64 >= v150) {
            goto LABEL_222;
          }
        }
        LODWORD(v69) = 0;
        uint64_t v70 = &v142[v64 * v148];
        v71 = &v138[v64 * v145];
        while (1)
        {
          __asm { FCMP            H0, #0 }
          if (!_ZF || !v67)
          {
            if (*(_WORD *)v70)
            {
              __asm { FCVT            S0, H0 }
              float v79 = fabsf((float)((float)*(unsigned __int16 *)v70 - _S0) / (float)*(unsigned __int16 *)v70);
              if ((unint64_t)v62 >= v63)
              {
                uint64_t v80 = v62 - v38;
                unint64_t v81 = v80 + 1;
                if ((unint64_t)(v80 + 1) >> 62) {
                  goto LABEL_245;
                }
                if ((uint64_t)(v63 - (void)v38) >> 1 > v81) {
                  unint64_t v81 = (uint64_t)(v63 - (void)v38) >> 1;
                }
                if (v63 - (unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v82 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v82 = v81;
                }
                if (v82) {
                  unint64_t v82 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v82);
                }
                else {
                  uint64_t v83 = 0;
                }
                v85 = (float *)(v82 + 4 * v80);
                float *v85 = v79;
                uint64_t v77 = v85 + 1;
                while (v62 != v38)
                {
                  int v86 = *((_DWORD *)v62-- - 1);
                  *((_DWORD *)v85-- - 1) = v86;
                }
LABEL_130:
                unint64_t v63 = v82 + 4 * v83;
                if (v38) {
                  operator delete(v38);
                }
                float v38 = v85;
                BOOL v67 = a8;
                goto LABEL_133;
              }
LABEL_113:
              float *v62 = v79;
              uint64_t v77 = v62 + 1;
              goto LABEL_133;
            }
            if (!a9)
            {
              __asm { FCVT            D0, H0 }
              *(float *)&_D0 = _D0 / 0.0001;
              float v79 = fabsf(*(float *)&_D0);
              if ((unint64_t)v62 >= v63)
              {
                uint64_t v87 = v62 - v38;
                unint64_t v88 = v87 + 1;
                if ((unint64_t)(v87 + 1) >> 62) {
LABEL_245:
                }
                  std::vector<Element *>::__throw_length_error[abi:ne180100]();
                if ((uint64_t)(v63 - (void)v38) >> 1 > v88) {
                  unint64_t v88 = (uint64_t)(v63 - (void)v38) >> 1;
                }
                if (v63 - (unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v82 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v82 = v88;
                }
                if (v82) {
                  unint64_t v82 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v82);
                }
                else {
                  uint64_t v83 = 0;
                }
                v85 = (float *)(v82 + 4 * v87);
                float *v85 = v79;
                uint64_t v77 = v85 + 1;
                while (v62 != v38)
                {
                  int v89 = *((_DWORD *)v62-- - 1);
                  *((_DWORD *)v85-- - 1) = v89;
                }
                goto LABEL_130;
              }
              goto LABEL_113;
            }
          }
          uint64_t v77 = v62;
LABEL_133:
          unint64_t v69 = (v69 + 1);
          v71 += 2;
          v70 += 2;
          v62 = v77;
          if (v66 <= v69) {
            goto LABEL_136;
          }
        }
      }
      float v38 = 0;
      uint64_t v77 = 0;
LABEL_222:
      int v127 = (int)(float)((float)(unint64_t)(v77 - v38) * a10);
      if (v127 <= 0) {
        goto LABEL_233;
      }
      std::__sort<std::__less<float,float> &,float *>();
      uint64_t v128 = (v127 - 1);
      if (v127 >= 2)
      {
        float v129 = 0.0;
        v130 = v38;
        uint64_t v131 = (v127 - 1);
        do
        {
          float v132 = *v130++;
          float v129 = v129 + v132;
          --v131;
        }
        while (v131);
LABEL_232:
        uint64_t v136 = v128;
LABEL_236:
        float v29 = (float)(v129 / (float)(int)v128) * 100.0;
        float v124 = v38[v136] * 100.0;
        float v125 = v129 * 100.0;
        float v30 = (float)v127;
LABEL_237:
        *(float *)&int v32 = v29;
        float v33 = v30;
        operator delete(v38);
        float v30 = v125;
        float v29 = v124;
        goto LABEL_27;
      }
      goto LABEL_235;
    }
    if ((int)a4 <= 1717855599)
    {
      if (a4 != 1278226534)
      {
        int v90 = 1380410945;
LABEL_150:
        if (a4 != v90) {
          goto LABEL_199;
        }
      }
    }
    else if (a4 != 1717855600 && a4 != 1919365990)
    {
      int v90 = 1717856627;
      goto LABEL_150;
    }
    if (isF16Type((int)v11))
    {
      if (a10 <= 0.0 || a10 > 1.0) {
        goto LABEL_198;
      }
      if (!v150)
      {
        float v38 = 0;
        v109 = 0;
LABEL_228:
        int v127 = (int)(float)((float)(unint64_t)(v109 - v38) * a10);
        if (v127 <= 0) {
          goto LABEL_233;
        }
        std::__sort<std::__less<float,float> &,float *>();
        uint64_t v128 = (v127 - 1);
        if (v127 >= 2)
        {
          float v129 = 0.0;
          v133 = v38;
          uint64_t v134 = (v127 - 1);
          do
          {
            float v135 = *v133++;
            float v129 = v129 + v135;
            --v134;
          }
          while (v134);
          goto LABEL_232;
        }
LABEL_235:
        uint64_t v136 = 0;
        float v129 = 0.0;
        goto LABEL_236;
      }
      size_t v146 = rowBytes;
      size_t v149 = v24;
      float v38 = 0;
      uint64_t v97 = v19;
      v98 = 0;
      unint64_t v99 = 0;
      unint64_t v100 = 0;
      int v101 = 0;
      v139 = (char *)a3->data + 4 * v140;
      v143 = &v25[2 * v97];
      unint64_t v102 = v17 * v18;
      BOOL v103 = a8;
      while (1)
      {
        int v104 = v101;
        if (v102) {
          break;
        }
        v109 = v98;
LABEL_196:
        unint64_t v100 = (v104 + 1);
        v98 = v109;
        int v101 = v104 + 1;
        if (v100 >= v150) {
          goto LABEL_228;
        }
      }
      LODWORD(v105) = 0;
      v106 = &v143[v100 * v149];
      v107 = (float *)&v139[v100 * v146];
      while (1)
      {
        float v108 = *v107;
        if (*v107 != 0.0 || !v103)
        {
          __asm { FCMP            H1, #0 }
          if (!_ZF)
          {
            __asm { FCVT            S1, H1 }
            float v112 = fabsf((float)(_S1 - v108) / _S1);
            if ((unint64_t)v98 >= v99)
            {
              uint64_t v113 = v98 - v38;
              unint64_t v114 = v113 + 1;
              if ((unint64_t)(v113 + 1) >> 62) {
                goto LABEL_247;
              }
              if ((uint64_t)(v99 - (void)v38) >> 1 > v114) {
                unint64_t v114 = (uint64_t)(v99 - (void)v38) >> 1;
              }
              if (v99 - (unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v115 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v115 = v114;
              }
              if (v115) {
                unint64_t v115 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v115);
              }
              else {
                uint64_t v116 = 0;
              }
              v118 = (float *)(v115 + 4 * v113);
              float *v118 = v112;
              v109 = v118 + 1;
              while (v98 != v38)
              {
                int v119 = *((_DWORD *)v98-- - 1);
                *((_DWORD *)v118-- - 1) = v119;
              }
LABEL_190:
              unint64_t v99 = v115 + 4 * v116;
              if (v38) {
                operator delete(v38);
              }
              float v38 = v118;
              BOOL v103 = a8;
              goto LABEL_193;
            }
LABEL_173:
            float *v98 = v112;
            v109 = v98 + 1;
            goto LABEL_193;
          }
          if (!a9)
          {
            float v117 = v108 / 0.0001;
            float v112 = fabsf(v117);
            if ((unint64_t)v98 >= v99)
            {
              uint64_t v120 = v98 - v38;
              unint64_t v121 = v120 + 1;
              if ((unint64_t)(v120 + 1) >> 62) {
LABEL_247:
              }
                std::vector<Element *>::__throw_length_error[abi:ne180100]();
              if ((uint64_t)(v99 - (void)v38) >> 1 > v121) {
                unint64_t v121 = (uint64_t)(v99 - (void)v38) >> 1;
              }
              if (v99 - (unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v115 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v115 = v121;
              }
              if (v115) {
                unint64_t v115 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v115);
              }
              else {
                uint64_t v116 = 0;
              }
              v118 = (float *)(v115 + 4 * v120);
              float *v118 = v112;
              v109 = v118 + 1;
              while (v98 != v38)
              {
                int v122 = *((_DWORD *)v98-- - 1);
                *((_DWORD *)v118-- - 1) = v122;
              }
              goto LABEL_190;
            }
            goto LABEL_173;
          }
        }
        v109 = v98;
LABEL_193:
        unint64_t v105 = (v105 + 1);
        ++v107;
        v106 += 2;
        v98 = v109;
        if (v102 <= v105) {
          goto LABEL_196;
        }
      }
    }
LABEL_199:
    if (v36)
    {
      if ((int)v11 <= 1717855599)
      {
        if (v11 == 1278226534)
        {
LABEL_209:
          float v28 = compareRawBuffers<half,float>((uint64_t)a3->data + 2 * v140, rowBytes, (uint64_t)&v25[4 * v19], v24, v17 * v18, v150, a8, a9, a10);
          goto LABEL_26;
        }
        int v123 = 1380410945;
      }
      else
      {
        if (v11 == 1717855600 || v11 == 1919365990) {
          goto LABEL_209;
        }
        int v123 = 1717856627;
      }
      if (v11 == v123) {
        goto LABEL_209;
      }
    }
    if ((int)a4 > 1111970368)
    {
      if (a4 != 1111970369)
      {
        if (a4 == 1647392359) {
          goto LABEL_240;
        }
        if (a4 != 1278226488) {
          goto LABEL_248;
        }
      }
    }
    else if (a4 != 32)
    {
      if (a4 != 825306677)
      {
        int v126 = 825437747;
        goto LABEL_239;
      }
LABEL_240:
      if (v11 == 825306677 || v11 == 1647392359 || v11 == 825437747)
      {
        float v28 = compareRawBuffers<unsigned short,unsigned short>((uint64_t)a3->data + 2 * v140, rowBytes, (uint64_t)&v25[2 * v19], v24, v17 * v18, v150, a8, a9, a10);
        goto LABEL_26;
      }
LABEL_248:
      NSLog(&cfstr_ThisComparison.isa);
      __assert_rtn("+[UtilsForTests compareVImageBuffer:pixelTypeResult:offset:toRefBuffer:pixelTypeRef:ignoreResultZeros:ignoreRefZeros:outlierPercentile:]", "UtilsForTests.mm", 286, "0");
    }
    if (v11 == 32 || v11 == 1278226488 || v11 == 1111970369)
    {
      float v28 = compareRawBuffers<unsigned char,unsigned char>((uint64_t)a3->data + v140, rowBytes, (uint64_t)&v25[v19], v24, v17 * v18, v150, a8, a9, a10);
      goto LABEL_26;
    }
    int v126 = 825306677;
LABEL_239:
    if (a4 != v126) {
      goto LABEL_248;
    }
    goto LABEL_240;
  }
  if (v11 != 1278226534)
  {
    int v27 = 1380410945;
    goto LABEL_24;
  }
LABEL_25:
  float v28 = compareRawBuffers<float,float>((uint64_t)a3->data + 4 * v20, rowBytes, (uint64_t)&v25[4 * v19], v24, v17 * v18, v150, a8, a9, a10);
LABEL_26:
  *(float *)&int v32 = v28;
  float v33 = v31;
LABEL_27:
  float v34 = *(float *)&v32;
  float v35 = v33;
  result.var3 = v35;
  result.var2 = v30;
  result.var1 = v29;
  result.var0 = v34;
  return result;
}

+ (BaselineTestStats_s)compareBuffer:(__CVBuffer *)a3 toRefBuffer:(__CVBuffer *)a4 ignoreRefZeros:(BOOL)a5 outlierPercentile:(float)a6
{
  *(float *)&double v6 = a6;
  +[UtilsForTests compareBuffer:offset:toRefBuffer:ignoreResultZeros:ignoreRefZeros:outlierPercentile:](UtilsForTests, "compareBuffer:offset:toRefBuffer:ignoreResultZeros:ignoreRefZeros:outlierPercentile:", a3, a4, 0, a5, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8), v6);
  result.var3 = v10;
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

+ (BaselineTestStats_s)compareBuffer:(__CVBuffer *)a3 offset:(CGSize)a4 toRefBuffer:(__CVBuffer *)a5 ignoreRefZeros:(BOOL)a6
{
  LODWORD(v6) = 1064514355;
  +[UtilsForTests compareBuffer:offset:toRefBuffer:ignoreResultZeros:ignoreRefZeros:outlierPercentile:](UtilsForTests, "compareBuffer:offset:toRefBuffer:ignoreResultZeros:ignoreRefZeros:outlierPercentile:", a3, a5, 0, a6, a4.width, a4.height, v6);
  result.var3 = v10;
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

+ (BaselineTestStats_s)compareBuffer:(__CVBuffer *)a3 toRefBuffer:(__CVBuffer *)a4 ignoreResultZeros:(BOOL)a5 ignoreRefZeros:(BOOL)a6
{
  LODWORD(v6) = 1064514355;
  +[UtilsForTests compareBuffer:offset:toRefBuffer:ignoreResultZeros:ignoreRefZeros:outlierPercentile:](UtilsForTests, "compareBuffer:offset:toRefBuffer:ignoreResultZeros:ignoreRefZeros:outlierPercentile:", a3, a4, a5, a6, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8), v6);
  result.var3 = v10;
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

+ (BaselineTestStats_s)compareBuffer:(__CVBuffer *)a3 toRefBuffer:(__CVBuffer *)a4 ignoreRefZeros:(BOOL)a5
{
  objc_msgSend(a1, "compareBuffer:offset:toRefBuffer:ignoreRefZeros:", a3, a4, a5, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  result.var3 = v8;
  result.var2 = v7;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

+ (unint64_t)preferredEspressoEngine
{
  if ([MEMORY[0x263F28048] hasANE]) {
    return 4;
  }
  else {
    return 2;
  }
}

@end