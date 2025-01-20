@interface GCGenericDevicePhysicalInputModel
+ (BOOL)supportsSecureCoding;
+ (GCGenericDevicePhysicalInputModel)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (GCGenericDevicePhysicalInputModel)init;
- (GCGenericDevicePhysicalInputModel)initWithCoder:(id)a3;
- (NSSet)elements;
- (id)redactedDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDevicePhysicalInputModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDevicePhysicalInputModel)init
{
  return 0;
}

- (GCGenericDevicePhysicalInputModel)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GCGenericDevicePhysicalInputModel;
  id v3 = a3;
  v4 = [(GCGenericDevicePhysicalInputModel *)&v10 init];
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v5, objc_opt_class(), 0, v10.receiver, v10.super_class);
  uint64_t v7 = [v3 decodeObjectOfClasses:v6 forKey:@"elements"];

  elements = v4->_elements;
  v4->_elements = (NSSet *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(GCGenericDevicePhysicalInputModel *)self elements];
  [v4 encodeObject:v5 forKey:@"elements"];
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
    if (([(GCGenericDevicePhysicalInputModel *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
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
      || !-[GCGenericDevicePhysicalInputModel isMemberOfClass:](self, "isMemberOfClass:", [(id)objc_opt_class() modelClass]))
    {
      goto LABEL_7;
    }
  }
  id v5 = [(GCGenericDevicePhysicalInputModel *)self elements];
  v6 = [v4 elements];
  char v7 = [v5 isEqual:v6];

LABEL_8:
  return v7;
}

+ (id)description
{
  return @"Physical Input";
}

- (id)redactedDescription
{
  id v3 = objc_opt_new();
  [v3 appendString:@"{\n"];
  [v3 appendString:@"\t elements = ["];
  id v4 = [(GCGenericDevicePhysicalInputModel *)self elements];
  id v5 = [v4 allObjects];
  v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_16];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) description];
        v13 = [v12 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
        [v3 appendFormat:@"\n\t %@,", v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [v3 appendString:@"\t]\n"];
  [v3 appendString:@"}"];

  return v3;
}

uint64_t __56__GCGenericDevicePhysicalInputModel_redactedDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 identifier];
  v6 = [v4 identifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSSet)elements
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

+ (GCGenericDevicePhysicalInputModel)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  v34 = objc_opt_new();
  v45[0] = 0;
  id v5 = objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", @"Elements", objc_opt_class(), v45);
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
  v42 = __Block_byref_object_copy__14;
  v43 = __Block_byref_object_dispose__14;
  id v44 = 0;
  v6 = objc_msgSend(objc_alloc((Class)&off_26BEEB428), "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v7 = objc_msgSend(objc_alloc((Class)&off_26BEEB428), "initWithCapacity:", objc_msgSend(v5, "count"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __92__GCGenericDevicePhysicalInputModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke;
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
    [v34 setElements:v9];
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
      long long v16 = (void *)v40[5];
      uint64_t v17 = (uint64_t)v16;
    }
    else
    {
      uint64_t v17 = +[NSNull null];
      long long v16 = (void *)v40[5];
    }
    v28 = (void *)v17;
    v47[2] = v17;
    v46[3] = @"GCFailingKeyPathErrorKey";
    long long v18 = objc_msgSend(v16, "gc_failingKeyPath");
    v19 = v18;
    if (!v18) {
      long long v18 = &__NSArray0__struct;
    }
    v20 = [v18 arrayByAddingObject:@"Elements"];
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

  return (GCGenericDevicePhysicalInputModel *)v23;
}

void __92__GCGenericDevicePhysicalInputModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v9 + 40);
  v56 = v7;
  uint64_t v10 = (*((void (**)(id, uint64_t, id *))v7 + 2))(v7, v8, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    uint64_t v11 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v61 = 0;
    uint64_t v12 = +[GCGenericDevicePhysicalInputElementModel modelWithDictionaryRepresentation:v10 error:&v61];
    objc_storeStrong(v11, v61);
    if (v12)
    {
      uint64_t v13 = a3;
      v54 = a4;
      [v12 names];
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 countByEnumeratingWithState:&v57 objects:v66 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v58;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v58 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v57 + 1) + 8 * i);
            v20 = [*(id *)(a1 + 32) member:v19];

            if (v20)
            {
              v64[0] = NSLocalizedFailureReasonErrorKey;
              v21 = +[NSString stringWithFormat:@"Duplicate definition of '%@' with name '%@'.", objc_opt_class(), v19];
              v65[0] = v21;
              v64[1] = @"GCFailingKeyPathErrorKey";
              v22 = +[NSString stringWithFormat:@"[%zd]", v13];
              v63 = v22;
              v23 = +[NSArray arrayWithObjects:&v63 count:1];
              v65[1] = v23;
              v24 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
              uint64_t v25 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v24);
              uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
              v27 = *(void **)(v26 + 40);
              *(void *)(v26 + 40) = v25;

              unsigned char *v54 = 1;
              goto LABEL_13;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v57 objects:v66 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      [*(id *)(a1 + 32) addObjectsFromArray:v14];
      [*(id *)(a1 + 40) addObject:v12];
LABEL_13:
    }
    else
    {
      v67[0] = NSLocalizedDescriptionKey;
      uint64_t v35 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) localizedDescription];
      id v36 = (void *)v35;
      id v37 = &stru_26BED82A0;
      if (v35) {
        id v37 = (__CFString *)v35;
      }
      v68[0] = v37;
      v67[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v38 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) localizedFailureReason];
      v55 = (void *)v38;
      if (!v38)
      {
        uint64_t v38 = +[NSString stringWithFormat:@"Error instantiating '%@' model.", objc_opt_class()];
      }
      uint64_t v39 = a4;
      v53 = (void *)v38;
      v68[1] = v38;
      v67[2] = NSUnderlyingErrorKey;
      v40 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v41 = v40;
      uint64_t v42 = (uint64_t)v40;
      if (!v40)
      {
        uint64_t v42 = +[NSNull null];
        uint64_t v41 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
      v52 = (void *)v42;
      v68[2] = v42;
      v67[3] = @"GCFailingKeyPathErrorKey";
      uint64_t v43 = objc_msgSend(v41, "gc_failingKeyPath");
      id v44 = (void *)v43;
      if (v43) {
        v45 = (void *)v43;
      }
      else {
        v45 = &__NSArray0__struct;
      }
      v46 = +[NSString stringWithFormat:@"[%zd]", a3];
      v47 = [v45 arrayByAddingObject:v46];
      v68[3] = v47;
      v48 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:4];
      uint64_t v49 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v48);
      uint64_t v50 = *(void *)(*(void *)(a1 + 48) + 8);
      v51 = *(void **)(v50 + 40);
      *(void *)(v50 + 40) = v49;

      if (!v40) {
      if (!v55)
      }

      *uint64_t v39 = 1;
    }
  }
  else
  {
    v70[0] = NSLocalizedFailureReasonErrorKey;
    v28 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) localizedFailureReason];
    v71[0] = v28;
    v70[1] = @"GCFailingKeyPathErrorKey";
    v29 = +[NSString stringWithFormat:@"[%zd]", a3];
    v69 = v29;
    v30 = +[NSArray arrayWithObjects:&v69 count:1];
    v71[1] = v30;
    v31 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
    uint64_t v32 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v31);
    uint64_t v33 = *(void *)(*(void *)(a1 + 48) + 8);
    v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;

    *a4 = 1;
  }
}

@end