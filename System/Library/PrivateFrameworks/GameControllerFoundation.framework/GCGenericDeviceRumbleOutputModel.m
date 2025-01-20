@interface GCGenericDeviceRumbleOutputModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceRumbleOutputModel)init;
- (GCGenericDeviceRumbleOutputModel)initWithCoder:(id)a3;
- (NSArray)fields;
- (NSString)elementIdentifier;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceRumbleOutputModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceRumbleOutputModel)init
{
  return 0;
}

- (GCGenericDeviceRumbleOutputModel)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)GCGenericDeviceRumbleOutputModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceRumbleOutputModel *)&v12 init];
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"elementIdentifier"];
  elementIdentifier = v4->_elementIdentifier;
  v4->_elementIdentifier = (NSString *)v5;

  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v7 = +[NSArray arrayWithObjects:v13 count:2];
  v8 = +[NSSet setWithArray:v7];
  uint64_t v9 = [v3 decodeObjectOfClasses:v8 forKey:@"fields"];

  fields = v4->_fields;
  v4->_fields = (NSArray *)v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GCGenericDeviceRumbleOutputModel *)self elementIdentifier];
  [v4 encodeObject:v5 forKey:@"elementIdentifier"];

  id v6 = [(GCGenericDeviceRumbleOutputModel *)self fields];
  [v4 encodeObject:v6 forKey:@"fields"];
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
    if (([(GCGenericDeviceRumbleOutputModel *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
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
      || !-[GCGenericDeviceRumbleOutputModel isMemberOfClass:](self, "isMemberOfClass:", [(id)objc_opt_class() modelClass]))
    {
      goto LABEL_8;
    }
  }
  uint64_t v5 = [(GCGenericDeviceRumbleOutputModel *)self elementIdentifier];
  id v6 = [v4 elementIdentifier];
  if ([v5 isEqual:v6])
  {
    v7 = [(GCGenericDeviceRumbleOutputModel *)self fields];
    v8 = [v4 fields];
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
  return @"Rumble Output";
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(GCGenericDeviceRumbleOutputModel *)self elementIdentifier];
  id v6 = [(GCGenericDeviceRumbleOutputModel *)self fields];
  v7 = [v6 debugDescription];
  v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  char v9 = +[NSString stringWithFormat:@"<%@ %p> {\n\t elementIdentifier = %@\n\t fields = %@\n}", v4, self, v5, v8];

  return v9;
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)fields
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);

  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  v34 = objc_opt_new();
  v45[0] = 0;
  uint64_t v5 = objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", @"ElementIdentifier", objc_opt_class(), v45);
  id v6 = v45[0];
  if (!v5)
  {
    if (a4)
    {
      v50[0] = NSLocalizedDescriptionKey;
      v23 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v51[0] = v23;
      v50[1] = NSLocalizedFailureReasonErrorKey;
      v24 = [v6 localizedFailureReason];
      v51[1] = v24;
      v25 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v25);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_30;
  }
  [v34 setElementIdentifier:v5];

  id v44 = 0;
  v7 = objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", @"Fields", objc_opt_class(), &v44);
  id v6 = v44;
  if (!v7)
  {
    if (a4)
    {
      v48[0] = NSLocalizedDescriptionKey;
      v26 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v49[0] = v26;
      v48[1] = NSLocalizedFailureReasonErrorKey;
      v27 = [v6 localizedFailureReason];
      v49[1] = v27;
      v28 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v28);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_30:
    v21 = 0;
    goto LABEL_21;
  }
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__10;
  v42 = __Block_byref_object_dispose__10;
  id v43 = 0;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __91__GCGenericDeviceRumbleOutputModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke;
  v35[3] = &unk_26BEC4CD8;
  v37 = &v38;
  id v8 = (id)objc_msgSend(objc_alloc((Class)&off_26BEEB1B8), "initWithCapacity:", objc_msgSend(v7, "count"));
  id v36 = v8;
  objc_msgSend(v7, "gc_enumerateObjectsUsingBlock:", v35);
  uint64_t v9 = [v8 count];
  uint64_t v10 = [v7 count];
  if (v9 == v10)
  {
    [v34 setFields:v8];
  }
  else if (a4)
  {
    v46[0] = NSLocalizedDescriptionKey;
    v31 = [(id)v39[5] localizedDescription];
    if ([v31 length]) {
      [(id)v39[5] localizedDescription];
    }
    else {
    v30 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
    }
    v47[0] = v30;
    v46[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v11 = [(id)v39[5] localizedFailureReason];
    objc_super v12 = (void *)v11;
    v13 = &stru_26BED82A0;
    if (v11) {
      v13 = (__CFString *)v11;
    }
    v47[1] = v13;
    v46[2] = NSUnderlyingErrorKey;
    uint64_t v14 = v39[5];
    if (v14)
    {
      v15 = (void *)v39[5];
      uint64_t v16 = (uint64_t)v15;
    }
    else
    {
      uint64_t v16 = +[NSNull null];
      v15 = (void *)v39[5];
    }
    v29 = (void *)v16;
    v47[2] = v16;
    v46[3] = @"GCFailingKeyPathErrorKey";
    v17 = objc_msgSend(v15, "gc_failingKeyPath");
    v18 = v17;
    if (!v17) {
      v17 = &__NSArray0__struct;
    }
    v19 = [v17 arrayByAddingObject:@"Fields"];
    v47[3] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:4];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v20);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14) {
  }
    }

  _Block_object_dispose(&v38, 8);
  if (v9 == v10)
  {
    id v6 = v34;
    v21 = [v34 build];
    v34 = 0;
LABEL_21:

    goto LABEL_23;
  }
  v21 = 0;
LABEL_23:

  return v21;
}

void __91__GCGenericDeviceRumbleOutputModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke(uint64_t a1, void (**a2)(void, void, void), uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v10 + 40);
  uint64_t v11 = ((void (**)(void, uint64_t, id *))a2)[2](v8, v9, &obj);

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    objc_super v12 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v40 = 0;
    v13 = +[GCGenericDeviceRumbleOutputFieldModel modelWithDictionaryRepresentation:v11 error:&v40];
    objc_storeStrong(v12, v40);
    if (v13)
    {
      [*(id *)(a1 + 32) addObject:v13];
    }
    else
    {
      v42[0] = NSLocalizedDescriptionKey;
      uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) localizedDescription];
      v22 = &stru_26BED82A0;
      v39 = (void *)v21;
      if (v21) {
        v22 = (__CFString *)v21;
      }
      v43[0] = v22;
      v42[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v23 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) localizedFailureReason];
      uint64_t v38 = (void *)v23;
      if (!v23)
      {
        uint64_t v23 = +[NSString stringWithFormat:@"Error instantiating '%@' model.", objc_opt_class()];
      }
      v37 = (void *)v23;
      v43[1] = v23;
      v42[2] = NSUnderlyingErrorKey;
      v24 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      v25 = v24;
      uint64_t v26 = (uint64_t)v24;
      if (!v24)
      {
        uint64_t v26 = +[NSNull null];
        v25 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      }
      id v36 = (void *)v26;
      v43[2] = v26;
      v42[3] = @"GCFailingKeyPathErrorKey";
      uint64_t v27 = objc_msgSend(v25, "gc_failingKeyPath");
      v28 = (void *)v27;
      if (v27) {
        v29 = (void *)v27;
      }
      else {
        v29 = &__NSArray0__struct;
      }
      v30 = +[NSString stringWithFormat:@"[%zd]", a3];
      v31 = [v29 arrayByAddingObject:v30];
      v43[3] = v31;
      v32 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:4];
      uint64_t v33 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v32);
      uint64_t v34 = *(void *)(*(void *)(a1 + 40) + 8);
      v35 = *(void **)(v34 + 40);
      *(void *)(v34 + 40) = v33;

      if (!v24) {
      if (!v38)
      }

      *a4 = 1;
    }
  }
  else
  {
    v45[0] = NSLocalizedFailureReasonErrorKey;
    uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) localizedFailureReason];
    v46[0] = v14;
    v45[1] = @"GCFailingKeyPathErrorKey";
    v15 = +[NSString stringWithFormat:@"[%zd]", a3];
    id v44 = v15;
    uint64_t v16 = +[NSArray arrayWithObjects:&v44 count:1];
    v46[1] = v16;
    v17 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
    uint64_t v18 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v17);
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    *a4 = 1;
  }
}

@end