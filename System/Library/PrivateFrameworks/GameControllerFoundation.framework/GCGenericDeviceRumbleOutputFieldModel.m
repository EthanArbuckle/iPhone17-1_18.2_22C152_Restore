@interface GCGenericDeviceRumbleOutputFieldModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDataProcessorExpressionModel)offsetExpression;
- (GCGenericDeviceDataProcessorExpressionModel)sizeExpression;
- (GCGenericDeviceDataProcessorExpressionModel)valueExpression;
- (GCGenericDeviceRumbleOutputFieldModel)init;
- (GCGenericDeviceRumbleOutputFieldModel)initWithCoder:(id)a3;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceRumbleOutputFieldModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceRumbleOutputFieldModel)init
{
  return 0;
}

- (GCGenericDeviceRumbleOutputFieldModel)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)GCGenericDeviceRumbleOutputFieldModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceRumbleOutputFieldModel *)&v12 init];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"valueExpression", v12.receiver, v12.super_class);
  valueExpression = v4->_valueExpression;
  v4->_valueExpression = (GCGenericDeviceDataProcessorExpressionModel *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sizeExpression"];
  sizeExpression = v4->_sizeExpression;
  v4->_sizeExpression = (GCGenericDeviceDataProcessorExpressionModel *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"offsetExpression"];

  offsetExpression = v4->_offsetExpression;
  v4->_offsetExpression = (GCGenericDeviceDataProcessorExpressionModel *)v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GCGenericDeviceRumbleOutputFieldModel *)self valueExpression];
  [v4 encodeObject:v5 forKey:@"valueExpression"];

  v6 = [(GCGenericDeviceRumbleOutputFieldModel *)self offsetExpression];
  [v4 encodeObject:v6 forKey:@"offsetExpression"];

  id v7 = [(GCGenericDeviceRumbleOutputFieldModel *)self sizeExpression];
  [v4 encodeObject:v7 forKey:@"sizeExpression"];
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
    if (([(GCGenericDeviceRumbleOutputFieldModel *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
LABEL_9:
      char v11 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceRumbleOutputFieldModel isMemberOfClass:](self, "isMemberOfClass:", [(id)objc_opt_class() modelClass]))
    {
      goto LABEL_9;
    }
  }
  uint64_t v5 = [(GCGenericDeviceRumbleOutputFieldModel *)self valueExpression];
  v6 = [v4 valueExpression];
  if ([v5 isEqual:v6])
  {
    id v7 = [(GCGenericDeviceRumbleOutputFieldModel *)self offsetExpression];
    v8 = [v4 offsetExpression];
    if ([v7 isEqual:v8])
    {
      uint64_t v9 = [(GCGenericDeviceRumbleOutputFieldModel *)self sizeExpression];
      v10 = [v4 sizeExpression];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

LABEL_14:
  return v11;
}

+ (id)description
{
  return @"Rumble Output Field";
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(GCGenericDeviceRumbleOutputFieldModel *)self valueExpression];
  v6 = [(GCGenericDeviceRumbleOutputFieldModel *)self offsetExpression];
  id v7 = [(GCGenericDeviceRumbleOutputFieldModel *)self sizeExpression];
  v8 = +[NSString stringWithFormat:@"<%@ %p> {\n\t valueExpression = %@\n\t offsetExpression = %@\n\t sizeExpression = %@\n}", v4, self, v5, v6, v7];

  return v8;
}

- (GCGenericDeviceDataProcessorExpressionModel)valueExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 8, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)sizeExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 24, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)offsetExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeExpression, 0);
  objc_storeStrong((id *)&self->_offsetExpression, 0);

  objc_storeStrong((id *)&self->_valueExpression, 0);
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  v6 = objc_opt_new();
  v72[0] = 0;
  id v7 = objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", @"ValueExpression", objc_opt_class(), v72);
  id v8 = v72[0];
  if (v7)
  {
    id v71 = 0;
    uint64_t v9 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v7 error:&v71];
    id v10 = v71;

    if (v9)
    {
      [v6 setValueExpression:v9];

      id v70 = 0;
      char v11 = objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", @"OffsetExpression", objc_opt_class(), &v70);
      id v12 = v70;
      if (v11)
      {
        id v69 = 0;
        v13 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v11 error:&v69];
        id v14 = v69;

        if (v13)
        {
          [v6 setOffsetExpression:v13];

          id v68 = 0;
          v15 = objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", @"SizeExpression", objc_opt_class(), &v68);
          id v16 = v68;
          if (v15)
          {
            id v67 = 0;
            v17 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v15 error:&v67];
            id v18 = v67;

            if (v17)
            {
              [v6 setSizeExpression:v17];

              v19 = [v6 build];
              goto LABEL_8;
            }
            if (a4)
            {
              v73[0] = NSLocalizedDescriptionKey;
              uint64_t v46 = [v18 localizedDescription];
              v65 = (void *)v46;
              if (!v46)
              {
                uint64_t v46 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
              }
              v62 = (void *)v46;
              v74[0] = v46;
              v73[1] = NSLocalizedFailureReasonErrorKey;
              uint64_t v47 = [v18 localizedFailureReason];
              v48 = (void *)v47;
              if (!v47)
              {
                uint64_t v47 = +[NSString stringWithFormat:@"Error instantiating '%@' model for key '%@'.", objc_opt_class(), @"SizeExpression"];
              }
              v59 = (void *)v47;
              v74[1] = v47;
              v73[2] = NSUnderlyingErrorKey;
              uint64_t v49 = (uint64_t)v18;
              if (!v18)
              {
                uint64_t v49 = +[NSNull null];
              }
              v56 = (void *)v49;
              v74[2] = v49;
              v73[3] = @"GCFailingKeyPathErrorKey";
              v50 = objc_msgSend(v18, "gc_failingKeyPath");
              v51 = v50;
              if (!v50) {
                v50 = &__NSArray0__struct;
              }
              v52 = [v50 arrayByAddingObject:@"SizeExpression"];
              v74[3] = v52;
              v53 = +[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:4];
              +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v53);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

              if (!v18) {
              if (!v48)
              }

              if (!v65) {
            }
              }
          }
          else
          {
            if (a4)
            {
              v75[0] = NSLocalizedDescriptionKey;
              v43 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
              v76[0] = v43;
              v75[1] = NSLocalizedFailureReasonErrorKey;
              v44 = [v16 localizedFailureReason];
              v76[1] = v44;
              v45 = +[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:2];
              +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v45);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
          }
        }
        else
        {
          if (a4)
          {
            v77[0] = NSLocalizedDescriptionKey;
            uint64_t v35 = [v14 localizedDescription];
            v64 = (void *)v35;
            if (!v35)
            {
              uint64_t v35 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
            }
            v61 = (void *)v35;
            v78[0] = v35;
            v77[1] = NSLocalizedFailureReasonErrorKey;
            uint64_t v36 = [v14 localizedFailureReason];
            v37 = (void *)v36;
            if (!v36)
            {
              uint64_t v36 = +[NSString stringWithFormat:@"Error instantiating '%@' model for key '%@'.", objc_opt_class(), @"OffsetExpression"];
            }
            v58 = (void *)v36;
            v78[1] = v36;
            v77[2] = NSUnderlyingErrorKey;
            uint64_t v38 = (uint64_t)v14;
            if (!v14)
            {
              uint64_t v38 = +[NSNull null];
            }
            v55 = (void *)v38;
            v78[2] = v38;
            v77[3] = @"GCFailingKeyPathErrorKey";
            v39 = objc_msgSend(v14, "gc_failingKeyPath");
            v40 = v39;
            if (!v39) {
              v39 = &__NSArray0__struct;
            }
            v41 = [v39 arrayByAddingObject:@"OffsetExpression"];
            v78[3] = v41;
            v42 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:4];
            +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v42);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            if (!v14) {
            if (!v37)
            }

            if (!v64) {
          }
            }
        }
      }
      else
      {
        if (a4)
        {
          v79[0] = NSLocalizedDescriptionKey;
          v32 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
          v80[0] = v32;
          v79[1] = NSLocalizedFailureReasonErrorKey;
          v33 = [v12 localizedFailureReason];
          v80[1] = v33;
          v34 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:2];
          +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v34);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else
    {
      if (a4)
      {
        v81[0] = NSLocalizedDescriptionKey;
        uint64_t v24 = [v10 localizedDescription];
        v63 = (void *)v24;
        if (!v24)
        {
          uint64_t v24 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
        }
        v60 = (void *)v24;
        v82[0] = v24;
        v81[1] = NSLocalizedFailureReasonErrorKey;
        uint64_t v25 = [v10 localizedFailureReason];
        v26 = (void *)v25;
        if (!v25)
        {
          uint64_t v25 = +[NSString stringWithFormat:@"Error instantiating '%@' model for key '%@'.", objc_opt_class(), @"ValueExpression"];
        }
        v57 = (void *)v25;
        v82[1] = v25;
        v81[2] = NSUnderlyingErrorKey;
        uint64_t v27 = (uint64_t)v10;
        if (!v10)
        {
          uint64_t v27 = +[NSNull null];
        }
        v54 = (void *)v27;
        v82[2] = v27;
        v81[3] = @"GCFailingKeyPathErrorKey";
        v28 = objc_msgSend(v10, "gc_failingKeyPath");
        v29 = v28;
        if (!v28) {
          v28 = &__NSArray0__struct;
        }
        v30 = [v28 arrayByAddingObject:@"ValueExpression"];
        v82[3] = v30;
        v31 = +[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:4];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v31);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        if (!v10) {
        if (!v26)
        }

        if (!v63) {
      }
        }
    }
  }
  else
  {
    if (a4)
    {
      v83[0] = NSLocalizedDescriptionKey;
      v21 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v84[0] = v21;
      v83[1] = NSLocalizedFailureReasonErrorKey;
      v22 = [v8 localizedFailureReason];
      v84[1] = v22;
      v23 = +[NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v23);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v19 = 0;
LABEL_8:

  return v19;
}

@end