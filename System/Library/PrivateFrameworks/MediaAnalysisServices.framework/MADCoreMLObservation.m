@interface MADCoreMLObservation
+ (BOOL)supportsSecureCoding;
+ (id)entryWithFeatureName:(id)a3 featureValue:(id)a4;
- (MADCoreMLObservation)initWithCoder:(id)a3;
- (MADCoreMLObservation)initWithFeatureName:(id)a3 featureValue:(id)a4;
- (MLFeatureValue)featureValue;
- (NSString)featureName;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADCoreMLObservation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADCoreMLObservation)initWithFeatureName:(id)a3 featureValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADCoreMLObservation;
  v9 = [(MADCoreMLObservation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureName, a3);
    objc_storeStrong((id *)&v10->_featureValue, a4);
  }

  return v10;
}

+ (id)entryWithFeatureName:(id)a3 featureValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc((Class)a1) initWithFeatureName:v6 featureValue:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_featureName forKey:@"CoreMLFeatureName"];
  [v4 encodeObject:self->_featureValue forKey:@"CoreMLFeatureValue"];
}

- (MADCoreMLObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADCoreMLObservation;
  v5 = [(MADCoreMLObservation *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CoreMLFeatureName"];
    featureName = v5->_featureName;
    v5->_featureName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CoreMLFeatureValue"];
    featureValue = v5->_featureValue;
    v5->_featureValue = (MLFeatureValue *)v8;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"%@: %@, ", @"CoreMLFeatureName", self->_featureName];
  [v3 appendFormat:@"%@: %@>", @"CoreMLFeatureValue", self->_featureValue];
  return v3;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (MLFeatureValue)featureValue
{
  return self->_featureValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureValue, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
}

@end