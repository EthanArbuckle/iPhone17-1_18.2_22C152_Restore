@interface GCGenericDeviceInputGamepadEventFieldModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDataProcessorExpressionModel)sourceExpression;
- (GCGenericDeviceInputGamepadEventFieldModel)init;
- (GCGenericDeviceInputGamepadEventFieldModel)initWithCoder:(id)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)extendedIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceInputGamepadEventFieldModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceInputGamepadEventFieldModel)init
{
  return 0;
}

- (GCGenericDeviceInputGamepadEventFieldModel)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GCGenericDeviceInputGamepadEventFieldModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceInputGamepadEventFieldModel *)&v8 init];
  v4->_extendedIndex = objc_msgSend(v3, "decodeIntegerForKey:", @"extendedIndex", v8.receiver, v8.super_class);
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sourceExpression"];

  sourceExpression = v4->_sourceExpression;
  v4->_sourceExpression = (GCGenericDeviceDataProcessorExpressionModel *)v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCGenericDeviceInputGamepadEventFieldModel extendedIndex](self, "extendedIndex"), @"extendedIndex");
  id v5 = [(GCGenericDeviceInputGamepadEventFieldModel *)self sourceExpression];
  [v4 encodeObject:v5 forKey:@"sourceExpression"];
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
    if (([(GCGenericDeviceInputGamepadEventFieldModel *)self isMemberOfClass:objc_opt_class()] & 1) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceInputGamepadEventFieldModel isMemberOfClass:](self, "isMemberOfClass:", [(id)objc_opt_class() modelClass]))
    {
      goto LABEL_8;
    }
  }
  int64_t v5 = [(GCGenericDeviceInputGamepadEventFieldModel *)self extendedIndex];
  if (v5 != [v4 extendedIndex])
  {
LABEL_8:
    char v8 = 0;
    goto LABEL_9;
  }
  v6 = [(GCGenericDeviceInputGamepadEventFieldModel *)self sourceExpression];
  v7 = [v4 sourceExpression];
  char v8 = [v6 isEqual:v7];

LABEL_9:
  return v8;
}

+ (id)description
{
  return @"Gamepad Event Field";
}

- (id)description
{
  int64_t v3 = [(GCGenericDeviceInputGamepadEventFieldModel *)self extendedIndex];
  id v4 = [(GCGenericDeviceInputGamepadEventFieldModel *)self sourceExpression];
  int64_t v5 = +[NSString stringWithFormat:@"[%zd] <- %@", v3, v4];

  return v5;
}

- (id)debugDescription
{
  int64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int64_t v5 = [(GCGenericDeviceInputGamepadEventFieldModel *)self extendedIndex];
  v6 = [(GCGenericDeviceInputGamepadEventFieldModel *)self sourceExpression];
  v7 = +[NSString stringWithFormat:@"<%@ %p> {\n\t extendedIndex = %zd\n\t sourceExpression = %@\n}", v4, self, v5, v6];

  return v7;
}

- (int64_t)extendedIndex
{
  return self->_extendedIndex;
}

- (GCGenericDeviceDataProcessorExpressionModel)sourceExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  v7 = objc_opt_new();
  v37[0] = 0;
  char v8 = objc_msgSend(a3, "gc_objectForKey:ofClass:error:", @"ExtendedIndex", objc_opt_class(), v37);
  id v9 = v37[0];
  v10 = v9;
  if (v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (!v11)
  {
    if (a4)
    {
      v42[0] = NSLocalizedDescriptionKey;
      v19 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v43[0] = v19;
      v42[1] = NSLocalizedFailureReasonErrorKey;
      v20 = [v10 localizedFailureReason];
      v43[1] = v20;
      v21 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v21);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_41;
  }
  if (v8) {
    objc_msgSend(v7, "setExtendedIndex:", objc_msgSend(v8, "integerValue"));
  }

  id v36 = 0;
  v12 = objc_msgSend(a3, "gc_objectForKey:ofClass:error:", @"SourceExpression", objc_opt_class(), &v36);
  id v13 = v36;
  v14 = v13;
  if (!v12 && v13)
  {
    if (!a4)
    {
      id v16 = v13;
      goto LABEL_40;
    }
    v40[0] = NSLocalizedDescriptionKey;
    v22 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
    v41[0] = v22;
    v40[1] = NSLocalizedFailureReasonErrorKey;
    v34 = [v14 localizedFailureReason];
    v41[1] = v34;
    v23 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v23);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    id v16 = v14;
LABEL_23:

LABEL_38:
    goto LABEL_40;
  }
  if (!v12)
  {
    id v16 = v13;
    goto LABEL_14;
  }
  id v35 = 0;
  v15 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v12 error:&v35];
  id v16 = v35;

  if (v15)
  {
    [v7 setSourceExpression:v15];

LABEL_14:
    v17 = [v7 build];
    goto LABEL_15;
  }
  if (a4)
  {
    v38[0] = NSLocalizedDescriptionKey;
    uint64_t v24 = [v16 localizedDescription];
    v22 = (void *)v24;
    if (!v24)
    {
      uint64_t v24 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
    }
    v34 = (void *)v24;
    v39[0] = v24;
    v38[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v25 = [v16 localizedFailureReason];
    v26 = (void *)v25;
    if (!v25)
    {
      uint64_t v25 = +[NSString stringWithFormat:@"Error instantiating '%@' model for key '%@'.", objc_opt_class(), @"SourceExpression"];
    }
    v33 = (void *)v25;
    v39[1] = v25;
    v38[2] = NSUnderlyingErrorKey;
    uint64_t v27 = (uint64_t)v16;
    if (!v16)
    {
      uint64_t v27 = +[NSNull null];
    }
    v28 = (void *)v27;
    v39[2] = v27;
    v38[3] = @"GCFailingKeyPathErrorKey";
    v29 = objc_msgSend(v16, "gc_failingKeyPath");
    v30 = v29;
    if (!v29) {
      v29 = &__NSArray0__struct;
    }
    v31 = [v29 arrayByAddingObject:@"SourceExpression"];
    v39[3] = v31;
    v32 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v32);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v16) {
    if (!v26)
    }

    if (v22) {
      goto LABEL_38;
    }
    goto LABEL_23;
  }
LABEL_40:

LABEL_41:
  v17 = 0;
LABEL_15:

  return v17;
}

@end