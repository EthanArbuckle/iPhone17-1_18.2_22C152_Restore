@interface MADRemoveBackgroundMaskRequest
+ (BOOL)supportsSecureCoding;
- (MADRemoveBackgroundMaskRequest)initWithCoder:(id)a3;
- (MADRemoveBackgroundMaskResult)result;
- (NSNumber)imageType;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setImageType:(id)a3;
@end

@implementation MADRemoveBackgroundMaskRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADRemoveBackgroundMaskRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADRemoveBackgroundMaskRequest;
  v5 = [(MADRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ImageType"];
    imageType = v5->_imageType;
    v5->_imageType = (NSNumber *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADRemoveBackgroundMaskRequest;
  id v4 = a3;
  [(MADRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageType, @"ImageType", v5.receiver, v5.super_class);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  if (self->_imageType) {
    [v3 appendFormat:@"imageType: %@, ", self->_imageType];
  }
  uint64_t v6 = [(MADRequest *)self results];
  [v3 appendFormat:@"results: %@, ", v6];

  v7 = [(MADRequest *)self error];
  [v3 appendFormat:@"error: %@>", v7];

  return v3;
}

- (MADRemoveBackgroundMaskResult)result
{
  v2 = [(MADRequest *)self results];
  v3 = [v2 firstObject];

  return (MADRemoveBackgroundMaskResult *)v3;
}

- (NSNumber)imageType
{
  return self->_imageType;
}

- (void)setImageType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end