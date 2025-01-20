@interface CAMNonDestructiveCropAspectRatioCommand
- (CAMNonDestructiveCropAspectRatioCommand)initWithAspectRatioCrop:(int64_t)a3;
- (CAMNonDestructiveCropAspectRatioCommand)initWithCoder:(id)a3;
- (CAMNonDestructiveCropAspectRatioCommand)initWithSubcommands:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_aspectRatioCrop;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMNonDestructiveCropAspectRatioCommand

- (CAMNonDestructiveCropAspectRatioCommand)initWithAspectRatioCrop:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMNonDestructiveCropAspectRatioCommand;
  v4 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
  v5 = v4;
  if (v4)
  {
    v4->__aspectRatioCrop = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMNonDestructiveCropAspectRatioCommand)initWithSubcommands:(id)a3
{
  return [(CAMNonDestructiveCropAspectRatioCommand *)self initWithAspectRatioCrop:0];
}

- (CAMNonDestructiveCropAspectRatioCommand)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"CAMNonDestructiveCropAspectRatioKey"];
  return [(CAMNonDestructiveCropAspectRatioCommand *)self initWithAspectRatioCrop:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMNonDestructiveCropAspectRatioCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMNonDestructiveCropAspectRatioCommand _aspectRatioCrop](self, "_aspectRatioCrop", v5.receiver, v5.super_class), @"CAMNonDestructiveCropAspectRatioKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMNonDestructiveCropAspectRatioCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[3] = [(CAMNonDestructiveCropAspectRatioCommand *)self _aspectRatioCrop];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = [a3 currentVideoDevice];
  int v5 = [v4 isNonDestructiveCropEnabled];
  int64_t v6 = [(CAMNonDestructiveCropAspectRatioCommand *)self _aspectRatioCrop];
  if (v5)
  {
    if ((unint64_t)(v6 - 1) > 2) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = qword_209C7B850[v6 - 1];
    }
    [v4 setNonDestructiveCropAspectRatio:v7];
  }
  else if (v6)
  {
    objc_super v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(CAMNonDestructiveCropAspectRatioCommand *)self executeWithContext:v8];
    }
  }
}

- (int64_t)_aspectRatioCrop
{
  return self->__aspectRatioCrop;
}

- (void)executeWithContext:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t v5 = [a1 _aspectRatioCrop];
  if (v5 > 3) {
    int64_t v6 = 0;
  }
  else {
    int64_t v6 = off_263FA55F8[v5];
  }
  int v7 = 138543618;
  objc_super v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_2099F8000, a3, OS_LOG_TYPE_ERROR, "Trying to set aspect ratio crop of %{public}@ on non-enabled device: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end