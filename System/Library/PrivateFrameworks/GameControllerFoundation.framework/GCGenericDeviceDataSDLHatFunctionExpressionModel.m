@interface GCGenericDeviceDataSDLHatFunctionExpressionModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDataProcessorExpressionModel)falseExpression;
- (GCGenericDeviceDataProcessorExpressionModel)inputExpression;
- (GCGenericDeviceDataProcessorExpressionModel)inputMaxExpression;
- (GCGenericDeviceDataProcessorExpressionModel)inputMinExpression;
- (GCGenericDeviceDataProcessorExpressionModel)maskExpression;
- (GCGenericDeviceDataProcessorExpressionModel)trueExpression;
- (GCGenericDeviceDataSDLHatFunctionExpressionModel)initWithCoder:(id)a3;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceDataSDLHatFunctionExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataSDLHatFunctionExpressionModel)initWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)GCGenericDeviceDataSDLHatFunctionExpressionModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceDataProcessorExpressionModel *)&v18 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"inputExpression", v18.receiver, v18.super_class);
  inputExpression = v4->_inputExpression;
  v4->_inputExpression = (GCGenericDeviceDataProcessorExpressionModel *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"inputMinExpression"];
  inputMinExpression = v4->_inputMinExpression;
  v4->_inputMinExpression = (GCGenericDeviceDataProcessorExpressionModel *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"inputMaxExpression"];
  inputMaxExpression = v4->_inputMaxExpression;
  v4->_inputMaxExpression = (GCGenericDeviceDataProcessorExpressionModel *)v9;

  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"maskExpression"];
  maskExpression = v4->_maskExpression;
  v4->_maskExpression = (GCGenericDeviceDataProcessorExpressionModel *)v11;

  uint64_t v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"trueExpression"];
  trueExpression = v4->_trueExpression;
  v4->_trueExpression = (GCGenericDeviceDataProcessorExpressionModel *)v13;

  uint64_t v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"falseExpression"];

  falseExpression = v4->_falseExpression;
  v4->_falseExpression = (GCGenericDeviceDataProcessorExpressionModel *)v15;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GCGenericDeviceDataSDLHatFunctionExpressionModel;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModel *)&v11 encodeWithCoder:v4];
  uint64_t v5 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self inputExpression];
  [v4 encodeObject:v5 forKey:@"inputExpression"];

  v6 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self inputMinExpression];
  [v4 encodeObject:v6 forKey:@"inputMinExpression"];

  uint64_t v7 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self inputMaxExpression];
  [v4 encodeObject:v7 forKey:@"inputMaxExpression"];

  v8 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self maskExpression];
  [v4 encodeObject:v8 forKey:@"maskExpression"];

  uint64_t v9 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self trueExpression];
  [v4 encodeObject:v9 forKey:@"trueExpression"];

  v10 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self falseExpression];
  [v4 encodeObject:v10 forKey:@"falseExpression"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GCGenericDeviceDataSDLHatFunctionExpressionModel;
  if ([(GCGenericDeviceDataProcessorExpressionModel *)&v23 isEqual:v4])
  {
    uint64_t v5 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self inputExpression];
    v6 = [v4 inputExpression];
    if ([v5 isEqual:v6])
    {
      uint64_t v7 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self inputMinExpression];
      v8 = [v4 inputMinExpression];
      if ([v7 isEqual:v8])
      {
        uint64_t v9 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self inputMaxExpression];
        v10 = [v4 inputMaxExpression];
        if ([v9 isEqual:v10])
        {
          objc_super v11 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self maskExpression];
          v12 = [v4 maskExpression];
          if ([v11 isEqual:v12])
          {
            v21 = v11;
            uint64_t v13 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self trueExpression];
            uint64_t v14 = [v4 trueExpression];
            v22 = (void *)v13;
            uint64_t v15 = (void *)v13;
            v16 = (void *)v14;
            if ([v15 isEqual:v14])
            {
              v20 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self falseExpression];
              v19 = [v4 falseExpression];
              char v17 = [v20 isEqual:v19];
            }
            else
            {
              char v17 = 0;
            }

            objc_super v11 = v21;
          }
          else
          {
            char v17 = 0;
          }
        }
        else
        {
          char v17 = 0;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

+ (id)description
{
  return @"SDL Hat Function Expression";
}

- (id)description
{
  v22 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self inputExpression];
  v21 = [v22 description];
  uint64_t v15 = [v21 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v20 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self inputMinExpression];
  v19 = [v20 description];
  v12 = [v19 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  objc_super v18 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self inputMaxExpression];
  v16 = [v18 description];
  id v3 = [v16 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  uint64_t v14 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self maskExpression];
  uint64_t v13 = [v14 description];
  id v4 = [v13 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  uint64_t v5 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self trueExpression];
  v6 = [v5 description];
  uint64_t v7 = [v6 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v8 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self falseExpression];
  uint64_t v9 = [v8 description];
  v10 = [v9 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  id v17 = +[NSString stringWithFormat:@"(sdl-hat-function\n\t%@\n\t%@\n\t%@\n\t%@\n\t%@\n\t%@\n)", v15, v12, v3, v4, v7, v10];

  return v17;
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  objc_super v18 = NSStringFromClass(v3);
  v24 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self inputExpression];
  objc_super v23 = [v24 debugDescription];
  uint64_t v15 = [v23 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v22 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self inputMinExpression];
  v21 = [v22 debugDescription];
  uint64_t v13 = [v21 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v19 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self inputMaxExpression];
  id v17 = [v19 debugDescription];
  v12 = [v17 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v16 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self maskExpression];
  uint64_t v14 = [v16 debugDescription];
  id v4 = [v14 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  uint64_t v5 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self trueExpression];
  v6 = [v5 debugDescription];
  uint64_t v7 = [v6 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v8 = [(GCGenericDeviceDataSDLHatFunctionExpressionModel *)self falseExpression];
  uint64_t v9 = [v8 debugDescription];
  v10 = [v9 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v20 = +[NSString stringWithFormat:@"<%@ %p> {\n\t input = %@\n\t inputMin = %@\n\t inputMax = %@\n\t mask = %@\n\t true = %@\n\t false = %@\n}", v18, self, v15, v13, v12, v4, v7, v10];

  return v20;
}

- (GCGenericDeviceDataProcessorExpressionModel)inputExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 8, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)inputMinExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 16, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)inputMaxExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 24, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)maskExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 32, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)trueExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 40, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)falseExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_falseExpression, 0);
  objc_storeStrong((id *)&self->_trueExpression, 0);
  objc_storeStrong((id *)&self->_maskExpression, 0);
  objc_storeStrong((id *)&self->_inputMaxExpression, 0);
  objc_storeStrong((id *)&self->_inputMinExpression, 0);

  objc_storeStrong((id *)&self->_inputExpression, 0);
}

@end