@interface MADImageCaptionRequest
+ (BOOL)supportsSecureCoding;
- (MADImageCaptionRequest)init;
- (MADImageCaptionRequest)initWithCoder:(id)a3;
- (MADImageCaptionRequest)initWithModelType:(int64_t)a3 safetyType:(int64_t)a4;
- (id)description;
- (int64_t)modelType;
- (int64_t)safetyType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADImageCaptionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADImageCaptionRequest)init
{
  return [(MADImageCaptionRequest *)self initWithModelType:1 safetyType:0];
}

- (MADImageCaptionRequest)initWithModelType:(int64_t)a3 safetyType:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MADImageCaptionRequest;
  result = [(MADImageCaptionRequest *)&v7 init];
  if (result)
  {
    result->_modelType = a3;
    result->_safetyType = a4;
  }
  return result;
}

- (MADImageCaptionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADImageCaptionRequest;
  v5 = [(MADRequest *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_modelType = [v4 decodeIntegerForKey:@"ImageCaptionModelType"];
    v5->_safetyType = [v4 decodeIntegerForKey:@"ImageCaptionSafetyType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADImageCaptionRequest;
  id v4 = a3;
  [(MADRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_modelType, @"ImageCaptionModelType", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_safetyType forKey:@"ImageCaptionSafetyType"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"imageCaptionModelType: %ld, ", -[MADImageCaptionRequest modelType](self, "modelType")];
  [v3 appendFormat:@"imageCaptionSafetyType: %ld, ", -[MADImageCaptionRequest safetyType](self, "safetyType")];
  v6 = [(MADRequest *)self results];
  [v3 appendFormat:@"results: %@, ", v6];

  objc_super v7 = [(MADRequest *)self error];
  [v3 appendFormat:@"error: %@>", v7];

  return v3;
}

- (int64_t)modelType
{
  return self->_modelType;
}

- (int64_t)safetyType
{
  return self->_safetyType;
}

@end