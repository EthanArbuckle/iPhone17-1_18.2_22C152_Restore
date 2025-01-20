@interface AVCaptionOutputSettings
+ (BOOL)supportsEmptyOutputSettingsDictionary;
+ (id)_outputSettingsWithOutputSettingsDictionary:(id)a3 mediaType:(id)a4 exceptionReason:(id *)a5;
+ (id)eligibleOutputSettingsDictionaryKeys;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)captionTimeCodeFrameDuration;
- (AVCaptionOutputSettings)initWithCaptionSettingsDictionary:(id)a3 exceptionReason:(id *)a4;
- (BOOL)canFullySpecifyOutputFormatReturningReason:(id *)a3;
- (BOOL)encoderIsAvailableOnCurrentSystemReturningError:(id *)a3;
- (BOOL)useDropFrameTimeCode;
- (BOOL)validateUsingOutputSettingsValidator:(id)a3 reason:(id *)a4;
- (BOOL)willYieldCompressedSamples;
- (id)compatibleMediaTypes;
@end

@implementation AVCaptionOutputSettings

+ (id)eligibleOutputSettingsDictionaryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"AVCaptionTimeCodeFrameDurationKey", @"AVCaptionUseDropFrameTimeCodeKey", 0);
}

+ (id)_outputSettingsWithOutputSettingsDictionary:(id)a3 mediaType:(id)a4 exceptionReason:(id *)a5
{
  v5 = [[AVCaptionOutputSettings alloc] initWithCaptionSettingsDictionary:a3 exceptionReason:a5];
  return v5;
}

+ (BOOL)supportsEmptyOutputSettingsDictionary
{
  return 1;
}

- (AVCaptionOutputSettings)initWithCaptionSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  v16 = 0;
  v15.receiver = self;
  v15.super_class = (Class)AVCaptionOutputSettings;
  v5 = [(AVOutputSettings *)&v15 initWithOutputSettingsDictionary:a3 exceptionReason:&v16];
  if (!v5) {
    goto LABEL_19;
  }
  v6 = v5;
  uint64_t v7 = [(NSDictionary *)[(AVOutputSettings *)v5 outputSettingsDictionary] valueForKey:@"AVCaptionTimeCodeFrameDurationKey"];
  if (!v7) {
    goto LABEL_8;
  }
  CFDictionaryRef v8 = (const __CFDictionary *)v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v9 = 0;
      v10 = @"The value of AVCaptionTimeCodeFrameDurationKey is neither NSValue nor NSDictionary.";
      goto LABEL_11;
    }
    CMTimeMakeFromDictionary(&v13, v8);
    if ((v13.flags & 0x1D) != 1)
    {
      int v9 = 0;
      v10 = @"NSDictionary for AVCaptionTimeCodeFrameDurationKey is not convertible to a numeric CMTime.";
      goto LABEL_11;
    }
LABEL_8:
    int v9 = 1;
    goto LABEL_12;
  }
  [(__CFDictionary *)v8 CMTimeValue];
  if ((v14 & 0x1D) == 1) {
    goto LABEL_8;
  }
  int v9 = 0;
  v10 = @"NSValue for AVCaptionTimeCodeFrameDurationKey is not convertible to a numeric CMTime.";
LABEL_11:
  v16 = v10;
LABEL_12:
  uint64_t v11 = [(NSDictionary *)[(AVOutputSettings *)v6 outputSettingsDictionary] valueForKey:@"AVCaptionUseDropFrameTimeCodeKey"];
  if (v9 && v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v16 = @"The value of AVCaptionUseDropFrameTimeCodeKey is not NSNumber.";
  }
  else if (v9)
  {
    return v6;
  }

LABEL_19:
  v6 = 0;
  if (a4) {
    *a4 = v16;
  }
  return v6;
}

- (id)compatibleMediaTypes
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = AVMediaTypesForCaptionEditing();
  return (id)[v2 setWithArray:v3];
}

- (BOOL)willYieldCompressedSamples
{
  return 0;
}

- (BOOL)canFullySpecifyOutputFormatReturningReason:(id *)a3
{
  return 1;
}

- (BOOL)validateUsingOutputSettingsValidator:(id)a3 reason:(id *)a4
{
  return 1;
}

- (BOOL)encoderIsAvailableOnCurrentSystemReturningError:(id *)a3
{
  return 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)captionTimeCodeFrameDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  id v4 = [(NSDictionary *)[(AVOutputSettings *)self outputSettingsDictionary] valueForKey:@"AVCaptionTimeCodeFrameDurationKey"];
  objc_opt_class();
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)objc_opt_isKindOfClass();
  if (result)
  {
    if (v4) {
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[v4 CMTimeValue];
    }
    else {
      memset(&v6, 0, sizeof(v6));
    }
  }
  else
  {
    objc_opt_class();
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)objc_opt_isKindOfClass();
    if ((result & 1) == 0) {
      return result;
    }
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeFromDictionary(&v6, (CFDictionaryRef)v4);
  }
  *(CMTime *)retstr = v6;
  return result;
}

- (BOOL)useDropFrameTimeCode
{
  id v2 = [(NSDictionary *)[(AVOutputSettings *)self outputSettingsDictionary] valueForKey:@"AVCaptionUseDropFrameTimeCodeKey"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

@end