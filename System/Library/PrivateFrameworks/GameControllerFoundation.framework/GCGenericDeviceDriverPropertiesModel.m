@interface GCGenericDeviceDriverPropertiesModel
+ (BOOL)supportsSecureCoding;
+ (GCGenericDeviceDriverPropertiesModel)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDriverPropertiesModel)init;
- (GCGenericDeviceDriverPropertiesModel)initWithCoder:(id)a3;
- (NSSet)properties;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceDriverPropertiesModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDriverPropertiesModel)init
{
  return 0;
}

- (GCGenericDeviceDriverPropertiesModel)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDriverPropertiesModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceDriverPropertiesModel *)&v10 init];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v5 = +[NSArray arrayWithObjects:v11 count:2];
  v6 = +[NSSet setWithArray:v5];
  uint64_t v7 = [v3 decodeObjectOfClasses:v6 forKey:@"properties"];

  properties = v4->_properties;
  v4->_properties = (NSSet *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(GCGenericDeviceDriverPropertiesModel *)self properties];
  [v4 encodeObject:v5 forKey:@"properties"];
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
    if (([(GCGenericDeviceDriverPropertiesModel *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
LABEL_7:
      char v7 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceDriverPropertiesModel isMemberOfClass:](self, "isMemberOfClass:", [(id)objc_opt_class() modelClass]))
    {
      goto LABEL_7;
    }
  }
  id v5 = [(GCGenericDeviceDriverPropertiesModel *)self properties];
  v6 = [v4 properties];
  char v7 = [v5 isEqual:v6];

LABEL_8:
  return v7;
}

+ (id)description
{
  return @"Driver Properties";
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(GCGenericDeviceDriverPropertiesModel *)self properties];
  v6 = [v5 debugDescription];
  char v7 = [v6 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v8 = +[NSString stringWithFormat:@"<%@ %p> {\n\t properties = %@\n}", v4, self, v7];

  return v8;
}

- (NSSet)properties
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

+ (GCGenericDeviceDriverPropertiesModel)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  v34 = objc_opt_new();
  v45[0] = 0;
  id v5 = objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", @"Properties", objc_opt_class(), v45);
  id v33 = v45[0];
  if (!v5)
  {
    if (a4)
    {
      v48[0] = NSLocalizedDescriptionKey;
      v25 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v49[0] = v25;
      v48[1] = NSLocalizedFailureReasonErrorKey;
      v26 = [v33 localizedFailureReason];
      v49[1] = v26;
      v27 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v27);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = 0;
    v22 = v33;
    goto LABEL_20;
  }
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__13;
  v43 = __Block_byref_object_dispose__13;
  id v44 = 0;
  v6 = objc_msgSend(objc_alloc((Class)&off_26BEEB428), "initWithCapacity:", objc_msgSend(v5, "count"));
  char v7 = objc_msgSend(objc_alloc((Class)&off_26BEEB428), "initWithCapacity:", objc_msgSend(v5, "count"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __95__GCGenericDeviceDriverPropertiesModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke;
  v35[3] = &unk_26BEC3B60;
  v38 = &v39;
  id v8 = v6;
  id v36 = v8;
  id v9 = v7;
  id v37 = v9;
  objc_msgSend(v5, "gc_enumerateObjectsUsingBlock:", v35);
  uint64_t v10 = [v9 count];
  uint64_t v11 = [v5 count];
  if (v10 == v11)
  {
    [v34 setProperties:v9];
  }
  else if (a4)
  {
    v46[0] = NSLocalizedDescriptionKey;
    v30 = [(id)v40[5] localizedDescription];
    if ([v30 length]) {
      [(id)v40[5] localizedDescription];
    }
    else {
    v29 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
    }
    v47[0] = v29;
    v46[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v12 = [(id)v40[5] localizedFailureReason];
    v13 = (void *)v12;
    v14 = &stru_26BED82A0;
    if (v12) {
      v14 = (__CFString *)v12;
    }
    v47[1] = v14;
    v46[2] = NSUnderlyingErrorKey;
    uint64_t v15 = v40[5];
    if (v15)
    {
      v16 = (void *)v40[5];
      uint64_t v17 = (uint64_t)v16;
    }
    else
    {
      uint64_t v17 = +[NSNull null];
      v16 = (void *)v40[5];
    }
    v28 = (void *)v17;
    v47[2] = v17;
    v46[3] = @"GCFailingKeyPathErrorKey";
    v18 = objc_msgSend(v16, "gc_failingKeyPath");
    v19 = v18;
    if (!v18) {
      v18 = &__NSArray0__struct;
    }
    v20 = [v18 arrayByAddingObject:@"Properties"];
    v47[3] = v20;
    v21 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:4];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v15) {
  }
    }

  _Block_object_dispose(&v39, 8);
  if (v10 == v11)
  {
    v22 = v34;
    v23 = [v34 build];
    v34 = 0;
LABEL_20:

    goto LABEL_22;
  }
  v23 = 0;
LABEL_22:

  return (GCGenericDeviceDriverPropertiesModel *)v23;
}

void __95__GCGenericDeviceDriverPropertiesModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke(uint64_t a1, void (**a2)(void, void, void), uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v10 + 40);
  uint64_t v11 = ((void (**)(void, uint64_t, id *))a2)[2](v8, v9, &obj);

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    uint64_t v12 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v49 = 0;
    v13 = +[GCGenericDeviceDriverPropertyModel modelWithDictionaryRepresentation:v11 error:&v49];
    objc_storeStrong(v12, v49);
    if (v13)
    {
      v14 = [v13 name];
      uint64_t v15 = [*(id *)(a1 + 32) member:v14];

      if (v15)
      {
        v52[0] = NSLocalizedFailureReasonErrorKey;
        v16 = +[NSString stringWithFormat:@"Duplicate definition of '%@' with name '%@'.", objc_opt_class(), v14];
        v53[0] = v16;
        v52[1] = @"GCFailingKeyPathErrorKey";
        uint64_t v17 = +[NSString stringWithFormat:@"[%zd]", a3];
        v51 = v17;
        v18 = +[NSArray arrayWithObjects:&v51 count:1];
        v53[1] = v18;
        v19 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
        uint64_t v20 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v19);
        uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
        v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = v20;

        *a4 = 1;
      }
      else
      {
        [*(id *)(a1 + 32) addObject:v14];
        [*(id *)(a1 + 40) addObject:v13];
      }
    }
    else
    {
      v54[0] = NSLocalizedDescriptionKey;
      uint64_t v30 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) localizedDescription];
      v31 = &stru_26BED82A0;
      v48 = (void *)v30;
      if (v30) {
        v31 = (__CFString *)v30;
      }
      v55[0] = v31;
      v54[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v32 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) localizedFailureReason];
      v47 = (void *)v32;
      if (!v32)
      {
        uint64_t v32 = +[NSString stringWithFormat:@"Error instantiating '%@' model.", objc_opt_class()];
      }
      v46 = (void *)v32;
      v55[1] = v32;
      v54[2] = NSUnderlyingErrorKey;
      id v33 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v34 = v33;
      uint64_t v35 = (uint64_t)v33;
      if (!v33)
      {
        uint64_t v35 = +[NSNull null];
        v34 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
      v45 = (void *)v35;
      v55[2] = v35;
      v54[3] = @"GCFailingKeyPathErrorKey";
      uint64_t v36 = objc_msgSend(v34, "gc_failingKeyPath");
      id v37 = (void *)v36;
      if (v36) {
        v38 = (void *)v36;
      }
      else {
        v38 = &__NSArray0__struct;
      }
      uint64_t v39 = +[NSString stringWithFormat:@"[%zd]", a3];
      v40 = [v38 arrayByAddingObject:v39];
      v55[3] = v40;
      uint64_t v41 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:4];
      uint64_t v42 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v41);
      uint64_t v43 = *(void *)(*(void *)(a1 + 48) + 8);
      id v44 = *(void **)(v43 + 40);
      *(void *)(v43 + 40) = v42;

      if (!v33) {
      if (!v47)
      }

      *a4 = 1;
    }
  }
  else
  {
    v57[0] = NSLocalizedFailureReasonErrorKey;
    v23 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) localizedFailureReason];
    v58[0] = v23;
    v57[1] = @"GCFailingKeyPathErrorKey";
    v24 = +[NSString stringWithFormat:@"[%zd]", a3];
    v56 = v24;
    v25 = +[NSArray arrayWithObjects:&v56 count:1];
    v58[1] = v25;
    v26 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
    uint64_t v27 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v26);
    uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
    v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    *a4 = 1;
  }
}

@end