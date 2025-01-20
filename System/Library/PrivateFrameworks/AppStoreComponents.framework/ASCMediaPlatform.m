@interface ASCMediaPlatform
+ (BOOL)supportsSecureCoding;
- (ASCMediaPlatform)initWithCoder:(id)a3;
- (ASCMediaPlatform)initWithDeviceCornerRadiusFactor:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSNumber)deviceCornerRadiusFactor;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCMediaPlatform

- (ASCMediaPlatform)initWithDeviceCornerRadiusFactor:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASCMediaPlatform;
  v5 = [(ASCMediaPlatform *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    deviceCornerRadiusFactor = v5->_deviceCornerRadiusFactor;
    v5->_deviceCornerRadiusFactor = (NSNumber *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCMediaPlatform)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceCornerRadiusFactor"];

  v10.receiver = self;
  v10.super_class = (Class)ASCMediaPlatform;
  uint64_t v6 = [(ASCMediaPlatform *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    deviceCornerRadiusFactor = v6->_deviceCornerRadiusFactor;
    v6->_deviceCornerRadiusFactor = (NSNumber *)v7;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCMediaPlatform *)self deviceCornerRadiusFactor];
  [v4 encodeObject:v5 forKey:@"deviceCornerRadiusFactor"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCMediaPlatform *)self deviceCornerRadiusFactor];
  [(ASCHasher *)v3 combineObject:v4];

  unint64_t v5 = [(ASCHasher *)v3 finalizeHash];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCMediaPlatform *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    unint64_t v5 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    v8 = v6;

    if (v8)
    {
      objc_super v9 = [(ASCMediaPlatform *)self deviceCornerRadiusFactor];
      uint64_t v10 = [(ASCMediaPlatform *)v8 deviceCornerRadiusFactor];
      v11 = (void *)v10;
      if (v9 && v10) {
        char v7 = [v9 isEqual:v10];
      }
      else {
        char v7 = v9 == (void *)v10;
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  return v7;
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCMediaPlatform *)self deviceCornerRadiusFactor];
  [(ASCDescriber *)v3 addObject:v4 withName:@"deviceCornerRadiusFactor"];

  unint64_t v5 = [(ASCDescriber *)v3 finalizeDescription];

  return v5;
}

- (NSNumber)deviceCornerRadiusFactor
{
  return self->_deviceCornerRadiusFactor;
}

- (void).cxx_destruct
{
}

@end