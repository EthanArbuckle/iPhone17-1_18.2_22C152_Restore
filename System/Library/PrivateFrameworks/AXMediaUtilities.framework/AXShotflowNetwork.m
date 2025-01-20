@interface AXShotflowNetwork
+ (id)cpuNetworkWithModelPath:(id)a3 configuration:(id)a4 version:(int)a5 modelType:(int64_t)a6;
+ (id)gpuNetworkWithModelPath:(id)a3 configuration:(id)a4 preferredMetalDeviceID:(int)a5 version:(int)a6 modelType:(int64_t)a7;
- (AXShotflowNetwork)initWithModelPath:(id)a3 espressoEngineID:(int)a4 espressoDeviceID:(int)a5 configuration:(id)a6 version:(int)a7 modelType:(int64_t)a8;
- (float)threshold;
- (id).cxx_construct;
- (id)processCIImage:(id)a3;
- (id)processVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4;
- (id)resizeAndProcessVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4;
- (int)setInputShape:(unint64_t)a3 height:(unint64_t)a4;
- (int)version;
- (int64_t)modelType;
- (unint64_t)preferredSmallSide;
- (void)dealloc;
- (void)runNetwork:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4;
- (void)setModelType:(int64_t)a3;
- (void)setThreshold:(float)a3;
- (void)setVersion:(int)a3;
@end

@implementation AXShotflowNetwork

- (unint64_t)preferredSmallSide
{
  return (unint64_t)self->_input_height;
}

+ (id)cpuNetworkWithModelPath:(id)a3 configuration:(id)a4 version:(int)a5 modelType:(int64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  v12 = (void *)[objc_alloc((Class)a1) initWithModelPath:v10 espressoEngineID:0 espressoDeviceID:0xFFFFFFFFLL configuration:v11 version:v7 modelType:a6];

  return v12;
}

+ (id)gpuNetworkWithModelPath:(id)a3 configuration:(id)a4 preferredMetalDeviceID:(int)a5 version:(int)a6 modelType:(int64_t)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  NSLog(&cfstr_TryingAneBacke.isa, v12);
  v14 = (void *)[objc_alloc((Class)a1) initWithModelPath:v12 espressoEngineID:10007 espressoDeviceID:v9 configuration:v13 version:v8 modelType:a7];

  return v14;
}

- (AXShotflowNetwork)initWithModelPath:(id)a3 espressoEngineID:(int)a4 espressoDeviceID:(int)a5 configuration:(id)a6 version:(int)a7 modelType:(int64_t)a8
{
  v272 = (void *)*MEMORY[0x1E4F143B8];
  id v224 = a3;
  id v225 = a6;
  v250.receiver = self;
  v250.super_class = (Class)AXShotflowNetwork;
  id v12 = [(AXShotflowNetwork *)&v250 init];
  id v13 = v12;
  if (v12)
  {
    v14 = [v225 networkThreshold];
    v223 = v12;
    [v14 floatValue];
    *((_DWORD *)v12 + 341) = v15;

    *((_DWORD *)v12 + 46) = a7;
    *((void *)v12 + 1) = a8;
    v12[198] = 0;
    *((_WORD *)v12 + 98) = 1;
    *((_WORD *)v12 + 678) = 257;
    *((_DWORD *)v12 + 340) = 1140064256;
    __src[0] = xmmword_1B58AD060;
    *(void *)&__src[1] = 0x43DB999943926667;
    v229 = (void **)(v12 + 288);
    std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 288, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
    __src[0] = xmmword_1B58AD078;
    *(void *)&__src[1] = 0x3F6666663F19999ALL;
    v227 = (void **)(v12 + 312);
    std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 312, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
    if (a8 == 2)
    {
      v12[196] = 0;
      *((_DWORD *)v12 + 47) = 0;
      *((_DWORD *)v12 + 50) = 17;
      __src[0] = xmmword_1B58AD214;
      __src[1] = unk_1B58AD224;
      long long v261 = xmmword_1B58AD234;
      long long v262 = unk_1B58AD244;
      LODWORD(v263) = 17;
      std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)&v263 + 4, 0x11uLL);
      v253[0] = @"1";
      v253[1] = @"2";
      v253[2] = @"3";
      v253[3] = @"4";
      v253[4] = @"5";
      v253[5] = @"6";
      v253[6] = @"7";
      v253[7] = @"8";
      v253[8] = @"9";
      v253[9] = @"10";
      v253[10] = @"11";
      v253[11] = @"12";
      v253[12] = @"13";
      v253[13] = @"14";
      v253[14] = @"15";
      v253[15] = @"16";
      v253[16] = @"17";
      std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v253, (void **)&v254, 0x11uLL);
      for (uint64_t i = 16; i != -1; --i)

      *((void *)v12 + 34) = *((void *)v12 + 33);
      long long v238 = 0u;
      long long v239 = 0u;
      long long v240 = 0u;
      long long v241 = 0u;
      v18 = [v225 ratios];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v238 objects:v252 count:16];
      if (v19)
      {
        v20 = (void **)(v12 + 264);
        uint64_t v21 = *(void *)v239;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v239 != v21) {
              objc_enumerationMutation(v18);
            }
            [*(id *)(*((void *)&v238 + 1) + 8 * j) floatValue];
            int v24 = v23;
            v26 = (char *)*((void *)v13 + 34);
            unint64_t v25 = *((void *)v13 + 35);
            if ((unint64_t)v26 >= v25)
            {
              v28 = (char *)*v20;
              uint64_t v29 = (v26 - (unsigned char *)*v20) >> 2;
              unint64_t v30 = v29 + 1;
              if ((unint64_t)(v29 + 1) >> 62) {
                std::vector<BOOL>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v31 = v25 - (void)v28;
              if (v31 >> 1 > v30) {
                unint64_t v30 = v31 >> 1;
              }
              if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v32 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v32 = v30;
              }
              if (v32)
              {
                v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v223 + 280), v32);
                v28 = (char *)*((void *)v13 + 33);
                v26 = (char *)*((void *)v13 + 34);
              }
              else
              {
                v33 = 0;
              }
              v34 = &v33[4 * v29];
              *(_DWORD *)v34 = v24;
              v27 = v34 + 4;
              while (v26 != v28)
              {
                int v35 = *((_DWORD *)v26 - 1);
                v26 -= 4;
                *((_DWORD *)v34 - 1) = v35;
                v34 -= 4;
              }
              *((void *)v13 + 33) = v34;
              *((void *)v13 + 34) = v27;
              *((void *)v13 + 35) = &v33[4 * v32];
              if (v28) {
                operator delete(v28);
              }
            }
            else
            {
              *(_DWORD *)v26 = v23;
              v27 = v26 + 4;
            }
            *((void *)v13 + 34) = v27;
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v238 objects:v252 count:16];
        }
        while (v19);
      }

      v36 = [v225 ratios];
      *((_DWORD *)v13 + 64) = [v36 count];

      *((void *)v13 + 37) = *((void *)v13 + 36);
      *((void *)v13 + 40) = *((void *)v13 + 39);
      long long v234 = 0u;
      long long v235 = 0u;
      long long v236 = 0u;
      long long v237 = 0u;
      v37 = [v225 defaultBoxesSidesNormalized];
      uint64_t v38 = [v37 countByEnumeratingWithState:&v234 objects:v251 count:16];
      if (v38)
      {
        uint64_t v39 = *(void *)v235;
        do
        {
          for (uint64_t k = 0; k != v38; ++k)
          {
            if (*(void *)v235 != v39) {
              objc_enumerationMutation(v37);
            }
            v41 = *(void **)(*((void *)&v234 + 1) + 8 * k);
            [v41 floatValue];
            int v43 = v42;
            v45 = (char *)*((void *)v13 + 40);
            unint64_t v44 = *((void *)v13 + 41);
            if ((unint64_t)v45 >= v44)
            {
              v47 = (char *)*v227;
              uint64_t v48 = (v45 - (unsigned char *)*v227) >> 2;
              unint64_t v49 = v48 + 1;
              if ((unint64_t)(v48 + 1) >> 62) {
                std::vector<BOOL>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v50 = v44 - (void)v47;
              if (v50 >> 1 > v49) {
                unint64_t v49 = v50 >> 1;
              }
              if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v51 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v51 = v49;
              }
              if (v51)
              {
                v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v223 + 328), v51);
                v47 = (char *)*((void *)v13 + 39);
                v45 = (char *)*((void *)v13 + 40);
              }
              else
              {
                v52 = 0;
              }
              v53 = &v52[4 * v48];
              *(_DWORD *)v53 = v43;
              v46 = v53 + 4;
              while (v45 != v47)
              {
                int v54 = *((_DWORD *)v45 - 1);
                v45 -= 4;
                *((_DWORD *)v53 - 1) = v54;
                v53 -= 4;
              }
              *((void *)v13 + 39) = v53;
              *((void *)v13 + 40) = v46;
              *((void *)v13 + 41) = &v52[4 * v51];
              if (v47) {
                operator delete(v47);
              }
            }
            else
            {
              *(_DWORD *)v45 = v42;
              v46 = v45 + 4;
            }
            *((void *)v13 + 40) = v46;
            [v41 floatValue];
            float v56 = v55 * 488.0;
            v58 = (float *)*((void *)v13 + 37);
            unint64_t v57 = *((void *)v13 + 38);
            if ((unint64_t)v58 >= v57)
            {
              v60 = (float *)*v229;
              uint64_t v61 = ((char *)v58 - (unsigned char *)*v229) >> 2;
              unint64_t v62 = v61 + 1;
              if ((unint64_t)(v61 + 1) >> 62) {
                std::vector<BOOL>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v63 = v57 - (void)v60;
              if (v63 >> 1 > v62) {
                unint64_t v62 = v63 >> 1;
              }
              if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v64 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v64 = v62;
              }
              if (v64)
              {
                v65 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v223 + 304), v64);
                v60 = (float *)*((void *)v13 + 36);
                v58 = (float *)*((void *)v13 + 37);
              }
              else
              {
                v65 = 0;
              }
              v66 = (float *)&v65[4 * v61];
              float *v66 = v56;
              v59 = v66 + 1;
              while (v58 != v60)
              {
                int v67 = *((_DWORD *)v58-- - 1);
                *((_DWORD *)v66-- - 1) = v67;
              }
              *((void *)v13 + 36) = v66;
              *((void *)v13 + 37) = v59;
              *((void *)v13 + 38) = &v65[4 * v64];
              if (v60) {
                operator delete(v60);
              }
            }
            else
            {
              float *v58 = v56;
              v59 = v58 + 1;
            }
            *((void *)v13 + 37) = v59;
          }
          uint64_t v38 = [v37 countByEnumeratingWithState:&v234 objects:v251 count:16];
        }
        while (v38);
      }

      __src[0] = xmmword_1B58AD258;
      *(void *)&__src[1] = 0x433F800042FF0000;
      std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v223 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
      __src[0] = xmmword_1B58AD258;
      *(void *)&__src[1] = 0x433F800042FF0000;
      std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v223 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
      int IsPad = AXDeviceIsPad();
LABEL_71:
      float v69 = 0.5;
      if (IsPad) {
        float v69 = 1.0;
      }
      *((float *)v13 + 338) = v69;
      *((_DWORD *)v13 + 340) = 1147142144;
LABEL_74:
      *((_WORD *)v13 + 678) = 0;
    }
    else if (a8 == 1)
    {
      switch(a7)
      {
        case 2:
          __src[0] = xmmword_1B58AD1E4;
          *(void *)&__src[1] = 0x432B800042D70000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B58AD1FC;
          *(void *)&__src[1] = 0x433B800042F70000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          *(void *)(v12 + 188) = 0x400000002;
          *((_DWORD *)v12 + 50) = 1;
          LODWORD(__src[0]) = 1;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)__src + 4, 1uLL);
          v271 = @"face";
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), (void **)&v271, &v272, 1uLL);

          LODWORD(__src[0]) = 1065353216;
          int v16 = 1;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 264, (char *)__src, (uint64_t)__src + 4, 1uLL);
          goto LABEL_140;
        case 5:
          __src[0] = xmmword_1B58AD090;
          *(void *)&__src[1] = 0x4344800043048000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B58AD0A8;
          *(void *)&__src[1] = 0x432F800042DF0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          *(void *)(v12 + 188) = 0x400000002;
          v12[196] = 0;
          *((_DWORD *)v12 + 50) = 4;
          *(void *)&__src[0] = 0x200000001;
          DWORD2(__src[0]) = 3;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)__src + 12, 3uLL);
          v270[0] = @"human_body";
          v270[1] = @"cat";
          v270[2] = @"dog";
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v270, (void **)&v271, 3uLL);
          for (uint64_t m = 2; m != -1; --m)

          goto LABEL_123;
        case 6:
          __src[0] = xmmword_1B58AD1E4;
          *(void *)&__src[1] = 0x432B800042D70000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B58AD1FC;
          *(void *)&__src[1] = 0x433B800042F70000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          *(void *)(v12 + 188) = 0x400000002;
          v12[196] = 0;
          *((_DWORD *)v12 + 50) = 2;
          *(void *)&__src[0] = 0x200000001;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)__src + 8, 2uLL);
          v269[0] = @"face";
          v269[1] = @"head";
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v269, v270, 2uLL);
          for (uint64_t n = 1; n != -1; --n)

LABEL_123:
          LODWORD(__src[1]) = 1051372203;
          __src[0] = xmmword_1B58AD1D0;
          int v16 = 5;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 264, (char *)__src, (uint64_t)&__src[1] + 4, 5uLL);
          goto LABEL_140;
        case 7:
          *(void *)(v12 + 188) = 0x400000002;
          v12[196] = 0;
          v12[198] = 1;
          *((_DWORD *)v12 + 50) = 4;
          *(void *)&__src[0] = 0x200000001;
          DWORD2(__src[0]) = 3;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)__src + 12, 3uLL);
          v268[0] = @"human_body";
          v268[1] = @"cat";
          v268[2] = @"dog";
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v268, v269, 3uLL);
          for (iuint64_t i = 2; ii != -1; --ii)

          LODWORD(__src[1]) = 1051372203;
          __src[0] = xmmword_1B58AD1D0;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 264, (char *)__src, (uint64_t)&__src[1] + 4, 5uLL);
          *((_DWORD *)v12 + 64) = 5;
          __src[0] = xmmword_1B58AD0C0;
          *(void *)&__src[1] = 0x4307800041FC0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B58AD0D8;
          *(void *)&__src[1] = 0x433F8000427E0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          goto LABEL_141;
        case 8:
          *(void *)(v12 + 188) = 0x500000002;
          v12[196] = 0;
          *((_DWORD *)v12 + 50) = 6;
          __src[0] = xmmword_1B58AD108;
          LODWORD(__src[1]) = 5;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)&__src[1] + 4, 5uLL);
          v267[0] = @"face";
          v267[1] = @"head";
          v267[2] = @"human_body";
          v267[3] = @"cat";
          v267[4] = @"dog";
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v267, v268, 5uLL);
          for (juint64_t j = 4; jj != -1; --jj)

          LODWORD(__src[1]) = 1051372203;
          __src[0] = xmmword_1B58AD1D0;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 264, (char *)__src, (uint64_t)&__src[1] + 4, 5uLL);
          *((_DWORD *)v12 + 64) = 5;
          __src[0] = xmmword_1B58AD0F0;
          *(void *)&__src[1] = 0x4314800042A90000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B58AD258;
          *(void *)&__src[1] = 0x433F800042FF0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          goto LABEL_141;
        case 9:
          *((_DWORD *)v12 + 47) = 0;
          *((_DWORD *)v12 + 50) = 6;
          __src[0] = xmmword_1B58AD108;
          LODWORD(__src[1]) = 5;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)&__src[1] + 4, 5uLL);
          v266[0] = @"face";
          v266[1] = @"head";
          v266[2] = @"human_body";
          v266[3] = @"cat";
          v266[4] = @"dog";
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v266, v267, 5uLL);
          for (kuint64_t k = 4; kk != -1; --kk)

          goto LABEL_138;
        case 10:
          v12[197] = 1;
          *((_DWORD *)v12 + 47) = 0;
          *((_DWORD *)v12 + 50) = 6;
          __src[0] = xmmword_1B58AD108;
          LODWORD(__src[1]) = 5;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)&__src[1] + 4, 5uLL);
          v265[0] = @"face";
          v265[1] = @"head";
          v265[2] = @"human_body";
          v265[3] = @"cat";
          v265[4] = @"dog";
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v265, v266, 5uLL);
          for (muint64_t m = 4; mm != -1; --mm)

          goto LABEL_138;
        case 11:
          v12[196] = 0;
          *((_DWORD *)v12 + 47) = 0;
          *((_DWORD *)v12 + 50) = 20;
          long long v261 = xmmword_1B58AD13C;
          long long v262 = unk_1B58AD14C;
          long long v263 = xmmword_1B58AD15C;
          __src[1] = unk_1B58AD12C;
          __src[0] = xmmword_1B58AD11C;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)&v264, 0x14uLL);
          v259[0] = @"aeroplane";
          v259[1] = @"bicycle";
          v259[2] = @"bird";
          v259[3] = @"boat";
          v259[4] = @"bottle";
          v259[5] = @"bus";
          v259[6] = @"car";
          v259[7] = @"cat";
          v259[8] = @"chair";
          v259[9] = @"cow";
          v259[10] = @"dining_table";
          v259[11] = @"dog";
          v259[12] = @"horse";
          v259[13] = @"motorbike";
          v259[14] = @"person";
          v259[15] = @"potted_plant";
          v259[16] = @"sheep";
          v259[17] = @"sofa";
          v259[18] = @"train";
          v259[19] = @"tv_monitor";
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v259, (void **)__src, 0x14uLL);
          for (nuint64_t n = 19; nn != -1; --nn)

          goto LABEL_135;
        case 12:
          v12[197] = 1;
          *((_DWORD *)v12 + 47) = 0;
          *((_DWORD *)v12 + 50) = 8;
          __src[0] = xmmword_1B58AD16C;
          *(_OWORD *)((char *)__src + 12) = *(long long *)((char *)&xmmword_1B58AD16C + 12);
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)&__src[1] + 12, 7uLL);
          v258[0] = @"face";
          v258[1] = @"head";
          v258[2] = @"human_body";
          v258[3] = @"cat";
          v258[4] = @"dog";
          v258[5] = @"food";
          v258[6] = @"drink";
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v258, v259, 7uLL);
          for (uint64_t i1 = 6; i1 != -1; --i1)

LABEL_138:
          LODWORD(__src[1]) = 1051372203;
          __src[0] = xmmword_1B58AD1D0;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 264, (char *)__src, (uint64_t)&__src[1] + 4, 5uLL);
          *((_DWORD *)v12 + 64) = 5;
          __src[0] = xmmword_1B58AD188;
          *(void *)&__src[1] = 0x431F800042BF0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B58AD258;
          *(void *)&__src[1] = 0x433F800042FF0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          int v114 = 1068349147;
          goto LABEL_142;
        case 13:
          v12[196] = 0;
          *((_DWORD *)v12 + 47) = 0;
          *((_DWORD *)v12 + 50) = 12;
          __src[0] = xmmword_1B58AD1A0;
          __src[1] = unk_1B58AD1B0;
          long long v261 = xmmword_1B58AD1C0;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)&v262, 0xCuLL);
          v257[0] = @"1";
          v257[1] = @"2";
          v257[2] = @"3";
          v257[3] = @"4";
          v257[4] = @"5";
          v257[5] = @"6";
          v257[6] = @"7";
          v257[7] = @"8";
          v257[8] = @"9";
          v257[9] = @"10";
          v257[10] = @"11";
          v257[11] = @"12";
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v257, v258, 0xCuLL);
          for (uint64_t i2 = 11; i2 != -1; --i2)

LABEL_135:
          LODWORD(__src[1]) = 1051372203;
          __src[0] = xmmword_1B58AD1D0;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 264, (char *)__src, (uint64_t)&__src[1] + 4, 5uLL);
          *((_DWORD *)v12 + 64) = 5;
          __src[0] = xmmword_1B58AD258;
          *(void *)&__src[1] = 0x433F800042FF0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B58AD258;
          *(void *)&__src[1] = 0x433F800042FF0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          *((_DWORD *)v12 + 338) = 1065353216;
          goto LABEL_74;
        case 14:
          v12[196] = 0;
          *((_DWORD *)v12 + 47) = 0;
          v70 = [v225 filterThresholds];
          *((_DWORD *)v12 + 50) = [v70 count];

          v72 = v12 + 208;
          v71 = (void *)*((void *)v12 + 26);
          if (v71)
          {
            *((void *)v12 + 27) = v71;
            operator delete(v71);
            void *v72 = 0;
            *((void *)v12 + 27) = 0;
            *((void *)v12 + 28) = 0;
          }
          void *v72 = 0;
          *((void *)v12 + 27) = 0;
          *((void *)v12 + 28) = 0;
          memset(__src, 0, 24);
          v73 = (int64x2_t *)(v12 + 232);
          std::vector<NSString * {__strong}>::__vdeallocate((void **)v12 + 29);
          *((void *)v12 + 31) = *(void *)&__src[1];
          *(_OWORD *)(v12 + 232) = __src[0];
          memset(__src, 0, 24);
          *(void *)&long long v233 = __src;
          std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v233);
          unint64_t v74 = 0;
          while (1)
          {
            v75 = [v225 filterThresholds];
            BOOL v76 = [v75 count] > v74;

            if (!v76) {
              break;
            }
            ++v74;
            v78 = (_DWORD *)*((void *)v12 + 27);
            unint64_t v77 = *((void *)v12 + 28);
            if ((unint64_t)v78 >= v77)
            {
              v80 = (_DWORD *)*v72;
              uint64_t v81 = ((uint64_t)v78 - *v72) >> 2;
              unint64_t v82 = v81 + 1;
              if ((unint64_t)(v81 + 1) >> 62) {
                std::vector<BOOL>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v83 = v77 - (void)v80;
              if (v83 >> 1 > v82) {
                unint64_t v82 = v83 >> 1;
              }
              if ((unint64_t)v83 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v84 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v84 = v82;
              }
              if (v84)
              {
                v85 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v12 + 224), v84);
                v80 = (_DWORD *)*((void *)v12 + 26);
                v78 = (_DWORD *)*((void *)v12 + 27);
              }
              else
              {
                v85 = 0;
              }
              v86 = &v85[4 * v81];
              *(_DWORD *)v86 = v74;
              v79 = v86 + 4;
              while (v78 != v80)
              {
                int v87 = *--v78;
                *((_DWORD *)v86 - 1) = v87;
                v86 -= 4;
              }
              *((void *)v12 + 26) = v86;
              *((void *)v12 + 27) = v79;
              *((void *)v12 + 28) = &v85[4 * v84];
              if (v80) {
                operator delete(v80);
              }
            }
            else
            {
              _DWORD *v78 = v74;
              v79 = v78 + 1;
            }
            *((void *)v12 + 27) = v79;
            uint64_t v88 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v74);
            uint64_t v89 = v88;
            v91 = (uint64_t *)*((void *)v12 + 30);
            unint64_t v90 = *((void *)v12 + 31);
            if ((unint64_t)v91 >= v90)
            {
              uint64_t v93 = ((uint64_t)v91 - v73->i64[0]) >> 3;
              if ((unint64_t)(v93 + 1) >> 61) {
                std::vector<BOOL>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v94 = v90 - v73->i64[0];
              uint64_t v95 = v94 >> 2;
              if (v94 >> 2 <= (unint64_t)(v93 + 1)) {
                uint64_t v95 = v93 + 1;
              }
              if ((unint64_t)v94 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v96 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v96 = v95;
              }
              *(void *)&long long v261 = v12 + 248;
              if (v96) {
                v97 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v12 + 248), v96);
              }
              else {
                v97 = 0;
              }
              v98 = (uint64_t *)&v97[8 * v93];
              v99 = &v97[8 * v96];
              *((void *)&__src[1] + 1) = v99;
              uint64_t *v98 = v89;
              v92 = v98 + 1;
              *(void *)&__src[1] = v98 + 1;
              v101 = (void *)*((void *)v12 + 29);
              v100 = (void *)*((void *)v12 + 30);
              if (v100 == v101)
              {
                int64x2_t v103 = vdupq_n_s64((unint64_t)v100);
              }
              else
              {
                do
                {
                  uint64_t v102 = *--v100;
                  void *v100 = 0;
                  *--v98 = v102;
                }
                while (v100 != v101);
                int64x2_t v103 = *v73;
                v99 = (char *)*((void *)&__src[1] + 1);
                v92 = *(void **)&__src[1];
              }
              *((void *)v12 + 29) = v98;
              *((void *)v12 + 30) = v92;
              *(int64x2_t *)((char *)__src + 8) = v103;
              uint64_t v104 = *((void *)v12 + 31);
              *((void *)v12 + 31) = v99;
              *((void *)&__src[1] + 1) = v104;
              *(void *)&__src[0] = v103.i64[0];
              std::__split_buffer<NSString * {__strong}>::~__split_buffer((uint64_t)__src);
            }
            else
            {
              uint64_t *v91 = v88;
              v92 = v91 + 1;
            }
            *((void *)v12 + 30) = v92;
          }
          *((void *)v12 + 34) = *((void *)v12 + 33);
          long long v246 = 0u;
          long long v247 = 0u;
          long long v248 = 0u;
          long long v249 = 0u;
          v164 = [v225 ratios];
          uint64_t v165 = [v164 countByEnumeratingWithState:&v246 objects:v256 count:16];
          if (v165)
          {
            v166 = (void **)(v12 + 264);
            uint64_t v167 = *(void *)v247;
            do
            {
              for (uint64_t i3 = 0; i3 != v165; ++i3)
              {
                if (*(void *)v247 != v167) {
                  objc_enumerationMutation(v164);
                }
                [*(id *)(*((void *)&v246 + 1) + 8 * i3) floatValue];
                int v170 = v169;
                v172 = (char *)*((void *)v13 + 34);
                unint64_t v171 = *((void *)v13 + 35);
                if ((unint64_t)v172 >= v171)
                {
                  v174 = (char *)*v166;
                  uint64_t v175 = (v172 - (unsigned char *)*v166) >> 2;
                  unint64_t v176 = v175 + 1;
                  if ((unint64_t)(v175 + 1) >> 62) {
                    std::vector<BOOL>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v177 = v171 - (void)v174;
                  if (v177 >> 1 > v176) {
                    unint64_t v176 = v177 >> 1;
                  }
                  if ((unint64_t)v177 >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v178 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v178 = v176;
                  }
                  if (v178)
                  {
                    v179 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v223 + 280), v178);
                    v174 = (char *)*((void *)v13 + 33);
                    v172 = (char *)*((void *)v13 + 34);
                  }
                  else
                  {
                    v179 = 0;
                  }
                  v180 = &v179[4 * v175];
                  *(_DWORD *)v180 = v170;
                  v173 = v180 + 4;
                  while (v172 != v174)
                  {
                    int v181 = *((_DWORD *)v172 - 1);
                    v172 -= 4;
                    *((_DWORD *)v180 - 1) = v181;
                    v180 -= 4;
                  }
                  *((void *)v13 + 33) = v180;
                  *((void *)v13 + 34) = v173;
                  *((void *)v13 + 35) = &v179[4 * v178];
                  if (v174) {
                    operator delete(v174);
                  }
                }
                else
                {
                  *(_DWORD *)v172 = v169;
                  v173 = v172 + 4;
                }
                *((void *)v13 + 34) = v173;
              }
              uint64_t v165 = [v164 countByEnumeratingWithState:&v246 objects:v256 count:16];
            }
            while (v165);
          }

          v182 = [v225 ratios];
          *((_DWORD *)v13 + 64) = [v182 count];

          *((void *)v13 + 37) = *((void *)v13 + 36);
          *((void *)v13 + 40) = *((void *)v13 + 39);
          long long v242 = 0u;
          long long v243 = 0u;
          long long v244 = 0u;
          long long v245 = 0u;
          v183 = [v225 defaultBoxesSidesNormalized];
          uint64_t v184 = [v183 countByEnumeratingWithState:&v242 objects:v255 count:16];
          if (v184)
          {
            uint64_t v185 = *(void *)v243;
            do
            {
              for (uint64_t i4 = 0; i4 != v184; ++i4)
              {
                if (*(void *)v243 != v185) {
                  objc_enumerationMutation(v183);
                }
                v187 = *(void **)(*((void *)&v242 + 1) + 8 * i4);
                [v187 floatValue];
                int v189 = v188;
                v191 = (char *)*((void *)v13 + 40);
                unint64_t v190 = *((void *)v13 + 41);
                if ((unint64_t)v191 >= v190)
                {
                  v193 = (char *)*v227;
                  uint64_t v194 = (v191 - (unsigned char *)*v227) >> 2;
                  unint64_t v195 = v194 + 1;
                  if ((unint64_t)(v194 + 1) >> 62) {
                    std::vector<BOOL>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v196 = v190 - (void)v193;
                  if (v196 >> 1 > v195) {
                    unint64_t v195 = v196 >> 1;
                  }
                  if ((unint64_t)v196 >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v197 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v197 = v195;
                  }
                  if (v197)
                  {
                    v198 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v223 + 328), v197);
                    v193 = (char *)*((void *)v13 + 39);
                    v191 = (char *)*((void *)v13 + 40);
                  }
                  else
                  {
                    v198 = 0;
                  }
                  v199 = &v198[4 * v194];
                  *(_DWORD *)v199 = v189;
                  v192 = v199 + 4;
                  while (v191 != v193)
                  {
                    int v200 = *((_DWORD *)v191 - 1);
                    v191 -= 4;
                    *((_DWORD *)v199 - 1) = v200;
                    v199 -= 4;
                  }
                  *((void *)v13 + 39) = v199;
                  *((void *)v13 + 40) = v192;
                  *((void *)v13 + 41) = &v198[4 * v197];
                  if (v193) {
                    operator delete(v193);
                  }
                }
                else
                {
                  *(_DWORD *)v191 = v188;
                  v192 = v191 + 4;
                }
                *((void *)v13 + 40) = v192;
                [v187 floatValue];
                float v202 = v201 * 488.0;
                v204 = (float *)*((void *)v13 + 37);
                unint64_t v203 = *((void *)v13 + 38);
                if ((unint64_t)v204 >= v203)
                {
                  v206 = (float *)*v229;
                  uint64_t v207 = ((char *)v204 - (unsigned char *)*v229) >> 2;
                  unint64_t v208 = v207 + 1;
                  if ((unint64_t)(v207 + 1) >> 62) {
                    std::vector<BOOL>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v209 = v203 - (void)v206;
                  if (v209 >> 1 > v208) {
                    unint64_t v208 = v209 >> 1;
                  }
                  if ((unint64_t)v209 >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v210 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v210 = v208;
                  }
                  if (v210)
                  {
                    v211 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v223 + 304), v210);
                    v206 = (float *)*((void *)v13 + 36);
                    v204 = (float *)*((void *)v13 + 37);
                  }
                  else
                  {
                    v211 = 0;
                  }
                  v212 = (float *)&v211[4 * v207];
                  float *v212 = v202;
                  v205 = v212 + 1;
                  while (v204 != v206)
                  {
                    int v213 = *((_DWORD *)v204-- - 1);
                    *((_DWORD *)v212-- - 1) = v213;
                  }
                  *((void *)v13 + 36) = v212;
                  *((void *)v13 + 37) = v205;
                  *((void *)v13 + 38) = &v211[4 * v210];
                  if (v206) {
                    operator delete(v206);
                  }
                }
                else
                {
                  float *v204 = v202;
                  v205 = v204 + 1;
                }
                *((void *)v13 + 37) = v205;
              }
              uint64_t v184 = [v183 countByEnumeratingWithState:&v242 objects:v255 count:16];
            }
            while (v184);
          }

          __src[0] = xmmword_1B58AD258;
          *(void *)&__src[1] = 0x433F800042FF0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v223 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B58AD258;
          *(void *)&__src[1] = 0x433F800042FF0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v223 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          int IsPad = AXDeviceIsPad();
          goto LABEL_71;
        default:
          __src[0] = xmmword_1B58AD1E4;
          *(void *)&__src[1] = 0x432B800042D70000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B58AD1FC;
          *(void *)&__src[1] = 0x433B800042F70000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          *((_DWORD *)v12 + 47) = 0;
          v12[196] = 1;
          v12[198] = 0;
          *((_DWORD *)v12 + 50) = 1;
          LODWORD(__src[0]) = 1;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)__src + 4, 1uLL);
          v254 = @"face";
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), (void **)&v254, v255, 1uLL);

          LODWORD(__src[0]) = 1065353216;
          int v16 = 1;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 264, (char *)__src, (uint64_t)__src + 4, 1uLL);
LABEL_140:
          *((_DWORD *)v12 + 64) = v16;
LABEL_141:
          int v114 = 1068149419;
LABEL_142:
          *((_DWORD *)v12 + 338) = v114;
          break;
      }
    }
    uint64_t context = espresso_create_context();
    *((void *)v13 + 3) = context;
    if (!context || (plauint64_t n = espresso_create_plan(), (*((void *)v13 + 2) = plan) == 0))
    {
      exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1BA9A0B00](exception, "esp error");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    [v224 UTF8String];
    if (espresso_plan_add_network() || espresso_plan_build())
    {
      v221 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1BA9A0B00](v221, "esp error");
      __cxa_throw(v221, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    memset(__src, 0, sizeof(__src));
    if (espresso_network_query_blob_dimensions())
    {
      v222 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1BA9A0B00](v222, "esp error");
      __cxa_throw(v222, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    unint64_t v117 = 0;
    v226 = (uint64_t *)(v223 + 48);
    v228 = v223 + 344;
    v230 = (float *)(v223 + 348);
    do
    {
      if (v117 >= *((int *)v13 + 47))
      {
        v123 = (char *)operator new(0xC0uLL);
        *((void *)v123 + 1) = 0;
        *((void *)v123 + 2) = 0;
        *(void *)v123 = &unk_1F0E703D0;
        *(_OWORD *)(v123 + 40) = 0u;
        *(_OWORD *)(v123 + 56) = 0u;
        *(_OWORD *)(v123 + 72) = 0u;
        *(_OWORD *)(v123 + 88) = 0u;
        *(_OWORD *)(v123 + 104) = 0u;
        *(_OWORD *)(v123 + 120) = 0u;
        *(_OWORD *)(v123 + 136) = 0u;
        *(_OWORD *)(v123 + 152) = 0u;
        *(_OWORD *)(v123 + 168) = 0u;
        *((void *)v123 + 23) = 0;
        *(_OWORD *)(v123 + 24) = 0u;
        *(void *)&long long v233 = v123 + 24;
        *((void *)&v233 + 1) = v123;
        objc_msgSend(NSString, "stringWithFormat:", @"logits_%ld", v117);
        id v122 = objc_claimAutoreleasedReturnValue();
        [v122 UTF8String];
        if (espresso_network_bind_buffer())
        {
          v219 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1BA9A0B00](v219, "esp error");
          __cxa_throw(v219, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        std::vector<std::shared_ptr<espresso_buffer_t>>::push_back[abi:ne180100](v226, &v233);
      }
      else
      {
        v118 = (char *)operator new(0xC0uLL);
        *((void *)v118 + 1) = 0;
        *((void *)v118 + 2) = 0;
        *(void *)v118 = &unk_1F0E703D0;
        *(_OWORD *)(v118 + 40) = 0u;
        *(_OWORD *)(v118 + 56) = 0u;
        *(_OWORD *)(v118 + 72) = 0u;
        *(_OWORD *)(v118 + 88) = 0u;
        *(_OWORD *)(v118 + 104) = 0u;
        *(_OWORD *)(v118 + 120) = 0u;
        *(_OWORD *)(v118 + 136) = 0u;
        *(_OWORD *)(v118 + 152) = 0u;
        *(_OWORD *)(v118 + 168) = 0u;
        *((void *)v118 + 23) = 0;
        *(_OWORD *)(v118 + 24) = 0u;
        *(void *)&long long v233 = v118 + 24;
        *((void *)&v233 + 1) = v118;
        objc_msgSend(NSString, "stringWithFormat:", @"logits_pos_%ld", v117);
        id v119 = objc_claimAutoreleasedReturnValue();
        [v119 UTF8String];
        if (espresso_network_bind_buffer())
        {
          v218 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1BA9A0B00](v218, "esp error");
          __cxa_throw(v218, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        std::vector<std::shared_ptr<espresso_buffer_t>>::push_back[abi:ne180100](v226, &v233);
        v120 = (char *)operator new(0xC0uLL);
        *((void *)v120 + 1) = 0;
        *((void *)v120 + 2) = 0;
        *(void *)v120 = &unk_1F0E703D0;
        *(_OWORD *)(v120 + 40) = 0u;
        *(_OWORD *)(v120 + 56) = 0u;
        *(_OWORD *)(v120 + 72) = 0u;
        *(_OWORD *)(v120 + 88) = 0u;
        *(_OWORD *)(v120 + 104) = 0u;
        *(_OWORD *)(v120 + 120) = 0u;
        *(_OWORD *)(v120 + 136) = 0u;
        *(_OWORD *)(v120 + 152) = 0u;
        *(_OWORD *)(v120 + 168) = 0u;
        *((void *)v120 + 23) = 0;
        *(_OWORD *)(v120 + 24) = 0u;
        *(void *)&long long v232 = v120 + 24;
        *((void *)&v232 + 1) = v120;
        v121 = objc_msgSend(NSString, "stringWithFormat:", @"logits_neg_%ld", v117);

        id v122 = v121;
        [v122 UTF8String];
        if (espresso_network_bind_buffer())
        {
          v217 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1BA9A0B00](v217, "esp error");
          __cxa_throw(v217, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        std::vector<std::shared_ptr<espresso_buffer_t>>::push_back[abi:ne180100]((uint64_t *)v223 + 9, &v232);
        if (*((void *)&v232 + 1)) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v232 + 1));
        }
      }
      if (*((void *)&v233 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v233 + 1));
      }
      v124 = (char *)operator new(0xC0uLL);
      *((void *)v124 + 1) = 0;
      *((void *)v124 + 2) = 0;
      *(void *)v124 = &unk_1F0E703D0;
      *(_OWORD *)(v124 + 40) = 0u;
      *(_OWORD *)(v124 + 56) = 0u;
      *(_OWORD *)(v124 + 72) = 0u;
      *(_OWORD *)(v124 + 88) = 0u;
      *(_OWORD *)(v124 + 104) = 0u;
      *(_OWORD *)(v124 + 120) = 0u;
      *(_OWORD *)(v124 + 136) = 0u;
      *(_OWORD *)(v124 + 152) = 0u;
      *(_OWORD *)(v124 + 168) = 0u;
      *((void *)v124 + 23) = 0;
      *(_OWORD *)(v124 + 24) = 0u;
      *(void *)&long long v233 = v124 + 24;
      *((void *)&v233 + 1) = v124;
      v125 = objc_msgSend(NSString, "stringWithFormat:", @"offsets_%ld", v117);

      id v126 = v125;
      [v126 UTF8String];
      if (espresso_network_bind_buffer())
      {
        v214 = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1BA9A0B00](v214, "esp error");
        __cxa_throw(v214, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      std::vector<std::shared_ptr<espresso_buffer_t>>::push_back[abi:ne180100]((uint64_t *)v223 + 12, &v233);
      if (v13[196])
      {
        v127 = (char *)operator new(0xC0uLL);
        *((void *)v127 + 1) = 0;
        *((void *)v127 + 2) = 0;
        *(void *)v127 = &unk_1F0E703D0;
        *(_OWORD *)(v127 + 40) = 0u;
        *(_OWORD *)(v127 + 56) = 0u;
        *(_OWORD *)(v127 + 72) = 0u;
        *(_OWORD *)(v127 + 88) = 0u;
        *(_OWORD *)(v127 + 104) = 0u;
        *(_OWORD *)(v127 + 120) = 0u;
        *(_OWORD *)(v127 + 136) = 0u;
        *(_OWORD *)(v127 + 152) = 0u;
        *(_OWORD *)(v127 + 168) = 0u;
        *((void *)v127 + 23) = 0;
        *(_OWORD *)(v127 + 24) = 0u;
        *(void *)&long long v232 = v127 + 24;
        *((void *)&v232 + 1) = v127;
        v128 = objc_msgSend(NSString, "stringWithFormat:", @"logits_roll_%ld", v117);

        id v129 = v128;
        [v129 UTF8String];
        if (espresso_network_bind_buffer())
        {
          v215 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1BA9A0B00](v215, "esp error");
          __cxa_throw(v215, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        std::vector<std::shared_ptr<espresso_buffer_t>>::push_back[abi:ne180100]((uint64_t *)v223 + 15, &v232);
        v130 = (char *)operator new(0xC0uLL);
        *((void *)v130 + 1) = 0;
        *((void *)v130 + 2) = 0;
        *(void *)v130 = &unk_1F0E703D0;
        *(_OWORD *)(v130 + 40) = 0u;
        *(_OWORD *)(v130 + 56) = 0u;
        *(_OWORD *)(v130 + 72) = 0u;
        *(_OWORD *)(v130 + 88) = 0u;
        *(_OWORD *)(v130 + 104) = 0u;
        *(_OWORD *)(v130 + 120) = 0u;
        *(_OWORD *)(v130 + 136) = 0u;
        *(_OWORD *)(v130 + 152) = 0u;
        *(_OWORD *)(v130 + 168) = 0u;
        *((void *)v130 + 23) = 0;
        *(_OWORD *)(v130 + 24) = 0u;
        *(void *)&long long v231 = v130 + 24;
        *((void *)&v231 + 1) = v130;
        v131 = objc_msgSend(NSString, "stringWithFormat:", @"logits_yaw_%ld", v117);

        id v126 = v131;
        [v126 UTF8String];
        if (espresso_network_bind_buffer())
        {
          v216 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1BA9A0B00](v216, "esp error");
          __cxa_throw(v216, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        std::vector<std::shared_ptr<espresso_buffer_t>>::push_back[abi:ne180100]((uint64_t *)v223 + 18, &v231);
        if (*((void *)&v231 + 1)) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v231 + 1));
        }
        if (*((void *)&v232 + 1)) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v232 + 1));
        }
      }
      uint64_t v132 = *((void *)v13 + 36);
      float v133 = (float)(*(float *)(v132 + 4 * v117) * *((float *)v13 + 340)) / 488.0;
      unint64_t v134 = *((int *)v13 + 64);
      if (v134)
      {
        v135 = (float *)*((void *)v13 + 33);
        v136 = v230;
        uint64_t v137 = *((int *)v13 + 64);
        do
        {
          float v138 = *v135++;
          float v139 = sqrtf(v138);
          *(v136 - 1) = v133 * v139;
          float *v136 = v133 / v139;
          v136 += 2;
          --v137;
        }
        while (v137);
      }
      if (v117 < 5)
      {
        if (v13[198])
        {
          int v140 = NUMBER_DEFAULT[v117];
          v141 = (float *)((char *)*v227 + 4 * v117);
          long double v142 = *v141;
          long double v143 = v141[1];
          if (v134 <= 1) {
            uint64_t v144 = 1;
          }
          else {
            uint64_t v144 = v134;
          }
          if (v140 <= 2) {
            uint64_t v145 = 2;
          }
          else {
            uint64_t v145 = v140;
          }
          v146 = (float *)&v228[8 * v134];
          for (uint64_t i5 = 1; i5 != v145; ++i5)
          {
            if (v134)
            {
              double v148 = pow(v143, (double)(int)i5);
              long double v149 = pow(v142, (double)(v140 - (int)i5));
              float v150 = pow(v148 * v149, 1.0 / (double)v140);
              v151 = (float *)*((void *)v13 + 33);
              float v152 = v150 * 488.0;
              v153 = v146;
              uint64_t v154 = v144;
              do
              {
                float v155 = *v151++;
                float v156 = sqrtf(v155);
                float *v153 = v152 * v156;
                v153[1] = v152 / v156;
                v153 += 2;
                --v154;
              }
              while (v154);
            }
            v146 += 2 * v134;
          }
        }
        else if (v134)
        {
          float v157 = sqrtf((float)((float)(v133 * *(float *)(v132 + 4 * v117 + 4)) * *((float *)v13 + 340)) / 488.0);
          v158 = (float *)*((void *)v13 + 33);
          uint64_t v159 = 2 * v134;
          do
          {
            float v160 = *v158++;
            float v161 = sqrtf(v160);
            *(float *)&v228[v159 * 4] = v157 * v161;
            v230[v159] = v157 / v161;
            v159 += 2;
            --v134;
          }
          while (v134);
        }
      }
      if (*((void *)&v233 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v233 + 1));
      }

      ++v117;
      v228 += 160;
      v230 += 40;
    }
    while (v117 != 6);
    *(_OWORD *)(v13 + 168) = __src[0];
    v162 = v13;
  }

  return (AXShotflowNetwork *)v13;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)AXShotflowNetwork;
  [(AXShotflowNetwork *)&v3 dealloc];
}

- (int)setInputShape:(unint64_t)a3 height:(unint64_t)a4
{
  int v4 = a4;
  int v5 = a3;
  if (*(_OWORD *)&self->_currentNetworkWidth == __PAIR128__(a4, a3)) {
    return 0;
  }
  LODWORD(v19) = a4;
  HIDWORD(v19) = a3;
  uint64_t v18 = 0x300000001;
  v17 = "image";
  int v7 = espresso_plan_build_clean();
  if (!v7)
  {
    int v7 = espresso_network_change_input_blob_shapes();
    if (!v7)
    {
      int v7 = espresso_plan_build();
      if (!v7)
      {
        uint64_t v8 = 0;
        unint64_t v9 = 0;
        while (1)
        {
          if (v9 >= self->_maxout_layers)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"logits_%ld", v9, v17, v18, v19);
            id v10 = objc_claimAutoreleasedReturnValue();
            [v10 UTF8String];
            int v12 = espresso_network_bind_buffer();
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"logits_pos_%ld", v9);
            id v10 = objc_claimAutoreleasedReturnValue();
            [v10 UTF8String];
            int v7 = espresso_network_bind_buffer();
            if (v7) {
              break;
            }
            id v11 = objc_msgSend(NSString, "stringWithFormat:", @"logits_neg_%ld", v9);

            id v10 = v11;
            [v10 UTF8String];
            int v12 = espresso_network_bind_buffer();
          }
          int v7 = v12;
          if (v12) {
            break;
          }
          id v13 = objc_msgSend(NSString, "stringWithFormat:", @"offsets_%ld", v9);

          id v10 = v13;
          [v10 UTF8String];
          int v7 = espresso_network_bind_buffer();
          if (v7) {
            break;
          }
          if (self->_has_pose)
          {
            v14 = objc_msgSend(NSString, "stringWithFormat:", @"logits_roll_%ld", v9);

            id v10 = v14;
            [v10 UTF8String];
            int v7 = espresso_network_bind_buffer();
            if (v7) {
              break;
            }
            int v15 = objc_msgSend(NSString, "stringWithFormat:", @"logits_yaw_%ld", v9);

            id v10 = v15;
            [v10 UTF8String];
            int v7 = espresso_network_bind_buffer();
            if (v7) {
              break;
            }
          }

          ++v9;
          v8 += 16;
          if (v9 == 6)
          {
            int v7 = 0;
            self->_currentNetworkWidth = v5;
            self->_currentNetworkHeight = v4;
            return v7;
          }
        }
      }
    }
  }
  return v7;
}

- (void)runNetwork:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  if (espresso_network_bind_input_vimagebuffer_bgra8() || espresso_plan_execute_sync())
  {
    exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1BA9A0B00](exception, "esp error");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
}

- (id)processVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  BOOL v4 = a4;
  vImagePixelCount height = a3->height;
  vImagePixelCount width = a3->width;
  if ([(AXShotflowNetwork *)self setInputShape:width height:height])
  {
    exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1BA9A0B00](exception, "esp error");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  v71 = [MEMORY[0x1E4F1C9C8] now];
  long long v9 = *(_OWORD *)&a3->width;
  v94[0] = *(_OWORD *)&a3->data;
  v94[1] = v9;
  [(AXShotflowNetwork *)self runNetwork:v94 inputIsBGR:v4];
  id v10 = [MEMORY[0x1E4F1C9C8] now];
  [v10 timeIntervalSinceDate:v71];
  double v12 = v11;

  id v88 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(AXShotflowNetwork *)self threshold];
  float v14 = v13;
  if (v13 == 1.0)
  {
    v68 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1BA9A0B00](v68, "esp error");
    __cxa_throw(v68, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  unint64_t v15 = 0;
  double v70 = v12 * 1000.0;
  float v91 = (float)width;
  float v90 = (float)height;
  float v87 = v13;
  do
  {
    uint64_t v16 = 16 * v15;
    uint64_t v17 = *((void *)self->_logitsPosOutputs.__begin_ + 2 * v15);
    uint64_t v18 = *(float **)v17;
    unint64_t v92 = v15;
    if (v15 >= self->_maxout_layers)
    {
      v20 = &v18[*(void *)(v17 + 136)];
      uint64_t v74 = *(void *)(v17 + 136);
      uint64_t v75 = v74;
    }
    else
    {
      uint64_t v19 = *((void *)self->_logitsNegOutputs.__begin_ + 2 * v15);
      v20 = *(float **)v17;
      uint64_t v18 = *(float **)v19;
      uint64_t v74 = *(void *)(v17 + 136);
      uint64_t v75 = *(void *)(v19 + 136);
    }
    if (self->_has_pose)
    {
      uint64_t v83 = **((void **)self->_rollOutputs.__begin_ + 2 * v15);
      uint64_t v82 = **((void **)self->_yawOutputs.__begin_ + 2 * v15);
    }
    else
    {
      uint64_t v82 = 0;
      uint64_t v83 = 0;
    }
    int num_ratios = self->_num_ratios;
    if (self->_extra_default_boxes)
    {
      int v22 = 3 * num_ratios;
      if (v92 >= 5) {
        int v22 = self->_num_ratios;
      }
      int v23 = 4 * num_ratios;
      if (v92) {
        int v24 = v22;
      }
      else {
        int v24 = v23;
      }
      if (self->_has_pose)
      {
LABEL_17:
        uint64_t v25 = *(void *)(*(void *)((char *)self->_rollOutputs.__begin_ + v16) + 136);
        uint64_t v26 = *(void *)(*(void *)((char *)self->_yawOutputs.__begin_ + v16) + 136);
        goto LABEL_20;
      }
    }
    else
    {
      int v24 = num_ratios << (v92 != 5);
      if (self->_has_pose) {
        goto LABEL_17;
      }
    }
    uint64_t v25 = 0;
    uint64_t v26 = 0;
LABEL_20:
    uint64_t v27 = *(void *)((char *)self->_offsetsOutputs.__begin_ + v16);
    v28 = *(float **)v27;
    uint64_t v84 = *(void *)(v17 + 80);
    uint64_t v77 = *(void *)(v17 + 88);
    float v76 = self->_cell_starts_y.__begin_[v92];
    float v80 = self->_cell_starts_x.__begin_[v92];
    float v81 = STRIDES[v92];
    uint64_t v89 = *(void *)(v27 + 136);
    std::vector<float>::vector(v93, self->_num_pos_classes + 1);
    uint64_t v73 = v24;
    if (v24)
    {
      uint64_t v79 = 0;
      uint64_t v72 = 4 * v26;
      uint64_t v29 = 4 * v75;
      do
      {
        if (v77)
        {
          unint64_t v78 = 0;
          unint64_t v30 = self->_defaultBoxSizes[v92][v79];
          do
          {
            if (v84)
            {
              for (unint64_t i = 0; i != v84; ++i)
              {
                v86 = v18;
                if (v92 >= self->_maxout_layers)
                {
                  float v33 = *v18;
                }
                else
                {
                  uint64_t bins_neg_maxout = self->_bins_neg_maxout;
                  if (bins_neg_maxout)
                  {
                    float v33 = 1.1755e-38;
                    v34 = v18;
                    do
                    {
                      float v33 = fmaxf(v33, *v34);
                      v34 = (float *)((char *)v34 + v29);
                      --bins_neg_maxout;
                    }
                    while (bins_neg_maxout);
                  }
                  else
                  {
                    float v33 = 1.1755e-38;
                  }
                }
                int v35 = (float *)v93[0];
                *(float *)v93[0] = v33;
                int num_pos_classes = self->_num_pos_classes;
                if (num_pos_classes >= 1)
                {
                  v37 = v35 + 1;
                  uint64_t v38 = self->_num_pos_classes;
                  uint64_t v39 = v20;
                  do
                  {
                    float v33 = fmaxf(v33, *v39);
                    *v37++ = *(_DWORD *)v39;
                    v39 += v74;
                    --v38;
                  }
                  while (v38);
                }
                v85 = v20;
                if (num_pos_classes < 0)
                {
                  float v41 = 0.0;
                }
                else
                {
                  uint64_t v40 = (num_pos_classes + 1);
                  float v41 = 0.0;
                  do
                  {
                    float v42 = expf(*v35 - v33);
                    *v35++ = v42;
                    float v41 = v41 + v42;
                    --v40;
                  }
                  while (v40);
                }
                begiuint64_t n = self->_important_classes.__begin_;
                end = self->_important_classes.__end_;
                if (end != begin)
                {
                  unint64_t v45 = 0;
                  do
                  {
                    uint64_t v46 = begin[v45];
                    float v47 = *((float *)v93[0] + v46) / v41;
                    if (v47 > v14)
                    {
                      float v48 = *v30;
                      float v49 = v30[1];
                      float v50 = v28[v89];
                      float v51 = *v28;
                      float v52 = v28[2 * v89];
                      float v53 = v28[3 * v89];
                      int v54 = [AXElementDetection alloc];
                      float v55 = v49 / v90;
                      float v56 = v48 / v91;
                      float v57 = v55 * expf(v53);
                      float v58 = v56 * expf(v52);
                      *(float *)&uint64_t v69 = v47;
                      v59 = -[AXElementDetection initWithBox:defaultBox:confidence:scale:hasLabel:label:labelName:](v54, "initWithBox:defaultBox:confidence:scale:hasLabel:label:labelName:", v92, (int *)((char *)self->_important_classes.__end_ - (char *)self->_important_classes.__begin_) > (int *)4, v46, self->_model_labels.__begin_[v45], (float)((float)((float)((float)(v80 + (float)((float)i * v81)) / v91) + (float)(v51 * v56))- (float)(v58 * 0.5)), (float)((float)(1.0- (float)((float)((float)(v76 + (float)((float)v78 * v81)) / v90)+ (float)(v50 * v55)))- (float)(v57 * 0.5)), v58, v57, (float)((float)((float)(v80 + (float)((float)i * v81)) / v91) - (float)(v56 * 0.5)), (float)((float)(1.0 - (float)((float)(v76 + (float)((float)v78 * v81)) / v90))- (float)(v55 * 0.5)), v56, v55,
                              v69);
                      [v88 addObject:v59];

                      begiuint64_t n = self->_important_classes.__begin_;
                      end = self->_important_classes.__end_;
                      float v14 = v87;
                    }
                    ++v45;
                  }
                  while (v45 < end - begin);
                }
                if (self->_has_pose)
                {
                  uint64_t v61 = v85;
                  v60 = v86;
                  uint64_t v29 = 4 * v75;
                  if (!self->_pose_square || v79 == 5 || !v79)
                  {
                    v82 += 4;
                    v83 += 4;
                  }
                }
                else
                {
                  uint64_t v61 = v85;
                  v60 = v86;
                  uint64_t v29 = 4 * v75;
                }
                v20 = v61 + 1;
                uint64_t v18 = v60 + 1;
                ++v28;
              }
            }
            ++v78;
          }
          while (v78 != v77);
        }
        if (v92 >= self->_maxout_layers)
        {
          uint64_t v63 = self->_num_pos_classes;
          uint64_t v62 = v63;
        }
        else
        {
          uint64_t v62 = self->_bins_neg_maxout - 1;
          uint64_t v63 = self->_num_pos_classes - 1;
        }
        if (self->_has_pose && (!self->_pose_square || v79 == 5 || !v79))
        {
          v83 += 44 * v25;
          v82 += 4 * v72;
        }
        v18 += v62 * v75;
        v20 += v63 * v74;
        v28 += 3 * v89;
        ++v79;
      }
      while (v79 != v73);
    }
    if (v93[0])
    {
      v93[1] = v93[0];
      operator delete(v93[0]);
    }
    unint64_t v15 = v92 + 1;
  }
  while (v92 != 5);
  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v64 setValue:v88 forKey:@"boxes"];
  v65 = [NSNumber numberWithDouble:v70];
  [v64 setValue:v65 forKey:@"timing"];

  return v64;
}

- (id)resizeAndProcessVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  vImagePixelCount height = a3->height;
  vImagePixelCount width = a3->width;
  if (width) {
    BOOL v8 = height == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1BA9A0B00](exception, "Invalid input");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  BOOL v9 = a4;
  v5.n128_f32[0] = (float)width;
  v4.n128_f32[0] = (float)height;
  if (self->_can_rotate && v4.n128_f32[0] > v5.n128_f32[0])
  {
    LODWORD(backColor.data) = 0;
    if (MEMORY[0x1BA9A1800](&dest, v5.n128_f32[0], v4.n128_f32[0], 32, 0))
    {
      float v56 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1BA9A0B00](v56, "Intermediate buffer allocation failed");
      __cxa_throw(v56, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    vImageRotate90_ARGB8888(a3, &dest, 1u, (const uint8_t *)&backColor, 0);
    v5.n128_f32[0] = (float)dest.width;
    v4.n128_f32[0] = (float)dest.height;
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
    long long v13 = *(_OWORD *)&a3->width;
    *(_OWORD *)&dest.data = *(_OWORD *)&a3->data;
    *(_OWORD *)&dest.vImagePixelCount width = v13;
  }
  input_vImagePixelCount height = self->_input_height;
  float input_aspect_ratio = self->_input_aspect_ratio;
  unint64_t v16 = (unint64_t)(float)(input_height * input_aspect_ratio);
  unint64_t v17 = (unint64_t)input_height;
  unint64_t v18 = v16;
  unint64_t v19 = (unint64_t)input_height;
  if (self->_keep_aspect_ratio)
  {
    if ((float)(v5.n128_f32[0] / v4.n128_f32[0]) >= input_aspect_ratio)
    {
      v4.n128_f32[0] = (float)(v4.n128_f32[0] / v5.n128_f32[0]) * (float)v16;
      unint64_t v19 = (unint64_t)v4.n128_f32[0];
      unint64_t v18 = (unint64_t)(float)(input_height * input_aspect_ratio);
    }
    else
    {
      v4.n128_f32[0] = (float)(v5.n128_f32[0] / v4.n128_f32[0]) * (float)v17;
      unint64_t v18 = (unint64_t)v4.n128_f32[0];
      unint64_t v19 = (unint64_t)input_height;
    }
  }
  if (MEMORY[0x1BA9A1800](&backColor, v19, v18, 32, 0, v4, v5))
  {
    float v53 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1BA9A0B00](v53, "Intermediate buffer allocation failed");
    __cxa_throw(v53, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  vImageScale_ARGB8888(&dest, &backColor, 0, 0x20u);
  if (MEMORY[0x1BA9A1800](&v63, v17, v16, 32, 0))
  {
    int v54 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1BA9A0B00](v54, "Intermediate buffer allocation failed");
    __cxa_throw(v54, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  *(_DWORD *)color = -16777216;
  if (vImageBufferFill_ARGB8888(&v63, color, 0))
  {
    float v55 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1BA9A0B00](v55, "esp error");
    __cxa_throw(v55, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (SLODWORD(backColor.height) >= 1)
  {
    uint64_t v20 = 0;
    do
    {
      memcpy((char *)v63.data + v63.rowBytes * v20, (char *)backColor.data + backColor.rowBytes * v20, 4 * backColor.width);
      ++v20;
    }
    while (v20 < SLODWORD(backColor.height));
  }
  if (v16 > 0x4000 || v17 > 0x4000)
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  else
  {
    vImage_Buffer v61 = v63;
    id v21 = [(AXShotflowNetwork *)self processVImage:&v61 inputIsBGR:v9];
    [v21 objectForKeyedSubscript:@"boxes"];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v22 countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v58 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          objc_msgSend(v26, "box", (void)v57);
          double v29 = v28;
          double v30 = (float)((float)v63.width / (float)backColor.width);
          double v32 = v31 * v30;
          double v33 = 1.0 - (1.0 - v27) * (float)v63.height / (float)backColor.height;
          double v35 = v34 * v30;
          double v36 = v29 * (float)((float)v63.height / (float)backColor.height);
          if (v12)
          {
            double v37 = 1.0 - (v32 + v35);
            double v38 = v36;
          }
          else
          {
            double v38 = v35;
            double v35 = v36;
            double v37 = 1.0 - (1.0 - v27) * (float)v63.height / (float)backColor.height;
            double v33 = v32;
          }
          objc_msgSend(v26, "setBox:", v33, v37, v38, v35);
          [v26 defaultBox];
          double v41 = v40;
          double v42 = (float)((float)v63.width / (float)backColor.width);
          double v44 = v43 * v42;
          double v45 = 1.0 - (1.0 - v39) * (float)v63.height / (float)backColor.height;
          double v47 = v46 * v42;
          double v48 = v41 * (float)((float)v63.height / (float)backColor.height);
          if (v12)
          {
            double v49 = 1.0 - (v44 + v47);
            double v50 = v48;
          }
          else
          {
            double v50 = v47;
            double v47 = v48;
            double v49 = 1.0 - (1.0 - v39) * (float)v63.height / (float)backColor.height;
            double v45 = v44;
          }
          objc_msgSend(v26, "setDefaultBox:", v45, v49, v50, v47);
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v57 objects:v66 count:16];
      }
      while (v23);
    }

    free(v63.data);
    v63.data = 0;
    free(backColor.data);
    backColor.data = 0;
    if (v12)
    {
      free(dest.data);
      dest.data = 0;
    }
  }

  return v21;
}

- (id)processCIImage:(id)a3
{
  id v4 = a3;
  [v4 extent];
  float v7 = v6;
  if (v7 == 0.0 || (float v8 = v5, v8 == 0.0))
  {
    exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1BA9A0B00](exception, "esp error");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  BOOL v9 = +[AXShotflowHelpers createVImageBuffer:v4];
  long long v10 = *(_OWORD *)&v9->width;
  v14[0] = *(_OWORD *)&v9->data;
  v14[1] = v10;
  double v11 = [(AXShotflowNetwork *)self resizeAndProcessVImage:v14 inputIsBGR:0];
  if (v9->data) {
    free(v9->data);
  }
  MEMORY[0x1BA9A0B70](v9, 0x1080C40ABB4582ELL);

  return v11;
}

- (float)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_versiouint64_t n = a3;
}

- (int64_t)modelType
{
  return self->_modelType;
}

- (void)setModelType:(int64_t)a3
{
  self->_modelType = a3;
}

- (void).cxx_destruct
{
  begiuint64_t n = self->_cell_starts_y.__begin_;
  if (begin)
  {
    self->_cell_starts_y.__end_ = begin;
    operator delete(begin);
  }
  id v4 = self->_cell_starts_x.__begin_;
  if (v4)
  {
    self->_cell_starts_x.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_filterThreshold, 0);
  double v5 = self->_default_boxes_sides_normalized.__begin_;
  if (v5)
  {
    self->_default_boxes_sides_normalized.__end_ = v5;
    operator delete(v5);
  }
  double v6 = self->_default_boxes_sides.__begin_;
  if (v6)
  {
    self->_default_boxes_sides.__end_ = v6;
    operator delete(v6);
  }
  float v7 = self->_ratios.__begin_;
  if (v7)
  {
    self->_ratios.__end_ = v7;
    operator delete(v7);
  }
  p_begiuint64_t n = (void **)&self->_model_labels.__begin_;
  std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  float v8 = self->_important_classes.__begin_;
  if (v8)
  {
    self->_important_classes.__end_ = v8;
    operator delete(v8);
  }
  p_begiuint64_t n = &self->_yawOutputs.__begin_;
  std::vector<std::shared_ptr<espresso_buffer_t>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begiuint64_t n = &self->_rollOutputs.__begin_;
  std::vector<std::shared_ptr<espresso_buffer_t>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begiuint64_t n = &self->_offsetsOutputs.__begin_;
  std::vector<std::shared_ptr<espresso_buffer_t>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begiuint64_t n = &self->_logitsNegOutputs.__begin_;
  std::vector<std::shared_ptr<espresso_buffer_t>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begiuint64_t n = &self->_logitsPosOutputs.__begin_;
  std::vector<std::shared_ptr<espresso_buffer_t>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
}

- (id).cxx_construct
{
  *((void *)self + 20) = 0;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((void *)self + 41) = 0;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 1304) = 0u;
  *(_OWORD *)((char *)self + 1320) = 0u;
  *(_OWORD *)((char *)self + 1336) = 0u;
  return self;
}

@end