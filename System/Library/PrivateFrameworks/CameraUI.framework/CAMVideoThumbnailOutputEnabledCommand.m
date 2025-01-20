@interface CAMVideoThumbnailOutputEnabledCommand
- (BOOL)_isEnabled;
- (CAMVideoThumbnailOutputEnabledCommand)initWithCoder:(id)a3;
- (CAMVideoThumbnailOutputEnabledCommand)initWithVideoThumbnailOutputEnabled:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMVideoThumbnailOutputEnabledCommand

- (CAMVideoThumbnailOutputEnabledCommand)initWithVideoThumbnailOutputEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoThumbnailOutputEnabledCommand;
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
  LOBYTE(self) = [(CAMVideoThumbnailOutputEnabledCommand *)self _isEnabled];
  v5 = [v4 currentVideoThumbnailOutput];

  v6 = [v5 connections];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__CAMVideoThumbnailOutputEnabledCommand_executeWithContext___block_invoke;
  v7[3] = &__block_descriptor_33_e36_v32__0__AVCaptureConnection_8Q16_B24l;
  char v8 = (char)self;
  [v6 enumerateObjectsUsingBlock:v7];
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

void __60__CAMVideoThumbnailOutputEnabledCommand_executeWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v7 = v3;
    int v4 = [v3 isEnabled];
    int v5 = *(unsigned __int8 *)(a1 + 32);
    BOOL v6 = v5 == v4;
    id v3 = v7;
    if (!v6)
    {
      [v7 setEnabled:v5 != 0];
      id v3 = v7;
    }
  }
}

- (CAMVideoThumbnailOutputEnabledCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoThumbnailOutputEnabledCommand;
  int v5 = [(CAMCaptureCommand *)&v8 init];
  if (v5)
  {
    v5->__enabled = [v4 decodeBoolForKey:@"CAMVideoThumbnailOutputEnabled"];
    BOOL v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMVideoThumbnailOutputEnabledCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMVideoThumbnailOutputEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMVideoThumbnailOutputEnabled");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMVideoThumbnailOutputEnabledCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMVideoThumbnailOutputEnabledCommand *)self _isEnabled];
  return v4;
}

@end