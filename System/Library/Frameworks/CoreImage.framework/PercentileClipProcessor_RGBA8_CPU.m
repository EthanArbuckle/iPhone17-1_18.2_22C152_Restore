@interface PercentileClipProcessor_RGBA8_CPU
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)canReduceOutputChannels;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (CGPoint)centerInImg:(id)a3 fromRect:(CGRect)a4 toRect:(CGRect)a5 offset:(CGPoint)a6;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation PercentileClipProcessor_RGBA8_CPU

+ (int)outputFormat
{
  return 266;
}

+ (int)formatForInputAtIndex:(int)a3
{
  if ((a3 - 1) < 2)
  {
    v3 = &kCIFormatRGBAh;
    return *v3;
  }
  if ((a3 - 3) < 2)
  {
    v3 = &kCIFormatR8;
    return *v3;
  }
  if (!a3)
  {
    v3 = &kCIFormatBGRA8;
    return *v3;
  }
  return 0;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  if ((a3 - 1) >= 2)
  {
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"roi", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, v5, v6), "CGRectValue");
  }
  else
  {
    double v7 = 1.0;
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 1.0;
  }
  result.size.height = v10;
  result.size.width = v7;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

+ (BOOL)canReduceOutputChannels
{
  return 0;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (CGPoint)centerInImg:(id)a3 fromRect:(CGRect)a4 toRect:(CGRect)a5 offset:(CGPoint)a6
{
  double height = a5.size.height;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&src.double height = xmmword_19394CBA0;
  src.rowBytes = 8;
  dest.data = v13;
  *(_OWORD *)&dest.double height = xmmword_19394CBA0;
  dest.rowBytes = 16;
  src.data = objc_msgSend(a3, "baseAddress", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.origin.x, a5.origin.y, a5.size.width);
  vImageConvert_Planar16FtoPlanarF(&src, &dest, 0x10u);
  double v9 = roundf(v13[0]) - v15 - x;
  double v10 = height - (roundf(v13[1]) - v16 - y) + -1.0;
  result.double y = v10;
  result.double x = v9;
  return result;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v220 = *MEMORY[0x1E4F143B8];
  double v10 = (void *)[a4 objectForKeyedSubscript:@"threshold"];
  v176 = (void *)[a4 objectForKeyedSubscript:@"area"];
  v11 = (void *)[a4 objectForKeyedSubscript:@"centerOffsetLeft"];
  v12 = (void *)[a4 objectForKeyedSubscript:@"centerOffsetRight"];
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"interPeakMinRepair"), "floatValue");
  float v180 = v13;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"abortMaxCenterDist"), "floatValue");
  float log = v14;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"densityRadius"), "floatValue");
  float v181 = v15;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"minDensity"), "floatValue");
  float v182 = v16;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"maxRelDensity"), "floatValue");
  float v183 = v17;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"minGobalLocalMeanDiff"), "floatValue");
  float v175 = v18;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"percentileRepair"), "floatValue");
  float v179 = v19;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"percentileSpecular"), "floatValue");
  float v178 = v20;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"percentRepair"), "floatValue");
  float v177 = v21;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"percentSpecular"), "floatValue");
  float v184 = v22;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"centerExtentLeft"), "CGRectValue");
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"centerExtentRight"), "CGRectValue");
  v201 = v32;
  double v204 = v31;
  v196 = v34;
  double v199 = v33;
  v35 = (void *)[a3 objectAtIndexedSubscript:0];
  [v35 format];
  [a5 format];
  [v35 region];
  double v188 = v37;
  double v190 = v36;
  v187 = (unsigned __int8 *)[v35 baseAddress];
  unint64_t v186 = [v35 bytesPerRow];
  clearOutput(a5);
  v38 = (void *)[a3 objectAtIndexedSubscript:1];
  v39 = (void *)[a3 objectAtIndexedSubscript:2];
  if ([v38 format] == 2056) {
    [v39 format];
  }
  [v35 region];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  [v11 CGPointValue];
  objc_msgSend(a1, "centerInImg:fromRect:toRect:offset:", v38, v24, v26, v28, v30, v41, v43, v45, v47, v48, v49);
  double v51 = v50;
  double v53 = v52;
  [v35 region];
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;
  [v12 CGPointValue];
  objc_msgSend(a1, "centerInImg:fromRect:toRect:offset:", v39, v204, *(double *)&v201, v199, *(double *)&v196, v55, v57, v59, v61, v62, v63);
  double v65 = v64;
  double v67 = v66;
  char v68 = 0;
  [v35 region];
  float v70 = v69 * 0.5;
  [v35 region];
  float v72 = v71 * 0.5;
  double v73 = v70;
  double v74 = vabdd_f64(v51, v70);
  double v75 = (float)(v70 * 0.8);
  if (v74 > v75 || vabdd_f64(v53, v72) > (float)(v72 * 0.8))
  {
    if (CI_LOG_DUALRED())
    {
      v76 = ci_logger_api();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:]6();
      }
    }
    char v68 = 1;
  }
  if (vabdd_f64(v65, v73) > v75 || vabdd_f64(v67, v72) > (float)(v72 * 0.8))
  {
    if (CI_LOG_DUALRED())
    {
      v77 = ci_logger_api();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:]();
      }
    }
    return 1;
  }
  if (v68) {
    return 1;
  }
  unint64_t v78 = (unint64_t)v190;
  unint64_t v79 = (unint64_t)v188;
  v80 = (void *)[a3 objectAtIndexedSubscript:3];
  uint64_t v81 = [a3 objectAtIndexedSubscript:4];
  if ([v80 format] == 261) {
    [v80 format];
  }
  float v82 = (v53 - v67) / (double)v79 * ((v53 - v67) / (double)v79)
      + (v51 - v65) / (double)v78 * ((v51 - v65) / (double)v78);
  if (sqrtf(v82) > log)
  {
    if (CI_LOG_DUALRED())
    {
      v83 = ci_logger_api();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:](v83, v84, v85, v86, v87, v88, v89, v90);
      }
    }
    return 1;
  }
  src.data = v187;
  src.double height = (unint64_t)v188;
  src.width = (unint64_t)v190;
  src.rowBytes = v186;
  v93 = (vImagePixelCount *)malloc_type_calloc(0x400uLL, 8uLL, 0x100004000313F17uLL);
  histogram[0] = v93;
  histogram[1] = v93 + 256;
  histogram[2] = v93 + 512;
  histogram[3] = v93 + 768;
  vImage_Error v94 = vImageHistogramCalculation_ARGB8888(&src, histogram, 0);
  BOOL v91 = v94 == 0;
  if (v94)
  {
    free(v93);
    return v91;
  }
  v200 = v80;
  v191 = (void *)v81;
  v96 = histogram[0];
  v95 = histogram[1];
  v202 = histogram[3];
  loga = histogram[2];
  unsigned int v205 = (int)(float)(v177 * findPercentileNonZero(histogram[2], v179, 0xFFuLL, 0x100uLL));
  unsigned int v97 = (int)(float)(v184 * findPercentileNonZero(v95, v178, 0xFFuLL, 0x100uLL));
  v197 = v96;
  float v98 = v177 * findPercentileNonZero(v96, v179, 0xFFuLL, 0x100uLL);
  float PercentileNonZero = findPercentileNonZero(v202, v178, 0xFFuLL, 0x100uLL);
  [v10 X];
  double v101 = (double)v205;
  if (v100 * 255.0 > (double)v205)
  {
    [v10 X];
    double v101 = v102 * 255.0;
  }
  float v103 = v184 * PercentileNonZero;
  unsigned int v104 = (int)v98;
  [v10 Y];
  double v106 = (double)v97;
  if (v105 * 255.0 > (double)v97)
  {
    [v10 Y];
    double v106 = v107 * 255.0;
  }
  double v189 = v106;
  unsigned int v108 = (int)v103;
  [v10 Z];
  double v110 = v109 * 255.0;
  double v111 = (double)v104;
  if (v110 > (double)v104)
  {
    [v10 Z];
    double v111 = v112 * 255.0;
  }
  unsigned int v206 = (int)v101;
  unsigned int v203 = (int)v111;
  [v10 W];
  double v114 = (double)v108;
  if (v113 * 255.0 > (double)v108)
  {
    [v10 W];
    double v114 = v115 * 255.0;
  }
  double v185 = v114;
  int v116 = (int)findPercentileNonZero(loga, 0.25, 0xFFuLL, 0x100uLL);
  float v117 = findPercentileNonZero(v197, 0.25, 0xFFuLL, 0x100uLL);
  unsigned __int8 v198 = v206 - v116;
  unsigned int v118 = v203 - (int)v117;
  if ((v206 - v116) >= (v203 - (int)v117)) {
    unsigned int v119 = (v203 - (int)v117);
  }
  else {
    unsigned int v119 = (v206 - v116);
  }
  unsigned int v120 = (int)(float)(v180 * 255.0);
  if (v119 < v120)
  {
    if (CI_LOG_DUALRED())
    {
      logb = ci_logger_api();
      if (os_log_type_enabled(logb, OS_LOG_TYPE_ERROR)) {
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:]5(v119, v120, logb);
      }
    }
  }
  free(v93);
  v121 = v187;
  unsigned int v122 = v187[(unint64_t)(v51 * 4.0 + v53 * (double)v186 + 2.0)];
  double v123 = v65 * 4.0 + v67 * (double)v186 + 0.0;
  unsigned int v124 = v187[(unint64_t)v123];
  float v125 = (float)v122;
  float v126 = (float)v206 * 0.5;
  float v127 = (float)v124;
  float v128 = (float)v203 * 0.5;
  if (v126 >= (float)v122 || v128 >= v127)
  {
    int v129 = CI_LOG_DUALRED();
    v121 = v187;
    if (v129)
    {
      logc = ci_logger_api();
      BOOL v130 = os_log_type_enabled(logc, OS_LOG_TYPE_ERROR);
      v121 = v187;
      if (v130)
      {
        *(float *)buf = 4.8756e-34;
        v210 = "+[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:]";
        __int16 v211 = 1024;
        unsigned int v212 = v122;
        __int16 v213 = 1024;
        unsigned int v214 = v206;
        __int16 v215 = 1024;
        unsigned int v216 = v124;
        __int16 v217 = 1024;
        unsigned int v218 = v203;
        _os_log_error_impl(&dword_193671000, logc, OS_LOG_TYPE_ERROR, "%{public}s [abort] Center pixel failed: L = %hhu < %hhu | R = %hhu < %hhu", buf, 0x24u);
        v121 = v187;
      }
    }
  }
  BOOL v132 = v128 >= v127 || v120 > v118;
  if (v78 >= v79) {
    unint64_t v133 = v79;
  }
  else {
    unint64_t v133 = v78;
  }
  unint64_t v134 = (unint64_t)(float)(v181 * (float)v133);
  *(float *)buf = 0.0;
  float v207 = 0.0;
  int v135 = 1;
  if (v120 > v198)
  {
    float v138 = v182;
    float v137 = v183;
  }
  else
  {
    BOOL v136 = v126 < v125;
    float v138 = v182;
    float v137 = v183;
    if (v136)
    {
      v221.double x = v51;
      v221.double y = v53;
      computeDensity(v121, 2u, v78, v79, v186, v206, v221, v134, (float *)buf);
      if (CI_LOG_DUALRED())
      {
        v139 = ci_logger_api();
        if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR)) {
          +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:]4();
        }
      }
      if (*(float *)buf >= v182)
      {
        int v135 = 0;
      }
      else if (CI_LOG_DUALRED())
      {
        v140 = ci_logger_api();
        if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR)) {
          +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:]3();
        }
      }
      v121 = v187;
    }
  }
  if (v132)
  {
    int v141 = 1;
    v142 = v200;
  }
  else
  {
    v222.double x = v65;
    v222.double y = v67;
    computeDensity(v121, 0, v78, v79, v186, v203, v222, v134, &v207);
    if (CI_LOG_DUALRED())
    {
      v143 = ci_logger_api();
      if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR)) {
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:]2();
      }
    }
    v142 = v200;
    if (v207 >= v138)
    {
      int v141 = 0;
    }
    else
    {
      if (CI_LOG_DUALRED())
      {
        v144 = ci_logger_api();
        if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR)) {
          +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:]1();
        }
      }
      int v141 = 1;
    }
  }
  if (*(float *)buf > v137)
  {
    if (CI_LOG_DUALRED())
    {
      v145 = ci_logger_api();
      if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR)) {
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:]0();
      }
    }
    int v135 = 1;
  }
  *(float *)&double v123 = v207;
  if (v207 > v137)
  {
    if (CI_LOG_DUALRED())
    {
      v146 = ci_logger_api();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.9();
      }
    }
    int v141 = 1;
  }
  if (v135 & v141) {
    return v91;
  }
  float v147 = -1.0;
  float v148 = -1.0;
  if ((v135 & 1) == 0)
  {
    sampleUnderCentroid(v142, v51, v53, 0.14);
    float v148 = *(float *)&v123;
  }
  if ((v141 & 1) == 0)
  {
    sampleUnderCentroid(v191, v65, v67, 0.14);
    float v147 = *(float *)&v123;
  }
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"minInterDispersion", v123), "floatValue");
  float v150 = v149;
  if (v148 < v149)
  {
    if (CI_LOG_DUALRED())
    {
      v151 = ci_logger_api();
      if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR)) {
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.8(v148);
      }
    }
    int v135 = 1;
  }
  if (v147 < v150)
  {
    if (CI_LOG_DUALRED())
    {
      v152 = ci_logger_api();
      if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR)) {
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.7(v147);
      }
    }
    int v141 = 1;
  }
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"maxInterDispersion"), "floatValue");
  double v154 = vabds_f32(v148, v147);
  double v155 = (float)(v148 + v147);
  if (v155 < 0.000001) {
    double v155 = 0.000001;
  }
  float v156 = v154 / v155;
  if (v153 >= v156) {
    char v157 = 1;
  }
  else {
    char v157 = v135;
  }
  if ((v141 & 1) == 0 && (v157 & 1) == 0)
  {
    int v158 = CI_LOG_DUALRED();
    if (v147 >= v148)
    {
      if (v158)
      {
        v164 = ci_logger_api();
        if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR)) {
          +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.6(v156);
        }
      }
    }
    else if (v158)
    {
      v159 = ci_logger_api();
      if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR)) {
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.5(v156);
      }
    }
    return v91;
  }
  if ((v141 | v135)) {
    return v91;
  }
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"areaMaxRatio"), "floatValue");
  float v161 = v160;
  if (v160 > 0.0)
  {
    v162 = v176;
    v163 = v191;
LABEL_121:
    [v162 Y];
    radialFillRGBA8_circular(v35, a5, 1, 0, (unint64_t)v166, 0.2, v51, v53);
    goto LABEL_122;
  }
  v162 = v176;
  [v176 Y];
  v163 = v191;
  if (radialFillRGBA8(v35, a5, 1, (int)v189, (unint64_t)v165, v51, v53) <= 8) {
    goto LABEL_121;
  }
LABEL_122:
  clipRepair(v35, a5, 2, v206);
  calculateMeans(v142, a5, 2, v51, v53);
  if (v167 < v175)
  {
    float v173 = v167;
    if (CI_LOG_DUALRED())
    {
      v174 = ci_logger_api();
      if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR)) {
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.4(v173);
      }
    }
    goto LABEL_133;
  }
  if (v161 > 0.0
    || ([v162 W], radialFillRGBA8(v35, a5, 3, (int)v185, (unint64_t)v168, v65, v67) <= 8))
  {
    [v162 W];
    radialFillRGBA8_circular(v35, a5, 3, 0, (unint64_t)v169, 0.2, v65, v67);
  }
  clipRepair(v35, a5, 0, v203);
  calculateMeans(v163, a5, 0, v65, v67);
  if (v170 < v175)
  {
    float v171 = v170;
    if (CI_LOG_DUALRED())
    {
      v172 = ci_logger_api();
      if (os_log_type_enabled(v172, OS_LOG_TYPE_ERROR)) {
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:](v171);
      }
    }
LABEL_133:
    clearOutput(a5);
  }
  return v91;
}

+ (void)processWithInputs:arguments:output:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_3(&dword_193671000, v0, v1, "%{public}s [abort] Centroid distance from R center failed: (%.0f, %.0f)", v2, v3, v4, v5, 2u);
}

+ (void)processWithInputs:(uint64_t)a3 arguments:(uint64_t)a4 output:(uint64_t)a5 error:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)processWithInputs:(float)a1 arguments:output:error:.cold.3(float a1)
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8], a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v1, v2, "%{public}s [abort] Mask response (R) too close to global: %.0f%%", v3, v4, v5, v6, 2u);
}

+ (void)processWithInputs:(float)a1 arguments:output:error:.cold.4(float a1)
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8], a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v1, v2, "%{public}s [abort] Mask response (L) too close to global: %.0f%%", v3, v4, v5, v6, 2u);
}

+ (void)processWithInputs:(float)a1 arguments:output:error:.cold.5(float a1)
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8], a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v1, v2, "%{public}s [abort] Maximum inter dispersion reached: %.3f. Eliminating right.", v3, v4, v5, v6, 2u);
}

+ (void)processWithInputs:(float)a1 arguments:output:error:.cold.6(float a1)
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8], a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v1, v2, "%{public}s [abort] Maximum inter dispersion reached: %.3f. Eliminating left.", v3, v4, v5, v6, 2u);
}

+ (void)processWithInputs:(float)a1 arguments:output:error:.cold.7(float a1)
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8], a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v1, v2, "%{public}s [abort] Minimum dispersion not reached (R): %.3f", v3, v4, v5, v6, 2u);
}

+ (void)processWithInputs:(float)a1 arguments:output:error:.cold.8(float a1)
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8], a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v1, v2, "%{public}s [abort] Minimum dispersion not reached (L): %.3f", v3, v4, v5, v6, 2u);
}

+ (void)processWithInputs:arguments:output:error:.cold.9()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_193671000, v1, v2, "%{public}s [abort] Maximum density failed (right): %.4f > %.4f", v3, v4, v5, v6, v7);
}

+ (void)processWithInputs:arguments:output:error:.cold.10()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_193671000, v1, v2, "%{public}s [abort] Maximum density failed (left): %.4f > %.4f", v3, v4, v5, v6, v7);
}

+ (void)processWithInputs:arguments:output:error:.cold.11()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_193671000, v1, v2, "%{public}s [abort] Minimum density failed (right): %.4f < %.4f", v3, v4, v5, v6, v7);
}

+ (void)processWithInputs:arguments:output:error:.cold.12()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_193671000, v1, v2, "%{public}s Density (right): %.4f < %.4f", v3, v4, v5, v6, v7);
}

+ (void)processWithInputs:arguments:output:error:.cold.13()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_193671000, v1, v2, "%{public}s [abort] Minimum density failed (left): %.4f < %.4f", v3, v4, v5, v6, v7);
}

+ (void)processWithInputs:arguments:output:error:.cold.14()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_193671000, v1, v2, "%{public}s Density (left): %.4f < %.4f", v3, v4, v5, v6, v7);
}

+ (void)processWithInputs:(os_log_t)log arguments:output:error:.cold.15(int a1, int a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136446978;
  uint64_t v4 = "+[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:]";
  __int16 v5 = 2048;
  uint64_t v6 = 0x3FD0000000000000;
  __int16 v7 = 1024;
  int v8 = a1;
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "%{public}s [abort] Interpeak percentile distance failed at p=%.2f: %hhu < %hhu", (uint8_t *)&v3, 0x22u);
}

+ (void)processWithInputs:arguments:output:error:.cold.16()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_3(&dword_193671000, v0, v1, "%{public}s [abort] Centroid distance from L center failed: (%.0f, %.0f)", v2, v3, v4, v5, 2u);
}

+ (void)processWithInputs:(uint64_t)a3 arguments:(uint64_t)a4 output:(uint64_t)a5 error:(uint64_t)a6 .cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end