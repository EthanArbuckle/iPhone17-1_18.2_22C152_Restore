@interface GBDTLabeledFeatureVector
- (GBDTLabeledFeatureVector)initWithInputVector:(id)a3 target:(id)a4 entityType:(int64_t)a5;
- (NSArray)inputVector;
- (NSNumber)target;
- (id)debugDescription;
- (int64_t)entityType;
@end

@implementation GBDTLabeledFeatureVector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_inputVector, 0);
}

- (int64_t)entityType
{
  return self->_entityType;
}

- (NSNumber)target
{
  return self->_target;
}

- (NSArray)inputVector
{
  return self->_inputVector;
}

- (id)debugDescription
{
  v3 = objc_opt_new();
  [v3 appendString:@"["];
  if ([(NSArray *)self->_inputVector count])
  {
    v4 = 0;
    do
    {
      v5 = [(NSArray *)self->_inputVector objectAtIndexedSubscript:v4];
      [v3 appendFormat:@"%@", v5];

      if ((char *)[(NSArray *)self->_inputVector count] - 1 > v4) {
        [v3 appendString:@","];
      }
      ++v4;
    }
    while ((char *)[(NSArray *)self->_inputVector count] > v4);
  }
  [v3 appendString:@"]"];
  id v6 = [objc_alloc((Class)NSString) initWithFormat:@"inputVector:%@, target:%@", v3, self->_target];

  return v6;
}

- (GBDTLabeledFeatureVector)initWithInputVector:(id)a3 target:(id)a4 entityType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GBDTLabeledFeatureVector;
  v11 = [(GBDTLabeledFeatureVector *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_inputVector, a3);
    objc_storeStrong((id *)&v12->_target, a4);
    v12->_entityType = a5;
  }

  return v12;
}

@end