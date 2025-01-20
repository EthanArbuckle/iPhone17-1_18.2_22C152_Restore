@interface AVCapturePhotoBracketSettingsInternal
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation AVCapturePhotoBracketSettingsInternal

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    *(void *)(v4 + 8) = self->bracketedSettings;
    *(unsigned char *)(v4 + 16) = self->lensStabilizationEnabled;
  }
  return (id)v4;
}

@end