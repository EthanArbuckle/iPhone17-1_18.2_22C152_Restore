@interface VNCoreMLFeatureValueObservation
+ (BOOL)supportsSecureCoding;
- (MLFeatureValue)featureValue;
- (NSString)featureName;
- (VNCoreMLFeatureValueObservation)initWithCoder:(id)a3;
- (VNCoreMLFeatureValueObservation)initWithOriginatingRequestSpecifier:(id)a3 featureName:(id)a4 featureValue:(id)a5;
- (id)description;
- (id)vn_cloneObject;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNCoreMLFeatureValueObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);

  objc_storeStrong((id *)&self->_featureValue, 0);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (MLFeatureValue)featureValue
{
  return self->_featureValue;
}

- (id)description
{
  id v3 = [NSString alloc];
  v10.receiver = self;
  v10.super_class = (Class)VNCoreMLFeatureValueObservation;
  v4 = [(VNObservation *)&v10 description];
  v5 = [(VNCoreMLFeatureValueObservation *)self featureName];
  v6 = [(VNCoreMLFeatureValueObservation *)self featureValue];
  [(VNObservation *)self confidence];
  v8 = (void *)[v3 initWithFormat:@"%@ \"%@\" - \"%@\" (%f)", v4, v5, v6, v7];

  return v8;
}

- (id)vn_cloneObject
{
  v9.receiver = self;
  v9.super_class = (Class)VNCoreMLFeatureValueObservation;
  id v3 = [(VNObservation *)&v9 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(MLFeatureValue *)self->_featureValue copy];
    v5 = (void *)v3[12];
    v3[12] = v4;

    uint64_t v6 = [(NSString *)self->_featureName copy];
    float v7 = (void *)v3[13];
    v3[13] = v6;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNCoreMLFeatureValueObservation;
  [(VNObservation *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_featureValue forKey:@"featureValue"];
  [v4 encodeObject:self->_featureName forKey:@"featureName"];
}

- (VNCoreMLFeatureValueObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNCoreMLFeatureValueObservation;
  objc_super v5 = [(VNObservation *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureValue"];
    uint64_t v7 = [v6 copy];
    featureValue = v5->_featureValue;
    v5->_featureValue = (MLFeatureValue *)v7;

    objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureName"];
    uint64_t v10 = [v9 copy];
    featureName = v5->_featureName;
    v5->_featureName = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (VNCoreMLFeatureValueObservation)initWithOriginatingRequestSpecifier:(id)a3 featureName:(id)a4 featureValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VNCoreMLFeatureValueObservation;
  v11 = [(VNObservation *)&v19 initWithOriginatingRequestSpecifier:v8];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    featureValue = v11->_featureValue;
    v11->_featureValue = (MLFeatureValue *)v12;

    uint64_t v14 = [v9 copy];
    featureName = v11->_featureName;
    v11->_featureName = (NSString *)v14;

    LODWORD(v16) = 1.0;
    [(VNObservation *)v11 setConfidence:v16];
    v17 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end