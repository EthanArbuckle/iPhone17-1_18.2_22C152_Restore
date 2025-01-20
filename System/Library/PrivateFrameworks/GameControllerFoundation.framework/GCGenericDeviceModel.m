@interface GCGenericDeviceModel
+ (BOOL)supportsSecureCoding;
+ (GCGenericDeviceModel)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDriverModel)driver;
- (GCGenericDeviceModel)init;
- (GCGenericDeviceModel)initWithCoder:(id)a3;
- (GCGenericDevicePhysicalInputModel)physicalInput;
- (NSNumber)isFormFitting;
- (NSString)productCategory;
- (NSString)productName;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceModel)init
{
  return 0;
}

- (GCGenericDeviceModel)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)GCGenericDeviceModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceModel *)&v16 init];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"productCategory", v16.receiver, v16.super_class);
  productCategory = v4->_productCategory;
  v4->_productCategory = (NSString *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"productName"];
  productName = v4->_productName;
  v4->_productName = (NSString *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"formFitting"];
  formFitting = v4->_formFitting;
  v4->_formFitting = (NSNumber *)v9;

  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"driver"];
  driver = v4->_driver;
  v4->_driver = (GCGenericDeviceDriverModel *)v11;

  uint64_t v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"physicalInput"];

  physicalInput = v4->_physicalInput;
  v4->_physicalInput = (GCGenericDevicePhysicalInputModel *)v13;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GCGenericDeviceModel *)self productCategory];
  [v4 encodeObject:v5 forKey:@"productCategory"];

  v6 = [(GCGenericDeviceModel *)self productName];
  [v4 encodeObject:v6 forKey:@"productName"];

  uint64_t v7 = [(GCGenericDeviceModel *)self isFormFitting];
  [v4 encodeObject:v7 forKey:@"formFitting"];

  v8 = [(GCGenericDeviceModel *)self driver];
  [v4 encodeObject:v8 forKey:@"driver"];

  id v9 = [(GCGenericDeviceModel *)self physicalInput];
  [v4 encodeObject:v9 forKey:@"physicalInput"];
}

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceModel isMemberOfClass:](self, "isMemberOfClass:", [(id)objc_opt_class() modelClass]))
    {
      goto LABEL_10;
    }
LABEL_6:
    v6 = [(GCGenericDeviceModel *)self productCategory];
    uint64_t v7 = [v5 productCategory];
    if (![v6 isEqual:v7])
    {
      char v11 = 0;
LABEL_32:

      goto LABEL_33;
    }
    v8 = [(GCGenericDeviceModel *)self productName];
    id v9 = [v5 productName];
    if (v8 != v9)
    {
      v10 = [(GCGenericDeviceModel *)self productName];
      id v3 = [v5 productName];
      v36 = v10;
      if (![v10 isEqual:v3])
      {
        char v11 = 0;
        goto LABEL_30;
      }
    }
    v12 = [(GCGenericDeviceModel *)self isFormFitting];
    uint64_t v13 = [v5 isFormFitting];
    v14 = (void *)v13;
    if (v12 == (void *)v13)
    {
      v34 = (void *)v13;
    }
    else
    {
      v15 = [(GCGenericDeviceModel *)self isFormFitting];
      v32 = [v5 isFormFitting];
      v33 = v15;
      if (![v15 isEqual:v32])
      {
        char v11 = 0;
LABEL_28:

LABEL_29:
        if (v8 == v9)
        {
LABEL_31:

          goto LABEL_32;
        }
LABEL_30:

        goto LABEL_31;
      }
      v34 = v14;
    }
    uint64_t v16 = [(GCGenericDeviceModel *)self driver];
    v17 = [v5 driver];
    v35 = (void *)v16;
    if ((void *)v16 == v17)
    {
      v28 = v12;
      v29 = v3;
    }
    else
    {
      v18 = [(GCGenericDeviceModel *)self driver];
      v30 = [v5 driver];
      v31 = v18;
      if (!objc_msgSend(v18, "isEqual:"))
      {
        char v11 = 0;
        v25 = v35;
        goto LABEL_26;
      }
      v28 = v12;
      v29 = v3;
    }
    v19 = [(GCGenericDeviceModel *)self physicalInput];
    uint64_t v20 = [v5 physicalInput];
    if (v19 == (void *)v20)
    {

      char v11 = 1;
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(GCGenericDeviceModel *)self physicalInput];
      [v5 physicalInput];
      v27 = v9;
      v24 = v23 = v8;
      char v11 = [v22 isEqual:v24];

      v8 = v23;
      id v9 = v27;
    }
    v25 = v35;
    v12 = v28;
    id v3 = v29;
    if (v35 == v17)
    {
LABEL_27:

      v14 = v34;
      if (v12 == v34) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
LABEL_26:

    goto LABEL_27;
  }
  if ([(GCGenericDeviceModel *)self isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
LABEL_10:
  char v11 = 0;
LABEL_33:

  return v11;
}

+ (id)description
{
  return @"Model";
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v3);
  id v4 = [(GCGenericDeviceModel *)self productCategory];
  id v5 = [(GCGenericDeviceModel *)self productName];
  v6 = [(GCGenericDeviceModel *)self isFormFitting];
  v15 = [(GCGenericDeviceModel *)self driver];
  uint64_t v7 = [v15 debugDescription];
  v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  id v9 = [(GCGenericDeviceModel *)self physicalInput];
  v10 = [v9 debugDescription];
  char v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v12 = +[NSString stringWithFormat:@"<%@ %p> {\n\t productCategory = %@\n\t productName = %@\n\t formFitting = %@\n\t driver = %@\n\t physicalInput = %@\n}", v14, self, v4, v5, v6, v8, v11];

  return v12;
}

- (NSString)productCategory
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)productName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)isFormFitting
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (GCGenericDeviceDriverModel)driver
{
  return (GCGenericDeviceDriverModel *)objc_getProperty(self, a2, 32, 1);
}

- (GCGenericDevicePhysicalInputModel)physicalInput
{
  return (GCGenericDevicePhysicalInputModel *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalInput, 0);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_storeStrong((id *)&self->_formFitting, 0);
  objc_storeStrong((id *)&self->_productName, 0);

  objc_storeStrong((id *)&self->_productCategory, 0);
}

+ (GCGenericDeviceModel)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  v20[0] = 0;
  uint64_t v7 = objc_msgSend(a3, "gc_objectForKey:ofClass:error:", @"ProductClass", objc_opt_class(), v20);
  id v8 = v20[0];
  id v9 = v8;
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    if (v7)
    {
      v12 = +[NSString stringWithFormat:@"GCGeneric%@ModelBuilder", v7];
      Class v13 = NSClassFromString(v12);
      if (!v13 || ([(objc_class *)v13 isSubclassOfClass:objc_opt_class()] & 1) == 0)
      {
        if (!a4)
        {
LABEL_21:

          goto LABEL_22;
        }
        v21[0] = NSLocalizedDescriptionKey;
        v17 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
        v22[0] = v17;
        v21[1] = NSLocalizedFailureReasonErrorKey;
        v18 = +[NSString stringWithFormat:@"'%@' is not a valid product class.", v7];
        v22[1] = v18;
        v19 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v19);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
        goto LABEL_21;
      }
    }
    else
    {
      Class v13 = (Class)v11;
    }
    v14 = (void *)[[v13 alloc] initWithDictionaryRepresentation:a3 error:a4];
    if (v14)
    {

      v15 = [v14 build];
      id v9 = v14;
      goto LABEL_13;
    }
  }
  else if (a4)
  {
    v23[0] = NSLocalizedDescriptionKey;
    v12 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
    v24[0] = v12;
    v23[1] = NSLocalizedFailureReasonErrorKey;
    v17 = [v9 localizedFailureReason];
    v24[1] = v17;
    v18 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_22:

  v15 = 0;
LABEL_13:

  return (GCGenericDeviceModel *)v15;
}

@end