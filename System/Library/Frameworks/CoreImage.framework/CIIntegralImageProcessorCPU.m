@interface CIIntegralImageProcessorCPU
+ (BOOL)canReduceOutputChannels;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (int)outputFormat;
@end

@implementation CIIntegralImageProcessorCPU

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend(a3, "objectAtIndex:", 0, a4, a5, a6);
  if ([v7 format] != 2312
    && [v7 format] != 2056
    && [v7 format] != 266
    && [v7 format] != 264)
  {
    v64 = ci_logger_filter();
    BOOL v24 = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);
    if (!v24) {
      return v24;
    }
    +[CIIntegralImageProcessorCPU processWithInputs:arguments:output:error:].cold.7(v7);
LABEL_50:
    LOBYTE(v24) = 0;
    return v24;
  }
  if ([a5 format] != 2312)
  {
    v23 = ci_logger_filter();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (!v24) {
      return v24;
    }
    +[CIIntegralImageProcessorCPU processWithInputs:arguments:output:error:].cold.6(a5);
    goto LABEL_50;
  }
  uint64_t v8 = [a5 bytesPerRow];
  [a5 region];
  float v10 = v9;
  __vImage_Buffer src = (char *)malloc_type_calloc(v8, vcvtps_u32_f32(v10), 0x5D1A6159uLL);
  if (!__src)
  {
    v25 = ci_logger_filter();
    BOOL v24 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (!v24) {
      return v24;
    }
    +[CIIntegralImageProcessorCPU processWithInputs:arguments:output:error:](a5, v8, v25);
    goto LABEL_50;
  }
  [v7 region];
  double v12 = v11;
  [a5 region];
  if (v12 != v13) {
    +[CIIntegralImageProcessorCPU processWithInputs:arguments:output:error:]();
  }
  [v7 region];
  double v15 = v14;
  [a5 region];
  if (v15 != v16) {
    +[CIIntegralImageProcessorCPU processWithInputs:arguments:output:error:]();
  }
  [v7 region];
  float v18 = v17;
  unint64_t v19 = vcvtps_u32_f32(v18);
  [v7 region];
  double v21 = v20;
  uint64_t v67 = v8;
  if ([v7 format] == 2312)
  {
    uint64_t v22 = 16;
  }
  else
  {
    int v26 = [v7 format];
    uint64_t v22 = 4;
    if (v26 == 2056) {
      uint64_t v22 = 8;
    }
  }
  uint64_t v72 = v22;
  int v27 = objc_msgSend(v7, "format", a5);
  if (v19)
  {
    uint64_t v28 = 0;
    unsigned int v68 = 0;
    float v29 = v21;
    unint64_t v30 = vcvtps_u32_f32(v29);
    uint64_t v69 = 2 * (v27 == 266);
    uint64_t v70 = 2 * (v27 != 266);
    v71 = v7;
    do
    {
      if (v30)
      {
        unint64_t v31 = 0;
        uint64_t v32 = v28 * v67;
        unint64_t v33 = ~v28 + v19;
        unint64_t v34 = v68 - 1;
        unint64_t v74 = v67 * v34;
        unsigned int v35 = 1;
        do
        {
          uint64_t v36 = [v7 baseAddress];
          uint64_t v37 = [v7 bytesPerRow];
          if (v33 >= v19) {
            v38 = 0;
          }
          else {
            v38 = (unsigned char *)(v36 + v31 * v72 + v37 * v33);
          }
          long long v77 = 0uLL;
          if ([v7 format] == 2056)
          {
            *(_OWORD *)&src.height = xmmword_19394CBA0;
            src.rowBytes = 8;
            dest.data = &v77;
            *(_OWORD *)&dest.height = xmmword_19394CBA0;
            dest.rowBytes = 16;
            src.data = v38;
            vImageConvert_Planar16FtoPlanarF(&src, &dest, 0x10u);
          }
          else if ([v7 format] == 266 || objc_msgSend(v7, "format") == 264)
          {
            LOBYTE(v39) = v38[v69];
            *(float *)&unsigned int v40 = (float)v39 / 255.0;
            LODWORD(v77) = v40;
            LOBYTE(v40) = v38[1];
            *(float *)&unsigned int v41 = (float)v40 / 255.0;
            DWORD1(v77) = v41;
            LOBYTE(v41) = v38[v70];
            *(float *)&unsigned int v42 = (float)v41 / 255.0;
            DWORD2(v77) = v42;
            LOBYTE(v42) = v38[3];
            *((float *)&v77 + 3) = (float)v42 / 255.0;
          }
          else
          {
            if ([v7 format] != 2312) {
              +[CIIntegralImageProcessorCPU processWithInputs:arguments:output:error:].cold.5();
            }
            long long v77 = *(_OWORD *)v38;
          }
          v43 = (float *)&__src[16 * v31 + v32];
          float v44 = v43[1];
          float *v43 = *(float *)&v77 + *v43;
          v43[1] = *((float *)&v77 + 1) + v44;
          float v45 = v43[3];
          uint64_t v46 = 16 * v31;
          v43[2] = *((float *)&v77 + 2) + v43[2];
          v43[3] = *((float *)&v77 + 3) + v45;
          unint64_t v47 = v35 - 2;
          if (v47 >= v30) {
            v48 = 0;
          }
          else {
            v48 = (float *)&__src[16 * v47 + v32];
          }
          addPixel<float>(v43, v48);
          if (v34 >= v19) {
            v49 = 0;
          }
          else {
            v49 = (float *)&__src[v46 + v74];
          }
          addPixel<float>(v43, v49);
          if (v34 < v19 && v47 < v30)
          {
            v50 = (float *)&__src[16 * v35 - 32 + v74];
            float v51 = v43[1];
            float *v43 = *v43 - *v50;
            v43[1] = v51 - v50[1];
            float v52 = v43[3];
            v43[2] = v43[2] - v50[2];
            v43[3] = v52 - v50[3];
          }
          unint64_t v31 = v35++;
          v7 = v71;
        }
        while (v31 < v30);
      }
      uint64_t v28 = ++v68;
    }
    while (v68 < v19);
  }
  [v66 region];
  double v54 = v53;
  [v66 region];
  double v56 = v55;
  if ([v66 format] != 2312) {
    +[CIIntegralImageProcessorCPU processWithInputs:arguments:output:error:].cold.4();
  }
  float v57 = v54;
  unint64_t v58 = vcvtps_u32_f32(v57);
  uint64_t v59 = [v66 baseAddress];
  if (v58)
  {
    float v60 = v56;
    size_t v61 = 16 * vcvtps_u32_f32(v60);
    v62 = (char *)(v59 + v67 * (v58 - 1));
    v63 = __src;
    do
    {
      memcpy(v62, v63, v61);
      v63 += v67;
      v62 -= v67;
      --v58;
    }
    while (v58);
  }
  free(__src);
  LOBYTE(v24) = 1;
  return v24;
}

+ (int)outputFormat
{
  return 2312;
}

+ (BOOL)canReduceOutputChannels
{
  return 1;
}

+ (float)processWithInputs:(NSObject *)a3 arguments:output:error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [a1 region];
  float v6 = v5;
  int v8 = 136446466;
  double v9 = "integral_image_manual";
  __int16 v10 = 2048;
  uint64_t v11 = a2 * (int)vcvtps_s32_f32(v6);
  _os_log_error_impl(&dword_193671000, a3, OS_LOG_TYPE_ERROR, "%{public}s Could not allocate %lu bytes of memory", (uint8_t *)&v8, 0x16u);
  return result;
}

+ (void)processWithInputs:arguments:output:error:.cold.2()
{
  __assert_rtn("integral_image_manual", "CIIntegralImage.mm", 185, "input.region.size.width == output.region.size.width");
}

+ (void)processWithInputs:arguments:output:error:.cold.3()
{
  __assert_rtn("integral_image_manual", "CIIntegralImage.mm", 186, "input.region.size.height == output.region.size.height");
}

+ (void)processWithInputs:arguments:output:error:.cold.4()
{
}

+ (void)processWithInputs:arguments:output:error:.cold.5()
{
}

+ (void)processWithInputs:(void *)a1 arguments:output:error:.cold.6(void *a1)
{
  [a1 format];
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_12_0(&dword_193671000, v1, v2, "%{public}s Output format not supported: %d", v3, v4, v5, v6, 2u);
}

+ (void)processWithInputs:(void *)a1 arguments:output:error:.cold.7(void *a1)
{
  [a1 format];
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_12_0(&dword_193671000, v1, v2, "%{public}s Input format not supported: %d", v3, v4, v5, v6, 2u);
}

@end