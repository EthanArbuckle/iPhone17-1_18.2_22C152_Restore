@interface VNImageNeuralHashprintObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VN6Ac6Cyl5O5oK19HboyMBR)imageNeuralHashprint;
- (VNImageNeuralHashprintObservation)initWithCoder:(id)a3;
- (VNImageNeuralHashprintObservation)initWithOriginatingRequestSpecifier:(id)a3 imageNeuralHashprint:(id)a4;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNImageNeuralHashprintObservation

- (void).cxx_destruct
{
}

- (VN6Ac6Cyl5O5oK19HboyMBR)imageNeuralHashprint
{
  return (VN6Ac6Cyl5O5oK19HboyMBR *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNImageNeuralHashprintObservation *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VNImageNeuralHashprintObservation;
    if ([(VNObservation *)&v10 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = [(VNImageNeuralHashprintObservation *)self imageNeuralHashprint];
      v7 = [(VNImageNeuralHashprintObservation *)v5 imageNeuralHashprint];
      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)VNImageNeuralHashprintObservation;
  id v3 = [(VNObservation *)&v7 hash];
  v4 = [(VNImageNeuralHashprintObservation *)self imageNeuralHashprint];
  unint64_t v5 = [v4 hash] ^ __ROR8__(v3, 51);

  return v5;
}

- (id)vn_cloneObject
{
  v7.receiver = self;
  v7.super_class = (Class)VNImageNeuralHashprintObservation;
  id v3 = [(VNObservation *)&v7 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(VN6Ac6Cyl5O5oK19HboyMBR *)self->_imageNeuralHashprint copy];
    unint64_t v5 = (void *)v3[12];
    v3[12] = v4;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNImageNeuralHashprintObservation;
  [(VNObservation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, @"VNImageNeuralHashprintObservation");
  [v4 encodeObject:self->_imageNeuralHashprint forKey:@"nrlHshPrnt"];
}

- (VNImageNeuralHashprintObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNImageNeuralHashprintObservation;
  objc_super v5 = [(VNObservation *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "vn_decodeCodingVersionForKey:", @"VNImageNeuralHashprintObservation");
    if (!v6)
    {
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nrlHshPrnt"];
      imageNeuralHashprint = v5->_imageNeuralHashprint;
      v5->_imageNeuralHashprint = (VN6Ac6Cyl5O5oK19HboyMBR *)v10;

      v9 = v5;
      goto LABEL_6;
    }
    objc_super v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to unarchive %@ object due to coding version mismatch: Currently supported: %u; encoded: %u",
                   objc_opt_class(),
                   0,
                   v6);
    char v8 = +[VNError errorForInternalErrorWithLocalizedDescription:v7];
    [v4 failWithError:v8];
  }
  v9 = 0;
LABEL_6:

  return v9;
}

- (VNImageNeuralHashprintObservation)initWithOriginatingRequestSpecifier:(id)a3 imageNeuralHashprint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VNImageNeuralHashprintObservation;
  char v8 = [(VNObservation *)&v13 initWithOriginatingRequestSpecifier:v6];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    imageNeuralHashprint = v8->_imageNeuralHashprint;
    v8->_imageNeuralHashprint = (VN6Ac6Cyl5O5oK19HboyMBR *)v9;

    v11 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end