@interface UWBSignalFeatures
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BiasEstimatorFeatures)inputFeatures;
- (BiasEstimatorOutputs)outputs;
- (UWBSignalFeatures)initWithCoder:(id)a3;
- (UWBSignalFeatures)initWithUWBSignalFeatures:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)orderedBiasEstimatorFeatutes;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setInputFeatures:(id)a3;
- (void)setOutputs:(id)a3;
@end

@implementation UWBSignalFeatures

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UWBSignalFeatures)initWithUWBSignalFeatures:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UWBSignalFeatures;
  v5 = [(UWBSignalFeatures *)&v15 init];
  if (v5)
  {
    v6 = [BiasEstimatorFeatures alloc];
    v7 = [v4 inputFeatures];
    uint64_t v8 = [(BiasEstimatorFeatures *)v6 initWithBiasEstimatorFeatures:v7];
    inputFeatures = v5->_inputFeatures;
    v5->_inputFeatures = (BiasEstimatorFeatures *)v8;

    v10 = [BiasEstimatorOutputs alloc];
    v11 = [v4 outputs];
    uint64_t v12 = [(BiasEstimatorOutputs *)v10 initWithBiasEstimatorOutputs:v11];
    outputs = v5->_outputs;
    v5->_outputs = (BiasEstimatorOutputs *)v12;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 initWithUWBSignalFeatures:self];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_inputFeatures forKey:@"inputFeatures"];
  [v4 encodeObject:self->_outputs forKey:@"outputProbabilities"];
}

- (UWBSignalFeatures)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputFeatures"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outputProbabilities"];
  v10.receiver = self;
  v10.super_class = (Class)UWBSignalFeatures;
  v7 = [(UWBSignalFeatures *)&v10 init];
  uint64_t v8 = v7;
  if (v7)
  {
    [(UWBSignalFeatures *)v7 setInputFeatures:v5];
    [(UWBSignalFeatures *)v8 setOutputs:v6];
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v15 = 0;
    goto LABEL_12;
  }
  id v5 = v4;
  v6 = v5;
  inputFeatures = self->_inputFeatures;
  if (inputFeatures) {
    goto LABEL_5;
  }
  uint64_t v8 = [v5 inputFeatures];

  if (v8)
  {
    inputFeatures = self->_inputFeatures;
LABEL_5:
    v9 = [v6 inputFeatures];
    BOOL v10 = inputFeatures == v9;

    goto LABEL_6;
  }
  BOOL v10 = 1;
LABEL_6:
  outputs = self->_outputs;
  if (!outputs)
  {
    uint64_t v12 = [v6 outputs];

    if (!v12)
    {
      BOOL v14 = 1;
      goto LABEL_10;
    }
    outputs = self->_outputs;
  }
  v13 = [v6 outputs];
  BOOL v14 = outputs == v13;

LABEL_10:
  BOOL v15 = v10 && v14;

LABEL_12:
  return v15;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(BiasEstimatorFeatures *)self->_inputFeatures description];
  id v5 = [(BiasEstimatorOutputs *)self->_outputs description];
  v6 = [v3 stringWithFormat:@"%@, %@", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BiasEstimatorFeatures *)self->_inputFeatures hash];
  return [(BiasEstimatorOutputs *)self->_outputs hash] ^ v3;
}

- (id)orderedBiasEstimatorFeatutes
{
  unint64_t v3 = NSString;
  id v4 = [(BiasEstimatorFeatures *)self->_inputFeatures populateOrderedInputFeature];
  id v5 = [(BiasEstimatorOutputs *)self->_outputs populateOrderedBiasEstimatorOutputs];
  v6 = [v3 stringWithFormat:@"%@, %@", v4, v5];

  return v6;
}

- (BiasEstimatorFeatures)inputFeatures
{
  return self->_inputFeatures;
}

- (void)setInputFeatures:(id)a3
{
}

- (BiasEstimatorOutputs)outputs
{
  return self->_outputs;
}

- (void)setOutputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputs, 0);

  objc_storeStrong((id *)&self->_inputFeatures, 0);
}

@end