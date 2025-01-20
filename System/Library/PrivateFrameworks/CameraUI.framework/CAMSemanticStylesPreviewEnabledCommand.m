@interface CAMSemanticStylesPreviewEnabledCommand
- (BOOL)_isEnabled;
- (CAMSemanticStylesPreviewEnabledCommand)initWithCoder:(id)a3;
- (CAMSemanticStylesPreviewEnabledCommand)initWithEnabled:(BOOL)a3;
- (CAMSemanticStylesPreviewEnabledCommand)initWithSubcommands:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMSemanticStylesPreviewEnabledCommand

- (CAMSemanticStylesPreviewEnabledCommand)initWithEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMSemanticStylesPreviewEnabledCommand;
  v4 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMSemanticStylesPreviewEnabledCommand)initWithSubcommands:(id)a3
{
  return [(CAMSemanticStylesPreviewEnabledCommand *)self initWithEnabled:0];
}

- (CAMSemanticStylesPreviewEnabledCommand)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"CAMSemanticStylesPreviewEnabledKey"];
  return [(CAMSemanticStylesPreviewEnabledCommand *)self initWithEnabled:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMSemanticStylesPreviewEnabledCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMSemanticStylesPreviewEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMSemanticStylesPreviewEnabledKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMSemanticStylesPreviewEnabledCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMSemanticStylesPreviewEnabledCommand *)self _isEnabled];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = [a3 currentVideoPreviewLayer];
  if ([v4 isSemanticStyleRenderingSupported]) {
    objc_msgSend(v4, "setSemanticStyleRenderingEnabled:", -[CAMSemanticStylesPreviewEnabledCommand _isEnabled](self, "_isEnabled"));
  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end