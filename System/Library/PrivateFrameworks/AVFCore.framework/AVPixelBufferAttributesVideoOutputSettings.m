@interface AVPixelBufferAttributesVideoOutputSettings
+ (id)_videoOutputSettingsWithVideoSettingsDictionary:(id)a3 exceptionReason:(id *)a4;
+ (id)eligibleOutputSettingsDictionaryKeys;
- (AVPixelBufferAttributesVideoOutputSettings)initWithPixelBufferAttributes:(id)a3 exceptionReason:(id *)a4;
- (AVPixelBufferAttributesVideoOutputSettings)initWithTrustedPixelBufferAttributes:(id)a3;
- (BOOL)canFullySpecifyOutputFormatReturningReason:(id *)a3;
- (BOOL)encoderIsAvailableOnCurrentSystemReturningError:(id *)a3;
- (BOOL)willYieldCompressedSamples;
- (NSDictionary)pixelBufferAttributes;
- (NSString)fieldMode;
- (id)cleanApertureDictionary;
- (id)pixelAspectRatioDictionary;
- (int)height;
- (int)width;
- (void)dealloc;
@end

@implementation AVPixelBufferAttributesVideoOutputSettings

+ (id)eligibleOutputSettingsDictionaryKeys
{
  valid = (void *)AVVideoOutputSettingsValidPixelBufferAttributesKeys();
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"AVVideoScalingModeKey", @"AVVideoColorPropertiesKey", @"AVVideoAllowWideColorKey", @"AVVideoPixelAspectRatioKey", @"AVVideoCleanApertureKey", @"AVVideoFrameRateConversionAlgorithm", @"AVVideoDecompressionPropertiesKey", @"AVVideoMinimumFrameDuration", @"AVVideoEmitSequencesAtSyncFramesOnly", @"AVVideoMinimumIntervalForSyncFrames", @"AVVideoAverageIntervalForSyncFramesKey", 0);
  return (id)[valid setByAddingObjectsFromSet:v3];
}

+ (id)_videoOutputSettingsWithVideoSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPixelBufferAttributes:a3 exceptionReason:a4];
  return v4;
}

- (AVPixelBufferAttributesVideoOutputSettings)initWithPixelBufferAttributes:(id)a3 exceptionReason:(id *)a4
{
  v31.receiver = self;
  v31.super_class = (Class)AVPixelBufferAttributesVideoOutputSettings;
  v32 = 0;
  v6 = [(AVVideoOutputSettings *)&v31 initWithVideoSettingsDictionary:a3 exceptionReason:&v32];
  v7 = v6;
  if (a3 && v6)
  {
    v8 = (void *)[a3 objectForKey:*MEMORY[0x1E4F24E10]];
    v9 = (void *)[a3 objectForKey:*MEMORY[0x1E4F24D08]];
    if (v8 && [v8 integerValue] < 0 || v9 && objc_msgSend(v9, "integerValue") < 0)
    {
      int v10 = 0;
      v32 = @"Pixel buffer attributes width and height must be nonnegative";
    }
    else
    {
      int v10 = 1;
    }
    uint64_t v11 = [a3 objectForKey:@"AVVideoScalingModeKey"];
    v12 = (void *)[(id)objc_opt_class() _validValuesForScalingMode];
    if (v10 && v11)
    {
      v13 = v12;
      if ([v12 containsObject:v11])
      {
        int v10 = 1;
      }
      else
      {
        int v10 = 0;
        v32 = (__CFString *)[NSString stringWithFormat:@"Value for AVVideoScalingModeKey must be one of: %@", objc_msgSend((id)objc_msgSend(v13, "allObjects"), "componentsJoinedByString:", @", ")];
      }
    }
    v14 = (void *)[a3 objectForKey:@"AVVideoPixelAspectRatioKey"];
    if (v10 && v14)
    {
      id v30 = 0;
      int v10 = AVVideoOutputSettingsValidateAVPixelAspectRatioDictionaryAndReturnVTPixelAspectRatioDictionary(v14, &v30, &v32);
      v7->_VTPixelAspectRatioDictionary = (NSDictionary *)[v30 copy];
    }
    v15 = (void *)[a3 objectForKey:@"AVVideoCleanApertureKey"];
    if (v10 && v15)
    {
      id v30 = 0;
      int v10 = AVVideoOutputSettingsValidateAVCleanApertureDictionaryAndReturnVTCleanApertureDictionary(v15, v8, v9, &v30, &v32);
      v7->_VTCleanApertureDictionary = (NSDictionary *)[v30 copy];
    }
    v16 = (void *)[a3 objectForKey:@"AVVideoColorPropertiesKey"];
    if (v10 && v16) {
      int v10 = AVVideoOutputSettingsValidateVideoColorProperties(v16, &v32);
    }
    uint64_t v17 = [a3 objectForKey:@"AVVideoAllowWideColorKey"];
    if (v10 && v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v10 = 1;
      }
      else
      {
        int v10 = 0;
        v32 = @"Dictionary for AVVideoAllowWideColorKey must be an NSNumber";
      }
    }
    CFDictionaryRef v18 = (const __CFDictionary *)[a3 objectForKey:@"AVVideoMinimumFrameDuration"];
    if (v10 && v18) {
      int v10 = AVVideoOutputSettingsValidateMinimumFrameDuration(v18, &v32);
    }
    v19 = (void *)[a3 objectForKey:@"AVVideoFrameRateConversionAlgorithm"];
    if (v10 && v19) {
      int v10 = AVVideoOutputSettingsValidateFrameRateConversionAlgorithm(v19, &v32);
    }
    v20 = (void *)[a3 objectForKey:@"AVVideoDecompressionPropertiesKey"];
    uint64_t v21 = [v20 objectForKey:*MEMORY[0x1E4F44C30]];
    if (v10)
    {
      v22 = (void *)v21;
      if (v21)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (([v22 isEqualToString:*MEMORY[0x1E4F44D10]] & 1) != 0
            || ([v22 isEqualToString:*MEMORY[0x1E4F44D30]] & 1) != 0
            || ([v22 isEqualToString:*MEMORY[0x1E4F44D18]] & 1) != 0
            || ([v22 isEqualToString:*MEMORY[0x1E4F44D28]] & 1) != 0
            || ([v22 isEqualToString:*MEMORY[0x1E4F44D20]] & 1) != 0)
          {
            int v10 = 1;
            goto LABEL_45;
          }
          v23 = @"kVTDecompressionPropertyKey_FieldMode must be one of: kVTDecompressionProperty_FieldMode_BothFields, kVTDecompressionProperty_FieldMode_TopFieldOnly, kVTDecompressionProperty_FieldMode_BottomFieldOnly, kVTDecompressionProperty_FieldMode_SingleField, or kVTDecompressionProperty_FieldMode_DeinterlaceFields";
        }
        else
        {
          v23 = @"String for kVTDecompressionPropertyKey_FieldMode must be an NSString";
        }
        int v10 = 0;
        v32 = v23;
      }
    }
LABEL_45:
    v24 = (void *)[a3 objectForKey:@"AVVideoDecompressionPropertiesKey"];
    uint64_t v25 = [v24 objectForKey:*MEMORY[0x1E4F44CA0]];
    if (v10 && v25)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v10 = 1;
      }
      else
      {
        int v10 = 0;
        v32 = @"Value for kVTDecompressionPropertyKey_PropagatePerFrameHDRDisplayMetadata must be an NSNumber";
      }
    }
    v26 = (void *)[a3 objectForKey:@"AVVideoEmitSequencesAtSyncFramesOnly"];
    if (v10 && v26) {
      int v10 = AVVideoOutputSettingsValidateEmitSequencesAtSyncFramesOnly(v26, &v32);
    }
    CFDictionaryRef v27 = (const __CFDictionary *)[a3 objectForKey:@"AVVideoMinimumIntervalForSyncFrames"];
    if (v10 && v27) {
      int v10 = AVVideoOutputSettingsValidateMinimumFrameDuration(v27, &v32);
    }
    uint64_t v28 = [a3 objectForKey:*MEMORY[0x1E4F24D40]];
    if (v10 && v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v32 = @"Value for kCVPixelBufferMetalCompatibilityKey must be an NSNumber wrapping a BOOL";
    }
    else if (v10)
    {
      goto LABEL_63;
    }

    v7 = 0;
  }
LABEL_63:
  if (a4) {
    *a4 = v32;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVPixelBufferAttributesVideoOutputSettings;
  [(AVOutputSettings *)&v3 dealloc];
}

- (AVPixelBufferAttributesVideoOutputSettings)initWithTrustedPixelBufferAttributes:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVPixelBufferAttributesVideoOutputSettings;
  v4 = [(AVVideoOutputSettings *)&v8 initWithVideoSettingsDictionary:a3 exceptionReason:0];
  v5 = (void *)[a3 objectForKey:@"AVVideoPixelAspectRatioKey"];
  if (v5) {
    v4->_VTPixelAspectRatioDictionary = (NSDictionary *)[AVVideoOutputSettingsVTPASPDictionaryForAVPASPDictionary(v5) copy];
  }
  v6 = (void *)[a3 objectForKey:@"AVVideoCleanApertureKey"];
  if (v6) {
    v4->_VTCleanApertureDictionary = (NSDictionary *)[AVVideoOutputSettingsVTCLAPDictionaryForAVCLAPDictionary(v6) copy];
  }
  return v4;
}

- (int)width
{
  v2 = [(AVOutputSettings *)self outputSettingsDictionary];
  id v3 = [(NSDictionary *)v2 objectForKey:*MEMORY[0x1E4F24E10]];
  if (v3) {
    LODWORD(v3) = [v3 integerValue];
  }
  return (int)v3;
}

- (int)height
{
  v2 = [(AVOutputSettings *)self outputSettingsDictionary];
  id v3 = [(NSDictionary *)v2 objectForKey:*MEMORY[0x1E4F24D08]];
  if (v3) {
    LODWORD(v3) = [v3 integerValue];
  }
  return (int)v3;
}

- (id)pixelAspectRatioDictionary
{
  return self->_VTPixelAspectRatioDictionary;
}

- (id)cleanApertureDictionary
{
  return self->_VTCleanApertureDictionary;
}

- (BOOL)willYieldCompressedSamples
{
  return 0;
}

- (BOOL)encoderIsAvailableOnCurrentSystemReturningError:(id *)a3
{
  return 1;
}

- (BOOL)canFullySpecifyOutputFormatReturningReason:(id *)a3
{
  return 1;
}

- (NSDictionary)pixelBufferAttributes
{
  v2 = [(AVVideoOutputSettings *)self videoSettingsDictionary];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", -[NSDictionary allKeys](v2, "allKeys"));
  [v3 intersectSet:AVVideoOutputSettingsValidPixelBufferAttributesKeys()];
  uint64_t v4 = [v3 allObjects];
  return [(NSDictionary *)v2 dictionaryWithValuesForKeys:v4];
}

- (NSString)fieldMode
{
  id v2 = [(NSDictionary *)[(AVVideoOutputSettings *)self videoSettingsDictionary] objectForKey:@"AVVideoDecompressionPropertiesKey"];
  uint64_t v3 = *MEMORY[0x1E4F44C30];
  return (NSString *)[v2 objectForKey:v3];
}

@end