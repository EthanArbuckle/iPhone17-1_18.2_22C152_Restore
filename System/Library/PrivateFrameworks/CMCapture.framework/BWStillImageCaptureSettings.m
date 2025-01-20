@interface BWStillImageCaptureSettings
+ (BOOL)supportsSecureCoding;
- ($2825F4736939C4A6D3AD43837233062D)cmioMaxPhotoDimensions;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTimeMachinePTS;
- (BOOL)cmioHighResolutionPhotoEnabled;
- (BOOL)deliverDeferredPhotoProxyImage;
- (BOOL)deliverOriginalImage;
- (BOOL)deliverSushiRaw;
- (BOOL)downgradedDeepFusionEnhancedResolutionCapture;
- (BOOL)expectReferenceFrameBracketedCaptureSequenceNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)produceDeferredPhotoProxyImage;
- (BWStillImageCaptureSettings)initWithCoder:(id)a3;
- (BWStillImageCaptureSettings)initWithSettingsID:(int64_t)a3 captureType:(int)a4 captureFlags:(unint64_t)a5 sceneFlags:(unint64_t)a6 frameStatisticsByPortType:(id)a7 deliverOriginalImage:(BOOL)a8 deliverSushiRaw:(BOOL)a9 captureStreamSettings:(id)a10;
- (NSArray)captureStreamSettings;
- (NSArray)portTypes;
- (NSArray)secondaryPortTypes;
- (NSString)applicationID;
- (NSString)masterPortType;
- (float)scaleFactor;
- (id)captureStreamSettingsForPortType:(id)a3;
- (id)cmioCompressedFormat;
- (id)description;
- (id)frameStatisticsByPortType;
- (id)metadata;
- (id)streamSelectorDebugInfo;
- (int)bracketedCaptureSequenceNumberForOISLongExposure;
- (int)captureType;
- (int)cmioFlashMode;
- (int)cmioQualityPrioritization;
- (int)timeMachineReferenceFrameBracketedCaptureSequenceNumber;
- (int64_t)settingsID;
- (int64_t)stillImageRequestTime;
- (unint64_t)captureFlags;
- (unint64_t)hash;
- (unint64_t)learnedNRStereoPhotoFrameFlag;
- (unint64_t)sceneFlags;
- (void)cannotProcessDeepFusionEnhancedResolution;
- (void)cannotProcessDepthPhotos;
- (void)dealloc;
- (void)disableAWBReflow;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationID:(id)a3;
- (void)setCmioCompressedFormat:(id)a3;
- (void)setCmioFlashMode:(int)a3;
- (void)setCmioHighResolutionPhotoEnabled:(BOOL)a3;
- (void)setCmioMaxPhotoDimensions:(id)a3;
- (void)setCmioQualityPrioritization:(int)a3;
- (void)setDeliverDeferredPhotoProxyImage:(BOOL)a3;
- (void)setLastTimeMachinePTS:(id *)a3;
- (void)setLearnedNRStereoPhotoFrameFlag:(unint64_t)a3;
- (void)setMasterPortType:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setProduceDeferredPhotoProxyImage:(BOOL)a3;
- (void)setScaleFactor:(float)a3;
- (void)setSceneFlags:(unint64_t)a3;
- (void)setStillImageRequestTime:(int64_t)a3;
- (void)setStreamSelectorDebugInfo:(id)a3;
- (void)setTimeMachineReferenceFrameBracketedCaptureSequenceNumber:(int)a3;
@end

@implementation BWStillImageCaptureSettings

- (unint64_t)captureFlags
{
  return self->_captureFlags;
}

- (unint64_t)learnedNRStereoPhotoFrameFlag
{
  return self->_learnedNRStereoPhotoFrameFlag;
}

- (id)metadata
{
  id result = self->_metadata;
  if (!result)
  {
    id result = objc_alloc_init(BWStillImageCaptureMetadata);
    self->_metadata = (BWStillImageCaptureMetadata *)result;
  }
  return result;
}

- (NSString)masterPortType
{
  return self->_masterPortType;
}

- (BOOL)downgradedDeepFusionEnhancedResolutionCapture
{
  return self->_downgradedDeepFusionEnhancedResolutionCapture;
}

- (int)captureType
{
  return self->_captureType;
}

- (NSArray)portTypes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  captureStreamSettings = self->_captureStreamSettings;
  uint64_t v5 = [(NSArray *)captureStreamSettings countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(captureStreamSettings);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8++), "portType"));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)captureStreamSettings countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  v9 = (void *)[v3 copy];

  return (NSArray *)v9;
}

- (id)captureStreamSettingsForPortType:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  captureStreamSettings = self->_captureStreamSettings;
  uint64_t v5 = [(NSArray *)captureStreamSettings countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(captureStreamSettings);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "portType"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSArray *)captureStreamSettings countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)setMetadata:(id)a3
{
  self->_metadata = (BWStillImageCaptureMetadata *)a3;
}

- (void)setMasterPortType:(id)a3
{
}

- (BWStillImageCaptureSettings)initWithSettingsID:(int64_t)a3 captureType:(int)a4 captureFlags:(unint64_t)a5 sceneFlags:(unint64_t)a6 frameStatisticsByPortType:(id)a7 deliverOriginalImage:(BOOL)a8 deliverSushiRaw:(BOOL)a9 captureStreamSettings:(id)a10
{
  v18.receiver = self;
  v18.super_class = (Class)BWStillImageCaptureSettings;
  uint64_t v16 = [(BWStillImageCaptureSettings *)&v18 init];
  if (v16)
  {
    if (![a10 count]) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"captureStreamSettings must have at least 1 element" userInfo:0]);
    }
    v16->_settingsID = a3;
    v16->_captureType = a4;
    v16->_captureFlags = a5;
    v16->_sceneFlags = a6;
    v16->_frameStatisticsByPortType = (BWFrameStatisticsByPortType *)a7;
    v16->_deliverOriginalImage = a8;
    v16->_deliverSushiRaw = a9;
    v16->_captureStreamSettings = (NSArray *)a10;
    v16->_cmioMaxPhotoDimensions.width = 0;
    v16->_cmioMaxPhotoDimensions.height = 0;
  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCaptureSettings;
  [(BWStillImageCaptureSettings *)&v3 dealloc];
}

- (BWStillImageCaptureSettings)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v4 = [(BWStillImageCaptureSettings *)self init];
  if (v4)
  {
    v4->_settingsID = [a3 decodeInt64ForKey:@"settingsID"];
    v4->_captureType = [a3 decodeInt32ForKey:@"captureType"];
    v4->_captureFlags = [a3 decodeInt64ForKey:@"captureFlags"];
    v4->_sceneFlags = [a3 decodeInt64ForKey:@"sceneFlags"];
    v4->_deliverOriginalImage = [a3 decodeBoolForKey:@"deliverOriginalImage"];
    v4->_deliverSushiRaw = [a3 decodeBoolForKey:@"deliverSushiRaw"];
    v4->_deliverDeferredPhotoProxyImage = [a3 decodeBoolForKey:@"deferredPhotoProxyImageKey"];
    v4->_downgradedDeepFusionEnhancedResolutionCapture = [a3 decodeBoolForKey:@"wasDeepFusionEnhancedResolutionCapture"];
    v4->_learnedNRStereoPhotoFrameFlag = [a3 decodeInt64ForKey:@"learnedNRStereoPhotoFrameFlag"];
    v4->_masterPortType = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"masterPortType"];
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    uint64_t v6 = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 2)), @"captureStreamSettings");
    v4->_captureStreamSettings = v6;
    if (![(NSArray *)v6 count]) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"captureStreamSettings must have at least 1 element" userInfo:0]);
    }
    if (!v4->_masterPortType) {
      v4->_masterPortType = (NSString *)(id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](v4->_captureStreamSettings, "objectAtIndexedSubscript:", 0), "portType");
    }
    v4->_timeMachineReferenceFrameBracketedCaptureSequenceNumber = [a3 decodeInt32ForKey:@"timeMachineReferenceFrameBracketedCaptureSequenceNumber"];
    uint64_t v7 = objc_opt_class();
    CFDictionaryRef v8 = (const __CFDictionary *)[a3 decodeDictionaryWithKeysOfClass:v7 objectsOfClass:objc_opt_class() forKey:@"lastTimeMachinePTS"];
    CMTimeMakeFromDictionary(&v11, v8);
    *(CMTime *)(&v4->_timeMachineReferenceFrameBracketedCaptureSequenceNumber + 1) = v11;
    v4->_frameStatisticsByPortType = (BWFrameStatisticsByPortType *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"frameStatisticsByPortType"];
    v4->_metadata = (BWStillImageCaptureMetadata *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"captureMetadata"];
    v4->_streamSelectorDebugInfo = (NSDictionary *)(id)[a3 decodePropertyListForKey:@"streamSelectorDebugInfo"];
    v4->_applicationID = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"applicationID"];
    v4->_stillImageRequestTime = [a3 decodeInt64ForKey:@"stillImageRequestTime"];
    [a3 decodeFloatForKey:@"scaleFactor"];
    v4->_scaleFactor = v9;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt64:self->_settingsID forKey:@"settingsID"];
  [a3 encodeInt32:self->_captureType forKey:@"captureType"];
  [a3 encodeInt64:self->_captureFlags forKey:@"captureFlags"];
  [a3 encodeInt64:self->_sceneFlags forKey:@"sceneFlags"];
  [a3 encodeBool:self->_deliverOriginalImage forKey:@"deliverOriginalImage"];
  [a3 encodeBool:self->_deliverSushiRaw forKey:@"deliverSushiRaw"];
  [a3 encodeBool:self->_deliverDeferredPhotoProxyImage forKey:@"deferredPhotoProxyImageKey"];
  [a3 encodeBool:self->_downgradedDeepFusionEnhancedResolutionCapture forKey:@"wasDeepFusionEnhancedResolutionCapture"];
  [a3 encodeInt64:self->_learnedNRStereoPhotoFrameFlag forKey:@"learnedNRStereoPhotoFrameFlag"];
  [a3 encodeObject:self->_masterPortType forKey:@"masterPortType"];
  [a3 encodeObject:self->_captureStreamSettings forKey:@"captureStreamSettings"];
  [a3 encodeInt32:self->_timeMachineReferenceFrameBracketedCaptureSequenceNumber forKey:@"timeMachineReferenceFrameBracketedCaptureSequenceNumber"];
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  *(_OWORD *)&v8.value = *(_OWORD *)(&self->_timeMachineReferenceFrameBracketedCaptureSequenceNumber + 1);
  v8.epoch = *(void *)&self->_lastTimeMachinePTS.flags;
  CFDictionaryRef v6 = CMTimeCopyAsDictionary(&v8, v5);
  [a3 encodeObject:v6 forKey:@"lastTimeMachinePTS"];

  [a3 encodeObject:self->_frameStatisticsByPortType forKey:@"frameStatisticsByPortType"];
  [a3 encodeObject:self->_metadata forKey:@"captureMetadata"];
  [a3 encodeObject:self->_streamSelectorDebugInfo forKey:@"streamSelectorDebugInfo"];
  [a3 encodeObject:self->_applicationID forKey:@"applicationID"];
  [a3 encodeInt64:self->_stillImageRequestTime forKey:@"stillImageRequestTime"];
  *(float *)&double v7 = self->_scaleFactor;
  [a3 encodeFloat:@"scaleFactor" forKey:v7];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v18) = 1;
  }
  else
  {
    uint64_t v30 = v6;
    uint64_t v31 = v5;
    uint64_t v32 = v3;
    uint64_t v33 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_25;
    }
    int64_t settingsID = self->_settingsID;
    if (settingsID != [a3 settingsID]) {
      goto LABEL_25;
    }
    int captureType = self->_captureType;
    if (captureType != [a3 captureType]) {
      goto LABEL_25;
    }
    unint64_t captureFlags = self->_captureFlags;
    if (captureFlags != [a3 captureFlags]) {
      goto LABEL_25;
    }
    unint64_t sceneFlags = self->_sceneFlags;
    if (sceneFlags != [a3 sceneFlags]) {
      goto LABEL_25;
    }
    int deliverOriginalImage = self->_deliverOriginalImage;
    if (deliverOriginalImage != [a3 deliverOriginalImage]) {
      goto LABEL_25;
    }
    int deliverSushiRaw = self->_deliverSushiRaw;
    if (deliverSushiRaw != [a3 deliverSushiRaw]) {
      goto LABEL_25;
    }
    int deliverDeferredPhotoProxyImage = self->_deliverDeferredPhotoProxyImage;
    if (deliverDeferredPhotoProxyImage != [a3 deliverDeferredPhotoProxyImage]) {
      goto LABEL_25;
    }
    int downgradedDeepFusionEnhancedResolutionCapture = self->_downgradedDeepFusionEnhancedResolutionCapture;
    if (downgradedDeepFusionEnhancedResolutionCapture != [a3 downgradedDeepFusionEnhancedResolutionCapture])goto LABEL_25; {
    unint64_t learnedNRStereoPhotoFrameFlag = self->_learnedNRStereoPhotoFrameFlag;
    }
    if (learnedNRStereoPhotoFrameFlag != [a3 learnedNRStereoPhotoFrameFlag]) {
      goto LABEL_25;
    }
    int v18 = -[BWFrameStatisticsByPortType isEqual:](self->_frameStatisticsByPortType, "isEqual:", [a3 frameStatisticsByPortType]);
    if (v18)
    {
      metadata = self->_metadata;
      if (metadata == (BWStillImageCaptureMetadata *)[a3 metadata]
        || (int v18 = -[BWStillImageCaptureMetadata isEqual:](self->_metadata, "isEqual:", [a3 metadata])) != 0)
      {
        streamSelectorDebugInfo = self->_streamSelectorDebugInfo;
        if (streamSelectorDebugInfo == (NSDictionary *)[a3 streamSelectorDebugInfo]
          || (int v18 = -[NSDictionary isEqualToDictionary:](self->_streamSelectorDebugInfo, "isEqualToDictionary:", [a3 streamSelectorDebugInfo])) != 0)
        {
          captureStreamSettings = self->_captureStreamSettings;
          if (captureStreamSettings == (NSArray *)[a3 captureStreamSettings]
            || (int v18 = -[NSArray isEqual:](self->_captureStreamSettings, "isEqual:", [a3 captureStreamSettings])) != 0)
          {
            int timeMachineReferenceFrameBracketedCaptureSequenceNumber = self->_timeMachineReferenceFrameBracketedCaptureSequenceNumber;
            if (timeMachineReferenceFrameBracketedCaptureSequenceNumber != [a3 timeMachineReferenceFrameBracketedCaptureSequenceNumber])goto LABEL_25; {
            if (a3)
            }
              [a3 lastTimeMachinePTS];
            else {
              memset(&time2, 0, sizeof(time2));
            }
            CMTime v28 = *(CMTime *)(&self->_timeMachineReferenceFrameBracketedCaptureSequenceNumber + 1);
            if (CMTimeCompare(&v28, &time2)) {
              goto LABEL_25;
            }
            applicationID = self->_applicationID;
            if (applicationID == (NSString *)[a3 applicationID]
              || (int v18 = -[NSString isEqualToString:](self->_applicationID, "isEqualToString:", [a3 applicationID])) != 0)
            {
              int64_t stillImageRequestTime = self->_stillImageRequestTime;
              if (stillImageRequestTime == [a3 stillImageRequestTime])
              {
                float scaleFactor = self->_scaleFactor;
                [a3 scaleFactor];
                LOBYTE(v18) = scaleFactor == v26;
                return v18;
              }
LABEL_25:
              LOBYTE(v18) = 0;
            }
          }
        }
      }
    }
  }
  return v18;
}

- (unint64_t)hash
{
  return self->_settingsID ^ self->_captureType ^ self->_captureFlags;
}

- (BOOL)produceDeferredPhotoProxyImage
{
  return self->_deliverDeferredPhotoProxyImage;
}

- (void)disableAWBReflow
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  self->_captureFlags &= ~0x8000000000uLL;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  captureStreamSettings = self->_captureStreamSettings;
  uint64_t v3 = [(NSArray *)captureStreamSettings countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(captureStreamSettings);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) disableAWBReflow];
      }
      uint64_t v4 = [(NSArray *)captureStreamSettings countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)cannotProcessDeepFusionEnhancedResolution
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t captureFlags = self->_captureFlags;
  if ((captureFlags & 0x200000000) != 0)
  {
    self->_int downgradedDeepFusionEnhancedResolutionCapture = 1;
    self->_unint64_t captureFlags = captureFlags & 0xFFFFFFFDFFFFFFFFLL;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    captureStreamSettings = self->_captureStreamSettings;
    uint64_t v4 = [(NSArray *)captureStreamSettings countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(captureStreamSettings);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * i) cannotProcessDeepFusionEnhancedResolution];
        }
        uint64_t v5 = [(NSArray *)captureStreamSettings countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)cannotProcessDepthPhotos
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t captureFlags = self->_captureFlags;
  if ((captureFlags & 0x800) != 0)
  {
    self->_unint64_t captureFlags = captureFlags & 0xFFFFFFFFFFFFF7FFLL;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    captureStreamSettings = self->_captureStreamSettings;
    uint64_t v4 = [(NSArray *)captureStreamSettings countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(captureStreamSettings);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * i) cannotProcessDepthPhotos];
        }
        uint64_t v5 = [(NSArray *)captureStreamSettings countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (NSArray)secondaryPortTypes
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  captureStreamSettings = self->_captureStreamSettings;
  uint64_t v5 = [(NSArray *)captureStreamSettings countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(captureStreamSettings);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend(v9, "portType"), "isEqualToString:", self->_masterPortType) & 1) == 0) {
          objc_msgSend(v3, "addObject:", objc_msgSend(v9, "portType"));
        }
      }
      uint64_t v6 = [(NSArray *)captureStreamSettings countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  long long v10 = (void *)[v3 copy];

  return (NSArray *)v10;
}

- (id)description
{
  id v3 = (void *)[MEMORY[0x1E4F28E78] string];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = BWPhotoEncoderStringFromEncodingScheme(self->_captureType);
  uint64_t v6 = BWStillImageCaptureFrameFlagsToShortString(self->_captureFlags);
  uint64_t v7 = BWStillImageCaptureFrameFlagsToShortString(self->_sceneFlags);
  [v3 appendFormat:@"<%@ %p>: type:%@, capture flags: \"%@\", scene flags: \"%@\", deliverOriginalImage:%d deliverSushiRaw:%d deliverDeferredPhotoProxyImage:%d downgradedDeepFusionEnhancedResolutionCapture:%d _learnedNRStereoPhotoFrame:%@", v4, self, v5, v6, v7, self->_deliverOriginalImage, self->_deliverSushiRaw, self->_deliverDeferredPhotoProxyImage, self->_downgradedDeepFusionEnhancedResolutionCapture, BWStillImageCaptureFrameFlagsToShortString(self->_learnedNRStereoPhotoFrameFlag)];
  if ([(NSArray *)self->_captureStreamSettings count] <= 1) {
    long long v8 = "";
  }
  else {
    long long v8 = " 0";
  }
  [v3 appendFormat:@",\nstream%s still image options: \n\t%@", v8, -[NSArray objectAtIndexedSubscript:](self->_captureStreamSettings, "objectAtIndexedSubscript:", 0)];
  if ([(NSArray *)self->_captureStreamSettings count] >= 2)
  {
    unint64_t v9 = 1;
    uint64_t v10 = 1;
    do
    {
      [v3 appendFormat:@"\nstream %u still image options: \n\t%@", v10, -[NSArray objectAtIndexedSubscript:](self->_captureStreamSettings, "objectAtIndexedSubscript:", v9)];
      unint64_t v9 = (v10 + 1);
      uint64_t v10 = v9;
    }
    while ([(NSArray *)self->_captureStreamSettings count] > v9);
  }
  return v3;
}

- (int)bracketedCaptureSequenceNumberForOISLongExposure
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  captureStreamSettings = self->_captureStreamSettings;
  uint64_t v3 = [(NSArray *)captureStreamSettings countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    uint64_t v6 = *MEMORY[0x1E4F54448];
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(captureStreamSettings);
        }
        long long v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v8, "bracketSettings"), "bracketingMode") == 3)
        {
          unint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "bracketSettings"), "oisBracketedCaptureParams"), "objectForKeyedSubscript:", v6);
          if ([v9 count])
          {
            uint64_t v10 = 0;
            while (objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v10), "intValue") != 1)
            {
              if ([v9 count] <= (unint64_t)++v10) {
                goto LABEL_11;
              }
            }
            LODWORD(v3) = v10 + 1;
            return v3;
          }
        }
LABEL_11:
        ;
      }
      uint64_t v4 = [(NSArray *)captureStreamSettings countByEnumeratingWithState:&v12 objects:v16 count:16];
      LODWORD(v3) = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (BOOL)expectReferenceFrameBracketedCaptureSequenceNumber
{
  unsigned int v3 = self->_captureType & 0xFFFFFFFE;
  NSUInteger v4 = [(NSArray *)self->_captureStreamSettings count];
  BOOL v5 = (BYTE1(self->_captureFlags) >> 5) & 1;
  if (v4 > 1) {
    LOBYTE(v5) = 1;
  }
  return v3 == 4 && v5;
}

- (id)frameStatisticsByPortType
{
  return self->_frameStatisticsByPortType;
}

- (void)setStreamSelectorDebugInfo:(id)a3
{
  self->_streamSelectorDebugInfo = (NSDictionary *)a3;
}

- (id)streamSelectorDebugInfo
{
  return self->_streamSelectorDebugInfo;
}

- (void)setCmioCompressedFormat:(id)a3
{
  cmioCompressedFormat = self->_cmioCompressedFormat;
  if (cmioCompressedFormat != a3)
  {

    self->_cmioCompressedFormat = (NSString *)a3;
  }
}

- (id)cmioCompressedFormat
{
  return self->_cmioCompressedFormat;
}

- (void)setCmioHighResolutionPhotoEnabled:(BOOL)a3
{
  self->_cmioHighResolutionPhotoEnabled = a3;
}

- (BOOL)cmioHighResolutionPhotoEnabled
{
  return self->_cmioHighResolutionPhotoEnabled;
}

- (void)setCmioFlashMode:(int)a3
{
  self->_cmioFlashMode = a3;
}

- (int)cmioFlashMode
{
  return self->_cmioFlashMode;
}

- (void)setCmioQualityPrioritization:(int)a3
{
  self->_cmioQualityPrioritization = a3;
}

- (int)cmioQualityPrioritization
{
  return self->_cmioQualityPrioritization;
}

- (void)setCmioMaxPhotoDimensions:(id)a3
{
  self->_cmioMaxPhotoDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- ($2825F4736939C4A6D3AD43837233062D)cmioMaxPhotoDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_cmioMaxPhotoDimensions;
}

- (int64_t)settingsID
{
  return self->_settingsID;
}

- (unint64_t)sceneFlags
{
  return self->_sceneFlags;
}

- (void)setSceneFlags:(unint64_t)a3
{
  self->_unint64_t sceneFlags = a3;
}

- (BOOL)deliverOriginalImage
{
  return self->_deliverOriginalImage;
}

- (BOOL)deliverSushiRaw
{
  return self->_deliverSushiRaw;
}

- (BOOL)deliverDeferredPhotoProxyImage
{
  return self->_deliverDeferredPhotoProxyImage;
}

- (void)setDeliverDeferredPhotoProxyImage:(BOOL)a3
{
  self->_int deliverDeferredPhotoProxyImage = a3;
}

- (void)setLearnedNRStereoPhotoFrameFlag:(unint64_t)a3
{
  self->_unint64_t learnedNRStereoPhotoFrameFlag = a3;
}

- (NSArray)captureStreamSettings
{
  return self->_captureStreamSettings;
}

- (int)timeMachineReferenceFrameBracketedCaptureSequenceNumber
{
  return self->_timeMachineReferenceFrameBracketedCaptureSequenceNumber;
}

- (void)setTimeMachineReferenceFrameBracketedCaptureSequenceNumber:(int)a3
{
  self->_int timeMachineReferenceFrameBracketedCaptureSequenceNumber = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTimeMachinePTS
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[4].var0 + 4);
  retstr->var3 = *(int64_t *)((char *)&self[4].var3 + 4);
  return self;
}

- (void)setLastTimeMachinePTS:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_lastTimeMachinePTS.flags = a3->var3;
  *(_OWORD *)(&self->_timeMachineReferenceFrameBracketedCaptureSequenceNumber + 1) = v3;
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (void)setApplicationID:(id)a3
{
}

- (int64_t)stillImageRequestTime
{
  return self->_stillImageRequestTime;
}

- (void)setStillImageRequestTime:(int64_t)a3
{
  self->_int64_t stillImageRequestTime = a3;
}

- (float)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(float)a3
{
  self->_float scaleFactor = a3;
}

- (void)setProduceDeferredPhotoProxyImage:(BOOL)a3
{
  self->_produceDeferredPhotoProxyImage = a3;
}

@end