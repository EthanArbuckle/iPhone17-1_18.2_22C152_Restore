@interface GCGenericDeviceDataConstantExpressionModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDataConstantExpressionModel)initWithCoder:(id)a3;
- (double)value;
- (id)_buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceDataConstantExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataConstantExpressionModel)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GCGenericDeviceDataConstantExpressionModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceDataProcessorExpressionModel *)&v8 initWithCoder:v3];
  objc_msgSend(v3, "decodeDoubleForKey:", @"value", v8.receiver, v8.super_class);
  double v6 = v5;

  v4->_value = v6;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GCGenericDeviceDataConstantExpressionModel;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModel *)&v5 encodeWithCoder:v4];
  [(GCGenericDeviceDataConstantExpressionModel *)self value];
  objc_msgSend(v4, "encodeDouble:forKey:", @"value");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDataConstantExpressionModel;
  if ([(GCGenericDeviceDataProcessorExpressionModel *)&v10 isEqual:v4])
  {
    [(GCGenericDeviceDataConstantExpressionModel *)self value];
    double v6 = v5;
    [v4 value];
    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)description
{
  return @"Constant Expression";
}

- (id)description
{
  [(GCGenericDeviceDataConstantExpressionModel *)self value];
  return +[NSString stringWithFormat:@"(constant %f)", v2];
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  double v5 = +[NSString stringWithFormat:@"<%@ %p> {\n\t value = %f\n}", v4, self, *(void *)&self->_value];

  return v5;
}

- (double)value
{
  return self->_value;
}

- (id)_buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4
{
  [(GCGenericDeviceDataConstantExpressionModel *)self value];
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = __105__GCGenericDeviceDataConstantExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_d8__0l;
  aBlock[4] = v4;
  double v5 = _Block_copy(aBlock);

  return v5;
}

double __105__GCGenericDeviceDataConstantExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

@end