@interface BWStillImageCaptureStreamSettings
+ (BOOL)supportsSecureCoding;
- ($08FEEAFA44411076A5953C2803702ABC)expectedFrameCaptureCounts;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adaptiveBracketingLastFramePTS;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredTimeMachinePTS;
- (BOOL)expectPreBracketFrame;
- (BOOL)hasValidFrames;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFrameCapturedForProcessing:(opaqueCMSampleBuffer *)a3;
- (BOOL)isSensorRawCapture;
- (BOOL)isUnifiedBracketingErrorRecoveryFrame:(opaqueCMSampleBuffer *)a3 isReferenceFrame:(BOOL)a4;
- (BOOL)isYUVCapture;
- (BOOL)lensStabilizationEnabledForClientBracket;
- (BOOL)reachedEndOfAdaptiveBracketing;
- (BOOL)sensorRawCapturedForFinalImageProcessing;
- (BWBracketSettings)bracketSettings;
- (BWStillImageCaptureStreamSettings)initWithCoder:(id)a3;
- (BWStillImageCaptureStreamSettings)initWithPortType:(id)a3 captureType:(int)a4 captureFlags:(unint64_t)a5 adaptiveBracketingParameters:(id)a6 sphereOffsets:(id)a7;
- (BWStillImageCaptureStreamSettings)initWithPortType:(id)a3 captureType:(int)a4 captureFlags:(unint64_t)a5 referenceFrameIndex:(int)a6 timeMachineBracketedCaptureParams:(id)a7 preBracketFrameCaptureParams:(id)a8 unifiedBracketedCaptureParams:(id)a9 frameInfos:(id)a10;
- (BWStillImageCaptureStreamSettings)initWithPortType:(id)a3 captureType:(int)a4 captureFlags:(unint64_t)a5 timeMachineFrameCount:(int)a6 bracketSettings:(id)a7 validBracketedCaptureSequenceNumbers:(id)a8;
- (NSArray)validBracketedCaptureSequenceNumbers;
- (NSString)portType;
- (NSString)sensorIDString;
- (id)adaptiveBracketingParameters;
- (id)adaptiveBracketingSphereOffsetsForNextGroupWithFrameCount:(int)a3;
- (id)adaptivePreBracketFrameCaptureParams;
- (id)adaptiveUnifiedBracketedCaptureParams;
- (id)captureFrameInfoForFrame:(opaqueCMSampleBuffer *)a3;
- (id)captureFrameInfos;
- (id)description;
- (id)preBracketFrameCaptureParams;
- (id)timeMachineBracketedCaptureParams;
- (id)unifiedBracketedCaptureParams;
- (int)adaptiveBracketingGroupCaptureCount;
- (int)captureType;
- (int)currentExpectedAdaptiveBracketedFrameCaptureCount;
- (int)expectedAdaptiveBracketedFrameCaptureCountUsingGroup:(int)a3;
- (int)expectedEVZeroFrameCount;
- (int)expectedFrameCaptureCount;
- (int)expectedFrameCount;
- (int)expectedLongFrameCount;
- (int)expectedReferenceFrameCandidateCount;
- (int)expectedTimeMachineFrameCaptureCount;
- (int)expectedUltraHighResFrameCaptureCount;
- (int)qsubResolutionFlavor;
- (int)referenceFrameIndex;
- (int)timeMachineFrameCount;
- (int)timeMachineReferenceFrameIndex;
- (uint64_t)_expectedFrameCaptureCountForFrameParams:(uint64_t)a1;
- (unint64_t)captureFlags;
- (unint64_t)hash;
- (void)addAdaptiveUnifiedBracketedCaptureParams:(id)a3 preBracketFrameCaptureParams:(id)a4 bracketedCaptureFrameInfos:(id)a5;
- (void)cannotProcessDeepFusionEnhancedResolution;
- (void)cannotProcessDepthPhotos;
- (void)dealloc;
- (void)disableAWBReflow;
- (void)encodeWithCoder:(id)a3;
- (void)setAdaptiveBracketingLastFramePTS:(id *)a3;
- (void)setLensStabilizationEnabledForClientBracket:(BOOL)a3;
- (void)setPreferredTimeMachinePTS:(id *)a3;
- (void)setReachedEndOfAdaptiveBracketing:(BOOL)a3;
- (void)setSensorIDString:(id)a3;
@end

@implementation BWStillImageCaptureStreamSettings

- (void)setSensorIDString:(id)a3
{
}

- (NSString)sensorIDString
{
  return self->_sensorIDString;
}

- (int)qsubResolutionFlavor
{
  unint64_t captureFlags = self->_captureFlags;
  if ((captureFlags & 0x100000000) != 0) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }
  if ((captureFlags & 0x10) != 0) {
    return v3;
  }
  else {
    return 0;
  }
}

- (NSString)portType
{
  return self->_portType;
}

- (BWStillImageCaptureStreamSettings)initWithPortType:(id)a3 captureType:(int)a4 captureFlags:(unint64_t)a5 timeMachineFrameCount:(int)a6 bracketSettings:(id)a7 validBracketedCaptureSequenceNumbers:(id)a8
{
  v16.receiver = self;
  v16.super_class = (Class)BWStillImageCaptureStreamSettings;
  v14 = [(BWStillImageCaptureStreamSettings *)&v16 init];
  if (v14)
  {
    v14->_portType = (NSString *)a3;
    v14->_captureType = a4;
    v14->_unint64_t captureFlags = a5;
    v14->_timeMachineFrameCount = a6;
    v14->_bracketSettings = (BWBracketSettings *)a7;
    v14->_validBracketedCaptureSequenceNumbers = (NSArray *)a8;
    v14->_referenceFrameIndex = -1;
  }
  return v14;
}

- (BWStillImageCaptureStreamSettings)initWithPortType:(id)a3 captureType:(int)a4 captureFlags:(unint64_t)a5 referenceFrameIndex:(int)a6 timeMachineBracketedCaptureParams:(id)a7 preBracketFrameCaptureParams:(id)a8 unifiedBracketedCaptureParams:(id)a9 frameInfos:(id)a10
{
  uint64_t v13 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v16 = [a7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    LODWORD(v18) = 0;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(a7);
        }
        uint64_t v18 = -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, *(void **)(*((void *)&v25 + 1) + 8 * i))+ v18;
      }
      uint64_t v17 = [a7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v17);
  }
  else
  {
    uint64_t v18 = 0;
  }
  v21 = [(BWStillImageCaptureStreamSettings *)self initWithPortType:a3 captureType:v13 captureFlags:a5 timeMachineFrameCount:v18 bracketSettings:0 validBracketedCaptureSequenceNumbers:0];
  v22 = v21;
  if (v21)
  {
    v21->_referenceFrameIndex = a6;
    v21->_timeMachineBracketedCaptureParams = (NSArray *)a7;
    v22->_preBracketFrameCaptureParams = (NSDictionary *)a8;
    v22->_unifiedBracketedCaptureParams = (NSArray *)a9;
    v22->_captureFrameInfos = (NSArray *)a10;
  }
  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCaptureStreamSettings;
  [(BWStillImageCaptureStreamSettings *)&v3 dealloc];
}

- (BWStillImageCaptureStreamSettings)initWithCoder:(id)a3
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v4 = [(BWStillImageCaptureStreamSettings *)self init];
  if (v4)
  {
    v4->_portType = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"portType"];
    v4->_sensorIDString = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"sensorIDString"];
    v4->_captureType = [a3 decodeInt32ForKey:@"captureType"];
    v4->_unint64_t captureFlags = [a3 decodeInt64ForKey:@"captureFlags"];
    v4->_timeMachineFrameCount = [a3 decodeInt32ForKey:@"timeMachineFrameCount"];
    v4->_bracketSettings = (BWBracketSettings *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"bracketSettings"];
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v4->_validBracketedCaptureSequenceNumbers = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"validBracketedCaptureSequenceNumbers");
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    CFDictionaryRef v10 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0), @"preferredTimeMachinePTS");
    CMTimeMakeFromDictionary(&v16, v10);
    v4->_preferredTimeMachinePTS = ($95D729B680665BEAEFA1D6FCA8238556)v16;
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    uint64_t v12 = objc_msgSend(v11, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 4));
    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    uint64_t v14 = objc_msgSend(v13, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 2));
    v4->_referenceFrameIndex = [a3 decodeInt32ForKey:@"referenceFrameIndex"];
    v4->_timeMachineBracketedCaptureParams = (NSArray *)(id)[a3 decodeObjectOfClasses:v12 forKey:@"timeMachineBracketedCaptureParams"];
    v4->_preBracketFrameCaptureParams = (NSDictionary *)(id)[a3 decodeObjectOfClasses:v12 forKey:@"preBracketFrameCaptureParams"];
    v4->_unifiedBracketedCaptureParams = (NSArray *)(id)[a3 decodeObjectOfClasses:v12 forKey:@"unifiedBracketedCaptureParams"];
    v4->_captureFrameInfos = (NSArray *)(id)[a3 decodeObjectOfClasses:v14 forKey:@"captureFrameInfos"];
    v4->_lensStabilizationEnabledForClientBracket = [a3 decodeBoolForKey:@"lensStabilizationEnabledForClientBracket"];
    v4->_adaptiveBracketingSphereOffsets = (NSArray *)(id)[a3 decodeObjectOfClasses:v12 forKey:@"adaptiveBracketingSphereOffsets"];
    v4->_adaptivePreBracketFrameCaptureParams = (NSMutableArray *)(id)[a3 decodeObjectOfClasses:v12 forKey:@"adaptivePreBracketFrameCaptureParams"];
    v4->_adaptiveUnifiedBracketedCaptureParams = (NSMutableArray *)(id)[a3 decodeObjectOfClasses:v12 forKey:@"adaptiveUnifiedBracketedCaptureParams"];
    v4->_adaptiveCaptureFrameInfos = (NSMutableArray *)(id)[a3 decodeObjectOfClasses:v14 forKey:@"adaptiveCaptureFrameInfos"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_portType forKey:@"portType"];
  [a3 encodeObject:self->_sensorIDString forKey:@"sensorIDString"];
  [a3 encodeInt32:self->_captureType forKey:@"captureType"];
  [a3 encodeInt64:self->_captureFlags forKey:@"captureFlags"];
  [a3 encodeInt32:self->_timeMachineFrameCount forKey:@"timeMachineFrameCount"];
  [a3 encodeObject:self->_bracketSettings forKey:@"bracketSettings"];
  [a3 encodeObject:self->_validBracketedCaptureSequenceNumbers forKey:@"validBracketedCaptureSequenceNumbers"];
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  $95D729B680665BEAEFA1D6FCA8238556 preferredTimeMachinePTS = self->_preferredTimeMachinePTS;
  CFDictionaryRef v6 = CMTimeCopyAsDictionary((CMTime *)&preferredTimeMachinePTS, v5);
  [a3 encodeObject:v6 forKey:@"preferredTimeMachinePTS"];

  [a3 encodeInt32:self->_referenceFrameIndex forKey:@"referenceFrameIndex"];
  [a3 encodeObject:self->_timeMachineBracketedCaptureParams forKey:@"timeMachineBracketedCaptureParams"];
  [a3 encodeObject:self->_preBracketFrameCaptureParams forKey:@"preBracketFrameCaptureParams"];
  [a3 encodeObject:self->_unifiedBracketedCaptureParams forKey:@"unifiedBracketedCaptureParams"];
  [a3 encodeObject:self->_captureFrameInfos forKey:@"captureFrameInfos"];
  [a3 encodeBool:self->_lensStabilizationEnabledForClientBracket forKey:@"lensStabilizationEnabledForClientBracket"];
  [a3 encodeObject:self->_adaptiveBracketingSphereOffsets forKey:@"adaptiveBracketingSphereOffsets"];
  [a3 encodeObject:self->_adaptivePreBracketFrameCaptureParams forKey:@"adaptivePreBracketFrameCaptureParams"];
  [a3 encodeObject:self->_adaptiveUnifiedBracketedCaptureParams forKey:@"adaptiveUnifiedBracketedCaptureParams"];
  [a3 encodeObject:self->_adaptiveCaptureFrameInfos forKey:@"adaptiveCaptureFrameInfos"];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v8) = 1;
    return v8;
  }
  uint64_t v24 = v3;
  uint64_t v25 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_29;
  }
  portType = self->_portType;
  if (portType != (NSString *)[a3 portType])
  {
    int v8 = -[NSString isEqualToString:](self->_portType, "isEqualToString:", [a3 portType]);
    if (!v8) {
      return v8;
    }
  }
  sensorIDString = self->_sensorIDString;
  if (sensorIDString != (NSString *)[a3 sensorIDString])
  {
    int v8 = -[NSString isEqualToString:](self->_sensorIDString, "isEqualToString:", [a3 sensorIDString]);
    if (!v8) {
      return v8;
    }
  }
  int captureType = self->_captureType;
  if (captureType != [a3 captureType]) {
    goto LABEL_29;
  }
  unint64_t captureFlags = self->_captureFlags;
  if (captureFlags != [a3 captureFlags]) {
    goto LABEL_29;
  }
  bracketSettings = self->_bracketSettings;
  if (bracketSettings != (BWBracketSettings *)[a3 bracketSettings])
  {
    int v8 = -[BWBracketSettings isEqual:](self->_bracketSettings, "isEqual:", [a3 bracketSettings]);
    if (!v8) {
      return v8;
    }
  }
  validBracketedCaptureSequenceNumbers = self->_validBracketedCaptureSequenceNumbers;
  if (validBracketedCaptureSequenceNumbers != (NSArray *)[a3 validBracketedCaptureSequenceNumbers])
  {
    int v8 = -[NSArray isEqual:](self->_validBracketedCaptureSequenceNumbers, "isEqual:", [a3 validBracketedCaptureSequenceNumbers]);
    if (!v8) {
      return v8;
    }
  }
  if (a3) {
    [a3 preferredTimeMachinePTS];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  $95D729B680665BEAEFA1D6FCA8238556 preferredTimeMachinePTS = self->_preferredTimeMachinePTS;
  if (CMTimeCompare((CMTime *)&preferredTimeMachinePTS, &time2)
    || (int timeMachineFrameCount = self->_timeMachineFrameCount,
        timeMachineFrameCount != [a3 timeMachineFrameCount])
    || (int referenceFrameIndex = self->_referenceFrameIndex,
        referenceFrameIndex != [a3 referenceFrameIndex]))
  {
LABEL_29:
    LOBYTE(v8) = 0;
    return v8;
  }
  timeMachineBracketedCaptureParams = self->_timeMachineBracketedCaptureParams;
  if (timeMachineBracketedCaptureParams == (NSArray *)[a3 timeMachineBracketedCaptureParams]
    || (int v8 = -[NSArray isEqual:](self->_timeMachineBracketedCaptureParams, "isEqual:", [a3 timeMachineBracketedCaptureParams])) != 0)
  {
    preBracketFrameCaptureParams = self->_preBracketFrameCaptureParams;
    if (preBracketFrameCaptureParams == (NSDictionary *)[a3 preBracketFrameCaptureParams]
      || (int v8 = -[NSDictionary isEqual:](self->_preBracketFrameCaptureParams, "isEqual:", [a3 preBracketFrameCaptureParams])) != 0)
    {
      unifiedBracketedCaptureParams = self->_unifiedBracketedCaptureParams;
      if (unifiedBracketedCaptureParams == (NSArray *)[a3 unifiedBracketedCaptureParams]
        || (int v8 = -[NSArray isEqual:](self->_unifiedBracketedCaptureParams, "isEqual:", [a3 unifiedBracketedCaptureParams])) != 0)
      {
        captureFrameInfos = self->_captureFrameInfos;
        if (captureFrameInfos == *((NSArray **)a3 + 14)
          || (int v8 = -[NSArray isEqual:](captureFrameInfos, "isEqual:")) != 0)
        {
          int lensStabilizationEnabledForClientBracket = self->_lensStabilizationEnabledForClientBracket;
          LOBYTE(v8) = lensStabilizationEnabledForClientBracket == [a3 lensStabilizationEnabledForClientBracket];
        }
      }
    }
  }
  return v8;
}

- (unint64_t)hash
{
  return [(NSString *)self->_portType hash] ^ self->_captureType ^ self->_captureFlags;
}

- (BOOL)hasValidFrames
{
  if (self->_captureFrameInfos) {
    return [(BWStillImageCaptureStreamSettings *)self expectedFrameCount] > 0;
  }
  validBracketedCaptureSequenceNumbers = self->_validBracketedCaptureSequenceNumbers;
  return !validBracketedCaptureSequenceNumbers || [(NSArray *)validBracketedCaptureSequenceNumbers count] != 0;
}

- (int)expectedFrameCount
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_captureFrameInfos count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    captureFrameInfos = self->_captureFrameInfos;
    uint64_t v4 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (!v4) {
      return 0;
    }
    uint64_t v5 = v4;
    int timeMachineFrameCount = 0;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(captureFrameInfos);
        }
        uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)([v9 mainFlags] & 0x5000000000000000));
        v10.i16[0] = vaddlv_u8(v10);
        __int32 v11 = v10.i32[0];
        uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)([v9 sifrFlags] & 0x5000000000000000));
        v12.i16[0] = vaddlv_u8(v12);
        timeMachineFrameCount += v11 + v12.i32[0];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          timeMachineFrameCount += [v9 isNoLongErrorRecoveryFrame];
        }
      }
      uint64_t v5 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v5);
    return timeMachineFrameCount;
  }
  int timeMachineFrameCount = self->_timeMachineFrameCount;
  bracketSettings = self->_bracketSettings;
  if (bracketSettings)
  {
    BOOL v14 = [(BWBracketSettings *)bracketSettings providePreBracketedEV0];
    timeMachineFrameCount += v14 + [(BWBracketSettings *)self->_bracketSettings bracketFrameCount];
    return timeMachineFrameCount;
  }
  unifiedBracketedCaptureParams = self->_unifiedBracketedCaptureParams;
  if (unifiedBracketedCaptureParams)
  {
    if (self->_preBracketFrameCaptureParams)
    {
      int v17 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_preBracketFrameCaptureParams, "objectForKeyedSubscript:", *MEMORY[0x1E4F54FB8]), "BOOLValue");
      validBracketedCaptureSequenceNumbers = self->_validBracketedCaptureSequenceNumbers;
      if (validBracketedCaptureSequenceNumbers)
      {
        if ((v17 & 1) == 0)
        {
          int v19 = [(NSArray *)validBracketedCaptureSequenceNumbers containsObject:&unk_1EFAFDE48];
          goto LABEL_28;
        }
LABEL_27:
        int v19 = 0;
LABEL_28:
        timeMachineFrameCount += v19;
        if ([(NSArray *)self->_unifiedBracketedCaptureParams count])
        {
          unint64_t v20 = 0;
          LODWORD(v21) = 0;
          uint64_t v22 = *MEMORY[0x1E4F55050];
          do
          {
            if (objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_unifiedBracketedCaptureParams, "objectAtIndexedSubscript:", v20), "objectForKeyedSubscript:", v22), "intValue") == 1)uint64_t v21 = v21; {
            else
            }
              uint64_t v21 = (v21 + 1);
            timeMachineFrameCount += -[NSArray containsObject:](self->_validBracketedCaptureSequenceNumbers, "containsObject:", [NSNumber numberWithInt:v21]);
            ++v20;
          }
          while ([(NSArray *)self->_unifiedBracketedCaptureParams count] > v20);
        }
        return timeMachineFrameCount;
      }
      int v23 = v17 ^ 1;
      unifiedBracketedCaptureParams = self->_unifiedBracketedCaptureParams;
    }
    else
    {
      if (self->_validBracketedCaptureSequenceNumbers) {
        goto LABEL_27;
      }
      int v23 = 0;
    }
    timeMachineFrameCount += v23 + [(NSArray *)unifiedBracketedCaptureParams count];
    return timeMachineFrameCount;
  }
  if (!timeMachineFrameCount)
  {
    int timeMachineFrameCount = 1;
    if ((self->_captureFlags & 0x10000) != 0)
    {
      if (self->_captureType == 2) {
        return 2;
      }
      else {
        return 1;
      }
    }
  }
  return timeMachineFrameCount;
}

- (uint64_t)_expectedFrameCaptureCountForFrameParams:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    if ([a2 objectForKeyedSubscript:@"BWAdaptiveBracketingNoPreBracketFrameParams"])
    {
      return 0;
    }
    else
    {
      uint64_t v5 = *MEMORY[0x1E4F537F0];
      if ([a2 objectForKeyedSubscript:*MEMORY[0x1E4F537F0]])
      {
        v6.i32[0] = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", v5), "intValue");
        uint8x8_t v7 = (uint8x8_t)vcnt_s8(v6);
        v7.i16[0] = vaddlv_u8(v7);
        return v7.u32[0];
      }
      else
      {
        return objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F54FB8]), "BOOLValue") ^ 1;
      }
    }
  }
  return result;
}

- (int)expectedFrameCaptureCount
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(BWStillImageCaptureStreamSettings *)self expectedTimeMachineFrameCaptureCount];
  bracketSettings = self->_bracketSettings;
  if (bracketSettings)
  {
    BOOL v5 = [(BWBracketSettings *)bracketSettings providePreBracketedEV0];
    int v6 = v3 + v5 + [(BWBracketSettings *)self->_bracketSettings bracketFrameCount];
  }
  else if (self->_unifiedBracketedCaptureParams)
  {
    int v6 = -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, self->_preBracketFrameCaptureParams)+ v3;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    unifiedBracketedCaptureParams = self->_unifiedBracketedCaptureParams;
    uint64_t v12 = [(NSArray *)unifiedBracketedCaptureParams countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(unifiedBracketedCaptureParams);
          }
          v6 += -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, *(void **)(*((void *)&v16 + 1) + 8 * i));
        }
        uint64_t v13 = [(NSArray *)unifiedBracketedCaptureParams countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
  else if (v3 <= 1)
  {
    int v6 = 1;
  }
  else
  {
    int v6 = v3;
  }
  unint64_t captureFlags = self->_captureFlags;
  BOOL v8 = (captureFlags & 4) == 0 && self->_captureType == 2;
  uint64_t v9 = (captureFlags >> 16) & 1;
  if (!v8) {
    LODWORD(v9) = 0;
  }
  return v6 + v9;
}

- (int)expectedUltraHighResFrameCaptureCount
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unifiedBracketedCaptureParams = self->_unifiedBracketedCaptureParams;
  uint64_t v4 = [(NSArray *)unifiedBracketedCaptureParams countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v12;
    uint64_t v8 = *MEMORY[0x1E4F55018];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(unifiedBracketedCaptureParams);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) objectForKeyedSubscript:v8]) {
          ++v6;
        }
      }
      uint64_t v5 = [(NSArray *)unifiedBracketedCaptureParams countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }
  if ((self->_captureFlags & 0x100000000) != 0) {
    v6 += [(NSArray *)self->_timeMachineBracketedCaptureParams count];
  }
  return v6;
}

- ($08FEEAFA44411076A5953C2803702ABC)expectedFrameCaptureCounts
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_captureFrameInfos count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    obj = self->_captureFrameInfos;
    uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      int v5 = 0;
      unsigned int v6 = 0;
      uint64_t v21 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v23 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)([v8 mainFlags] & 0x3000000000000000));
          v9.i16[0] = vaddlv_u8(v9);
          __int32 v10 = v9.i32[0];
          uint64_t v11 = [v8 sifrFlags];
          uint64_t v12 = [v8 mainFlags];
          uint64_t v13 = [v8 sifrFlags];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v10 += [v8 isNoLongErrorRecoveryFrame];
          }
          uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)(v12 & 0xC000000000000000));
          v14.i16[0] = vaddlv_u8(v14);
          __int32 v15 = v14.i32[0];
          uint8x8_t v16 = (uint8x8_t)vcnt_s8((int8x8_t)(v13 & 0xC000000000000000));
          v16.i16[0] = vaddlv_u8(v16);
          v5 += v15 + v16.i32[0];
          if (self->_captureType == 1) {
            v5 += (LODWORD(self->_captureFlags) >> 11) & 1;
          }
          uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)(v11 & 0x3000000000000000));
          v17.i16[0] = vaddlv_u8(v17);
          v6 += v17.i32[0] + v10;
        }
        uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v4);
    }
    else
    {
      int v5 = 0;
      unsigned int v6 = 0;
    }
  }
  else
  {
    unsigned int v6 = [(BWStillImageCaptureStreamSettings *)self expectedFrameCaptureCount];
    int v5 = 0;
  }
  int v18 = [(BWStillImageCaptureStreamSettings *)self expectedUltraHighResFrameCaptureCount];
  unint64_t v19 = v6 | ((unint64_t)(v5 - v18) << 32);
  result.var0 = v19;
  result.var1 = HIDWORD(v19);
  result.var2 = v18;
  return result;
}

- (BOOL)expectPreBracketFrame
{
  return [(BWBracketSettings *)self->_bracketSettings providePreBracketedEV0]
      || (int)-[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, self->_preBracketFrameCaptureParams) > 0;
}

- (int)expectedTimeMachineFrameCaptureCount
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  timeMachineBracketedCaptureParams = self->_timeMachineBracketedCaptureParams;
  if (!timeMachineBracketedCaptureParams) {
    return self->_timeMachineFrameCount;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [(NSArray *)timeMachineBracketedCaptureParams countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  int v6 = 0;
  uint64_t v7 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(timeMachineBracketedCaptureParams);
      }
      v6 += -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, *(void **)(*((void *)&v10 + 1) + 8 * i));
    }
    uint64_t v5 = [(NSArray *)timeMachineBracketedCaptureParams countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v5);
  return v6;
}

- (id)description
{
  return (id)[MEMORY[0x1E4F28E78] string];
}

- (id)captureFrameInfos
{
  return self->_captureFrameInfos;
}

- (int)referenceFrameIndex
{
  return self->_referenceFrameIndex;
}

- (int)timeMachineReferenceFrameIndex
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_timeMachineBracketedCaptureParams count])
  {
    if ([(NSArray *)self->_captureFrameInfos count])
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      captureFrameInfos = self->_captureFrameInfos;
      uint64_t v4 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v11;
        while (2)
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v11 != v6) {
              objc_enumerationMutation(captureFrameInfos);
            }
            uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && ([v8 mainFlags] & 0x10) != 0) {
              return [v8 timeMachineIndex];
            }
            ++v7;
          }
          while (v5 != v7);
          uint64_t v5 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }
    }
  }
  return -1;
}

- (id)captureFrameInfoForFrame:(opaqueCMSampleBuffer *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v5 = *MEMORY[0x1E4F54328];
  if ([v4 objectForKeyedSubscript:*MEMORY[0x1E4F54328]])
  {
    int v6 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v5), "intValue");
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    captureFrameInfos = self->_captureFrameInfos;
    uint64_t v8 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(captureFrameInfos);
        }
        long long v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v6 == [v12 timeMachineIndex]) {
          return v12;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v9) {
            goto LABEL_4;
          }
          return 0;
        }
      }
    }
    return 0;
  }
  if (objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F54138]), "BOOLValue")) {
    int v13 = 0;
  }
  else {
    int v13 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F53D38]), "intValue");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint8x8_t v14 = self->_captureFrameInfos;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (!v15) {
    return 0;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v21;
LABEL_17:
  uint64_t v18 = 0;
  while (1)
  {
    if (*(void *)v21 != v17) {
      objc_enumerationMutation(v14);
    }
    long long v12 = *(void **)(*((void *)&v20 + 1) + 8 * v18);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v13 == [v12 bracketedCaptureSequenceNumber]) {
      return v12;
    }
    if (v16 == ++v18)
    {
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
      long long v12 = 0;
      if (v16) {
        goto LABEL_17;
      }
      return v12;
    }
  }
}

- (BOOL)isFrameCapturedForProcessing:(opaqueCMSampleBuffer *)a3
{
  uint64_t v5 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  int v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F541A8]), "BOOLValue");
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F54328]];
  id v8 = [(BWStillImageCaptureStreamSettings *)self captureFrameInfoForFrame:a3];
  if (v8)
  {
    uint64_t v9 = v8;
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
    long long v12 = (void *)[v5 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    int v13 = [v12 isEqualToString:*MEMORY[0x1E4F52E00]];
    int IsVersatileRaw = FigCapturePixelFormatIsVersatileRaw(PixelFormatType);
    if (IsVersatileRaw) {
      unint64_t v15 = 0x8000000000000000;
    }
    else {
      unint64_t v15 = 0x2000000000000000;
    }
    if ((IsVersatileRaw & 1) == 0 && v13)
    {
      if (BWPixelFormatIsFixedPoint(PixelFormatType)) {
        unint64_t v15 = 0x8000000000000000;
      }
      else {
        unint64_t v15 = 0x2000000000000000;
      }
    }
    if (v6) {
      uint64_t v16 = [v9 sifrFlags];
    }
    else {
      uint64_t v16 = [v9 mainFlags];
    }
    return (v16 & v15) == 0;
  }
  else if (v7 || !self->_validBracketedCaptureSequenceNumbers)
  {
    return 1;
  }
  else
  {
    if (objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F54138]), "BOOLValue")) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F53D38]), "intValue");
    }
    validBracketedCaptureSequenceNumbers = self->_validBracketedCaptureSequenceNumbers;
    uint64_t v20 = [NSNumber numberWithInt:v18];
    return [(NSArray *)validBracketedCaptureSequenceNumbers containsObject:v20];
  }
}

- (BOOL)sensorRawCapturedForFinalImageProcessing
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t captureFlags = self->_captureFlags;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(BWStillImageCaptureStreamSettings *)self captureFrameInfos];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v8 mainFlags] & 0x8000000000000000) == 0
          || ([v8 mainFlags] & 0x2000000000000000) == 0)
        {
          BOOL v9 = ([v8 mainFlags] & 0x1000000000000000) == 0;
          return v9 & (captureFlags >> 2);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v9 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 1;
  }
  return v9 & (captureFlags >> 2);
}

- (int)expectedEVZeroFrameCount
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_captureFrameInfos count])
  {
    long long v42 = 0uLL;
    long long v43 = 0uLL;
    long long v40 = 0uLL;
    long long v41 = 0uLL;
    captureFrameInfos = self->_captureFrameInfos;
    uint64_t v4 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      int v6 = 0;
      uint64_t v7 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v41 != v7) {
            objc_enumerationMutation(captureFrameInfos);
          }
          BOOL v9 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if (([v9 mainFlags] & 2) != 0)
          {
            uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)([v9 mainFlags] & 0x5000000000000000));
            v10.i16[0] = vaddlv_u8(v10);
            v6 += v10.i32[0];
          }
        }
        uint64_t v5 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v5);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    long long v38 = 0uLL;
    long long v39 = 0uLL;
    long long v36 = 0uLL;
    long long v37 = 0uLL;
    timeMachineBracketedCaptureParams = self->_timeMachineBracketedCaptureParams;
    uint64_t v12 = [(NSArray *)timeMachineBracketedCaptureParams countByEnumeratingWithState:&v36 objects:v45 count:16];
    long long v13 = (uint64_t *)MEMORY[0x1E4F55050];
    if (v12)
    {
      uint64_t v14 = v12;
      int v6 = 0;
      uint64_t v15 = *(void *)v37;
      uint64_t v16 = *MEMORY[0x1E4F55050];
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(timeMachineBracketedCaptureParams);
          }
          if (!objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * j), "objectForKeyedSubscript:", v16), "intValue"))++v6; {
        }
          }
        uint64_t v14 = [(NSArray *)timeMachineBracketedCaptureParams countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v14);
    }
    else
    {
      int v6 = 0;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obuint64_t j = self->_unifiedBracketedCaptureParams;
    uint64_t v18 = [(NSArray *)obj countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v33;
      uint64_t v21 = *v13;
      uint64_t v22 = *MEMORY[0x1E4F55290];
      uint64_t v23 = *MEMORY[0x1E4F55000];
      do
      {
        for (uint64_t k = 0; k != v19; ++k)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(obj);
          }
          long long v25 = *(void **)(*((void *)&v32 + 1) + 8 * k);
          int v26 = objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", v21), "intValue");
          int v27 = objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", v22), "intValue");
          objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", v23), "floatValue");
          if (v28 == 0.0 && (v26 | v27) == 0) {
            ++v6;
          }
        }
        uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v32 objects:v44 count:16];
      }
      while (v19);
    }
  }
  return v6;
}

- (int)expectedLongFrameCount
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)self->_captureFrameInfos count]) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  captureFrameInfos = self->_captureFrameInfos;
  uint64_t v4 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  int v6 = 0;
  uint64_t v7 = *(void *)v13;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(captureFrameInfos);
      }
      BOOL v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
      if (([v9 mainFlags] & 8) != 0)
      {
        uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)([v9 mainFlags] & 0x5000000000000000));
        v10.i16[0] = vaddlv_u8(v10);
        v6 += v10.i32[0];
      }
    }
    uint64_t v5 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v5);
  return v6;
}

- (int)expectedReferenceFrameCandidateCount
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)self->_captureFrameInfos count]) {
    return 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  captureFrameInfos = self->_captureFrameInfos;
  uint64_t v4 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  int v6 = 0;
  uint64_t v7 = *(void *)v14;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(captureFrameInfos);
      }
      BOOL v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
      if (([v9 mainFlags] & 0x100) != 0)
      {
        uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)([v9 mainFlags] & 0x5000000000000000));
        v10.i16[0] = vaddlv_u8(v10);
        v6 += v10.i32[0];
      }
      if (([v9 sifrFlags] & 0x100) != 0)
      {
        uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)([v9 sifrFlags] & 0x5000000000000000));
        v11.i16[0] = vaddlv_u8(v11);
        v6 += v11.i32[0];
      }
    }
    uint64_t v5 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v5);
  return v6;
}

- (BOOL)isYUVCapture
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)self->_captureFrameInfos count])
  {
LABEL_12:
    LOBYTE(v4) = 1;
    return v4;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  captureFrameInfos = self->_captureFrameInfos;
  uint64_t v4 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(captureFrameInfos);
      }
      id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
      if (([v8 mainFlags] & 0x3000000000000000) != 0
        || ([v8 sifrFlags] & 0x3000000000000000) != 0)
      {
        goto LABEL_12;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v10 objects:v14 count:16];
        LOBYTE(v4) = 0;
        if (v5) {
          goto LABEL_4;
        }
        return v4;
      }
    }
  }
  return v4;
}

- (BOOL)isSensorRawCapture
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_captureFrameInfos count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    captureFrameInfos = self->_captureFrameInfos;
    uint64_t v4 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(captureFrameInfos);
          }
          id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if ((unint64_t)[v8 mainFlags] >> 62
            || (unint64_t)[v8 sifrFlags] >> 62)
          {
            LOBYTE(v4) = 1;
            return v4;
          }
        }
        uint64_t v5 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v10 objects:v14 count:16];
        LOBYTE(v4) = 0;
        if (v5) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    LODWORD(v4) = (LOBYTE(self->_captureFlags) >> 2) & 1;
  }
  return v4;
}

- (id)timeMachineBracketedCaptureParams
{
  return self->_timeMachineBracketedCaptureParams;
}

- (id)preBracketFrameCaptureParams
{
  return self->_preBracketFrameCaptureParams;
}

- (id)unifiedBracketedCaptureParams
{
  return self->_unifiedBracketedCaptureParams;
}

- (void)setLensStabilizationEnabledForClientBracket:(BOOL)a3
{
  self->_int lensStabilizationEnabledForClientBracket = a3;
}

- (BOOL)lensStabilizationEnabledForClientBracket
{
  return self->_lensStabilizationEnabledForClientBracket;
}

- (void)disableAWBReflow
{
  self->_captureFlags &= ~0x8000000000uLL;
}

- (void)cannotProcessDeepFusionEnhancedResolution
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t captureFlags = self->_captureFlags;
  if ((captureFlags & 0x200000000) != 0)
  {
    self->_unint64_t captureFlags = captureFlags & 0xFFFFFFFDFFFFFFFFLL;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    unifiedBracketedCaptureParams = self->_unifiedBracketedCaptureParams;
    uint64_t v5 = [(NSArray *)unifiedBracketedCaptureParams countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      int v7 = 0;
      uint64_t v8 = *(void *)v25;
      uint64_t v9 = *MEMORY[0x1E4F55050];
      uint64_t v10 = *MEMORY[0x1E4F55018];
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(unifiedBracketedCaptureParams);
        }
        long long v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
        if (objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", v9), "intValue") != 1) {
          ++v7;
        }
        if ([v12 objectForKeyedSubscript:v10]) {
          break;
        }
        if (v6 == ++v11)
        {
          uint64_t v6 = [(NSArray *)unifiedBracketedCaptureParams countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    else
    {
      int v7 = 0;
    }
    long long v13 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    captureFrameInfos = self->_captureFrameInfos;
    uint64_t v15 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(captureFrameInfos);
          }
          uint64_t v19 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || v7 != [v19 bracketedCaptureSequenceNumber])
          {
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [(NSArray *)captureFrameInfos countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v16);
    }

    self->_captureFrameInfos = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v13];
  }
}

- (void)cannotProcessDepthPhotos
{
  self->_captureFlags &= ~0x800uLL;
}

- (BOOL)isUnifiedBracketingErrorRecoveryFrame:(opaqueCMSampleBuffer *)a3 isReferenceFrame:(BOOL)a4
{
  uint64_t v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if ((self->_captureFlags & 4) != 0)
  {
    p_adaptiveBracketingParameters = &self->_adaptiveBracketingParameters;
    if (!self->_adaptiveBracketingParameters) {
      goto LABEL_8;
    }
  }
  else
  {
    NSUInteger v7 = [(NSDictionary *)self->_preBracketFrameCaptureParams count];
    p_adaptiveBracketingParameters = &self->_adaptiveBracketingParameters;
    if (!self->_adaptiveBracketingParameters)
    {
      if (!v7) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
  }
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  uint64_t v9 = (void *)[(NSMutableArray *)self->_adaptivePreBracketFrameCaptureParams firstObject];
  char v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54FB8]), "BOOLValue");
  os_unfair_lock_unlock(&self->_adaptiveBracketingLock);
  if (v10)
  {
    if (*p_adaptiveBracketingParameters) {
      return a4;
    }
LABEL_8:
    unint64_t captureFlags = self->_captureFlags;
    if ((captureFlags & 0x100) == 0 && (captureFlags & 0x2800000) != 0) {
      return objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F54350]), "intValue") == 0;
    }
    return a4;
  }
LABEL_12:
  long long v13 = (void *)[v6 objectForKeyedSubscript:*MEMORY[0x1E4F54138]];
  return [v13 BOOLValue];
}

- (BWStillImageCaptureStreamSettings)initWithPortType:(id)a3 captureType:(int)a4 captureFlags:(unint64_t)a5 adaptiveBracketingParameters:(id)a6 sphereOffsets:(id)a7
{
  uint64_t v9 = [(BWStillImageCaptureStreamSettings *)self initWithPortType:a3 captureType:*(void *)&a4 captureFlags:a5 referenceFrameIndex:0xFFFFFFFFLL timeMachineBracketedCaptureParams:0 preBracketFrameCaptureParams:0 unifiedBracketedCaptureParams:0 frameInfos:0];
  char v10 = v9;
  if (v9)
  {
    v9->_adaptiveBracketingLock._os_unfair_lock_opaque = 0;
    v9->_adaptiveBracketingParameters = (BWAdaptiveBracketingParameters *)a6;
    v10->_adaptiveBracketingSphereOffsets = (NSArray *)a7;
  }
  return v10;
}

- (id)adaptiveBracketingParameters
{
  return self->_adaptiveBracketingParameters;
}

- (id)adaptivePreBracketFrameCaptureParams
{
  p_adaptiveBracketingLocuint64_t k = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  uint64_t v4 = (void *)[(NSMutableArray *)self->_adaptivePreBracketFrameCaptureParams copy];
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
  return v4;
}

- (id)adaptiveUnifiedBracketedCaptureParams
{
  p_adaptiveBracketingLocuint64_t k = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  uint64_t v4 = (void *)[(NSMutableArray *)self->_adaptiveUnifiedBracketedCaptureParams copy];
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
  return v4;
}

- (int)adaptiveBracketingGroupCaptureCount
{
  v2 = self;
  p_adaptiveBracketingLocuint64_t k = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  LODWORD(v2) = [(NSMutableArray *)v2->_adaptiveUnifiedBracketedCaptureParams count];
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
  return (int)v2;
}

- (int)currentExpectedAdaptiveBracketedFrameCaptureCount
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  locuint64_t k = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  adaptivePreBracketFrameCaptureParams = self->_adaptivePreBracketFrameCaptureParams;
  uint64_t v4 = [(NSMutableArray *)adaptivePreBracketFrameCaptureParams countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(adaptivePreBracketFrameCaptureParams);
        }
        v6 += -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, *(void **)(*((void *)&v29 + 1) + 8 * i));
      }
      uint64_t v5 = [(NSMutableArray *)adaptivePreBracketFrameCaptureParams countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  adaptiveUnifiedBracketedCaptureParams = self->_adaptiveUnifiedBracketedCaptureParams;
  uint64_t v10 = [(NSMutableArray *)adaptiveUnifiedBracketedCaptureParams countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(adaptiveUnifiedBracketedCaptureParams);
        }
        long long v14 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v22;
          do
          {
            for (uint64_t k = 0; k != v16; ++k)
            {
              if (*(void *)v22 != v17) {
                objc_enumerationMutation(v14);
              }
              v6 += -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, *(void **)(*((void *)&v21 + 1) + 8 * k));
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
          }
          while (v16);
        }
      }
      uint64_t v11 = [(NSMutableArray *)adaptiveUnifiedBracketedCaptureParams countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v11);
  }
  os_unfair_lock_unlock(lock);
  return v6;
}

- (int)expectedAdaptiveBracketedFrameCaptureCountUsingGroup:(int)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3 < 1) {
    return 0;
  }
  p_adaptiveBracketingLocuint64_t k = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  uint64_t v6 = 0;
  int v7 = 0;
  uint64_t v8 = a3;
  do
  {
    v7 += -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, (void *)[(NSMutableArray *)self->_adaptivePreBracketFrameCaptureParams objectAtIndexedSubscript:v6]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_adaptiveUnifiedBracketedCaptureParams, "objectAtIndexedSubscript:", v6, 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          v7 += -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, *(void **)(*((void *)&v15 + 1) + 8 * i));
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
    ++v6;
  }
  while (v6 != v8);
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
  return v7;
}

- (id)adaptiveBracketingSphereOffsetsForNextGroupWithFrameCount:(int)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_adaptiveBracketingLocuint64_t k = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  if ([(NSMutableArray *)self->_adaptiveUnifiedBracketedCaptureParams count])
  {
    unint64_t v6 = 0;
    int v7 = 0;
    do
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v8 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_adaptiveUnifiedBracketedCaptureParams, "objectAtIndexedSubscript:", v6, 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            v7 += -[BWStillImageCaptureStreamSettings _expectedFrameCaptureCountForFrameParams:]((uint64_t)self, *(void **)(*((void *)&v15 + 1) + 8 * v12++));
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }
      ++v6;
    }
    while ([(NSMutableArray *)self->_adaptiveUnifiedBracketedCaptureParams count] > v6);
  }
  else
  {
    int v7 = 0;
  }
  long long v13 = -[NSArray subarrayWithRange:](self->_adaptiveBracketingSphereOffsets, "subarrayWithRange:", v7, a3);
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
  return v13;
}

- (BOOL)reachedEndOfAdaptiveBracketing
{
  v2 = self;
  p_adaptiveBracketingLocuint64_t k = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  LOBYTE(v2) = v2->_reachedEndOfAdaptiveBracketing;
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
  return (char)v2;
}

- (void)setReachedEndOfAdaptiveBracketing:(BOOL)a3
{
  p_adaptiveBracketingLocuint64_t k = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  self->_reachedEndOfAdaptiveBracketing = a3;
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adaptiveBracketingLastFramePTS
{
  p_adaptiveBracketingLocuint64_t k = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)(&self->_reachedEndOfAdaptiveBracketing + 4);
  retstr->var3 = *(void *)&self->_adaptiveBracketingLastFramePTS.flags;
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
  return result;
}

- (void)setAdaptiveBracketingLastFramePTS:(id *)a3
{
  p_adaptiveBracketingLocuint64_t k = &self->_adaptiveBracketingLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingLock);
  long long v6 = *(_OWORD *)&a3->var0;
  *(void *)&self->_adaptiveBracketingLastFramePTS.flags = a3->var3;
  *(_OWORD *)(&self->_reachedEndOfAdaptiveBracketing + 4) = v6;
  os_unfair_lock_unlock(p_adaptiveBracketingLock);
}

- (void)addAdaptiveUnifiedBracketedCaptureParams:(id)a3 preBracketFrameCaptureParams:(id)a4 bracketedCaptureFrameInfos:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    p_adaptiveBracketingLocuint64_t k = &self->_adaptiveBracketingLock;
    os_unfair_lock_lock(&self->_adaptiveBracketingLock);
    adaptiveUnifiedBracketedCaptureParams = self->_adaptiveUnifiedBracketedCaptureParams;
    if (!adaptiveUnifiedBracketedCaptureParams)
    {
      adaptiveUnifiedBracketedCaptureParams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      self->_adaptiveUnifiedBracketedCaptureParams = adaptiveUnifiedBracketedCaptureParams;
    }
    [(NSMutableArray *)adaptiveUnifiedBracketedCaptureParams addObject:a3];

    self->_unifiedBracketedCaptureParams = (NSArray *)a3;
    adaptivePreBracketFrameCaptureParams = self->_adaptivePreBracketFrameCaptureParams;
    if (!adaptivePreBracketFrameCaptureParams)
    {
      adaptivePreBracketFrameCaptureParams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      self->_adaptivePreBracketFrameCaptureParams = adaptivePreBracketFrameCaptureParams;
    }
    id v12 = a4;
    if (!a4)
    {
      long long v14 = @"BWAdaptiveBracketingNoPreBracketFrameParams";
      v15[0] = &stru_1EFA403E0;
      id v12 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    }
    [(NSMutableArray *)adaptivePreBracketFrameCaptureParams addObject:v12];

    self->_preBracketFrameCaptureParams = (NSDictionary *)a4;
    if (a5)
    {
      adaptiveCaptureFrameInfos = self->_adaptiveCaptureFrameInfos;
      if (!adaptiveCaptureFrameInfos)
      {
        adaptiveCaptureFrameInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        self->_adaptiveCaptureFrameInfos = adaptiveCaptureFrameInfos;
      }
      [(NSMutableArray *)adaptiveCaptureFrameInfos addObject:a5];

      self->_captureFrameInfos = (NSArray *)a5;
    }
    os_unfair_lock_unlock(p_adaptiveBracketingLock);
  }
}

- (int)captureType
{
  return self->_captureType;
}

- (unint64_t)captureFlags
{
  return self->_captureFlags;
}

- (int)timeMachineFrameCount
{
  return self->_timeMachineFrameCount;
}

- (BWBracketSettings)bracketSettings
{
  return self->_bracketSettings;
}

- (NSArray)validBracketedCaptureSequenceNumbers
{
  return self->_validBracketedCaptureSequenceNumbers;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredTimeMachinePTS
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setPreferredTimeMachinePTS:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_preferredTimeMachinePTS.epoch = a3->var3;
  *(_OWORD *)&self->_preferredTimeMachinePTS.value = v3;
}

@end