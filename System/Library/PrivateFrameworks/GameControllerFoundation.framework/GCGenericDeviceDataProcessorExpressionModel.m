@interface GCGenericDeviceDataProcessorExpressionModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDataProcessorExpressionModel)init;
- (GCGenericDeviceDataProcessorExpressionModel)initWithCoder:(id)a3;
- (id)_buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4;
- (id)buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4;
- (unint64_t)hash;
@end

@implementation GCGenericDeviceDataProcessorExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataProcessorExpressionModel)init
{
  return 0;
}

- (GCGenericDeviceDataProcessorExpressionModel)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GCGenericDeviceDataProcessorExpressionModel;
  return [(GCGenericDeviceDataProcessorExpressionModel *)&v4 init];
}

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([(GCGenericDeviceDataProcessorExpressionModel *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
LABEL_7:
      BOOL v5 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceDataProcessorExpressionModel isMemberOfClass:](self, "isMemberOfClass:", [(id)objc_opt_class() modelClass]))
    {
      goto LABEL_7;
    }
  }
  BOOL v5 = 1;
LABEL_8:

  return v5;
}

+ (id)description
{
  return @"Expression";
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v18[0] = 0;
  v6 = objc_msgSend(v5, "gc_requiredObjectForKey:ofClass:error:", @"Type", objc_opt_class(), v18);
  id v7 = v18[0];
  v8 = v7;
  if (v6)
  {
    v9 = +[NSString stringWithFormat:@"GCGenericDeviceData%@ExpressionModelBuilder", v6];
    v10 = NSClassFromString(v9);
    if (v10
      && v10 != (objc_class *)objc_opt_class()
      && ([(objc_class *)v10 isSubclassOfClass:objc_opt_class()] & 1) != 0)
    {
      v11 = (void *)[[v10 alloc] initWithDictionaryRepresentation:v5 error:a4];
      if (v11)
      {

        v12 = [v11 build];
        v8 = v11;
        goto LABEL_7;
      }
    }
    else if (a4)
    {
      v20[0] = @"Invalid 'Expression' definition.";
      v19[0] = NSLocalizedDescriptionKey;
      v19[1] = NSLocalizedFailureReasonErrorKey;
      v14 = +[NSString stringWithFormat:@"'%@' is not a valid expression type.", v6];
      v20[1] = v14;
      v15 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a4)
  {
    v22[0] = @"Invalid 'Expression' definition.";
    v21[0] = NSLocalizedDescriptionKey;
    v21[1] = NSLocalizedFailureReasonErrorKey;
    v16 = [v7 localizedFailureReason];
    v22[1] = v16;
    v17 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = 0;
LABEL_7:

  return v12;
}

- (id)buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v13 = 0;
    v8 = (*((void (**)(id, GCGenericDeviceDataProcessorExpressionModel *, id *))v6 + 2))(v6, self, &v13);
    id v9 = v13;
    v10 = v9;
    if (v8)
    {
      v11 = _Block_copy(v8);
LABEL_4:

      goto LABEL_9;
    }
    if (v9)
    {
      v11 = 0;
      if (a4) {
        *a4 = v9;
      }
      goto LABEL_4;
    }
  }
  v11 = [(GCGenericDeviceDataProcessorExpressionModel *)self _buildPullExpressionWithOverrideBuilder:v7 error:a4];
LABEL_9:

  return v11;
}

- (id)_buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4
{
  if (a4)
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = +[NSString stringWithFormat:@"Unsupported expression class: %@.", v6, NSLocalizedDescriptionKey, NSLocalizedFailureReasonErrorKey, @"Invalid expression."];
    v11[1] = v7;
    v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:2];
    *a4 = +[NSError errorWithDomain:@"GCGenericDeviceError" code:2 userInfo:v8];
  }
  return 0;
}

@end