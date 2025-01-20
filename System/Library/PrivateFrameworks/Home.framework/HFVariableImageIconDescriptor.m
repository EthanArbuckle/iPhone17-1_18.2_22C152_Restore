@interface HFVariableImageIconDescriptor
- (BOOL)isEqual:(id)a3;
- (HFVariableImageIconDescriptor)initWithSystemImageNamed:(id)a3 variableValue:(double)a4 configuration:(id)a5;
- (double)variableValue;
- (id)description;
- (unint64_t)hash;
@end

@implementation HFVariableImageIconDescriptor

- (HFVariableImageIconDescriptor)initWithSystemImageNamed:(id)a3 variableValue:(double)a4 configuration:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)HFVariableImageIconDescriptor;
  result = [(HFImageIconDescriptor *)&v7 initWithSystemImageNamed:a3 configuration:a5];
  if (result) {
    result->_variableValue = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7
    && (v13.receiver = self,
        v13.super_class = (Class)HFVariableImageIconDescriptor,
        [(HFImageIconDescriptor *)&v13 isEqual:v7]))
  {
    [(HFVariableImageIconDescriptor *)self variableValue];
    double v9 = v8;
    [v7 variableValue];
    BOOL v11 = v9 == v10;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)HFVariableImageIconDescriptor;
  unint64_t v3 = [(HFImageIconDescriptor *)&v8 hash];
  id v4 = NSNumber;
  [(HFVariableImageIconDescriptor *)self variableValue];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  unint64_t v6 = [v5 hash] ^ v3;

  return v6;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unint64_t v6 = [(HFImageIconDescriptor *)self imageIdentifier];
  id v7 = [(HFImageIconDescriptor *)self imageSymbolConfiguration];
  [(HFVariableImageIconDescriptor *)self variableValue];
  double v9 = [v3 stringWithFormat:@"<%@: %p, \"%@\", %@ (%f)>", v5, self, v6, v7, v8];

  return v9;
}

- (double)variableValue
{
  return self->_variableValue;
}

@end