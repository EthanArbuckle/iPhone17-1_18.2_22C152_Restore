@interface CAMPrepareStillImageCaptureCommand
- (CAMPrepareStillImageCaptureCommand)initWithCoder:(id)a3;
- (CAMPrepareStillImageCaptureCommand)initWithSystemTime:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_systemTimeOfCapture;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMPrepareStillImageCaptureCommand

- (CAMPrepareStillImageCaptureCommand)initWithSystemTime:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMPrepareStillImageCaptureCommand;
  result = [(CAMCaptureCommand *)&v5 init];
  if (result) {
    result->__systemTimeOfCapture = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMPrepareStillImageCaptureCommand;
  v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[3] = [(CAMPrepareStillImageCaptureCommand *)self _systemTimeOfCapture];
  return v4;
}

- (unint64_t)_systemTimeOfCapture
{
  return self->__systemTimeOfCapture;
}

- (void)executeWithContext:(id)a3
{
  id v4 = [a3 currentStillImageOutput];
  objc_msgSend(v4, "userInitiatedCaptureRequestAtTime:", -[CAMPrepareStillImageCaptureCommand _systemTimeOfCapture](self, "_systemTimeOfCapture"));
}

- (CAMPrepareStillImageCaptureCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMPrepareStillImageCaptureCommand;
  objc_super v5 = [(CAMCaptureCommand *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->__systemTimeOfCapture = [v4 decodeInt64ForKey:@"CAMPrepareStillImageCaptureCommandSystemTime"];
    objc_super v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[CAMPrepareStillImageCaptureCommand _systemTimeOfCapture](self, "_systemTimeOfCapture"), @"CAMPrepareStillImageCaptureCommandSystemTime");
}

@end