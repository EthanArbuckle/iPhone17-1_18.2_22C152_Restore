@interface CAMStillImagePreviewQualityFilteredRenderingEnabledCommand
- (BOOL)_isEnabled;
- (CAMStillImagePreviewQualityFilteredRenderingEnabledCommand)initWithCoder:(id)a3;
- (CAMStillImagePreviewQualityFilteredRenderingEnabledCommand)initWithPreviewQualityFilteredRenderingEnabled:(BOOL)a3;
- (CAMStillImagePreviewQualityFilteredRenderingEnabledCommand)initWithSubcommands:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMStillImagePreviewQualityFilteredRenderingEnabledCommand

- (CAMStillImagePreviewQualityFilteredRenderingEnabledCommand)initWithPreviewQualityFilteredRenderingEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMStillImagePreviewQualityFilteredRenderingEnabledCommand;
  result = [(CAMCaptureCommand *)&v5 initWithSubcommands:0];
  if (result) {
    result->__enabled = a3;
  }
  return result;
}

- (CAMStillImagePreviewQualityFilteredRenderingEnabledCommand)initWithSubcommands:(id)a3
{
  return [(CAMStillImagePreviewQualityFilteredRenderingEnabledCommand *)self initWithPreviewQualityFilteredRenderingEnabled:0];
}

- (CAMStillImagePreviewQualityFilteredRenderingEnabledCommand)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"CAMStillImagePreviewQualityFilteredRenderingEnabledKey"];
  return [(CAMStillImagePreviewQualityFilteredRenderingEnabledCommand *)self initWithPreviewQualityFilteredRenderingEnabled:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMStillImagePreviewQualityFilteredRenderingEnabledCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMStillImagePreviewQualityFilteredRenderingEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMStillImagePreviewQualityFilteredRenderingEnabledKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMStillImagePreviewQualityFilteredRenderingEnabledCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMStillImagePreviewQualityFilteredRenderingEnabledCommand *)self _isEnabled];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = [a3 currentStillImageOutput];
  if ([v4 isPreviewQualityAdjustedPhotoFilterRenderingSupported]) {
    objc_msgSend(v4, "setPreviewQualityAdjustedPhotoFilterRenderingEnabled:", -[CAMStillImagePreviewQualityFilteredRenderingEnabledCommand _isEnabled](self, "_isEnabled"));
  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end