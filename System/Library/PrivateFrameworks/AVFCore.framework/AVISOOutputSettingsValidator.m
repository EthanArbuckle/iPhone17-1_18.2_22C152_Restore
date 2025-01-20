@interface AVISOOutputSettingsValidator
- (BOOL)validateAudioOutputSettings:(id)a3 reason:(id *)a4;
- (BOOL)validateVideoOutputSettings:(id)a3 reason:(id *)a4;
@end

@implementation AVISOOutputSettingsValidator

- (BOOL)validateAudioOutputSettings:(id)a3 reason:(id *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AVISOOutputSettingsValidator;
  BOOL v5 = -[AVMediaFileOutputSettingsValidator validateAudioOutputSettings:reason:](&v7, sel_validateAudioOutputSettings_reason_, a3);
  if (a4 && v5) {
    *a4 = 0;
  }
  return v5;
}

- (BOOL)validateVideoOutputSettings:(id)a3 reason:(id *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AVISOOutputSettingsValidator;
  if (!-[AVMediaFileOutputSettingsValidator validateVideoOutputSettings:reason:](&v12, sel_validateVideoOutputSettings_reason_))return 0; {
  if ([a3 willYieldCompressedSamples])
  }
  {
    objc_super v7 = objc_msgSend((id)objc_msgSend(a3, "videoSettingsDictionary"), "objectForKey:", @"AVVideoCodecKey");
    if (([v7 isEqualToString:@"avc1"] & 1) != 0
      || ([v7 isEqualToString:@"jpeg"] & 1) != 0
      || ([v7 isEqualToString:@"hvc1"] & 1) != 0)
    {
      v8 = 0;
      BOOL v9 = 1;
      if (!a4) {
        return v9;
      }
      goto LABEL_11;
    }
    v8 = (void *)[NSString stringWithFormat:@"The video codec %@ is not compatible with file type %@", v7, -[AVMediaFileType UTI](-[AVMediaFileOutputSettingsValidator fileType](self, "fileType"), "UTI")];
  }
  else
  {
    v8 = (void *)[NSString stringWithFormat:@"Uncompressed video is not allowed for file type %@", -[AVMediaFileType UTI](-[AVMediaFileOutputSettingsValidator fileType](self, "fileType"), "UTI"), v11];
  }
  BOOL v9 = 0;
  if (a4) {
LABEL_11:
  }
    *a4 = v8;
  return v9;
}

@end