@interface AVVideoOutputSettings
+ (AVVideoOutputSettings)videoOutputSettingsWithTrustedVideoSettingsDictionary:(id)a3;
+ (AVVideoOutputSettings)videoOutputSettingsWithVideoSettingsDictionary:(id)a3;
+ (id)_outputSettingsWithOutputSettingsDictionary:(id)a3 mediaType:(id)a4 exceptionReason:(id *)a5;
+ (id)_validValuesForScalingMode;
+ (id)_videoOutputSettingsWithVideoSettingsDictionary:(id)a3 exceptionReason:(id *)a4;
+ (id)defaultVideoOutputSettings;
+ (id)registeredOutputSettingsClasses;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDuration;
- (BOOL)allowWideColor;
- (BOOL)dimensionsAreBoundingBox;
- (BOOL)isProRes;
- (BOOL)isProRes4KHighFPSSetting;
- (BOOL)validateUsingOutputSettingsValidator:(id)a3 reason:(id *)a4;
- (NSDictionary)cleanApertureDictionary;
- (NSDictionary)pixelAspectRatioDictionary;
- (NSDictionary)pixelTransferProperties;
- (NSDictionary)videoScalingProperties;
- (NSString)frameRateConversionAlgorithm;
- (id)compatibleMediaTypes;
- (int)height;
- (int)width;
- (void)colorPropertiesConsideringFormatDescriptions:(id)a3 colorPrimaries:(id *)a4 transferFunction:(id *)a5 ycbcrMatrix:(id *)a6;
@end

@implementation AVVideoOutputSettings

- (id)compatibleMediaTypes
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"vide";
  v3[1] = @"auxv";
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:v3 count:2];
}

+ (AVVideoOutputSettings)videoOutputSettingsWithVideoSettingsDictionary:(id)a3
{
  uint64_t v13 = 0;
  result = (AVVideoOutputSettings *)[a1 _videoOutputSettingsWithVideoSettingsDictionary:a3 exceptionReason:&v13];
  if (!result)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, v13, v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
  return result;
}

+ (id)registeredOutputSettingsClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

+ (id)_videoOutputSettingsWithVideoSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  if (a3)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___AVVideoOutputSettings;
    return objc_msgSendSuper2(&v6, sel__outputSettingsWithOutputSettingsDictionary_mediaType_exceptionReason_, a3, @"vide", a4);
  }
  else
  {
    return (id)[a1 defaultVideoOutputSettings];
  }
}

+ (id)_outputSettingsWithOutputSettingsDictionary:(id)a3 mediaType:(id)a4 exceptionReason:(id *)a5
{
  return (id)[a1 _videoOutputSettingsWithVideoSettingsDictionary:a3 exceptionReason:a5];
}

+ (id)_validValuesForScalingMode
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"AVVideoScalingModeFit", @"AVVideoScalingModeResize", @"AVVideoScalingModeResizeAspect", @"AVVideoScalingModeResizeAspectFill", 0);
}

+ (AVVideoOutputSettings)videoOutputSettingsWithTrustedVideoSettingsDictionary:(id)a3
{
  if ([a3 objectForKey:*MEMORY[0x1E4F24D70]])
  {
    uint64_t v4 = [[AVPixelBufferAttributesVideoOutputSettings alloc] initWithTrustedPixelBufferAttributes:a3];
  }
  else
  {
    result = (AVVideoOutputSettings *)[a3 objectForKey:@"AVVideoCodecKey"];
    if (!result) {
      return result;
    }
    uint64_t v4 = [[AVAVVideoSettingsVideoOutputSettings alloc] initWithTrustedAVVideoSettingsDictionary:a3];
  }
  return (AVVideoOutputSettings *)v4;
}

+ (id)defaultVideoOutputSettings
{
  return +[AVVideoOutputSettings videoOutputSettingsWithVideoSettingsDictionary:0];
}

- (int)width
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (int)height
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (NSDictionary)pixelAspectRatioDictionary
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (NSDictionary)cleanApertureDictionary
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (NSDictionary)videoScalingProperties
{
  uint64_t v3 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(NSDictionary *)[(AVVideoOutputSettings *)self videoSettingsDictionary] objectForKey:@"AVVideoColorPropertiesKey"];
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = [v4 objectForKey:@"ColorPrimaries"];
    uint64_t v7 = [v5 objectForKey:@"YCbCrMatrix"];
    uint64_t v8 = [v5 objectForKey:@"TransferFunction"];
    [(NSDictionary *)v3 setObject:v6 forKey:*MEMORY[0x1E4F450E0]];
    [(NSDictionary *)v3 setObject:v7 forKey:*MEMORY[0x1E4F45100]];
    [(NSDictionary *)v3 setObject:v8 forKey:*MEMORY[0x1E4F450F8]];
  }
  if ([(NSDictionary *)v3 count]) {
    return v3;
  }
  else {
    return 0;
  }
}

- (NSDictionary)pixelTransferProperties
{
  result = [(NSDictionary *)[(AVVideoOutputSettings *)self videoSettingsDictionary] objectForKey:@"AVVideoScalingModeKey"];
  if (result)
  {
    v5 = result;
    if (([(NSDictionary *)result isEqualToString:@"AVVideoScalingModeFit"] & 1) != 0
      || ([(NSDictionary *)v5 isEqualToString:@"AVVideoScalingModeResize"] & 1) != 0)
    {
      uint64_t v6 = (uint64_t *)MEMORY[0x1E4F45450];
    }
    else if ([(NSDictionary *)v5 isEqualToString:@"AVVideoScalingModeResizeAspect"])
    {
      uint64_t v6 = (uint64_t *)MEMORY[0x1E4F45458];
    }
    else
    {
      if (([(NSDictionary *)v5 isEqualToString:@"AVVideoScalingModeResizeAspectFill"] & 1) == 0)
      {
        v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Unrecognized value for %@: %@", v10, v11, v12, v13, v14, @"AVVideoScalingModeKey"), 0 reason userInfo];
        objc_exception_throw(v15);
      }
      uint64_t v6 = (uint64_t *)MEMORY[0x1E4F45468];
    }
    uint64_t v7 = *v6;
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v9 = *MEMORY[0x1E4F45168];
    return (NSDictionary *)[v8 dictionaryWithObject:v7 forKey:v9];
  }
  return result;
}

- (void)colorPropertiesConsideringFormatDescriptions:(id)a3 colorPrimaries:(id *)a4 transferFunction:(id *)a5 ycbcrMatrix:(id *)a6
{
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  id v10 = [(NSDictionary *)[(AVVideoOutputSettings *)self videoSettingsDictionary] objectForKey:@"AVVideoColorPropertiesKey"];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v14 = (void *)[v10 objectForKey:@"ColorPrimaries"];
    uint64_t v13 = (void *)[v11 objectForKey:@"YCbCrMatrix"];
    uint64_t v12 = (void *)[v11 objectForKey:@"TransferFunction"];
    if (![(AVVideoOutputSettings *)self allowWideColor])
    {
      [(AVVideoOutputSettings *)self allowWideColor];
      CMFormatDescriptionGetWidestColorPropertiesFromFormatDescriptions();
    }
  }
  if (a4) {
    *a4 = v14;
  }
  if (a5) {
    *a5 = v12;
  }
  if (a6) {
    *a6 = v13;
  }
}

- (BOOL)dimensionsAreBoundingBox
{
  id v2 = [(NSDictionary *)[(AVVideoOutputSettings *)self videoSettingsDictionary] objectForKey:@"AVVideoScalingModeKey"];
  if (v2)
  {
    LOBYTE(v2) = [v2 isEqualToString:@"AVVideoScalingModeFit"];
  }
  return (char)v2;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeFromDictionary(&v5, (CFDictionaryRef)[(NSDictionary *)[(AVVideoOutputSettings *)self videoSettingsDictionary] objectForKey:@"AVVideoMinimumFrameDuration"]);
  *(CMTime *)retstr = v5;
  return result;
}

- (NSString)frameRateConversionAlgorithm
{
  id v2 = [(AVVideoOutputSettings *)self videoSettingsDictionary];
  return (NSString *)[(NSDictionary *)v2 objectForKey:@"AVVideoFrameRateConversionAlgorithm"];
}

- (BOOL)allowWideColor
{
  id v3 = [(NSDictionary *)[(AVVideoOutputSettings *)self videoSettingsDictionary] objectForKey:@"AVVideoAllowWideColorKey"];
  if ([(NSDictionary *)[(AVVideoOutputSettings *)self videoSettingsDictionary] objectForKey:@"AVVideoColorPropertiesKey"])
  {
    return 1;
  }
  if (!v3) {
    return 0;
  }
  return [v3 BOOLValue];
}

- (BOOL)isProRes
{
  id v2 = [(AVOutputSettings *)self outputSettingsDictionary];
  if (v2)
  {
    id v2 = [(NSDictionary *)v2 objectForKey:@"AVVideoCodecKey"];
    if (v2)
    {
      int v3 = AVOSTypeForString(v2);
      LOBYTE(v2) = 1;
      if (v3 <= 1634743415)
      {
        if (v3 != 1634742376 && v3 != 1634742888 && v3 != 1634743400) {
          goto LABEL_16;
        }
      }
      else if ((v3 - 1634755432) > 0xB || ((1 << (v3 - 104)) & 0x8C1) == 0)
      {
        BOOL v5 = (v3 - 1634759272) > 6 || ((1 << (v3 - 104)) & 0x51) == 0;
        if (v5 && v3 != 1634743416) {
LABEL_16:
        }
          LOBYTE(v2) = 0;
      }
    }
  }
  return (char)v2;
}

- (BOOL)isProRes4KHighFPSSetting
{
  id v2 = [(AVOutputSettings *)self outputSettingsDictionary];
  if (!v2) {
    return (char)v2;
  }
  int v3 = v2;
  id v2 = [(NSDictionary *)v2 objectForKey:@"AVVideoCodecKey"];
  if (!v2) {
    return (char)v2;
  }
  int v4 = AVOSTypeForString(v2);
  LOBYTE(v2) = 0;
  if (v4 > 1634743415)
  {
    if ((v4 - 1634755432) > 0xB || ((1 << (v4 - 104)) & 0x8C1) == 0)
    {
      BOOL v6 = (v4 - 1634759272) > 6 || ((1 << (v4 - 104)) & 0x51) == 0;
      if (v6 && v4 != 1634743416) {
        return (char)v2;
      }
    }
LABEL_25:
    id v2 = [(NSDictionary *)v3 objectForKey:@"AVVideoWidthKey"];
    if (!v2) {
      return (char)v2;
    }
    if ([(NSDictionary *)v2 longValue] >= 3840)
    {
      id v2 = [(NSDictionary *)v3 objectForKey:@"AVVideoHeightKey"];
      if (!v2) {
        return (char)v2;
      }
      if ([(NSDictionary *)v2 longValue] >= 2160)
      {
        id v2 = [(NSDictionary *)v3 objectForKey:@"AVVideoCompressionPropertiesKey"];
        if (!v2) {
          return (char)v2;
        }
        id v2 = [(NSDictionary *)v2 objectForKey:@"ExpectedFrameRate"];
        if (!v2) {
          return (char)v2;
        }
        [(NSDictionary *)v2 floatValue];
        if (v10 >= 100.0)
        {
          LOBYTE(v2) = 1;
          return (char)v2;
        }
      }
    }
    LOBYTE(v2) = 0;
    return (char)v2;
  }
  if (v4 == 1634742376 || v4 == 1634742888 || v4 == 1634743400) {
    goto LABEL_25;
  }
  return (char)v2;
}

- (BOOL)validateUsingOutputSettingsValidator:(id)a3 reason:(id *)a4
{
  return [a3 validateVideoOutputSettings:self reason:a4];
}

@end