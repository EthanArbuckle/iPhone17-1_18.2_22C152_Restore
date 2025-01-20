@interface BWStillImageCoreImageBlurMapRenderer
+ (void)initialize;
- (BOOL)adjustsMetadata;
- (BOOL)supportsAnimation;
- (NSString)displayName;
- (id)initForRenderingWithContext:(id)a3 hairnetEnabled:(BOOL)a4;
- (int)_allocateBlurMapPixelBufferPoolForBuffersOfWidth:(unint64_t)a3 height:(unint64_t)a4;
- (int)_allocateBlurredGainMapPixleBufferPoolForBuffersOfWidth:(unint64_t)a3 height:(unint64_t)a4;
- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5;
- (signed)type;
- (void)dealloc;
- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8;
@end

@implementation BWStillImageCoreImageBlurMapRenderer

+ (void)initialize
{
}

- (id)initForRenderingWithContext:(id)a3 hairnetEnabled:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWStillImageCoreImageBlurMapRenderer;
  v6 = [(BWStillImageCoreImageBlurMapRenderer *)&v8 init];
  if (v6)
  {
    v6->_ciContext = (CIContext *)a3;
    v6->_hairnetEnabled = a4;
    v6->_blurMapFilter = (CIFilter *)(id)[MEMORY[0x1E4F1E040] filterWithName:@"CIDepthEffectMakeBlurMap"];
  }
  return v6;
}

- (void)dealloc
{
  blurredGainMapFormatDescription = self->_blurredGainMapFormatDescription;
  if (blurredGainMapFormatDescription) {
    CFRelease(blurredGainMapFormatDescription);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWStillImageCoreImageBlurMapRenderer;
  [(BWStillImageCoreImageBlurMapRenderer *)&v4 dealloc];
}

- (signed)type
{
  return 4;
}

- (NSString)displayName
{
  return (NSString *)@"Core Image Blur Map Renderer";
}

- (BOOL)supportsAnimation
{
  return 0;
}

- (BOOL)adjustsMetadata
{
  return 0;
}

- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  int result = [a3 prepareForRenderingWithInputVideoFormat:a4];
  if (!result)
  {
    if (a4)
    {
      if (!self->_blurMapPixelBufferPool) {
        -[BWStillImageCoreImageBlurMapRenderer _allocateBlurMapPixelBufferPoolForBuffersOfWidth:height:](self, "_allocateBlurMapPixelBufferPoolForBuffersOfWidth:height:", (unint64_t)[a4 width] >> 1, (unint64_t)objc_msgSend(a4, "height") >> 1);
      }
      return 0;
    }
    else
    {
      return -12780;
    }
  }
  return result;
}

- (int)_allocateBlurMapPixelBufferPoolForBuffersOfWidth:(unint64_t)a3 height:(unint64_t)a4
{
  v14[4] = *MEMORY[0x1E4F143B8];
  if (!self->_blurMapPixelBufferPool)
  {
    if (self->_hairnetEnabled) {
      uint64_t v6 = 1380411457;
    }
    else {
      uint64_t v6 = 843264104;
    }
    v13[0] = *MEMORY[0x1E4F24E10];
    v14[0] = [NSNumber numberWithUnsignedLong:a3];
    v13[1] = *MEMORY[0x1E4F24D08];
    v14[1] = [NSNumber numberWithUnsignedLong:a4];
    v13[2] = *MEMORY[0x1E4F24D70];
    uint64_t v7 = [NSNumber numberWithUnsignedInt:v6];
    v13[3] = *MEMORY[0x1E4F24D20];
    v14[2] = v7;
    v14[3] = MEMORY[0x1E4F1CC08];
    objc_super v8 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4]);
    v12 = v8;
    id v9 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1]);

    v10 = [[BWPixelBufferPool alloc] initWithVideoFormat:v9 capacity:1 name:@"Still Image Core Image Blur Map Pool" memoryPool:+[BWMemoryPool sharedMemoryPool]];
    self->_blurMapPixelBufferPool = v10;
    if (!v10)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  return 0;
}

- (int)_allocateBlurredGainMapPixleBufferPoolForBuffersOfWidth:(unint64_t)a3 height:(unint64_t)a4
{
  v20[4] = *MEMORY[0x1E4F143B8];
  if (!self->_blurredGainMapPixelBufferPool)
  {
    v19[0] = *MEMORY[0x1E4F24E10];
    v20[0] = [NSNumber numberWithUnsignedLong:a3];
    v19[1] = *MEMORY[0x1E4F24D08];
    uint64_t v6 = [NSNumber numberWithUnsignedLong:a4];
    uint64_t v7 = *MEMORY[0x1E4F24D70];
    v20[1] = v6;
    v20[2] = &unk_1EFAFDED8;
    uint64_t v8 = *MEMORY[0x1E4F24D20];
    v19[2] = v7;
    v19[3] = v8;
    v20[3] = MEMORY[0x1E4F1CC08];
    id v9 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4]);
    v18 = v9;
    id v10 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1]);

    uint64_t v16 = *MEMORY[0x1E4F24990];
    uint64_t v14 = *MEMORY[0x1E4F24BC8];
    uint64_t v15 = *MEMORY[0x1E4F24BE8];
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    LOBYTE(v13) = 0;
    v11 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:additionalPixelBufferAttributes:providesBackPressure:reportSlowBackPressureAllocations:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:additionalPixelBufferAttributes:providesBackPressure:reportSlowBackPressureAllocations:", v10, 1, @"Still Image Core Image Blurred Gain Map Pool", +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1], 0, v13);
    self->_blurredGainMapPixelBufferPool = v11;
    if (!v11)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  return 0;
}

- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8
{
  uint64_t v8 = (void (**)(id, void, id))a8;
  id v10 = 0;
  uint64_t v209 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  id v173 = 0;
  int v11 = -12780;
  if (a4 && a5)
  {
    AuxiliaryImagePropertiesFromGainMapSampleBuffer = 0;
    uint64_t v13 = 0;
    id v14 = 0;
    obuint64_t j = 0;
    AuxiliaryImagePropertiesFromDepthMetadata = 0;
    uint64_t v16 = 0;
    if (!a8) {
      goto LABEL_118;
    }
    obuint64_t j = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    context = (void *)MEMORY[0x1A6272C70]();
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, @"Depth");
    v19 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, 0x1EFA74420);
    CFTypeRef v20 = CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E4F55BF0], 0);
    CFStringRef v21 = (const __CFString *)*MEMORY[0x1E4F53070];
    CFTypeRef v22 = CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (v22) {
      BOOL v23 = v20 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    if (v23 || (v152 = v20, v164 = (void *)v22, (CFTypeRef v24 = CMGetAttachment(a5, @"StillSettings", 0)) == 0))
    {
      AuxiliaryImagePropertiesFromGainMapSampleBuffer = 0;
      uint64_t v13 = 0;
      id v14 = 0;
      AuxiliaryImagePropertiesFromDepthMetadata = 0;
      uint64_t v16 = 0;
      int v11 = -12780;
      goto LABEL_116;
    }
    v151 = (void *)v24;
    CFStringRef v153 = v21;
    if (AttachedMedia) {
      CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
    }
    else {
      CVImageBufferRef ImageBuffer = 0;
    }
    v26 = (uint64_t *)MEMORY[0x1E4F1E378];
    uint64_t v27 = MEMORY[0x1E4F1CC38];
    if (v19)
    {
      CVImageBufferRef v28 = CMSampleBufferGetImageBuffer(v19);
      uint64_t v202 = *v26;
      uint64_t v203 = v27;
      CVImageBufferRef v157 = v28;
      uint64_t v150 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:options:", v28, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v203, &v202, 1));
    }
    else
    {
      uint64_t v150 = 0;
      CVImageBufferRef v157 = 0;
    }
    uint64_t v29 = v27;
    v156 = v8;
    v30 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, @"PersonSemanticsHair");
    if (v30) {
      CVImageBufferRef v31 = CMSampleBufferGetImageBuffer(v30);
    }
    else {
      CVImageBufferRef v31 = 0;
    }
    v32 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, @"PersonSemanticsGlasses");
    if (v32) {
      CVImageBufferRef v162 = CMSampleBufferGetImageBuffer(v32);
    }
    else {
      CVImageBufferRef v162 = 0;
    }
    uint64_t v200 = *v26;
    uint64_t v33 = v200;
    uint64_t v201 = v27;
    uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:options:", a4, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v201, &v200, 1));
    uint64_t v35 = *MEMORY[0x1E4F1E480];
    [obj setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F1E480]];
    uint64_t v158 = v33;
    if (v157)
    {
      uint64_t v198 = v33;
      uint64_t v199 = v29;
      uint64_t v36 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:options:", v157, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v199, &v198, 1));
    }
    else
    {
      uint64_t v36 = 0;
    }
    [obj setObject:v36 forKeyedSubscript:@"inputMatteImage"];
    v37 = (void *)CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E4F55B40], 0);
    AuxiliaryImagePropertiesFromDepthMetadata = FigCaptureMetadataUtilitiesCreateAuxiliaryImagePropertiesFromDepthMetadata(v37);
    if (AuxiliaryImagePropertiesFromDepthMetadata
      && (id v38 = objc_alloc(NSClassFromString(&cfstr_Avdepthdata.isa)),
          v155 = v37,
          (id v39 = (id)[v38 performSelector:NSSelectorFromString(&cfstr_Initwithpixelb.isa) withObject:ImageBuffer withObject:v37]) != 0))
    {
      uint64_t v149 = v35;
      v40 = (void *)MEMORY[0x1E4F1E050];
      uint64_t v41 = *MEMORY[0x1E4F1E320];
      v197[0] = v39;
      uint64_t v42 = *MEMORY[0x1E4F1E3C8];
      v196[0] = v41;
      uint64_t v147 = v42;
      v196[1] = v42;
      uint64_t v146 = *MEMORY[0x1E4F2F380];
      uint64_t v194 = *MEMORY[0x1E4F2F380];
      v195 = AuxiliaryImagePropertiesFromDepthMetadata;
      v197[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v195 forKeys:&v194 count:1];
      v159 = AuxiliaryImagePropertiesFromDepthMetadata;
      objc_msgSend(obj, "setObject:forKeyedSubscript:", objc_msgSend(v40, "imageWithCVPixelBuffer:options:", ImageBuffer, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v197, v196, 2)), @"inputShiftmapImage");
      [obj setObject:AuxiliaryImagePropertiesFromDepthMetadata forKeyedSubscript:@"inputAuxDataMetadata"];
      if (v31)
      {
        uint64_t v43 = v33;
        uint64_t v192 = v33;
        uint64_t v193 = v29;
        uint64_t v44 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:options:", v31, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v193, &v192, 1));
      }
      else
      {
        uint64_t v44 = 0;
        uint64_t v43 = v33;
      }
      [obj setObject:v44 forKeyedSubscript:@"inputHairImage"];
      if (v162)
      {
        uint64_t v190 = v43;
        uint64_t v191 = v29;
        uint64_t v45 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:options:", v162, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1));
      }
      else
      {
        uint64_t v45 = 0;
      }
      [obj setObject:v45 forKeyedSubscript:@"inputGlassesImage"];
      [obj setObject:&unk_1EFAFDEF0 forKeyedSubscript:@"inputScale"];
      uint64_t v148 = *MEMORY[0x1E4F55798];
      objc_msgSend(obj, "setObject:forKeyedSubscript:", objc_msgSend(v37, "objectForKeyedSubscript:"), @"inputAperture");
      v46 = a5;
      AttachedInference = (void *)BWInferenceGetAttachedInference(a5, 801, 0x1EFA6A0A0);
      unsigned int v163 = objc_msgSend((id)objc_msgSend(v164, "objectForKeyedSubscript:", *MEMORY[0x1E4F53248]), "intValue");
      if ([AttachedInference count] >= 5)
      {
        fig_log_get_emitter();
        uint64_t v145 = v161;
        LODWORD(v144) = 0;
        FigDebugAssert3();
      }
      else
      {
        long long v207 = 0u;
        long long v208 = 0u;
        long long v205 = 0u;
        long long v206 = 0u;
        uint64_t v48 = [AttachedInference countByEnumeratingWithState:&v205 objects:v204 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          unsigned int v165 = 0;
          uint64_t v50 = *(void *)v206;
          do
          {
            for (uint64_t i = 0; i != v49; ++i)
            {
              if (*(void *)v206 != v50) {
                objc_enumerationMutation(AttachedInference);
              }
              v52 = *(void **)(*((void *)&v205 + 1) + 8 * i);
              v53 = objc_msgSend((id)objc_msgSend(v52, "landmarks"), "leftEye");
              v54 = objc_msgSend((id)objc_msgSend(v52, "landmarks"), "rightEye");
              v55 = objc_msgSend((id)objc_msgSend(v52, "landmarks"), "nose");
              uint64_t v56 = objc_msgSend((id)objc_msgSend(v52, "landmarks"), "allPoints");
              if (v53) {
                BOOL v57 = v54 == 0;
              }
              else {
                BOOL v57 = 1;
              }
              if (!v57 && v55 != 0)
              {
                v59 = (void *)v56;
                if ([v53 pointCount])
                {
                  if ([v54 pointCount]
                    && [v55 pointCount]
                    && [v59 pointCount] == 65
                    && [v53 normalizedPoints]
                    && [v54 normalizedPoints]
                    && [v55 normalizedPoints]
                    && [v59 normalizedPoints])
                  {
                    [v52 boundingBox];
                    *(void *)&long long v184 = v60;
                    *((void *)&v184 + 1) = v61;
                    *(void *)&long long v185 = v62;
                    *((void *)&v185 + 1) = v63;
                    v64 = (float64x2_t *)[v53 normalizedPoints];
                    int v65 = [v53 pointCount];
                    float64x2_t v66 = 0uLL;
                    if (v65 >= 1)
                    {
                      uint64_t v67 = v65;
                      do
                      {
                        float64x2_t v68 = *v64++;
                        float64x2_t v66 = vaddq_f64(v66, v68);
                        --v67;
                      }
                      while (v67);
                    }
                    float64x2_t v183 = vdivq_f64(v66, (float64x2_t)vdupq_lane_s64(COERCE__INT64((float)v65), 0));
                    v69 = (double *)&v188[64 * (unint64_t)v165];
                    sicibmr_landmarkToC0(v163, v183.f64, (double *)&v184, v69 + 2);
                    v70 = (float64x2_t *)[v54 normalizedPoints];
                    int v71 = [v54 pointCount];
                    float64x2_t v72 = 0uLL;
                    if (v71 >= 1)
                    {
                      uint64_t v73 = v71;
                      do
                      {
                        float64x2_t v74 = *v70++;
                        float64x2_t v72 = vaddq_f64(v72, v74);
                        --v73;
                      }
                      while (v73);
                    }
                    float64x2_t v183 = vdivq_f64(v72, (float64x2_t)vdupq_lane_s64(COERCE__INT64((float)v71), 0));
                    sicibmr_landmarkToC0(v163, v183.f64, (double *)&v184, v69 + 4);
                    v75 = (float64x2_t *)[v55 normalizedPoints];
                    int v76 = [v55 pointCount];
                    if (v76 < 1)
                    {
                      float64x2_t v78 = 0uLL;
                      uint64_t v79 = v165;
                    }
                    else
                    {
                      uint64_t v77 = v76;
                      float64x2_t v78 = 0uLL;
                      uint64_t v79 = v165;
                      do
                      {
                        float64x2_t v80 = *v75++;
                        float64x2_t v78 = vaddq_f64(v78, v80);
                        --v77;
                      }
                      while (v77);
                    }
                    float64x2_t v183 = vdivq_f64(v78, (float64x2_t)vdupq_lane_s64(COERCE__INT64((float)v76), 0));
                    v81 = (double *)&v188[64 * v79];
                    sicibmr_landmarkToC0(v163, v183.f64, (double *)&v184, v81);
                    float64x2_t v183 = *(float64x2_t *)([v59 normalizedPoints] + 736);
                    sicibmr_landmarkToC0(v163, v183.f64, (double *)&v184, v81 + 6);
                    ++v165;
                  }
                }
              }
            }
            uint64_t v49 = [AttachedInference countByEnumeratingWithState:&v205 objects:v204 count:16];
          }
          while (v49);
          v46 = a5;
          if (v165)
          {
            uint64_t v82 = 0;
            memset(v204, 0, 64);
            long long v207 = 0u;
            long long v208 = 0u;
            long long v205 = 0u;
            long long v206 = 0u;
            long long v186 = 0u;
            long long v187 = 0u;
            long long v184 = 0u;
            long long v185 = 0u;
            v83 = (double *)&v189;
            memset(&v183, 0, 64);
            do
            {
              uint64_t v84 = 8 * v82;
              double v85 = *(v83 - 1);
              *(double *)((char *)v204 + v84) = *(v83 - 2);
              unsigned int v86 = v82 + 1;
              *((double *)v204 + v86) = 1.0 - v85;
              double v87 = v83[1];
              *(double *)((char *)&v205 + v84) = *v83;
              *((double *)&v205 + v86) = 1.0 - v87;
              double v88 = v83[3];
              v183.f64[(unint64_t)v84 / 8] = v83[2];
              v183.f64[v86] = 1.0 - v88;
              double v89 = *(v83 - 3);
              *(double *)((char *)&v184 + v84) = *(v83 - 4);
              *((double *)&v184 + v86) = 1.0 - v89;
              v82 += 2;
              v83 += 8;
            }
            while (2 * v165 != v82);
            uint64_t v90 = 2 * v165;
            objc_msgSend(obj, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithValues:count:", v204, v90, 1.0), @"inputLeftEyePosition");
            objc_msgSend(obj, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithValues:count:", &v205, v90), @"inputRightEyePosition");
            objc_msgSend(obj, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithValues:count:", &v183, v90), @"inputChinPosition");
            objc_msgSend(obj, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithValues:count:", &v184, v90), @"inputFaceMidPoint");
            v46 = a5;
          }
        }
      }
      ExifAuxRegionsDictForSampleBuffer = FigCaptureMetadataUtiliesCreateExifAuxRegionsDictForSampleBuffer(v46, 1);
      v92 = (void *)[(__CFDictionary *)ExifAuxRegionsDictForSampleBuffer objectForKeyedSubscript:*MEMORY[0x1E4F2F778]];
      long long v205 = 0u;
      long long v206 = 0u;
      long long v207 = 0u;
      long long v208 = 0u;
      uint64_t v93 = [v92 countByEnumeratingWithState:&v205 objects:v204 count:16];
      v94 = (double *)MEMORY[0x1E4F1DB20];
      if (v93)
      {
        uint64_t v95 = v93;
        uint64_t v96 = *(void *)v206;
        uint64_t v97 = *MEMORY[0x1E4F2F780];
        uint64_t v98 = *MEMORY[0x1E4F2F768];
LABEL_73:
        uint64_t v99 = 0;
        while (1)
        {
          if (*(void *)v206 != v96) {
            objc_enumerationMutation(v92);
          }
          v100 = *(void **)(*((void *)&v205 + 1) + 8 * v99);
          if (objc_msgSend((id)objc_msgSend(v100, "objectForKeyedSubscript:", v97, v144, v145), "isEqualToString:", v98))break; {
          if (v95 == ++v99)
          }
          {
            uint64_t v95 = [v92 countByEnumeratingWithState:&v205 objects:v204 count:16];
            if (v95) {
              goto LABEL_73;
            }
            goto LABEL_93;
          }
        }
        if (!v100) {
          goto LABEL_93;
        }
        v101 = (void *)[v100 objectForKeyedSubscript:*MEMORY[0x1E4F2F790]];
        v102 = (void *)[v100 objectForKeyedSubscript:*MEMORY[0x1E4F2F798]];
        v103 = (void *)[v100 objectForKeyedSubscript:*MEMORY[0x1E4F2F788]];
        v104 = (void *)[v100 objectForKeyedSubscript:*MEMORY[0x1E4F2F770]];
        [v101 floatValue];
        double v106 = v105;
        [v102 floatValue];
        double v108 = v107;
        [v103 floatValue];
        double v110 = v109;
        [v104 floatValue];
        double v112 = v111;
        double v113 = v111 * 0.5;
        double v114 = v108 - v113;
        if (vabdd_f64(v106, v110 * 0.5) <= 0.0001 && v106 - v110 * 0.5 < 0.0) {
          double v116 = 0.0;
        }
        else {
          double v116 = v106 - v110 * 0.5;
        }
        BOOL v117 = vabdd_f64(v108, v113) <= 0.0001 && v114 < 0.0;
        double v118 = 1.0;
        if (!v117) {
          double v118 = 1.0 - v114;
        }
        double v119 = fmax(v118 - v112, 0.0);
      }
      else
      {
LABEL_93:
        double v116 = *v94;
        double v119 = v94[1];
        double v110 = v94[2];
        double v112 = v94[3];
      }
      v210.origin.x = v116;
      v210.origin.y = v119;
      v210.size.width = v110;
      v210.size.height = v112;
      uint64_t v8 = v156;
      AuxiliaryImagePropertiesFromDepthMetadata = v159;
      if (!CGRectIsNull(v210)) {
        objc_msgSend(obj, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGRect:", v116, v119, v110, v112), @"inputFocusRect");
      }

      [(CIFilter *)self->_blurMapFilter setValuesForKeysWithDictionary:obj];
      v120 = [(CIFilter *)self->_blurMapFilter outputImage];
      uint64_t v16 = [(BWPixelBufferPool *)self->_blurMapPixelBufferPool newPixelBuffer];
      if (!v16)
      {
        AuxiliaryImagePropertiesFromGainMapSampleBuffer = 0;
        uint64_t v13 = 0;
        id v14 = 0;
        int v11 = -12786;
        goto LABEL_116;
      }
      sicibmr_renderToPixelBuffer(self->_ciContext, (uint64_t)v120, v16, &v173);
      if (v173)
      {
        id v142 = v173;
        AuxiliaryImagePropertiesFromGainMapSampleBuffer = 0;
        uint64_t v13 = 0;
        id v14 = 0;
        goto LABEL_115;
      }
      v121 = (void *)BWSampleBufferGetAttachedMedia(a5, 0x1EFA4EB60);
      v122 = (void *)CMGetAttachment(v121, v153, 0);
      if (!v122
        || (v123 = v122,
            objc_msgSend((id)objc_msgSend(v122, "objectForKeyedSubscript:", *MEMORY[0x1E4F53318]), "intValue") < 0x20000))
      {
        AuxiliaryImagePropertiesFromGainMapSampleBuffer = 0;
        uint64_t v13 = 0;
        id v14 = 0;
LABEL_114:
        CMSetAttachment(a5, @"PortraitStillImageFaceAdjustedBlurMap", v16, 1u);
        CMSetAttachment(a5, @"PortraitStillImageAuxDepthMetadata", AuxiliaryImagePropertiesFromDepthMetadata, 1u);
        BWSampleBufferSetAttachedMedia(a5, 0x1EFA74600, (uint64_t)cf);
LABEL_115:
        int v11 = 0;
        goto LABEL_116;
      }
      v124 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v121);
      v125 = v124;
      if (!self->_blurredGainMapPixelBufferPool)
      {
        size_t Width = CVPixelBufferGetWidth(v124);
        [(BWStillImageCoreImageBlurMapRenderer *)self _allocateBlurredGainMapPixleBufferPoolForBuffersOfWidth:Width height:CVPixelBufferGetHeight(v125)];
      }
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v166 = (void *)[MEMORY[0x1E4F1E040] filterWithName:@"CIDepthEffectApplyBlurMap"];
      objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a5, @"StillSettings", 0), "captureSettings"), "captureFlags");
      AuxiliaryImagePropertiesFromGainMapSampleBuffer = FigCaptureMetadataUtilitiesCreateAuxiliaryImagePropertiesFromGainMapSampleBuffer(v123);
      if (!AuxiliaryImagePropertiesFromGainMapSampleBuffer) {
        AuxiliaryImagePropertiesFromGainMapSampleBuffer = CGImageMetadataCreateMutable();
      }
      v127 = (void *)MEMORY[0x1E4F1E050];
      v182[0] = MEMORY[0x1E4F1CC38];
      uint64_t v128 = *MEMORY[0x1E4F1E390];
      v181[0] = v158;
      v181[1] = v128;
      v182[1] = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v144);
      v181[2] = v147;
      uint64_t v179 = v146;
      v180 = AuxiliaryImagePropertiesFromGainMapSampleBuffer;
      v182[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v180 forKeys:&v179 count:1];
      v129 = objc_msgSend(v127, "imageWithCVPixelBuffer:options:", v125, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v182, v181, 3));
      int v130 = BWCIFilterArrayContainsPortraitEffectStageFilters(objc_msgSend((id)objc_msgSend(v151, "requestedSettings"), "processedImageFilters"), 0);
      if (v157 && v130)
      {
        uint64_t v177 = v158;
        uint64_t v178 = MEMORY[0x1E4F1CC38];
        uint64_t v131 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:options:", v157, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v178, &v177, 1));
        v129 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1E000], "componentMultiply"), "applyWithForeground:background:", v131, v129);
      }
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v129, "imageByApplyingFilter:", @"CISRGBToneCurveToLinear"), v149);
      [v14 setObject:v120 forKeyedSubscript:@"inputBlurMap"];
      [v14 setObject:v129 forKeyedSubscript:@"inputGainMap"];
      [v14 setObject:v159 forKeyedSubscript:@"inputAuxDataMetadata"];
      [v14 setObject:v150 forKeyedSubscript:@"inputMatteImage"];
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v155, "objectForKeyedSubscript:", v148), @"inputAperture");
      if (objc_msgSend((id)objc_msgSend(v166, "inputKeys"), "containsObject:", @"inputBestHairQuality"))objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC28], @"inputBestHairQuality"); {
      [v14 setObject:v152 forKeyedSubscript:@"inputLumaNoiseScale"];
      }
      [v166 setValuesForKeysWithDictionary:v14];
      uint64_t v13 = [(BWPixelBufferPool *)self->_blurredGainMapPixelBufferPool newPixelBuffer];
      if (v13)
      {
        v132 = (void *)[v166 outputImage];
        v175[0] = @"inputRVector";
        v176[0] = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
        v175[1] = @"inputGVector";
        v176[1] = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
        v175[2] = @"inputBVector";
        v176[2] = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
        uint64_t v133 = objc_msgSend(v132, "imageByApplyingFilter:withInputParameters:", @"CIColorMatrix", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v176, v175, 3));
        CVBufferSetAttachment(v13, @"CVImageBufferTransferFunction", (CFTypeRef)*MEMORY[0x1E4F24C10], kCVAttachmentMode_ShouldPropagate);
        sicibmr_renderToPixelBuffer(self->_ciContext, v133, v13, &v173);
        if (v173)
        {
          id v143 = v173;
          int v11 = 0;
          uint64_t v8 = v156;
          v135 = context;
          AuxiliaryImagePropertiesFromDepthMetadata = v159;
          goto LABEL_117;
        }
        int CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)v121, v13, (CFTypeRef *)&self->_blurredGainMapFormatDescription, (CMSampleBufferRef *)&cf);
        uint64_t v8 = v156;
        AuxiliaryImagePropertiesFromDepthMetadata = v159;
        if (CopyWithNewPixelBuffer)
        {
          int v11 = CopyWithNewPixelBuffer;
LABEL_116:
          v135 = context;
LABEL_117:
          id v10 = v173;
LABEL_118:
          if (!v11) {
            goto LABEL_121;
          }
          goto LABEL_119;
        }
        goto LABEL_114;
      }
      int v11 = -12786;
    }
    else
    {
      AuxiliaryImagePropertiesFromGainMapSampleBuffer = 0;
      uint64_t v13 = 0;
      id v14 = 0;
      uint64_t v16 = 0;
      int v11 = -12780;
    }
    uint64_t v8 = v156;
    goto LABEL_116;
  }
  AuxiliaryImagePropertiesFromGainMapSampleBuffer = 0;
  uint64_t v13 = 0;
  id v14 = 0;
  obuint64_t j = 0;
  AuxiliaryImagePropertiesFromDepthMetadata = 0;
  uint64_t v16 = 0;
LABEL_119:
  if (!v10)
  {
    id v10 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], v11, 0, a6, a7);
    id v173 = v10;
  }
LABEL_121:
  v136 = AuxiliaryImagePropertiesFromDepthMetadata;
  if (v8) {
    v8[2](v8, 0, v10);
  }
  long long v170 = 0u;
  long long v171 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  uint64_t v137 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v168, v174, 16, a6, a7, v144);
  if (v137)
  {
    uint64_t v138 = v137;
    uint64_t v139 = *(void *)v169;
    do
    {
      for (uint64_t j = 0; j != v138; ++j)
      {
        if (*(void *)v169 != v139) {
          objc_enumerationMutation(obj);
        }
        uint64_t v141 = *(void *)(*((void *)&v168 + 1) + 8 * j);
        if ([(NSArray *)[(CIFilter *)self->_blurMapFilter inputKeys] containsObject:v141])
        {
          [(CIFilter *)self->_blurMapFilter setValue:0 forKey:v141];
        }
      }
      uint64_t v138 = [obj countByEnumeratingWithState:&v168 objects:v174 count:16];
    }
    while (v138);
  }

  if (cf) {
    CFRelease(cf);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v136) {
    CFRelease(v136);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (AuxiliaryImagePropertiesFromGainMapSampleBuffer) {
    CFRelease(AuxiliaryImagePropertiesFromGainMapSampleBuffer);
  }
}

@end