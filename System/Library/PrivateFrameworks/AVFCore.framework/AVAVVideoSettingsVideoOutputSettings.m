@interface AVAVVideoSettingsVideoOutputSettings
+ (BOOL)_validateVideoCompressionProperties:(id)a3 againstSupportedPropertyDictionary:(id)a4 forCodecType:(id)a5 exceptionReason:(id *)a6;
+ (id)_videoOutputSettingsWithVideoSettingsDictionary:(id)a3 exceptionReason:(id *)a4;
+ (id)eligibleOutputSettingsDictionaryKeys;
- (AVAVVideoSettingsVideoOutputSettings)initWithAVVideoSettingsDictionary:(id)a3 exceptionReason:(id *)a4;
- (AVAVVideoSettingsVideoOutputSettings)initWithTrustedAVVideoSettingsDictionary:(id)a3;
- (BOOL)canFullySpecifyOutputFormatReturningReason:(id *)a3;
- (BOOL)encoderIsAvailableOnCurrentSystemReturningError:(id *)a3;
- (BOOL)shouldPrepareEncodedSampleBuffersForPaddedWrites;
- (BOOL)willYieldCompressedSamples;
- (NSDictionary)videoCompressionProperties;
- (NSDictionary)videoEncoderSpecification;
- (id)cleanApertureDictionary;
- (id)pixelAspectRatioDictionary;
- (int)height;
- (int)width;
- (unsigned)videoCodecType;
- (void)dealloc;
- (void)setShouldPrepareEncodedSampleBuffersForPaddedWrites:(BOOL)a3;
@end

@implementation AVAVVideoSettingsVideoOutputSettings

+ (id)eligibleOutputSettingsDictionaryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"AVVideoCodecKey", @"AVVideoWidthKey", @"AVVideoHeightKey", @"AVVideoScalingModeKey", @"AVVideoColorPropertiesKey", @"AVVideoAllowWideColorKey", @"AVVideoCompressionPropertiesKey", @"AVVideoPixelAspectRatioKey", @"AVVideoCleanApertureKey", @"AVVideoFrameRateConversionAlgorithm", @"AVVideoMinimumFrameDuration", @"AVVideoEmitSequencesAtSyncFramesOnly", @"AVVideoMinimumIntervalForSyncFrames", @"AVVideoAverageIntervalForSyncFramesKey", 0);
}

+ (id)_videoOutputSettingsWithVideoSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAVVideoSettingsDictionary:a3 exceptionReason:a4];
  return v4;
}

+ (BOOL)_validateVideoCompressionProperties:(id)a3 againstSupportedPropertyDictionary:(id)a4 forCodecType:(id)a5 exceptionReason:(id *)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = (id)[a3 allKeys];
  v8 = (void *)[obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    uint64_t v10 = *(void *)v37;
    uint64_t v33 = *MEMORY[0x1E4F45320];
    uint64_t v32 = *MEMORY[0x1E4F45318];
    uint64_t v31 = *MEMORY[0x1E4F45310];
    uint64_t v30 = *MEMORY[0x1E4F452E8];
    uint64_t v28 = *MEMORY[0x1E4F452F0];
    v27 = a6;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v37 != v10) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v36 + 1) + 8 * v11);
      if (![a5 isEqualToString:@"jpeg"]
        || ([v12 isEqualToString:@"AverageBitRate"] & 1) == 0
        && ([v12 isEqualToString:@"MaxKeyFrameInterval"] & 1) == 0)
      {
        v13 = (void *)[a4 objectForKey:v12];
        uint64_t v14 = [a3 objectForKey:v12];
        if (!v13)
        {
          v8 = (void *)[NSString stringWithFormat:@"Compression property %@ is not supported for video codec type %@", v12, a5, v26];
          goto LABEL_35;
        }
        v15 = (void *)v14;
        uint64_t v16 = [v13 objectForKey:v33];
        uint64_t v17 = [v13 objectForKey:v32];
        if (v16 | v17)
        {
          v18 = (void *)v17;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v8 = (void *)[NSString stringWithFormat:@"Video codec type %@ expects a value for compression property %@ in a particular numeric range, but property value %@ is not numeric", a5, v12, v15];
            goto LABEL_35;
          }
          if (v16 && [(id)v16 compare:v15] == 1)
          {
            v8 = (void *)[NSString stringWithFormat:@"Video codec type %@ does not allow values for %@ that are numerically less than %@", a5, v12, v16];
            goto LABEL_35;
          }
          if (v18 && [v18 compare:v15] == -1)
          {
            v8 = (void *)[NSString stringWithFormat:@"Video codec type %@ does not allow values for %@ that are numerically greater than %@", a5, v12, v18];
            goto LABEL_35;
          }
        }
        v19 = (void *)[v13 objectForKey:v31];
        if (v19)
        {
          v20 = v19;
          if (([v19 containsObject:v15] & 1) == 0)
          {
            v8 = (void *)[NSString stringWithFormat:@"For compression property %@, video codec type %@ only allows the following values: %@", v12, a5, objc_msgSend(v20, "componentsJoinedByString:", @", ")];
            goto LABEL_35;
          }
        }
        v21 = (void *)[v13 objectForKey:v30];
        if (v21)
        {
          if ([v21 isEqualToString:v28])
          {
            uint64_t v22 = [v13 objectForKey:@"av_kVTPropertyInitialValueKey"];
            if (v22)
            {
              uint64_t v23 = v22;
              if (([v15 isEqual:v22] & 1) == 0) {
                break;
              }
            }
          }
        }
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
        v8 = 0;
        BOOL v24 = 1;
        a6 = v27;
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_26;
      }
    }
    v8 = (void *)[NSString stringWithFormat:@"For compression property %@, video codec type %@ only allows the value %@", v12, a5, v23];
LABEL_35:
    BOOL v24 = 0;
    a6 = v27;
    if (v27) {
      goto LABEL_27;
    }
  }
  else
  {
    BOOL v24 = 1;
LABEL_26:
    if (a6) {
LABEL_27:
    }
      *a6 = v8;
  }
  return v24;
}

- (AVAVVideoSettingsVideoOutputSettings)initWithAVVideoSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  v59 = 0;
  v7 = [(AVVideoOutputSettings *)self initWithVideoSettingsDictionary:a3 exceptionReason:&v59];
  v8 = v7;
  if (!a3)
  {
    v51 = v7;
    v57 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, @"invalid parameter not satisfying: %s", v52, v53, v54, v55, v56, (uint64_t)"avVideoSettingsDictionary != nil"), 0 reason userInfo];
    objc_exception_throw(v57);
  }
  if (!v7) {
    goto LABEL_121;
  }
  uint64_t v9 = [a3 objectForKey:@"AVVideoCodecKey"];
  uint64_t v10 = (void *)v9;
  if (!v9) {
    v59 = @"AVVideoSettings dictionary must contain AVVideoCodecKey";
  }
  BOOL v11 = v9 == 0;
  v12 = (void *)[a3 objectForKey:@"AVVideoWidthKey"];
  uint64_t v13 = [a3 objectForKey:@"AVVideoHeightKey"];
  uint64_t v14 = (void *)v13;
  if (v12) {
    int v15 = v11;
  }
  else {
    int v15 = 1;
  }
  if (v13) {
    int v15 = 1;
  }
  if (v10) {
    int v16 = v15;
  }
  else {
    int v16 = 0;
  }
  if (v12) {
    int v17 = 0;
  }
  else {
    int v17 = v16;
  }
  if (!v13) {
    int v17 = 0;
  }
  int v18 = v16 ^ v17;
  if ((v17 & 1) != 0 || !v15)
  {
    v19 = @"AVVideoSettings dictionary must specify a height if it specifies a width";
    if (v17) {
      v19 = @"AVVideoSettings dictionary must specify a width if it specifies a height";
    }
    v59 = v19;
  }
  if (v12) {
    int v20 = v16 ^ v17;
  }
  else {
    int v20 = 0;
  }
  if (v20 == 1)
  {
    if ([v12 integerValue] <= 0)
    {
      BOOL v24 = @"AVVideoSettings dictionary must specify a positive width";
LABEL_40:
      v59 = v24;
      goto LABEL_41;
    }
    int v18 = 1;
  }
  if (v18) {
    BOOL v21 = v14 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  if (!v21 && [v14 integerValue] <= 0)
  {
    BOOL v24 = @"AVVideoSettings dictionary must specify a positive height";
    goto LABEL_40;
  }
  if (v18)
  {
    id v60 = 0;
    id v58 = 0;
    int v22 = AVVideoOutputSettingsExtractPixelAspectRatioAndCleanApertureFromAVVideoSettingsDictionary(a3, v12, v14, &v60, &v58, &v59);
    v8->_VTPixelAspectRatioDictionary = (NSDictionary *)[v60 copy];
    v8->_VTCleanApertureDictionary = (NSDictionary *)[v58 copy];
    [MEMORY[0x1E4F1CA60] dictionary];
    id v23 = 0;
    if (v10 && v22)
    {
      AVOSTypeForString(v10);
      [v12 integerValue];
      [v14 integerValue];
      id v60 = 0;
      FigSharedRemote_CopyVideoCompressorSupportedPropertyDictionary();
      id v23 = v60;
      int v22 = 1;
    }
    goto LABEL_42;
  }
LABEL_41:
  [MEMORY[0x1E4F1CA60] dictionary];
  int v22 = 0;
  id v23 = 0;
LABEL_42:
  uint64_t v25 = [a3 objectForKey:@"AVVideoScalingModeKey"];
  uint64_t v26 = (void *)[(id)objc_opt_class() _validValuesForScalingMode];
  if (v22 && v25)
  {
    v27 = v26;
    if ([v26 containsObject:v25])
    {
      int v22 = 1;
    }
    else
    {
      int v22 = 0;
      v59 = (__CFString *)[NSString stringWithFormat:@"Value for AVVideoScalingModeKey must be one of: %@", objc_msgSend((id)objc_msgSend(v27, "allObjects"), "componentsJoinedByString:", @", ")];
    }
  }
  uint64_t v28 = (void *)[a3 objectForKey:@"AVVideoColorPropertiesKey"];
  v29 = v28;
  if (v22)
  {
    if (v28)
    {
      int v22 = AVVideoOutputSettingsValidateVideoColorProperties(v28, &v59);
      if (v22)
      {
        if (v23) {
          int v22 = [(id)objc_opt_class() _validateVideoCompressionProperties:v29 againstSupportedPropertyDictionary:v23 forCodecType:v10 exceptionReason:&v59];
        }
      }
    }
  }
  uint64_t v30 = [a3 objectForKey:@"AVVideoAllowWideColorKey"];
  if (v22 && v30)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v22 = 1;
    }
    else
    {
      int v22 = 0;
      v59 = @"Dictionary for AVVideoAllowWideColorKey must be an NSNumber";
    }
  }
  CFDictionaryRef v31 = (const __CFDictionary *)[a3 objectForKey:@"AVVideoMinimumFrameDuration"];
  if (v22 && v31) {
    int v22 = AVVideoOutputSettingsValidateMinimumFrameDuration(v31, &v59);
  }
  uint64_t v32 = (void *)[a3 objectForKey:@"AVVideoFrameRateConversionAlgorithm"];
  if (v22 && v32) {
    int v22 = AVVideoOutputSettingsValidateFrameRateConversionAlgorithm(v32, &v59);
  }
  uint64_t v33 = (void *)[a3 objectForKey:@"AVVideoEmitSequencesAtSyncFramesOnly"];
  if (v22 && v33) {
    int v22 = AVVideoOutputSettingsValidateEmitSequencesAtSyncFramesOnly(v33, &v59);
  }
  CFDictionaryRef v34 = (const __CFDictionary *)[a3 objectForKey:@"AVVideoMinimumIntervalForSyncFrames"];
  if (v22 && v34) {
    int v22 = AVVideoOutputSettingsValidateMinimumFrameDuration(v34, &v59);
  }
  uint64_t v35 = [a3 objectForKey:@"AVVideoCompressionPropertiesKey"];
  if (!v22 || !v35)
  {
    if (v22) {
      goto LABEL_121;
    }
    goto LABEL_120;
  }
  long long v36 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v35];
  [v36 removeObjectForKey:@"AVVideoPixelAspectRatioKey"];
  [v36 removeObjectForKey:@"AVVideoCleanApertureKey"];
  long long v37 = (void *)[v36 objectForKey:@"AverageBitRate"];
  if (v37 && [v37 integerValue] <= 0)
  {
    int v38 = 0;
    v59 = @"AVVideoCompressionPropertiesKey dictionary must specify a positive value for AVVideoAverageBitRateKey";
  }
  else
  {
    int v38 = 1;
  }
  long long v39 = (void *)[v36 objectForKey:@"Quality"];
  if (v38 && v39)
  {
    [v39 floatValue];
    if (v40 < 0.0 || v40 > 1.0)
    {
      int v38 = 0;
      v59 = @"AVVideoCompressionPropertiesKey dictionary must specify a value between 0.0 and 1.0 for AVVideoQualityKey";
    }
    else
    {
      int v38 = 1;
    }
  }
  uint64_t v41 = (void *)[v36 objectForKey:@"MaxKeyFrameIntervalDuration"];
  if (v38 && v41)
  {
    [v41 doubleValue];
    if (v42 >= 0.0)
    {
      int v38 = 1;
    }
    else
    {
      int v38 = 0;
      v59 = @"AVVideoCompressionPropertiesKey dictionary must specify a non-negative value for AVVideoMaxKeyFrameIntervalDurationKey";
    }
  }
  v43 = (void *)[v36 objectForKey:@"MaxKeyFrameInterval"];
  if (v38 && v43)
  {
    if ([v43 integerValue] <= 0)
    {
      int v38 = 0;
      v59 = @"AVVideoCompressionPropertiesKey dictionary must specify a positive value for AVVideoMaxKeyFrameIntervalKey";
    }
    else
    {
      int v38 = 1;
    }
  }
  uint64_t v44 = [v36 objectForKey:@"H264EntropyMode"];
  if (v38 && v44)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v38 = 1;
    }
    else
    {
      int v38 = 0;
      v59 = @"Value for AVVideoH264EntropyModeKey must be an instance of NSString";
    }
  }
  uint64_t v45 = [v36 objectForKey:@"ExpectedFrameRate"];
  if (v38 && v45)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v38 = 1;
    }
    else
    {
      int v38 = 0;
      v59 = @"Value for AVVideoExpectedSourceFrameRateKey must be an instance of NSNumber";
    }
  }
  uint64_t v46 = [v36 objectForKey:@"AllowFrameReordering"];
  if (v38 && v46)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v38 = 1;
    }
    else
    {
      int v38 = 0;
      v59 = @"Value for AVVideoAllowFrameReorderingKey must be an instance of NSNumber";
    }
  }
  uint64_t v47 = [v36 objectForKey:@"AverageNonDroppableFrameRate"];
  if (v38)
  {
    if (v47)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v59 = @"Value for AVVideoAverageNonDroppableFrameRateKey must be an instance of NSNumber";
        v8->_adaptedVideoCompressionProperties = (NSDictionary *)[v36 copy];
        goto LABEL_120;
      }
    }
  }
  if (v23) {
    int v48 = v38;
  }
  else {
    int v48 = 0;
  }
  if (v48 == 1)
  {
    char v49 = [(id)objc_opt_class() _validateVideoCompressionProperties:v36 againstSupportedPropertyDictionary:v23 forCodecType:v10 exceptionReason:&v59];
    v8->_adaptedVideoCompressionProperties = (NSDictionary *)[v36 copy];
    if (v49) {
      goto LABEL_121;
    }
LABEL_120:

    v8 = 0;
    goto LABEL_121;
  }
  v8->_adaptedVideoCompressionProperties = (NSDictionary *)[v36 copy];
  if ((v38 & 1) == 0) {
    goto LABEL_120;
  }
LABEL_121:
  if (a4) {
    *a4 = v59;
  }
  return v8;
}

- (AVAVVideoSettingsVideoOutputSettings)initWithTrustedAVVideoSettingsDictionary:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AVAVVideoSettingsVideoOutputSettings;
  v4 = [(AVVideoOutputSettings *)&v10 initWithVideoSettingsDictionary:a3 exceptionReason:0];
  id v8 = 0;
  id v9 = 0;
  AVVideoOutputSettingsExtractPixelAspectRatioAndCleanApertureFromAVVideoSettingsDictionary(a3, 0, 0, &v9, &v8, 0);
  v4->_VTPixelAspectRatioDictionary = (NSDictionary *)[v9 copy];
  v4->_VTCleanApertureDictionary = (NSDictionary *)[v8 copy];
  uint64_t v5 = [a3 objectForKey:@"AVVideoCompressionPropertiesKey"];
  if (v5)
  {
    v6 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
    [v6 removeObjectForKey:@"AVVideoPixelAspectRatioKey"];
    [v6 removeObjectForKey:@"AVVideoCleanApertureKey"];
    v4->_adaptedVideoCompressionProperties = (NSDictionary *)[v6 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAVVideoSettingsVideoOutputSettings;
  [(AVOutputSettings *)&v3 dealloc];
}

- (BOOL)willYieldCompressedSamples
{
  return 1;
}

- (BOOL)encoderIsAvailableOnCurrentSystemReturningError:(id *)a3
{
  CFArrayRef listOfVideoEncodersOut = 0;
  uint64_t v4 = [(AVAVVideoSettingsVideoOutputSettings *)self videoCodecType];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v6 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F45630], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F45638], v6);
  VTCopyVideoEncoderList(Mutable, &listOfVideoEncodersOut);
  if (CFArrayGetCount(listOfVideoEncodersOut) < 1)
  {
    BOOL v11 = 1;
    if (Mutable) {
LABEL_6:
    }
      CFRelease(Mutable);
  }
  else
  {
    CFIndex v7 = 0;
    id v8 = (const void *)*MEMORY[0x1E4F45618];
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(listOfVideoEncodersOut, v7);
      int v10 = objc_msgSend((id)CFDictionaryGetValue(ValueAtIndex, v8), "unsignedIntValue");
      BOOL v11 = v10 == v4;
      if (v10 == v4) {
        break;
      }
      ++v7;
    }
    while (v7 < CFArrayGetCount(listOfVideoEncodersOut));
    if (Mutable) {
      goto LABEL_6;
    }
  }
  if (listOfVideoEncodersOut) {
    CFRelease(listOfVideoEncodersOut);
  }
  if (!v11)
  {
    v12 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11834, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"vide", @"AVErrorMediaTypeKey", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", v4), 0), @"AVErrorMediaSubTypeKey", 0));
    if (a3) {
      *a3 = v12;
    }
  }
  return v11;
}

- (BOOL)canFullySpecifyOutputFormatReturningReason:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(AVVideoOutputSettings *)self videoSettingsDictionary];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"AVVideoCodecKey", @"AVVideoWidthKey", @"AVVideoHeightKey", 0);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (![(NSDictionary *)v4 objectForKey:v10])
        {
          uint64_t v12 = [NSString stringWithFormat:@"Missing required key %@", v10];
          if (!a3) {
            return 0;
          }
          uint64_t v13 = (void *)v12;
          BOOL result = 0;
          *a3 = v13;
          return result;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (int)width
{
  id v2 = [(NSDictionary *)[(AVOutputSettings *)self outputSettingsDictionary] objectForKey:@"AVVideoWidthKey"];
  if (v2) {
    LODWORD(v2) = [v2 integerValue];
  }
  return (int)v2;
}

- (int)height
{
  id v2 = [(NSDictionary *)[(AVOutputSettings *)self outputSettingsDictionary] objectForKey:@"AVVideoHeightKey"];
  if (v2) {
    LODWORD(v2) = [v2 integerValue];
  }
  return (int)v2;
}

- (id)pixelAspectRatioDictionary
{
  return self->_VTPixelAspectRatioDictionary;
}

- (id)cleanApertureDictionary
{
  return self->_VTCleanApertureDictionary;
}

- (unsigned)videoCodecType
{
  id v2 = [(NSDictionary *)[(AVOutputSettings *)self outputSettingsDictionary] objectForKey:@"AVVideoCodecKey"];
  if (v2)
  {
    LODWORD(v2) = AVOSTypeForString(v2);
  }
  return v2;
}

- (NSDictionary)videoEncoderSpecification
{
  return 0;
}

- (NSDictionary)videoCompressionProperties
{
  objc_super v3 = [(AVOutputSettings *)self outputSettingsDictionary];
  uint64_t v4 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->_adaptedVideoCompressionProperties];
  if (objc_msgSend(-[NSDictionary objectForKey:](v3, "objectForKey:", @"AVVideoCodecKey"), "isEqualToString:", @"jpeg")&& !-[NSDictionary objectForKey:](v4, "objectForKey:", @"Quality"))
  {
    LODWORD(v5) = 1053609165;
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithFloat:v5];
    [(NSDictionary *)v4 setObject:v6 forKey:*MEMORY[0x1E4F44AB0]];
  }
  uint64_t v7 = [(NSDictionary *)v3 objectForKey:@"AVVideoColorPropertiesKey"];
  if (v7) {
    [(NSDictionary *)v4 addEntriesFromDictionary:v7];
  }
  VTPixelAspectRatioDictionary = self->_VTPixelAspectRatioDictionary;
  if (VTPixelAspectRatioDictionary) {
    [(NSDictionary *)v4 setObject:VTPixelAspectRatioDictionary forKey:*MEMORY[0x1E4F44A60]];
  }
  VTCleanApertureDictionary = self->_VTCleanApertureDictionary;
  if (VTCleanApertureDictionary) {
    [(NSDictionary *)v4 setObject:VTCleanApertureDictionary forKey:*MEMORY[0x1E4F44858]];
  }
  return v4;
}

- (BOOL)shouldPrepareEncodedSampleBuffersForPaddedWrites
{
  return self->_shouldPrepareEncodedSampleBuffersForPaddedWrites;
}

- (void)setShouldPrepareEncodedSampleBuffersForPaddedWrites:(BOOL)a3
{
  self->_shouldPrepareEncodedSampleBuffersForPaddedWrites = a3;
}

@end