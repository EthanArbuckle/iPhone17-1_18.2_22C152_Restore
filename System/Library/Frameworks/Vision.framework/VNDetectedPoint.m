@interface VNDetectedPoint
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VNConfidence)confidence;
- (VNDetectedPoint)initWithCoder:(id)a3;
- (VNDetectedPoint)initWithLocation:(CGPoint)a3 confidence:(float)a4;
- (id)transformedWith:(CGAffineTransform *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNDetectedPoint

- (id)transformedWith:(CGAffineTransform *)a3
{
  [(VNPoint *)self location];
  float64x2_t v12 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v5), *(float64x2_t *)&a3->a, v6));
  id v7 = objc_alloc((Class)objc_opt_class());
  [(VNDetectedPoint *)self confidence];
  LODWORD(v9) = v8;
  v10 = (void *)[v7 initWithLocation:*(_OWORD *)&v12 confidence:v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (float *)a3;
  v7.receiver = self;
  v7.super_class = (Class)VNDetectedPoint;
  BOOL v5 = [(VNPoint *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && self->_confidence == v4[6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VNDetectedPoint;
  [(VNPoint *)&v6 encodeWithCoder:v4];
  *(float *)&double v5 = self->_confidence;
  objc_msgSend(v4, "vn_encodeValidatedConfidence:forKey:", @"Confid", v5);
}

- (VNDetectedPoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VNDetectedPoint;
  double v5 = [(VNPoint *)&v8 initWithCoder:v4];
  if (v5)
  {
    objc_msgSend(v4, "vn_decodeValidatedConfidenceForKey:", @"Confid");
    v5->_confidence = v6;
  }

  return v5;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)VNDetectedPoint;
  id v3 = [(VNPoint *)&v7 hash];
  float confidence = self->_confidence;
  uint64_t v5 = LODWORD(confidence);
  if (confidence == 0.0) {
    uint64_t v5 = 0;
  }
  return v5 ^ __ROR8__(v3, 51);
}

- (VNConfidence)confidence
{
  return self->_confidence;
}

- (VNDetectedPoint)initWithLocation:(CGPoint)a3 confidence:(float)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VNDetectedPoint;
  uint64_t v5 = -[VNPoint initWithLocation:](&v9, sel_initWithLocation_, a3.x, a3.y);
  float v6 = v5;
  if (v5)
  {
    v5->_float confidence = a4;
    objc_super v7 = v5;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end