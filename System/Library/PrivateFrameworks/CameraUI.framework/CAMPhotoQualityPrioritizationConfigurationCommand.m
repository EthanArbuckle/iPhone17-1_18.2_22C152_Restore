@interface CAMPhotoQualityPrioritizationConfigurationCommand
- (CAMPhotoQualityPrioritizationConfigurationCommand)initWithCoder:(id)a3;
- (CAMPhotoQualityPrioritizationConfigurationCommand)initWithPhotoQualityPrioritization:(int64_t)a3;
- (CAMPhotoQualityPrioritizationConfigurationCommand)initWithSubcommands:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_photoQualityPrioritization;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMPhotoQualityPrioritizationConfigurationCommand

- (CAMPhotoQualityPrioritizationConfigurationCommand)initWithPhotoQualityPrioritization:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMPhotoQualityPrioritizationConfigurationCommand;
  v4 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
  v5 = v4;
  if (v4)
  {
    v4->__photoQualityPrioritization = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMPhotoQualityPrioritizationConfigurationCommand)initWithSubcommands:(id)a3
{
  return [(CAMPhotoQualityPrioritizationConfigurationCommand *)self initWithPhotoQualityPrioritization:1];
}

- (CAMPhotoQualityPrioritizationConfigurationCommand)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"CAMPhotoQualityPrioritizationConfigurationKey"];
  return [(CAMPhotoQualityPrioritizationConfigurationCommand *)self initWithPhotoQualityPrioritization:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMPhotoQualityPrioritizationConfigurationCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMPhotoQualityPrioritizationConfigurationCommand _photoQualityPrioritization](self, "_photoQualityPrioritization", v5.receiver, v5.super_class), @"CAMPhotoQualityPrioritizationConfigurationKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMPhotoQualityPrioritizationConfigurationCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[3] = [(CAMPhotoQualityPrioritizationConfigurationCommand *)self _photoQualityPrioritization];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = [a3 currentStillImageOutput];
  objc_msgSend(v4, "setMaxPhotoQualityPrioritization:", +[CAMCaptureConversions AVCapturePhotoQualityPrioritizationForCAMPhotoQualityPrioritization:](CAMCaptureConversions, "AVCapturePhotoQualityPrioritizationForCAMPhotoQualityPrioritization:", -[CAMPhotoQualityPrioritizationConfigurationCommand _photoQualityPrioritization](self, "_photoQualityPrioritization")));
}

- (int64_t)_photoQualityPrioritization
{
  return self->__photoQualityPrioritization;
}

@end