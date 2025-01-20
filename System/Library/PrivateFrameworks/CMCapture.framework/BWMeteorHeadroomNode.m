@interface BWMeteorHeadroomNode
+ (void)initialize;
- (BWMeteorHeadroomNode)initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4;
- (float)gainMapMainImageDownscalingFactor;
- (int)headroomProcessingType;
- (void)_releaseResources;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setGainMapMainImageDownscalingFactor:(float)a3;
- (void)setHeadroomProcessingType:(int)a3;
@end

@implementation BWMeteorHeadroomNode

+ (void)initialize
{
}

- (BWMeteorHeadroomNode)initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)BWMeteorHeadroomNode;
  v5 = [(BWNode *)&v21 init];
  if (v5)
  {
    if (a4)
    {
      v6 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a4, "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v7 = [a4 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v18;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(a4);
            }
            -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * v10)), "sensorIDDictionary"), "objectForKeyedSubscript:", @"MeteorHeadroom"), *(void *)(*((void *)&v17 + 1) + 8 * v10));
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [a4 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v8);
      }
      v5->_meteorHeadroomParametersByPortType = v6;
    }
    v11 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v5];
    v12 = objc_alloc_init(BWVideoFormatRequirements);
    v13 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1EFB03218];
    objc_msgSend(v13, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 0, 3));
    [(BWVideoFormatRequirements *)v12 setSupportedPixelFormats:v13];
    [(BWNodeInput *)v11 setFormatRequirements:v12];

    [(BWNodeInput *)v11 setPassthroughMode:1];
    [(BWNode *)v5 addInput:v11];
    v14 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v5];
    v15 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeOutput *)v14 setFormatRequirements:v15];

    [(BWNodeOutput *)v14 setPassthroughMode:1];
    [(BWNode *)v5 addOutput:v14];
  }
  return v5;
}

- (void)dealloc
{
  -[BWMeteorHeadroomNode _releaseResources]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)BWMeteorHeadroomNode;
  [(BWNode *)&v3 dealloc];
}

- (void)_releaseResources
{
  if (a1)
  {

    *(void *)(a1 + 128) = 0;
    *(void *)(a1 + 120) = 0;
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  -[BWMeteorHeadroomNode _releaseResources]((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)BWMeteorHeadroomNode;
  [(BWNode *)&v5 didReachEndOfDataForInput:a3];
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v6.receiver = self;
  v6.super_class = (Class)BWMeteorHeadroomNode;
  [(BWNode *)&v6 prepareForCurrentConfigurationToBecomeLive];
  if (!self->_metalContext
    && ((uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()]) == 0
     || (v4 = (FigMetalContext *)[objc_alloc(MEMORY[0x1E4F55F60]) initWithbundle:v3 andOptionalCommandQueue:0], (self->_metalContext = v4) == 0))|| !self->_histogram&& (objc_super v5 = -[FigMetalHistogram initWithMetalContext:]([FigMetalHistogram alloc], "initWithMetalContext:", self->_metalContext), (self->_histogram = v5) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA745E0);
  uint64_t v9 = (void *)CMGetAttachment(a3, @"StillImageSettings", 0);
  uint64_t v10 = (void *)[v9 captureRequestIdentifier];
  v11 = (void *)CMGetAttachment(a3, @"BWStillImageCaptureSettings", 0);
  unsigned int v12 = objc_msgSend((id)CMGetAttachment(a3, @"StillImageProcessingFlags", 0), "unsignedIntValue");
  float lastMeteorHeadroom = 0.0;
  if (v12) {
    goto LABEL_86;
  }
  unsigned int v15 = v12;
  if (![(NSString *)self->_lastCaptureRequestIdentifier isEqualToString:v10])
  {

    self->_lastCaptureRequestIdentifier = (NSString *)[v10 copy];
    self->_float lastMeteorHeadroom = 0.0;
  }
  if (((int v16 = [v11 captureType], objc_msgSend(v11, "captureType") == 10)
     || [v11 captureType] == 12)
    && ([v11 captureFlags] & 0x100000) != 0)
  {
    unint64_t v17 = ((unint64_t)[v11 sceneFlags] >> 2) & 1;
  }
  else
  {
    LODWORD(v17) = 0;
  }
  uint64_t v18 = [v11 captureFlags] & 0x800;
  if (self->_gainMapMainImageDownscalingFactor != 0.0 && v18 == 0)
  {
    long long v20 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA4EB60);
    if (v20) {
      LODWORD(v17) = 1;
    }
  }
  else
  {
    long long v20 = 0;
  }
  if (v16 != 3 && !v17) {
    goto LABEL_86;
  }
  if ((v15 & 0x40) != 0) {
    float lastMeteorHeadroom = self->_lastMeteorHeadroom;
  }
  if (((lastMeteorHeadroom == 0.0) & (v15 >> 6)) == 0 && (v15 & 0x40) != 0) {
    goto LABEL_86;
  }
  CGFloat v21 = *MEMORY[0x1E4F1DB20];
  CGFloat v22 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v23 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v24 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v25 = (double)[v9 outputWidth];
  double v26 = v25 / (double)[v9 outputHeight];
  if (v20)
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v20);
    if (ImageBuffer)
    {
      v28 = ImageBuffer;
      v150.origin.CGFloat x = v21;
      v150.origin.double y = v22;
      v150.size.width = v23;
      v150.size.height = v24;
      double v97 = v26;
      if (CGRectIsNull(v150))
      {
        double v29 = v21;
        double y = v22;
        double v31 = v23;
        double v32 = v24;
      }
      else
      {
        size_t Width = CVPixelBufferGetWidth(v28);
        size_t Height = CVPixelBufferGetHeight(v28);
        v151.origin.CGFloat x = FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRectForAttachedMedia(Width, Height, v21, v22, v23, v24, v26, self->_gainMapMainImageDownscalingFactor);
        double y = v151.origin.y;
        double v31 = v151.size.width;
        double v32 = v151.size.height;
        CGFloat x = v151.origin.x;
        if (CGRectIsNull(v151))
        {
          fig_log_get_emitter();
          uint64_t v95 = v4;
          LODWORD(v94) = 0;
          goto LABEL_91;
        }
        double v29 = x;
      }
      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      if (-[FigMetalHistogram singleComponentGPUHistogramInputPixelBuffer:validRect:outputHistogram:](self->_histogram, "singleComponentGPUHistogramInputPixelBuffer:validRect:outputHistogram:", v28, &v100, v29, y, v31, v32))
      {
        goto LABEL_86;
      }
      uint64_t v35 = 0;
      double v13 = 0.0;
      do
      {
        float32x4_t v36 = vcvtq_f32_u32(*(uint32x4_t *)((char *)&v100 + v35));
        *(float *)&double v13 = (float)((float)((float)(*(float *)&v13 + v36.f32[0]) + v36.f32[1]) + v36.f32[2]) + v36.f32[3];
        v35 += 16;
      }
      while (v35 != 1024);
      if (*(float *)&v13 == 0.0) {
        goto LABEL_86;
      }
      float v37 = 0.0;
      for (uint64_t i = 768; i != 1024; i += 16)
      {
        float32x4_t v39 = vcvtq_f32_u32(*(uint32x4_t *)((char *)&v100 + i));
        float v37 = (float)((float)((float)(v37 + v39.f32[0]) + v39.f32[1]) + v39.f32[2]) + v39.f32[3];
      }
      float v40 = v37 / *(float *)&v13;
      *(float *)&double v13 = v37 / *(float *)&v13;
      CMSetAttachment(a3, @"MeteorPlusGainMapAverage", (CFTypeRef)[NSNumber numberWithFloat:v13], 1u);
      if (AttachedMedia)
      {
        *(float *)&double v41 = v40;
        CMSetAttachment(AttachedMedia, @"MeteorPlusGainMapAverage", (CFTypeRef)[NSNumber numberWithFloat:v41], 1u);
      }
      double v26 = v97;
    }
  }
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  CVImageBufferRef v42 = CMSampleBufferGetImageBuffer(a3);
  if (!v42) {
    goto LABEL_86;
  }
  v43 = v42;
  uint64_t v44 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F53DC0]];
  v152.origin.CGFloat x = v21;
  v152.origin.double y = v22;
  v152.size.width = v23;
  v152.size.height = v24;
  if (!CGRectIsNull(v152))
  {
    size_t v45 = CVPixelBufferGetWidth(v43);
    size_t v46 = CVPixelBufferGetHeight(v43);
    FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(v45, v46, v21, v22, v23, v24, v26);
    CGFloat v21 = v153.origin.x;
    CGFloat v22 = v153.origin.y;
    CGFloat v23 = v153.size.width;
    CGFloat v24 = v153.size.height;
    if (CGRectIsNull(v153))
    {
      fig_log_get_emitter();
      uint64_t v95 = v4;
      LODWORD(v94) = 0;
LABEL_91:
      FigDebugAssert3();
      goto LABEL_86;
    }
  }
  histogram = self->_histogram;
  if (self->_headroomProcessingType)
  {
    if (-[FigMetalHistogram singleComponentGPUHistogramInputPixelBuffer:validRect:outputHistogram:](histogram, "singleComponentGPUHistogramInputPixelBuffer:validRect:outputHistogram:", v43, &v100, v21, v22, v23, v24))
    {
      goto LABEL_86;
    }
  }
  else if (-[FigMetalHistogram singleComponentCPUHistogramInputPixelBuffer:validRect:subSampleX:subSampleY:outputHistogram:](histogram, "singleComponentCPUHistogramInputPixelBuffer:validRect:subSampleX:subSampleY:outputHistogram:", v43, 8, 8, &v100, v21, v22, v23, v24))
  {
    goto LABEL_86;
  }
  FigCaptureComputeImageGainFromMetadata();
  objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F53E48]), "floatValue");
  float v49 = v48;
  id v50 = -[NSDictionary objectForKeyedSubscript:](self->_meteorHeadroomParametersByPortType, "objectForKeyedSubscript:", [v7 objectForKeyedSubscript:*MEMORY[0x1E4F54128]]);
  if ([v50 objectForKey:@"minEIT_Threshold"])
  {
    objc_msgSend((id)objc_msgSend(v50, "objectForKeyedSubscript:", @"minEIT_Threshold"), "floatValue");
    float v52 = v51;
  }
  else
  {
    float v52 = 0.00045;
  }
  if ([v50 objectForKey:@"maxEIT_Threshold"])
  {
    objc_msgSend((id)objc_msgSend(v50, "objectForKeyedSubscript:", @"maxEIT_Threshold"), "floatValue");
    float v54 = v53;
  }
  else
  {
    float v54 = 0.05;
  }
  if ([v50 objectForKey:@"eitHeadroomGamma"])
  {
    objc_msgSend((id)objc_msgSend(v50, "objectForKeyedSubscript:", @"eitHeadroomGamma"), "floatValue");
    float v56 = v55;
  }
  else
  {
    float v56 = 0.1;
  }
  float v57 = v49 * 0.0;
  float v58 = 1.0;
  float v59 = 1.0;
  if ([v50 objectForKey:@"eitHeadroomReduction"])
  {
    objc_msgSend((id)objc_msgSend(v50, "objectForKeyedSubscript:", @"eitHeadroomReduction"), "floatValue");
    float v59 = v60;
  }
  float v61 = powf(v52, v56);
  float v62 = powf(v57, v56);
  float v63 = powf(v54, v56);
  if (v52 <= v57)
  {
    float v58 = v59;
    if (v54 > v57) {
      float v58 = (float)(1.0 - (float)((float)(v62 - v61) / (float)(v63 - v61)))
    }
          + (float)(v59 * (float)((float)(v62 - v61) / (float)(v63 - v61)));
  }
  if (v44)
  {
    if ([v50 objectForKey:@"headroom1"]) {
      objc_msgSend((id)objc_msgSend(v50, "objectForKeyedSubscript:", @"headroom1"), "floatValue");
    }
    else {
      float v64 = 1.0;
    }
    self->_float lastMeteorHeadroom = v58 * v64;
    v135 = @"version";
    v142 = &unk_1EFAFF4F8;
    v136 = @"hasFaces";
    v143 = &unk_1EFAFF4F8;
    v137 = @"headroom";
    uint64_t v144 = objc_msgSend(NSNumber, "numberWithFloat:");
    v72 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v73 = 3;
  }
  else
  {
    uint64_t v65 = 0;
    int32x4_t v66 = 0uLL;
    do
    {
      int32x4_t v66 = vaddq_s32(*(int32x4_t *)((char *)&v100 + v65), v66);
      v65 += 16;
    }
    while (v65 != 1024);
    uint64_t v67 = 0;
    int v68 = vaddvq_s32(v66);
    float v69 = 0.0;
    do
    {
      float32x4_t v70 = vcvtq_f32_u32(*(uint32x4_t *)&v132[v67 + 200]);
      float v69 = (float)((float)((float)(v69 + v70.f32[0]) + v70.f32[1]) + v70.f32[2]) + v70.f32[3];
      v67 += 16;
    }
    while (v67 != 128);
    if ([v50 objectForKey:@"headroom2"]) {
      objc_msgSend((id)objc_msgSend(v50, "objectForKeyedSubscript:", @"headroom2"), "floatValue");
    }
    else {
      *(float *)&int v71 = 1.5689;
    }
    float v98 = *(float *)&v71;
    float v99 = v54;
    float v74 = (float)v68;
    if ([v50 objectForKey:@"headroom3"])
    {
      objc_msgSend((id)objc_msgSend(v50, "objectForKeyedSubscript:", @"headroom3"), "floatValue");
      float v76 = v75;
    }
    else
    {
      float v76 = 1.6864;
    }
    uint64_t v77 = 0;
    float v78 = 0.0;
    do
    {
      float32x4_t v79 = vcvtq_f32_u32(*(uint32x4_t *)&v132[v77]);
      float v78 = (float)((float)((float)(v78 + v79.f32[0]) + v79.f32[1]) + v79.f32[2]) + v79.f32[3];
      v77 += 16;
    }
    while (v77 != 208);
    if ((float)(v69 / v74) <= 0.027536) {
      float v80 = v76;
    }
    else {
      float v80 = v98;
    }
    float v81 = v78 / v74;
    BOOL v82 = v81 >= 0.0458 || v57 <= 0.013;
    float v83 = fmaxf(v80 + -0.2, 0.0);
    if (v82) {
      float v83 = v80;
    }
    self->_float lastMeteorHeadroom = v58 * v83;
    v135 = @"version";
    v142 = &unk_1EFAFF4F8;
    v136 = @"hasFaces";
    v143 = &unk_1EFAFF510;
    v137 = @"h7";
    uint64_t v144 = objc_msgSend(NSNumber, "numberWithFloat:");
    v138 = @"thresholds";
    v133[0] = @"h7_threshold";
    v134[0] = &unk_1EFB05918;
    v133[1] = @"headroom2";
    *(float *)&double v84 = v98;
    v134[1] = [NSNumber numberWithFloat:v84];
    v133[2] = @"headroom3";
    *(float *)&double v85 = v76;
    v134[2] = [NSNumber numberWithFloat:v85];
    v133[3] = @"minEIT_Threshold";
    *(float *)&double v86 = v52;
    v134[3] = [NSNumber numberWithFloat:v86];
    v133[4] = @"maxEIT_Threshold";
    *(float *)&double v87 = v99;
    v134[4] = [NSNumber numberWithFloat:v87];
    v133[5] = @"eitHeadroomGamma";
    *(float *)&double v88 = v56;
    v134[5] = [NSNumber numberWithFloat:v88];
    v133[6] = @"eitHeadroomReduction";
    *(float *)&double v89 = v59;
    v134[6] = [NSNumber numberWithFloat:v89];
    uint64_t v145 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v134 forKeys:v133 count:7];
    v139 = @"brightness";
    *(float *)&double v90 = v57;
    uint64_t v146 = [NSNumber numberWithFloat:v90];
    v140 = @"midHighlights";
    *(float *)&double v91 = v81;
    uint64_t v147 = [NSNumber numberWithFloat:v91];
    v141 = @"headroom";
    *(float *)&double v92 = self->_lastMeteorHeadroom;
    uint64_t v148 = [NSNumber numberWithFloat:v92];
    v72 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v73 = 7;
  }
  [v72 dictionaryWithObjects:&v142 forKeys:&v135 count:v73];
  float lastMeteorHeadroom = self->_lastMeteorHeadroom;
LABEL_86:
  *(float *)&double v13 = lastMeteorHeadroom;
  CMSetAttachment(a3, @"MeteorHeadroom", (CFTypeRef)objc_msgSend(NSNumber, "numberWithFloat:", v13, v94, v95), 1u);
  if (AttachedMedia)
  {
    *(float *)&double v93 = lastMeteorHeadroom;
    CMSetAttachment(AttachedMedia, @"MeteorHeadroom", (CFTypeRef)[NSNumber numberWithFloat:v93], 1u);
  }
  [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
}

- (void)setGainMapMainImageDownscalingFactor:(float)a3
{
  self->_gainMapMainImageDownscalingFactor = a3;
}

- (float)gainMapMainImageDownscalingFactor
{
  return self->_gainMapMainImageDownscalingFactor;
}

- (void)setHeadroomProcessingType:(int)a3
{
  self->_headroomProcessingType = a3;
}

- (int)headroomProcessingType
{
  return self->_headroomProcessingType;
}

@end