@interface GCGenericDeviceDataInterpolateExpressionModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDataInterpolateExpressionModel)initWithCoder:(id)a3;
- (GCGenericDeviceDataProcessorExpressionModel)inputExpression;
- (GCGenericDeviceDataProcessorExpressionModel)inputMaxExpression;
- (GCGenericDeviceDataProcessorExpressionModel)inputMinExpression;
- (GCGenericDeviceDataProcessorExpressionModel)outputMaxExpression;
- (GCGenericDeviceDataProcessorExpressionModel)outputMinExpression;
- (id)_buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceDataInterpolateExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataInterpolateExpressionModel)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)GCGenericDeviceDataInterpolateExpressionModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceDataProcessorExpressionModel *)&v16 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"inputExpression", v16.receiver, v16.super_class);
  inputExpression = v4->_inputExpression;
  v4->_inputExpression = (GCGenericDeviceDataProcessorExpressionModel *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"inputMinExpression"];
  inputMinExpression = v4->_inputMinExpression;
  v4->_inputMinExpression = (GCGenericDeviceDataProcessorExpressionModel *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"inputMaxExpression"];
  inputMaxExpression = v4->_inputMaxExpression;
  v4->_inputMaxExpression = (GCGenericDeviceDataProcessorExpressionModel *)v9;

  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"outputMinExpression"];
  outputMinExpression = v4->_outputMinExpression;
  v4->_outputMinExpression = (GCGenericDeviceDataProcessorExpressionModel *)v11;

  uint64_t v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"outputMaxExpression"];

  outputMaxExpression = v4->_outputMaxExpression;
  v4->_outputMaxExpression = (GCGenericDeviceDataProcessorExpressionModel *)v13;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDataInterpolateExpressionModel;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModel *)&v10 encodeWithCoder:v4];
  uint64_t v5 = [(GCGenericDeviceDataInterpolateExpressionModel *)self inputExpression];
  [v4 encodeObject:v5 forKey:@"inputExpression"];

  v6 = [(GCGenericDeviceDataInterpolateExpressionModel *)self inputMinExpression];
  [v4 encodeObject:v6 forKey:@"inputMinExpression"];

  uint64_t v7 = [(GCGenericDeviceDataInterpolateExpressionModel *)self inputMaxExpression];
  [v4 encodeObject:v7 forKey:@"inputMaxExpression"];

  v8 = [(GCGenericDeviceDataInterpolateExpressionModel *)self outputMinExpression];
  [v4 encodeObject:v8 forKey:@"outputMinExpression"];

  uint64_t v9 = [(GCGenericDeviceDataInterpolateExpressionModel *)self outputMaxExpression];
  [v4 encodeObject:v9 forKey:@"outputMaxExpression"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GCGenericDeviceDataInterpolateExpressionModel;
  if ([(GCGenericDeviceDataProcessorExpressionModel *)&v18 isEqual:v4])
  {
    uint64_t v5 = [(GCGenericDeviceDataInterpolateExpressionModel *)self inputExpression];
    v6 = [v4 inputExpression];
    if ([v5 isEqual:v6])
    {
      uint64_t v7 = [(GCGenericDeviceDataInterpolateExpressionModel *)self inputMinExpression];
      v8 = [v4 inputMinExpression];
      if ([v7 isEqual:v8])
      {
        uint64_t v9 = [(GCGenericDeviceDataInterpolateExpressionModel *)self inputMaxExpression];
        objc_super v10 = [v4 inputMaxExpression];
        if ([v9 isEqual:v10])
        {
          uint64_t v11 = [(GCGenericDeviceDataInterpolateExpressionModel *)self outputMinExpression];
          v12 = [v4 outputMinExpression];
          if ([v11 isEqual:v12])
          {
            objc_super v16 = [(GCGenericDeviceDataInterpolateExpressionModel *)self outputMaxExpression];
            [v4 outputMaxExpression];
            uint64_t v13 = v17 = v11;
            char v14 = [v16 isEqual:v13];

            uint64_t v11 = v17;
          }
          else
          {
            char v14 = 0;
          }
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

+ (id)description
{
  return @"Interpolate Expression";
}

- (id)description
{
  v19 = [(GCGenericDeviceDataInterpolateExpressionModel *)self inputExpression];
  objc_super v18 = [v19 description];
  uint64_t v13 = [v18 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v17 = [(GCGenericDeviceDataInterpolateExpressionModel *)self inputMinExpression];
  objc_super v16 = [v17 description];
  id v3 = [v16 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  char v14 = [(GCGenericDeviceDataInterpolateExpressionModel *)self inputMaxExpression];
  id v4 = [v14 description];
  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v6 = [(GCGenericDeviceDataInterpolateExpressionModel *)self outputMinExpression];
  uint64_t v7 = [v6 description];
  v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  uint64_t v9 = [(GCGenericDeviceDataInterpolateExpressionModel *)self outputMaxExpression];
  objc_super v10 = [v9 description];
  uint64_t v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  id v15 = +[NSString stringWithFormat:@"(interpolate\n\t%@\n\t%@\n\t%@\n\t%@\n\t%@\n)", v13, v3, v5, v8, v11];

  return v15;
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  objc_super v16 = NSStringFromClass(v3);
  v21 = [(GCGenericDeviceDataInterpolateExpressionModel *)self inputExpression];
  v20 = [v21 debugDescription];
  uint64_t v13 = [v20 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v19 = [(GCGenericDeviceDataInterpolateExpressionModel *)self inputMinExpression];
  objc_super v18 = [v19 debugDescription];
  id v4 = [v18 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  id v15 = [(GCGenericDeviceDataInterpolateExpressionModel *)self inputMaxExpression];
  char v14 = [v15 debugDescription];
  uint64_t v5 = [v14 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v6 = [(GCGenericDeviceDataInterpolateExpressionModel *)self outputMinExpression];
  uint64_t v7 = [v6 debugDescription];
  v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  uint64_t v9 = [(GCGenericDeviceDataInterpolateExpressionModel *)self outputMaxExpression];
  objc_super v10 = [v9 debugDescription];
  uint64_t v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  +[NSString stringWithFormat:@"<%@ %p> {\n\t input = %@\n\t inputMin = %@\n\t inputMax = %@\n\t outputMin = %@\n\t outputMax = %@\n}", v16, self, v13, v4, v5, v8, v11];
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  return v17;
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

- (GCGenericDeviceDataProcessorExpressionModel)outputMinExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 32, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)outputMaxExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputMaxExpression, 0);
  objc_storeStrong((id *)&self->_outputMinExpression, 0);
  objc_storeStrong((id *)&self->_inputMaxExpression, 0);
  objc_storeStrong((id *)&self->_inputMinExpression, 0);

  objc_storeStrong((id *)&self->_inputExpression, 0);
}

- (id)_buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(GCGenericDeviceDataInterpolateExpressionModel *)self inputExpression];
  v8 = [v7 buildPullExpressionWithOverrideBuilder:v6 error:a4];

  if (v8)
  {
    uint64_t v9 = [(GCGenericDeviceDataInterpolateExpressionModel *)self inputMinExpression];
    objc_super v10 = [v9 buildPullExpressionWithOverrideBuilder:v6 error:a4];

    if (v10)
    {
      uint64_t v11 = [(GCGenericDeviceDataInterpolateExpressionModel *)self inputMaxExpression];
      v12 = [v11 buildPullExpressionWithOverrideBuilder:v6 error:a4];

      if (v12)
      {
        uint64_t v13 = [(GCGenericDeviceDataInterpolateExpressionModel *)self outputMinExpression];
        char v14 = [v13 buildPullExpressionWithOverrideBuilder:v6 error:a4];

        if (v14)
        {
          id v15 = [(GCGenericDeviceDataInterpolateExpressionModel *)self outputMaxExpression];
          objc_super v16 = [v15 buildPullExpressionWithOverrideBuilder:v6 error:a4];

          if (v16)
          {
            aBlock[0] = _NSConcreteStackBlock;
            aBlock[1] = 3221225472;
            aBlock[2] = __108__GCGenericDeviceDataInterpolateExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke;
            aBlock[3] = &unk_26BEC5038;
            id v20 = v8;
            id v21 = v10;
            id v22 = v12;
            id v23 = v14;
            id v24 = v16;
            id v17 = _Block_copy(aBlock);
          }
          else
          {
            id v17 = 0;
          }
        }
        else
        {
          id v17 = 0;
        }
      }
      else
      {
        id v17 = 0;
      }
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

double __108__GCGenericDeviceDataInterpolateExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke(void *a1)
{
  double v2 = (*(double (**)(void))(a1[4] + 16))();
  double v3 = (*(double (**)(void))(a1[5] + 16))();
  double v4 = (*(double (**)(void))(a1[6] + 16))();
  double v5 = (*(double (**)(void))(a1[7] + 16))();
  return v5 + fabs((v2 - v3) / (v4 - v3)) * ((*(double (**)(void))(a1[8] + 16))() - v5);
}

@end