@interface VCPLivePhotoKeyFrameAnalyzer
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)selectKeyFrameRangeWithMotion:(SEL)a3 stillTimestamp:(id)a4 isMetaMotion:(float)a5;
- (VCPLivePhotoKeyFrameAnalyzer)initWithWidth:(int)a3 height:(int)a4;
- (float)computeOverallFaceQualityScore:(id)a3;
- (float)computeScoreForPhoto:(float)a3 withRefKeyFrame:(id)a4;
- (float)getFaceHeat:(CGRect)a3;
- (int)analyzeLivePhotoKeyFrame:(id)a3 irisPhotoOffsetSec:(float)a4 originalIrisPhotoOffsetSec:(float)a5 photoTextureScore:(float)a6 hadFlash:(BOOL)a7 cancel:(id)a8;
- (int)reportLivePhotoKeyFrameAnalysisResults:(BOOL)a3 selectedKeyFrame:(id)a4 originalStillKeyFrame:(id)a5 stillScore:(float)a6 stillFQScore:(float)a7 stillTimestamp:(float)a8 useSemanticOnly:(BOOL)a9 isKeyFrameSuggested:(BOOL)a10;
- (void)createFaceHeatMap:(id)a3 imageFaces:(id)a4;
- (void)dealloc;
- (void)fetchAndComputeScoreForKeyFrame:(id)a3 withResult:(id)a4;
- (void)updateFaceHeatMap:(id)a3;
@end

@implementation VCPLivePhotoKeyFrameAnalyzer

- (VCPLivePhotoKeyFrameAnalyzer)initWithWidth:(int)a3 height:(int)a4
{
  v14.receiver = self;
  v14.super_class = (Class)VCPLivePhotoKeyFrameAnalyzer;
  v6 = [(VCPLivePhotoKeyFrameAnalyzer *)&v14 init];
  v7 = v6;
  if (!v6)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v6->_photoSharpnessReliable = 1;
  v6->_width = a3;
  v6->_height = a4;
  v6->_numOfFrames = 0;
  *(_WORD *)&v6->_petsDominant = 256;
  v8 = (char *)operator new[](a4 * a3, MEMORY[0x1E4FBA2D0]);
  v7->_faceHeatMap = v8;
  v9 = v7;
  if (!v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13[0] = 0;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "Failed to allocate memory", (uint8_t *)v13, 2u);
      }
    }
    goto LABEL_7;
  }
LABEL_8:
  v11 = v9;

  return v11;
}

- (void)dealloc
{
  faceHeatMap = self->_faceHeatMap;
  if (faceHeatMap) {
    MEMORY[0x1C186C790](faceHeatMap, 0x1000C8077774924);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPLivePhotoKeyFrameAnalyzer;
  [(VCPLivePhotoKeyFrameAnalyzer *)&v4 dealloc];
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)selectKeyFrameRangeWithMotion:(SEL)a3 stillTimestamp:(id)a4 isMetaMotion:(float)a5
{
  BOOL v6 = a6;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v10 = v9;
  if (v6) {
    float v11 = 100.0;
  }
  else {
    float v11 = 33.333;
  }
  CMTime v55 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  memset(&v54, 0, sizeof(v54));
  CFDictionaryRef v12 = [v9 lastObject];
  CMTimeRangeMakeFromDictionary(&range, v12);
  CMTimeRangeGetEnd(&v54, &range);

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v50;
    double v16 = a5;
    float v17 = 0.0;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(v13);
        }
        CFDictionaryRef v19 = *(const __CFDictionary **)(*((void *)&v49 + 1) + 8 * i);
        memset(&v48, 0, sizeof(v48));
        CMTimeRangeMakeFromDictionary(&v48, v19);
        v20 = [(__CFDictionary *)v19 objectForKeyedSubscript:@"quality"];
        [v20 floatValue];
        float v22 = v21;

        CMTime time = v48.start;
        if (CMTimeGetSeconds(&time) <= v16)
        {
          CMTime duration = v48.duration;
          double Seconds = CMTimeGetSeconds(&duration);
          CMTime v45 = v48.start;
          double v25 = v16 - CMTimeGetSeconds(&v45);
          if (v25 >= Seconds) {
            double v25 = Seconds;
          }
          float v26 = v25 * v22;
          if (v11 <= v26)
          {
            CMTime v44 = v48.duration;
            float v27 = CMTimeGetSeconds(&v44) * (float)(1.0 - (float)(v11 / v26));
            CMTimeMakeWithSeconds(&v42, v27, v48.start.timescale);
            CMTime lhs = v48.start;
            CMTime rhs = v42;
            CMTimeAdd(&v43, &lhs, &rhs);
            CMTime v55 = v43;
            float v17 = v11;
          }
          else
          {
            float v17 = v17 + v26;
            if (v17 > v11)
            {
              CMTime v55 = v48.start;
              float v17 = v25 * v22;
            }
          }
          CMTimeRange v40 = v48;
          CMTimeRangeGetEnd(&v41, &v40);
          if (CMTimeGetSeconds(&v41) >= v16)
          {
            CMTimeRange v38 = v48;
            CMTimeRangeGetEnd(&v39, &v38);
            float v28 = CMTimeGetSeconds(&v39) - v16;
            float v17 = v22 * v28;
            if ((float)(v22 * v28) >= v11)
            {
              CMTimeRange v37 = v48;
              CMTimeRangeGetEnd(&v42, &v37);
              CMTimeMakeWithSeconds(&v36, (float)((float)(1.0 - (float)(v11 / v17)) * v28), v48.start.timescale);
              CMTime lhs = v42;
              CMTime rhs = v36;
              CMTimeSubtract(&v43, &lhs, &rhs);
              *(_OWORD *)&v54.value = *(_OWORD *)&v43.value;
              CMTimeEpoch epoch = v43.epoch;
              goto LABEL_25;
            }
          }
        }
        else
        {
          CMTime v35 = v48.duration;
          float v23 = CMTimeGetSeconds(&v35) * v22;
          if (v11 <= v23)
          {
            *(_OWORD *)&v54.value = *(_OWORD *)&v48.start.value;
            CMTimeEpoch epoch = v48.start.epoch;
LABEL_25:
            v54.CMTimeEpoch epoch = epoch;
            goto LABEL_26;
          }
          float v17 = v17 + v23;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_26:

  v48.CMTime start = v54;
  CMTime lhs = v55;
  if (CMTimeCompare(&v48.start, &lhs) < 1)
  {
    uint64_t v30 = MEMORY[0x1E4F1FA30];
    long long v31 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA30];
    *(_OWORD *)&retstr->var0.var3 = v31;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v30 + 32);
  }
  else
  {
    CMTime start = v55;
    CMTime v33 = v54;
    CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &v33);
  }

  return result;
}

- (int)analyzeLivePhotoKeyFrame:(id)a3 irisPhotoOffsetSec:(float)a4 originalIrisPhotoOffsetSec:(float)a5 photoTextureScore:(float)a6 hadFlash:(BOOL)a7 cancel:(id)a8
{
  BOOL v224 = a7;
  v290[4] = *MEMORY[0x1E4F143B8];
  id v212 = a3;
  id v13 = a8;
  v201 = v13;
  v205 = objc_alloc_init(VCPVideoKeyFrame);
  v211 = objc_alloc_init(VCPVideoKeyFrame);
  float v200 = vabds_f32(a4, a5);
  if (v200 > 0.03 && (v221 = objc_alloc_init(VCPVideoKeyFrame)) != 0)
  {
    CMTimeMakeWithSeconds(&v274, a5, 600);
    CMTime v273 = v274;
    [(VCPVideoKeyFrame *)v221 setTimestamp:&v273];
    char v219 = 0;
    if (!v13) {
      goto LABEL_8;
    }
  }
  else
  {
    v221 = 0;
    char v219 = 1;
    if (!v13) {
      goto LABEL_8;
    }
  }
  if ((*((uint64_t (**)(id))v13 + 2))(v13))
  {
    int v14 = -128;
    goto LABEL_164;
  }
LABEL_8:
  v215 = objc_msgSend(v212, "vcp_results");
  uint64_t v15 = objc_msgSend(v215, "objectForKeyedSubscript:");
  double v16 = [v215 objectForKeyedSubscript:@"FaceResults"];
  [(VCPLivePhotoKeyFrameAnalyzer *)self createFaceHeatMap:v15 imageFaces:v16];

  float v17 = [v215 objectForKeyedSubscript:@"KeyFrameBlurResults"];
  v192 = v17;
  if (![v17 count])
  {
    int v14 = -50;
    goto LABEL_163;
  }
  v18 = [v17 objectAtIndexedSubscript:0];
  v190 = [v18 objectForKeyedSubscript:@"attributes"];

  CFDictionaryRef v19 = [v190 objectForKeyedSubscript:@"sharpness"];
  [v19 floatValue];
  self->_float photoSharpness = v20;

  self->_photoSharpnessReliable = a6 >= 0.2;
  v289[0] = @"sharpness";
  *(float *)&double v21 = self->_photoSharpness;
  float v22 = [NSNumber numberWithFloat:v21];
  v290[0] = v22;
  v289[1] = @"texture";
  *(float *)&double v23 = a6;
  v24 = [NSNumber numberWithFloat:v23];
  v290[1] = v24;
  v289[2] = @"flashFired";
  double v25 = [NSNumber numberWithBool:v224];
  v290[2] = v25;
  v289[3] = @"stillTime";
  *(float *)&double v26 = a4;
  float v27 = [NSNumber numberWithFloat:v26];
  v290[3] = v27;
  v191 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v290 forKeys:v289 count:4];

  float v28 = (void *)MEMORY[0x1E4F1C978];
  v287 = @"attributes";
  v288 = v191;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v288 forKeys:&v287 count:1];
  uint64_t v30 = [v28 arrayWithObject:v29];
  objc_msgSend(v212, "vcp_setResult:forKey:", v30, @"KeyFrameStillResults");

  long long v31 = [v215 objectForKeyedSubscript:@"FaceResults"];
  [(VCPLivePhotoKeyFrameAnalyzer *)self computeOverallFaceQualityScore:v31];
  float v33 = v32;

  self->_petsDominant = 0;
  v34 = [v215 objectForKeyedSubscript:@"PetsResults"];
  BOOL v35 = v34 == 0;

  if (!v35)
  {
    long long v272 = 0u;
    long long v271 = 0u;
    long long v270 = 0u;
    long long v269 = 0u;
    CMTime v36 = [v215 objectForKeyedSubscript:@"PetsResults"];
    uint64_t v37 = [v36 countByEnumeratingWithState:&v269 objects:v286 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v270;
      float v39 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v270 != v38) {
            objc_enumerationMutation(v36);
          }
          CMTime v41 = [*(id *)(*((void *)&v269 + 1) + 8 * i) objectForKeyedSubscript:@"attributes"];
          CMTime v42 = [v41 objectForKeyedSubscript:@"petsBounds"];
          NSRect v291 = NSRectFromString(v42);
          double width = v291.size.width;
          double height = v291.size.height;

          float v39 = v39 + width * height;
        }
        uint64_t v37 = [v36 countByEnumeratingWithState:&v269 objects:v286 count:16];
      }
      while (v37);
    }
    else
    {
      float v39 = 0.0;
    }

    self->_petsDominant = v39 > 0.5;
  }
  CMTime v45 = [v215 objectForKeyedSubscript:@"ExposureResults"];
  v46 = [v45 objectAtIndexedSubscript:0];
  v47 = [v46 objectForKeyedSubscript:@"attributes"];
  CMTimeRange v48 = [v47 objectForKeyedSubscript:@"underExpose"];
  [v48 floatValue];
  float v50 = v49;

  [v215 objectForKeyedSubscript:@"MetaMotionResults"];
  long long v268 = 0u;
  long long v267 = 0u;
  long long v266 = 0u;
  long long v265 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v51 = [obj countByEnumeratingWithState:&v265 objects:v285 count:16];
  float v52 = 0.0;
  if (v51)
  {
    uint64_t v53 = *(void *)v266;
    double v54 = a4;
    while (2)
    {
      for (uint64_t j = 0; j != v51; ++j)
      {
        if (*(void *)v266 != v53) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v56 = *(const __CFDictionary **)(*((void *)&v265 + 1) + 8 * j);
        memset(&v264, 0, sizeof(v264));
        CMTimeRangeMakeFromDictionary(&v264, v56);
        CMTime time = v264.start;
        if (CMTimeGetSeconds(&time) <= v54)
        {
          CMTimeRange range = v264;
          CMTimeRangeGetEnd(&v262, &range);
          if (CMTimeGetSeconds(&v262) > v54)
          {
            v57 = [(__CFDictionary *)v56 objectForKeyedSubscript:@"quality"];
            [v57 floatValue];
            float v52 = v58;

            goto LABEL_32;
          }
        }
      }
      uint64_t v51 = [obj countByEnumeratingWithState:&v265 objects:v285 count:16];
      if (v51) {
        continue;
      }
      break;
    }
  }
LABEL_32:

  uint64_t v59 = [v215 objectForKeyedSubscript:@"MetaMotionResults"];
  if (v59)
  {
    v60 = [v215 objectForKeyedSubscript:@"MetaMotionResults"];
    CFDictionaryRef v61 = [v60 objectAtIndexedSubscript:0];
    CMTimeRangeMakeFromDictionary(&v260, v61);
    if (v260.start.flags)
    {
      v62 = [v215 objectForKeyedSubscript:@"MetaMotionResults"];
      CFDictionaryRef v63 = [v62 objectAtIndexedSubscript:0];
      CMTimeRangeMakeFromDictionary(&v259, v63);
      if (v259.duration.flags)
      {
        id v227 = [v215 objectForKeyedSubscript:@"MetaMotionResults"];
        CFDictionaryRef v64 = [v227 objectAtIndexedSubscript:0];
        CMTimeRangeMakeFromDictionary(&v284, v64);
        if (v284.duration.epoch)
        {
        }
        else
        {
          v214 = v62;
          v210 = [v215 objectForKeyedSubscript:@"MetaMotionResults"];
          CFDictionaryRef v181 = [v210 objectAtIndexedSubscript:0];
          CMTimeRangeMakeFromDictionary(&v258, v181);
          CMTimeValue value = v258.duration.value;

          if (value >= 0)
          {
            v183 = [v215 objectForKeyedSubscript:@"MetaMotionResults"];
            *(float *)&double v184 = a4;
            [(VCPLivePhotoKeyFrameAnalyzer *)self selectKeyFrameRangeWithMotion:v183 stillTimestamp:1 isMetaMotion:v184];
            CMTimeRange v264 = v260;

            goto LABEL_40;
          }
        }
      }
      else
      {
      }
    }
    else
    {
    }
  }
  v65 = [v215 objectForKeyedSubscript:@"CameraMotionResults"];
  *(float *)&double v66 = a4;
  [(VCPLivePhotoKeyFrameAnalyzer *)self selectKeyFrameRangeWithMotion:v65 stillTimestamp:0 isMetaMotion:v66];
  CMTimeRange v264 = v260;

LABEL_40:
  v188 = [v215 objectForKeyedSubscript:@"MetaFocusResults"];
  CMTimeValue v282 = *MEMORY[0x1E4F1FA20];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 8);
  long long v206 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  uint64_t v197 = *(void *)(MEMORY[0x1E4F1FA20] + 32);
  CMTimeEpoch v208 = *(void *)(MEMORY[0x1E4F1FA20] + 40);
  CMTimeValue v67 = *MEMORY[0x1E4F1FA30];
  int32_t v68 = *(_DWORD *)(MEMORY[0x1E4F1FA30] + 8);
  long long v69 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 28);
  *(_OWORD *)&v284.start.CMTimeValue value = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 12);
  *(_OWORD *)&v284.start.CMTimeEpoch epoch = v69;
  v284.duration.CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA30] + 44);
  if (v52 >= 10.0) {
    goto LABEL_60;
  }
  long long v257 = 0u;
  long long v256 = 0u;
  long long v255 = 0u;
  long long v254 = 0u;
  id v228 = v188;
  uint64_t v70 = [v228 countByEnumeratingWithState:&v254 objects:v281 count:16];
  if (!v70) {
    goto LABEL_59;
  }
  uint64_t v71 = *(void *)v255;
  double v72 = a4;
  while (2)
  {
    for (uint64_t k = 0; k != v70; ++k)
    {
      if (*(void *)v255 != v71) {
        objc_enumerationMutation(v228);
      }
      CFDictionaryRef v74 = *(const __CFDictionary **)(*((void *)&v254 + 1) + 8 * k);
      memset(&v260, 0, sizeof(v260));
      CMTimeRangeMakeFromDictionary(&v260, v74);
      v75 = [(__CFDictionary *)v74 objectForKeyedSubscript:@"quality"];
      [v75 floatValue];
      float v77 = v76;

      CMTime v253 = v260.start;
      if (CMTimeGetSeconds(&v253) > v72
        || (CMTimeRange v251 = v260, CMTimeRangeGetEnd(&v252, &v251), CMTimeGetSeconds(&v252) <= v72))
      {
        CMTime v245 = v260.start;
        if (CMTimeGetSeconds(&v245) > v72)
        {
          CMTimeMakeWithSeconds(&start, a4, v68);
          CMTimeRange v242 = v260;
          CMTimeRangeGetEnd(&end, &v242);
          CMTimeRangeFromTimeToTime(&v259, &start, &end);
          goto LABEL_57;
        }
      }
      else
      {
        if (v77 > 0.0)
        {
          CMTimeValue v282 = v260.start.value;
          CMTimeFlags flags = v260.start.flags;
          CMTimeScale timescale = v260.start.timescale;
          long long v206 = *(_OWORD *)&v260.start.epoch;
          uint64_t v197 = *(void *)&v260.duration.timescale;
          CMTimeEpoch epoch = v260.duration.epoch;
LABEL_58:
          CMTimeEpoch v208 = epoch;
          goto LABEL_59;
        }
        CMTime v250 = v260.start;
        double v78 = CMTimeGetSeconds(&v250);
        CMTimeRange v248 = v260;
        CMTimeRangeGetEnd(&v249, &v248);
        Float64 v79 = CMTimeGetSeconds(&v249);
        float v80 = v72 - v78;
        *(float *)&Float64 v79 = v79 - v72;
        if (v80 < *(float *)&v79)
        {
          v247.CMTimeValue value = v67;
          *(void *)&v247.CMTimeFlags flags = v284.start.value;
          v247.CMTimeScale timescale = v68;
          HIDWORD(v247.epoch) = v284.start.timescale;
          CMTimeMakeWithSeconds(&v246, a4, v68);
          CMTimeRangeFromTimeToTime(&v259, &v247, &v246);
LABEL_57:
          CMTimeValue v282 = v259.start.value;
          CMTimeFlags flags = v259.start.flags;
          CMTimeScale timescale = v259.start.timescale;
          long long v206 = *(_OWORD *)&v259.start.epoch;
          uint64_t v197 = *(void *)&v259.duration.timescale;
          CMTimeEpoch epoch = v259.duration.epoch;
          goto LABEL_58;
        }
      }
      CMTimeValue v67 = v260.start.value;
      int32_t v68 = v260.start.timescale;
      *(_OWORD *)&v284.start.CMTimeValue value = *(_OWORD *)&v260.start.flags;
      *(_OWORD *)&v284.start.CMTimeEpoch epoch = *(_OWORD *)((char *)&v260.duration.value + 4);
      v284.duration.CMTimeScale timescale = HIDWORD(v260.duration.epoch);
    }
    uint64_t v70 = [v228 countByEnumeratingWithState:&v254 objects:v281 count:16];
    if (v70) {
      continue;
    }
    break;
  }
LABEL_59:

LABEL_60:
  v82 = [v215 objectForKeyedSubscript:@"KeyFrameResults"];
  CMTimeValue v83 = *MEMORY[0x1E4F1F9F8];
  double v222 = *(double *)(MEMORY[0x1E4F1F9F8] + 8);
  CMTimeEpoch v84 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v85 = objc_alloc_init(VCPVideoKeyFrame);
  v86 = objc_alloc_init(VCPVideoKeyFrame);
  unint64_t v87 = 0;
  float v203 = fminf(a6 + 0.1, 0.2);
  double seconds = a5;
  double v213 = a4;
  BOOL v88 = (flags & 1) == 0;
  int v89 = v224;
  if (v50 >= 0.5) {
    int v89 = 1;
  }
  int v204 = v89;
  if ((v197 & 0x100000000) == 0) {
    BOOL v88 = 1;
  }
  if (v208) {
    BOOL v88 = 1;
  }
  CMTimeValue v185 = *((void *)&v206 + 1);
  if (v206 < 0) {
    BOOL v88 = 1;
  }
  BOOL v209 = v88;
  CMTimeEpoch v199 = v206;
  float v225 = 0.0;
  float v90 = -1.0;
  CMTimeEpoch v194 = v84;
  CMTimeValue v195 = v83;
  float v91 = -1.0;
  float v198 = -1.0;
  float v186 = -1.0;
  float v187 = -1.0;
  float v207 = -1.0;
  float v196 = -1.0;
  double v193 = v222;
  float v218 = a5;
  float v216 = a4;
  while (v87 < objc_msgSend(v82, "count", v185))
  {
    v92 = [v82 objectAtIndexedSubscript:v87];
    v93 = [v92 objectForKeyedSubscript:@"attributes"];
    [(VCPLivePhotoKeyFrameAnalyzer *)self fetchAndComputeScoreForKeyFrame:v85 withResult:v93];

    if (v85)
    {
      v94 = v221;
      [(VCPVideoKeyFrame *)v85 timestamp];
    }
    else
    {
      memset(&v241, 0, sizeof(v241));
      v94 = v221;
    }
    Float64 v96 = CMTimeGetSeconds(&v241);
    *(float *)&Float64 v96 = v96;
    float v229 = *(float *)&v96;
    if ((v219 & 1) == 0)
    {
      *(float *)&Float64 v96 = v218;
      if (v225 >= v218 || (*(float *)&double v95 = v229, v229 < v218))
      {
        *(float *)&double v95 = v229;
        if (v229 < v218 && v87 + 1 == objc_msgSend(v82, "count", v96, v95))
        {
          [(VCPVideoKeyFrame *)v94 copyFrom:v85];
          CMTimeMakeWithSeconds(&v240, seconds, 600);
          CMTime v239 = v240;
          [(VCPVideoKeyFrame *)v94 setTimestamp:&v239];
        }
      }
      else
      {
        [(VCPVideoKeyFrame *)v86 score];
        float v98 = v97;
        [(VCPVideoKeyFrame *)v85 score];
        float v100 = (float)(v218 - v225) + (float)(v229 - v218);
        *(float *)&double v101 = (float)((float)((float)(v218 - v225) * v99) + (float)(v98 * (float)(v229 - v218))) / v100;
        [(VCPVideoKeyFrame *)v94 setScore:v101];
        [(VCPVideoKeyFrame *)v86 sharpness];
        float v103 = v102;
        [(VCPVideoKeyFrame *)v85 sharpness];
        *(float *)&double v105 = (float)((float)((float)(v218 - v225) * v104) + (float)(v103 * (float)(v229 - v218))) / v100;
        [(VCPVideoKeyFrame *)v94 setSharpness:v105];
        [(VCPVideoKeyFrame *)v86 overallFaceQualityScore];
        float v107 = v106;
        [(VCPVideoKeyFrame *)v85 overallFaceQualityScore];
        *(float *)&double v109 = (float)((float)((float)(v218 - v225) * v108) + (float)(v107 * (float)(v229 - v218))) / v100;
        [(VCPVideoKeyFrame *)v94 setOverallFaceQualityScore:v109];
        [(VCPVideoKeyFrame *)v86 contentScore];
        float v111 = v110;
        [(VCPVideoKeyFrame *)v85 contentScore];
        *(float *)&double v113 = (float)((float)((float)(v218 - v225) * v112) + (float)(v111 * (float)(v229 - v218))) / v100;
        [(VCPVideoKeyFrame *)v94 setContentScore:v113];
        [(VCPVideoKeyFrame *)v86 semanticScore];
        float v115 = v114;
        [(VCPVideoKeyFrame *)v85 semanticScore];
        *(float *)&double v117 = (float)((float)((float)(v218 - v225) * v116) + (float)(v115 * (float)(v229 - v218))) / v100;
        [(VCPVideoKeyFrame *)v94 setSemanticScore:v117];
      }
    }
    if (v225 >= a4 || (*(float *)&Float64 v96 = v229, v229 < a4))
    {
      if (v90 == -1.0 && v87 + 1 == [v82 count])
      {
        *(float *)&double v134 = self->_photoSharpness;
        [(VCPLivePhotoKeyFrameAnalyzer *)self computeScoreForPhoto:v85 withRefKeyFrame:v134];
        float v136 = v135;
        [(VCPVideoKeyFrame *)v85 score];
        if (v137 >= (float)(v33 + v136)) {
          float v90 = v137;
        }
        else {
          float v90 = v33 + v136;
        }
      }
      else
      {
        CMTimeRange v237 = v264;
        if (v85) {
          [(VCPVideoKeyFrame *)v85 timestamp];
        }
        else {
          memset(&v236, 0, sizeof(v236));
        }
        if (CMTimeRangeContainsTime(&v237, &v236))
        {
          if (v209) {
            goto LABEL_182;
          }
          [(VCPVideoKeyFrame *)v85 overallFaceQualityScore];
          if (v141 >= 0.15) {
            goto LABEL_182;
          }
          if (v85) {
            [(VCPVideoKeyFrame *)v85 timestamp];
          }
          else {
            memset(&v258, 0, 24);
          }
          *(_OWORD *)&v260.start.CMTimeValue value = *(_OWORD *)&v258.start.value;
          v260.start.CMTimeEpoch epoch = v258.start.epoch;
          v259.start.CMTimeValue value = v282;
          v259.start.CMTimeScale timescale = timescale;
          v259.start.CMTimeFlags flags = flags;
          v259.start.CMTimeEpoch epoch = v199;
          if ((CMTimeCompare(&v260.start, &v259.start) & 0x80000000) == 0)
          {
            if (v85)
            {
              [(VCPVideoKeyFrame *)v85 timestamp];
            }
            else
            {
              long long v234 = 0uLL;
              CMTimeEpoch v235 = 0;
            }
            v232.start.CMTimeValue value = v282;
            v232.start.CMTimeScale timescale = timescale;
            v232.start.CMTimeFlags flags = flags;
            v232.start.CMTimeEpoch epoch = v199;
            v232.duration.CMTimeValue value = v185;
            *(void *)&v232.duration.CMTimeScale timescale = v197;
            v232.duration.CMTimeEpoch epoch = 0;
            CMTimeRangeGetEnd(&v233, &v232);
            *(_OWORD *)&v260.start.CMTimeValue value = v234;
            v260.start.CMTimeEpoch epoch = v235;
            v259.CMTime start = v233;
            if (CMTimeCompare(&v260.start, &v259.start) < 0) {
              goto LABEL_182;
            }
          }
          [(VCPVideoKeyFrame *)v85 sharpness];
          if (v142 >= 0.8 && self->_photoSharpness <= 0.1)
          {
LABEL_182:
            if (!v204 || ([(VCPVideoKeyFrame *)v85 exposureScore], v143 < 50.0))
            {
              [(VCPVideoKeyFrame *)v85 textureScore];
              if (v144 >= v203)
              {
                [(VCPVideoKeyFrame *)v85 score];
                if (v145 > v91)
                {
                  if (v85)
                  {
                    [(VCPVideoKeyFrame *)v85 timestamp];
                    CMTimeValue v83 = v260.start.value;
                    double v222 = *(double *)&v260.start.timescale;
                    CMTimeEpoch v84 = v260.start.epoch;
                  }
                  else
                  {
                    CMTimeEpoch v84 = 0;
                    CMTimeValue v83 = 0;
                    double v222 = 0.0;
                  }
                  [(VCPVideoKeyFrame *)v85 score];
                  float v91 = v146;
                  [(VCPVideoKeyFrame *)v85 overallFaceQualityScore];
                  float v198 = v147;
                  [(VCPVideoKeyFrame *)v85 semanticScore];
                  float v187 = v148;
                  [(VCPVideoKeyFrame *)v85 sharpness];
                  float v186 = v149;
                  [(VCPVideoKeyFrame *)v205 copyFrom:v85];
                }
              }
              [(VCPVideoKeyFrame *)v85 semanticScore];
              if (v150 > v207)
              {
                if (v85)
                {
                  [(VCPVideoKeyFrame *)v85 timestamp];
                  double v193 = *(double *)&v260.start.timescale;
                  CMTimeEpoch v194 = v260.start.epoch;
                  CMTimeValue v195 = v260.start.value;
                }
                else
                {
                  CMTimeEpoch v194 = 0;
                  CMTimeValue v195 = 0;
                  double v193 = 0.0;
                }
                [(VCPVideoKeyFrame *)v85 semanticScore];
                float v207 = v151;
                [(VCPVideoKeyFrame *)v85 overallFaceQualityScore];
                float v196 = v152;
                [(VCPVideoKeyFrame *)v211 copyFrom:v85];
              }
            }
          }
        }
      }
    }
    else
    {
      [(VCPVideoKeyFrame *)v86 sharpness];
      float v119 = v118;
      [(VCPVideoKeyFrame *)v85 sharpness];
      float v120 = (float)(v229 - a4) * 100.0;
      float v121 = (float)(a4 - v225) * 100.0;
      float v123 = v121 + v120;
      float photoSharpness = (float)((float)(v121 * v122) + (float)(v119 * v120)) / (float)(v121 + v120);
      if (self->_photoSharpness >= photoSharpness) {
        float photoSharpness = self->_photoSharpness;
      }
      self->_float photoSharpness = photoSharpness;
      -[VCPLivePhotoKeyFrameAnalyzer computeScoreForPhoto:withRefKeyFrame:](self, "computeScoreForPhoto:withRefKeyFrame:", v86);
      float v126 = v125;
      *(float *)&double v127 = self->_photoSharpness;
      [(VCPLivePhotoKeyFrameAnalyzer *)self computeScoreForPhoto:v85 withRefKeyFrame:v127];
      float v128 = v33 + v126;
      float v130 = v33 + v129;
      if (self->_photoSharpnessReliable)
      {
        [(VCPVideoKeyFrame *)v86 score];
        float v132 = v131;
        [(VCPVideoKeyFrame *)v85 score];
      }
      else
      {
        [(VCPVideoKeyFrame *)v86 semanticScore];
        float v132 = v138;
        [(VCPVideoKeyFrame *)v85 semanticScore];
      }
      float v139 = (float)((float)(v121 * v133) + (float)(v132 * v120)) / v123;
      if (v139 >= (float)((float)((float)(v121 * v130) + (float)(v128 * v120)) / v123)) {
        float v90 = v139;
      }
      else {
        float v90 = (float)((float)(v121 * v130) + (float)(v128 * v120)) / v123;
      }
      v238.CMTimeValue value = v83;
      *(double *)&v238.CMTimeScale timescale = v222;
      v238.CMTimeEpoch epoch = v84;
      a4 = v216;
      if (CMTimeGetSeconds(&v238) == v225)
      {
        CMTimeMakeWithSeconds(&v260.start, v213, SLODWORD(v222));
        CMTimeValue v83 = v260.start.value;
        double v222 = *(double *)&v260.start.timescale;
        float v91 = v90;
        CMTimeEpoch v84 = v260.start.epoch;
      }
    }
    [(VCPVideoKeyFrame *)v85 score];
    v140 = v85;

    ++v87;
    float v225 = v229;
    v85 = v86;
    v86 = v140;
  }
  v231.CMTimeValue value = v83;
  *(double *)&v231.CMTimeScale timescale = v222;
  v231.CMTimeEpoch epoch = v84;
  if (vabdd_f64(CMTimeGetSeconds(&v231), v213) < 0.200000003)
  {
LABEL_129:
    int v153 = 0;
    CMTimeValue v83 = *MEMORY[0x1E4F1F9F8];
    double v222 = *(double *)(MEMORY[0x1E4F1F9F8] + 8);
    float v91 = -1.0;
    CMTimeEpoch v84 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    goto LABEL_130;
  }
  if (self->_photoSharpnessReliable)
  {
    int v153 = 0;
    BOOL v163 = v91 >= (float)(v90 + 0.1) && v90 <= 0.7;
    if (!v163 && (float)(v91 - v90) < 0.2)
    {
      if (v90 > v91 || v198 < (float)(v33 + 0.15)) {
        goto LABEL_129;
      }
      goto LABEL_167;
    }
  }
  else
  {
    if (v187 >= (float)(v90 + -0.01) && (float)(v186 - self->_photoSharpness) > 0.5)
    {
LABEL_167:
      int v153 = 0;
      goto LABEL_130;
    }
    float v91 = v207;
    BOOL v180 = v207 < (float)(v90 + 0.1) || v90 > 0.7;
    int v153 = 1;
    if (v180)
    {
      CMTimeEpoch v84 = v194;
      CMTimeValue v83 = v195;
      if ((float)(v207 - v90) < 0.2 && (v90 > v207 || v196 < (float)(v33 + 0.15))) {
        goto LABEL_129;
      }
    }
    else
    {
      CMTimeEpoch v84 = v194;
      CMTimeValue v83 = v195;
    }
    float v198 = v196;
    double v222 = v193;
  }
LABEL_130:
  double v154 = (float)(v90 - v33) + 0.15;
  double v155 = (float)(v91 - v198);
  if (v154 > v155)
  {
    if (v33 > 0.7
      || (LODWORD(v154) = 1053609165, *(float *)&double v155 = v198, v198 < 0.4)
      && v33 == 0.0
      && (*(float *)&double v154 = v198, v198 > 0.0))
    {
      CMTimeValue v83 = *MEMORY[0x1E4F1F9F8];
      double v154 = *(double *)(MEMORY[0x1E4F1F9F8] + 8);
      double v222 = v154;
      float v91 = -1.0;
      CMTimeEpoch v84 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    }
  }
  int v220 = v153;
  v156 = objc_msgSend(v215, "objectForKeyedSubscript:", v154, v155);
  id v230 = [v156 objectAtIndexedSubscript:0];

  HIDWORD(v159) = HIDWORD(v222);
  if (BYTE4(v222))
  {
    v279[0] = @"keyFrameTime";
    v260.start.CMTimeValue value = v83;
    *(double *)&v260.start.CMTimeScale timescale = v222;
    v260.start.CMTimeEpoch epoch = v84;
    CFDictionaryRef v160 = CMTimeCopyAsDictionary(&v260.start, 0);
    v280[0] = v160;
    v279[1] = @"keyFrameScore";
    *(float *)&double v161 = v91;
    v162 = [NSNumber numberWithFloat:v161];
    v280[1] = v162;
    v226 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v280 forKeys:v279 count:2];
  }
  else
  {
    v226 = 0;
  }
  v164 = v221;
  if (v230)
  {
    v165 = (void *)MEMORY[0x1E4F1CA60];
    v277[0] = @"start";
    v223 = objc_msgSend(v230, "objectForKeyedSubscript:");
    v278[0] = v223;
    v277[1] = @"duration";
    v166 = objc_msgSend(v230, "objectForKeyedSubscript:");
    v278[1] = v166;
    v277[2] = @"quality";
    v167 = objc_msgSend(v230, "objectForKeyedSubscript:");
    v278[2] = v167;
    v277[3] = @"flags";
    v168 = objc_msgSend(v230, "objectForKeyedSubscript:");
    v278[3] = v168;
    v169 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v278 forKeys:v277 count:4];
    v170 = [v165 dictionaryWithDictionary:v169];

    v171 = [v230 objectForKeyedSubscript:@"attributes"];
    v172 = (void *)[v171 mutableCopy];

    [v172 removeObjectForKey:@"keyFrameTime"];
    [v172 removeObjectForKey:@"keyFrameScore"];
    *(float *)&double v173 = v200;
    if (v200 <= 0.03 && v226) {
      objc_msgSend(v172, "addEntriesFromDictionary:", v226, v173);
    }
    if (v172) {
      objc_msgSend(v170, "setObject:forKey:", v172, @"attributes", v173);
    }
    v174 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", v170, v173);
    objc_msgSend(v212, "vcp_setResult:forKey:", v174, @"MovieSummaryResults");

LABEL_158:
    v164 = v221;
  }
  else
  {
    id v230 = 0;
    if (v200 <= 0.03 && v226)
    {
      v275[0] = @"start";
      uint64_t v175 = MEMORY[0x1E4F1FA48];
      *(_OWORD *)&v260.start.CMTimeValue value = *MEMORY[0x1E4F1FA48];
      v260.start.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      CFDictionaryRef v176 = CMTimeCopyAsDictionary(&v260.start, 0);
      v276[0] = v176;
      v275[1] = @"duration";
      *(_OWORD *)&v260.start.CMTimeValue value = *(_OWORD *)v175;
      v260.start.CMTimeEpoch epoch = *(void *)(v175 + 16);
      CFDictionaryRef v177 = CMTimeCopyAsDictionary(&v260.start, 0);
      v276[1] = v177;
      v276[2] = &unk_1F15EAD88;
      v275[2] = @"quality";
      v275[3] = @"flags";
      v275[4] = @"attributes";
      v276[3] = &unk_1F15EDB30;
      v276[4] = v226;
      id v230 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v276 forKeys:v275 count:5];

      v170 = [MEMORY[0x1E4F1C978] arrayWithObject:v230];
      objc_msgSend(v212, "vcp_setResult:forKey:", v170, @"MovieSummaryResults");
      goto LABEL_158;
    }
  }
  if (v220) {
    v178 = v211;
  }
  else {
    v178 = v205;
  }
  *(float *)&double v159 = v90;
  *(float *)&double v157 = v33;
  *(float *)&double v158 = a4;
  -[VCPLivePhotoKeyFrameAnalyzer reportLivePhotoKeyFrameAnalysisResults:selectedKeyFrame:originalStillKeyFrame:stillScore:stillFQScore:stillTimestamp:useSemanticOnly:isKeyFrameSuggested:](self, "reportLivePhotoKeyFrameAnalysisResults:selectedKeyFrame:originalStillKeyFrame:stillScore:stillFQScore:stillTimestamp:useSemanticOnly:isKeyFrameSuggested:", v200 > 0.03, v178, v164, v159, v157, v158);

  int v14 = 0;
LABEL_163:

LABEL_164:
  return v14;
}

- (int)reportLivePhotoKeyFrameAnalysisResults:(BOOL)a3 selectedKeyFrame:(id)a4 originalStillKeyFrame:(id)a5 stillScore:(float)a6 stillFQScore:(float)a7 stillTimestamp:(float)a8 useSemanticOnly:(BOOL)a9 isKeyFrameSuggested:(BOOL)a10
{
  BOOL v10 = a10;
  BOOL v11 = a9;
  BOOL v16 = a3;
  id v18 = a4;
  id v19 = a5;
  float v20 = [MEMORY[0x1E4F1CA60] dictionary];
  double v21 = v20;
  if (v20)
  {
    if (v10)
    {
      if (v11) {
        [v18 semanticScore];
      }
      else {
        [v18 score];
      }
      float v24 = v22;
      [v18 overallFaceQualityScore];
      char v26 = (float)(v25 - a7) >= 0.15;
      [v18 overallFaceQualityScore];
      if ((float)(v24 - v27) >= (float)((float)(a6 - a7) + 0.2)
        || ([v18 overallFaceQualityScore], a6 <= 0.7)
        && (float)(v24 - v28) >= (float)((float)(a6 - a7) + 0.1))
      {
        [v18 sharpness];
        if ((float)(v29 - self->_photoSharpness) <= 0.35 || v11) {
          char v31 = 4;
        }
        else {
          char v31 = 2;
        }
        v26 |= v31;
      }
      if (v16) {
        float v32 = @"UserAlgo";
      }
      else {
        float v32 = @"NoUserAlgo";
      }
      [v21 setObject:v32 forKeyedSubscript:@"KeyFrameIsSuggested"];
      *(float *)&double v33 = v24 - a6;
      v34 = [NSNumber numberWithFloat:v33];
      [v21 setObject:v34 forKeyedSubscript:@"KeyFrameScoreDifference"];

      BOOL v35 = NSNumber;
      if (v18) {
        [v18 timestamp];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      CMTime v36 = [v35 numberWithDouble:CMTimeGetSeconds(&time) - a8];
      [v21 setObject:v36 forKeyedSubscript:@"KeyFrameTimestampOffset"];

      uint64_t v37 = [NSNumber numberWithInt:v26 & 1];
      [v21 setObject:v37 forKeyedSubscript:@"KeyFrameIsFaceQualityDominant"];

      uint64_t v38 = [NSNumber numberWithInt:v26 & 4];
      [v21 setObject:v38 forKeyedSubscript:@"KeyFrameIsSemanticDominant"];

      float v39 = [NSNumber numberWithInt:v26 & 2];
      [v21 setObject:v39 forKeyedSubscript:@"KeyFrameIsSharpnessDominant"];
    }
    else
    {
      [v20 setObject:@"NoAlgo" forKeyedSubscript:@"KeyFrameIsSuggested"];
    }
    if (v16)
    {
      [v21 setObject:@"UserOrig" forKeyedSubscript:@"KeyFrameIsSuggestedEdit"];
      if (v11 || !self->_photoSharpnessReliable)
      {
        [v19 semanticScore];
        char v41 = 1;
      }
      else
      {
        [v19 score];
        char v41 = 0;
      }
      float v42 = a6 - v40;
      if (v42 < 0.0) {
        float v43 = -1.0;
      }
      else {
        float v43 = 1.0;
      }
      [v19 overallFaceQualityScore];
      int v45 = (float)((float)(a7 - *(float *)&v44) * v43) >= 0.15;
      if ((v41 & 1) == 0)
      {
        [v19 sharpness];
        if ((float)(v43 * (float)(*(float *)&v44 - self->_photoSharpness)) > 0.35) {
          v45 |= 2u;
        }
      }
      BOOL v47 = fabsf(v42) >= 0.1 && v45 == 0;
      *(float *)&double v44 = v42;
      CMTimeRange v48 = [NSNumber numberWithFloat:v44];
      [v21 setObject:v48 forKeyedSubscript:@"KeyFrameScoreDifferenceEdit"];

      float v49 = NSNumber;
      if (v19) {
        [v19 timestamp];
      }
      else {
        memset(&v57, 0, sizeof(v57));
      }
      float v50 = [v49 numberWithDouble:a8 - CMTimeGetSeconds(&v57)];
      [v21 setObject:v50 forKeyedSubscript:@"KeyFrameTimestampOffsetEdit"];

      if (v47) {
        char v51 = 4;
      }
      else {
        char v51 = v45;
      }
      float v52 = objc_msgSend(NSNumber, "numberWithInt:", v51 & 1, v57.value, *(void *)&v57.timescale, v57.epoch, time.value, *(void *)&time.timescale, time.epoch);
      [v21 setObject:v52 forKeyedSubscript:@"KeyFrameIsFaceQualityDominantEdit"];

      uint64_t v53 = [NSNumber numberWithInt:v51 & 4];
      [v21 setObject:v53 forKeyedSubscript:@"KeyFrameIsSemanticDominantEdit"];

      double v54 = [NSNumber numberWithInt:v51 & 2];
      [v21 setObject:v54 forKeyedSubscript:@"KeyFrameIsSharpnessDominantEdit"];
    }
    else
    {
      [v21 setObject:@"NoUserAlgo" forKeyedSubscript:@"KeyFrameIsSuggestedEdit"];
    }
    CMTime v55 = +[VCPMADCoreAnalyticsManager sharedManager];
    [v55 sendEvent:@"com.apple.mediaanalysisd.livephotokeyframeresults" withAnalytics:v21];

    int v23 = 0;
  }
  else
  {
    int v23 = 1;
  }

  return v23;
}

- (void)fetchAndComputeScoreForKeyFrame:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 objectForKeyedSubscript:@"frameQualityScore"];
  [v8 floatValue];
  objc_msgSend(v6, "setQualityScoreForLivePhoto:");

  id v9 = [v7 objectForKeyedSubscript:@"visualPleasingScore"];
  [v9 floatValue];
  objc_msgSend(v6, "setVisualPleasingScore:");

  BOOL v10 = [v7 objectForKeyedSubscript:@"exposureScore"];
  [v10 floatValue];
  objc_msgSend(v6, "setExposureScore:");

  BOOL v11 = [v7 objectForKeyedSubscript:@"penaltyScore"];
  [v11 floatValue];
  objc_msgSend(v6, "setPenaltyScore:");

  CFDictionaryRef v12 = [v7 objectForKeyedSubscript:@"textureScore"];
  [v12 floatValue];
  objc_msgSend(v6, "setTextureScore:");

  id v13 = [v7 objectForKeyedSubscript:@"sharpnessScore"];
  [v13 floatValue];
  objc_msgSend(v6, "setSharpness:");

  int v14 = [v7 objectForKeyedSubscript:@"timestamp"];
  [v14 floatValue];
  CMTimeMakeWithSeconds(&v37, v15, 600);
  CMTime v36 = v37;
  [v6 setTimestamp:&v36];

  BOOL v16 = [v7 objectForKeyedSubscript:@"FaceResults"];
  [(VCPLivePhotoKeyFrameAnalyzer *)self computeOverallFaceQualityScore:v16];
  objc_msgSend(v6, "setOverallFaceQualityScore:");

  if (self->_petsDominant)
  {
    [v6 sharpness];
    if (v17 <= 0.7)
    {
      [v6 sharpness];
      if (v18 > self->_photoSharpness)
      {
        objc_msgSend(v6, "setSharpness:");
        [v6 qualityScoreForLivePhoto];
        if (self->_photoSharpness < *(float *)&v19) {
          *(float *)&double v19 = self->_photoSharpness;
        }
        [v6 setQualityScoreForLivePhoto:v19];
      }
    }
  }
  [v6 qualityScoreForLivePhoto];
  float v20 = 0.0;
  float v21 = 0.0;
  if (v22 > 0.0)
  {
    [v6 qualityScoreForLivePhoto];
    if (v23 >= 0.3)
    {
      [v6 qualityScoreForLivePhoto];
      float v25 = v24;
      [v6 visualPleasingScore];
      float v27 = v26;
      [v6 penaltyScore];
      float v20 = (float)((float)((float)((float)(v25 * 0.1) + 0.0) + (float)(v27 * 0.25)) / 0.35) * v28;
    }
    [v6 penaltyScore];
    float v30 = v29;
    [v6 visualPleasingScore];
    float v21 = v30 * v31;
  }
  [v6 overallFaceQualityScore];
  float v33 = 1.0;
  if (v20 < 1.0) {
    float v33 = v20;
  }
  if (v20 <= 0.0) {
    float v33 = 0.0;
  }
  *(float *)&double v32 = *(float *)&v32 + v33;
  [v6 setScore:v32];
  [v6 overallFaceQualityScore];
  float v35 = 1.0;
  if (v21 < 1.0) {
    float v35 = v21;
  }
  if (v21 <= 0.0) {
    float v35 = 0.0;
  }
  *(float *)&double v34 = v35 + *(float *)&v34;
  [v6 setSemanticScore:v34];
}

- (float)computeScoreForPhoto:(float)a3 withRefKeyFrame:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  double v8 = 0.0;
  if (a3 >= 0.0) {
    *(float *)&double v8 = a3;
  }
  if (self->_photoSharpnessReliable && a3 < 1.0) {
    float v10 = *(float *)&v8;
  }
  else {
    float v10 = 1.0;
  }
  objc_msgSend(v6, "sharpness", v8);
  if (v11 <= 0.0)
  {
    float v14 = 0.0;
    if (v10 <= 0.0) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  [v7 qualityScoreForLivePhoto];
  float v13 = v12;
  float v14 = 0.0;
  if (v10 > 0.0 && v13 != 0.0)
  {
LABEL_14:
    if (self->_photoSharpnessReliable)
    {
      objc_msgSend(v7, "visualPleasingScore", 0.0);
      float v14 = (float)((float)((float)(v10 * 0.1) + 0.0) + (float)(v15 * 0.25)) / 0.35;
    }
    else
    {
      objc_msgSend(v7, "visualPleasingScore", 0.0);
    }
  }
LABEL_17:
  float v16 = 1.0;
  if (v14 < 1.0) {
    float v16 = v14;
  }
  if (v14 <= 0.0) {
    float v17 = 0.0;
  }
  else {
    float v17 = v16;
  }

  return v17;
}

- (float)computeOverallFaceQualityScore:(id)a3
{
  id v4 = a3;
  float v5 = 0.0;
  if (!self->_ignoreFace)
  {
    unint64_t v6 = 0;
    float v7 = 0.0;
    float v8 = 0.0;
    while (v6 < [v4 count])
    {
      id v9 = [v4 objectAtIndexedSubscript:v6];
      float v10 = [v9 objectForKey:@"attributes"];
      float v11 = [v10 objectForKey:@"faceBounds"];
      NSRect v24 = NSRectFromString(v11);
      double x = v24.origin.x;
      double y = v24.origin.y;
      double width = v24.size.width;
      double height = v24.size.height;
      float v16 = [v10 objectForKey:@"faceQuality"];
      [v16 floatValue];
      float v18 = v17;

      -[VCPLivePhotoKeyFrameAnalyzer getFaceHeat:](self, "getFaceHeat:", x, y, width, height);
      if (height >= width) {
        double v20 = height;
      }
      else {
        double v20 = width;
      }
      float v21 = v20;
      float v22 = v19 * v21;
      float v8 = v8 + (float)(v18 * v22);
      float v7 = v7 + v22;

      ++v6;
    }
    if (v7 <= 0.0) {
      float v5 = 0.0;
    }
    else {
      float v5 = v8 / v7;
    }
  }

  return v5;
}

- (void)createFaceHeatMap:(id)a3 imageFaces:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  bzero(self->_faceHeatMap, self->_height * (uint64_t)self->_width);
  int v7 = [v13 count];
  self->_numOfFrames = v7 + 1;
  if (v7 >= 255) {
    uint64_t v8 = (v7 + 1) / 0xFFu + 1;
  }
  else {
    uint64_t v8 = 1;
  }
  unint64_t v9 = 0;
  self->_numOfFrames = 0;
  while (v9 < [v13 count])
  {
    float v10 = [v13 objectAtIndexedSubscript:v9];
    float v11 = [v10 objectForKeyedSubscript:@"attributes"];
    float v12 = [v11 objectForKeyedSubscript:@"FaceResults"];

    [(VCPLivePhotoKeyFrameAnalyzer *)self updateFaceHeatMap:v12];
    ++self->_numOfFrames;

    v9 += v8;
  }
  [(VCPLivePhotoKeyFrameAnalyzer *)self updateFaceHeatMap:v6];
  ++self->_numOfFrames;
}

- (void)updateFaceHeatMap:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "objectForKey:", @"attributes", (void)v25);
        unint64_t v9 = [v8 objectForKey:@"faceBounds"];
        NSRect v31 = NSRectFromString(v9);
        if (v31.size.height >= 0.0700000003 || v31.size.width >= 0.0700000003) {
          self->_ignoreFace = 0;
        }
        int width = self->_width;
        int height = self->_height;
        int v12 = width - 1;
        double v13 = (double)width;
        int v14 = vcvtmd_s64_f64(v31.origin.x * (double)width);
        if (v14 >= v12) {
          int v15 = v12;
        }
        else {
          int v15 = v14;
        }
        int v16 = vcvtmd_s64_f64((v31.origin.x + v31.size.width) * v13);
        if (v14 <= 0) {
          int v17 = 0;
        }
        else {
          int v17 = v15;
        }
        if (v16 < v12) {
          int v12 = v16;
        }
        if (v16 <= 0) {
          int v12 = 0;
        }
        int v18 = height - 1;
        double v19 = (double)height;
        int v20 = vcvtmd_s64_f64(v31.origin.y * (double)height);
        if (v20 >= v18) {
          int v21 = v18;
        }
        else {
          int v21 = v20;
        }
        int v22 = vcvtmd_s64_f64((v31.origin.y + v31.size.height) * v19);
        if (v20 <= 0) {
          int v23 = 0;
        }
        else {
          int v23 = v21;
        }
        if (v22 < v18) {
          int v18 = v22;
        }
        if (v22 <= 0) {
          int v18 = 0;
        }
        if (v17 < v12)
        {
          do
          {
            int v24 = v23;
            if (v23 < v18)
            {
              do
                ++self->_faceHeatMap[v17 + self->_width * v24++];
              while (v18 != v24);
            }
            ++v17;
          }
          while (v17 != v12);
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }
}

- (float)getFaceHeat:(CGRect)a3
{
  if (a3.origin.y < 1.0) {
    double y = a3.origin.y;
  }
  else {
    double y = 1.0;
  }
  if (a3.origin.y <= 0.0) {
    double y = 0.0;
  }
  int height = self->_height;
  int v5 = (int)(y * (double)height);
  double v6 = a3.origin.y + a3.size.height;
  if (v6 < 1.0) {
    double v7 = v6;
  }
  else {
    double v7 = 1.0;
  }
  if (v6 <= 0.0) {
    double v8 = 0.0;
  }
  else {
    double v8 = v7;
  }
  int v9 = (int)(v8 * (double)height);
  if (v5 >= v9)
  {
    unsigned __int8 v10 = 0;
  }
  else
  {
    unsigned __int8 v10 = 0;
    double v11 = a3.origin.x + a3.size.width;
    if (a3.origin.x + a3.size.width < 1.0) {
      double v12 = a3.origin.x + a3.size.width;
    }
    else {
      double v12 = 1.0;
    }
    if (v11 <= 0.0) {
      double v13 = 0.0;
    }
    else {
      double v13 = v12;
    }
    uint64_t width = self->_width;
    int v15 = (int)(v13 * (double)(int)width);
    if (a3.origin.x < 1.0) {
      double x = a3.origin.x;
    }
    else {
      double x = 1.0;
    }
    if (a3.origin.x <= 0.0) {
      double v17 = 0.0;
    }
    else {
      double v17 = x;
    }
    int v18 = (int)(v17 * (double)(int)width);
    uint64_t v19 = v5;
    uint64_t v20 = v18 + (int)width * (uint64_t)v5;
    do
    {
      if (v18 < v15)
      {
        int v21 = &self->_faceHeatMap[v20];
        uint64_t v22 = v15 - (uint64_t)v18;
        do
        {
          unsigned int v24 = *v21++;
          unsigned __int8 v23 = v24;
          if (v10 <= v24) {
            unsigned __int8 v10 = v23;
          }
          --v22;
        }
        while (v22);
      }
      ++v19;
      v20 += width;
    }
    while (v19 != v9);
  }
  float v25 = (float)v10 / (float)self->_numOfFrames;
  float v26 = 1.0;
  if (v25 < 1.0) {
    float v26 = (float)v10 / (float)self->_numOfFrames;
  }
  BOOL v27 = v25 > 0.0;
  float result = 0.0;
  if (v27) {
    return v26;
  }
  return result;
}

@end