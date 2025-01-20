@interface CIPortraitSkinMaskProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
- (CIImage)inputImage;
- (NSDictionary)inputFaceLandmarks;
- (void)setInputFaceLandmarks:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIPortraitSkinMaskProcessor

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputImageExtent"), "CGRectValue");
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"faceROI"), "CGRectValue");
  if ((CGRectIsIntegral() & 1) == 0) {
    sub_4CCA8();
  }
  unsigned __int8 v17 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"useMetal"), "BOOLValue");
  id v18 = [a4 objectForKeyedSubscript:@"faceLandmarks"];
  uint64_t v19 = self;
  id v20 = sub_3E090(v19, (uint64_t)v18);
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputImageTransformN1"), "getBytes:length:", &v230, 48);
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputImageTransform1N"), "getBytes:length:", &v229, 48);
  CGAffineTransform v228 = v230;
  v254.origin.double x = v10;
  v254.origin.double y = v12;
  v254.size.double width = v14;
  v254.size.double height = v16;
  CGRect v255 = CGRectApplyAffineTransform(v254, &v228);
  double x = v255.origin.x;
  double y = v255.origin.y;
  double height = v255.size.height;
  double width = v255.size.width;
  id v23 = [a3 objectAtIndexedSubscript:0];
  [v23 region];
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  double v164 = v16 + -1.0;
  CGFloat v31 = v16 + -1.0 - v30 - v28;
  [a5 region];
  double v144 = v16 + -1.0 - v32 - v34;
  double v145 = v33;
  v261.origin.double x = v33 + 1.0;
  v261.origin.double y = v144 + 1.0;
  double v148 = v35;
  double v149 = v34;
  v261.size.double width = v35 + -2.0;
  v261.size.double height = v34 + -2.0;
  v256.origin.double x = v25;
  v256.origin.double y = v31;
  v256.size.double width = v27;
  v256.size.double height = v29;
  CGRect v257 = CGRectIntersection(v256, v261);
  double v154 = v257.origin.y;
  double v155 = v257.origin.x;
  double v156 = v257.size.height;
  double v157 = v257.size.width;
  if ((sub_294F0([v20 objectForKeyedSubscript:@"faceBoundingBox"], &v225) & 1) == 0) {
    sub_4CC7C();
  }
  v36.f64[0] = width;
  double v225 = x + v225 * width;
  double v226 = y + v226 * height;
  v36.f64[1] = height;
  float64x2_t v227 = vmulq_f64(v36, v227);
  id v37 = objc_msgSend(objc_msgSend(v20, "objectForKeyedSubscript:", @"leftPupil"), "objectAtIndex:", 0);
  if ((sub_295D4(v37, &v223, v225, v226, v227.f64[0], v227.f64[1]) & 1) == 0) {
    sub_4CC50();
  }
  id v38 = objc_msgSend(objc_msgSend(v20, "objectForKeyedSubscript:", @"rightPupil"), "objectAtIndex:", 0);
  if ((sub_295D4(v38, &v221, v225, v226, v227.f64[0], v227.f64[1]) & 1) == 0) {
    sub_4CC24();
  }
  id v39 = [v20 objectForKeyedSubscript:@"innerLips"];
  long long v217 = 0u;
  long long v218 = 0u;
  long long v219 = 0u;
  long long v220 = 0u;
  id v40 = [v39 countByEnumeratingWithState:&v217 objects:v249 count:16];
  if (v40)
  {
    id v41 = v40;
    unsigned int v42 = 0;
    uint64_t v43 = *(void *)v218;
    double v44 = 0.0;
    double v45 = 0.0;
    do
    {
      for (i = 0; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v218 != v43) {
          objc_enumerationMutation(v39);
        }
        if (sub_295D4(*(void **)(*((void *)&v217 + 1) + 8 * i), &v165, v225, v226, v227.f64[0], v227.f64[1]))
        {
          double v45 = v45 + v165;
          double v44 = v44 + v166;
          ++v42;
        }
      }
      id v41 = [v39 countByEnumeratingWithState:&v217 objects:v249 count:16];
    }
    while (v41);
  }
  else
  {
    unsigned int v42 = 0;
    double v44 = 0.0;
    double v45 = 0.0;
  }
  if (v42 <= 1) {
    unsigned int v47 = 1;
  }
  else {
    unsigned int v47 = v42;
  }
  double v48 = v44 / (double)v47;
  double v49 = v222;
  double v50 = v224;
  float v51 = sqrt((v222 - v224) * (v222 - v224) + (v221 - v223) * (v221 - v223));
  double v52 = v221 + (v223 - v221) * 0.5;
  double v53 = v222 + (v224 - v222) * 0.5;
  float v54 = sqrt((v53 - v48) * (v53 - v48) + (v52 - v45 / (double)v47) * (v52 - v45 / (double)v47));
  double v55 = v51;
  if (v51 >= 0.01) {
    double v56 = (v221 - v223) / v51;
  }
  else {
    double v56 = 0.0;
  }
  if (v51 >= 0.01) {
    double v57 = (v222 - v224) / v51;
  }
  else {
    double v57 = 0.0;
  }
  double v162 = (float)(v51 * -0.25);
  float v58 = v54 * 0.15;
  double v159 = v58;
  double v59 = v57 * v58;
  double v60 = (float)(v54 * 0.5);
  double v153 = v223 + v56 * v162 + v57 * v60;
  double v150 = v223 + v56 * v162 + v59;
  double v151 = v221 + v59 - v56 * v162;
  double v152 = v221 + v57 * v60 - v56 * v162;
  v258.origin.double x = v225 + v227.f64[0] * -0.305999994;
  v258.origin.double y = v226 + v227.f64[1] * -0.300000012;
  v258.size.double width = v227.f64[0] + v227.f64[0] * 0.611999989;
  v258.size.double height = v227.f64[1] + v227.f64[1] * 0.75;
  CGAffineTransform v216 = v229;
  CGRect v259 = CGRectApplyAffineTransform(v258, &v216);
  v259.origin.double y = v164 - v259.origin.y - v259.size.height;
  v262.origin.double y = v154;
  v262.origin.double x = v155;
  v262.size.double height = v156;
  v262.size.double width = v157;
  CGRect v260 = CGRectIntersection(v259, v262);
  double v138 = v260.origin.y;
  double v139 = v260.origin.x;
  double v146 = v260.size.width;
  double v147 = v260.size.height;
  uint64_t v61 = 0;
  *(float *)&v260.origin.double x = v55 * 0.3;
  double v62 = v52 + 0.0;
  double v63 = v53 + *(float *)&v260.origin.x;
  long long v64 = *(_OWORD *)&v229.a;
  long long v65 = *(_OWORD *)&v229.c;
  long long v66 = *(_OWORD *)&v229.tx;
  float v67 = v55 * 0.03;
  double v68 = v67;
  double v69 = v56 * v67;
  double v70 = v57 * v68;
  do
  {
    v71 = (double *)&v248[v61];
    double *v71 = *(double *)&v66 + v63 * *(double *)&v65 + *(double *)&v64 * v62;
    v71[1] = v164 - (*((double *)&v66 + 1) + v63 * *((double *)&v65 + 1) + *((double *)&v64 + 1) * v62);
    double v62 = v62 - v70;
    double v63 = v69 + v63;
    v61 += 16;
  }
  while (v61 != 64);
  uint64_t v72 = 0;
  *(double *)&uint64_t v73 = v50 + v57 * v162 - v56 * v159;
  *(double *)&uint64_t v74 = v49 + -(v56 * v159) - v57 * v162;
  *(double *)&uint64_t v75 = v49 + -(v56 * v60) - v57 * v162;
  *(double *)&uint64_t v76 = *(double *)&v74 - *(double *)&v75;
  double v143 = v50 + v57 * v162 - v56 * v60;
  float64x2_t v163 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v151 - v150), 0);
  float64x2_t v160 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v150, 0);
  float64x2_t v77 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(double *)&v74 - *(double *)&v73), 0);
  double v140 = *(double *)&v73;
  double v141 = *(double *)&v74;
  float64x2_t v78 = (float64x2_t)vdupq_lane_s64(v73, 0);
  float64x2_t v79 = (float64x2_t)vdupq_lane_s64(v64, 0);
  float64x2_t v80 = (float64x2_t)vdupq_lane_s64(v66, 0);
  float64x2_t v81 = (float64x2_t)vdupq_lane_s64(*((uint64_t *)&v64 + 1), 0);
  float64x2_t v82 = (float64x2_t)vdupq_lane_s64(*((uint64_t *)&v66 + 1), 0);
  float64x2_t v83 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v164, 0);
  float64x2_t v84 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v152 - v151), 0);
  float64x2_t v85 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v151, 0);
  float64x2_t v86 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(double *)&v75 - *(double *)&v74), 0);
  float64x2_t v87 = (float64x2_t)vdupq_lane_s64(v74, 0);
  float64x2_t v88 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v153 - v152), 0);
  float64x2_t v89 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v152, 0);
  float64x2_t v90 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v143 - *(double *)&v75), 0);
  double v142 = *(double *)&v75;
  float64x2_t v91 = (float64x2_t)vdupq_lane_s64(v75, 0);
  float64x2_t v92 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v151 - v152), 0);
  float64x2_t v93 = (float64x2_t)vdupq_lane_s64(v76, 0);
  int32x2_t v94 = (int32x2_t)0x100000000;
  do
  {
    __asm { FMOV            V8.2S, #0.25 }
    float64x2_t v100 = vcvtq_f64_f32(vmul_f32(vcvt_f32_s32(v94), _D8));
    float64x2_t v101 = vmlaq_f64(v160, v163, v100);
    float64x2_t v102 = vmlaq_f64(v78, v77, v100);
    v251.val[0] = vaddq_f64(v80, vmlaq_f64(vmulq_n_f64(v102, *(double *)&v65), v101, v79));
    float64x2_t v103 = vaddq_f64(v82, vmlaq_f64(vmulq_n_f64(v102, *((double *)&v65 + 1)), v101, v81));
    float64x2_t v104 = vmlaq_f64(v85, v84, v100);
    float64x2_t v105 = vmlaq_f64(v87, v86, v100);
    v252.val[0] = vaddq_f64(v80, vmlaq_f64(vmulq_n_f64(v105, *(double *)&v65), v104, v79));
    float64x2_t v106 = vmlaq_f64(vmulq_n_f64(v105, *((double *)&v65 + 1)), v104, v81);
    float64x2_t v107 = vmlaq_f64(v89, v88, v100);
    float64x2_t v108 = vmlaq_f64(v91, v90, v100);
    float64x2_t v109 = vmlaq_f64(vmulq_n_f64(v108, *(double *)&v65), v107, v79);
    float64x2_t v110 = vmlaq_f64(vmulq_n_f64(v108, *((double *)&v65 + 1)), v107, v81);
    v251.val[1] = vsubq_f64(v83, v103);
    float64x2_t v111 = vmlaq_f64(v89, v92, v100);
    float64x2_t v112 = vmlaq_f64(v91, v93, v100);
    v252.val[1] = vsubq_f64(v83, vaddq_f64(v82, v106));
    v250.val[0] = vaddq_f64(v80, v109);
    v250.val[1] = vsubq_f64(v83, vaddq_f64(v82, v110));
    v113 = (double *)&v248[v72 + 64];
    vst2q_f64(v113, v251);
    v114 = (double *)&v248[v72 + 128];
    v115 = (double *)&v248[v72 + 192];
    vst2q_f64(v114, v252);
    v253.val[0] = vaddq_f64(v80, vmlaq_f64(vmulq_n_f64(v112, *(double *)&v65), v111, v79));
    vst2q_f64(v115, v250);
    v253.val[1] = vsubq_f64(v83, vaddq_f64(v82, vmlaq_f64(vmulq_n_f64(v112, *((double *)&v65 + 1)), v111, v81)));
    v116 = (double *)&v248[v72 + 256];
    vst2q_f64(v116, v253);
    int32x2_t v94 = vadd_s32(v94, (int32x2_t)0x200000002);
    v72 += 32;
  }
  while (v72 != 64);
  if ((sub_294F0([v20 objectForKeyedSubscript:@"faceBoundingBox"], v215) & 1) == 0) {
    sub_4CBF8();
  }
  id v117 = [v20 objectForKeyedSubscript:@"leftEye"];
  if (!v117) {
    sub_4CAF0();
  }
  v118 = v117;
  id v119 = [v20 objectForKeyedSubscript:@"rightEye"];
  if (!v119) {
    sub_4CB1C();
  }
  v120 = v119;
  if ([v118 count] != &dword_8) {
    sub_4CBCC();
  }
  if ([v120 count] != &dword_8) {
    sub_4CBA0();
  }
  uint64_t v121 = 0;
  for (uint64_t j = 0; j != 8; ++j)
  {
    id v123 = [v118 objectAtIndexedSubscript:j];
    if ((sub_295D4(v123, &v165, v225, v226, v227.f64[0], v227.f64[1]) & 1) == 0) {
      sub_4CB74();
    }
    double v124 = v164 - (v229.ty + v166 * v229.d + v229.b * v165);
    v125 = &v240.f64[v121];
    double *v125 = v229.tx + v166 * v229.c + v229.a * v165;
    v125[1] = v124;
    id v126 = [v120 objectAtIndexedSubscript:j];
    if ((sub_295D4(v126, &v165, v225, v226, v227.f64[0], v227.f64[1]) & 1) == 0) {
      sub_4CB48();
    }
    long long v127 = *(_OWORD *)&v229.a;
    long long v128 = *(_OWORD *)&v229.c;
    long long v129 = *(_OWORD *)&v229.tx;
    double v130 = v164 - (v229.ty + v166 * v229.d + v229.b * v165);
    v131 = &v232.f64[v121];
    double *v131 = v229.tx + v166 * v229.c + v229.a * v165;
    v131[1] = v130;
    v121 += 2;
  }
  v231[0] = *(double *)&v129 + v140 * *(double *)&v128 + *(double *)&v127 * v150;
  v231[1] = v164 - (*((double *)&v129 + 1) + v140 * *((double *)&v128 + 1) + *((double *)&v127 + 1) * v150);
  v231[2] = *(double *)&v129 + v141 * *(double *)&v128 + *(double *)&v127 * v151;
  v231[3] = v164 - (*((double *)&v129 + 1) + v141 * *((double *)&v128 + 1) + *((double *)&v127 + 1) * v151);
  v231[4] = *(double *)&v129 + v142 * *(double *)&v128 + *(double *)&v127 * v152;
  v231[5] = v164 - (*((double *)&v129 + 1) + v142 * *((double *)&v128 + 1) + *((double *)&v127 + 1) * v152);
  v231[6] = *(double *)&v129 + v143 * *(double *)&v128 + *(double *)&v127 * v153;
  v231[7] = v164 - (*((double *)&v129 + 1) + v143 * *((double *)&v128 + 1) + *((double *)&v127 + 1) * v153);
  float v132 = fmax(v146, v147) * 0.0500000007;
  double v166 = 0.0;
  LODWORD(v165) = 8;
  HIDWORD(v165) = vcvtas_u32_f32(v132);
  int32x2_t v167 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(v240)));
  int32x2_t v168 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(v241)));
  __asm { FMOV            V0.2D, #0.5 }
  int32x2_t v169 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vmlaq_f64(v241, _Q0, vsubq_f64(v247, v241)))));
  int32x2_t v170 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(v247)));
  int32x2_t v171 = v168;
  int32x2_t v172 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(v242)));
  int32x2_t v173 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(v246)));
  int32x2_t v174 = v170;
  int32x2_t v175 = v172;
  int32x2_t v176 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(v243)));
  int32x2_t v177 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(v245)));
  int32x2_t v178 = v173;
  int32x2_t v179 = v176;
  int32x2_t v180 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(v244)));
  int32x2_t v181 = v177;
  int32x2_t v182 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vmlaq_f64(v243, _Q0, vsubq_f64(v245, v243)))));
  int32x2_t v183 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(v232)));
  int32x2_t v184 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(v233)));
  int32x2_t v185 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vmlaq_f64(v233, _Q0, vsubq_f64(v239, v233)))));
  int32x2_t v186 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(v239)));
  int32x2_t v187 = v184;
  int32x2_t v188 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(v234)));
  int32x2_t v189 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(v238)));
  int32x2_t v190 = v186;
  int32x2_t v191 = v188;
  int32x2_t v192 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(v235)));
  int32x2_t v193 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(v237)));
  int32x2_t v194 = v189;
  int32x2_t v195 = v192;
  int32x2_t v196 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(v236)));
  int32x2_t v197 = v193;
  int32x2_t v198 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vmlaq_f64(v235, _Q0, vsubq_f64(v237, v235)))));
  long long v213 = 0u;
  long long v214 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  long long v207 = 0u;
  long long v208 = 0u;
  long long v205 = 0u;
  long long v206 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  if (v17)
  {
    id v134 = objc_msgSend(objc_msgSend(v23, "metalTexture"), "newTextureViewWithPixelFormat:", 80);
    v135 = -[MetalFaceMask initForDevice:]([MetalFaceMask alloc], "initForDevice:", objc_msgSend(objc_msgSend(a5, "metalTexture"), "device"));
    [(CPUFaceMask *)v135 setLumaDilateRadius:1];
    [(CPUFaceMask *)v135 setLumaErodeRadius:1];
    [(CPUFaceMask *)v135 setChromaDilateRadius:5];
    [(CPUFaceMask *)v135 setChromaErodeRadius:1];
    -[CPUFaceMask clearOutputTexture:CommandBuffer:](v135, "clearOutputTexture:CommandBuffer:", [a5 metalTexture], objc_msgSend(a5, "metalCommandBuffer"));
    -[CPUFaceMask trainSkinMaskUsingInputTexture:InputRegion:QuadRegion:CommandBuffer:](v135, "trainSkinMaskUsingInputTexture:InputRegion:QuadRegion:CommandBuffer:", v134, v231, [a5 metalCommandBuffer], v155, v154, v157, v156);
    -[CPUFaceMask findSkinMaskUsingInputTexture:InputRegion:OutputMaskTexture:OutputRegion:FaceBounds:SeedPoints:NumberOfSeedPoints:FillValue:CommandBuffer:](v135, "findSkinMaskUsingInputTexture:InputRegion:OutputMaskTexture:OutputRegion:FaceBounds:SeedPoints:NumberOfSeedPoints:FillValue:CommandBuffer:", v134, [a5 metalTexture], v248, 20, 255, objc_msgSend(a5, "metalCommandBuffer"), v155, v154, v157, v156, v145, v144, v148, v149, *(void *)&v139, *(void *)&v138,
      *(void *)&v146,
      *(void *)&v147);
    -[CPUFaceMask drawEyeMaskUsingQuads:OutputMaskTexture:OutputRegion:FaceBounds:CommandBuffer:](v135, "drawEyeMaskUsingQuads:OutputMaskTexture:OutputRegion:FaceBounds:CommandBuffer:", &v165, [a5 metalTexture], objc_msgSend(a5, "metalCommandBuffer"), v145, v144, v148, v149, v139, v138, v146, v147);
  }
  else
  {
    v135 = objc_alloc_init(CPUFaceMask);
    [(CPUFaceMask *)v135 setLumaDilateRadius:1];
    [(CPUFaceMask *)v135 setLumaErodeRadius:1];
    [(CPUFaceMask *)v135 setChromaDilateRadius:5];
    [(CPUFaceMask *)v135 setChromaErodeRadius:1];
    -[CPUFaceMask clearOutputMask:WithBytesPerRow:OutputRegion:](v135, "clearOutputMask:WithBytesPerRow:OutputRegion:", [a5 baseAddress], objc_msgSend(a5, "bytesPerRow"), v145, v144, v148, v149);
    -[CPUFaceMask trainSkinMaskUsingInputImage:InputBytesPerRow:InputRegion:QuadRegion:](v135, "trainSkinMaskUsingInputImage:InputBytesPerRow:InputRegion:QuadRegion:", [v23 baseAddress], objc_msgSend(v23, "bytesPerRow"), v231, v155, v154, v157, v156);
    LOBYTE(v137) = -1;
    -[CPUFaceMask findSkinMaskUsingInputImage:InputBytesPerRow:InputRegion:OutputMask:OutputBytesPerRow:OutputRegion:FaceBounds:SeedPoints:NumberOfSeedPoints:FillValue:](v135, "findSkinMaskUsingInputImage:InputBytesPerRow:InputRegion:OutputMask:OutputBytesPerRow:OutputRegion:FaceBounds:SeedPoints:NumberOfSeedPoints:FillValue:", [v23 baseAddress], objc_msgSend(v23, "bytesPerRow"), objc_msgSend(a5, "baseAddress"), objc_msgSend(a5, "bytesPerRow"), v248, 20, v155, v154, v157, v156, v145, v144, v148, v149, *(void *)&v139, *(void *)&v138,
      *(void *)&v146,
      *(void *)&v147,
      v137);
    -[CPUFaceMask drawEyeMaskUsingQuads:OutputMask:OutputBytesPerRow:OutputRegion:](v135, "drawEyeMaskUsingQuads:OutputMask:OutputBytesPerRow:OutputRegion:", &v165, [a5 baseAddress], objc_msgSend(a5, "bytesPerRow"), v145, v144, v148, v149);
  }

  return 1;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  if (a3) {
    sub_4CCD4();
  }
  id v5 = objc_msgSend(a4, "objectForKeyedSubscript:", @"faceROI", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);

  [v5 CGRectValue];
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return kCIFormatBGRA8;
}

+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3
{
  return 1;
}

+ (int)outputFormat
{
  return kCIFormatR8;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSDictionary)inputFaceLandmarks
{
  return self->_inputFaceLandmarks;
}

- (void)setInputFaceLandmarks:(id)a3
{
}

@end