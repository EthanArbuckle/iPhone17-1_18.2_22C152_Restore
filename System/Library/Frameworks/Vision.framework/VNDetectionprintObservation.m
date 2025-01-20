@interface VNDetectionprintObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VNDetectionprint)detectionprint;
- (VNDetectionprintObservation)initWithCoder:(id)a3;
- (VNDetectionprintObservation)initWithOriginatingRequestSpecifier:(id)a3 detectionprint:(id)a4;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNDetectionprintObservation

- (void).cxx_destruct
{
}

- (VNDetectionprint)detectionprint
{
  return (VNDetectionprint *)objc_getProperty(self, a2, 96, 1);
}

- (VNDetectionprintObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VNDetectionprintObservation;
  v5 = [(VNObservation *)&v10 initWithCoder:v4];
  if (v5
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"detectionprint"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        detectionprint = v5->_detectionprint,
        v5->_detectionprint = (VNDetectionprint *)v6,
        detectionprint,
        !v5->_detectionprint))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VNDetectionprintObservation;
  id v4 = a3;
  [(VNObservation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_detectionprint, @"detectionprint", v5.receiver, v5.super_class);
}

- (id)vn_cloneObject
{
  v7.receiver = self;
  v7.super_class = (Class)VNDetectionprintObservation;
  v3 = [(VNObservation *)&v7 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(VNDetectionprint *)self->_detectionprint copy];
    objc_super v5 = (void *)v3[12];
    v3[12] = v4;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VNDetectionprintObservation *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VNDetectionprintObservation;
    if ([(VNObservation *)&v10 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_super v5 = v4;
      uint64_t v6 = [(VNDetectionprintObservation *)self detectionprint];
      objc_super v7 = [(VNDetectionprintObservation *)v5 detectionprint];

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
  v7.super_class = (Class)VNDetectionprintObservation;
  id v3 = [(VNObservation *)&v7 hash];
  uint64_t v4 = [(VNDetectionprintObservation *)self detectionprint];
  unint64_t v5 = [v4 hash] ^ __ROR8__(v3, 51);

  return v5;
}

- (VNDetectionprintObservation)initWithOriginatingRequestSpecifier:(id)a3 detectionprint:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VNDetectionprintObservation;
  objc_super v7 = [(VNObservation *)&v11 initWithOriginatingRequestSpecifier:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    detectionprint = v7->_detectionprint;
    v7->_detectionprint = (VNDetectionprint *)v8;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end