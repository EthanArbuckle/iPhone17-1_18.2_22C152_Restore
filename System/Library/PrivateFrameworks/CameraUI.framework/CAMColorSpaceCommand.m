@interface CAMColorSpaceCommand
- (CAMColorSpaceCommand)initWithCoder:(id)a3;
- (CAMColorSpaceCommand)initWithColorSpace:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_colorSpace;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMColorSpaceCommand

- (CAMColorSpaceCommand)initWithColorSpace:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMColorSpaceCommand;
  v4 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
  v5 = v4;
  if (v4)
  {
    v4->__colorSpace = a3;
    v6 = v4;
  }

  return v5;
}

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CAMColorSpaceCommand *)self _colorSpace];
  id v14 = [v4 currentCaptureSession];
  v6 = [v4 currentVideoDevice];
  v7 = [v4 currentVideoDeviceFormat];

  int64_t v8 = +[CAMCaptureConversions AVCaptureColorSpaceForColorSpace:v5 hasValidConversion:0];
  int64_t v9 = v8;
  uint64_t v10 = 1;
  switch(v5)
  {
    case 0:
      uint64_t v10 = 0;
      goto LABEL_3;
    case 1:
      goto LABEL_4;
    case 2:
    case 3:
LABEL_3:
      int64_t v5 = v8;
LABEL_4:
      [v14 setAutomaticallyConfiguresCaptureDeviceForWideColor:v10];
      int64_t v9 = v5;
      break;
    default:
      break;
  }
  if (objc_msgSend(v6, "activeColorSpace", v10) != v9)
  {
    v11 = [v7 supportedColorSpaces];
    v12 = [NSNumber numberWithInteger:v9];
    int v13 = [v11 containsObject:v12];

    if (v13)
    {
      [v14 setAutomaticallyConfiguresCaptureDeviceForWideColor:0];
      [v6 setActiveColorSpace:v9];
    }
  }
}

- (int64_t)_colorSpace
{
  return self->__colorSpace;
}

- (CAMColorSpaceCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMColorSpaceCommand;
  int64_t v5 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
  if (v5)
  {
    v5->__colorSpace = [v4 decodeIntegerForKey:@"CAMColorSpaceCommandColorSpace"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMColorSpaceCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMColorSpaceCommand _colorSpace](self, "_colorSpace", v5.receiver, v5.super_class), @"CAMColorSpaceCommandColorSpace");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMColorSpaceCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[3] = [(CAMColorSpaceCommand *)self _colorSpace];
  return v4;
}

@end