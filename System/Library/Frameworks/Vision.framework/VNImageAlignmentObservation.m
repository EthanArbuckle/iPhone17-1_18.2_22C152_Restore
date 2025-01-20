@interface VNImageAlignmentObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)alignmentTransform;
- (VNImageAlignmentObservation)initWithCoder:(id)a3;
- (VNImageRegistrationSignature)floatingImageSignature;
- (VNImageRegistrationSignature)referenceImageSignature;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAlignmentTransform:(CGAffineTransform *)a3;
- (void)setFloatingImageSignature:(id)a3;
- (void)setReferenceImageSignature:(id)a3;
@end

@implementation VNImageAlignmentObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingImageSignature, 0);

  objc_storeStrong((id *)&self->_referenceImageSignature, 0);
}

- (void)setFloatingImageSignature:(id)a3
{
}

- (VNImageRegistrationSignature)floatingImageSignature
{
  return self->_floatingImageSignature;
}

- (void)setReferenceImageSignature:(id)a3
{
}

- (VNImageRegistrationSignature)referenceImageSignature
{
  return self->_referenceImageSignature;
}

- (void)setAlignmentTransform:(CGAffineTransform *)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  NSStringFromSelector(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 raise:*MEMORY[0x1E4F28778], @"%@ is not supported by %@", v6, v5 format];
}

- (CGAffineTransform)alignmentTransform
{
  uint64_t v3 = MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (BOOL)isEqual:(id)a3
{
  long long v4 = (VNImageAlignmentObservation *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VNImageAlignmentObservation;
    if ([(VNObservation *)&v13 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      id v6 = [(VNImageAlignmentObservation *)self referenceImageSignature];
      v7 = [(VNImageAlignmentObservation *)v5 referenceImageSignature];
      char v8 = VisionCoreEqualOrNilObjects();

      if (v8)
      {
        v9 = [(VNImageAlignmentObservation *)self floatingImageSignature];
        v10 = [(VNImageAlignmentObservation *)v5 floatingImageSignature];
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
  v9.super_class = (Class)VNImageAlignmentObservation;
  id v3 = [(VNObservation *)&v9 hash];
  long long v4 = [(VNImageAlignmentObservation *)self referenceImageSignature];
  uint64_t v5 = [v4 hash];

  id v6 = [(VNImageAlignmentObservation *)self floatingImageSignature];
  unint64_t v7 = [v6 hash] ^ __ROR8__(v5 ^ __ROR8__(v3, 51), 51);

  return v7;
}

- (id)vn_cloneObject
{
  v6.receiver = self;
  v6.super_class = (Class)VNImageAlignmentObservation;
  id v3 = [(VNObservation *)&v6 vn_cloneObject];
  long long v4 = v3;
  if (v3)
  {
    [v3 setReferenceImageSignature:self->_referenceImageSignature];
    [v4 setFloatingImageSignature:self->_floatingImageSignature];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNImageAlignmentObservation;
  [(VNObservation *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_referenceImageSignature forKey:@"referenceImageSignature"];
  [v4 encodeObject:self->_floatingImageSignature forKey:@"floatingImageSignature"];
}

- (VNImageAlignmentObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VNImageAlignmentObservation;
  objc_super v5 = [(VNObservation *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceImageSignature"];
    referenceImageSignature = v5->_referenceImageSignature;
    v5->_referenceImageSignature = (VNImageRegistrationSignature *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"floatingImageSignature"];
    floatingImageSignature = v5->_floatingImageSignature;
    v5->_floatingImageSignature = (VNImageRegistrationSignature *)v8;

    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end