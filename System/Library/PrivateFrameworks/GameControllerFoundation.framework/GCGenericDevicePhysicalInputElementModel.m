@interface GCGenericDevicePhysicalInputElementModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (GCGenericDevicePhysicalInputElementModel)init;
- (GCGenericDevicePhysicalInputElementModel)initWithCoder:(id)a3;
- (NSArray)names;
- (NSNumber)isAnalog;
- (NSString)identifier;
- (NSString)localizedNameKey;
- (NSString)symbolName;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDevicePhysicalInputElementModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDevicePhysicalInputElementModel)init
{
  return 0;
}

- (GCGenericDevicePhysicalInputElementModel)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)GCGenericDevicePhysicalInputElementModel;
  id v3 = a3;
  v4 = [(GCGenericDevicePhysicalInputElementModel *)&v16 init];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"identifier", v16.receiver, v16.super_class);
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  uint64_t v7 = [v3 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"names"];
  names = v4->_names;
  v4->_names = (NSArray *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"analog"];
  analog = v4->_analog;
  v4->_analog = (NSNumber *)v9;

  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"localizedNameKey"];
  localizedNameKey = v4->_localizedNameKey;
  v4->_localizedNameKey = (NSString *)v11;

  uint64_t v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"symbolName"];

  symbolName = v4->_symbolName;
  v4->_symbolName = (NSString *)v13;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GCGenericDevicePhysicalInputElementModel *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(GCGenericDevicePhysicalInputElementModel *)self names];
  [v4 encodeObject:v6 forKey:@"names"];

  uint64_t v7 = [(GCGenericDevicePhysicalInputElementModel *)self isAnalog];
  [v4 encodeObject:v7 forKey:@"analog"];

  v8 = [(GCGenericDevicePhysicalInputElementModel *)self localizedNameKey];
  [v4 encodeObject:v8 forKey:@"localizedNameKey"];

  id v9 = [(GCGenericDevicePhysicalInputElementModel *)self symbolName];
  [v4 encodeObject:v9 forKey:@"symbolName"];
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
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDevicePhysicalInputElementModel isMemberOfClass:](self, "isMemberOfClass:", [(id)objc_opt_class() modelClass]))
    {
      goto LABEL_12;
    }
LABEL_6:
    uint64_t v5 = [(GCGenericDevicePhysicalInputElementModel *)self identifier];
    v6 = [v4 identifier];
    if (![v5 isEqual:v6])
    {
      char v15 = 0;
LABEL_26:

      goto LABEL_27;
    }
    uint64_t v7 = [(GCGenericDevicePhysicalInputElementModel *)self names];
    v8 = [v4 names];
    if (![v7 isEqual:v8])
    {
      char v15 = 0;
LABEL_25:

      goto LABEL_26;
    }
    id v9 = [(GCGenericDevicePhysicalInputElementModel *)self isAnalog];
    v10 = [v4 isAnalog];
    if (![v9 isEqual:v10])
    {
      char v15 = 0;
LABEL_24:

      goto LABEL_25;
    }
    uint64_t v11 = [(GCGenericDevicePhysicalInputElementModel *)self localizedNameKey];
    uint64_t v12 = [v4 localizedNameKey];
    uint64_t v13 = (void *)v12;
    if (v11 == (void *)v12)
    {
      v24 = (void *)v12;
      v25 = v11;
    }
    else
    {
      v22 = v10;
      v14 = [(GCGenericDevicePhysicalInputElementModel *)self localizedNameKey];
      v26 = [v4 localizedNameKey];
      v27 = v14;
      if (!objc_msgSend(v14, "isEqual:"))
      {
        char v15 = 0;
        v10 = v22;
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      v24 = v13;
      v25 = v11;
      v10 = v22;
    }
    objc_super v16 = [(GCGenericDevicePhysicalInputElementModel *)self symbolName];
    uint64_t v17 = [v4 symbolName];
    if (v16 == (void *)v17)
    {

      char v15 = 1;
    }
    else
    {
      v18 = (void *)v17;
      v21 = [(GCGenericDevicePhysicalInputElementModel *)self symbolName];
      [v4 symbolName];
      v19 = v23 = v9;
      char v15 = [v21 isEqual:v19];

      id v9 = v23;
    }
    uint64_t v13 = v24;
    uint64_t v11 = v25;
    if (v25 == v24) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if ([(GCGenericDevicePhysicalInputElementModel *)self isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
LABEL_12:
  char v15 = 0;
LABEL_27:

  return v15;
}

+ (id)description
{
  return @"Element";
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(GCGenericDevicePhysicalInputElementModel *)self identifier];
  v6 = [(GCGenericDevicePhysicalInputElementModel *)self names];
  uint64_t v7 = [(GCGenericDevicePhysicalInputElementModel *)self isAnalog];
  v8 = [(GCGenericDevicePhysicalInputElementModel *)self localizedNameKey];
  id v9 = [(GCGenericDevicePhysicalInputElementModel *)self symbolName];
  v10 = +[NSString stringWithFormat:@"<%@ %p> {\n\t identifier = %@\n\t names = %@\n\t analog = %@\n\t localizedNameKey = %@\n\t symbolName = %@\n}", v4, self, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)names
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)isAnalog
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)localizedNameKey
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)symbolName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_localizedNameKey, 0);
  objc_storeStrong((id *)&self->_analog, 0);
  objc_storeStrong((id *)&self->_names, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v20[0] = 0;
  uint64_t v7 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"Type", objc_opt_class(), v20);
  id v8 = v20[0];
  if (v7)
  {
    id v9 = +[NSString stringWithFormat:@"GCGenericDevicePhysicalInput%@ModelBuilder", v7];
    v10 = NSClassFromString(v9);
    if (v10
      && v10 != (objc_class *)objc_opt_class()
      && ([(objc_class *)v10 isSubclassOfClass:objc_opt_class()] & 1) != 0)
    {
      uint64_t v11 = (void *)[[v10 alloc] initWithDictionaryRepresentation:v6 error:a4];
      if (v11)
      {

        uint64_t v12 = [v11 build];
        id v8 = v11;
        goto LABEL_7;
      }
    }
    else if (a4)
    {
      v21[0] = NSLocalizedDescriptionKey;
      v14 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v22[0] = v14;
      v21[1] = NSLocalizedFailureReasonErrorKey;
      char v15 = +[NSString stringWithFormat:@"'%@' is not a valid element type.", v7];
      v22[1] = v15;
      objc_super v16 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a4)
  {
    v23[0] = NSLocalizedDescriptionKey;
    uint64_t v17 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
    v24[0] = v17;
    v23[1] = NSLocalizedFailureReasonErrorKey;
    v18 = [v8 localizedFailureReason];
    v24[1] = v18;
    v19 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v19);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v12 = 0;
LABEL_7:

  return v12;
}

@end