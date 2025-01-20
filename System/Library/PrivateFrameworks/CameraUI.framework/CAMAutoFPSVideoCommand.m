@interface CAMAutoFPSVideoCommand
- (BOOL)isAutoFPSVideoEnabled;
- (CAMAutoFPSVideoCommand)initWithAutoFPSVideoEnabled:(BOOL)a3;
- (CAMAutoFPSVideoCommand)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMAutoFPSVideoCommand

- (CAMAutoFPSVideoCommand)initWithAutoFPSVideoEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMAutoFPSVideoCommand;
  v4 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
  v5 = v4;
  if (v4)
  {
    v4->_autoFPSVideoEnabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMAutoFPSVideoCommand)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CAMAutoFPSVideoCommand;
  [(CAMCaptureCommand *)&v3 encodeWithCoder:a3];
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"NSCoding not implemented"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMAutoFPSVideoCommand;
  v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMAutoFPSVideoCommand *)self isAutoFPSVideoEnabled];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  id v6 = [v4 currentVideoDevice];
  v5 = [v4 currentVideoDeviceFormat];

  if ([v5 isVariableFrameRateVideoCaptureSupported])
  {
    objc_msgSend(v6, "setVariableFrameRateVideoCaptureEnabled:", -[CAMAutoFPSVideoCommand isAutoFPSVideoEnabled](self, "isAutoFPSVideoEnabled"));
  }
  else if ([v5 isLowLightVideoCaptureSupported])
  {
    objc_msgSend(v6, "setLowLightVideoCaptureEnabled:", -[CAMAutoFPSVideoCommand isAutoFPSVideoEnabled](self, "isAutoFPSVideoEnabled"));
  }
}

- (BOOL)isAutoFPSVideoEnabled
{
  return self->_autoFPSVideoEnabled;
}

@end