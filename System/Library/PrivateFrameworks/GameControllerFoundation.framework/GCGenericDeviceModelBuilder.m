@interface GCGenericDeviceModelBuilder
+ (Class)modelClass;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDriverModel)driver;
- (GCGenericDeviceModelBuilder)init;
- (GCGenericDeviceModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (GCGenericDevicePhysicalInputModel)physicalInput;
- (NSNumber)formFitting;
- (NSString)productCategory;
- (NSString)productName;
- (id)build;
- (unint64_t)hash;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setDriver:(id)a3;
- (void)setFormFitting:(id)a3;
- (void)setPhysicalInput:(id)a3;
- (void)setProductCategory:(id)a3;
- (void)setProductName:(id)a3;
@end

@implementation GCGenericDeviceModelBuilder

- (GCGenericDeviceModelBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceModelBuilder;
  return [(GCGenericDeviceModelBuilder *)&v3 init];
}

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 productCategory];
  [(GCGenericDeviceModelBuilder *)self setProductCategory:v5];

  v6 = [v4 productName];
  [(GCGenericDeviceModelBuilder *)self setProductName:v6];

  v7 = [v4 isFormFitting];
  [(GCGenericDeviceModelBuilder *)self setFormFitting:v7];

  v8 = [v4 driver];
  [(GCGenericDeviceModelBuilder *)self setDriver:v8];

  id v9 = [v4 physicalInput];

  [(GCGenericDeviceModelBuilder *)self setPhysicalInput:v9];
}

- (void)reset
{
  [(GCGenericDeviceModelBuilder *)self setProductCategory:0];
  [(GCGenericDeviceModelBuilder *)self setProductName:0];
  [(GCGenericDeviceModelBuilder *)self setFormFitting:0];
  [(GCGenericDeviceModelBuilder *)self setDriver:0];

  [(GCGenericDeviceModelBuilder *)self setPhysicalInput:0];
}

- (id)build
{
  id v4 = objc_alloc((Class)[(id)objc_opt_class() modelClass]);
  v5 = [(GCGenericDeviceModelBuilder *)self productCategory];
  if (!v5)
  {
    v21 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v21 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceModel.m" lineNumber:144 description:@"'productCategory' can not be nil"];
  }
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[1];
  v4[1] = v6;

  v8 = [(GCGenericDeviceModelBuilder *)self productName];
  uint64_t v9 = [v8 copy];
  v10 = (void *)v4[2];
  v4[2] = v9;

  v11 = [(GCGenericDeviceModelBuilder *)self formFitting];
  uint64_t v12 = [v11 copy];
  v13 = (void *)v4[3];
  v4[3] = v12;

  v14 = [(GCGenericDeviceModelBuilder *)self driver];
  uint64_t v15 = [v14 copy];
  v16 = (void *)v4[4];
  v4[4] = v15;

  v17 = [(GCGenericDeviceModelBuilder *)self physicalInput];
  uint64_t v18 = [v17 copy];
  v19 = (void *)v4[5];
  v4[5] = v18;

  return v4;
}

- (unint64_t)hash
{
  v2 = (void *)[(id)objc_opt_class() modelClass];

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v5 = [v4 isEqual:self];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GCGenericDeviceModelBuilder;
    unsigned __int8 v5 = [(GCGenericDeviceModelBuilder *)&v8 isEqual:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (NSString)productCategory
{
  return self->_productCategory;
}

- (void)setProductCategory:(id)a3
{
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
}

- (NSNumber)formFitting
{
  return self->_formFitting;
}

- (void)setFormFitting:(id)a3
{
}

- (GCGenericDeviceDriverModel)driver
{
  return self->_driver;
}

- (void)setDriver:(id)a3
{
}

- (GCGenericDevicePhysicalInputModel)physicalInput
{
  return self->_physicalInput;
}

- (void)setPhysicalInput:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalInput, 0);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_storeStrong((id *)&self->_formFitting, 0);
  objc_storeStrong((id *)&self->_productName, 0);

  objc_storeStrong((id *)&self->_productCategory, 0);
}

- (GCGenericDeviceModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(GCGenericDeviceModelBuilder *)self init];
  id v53 = 0;
  objc_super v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"ProductCategory", objc_opt_class(), &v53);
  id v9 = v53;
  if (!v8)
  {
    if (!a4) {
      goto LABEL_27;
    }
    v66[0] = NSLocalizedDescriptionKey;
    v23 = +[NSString stringWithFormat:@"Invalid '%@' definition.", v7];
    v67[0] = v23;
    v66[1] = NSLocalizedFailureReasonErrorKey;
    v24 = [v9 localizedFailureReason];
    v67[1] = v24;
    v25 = v67;
    v26 = v66;
LABEL_26:
    v27 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v26 count:2];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v27);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_27;
  }
  [(GCGenericDeviceModelBuilder *)v7 setProductCategory:v8];

  id v52 = 0;
  v10 = objc_msgSend(v6, "gc_objectForKey:ofClass:error:", @"ProductName", objc_opt_class(), &v52);
  id v11 = v52;
  id v9 = v11;
  if (!v10 && v11)
  {
    if (!a4) {
      goto LABEL_27;
    }
    v64[0] = NSLocalizedDescriptionKey;
    v23 = +[NSString stringWithFormat:@"Invalid '%@' definition.", v7];
    v65[0] = v23;
    v64[1] = NSLocalizedFailureReasonErrorKey;
    v24 = [v9 localizedFailureReason];
    v65[1] = v24;
    v25 = v65;
    v26 = v64;
    goto LABEL_26;
  }
  [(GCGenericDeviceModelBuilder *)v7 setProductName:v10];

  id v51 = 0;
  uint64_t v12 = objc_msgSend(v6, "gc_objectForKey:ofClass:error:", @"FormFitting", objc_opt_class(), &v51);
  id v13 = v51;
  id v9 = v13;
  if (!v12 && v13)
  {
    if (a4)
    {
      v62[0] = NSLocalizedDescriptionKey;
      v23 = +[NSString stringWithFormat:@"Invalid '%@' definition.", v7];
      v63[0] = v23;
      v62[1] = NSLocalizedFailureReasonErrorKey;
      v24 = [v9 localizedFailureReason];
      v63[1] = v24;
      v25 = v63;
      v26 = v62;
      goto LABEL_26;
    }
LABEL_27:

LABEL_56:
    v21 = 0;
    goto LABEL_19;
  }
  [(GCGenericDeviceModelBuilder *)v7 setFormFitting:v12];

  id v50 = 0;
  v14 = objc_msgSend(v6, "gc_objectForKey:ofClass:error:", @"Driver", objc_opt_class(), &v50);
  id v15 = v50;
  v16 = v15;
  if (!v14 && v15)
  {
    if (a4)
    {
      v60[0] = NSLocalizedDescriptionKey;
      v28 = +[NSString stringWithFormat:@"Invalid '%@' definition.", v7];
      v61[0] = v28;
      v60[1] = NSLocalizedFailureReasonErrorKey;
      v29 = [v16 localizedFailureReason];
      v61[1] = v29;
      v30 = v61;
      v31 = v60;
LABEL_32:
      v32 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v31 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v32);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      id v18 = v16;
LABEL_33:

LABEL_54:
      goto LABEL_55;
    }
LABEL_34:
    id v18 = v16;
    goto LABEL_55;
  }
  if (v14)
  {
    id v49 = 0;
    v17 = +[GCGenericDeviceDriverModel modelWithDictionaryRepresentation:v14 error:&v49];
    id v18 = v49;

    if (!v17)
    {
      if (a4)
      {
        v58[0] = NSLocalizedDescriptionKey;
        uint64_t v33 = [v18 localizedDescription];
        v28 = (void *)v33;
        if (!v33)
        {
          uint64_t v33 = +[NSString stringWithFormat:@"Invalid '%@' definition.", v7];
        }
        v46 = (void *)v33;
        v59[0] = v33;
        v58[1] = NSLocalizedFailureReasonErrorKey;
        uint64_t v34 = [v18 localizedFailureReason];
        v45 = (void *)v34;
        if (!v34)
        {
          uint64_t v34 = +[NSString stringWithFormat:@"Error instantiating '%@' model for key '%@'.", objc_opt_class(), @"Driver"];
        }
        v44 = (void *)v34;
        v59[1] = v34;
        v58[2] = @"GCFailingKeyPathErrorKey";
        v35 = objc_msgSend(v18, "gc_failingKeyPath");
        v36 = v35;
        if (!v35) {
          v35 = &__NSArray0__struct;
        }
        v37 = [v35 arrayByAddingObject:@"Driver"];
        v59[2] = v37;
        v38 = v59;
        v39 = v58;
LABEL_51:
        v43 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v39 count:3];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v43);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        if (!v45) {
        v29 = v46;
        }
        if (v28) {
          goto LABEL_54;
        }
        goto LABEL_33;
      }
LABEL_55:

      goto LABEL_56;
    }
    [(GCGenericDeviceModelBuilder *)v7 setDriver:v17];
  }
  else
  {
    id v18 = v15;
  }

  id v48 = 0;
  v14 = objc_msgSend(v6, "gc_objectForKey:ofClass:error:", @"PhysicalInput", objc_opt_class(), &v48);
  id v19 = v48;
  v16 = v19;
  if (!v14 && v19)
  {
    if (a4)
    {
      v56[0] = NSLocalizedDescriptionKey;
      v28 = +[NSString stringWithFormat:@"Invalid '%@' definition.", v7];
      v57[0] = v28;
      v56[1] = NSLocalizedFailureReasonErrorKey;
      v29 = [v16 localizedFailureReason];
      v57[1] = v29;
      v30 = v57;
      v31 = v56;
      goto LABEL_32;
    }
    goto LABEL_34;
  }
  if (!v14)
  {
    id v18 = v19;
    goto LABEL_18;
  }
  id v47 = 0;
  v20 = +[GCGenericDevicePhysicalInputModel modelWithDictionaryRepresentation:v14 error:&v47];
  id v18 = v47;

  if (!v20)
  {
    if (a4)
    {
      v54[0] = NSLocalizedDescriptionKey;
      uint64_t v40 = [v18 localizedDescription];
      v28 = (void *)v40;
      if (!v40)
      {
        uint64_t v40 = +[NSString stringWithFormat:@"Invalid '%@' definition.", v7];
      }
      v46 = (void *)v40;
      v55[0] = v40;
      v54[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v41 = [v18 localizedFailureReason];
      v45 = (void *)v41;
      if (!v41)
      {
        uint64_t v41 = +[NSString stringWithFormat:@"Error instantiating '%@' model for key '%@'.", objc_opt_class(), @"PhysicalInput"];
      }
      v44 = (void *)v41;
      v55[1] = v41;
      v54[2] = @"GCFailingKeyPathErrorKey";
      v42 = objc_msgSend(v18, "gc_failingKeyPath");
      v36 = v42;
      if (!v42) {
        v42 = &__NSArray0__struct;
      }
      v37 = [v42 arrayByAddingObject:@"PhysicalInput"];
      v55[2] = v37;
      v38 = v55;
      v39 = v54;
      goto LABEL_51;
    }
    goto LABEL_55;
  }
  [(GCGenericDeviceModelBuilder *)v7 setPhysicalInput:v20];

LABEL_18:
  v21 = v7;
LABEL_19:

  return v21;
}

@end