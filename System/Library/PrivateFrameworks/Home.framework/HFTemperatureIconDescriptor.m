@interface HFTemperatureIconDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldForceLTR;
- (HFTemperatureIconDescriptor)initWithFormattedTemperature:(id)a3 heatingCoolingMode:(int64_t)a4 targetHeatingCoolingMode:(int64_t)a5;
- (NSString)formattedTemperature;
- (NSString)identifier;
- (int64_t)compare:(id)a3;
- (int64_t)heatingCoolingMode;
- (int64_t)targetHeatingCoolingMode;
- (unint64_t)hash;
@end

@implementation HFTemperatureIconDescriptor

- (void).cxx_destruct
{
}

- (HFTemperatureIconDescriptor)initWithFormattedTemperature:(id)a3 heatingCoolingMode:(int64_t)a4 targetHeatingCoolingMode:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFTemperatureIconDescriptor;
  v10 = [(HFTemperatureIconDescriptor *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_formattedTemperature, a3);
    v11->_heatingCoolingMode = a4;
    v11->_targetHeatingCoolingMode = a5;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HFTemperatureIconDescriptor *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HFTemperatureIconDescriptor *)v5 formattedTemperature];
      v7 = [(HFTemperatureIconDescriptor *)self formattedTemperature];
      if (v6 == v7)
      {
        char v10 = 1;
      }
      else
      {
        v8 = [(HFTemperatureIconDescriptor *)v5 formattedTemperature];
        id v9 = [(HFTemperatureIconDescriptor *)self formattedTemperature];
        char v10 = [v8 isEqualToString:v9];
      }
      uint64_t v12 = [(HFTemperatureIconDescriptor *)v5 heatingCoolingMode];
      if (v12 == [(HFTemperatureIconDescriptor *)self heatingCoolingMode]) {
        BOOL v11 = v10;
      }
      else {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v2 = [(HFTemperatureIconDescriptor *)self formattedTemperature];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)identifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)compare:(id)a3
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

  if (v7)
  {
    v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[HFTemperatureIconDescriptor heatingCoolingMode](self, "heatingCoolingMode"));
    id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "heatingCoolingMode"));
    int64_t v10 = [v8 compare:v9];

    if (!v10)
    {
      BOOL v11 = [(HFTemperatureIconDescriptor *)self formattedTemperature];
      uint64_t v12 = [v7 formattedTemperature];
      int64_t v10 = [v11 compare:v12];
    }
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (BOOL)shouldForceLTR
{
  return self->_shouldForceLTR;
}

- (NSString)formattedTemperature
{
  return self->_formattedTemperature;
}

- (int64_t)heatingCoolingMode
{
  return self->_heatingCoolingMode;
}

- (int64_t)targetHeatingCoolingMode
{
  return self->_targetHeatingCoolingMode;
}

@end