@interface BWEspressoInferenceBoundingBoxPropagator
+ (void)initialize;
- (BOOL)allowsAsyncPropagation;
- (BWEspressoInferenceBoundingBoxPropagator)initWithBoxRequirement:(id)a3 scoreRequirement:(id)a4 angularOffsetRequirement:(id)a5 fontSizeRequirement:(id)a6 configuration:(id)a7 toInferenceResultKey:(id)a8;
- (void)dealloc;
- (void)matchCurRegions:(uint64_t)a3 curCount:;
- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6;
@end

@implementation BWEspressoInferenceBoundingBoxPropagator

- (BWEspressoInferenceBoundingBoxPropagator)initWithBoxRequirement:(id)a3 scoreRequirement:(id)a4 angularOffsetRequirement:(id)a5 fontSizeRequirement:(id)a6 configuration:(id)a7 toInferenceResultKey:(id)a8
{
  v25.receiver = self;
  v25.super_class = (Class)BWEspressoInferenceBoundingBoxPropagator;
  v14 = [(BWEspressoInferenceBoundingBoxPropagator *)&v25 init];
  if (v14)
  {
    *((void *)v14 + 1) = a3;
    *((void *)v14 + 2) = a4;
    *((void *)v14 + 3) = a5;
    *((void *)v14 + 4) = a6;
    *((void *)v14 + 5) = a8;
    v14[48] = [a7 interiorSuppression];
    [a7 interiorSuppressionPadding];
    *((_DWORD *)v14 + 13) = v15;
    [a7 maxMatchCost];
    *((_DWORD *)v14 + 14) = v16;
    [a7 angularOffsetExponentialSmoothing];
    *((_DWORD *)v14 + 15) = v17;
    if (*((void *)v14 + 4))
    {
      [a7 fontSizeStartReportingThreshold];
      *((_DWORD *)v14 + 16) = v18;
      [a7 fontSizeStopReportingThreshold];
      *((_DWORD *)v14 + 17) = v19;
    }
    *((void *)v14 + 10) = [objc_alloc((Class)getFTBipartiteMatcherClass()) initWithInitialSize:10];
    v14[96] = [a7 inferenceInputUsesPortraitOrientation];
    [a7 trackingThreshold];
    *((_DWORD *)v14 + 25) = v20;
    if (a7)
    {
      [a7 confidenceFilterSettings];
    }
    else
    {
      uint64_t v24 = 0;
      long long v22 = 0u;
      long long v23 = 0u;
    }
    *(_OWORD *)(v14 + 104) = v22;
    *(_OWORD *)(v14 + 120) = v23;
    *((void *)v14 + 17) = v24;
    *((void *)v14 + 9) = (id)objc_msgSend(a7, "logger", v22, v23, v24);
  }
  return (BWEspressoInferenceBoundingBoxPropagator *)v14;
}

+ (void)initialize
{
}

- (void)dealloc
{
  free(self->_lastRegions);
  v3.receiver = self;
  v3.super_class = (Class)BWEspressoInferenceBoundingBoxPropagator;
  [(BWEspressoInferenceBoundingBoxPropagator *)&v3 dealloc];
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  v161[6] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return;
  }
  CMSampleBufferRef v140 = a6;
  v11 = (void *)[a4 tensorForRequirement:self->_boxRequirement];
  v14 = (uint64_t *)[a4 tensorForRequirement:self->_scoreRequirement];
  if (self->_angularOffsetRequirement) {
    int v15 = objc_msgSend(a4, "tensorForRequirement:");
  }
  else {
    int v15 = 0;
  }
  fontSizeRequirement = self->_fontSizeRequirement;
  if (fontSizeRequirement) {
    uint64_t v17 = objc_msgSend(a4, "tensorForRequirement:");
  }
  else {
    uint64_t v17 = 0;
  }
  v135 = &v133;
  int v18 = (uint64_t *)MEMORY[0x1F4188790](v17, v12, fontSizeRequirement, v13);
  *(void *)&long long v151 = (char *)&v133 - v20;
  uint64_t v21 = *v14;
  uint64_t v22 = v14[17] * (v14[12] - 1);
  id v133 = a3;
  if (v15)
  {
    double v23 = *(double *)v15;
    uint64_t v24 = v15[17];
    uint64_t v25 = *v15 + 4 * v24;
    uint64_t v144 = *v15 + 8 * v24;
    double v145 = *(double *)&v25;
    double v146 = v23;
    *(void *)&double v143 = *(void *)&v23 + 12 * v24;
  }
  else
  {
    double v143 = 0.0;
    *(double *)&uint64_t v144 = 0.0;
    double v145 = 0.0;
    double v146 = 0.0;
  }
  v141 = self;
  uint64_t v26 = v21 + 4 * v22;
  if (v18) {
    uint64_t v27 = *v18;
  }
  else {
    uint64_t v27 = 0;
  }
  unint64_t v28 = 0;
  if (v19)
  {
    uint64_t v29 = 0;
    float trackingThreshold = v141->_trackingThreshold;
    uint64_t v31 = v151;
    do
    {
      if (*(float *)(v26 + 4 * v29) > trackingThreshold) {
        *(void *)(v31 + 8 * v28++) = v29;
      }
      ++v29;
    }
    while (v19 != v29);
  }
  v147 = v15;
  uint64_t v32 = *v11;
  v33 = v11;
  uint64_t v34 = v11[17];
  v35 = v141;
  int64_t maxRegionID = v141->_maxRegionID;
  id v142 = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", v28, v133);
  v36 = (char *)malloc_type_calloc(v28, 0x88uLL, 0x101004022C1039FuLL);
  if (!v28)
  {
    -[BWEspressoInferenceBoundingBoxPropagator matchCurRegions:curCount:]((uint64_t)v35, (uint64_t)v36, 0);
    v64 = v35;
    v65 = v33;
    goto LABEL_57;
  }
  v138 = a5;
  v139 = v33;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  *(void *)&long long v149 = v32 + 12 * v34;
  *(void *)&long long v150 = v32 + 4 * v34;
  uint64_t v39 = v32;
  uint64_t v148 = v32 + 8 * v34;
  do
  {
    uint64_t v40 = *(void *)(v151 + 8 * v38);
    v41 = &v36[v37];
    *(_DWORD *)&v36[v37 + 44] = *(_DWORD *)(v26 + 4 * v40);
    if (v147)
    {
      float v42 = atan2f(*(float *)(*(void *)&v143 + 4 * v40), *(float *)(v144 + 4 * v40)) * 0.25;
      float v43 = *(float *)(*(void *)&v146 + 4 * v40);
      __float2 v44 = __sincosf_stret(v42 * -2.0);
      float v45 = expf((float)((float)(v43 * v44.__cosval) - (float)(*(float *)(*(void *)&v145 + 4 * v40) * v44.__sinval))* 0.5);
      float v46 = (float)(v42 * 180.0) / 3.14159265;
      *((float *)v41 + 12) = v46;
      float v47 = *(float *)(v148 + 4 * v40);
      float v48 = *(float *)(v39 + 4 * v40);
      float v49 = v47 + v48;
      float v50 = *(float *)(v149 + 4 * v40);
      float v51 = *(float *)(v150 + 4 * v40);
      float v52 = (float)(v47 + v48) * 0.5;
      float v53 = v50 + v51;
      float v54 = (float)(v50 + v51) * 0.5;
      float v55 = (float)(v47 - v48) * v45;
      float v56 = (float)(v50 - v51) / v45;
      *((double *)v41 + 7) = (float)(v54 - (float)(v56 * 0.5));
      *((double *)v41 + 8) = (float)(v52 - (float)(v55 * 0.5));
      *((double *)v41 + 9) = v56;
      *((double *)v41 + 10) = v55;
      memset(&v159, 0, sizeof(v159));
      CGAffineTransformMakeTranslation(&v159, v54, v52);
      CGFloat v57 = (float)(*((float *)v41 + 12) / -180.0) * 3.14159265;
      CGAffineTransform v157 = v159;
      CGAffineTransformRotate(&v158, &v157, v57);
      CGAffineTransform v159 = v158;
      CGAffineTransform v157 = v158;
      CGAffineTransformTranslate(&v158, &v157, (float)-(float)(v53 * 0.5), (float)-(float)(v49 * 0.5));
      CGAffineTransform v159 = v158;
      *(CGRect *)(v41 + 8) = CGRectApplyAffineTransform(*(CGRect *)(v41 + 56), &v158);
      if (!v27) {
        goto LABEL_24;
      }
LABEL_23:
      *(_DWORD *)&v36[v37 + 88] = *(_DWORD *)(v27 + 4 * v40);
      goto LABEL_24;
    }
    float v58 = *(float *)(v150 + 4 * v40);
    double v59 = v58;
    float v60 = *(float *)(v39 + 4 * v40);
    double v61 = v60;
    double v62 = (float)(*(float *)(v149 + 4 * v40) - v58);
    double v63 = (float)(*(float *)(v148 + 4 * v40) - v60);
    *((double *)v41 + 1) = v59;
    *((double *)v41 + 2) = v61;
    *((double *)v41 + 3) = v62;
    *((double *)v41 + 4) = v63;
    if (v27) {
      goto LABEL_23;
    }
LABEL_24:
    ++v38;
    v37 += 136;
  }
  while (v28 != v38);
  v64 = v141;
  -[BWEspressoInferenceBoundingBoxPropagator matchCurRegions:curCount:]((uint64_t)v141, (uint64_t)v36, v28);
  a5 = v138;
  v65 = v139;
  if (v64->_suppressInterior)
  {
    v66 = v36 + 40;
    unint64_t v67 = v28;
    do
    {
      unsigned char *v66 = 0;
      v66 += 136;
      --v67;
    }
    while (v67);
    uint64_t v68 = 0;
    unint64_t v69 = v28 - 1;
    v70 = (uint64_t *)(v151 + 8);
    v71 = v36 + 176;
    do
    {
      v72 = &v36[136 * v68];
      int v74 = v72[40];
      v73 = v72 + 40;
      if (!v74 && v36[136 * v68 + 97])
      {
        uint64_t v75 = *(void *)(v151 + 8 * v68);
        float v76 = *(float *)(v149 + 4 * v75);
        float v77 = *(float *)(v150 + 4 * v75);
        float v78 = *(float *)(v148 + 4 * v75);
        float v79 = *(float *)(v39 + 4 * v75);
        float v80 = vabds_f32(v78, v79);
        float v81 = vabds_f32(v76, v77) * 0.1;
        float interiorPadding = v64->_interiorPadding;
        if (v81 < interiorPadding) {
          float v81 = v64->_interiorPadding;
        }
        float v83 = v80 * 0.1;
        if (v83 < interiorPadding) {
          float v83 = v64->_interiorPadding;
        }
        if (v68 + 1 < v28)
        {
          v84 = v71;
          v85 = v70;
          for (unint64_t i = v69; i; --i)
          {
            if (!*v84 && v84[57])
            {
              uint64_t v87 = *v85;
              float v88 = *(float *)(v150 + 4 * *v85);
              if (v88 <= (float)(v77 + v81)
                && *(float *)(v39 + 4 * v87) <= (float)(v79 + v83)
                && (float)(v81 + *(float *)(v149 + 4 * v87)) >= v76
                && (float)(v83 + *(float *)(v148 + 4 * v87)) >= v78)
              {
                unsigned char *v73 = 1;
                break;
              }
              if ((float)(v81 + v88) >= v77
                && (float)(v83 + *(float *)(v39 + 4 * v87)) >= v79
                && *(float *)(v149 + 4 * v87) <= (float)(v76 + v81)
                && *(float *)(v148 + 4 * v87) <= (float)(v78 + v83))
              {
                unsigned char *v84 = 1;
              }
            }
            ++v85;
            v84 += 136;
          }
        }
      }
      ++v68;
      --v69;
      ++v70;
      v71 += 136;
    }
    while (v68 != v28);
  }
LABEL_57:
  v89 = v65;
  CMSampleBufferGetPresentationTimeStamp(&v156, v140);
  CFDictionaryRef v90 = CMTimeCopyAsDictionary(&v156, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  ImageBuffer = CMSampleBufferGetImageBuffer(a5);
  size_t Width = CVPixelBufferGetWidth(ImageBuffer);
  size_t Height = CVPixelBufferGetHeight(ImageBuffer);
  CFDictionaryRef v94 = (const __CFDictionary *)CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E4F530D0], 0);
  if (v94)
  {
    memset(&v159, 0, 32);
    CGRectMakeWithDictionaryRepresentation(v94, (CGRect *)&v159);
    FigCaptureMetadataUtilitiesDenormalizeCropRect(v159.a, v159.b, v159.c, v159.d);
    size_t Width = vcvtad_u64_f64(v95);
    size_t Height = vcvtad_u64_f64(v96);
  }
  long long v97 = *MEMORY[0x1E4F1DAB8];
  long long v98 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v159.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v159.c = v98;
  long long v99 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v159.tCGFloat x = v99;
  if (v64->_inferenceInputUsesPortraitOrientation)
  {
    long long v150 = v98;
    long long v151 = v97;
    long long v149 = v99;
    CGAffineTransformMakeTranslation(&v155, -0.5, -0.5);
    *(_OWORD *)&v158.a = v151;
    *(_OWORD *)&v158.c = v150;
    *(_OWORD *)&v158.tCGFloat x = v149;
    CGAffineTransformConcat(&v159, &v158, &v155);
    CGAffineTransformMakeRotation(&v154, 1.57079633);
    CGAffineTransform v157 = v159;
    CGAffineTransformConcat(&v158, &v157, &v154);
    CGAffineTransform v159 = v158;
    CGAffineTransformMakeTranslation(&v153, 0.5, 0.5);
    CGAffineTransform v157 = v159;
    CGAffineTransformConcat(&v158, &v157, &v153);
    CGAffineTransform v159 = v158;
    unint64_t v100 = Height;
    if (!v28) {
      goto LABEL_77;
    }
  }
  else
  {
    unint64_t v100 = Width;
    size_t Width = Height;
    if (!v28) {
      goto LABEL_77;
    }
  }
  float v101 = (float)((float)(unint64_t)v89[10] / (float)(unint64_t)v89[11])
       / (float)((float)v100 / (float)Width);
  CGFloat v137 = v101;
  CGFloat v136 = (float)(1.0 / v101);
  v141 = (BWEspressoInferenceBoundingBoxPropagator *)*MEMORY[0x1E4F55688];
  v102 = (opaqueCMSampleBuffer *)*MEMORY[0x1E4F55670];
  v139 = (void *)*MEMORY[0x1E4F55678];
  CMSampleBufferRef v140 = v102;
  v138 = (opaqueCMSampleBuffer *)*MEMORY[0x1E4F55680];
  uint64_t v103 = *MEMORY[0x1E4F55660];
  uint64_t v104 = *MEMORY[0x1E4F55668];
  LODWORD(v148) = 1016003125;
  do
  {
    if (v36[97] && !v36[40])
    {
      CGFloat x = *((double *)v36 + 1);
      CGFloat y = *((double *)v36 + 2);
      CGFloat v107 = *((double *)v36 + 4);
      *(void *)&long long v151 = *((void *)v36 + 3);
      if (v147)
      {
        *(void *)&long long v149 = *((void *)v36 + 7);
        double v108 = *((double *)v36 + 9);
        *(void *)&long long v150 = *((void *)v36 + 8);
        double v143 = v108;
        double v109 = *((double *)v36 + 10);
        double v146 = x;
        float v110 = *((float *)v36 + 13);
        memset(&v158, 0, sizeof(v158));
        CGAffineTransformMakeScale(&v158, 1.0, v137);
        CGAffineTransform v152 = v158;
        CGAffineTransformRotate(&v157, &v152, (float)(v110 * *(float *)&v148));
        CGAffineTransform v158 = v157;
        CGAffineTransform v152 = v157;
        CGAffineTransformScale(&v157, &v152, 1.0, v136);
        CGAffineTransform v158 = v157;
        *(double *)&uint64_t v144 = v107;
        double v145 = y;
        long double v111 = v157.tx + v157.c * 0.0 + v157.a * (v108 * 0.5);
        long double v112 = v157.ty + v157.d * 0.0 + v157.b * (v108 * 0.5);
        double v113 = v109;
        long double v114 = v157.tx + v109 * 0.5 * v157.c + v157.a * 0.0;
        long double v115 = v157.ty + v109 * 0.5 * v157.d + v157.b * 0.0;
        long double v116 = hypot(v111, v112);
        double v117 = v116 + v116;
        long double v118 = hypot(v114, v115);
        double v119 = v118 + v118;
        *(double *)&long long v149 = *(double *)&v149 - (v117 - v143) * 0.5;
        double v120 = *(double *)&v150 - (v118 + v118 - v113) * 0.5;
        double v121 = atan(v112 / v111);
        long double v122 = -v114;
        CGFloat v107 = *(double *)&v144;
        long double v123 = v122 / v115;
        CGFloat x = v146;
        long double v124 = atan(v123) * (v119 * v119) + v121 * (v117 * v117);
        CGFloat y = v145;
        *(float *)&long double v124 = v124 / (v117 * v117 + v119 * v119);
        *(float *)&long long v150 = *(float *)&v124 / *(float *)&v148;
      }
      else
      {
        LODWORD(v150) = *((_DWORD *)v36 + 13);
        *(CGFloat *)&long long v149 = x;
        double v120 = y;
        double v117 = *(double *)&v151;
        double v119 = v107;
      }
      if (v64->_inferenceInputUsesPortraitOrientation)
      {
        CGAffineTransform v158 = v159;
        v162.origin.CGFloat x = x;
        v162.origin.CGFloat y = y;
        *(void *)&v162.size.width = v151;
        v162.size.height = v107;
        CGRect v163 = CGRectApplyAffineTransform(v162, &v158);
        CGFloat x = v163.origin.x;
        CGFloat y = v163.origin.y;
        *(CGFloat *)&long long v151 = v163.size.width;
        CGFloat v107 = v163.size.height;
        CGAffineTransform v158 = v159;
        *(void *)&v163.origin.CGFloat x = v149;
        v163.origin.CGFloat y = v120;
        v163.size.width = v117;
        v163.size.height = v119;
        CGRect v164 = CGRectApplyAffineTransform(v163, &v158);
        CGFloat v125 = v164.origin.x;
        double v120 = v164.origin.y;
        double v117 = v164.size.width;
        double v119 = v164.size.height;
      }
      else
      {
        CGFloat v125 = *(double *)&v149;
      }
      v165.origin.CGFloat x = x;
      v165.origin.CGFloat y = y;
      *(void *)&v165.size.width = v151;
      v165.size.height = v107;
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v165);
      v166.origin.CGFloat x = v125;
      v166.origin.CGFloat y = v120;
      v166.size.width = v117;
      v166.size.height = v119;
      CFDictionaryRef v127 = CGRectCreateDictionaryRepresentation(v166);
      v160[0] = v141;
      v160[1] = v140;
      v161[0] = v90;
      v161[1] = DictionaryRepresentation;
      v160[2] = v139;
      LODWORD(v128) = *((_DWORD *)v36 + 26);
      v161[2] = [NSNumber numberWithFloat:v128];
      v160[3] = v138;
      v161[3] = [NSNumber numberWithInteger:*(void *)v36];
      v160[4] = v103;
      LODWORD(v129) = v150;
      uint64_t v130 = [NSNumber numberWithFloat:v129];
      v160[5] = v104;
      v161[4] = v130;
      v161[5] = v127;
      uint64_t v131 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v161 forKeys:v160 count:6];
      [v142 addObject:v131];
      if (DictionaryRepresentation) {
        CFRelease(DictionaryRepresentation);
      }
      if (v127) {
        CFRelease(v127);
      }
    }
    v36 += 136;
    --v28;
  }
  while (v28);
LABEL_77:
  if (v90) {
    CFRelease(v90);
  }
  if (v64->_inferenceResultKey) {
    objc_msgSend(v133, "setObject:forKeyedSubscript:", v142);
  }
  int64_t v132 = v64->_maxRegionID;
  if (v132 != maxRegionID) {
    [(FigCaptureLogSmartCameraGating *)v64->_logger logTracksCreated:(v132 - maxRegionID)];
  }
}

- (void)matchCurRegions:(uint64_t)a3 curCount:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v44 = (uint64_t)&v44;
    v6 = (char *)&v44 - ((4 * *(void *)(a1 + 152) * a3 + 19) & 0xFFFFFFFFFFFFFFF0);
    if (a3)
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      unint64_t v9 = *(void *)(a1 + 152);
      do
      {
        if (v9)
        {
          unint64_t v10 = 0;
          v11 = (CGFloat *)(a2 + 136 * v7 + 8);
          uint64_t v12 = 32;
          do
          {
            v51.origin.CGFloat x = *v11;
            v51.origin.CGFloat y = *(CGFloat *)(a2 + 136 * v7 + 16);
            v51.size.double width = *(CGFloat *)(a2 + 136 * v7 + 24);
            v51.size.double height = *(CGFloat *)(a2 + 136 * v7 + 32);
            CGRect v46 = CGRectIntersection(*(CGRect *)(*(void *)(a1 + 144) + v12 - 24), v51);
            CGRect v47 = CGRectStandardize(v46);
            double width = v47.size.width;
            double height = v47.size.height;
            v52.origin.CGFloat x = *v11;
            v52.origin.CGFloat y = *(CGFloat *)(a2 + 136 * v7 + 16);
            v52.size.double width = *(CGFloat *)(a2 + 136 * v7 + 24);
            v52.size.double height = *(CGFloat *)(a2 + 136 * v7 + 32);
            CGRect v48 = CGRectUnion(*(CGRect *)(*(void *)(a1 + 144) + v12 - 24), v52);
            CGRect v49 = CGRectStandardize(v48);
            float v15 = 1.0 - width * height / (v49.size.width * v49.size.height);
            v49.origin.CGFloat x = *v11;
            v49.origin.CGFloat y = *(CGFloat *)(a2 + 136 * v7 + 16);
            v49.size.double width = *(CGFloat *)(a2 + 136 * v7 + 24);
            v49.size.double height = *(CGFloat *)(a2 + 136 * v7 + 32);
            double MidX = CGRectGetMidX(v49);
            v50.origin.CGFloat x = *v11;
            v50.origin.CGFloat y = *(CGFloat *)(a2 + 136 * v7 + 16);
            v50.size.double width = *(CGFloat *)(a2 + 136 * v7 + 24);
            v50.size.double height = *(CGFloat *)(a2 + 136 * v7 + 32);
            double MidY = CGRectGetMidY(v50);
            double v18 = CGRectGetMidX(*(CGRect *)(*(void *)(a1 + 144) + v12 - 24));
            CGFloat v19 = CGRectGetMidY(*(CGRect *)(*(void *)(a1 + 144) + v12 - 24));
            float v20 = v18 - MidX;
            float v21 = v19 - MidY;
            *(float *)&v6[4 * v8 + 4 * v10++] = hypotf(v20, v21) + v15;
            unint64_t v9 = *(void *)(a1 + 152);
            v12 += 136;
          }
          while (v10 < v9);
          v8 += v10;
        }
        ++v7;
      }
      while (v7 != a3);
      uint64_t v22 = objc_msgSend(*(id *)(a1 + 80), "computeMatchingForCostMatrix:withRowCount:columnCount:", v6, a3, *(void *)(a1 + 152), v44, v45);
      [v22 count];
      uint64_t v23 = 0;
      uint64_t v24 = a2 + 88;
      do
      {
        unint64_t v25 = objc_msgSend((id)objc_msgSend(v22, "objectAtIndexedSubscript:", v23), "integerValue");
        if ((v25 & 0x8000000000000000) != 0
          || (unint64_t v26 = *(void *)(a1 + 152), v25 >= v26)
          || *(float *)&v6[4 * v25 + 4 * v26 * v23] > *(float *)(a1 + 56))
        {
          uint64_t v27 = *(void *)(a1 + 88) + 1;
          *(void *)(a1 + 88) = v27;
          *(void *)(v24 - 88) = v27;
          uint64_t v28 = *(void *)(a1 + 136);
          long long v29 = *(_OWORD *)(a1 + 120);
          *(_OWORD *)(v24 + 8) = *(_OWORD *)(a1 + 104);
          *(void *)(v24 + 40) = v28;
          *(_OWORD *)(v24 + 24) = v29;
          float v30 = *(float *)(v24 - 40);
          *(_DWORD *)(v24 + 16) = *(_DWORD *)(v24 - 44);
        }
        else
        {
          uint64_t v37 = *(void *)(a1 + 144) + 136 * v25;
          *(void *)(v24 - 88) = *(void *)v37;
          long long v38 = *(_OWORD *)(v37 + 96);
          long long v39 = *(_OWORD *)(v37 + 112);
          *(void *)(v24 + 40) = *(void *)(v37 + 128);
          *(_OWORD *)(v24 + 24) = v39;
          *(_OWORD *)(v24 + 8) = v38;
          float v40 = *(float *)(v24 - 40);
          float v41 = *(float *)(*(void *)(a1 + 144) + 136 * v25 + 52);
          float v42 = v41 + 90.0;
          float v43 = vabds_f32(v40, v41);
          if (vabds_f32(v40, v41 + 90.0) >= v43)
          {
            float v42 = *(float *)(*(void *)(a1 + 144) + 136 * v25 + 52);
            if (vabds_f32(v40, v41 + -90.0) < v43) {
              float v42 = v41 + -90.0;
            }
          }
          float v30 = (float)(v42 * (float)(1.0 - *(float *)(a1 + 60))) + (float)(v40 * *(float *)(a1 + 60));
        }
        int v31 = *(unsigned __int8 *)(v24 + 8);
        *(float *)(v24 - 36) = v30;
        int v32 = *(unsigned __int8 *)(v24 + 9);
        if (v31)
        {
          float v33 = *(float *)v24;
          BWSmartCameraSceneUpdateWithConfidence(v24 + 8, *(float *)(v24 - 44));
          if (!v32 && v33 < *(float *)(a1 + 64) || v32 && v33 < *(float *)(a1 + 68))
          {
            *(unsigned char *)(v24 + 9) = 0;
            *(_WORD *)(v24 + 32) = 0;
          }
        }
        else
        {
          float v34 = *(float *)(v24 - 44);
          *(float *)(v24 + 16) = v34;
          if (v34 <= *(float *)(v24 + 20))
          {
            BOOL v36 = 0;
          }
          else
          {
            float v35 = *(float *)(a1 + 64);
            BOOL v36 = *(float *)v24 >= v35;
            if (v32 && *(float *)v24 < v35) {
              BOOL v36 = *(float *)v24 >= *(float *)(a1 + 68);
            }
          }
          *(unsigned char *)(v24 + 9) = v36;
        }
        ++v23;
        v24 += 136;
      }
      while (a3 != v23);
    }
    free(*(void **)(a1 + 144));
    *(void *)(a1 + 144) = a2;
    *(void *)(a1 + 152) = a3;
  }
}

- (BOOL)allowsAsyncPropagation
{
  return 0;
}

@end