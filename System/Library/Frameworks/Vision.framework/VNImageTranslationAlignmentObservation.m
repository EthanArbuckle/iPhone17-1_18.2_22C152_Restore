@interface VNImageTranslationAlignmentObservation
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)alignmentTransform;
- (CGAffineTransform)alignmentTransformInTopLeftOrigin:(SEL)a3 orientation:(BOOL)a4;
- (VNImageTranslationAlignmentObservation)init;
- (VNImageTranslationAlignmentObservation)initWithCoder:(id)a3;
- (id)description;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAlignmentTransform:(CGAffineTransform *)a3;
@end

@implementation VNImageTranslationAlignmentObservation

- (void)setAlignmentTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_alignmentTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_alignmentTransform.c = v4;
  *(_OWORD *)&self->_alignmentTransform.tx = v3;
}

- (CGAffineTransform)alignmentTransform
{
  long long v3 = *(_OWORD *)&self[2].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].a;
  return self;
}

- (id)description
{
  id v3 = [NSString alloc];
  v12.receiver = self;
  v12.super_class = (Class)VNImageTranslationAlignmentObservation;
  long long v4 = [(VNObservation *)&v12 description];
  [(VNImageTranslationAlignmentObservation *)self alignmentTransform];
  v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"[%g %g %g %g %g %g]", v8, v9, v10, v11);
  v6 = (void *)[v3 initWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  long long v4 = (VNImageTranslationAlignmentObservation *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VNImageTranslationAlignmentObservation;
    if ([(VNImageAlignmentObservation *)&v10 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      [(VNImageTranslationAlignmentObservation *)self alignmentTransform];
      if (v5) {
        [(VNImageTranslationAlignmentObservation *)v5 alignmentTransform];
      }
      else {
        memset(&v8, 0, sizeof(v8));
      }
      BOOL v6 = CGAffineTransformEqualToTransform(&t1, &v8);
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)VNImageTranslationAlignmentObservation;
  id v3 = [(VNImageAlignmentObservation *)&v6 hash];
  [(VNImageTranslationAlignmentObservation *)self alignmentTransform];
  return VNHashCGAffineTransform((uint64_t)&v5) ^ __ROR8__(v3, 51);
}

- (id)vn_cloneObject
{
  v7.receiver = self;
  v7.super_class = (Class)VNImageTranslationAlignmentObservation;
  id v3 = [(VNImageAlignmentObservation *)&v7 vn_cloneObject];
  if (v3)
  {
    long long v5 = *(_OWORD *)&self->_alignmentTransform.c;
    long long v4 = *(_OWORD *)&self->_alignmentTransform.tx;
    v3[7] = *(_OWORD *)&self->_alignmentTransform.a;
    v3[8] = v5;
    v3[9] = v4;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VNImageTranslationAlignmentObservation;
  [(VNImageAlignmentObservation *)&v7 encodeWithCoder:v4];
  long long v5 = *(_OWORD *)&self->_alignmentTransform.c;
  v6[0] = *(_OWORD *)&self->_alignmentTransform.a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&self->_alignmentTransform.tx;
  objc_msgSend(v4, "vn_encodeCGAffineTransform:forKey:", v6, @"alignmentTransform");
}

- (VNImageTranslationAlignmentObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VNImageTranslationAlignmentObservation;
  long long v5 = [(VNImageAlignmentObservation *)&v11 initWithCoder:v4];
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "vn_decodeCGAffineTransformForKey:", @"alignmentTransform");
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
      long long v8 = 0u;
    }
    *(_OWORD *)&v5->_alignmentTransform.a = v8;
    *(_OWORD *)&v5->_alignmentTransform.c = v9;
    *(_OWORD *)&v5->_alignmentTransform.tx = v10;
    objc_super v6 = v5;
  }

  return v5;
}

- (VNImageTranslationAlignmentObservation)init
{
  v8.receiver = self;
  v8.super_class = (Class)VNImageTranslationAlignmentObservation;
  v2 = [(VNObservation *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v2->_alignmentTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v2->_alignmentTransform.c = v5;
    *(_OWORD *)&v2->_alignmentTransform.tx = v4;
    objc_super v6 = v2;
  }

  return v3;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNTranslationalImageRegistrationRequest";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGAffineTransform)alignmentTransformInTopLeftOrigin:(SEL)a3 orientation:(BOOL)a4
{
  BOOL v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  [(VNImageTranslationAlignmentObservation *)self alignmentTransform];
  long long v8 = v15;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  VNAffineTransformForVisionToTopLeftOriginOrientation(v6, a5, (uint64_t)&v10);
  return CGAffineTransformMakeTranslation(retstr, *(double *)&v12 + *((double *)&v8 + 1) * *(double *)&v11 + *(double *)&v10 * *(double *)&v8, *((double *)&v12 + 1) + *((double *)&v8 + 1) * *((double *)&v11 + 1) + *((double *)&v10 + 1) * *(double *)&v8);
}

@end