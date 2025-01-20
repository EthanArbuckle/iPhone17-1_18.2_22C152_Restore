@interface MADRemoveBackgroundMatteRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)cropResult;
- (BOOL)inPlace;
- (MADRemoveBackgroundMatteRequest)init;
- (MADRemoveBackgroundMatteRequest)initWithCoder:(id)a3;
- (MADRemoveBackgroundMatteResult)result;
- (NSIndexSet)instances;
- (NSNumber)imageType;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCropResult:(BOOL)a3;
- (void)setImageType:(id)a3;
- (void)setInPlace:(BOOL)a3;
- (void)setInstances:(id)a3;
@end

@implementation MADRemoveBackgroundMatteRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADRemoveBackgroundMatteRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)MADRemoveBackgroundMatteRequest;
  v2 = [(MADRemoveBackgroundMatteRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D60] indexSet];
    instances = v2->_instances;
    v2->_instances = (NSIndexSet *)v3;
  }
  return v2;
}

- (MADRemoveBackgroundMatteRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADRemoveBackgroundMatteRequest;
  v5 = [(MADRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Instances"];
    instances = v5->_instances;
    v5->_instances = (NSIndexSet *)v6;

    v5->_inPlace = [v4 decodeBoolForKey:@"InPlace"];
    v5->_cropResult = [v4 decodeBoolForKey:@"CropResult"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ImageType"];
    imageType = v5->_imageType;
    v5->_imageType = (NSNumber *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADRemoveBackgroundMatteRequest;
  id v4 = a3;
  [(MADRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_instances, @"Instances", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_inPlace forKey:@"InPlace"];
  [v4 encodeBool:self->_cropResult forKey:@"CropResult"];
  [v4 encodeObject:self->_imageType forKey:@"ImageType"];
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  if (self->_instances) {
    [v3 appendFormat:@"instances: %@, ", self->_instances];
  }
  [v3 appendFormat:@"inPlace: %d, ", self->_inPlace];
  [v3 appendFormat:@"cropResult: %d, ", self->_cropResult];
  if (self->_imageType) {
    [v3 appendFormat:@"imageType: %@, ", self->_imageType];
  }
  uint64_t v6 = [(MADRequest *)self results];
  [v3 appendFormat:@"results: %@, ", v6];

  v7 = [(MADRequest *)self error];
  [v3 appendFormat:@"error: %@>", v7];

  return v3;
}

- (MADRemoveBackgroundMatteResult)result
{
  v2 = [(MADRequest *)self results];
  uint64_t v3 = [v2 firstObject];

  return (MADRemoveBackgroundMatteResult *)v3;
}

- (NSIndexSet)instances
{
  return self->_instances;
}

- (void)setInstances:(id)a3
{
}

- (BOOL)inPlace
{
  return self->_inPlace;
}

- (void)setInPlace:(BOOL)a3
{
  self->_inPlace = a3;
}

- (BOOL)cropResult
{
  return self->_cropResult;
}

- (void)setCropResult:(BOOL)a3
{
  self->_cropResult = a3;
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
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_instances, 0);
}

@end