@interface GCGenericDeviceDataAddExpressionModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDataAddExpressionModel)initWithCoder:(id)a3;
- (GCGenericDeviceDataProcessorExpressionModel)leftExpression;
- (GCGenericDeviceDataProcessorExpressionModel)rightExpression;
- (id)_buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceDataAddExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataAddExpressionModel)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDataAddExpressionModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceDataProcessorExpressionModel *)&v10 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"leftExpression", v10.receiver, v10.super_class);
  leftExpression = v4->_leftExpression;
  v4->_leftExpression = (GCGenericDeviceDataProcessorExpressionModel *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"rightExpression"];

  rightExpression = v4->_rightExpression;
  v4->_rightExpression = (GCGenericDeviceDataProcessorExpressionModel *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GCGenericDeviceDataAddExpressionModel;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModel *)&v7 encodeWithCoder:v4];
  uint64_t v5 = [(GCGenericDeviceDataAddExpressionModel *)self leftExpression];
  [v4 encodeObject:v5 forKey:@"leftExpression"];

  v6 = [(GCGenericDeviceDataAddExpressionModel *)self rightExpression];
  [v4 encodeObject:v6 forKey:@"rightExpression"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCGenericDeviceDataAddExpressionModel;
  if ([(GCGenericDeviceDataProcessorExpressionModel *)&v11 isEqual:v4])
  {
    uint64_t v5 = [(GCGenericDeviceDataAddExpressionModel *)self leftExpression];
    v6 = [v4 leftExpression];
    if ([v5 isEqual:v6])
    {
      objc_super v7 = [(GCGenericDeviceDataAddExpressionModel *)self rightExpression];
      v8 = [v4 rightExpression];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (id)description
{
  return @"Add Expression";
}

- (id)description
{
  id v3 = [(GCGenericDeviceDataAddExpressionModel *)self leftExpression];
  id v4 = [v3 description];
  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v6 = [(GCGenericDeviceDataAddExpressionModel *)self rightExpression];
  objc_super v7 = [v6 description];
  v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  char v9 = +[NSString stringWithFormat:@"(add\n\t%@\n\t%@\n)", v5, v8];

  return v9;
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(GCGenericDeviceDataAddExpressionModel *)self leftExpression];
  v6 = [v5 debugDescription];
  objc_super v7 = [v6 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v8 = [(GCGenericDeviceDataAddExpressionModel *)self rightExpression];
  char v9 = [v8 debugDescription];
  objc_super v10 = [v9 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  objc_super v11 = +[NSString stringWithFormat:@"<%@ %p> {\n\t left = %@\n\t right = %@\n}", v4, self, v7, v10];

  return v11;
}

- (GCGenericDeviceDataProcessorExpressionModel)leftExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 8, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)rightExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightExpression, 0);

  objc_storeStrong((id *)&self->_leftExpression, 0);
}

- (id)_buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = [(GCGenericDeviceDataAddExpressionModel *)self leftExpression];
  v8 = [v7 buildPullExpressionWithOverrideBuilder:v6 error:a4];

  if (v8)
  {
    char v9 = [(GCGenericDeviceDataAddExpressionModel *)self rightExpression];
    objc_super v10 = [v9 buildPullExpressionWithOverrideBuilder:v6 error:a4];

    if (v10)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __100__GCGenericDeviceDataAddExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke;
      v13[3] = &unk_26BEC39D8;
      id v14 = v8;
      id v15 = v10;
      objc_super v11 = _Block_copy(v13);
    }
    else
    {
      objc_super v11 = 0;
    }
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

double __100__GCGenericDeviceDataAddExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke(uint64_t a1)
{
  double v2 = (*(double (**)(void))(*(void *)(a1 + 32) + 16))();
  return v2 + (*(double (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end