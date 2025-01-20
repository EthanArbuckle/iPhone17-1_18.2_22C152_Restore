@interface HMIObjectDetection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGRect)boundingBox;
- (HMIObjectDetection)initWithCoder:(id)a3;
- (HMIObjectDetection)initWithLabelIndex:(int)a3 confidence:(double)a4 unclampedBoundingBox:(CGRect)a5 yaw:(id)a6 roll:(id)a7;
- (NSNumber)roll;
- (NSNumber)yaw;
- (double)confidence;
- (id)description;
- (int)labelIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIObjectDetection

- (HMIObjectDetection)initWithLabelIndex:(int)a3 confidence:(double)a4 unclampedBoundingBox:(CGRect)a5 yaw:(id)a6 roll:(id)a7
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v16 = a6;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMIObjectDetection;
  v18 = [(HMIObjectDetection *)&v21 init];
  v19 = v18;
  if (v18)
  {
    v18->_labelIndeCGFloat x = a3;
    v18->_confidence = a4;
    v18->_boundingBox.origin.CGFloat x = x;
    v18->_boundingBox.origin.CGFloat y = y;
    v18->_boundingBox.size.CGFloat width = width;
    v18->_boundingBox.size.CGFloat height = height;
    objc_storeStrong((id *)&v18->_yaw, a6);
    objc_storeStrong((id *)&v19->_roll, a7);
  }

  return v19;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(HMIObjectDetection *)self labelIndex];
  [(HMIObjectDetection *)self confidence];
  uint64_t v6 = v5;
  [(HMIObjectDetection *)self boundingBox];
  uint64_t v8 = v7;
  [(HMIObjectDetection *)self boundingBox];
  uint64_t v10 = v9;
  [(HMIObjectDetection *)self boundingBox];
  uint64_t v12 = v11;
  [(HMIObjectDetection *)self boundingBox];
  uint64_t v14 = v13;
  v15 = [(HMIObjectDetection *)self yaw];
  id v16 = [v3 stringWithFormat:@"Label:%d Confidence:%f X:%f Y:%f Width:%f Height:%f Yaw:%@}", v4, v6, v8, v10, v12, v14, v15];

  return v16;
}

- (int)labelIndex
{
  return self->_labelIndex;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSNumber)yaw
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)roll
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roll, 0);
  objc_storeStrong((id *)&self->_yaw, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIObjectDetection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntForKey:@"HMIOD.l"];
  [v4 decodeDoubleForKey:@"HMIOD.c"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"HMIOD.b.x"];
  double v9 = v8;
  [v4 decodeDoubleForKey:@"HMIOD.b.y"];
  double v11 = v10;
  [v4 decodeDoubleForKey:@"HMIOD.b.w"];
  double v13 = v12;
  [v4 decodeDoubleForKey:@"HMIOD.b.h"];
  double v15 = v14;
  id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIOD.y.a"];
  id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIOD.r.o"];

  v18 = -[HMIObjectDetection initWithLabelIndex:confidence:boundingBox:yaw:roll:](self, "initWithLabelIndex:confidence:boundingBox:yaw:roll:", v5, v16, v17, v7, v9, v11, v13, v15);
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[HMIObjectDetection labelIndex](self, "labelIndex"), @"HMIOD.l");
  [(HMIObjectDetection *)self confidence];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HMIOD.c");
  [(HMIObjectDetection *)self boundingBox];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HMIOD.b.x");
  [(HMIObjectDetection *)self boundingBox];
  [v4 encodeDouble:@"HMIOD.b.y" forKey:v5];
  [(HMIObjectDetection *)self boundingBox];
  [v4 encodeDouble:@"HMIOD.b.w" forKey:v6];
  [(HMIObjectDetection *)self boundingBox];
  [v4 encodeDouble:@"HMIOD.b.h" forKey:v7];
  double v8 = [(HMIObjectDetection *)self yaw];
  [v4 encodeObject:v8 forKey:@"HMIOD.y.a"];

  id v9 = [(HMIObjectDetection *)self roll];
  [v4 encodeObject:v9 forKey:@"HMIOD.r.o"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMIObjectDetection *)a3;
  if (v4 == self)
  {
    BOOL v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      int v6 = [(HMIObjectDetection *)self labelIndex];
      int v7 = [(HMIObjectDetection *)v5 labelIndex];
      [(HMIObjectDetection *)self confidence];
      double v9 = v8;
      [(HMIObjectDetection *)v5 confidence];
      double v11 = v10;
      double v12 = [(HMIObjectDetection *)self yaw];
      double v13 = [(HMIObjectDetection *)v5 yaw];
      int v14 = HMFEqualObjects();

      double v15 = [(HMIObjectDetection *)self roll];
      id v16 = [(HMIObjectDetection *)v5 roll];
      int v17 = HMFEqualObjects();

      BOOL v18 = 0;
      if (v6 == v7 && v9 == v11 && v14 && v17)
      {
        [(HMIObjectDetection *)self boundingBox];
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        [(HMIObjectDetection *)v5 boundingBox];
        v33.origin.double x = v27;
        v33.origin.double y = v28;
        v33.size.double width = v29;
        v33.size.double height = v30;
        v32.origin.double x = v20;
        v32.origin.double y = v22;
        v32.size.double width = v24;
        v32.size.double height = v26;
        BOOL v18 = CGRectEqualToRect(v32, v33);
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  int v3 = [(HMIObjectDetection *)self labelIndex];
  [(HMIObjectDetection *)self confidence];
  double v5 = -v4;
  if (v4 >= 0.0) {
    double v5 = v4;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  double v8 = fmod(v6, 1.84467441e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabs(v7);
  if (v7 < 0.0) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  if (v3 >= 0) {
    unsigned int v13 = v3;
  }
  else {
    unsigned int v13 = -v3;
  }
  uint64_t v14 = 2654435761 * v13;
  [(HMIObjectDetection *)self boundingBox];
  unint64_t v19 = v14 ^ HMIHashCGRect(v15, v16, v17, v18);
  CGFloat v20 = [(HMIObjectDetection *)self yaw];
  uint64_t v21 = v19 ^ [v20 hash];
  CGFloat v22 = [(HMIObjectDetection *)self roll];
  unint64_t v23 = v12 ^ v21 ^ [v22 hash];

  return v23;
}

@end