@interface VNFaceScreenGaze
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGPoint)screenGazeRawOutputInCentimeters;
- (VNFaceScreenGaze)initWithCoder:(id)a3;
- (VNRequestSpecifier)originatingRequestSpecifier;
- (float)difficultToSay;
- (float)lookingAtDevice;
- (float)notLookingAtDevice;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)initWithScreenGaze:(void *)a3 originatingRequestSpecifier:;
@end

@implementation VNFaceScreenGaze

- (void).cxx_destruct
{
}

- (float)notLookingAtDevice
{
  return self->_notLookingAtDevice;
}

- (float)lookingAtDevice
{
  return self->_lookingAtDevice;
}

- (id)description
{
  v3 = NSString;
  [(VNFaceScreenGaze *)self screenGazeRawOutputInCentimeters];
  uint64_t v5 = v4;
  [(VNFaceScreenGaze *)self screenGazeRawOutputInCentimeters];
  uint64_t v7 = v6;
  [(VNFaceScreenGaze *)self lookingAtDevice];
  double v9 = v8;
  [(VNFaceScreenGaze *)self notLookingAtDevice];
  return (id)[v3 stringWithFormat:@"screen gaze in cm [%f, %f]. Probabilities: looking = %f, notLooking = %f,", v5, v7, *(void *)&v9, v10];
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return self->_originatingRequestSpecifier;
}

- (float)difficultToSay
{
  return NAN;
}

- (CGPoint)screenGazeRawOutputInCentimeters
{
  double x = self->_screenGaze.x;
  double y = self->_screenGaze.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (VNFaceScreenGaze)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "vn_decodePointForKey:", @"gaze");
  double v6 = v5;
  double v8 = v7;
  double v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"oreq"];
  if (!v9)
  {
    id v17 = 0;
    double v9 = +[VNRequestSpecifier specifierForRequestClassName:@"VNDetectScreenGazeRequest" revision:1 error:&v17];
    id v10 = v17;
    v11 = v10;
    if (!v9)
    {
      [v4 failWithError:v10];
      v14 = 0;
      goto LABEL_5;
    }
  }
  v16[1] = (float32x2_t)vdup_n_s32(0x7FC00000u);
  *(float *)&unsigned int v12 = v6;
  *(float *)&unsigned int v13 = v8;
  v16[0] = (float32x2_t)__PAIR64__(v13, v12);
  self = -[VNFaceScreenGaze initWithScreenGaze:originatingRequestSpecifier:](self, v16, v9);
  v11 = v9;
  v14 = self;
LABEL_5:

  return v14;
}

- (void)initWithScreenGaze:(void *)a3 originatingRequestSpecifier:
{
  id v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)VNFaceScreenGaze;
    id v7 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      *((float64x2_t *)v7 + 1) = vcvtq_f64_f32(*a2);
      *((_DWORD *)v7 + 8) = a2[1].i32[1];
      *((_DWORD *)v7 + 9) = a2[1].i32[0];
      objc_storeStrong((id *)v7 + 1, a3);
    }
  }

  return a1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "vn_encodePoint:forKey:", @"gaze", self->_screenGaze.x, self->_screenGaze.y);
  [v4 encodeObject:self->_originatingRequestSpecifier forKey:@"oreq"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNFaceScreenGaze *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)VNFaceScreenGaze;
    if ([(VNFaceScreenGaze *)&v16 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      double v5 = v4;
      [(VNFaceScreenGaze *)self screenGazeRawOutputInCentimeters];
      double v7 = v6;
      double v9 = v8;
      [(VNFaceScreenGaze *)v5 screenGazeRawOutputInCentimeters];
      char v11 = 0;
      if (v7 == v12 && v9 == v10)
      {
        unsigned int v13 = [(VNFaceScreenGaze *)self originatingRequestSpecifier];
        v14 = [(VNFaceScreenGaze *)v5 originatingRequestSpecifier];
        char v11 = [v13 isEqual:v14];
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
  double x = self->_screenGaze.x;
  if (x == 0.0) {
    double x = 0.0;
  }
  double y = self->_screenGaze.y;
  if (y == 0.0) {
    double y = 0.0;
  }
  return [(VNRequestSpecifier *)self->_originatingRequestSpecifier hash] ^ __ROR8__(*(void *)&y ^ __ROR8__(*(void *)&x, 51), 51);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end