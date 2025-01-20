@interface VNSupportedImageSize
+ (BOOL)supportsSecureCoding;
- (BOOL)isAllowedPixelsWide:(unint64_t)a3 pixelsHigh:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOrientationAgnostic;
- (VNSizeRange)pixelsHighRange;
- (VNSizeRange)pixelsWideRange;
- (VNSupportedImageSize)initWithCoder:(id)a3;
- (VNSupportedImageSize)initWithIdealFormat:(unsigned int)a3 pixelsWideRange:(id)a4 pixelsHighRange:(id)a5 aspectRatioHandling:(unint64_t)a6 idealOrientation:(unsigned int)a7 orientationAgnostic:(BOOL)a8;
- (VNSupportedImageSize)initWithIdealFormat:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5 orientation:(unsigned int)a6 aspectRatioHandling:(unint64_t)a7 orientationAgnostic:(BOOL)a8;
- (unint64_t)aspectRatioHandling;
- (unint64_t)hash;
- (unsigned)idealImageFormat;
- (unsigned)idealOrientation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNSupportedImageSize

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelsHighRange, 0);

  objc_storeStrong((id *)&self->_pixelsWideRange, 0);
}

- (BOOL)isOrientationAgnostic
{
  return self->_orientationAgnostic;
}

- (unsigned)idealOrientation
{
  return self->_idealOrientation;
}

- (unsigned)idealImageFormat
{
  return self->_idealImageFormat;
}

- (unint64_t)aspectRatioHandling
{
  return self->_aspectRatioHandling;
}

- (VNSizeRange)pixelsHighRange
{
  return self->_pixelsHighRange;
}

- (VNSizeRange)pixelsWideRange
{
  return self->_pixelsWideRange;
}

- (VNSupportedImageSize)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"idealFormat"];
  uint64_t v6 = objc_opt_class();
  v7 = [v4 decodeObjectOfClass:v6 forKey:@"wideRange"];
  v8 = [v4 decodeObjectOfClass:v6 forKey:@"highRange"];
  v9 = -[VNSupportedImageSize initWithIdealFormat:pixelsWideRange:pixelsHighRange:aspectRatioHandling:idealOrientation:orientationAgnostic:](self, "initWithIdealFormat:pixelsWideRange:pixelsHighRange:aspectRatioHandling:idealOrientation:orientationAgnostic:", v5, v7, v8, [v4 decodeIntegerForKey:@"aspectHandling"], objc_msgSend(v4, "decodeInt32ForKey:", @"idealOrientation"), objc_msgSend(v4, "decodeBoolForKey:", @"orientationAgnostic"));

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_idealImageFormat forKey:@"idealFormat"];
  [v4 encodeObject:self->_pixelsWideRange forKey:@"wideRange"];
  [v4 encodeObject:self->_pixelsHighRange forKey:@"highRange"];
  [v4 encodeInteger:self->_aspectRatioHandling forKey:@"aspectHandling"];
  [v4 encodeInt32:self->_idealOrientation forKey:@"idealOrientation"];
  [v4 encodeBool:self->_orientationAgnostic forKey:@"orientationAgnostic"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNSupportedImageSize *)a3;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unsigned int v6 = [(VNSupportedImageSize *)self idealImageFormat];
      if (v6 != [(VNSupportedImageSize *)v5 idealImageFormat]) {
        goto LABEL_11;
      }
      v7 = [(VNSupportedImageSize *)self pixelsWideRange];
      v8 = [(VNSupportedImageSize *)v5 pixelsWideRange];
      char v9 = VisionCoreEqualOrNilObjects();

      if ((v9 & 1) == 0) {
        goto LABEL_11;
      }
      v10 = [(VNSupportedImageSize *)self pixelsHighRange];
      v11 = [(VNSupportedImageSize *)v5 pixelsHighRange];
      char v12 = VisionCoreEqualOrNilObjects();

      if ((v12 & 1) == 0) {
        goto LABEL_11;
      }
      unint64_t v13 = [(VNSupportedImageSize *)self aspectRatioHandling];
      if (v13 == [(VNSupportedImageSize *)v5 aspectRatioHandling]
        && (unsigned int v14 = [(VNSupportedImageSize *)self idealOrientation],
            v14 == [(VNSupportedImageSize *)v5 idealOrientation]))
      {
        BOOL v15 = [(VNSupportedImageSize *)self isOrientationAgnostic];
        BOOL v16 = v15 ^ [(VNSupportedImageSize *)v5 isOrientationAgnostic] ^ 1;
      }
      else
      {
LABEL_11:
        LOBYTE(v16) = 0;
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  unint64_t result = self->_cachedCalculatedHash;
  if (!result)
  {
    unsigned int v4 = [(VNSupportedImageSize *)self idealImageFormat];
    uint64_t v5 = [(VNSupportedImageSize *)self pixelsWideRange];
    uint64_t v6 = [v5 hash];

    v7 = [(VNSupportedImageSize *)self pixelsHighRange];
    uint64_t v8 = [v7 hash] ^ __ROR8__(v6 ^ ((unint64_t)v4 << 13), 51);

    uint64_t v9 = [(VNSupportedImageSize *)self idealOrientation] ^ __ROR8__([(VNSupportedImageSize *)self aspectRatioHandling] ^ __ROR8__(v8, 51), 51);
    BOOL v10 = [(VNSupportedImageSize *)self isOrientationAgnostic];
    uint64_t v11 = 21845;
    if (v10) {
      uint64_t v11 = 43690;
    }
    unint64_t result = v11 ^ __ROR8__(v9, 51);
    self->_cachedCalculatedHash = result;
  }
  return result;
}

- (BOOL)isAllowedPixelsWide:(unint64_t)a3 pixelsHigh:(unint64_t)a4
{
  v7 = [(VNSupportedImageSize *)self pixelsWideRange];
  if ([v7 isAllowedDimension:a3])
  {
    uint64_t v8 = [(VNSupportedImageSize *)self pixelsHighRange];
    char v9 = [v8 isAllowedDimension:a4];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (VNSupportedImageSize)initWithIdealFormat:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5 orientation:(unsigned int)a6 aspectRatioHandling:(unint64_t)a7 orientationAgnostic:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v10 = *(void *)&a6;
  uint64_t v13 = *(void *)&a3;
  BOOL v15 = [[VNSizeRange alloc] initWithMinimumDimension:a4 maximumDimension:a4 idealDimension:a4];
  BOOL v16 = v15;
  if (a4 == a5) {
    v17 = v15;
  }
  else {
    v17 = [[VNSizeRange alloc] initWithMinimumDimension:a5 maximumDimension:a5 idealDimension:a5];
  }
  v18 = v17;
  v19 = [(VNSupportedImageSize *)self initWithIdealFormat:v13 pixelsWideRange:v16 pixelsHighRange:v17 aspectRatioHandling:a7 idealOrientation:v10 orientationAgnostic:v8];

  return v19;
}

- (VNSupportedImageSize)initWithIdealFormat:(unsigned int)a3 pixelsWideRange:(id)a4 pixelsHighRange:(id)a5 aspectRatioHandling:(unint64_t)a6 idealOrientation:(unsigned int)a7 orientationAgnostic:(BOOL)a8
{
  id v14 = a4;
  id v15 = a5;
  v24.receiver = self;
  v24.super_class = (Class)VNSupportedImageSize;
  BOOL v16 = [(VNSupportedImageSize *)&v24 init];
  v17 = v16;
  if (v16)
  {
    v16->_idealImageFormat = a3;
    uint64_t v18 = [v14 copy];
    pixelsWideRange = v17->_pixelsWideRange;
    v17->_pixelsWideRange = (VNSizeRange *)v18;

    uint64_t v20 = [v15 copy];
    pixelsHighRange = v17->_pixelsHighRange;
    v17->_pixelsHighRange = (VNSizeRange *)v20;

    v17->_aspectRatioHandling = a6;
    v17->_idealOrientation = a7;
    v17->_orientationAgnostic = a8;
    v22 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end