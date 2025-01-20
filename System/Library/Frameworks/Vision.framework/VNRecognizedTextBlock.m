@interface VNRecognizedTextBlock
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)baselines;
- (NSArray)getRecognizedLanguages;
- (NSAttributedString)attributedString;
- (VNRecognizedTextBlock)initWithCoder:(id)a3;
- (VNRecognizedTextBlock)initWithRequestRevision:(unint64_t)a3 crOutputRegion:(id)a4;
- (float)confidence;
- (id)boundingBoxForRange:(_NSRange)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getCROutputRegion;
- (id)string;
- (unint64_t)hash;
- (unint64_t)requestRevision;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNRecognizedTextBlock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baselines, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);

  objc_storeStrong((id *)&self->_crOutputRegion, 0);
}

- (NSArray)baselines
{
  return self->_baselines;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (NSArray)getRecognizedLanguages
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [(VNRecognizedTextBlock *)self getCROutputRegion];
  v3 = [v2 recognizedLocale];

  if (v3)
  {
    v4 = [v2 recognizedLocale];
    v5 = (void *)[v4 copy];
    v8[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v6;
}

- (unint64_t)requestRevision
{
  return self->_requestRevision;
}

- (id)getCROutputRegion
{
  return self->_crOutputRegion;
}

- (id)boundingBoxForRange:(_NSRange)a3 error:(id *)a4
{
  v5 = -[CROutputRegion quadForTextInCharacterRange:](self->_crOutputRegion, "quadForTextInCharacterRange:", a3.location, a3.length, a4);
  v6 = v5;
  if (v5)
  {
    [v5 topLeft];
    double v8 = v7;
    double v10 = 1.0 - v9;
    [v6 topRight];
    double v12 = v11;
    double v14 = 1.0 - v13;
    [v6 bottomLeft];
    double v16 = v15;
    double v18 = 1.0 - v17;
    [v6 bottomRight];
    v21 = -[VNRectangleObservation initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:]([VNRectangleObservation alloc], "initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:", self->_requestRevision, v8, v10, v12, v14, v20, 1.0 - v19, v16, v18);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (float)confidence
{
  [(CROutputRegion *)self->_crOutputRegion rawConfidence];
  return result;
}

- (id)string
{
  return (id)[(CROutputRegion *)self->_crOutputRegion text];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNRecognizedTextBlock *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(CROutputRegion *)self->_crOutputRegion isEqual:v4->_crOutputRegion];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedTextBlock;
  return [(CROutputRegion *)self->_crOutputRegion hash] ^ __ROR8__([(VNRecognizedText *)&v3 hash], 51);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [VNRecognizedTextBlock alloc];
  unint64_t requestRevision = self->_requestRevision;
  v6 = (void *)[(CROutputRegion *)self->_crOutputRegion copy];
  double v7 = [(VNRecognizedTextBlock *)v4 initWithRequestRevision:requestRevision crOutputRegion:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  crOutputRegion = self->_crOutputRegion;
  id v5 = a3;
  [v5 encodeObject:crOutputRegion forKey:@"crOutputRegion"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_requestRevision];
  [v5 encodeObject:v6 forKey:@"requestRevision"];
}

- (VNRecognizedTextBlock)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"crOutputRegion"];
  id v6 = (void *)[v5 copy];

  if (v6)
  {
    double v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestRevision"];
    double v8 = v7;
    if (v7)
    {
      self = -[VNRecognizedTextBlock initWithRequestRevision:crOutputRegion:](self, "initWithRequestRevision:crOutputRegion:", [v7 unsignedIntegerValue], v6);
      double v9 = self;
    }
    else
    {
      double v9 = 0;
    }
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (VNRecognizedTextBlock)initWithRequestRevision:(unint64_t)a3 crOutputRegion:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VNRecognizedTextBlock;
  double v8 = [(VNRecognizedTextBlock *)&v11 init];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_crOutputRegion, a4);
    v9->_unint64_t requestRevision = a3;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end