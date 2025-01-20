@interface GCGenericDeviceInputEventDriverModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceInputEventDriverModel)init;
- (GCGenericDeviceInputEventDriverModel)initWithCoder:(id)a3;
- (NSSet)gamepadEventFields;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceInputEventDriverModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceInputEventDriverModel)init
{
  return 0;
}

- (GCGenericDeviceInputEventDriverModel)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceInputEventDriverModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceInputEventDriverModel *)&v10 init];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v5 = +[NSArray arrayWithObjects:v11 count:2];
  v6 = +[NSSet setWithArray:v5];
  uint64_t v7 = [v3 decodeObjectOfClasses:v6 forKey:@"gamepadEventFields"];

  gamepadEventFields = v4->_gamepadEventFields;
  v4->_gamepadEventFields = (NSSet *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(GCGenericDeviceInputEventDriverModel *)self gamepadEventFields];
  [v4 encodeObject:v5 forKey:@"gamepadEventFields"];
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
    if (([(GCGenericDeviceInputEventDriverModel *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
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
      || !-[GCGenericDeviceInputEventDriverModel isMemberOfClass:](self, "isMemberOfClass:", [(id)objc_opt_class() modelClass]))
    {
      goto LABEL_7;
    }
  }
  id v5 = [(GCGenericDeviceInputEventDriverModel *)self gamepadEventFields];
  v6 = [v4 gamepadEventFields];
  char v7 = [v5 isEqual:v6];

LABEL_8:
  return v7;
}

+ (id)description
{
  return @"Input Event Driver";
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(GCGenericDeviceInputEventDriverModel *)self gamepadEventFields];
  v6 = [v5 debugDescription];
  char v7 = [v6 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v8 = +[NSString stringWithFormat:@"<%@ %p> {\n\t gamepadEventFields = %@\n}", v4, self, v7];

  return v8;
}

- (NSSet)gamepadEventFields
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  v34 = objc_opt_new();
  v45[0] = 0;
  id v5 = objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", @"GamepadEventFields", objc_opt_class(), v45);
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
  v42 = __Block_byref_object_copy__0;
  v43 = __Block_byref_object_dispose__0;
  id v44 = 0;
  v6 = objc_msgSend(objc_alloc((Class)&off_26BEEB428), "initWithCapacity:", objc_msgSend(v5, "count"));
  char v7 = objc_msgSend(objc_alloc((Class)&off_26BEEB428), "initWithCapacity:", objc_msgSend(v5, "count"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __95__GCGenericDeviceInputEventDriverModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke;
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
    [v34 setGamepadEventFields:v9];
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
    v20 = [v18 arrayByAddingObject:@"GamepadEventFields"];
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

  return v23;
}

void __95__GCGenericDeviceInputEventDriverModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke(uint64_t a1, void (**a2)(void, void, void), uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v10 + 40);
  uint64_t v11 = ((void (**)(void, uint64_t, id *))a2)[2](v8, v9, &obj);

  objc_storeStrong((id *)(v10 + 40), obj);
  if (!v11)
  {
    v62[0] = NSLocalizedFailureReasonErrorKey;
    v28 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) localizedFailureReason];
    v63[0] = v28;
    v62[1] = @"GCFailingKeyPathErrorKey";
    v29 = +[NSString stringWithFormat:@"[%zd]", a3];
    v61 = v29;
    v30 = +[NSArray arrayWithObjects:&v61 count:1];
    v63[1] = v30;
    v31 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
    uint64_t v32 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v31);
    uint64_t v33 = *(void *)(*(void *)(a1 + 48) + 8);
    v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;

    *a4 = 1;
    goto LABEL_9;
  }
  uint64_t v12 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v54 = 0;
  v13 = +[GCGenericDeviceInputGamepadEventFieldModel modelWithDictionaryRepresentation:v11 error:&v54];
  objc_storeStrong(v12, v54);
  if (!v13)
  {
    v59[0] = NSLocalizedDescriptionKey;
    uint64_t v35 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) localizedDescription];
    id v36 = &stru_26BED82A0;
    v53 = (void *)v35;
    if (v35) {
      id v36 = (__CFString *)v35;
    }
    v60[0] = v36;
    v59[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v37 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) localizedFailureReason];
    v52 = (void *)v37;
    if (!v37)
    {
      uint64_t v37 = +[NSString stringWithFormat:@"Error instantiating '%@' model.", objc_opt_class()];
    }
    v51 = (void *)v37;
    v60[1] = v37;
    v59[2] = NSUnderlyingErrorKey;
    v38 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v39 = v38;
    uint64_t v40 = (uint64_t)v38;
    if (!v38)
    {
      uint64_t v40 = +[NSNull null];
      uint64_t v39 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    v50 = (void *)v40;
    v60[2] = v40;
    v59[3] = @"GCFailingKeyPathErrorKey";
    uint64_t v41 = objc_msgSend(v39, "gc_failingKeyPath");
    v42 = (void *)v41;
    if (v41) {
      v43 = (void *)v41;
    }
    else {
      v43 = &__NSArray0__struct;
    }
    id v44 = +[NSString stringWithFormat:@"[%zd]", a3];
    v45 = [v43 arrayByAddingObject:v44];
    v60[3] = v45;
    v46 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:4];
    uint64_t v47 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v46);
    uint64_t v48 = *(void *)(*(void *)(a1 + 48) + 8);
    v49 = *(void **)(v48 + 40);
    *(void *)(v48 + 40) = v47;

    if (!v38) {
    if (!v52)
    }

    *a4 = 1;
    goto LABEL_8;
  }
  uint64_t v14 = [v13 extendedIndex];
  if (v14 < 0) {
    goto LABEL_7;
  }
  uint64_t v15 = v14;
  v16 = *(void **)(a1 + 32);
  uint64_t v17 = +[NSNumber numberWithInteger:v14];
  v18 = [v16 member:v17];

  if (!v18)
  {
    v26 = *(void **)(a1 + 32);
    v27 = +[NSNumber numberWithInteger:](&off_26BEEDE78, "numberWithInteger:", [v13 extendedIndex]);
    [v26 addObject:v27];

LABEL_7:
    [*(id *)(a1 + 40) addObject:v13];
    goto LABEL_8;
  }
  v57[0] = NSLocalizedFailureReasonErrorKey;
  v19 = +[NSString stringWithFormat:@"Duplicate definition of '%@' with ExtendedIndex '%zi'.", objc_opt_class(), v15];
  v58[0] = v19;
  v57[1] = @"GCFailingKeyPathErrorKey";
  v20 = +[NSString stringWithFormat:@"[%zd]", a3];
  v56 = v20;
  v21 = +[NSArray arrayWithObjects:&v56 count:1];
  v58[1] = v21;
  v22 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
  uint64_t v23 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v22);
  uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
  v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

  *a4 = 1;
LABEL_8:

LABEL_9:
}

@end