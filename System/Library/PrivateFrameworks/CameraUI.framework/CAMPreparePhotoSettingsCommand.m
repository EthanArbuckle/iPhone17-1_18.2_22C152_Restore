@interface CAMPreparePhotoSettingsCommand
- (CAMCaptureGraphConfiguration)_desiredGraphConfiguration;
- (CAMPreparePhotoSettingsCommand)initWithCoder:(id)a3;
- (CAMPreparePhotoSettingsCommand)initWithGraphConfiguration:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMPreparePhotoSettingsCommand

- (CAMPreparePhotoSettingsCommand)initWithGraphConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMPreparePhotoSettingsCommand;
  v6 = [(CAMCaptureCommand *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__desiredGraphConfiguration, a3);
    v8 = v7;
  }

  return v7;
}

- (void)executeWithContext:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [v5 currentStillImageOutput];

  v8 = [(CAMPreparePhotoSettingsCommand *)self _desiredGraphConfiguration];
  v9 = +[CAMCaptureCapabilities capabilities];
  uint64_t v10 = [v8 mode];
  uint64_t v11 = [v8 device];
  unsigned int v12 = objc_msgSend(v9, "isHDRSupportedForMode:devicePosition:", v10, objc_msgSend(v8, "devicePosition"));
  uint64_t v13 = [v8 photoEncodingBehavior];
  switch(v10)
  {
    case 0:
    case 4:
      if ([v9 isBurstSupportedForMode:v10 device:v11])
      {
        v14 = [MEMORY[0x263EFA628] burstQualityPhotoSettings];
        [v14 setHDRMode:0];
        [v14 setPhotoQualityPrioritization:1];
        [v14 setHighResolutionPhotoEnabled:1];
        [v6 addObject:v14];
      }
      goto LABEL_4;
    case 6:
    case 9:
LABEL_4:
      switch(v13)
      {
        case 0:
          uint64_t v18 = [MEMORY[0x263EFA628] photoSettings];
LABEL_10:
          v17 = (void *)v18;
          break;
        case 2:
          uint64_t v19 = +[CAMStillImageCaptureRequest rawPixelFormatTypeForPhotoOutput:v7];
          uint64_t v18 = [MEMORY[0x263EFA628] photoSettingsWithRawPixelFormatType:v19 rawFileType:*MEMORY[0x263EF9868] processedFormat:0 processedFileType:*MEMORY[0x263EF9868]];
          goto LABEL_10;
        case 1:
          v15 = (void *)MEMORY[0x263EFA628];
          uint64_t v20 = *MEMORY[0x263EFA338];
          v21[0] = *MEMORY[0x263EFA370];
          v16 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
          v17 = [v15 photoSettingsWithFormat:v16];

          break;
        default:
          v17 = 0;
          break;
      }
      objc_msgSend(v17, "setHDRMode:", +[CAMCaptureConversions captureHDRModeForHDRMode:](CAMCaptureConversions, "captureHDRModeForHDRMode:", v12));
      [v17 setHighResolutionPhotoEnabled:1];
      objc_msgSend(v17, "setPhotoQualityPrioritization:", +[CAMCaptureConversions AVCapturePhotoQualityPrioritizationForCAMPhotoQualityPrioritization:](CAMCaptureConversions, "AVCapturePhotoQualityPrioritizationForCAMPhotoQualityPrioritization:", objc_msgSend(v8, "photoQualityPrioritization")));
      [v6 addObject:v17];

LABEL_13:
      [v7 setPreparedPhotoSettingsArray:v6 completionHandler:0];

      return;
    default:
      goto LABEL_13;
  }
}

- (CAMCaptureGraphConfiguration)_desiredGraphConfiguration
{
  return self->__desiredGraphConfiguration;
}

- (void).cxx_destruct
{
}

- (CAMPreparePhotoSettingsCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMPreparePhotoSettingsCommand;
  id v5 = [(CAMCaptureCommand *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"CAMPreparePhotoSettingsCommandDesiredConfiguration"];
    desiredGraphConfiguration = v5->__desiredGraphConfiguration;
    v5->__desiredGraphConfiguration = (CAMCaptureGraphConfiguration *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMPreparePhotoSettingsCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v6 encodeWithCoder:v4];
  id v5 = [(CAMPreparePhotoSettingsCommand *)self _desiredGraphConfiguration];
  [v4 encodeObject:v5 forKey:@"CAMPreparePhotoSettingsCommandDesiredConfiguration"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMPreparePhotoSettingsCommand;
  id v4 = [(CAMCaptureCommand *)&v8 copyWithZone:a3];
  uint64_t v5 = [(CAMPreparePhotoSettingsCommand *)self _desiredGraphConfiguration];
  objc_super v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

@end