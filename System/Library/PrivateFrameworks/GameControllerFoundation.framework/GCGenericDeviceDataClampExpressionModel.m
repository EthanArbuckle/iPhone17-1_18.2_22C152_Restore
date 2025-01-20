@interface GCGenericDeviceDataClampExpressionModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDataClampExpressionModel)initWithCoder:(id)a3;
- (GCGenericDeviceDataProcessorExpressionModel)inputExpression;
- (GCGenericDeviceDataProcessorExpressionModel)maxExpression;
- (GCGenericDeviceDataProcessorExpressionModel)minExpression;
- (id)_buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceDataClampExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataClampExpressionModel)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)GCGenericDeviceDataClampExpressionModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceDataProcessorExpressionModel *)&v12 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"inputExpression", v12.receiver, v12.super_class);
  inputExpression = v4->_inputExpression;
  v4->_inputExpression = (GCGenericDeviceDataProcessorExpressionModel *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"minExpression"];
  minExpression = v4->_minExpression;
  v4->_minExpression = (GCGenericDeviceDataProcessorExpressionModel *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"maxExpression"];

  maxExpression = v4->_maxExpression;
  v4->_maxExpression = (GCGenericDeviceDataProcessorExpressionModel *)v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GCGenericDeviceDataClampExpressionModel;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModel *)&v8 encodeWithCoder:v4];
  uint64_t v5 = [(GCGenericDeviceDataClampExpressionModel *)self inputExpression];
  [v4 encodeObject:v5 forKey:@"inputExpression"];

  v6 = [(GCGenericDeviceDataClampExpressionModel *)self minExpression];
  [v4 encodeObject:v6 forKey:@"minExpression"];

  uint64_t v7 = [(GCGenericDeviceDataClampExpressionModel *)self maxExpression];
  [v4 encodeObject:v7 forKey:@"maxExpression"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)GCGenericDeviceDataClampExpressionModel;
  if ([(GCGenericDeviceDataProcessorExpressionModel *)&v22 isEqual:v4])
  {
    uint64_t v5 = [(GCGenericDeviceDataClampExpressionModel *)self inputExpression];
    v6 = [v4 inputExpression];
    if (![v5 isEqual:v6])
    {
      char v11 = 0;
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v7 = [(GCGenericDeviceDataClampExpressionModel *)self minExpression];
    objc_super v8 = [v4 minExpression];
    if (v7 == v8)
    {
      [(GCGenericDeviceDataClampExpressionModel *)self maxExpression];
    }
    else
    {
      uint64_t v9 = [(GCGenericDeviceDataClampExpressionModel *)self minExpression];
      v10 = [v4 minExpression];
      if (![v9 isEqual:v10])
      {
        char v11 = 0;
LABEL_14:

LABEL_15:
        goto LABEL_16;
      }
      [(GCGenericDeviceDataClampExpressionModel *)self maxExpression];
    objc_super v12 = };
    uint64_t v13 = [v4 maxExpression];
    if (v12 == (void *)v13)
    {

      char v11 = 1;
    }
    else
    {
      v14 = (void *)v13;
      v15 = [(GCGenericDeviceDataClampExpressionModel *)self maxExpression];
      v16 = [v4 maxExpression];
      char v11 = [v15 isEqual:v16];
    }
    v10 = v19;
    uint64_t v9 = v21;
    if (v7 == v8) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  char v11 = 0;
LABEL_17:

  return v11;
}

+ (id)description
{
  return @"Clamp Expression";
}

- (id)description
{
  id v3 = [(GCGenericDeviceDataClampExpressionModel *)self inputExpression];
  id v4 = [v3 description];
  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v6 = [(GCGenericDeviceDataClampExpressionModel *)self minExpression];
  uint64_t v7 = [v6 description];
  objc_super v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  uint64_t v9 = [(GCGenericDeviceDataClampExpressionModel *)self maxExpression];
  v10 = [v9 description];
  char v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  objc_super v12 = +[NSString stringWithFormat:@"(clamp\n\t%@\n\t%@\n\t%@\n)", v5, v8, v11];

  return v12;
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v3);
  v15 = [(GCGenericDeviceDataClampExpressionModel *)self inputExpression];
  id v4 = [v15 debugDescription];
  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v6 = [(GCGenericDeviceDataClampExpressionModel *)self minExpression];
  uint64_t v7 = [v6 debugDescription];
  objc_super v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  uint64_t v9 = [(GCGenericDeviceDataClampExpressionModel *)self maxExpression];
  v10 = [v9 debugDescription];
  char v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  objc_super v12 = +[NSString stringWithFormat:@"<%@ %p> {\n\t input = %@\n\t min = %@\n\t max = %@\n}", v14, self, v5, v8, v11];

  return v12;
}

- (GCGenericDeviceDataProcessorExpressionModel)inputExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 8, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)minExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 16, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)maxExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxExpression, 0);
  objc_storeStrong((id *)&self->_minExpression, 0);

  objc_storeStrong((id *)&self->_inputExpression, 0);
}

- (id)_buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(GCGenericDeviceDataClampExpressionModel *)self inputExpression];
  objc_super v8 = [v7 buildPullExpressionWithOverrideBuilder:v6 error:a4];

  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v9 = [(GCGenericDeviceDataClampExpressionModel *)self minExpression];

  if (v9)
  {
    v10 = [(GCGenericDeviceDataClampExpressionModel *)self minExpression];
    uint64_t v9 = [v10 buildPullExpressionWithOverrideBuilder:v6 error:a4];

    if (!v9)
    {
LABEL_7:
      uint64_t v13 = 0;
      goto LABEL_11;
    }
  }
  char v11 = [(GCGenericDeviceDataClampExpressionModel *)self maxExpression];

  if (v11)
  {
    objc_super v12 = [(GCGenericDeviceDataClampExpressionModel *)self maxExpression];
    uint64_t v13 = [v12 buildPullExpressionWithOverrideBuilder:v6 error:a4];

    if (!v13) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = __102__GCGenericDeviceDataClampExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke;
  aBlock[3] = &unk_26BEC4A20;
  id v17 = v8;
  id v18 = v9;
  id v19 = v13;
  id v14 = v13;
  uint64_t v13 = _Block_copy(aBlock);

LABEL_10:
LABEL_11:

  return v13;
}

uint64_t __102__GCGenericDeviceDataClampExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

@end