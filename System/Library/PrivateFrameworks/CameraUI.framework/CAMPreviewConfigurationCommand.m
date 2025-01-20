@interface CAMPreviewConfigurationCommand
- (CAMPreviewConfigurationCommand)initWithPreviewConfiguration:(unint64_t)a3;
@end

@implementation CAMPreviewConfigurationCommand

- (CAMPreviewConfigurationCommand)initWithPreviewConfiguration:(unint64_t)a3
{
  v13[3] = *MEMORY[0x263EF8340];
  unint64_t v4 = (a3 >> 1) & 1;
  unint64_t v5 = (a3 >> 2) & 1;
  v6 = [[CAMPreviewLayerEnabledCommand alloc] initWithPreviewLayerEnabled:a3 & 1];
  v7 = [[CAMEffectsPreviewVideoDataOutputEnabledCommand alloc] initWithVideoDataOutputEnabled:v4];
  v8 = [[CAMVideoThumbnailOutputEnabledCommand alloc] initWithVideoThumbnailOutputEnabled:v5];
  v13[0] = v6;
  v13[1] = v7;
  v13[2] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
  v12.receiver = self;
  v12.super_class = (Class)CAMPreviewConfigurationCommand;
  v10 = [(CAMCaptureCommand *)&v12 initWithSubcommands:v9];

  return v10;
}

@end