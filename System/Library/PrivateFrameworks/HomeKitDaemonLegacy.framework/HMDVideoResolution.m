@interface HMDVideoResolution
+ (BOOL)supportsSecureCoding;
+ (id)arrayWithResolutions:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMDVideoResolution)initWithCoder:(id)a3;
- (HMDVideoResolution)initWithResolution:(unint64_t)a3;
- (HMDVideoResolution)initWithTLVData:(id)a3;
- (NSNumber)imageHeight;
- (NSNumber)imageWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)resolutionType;
- (void)_extractWidthAndHeight;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDVideoResolution

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageHeight, 0);
  objc_storeStrong((id *)&self->_imageWidth, 0);
}

- (NSNumber)imageWidth
{
  return self->_imageWidth;
}

- (NSNumber)imageHeight
{
  return self->_imageHeight;
}

+ (id)arrayWithResolutions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [HMDVideoResolution alloc];
        v12 = -[HMDVideoResolution initWithResolution:](v11, "initWithResolution:", objc_msgSend(v10, "unsignedIntegerValue", (void)v14));
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (HMDVideoResolution)initWithResolution:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDVideoResolution;
  v4 = [(HMDVideoResolution *)&v7 init];
  id v5 = v4;
  if (v4)
  {
    v4->_resolutionType = a3;
    [(HMDVideoResolution *)v4 _extractWidthAndHeight];
  }
  return v5;
}

- (void)_extractWidthAndHeight
{
  id v8 = 0;
  id v9 = 0;
  +[HMDVideoAttributes translateImageResolution:self imageWidth:&v9 imageHeight:&v8];
  id v3 = (NSNumber *)v9;
  v4 = (NSNumber *)v8;
  imageWidth = self->_imageWidth;
  self->_imageWidth = v3;
  uint64_t v6 = v3;

  imageHeight = self->_imageHeight;
  self->_imageHeight = v4;
}

- (unint64_t)resolutionType
{
  return self->_resolutionType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDVideoResolution allocWithZone:a3];
  unint64_t v5 = [(HMDVideoResolution *)self resolutionType];
  return [(HMDVideoResolution *)v4 initWithResolution:v5];
}

- (HMDVideoResolution)initWithTLVData:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDVideoResolution;
  id v3 = [(HAPNumberParser *)&v6 initWithTLVData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_resolutionType = [(HAPNumberParser *)v3 decodedNumber];
    [(HMDVideoResolution *)v4 _extractWidthAndHeight];
  }
  return v4;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  HMDVideoResolutionTypeAsString([(HMDVideoResolution *)self resolutionType]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v7 appendFormat:@"\n%@ resolutionType = %@", v6, v8];
}

- (id)description
{
  v2 = NSString;
  id v3 = HMDVideoResolutionTypeAsString([(HMDVideoResolution *)self resolutionType]);
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDVideoResolution *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(HMDVideoResolution *)self resolutionType];
      BOOL v6 = v5 == [(HMDVideoResolution *)v4 resolutionType];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HMDVideoResolution *)self resolutionType];
  objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "HMDVideoResolution", "resolutionType");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInt32:v5 forKey:v6];
}

- (HMDVideoResolution)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDVideoResolution;
  unint64_t v5 = [(HMDVideoResolution *)&v8 init];
  if (v5)
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "HMDVideoResolution", "resolutionType");
    v5->_resolutionType = (int)[v4 decodeInt32ForKey:v6];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end