@interface _SFModelProperties
+ (BOOL)supportsSecureCoding;
- (NSArray)modelSamplingRates;
- (NSArray)modelTaskNames;
- (NSString)modelQualityType;
- (NSString)modelVersion;
- (NSURL)modelRoot;
- (_SFModelProperties)initWithCoder:(id)a3;
- (_SFModelProperties)initWithModelRoot:(id)a3 modelVersion:(id)a4 modelTaskNames:(id)a5 modelQualityType:(id)a6 modelSamplingRates:(id)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFModelProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelSamplingRates, 0);
  objc_storeStrong((id *)&self->_modelQualityType, 0);
  objc_storeStrong((id *)&self->_modelTaskNames, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);

  objc_storeStrong((id *)&self->_modelRoot, 0);
}

- (NSArray)modelSamplingRates
{
  return self->_modelSamplingRates;
}

- (NSString)modelQualityType
{
  return self->_modelQualityType;
}

- (NSArray)modelTaskNames
{
  return self->_modelTaskNames;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSURL)modelRoot
{
  return self->_modelRoot;
}

- (_SFModelProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_SFModelProperties;
  v5 = [(_SFModelProperties *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_modelRoot"];
    modelRoot = v5->_modelRoot;
    v5->_modelRoot = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_modelVersion"];
    modelVersion = v5->_modelVersion;
    v5->_modelVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_modelTaskNames"];
    modelTaskNames = v5->_modelTaskNames;
    v5->_modelTaskNames = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_modelQualityType"];
    modelQualityType = v5->_modelQualityType;
    v5->_modelQualityType = (NSString *)v12;

    uint64_t v14 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_modelSamplingRates"];
    modelSamplingRates = v5->_modelSamplingRates;
    v5->_modelSamplingRates = (NSArray *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  modelRoot = self->_modelRoot;
  id v5 = a3;
  [v5 encodeObject:modelRoot forKey:@"_modelRoot"];
  [v5 encodeObject:self->_modelVersion forKey:@"_modelVersion"];
  [v5 encodeObject:self->_modelTaskNames forKey:@"_modelTaskNames"];
  [v5 encodeObject:self->_modelQualityType forKey:@"_modelQualityType"];
  [v5 encodeObject:self->_modelSamplingRates forKey:@"_modelSamplingRates"];
}

- (_SFModelProperties)initWithModelRoot:(id)a3 modelVersion:(id)a4 modelTaskNames:(id)a5 modelQualityType:(id)a6 modelSamplingRates:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)_SFModelProperties;
  objc_super v17 = [(_SFModelProperties *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    modelRoot = v17->_modelRoot;
    v17->_modelRoot = (NSURL *)v18;

    uint64_t v20 = [v13 copy];
    modelVersion = v17->_modelVersion;
    v17->_modelVersion = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    modelTaskNames = v17->_modelTaskNames;
    v17->_modelTaskNames = (NSArray *)v22;

    uint64_t v24 = [v15 copy];
    modelQualityType = v17->_modelQualityType;
    v17->_modelQualityType = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    modelSamplingRates = v17->_modelSamplingRates;
    v17->_modelSamplingRates = (NSArray *)v26;
  }
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end