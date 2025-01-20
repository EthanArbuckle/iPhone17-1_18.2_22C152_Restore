@interface CAMPreviewLayerEnabledCommand
- (BOOL)_isEnabled;
- (CAMPreviewLayerEnabledCommand)initWithCoder:(id)a3;
- (CAMPreviewLayerEnabledCommand)initWithPreviewLayerEnabled:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMPreviewLayerEnabledCommand

- (CAMPreviewLayerEnabledCommand)initWithPreviewLayerEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMPreviewLayerEnabledCommand;
  v4 = [(CAMCaptureCommand *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CAMPreviewLayerEnabledCommand *)self _isEnabled];
  id v8 = [v4 currentVideoPreviewLayer];

  v6 = [v8 connection];
  v7 = v6;
  if (v6 && v5 != [v6 isEnabled]) {
    [v7 setEnabled:v5];
  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMPreviewLayerEnabledCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMPreviewLayerEnabledCommand;
  BOOL v5 = [(CAMCaptureCommand *)&v8 init];
  if (v5)
  {
    v5->__enabled = [v4 decodeBoolForKey:@"CAMPreviewLayerEnabled"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMPreviewLayerEnabledCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMPreviewLayerEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMPreviewLayerEnabled");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMPreviewLayerEnabledCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMPreviewLayerEnabledCommand *)self _isEnabled];
  return v4;
}

@end