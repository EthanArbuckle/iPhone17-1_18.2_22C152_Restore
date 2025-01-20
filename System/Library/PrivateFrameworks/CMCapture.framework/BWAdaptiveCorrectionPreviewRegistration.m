@interface BWAdaptiveCorrectionPreviewRegistration
+ (BOOL)flattenNarrowerToWiderTransforms:(int)a3@<W4> narrowerDimensions:(_OWORD *)a4@<X8> narrowerFinalCropRect:(double)a5@<D0> atNarrowerToWiderCameraScale:(double)a6@<D1> useYAnchorAtHeightCenter:(double)a7@<D2>;
+ (void)initialize;
- (BWAdaptiveCorrectionPreviewRegistration)initWithCameraInfoByPortType:(id)a3 excludeStaticComponentFromAlignmentShifts:(BOOL)a4;
- (CGFloat)_estimatedSagPositionUsingOISShift:(double)a3 forPortType:(double)a4;
- (float64_t)_fundamentalMatrixFromCalibration:(uint64_t)a3@<X2> narrowerMetadata:(uint64_t)a4@<X3> widerMetadata:(_OWORD *)a5@<X8>;
- (int)allocateResourcesWithVideoFormat:(id)a3 metalContext:(id)a4;
- (int)computeAlignmentFromWiderSampleBuffer:(opaqueCMSampleBuffer *)a3 narrowerSampleBuffer:(opaqueCMSampleBuffer *)a4 narrowerToWiderTransformsOut:(id *)a5;
- (int)computeApproximateCorrectionForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCameraPortType:(id)a4 narrowerPixelBufferDimensions:(id)a5 narrowerToWiderCameraScale:(double)a6 narrowerToWiderTransformsOut:(id *)a7;
- (int)registerWiderSampleBufferUsingADC:(opaqueCMSampleBuffer *)a3 narrowerSampleBuffer:(opaqueCMSampleBuffer *)a4 narrowerRect:(CGRect)a5 macroTransitionType:(int)a6 narrowerToWiderTransformsOut:(id *)a7;
- (uint64_t)_computeApproximateHomographyAtDepth:(uint64_t)a3@<X2> calibration:(void *)a4@<X3> narrowerPortType:(unint64_t)a5@<X4> widerMetadata:(float64x2_t *)a6@<X8> pixelBufferDimensions:(double)a7@<D0>;
- (uint64_t)_computeApproximateOISCalibrationFromWiderMetadata:(uint64_t)a3 narrowerPortType:(double *)a4 narrowerToWiderCameraScale:(double)a5 calibrationOut:;
- (uint64_t)_computeOISCalibrationFromWiderMetadata:(uint64_t)a3 narrowerMetadata:(int)a4 updateEstimatedSagPositions:(int)a5 excludeEstimatedSagFromAlignment:(uint64_t)a6 calibrationOut:;
- (uint64_t)_estimateDepthFromKeypointsUsingCalibration:(float64x2_t *)a3 narrowerRawSensorResolution:(int)a4 fundamentalMatrix:(void *)a5 macroTransitionType:(float64x2_t)a6 totalZoomFactor:(double)a7 consolidatedDepthsOut:(float64x2_t)a8;
- (uint64_t)_homographyAtDepth:(void *)a3@<X2> calibration:(void *)a4@<X3> narrowerMetadata:(uint64_t)a5@<X4> widerMetadata:(char)a6@<W5> pixelBufferDimensions:(float64x2_t *)a7@<X8> excludeExtrinsics:(double)a8@<D0>;
- (uint64_t)_loadAdaptiveCorrectionSymbols;
- (uint64_t)_updateCorrectedCalibrationUsingInitialOISCalibration:(int)a3 macroTransitionType:;
- (uint64_t)_verifyRegistrationTransform:(uint64_t)a3 usingInitialOISCalibration:(uint64_t)a4 narrowerMetadata:(uint64_t)a5 widerMetadata:(uint64_t)a6 narrowerDimensions:(double)a7;
- (void)cleanupResources;
- (void)dealloc;
@end

@implementation BWAdaptiveCorrectionPreviewRegistration

- (int)registerWiderSampleBufferUsingADC:(opaqueCMSampleBuffer *)a3 narrowerSampleBuffer:(opaqueCMSampleBuffer *)a4 narrowerRect:(CGRect)a5 macroTransitionType:(int)a6 narrowerToWiderTransformsOut:(id *)a7
{
  v237[2] = *MEMORY[0x1E4F143B8];
  v237[0] = 0;
  v237[1] = 0;
  uint64_t v235 = 0;
  uint64_t v236 = 0;
  v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", 2, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  *(void *)&v149.f64[0] = a7;
  if (a3 && a4 && a7)
  {
    v15 = (void *)v14;
    LODWORD(v158.f64[1]) = a6;
    v143.f64[1] = v7;
    uint64_t v16 = 0;
    *(void *)&v152.f64[1] = a4;
    v234[0] = a4;
    v234[1] = a3;
    CFStringRef v17 = (const __CFString *)*MEMORY[0x1E4F53070];
    uint64_t v18 = *MEMORY[0x1E4F54128];
    uint64_t v19 = *MEMORY[0x1E4F52C78];
    char v20 = 1;
    do
    {
      char v21 = v20;
      v22 = (opaqueCMSampleBuffer *)v234[v16];
      v237[v16] = CMSampleBufferGetImageBuffer(v22);
      objc_msgSend(v13, "setObject:atIndexedSubscript:", CMGetAttachment(v22, v17, 0), v16);
      objc_msgSend(v15, "setObject:atIndexedSubscript:", objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v16), "objectForKeyedSubscript:", v18), v16);
      objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_staticParametersByPortType, "objectForKeyedSubscript:", objc_msgSend(v15, "objectAtIndexedSubscript:", v16)), "objectForKeyedSubscript:", v19), "doubleValue");
      char v20 = 0;
      uint64_t v16 = 1;
    }
    while ((v21 & 1) != 0);
    double v222 = 0.0;
    long long v221 = 0u;
    long long v220 = 0u;
    long long v219 = 0u;
    long long v218 = 0u;
    long long v217 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    long long v213 = 0u;
    long long v214 = 0u;
    long long v211 = 0u;
    long long v212 = 0u;
    int v23 = -[BWAdaptiveCorrectionPreviewRegistration _computeOISCalibrationFromWiderMetadata:narrowerMetadata:updateEstimatedSagPositions:excludeEstimatedSagFromAlignment:calibrationOut:]((uint64_t)self, [v13 objectAtIndexedSubscript:1], objc_msgSend(v13, "objectAtIndexedSubscript:", 0), 0, 0, (uint64_t)&v211);
    if (v23)
    {
LABEL_49:
      int v131 = v23;
      fig_log_get_emitter();
LABEL_54:
      FigDebugAssert3();
      goto LABEL_39;
    }
    tuningParameters = self->_tuningParameters;
    if (tuningParameters)
    {
      [(BWAdaptiveCorrectionPreviewRegistrationTuningParameters *)tuningParameters regToolBoxConfig];
      v25 = self->_tuningParameters;
      unsigned int v169 = DWORD1(v209);
      if (v25)
      {
        [(BWAdaptiveCorrectionPreviewRegistrationTuningParameters *)v25 regToolBoxConfig];
        unsigned int v164 = DWORD2(v207);
        goto LABEL_12;
      }
    }
    else
    {
      unsigned int v169 = 0;
      long long v209 = 0u;
      long long v210 = 0u;
    }
    unsigned int v164 = 0;
    long long v207 = 0u;
    long long v208 = 0u;
LABEL_12:
    uint64_t v26 = 0;
    v172.f64[0] = *(float64_t *)MEMORY[0x1E4F54168];
    v172.f64[1] = *(float64_t *)MEMORY[0x1E4F54160];
    char v27 = 1;
    do
    {
      char v28 = v27;
      v29 = (__CVBuffer *)v237[v26];
      v30 = &v233[v26];
      *(_DWORD *)v30 = CVPixelBufferGetWidth(v29);
      *((_DWORD *)v30 + 1) = CVPixelBufferGetHeight(v29);
      v31 = &v232[4 * v26];
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v26), "objectForKeyedSubscript:", *(void *)&v172.f64[0]), "doubleValue");
      uint64_t v33 = v32;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v26), "objectForKeyedSubscript:", *(void *)&v172.f64[1]), "doubleValue");
      double *v31 = 0.0;
      v31[1] = 0.0;
      *((void *)v31 + 2) = v33;
      *((void *)v31 + 3) = v34;
      [v13 objectAtIndexedSubscript:v26];
      FigCFDictionaryGetCGRectIfPresent();
      v35 = &v224 + 4 * v26;
      double Width = (double)CVPixelBufferGetWidth(v29);
      size_t Height = CVPixelBufferGetHeight(v29);
      double *v35 = 0.0;
      v35[1] = 0.0;
      v35[2] = Width;
      v35[3] = (double)Height;
      [v13 objectAtIndexedSubscript:v26];
      FigCFDictionaryGetCGRectIfPresent();
      v38 = [(BWPixelBufferPool *)self->_registrationPool newPixelBuffer];
      *(&v235 + v26) = (uint64_t)v38;
      if (!v38)
      {
        fig_log_get_emitter();
LABEL_47:
        FigDebugAssert3();
        int v131 = -1;
        goto LABEL_39;
      }
      char v27 = 0;
      uint64_t v26 = 1;
    }
    while ((v28 & 1) != 0);
    acpr_conformRectForMSR420vf(v224, v225, v226, v227);
    v165.f64[0] = (double)v164;
    v165.f64[1] = (double)v169;
    int v23 = VTPixelRotationSessionRotateSubImage();
    if (v23) {
      goto LABEL_49;
    }
    v39 = (void *)[v13 objectAtIndexedSubscript:0];
    objc_msgSend((id)objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x1E4F53EB0]), "doubleValue");
    double v41 = v40 * 10.0;
    if (v40 * 10.0 <= 0.0)
    {
      double v41 = 1.0e10;
      int v42 = LODWORD(v158.f64[1]);
    }
    else
    {
      int v42 = LODWORD(v158.f64[1]);
      if (!LODWORD(v158.f64[1])) {
        double v41 = 2.0 / (1.0 / v41 + 1.0e-10);
      }
    }
    float64x2_t v205 = 0u;
    float64x2_t v206 = 0u;
    float64x2_t v203 = 0u;
    float64x2_t v204 = 0u;
    float64x2_t v201 = 0u;
    float64x2_t v202 = 0u;
    v43 = (void *)[v13 objectAtIndexedSubscript:0];
    v44 = (void *)[v13 objectAtIndexedSubscript:1];
    long long v197 = v219;
    long long v198 = v220;
    long long v199 = v221;
    double v200 = v222;
    long long v193 = v215;
    long long v194 = v216;
    long long v195 = v217;
    long long v196 = v218;
    long long v189 = v211;
    long long v190 = v212;
    long long v191 = v213;
    long long v192 = v214;
    uint64_t v45 = v233[0];
    -[BWAdaptiveCorrectionPreviewRegistration _homographyAtDepth:calibration:narrowerMetadata:widerMetadata:pixelBufferDimensions:excludeExtrinsics:]((uint64_t)self, &v189, v43, v44, v233[0], 0, &v201, v41, v137, v143, v149, v152, v158, v165, v172, __dst[0], __dst[1], *(_OWORD *)&__dst[2], *(_OWORD *)&__dst[3],
      *(_OWORD *)&__dst[4],
      *(_OWORD *)&__dst[5],
      *(_OWORD *)&__dst[6],
      *(_OWORD *)&__dst[7],
      *(_OWORD *)&__dst[8],
      *(_OWORD *)&__dst[9],
      *(_OWORD *)&__dst[10],
      *(_OWORD *)&__dst[11],
      *(_OWORD *)&__dst[12],
      *(_OWORD *)&__dst[13],
      *(_OWORD *)&__dst[14],
      *(_OWORD *)&__dst[15],
      *(_OWORD *)&__dst[16],
      *(_OWORD *)&__dst[17],
      *(_OWORD *)&v177,
      *(_OWORD *)&v178,
      v179,
      v180,
      v181,
      v182,
      v183);
    v46.f64[0] = v224;
    v47.f64[0] = v225;
    float64x2_t v48 = vdivq_f64(vaddq_f64(v205, vmlaq_n_f64(vmulq_n_f64(v201, v224), v203, v225)), (float64x2_t)vdupq_lane_s64(*(_OWORD *)&vaddq_f64(v206, vmlaq_f64(vmulq_f64(v46, v202), v47, v204)), 0));
    v46.f64[0] = v224 + v226;
    v47.f64[0] = v225 + v227;
    float64x2_t v49 = vdivq_f64(vaddq_f64(v205, vmlaq_n_f64(vmulq_n_f64(v201, v224 + v226), v203, v225 + v227)), (float64x2_t)vdupq_lane_s64(*(_OWORD *)&vaddq_f64(v206, vmlaq_f64(vmulq_f64(v202, v46), v47, v204)), 0));
    double v50 = acpr_conformRectForMSR420vf(v48.f64[0], v48.f64[1], v49.f64[0] - v48.f64[0], v49.f64[1] - v48.f64[1]);
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;
    int v57 = VTPixelRotationSessionRotateSubImage();
    if (v57) {
      goto LABEL_51;
    }
    uint64_t v58 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:v235 pixelFormat:10 usage:17 plane:0];
    uint64_t v59 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:v236 pixelFormat:10 usage:17 plane:0];
    int v57 = [(FigRegToolboxGPU *)self->_keypointDetector processReferenceImage:v58 histogram:0 doWaitForIdle:1];
    if (v57) {
      goto LABEL_51;
    }
    int v57 = [(FigRegToolboxGPU *)self->_keypointDetector computeTransform:v59 transform:0 outputCorners:self->_keypointList solverSelector:1 histogram:0 roi:0];
    if (v57) {
      goto LABEL_51;
    }
    double v60 = v228;
    double v61 = v229;
    double v62 = v232[6];
    double v63 = v230;
    v149.f64[1] = v231;
    double v153 = v232[7];
    double v159 = v232[5];
    double v162 = v232[4];
    self->_unsigned int validKeypointsCount = 0;
    if ([(BWAdaptiveCorrectionPreviewRegistrationTuningParameters *)self->_tuningParameters configuredNumKeypoints])
    {
      uint64_t v64 = 0;
      unint64_t v65 = 0;
      double v66 = v54 / *(double *)&v170;
      double v67 = v56 / *(double *)&v166;
      double v68 = v50 - v60;
      double v69 = v52 - v61;
      double v70 = v62 / v63;
      do
      {
        v71 = &self->_keypointList[v64];
        float var4 = v71->var4;
        float v73 = var4 * log2f(fmaxf(v71->var5, 1.0));
        [(BWAdaptiveCorrectionPreviewRegistrationTuningParameters *)self->_tuningParameters keypointsMinSelectionScore];
        if (v73 > v74)
        {
          v75 = &self->_keypointList[v64];
          v76 = self->_validKeypointsInSensorResolution[0];
          unsigned int validKeypointsCount = self->_validKeypointsCount;
          unsigned int v78 = 2 * validKeypointsCount;
          v76[v78] = v232[0] + v75->var0 * (v232[2] / *(double *)&v170);
          unsigned int v79 = (2 * validKeypointsCount) | 1;
          v76[v79] = v232[1] + v75->var1 * (v232[3] / *(double *)&v166);
          v80 = self->_validKeypointsInSensorResolution[1];
          v80[v78] = v162 + (v68 + v75->var2 * v66) * v70;
          v80[v79] = v159 + (v69 + v75->var3 * v67) * (v153 / v149.f64[1]);
          self->_unsigned int validKeypointsCount = validKeypointsCount + 1;
        }
        ++v65;
        ++v64;
      }
      while (v65 < [(BWAdaptiveCorrectionPreviewRegistrationTuningParameters *)self->_tuningParameters configuredNumKeypoints]);
    }
    long long v197 = v219;
    long long v198 = v220;
    long long v199 = v221;
    double v200 = v222;
    long long v193 = v215;
    long long v194 = v216;
    long long v195 = v217;
    long long v196 = v218;
    long long v189 = v211;
    long long v190 = v212;
    long long v191 = v213;
    long long v192 = v214;
    int v57 = -[BWAdaptiveCorrectionPreviewRegistration _updateCorrectedCalibrationUsingInitialOISCalibration:macroTransitionType:]((uint64_t)self, (uint64_t)&v189, v42);
    if (v57)
    {
LABEL_51:
      int v131 = v57;
      fig_log_get_emitter();
    }
    else
    {
      memset(v223, 0, sizeof(v223));
      float64x2_t v183 = 0u;
      long long v184 = 0u;
      long long v185 = 0u;
      long long v186 = 0u;
      p_correctedCalibration = &self->_correctedCalibration;
      long long v187 = 0u;
      long long v188 = 0u;
      uint64_t v82 = [v13 objectAtIndexedSubscript:0];
      uint64_t v83 = [v13 objectAtIndexedSubscript:1];
      long long v84 = *(_OWORD *)&self->_correctedCalibration.canonicalDisparityScale;
      long long v197 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[10];
      long long v198 = v84;
      long long v199 = *(_OWORD *)&self->_correctedCalibration.calibrationDimensions[1];
      double v200 = self->_correctedCalibration.pixelSize_um[1];
      long long v85 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[4];
      long long v193 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[2];
      long long v194 = v85;
      long long v86 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[8];
      long long v195 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[6];
      long long v196 = v86;
      long long v87 = *(_OWORD *)self->_correctedCalibration.opticalCenterX;
      long long v189 = *(_OWORD *)self->_correctedCalibration.focalLengthPix;
      long long v190 = v87;
      long long v88 = *(_OWORD *)self->_correctedCalibration.extrinRotRefefenceToAuxiliary;
      long long v191 = *(_OWORD *)self->_correctedCalibration.opticalCenterY;
      long long v192 = v88;
      v89 = objc_msgSend(v13, "objectAtIndexedSubscript:", 0, -[BWAdaptiveCorrectionPreviewRegistration _fundamentalMatrixFromCalibration:narrowerMetadata:widerMetadata:]((uint64_t)self, &v189, v82, v83, &v183, v138, v141, v144, v147, *(uint64_t *)&v149.f64[0], *(uint64_t *)&v149.f64[1], *(uint64_t *)&v153, (uint64_t)target, *(uint64_t *)&v159, *(uint64_t *)&v162,
                        v166,
                        v170,
                        v173,
                        *(_OWORD *)__dst,
                        *(_OWORD *)&__dst[1],
                        *(_OWORD *)&__dst[2],
                        *(_OWORD *)&__dst[3],
                        *(_OWORD *)&__dst[4],
                        __dst[5],
                        __dst[6],
                        __dst[7],
                        __dst[8],
                        __dst[9],
                        __dst[10],
                        __dst[11],
                        __dst[12],
                        __dst[13],
                        __dst[14],
                        __dst[15],
                        __dst[16],
                        __dst[17],
                        v177,
                        v178,
                        v179,
                        v180,
                        v181,
                        v182,
                        (float64x2_t)0));
      objc_msgSend((id)objc_msgSend(v89, "objectForKeyedSubscript:", (void)v174), "doubleValue");
      float64_t v91 = v90;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", 0), "objectForKeyedSubscript:", *((void *)&v174 + 1)), "doubleValue");
      double v93 = v92;
      v94 = (void *)CMGetAttachment(targeta, @"TotalZoomFactor", 0);
      if (v94)
      {
        [v94 floatValue];
        LODWORD(v98.f64[0]) = v104;
      }
      else
      {
        LODWORD(v98.f64[0]) = 1.0;
      }
      long long v105 = *(_OWORD *)&self->_correctedCalibration.canonicalDisparityScale;
      long long v197 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[10];
      long long v198 = v105;
      long long v199 = *(_OWORD *)&self->_correctedCalibration.calibrationDimensions[1];
      double v200 = self->_correctedCalibration.pixelSize_um[1];
      long long v106 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[4];
      long long v193 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[2];
      long long v194 = v106;
      long long v107 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[8];
      long long v195 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[6];
      long long v196 = v107;
      long long v108 = *(_OWORD *)self->_correctedCalibration.opticalCenterX;
      long long v189 = *(_OWORD *)p_correctedCalibration->focalLengthPix;
      long long v190 = v108;
      long long v109 = *(_OWORD *)self->_correctedCalibration.extrinRotRefefenceToAuxiliary;
      long long v191 = *(_OWORD *)self->_correctedCalibration.opticalCenterY;
      long long v192 = v109;
      v110.f64[1] = v183.f64[1];
      v110.f64[0] = v91;
      int v111 = -[BWAdaptiveCorrectionPreviewRegistration _estimateDepthFromKeypointsUsingCalibration:narrowerRawSensorResolution:fundamentalMatrix:macroTransitionType:totalZoomFactor:consolidatedDepthsOut:]((uint64_t)self, &v189, &v177, v42, v223, v110, v93, v98, v99, v100, v101, v102, v103, v95, v96, v97, v139, v142, v145,
               v148,
               (uint64_t)v150,
               v151,
               v154,
               (uint64_t)targeta,
               v160,
               v163,
               v167,
               v171,
               v174,
               *(_OWORD *)__dst,
               *(_OWORD *)&__dst[1],
               *(_OWORD *)&__dst[2],
               *(_OWORD *)&__dst[3],
               *(_OWORD *)&__dst[4],
               *(_OWORD *)&__dst[5],
               *(_OWORD *)&__dst[6],
               __dst[7],
               __dst[8],
               __dst[9],
               __dst[10],
               __dst[11],
               __dst[12],
               *(uint64_t *)&__dst[13].f64[0],
               __dst[13].f64[1],
               SLODWORD(__dst[14].f64[0]),
               SHIDWORD(__dst[14].f64[0]),
               SLODWORD(__dst[14].f64[1]),
               SHIDWORD(__dst[14].f64[1]),
               SLODWORD(__dst[15].f64[0]),
               SHIDWORD(__dst[15].f64[0]),
               SLODWORD(__dst[15].f64[1]),
               SHIDWORD(__dst[15].f64[1]),
               *(uint64_t *)&__dst[16].f64[0],
               *(uint64_t *)&__dst[16].f64[1],
               *(uint64_t *)&__dst[17].f64[0],
               *(uint64_t *)&__dst[17].f64[1],
               *(uint64_t *)&v183.f64[0],
               *(uint64_t *)&v183.f64[1],
               v184,
               v185,
               v186,
               v187,
               v188);
      if (!v111)
      {
        v112 = (double *)v223;
        for (uint64_t i = 320; i != 608; i += 96)
        {
          v114 = (float64x2_t *)((char *)self + i);
          double v115 = *v112++;
          v116 = (void *)[v13 objectAtIndexedSubscript:0];
          v117 = (void *)[v13 objectAtIndexedSubscript:1];
          long long v118 = *(_OWORD *)&self->_correctedCalibration.canonicalDisparityScale;
          long long v197 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[10];
          long long v198 = v118;
          long long v199 = *(_OWORD *)&self->_correctedCalibration.calibrationDimensions[1];
          double v200 = self->_correctedCalibration.pixelSize_um[1];
          long long v119 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[4];
          long long v193 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[2];
          long long v194 = v119;
          long long v120 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[8];
          long long v195 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[6];
          long long v196 = v120;
          long long v121 = *(_OWORD *)self->_correctedCalibration.opticalCenterX;
          long long v189 = *(_OWORD *)p_correctedCalibration->focalLengthPix;
          long long v190 = v121;
          long long v122 = *(_OWORD *)self->_correctedCalibration.extrinRotRefefenceToAuxiliary;
          long long v191 = *(_OWORD *)self->_correctedCalibration.opticalCenterY;
          long long v192 = v122;
          -[BWAdaptiveCorrectionPreviewRegistration _homographyAtDepth:calibration:narrowerMetadata:widerMetadata:pixelBufferDimensions:excludeExtrinsics:]((uint64_t)self, &v189, v116, v117, v45, 0, &v177, v115, v140, v146, v149, v155, v161, v168, v175, __dst[0], __dst[1], *(_OWORD *)&__dst[2], *(_OWORD *)&__dst[3],
            *(_OWORD *)&__dst[4],
            *(_OWORD *)&__dst[5],
            *(_OWORD *)&__dst[6],
            *(_OWORD *)&__dst[7],
            *(_OWORD *)&__dst[8],
            *(_OWORD *)&__dst[9],
            *(_OWORD *)&__dst[10],
            *(_OWORD *)&__dst[11],
            *(_OWORD *)&__dst[12],
            *(_OWORD *)&__dst[13],
            *(_OWORD *)&__dst[14],
            *(_OWORD *)&__dst[15],
            *(_OWORD *)&__dst[16],
            *(_OWORD *)&__dst[17],
            *(_OWORD *)&v177,
            *(_OWORD *)&v178,
            v179,
            v180,
            v181,
            v182,
            v183);
          float64x2_t v123 = v180;
          v114[2] = v179;
          v114[3] = v123;
          float64x2_t v124 = v182;
          v114[4] = v181;
          v114[5] = v124;
          float64x2_t v125 = v178;
          float64x2_t *v114 = v177;
          v114[1] = v125;
        }
        if (!self->_excludeExtrinsicsCorrectionFromWideTeleAlignment) {
          goto LABEL_38;
        }
        if (!self->_excludeEstimatedSagFromWideTeleAlignment) {
          goto LABEL_38;
        }
        memcpy(__dst, self->_anon_140, sizeof(__dst));
        uint64_t v126 = [v13 objectAtIndexedSubscript:0];
        uint64_t v127 = [v13 objectAtIndexedSubscript:1];
        long long v197 = v219;
        long long v198 = v220;
        long long v199 = v221;
        double v200 = v222;
        long long v193 = v215;
        long long v194 = v216;
        long long v195 = v217;
        long long v196 = v218;
        long long v189 = v211;
        long long v190 = v212;
        long long v191 = v213;
        long long v192 = v214;
        if (!-[BWAdaptiveCorrectionPreviewRegistration _verifyRegistrationTransform:usingInitialOISCalibration:narrowerMetadata:widerMetadata:narrowerDimensions:]((uint64_t)self, (uint64_t)__dst, (uint64_t)&v189, v126, v127, v45, *(double *)&v213, *(double *)&v214, v128, v129, v130))
        {
LABEL_38:
          int v131 = 0;
          goto LABEL_39;
        }
        fig_log_get_emitter();
        goto LABEL_47;
      }
      int v131 = v111;
      fig_log_get_emitter();
    }
    goto LABEL_54;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  int v131 = -12780;
LABEL_39:

  uint64_t v132 = 0;
  self->_registrationPoolReadyAssertion = 0;
  char v133 = 1;
  do
  {
    char v134 = v133;
    v135 = (const void *)*(&v235 + v132);
    if (v135) {
      CFRelease(v135);
    }
    char v133 = 0;
    uint64_t v132 = 1;
  }
  while ((v134 & 1) != 0);
  if (!v131) {
    memcpy(*(void **)&v149.f64[0], self->_anon_140, 0x120uLL);
  }
  return v131;
}

- (BWAdaptiveCorrectionPreviewRegistration)initWithCameraInfoByPortType:(id)a3 excludeStaticComponentFromAlignmentShifts:(BOOL)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)BWAdaptiveCorrectionPreviewRegistration;
  v6 = [(BWAdaptiveCorrectionPreviewRegistration *)&v36 init];
  float64_t v7 = v6;
  if (a3)
  {
    if (v6)
    {
      BOOL v24 = a4;
      v6->_tuningParameters = objc_alloc_init(BWAdaptiveCorrectionPreviewRegistrationTuningParameters);
      v25 = v7;
      v7->_estimatedSagPositionsByPortType = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionary];
      v30 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id obj = (id)[a3 allKeys];
      uint64_t v31 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v31)
      {
        uint64_t v29 = *(void *)v33;
        uint64_t v8 = *MEMORY[0x1E4F52D28];
        uint64_t v9 = *MEMORY[0x1E4F52CA8];
        uint64_t v28 = *MEMORY[0x1E4F52DE8];
        uint64_t v10 = *MEMORY[0x1E4F52C78];
        uint64_t v26 = *MEMORY[0x1E4F52C80];
        uint64_t v11 = *MEMORY[0x1E4F52D38];
        uint64_t v12 = *MEMORY[0x1E4F52D20];
        while (2)
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v33 != v29) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            v15 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
            uint64_t v16 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v14), "objectForKeyedSubscript:", v8);
            if (!v16) {
              goto LABEL_19;
            }
            [v15 setObject:v16 forKeyedSubscript:v8];
            uint64_t v17 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v14), "objectForKeyedSubscript:", v9);
            if (!v17) {
              goto LABEL_19;
            }
            [v15 setObject:v17 forKeyedSubscript:v9];
            int v18 = [v14 isEqualToString:v28];
            uint64_t v19 = (void *)[a3 objectForKeyedSubscript:v14];
            if (v18)
            {
              uint64_t v20 = [v19 objectForKeyedSubscript:v26];
              if (!v20) {
                goto LABEL_19;
              }
            }
            else
            {
              uint64_t v20 = [v19 objectForKeyedSubscript:v10];
              if (!v20) {
                goto LABEL_19;
              }
            }
            [v15 setObject:v20 forKeyedSubscript:v10];
            uint64_t v21 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v14), "objectForKeyedSubscript:", v11);
            if (!v21
              || ([v15 setObject:v21 forKeyedSubscript:v11],
                  (uint64_t v22 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v14), "objectForKeyedSubscript:", v12)) == 0))
            {
LABEL_19:
              fig_log_get_emitter();
              FigDebugAssert3();
              float64_t v7 = v25;
              goto LABEL_20;
            }
            [v15 setObject:v22 forKeyedSubscript:v12];
            [v30 setObject:v15 forKeyedSubscript:v14];
          }
          uint64_t v31 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
          if (v31) {
            continue;
          }
          break;
        }
      }
      float64_t v7 = v25;
      v25->_staticParametersByPortType = (NSDictionary *)v30;
      v25->_registrationPoolReadyAssertion = (BWMemoryPoolFlushAssertion *)[+[BWMemoryPool sharedMemoryPool] newFlushAssertion:@"BWAdaptiveCorrectionPreviewRegistration registrationPool"];
      v25->_excludeExtrinsicsCorrectionFromWideTeleAlignment = v24;
      v25->_excludeEstimatedSagFromWideTeleAlignment = v24;
      v25->_sagEstimationAlpha = 0.01;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_20:

    return 0;
  }
  return v7;
}

+ (BOOL)flattenNarrowerToWiderTransforms:(int)a3@<W4> narrowerDimensions:(_OWORD *)a4@<X8> narrowerFinalCropRect:(double)a5@<D0> atNarrowerToWiderCameraScale:(double)a6@<D1> useYAnchorAtHeightCenter:(double)a7@<D2>
{
  a29 = *MEMORY[0x1E4F143B8];
  a4[16] = 0u;
  a4[17] = 0u;
  a4[14] = 0u;
  a4[15] = 0u;
  a4[12] = 0u;
  a4[13] = 0u;
  a4[10] = 0u;
  a4[11] = 0u;
  a4[8] = 0u;
  a4[9] = 0u;
  a4[6] = 0u;
  a4[7] = 0u;
  a4[4] = 0u;
  a4[5] = 0u;
  *(void *)&long long v32 = 0;
  a4[2] = 0u;
  a4[3] = 0u;
  double v86 = a9.n128_f64[0] + -1.0;
  v33.i64[0] = (int)a2;
  v33.i64[1] = SHIDWORD(a2);
  *a4 = 0u;
  a4[1] = 0u;
  float64x2_t v85 = vcvtq_f64_s64(v33);
  *((void *)&v32 + 1) = a9.n128_u64[0];
  long long v82 = v32;
  long long v83 = a9.n128_u64[0];
  BOOL result = FigCaptureMetadataUtilitiesDenormalizeCropRect(a5, a6, a7, a8);
  *(void *)&v35.f64[0] = a9.n128_u64[0];
  uint64_t v36 = 0;
  a26 = v37;
  a27 = v37 + v38;
  a28 = v37 + v38 * 0.5;
  int64x2_t v40 = (int64x2_t)vmlaq_n_f64((float64x2_t)vdupq_lane_s64(v42.i64[0], 0), (float64x2_t)xmmword_1A5EFD740, v39);
  int64x2_t v41 = vdupq_laneq_s64(v40, 1);
  *(double *)v42.i64 = *(double *)v42.i64 + v39 * 0.75;
  if (a3) {
    unint64_t v43 = -1;
  }
  else {
    unint64_t v43 = 0;
  }
  int8x16_t v44 = (int8x16_t)vdupq_n_s64(v43);
  int64x2_t v45 = (int64x2_t)vbslq_s8(v44, (int8x16_t)v41, (int8x16_t)v40);
  int64x2_t v46 = (int64x2_t)vbslq_s8(v44, (int8x16_t)v41, v42);
  __asm { FMOV            V3.2D, #0.5 }
  float64x2_t v52 = vmulq_f64(vmulq_n_f64(v85, v86), _Q3);
  __asm { FMOV            V3.2D, #1.0 }
  *(void *)&v35.f64[1] = a9.n128_u64[0];
  do
  {
    uint64_t v54 = 0;
    double v55 = (_OWORD *)(a1 + 96 * v36);
    int8x16_t v56 = *(int8x16_t *)v55;
    float64x2_t v57 = *((float64x2_t *)v55 + 1);
    int8x16_t v58 = *((int8x16_t *)v55 + 2);
    float64x2_t v59 = *((float64x2_t *)v55 + 3);
    int8x16_t v60 = *((int8x16_t *)v55 + 4);
    float64x2_t v61 = *((float64x2_t *)v55 + 5);
    v41.i64[0] = *(uint64_t *)(&a26 + v36);
    int64x2_t v62 = vdupq_lane_s64(v41.i64[0], 0);
    float64x2_t v63 = (float64x2_t)vzip1q_s64(v62, v45);
    float64x2_t v64 = (float64x2_t)vzip2q_s64(v62, v45);
    float64x2_t v65 = (float64x2_t)vzip1q_s64(v41, v46);
    a20 = v63;
    a21 = _Q3;
    a22 = v64;
    a23 = _Q3;
    a24 = v65;
    a25 = _Q3;
    a14 = 0uLL;
    a15 = 0uLL;
    a16 = 0uLL;
    a17 = 0uLL;
    a18 = 0uLL;
    a19 = 0uLL;
    unint64_t v66 = vextq_s8(v56, v56, 8uLL).u64[0];
    unint64_t v67 = vextq_s8(v58, v58, 8uLL).u64[0];
    unint64_t v68 = vextq_s8(v60, v60, 8uLL).u64[0];
    do
    {
      float64x2_t v70 = *(float64x2_t *)((char *)&a20 + v54);
      float64x2_t v69 = *(float64x2_t *)((char *)&a20 + v54 + 16);
      *(void *)&v71.f64[0] = v56.i64[0];
      *(void *)&v71.f64[1] = v66;
      *(void *)&v72.f64[0] = v58.i64[0];
      *(void *)&v72.f64[1] = v67;
      float64x2_t v73 = vmlaq_laneq_f64(vmulq_n_f64(v71, v70.f64[0]), v72, v70, 1);
      float64x2_t v74 = vmlaq_laneq_f64(vmulq_f64(v57, v70), v59, v70, 1);
      *(void *)&v70.f64[0] = v60.i64[0];
      *(void *)&v70.f64[1] = v68;
      v75 = (float64x2_t *)((char *)&a14 + v54);
      float64x2_t *v75 = vmlaq_n_f64(v73, v70, v69.f64[0]);
      v75[1] = vmlaq_f64(v74, v69, v61);
      v54 += 32;
    }
    while (v54 != 96);
    for (uint64_t i = 0; i != 12; i += 4)
    {
      double v77 = *(double *)((char *)&a14 + i * 8 + 16);
      v78.f64[0] = a14.f64[i] / v77;
      v78.f64[1] = a14.f64[i + 1] / v77;
      *(float64x2_t *)((char *)&a14 + i * 8) = v78;
    }
    unsigned int v79 = &a4[6 * v36];
    float64x2_t v80 = vaddq_f64(vaddq_f64(vsubq_f64(a14, vmulq_f64(v35, v63)), vsubq_f64(a16, vmulq_f64(v35, v64))), vsubq_f64(a18, vmulq_f64(v35, v65)));
    __asm { FMOV            V5.2D, #3.0 }
    *unsigned int v79 = v83;
    v79[1] = 0uLL;
    v79[2] = v82;
    v79[3] = 0uLL;
    int64x2_t v41 = (int64x2_t)vaddq_f64(v52, vdivq_f64(v80, _Q5));
    v79[4] = v41;
    v79[5] = _Q3;
    *((void *)v79 + 10) = 0x3FF0000000000000;
    ++v36;
  }
  while (v36 != 3);
  return result;
}

- (int)computeAlignmentFromWiderSampleBuffer:(opaqueCMSampleBuffer *)a3 narrowerSampleBuffer:(opaqueCMSampleBuffer *)a4 narrowerToWiderTransformsOut:(id *)a5
{
  if (a3 && a4 && a5)
  {
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F53070];
    uint64_t v10 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v11 = (void *)CMGetAttachment(a3, v9, 0);
    uint64_t v12 = (void *)[v10 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    int v13 = [v12 isEqualToString:*MEMORY[0x1E4F52DF0]];
    char v14 = v13;
    if (self->_excludeEstimatedSagFromWideTeleAlignment) {
      int v15 = v13;
    }
    else {
      int v15 = 0;
    }
    memset(&v39[8], 0, 24);
    CMSampleBufferGetPresentationTimeStamp((CMTime *)&v39[8], a4);
    if (self->_excludeEstimatedSagFromWideTeleAlignment)
    {
      time1[0] = (CMTime)self->_lastNarrowerFramePTS;
      *(_OWORD *)time2 = *(_OWORD *)&v39[8];
      *(void *)&time2[16] = *(void *)&v39[24];
      BOOL v16 = CMTimeCompare(time1, (CMTime *)time2) != 0;
    }
    else
    {
      BOOL v16 = 0;
    }
    uint64_t v51 = 0;
    long long v49 = 0u;
    long long v50 = 0u;
    float64x2_t v47 = 0u;
    long long v48 = 0u;
    float64x2_t v45 = 0u;
    float64x2_t v46 = 0u;
    float64x2_t v43 = 0u;
    float64x2_t v44 = 0u;
    float64x2_t v42 = 0u;
    memset(time2, 0, sizeof(time2));
    *(_OWORD *)&self->_lastNarrowerFramePTS.value = *(_OWORD *)&v39[8];
    self->_lastNarrowerFramePTS.epoch = *(void *)&v39[24];
    int v17 = -[BWAdaptiveCorrectionPreviewRegistration _computeOISCalibrationFromWiderMetadata:narrowerMetadata:updateEstimatedSagPositions:excludeEstimatedSagFromAlignment:calibrationOut:]((uint64_t)self, (uint64_t)v11, (uint64_t)v10, v16, v15, (uint64_t)time2);
    if (v17)
    {
      int v28 = v17;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      memset(time1, 0, sizeof(time1));
      ImageBuffer = CMSampleBufferGetImageBuffer(a4);
      unsigned int Width = CVPixelBufferGetWidth(ImageBuffer);
      unsigned int Height = CVPixelBufferGetHeight(ImageBuffer);
      uint64_t v21 = 0;
      if (self->_excludeExtrinsicsCorrectionFromWideTeleAlignment) {
        char v22 = v14;
      }
      else {
        char v22 = 0;
      }
      unint64_t v23 = Width | ((unint64_t)Height << 32);
      do
      {
        BOOL v24 = &time1[v21];
        *(void *)&long long v32 = v51;
        -[BWAdaptiveCorrectionPreviewRegistration _homographyAtDepth:calibration:narrowerMetadata:widerMetadata:pixelBufferDimensions:excludeExtrinsics:]((uint64_t)self, &v31, v10, v11, v23, v22, &v33, 1.0e10, v30, *(float64x2_t *)time2, *(float64x2_t *)&time2[16], v42, v43, v44, v45, v46, v47, v48, v49,
          v50,
          v32,
          *(_OWORD *)&v33,
          v34,
          v35,
          v36,
          v37,
          v38,
          *(long long *)v39,
          *(long long *)&v39[16],
          *(long long *)&time1[0].value,
          *(long long *)&time1[0].epoch,
          *(long long *)&time1[1].timescale,
          *(long long *)&time1[2].value,
          *(long long *)&time1[2].epoch,
          *(long long *)&time1[3].timescale,
          *(float64x2_t *)&time1[4].value,
          *(float64x2_t *)&time1[4].epoch,
          *(float64x2_t *)&time1[5].timescale,
          *(float64x2_t *)&time1[6].value,
          *(float64x2_t *)&time1[6].epoch);
        long long v25 = v36;
        *(_OWORD *)&v24[1].timescale = v35;
        *(_OWORD *)&v24[2].value = v25;
        long long v26 = v38;
        *(_OWORD *)&v24[2].epoch = v37;
        *(_OWORD *)&v24[3].timescale = v26;
        long long v27 = v34;
        v21 += 4;
        *(float64x2_t *)&v24->value = v33;
        *(_OWORD *)&v24->epoch = v27;
      }
      while (v21 != 12);
      memcpy(a5, time1, 0x120uLL);
      return 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  return v28;
}

- (int)computeApproximateCorrectionForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCameraPortType:(id)a4 narrowerPixelBufferDimensions:(id)a5 narrowerToWiderCameraScale:(double)a6 narrowerToWiderTransformsOut:(id *)a7
{
  if (a3 && a4 && a7)
  {
    uint64_t v12 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    float64x2_t v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    float64x2_t v34 = 0u;
    float64x2_t v35 = 0u;
    float64x2_t v36 = 0u;
    float64x2_t v37 = 0u;
    float64x2_t v38 = 0u;
    float64x2_t v39 = 0u;
    float64x2_t v40 = 0u;
    float64x2_t v41 = 0u;
    float64_t v42 = 0.0;
    int v13 = -[BWAdaptiveCorrectionPreviewRegistration _computeApproximateOISCalibrationFromWiderMetadata:narrowerPortType:narrowerToWiderCameraScale:calibrationOut:]((uint64_t)self, v12, (uint64_t)a4, v31.f64, a6);
    if (v13)
    {
      int v19 = v13;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      float64x2_t v29 = 0u;
      float64x2_t v30 = 0u;
      float64x2_t v27 = 0u;
      float64x2_t v28 = 0u;
      float64x2_t v26 = 0u;
      v24.f64[0] = v42;
      -[BWAdaptiveCorrectionPreviewRegistration _computeApproximateHomographyAtDepth:calibration:narrowerPortType:widerMetadata:pixelBufferDimensions:]((uint64_t)self, &v23, (uint64_t)a4, v12, *(void *)&a5, &v25, 1.0e10, v21, __src[0], __src[1], __src[2], __src[3], __src[4], __src[5], __src[6], __src[7], __src[8], *(_OWORD *)&__src[9], *(_OWORD *)&__src[10],
        *(_OWORD *)&__src[11],
        *(_OWORD *)&__src[12],
        *(_OWORD *)&__src[13],
        *(_OWORD *)&__src[14],
        __src[15],
        __src[16],
        __src[17],
        v31,
        v32,
        v33,
        v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        v40,
        v41,
        v24,
        (float64x2_t)0);
      uint64_t v14 = 0;
      memset(__src, 0, sizeof(__src));
      do
      {
        int v15 = &__src[v14];
        float64x2_t v16 = v28;
        v15[2] = v27;
        v15[3] = v16;
        float64x2_t v17 = v30;
        v15[4] = v29;
        v15[5] = v17;
        float64x2_t v18 = v26;
        v14 += 6;
        float64x2_t *v15 = v25;
        v15[1] = v18;
      }
      while (v14 != 18);
      memcpy(a7, __src, 0x120uLL);
      return 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  return v19;
}

- (uint64_t)_computeApproximateHomographyAtDepth:(uint64_t)a3@<X2> calibration:(void *)a4@<X3> narrowerPortType:(unint64_t)a5@<X4> widerMetadata:(float64x2_t *)a6@<X8> pixelBufferDimensions:(double)a7@<D0>
{
  STACK[0x778] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v45 = result;
    unint64_t v46 = HIDWORD(a5);
    [a4 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    uint64_t v48 = 0;
    char v49 = 1;
    __asm { FMOV            V20.2D, #1.0 }
    do
    {
      char v55 = v49;
      int8x16_t v56 = &a2[v48];
      *(void *)&long long v57 = v56[2];
      int8x16_t v58 = &STACK[0x6B0] + 12 * v48;
      *((void *)&v59 + 1) = 0;
      *(void *)&long long v60 = 0;
      *((void *)&v60 + 1) = *v56;
      *((void *)&v57 + 1) = v56[4];
      *(_OWORD *)int8x16_t v58 = *v56;
      *((_OWORD *)v58 + 1) = 0uLL;
      *((_OWORD *)v58 + 2) = v60;
      *((_OWORD *)v58 + 3) = 0uLL;
      *((_OWORD *)v58 + 4) = v57;
      *((float64x2_t *)v58 + 5) = _Q20;
      uint64_t v48 = 1;
      char v49 = 0;
    }
    while ((v55 & 1) != 0);
    uint64_t v61 = 0;
    v64.f64[0] = (float64_t)a2[6];
    *(void *)&long long v62 = a2[7];
    *(void *)&long long v63 = a2[8];
    v64.f64[1] = (float64_t)a2[10];
    *(void *)&long long v59 = a2[14];
    *(void *)&long long v60 = a2[15];
    *(void *)&long long v47 = a2[16];
    *((void *)&v62 + 1) = a2[11];
    *((void *)&v63 + 1) = a2[12];
    *(float64x2_t *)&STACK[0x640] = v64;
    *(_OWORD *)&STACK[0x650] = v59;
    *(_OWORD *)&STACK[0x660] = v62;
    *(_OWORD *)&STACK[0x670] = v60;
    *(_OWORD *)&STACK[0x680] = v63;
    *(_OWORD *)&STACK[0x690] = v47;
    a30 = 0u;
    a31 = 0u;
    a32 = 0u;
    a33 = 0u;
    v64.f64[1] = -1.0;
    a34 = 0u;
    a35 = 0u;
    do
    {
      float64x2_t v66 = *(float64x2_t *)((char *)&STACK[0x640] + v61);
      float64x2_t v65 = *(float64x2_t *)((char *)&STACK[0x640] + v61 + 16);
      unint64_t v67 = (float64x2_t *)((char *)&a30 + v61);
      *unint64_t v67 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_1A5EFD720, v66.f64[0]), (float64x2_t)xmmword_1A5EFD730, v66, 1), (float64x2_t)0, v65.f64[0]);
      v67[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v66, (float64x2_t)0), (float64x2_t)0, v66, 1), _Q20, v65);
      v61 += 32;
    }
    while (v61 != 96);
    uint64_t v68 = 0;
    float64x2_t v72 = a30;
    float64x2_t v69 = a31;
    float64x2_t v73 = a32;
    float64x2_t v70 = a33;
    float64x2_t v74 = a34;
    float64x2_t v71 = a35;
    *(_OWORD *)&STACK[0x640] = xmmword_1A5EFD720;
    *(_OWORD *)&STACK[0x650] = 0u;
    *(_OWORD *)&STACK[0x660] = xmmword_1A5EFD730;
    *(_OWORD *)&STACK[0x670] = 0u;
    *(_OWORD *)&STACK[0x680] = 0uLL;
    *(float64x2_t *)&STACK[0x690] = _Q20;
    a36 = 0u;
    a37 = 0u;
    a38 = 0u;
    a39 = 0u;
    *(_OWORD *)&STACK[0x620] = 0u;
    *(_OWORD *)&STACK[0x630] = 0u;
    *(void *)&v72.f64[1] = vextq_s8((int8x16_t)v72, (int8x16_t)v72, 8uLL).u64[0];
    *(void *)&v73.f64[1] = vextq_s8((int8x16_t)v73, (int8x16_t)v73, 8uLL).u64[0];
    *(void *)&v74.f64[1] = vextq_s8((int8x16_t)v74, (int8x16_t)v74, 8uLL).u64[0];
    do
    {
      float64x2_t v76 = *(float64x2_t *)((char *)&STACK[0x640] + v68);
      float64x2_t v75 = *(float64x2_t *)((char *)&STACK[0x640] + v68 + 16);
      float64x2_t v77 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v69, v76), v70, v76, 1), v75, v71);
      float64x2_t v78 = (float64x2_t *)((char *)&a36 + v68);
      *float64x2_t v78 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v72, v76.f64[0]), v73, v76, 1), v74, v75.f64[0]);
      v78[1] = v77;
      v68 += 32;
    }
    while (v68 != 96);
    uint64_t v79 = 0;
    v75.f64[0] = (float64_t)a2[9];
    v76.f64[0] = (float64_t)a2[13];
    v77.f64[0] = (float64_t)a2[17];
    float64x2_t v80 = vmulq_n_f64((float64x2_t)xmmword_1A5EFD720, v75.f64[0]);
    float64x2_t v156 = _Q20;
    float64x2_t v81 = vmlaq_f64(vmlaq_f64(vmulq_f64(v75, (float64x2_t)0), (float64x2_t)0, v76), _Q20, v77);
    float64x2_t v82 = vmlaq_n_f64(vmlaq_n_f64(v80, (float64x2_t)xmmword_1A5EFD730, v76.f64[0]), (float64x2_t)0, v77.f64[0]);
    v64.f64[0] = -1.0 / a7;
    float64x2_t v83 = vmulq_f64(v64, (float64x2_t)0);
    float64x2_t v84 = vmulq_n_f64((float64x2_t)0, -1.0 / a7);
    float64x2_t v85 = vsubq_f64(a36, v84);
    float64x2_t v86 = vsubq_f64(a37, v83);
    float64x2_t v87 = vsubq_f64(a38, v84);
    float64x2_t v88 = vsubq_f64(a39, v83);
    float64x2_t v89 = vsubq_f64(*(float64x2_t *)&STACK[0x620], vmulq_n_f64(v82, -1.0 / a7));
    float64x2_t v90 = vsubq_f64(*(float64x2_t *)&STACK[0x630], vmulq_f64(v64, v81));
    float64x2_t v94 = *(float64x2_t *)&STACK[0x710];
    float64x2_t v91 = *(float64x2_t *)&STACK[0x720];
    float64x2_t v95 = *(float64x2_t *)&STACK[0x730];
    float64x2_t v92 = *(float64x2_t *)&STACK[0x740];
    float64x2_t v96 = *(float64x2_t *)&STACK[0x750];
    float64x2_t v93 = *(float64x2_t *)&STACK[0x760];
    *(float64x2_t *)&STACK[0x640] = v85;
    *(float64x2_t *)&STACK[0x650] = v86;
    *(float64x2_t *)&STACK[0x660] = v87;
    *(float64x2_t *)&STACK[0x670] = v88;
    *(float64x2_t *)&STACK[0x680] = v89;
    *(float64x2_t *)&STACK[0x690] = v90;
    a36 = 0u;
    a37 = 0u;
    a38 = 0u;
    a39 = 0u;
    *(_OWORD *)&STACK[0x620] = 0u;
    *(_OWORD *)&STACK[0x630] = 0u;
    *(void *)&v94.f64[1] = vextq_s8((int8x16_t)v94, (int8x16_t)v94, 8uLL).u64[0];
    *(void *)&v95.f64[1] = vextq_s8((int8x16_t)v95, (int8x16_t)v95, 8uLL).u64[0];
    *(void *)&v96.f64[1] = vextq_s8((int8x16_t)v96, (int8x16_t)v96, 8uLL).u64[0];
    do
    {
      float64x2_t v98 = *(float64x2_t *)((char *)&STACK[0x640] + v79);
      float64x2_t v97 = *(float64x2_t *)((char *)&STACK[0x640] + v79 + 16);
      float64x2_t v99 = (float64x2_t *)((char *)&a36 + v79);
      *float64x2_t v99 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v94, v98.f64[0]), v95, v98, 1), v96, v97.f64[0]);
      v99[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v91, v98), v92, v98, 1), v97, v93);
      v79 += 32;
    }
    while (v79 != 96);
    long long v100 = *(_OWORD *)&STACK[0x6E0];
    *(_OWORD *)&STACK[0x660] = *(_OWORD *)&STACK[0x6D0];
    *(_OWORD *)&STACK[0x670] = v100;
    long long v101 = *(_OWORD *)&STACK[0x700];
    *(_OWORD *)&STACK[0x680] = *(_OWORD *)&STACK[0x6F0];
    *(_OWORD *)&STACK[0x690] = v101;
    long long v102 = *(_OWORD *)&STACK[0x6C0];
    *(_OWORD *)&STACK[0x640] = *(_OWORD *)&STACK[0x6B0];
    *(_OWORD *)&STACK[0x650] = v102;
    __invert_d3();
    uint64_t v103 = 0;
    float64x2_t v110 = a36;
    float64x2_t v104 = a37;
    float64x2_t v111 = a38;
    float64x2_t v105 = a39;
    float64x2_t v112 = *(float64x2_t *)&STACK[0x620];
    float64x2_t v106 = *(float64x2_t *)&STACK[0x630];
    long long v107 = a21;
    *(_OWORD *)&STACK[0x660] = a20;
    *(_OWORD *)&STACK[0x670] = v107;
    long long v108 = a23;
    *(_OWORD *)&STACK[0x680] = a22;
    *(_OWORD *)&STACK[0x690] = v108;
    long long v109 = a19;
    *(_OWORD *)&STACK[0x640] = a18;
    *(_OWORD *)&STACK[0x650] = v109;
    a24 = 0u;
    a25 = 0u;
    a26 = 0u;
    a27 = 0u;
    a28 = 0u;
    a29 = 0u;
    *(void *)&v110.f64[1] = vextq_s8((int8x16_t)v110, (int8x16_t)v110, 8uLL).u64[0];
    *(void *)&v111.f64[1] = vextq_s8((int8x16_t)v111, (int8x16_t)v111, 8uLL).u64[0];
    *(void *)&v112.f64[1] = vextq_s8((int8x16_t)v112, (int8x16_t)v112, 8uLL).u64[0];
    do
    {
      float64x2_t v114 = *(float64x2_t *)((char *)&STACK[0x640] + v103);
      float64x2_t v113 = *(float64x2_t *)((char *)&STACK[0x640] + v103 + 16);
      double v115 = (float64x2_t *)((char *)&a24 + v103);
      *double v115 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v110, v114.f64[0]), v111, v114, 1), v112, v113.f64[0]);
      v115[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v104, v114), v105, v114, 1), v113, v106);
      v103 += 32;
    }
    while (v103 != 96);
    a38 = a26;
    a39 = a27;
    long long v116 = a29;
    *(_OWORD *)&STACK[0x620] = a28;
    *(_OWORD *)&STACK[0x630] = v116;
    a36 = a24;
    a37 = a25;
    v117 = (void *)[*(id *)(v45 + 48) objectForKeyedSubscript:a3];
    long long v118 = (void *)[v117 objectForKeyedSubscript:*MEMORY[0x1E4F52D38]];
    long long v119 = (void *)[v118 objectForKeyedSubscript:*MEMORY[0x1E4F52F88]];
    long long v120 = (void *)[v118 objectForKeyedSubscript:*MEMORY[0x1E4F52F50]];
    double v121 = (double)(int)[v119 intValue];
    int v122 = [v120 intValue];
    double v123 = v121 / (double)(int)a5;
    *(double *)&long long v124 = v121 * 0.5 + (double)(int)a5 * -0.5 * v123;
    *(void *)&long long v125 = 0;
    *((double *)&v125 + 1) = v123;
    long long v154 = v125;
    *((double *)&v124 + 1) = (double)v122 * 0.5 + (double)(int)v46 * -0.5 * v123;
    long long v155 = v124;
    a28 = 0u;
    a29 = 0u;
    a26 = 0u;
    a27 = 0u;
    a24 = 0u;
    a25 = 0u;
    acpr_computePixelBufferToRawSensorHomography(a4, a5, (uint64_t)&a24);
    float64x2_t v126 = a27;
    *(float64x2_t *)&STACK[0x660] = a26;
    *(float64x2_t *)&STACK[0x670] = v126;
    long long v127 = a29;
    *(_OWORD *)&STACK[0x680] = a28;
    *(_OWORD *)&STACK[0x690] = v127;
    float64x2_t v128 = a25;
    *(float64x2_t *)&STACK[0x640] = a24;
    *(float64x2_t *)&STACK[0x650] = v128;
    BOOL result = __invert_d3();
    uint64_t v129 = 0;
    float64x2_t v130 = a39;
    *(float64x2_t *)&STACK[0x660] = a38;
    *(float64x2_t *)&STACK[0x670] = v130;
    long long v131 = *(_OWORD *)&STACK[0x630];
    *(_OWORD *)&STACK[0x680] = *(_OWORD *)&STACK[0x620];
    *(_OWORD *)&STACK[0x690] = v131;
    float64x2_t v132 = a37;
    *(float64x2_t *)&STACK[0x640] = a36;
    *(float64x2_t *)&STACK[0x650] = v132;
    float64x2_t v133 = v157;
    a12 = 0u;
    a13 = 0u;
    a14 = 0u;
    a15 = 0u;
    a16 = 0u;
    a17 = 0u;
    *(void *)&v133.f64[1] = vextq_s8((int8x16_t)v133, (int8x16_t)v133, 8uLL).u64[0];
    *(void *)&a8.f64[1] = vextq_s8((int8x16_t)a8, (int8x16_t)a8, 8uLL).u64[0];
    *(void *)&a10.f64[1] = vextq_s8((int8x16_t)a10, (int8x16_t)a10, 8uLL).u64[0];
    do
    {
      float64x2_t v137 = *(float64x2_t *)((char *)&STACK[0x640] + v129);
      float64x2_t v136 = *(float64x2_t *)((char *)&STACK[0x640] + v129 + 16);
      uint64_t v138 = (float64x2_t *)((char *)&a12 + v129);
      *uint64_t v138 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v133, v137.f64[0]), a8, v137, 1), a10, v136.f64[0]);
      v138[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(vars0, v137), a9, v137, 1), v136, a11);
      v129 += 32;
    }
    while (v129 != 96);
    uint64_t v139 = 0;
    float64x2_t v143 = a12;
    float64x2_t v140 = a13;
    float64x2_t v144 = a14;
    float64x2_t v141 = a15;
    float64x2_t v145 = a16;
    float64x2_t v142 = a17;
    *(_OWORD *)&STACK[0x640] = COERCE_UNSIGNED_INT64(v121 / (double)(int)a5);
    *(_OWORD *)&STACK[0x650] = 0u;
    *(_OWORD *)&STACK[0x660] = v154;
    *(_OWORD *)&STACK[0x670] = 0uLL;
    *(float64x2_t *)&STACK[0x690] = v156;
    *(_OWORD *)&STACK[0x680] = v155;
    *a6 = 0u;
    a6[1] = 0u;
    a6[2] = 0u;
    a6[3] = 0u;
    a6[4] = 0u;
    a6[5] = 0u;
    *(void *)&v143.f64[1] = vextq_s8((int8x16_t)v143, (int8x16_t)v143, 8uLL).u64[0];
    *(void *)&v144.f64[1] = vextq_s8((int8x16_t)v144, (int8x16_t)v144, 8uLL).u64[0];
    *(void *)&v145.f64[1] = vextq_s8((int8x16_t)v145, (int8x16_t)v145, 8uLL).u64[0];
    do
    {
      float64x2_t v147 = *(float64x2_t *)((char *)&STACK[0x640] + v139 * 16);
      float64x2_t v146 = *(float64x2_t *)((char *)&STACK[0x640] + v139 * 16 + 16);
      uint64_t v148 = &a6[v139];
      *uint64_t v148 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v143, v147.f64[0]), v144, v147, 1), v145, v146.f64[0]);
      v148[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v140, v147), v141, v147, 1), v146, v142);
      v139 += 2;
    }
    while (v139 != 6);
    float64x2_t v149 = a6[5];
    float64x2_t v150 = vmulq_f64(v149, a6[1]);
    float64x2_t v151 = vmulq_f64(v149, a6[3]);
    float64x2_t v152 = vmulq_n_f64(a6[2], v149.f64[0]);
    float64x2_t v153 = vmulq_n_f64(a6[4], v149.f64[0]);
    *a6 = vmulq_n_f64(*a6, v149.f64[0]);
    a6[1] = v150;
    a6[2] = v152;
    a6[3] = v151;
    a6[4] = v153;
    a6[5] = vmulq_f64(v149, v149);
  }
  else
  {
    a6[4] = 0u;
    a6[5] = 0u;
    a6[2] = 0u;
    a6[3] = 0u;
    *a6 = 0u;
    a6[1] = 0u;
  }
  return result;
}

- (uint64_t)_computeApproximateOISCalibrationFromWiderMetadata:(uint64_t)a3 narrowerPortType:(double *)a4 narrowerToWiderCameraScale:(double)a5 calibrationOut:
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v10 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  [v10 setObject:a3 atIndexedSubscript:0];
  objc_msgSend(v10, "setObject:atIndexedSubscript:", objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]), 1);
  uint64_t v11 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
  uint64_t v12 = *MEMORY[0x1E4F52CA8];
  int v13 = (uint64_t *)objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F52CA8]), "bytes");
  uint64_t v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", objc_msgSend(v10, "objectAtIndexedSubscript:", 0)), "objectForKeyedSubscript:", v12), "bytes");
  if (!v13 || (uint64_t v20 = (uint64_t *)v14) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_25;
  }
  *(double *)v21.i64 = acpr_convertFloatRowMajorArrayToSimdMatrix(v13, v15, v16, v17, v18, v19);
  v21.i32[3] = 0;
  v22.i32[3] = 0;
  float32x4_t v71 = v22;
  float32x4_t v72 = v21;
  v23.i32[3] = 0;
  float32x4_t v70 = v23;
  *(double *)v26.i64 = acpr_convertFloatRowMajorArrayToSimdMatrix(v20, *(double *)v21.i64, *(double *)v22.i64, *(double *)v23.i64, v24, v25);
  v26.i32[3] = 0;
  v27.i32[3] = 0;
  v28.i32[3] = 0;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  double v30 = acpr_computeRelativeExtrinsics(v26, v27, v28, v29, v72, v71, v70);
  uint64_t v31 = 0;
  DWORD2(v76) = v32;
  DWORD2(v77) = v33;
  *(double *)&long long v76 = v30;
  *(void *)&long long v77 = v34;
  DWORD2(v78) = v35;
  DWORD2(v79) = v36;
  float64x2_t v37 = a4 + 6;
  *(void *)&long long v78 = v38;
  *(void *)&long long v79 = v39;
  do
  {
    for (uint64_t i = 0; i != 4; ++i)
      v37[i] = *(float *)((unint64_t)(&v76 + i) & 0xFFFFFFFFFFFFFFF3 | (4 * (v31 & 3)));
    ++v31;
    v37 += 4;
  }
  while (v31 != 3);
  objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F54118]), "floatValue");
  if (v41 == 0.0
    || ((float v42 = v41,
         CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F54108]], &v84), float64x2_t v43 = (CGPoint *)MEMORY[0x1E4F1DAD8], v84.x == *MEMORY[0x1E4F1DAD8])? (v44 = v84.y == *(double *)(MEMORY[0x1E4F1DAD8] + 8)): (v44 = 0), v44))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0xFFFFFFFFLL;
  }
  objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F54168], v84.x, v84.y), "floatValue");
  int v46 = (int)v45;
  objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F54160]), "floatValue");
  double y = v84.y;
  a4[3] = ((double)v46 + -1.0) * 0.5 + v84.x - ((double)v46 + -1.0) * 0.5;
  a4[5] = ((double)(int)v47 + -1.0) * 0.5 + y - ((double)(int)v47 + -1.0) * 0.5;
  char v49 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
  objc_msgSend((id)objc_msgSend(v49, "objectForKeyedSubscript:", *MEMORY[0x1E4F52D28]), "floatValue");
  float v51 = v50;
  int v52 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue");
  float v53 = (float)v52;
  if (!v52) {
    float v53 = 1.0;
  }
  float v54 = v51 * v53;
  a4[1] = (float)(v42 / v54);
  if (![a2 objectForKeyedSubscript:*MEMORY[0x1E4F53F78]]) {
    goto LABEL_20;
  }
  CFDictionaryRef v55 = (const __CFDictionary *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]];
  uint64_t v75 = 0;
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  if (!v55)
  {
    CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
    CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    if (flags) {
      goto LABEL_18;
    }
    goto LABEL_23;
  }
  CMTimeMakeFromDictionary(&time, v55);
  CMTimeValue value = time.value;
  CMTimeFlags flags = time.flags;
  CMTimeScale timescale = time.timescale;
  CMTimeEpoch epoch = time.epoch;
  if ((time.flags & 1) == 0)
  {
LABEL_23:
    fig_log_get_emitter();
LABEL_25:
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
LABEL_18:
  time.CMTimeValue value = value;
  time.CMTimeScale timescale = timescale;
  time.CMTimeFlags flags = flags;
  time.CMTimeEpoch epoch = epoch;
  CMTimeGetSeconds(&time);
  uint64_t v58 = FigMotionComputeAverageSpherePosition();
  if (v58)
  {
    uint64_t v66 = v58;
    fig_log_get_emitter();
    FigDebugAssert3();
    return v66;
  }
  float v59 = *((float *)&v75 + 1);
  a4[3] = a4[3] + (float)((float)(1.0 / v54) * *(float *)&v75);
  a4[5] = a4[5] + (float)((float)(1.0 / v54) * v59);
LABEL_20:
  [v10 setObject:a3 atIndexedSubscript:0];
  float v60 = 1.0 / a5 * v42;
  uint64_t v61 = (void *)[*(id *)(a1 + 48) objectForKeyedSubscript:a3];
  long long v62 = (void *)[v61 objectForKeyedSubscript:*MEMORY[0x1E4F52D38]];
  int v63 = objc_msgSend((id)objc_msgSend(v62, "objectForKeyedSubscript:", *MEMORY[0x1E4F52F88]), "intValue");
  int v64 = objc_msgSend((id)objc_msgSend(v62, "objectForKeyedSubscript:", *MEMORY[0x1E4F52F50]), "intValue");
  double v82 = (double)v63 * 0.5;
  double v83 = (double)v64 * 0.5;
  CGPoint point = *v43;
  float64x2_t v65 = (void *)[*(id *)(a1 + 48) objectForKeyedSubscript:a3];
  CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[v65 objectForKeyedSubscript:*MEMORY[0x1E4F52D20]], &point);
  uint64_t v66 = 0;
  CGFloat v67 = point.x + v82;
  CGFloat v68 = point.y + v83;
  *a4 = v60;
  a4[2] = v67;
  a4[4] = v68;
  return v66;
}

- (uint64_t)_computeOISCalibrationFromWiderMetadata:(uint64_t)a3 narrowerMetadata:(int)a4 updateEstimatedSagPositions:(int)a5 excludeEstimatedSagFromAlignment:(uint64_t)a6 calibrationOut:
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  CFStringRef v9 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  uint64_t v10 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  [v9 setObject:a3 atIndexedSubscript:0];
  char v11 = 1;
  [v9 setObject:a2 atIndexedSubscript:1];
  uint64_t v12 = 0;
  uint64_t v115 = *MEMORY[0x1E4F54128];
  uint64_t v112 = *MEMORY[0x1E4F54118];
  uint64_t v109 = *MEMORY[0x1E4F54108];
  double v13 = *MEMORY[0x1E4F1DAD8];
  double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  uint64_t v15 = *MEMORY[0x1E4F54168];
  uint64_t v16 = *MEMORY[0x1E4F54160];
  do
  {
    char v17 = v11;
    objc_msgSend(v10, "setObject:atIndexedSubscript:", objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v12), "objectForKeyedSubscript:", v115), v12);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v12), "objectForKeyedSubscript:", v112), "floatValue");
    *(float *)&v130[v12] = v18;
    if (v18 == 0.0
      || ((int32x4_t v19 = (CGPoint *)&v130[4 * v12 + 6],
           CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v12), "objectForKeyedSubscript:", v109), v19), y = v19->y, v19->x == v13)? (BOOL v21 = y == v14): (BOOL v21 = 0), v21))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0xFFFFFFFFLL;
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v12, v19->x, y), "objectForKeyedSubscript:", v15), "floatValue");
    int v23 = (int)v22;
    double v24 = &v130[2 * v12 + 2];
    *double v24 = (int)v22;
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v12), "objectForKeyedSubscript:", v16), "floatValue");
    char v11 = 0;
    v24[1] = (int)v25;
    int32x4_t v26 = &v130[2 * v12 + 14];
    *int32x4_t v26 = v23;
    v26[1] = (int)v25;
    uint64_t v12 = 1;
  }
  while ((v17 & 1) != 0);
  long long v116 = v9;
  int32x4_t v27 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
  uint64_t v28 = *MEMORY[0x1E4F52CA8];
  double v29 = (uint64_t *)objc_msgSend((id)objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E4F52CA8]), "bytes");
  uint64_t v30 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", objc_msgSend(v10, "objectAtIndexedSubscript:", 0)), "objectForKeyedSubscript:", v28), "bytes");
  if (v29)
  {
    int v36 = (uint64_t *)v30;
    if (v30)
    {
      *(double *)v37.i64 = acpr_convertFloatRowMajorArrayToSimdMatrix(v29, v31, v32, v33, v34, v35);
      v37.i32[3] = 0;
      v38.i32[3] = 0;
      float32x4_t v110 = v38;
      float32x4_t v113 = v37;
      v39.i32[3] = 0;
      float32x4_t v106 = v39;
      *(double *)v42.i64 = acpr_convertFloatRowMajorArrayToSimdMatrix(v36, *(double *)v37.i64, *(double *)v38.i64, *(double *)v39.i64, v40, v41);
      v42.i32[3] = 0;
      v43.i32[3] = 0;
      v44.i32[3] = 0;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      double v46 = acpr_computeRelativeExtrinsics(v42, v43, v44, v45, v113, v110, v106);
      uint64_t v47 = 0;
      DWORD2(v123) = v48;
      DWORD2(v124) = v49;
      *(double *)&long long v123 = v46;
      *(void *)&long long v124 = v50;
      DWORD2(v125) = v51;
      DWORD2(v126) = v52;
      uint64_t v53 = a6 + 48;
      *(void *)&long long v125 = v54;
      *(void *)&long long v126 = v55;
      do
      {
        for (uint64_t i = 0; i != 4; ++i)
          *(double *)(v53 + 8 * i) = *(float *)((unint64_t)(&v123 + i) & 0xFFFFFFFFFFFFFFF3 | (4 * (v47 & 3)));
        ++v47;
        v53 += 32;
      }
      while (v47 != 3);
      uint64_t v57 = 0;
      uint64_t v107 = *MEMORY[0x1E4F52D28];
      uint64_t v105 = *MEMORY[0x1E4F54148];
      uint64_t v104 = *MEMORY[0x1E4F53F78];
      uint64_t v102 = *MEMORY[0x1E4F530C0];
      CMTimeFlags v101 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
      CMTimeEpoch v100 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      uint64_t v99 = *MEMORY[0x1E4F54300];
      char v58 = 1;
      uint64_t v59 = *MEMORY[0x1E4F53F80];
      uint64_t v60 = *MEMORY[0x1E4F53F88];
      while (1)
      {
        char v61 = v58;
        long long v62 = &v130[2 * v57 + 2];
        double v63 = ((double)*v62 + -1.0) * 0.5;
        double v64 = ((double)v62[1] + -1.0) * 0.5;
        float64x2_t v65 = &v130[2 * v57 + 14];
        uint64_t v66 = (double *)&v130[4 * v57 + 6];
        double v67 = v66[1];
        double v68 = (double)v65[1] + -1.0;
        uint64_t v69 = a6 + 8 * v57;
        *(double *)(v69 + 16) = ((double)*v65 + -1.0) * 0.5 + *v66 - v63;
        float64x2_t v114 = (double *)(v69 + 16);
        *(double *)(v69 + 32) = v68 * 0.5 + v67 - v64;
        float32x4_t v70 = (double *)(v69 + 32);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", objc_msgSend(v10, "objectAtIndexedSubscript:", v57)), "objectForKeyedSubscript:", v107), "floatValue");
        float v72 = v71;
        int v73 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v116, "objectAtIndexedSubscript:", v57), "objectForKeyedSubscript:", v105), "intValue");
        float v74 = (float)v73;
        if (!v73) {
          float v74 = 1.0;
        }
        float v75 = v72 * v74;
        *(double *)(a6 + 8 * v57) = (float)(*(float *)&v130[v57] / v75);
        if (objc_msgSend((id)objc_msgSend(v116, "objectAtIndexedSubscript:", v57), "objectForKeyedSubscript:", v104))
        {
          char v111 = v61;
          CFDictionaryRef v76 = (const __CFDictionary *)objc_msgSend((id)objc_msgSend(v116, "objectAtIndexedSubscript:", v57), "objectForKeyedSubscript:", v102);
          uint64_t v122 = 0;
          CMTimeValue value = *MEMORY[0x1E4F1F9F8];
          CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
          CMTimeFlags flags = v101;
          CMTimeEpoch epoch = v100;
          if (v76)
          {
            CMTimeMakeFromDictionary(&time, v76);
            CMTimeValue value = time.value;
            CMTimeFlags flags = time.flags;
            CMTimeScale timescale = time.timescale;
            CMTimeEpoch epoch = time.epoch;
          }
          if ((flags & 1) == 0)
          {
            fig_log_get_emitter();
            goto LABEL_46;
          }
          [v116 objectAtIndexedSubscript:v57];
          time.CMTimeValue value = value;
          time.CMTimeScale timescale = timescale;
          time.CMTimeFlags flags = flags;
          time.CMTimeEpoch epoch = epoch;
          CMTimeGetSeconds(&time);
          uint64_t v79 = FigMotionComputeAverageSpherePosition();
          if (v79)
          {
            uint64_t v96 = v79;
            fig_log_get_emitter();
            FigDebugAssert3();
            return v96;
          }
          float v80 = 1.0 / v75;
          uint64_t v81 = v122;
          double *v114 = *v114 + (float)((float)(1.0 / v75) * *(float *)&v122);
          *float32x4_t v70 = *v70 + (float)((float)(1.0 / v75) * *((float *)&v81 + 1));
          if (a4 | a5)
          {
            CGFloat v82 = -[BWAdaptiveCorrectionPreviewRegistration _estimatedSagPositionUsingOISShift:forPortType:](a1, [v10 objectAtIndexedSubscript:v57], *(float *)&v81, *((float *)&v81 + 1));
            double v84 = v82;
            double v85 = v83;
            if (a4) {
              objc_msgSend(*(id *)(a1 + 632), "setObject:forKeyedSubscript:", CGPointCreateDictionaryRepresentation(*(CGPoint *)&v82), objc_msgSend(v10, "objectAtIndexedSubscript:", v57));
            }
            if (a5)
            {
              double *v114 = *v114 - v84 * v80;
              *float32x4_t v70 = *v70 - v85 * v80;
            }
          }
          float64x2_t v86 = objc_msgSend((id)objc_msgSend(v116, "objectAtIndexedSubscript:", v57), "objectForKeyedSubscript:", v99);
          if (a4)
          {
            float64x2_t v87 = v86;
            if (v86)
            {
              long long v119 = 0u;
              long long v120 = 0u;
              long long v117 = 0u;
              long long v118 = 0u;
              uint64_t v88 = [v86 countByEnumeratingWithState:&v117 objects:v127 count:16];
              if (v88)
              {
                uint64_t v89 = v88;
                uint64_t v90 = *(void *)v118;
                do
                {
                  for (uint64_t j = 0; j != v89; ++j)
                  {
                    if (*(void *)v118 != v90) {
                      objc_enumerationMutation(v87);
                    }
                    float64x2_t v92 = *(void **)(*((void *)&v117 + 1) + 8 * j);
                    if ((objc_msgSend(v92, "isEqualToString:", objc_msgSend(v10, "objectAtIndexedSubscript:", 0)) & 1) == 0
                      && (objc_msgSend(v92, "isEqualToString:", objc_msgSend(v10, "objectAtIndexedSubscript:", 1)) & 1) == 0)
                    {
                      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v87, "objectForKeyedSubscript:", v92), "objectForKeyedSubscript:", v59), "doubleValue");
                      double v94 = v93 * 0.00390625;
                      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v87, "objectForKeyedSubscript:", v92), "objectForKeyedSubscript:", v60), "doubleValue");
                      v132.x = [(BWAdaptiveCorrectionPreviewRegistration *)a1 _estimatedSagPositionUsingOISShift:v94 forPortType:v95 * 0.00390625];
                      [*(id *)(a1 + 632) setObject:CGPointCreateDictionaryRepresentation(v132) forKeyedSubscript:v92];
                    }
                  }
                  uint64_t v89 = [v87 countByEnumeratingWithState:&v117 objects:v127 count:16];
                }
                while (v89);
              }
            }
          }
          char v61 = v111;
        }
        char v58 = 0;
        uint64_t v57 = 1;
        if ((v61 & 1) == 0) {
          return 0;
        }
      }
    }
  }
  fig_log_get_emitter();
LABEL_46:
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (uint64_t)_homographyAtDepth:(void *)a3@<X2> calibration:(void *)a4@<X3> narrowerMetadata:(uint64_t)a5@<X4> widerMetadata:(char)a6@<W5> pixelBufferDimensions:(float64x2_t *)a7@<X8> excludeExtrinsics:(double)a8@<D0>
{
  STACK[0x818] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    double v45 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    unsigned int v164 = a3;
    [v45 setObject:a3 atIndexedSubscript:0];
    char v46 = 1;
    [v45 setObject:a4 atIndexedSubscript:1];
    uint64_t v47 = 0;
    uint64_t v48 = *MEMORY[0x1E4F54128];
    uint64_t v49 = *MEMORY[0x1E4F54160];
    __asm { FMOV            V21.2D, #1.0 }
    float64x2_t v167 = _Q21;
    do
    {
      char v55 = v46;
      objc_msgSend((id)objc_msgSend(v45, "objectAtIndexedSubscript:", v47), "objectForKeyedSubscript:", v48);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v45, "objectAtIndexedSubscript:", v47), "objectForKeyedSubscript:", v49), "intValue");
      float64x2_t v59 = v167;
      char v46 = 0;
      uint64_t v60 = &a2[v47];
      unint64_t v61 = *v60;
      *(void *)&long long v62 = v60[2];
      *((void *)&v62 + 1) = v60[4];
      double v63 = &STACK[0x750] + 12 * v47;
      *(void *)&long long v64 = 0;
      *((void *)&v64 + 1) = v61;
      *(_OWORD *)double v63 = v61;
      *((_OWORD *)v63 + 1) = 0u;
      *((_OWORD *)v63 + 2) = v64;
      *((_OWORD *)v63 + 3) = 0u;
      *((_OWORD *)v63 + 4) = v62;
      *((float64x2_t *)v63 + 5) = v167;
      uint64_t v47 = 1;
    }
    while ((v55 & 1) != 0);
    if (a6)
    {
      float64x2_t v65 = (float64x2_t)xmmword_1A5EFD700;
      float64x2_t v66 = (float64x2_t)xmmword_1A5EFD710;
      float64x2_t v67 = 0uLL;
      float64x2_t v68 = 0uLL;
      float64x2_t v69 = 0uLL;
      float64x2_t v70 = 0uLL;
      float64x2_t v71 = 0uLL;
      int v73 = a4;
      uint64_t v72 = a5;
      float v74 = v164;
    }
    else
    {
      uint64_t v75 = 0;
      *(void *)&long long v76 = a2[6];
      *(void *)&long long v77 = a2[7];
      *(void *)&long long v78 = a2[8];
      *((void *)&v76 + 1) = a2[10];
      *(void *)&long long v56 = a2[14];
      *(void *)&long long v57 = a2[15];
      *(void *)&long long v58 = a2[16];
      *((void *)&v77 + 1) = a2[11];
      *((void *)&v78 + 1) = a2[12];
      *(_OWORD *)&STACK[0x6F0] = v76;
      *(_OWORD *)&STACK[0x700] = v56;
      *(_OWORD *)&STACK[0x710] = v77;
      *(_OWORD *)&STACK[0x720] = v57;
      *(_OWORD *)&STACK[0x730] = v78;
      *(_OWORD *)&STACK[0x740] = v58;
      a36 = 0u;
      a37 = 0u;
      a38 = 0u;
      a39 = 0u;
      __asm { FMOV            V1.2D, #1.0 }
      a40 = 0u;
      *(_OWORD *)&STACK[0x680] = 0u;
      do
      {
        float64x2_t v81 = *(float64x2_t *)((char *)&STACK[0x6F0] + v75);
        float64x2_t v80 = *(float64x2_t *)((char *)&STACK[0x6F0] + v75 + 16);
        CGFloat v82 = (float64x2_t *)((char *)&a36 + v75);
        *CGFloat v82 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_1A5EFD720, v81.f64[0]), (float64x2_t)xmmword_1A5EFD730, v81, 1), (float64x2_t)0, v80.f64[0]);
        v82[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v81, (float64x2_t)0), (float64x2_t)0, v81, 1), _Q1, v80);
        v75 += 32;
      }
      while (v75 != 96);
      uint64_t v83 = 0;
      float64x2_t v87 = a36;
      float64x2_t v84 = a37;
      float64x2_t v88 = a38;
      float64x2_t v85 = a39;
      float64x2_t v89 = a40;
      float64x2_t v86 = *(float64x2_t *)&STACK[0x680];
      *(_OWORD *)&STACK[0x6F0] = xmmword_1A5EFD720;
      *(_OWORD *)&STACK[0x700] = 0u;
      *(_OWORD *)&STACK[0x710] = xmmword_1A5EFD730;
      *(_OWORD *)&STACK[0x720] = 0u;
      *(_OWORD *)&STACK[0x730] = 0uLL;
      *(float64x2_t *)&STACK[0x740] = _Q1;
      *(_OWORD *)&STACK[0x690] = 0u;
      *(_OWORD *)&STACK[0x6A0] = 0u;
      *(_OWORD *)&STACK[0x6B0] = 0u;
      *(_OWORD *)&STACK[0x6C0] = 0u;
      *(_OWORD *)&STACK[0x6D0] = 0u;
      *(_OWORD *)&STACK[0x6E0] = 0u;
      *(void *)&v87.f64[1] = vextq_s8((int8x16_t)v87, (int8x16_t)v87, 8uLL).u64[0];
      *(void *)&v88.f64[1] = vextq_s8((int8x16_t)v88, (int8x16_t)v88, 8uLL).u64[0];
      *(void *)&v89.f64[1] = vextq_s8((int8x16_t)v89, (int8x16_t)v89, 8uLL).u64[0];
      int v73 = a4;
      uint64_t v72 = a5;
      float v74 = v164;
      do
      {
        float64x2_t v91 = *(float64x2_t *)((char *)&STACK[0x6F0] + v83);
        float64x2_t v90 = *(float64x2_t *)((char *)&STACK[0x6F0] + v83 + 16);
        float64x2_t v92 = (float64x2_t *)((char *)&STACK[0x690] + v83);
        *float64x2_t v92 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v87, v91.f64[0]), v88, v91, 1), v89, v90.f64[0]);
        v92[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v84, v91), v85, v91, 1), v90, v86);
        v83 += 32;
      }
      while (v83 != 96);
      float64x2_t v66 = *(float64x2_t *)&STACK[0x690];
      float64x2_t v67 = *(float64x2_t *)&STACK[0x6A0];
      float64x2_t v65 = *(float64x2_t *)&STACK[0x6B0];
      float64x2_t v68 = *(float64x2_t *)&STACK[0x6C0];
      float64x2_t v69 = *(float64x2_t *)&STACK[0x6D0];
      float64x2_t v59 = *(float64x2_t *)&STACK[0x6E0];
      v86.f64[0] = (float64_t)a2[9];
      v90.f64[0] = (float64_t)a2[13];
      v91.f64[0] = (float64_t)a2[17];
      float64x2_t v93 = vmulq_n_f64((float64x2_t)xmmword_1A5EFD720, v86.f64[0]);
      float64x2_t v71 = vmlaq_f64(vmlaq_f64(vmulq_f64(v86, (float64x2_t)0), (float64x2_t)0, v90), _Q1, v91);
      float64x2_t v70 = vmlaq_n_f64(vmlaq_n_f64(v93, (float64x2_t)xmmword_1A5EFD730, v90.f64[0]), (float64x2_t)0, v91.f64[0]);
    }
    uint64_t v94 = 0;
    float64x2_t v95 = (float64x2_t)vdupq_laneq_s64((int64x2_t)v70, 1);
    v70.f64[1] = v95.f64[0];
    v95.f64[0] = -1.0 / a8;
    float64x2_t v96 = vmulq_f64(v95, (float64x2_t)0);
    float64x2_t v97 = vmulq_n_f64((float64x2_t)0, -1.0 / a8);
    float64x2_t v98 = vmulq_f64(v95, v71);
    float64x2_t v99 = vsubq_f64(v66, v97);
    float64x2_t v100 = vsubq_f64(v67, v96);
    float64x2_t v101 = vsubq_f64(v65, v97);
    float64x2_t v102 = vsubq_f64(v68, v96);
    float64x2_t v103 = vsubq_f64(v69, vmulq_n_f64(v70, -1.0 / a8));
    float64x2_t v104 = vsubq_f64(v59, v98);
    float64x2_t v108 = *(float64x2_t *)&STACK[0x7B0];
    float64x2_t v105 = *(float64x2_t *)&STACK[0x7C0];
    float64x2_t v109 = *(float64x2_t *)&STACK[0x7D0];
    float64x2_t v106 = *(float64x2_t *)&STACK[0x7E0];
    float64x2_t v110 = *(float64x2_t *)&STACK[0x7F0];
    float64x2_t v107 = *(float64x2_t *)&STACK[0x800];
    *(float64x2_t *)&STACK[0x6F0] = v99;
    *(float64x2_t *)&STACK[0x700] = v100;
    *(float64x2_t *)&STACK[0x710] = v101;
    *(float64x2_t *)&STACK[0x720] = v102;
    *(float64x2_t *)&STACK[0x730] = v103;
    *(float64x2_t *)&STACK[0x740] = v104;
    *(_OWORD *)&STACK[0x690] = 0uLL;
    *(_OWORD *)&STACK[0x6A0] = 0uLL;
    *(_OWORD *)&STACK[0x6B0] = 0uLL;
    *(_OWORD *)&STACK[0x6C0] = 0uLL;
    *(_OWORD *)&STACK[0x6D0] = 0uLL;
    *(_OWORD *)&STACK[0x6E0] = 0uLL;
    *(void *)&v108.f64[1] = vextq_s8((int8x16_t)v108, (int8x16_t)v108, 8uLL).u64[0];
    *(void *)&v109.f64[1] = vextq_s8((int8x16_t)v109, (int8x16_t)v109, 8uLL).u64[0];
    *(void *)&v110.f64[1] = vextq_s8((int8x16_t)v110, (int8x16_t)v110, 8uLL).u64[0];
    do
    {
      float64x2_t v112 = *(float64x2_t *)((char *)&STACK[0x6F0] + v94);
      float64x2_t v111 = *(float64x2_t *)((char *)&STACK[0x6F0] + v94 + 16);
      float32x4_t v113 = (float64x2_t *)((char *)&STACK[0x690] + v94);
      *float32x4_t v113 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v108, v112.f64[0]), v109, v112, 1), v110, v111.f64[0]);
      v113[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v105, v112), v106, v112, 1), v111, v107);
      v94 += 32;
    }
    while (v94 != 96);
    long long v114 = *(_OWORD *)&STACK[0x780];
    *(_OWORD *)&STACK[0x710] = *(_OWORD *)&STACK[0x770];
    *(_OWORD *)&STACK[0x720] = v114;
    long long v115 = *(_OWORD *)&STACK[0x7A0];
    *(_OWORD *)&STACK[0x730] = *(_OWORD *)&STACK[0x790];
    *(_OWORD *)&STACK[0x740] = v115;
    long long v116 = *(_OWORD *)&STACK[0x760];
    *(_OWORD *)&STACK[0x6F0] = *(_OWORD *)&STACK[0x750];
    *(_OWORD *)&STACK[0x700] = v116;
    __invert_d3();
    uint64_t v117 = 0;
    float64x2_t v124 = *(float64x2_t *)&STACK[0x690];
    float64x2_t v118 = *(float64x2_t *)&STACK[0x6A0];
    float64x2_t v125 = *(float64x2_t *)&STACK[0x6B0];
    float64x2_t v119 = *(float64x2_t *)&STACK[0x6C0];
    float64x2_t v126 = *(float64x2_t *)&STACK[0x6D0];
    float64x2_t v120 = *(float64x2_t *)&STACK[0x6E0];
    long long v121 = a27;
    *(_OWORD *)&STACK[0x710] = a26;
    *(_OWORD *)&STACK[0x720] = v121;
    long long v122 = a29;
    *(_OWORD *)&STACK[0x730] = a28;
    *(_OWORD *)&STACK[0x740] = v122;
    long long v123 = a25;
    *(_OWORD *)&STACK[0x6F0] = a24;
    *(_OWORD *)&STACK[0x700] = v123;
    a30 = 0u;
    a31 = 0u;
    a32 = 0u;
    a33 = 0u;
    a34 = 0u;
    a35 = 0u;
    *(void *)&v124.f64[1] = vextq_s8((int8x16_t)v124, (int8x16_t)v124, 8uLL).u64[0];
    *(void *)&v125.f64[1] = vextq_s8((int8x16_t)v125, (int8x16_t)v125, 8uLL).u64[0];
    *(void *)&v126.f64[1] = vextq_s8((int8x16_t)v126, (int8x16_t)v126, 8uLL).u64[0];
    do
    {
      float64x2_t v128 = *(float64x2_t *)((char *)&STACK[0x6F0] + v117);
      float64x2_t v127 = *(float64x2_t *)((char *)&STACK[0x6F0] + v117 + 16);
      uint64_t v129 = (float64x2_t *)((char *)&a30 + v117);
      *uint64_t v129 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v124, v128.f64[0]), v125, v128, 1), v126, v127.f64[0]);
      v129[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v118, v128), v119, v128, 1), v127, v120);
      v117 += 32;
    }
    while (v117 != 96);
    long long v130 = a33;
    *(_OWORD *)&STACK[0x6B0] = a32;
    *(_OWORD *)&STACK[0x6C0] = v130;
    long long v131 = a35;
    *(_OWORD *)&STACK[0x6D0] = a34;
    *(_OWORD *)&STACK[0x6E0] = v131;
    long long v132 = a31;
    *(_OWORD *)&STACK[0x690] = a30;
    *(_OWORD *)&STACK[0x6A0] = v132;
    a34 = 0u;
    a35 = 0u;
    a32 = 0u;
    a33 = 0u;
    a30 = 0u;
    a31 = 0u;
    acpr_computePixelBufferToRawSensorHomography(v74, v72, (uint64_t)&a30);
    a22 = 0u;
    a23 = 0u;
    a20 = 0u;
    a21 = 0u;
    a18 = 0u;
    a19 = 0u;
    acpr_computePixelBufferToRawSensorHomography(v73, v72, (uint64_t)&a18);
    long long v133 = a21;
    *(_OWORD *)&STACK[0x710] = a20;
    *(_OWORD *)&STACK[0x720] = v133;
    long long v134 = a23;
    *(_OWORD *)&STACK[0x730] = a22;
    *(_OWORD *)&STACK[0x740] = v134;
    long long v135 = a19;
    *(_OWORD *)&STACK[0x6F0] = a18;
    *(_OWORD *)&STACK[0x700] = v135;
    BOOL result = __invert_d3();
    uint64_t v136 = 0;
    long long v137 = *(_OWORD *)&STACK[0x6C0];
    *(_OWORD *)&STACK[0x710] = *(_OWORD *)&STACK[0x6B0];
    *(_OWORD *)&STACK[0x720] = v137;
    long long v138 = *(_OWORD *)&STACK[0x6E0];
    *(_OWORD *)&STACK[0x730] = *(_OWORD *)&STACK[0x6D0];
    *(_OWORD *)&STACK[0x740] = v138;
    long long v139 = *(_OWORD *)&STACK[0x6A0];
    *(_OWORD *)&STACK[0x6F0] = *(_OWORD *)&STACK[0x690];
    *(_OWORD *)&STACK[0x700] = v139;
    float64x2_t v140 = v168;
    float64x2_t v141 = vars0;
    a12 = 0u;
    a13 = 0u;
    a14 = 0u;
    a15 = 0u;
    a16 = 0u;
    a17 = 0u;
    *(void *)&v140.f64[1] = vextq_s8((int8x16_t)v140, (int8x16_t)v140, 8uLL).u64[0];
    *(void *)&v141.f64[1] = vextq_s8((int8x16_t)v141, (int8x16_t)v141, 8uLL).u64[0];
    *(void *)&a10.f64[1] = vextq_s8((int8x16_t)a10, (int8x16_t)a10, 8uLL).u64[0];
    do
    {
      float64x2_t v144 = *(float64x2_t *)((char *)&STACK[0x6F0] + v136);
      float64x2_t v143 = *(float64x2_t *)((char *)&STACK[0x6F0] + v136 + 16);
      float64x2_t v145 = (float64x2_t *)((char *)&a12 + v136);
      *float64x2_t v145 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v140, v144.f64[0]), v141, v144, 1), a10, v143.f64[0]);
      v145[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v169, v144), a9, v144, 1), v143, a11);
      v136 += 32;
    }
    while (v136 != 96);
    uint64_t v146 = 0;
    long long v147 = a33;
    *(_OWORD *)&STACK[0x710] = a32;
    *(_OWORD *)&STACK[0x720] = v147;
    long long v148 = a35;
    *(_OWORD *)&STACK[0x730] = a34;
    *(_OWORD *)&STACK[0x740] = v148;
    long long v149 = a31;
    *(_OWORD *)&STACK[0x6F0] = a30;
    *(_OWORD *)&STACK[0x700] = v149;
    float64x2_t v153 = a12;
    float64x2_t v150 = a13;
    float64x2_t v154 = a14;
    float64x2_t v151 = a15;
    float64x2_t v155 = a16;
    float64x2_t v152 = a17;
    *a7 = 0u;
    a7[1] = 0u;
    a7[2] = 0u;
    a7[3] = 0u;
    a7[4] = 0u;
    a7[5] = 0u;
    *(void *)&v153.f64[1] = vextq_s8((int8x16_t)v153, (int8x16_t)v153, 8uLL).u64[0];
    *(void *)&v154.f64[1] = vextq_s8((int8x16_t)v154, (int8x16_t)v154, 8uLL).u64[0];
    *(void *)&v155.f64[1] = vextq_s8((int8x16_t)v155, (int8x16_t)v155, 8uLL).u64[0];
    do
    {
      float64x2_t v157 = *(float64x2_t *)((char *)&STACK[0x6F0] + v146 * 16);
      float64x2_t v156 = *(float64x2_t *)((char *)&STACK[0x6F0] + v146 * 16 + 16);
      float64x2_t v158 = &a7[v146];
      *float64x2_t v158 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v153, v157.f64[0]), v154, v157, 1), v155, v156.f64[0]);
      v158[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v150, v157), v151, v157, 1), v156, v152);
      v146 += 2;
    }
    while (v146 != 6);
    float64x2_t v159 = a7[5];
    float64x2_t v160 = vmulq_f64(v159, a7[1]);
    float64x2_t v161 = vmulq_f64(v159, a7[3]);
    float64x2_t v162 = vmulq_n_f64(a7[2], v159.f64[0]);
    float64x2_t v163 = vmulq_n_f64(a7[4], v159.f64[0]);
    *a7 = vmulq_n_f64(*a7, v159.f64[0]);
    a7[1] = v160;
    a7[2] = v162;
    a7[3] = v161;
    a7[4] = v163;
    a7[5] = vmulq_f64(v159, v159);
  }
  else
  {
    a7[4] = 0u;
    a7[5] = 0u;
    a7[2] = 0u;
    a7[3] = 0u;
    *a7 = 0u;
    a7[1] = 0u;
  }
  return result;
}

- (CGFloat)_estimatedSagPositionUsingOISShift:(double)a3 forPortType:(double)a4
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v8 = (double *)MEMORY[0x1E4F1DAD8];
  CGPoint v13 = (CGPoint)*MEMORY[0x1E4F1DAD8];
  if ([*(id *)(a1 + 632) objectForKeyedSubscript:a2]) {
    CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[*(id *)(a1 + 632) objectForKeyedSubscript:a2], &v13);
  }
  double v9 = v8[1];
  if (a3 == *v8 && a4 == v9) {
    return v13.x;
  }
  if (v13.x != *v8 || v13.y != v9) {
    return v13.x * (float)(1.0 - *(float *)(a1 + 628)) + a3 * *(float *)(a1 + 628);
  }
  return a3;
}

+ (void)initialize
{
}

- (int)allocateResourcesWithVideoFormat:(id)a3 metalContext:(id)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  if (!a4 || !a3)
  {
    fig_log_get_emitter();
    uint64_t v37 = v4;
    LODWORD(v36) = 0;
    FigDebugAssert3();
    int v32 = -12780;
    goto LABEL_31;
  }
  self->_resourcesCleaned = 0;
  int AdaptiveCorrection = -[BWAdaptiveCorrectionPreviewRegistration _loadAdaptiveCorrectionSymbols]((uint64_t)self);
  if (AdaptiveCorrection)
  {
    int v34 = AdaptiveCorrection;
    fig_log_get_emitter();
    uint64_t v37 = v4;
    LODWORD(v36) = v34;
LABEL_30:
    FigDebugAssert3();
    int v32 = -12786;
LABEL_31:
    [(BWAdaptiveCorrectionPreviewRegistration *)self cleanupResources];
    return v32;
  }
  self->_metalContext = (FigMetalContext *)a4;
  double v9 = (FigRegToolboxGPU *)objc_msgSend(objc_alloc(MEMORY[0x1E4F55F68]), "initWithCommandQueue:", -[FigMetalContext commandQueue](self->_metalContext, "commandQueue"));
  self->_keypointDetector = v9;
  if (v9)
  {
    OSStatus v10 = VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &self->_cropAndScaleSession);
    if (v10
      || (OSStatus v10 = VTSessionSetProperty(self->_cropAndScaleSession, (CFStringRef)*MEMORY[0x1E4F45088], MEMORY[0x1E4F1CC38])) != 0)
    {
      int v32 = v10;
      fig_log_get_emitter();
      uint64_t v37 = v4;
      LODWORD(v36) = v32;
      FigDebugAssert3();
      goto LABEL_31;
    }
    tuningParameters = self->_tuningParameters;
    if (tuningParameters)
    {
      [(BWAdaptiveCorrectionPreviewRegistrationTuningParameters *)tuningParameters regToolBoxConfig];
      LODWORD(v12) = 0;
    }
    else
    {
      double v12 = 0.0;
    }
    LODWORD(v36) = 0;
    int v13 = [(FigRegToolboxGPU *)self->_keypointDetector allocateResources:0 imageWidth:0 imageHeight:0 gridWidth:0 gridHeight:0 templateRadius:0 searchRadius:v12 minNCCThreshold:v36];
    if (v13)
    {
      int v35 = v13;
      fig_log_get_emitter();
      uint64_t v37 = v4;
      LODWORD(v36) = v35;
    }
    else
    {
      double v14 = objc_alloc_init(BWVideoFormatRequirements);
      uint64_t v15 = self->_tuningParameters;
      if (v15)
      {
        [(BWAdaptiveCorrectionPreviewRegistrationTuningParameters *)v15 regToolBoxConfig];
        uint64_t v16 = DWORD1(v40);
      }
      else
      {
        uint64_t v16 = 0;
        long long v40 = 0u;
        long long v41 = 0u;
      }
      [(BWVideoFormatRequirements *)v14 setWidth:v16];
      char v17 = self->_tuningParameters;
      if (v17)
      {
        [(BWAdaptiveCorrectionPreviewRegistrationTuningParameters *)v17 regToolBoxConfig];
        uint64_t v18 = DWORD2(v38);
      }
      else
      {
        uint64_t v18 = 0;
        long long v38 = 0u;
        long long v39 = 0u;
      }
      [(BWVideoFormatRequirements *)v14 setHeight:v18];
      v43[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v14, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1]);
      int32x4_t v42 = v14;
      int32x4_t v19 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1]), 2, @"BWAdaptiveCorrectionPreviewRegistration", +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"));
      self->_registrationPool = v19;
      if (v19)
      {
        unsigned int v20 = [(BWAdaptiveCorrectionPreviewRegistrationTuningParameters *)self->_tuningParameters configuredNumKeypoints];
        BOOL v21 = ($9A3F6720D51884C1BD061C340F5007EE *)malloc_type_malloc(24 * v20, 0xD306E1DEuLL);
        self->_keypointList = v21;
        if (v21)
        {
          uint64_t v22 = 0;
          uint64_t v23 = v20;
          size_t v24 = 16 * v20;
          char v25 = 1;
          while (1)
          {
            char v26 = v25;
            int32x4_t v27 = (double *)malloc_type_malloc(v24, 0x100004000313F17uLL);
            self->_validKeypointsInSensorResolution[v22] = v27;
            if (!v27) {
              break;
            }
            uint64_t v28 = (double *)malloc_type_malloc(v24, 0x100004000313F17uLL);
            self->_transposedKeypoints[v22] = v28;
            if (!v28) {
              break;
            }
            char v25 = 0;
            uint64_t v22 = 1;
            if ((v26 & 1) == 0)
            {
              uint64_t v29 = 0;
              while (1)
              {
                uint64_t v30 = (double *)malloc_type_malloc(8 * v23, 0x100004000313F17uLL);
                self->_keypointWeights[v29] = v30;
                if (!v30) {
                  goto LABEL_29;
                }
                if (++v29 == 3)
                {
                  double v31 = (double *)malloc_type_malloc(8 * v23, 0x100004000313F17uLL);
                  self->_keypointDepths = v31;
                  if (!v31) {
                    goto LABEL_29;
                  }
                  return 0;
                }
              }
            }
          }
        }
      }
LABEL_29:
      fig_log_get_emitter();
      uint64_t v37 = v4;
      LODWORD(v36) = 0;
    }
    goto LABEL_30;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

- (uint64_t)_loadAdaptiveCorrectionSymbols
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [+[FigCaptureCameraParameters sharedInstance] disparityVersion];
    if ((int)v2 > 3)
    {
      v3 = objc_msgSend(NSString, "stringWithFormat:", @"DisparityV%d.bundle", v2);
      uint64_t v4 = [NSString stringWithFormat:@"%@%@", @"/System/Library/VideoProcessors/", v3];
      v5 = dlopen((const char *)[(id)objc_msgSend(NSString stringWithFormat:@"%@/%@", v4, objc_msgSend(v3, "stringByDeletingPathExtension")), "fileSystemRepresentation"], 1);
      *(void *)(v1 + 696) = v5;
      if (v5)
      {
        v6 = dlsym(v5, "AdaptiveCorrection_fullCorrection");
        *(void *)(v1 + 664) = v6;
        if (v6)
        {
          float64_t v7 = dlsym(*(void **)(v1 + 696), "AdaptiveCorrection_computeVerticalBaselineTransform");
          *(void *)(v1 + 672) = v7;
          if (v7)
          {
            uint64_t v8 = dlsym(*(void **)(v1 + 696), "AdaptiveCorrection_rotateCalModel");
            *(void *)(v1 + 680) = v8;
            if (v8)
            {
              double v9 = dlsym(*(void **)(v1 + 696), "AdaptiveCorrection_transformPointsWithMatrix");
              *(void *)(v1 + 688) = v9;
              if (v9) {
                return 0;
              }
            }
          }
        }
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      return 4294954510;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return result;
}

- (uint64_t)_updateCorrectedCalibrationUsingInitialOISCalibration:(int)a3 macroTransitionType:
{
  if (!a1) {
    return 0;
  }
  uint64_t v49 = 0;
  memset(v48, 0, sizeof(v48));
  uint64_t v47 = 0;
  long long v46 = 0u;
  long long v45 = 0u;
  long long v44 = 0u;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  uint64_t v35 = 0;
  memset(v34, 0, sizeof(v34));
  bzero(v33, 0x748uLL);
  __n128 v31 = 0u;
  __n128 v32 = 0u;
  __n128 v29 = 0u;
  __n128 v30 = 0u;
  v28.columns[0] = 0;
  v28.columns[1] = 0;
  v27.columns[0] = 0;
  v27.columns[1] = 0;
  float64x2_t v6 = *(float64x2_t *)(a2 + 48);
  *(float32x2_t *)&v6.f64[0] = vcvt_f32_f64(v6);
  float64x2_t v7 = *(float64x2_t *)(a2 + 80);
  *(float32x2_t *)&v7.f64[0] = vcvt_f32_f64(v7);
  float64x2_t v8 = *(float64x2_t *)(a2 + 112);
  *(float32x2_t *)&v8.f64[0] = vcvt_f32_f64(v8);
  int32x4_t v9 = vzip1q_s32((int32x4_t)v6, (int32x4_t)v8);
  int32x4_t v10 = vzip2q_s32((int32x4_t)vcvt_hight_f32_f64(*(int32x2_t *)(a2 + 64), *(float64x2_t *)(a2 + 64)), (int32x4_t)vcvt_hight_f32_f64(*(int32x2_t *)(a2 + 128), *(float64x2_t *)(a2 + 128)));
  int32x4_t v11 = vzip2q_s32((int32x4_t)vcvt_hight_f32_f64(*(int32x2_t *)(a2 + 96), *(float64x2_t *)(a2 + 96)), (int32x4_t)0);
  __n128 v25 = (__n128)vzip1q_s32(v10, v11);
  __n128 v26 = (__n128)vzip1q_s32(v9, (int32x4_t)v7);
  __n128 v23 = (__n128)vzip2q_s32(v10, v11);
  __n128 v24 = (__n128)vzip2q_s32(v9, vdupq_lane_s32(*(int32x2_t *)&v7.f64[0], 1));
  uint64_t v12 = (*(uint64_t (**)(__n128 *, simd_float2x2 *, simd_float2x2 *))(a1 + 672))(&v29, &v28, &v27);
  if (v12
    || (uint64_t v12 = (*(uint64_t (**)(void, void, void, double, double))(a1 + 688))(*(void *)(a1 + 240), *(unsigned int *)(a1 + 256), *(void *)(a1 + 264), *(double *)v28.columns, *(double *)&v28.columns[1]), v12)|| (uint64_t v12 = (*(uint64_t (**)(void, void, void, double, double))(a1 + 688))(*(void *)(a1 + 248), *(unsigned int *)(a1 + 256), *(void *)(a1 + 272), *(double *)v27.columns, *(double *)&v27.columns[1]), v12)|| (uint64_t v12 = (*(uint64_t (**)(uint64_t, _OWORD *, __n128, __n128, __n128, __n128, double, double, double, double))(a1 + 680))(a2, v48, v29, v30, v31,
                v32,
                *(double *)v28.columns,
                *(double *)&v28.columns[1],
                *(double *)v27.columns,
                *(double *)&v27.columns[1]),
        v12))
  {
    uint64_t v16 = v12;
    fig_log_get_emitter();
LABEL_14:
    FigDebugAssert3();
    return v16;
  }
  (*(void (**)(_OWORD *__return_ptr, void, void, void, _OWORD *, uint64_t, unsigned char *))(a1 + 664))(v34, *(void *)(a1 + 264), *(void *)(a1 + 272), *(unsigned int *)(a1 + 256), v48, [*(id *)(a1 + 8) adaptiveCorrectionConfigsPtr] + ((uint64_t)a3 << 9), v33);
  if (!v33[812])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0xFFFFFFFFLL;
  }
  int v13 = *(uint64_t (**)(_OWORD *, long long *, __n128, __n128, __n128, __n128, double, double, double, double))(a1 + 680);
  simd_float2x2 v14 = __invert_f2(v28);
  simd_float2x2 v15 = __invert_f2(v27);
  uint64_t v16 = v13(v34, &v36, v26, v24, v25, v23, *(double *)v14.columns, *(double *)&v14.columns[1], *(double *)v15.columns, *(double *)&v15.columns[1]);
  if (v16)
  {
    fig_log_get_emitter();
    goto LABEL_14;
  }
  long long v17 = v45;
  *(_OWORD *)(a1 + 184) = v44;
  *(_OWORD *)(a1 + 200) = v17;
  *(_OWORD *)(a1 + 216) = v46;
  long long v18 = v41;
  *(_OWORD *)(a1 + 120) = v40;
  *(_OWORD *)(a1 + 136) = v18;
  long long v19 = v43;
  *(_OWORD *)(a1 + 152) = v42;
  *(_OWORD *)(a1 + 168) = v19;
  long long v20 = v37;
  *(_OWORD *)(a1 + 56) = v36;
  *(_OWORD *)(a1 + 72) = v20;
  long long v21 = v39;
  *(_OWORD *)(a1 + 88) = v38;
  *(void *)(a1 + 232) = v47;
  *(_OWORD *)(a1 + 104) = v21;
  return v16;
}

- (float64_t)_fundamentalMatrixFromCalibration:(uint64_t)a3@<X2> narrowerMetadata:(uint64_t)a4@<X3> widerMetadata:(_OWORD *)a5@<X8>
{
  STACK[0x7B8] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v47 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    uint64_t v48 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    [v47 setObject:a3 atIndexedSubscript:0];
    [v47 setObject:a4 atIndexedSubscript:1];
    uint64_t v49 = 0;
    *(void *)&long long v50 = a2[6];
    *(void *)&long long v51 = a2[7];
    *(void *)&long long v52 = a2[8];
    *((void *)&v50 + 1) = a2[10];
    *(void *)&long long v53 = a2[14];
    *(void *)&long long v54 = a2[15];
    *(void *)&long long v55 = a2[16];
    *((void *)&v51 + 1) = a2[11];
    *((void *)&v52 + 1) = a2[12];
    *(_OWORD *)&STACK[0x6F0] = v50;
    *(_OWORD *)&STACK[0x700] = v53;
    *(_OWORD *)&STACK[0x710] = v51;
    *(_OWORD *)&STACK[0x720] = v54;
    *(_OWORD *)&STACK[0x730] = v52;
    *(_OWORD *)&STACK[0x740] = v55;
    a42 = 0u;
    a43 = 0u;
    *(_OWORD *)&STACK[0x640] = 0u;
    *(_OWORD *)&STACK[0x650] = 0u;
    __asm { FMOV            V18.2D, #1.0 }
    *(_OWORD *)&STACK[0x660] = 0u;
    *(_OWORD *)&STACK[0x670] = 0u;
    do
    {
      float64x2_t v62 = *(float64x2_t *)((char *)&STACK[0x6F0] + v49);
      float64x2_t v61 = *(float64x2_t *)((char *)&STACK[0x6F0] + v49 + 16);
      double v63 = (float64x2_t *)((char *)&a42 + v49);
      *double v63 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_1A5EFD720, v62.f64[0]), (float64x2_t)xmmword_1A5EFD730, v62, 1), (float64x2_t)0, v61.f64[0]);
      v63[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v62, (float64x2_t)0), (float64x2_t)0, v62, 1), _Q18, v61);
      v49 += 32;
    }
    while (v49 != 96);
    uint64_t v64 = 0;
    float64x2_t v68 = a42;
    float64x2_t v65 = a43;
    float64x2_t v69 = *(float64x2_t *)&STACK[0x640];
    float64x2_t v66 = *(float64x2_t *)&STACK[0x650];
    float64x2_t v70 = *(float64x2_t *)&STACK[0x660];
    float64x2_t v67 = *(float64x2_t *)&STACK[0x670];
    *(_OWORD *)&STACK[0x6F0] = xmmword_1A5EFD720;
    *(_OWORD *)&STACK[0x700] = 0u;
    *(_OWORD *)&STACK[0x710] = xmmword_1A5EFD730;
    *(_OWORD *)&STACK[0x720] = 0u;
    *(_OWORD *)&STACK[0x730] = 0uLL;
    *(float64x2_t *)&STACK[0x740] = _Q18;
    *(_OWORD *)&STACK[0x680] = 0u;
    *(_OWORD *)&STACK[0x690] = 0u;
    *(_OWORD *)&STACK[0x6A0] = 0u;
    *(_OWORD *)&STACK[0x6B0] = 0u;
    *(_OWORD *)&STACK[0x6C0] = 0u;
    *(_OWORD *)&STACK[0x6D0] = 0u;
    *(void *)&v68.f64[1] = vextq_s8((int8x16_t)v68, (int8x16_t)v68, 8uLL).u64[0];
    *(void *)&v69.f64[1] = vextq_s8((int8x16_t)v69, (int8x16_t)v69, 8uLL).u64[0];
    *(void *)&v70.f64[1] = vextq_s8((int8x16_t)v70, (int8x16_t)v70, 8uLL).u64[0];
    do
    {
      float64x2_t v72 = *(float64x2_t *)((char *)&STACK[0x6F0] + v64);
      float64x2_t v71 = *(float64x2_t *)((char *)&STACK[0x6F0] + v64 + 16);
      int v73 = (float64x2_t *)((char *)&STACK[0x680] + v64);
      *int v73 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v68, v72.f64[0]), v69, v72, 1), v70, v71.f64[0]);
      v73[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v65, v72), v66, v72, 1), v71, v67);
      v64 += 32;
    }
    while (v64 != 96);
    uint64_t v74 = 0;
    float64x2_t v142 = *(float64x2_t *)&STACK[0x690];
    float64x2_t v143 = *(float64x2_t *)&STACK[0x680];
    float64x2_t v140 = *(float64x2_t *)&STACK[0x6B0];
    float64x2_t v141 = *(float64x2_t *)&STACK[0x6A0];
    float64x2_t v75 = *(float64x2_t *)&STACK[0x6C0];
    float64x2_t vars0 = *(float64x2_t *)&STACK[0x6D0];
    float64x2_t v139 = *(float64x2_t *)&STACK[0x6C0];
    v75.f64[0] = (float64_t)a2[9];
    float64x2_t v131 = v75;
    v75.f64[0] = (float64_t)a2[13];
    float64x2_t v132 = v75;
    v75.f64[0] = (float64_t)a2[17];
    float64x2_t v134 = v75;
    uint64_t v76 = *MEMORY[0x1E4F54128];
    char v77 = 1;
    float64x2_t v144 = _Q18;
    do
    {
      char v78 = v77;
      objc_msgSend(v48, "setObject:atIndexedSubscript:", objc_msgSend((id)objc_msgSend(v47, "objectAtIndexedSubscript:", v74, *(_OWORD *)&v131), "objectForKeyedSubscript:", v76), v74);
      char v77 = 0;
      uint64_t v79 = &a2[v74];
      unint64_t v80 = *v79;
      *(void *)&long long v81 = v79[2];
      *((void *)&v81 + 1) = v79[4];
      CGFloat v82 = &STACK[0x6F0] + 12 * v74;
      *(void *)&long long v83 = 0;
      *((void *)&v83 + 1) = v80;
      *(_OWORD *)CGFloat v82 = v80;
      *((_OWORD *)v82 + 1) = 0u;
      *((_OWORD *)v82 + 2) = v83;
      *((_OWORD *)v82 + 3) = 0u;
      *((_OWORD *)v82 + 4) = v81;
      *((float64x2_t *)v82 + 5) = v144;
      uint64_t v74 = 1;
    }
    while ((v78 & 1) != 0);
    v84.f64[0] = v131.f64[0];
    v84.f64[1] = v131.f64[0];
    v85.f64[0] = v132.f64[0];
    v85.f64[1] = v132.f64[0];
    float64x2_t v86 = vmlaq_f64(vmulq_f64(v84, (float64x2_t)xmmword_1A5EFD720), (float64x2_t)xmmword_1A5EFD730, v85);
    v85.f64[0] = v134.f64[0];
    v85.f64[1] = v134.f64[0];
    float64x2_t v87 = vmlaq_f64(v86, (float64x2_t)0, v85);
    float64x2_t v88 = vmlaq_f64(vmlaq_f64(vmulq_f64(v131, (float64x2_t)0), (float64x2_t)0, v132), v144, v134);
    int64x2_t v89 = (int64x2_t)vnegq_f64(v143);
    int64x2_t v90 = (int64x2_t)vnegq_f64(v141);
    double v91 = vmlsq_f64(vmlsq_laneq_f64(vmulq_f64(vnegq_f64(v139), v87), (float64x2_t)vdupq_laneq_s64((int64x2_t)v87, 1), v139, 1), v88, vars0).f64[0];
    int64x2_t v92 = (int64x2_t)vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)vzip1q_s64(v89, v90), v87.f64[0]), (float64x2_t)vzip2q_s64(v89, v90), v87, 1), (float64x2_t)vzip1q_s64((int64x2_t)vnegq_f64(v142), (int64x2_t)vnegq_f64(v140)), v88.f64[0]);
    int64x2_t v135 = (int64x2_t)*(unint64_t *)&v91;
    unint64_t v136 = vdupq_laneq_s64(v92, 1).u64[0];
    long long v137 = COERCE_UNSIGNED_INT64(-v91);
    a5[4] = 0u;
    a5[5] = 0u;
    a5[2] = 0u;
    a5[3] = 0u;
    *a5 = 0u;
    a5[1] = 0u;
    int64x2_t v93 = *(int64x2_t *)&STACK[0x760];
    int64x2_t v94 = *(int64x2_t *)&STACK[0x780];
    long long v96 = *(_OWORD *)&STACK[0x790];
    long long v95 = *(_OWORD *)&STACK[0x7A0];
    int64x2_t v97 = vzip2q_s64(*(int64x2_t *)&STACK[0x750], *(int64x2_t *)&STACK[0x770]);
    int64x2_t v98 = vdupq_laneq_s64(*(int64x2_t *)&STACK[0x790], 1);
    int64x2_t v145 = v92;
    *(double *)v92.i64 = -*(double *)&v92.i64[1];
    int64x2_t v133 = v92;
    *(int64x2_t *)&STACK[0x680] = vzip1q_s64(*(int64x2_t *)&STACK[0x750], *(int64x2_t *)&STACK[0x770]);
    *(_OWORD *)&STACK[0x690] = v96;
    *(int64x2_t *)&STACK[0x6A0] = v97;
    *(int64x2_t *)&STACK[0x6B0] = v98;
    *(int64x2_t *)&STACK[0x6C0] = vzip1q_s64(v93, v94);
    *(_OWORD *)&STACK[0x6D0] = v95;
    __invert_d3();
    uint64_t v99 = 0;
    *(float64x2_t *)&STACK[0x680] = v143;
    *(float64x2_t *)&STACK[0x690] = v142;
    *(float64x2_t *)&STACK[0x6A0] = v141;
    *(float64x2_t *)&STACK[0x6B0] = v140;
    *(float64x2_t *)&STACK[0x6C0] = v139;
    *(float64x2_t *)&STACK[0x6D0] = vars0;
    a30 = 0u;
    a31 = 0u;
    a32 = 0u;
    a33 = 0u;
    a34 = 0u;
    a35 = 0u;
    *(void *)&a24.f64[1] = vextq_s8((int8x16_t)a24, (int8x16_t)a24, 8uLL).u64[0];
    *(void *)&a26.f64[1] = vextq_s8((int8x16_t)a26, (int8x16_t)a26, 8uLL).u64[0];
    *(void *)&a28.f64[1] = vextq_s8((int8x16_t)a28, (int8x16_t)a28, 8uLL).u64[0];
    do
    {
      float64x2_t v104 = *(float64x2_t *)((char *)&STACK[0x680] + v99);
      float64x2_t v103 = *(float64x2_t *)((char *)&STACK[0x680] + v99 + 16);
      float64x2_t v105 = (float64x2_t *)((char *)&a30 + v99);
      *float64x2_t v105 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(a24, v104.f64[0]), a26, v104, 1), a28, v103.f64[0]);
      v105[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(a25, v104), a27, v104, 1), v103, a29);
      v99 += 32;
    }
    while (v99 != 96);
    uint64_t v106 = 0;
    *(void *)&long long v107 = v136;
    *((double *)&v107 + 1) = -*(double *)v145.i64;
    float64x2_t v111 = a30;
    float64x2_t v108 = a31;
    float64x2_t v112 = a32;
    float64x2_t v109 = a33;
    float64x2_t v113 = a34;
    float64x2_t v110 = a35;
    *(int64x2_t *)&STACK[0x680] = vzip1q_s64((int64x2_t)0, v135);
    *(int64x2_t *)&STACK[0x690] = v133;
    *(_OWORD *)&STACK[0x6A0] = v137;
    *(int64x2_t *)&STACK[0x6B0] = v145;
    *(_OWORD *)&STACK[0x6C0] = v107;
    *(_OWORD *)&STACK[0x6D0] = 0u;
    a36 = 0u;
    a37 = 0u;
    a38 = 0u;
    a39 = 0u;
    a40 = 0u;
    a41 = 0u;
    *(void *)&v111.f64[1] = vextq_s8((int8x16_t)v111, (int8x16_t)v111, 8uLL).u64[0];
    *(void *)&v112.f64[1] = vextq_s8((int8x16_t)v112, (int8x16_t)v112, 8uLL).u64[0];
    *(void *)&v113.f64[1] = vextq_s8((int8x16_t)v113, (int8x16_t)v113, 8uLL).u64[0];
    do
    {
      float64x2_t v115 = *(float64x2_t *)((char *)&STACK[0x680] + v106);
      float64x2_t v114 = *(float64x2_t *)((char *)&STACK[0x680] + v106 + 16);
      long long v116 = (float64x2_t *)((char *)&a36 + v106);
      float64x2_t *v116 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v111, v115.f64[0]), v112, v115, 1), v113, v114.f64[0]);
      v116[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v108, v115), v109, v115, 1), v114, v110);
      v106 += 32;
    }
    while (v106 != 96);
    long long v117 = *(_OWORD *)&STACK[0x720];
    *(_OWORD *)&STACK[0x6A0] = *(_OWORD *)&STACK[0x710];
    *(_OWORD *)&STACK[0x6B0] = v117;
    long long v118 = *(_OWORD *)&STACK[0x740];
    *(_OWORD *)&STACK[0x6C0] = *(_OWORD *)&STACK[0x730];
    *(_OWORD *)&STACK[0x6D0] = v118;
    long long v119 = *(_OWORD *)&STACK[0x700];
    *(_OWORD *)&STACK[0x680] = *(_OWORD *)&STACK[0x6F0];
    *(_OWORD *)&STACK[0x690] = v119;
    __invert_d3();
    uint64_t v120 = 0;
    float64x2_t v124 = a36;
    float64x2_t v121 = a37;
    float64x2_t v125 = a38;
    float64x2_t v122 = a39;
    float64x2_t v126 = a40;
    float64x2_t v123 = a41;
    *(_OWORD *)&STACK[0x6A0] = a20;
    *(_OWORD *)&STACK[0x6B0] = a21;
    *(_OWORD *)&STACK[0x6C0] = a22;
    *(_OWORD *)&STACK[0x6D0] = a23;
    *(_OWORD *)&STACK[0x680] = a18;
    *(_OWORD *)&STACK[0x690] = a19;
    *a5 = 0u;
    a5[1] = 0u;
    a5[2] = 0u;
    a5[3] = 0u;
    a5[4] = 0u;
    a5[5] = 0u;
    *(void *)&v124.f64[1] = vextq_s8((int8x16_t)v124, (int8x16_t)v124, 8uLL).u64[0];
    *(void *)&v125.f64[1] = vextq_s8((int8x16_t)v125, (int8x16_t)v125, 8uLL).u64[0];
    *(void *)&v126.f64[1] = vextq_s8((int8x16_t)v126, (int8x16_t)v126, 8uLL).u64[0];
    do
    {
      float64x2_t v128 = *(float64x2_t *)((char *)&STACK[0x680] + v120 * 16);
      float64x2_t v127 = *(float64x2_t *)((char *)&STACK[0x680] + v120 * 16 + 16);
      uint64_t v129 = (float64x2_t *)&a5[v120];
      *uint64_t v129 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v124, v128.f64[0]), v125, v128, 1), v126, v127.f64[0]);
      v129[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v121, v128), v122, v128, 1), v127, v123);
      v120 += 2;
    }
    while (v120 != 6);
  }
  else
  {
    v124.f64[0] = 0.0;
    a5[4] = 0u;
    a5[5] = 0u;
    a5[2] = 0u;
    a5[3] = 0u;
    *a5 = 0u;
    a5[1] = 0u;
  }
  return v124.f64[0];
}

- (uint64_t)_estimateDepthFromKeypointsUsingCalibration:(float64x2_t *)a3 narrowerRawSensorResolution:(int)a4 fundamentalMatrix:(void *)a5 macroTransitionType:(float64x2_t)a6 totalZoomFactor:(double)a7 consolidatedDepthsOut:(float64x2_t)a8
{
  STACK[0xBF8] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a5)
    {
      float v65 = *(float *)a8.f64;
      double v66 = a6.f64[0];
      uint64_t v67 = result;
      uint64_t v68 = 0;
      double v69 = a6.f64[0] * 0.5;
      *a5 = 0;
      a5[1] = 0;
      double v70 = a7 * 0.5;
      a5[2] = 0;
      *(void *)&long long v71 = a2[6];
      *(void *)&long long v72 = a2[7];
      *(void *)&long long v73 = a2[8];
      a6.f64[0] = (float64_t)a2[9];
      *((void *)&v71 + 1) = a2[10];
      a9.f64[0] = (float64_t)a2[13];
      a12.n128_u64[0] = a2[14];
      a13.n128_u64[0] = a2[15];
      *(void *)&long long v64 = a2[16];
      a8.f64[0] = (float64_t)a2[17];
      *((void *)&v72 + 1) = a2[11];
      *((void *)&v73 + 1) = a2[12];
      *(__n128 *)&STACK[0xB50] = a12;
      *(_OWORD *)&STACK[0xB40] = v71;
      *(__n128 *)&STACK[0xB70] = a13;
      *(_OWORD *)&STACK[0xB60] = v72;
      *(_OWORD *)&STACK[0xB90] = v64;
      *(_OWORD *)&STACK[0xB80] = v73;
      a41 = 0u;
      a42 = 0u;
      a39 = 0u;
      a40 = 0u;
      __asm { FMOV            V4.2D, #1.0 }
      a37 = 0u;
      a38 = 0u;
      do
      {
        float64x2_t v80 = *(float64x2_t *)((char *)&STACK[0xB40] + v68);
        float64x2_t v79 = *(float64x2_t *)((char *)&STACK[0xB40] + v68 + 16);
        long long v81 = (float64x2_t *)((char *)&a37 + v68);
        *long long v81 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_1A5EFD720, v80.f64[0]), (float64x2_t)xmmword_1A5EFD730, v80, 1), (float64x2_t)0, v79.f64[0]);
        v81[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v80, (float64x2_t)0), (float64x2_t)0, v80, 1), _Q4, v79);
        v68 += 32;
      }
      while (v68 != 96);
      uint64_t v82 = 0;
      float64x2_t v86 = a37;
      float64x2_t v83 = a38;
      float64x2_t v87 = a39;
      float64x2_t v84 = a40;
      float64x2_t v88 = a41;
      float64x2_t v85 = a42;
      *(_OWORD *)&STACK[0xB50] = 0u;
      *(_OWORD *)&STACK[0xB40] = xmmword_1A5EFD720;
      *(_OWORD *)&STACK[0xB70] = 0u;
      *(_OWORD *)&STACK[0xB60] = xmmword_1A5EFD730;
      *(_OWORD *)&STACK[0xB80] = 0uLL;
      *(float64x2_t *)&STACK[0xB90] = _Q4;
      *(_OWORD *)&STACK[0xAC0] = 0u;
      *(_OWORD *)&STACK[0xAD0] = 0u;
      *(_OWORD *)&STACK[0xAE0] = 0u;
      *(_OWORD *)&STACK[0xAF0] = 0u;
      *(_OWORD *)&STACK[0xB00] = 0u;
      *(_OWORD *)&STACK[0xB10] = 0u;
      *(void *)&v86.f64[1] = vextq_s8((int8x16_t)v86, (int8x16_t)v86, 8uLL).u64[0];
      *(void *)&v87.f64[1] = vextq_s8((int8x16_t)v87, (int8x16_t)v87, 8uLL).u64[0];
      *(void *)&v88.f64[1] = vextq_s8((int8x16_t)v88, (int8x16_t)v88, 8uLL).u64[0];
      do
      {
        float64x2_t v90 = *(float64x2_t *)((char *)&STACK[0xB40] + v82);
        float64x2_t v89 = *(float64x2_t *)((char *)&STACK[0xB40] + v82 + 16);
        double v91 = (float64x2_t *)((char *)&STACK[0xAC0] + v82);
        *double v91 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v86, v90.f64[0]), v87, v90, 1), v88, v89.f64[0]);
        v91[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v83, v90), v84, v90, 1), v89, v85);
        v82 += 32;
      }
      while (v82 != 96);
      uint64_t v92 = 0;
      long long v93 = *(_OWORD *)&STACK[0xAD0];
      int64x2_t v94 = *(int64x2_t *)&STACK[0xAC0];
      long long v95 = *(_OWORD *)&STACK[0xAF0];
      int64x2_t v96 = *(int64x2_t *)&STACK[0xAE0];
      long long v97 = *(_OWORD *)&STACK[0xB10];
      int64x2_t v98 = *(int64x2_t *)&STACK[0xB00];
      float64x2_t v99 = vmulq_n_f64((float64x2_t)xmmword_1A5EFD720, a6.f64[0]);
      float64x2_t v109 = vmlaq_f64(vmlaq_f64(vmulq_f64(a6, (float64x2_t)0), (float64x2_t)0, a9), _Q4, a8);
      int64x2_t v100 = (int64x2_t)vmlaq_n_f64(vmlaq_n_f64(v99, (float64x2_t)xmmword_1A5EFD730, a9.f64[0]), (float64x2_t)0, a8.f64[0]);
      *(_OWORD *)&STACK[0x940] = xmmword_1A5EFD710;
      *(_OWORD *)&STACK[0x950] = 0u;
      *(_OWORD *)&STACK[0x960] = xmmword_1A5EFD700;
      *(_OWORD *)&STACK[0x970] = 0u;
      *(_OWORD *)&STACK[0x980] = 0u;
      *(float64x2_t *)&STACK[0x990] = _Q4;
      *(_OWORD *)&STACK[0x9A0] = 0u;
      *(_OWORD *)&STACK[0x9B0] = 0u;
      v101.i64[0] = vdupq_laneq_s64(v98, 1).u64[0];
      int64x2_t v102 = vzip1q_s64(v98, v100);
      v101.i64[1] = v100.i64[1];
      int64x2_t v103 = vzip1q_s64(v94, v96);
      int64x2_t v104 = vzip2q_s64(v94, v96);
      int64x2_t v105 = vzip1q_s64(v103, v104);
      int64x2_t v106 = vzip2q_s64(v103, v104);
      int64x2_t v107 = vzip1q_s64(v102, v101);
      float64x2_t v110 = (float64x2_t)vzip2q_s64(v102, v101);
      *(int64x2_t *)&STACK[0x9C0] = v105;
      *(_OWORD *)&STACK[0x9D0] = v93;
      *(int64x2_t *)&STACK[0x9E0] = v106;
      *(_OWORD *)&STACK[0x9F0] = v95;
      *(_OWORD *)&STACK[0xA10] = v97;
      *(int64x2_t *)&STACK[0xA00] = v107;
      *(float64x2_t *)&STACK[0xA30] = v109;
      *(float64x2_t *)&STACK[0xA20] = v110;
      char v108 = 1;
      v109.f64[0] = 0.0;
      v110.f64[0] = 1.0;
      do
      {
        uint64_t v111 = 0;
        float64x2_t v112 = (double *)&a2[v92];
        float64_t v113 = *v112;
        float64_t v114 = v112[2];
        float64_t v115 = v112[4];
        long long v116 = &STACK[0x940] + 16 * v92;
        long long v117 = *((_OWORD *)v116 + 5);
        *(_OWORD *)&STACK[0xB80] = *((_OWORD *)v116 + 4);
        *(_OWORD *)&STACK[0xB90] = v117;
        long long v118 = *((_OWORD *)v116 + 7);
        *(_OWORD *)&STACK[0xBA0] = *((_OWORD *)v116 + 6);
        *(_OWORD *)&STACK[0xBB0] = v118;
        long long v119 = *((_OWORD *)v116 + 1);
        *(_OWORD *)&STACK[0xB40] = *(_OWORD *)v116;
        *(_OWORD *)&STACK[0xB50] = v119;
        long long v120 = *((_OWORD *)v116 + 2);
        long long v121 = *((_OWORD *)v116 + 3);
        char v122 = v108;
        *(_OWORD *)&STACK[0xB60] = v120;
        *(_OWORD *)&STACK[0xB70] = v121;
        *(_OWORD *)&STACK[0xAC0] = 0uLL;
        *(_OWORD *)&STACK[0xAD0] = 0uLL;
        *(_OWORD *)&STACK[0xAE0] = 0uLL;
        *(_OWORD *)&STACK[0xAF0] = 0uLL;
        *(_OWORD *)&STACK[0xB00] = 0uLL;
        *(_OWORD *)&STACK[0xB10] = 0uLL;
        *(_OWORD *)&STACK[0xB20] = 0uLL;
        *(_OWORD *)&STACK[0xB30] = 0uLL;
        do
        {
          float64x2_t v124 = *(float64x2_t *)((char *)&STACK[0xB40] + v111);
          float64x2_t v123 = *(float64x2_t *)((char *)&STACK[0xB40] + v111 + 16);
          v125.f64[0] = 0.0;
          v125.f64[1] = v113;
          float64x2_t v126 = vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)*(unint64_t *)&v113, v124.f64[0]), v125, v124, 1);
          float64x2_t v127 = vmlaq_laneq_f64(vmulq_f64(v109, v124), v109, v124, 1);
          v124.f64[0] = v114;
          v124.f64[1] = v115;
          float64x2_t v128 = (float64x2_t *)((char *)&STACK[0xAC0] + v111);
          *float64x2_t v128 = vmlaq_n_f64(v126, v124, v123.f64[0]);
          v128[1] = vmlaq_f64(v127, v123, v110);
          v111 += 32;
        }
        while (v111 != 128);
        char v108 = 0;
        long long v129 = *(_OWORD *)&STACK[0xB10];
        long long v130 = &a59 + 8 * v92;
        v130[4] = *(_OWORD *)&STACK[0xB00];
        v130[5] = v129;
        long long v131 = *(_OWORD *)&STACK[0xB30];
        v130[6] = *(_OWORD *)&STACK[0xB20];
        v130[7] = v131;
        long long v132 = *(_OWORD *)&STACK[0xAD0];
        *long long v130 = *(_OWORD *)&STACK[0xAC0];
        v130[1] = v132;
        long long v133 = *(_OWORD *)&STACK[0xAF0];
        v130[2] = *(_OWORD *)&STACK[0xAE0];
        v130[3] = v133;
        uint64_t v92 = 1;
      }
      while ((v122 & 1) != 0);
      bzero(*(void **)(result + 280), 8 * [*(id *)(result + 8) configuredNumKeypoints]);
      uint64_t v187 = *(void *)(v67 + 248);
      uint64_t v188 = *(void *)(v67 + 240);
      uint64_t v134 = *(unsigned int *)(v67 + 256);
      uint64_t v185 = *(void *)(v67 + 280);
      a33 = a63;
      a34 = a64;
      long long v135 = *(_OWORD *)&STACK[0x8B0];
      a35 = *(_OWORD *)&STACK[0x8A0];
      a36 = v135;
      a29 = a59;
      a30 = a60;
      a31 = a61;
      a32 = a62;
      long long v136 = *(_OWORD *)&STACK[0x8D0];
      var10[0] = *(_OWORD *)&STACK[0x8C0];
      var10[1] = v136;
      *(_OWORD *)&STACK[0xAB0] = 0u;
      *(_OWORD *)&STACK[0xAA0] = 0u;
      *(_OWORD *)&STACK[0xA90] = 0u;
      *(_OWORD *)&STACK[0xA80] = 0u;
      *(_OWORD *)&STACK[0xA70] = 0u;
      *(_OWORD *)&STACK[0xA60] = 0u;
      *(_OWORD *)&STACK[0xA50] = 0u;
      *(_OWORD *)&STACK[0xA40] = 0u;
      *(_OWORD *)&STACK[0xAC0] = 0u;
      *(_OWORD *)&STACK[0xAD0] = 0u;
      *(_OWORD *)&STACK[0xAE0] = 0u;
      *(_OWORD *)&STACK[0xAF0] = 0u;
      *(_OWORD *)&STACK[0xB00] = 0u;
      *(_OWORD *)&STACK[0xB10] = 0u;
      *(_OWORD *)&STACK[0xB20] = 0u;
      *(_OWORD *)&STACK[0xB30] = 0u;
      uint64_t v186 = v134;
      if ((int)v134 >= 1)
      {
        for (uint64_t i = 0; i != v186; ++i)
        {
          uint64_t v138 = 0;
          float64x2_t v139 = *(float64x2_t *)(v188 + 16 * i);
          float64x2_t v140 = *(float64x2_t *)(v187 + 16 * i);
          do
          {
            float64x2_t v141 = vmlaq_n_f64(vnegq_f64((float64x2_t)var10[v138]), v140, *(double *)&var10[v138 + 1]);
            float64x2_t v142 = (float64x2_t *)((char *)&STACK[0xA40] + v138 * 16);
            *float64x2_t v142 = vmlaq_n_f64(vnegq_f64(*(float64x2_t *)((char *)&a29 + v138 * 16)), v139, *(double *)((char *)&a29 + v138 * 16 + 16));
            v142[1] = v141;
            v138 += 2;
          }
          while (v138 != 8);
          a52 = 4;
          a51 = 4;
          a50 = 4;
          a49 = 4;
          a48 = 4;
          a47 = 0;
          a46 = -1;
          a44 = -1.0;
          float64x2_t v181 = &a49;
          dgesvd_NEWLAPACK();
          if (a47
            || (a46 = (int)a44, (float64x2_t v143 = malloc_type_malloc(8 * (int)a44, 0x100004000313F17uLL)) == 0)
            || (float64x2_t v144 = v143, v181 = &a49, dgesvd_NEWLAPACK(), free(v144), a47))
          {
            fig_log_get_emitter();
            LODWORD(v181) = 0;
            FigDebugAssert3();
          }
          else if (*(double *)&STACK[0xB38] != 0.0)
          {
            double v145 = *(double *)&STACK[0xB18] / *(double *)&STACK[0xB38];
            if (v145 <= 0.0) {
              double v145 = -v145;
            }
            *(double *)(v185 + 8 * i) = v145;
            continue;
          }
          *(void *)(v185 + 8 * i) = 0;
        }
      }
      uint64_t v146 = 0;
      uint64_t v147 = v67 + 288;
      do
      {
        bzero(*(void **)(v147 + v146), 8 * objc_msgSend(*(id *)(v67 + 8), "configuredNumKeypoints", v181));
        v146 += 8;
      }
      while (v146 != 24);
      [*(id *)(v67 + 8) epipolarWeightFalloffDistance];
      double v149 = v148;
      [*(id *)(v67 + 8) macroDepthWeightFalloffDistance];
      double v150 = v151;
      LODWORD(v151) = 1.0;
      if (a4 == 2)
      {
        float64x2_t v152 = objc_msgSend(*(id *)(v67 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E4F52DD8], v151);
        objc_msgSend((id)objc_msgSend(v152, "objectForKeyedSubscript:", *MEMORY[0x1E4F52C78]), "floatValue");
        double v151 = fmin((float)(v65 / v153), 3.0);
        if (v151 < 1.0) {
          double v151 = 1.0;
        }
        *(float *)&double v151 = v151;
      }
      uint64_t v154 = *(unsigned int *)(v67 + 256);
      if (v154)
      {
        uint64_t v155 = 0;
        double v156 = v66 * 0.25 * (v66 * 0.25);
        double v157 = v149 / 0.693147181;
        double v158 = v150 / 0.693147181;
        uint64_t v159 = *(void *)(v67 + 280);
        double v160 = v156 / (float)(*(float *)&v151 * *(float *)&v151);
        do
        {
          if (*(double *)(v159 + 8 * v155) != 0.0)
          {
            uint64_t v161 = *(void *)(v67 + 240);
            *(long double *)(*(void *)(v67 + 288) + 8 * v155) = exp(-(*(double *)(v161 + 16 * v155)* *(double *)(v161 + 16 * v155))/ v156);
            *(long double *)(*(void *)(v67 + 296) + 8 * v155) = exp(-((v66 - *(double *)(v161 + 16 * v155))* (v66 - *(double *)(v161 + 16 * v155)))/ v156);
            uint64_t v162 = (2 * v155) | 1;
            double v163 = sqrt((v70 - *(double *)(v161 + 8 * v162)) * (v70 - *(double *)(v161 + 8 * v162))+ (v69 - *(double *)(v161 + 16 * v155)) * (v69 - *(double *)(v161 + 16 * v155)));
            v164.f64[0] = exp(-(v163 * v163) / v160);
            uint64_t v166 = *(void *)(v67 + 304);
            *(float64_t *)(v166 + 8 * v155) = v164.f64[0];
            if (a4) {
              *(long double *)(v166 + 8 * v155) = v164.f64[0] * exp(-*(double *)(v159 + 8 * v155) / v158);
            }
            v165.f64[0] = *(float64_t *)(v161 + 16 * v155);
            v164.f64[0] = *(float64_t *)(v161 + 8 * v162);
            float64x2_t v167 = vaddq_f64(a3[4], vmlaq_n_f64(vmulq_n_f64(*a3, v165.f64[0]), a3[2], v164.f64[0]));
            double v168 = sqrt(vmlad_n_f64(vmuld_lane_f64(v167.f64[1], v167, 1), v167.f64[0], v167.f64[0]));
            if (v168 == 0.0)
            {
              double v170 = 0.0;
            }
            else
            {
              double v169 = (vaddq_f64(a3[5], vmlaq_f64(vmulq_f64(v165, a3[1]), v164, a3[3])).f64[0]
                    + v167.f64[1] * *(double *)(*(void *)(v67 + 248) + 8 * v162)
                    + v167.f64[0] * *(double *)(*(void *)(v67 + 248) + 16 * v155))
                   / fabs(v168);
              if (v169 >= 0.0) {
                double v169 = -v169;
              }
              double v170 = exp(v169 / v157);
            }
            for (uint64_t j = 0; j != 24; j += 8)
              *(double *)(*(void *)(v147 + j) + 8 * v155) = v170 * *(double *)(*(void *)(v147 + j) + 8 * v155);
          }
          ++v155;
        }
        while (v155 != v154);
        uint64_t v172 = 0;
        a57 = 0;
        a56 = 0;
        a58 = 0;
        a55 = 0;
        a53 = 0;
        a54 = 0;
        uint64_t v173 = *(void *)(v67 + 280);
        do
        {
          uint64_t v174 = 0;
          double v175 = *(double *)(v173 + 8 * v172);
          do
          {
            if (v175 != 0.0)
            {
              double v176 = *(double *)(*(void *)(v147 + v174) + 8 * v172);
              *(double *)((char *)&a56 + v174) = *(double *)((char *)&a56 + v174) + 1.0 / v175 * v176;
              *(double *)((char *)&a53 + v174) = v176 + *(double *)((char *)&a53 + v174);
            }
            v174 += 8;
          }
          while (v174 != 24);
          ++v172;
        }
        while (v172 != v154);
      }
      else
      {
        a57 = 0;
        a56 = 0;
        a58 = 0;
        a55 = 0;
        a53 = 0;
        a54 = 0;
      }
      uint64_t v177 = 0;
      while (1)
      {
        double v178 = *(double *)((char *)&a53 + v177 * 8);
        if (v178 == 0.0) {
          break;
        }
        double v179 = *(double *)((char *)&a56 + v177 * 8);
        if (v179 == 0.0) {
          break;
        }
        double v180 = v179 / v178;
        *(double *)((char *)&a56 + v177 * 8) = v180;
        *(double *)&a5[v177++] = 1.0 / v180;
        if (v177 == 3) {
          return 0;
        }
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    return 0xFFFFFFFFLL;
  }
  return result;
}

- (uint64_t)_verifyRegistrationTransform:(uint64_t)a3 usingInitialOISCalibration:(uint64_t)a4 narrowerMetadata:(uint64_t)a5 widerMetadata:(uint64_t)a6 narrowerDimensions:(double)a7
{
  *(void *)&v70.f64[0] = a4;
  *(void *)&v70.f64[1] = a5;
  *(void *)&v66.f64[0] = a2;
  *(void *)&v68.f64[1] = result;
  if (result)
  {
    uint64_t v12 = 0;
    memset(v96, 0, sizeof(v96));
    a11.f64[0] = (double)(int)a6 * 0.5;
    a10.f64[0] = (double)SHIDWORD(a6) * 0.5;
    *(void *)&v68.f64[0] = a6;
    double v13 = (float)((float)(int)a6 * 0.0071023);
    v14.f64[0] = a11.f64[0];
    memset(v95, 0, sizeof(v95));
    v15.f64[0] = a10.f64[0];
    float64x2_t v62 = a10;
    float64x2_t v64 = a11;
    v14.f64[1] = a11.f64[0];
    v15.f64[1] = a10.f64[0];
    float64x2_t v58 = v15;
    float64x2_t v60 = v14;
    while (1)
    {
      float64x2_t v16 = *(float64x2_t *)(a3 + 144);
      *(void *)&v66.f64[1] = v12;
      uint64_t v17 = 3 * v12;
      float64x2_t v85 = *(float64x2_t *)(a3 + 128);
      float64x2_t v86 = v16;
      long long v18 = (float64x2_t *)&v96[6 * v12];
      float64x2_t v87 = *(float64x2_t *)(a3 + 160);
      uint64_t v88 = *(void *)(a3 + 176);
      -[BWAdaptiveCorrectionPreviewRegistration _homographyAtDepth:calibration:narrowerMetadata:widerMetadata:pixelBufferDimensions:excludeExtrinsics:](*(uint64_t *)&v68.f64[1], &v84, *(void **)&v70.f64[0], *(void **)&v70.f64[1], *(uint64_t *)&v68.f64[0], 0, &v89, 50.0, v54, v56, v58, v60, v62, v64, v66, v68, v70, *(_OWORD *)&v72, v73,
        v74,
        v75,
        *(_OWORD *)&v76,
        v77,
        v78,
        v79,
        *(_OWORD *)&v80,
        v81,
        v82,
        v83,
        *(_OWORD *)a3,
        *(_OWORD *)(a3 + 16),
        *(_OWORD *)(a3 + 32),
        *(_OWORD *)(a3 + 48),
        *(_OWORD *)(a3 + 64),
        *(_OWORD *)(a3 + 80),
        *(float64x2_t *)(a3 + 96),
        *(float64x2_t *)(a3 + 112),
        v85,
        v16,
        v87);
      float64x2_t v19 = v92;
      v18[2] = v91;
      v18[3] = v19;
      float64x2_t v20 = v94;
      v18[4] = v93;
      v18[5] = v20;
      float64x2_t v21 = v90;
      *long long v18 = v89;
      v18[1] = v21;
      uint64_t v22 = (float64x2_t *)&v95[2 * v17];
      float64x2_t v23 = *(float64x2_t *)(a3 + 144);
      float64x2_t v85 = *(float64x2_t *)(a3 + 128);
      float64x2_t v86 = v23;
      float64x2_t v87 = *(float64x2_t *)(a3 + 160);
      uint64_t v88 = *(void *)(a3 + 176);
      -[BWAdaptiveCorrectionPreviewRegistration _homographyAtDepth:calibration:narrowerMetadata:widerMetadata:pixelBufferDimensions:excludeExtrinsics:](*(uint64_t *)&v69.f64[1], &v84, *(void **)&v71.f64[0], *(void **)&v71.f64[1], *(uint64_t *)&v69.f64[0], 0, &v89, 1.0e10, v55, v57, v59, v61, v63, v65, v67, v69, v71, *(_OWORD *)&v72, v73,
        v74,
        v75,
        *(_OWORD *)&v76,
        v77,
        v78,
        v79,
        *(_OWORD *)&v80,
        v81,
        v82,
        v83,
        *(_OWORD *)a3,
        *(_OWORD *)(a3 + 16),
        *(_OWORD *)(a3 + 32),
        *(_OWORD *)(a3 + 48),
        *(_OWORD *)(a3 + 64),
        *(_OWORD *)(a3 + 80),
        *(float64x2_t *)(a3 + 96),
        *(float64x2_t *)(a3 + 112),
        v85,
        v23,
        v87);
      int v24 = 0;
      float64x2_t v25 = *v18;
      float64x2_t v26 = v18[1];
      float64x2_t v28 = v18[2];
      float64x2_t v27 = v18[3];
      float64x2_t v30 = v18[4];
      float64x2_t v29 = v18[5];
      float64x2_t v31 = v92;
      v22[2] = v91;
      v22[3] = v31;
      float64x2_t v32 = v94;
      v22[4] = v93;
      v22[5] = v32;
      float64x2_t v33 = v90;
      float64x2_t *v22 = v89;
      v22[1] = v33;
      int8x16_t v34 = (int8x16_t)vaddq_f64(v30, vmlaq_f64(vmulq_f64(v60, v25), v58, v28));
      float64x2_t v35 = vaddq_f64(v29, vmlaq_f64(vmulq_f64(v64, v26), v62, v27));
      int8x16_t v36 = (int8x16_t)vaddq_f64(v22[4], vmlaq_f64(vmulq_f64(v60, *v22), v58, v22[2]));
      float64x2_t v37 = vaddq_f64(v22[5], vmlaq_f64(vmulq_f64(v64, v22[1]), v62, v22[3]));
      long long v38 = (float64x2_t *)(*(void *)&v66.f64[0] + 32 * v17);
      float64x2_t v39 = vaddq_f64(v38[4], vmlaq_f64(vmulq_f64(v60, *v38), v58, v38[2]));
      float64x2_t v40 = vaddq_f64(v38[5], vmlaq_f64(vmulq_f64(v64, v38[1]), v62, v38[3]));
      do
      {
        long long v82 = (__int128)v34;
        long long v83 = (__int128)v35;
        double v41 = *((double *)&v82 + (v24 & 3)) / v35.f64[0];
        int8x16_t v80 = v34;
        long long v81 = (__int128)v35;
        *(double *)&v80.i64[v24 & 3] = v41;
        int8x16_t v34 = v80;
        *(void *)&v42.f64[0] = v81;
        v42.f64[1] = v35.f64[1];
        long long v78 = (__int128)v36;
        long long v79 = (__int128)v37;
        double v43 = *((double *)&v78 + (v24 & 3)) / v37.f64[0];
        int8x16_t v76 = v36;
        long long v77 = (__int128)v37;
        *(double *)&v76.i64[v24 & 3] = v43;
        int8x16_t v36 = v76;
        *(void *)&v44.f64[0] = v77;
        v44.f64[1] = v37.f64[1];
        long long v74 = (__int128)v39;
        long long v75 = (__int128)v40;
        double v45 = *((double *)&v74 + (v24 & 3)) / v40.f64[0];
        int8x16_t v72 = (int8x16_t)v39;
        long long v73 = (__int128)v40;
        *(double *)&v72.i64[v24 & 3] = v45;
        float64x2_t v39 = (float64x2_t)v72;
        *(void *)&v46.f64[0] = v73;
        ++v24;
        v46.f64[1] = v40.f64[1];
        float64x2_t v35 = v42;
        float64x2_t v37 = v44;
        float64x2_t v40 = v46;
      }
      while (v24 != 3);
      double v47 = *(double *)vextq_s8(v34, v34, 8uLL).i64;
      double v48 = *(double *)vextq_s8(v36, v36, 8uLL).i64;
      double v49 = *(double *)vextq_s8(v72, v72, 8uLL).i64;
      double v50 = v47 - v48;
      double v51 = fmax(((v49 - v47) * (v47 - v48)+ (*(double *)v34.i64 - *(double *)v36.i64) * (*(double *)v72.i64 - *(double *)v34.i64))/ fabs(sqrt(v50 * v50 + (*(double *)v34.i64 - *(double *)v36.i64)* (*(double *)v34.i64 - *(double *)v36.i64))), 0.0);
      double v52 = *(double *)v36.i64 - *(double *)v34.i64;
      double v53 = fmax(((v49 - v48) * (v48 - v47)+ (*(double *)v36.i64 - *(double *)v34.i64) * (*(double *)v72.i64 - *(double *)v36.i64))/ fabs(sqrt((v48 - v47) * (v48 - v47) + v52 * v52)), 0.0);
      if (v51 < v53) {
        double v51 = v53;
      }
      if (v51 >= v13
        || fabs(*(double *)v34.i64 * v48 - *(double *)v36.i64 * v47 + v49 * v52 + v50 * *(double *)v72.i64)
         / sqrt(v52 * v52 + v50 * v50) >= v13)
      {
        break;
      }
      uint64_t v12 = *(void *)&v66.f64[1] + 1;
      if (*(void *)&v66.f64[1] == 2) {
        return 0;
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0xFFFFFFFFLL;
  }
  return result;
}

- (void)dealloc
{
  [(BWAdaptiveCorrectionPreviewRegistration *)self cleanupResources];

  v3.receiver = self;
  v3.super_class = (Class)BWAdaptiveCorrectionPreviewRegistration;
  [(BWAdaptiveCorrectionPreviewRegistration *)&v3 dealloc];
}

- (void)cleanupResources
{
  if (!self->_resourcesCleaned)
  {

    self->_registrationPool = 0;
    self->_registrationPoolReadyAssertion = 0;

    self->_metalContext = 0;
    [(FigRegToolboxGPU *)self->_keypointDetector releaseResources];

    self->_keypointDetector = 0;
    keypointList = self->_keypointList;
    if (keypointList)
    {
      self->_keypointList = 0;
      free(keypointList);
    }
    uint64_t v4 = 0;
    validKeypointsInSensorResolution = self->_validKeypointsInSensorResolution;
    transposedKeypoints = self->_transposedKeypoints;
    char v7 = 1;
    do
    {
      char v8 = v7;
      int32x4_t v9 = validKeypointsInSensorResolution[v4];
      if (v9)
      {
        validKeypointsInSensorResolution[v4] = 0;
        free(v9);
      }
      int32x4_t v10 = transposedKeypoints[v4];
      if (v10)
      {
        transposedKeypoints[v4] = 0;
        free(v10);
      }
      char v7 = 0;
      uint64_t v4 = 1;
    }
    while ((v8 & 1) != 0);
    uint64_t v11 = 0;
    keypointWeights = self->_keypointWeights;
    do
    {
      double v13 = keypointWeights[v11];
      if (v13)
      {
        keypointWeights[v11] = 0;
        free(v13);
      }
      ++v11;
    }
    while (v11 != 3);
    keypointDepths = self->_keypointDepths;
    if (keypointDepths)
    {
      self->_keypointDepths = 0;
      free(keypointDepths);
    }
    cropAndScaleSession = self->_cropAndScaleSession;
    if (cropAndScaleSession)
    {
      VTPixelRotationSessionInvalidate(cropAndScaleSession);
      float64x2_t v16 = self->_cropAndScaleSession;
      if (v16) {
        CFRelease(v16);
      }
      self->_cropAndScaleSession = 0;
    }
    self->_resourcesCleaned = 1;
  }
}

@end