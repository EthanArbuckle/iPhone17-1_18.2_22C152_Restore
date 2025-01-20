@interface CAMPreviewLayerZoomPIPEnabledCommand
- (BOOL)isEnabled;
- (CAMPreviewLayerZoomPIPEnabledCommand)initWithCoder:(id)a3;
- (CAMPreviewLayerZoomPIPEnabledCommand)initWithEnabled:(BOOL)a3;
- (CAMPreviewLayerZoomPIPEnabledCommand)initWithSubcommands:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMPreviewLayerZoomPIPEnabledCommand

- (CAMPreviewLayerZoomPIPEnabledCommand)initWithEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMPreviewLayerZoomPIPEnabledCommand;
  result = [(CAMCaptureCommand *)&v5 initWithSubcommands:0];
  if (result) {
    result->_enabled = a3;
  }
  return result;
}

- (CAMPreviewLayerZoomPIPEnabledCommand)initWithSubcommands:(id)a3
{
  return [(CAMPreviewLayerZoomPIPEnabledCommand *)self initWithEnabled:0];
}

- (CAMPreviewLayerZoomPIPEnabledCommand)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CAMPreviewLayerZoomPIPEnabledCommand;
  [(CAMCaptureCommand *)&v3 encodeWithCoder:a3];
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"NSCoding not implemented"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMPreviewLayerZoomPIPEnabledCommand;
  v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMPreviewLayerZoomPIPEnabledCommand *)self isEnabled];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = [a3 currentVideoPreviewLayer];
  if ([v4 isZoomPictureInPictureOverlaySupported]) {
    objc_msgSend(v4, "setZoomPictureInPictureOverlayEnabled:", -[CAMPreviewLayerZoomPIPEnabledCommand isEnabled](self, "isEnabled"));
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

@end