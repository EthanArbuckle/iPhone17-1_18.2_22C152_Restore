@interface VNImageScoreObservation
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSNumber)blurScore;
- (NSNumber)exposureScore;
- (VNImageScoreObservation)initWithCoder:(id)a3;
- (id)description;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBlurScore:(id)a3;
- (void)setExposureScore:(id)a3;
@end

@implementation VNImageScoreObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposureScore, 0);

  objc_storeStrong((id *)&self->_blurScore, 0);
}

- (void)setExposureScore:(id)a3
{
}

- (NSNumber)exposureScore
{
  return self->_exposureScore;
}

- (void)setBlurScore:(id)a3
{
}

- (NSNumber)blurScore
{
  return self->_blurScore;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)VNImageScoreObservation;
  v3 = [(VNObservation *)&v11 description];
  uint64_t v4 = [(VNImageScoreObservation *)self blurScore];
  v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@" blurScore=%@", v4];

    v3 = (void *)v6;
  }
  uint64_t v7 = [(VNImageScoreObservation *)self exposureScore];
  v8 = (void *)v7;
  if (v7)
  {
    uint64_t v9 = [v3 stringByAppendingFormat:@" exposureScore=%@", v7];

    v3 = (void *)v9;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VNImageScoreObservation *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VNImageScoreObservation;
    if ([(VNObservation *)&v13 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      uint64_t v6 = [(VNImageScoreObservation *)self blurScore];
      uint64_t v7 = [(VNImageScoreObservation *)v5 blurScore];
      char v8 = VisionCoreEqualOrNilObjects();

      if (v8)
      {
        uint64_t v9 = [(VNImageScoreObservation *)self exposureScore];
        v10 = [(VNImageScoreObservation *)v5 exposureScore];
        char v11 = VisionCoreEqualOrNilObjects();
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)VNImageScoreObservation;
  id v3 = [(VNObservation *)&v9 hash];
  uint64_t v4 = [(VNImageScoreObservation *)self blurScore];
  uint64_t v5 = [v4 hash];

  uint64_t v6 = [(VNImageScoreObservation *)self exposureScore];
  unint64_t v7 = [v6 hash] ^ __ROR8__(v5 ^ __ROR8__(v3, 51), 51);

  return v7;
}

- (id)vn_cloneObject
{
  v6.receiver = self;
  v6.super_class = (Class)VNImageScoreObservation;
  id v3 = [(VNObservation *)&v6 vn_cloneObject];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 setBlurScore:self->_blurScore];
    [v4 setExposureScore:self->_exposureScore];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNImageScoreObservation;
  [(VNObservation *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_blurScore forKey:@"blur"];
  [v4 encodeObject:self->_exposureScore forKey:@"exposure"];
}

- (VNImageScoreObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VNImageScoreObservation;
  objc_super v5 = [(VNObservation *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blur"];
    blurScore = v5->_blurScore;
    v5->_blurScore = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"exposure"];
    exposureScore = v5->_exposureScore;
    v5->_exposureScore = (NSNumber *)v8;

    v10 = v5;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end