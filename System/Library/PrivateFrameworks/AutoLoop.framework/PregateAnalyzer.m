@interface PregateAnalyzer
+ (id)pregateFailureReasonsToString:(int)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumRequiredTrimLength;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)requiredFrameTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeForFrameFromArray:(SEL)a3 frameIndex:(id)a4;
- ($4C6D1E162277694FB76656457146213A)inputTrimTime;
- ($4C6D1E162277694FB76656457146213A)outputTrimTime;
- ($4C6D1E162277694FB76656457146213A)requiredTimeRange;
- (BOOL)exposuresViolateThresholdFraction:(float)a3 exposure1:(float)a4 exposure2:(float)a5;
- (BOOL)findFrameIndicesInFrameArray:(id)a3 forTimeRange:(id *)a4 startIndex:(int *)a5 endIndex:(int *)a6;
- (BOOL)findNextNonInterpFrameFromIndex:(int64_t)a3 backwards:(BOOL)a4 inFrameInfoArray:(id)a5 toValue:(int64_t *)a6;
- (BOOL)findSurroundingNonInterpForIndex:(int64_t)a3 inFrameInfoArray:(id)a4 prevIndex:(int64_t *)a5 nextIndex:(int64_t *)a6;
- (BOOL)frameIndexIsFocusing:(int64_t)a3 inFrameData:(id)a4 failureReason:(int *)a5;
- (BOOL)getParamForKey:(id)a3 toCMTime:(id *)a4;
- (BOOL)getParamForKey:(id)a3 toFloat:(float *)a4;
- (BOOL)getParamForKey:(id)a3 toInt:(int64_t *)a4;
- (BOOL)haveInputVideoSize;
- (BOOL)subsegmentMeetsTrimCriteriaForFrames:(id)a3 firstFrame:(int64_t)a4 lastFrame:(int64_t)a5 firstFrameTimeOut:(id *)a6 lastFrameTimeOut:(id *)a7 preciseTrimTimeOut:(id *)a8;
- (CGSize)inputVideoSize;
- (MetadataFloatVector)cumulativePanForStartIndex:(int64_t)a3 lastIndex:(int64_t)a4;
- (NSArray)badFrameFlags;
- (NSArray)focusScores;
- (NSData)perFrameTranslationVecs;
- (NSDictionary)defaultParameters;
- (NSDictionary)pregateParameters;
- (PregateAnalyzer)init;
- (PregateFeatureBuilder)featureBuilder;
- (id)paramValueForKey:(id)a3;
- (int)fetchVideoDimensionsFromMetadata;
- (int)findGatingPassViaTrimming:(id)a3;
- (int)gatingPassTrimResult_firstIndex;
- (int)gatingPassTrimResult_lastIndex;
- (int)getFocusDataFromFrameData:(id)a3 toFocusingFlags:(id)a4;
- (int)getFrameMetadataArray:(id *)a3;
- (int)getPerFrameGatingData:(id)a3 firstIndex:(int64_t)a4 lastIndex:(int64_t)a5;
- (int)getZoomFlagsFromFrameData:(id)a3 toArray:(id)a4;
- (int)isCumulativePanAcceptableForFrames:(id)a3 firstIndex:(int64_t)a4 lastIndex:(int64_t)a5;
- (int)processGainAndExposureData:(id)a3 intoFlagsArray:(id)a4 firstIndex:(int64_t)a5 lastIndex:(int64_t)a6;
- (int)processMotionVectorsFromFrameData:(id)a3 toVectorArray:(MetadataFloatVector *)a4;
- (int)processPregateSuccess:(int *)a3;
- (int)processPresentationTimesFromData:(id)a3 toBadFrameFlags:(id)a4 withMaxDuration:(id *)a5 maxInterpGapTime:(id *)a6 maxInterpFrameCount:(int64_t)a7 firstIndex:(int64_t)a8 lastIndex:(int64_t)a9;
- (int)trimInput_firstIndex;
- (int)trimInput_lastIndex;
- (int64_t)findLongestPassingSegmentInFrameFlags:(id)a3 startIndex:(int64_t)a4 endIndex:(int64_t)a5 startOfRun:(int64_t *)a6 gatingFailures:(int *)a7;
- (void)setBadFrameFlags:(id)a3;
- (void)setDefaultParameters:(id)a3;
- (void)setFeatureBuilder:(id)a3;
- (void)setFocusScores:(id)a3;
- (void)setGatingPassTrimResult_firstIndex:(int)a3;
- (void)setGatingPassTrimResult_lastIndex:(int)a3;
- (void)setHaveInputVideoSize:(BOOL)a3;
- (void)setInputTrimTime:(id *)a3;
- (void)setInputVideoSize:(CGSize)a3;
- (void)setMinimumRequiredTrimLength:(id *)a3;
- (void)setPerFrameTranslationVecs:(id)a3;
- (void)setPregateParameters:(id)a3;
- (void)setRequiredFrameTime:(id *)a3;
- (void)setRequiredTimeRange:(id *)a3;
- (void)setTrimInput_firstIndex:(int)a3;
- (void)setTrimInput_lastIndex:(int)a3;
@end

@implementation PregateAnalyzer

- (PregateAnalyzer)init
{
  v43[12] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)PregateAnalyzer;
  v2 = [(PregateAnalyzer *)&v41 init];
  uint64_t v3 = MEMORY[0x1E4F1F9F0];
  long long v4 = *MEMORY[0x1E4F1F9F0];
  *((_OWORD *)v2 + 6) = *MEMORY[0x1E4F1F9F0];
  uint64_t v5 = *(void *)(v3 + 16);
  *((void *)v2 + 14) = v5;
  *(_OWORD *)(v2 + 120) = v4;
  *((void *)v2 + 17) = v5;
  uint64_t v6 = MEMORY[0x1E4F1FA20];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *((_OWORD *)v2 + 9) = *MEMORY[0x1E4F1FA20];
  *((_OWORD *)v2 + 10) = v7;
  long long v8 = *(_OWORD *)(v6 + 32);
  v9 = (long long *)MEMORY[0x1E4F1FA08];
  *((void *)v2 + 26) = *(void *)(MEMORY[0x1E4F1FA08] + 16);
  long long v10 = *v9;
  *((_OWORD *)v2 + 11) = v8;
  *((_OWORD *)v2 + 12) = v10;
  v11 = (_OWORD *)MEMORY[0x1E4F1FA10];
  *((void *)v2 + 29) = *(void *)(MEMORY[0x1E4F1FA10] + 16);
  *(_OWORD *)(v2 + 216) = *v11;
  v12 = (long long *)MEMORY[0x1E4F1F9F8];
  uint64_t v13 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  *((void *)v2 + 32) = v13;
  long long v14 = *v12;
  *((_OWORD *)v2 + 15) = *v12;
  *((void *)v2 + 35) = v13;
  *(_OWORD *)(v2 + 264) = v14;
  v42[0] = @"maxPanX";
  LODWORD(v14) = 1051931443;
  v38 = [NSNumber numberWithFloat:*(double *)&v14];
  v43[0] = v38;
  v42[1] = @"maxPanY";
  LODWORD(v15) = 1051931443;
  v37 = [NSNumber numberWithFloat:v15];
  v43[1] = v37;
  v42[2] = @"maxFaceSize";
  LODWORD(v16) = 1020054733;
  v36 = [NSNumber numberWithFloat:v16];
  v43[2] = v36;
  v42[3] = @"maxBlurMagnitude";
  LODWORD(v17) = 7.0;
  v18 = [NSNumber numberWithFloat:v17];
  v43[3] = v18;
  v42[4] = @"maxPerFrameMotion";
  LODWORD(v19) = 1028443341;
  v20 = [NSNumber numberWithFloat:v19];
  v43[4] = v20;
  v42[5] = @"maxFrameDuration";
  CMTimeMake(&time, 45, 600);
  CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef v22 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  v43[5] = v22;
  v42[6] = @"maxFrameExposureTime";
  LODWORD(v23) = 1032358025;
  v24 = [NSNumber numberWithFloat:v23];
  v43[6] = v24;
  v42[7] = @"maxFrameGain";
  LODWORD(v25) = 1108082688;
  v26 = [NSNumber numberWithFloat:v25];
  v43[7] = v26;
  v42[8] = @"maxExposureChangeFrac";
  LODWORD(v27) = 1051931443;
  v28 = [NSNumber numberWithFloat:v27];
  v43[8] = v28;
  v42[9] = @"maxZoomFactor";
  LODWORD(v29) = 1232348158;
  v30 = [NSNumber numberWithFloat:v29];
  v43[9] = v30;
  v42[10] = @"maxInterpCount";
  v31 = [NSNumber numberWithInt:2];
  v43[10] = v31;
  v42[11] = @"maxInterpTime";
  CMTimeMake(&v39, 80, 600);
  CFDictionaryRef v32 = CMTimeCopyAsDictionary(&v39, v21);
  v43[11] = v32;
  uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:12];
  v34 = (void *)*((void *)v2 + 6);
  *((void *)v2 + 6) = v33;

  return (PregateAnalyzer *)v2;
}

- (int)fetchVideoDimensionsFromMetadata
{
  if (!self->_haveInputVideoSize)
  {
    long long v4 = [(PregateFeatureBuilder *)self->featureBuilder irisVideoExtractor];
    uint64_t v5 = [v4 videoTrackMetadataDict];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"vidTrackCleanH"];
    uint64_t v7 = [v5 objectForKeyedSubscript:@"vidTrackCleanW"];
    long long v8 = (void *)v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      long long v10 = [v5 objectForKeyedSubscript:@"vidTrackNaturalH"];
      v11 = [v5 objectForKeyedSubscript:@"vidTrackNaturalW"];
      v12 = v11;
      if (v10) {
        BOOL v13 = v11 == 0;
      }
      else {
        BOOL v13 = 1;
      }
      if (v13)
      {

        int v2 = -1;
LABEL_15:

        return v2;
      }
      [v10 floatValue];
      self->_inputVideoSize.height = v16;
      [v12 floatValue];
      self->_inputVideoSize.width = v17;
    }
    else
    {
      [v6 floatValue];
      self->_inputVideoSize.height = v14;
      [v8 floatValue];
      self->_inputVideoSize.width = v15;
    }
    int v2 = 0;
    self->_haveInputVideoSize = 1;
    goto LABEL_15;
  }
  return 0;
}

- (int)getFrameMetadataArray:(id *)a3
{
  featureBuilder = self->featureBuilder;
  if (!featureBuilder)
  {
    BOOL v9 = 0;
    int v8 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = [(PregateFeatureBuilder *)featureBuilder irisVideoExtractor];
  uint64_t v6 = v5;
  if (!v5)
  {
    BOOL v9 = 0;
    goto LABEL_9;
  }
  if (([v5 processedFile] & 1) != 0 || (int v7 = objc_msgSend(v6, "processFile")) == 0)
  {
    BOOL v9 = [v6 framesMetadataArray];
LABEL_9:
    int v8 = 0;
    goto LABEL_10;
  }
  int v8 = v7;
  BOOL v9 = 0;
LABEL_10:

LABEL_11:
  if (v9) {
    int v10 = v8;
  }
  else {
    int v10 = -1;
  }
  id v11 = v9;
  *a3 = v11;

  return v10;
}

- (id)paramValueForKey:(id)a3
{
  id v4 = a3;
  pregateParameters = self->pregateParameters;
  if (!pregateParameters
    || ([(NSDictionary *)pregateParameters valueForKey:v4],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v6 = [(NSDictionary *)self->_defaultParameters valueForKey:v4];
  }

  return v6;
}

- (BOOL)getParamForKey:(id)a3 toFloat:(float *)a4
{
  uint64_t v5 = [(PregateAnalyzer *)self paramValueForKey:a3];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 floatValue];
    *(_DWORD *)a4 = v7;
  }

  return v6 != 0;
}

- (BOOL)getParamForKey:(id)a3 toInt:(int64_t *)a4
{
  uint64_t v5 = [(PregateAnalyzer *)self paramValueForKey:a3];
  uint64_t v6 = v5;
  if (v5) {
    *a4 = [v5 integerValue];
  }

  return v6 != 0;
}

- (BOOL)getParamForKey:(id)a3 toCMTime:(id *)a4
{
  CFDictionaryRef v5 = [(PregateAnalyzer *)self paramValueForKey:a3];
  CFDictionaryRef v6 = v5;
  if (v5)
  {
    CMTimeMakeFromDictionary(&v8, v5);
    *(CMTime *)a4 = v8;
  }

  return v6 != 0;
}

+ (id)pregateFailureReasonsToString:(int)a3
{
  v12[15] = *MEMORY[0x1E4F143B8];
  v11[0] = &unk_1F3899908;
  v11[1] = &unk_1F3899920;
  v12[0] = @"[pregate_vid motion blur]";
  v12[1] = @"[pregate_vid panning]";
  v11[2] = &unk_1F3899938;
  v11[3] = &unk_1F3899950;
  v12[2] = @"[pregate_vid face]";
  v12[3] = @"[pregate_vid camera motion]";
  v11[4] = &unk_1F3899968;
  v11[5] = &unk_1F3899980;
  v12[4] = @"[pregate_vid focus]";
  v12[5] = @"[pregate_vid frame duration too long]";
  v11[6] = &unk_1F3899998;
  v11[7] = &unk_1F38999B0;
  v12[6] = @"[pregate_vid frame exposure too long]";
  v12[7] = @"[pregate_vid exposure gain change too large]";
  v11[8] = &unk_1F38999C8;
  v11[9] = &unk_1F38999E0;
  v12[8] = @"[pregate_vid zoom]";
  v12[9] = @"[pregate_vid trimming error]";
  v11[10] = &unk_1F38999F8;
  v11[11] = &unk_1F3899A10;
  v12[10] = @"[pregate_vid parameter error]";
  v12[11] = @"[pregate_vid missing metadata]";
  v11[12] = &unk_1F3899A28;
  v11[13] = &unk_1F3899A40;
  v12[12] = @"[pregate_vid outside-trim internal error]";
  v12[13] = @"[pregate_vid internal error]";
  v11[14] = &unk_1F3899A58;
  v12[14] = @"[pregate_vid interpolated frames]";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:15];
  id v5 = 0;
  if (a3)
  {
    uint64_t v6 = 1;
    do
    {
      if ((a3 & v6) != 0)
      {
        int v7 = [NSNumber numberWithUnsignedInt:v6];
        CMTime v8 = [v4 objectForKeyedSubscript:v7];

        if (v8)
        {
          if (v5)
          {
            BOOL v9 = [v5 stringByAppendingString:@", "];

            id v5 = [v9 stringByAppendingString:v8];
          }
          else
          {
            id v5 = v8;
          }
        }
      }
      a3 &= ~v6;
      uint64_t v6 = (2 * v6);
    }
    while (a3);
  }

  return v5;
}

- (MetadataFloatVector)cumulativePanForStartIndex:(int64_t)a3 lastIndex:(int64_t)a4
{
  NSUInteger v7 = [(NSData *)self->_perFrameTranslationVecs length];
  CMTime v8 = [(NSData *)self->_perFrameTranslationVecs bytes];
  float32x2_t v9 = 0;
  if (v7 >= 8 && a3 <= a4)
  {
    uint64_t v11 = 0;
    float32x2_t v12 = 0;
    float32x2_t v13 = 0;
    do
    {
      if (v11)
      {
        float32x2_t v14 = *(float32x2_t *)&v8[8 * a3 + 8 * v11];
        float32x2_t v13 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v14, v13), (int8x8_t)v13, (int8x8_t)v14);
        float32x2_t v12 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v12, v14), (int8x8_t)v12, (int8x8_t)v14);
      }
      else
      {
        float32x2_t v12 = *(float32x2_t *)&v8[8 * a3];
        float32x2_t v13 = v12;
      }
      ++v11;
    }
    while (a4 - a3 + 1 != v11);
    float32x2_t v9 = vsub_f32(v12, v13);
  }
  float v15 = v9.f32[1];
  result.var0 = v9.f32[0];
  result.var1 = v15;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeForFrameFromArray:(SEL)a3 frameIndex:(id)a4
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  uint64_t v6 = [a4 objectAtIndexedSubscript:a5];
  CFDictionaryRef v7 = [v6 objectForKeyedSubscript:@"PresentationTime"];

  if (v7)
  {
    CMTimeMakeFromDictionary(&v9, v7);
    *(CMTime *)retstr = v9;
  }

  return result;
}

- (BOOL)findNextNonInterpFrameFromIndex:(int64_t)a3 backwards:(BOOL)a4 inFrameInfoArray:(id)a5 toValue:(int64_t *)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  if (v7) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = 1;
  }
  int64_t v11 = v10 + a3;
  if (v10 + a3 >= 0)
  {
    while (v11 < (unint64_t)[v9 count])
    {
      float32x2_t v12 = [v9 objectAtIndexedSubscript:v11];
      float32x2_t v13 = [v12 objectForKeyedSubscript:@"InterpolatedFrame"];
      float32x2_t v14 = v13;
      if (!v13 || ([v13 BOOLValue] & 1) == 0)
      {
        *a6 = v11;

        BOOL v15 = 1;
        goto LABEL_11;
      }

      v11 += v10;
      if (v11 < 0) {
        break;
      }
    }
  }
  BOOL v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)findSurroundingNonInterpForIndex:(int64_t)a3 inFrameInfoArray:(id)a4 prevIndex:(int64_t *)a5 nextIndex:(int64_t *)a6
{
  id v10 = a4;
  LOBYTE(a5) = [(PregateAnalyzer *)self findNextNonInterpFrameFromIndex:a3 backwards:1 inFrameInfoArray:v10 toValue:a5];
  LOBYTE(a6) = [(PregateAnalyzer *)self findNextNonInterpFrameFromIndex:a3 backwards:0 inFrameInfoArray:v10 toValue:a6];

  return a5 & a6;
}

- (BOOL)frameIndexIsFocusing:(int64_t)a3 inFrameData:(id)a4 failureReason:(int *)a5
{
  id v7 = a4;
  *a5 = 0;
  CMTime v8 = [v7 objectAtIndexedSubscript:a3];
  id v9 = [v8 objectForKeyedSubscript:@"InterpolatedFrame"];

  if (v9 && [v9 BOOLValue])
  {
    BOOL v10 = 0;
    *a5 = 0x2000;
  }
  else
  {
    int64_t v11 = [v7 objectAtIndexedSubscript:a3];
    float32x2_t v12 = [v11 objectForKeyedSubscript:@"privAFSt"];

    float32x2_t v13 = [v7 objectAtIndexedSubscript:a3];
    float32x2_t v14 = [v13 objectForKeyedSubscript:@"privFM"];

    if (v12 && v14)
    {
      int v15 = [v12 intValue];
      unsigned int v16 = [v14 intValue] - 1;
      BOOL v10 = v15 == 2 && v16 < 2;
    }
    else
    {
      BOOL v10 = 0;
      *a5 = 2048;
    }
  }
  return v10;
}

- (int)getFocusDataFromFrameData:(id)a3 toFocusingFlags:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v22 = 0;
  if (![v6 count])
  {
LABEL_12:
    int v13 = v22;
    goto LABEL_15;
  }
  uint64_t v8 = 0;
  while (1)
  {
    id v9 = [v6 objectAtIndexedSubscript:v8];
    BOOL v10 = [v9 objectForKeyedSubscript:@"InterpolatedFrame"];
    int64_t v11 = v10;
    if (!v10 || ![v10 BOOLValue])
    {
      BOOL v17 = [(PregateAnalyzer *)self frameIndexIsFocusing:v8 inFrameData:v6 failureReason:&v22];
      int v13 = v22;
      if (v22) {
        goto LABEL_14;
      }
      BOOL v16 = v17;
      goto LABEL_11;
    }
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    if (![(PregateAnalyzer *)self findSurroundingNonInterpForIndex:v8 inFrameInfoArray:v6 prevIndex:&v21 nextIndex:&v20])break; {
    BOOL v12 = [(PregateAnalyzer *)self frameIndexIsFocusing:v21 inFrameData:v6 failureReason:&v22];
    }
    int v13 = v22;
    if (v22) {
      goto LABEL_14;
    }
    BOOL v14 = v12;
    BOOL v15 = [(PregateAnalyzer *)self frameIndexIsFocusing:v20 inFrameData:v6 failureReason:&v22];
    int v13 = v22;
    if (v22) {
      goto LABEL_14;
    }
    BOOL v16 = v15 | v14;
LABEL_11:
    v18 = [NSNumber numberWithBool:v16];
    [v7 addObject:v18];

    if ([v6 count] <= (unint64_t)++v8) {
      goto LABEL_12;
    }
  }
  int v13 = 0x2000;
  int v22 = 0x2000;
LABEL_14:

LABEL_15:
  return v13;
}

- (int)getZoomFlagsFromFrameData:(id)a3 toArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v25 = 0;
  if ([(PregateAnalyzer *)self getParamForKey:@"maxZoomFactor" toFloat:&v25])
  {
    if ([v6 count])
    {
      unint64_t v8 = 0;
      unint64_t v9 = 0x1E4F28000uLL;
      do
      {
        BOOL v10 = [v6 objectAtIndexedSubscript:v8];
        int64_t v11 = [v10 objectForKeyedSubscript:@"InterpolatedFrame"];
        int v12 = [v11 BOOLValue];

        if (v12)
        {
          uint64_t v23 = 0;
          uint64_t v24 = 0;
          if (![(PregateAnalyzer *)self findSurroundingNonInterpForIndex:v8 inFrameInfoArray:v6 prevIndex:&v24 nextIndex:&v23])
          {

            int v21 = 0x2000;
            goto LABEL_11;
          }
          int v13 = [v6 objectAtIndexedSubscript:v24];
          BOOL v14 = [v13 objectForKeyedSubscript:@"privTZF"];

          [v14 floatValue];
          BOOL v15 = [v6 objectAtIndexedSubscript:v23];
          [v15 objectForKeyedSubscript:@"privTZF"];
          v17 = unint64_t v16 = v9;

          [v17 floatValue];
          unint64_t v9 = v16;
        }
        else
        {
          v18 = [v6 objectAtIndexedSubscript:v8];
          double v19 = [v18 objectForKeyedSubscript:@"privTZF"];

          [v19 floatValue];
        }
        uint64_t v20 = [*(id *)(v9 + 3792) numberWithUnsignedInteger:0];
        [v7 addObject:v20];

        ++v8;
      }
      while ([v6 count] > v8);
    }
    int v21 = 0;
  }
  else
  {
    int v21 = 1024;
  }
LABEL_11:

  return v21;
}

- (int)processMotionVectorsFromFrameData:(id)a3 toVectorArray:(MetadataFloatVector *)a4
{
  id v5 = a3;
  if ([v5 count])
  {
    unint64_t v6 = 0;
    MetadataFloatVector v7 = 0;
    do
    {
      unint64_t v8 = [v5 objectAtIndexedSubscript:v6];
      unint64_t v9 = [v8 objectForKeyedSubscript:@"InterpolatedFrame"];
      BOOL v10 = v9;
      if (v9) {
        char v11 = [v9 BOOLValue];
      }
      else {
        char v11 = 0;
      }
      int v12 = [v8 objectForKeyedSubscript:@"privECMVct"];
      int v13 = v12;
      MetadataFloatVector v16 = 0;
      if (v12)
      {
        [v12 getBytes:&v16 length:8];
        MetadataFloatVector v7 = v16;
      }
      else if ((v11 & 1) == 0)
      {

        int v14 = 2048;
        goto LABEL_11;
      }
      a4[v6] = v7;

      ++v6;
    }
    while ([v5 count] > v6);
  }
  int v14 = 0;
LABEL_11:

  return v14;
}

- (int)processPresentationTimesFromData:(id)a3 toBadFrameFlags:(id)a4 withMaxDuration:(id *)a5 maxInterpGapTime:(id *)a6 maxInterpFrameCount:(int64_t)a7 firstIndex:(int64_t)a8 lastIndex:(int64_t)a9
{
  id v14 = a3;
  id v15 = a4;
  if (a8 > a9)
  {
LABEL_21:
    int v42 = 0;
    goto LABEL_24;
  }
  int v46 = 0;
  unint64_t v16 = 0x1E4F28000uLL;
  while (1)
  {
    v47 = [v14 objectAtIndexedSubscript:a8];
    BOOL v17 = [v47 objectForKeyedSubscript:@"InterpolatedFrame"];
    int v18 = [v17 BOOLValue];

    if (v18)
    {
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      if (![(PregateAnalyzer *)self findSurroundingNonInterpForIndex:a8 inFrameInfoArray:v14 prevIndex:&v54 nextIndex:&v53])goto LABEL_6; {
      memset(&v52, 0, sizeof(v52));
      }
      [(PregateAnalyzer *)self timeForFrameFromArray:v14 frameIndex:v54];
      memset(&v51, 0, sizeof(v51));
      [(PregateAnalyzer *)self timeForFrameFromArray:v14 frameIndex:v53];
      memset(&v50, 0, sizeof(v50));
      CMTime lhs = v51;
      CMTime rhs = v52;
      CMTimeSubtract(&v50, &lhs, &rhs);
      CMTime lhs = v50;
      CMTime rhs = (CMTime)*a6;
      if (CMTimeCompare(&lhs, &rhs) >= 1)
      {
LABEL_6:
        double v19 = [v15 objectAtIndexedSubscript:a8];
        uint64_t v20 = [v19 unsignedIntegerValue];

        int v21 = [*(id *)(v16 + 3792) numberWithUnsignedInteger:v20 | 0x4000];
        [v15 setObject:v21 atIndexedSubscript:a8];
      }
      int v22 = v46 + 1;
    }
    else
    {
      uint64_t v23 = v46;
      if (v46 > a7)
      {
        int v22 = 0;
        if (v46 < 1) {
          goto LABEL_13;
        }
        int64_t v24 = a8 - 1;
        do
        {
          int v25 = [v15 objectAtIndexedSubscript:v24];
          uint64_t v26 = [v25 unsignedIntegerValue];

          uint64_t v27 = v26 | 0x4000;
          unint64_t v16 = 0x1E4F28000uLL;
          v28 = [NSNumber numberWithUnsignedInteger:v27];
          [v15 setObject:v28 atIndexedSubscript:v24];

          --v24;
          --v23;
        }
        while (v23);
      }
      int v22 = 0;
    }
LABEL_13:
    int v46 = v22;
    if (a8 < (unint64_t)([v14 count] - 1)) {
      break;
    }
    ++a8;
LABEL_20:

    if (a8 == a9 + 1) {
      goto LABEL_21;
    }
  }
  CFDictionaryRef v29 = [v47 objectForKeyedSubscript:@"PresentationTime"];
  if (!v29) {
    goto LABEL_23;
  }
  CFDictionaryRef v30 = v29;
  memset(&v52, 0, sizeof(v52));
  CMTimeMakeFromDictionary(&v52, v29);
  int64_t v31 = a8 + 1;
  CFDictionaryRef v32 = [v14 objectAtIndexedSubscript:a8 + 1];
  CFDictionaryRef v33 = [v32 objectForKeyedSubscript:@"PresentationTime"];

  if (v33)
  {
    memset(&v51, 0, sizeof(v51));
    CMTimeMakeFromDictionary(&v51, v33);
    memset(&v50, 0, sizeof(v50));
    CMTime lhs = v51;
    CMTime rhs = v52;
    CMTimeSubtract(&v50, &lhs, &rhs);
    CMTime lhs = v50;
    CMTime rhs = (CMTime)*a5;
    if (CMTimeCompare(&lhs, &rhs) >= 1)
    {
      v34 = [v15 objectAtIndexedSubscript:a8];
      int64_t v45 = a8;
      v35 = self;
      v36 = a5;
      id v37 = v14;
      int64_t v38 = a7;
      uint64_t v39 = [v34 unsignedIntegerValue];

      uint64_t v40 = v39 | 0x20;
      a7 = v38;
      id v14 = v37;
      a5 = v36;
      self = v35;
      objc_super v41 = [NSNumber numberWithUnsignedInteger:v40];
      [v15 setObject:v41 atIndexedSubscript:v45];
    }
    a8 = v31;
    unint64_t v16 = 0x1E4F28000;
    goto LABEL_20;
  }

LABEL_23:
  int v42 = 2048;
LABEL_24:

  return v42;
}

- (BOOL)exposuresViolateThresholdFraction:(float)a3 exposure1:(float)a4 exposure2:(float)a5
{
  if (a4 >= a5) {
    float v5 = a5;
  }
  else {
    float v5 = a4;
  }
  return vabds_f32(a4, a5) > (float)(v5 * a3);
}

- (int)processGainAndExposureData:(id)a3 intoFlagsArray:(id)a4 firstIndex:(int64_t)a5 lastIndex:(int64_t)a6
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v113 = 0;
  float v112 = 0.0;
  BOOL v10 = [(PregateAnalyzer *)self getParamForKey:@"maxExposureChangeFrac" toFloat:(char *)&v113 + 4];
  BOOL v11 = [(PregateAnalyzer *)self getParamForKey:@"maxFrameGain" toFloat:&v112];
  int v12 = 1024;
  if ([(PregateAnalyzer *)self getParamForKey:@"maxFrameExposureTime" toFloat:&v113]
    && v11
    && v10)
  {
    if (a6 < a5)
    {
      int v12 = 0;
      goto LABEL_77;
    }
    uint64_t v13 = 0;
    int v12 = 0;
    id v106 = v9;
    id v107 = v8;
    do
    {
      id v14 = self;
      uint64_t v15 = a5 + v13;
      unint64_t v16 = [v8 objectAtIndexedSubscript:a5 + v13];
      BOOL v17 = [v16 objectForKeyedSubscript:@"InterpolatedFrame"];
      int v18 = [v17 BOOLValue];

      if (v18)
      {
        int64_t v110 = 0;
        int64_t v111 = 0;
        self = v14;
        if ([(PregateAnalyzer *)v14 findSurroundingNonInterpForIndex:v15 inFrameInfoArray:v8 prevIndex:&v111 nextIndex:&v110])
        {
          double v19 = [v8 objectAtIndexedSubscript:v111];
          uint64_t v20 = [v8 objectAtIndexedSubscript:v110];
          int v21 = [v19 objectForKeyedSubscript:@"privImgG"];

          int v22 = [v20 objectForKeyedSubscript:@"privImgG"];

          uint64_t v23 = [v19 objectForKeyedSubscript:@"privET"];

          int64_t v24 = [v20 objectForKeyedSubscript:@"privET"];

          BOOL v25 = v21 == 0;
          self = v14;
          BOOL v25 = v25 || v22 == 0;
          BOOL v27 = v25 || v23 == 0 || v24 == 0;
          id v9 = v106;
          id v8 = v107;
          if (v27) {
            int v28 = 2048;
          }
          else {
            int v28 = 0;
          }
          CFDictionaryRef v29 = [v19 objectForKeyedSubscript:@"privImgG"];
          [v29 floatValue];
          float v31 = v30;

          CFDictionaryRef v32 = [v20 objectForKeyedSubscript:@"privImgG"];
          [v32 floatValue];
          float v34 = v33;

          v35 = [v19 objectForKeyedSubscript:@"privET"];
          [v35 floatValue];
          float v37 = v36;

          int64_t v38 = [v20 objectForKeyedSubscript:@"privET"];
          [v38 floatValue];
          float v40 = v39;

          *(float *)&double v41 = v31 * v37;
          *(float *)&double v42 = v34 * v40;
          LODWORD(v43) = HIDWORD(v113);
          BOOL v44 = [(PregateAnalyzer *)v14 exposuresViolateThresholdFraction:v43 exposure1:v41 exposure2:v42];
          int v45 = v28 | 0x80;
          if (!v44) {
            int v45 = v28;
          }
          uint64_t v15 = a5 + v13;
          if (v34 <= v112 && v31 <= v112 && v40 <= *(float *)&v113 && v37 <= *(float *)&v113) {
            unsigned int v49 = v45;
          }
          else {
            unsigned int v49 = v45 | 0x40;
          }

          goto LABEL_76;
        }
      }
      else
      {
        int64_t v110 = 0;
        int64_t v111 = 0;
        if (v13)
        {
          self = v14;
          if ([(PregateAnalyzer *)v14 findNextNonInterpFrameFromIndex:v15 backwards:1 inFrameInfoArray:v8 toValue:&v111])
          {
            unsigned int v49 = 0;
          }
          else
          {
            unsigned int v49 = 0x2000;
          }
        }
        else
        {
          unsigned int v49 = 0;
          int64_t v111 = a5;
          self = v14;
        }
        if (a6 - a5 == v13)
        {
          int64_t v110 = a6;
LABEL_44:
          if (!v49)
          {
            CMTime v50 = [v8 objectAtIndexedSubscript:v111];
            CMTime v51 = [v8 objectAtIndexedSubscript:v15];
            CMTime v52 = [v8 objectAtIndexedSubscript:v110];
            v103 = v50;
            v104 = [v50 objectForKeyedSubscript:@"privImgG"];

            uint64_t v53 = [v51 objectForKeyedSubscript:@"privImgG"];

            uint64_t v54 = [v52 objectForKeyedSubscript:@"privImgG"];

            v55 = [v50 objectForKeyedSubscript:@"privET"];

            v56 = [v51 objectForKeyedSubscript:@"privET"];

            v57 = [v52 objectForKeyedSubscript:@"privET"];

            if (v104) {
              BOOL v58 = v53 == 0;
            }
            else {
              BOOL v58 = 1;
            }
            BOOL v61 = v58 || v54 == 0 || v55 == 0 || v56 == 0;
            self = v14;
            if (v61 || v57 == 0) {
              int v63 = 2048;
            }
            else {
              int v63 = 0;
            }
            int v105 = v63;
            v64 = [v103 objectForKeyedSubscript:@"privImgG"];
            [v64 floatValue];
            float v66 = v65;
            v67 = [v103 objectForKeyedSubscript:@"privET"];
            [v67 floatValue];
            float v69 = v66 * v68;

            v70 = [v51 objectForKeyedSubscript:@"privImgG"];
            [v70 floatValue];
            float v72 = v71;
            v73 = [v51 objectForKeyedSubscript:@"privET"];
            [v73 floatValue];
            float v75 = v72 * v74;

            v76 = [v52 objectForKeyedSubscript:@"privImgG"];
            [v76 floatValue];
            float v78 = v77;
            v79 = [v52 objectForKeyedSubscript:@"privET"];
            [v79 floatValue];
            float v81 = v80;

            LODWORD(v82) = HIDWORD(v113);
            *(float *)&double v83 = v69;
            *(float *)&double v84 = v75;
            if ([(PregateAnalyzer *)v14 exposuresViolateThresholdFraction:v82 exposure1:v83 exposure2:v84])
            {
              int v88 = v105 | 0x80;
            }
            else
            {
              *(float *)&double v87 = v78 * v81;
              LODWORD(v85) = HIDWORD(v113);
              *(float *)&double v86 = v75;
              if ([(PregateAnalyzer *)v14 exposuresViolateThresholdFraction:v85 exposure1:v86 exposure2:v87])
              {
                int v88 = v105 | 0x80;
              }
              else
              {
                int v88 = v105;
              }
            }
            v89 = [v51 objectForKeyedSubscript:@"privImgG"];
            [v89 floatValue];
            float v91 = v90;
            float v92 = v112;

            v93 = [v51 objectForKeyedSubscript:@"privET"];
            [v93 floatValue];
            float v95 = v94;
            float v96 = *(float *)&v113;

            if (v91 <= v92 && v95 <= v96) {
              unsigned int v49 = v88;
            }
            else {
              unsigned int v49 = v88 | 0x40;
            }

            id v9 = v106;
            id v8 = v107;
            uint64_t v15 = a5 + v13;
          }
          goto LABEL_76;
        }
        if ([(PregateAnalyzer *)self findNextNonInterpFrameFromIndex:v15 backwards:0 inFrameInfoArray:v8 toValue:&v110])
        {
          goto LABEL_44;
        }
      }
      unsigned int v49 = 0x2000;
LABEL_76:
      [v9 objectAtIndexedSubscript:v15];
      v99 = uint64_t v98 = v15;
      uint64_t v100 = [v99 unsignedIntegerValue];

      v101 = [NSNumber numberWithUnsignedInteger:v100 | v49];
      [v9 setObject:v101 atIndexedSubscript:v98];

      v12 |= v49;
      ++v13;
    }
    while (a6 - a5 + 1 != v13);
  }
LABEL_77:

  return v12;
}

- (int)getPerFrameGatingData:(id)a3 firstIndex:(int64_t)a4 lastIndex:(int64_t)a5
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  if (a5 < a4 || [v8 count] <= (unint64_t)a5)
  {
    int v17 = 0x2000;
  }
  else
  {
    BOOL v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    if ([v9 count])
    {
      int64_t v11 = 0;
      do
      {
        if (v11 > a5 || v11 < a4) {
          uint64_t v13 = 4096;
        }
        else {
          uint64_t v13 = 0;
        }
        id v14 = [NSNumber numberWithUnsignedInteger:v13];
        [v10 addObject:v14];

        ++v11;
      }
      while ([v9 count] > (unint64_t)v11);
    }
    objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", 8 * objc_msgSend(v9, "count"));
    id v15 = objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 mutableBytes];
    int v17 = [(PregateAnalyzer *)self processMotionVectorsFromFrameData:v9 toVectorArray:v16];
    if (!v17)
    {
      int v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      int v17 = [(PregateAnalyzer *)self getFocusDataFromFrameData:v9 toFocusingFlags:v18];
      if (!v17)
      {
        uint64_t v74 = v16;
        double v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
        int v17 = [(PregateAnalyzer *)self getZoomFlagsFromFrameData:v9 toArray:v19];
        if (!v17)
        {
          double v82 = v19;
          id obj = v15;
          int64_t v78 = a5;
          int64_t v79 = a4;
          float v77 = v10;
          uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
          if ([v9 count])
          {
            unint64_t v21 = 0;
            do
            {
              int v22 = [NSNumber numberWithUnsignedInteger:0];
              [v20 addObject:v22];

              ++v21;
            }
            while ([v9 count] > v21);
          }
          float v75 = v9;
          uint64_t v100 = 0;
          float v99 = 0.0;
          long long v97 = *MEMORY[0x1E4F1F9F0];
          uint64_t v98 = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
          uint64_t v95 = 0;
          uint64_t v96 = 0;
          long long v94 = 0uLL;
          BOOL v23 = [(PregateAnalyzer *)self getParamForKey:@"maxFaceSize" toFloat:(char *)&v100 + 4];
          BOOL v24 = [(PregateAnalyzer *)self getParamForKey:@"maxBlurMagnitude" toFloat:&v100];
          BOOL v25 = [(PregateAnalyzer *)self getParamForKey:@"maxPerFrameMotion" toFloat:&v99];
          BOOL v26 = [(PregateAnalyzer *)self getParamForKey:@"maxInterpCount" toInt:&v96];
          BOOL v27 = [(PregateAnalyzer *)self getParamForKey:@"maxFrameDuration" toCMTime:&v97];
          LOWORD(v28) = 1024;
          int v73 = 0;
          if ([(PregateAnalyzer *)self getParamForKey:@"maxInterpTime" toCMTime:&v94]&& v27&& v26&& v25)
          {
            int64_t v29 = v79;
            if (v24)
            {
              id v9 = v75;
              int64_t v30 = v78;
              if (v23)
              {
                float v81 = v18;
                long long v92 = v97;
                uint64_t v93 = v98;
                long long v90 = v94;
                uint64_t v91 = v95;
                int v31 = [(PregateAnalyzer *)self processPresentationTimesFromData:v75 toBadFrameFlags:v20 withMaxDuration:&v92 maxInterpGapTime:&v90 maxInterpFrameCount:v96 firstIndex:v79 lastIndex:v78];
                double width = self->_inputVideoSize.width;
                if (width <= self->_inputVideoSize.height) {
                  double width = self->_inputVideoSize.height;
                }
                float v33 = width;
                float v34 = (float)(v99 * v33) * (float)(v99 * v33);
                int v73 = v31;
                int v28 = v31;
                v76 = v20;
                do
                {
                  int v85 = v28;
                  v35 = [v9 objectAtIndexedSubscript:v29];
                  float v36 = v35;
                  int64_t v84 = v29;
                  if (v29 <= v79)
                  {
                    int v38 = 0;
                  }
                  else
                  {
                    float v37 = (float *)(v74 + 8 * v29);
                    int v38 = 8
                        * ((float)((float)((float)(v37[1] - *(v37 - 1)) * (float)(v37[1] - *(v37 - 1)))
                                 + (float)((float)(*v37 - *(v37 - 2)) * (float)(*v37 - *(v37 - 2)))) > v34);
                  }
                  float v40 = v81;
                  float v39 = v82;
                  double v41 = [v35 objectForKeyedSubscript:@"privEMBVct"];
                  double v42 = v41;
                  if (v41)
                  {
                    *(void *)&long long v92 = 0;
                    [v41 getBytes:&v92 length:8];
                    int v43 = (float)((float)(*((float *)&v92 + 1) * *((float *)&v92 + 1))
                                + (float)(*(float *)&v92 * *(float *)&v92)) > (float)(*(float *)&v100 * *(float *)&v100);
                  }
                  else
                  {
                    int v43 = 2048;
                  }
                  int v44 = v43 | v38;

                  int v45 = [v36 objectForKeyedSubscript:@"privDFArray"];
                  double v83 = v36;
                  if ([v45 count])
                  {
                    long long v88 = 0u;
                    long long v89 = 0u;
                    long long v86 = 0u;
                    long long v87 = 0u;
                    float v80 = v45;
                    id v46 = v45;
                    uint64_t v47 = [v46 countByEnumeratingWithState:&v86 objects:v101 count:16];
                    if (v47)
                    {
                      uint64_t v48 = v47;
                      uint64_t v49 = *(void *)v87;
                      do
                      {
                        for (uint64_t i = 0; i != v48; ++i)
                        {
                          if (*(void *)v87 != v49) {
                            objc_enumerationMutation(v46);
                          }
                          CMTime v51 = [*(id *)(*((void *)&v86 + 1) + 8 * i) objectForKeyedSubscript:@"Rect"];
                          CMTime v52 = [v51 objectForKeyedSubscript:@"Width"];
                          [v52 floatValue];
                          float v54 = v53;

                          v55 = [v51 objectForKeyedSubscript:@"Height"];
                          [v55 floatValue];
                          float v57 = v56;

                          if ((float)(v54 * v57) > *((float *)&v100 + 1)) {
                            v44 |= 4u;
                          }
                        }
                        uint64_t v48 = [v46 countByEnumeratingWithState:&v86 objects:v101 count:16];
                      }
                      while (v48);
                    }

                    id v9 = v75;
                    float v40 = v81;
                    float v39 = v82;
                    int v45 = v80;
                  }

                  BOOL v58 = [v39 objectAtIndexedSubscript:v84];
                  int v59 = [v58 unsignedIntValue];

                  int v60 = v59 | v44;
                  BOOL v61 = [v40 objectAtIndexedSubscript:v84];
                  int v62 = [v61 BOOLValue];

                  if (v62) {
                    v60 |= 0x10u;
                  }
                  int v63 = [v76 objectAtIndexedSubscript:v84];
                  int v64 = [v63 unsignedIntValue];

                  int v65 = v64 | v60;
                  float v66 = [v77 objectAtIndexedSubscript:v84];
                  int v67 = [v66 unsignedIntValue];

                  float v68 = [NSNumber numberWithUnsignedInteger:v67 | v65];
                  [v77 replaceObjectAtIndex:v84 withObject:v68];

                  int v28 = v65 | v85;
                  int64_t v29 = v84 + 1;
                }
                while (v84 != v78);
                int64_t v30 = v78;
                int64_t v29 = v79;
                int v18 = v81;
                uint64_t v20 = v76;
              }
            }
            else
            {
              id v9 = v75;
              int64_t v30 = v78;
            }
          }
          else
          {
            id v9 = v75;
            int64_t v30 = v78;
            int64_t v29 = v79;
          }
          __int16 v69 = [(PregateAnalyzer *)self processGainAndExposureData:v9 intoFlagsArray:v77 firstIndex:v29 lastIndex:v30] | v28;
          objc_storeStrong((id *)&self->_badFrameFlags, v77);
          objc_storeStrong((id *)&self->_perFrameTranslationVecs, obj);
          int v70 = v69 & 0x2C00;
          id v15 = obj;
          int v17 = v70 | v73;

          BOOL v10 = v77;
          double v19 = v82;
        }
      }
    }
  }
  return v17;
}

- (int)isCumulativePanAcceptableForFrames:(id)a3 firstIndex:(int64_t)a4 lastIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = v8;
  int v10 = 0x2000;
  if ((a4 & 0x8000000000000000) == 0 && a4 <= a5 && [v8 count] > (unint64_t)a5)
  {
    NSUInteger v11 = [(NSArray *)self->_badFrameFlags count];
    if (v11 == [v9 count]
      && (NSUInteger v12 = -[NSData length](self->_perFrameTranslationVecs, "length"), [v9 count] == v12 >> 3))
    {
      [(PregateAnalyzer *)self cumulativePanForStartIndex:a4 lastIndex:a5];
      float v14 = v13;
      float v16 = v15;
      uint64_t v22 = 0;
      BOOL v17 = [(PregateAnalyzer *)self getParamForKey:@"maxPanX" toFloat:(char *)&v22 + 4];
      int v10 = 1024;
      if ([(PregateAnalyzer *)self getParamForKey:@"maxPanY" toFloat:&v22] && v17)
      {
        float v18 = self->_inputVideoSize.width * *((float *)&v22 + 1);
        if (v14 <= v18)
        {
          float v19 = self->_inputVideoSize.height * *(float *)&v22;
          BOOL v20 = v16 <= v19;
        }
        else
        {
          BOOL v20 = 0;
        }
        if (v20) {
          int v10 = 0;
        }
        else {
          int v10 = 2;
        }
      }
    }
    else
    {
      int v10 = 0x2000;
    }
  }

  return v10;
}

- (BOOL)subsegmentMeetsTrimCriteriaForFrames:(id)a3 firstFrame:(int64_t)a4 lastFrame:(int64_t)a5 firstFrameTimeOut:(id *)a6 lastFrameTimeOut:(id *)a7 preciseTrimTimeOut:(id *)a8
{
  id v14 = a3;
  float v15 = v14;
  if (a5 < a4)
  {
    BOOL v16 = 0;
    goto LABEL_42;
  }
  unint64_t v17 = [v14 count];
  BOOL v16 = 0;
  if ((a4 & 0x8000000000000000) == 0 && v17 > a5)
  {
    float v18 = [v15 objectAtIndex:a4];
    float v19 = [v15 objectAtIndex:a5];
    memset(&v53, 0, sizeof(v53));
    CFDictionaryRef v20 = [v18 objectForKeyedSubscript:@"PresentationTime"];
    CMTimeMakeFromDictionary(&v53, v20);

    memset(&v52, 0, sizeof(v52));
    CFDictionaryRef v21 = [v19 objectForKeyedSubscript:@"PresentationTime"];
    CMTimeMakeFromDictionary(&v52, v21);

    if (a6) {
      *(CMTime *)a6 = v53;
    }
    if (a7) {
      *(CMTime *)a7 = v52;
    }
    [(PregateAnalyzer *)self minimumRequiredTrimLength];
    if ((v51 & 0x1D) != 1) {
      goto LABEL_22;
    }
    memset(&v50, 0, sizeof(v50));
    CMTime lhs = v52;
    CMTime rhs = v53;
    CMTimeSubtract(&v50, &lhs, &rhs);
    if (a8) {
      *(CMTime *)a8 = v50;
    }
    [(PregateAnalyzer *)self minimumRequiredTrimLength];
    CMTime lhs = v50;
    if ((CMTimeCompare(&lhs, &time2) & 0x80000000) == 0) {
      goto LABEL_22;
    }
    CMTime lhs = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    if ([v15 count] - 1 <= (unint64_t)a5)
    {
      if (a5 < 1)
      {
LABEL_18:
        CMTime rhs = v50;
        CMTime v46 = lhs;
        CMTimeAdd(&time1, &rhs, &v46);
        [(PregateAnalyzer *)self minimumRequiredTrimLength];
        int32_t v26 = CMTimeCompare(&time1, &v43);
        if (!a8 || v26 < 0)
        {
          if (v26 < 0)
          {
            BOOL v16 = 0;
LABEL_41:

            goto LABEL_42;
          }
        }
        else
        {
          [(PregateAnalyzer *)self minimumRequiredTrimLength];
          *(CMTime *)a8 = rhs;
        }
LABEL_22:
        [(PregateAnalyzer *)self requiredFrameTime];
        if ((v42 & 0x1D) == 1)
        {
          [(PregateAnalyzer *)self requiredFrameTime];
          CMTime v50 = v53;
          int32_t v27 = CMTimeCompare(&v41, &v50);
          [(PregateAnalyzer *)self requiredFrameTime];
          CMTime v50 = v52;
          BOOL v16 = CMTimeCompare(&v40, &v50) < 1 && v27 >= 0;
        }
        else
        {
          BOOL v16 = 1;
        }
        [(PregateAnalyzer *)self requiredTimeRange];
        if (v39)
        {
          [(PregateAnalyzer *)self requiredTimeRange];
          if (v38)
          {
            [(PregateAnalyzer *)self requiredTimeRange];
            if (!v37)
            {
              [(PregateAnalyzer *)self requiredTimeRange];
              if ((v36 & 0x8000000000000000) == 0)
              {
                [(PregateAnalyzer *)self requiredTimeRange];
                CMTime v35 = v34;
                CMTime v50 = v53;
                int32_t v29 = CMTimeCompare(&v35, &v50);
                [(PregateAnalyzer *)self requiredTimeRange];
                CMTimeRangeGetEnd(&v33, &range);
                CMTime v50 = v52;
                if (CMTimeCompare(&v33, &v50) >= 1 || v29 < 0) {
                  BOOL v16 = 0;
                }
              }
            }
          }
        }
        goto LABEL_41;
      }
      uint64_t v22 = [v15 objectAtIndexedSubscript:a5 - 1];
      memset(&rhs, 0, sizeof(rhs));
      CFDictionaryRef v25 = [v22 objectForKeyedSubscript:@"PresentationTime"];
      CMTimeMakeFromDictionary(&rhs, v25);

      CMTime v46 = v52;
      *(_OWORD *)&v45.value = *(_OWORD *)&rhs.value;
      CMTimeEpoch epoch = rhs.epoch;
    }
    else
    {
      uint64_t v22 = [v15 objectAtIndexedSubscript:a5 + 1];
      memset(&rhs, 0, sizeof(rhs));
      CFDictionaryRef v23 = [v22 objectForKeyedSubscript:@"PresentationTime"];
      CMTimeMakeFromDictionary(&rhs, v23);

      CMTime v46 = rhs;
      *(_OWORD *)&v45.value = *(_OWORD *)&v52.value;
      CMTimeEpoch epoch = v52.epoch;
    }
    v45.CMTimeEpoch epoch = epoch;
    CMTimeSubtract(&lhs, &v46, &v45);

    goto LABEL_18;
  }
LABEL_42:

  return v16;
}

- (int64_t)findLongestPassingSegmentInFrameFlags:(id)a3 startIndex:(int64_t)a4 endIndex:(int64_t)a5 startOfRun:(int64_t *)a6 gatingFailures:(int *)a7
{
  BOOL v24 = a6;
  id v9 = a3;
  if (a4 <= a5)
  {
    int64_t v14 = 0;
    int v13 = 0;
    int64_t v12 = 0;
    int64_t v11 = 0;
    int64_t v10 = 0;
    int64_t v15 = a5 + 1;
    do
    {
      BOOL v16 = objc_msgSend(v9, "objectAtIndex:", a4, v24);
      int v17 = [v16 unsignedIntegerValue];

      v13 |= v17;
      if (v10 <= v12) {
        int64_t v18 = v11;
      }
      else {
        int64_t v18 = v14;
      }
      if (v10 <= v12) {
        int64_t v19 = v12;
      }
      else {
        int64_t v19 = v10;
      }
      if (v10)
      {
        int64_t v20 = v14;
      }
      else
      {
        int64_t v18 = v11;
        int64_t v19 = v12;
        int64_t v20 = a4;
      }
      if (v17) {
        int64_t v10 = 0;
      }
      else {
        ++v10;
      }
      if (v17)
      {
        int64_t v11 = v18;
        int64_t v12 = v19;
      }
      else
      {
        int64_t v14 = v20;
      }
      ++a4;
    }
    while (v15 != a4);
  }
  else
  {
    int64_t v10 = 0;
    int64_t v11 = 0;
    int64_t v12 = 0;
    int v13 = 0;
    int64_t v14 = 0;
  }
  if (v10 <= v12) {
    int64_t v21 = v11;
  }
  else {
    int64_t v21 = v14;
  }
  int64_t *v24 = v21;
  if (a7) {
    *a7 = v13;
  }
  if (v10 <= v12) {
    int64_t v22 = v12;
  }
  else {
    int64_t v22 = v10;
  }

  return v22;
}

- (BOOL)findFrameIndicesInFrameArray:(id)a3 forTimeRange:(id *)a4 startIndex:(int *)a5 endIndex:(int *)a6
{
  id v10 = a3;
  if (![v10 count]) {
    goto LABEL_24;
  }
  if ((a4->var0.var2 & 0x1D) == 1 || (a4->var1.var2 & 0x1D) == 1)
  {
    CMTime v29 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    BOOL v24 = self;
    if ([v10 count])
    {
      unint64_t v11 = 0;
      p_inputTrimTime = (CMTime *)&self->inputTrimTime;
      while (1)
      {
        int v13 = [v10 objectAtIndexedSubscript:v11];
        CFDictionaryRef v14 = [v13 objectForKeyedSubscript:@"PresentationTime"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          memset(&v28, 0, sizeof(v28));
          CMTimeMakeFromDictionary(&v28, v14);
          CMTime time1 = v28;
          CMTime time2 = *p_inputTrimTime;
          if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0) {
            break;
          }
        }

        if ([v10 count] <= ++v11) {
          goto LABEL_13;
        }
      }
      CMTime v29 = v28;

LABEL_13:
      int v15 = v11;
    }
    else
    {
      int v15 = 0;
      unint64_t v11 = 0;
    }
    if ([v10 count] <= v11) {
      goto LABEL_24;
    }
    CFDictionaryRef v23 = a5;
    int v17 = [v10 count];
    uint64_t v18 = v17;
    if (v17 <= (uint64_t)v15) {
      goto LABEL_24;
    }
    int v16 = v17 - 1;
    while (1)
    {
      int64_t v19 = [v10 objectAtIndexedSubscript:--v18];
      CFDictionaryRef v20 = [v19 objectForKeyedSubscript:@"PresentationTime"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        memset(&v28, 0, sizeof(v28));
        CMTimeMakeFromDictionary(&v28, v20);
        memset(&time1, 0, sizeof(time1));
        CMTime time2 = v28;
        CMTime rhs = v29;
        CMTimeSubtract(&time1, &time2, &rhs);
        CMTime time2 = time1;
        CMTime rhs = (CMTime)v24->inputTrimTime.duration;
        if (CMTimeCompare(&time2, &rhs) <= 0) {
          break;
        }
      }

      --v16;
      if (v18 <= v15) {
        goto LABEL_24;
      }
    }

    self = v24;
  }
  else
  {
    CFDictionaryRef v23 = a5;
    int v15 = 0;
    int v16 = [v10 count] - 1;
  }
  if (![(PregateAnalyzer *)self subsegmentMeetsTrimCriteriaForFrames:v10 firstFrame:v15 lastFrame:v16 firstFrameTimeOut:0 lastFrameTimeOut:0 preciseTrimTimeOut:0])
  {
LABEL_24:
    BOOL v21 = 0;
    goto LABEL_25;
  }
  *CFDictionaryRef v23 = v15;
  *a6 = v16;
  BOOL v21 = 1;
LABEL_25:

  return v21;
}

- (int)findGatingPassViaTrimming:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  int v9 = 0;
  int64_t v5 = [(PregateAnalyzer *)self findLongestPassingSegmentInFrameFlags:self->_badFrameFlags startIndex:self->_trimInput_firstIndex endIndex:self->_trimInput_lastIndex startOfRun:&v10 gatingFailures:&v9];
  if (v5)
  {
    uint64_t v6 = v5 + v10 - 1;
    if (-[PregateAnalyzer subsegmentMeetsTrimCriteriaForFrames:firstFrame:lastFrame:firstFrameTimeOut:lastFrameTimeOut:preciseTrimTimeOut:](self, "subsegmentMeetsTrimCriteriaForFrames:firstFrame:lastFrame:firstFrameTimeOut:lastFrameTimeOut:preciseTrimTimeOut:", v4))
    {
      int v7 = [(PregateAnalyzer *)self isCumulativePanAcceptableForFrames:v4 firstIndex:v10 lastIndex:v6];
      if (!v7)
      {
        *(_OWORD *)&self->outputTrimTime.start.value = 0uLL;
        self->outputTrimTime.start.CMTimeEpoch epoch = 0;
        self->outputTrimTime.duration.CMTimeEpoch epoch = 0;
        *(_OWORD *)&self->outputTrimTime.duration.value = 0uLL;
      }
    }
    else
    {
      int v7 = v9;
      if (!v9)
      {
        int v7 = 512;
        int v9 = 512;
      }
    }
  }
  else if (v9)
  {
    int v7 = v9;
  }
  else
  {
    int v7 = 512;
  }

  return v7;
}

- (int)processPregateSuccess:(int *)a3
{
  uint64_t v5 = MEMORY[0x1E4F1F9F8];
  long long v6 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&self->outputTrimTime.start.value = *MEMORY[0x1E4F1F9F8];
  int64_t v7 = *(void *)(v5 + 16);
  self->outputTrimTime.start.CMTimeEpoch epoch = v7;
  p_duration = &self->outputTrimTime.duration;
  *(_OWORD *)&self->outputTrimTime.duration.value = v6;
  self->outputTrimTime.duration.CMTimeEpoch epoch = v7;
  int v9 = [(PregateAnalyzer *)self fetchVideoDimensionsFromMetadata];
  if (!v9)
  {
    id v20 = 0;
    int v9 = [(PregateAnalyzer *)self getFrameMetadataArray:&v20];
    id v10 = v20;
    if ([v10 count])
    {
      if (v9 || !v10) {
        goto LABEL_11;
      }
      long long v11 = *(_OWORD *)&self->inputTrimTime.start.epoch;
      *(_OWORD *)CMTime time = *(_OWORD *)&self->inputTrimTime.start.value;
      *(_OWORD *)&time[16] = v11;
      long long v19 = *(_OWORD *)&self->inputTrimTime.duration.timescale;
      if ([(PregateAnalyzer *)self findFrameIndicesInFrameArray:v10 forTimeRange:time startIndex:&self->_trimInput_firstIndex endIndex:&self->_trimInput_lastIndex])
      {
        int v12 = [(PregateAnalyzer *)self getPerFrameGatingData:v10 firstIndex:self->_trimInput_firstIndex lastIndex:self->_trimInput_lastIndex];
        if (!v12) {
          int v12 = [(PregateAnalyzer *)self findGatingPassViaTrimming:v10];
        }
      }
      else
      {
        int v12 = 512;
      }
    }
    else
    {
      int v12 = 2048;
    }
    *a3 = v12;
LABEL_11:
  }
  if (!*a3)
  {
    if (self->outputTrimTime.start.flags & 1) != 0 && (self->outputTrimTime.duration.flags)
    {
      *(_OWORD *)CMTime time = *(_OWORD *)&self->outputTrimTime.start.value;
      *(void *)&time[16] = self->outputTrimTime.start.epoch;
      Float64 Seconds = CMTimeGetSeconds((CMTime *)time);
      *(_OWORD *)CMTime time = *(_OWORD *)&p_duration->value;
      *(void *)&time[16] = p_duration->epoch;
      Float64 v14 = CMTimeGetSeconds((CMTime *)time);
      *(_OWORD *)CMTime time = *(_OWORD *)&self->inputTrimTime.start.value;
      *(void *)&time[16] = self->inputTrimTime.start.epoch;
      Float64 v15 = CMTimeGetSeconds((CMTime *)time);
      *(_OWORD *)CMTime time = *(_OWORD *)&self->inputTrimTime.duration.value;
      *(void *)&time[16] = self->inputTrimTime.duration.epoch;
      Float64 v17 = CMTimeGetSeconds((CMTime *)time);
      NSLog(&cfstr_VideoGatingTri.isa, *(void *)&Seconds, *(void *)&v14, *(void *)&v15, *(void *)&v17);
    }
    else
    {
      NSLog(&cfstr_VideoGatingSuc.isa);
    }
  }
  return v9;
}

- (PregateFeatureBuilder)featureBuilder
{
  return (PregateFeatureBuilder *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFeatureBuilder:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumRequiredTrimLength
{
  objc_copyStruct(retstr, &self->minimumRequiredTrimLength, 24, 1, 0);
  return result;
}

- (void)setMinimumRequiredTrimLength:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)requiredFrameTime
{
  objc_copyStruct(retstr, &self->requiredFrameTime, 24, 1, 0);
  return result;
}

- (void)setRequiredFrameTime:(id *)a3
{
}

- ($4C6D1E162277694FB76656457146213A)requiredTimeRange
{
  objc_copyStruct(retstr, &self->requiredTimeRange, 48, 1, 0);
  return result;
}

- (void)setRequiredTimeRange:(id *)a3
{
}

- (NSDictionary)pregateParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPregateParameters:(id)a3
{
}

- ($4C6D1E162277694FB76656457146213A)inputTrimTime
{
  objc_copyStruct(retstr, &self->inputTrimTime, 48, 1, 0);
  return result;
}

- (void)setInputTrimTime:(id *)a3
{
}

- ($4C6D1E162277694FB76656457146213A)outputTrimTime
{
  objc_copyStruct(retstr, &self->outputTrimTime, 48, 1, 0);
  return result;
}

- (NSDictionary)defaultParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDefaultParameters:(id)a3
{
}

- (CGSize)inputVideoSize
{
  objc_copyStruct(v4, &self->_inputVideoSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.double width = v2;
  return result;
}

- (void)setInputVideoSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_inputVideoSize, &v3, 16, 1, 0);
}

- (BOOL)haveInputVideoSize
{
  return self->_haveInputVideoSize;
}

- (void)setHaveInputVideoSize:(BOOL)a3
{
  self->_haveInputVideoSize = a3;
}

- (int)trimInput_firstIndex
{
  return self->_trimInput_firstIndex;
}

- (void)setTrimInput_firstIndex:(int)a3
{
  self->_trimInput_firstIndex = a3;
}

- (int)trimInput_lastIndex
{
  return self->_trimInput_lastIndex;
}

- (void)setTrimInput_lastIndex:(int)a3
{
  self->_trimInput_lastIndex = a3;
}

- (int)gatingPassTrimResult_firstIndex
{
  return self->_gatingPassTrimResult_firstIndex;
}

- (void)setGatingPassTrimResult_firstIndex:(int)a3
{
  self->_gatingPassTrimResult_firstIndex = a3;
}

- (int)gatingPassTrimResult_lastIndex
{
  return self->_gatingPassTrimResult_lastIndex;
}

- (void)setGatingPassTrimResult_lastIndex:(int)a3
{
  self->_gatingPassTrimResult_lastIndex = a3;
}

- (NSData)perFrameTranslationVecs
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPerFrameTranslationVecs:(id)a3
{
}

- (NSArray)badFrameFlags
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBadFrameFlags:(id)a3
{
}

- (NSArray)focusScores
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFocusScores:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusScores, 0);
  objc_storeStrong((id *)&self->_badFrameFlags, 0);
  objc_storeStrong((id *)&self->_perFrameTranslationVecs, 0);
  objc_storeStrong((id *)&self->_defaultParameters, 0);
  objc_storeStrong((id *)&self->pregateParameters, 0);

  objc_storeStrong((id *)&self->featureBuilder, 0);
}

@end