@interface AVWAVEOutputSettingsValidator
- (AVWAVEOutputSettingsValidator)initWithFileType:(id)a3;
- (BOOL)validateAudioOutputSettings:(id)a3 reason:(id *)a4;
@end

@implementation AVWAVEOutputSettingsValidator

- (AVWAVEOutputSettingsValidator)initWithFileType:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)AVWAVEOutputSettingsValidator;
  v5 = -[AVMediaFileOutputSettingsValidator initWithFileType:](&v13, sel_initWithFileType_);
  if ((objc_msgSend((id)objc_msgSend(a3, "UTI"), "isEqualToString:", @"com.microsoft.waveform-audio") & 1) == 0)
  {
    v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, @"invalid parameter not satisfying: %s", v6, v7, v8, v9, v10, (uint64_t)"[[fileType UTI] isEqualToString:AVFileTypeWAVE]"), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  return v5;
}

- (BOOL)validateAudioOutputSettings:(id)a3 reason:(id *)a4
{
  v13.receiver = self;
  v13.super_class = (Class)AVWAVEOutputSettingsValidator;
  unsigned int v6 = -[AVMediaFileOutputSettingsValidator validateAudioOutputSettings:reason:](&v13, sel_validateAudioOutputSettings_reason_);
  if (v6)
  {
    uint64_t v7 = (void *)[a3 audioSettingsDictionary];
    uint64_t v8 = *MEMORY[0x1E4F15208];
    if ([v7 objectForKey:*MEMORY[0x1E4F15208]]
      && (objc_msgSend((id)objc_msgSend(v7, "objectForKey:", v8), "BOOLValue") & 1) != 0)
    {
      LOBYTE(v6) = 0;
      uint64_t v9 = @"WAVE files cannot contain floating-point LPCM";
      if (!a4) {
        return v6;
      }
LABEL_11:
      *a4 = v9;
      return v6;
    }
    uint64_t v10 = *MEMORY[0x1E4F151F8];
    if ([v7 objectForKey:*MEMORY[0x1E4F151F8]])
    {
      int v11 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", v10), "BOOLValue");
      LOBYTE(v6) = v11 ^ 1;
      if (v11) {
        uint64_t v9 = @"WAVE files cannot contain big-endian LPCM";
      }
      else {
        uint64_t v9 = 0;
      }
      if (a4) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v9 = 0;
      LOBYTE(v6) = 1;
      if (a4) {
        goto LABEL_11;
      }
    }
  }
  return v6;
}

@end