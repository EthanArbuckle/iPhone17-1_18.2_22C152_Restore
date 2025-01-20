@interface BWStillImageSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BWStillImageCaptureSettings)captureSettings;
- (BWStillImageProcessingSettings)processingSettings;
- (BWStillImageSettings)initWithCoder:(id)a3;
- (BWStillImageSettings)initWithRequestedSettings:(id)a3 captureSettings:(id)a4 processingSettings:(id)a5;
- (FigCaptureStillImageSettings)requestedSettings;
- (id)description;
- (int64_t)settingsID;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BWStillImageSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWStillImageSettings)initWithRequestedSettings:(id)a3 captureSettings:(id)a4 processingSettings:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)BWStillImageSettings;
  v8 = [(BWStillImageSettings *)&v10 init];
  if (v8)
  {
    v8->_requestedSettings = (FigCaptureStillImageSettings *)a3;
    v8->_captureSettings = (BWStillImageCaptureSettings *)a4;
    v8->_processingSettings = (BWStillImageProcessingSettings *)a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageSettings;
  [(BWStillImageSettings *)&v3 dealloc];
}

- (BWStillImageSettings)initWithCoder:(id)a3
{
  v4 = [(BWStillImageSettings *)self init];
  if (v4)
  {
    v4->_requestedSettings = (FigCaptureStillImageSettings *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"requestedSettings"];
    v4->_captureSettings = (BWStillImageCaptureSettings *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"captureSettings"];
    v4->_processingSettings = (BWStillImageProcessingSettings *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"processingSettings"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_requestedSettings forKey:@"requestedSettings"];
  [a3 encodeObject:self->_captureSettings forKey:@"captureSettings"];
  processingSettings = self->_processingSettings;
  [a3 encodeObject:processingSettings forKey:@"processingSettings"];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    uint64_t v16 = v5;
    uint64_t v17 = v4;
    uint64_t v18 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [(BWStillImageSettings *)self requestedSettings];
      if (v11 == (FigCaptureStillImageSettings *)[a3 requestedSettings]
        || (BOOL v12 = -[FigCaptureStillImageSettings isEqual:](-[BWStillImageSettings requestedSettings](self, "requestedSettings"), "isEqual:", [a3 requestedSettings])))
      {
        v13 = [(BWStillImageSettings *)self captureSettings];
        if (v13 == (BWStillImageCaptureSettings *)[a3 captureSettings]
          || (BOOL v12 = -[BWStillImageCaptureSettings isEqual:](-[BWStillImageSettings captureSettings](self, "captureSettings"), "isEqual:", [a3 captureSettings])))
        {
          v14 = [(BWStillImageSettings *)self processingSettings];
          if (v14 == (BWStillImageProcessingSettings *)[a3 processingSettings]
            || (BOOL v12 = -[BWStillImageProcessingSettings isEqual:](-[BWStillImageSettings processingSettings](self, "processingSettings"), "isEqual:", [a3 processingSettings])))
          {
            LOBYTE(v12) = 1;
          }
        }
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FigCaptureStillImageSettings *)self->_requestedSettings hash];
  unint64_t v4 = [(BWStillImageCaptureSettings *)self->_captureSettings hash] ^ v3;
  return v4 ^ [(BWStillImageProcessingSettings *)self->_processingSettings hash];
}

- (int64_t)settingsID
{
  return [(FigCaptureStillImageSettings *)self->_requestedSettings settingsID];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p>: requestedSettings: %@\ncaptureSettings: %@\nprocessingSettings: %@", objc_opt_class(), self, -[BWStillImageSettings requestedSettings](self, "requestedSettings"), -[BWStillImageSettings captureSettings](self, "captureSettings"), -[BWStillImageSettings processingSettings](self, "processingSettings")];
}

- (FigCaptureStillImageSettings)requestedSettings
{
  return self->_requestedSettings;
}

- (BWStillImageCaptureSettings)captureSettings
{
  return self->_captureSettings;
}

- (BWStillImageProcessingSettings)processingSettings
{
  return self->_processingSettings;
}

@end