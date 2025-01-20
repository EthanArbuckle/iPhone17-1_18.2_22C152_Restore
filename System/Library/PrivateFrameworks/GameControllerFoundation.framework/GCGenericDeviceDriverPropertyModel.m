@interface GCGenericDeviceDriverPropertyModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDataProcessorExpressionModel)valueExpression;
- (GCGenericDeviceDriverPropertyModel)init;
- (GCGenericDeviceDriverPropertyModel)initWithCoder:(id)a3;
- (NSString)name;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceDriverPropertyModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDriverPropertyModel)init
{
  return 0;
}

- (GCGenericDeviceDriverPropertyModel)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDriverPropertyModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceDriverPropertyModel *)&v10 init];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"name", v10.receiver, v10.super_class);
  name = v4->_name;
  v4->_name = (NSString *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"valueExpression"];

  valueExpression = v4->_valueExpression;
  v4->_valueExpression = (GCGenericDeviceDataProcessorExpressionModel *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GCGenericDeviceDriverPropertyModel *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  id v6 = [(GCGenericDeviceDriverPropertyModel *)self valueExpression];
  [v4 encodeObject:v6 forKey:@"valueExpression"];
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
    if (([(GCGenericDeviceDriverPropertyModel *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
LABEL_8:
      char v9 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceDriverPropertyModel isMemberOfClass:](self, "isMemberOfClass:", [(id)objc_opt_class() modelClass]))
    {
      goto LABEL_8;
    }
  }
  uint64_t v5 = [(GCGenericDeviceDriverPropertyModel *)self name];
  id v6 = [v4 name];
  if ([v5 isEqual:v6])
  {
    uint64_t v7 = [(GCGenericDeviceDriverPropertyModel *)self valueExpression];
    v8 = [v4 valueExpression];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

LABEL_11:
  return v9;
}

+ (id)description
{
  return @"Driver Property";
}

- (id)description
{
  id v3 = [(GCGenericDeviceDriverPropertyModel *)self name];
  id v4 = [(GCGenericDeviceDriverPropertyModel *)self valueExpression];
  uint64_t v5 = +[NSString stringWithFormat:@"'%@' <- %@", v3, v4];

  return v5;
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(GCGenericDeviceDriverPropertyModel *)self name];
  id v6 = [(GCGenericDeviceDriverPropertyModel *)self valueExpression];
  uint64_t v7 = +[NSString stringWithFormat:@"<%@ %p> {\n\t name = %@\n\t valueExpression = %@\n}", v4, self, v5, v6];

  return v7;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)valueExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueExpression, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = objc_opt_new();
  v36[0] = 0;
  uint64_t v7 = objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", @"Name", objc_opt_class(), v36);
  id v8 = v36[0];
  if (v7)
  {
    [v6 setName:v7];

    id v35 = 0;
    char v9 = objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", @"ValueExpression", objc_opt_class(), &v35);
    id v10 = v35;
    if (v9)
    {
      id v34 = 0;
      v11 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v9 error:&v34];
      id v12 = v34;

      if (v11)
      {
        [v6 setValueExpression:v11];

        v13 = [v6 build];
        goto LABEL_5;
      }
      if (a4)
      {
        v37[0] = NSLocalizedDescriptionKey;
        uint64_t v21 = [v12 localizedDescription];
        v32 = (void *)v21;
        if (!v21)
        {
          uint64_t v21 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
        }
        v31 = (void *)v21;
        v38[0] = v21;
        v37[1] = NSLocalizedFailureReasonErrorKey;
        uint64_t v22 = [v12 localizedFailureReason];
        v23 = (void *)v22;
        if (!v22)
        {
          uint64_t v22 = +[NSString stringWithFormat:@"Error instantiating '%@' model for key '%@'.", objc_opt_class(), @"ValueExpression"];
        }
        v30 = (void *)v22;
        v38[1] = v22;
        v37[2] = NSUnderlyingErrorKey;
        uint64_t v24 = (uint64_t)v12;
        if (!v12)
        {
          uint64_t v24 = +[NSNull null];
        }
        v25 = (void *)v24;
        v38[2] = v24;
        v37[3] = @"GCFailingKeyPathErrorKey";
        v26 = objc_msgSend(v12, "gc_failingKeyPath");
        v27 = v26;
        if (!v26) {
          v26 = &__NSArray0__struct;
        }
        v28 = [v26 arrayByAddingObject:@"ValueExpression"];
        v38[3] = v28;
        v29 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v29);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        if (!v12) {
        if (!v23)
        }

        if (!v32) {
      }
        }
    }
    else
    {
      if (a4)
      {
        v39[0] = NSLocalizedDescriptionKey;
        v18 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
        v40[0] = v18;
        v39[1] = NSLocalizedFailureReasonErrorKey;
        v19 = [v10 localizedFailureReason];
        v40[1] = v19;
        v20 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v20);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    if (a4)
    {
      v41[0] = NSLocalizedDescriptionKey;
      v15 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v42[0] = v15;
      v41[1] = NSLocalizedFailureReasonErrorKey;
      v16 = [v8 localizedFailureReason];
      v42[1] = v16;
      v17 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v13 = 0;
LABEL_5:

  return v13;
}

@end