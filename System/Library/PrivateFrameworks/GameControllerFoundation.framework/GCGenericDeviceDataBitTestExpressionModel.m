@interface GCGenericDeviceDataBitTestExpressionModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (BOOL)partialMatch;
- (GCGenericDeviceDataBitTestExpressionModel)initWithCoder:(id)a3;
- (GCGenericDeviceDataProcessorExpressionModel)falseExpression;
- (GCGenericDeviceDataProcessorExpressionModel)inputExpression;
- (GCGenericDeviceDataProcessorExpressionModel)maskExpression;
- (GCGenericDeviceDataProcessorExpressionModel)trueExpression;
- (id)_buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceDataBitTestExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataBitTestExpressionModel)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)GCGenericDeviceDataBitTestExpressionModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceDataProcessorExpressionModel *)&v15 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"inputExpression", v15.receiver, v15.super_class);
  inputExpression = v4->_inputExpression;
  v4->_inputExpression = (GCGenericDeviceDataProcessorExpressionModel *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"maskExpression"];
  maskExpression = v4->_maskExpression;
  v4->_maskExpression = (GCGenericDeviceDataProcessorExpressionModel *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"trueExpression"];
  trueExpression = v4->_trueExpression;
  v4->_trueExpression = (GCGenericDeviceDataProcessorExpressionModel *)v9;

  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"falseExpression"];
  falseExpression = v4->_falseExpression;
  v4->_falseExpression = (GCGenericDeviceDataProcessorExpressionModel *)v11;

  char v13 = [v3 decodeBoolForKey:@"partialMatch"];
  v4->_partialMatch = v13;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GCGenericDeviceDataBitTestExpressionModel;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModel *)&v9 encodeWithCoder:v4];
  uint64_t v5 = [(GCGenericDeviceDataBitTestExpressionModel *)self inputExpression];
  [v4 encodeObject:v5 forKey:@"inputExpression"];

  v6 = [(GCGenericDeviceDataBitTestExpressionModel *)self maskExpression];
  [v4 encodeObject:v6 forKey:@"maskExpression"];

  uint64_t v7 = [(GCGenericDeviceDataBitTestExpressionModel *)self trueExpression];
  [v4 encodeObject:v7 forKey:@"trueExpression"];

  v8 = [(GCGenericDeviceDataBitTestExpressionModel *)self falseExpression];
  [v4 encodeObject:v8 forKey:@"falseExpression"];

  objc_msgSend(v4, "encodeBool:forKey:", -[GCGenericDeviceDataBitTestExpressionModel partialMatch](self, "partialMatch"), @"partialMatch");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GCGenericDeviceDataBitTestExpressionModel;
  if ([(GCGenericDeviceDataProcessorExpressionModel *)&v16 isEqual:v4])
  {
    uint64_t v5 = [(GCGenericDeviceDataBitTestExpressionModel *)self inputExpression];
    v6 = [v4 inputExpression];
    if ([v5 isEqual:v6])
    {
      uint64_t v7 = [(GCGenericDeviceDataBitTestExpressionModel *)self maskExpression];
      v8 = [v4 maskExpression];
      if ([v7 isEqual:v8])
      {
        objc_super v9 = [(GCGenericDeviceDataBitTestExpressionModel *)self trueExpression];
        v10 = [v4 trueExpression];
        if ([v9 isEqual:v10])
        {
          uint64_t v11 = [(GCGenericDeviceDataBitTestExpressionModel *)self falseExpression];
          v12 = [v4 falseExpression];
          if ([v11 isEqual:v12])
          {
            BOOL v13 = [(GCGenericDeviceDataBitTestExpressionModel *)self partialMatch];
            int v14 = v13 ^ [v4 partialMatch] ^ 1;
          }
          else
          {
            LOBYTE(v14) = 0;
          }
        }
        else
        {
          LOBYTE(v14) = 0;
        }
      }
      else
      {
        LOBYTE(v14) = 0;
      }
    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

+ (id)description
{
  return @"Bit Test Expression";
}

- (id)description
{
  BOOL v14 = [(GCGenericDeviceDataBitTestExpressionModel *)self partialMatch];
  v17 = [(GCGenericDeviceDataBitTestExpressionModel *)self inputExpression];
  objc_super v16 = [v17 description];
  id v3 = [v16 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  objc_super v15 = [(GCGenericDeviceDataBitTestExpressionModel *)self maskExpression];
  id v4 = [v15 description];
  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v6 = [(GCGenericDeviceDataBitTestExpressionModel *)self trueExpression];
  uint64_t v7 = [v6 description];
  v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  objc_super v9 = [(GCGenericDeviceDataBitTestExpressionModel *)self falseExpression];
  v10 = [v9 description];
  uint64_t v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v12 = +[NSString stringWithFormat:@"(bit-test %i\n\t%@\n\t%@\n\t%@\n\t%@\n)", v14, v3, v5, v8, v11];

  return v12;
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  BOOL v14 = NSStringFromClass(v3);
  v18 = [(GCGenericDeviceDataBitTestExpressionModel *)self inputExpression];
  v17 = [v18 debugDescription];
  id v4 = [v17 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  objc_super v16 = [(GCGenericDeviceDataBitTestExpressionModel *)self maskExpression];
  objc_super v15 = [v16 debugDescription];
  uint64_t v5 = [v15 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v6 = [(GCGenericDeviceDataBitTestExpressionModel *)self trueExpression];
  uint64_t v7 = [v6 debugDescription];
  v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  objc_super v9 = [(GCGenericDeviceDataBitTestExpressionModel *)self falseExpression];
  v10 = [v9 debugDescription];
  uint64_t v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v12 = +[NSString stringWithFormat:@"<%@ %p> {\n\t input = %@\n\t mask = %@\n\t trueExpression = %@\n\t falseExpression = %@\n\t partialMatch = %i\n}", v14, self, v4, v5, v8, v11, [(GCGenericDeviceDataBitTestExpressionModel *)self partialMatch]];

  return v12;
}

- (GCGenericDeviceDataProcessorExpressionModel)inputExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 8, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)maskExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 16, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)trueExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 24, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)falseExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)partialMatch
{
  return self->_partialMatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_falseExpression, 0);
  objc_storeStrong((id *)&self->_trueExpression, 0);
  objc_storeStrong((id *)&self->_maskExpression, 0);

  objc_storeStrong((id *)&self->_inputExpression, 0);
}

- (id)_buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(GCGenericDeviceDataBitTestExpressionModel *)self inputExpression];
  v8 = [v7 buildPullExpressionWithOverrideBuilder:v6 error:a4];

  if (v8)
  {
    objc_super v9 = [(GCGenericDeviceDataBitTestExpressionModel *)self maskExpression];
    v10 = [v9 buildPullExpressionWithOverrideBuilder:v6 error:a4];

    if (v10)
    {
      uint64_t v11 = [(GCGenericDeviceDataBitTestExpressionModel *)self trueExpression];
      v12 = [v11 buildPullExpressionWithOverrideBuilder:v6 error:a4];

      if (v12)
      {
        BOOL v13 = [(GCGenericDeviceDataBitTestExpressionModel *)self falseExpression];
        BOOL v14 = [v13 buildPullExpressionWithOverrideBuilder:v6 error:a4];

        if (v14)
        {
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = __104__GCGenericDeviceDataBitTestExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke;
          v17[3] = &unk_26BEC39B0;
          id v18 = v8;
          id v19 = v10;
          id v20 = v12;
          id v21 = v14;
          objc_super v15 = _Block_copy(v17);
        }
        else
        {
          objc_super v15 = 0;
        }
      }
      else
      {
        objc_super v15 = 0;
      }
    }
    else
    {
      objc_super v15 = 0;
    }
  }
  else
  {
    objc_super v15 = 0;
  }

  return v15;
}

uint64_t __104__GCGenericDeviceDataBitTestExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke(uint64_t a1)
{
  double v2 = (*(double (**)(void))(*(void *)(a1 + 32) + 16))();
  double v3 = (*(double (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v4 = 48;
  if (((uint64_t)rint(v3) & (uint64_t)rint(v2)) == 0) {
    uint64_t v4 = 56;
  }
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + v4) + 16);

  return v5();
}

@end