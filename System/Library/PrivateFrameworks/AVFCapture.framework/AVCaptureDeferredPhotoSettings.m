@interface AVCaptureDeferredPhotoSettings
+ (BOOL)supportsSecureCoding;
- (AVCaptureDeferredPhotoSettings)initWithCoder:(id)a3;
- (FigCaptureStillImageSettings)captureSettings;
- (NSData)serializedProcessingSettings;
- (id)_initWithCaptureSettings:(id)a3 serializedProcessingSettings:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVCaptureDeferredPhotoSettings

- (NSData)serializedProcessingSettings
{
  return self->_serializedProcessingSettings;
}

- (AVCaptureDeferredPhotoSettings)initWithCoder:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  result = (AVCaptureDeferredPhotoSettings *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v8, 2)), @"FigCaptureStillImageSettings");
  if (result)
  {
    v7 = result;
    result = (AVCaptureDeferredPhotoSettings *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"SerializedProcessingSettings"];
    if (result) {
      return (AVCaptureDeferredPhotoSettings *)[(AVCaptureDeferredPhotoSettings *)self _initWithCaptureSettings:v7 serializedProcessingSettings:result];
    }
  }
  return result;
}

- (id)_initWithCaptureSettings:(id)a3 serializedProcessingSettings:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVCaptureDeferredPhotoSettings;
  v6 = [(AVCaptureDeferredPhotoSettings *)&v8 init];
  if (v6)
  {
    v6->_captureSettings = (FigCaptureStillImageSettings *)a3;
    v6->_serializedProcessingSettings = (NSData *)[a4 copy];
  }
  return v6;
}

- (FigCaptureStillImageSettings)captureSettings
{
  return self->_captureSettings;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_captureSettings forKey:@"FigCaptureStillImageSettings"];
  serializedProcessingSettings = self->_serializedProcessingSettings;

  [a3 encodeObject:serializedProcessingSettings forKey:@"SerializedProcessingSettings"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeferredPhotoSettings;
  [(AVCaptureDeferredPhotoSettings *)&v3 dealloc];
}

@end