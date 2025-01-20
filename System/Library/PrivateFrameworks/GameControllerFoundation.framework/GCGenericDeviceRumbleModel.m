@interface GCGenericDeviceRumbleModel
+ (BOOL)supportsSecureCoding;
+ (GCGenericDeviceRumbleModel)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceRumbleModel)init;
- (GCGenericDeviceRumbleModel)initWithCoder:(id)a3;
- (NSArray)actuators;
- (NSArray)nodes;
- (NSArray)outputs;
- (float)dispatchFrequency;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceRumbleModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceRumbleModel)init
{
  return 0;
}

- (GCGenericDeviceRumbleModel)initWithCoder:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)GCGenericDeviceRumbleModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceRumbleModel *)&v19 init];
  [v3 decodeFloatForKey:@"dispatchFrequency"];
  v4->_dispatchFrequency = v5;
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v6 = +[NSArray arrayWithObjects:v22 count:2];
  v7 = +[NSSet setWithArray:v6];
  uint64_t v8 = [v3 decodeObjectOfClasses:v7 forKey:@"actuators"];
  actuators = v4->_actuators;
  v4->_actuators = (NSArray *)v8;

  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  v21[3] = objc_opt_class();
  v10 = +[NSArray arrayWithObjects:v21 count:4];
  v11 = +[NSSet setWithArray:v10];
  uint64_t v12 = [v3 decodeObjectOfClasses:v11 forKey:@"nodes"];
  nodes = v4->_nodes;
  v4->_nodes = (NSArray *)v12;

  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v14 = +[NSArray arrayWithObjects:v20 count:2];
  v15 = +[NSSet setWithArray:v14];
  uint64_t v16 = [v3 decodeObjectOfClasses:v15 forKey:@"outputs"];

  outputs = v4->_outputs;
  v4->_outputs = (NSArray *)v16;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(GCGenericDeviceRumbleModel *)self dispatchFrequency];
  objc_msgSend(v4, "encodeFloat:forKey:", @"dispatchFrequency");
  float v5 = [(GCGenericDeviceRumbleModel *)self actuators];
  [v4 encodeObject:v5 forKey:@"actuators"];

  v6 = [(GCGenericDeviceRumbleModel *)self nodes];
  [v4 encodeObject:v6 forKey:@"nodes"];

  id v7 = [(GCGenericDeviceRumbleModel *)self outputs];
  [v4 encodeObject:v7 forKey:@"outputs"];
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
    if (([(GCGenericDeviceRumbleModel *)self isMemberOfClass:objc_opt_class()] & 1) == 0) {
      goto LABEL_10;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceRumbleModel isMemberOfClass:](self, "isMemberOfClass:", [(id)objc_opt_class() modelClass]))
    {
      goto LABEL_10;
    }
  }
  [(GCGenericDeviceRumbleModel *)self dispatchFrequency];
  float v6 = v5;
  [v4 dispatchFrequency];
  if (v6 != v7)
  {
LABEL_10:
    char v14 = 0;
    goto LABEL_15;
  }
  uint64_t v8 = [(GCGenericDeviceRumbleModel *)self actuators];
  v9 = [v4 actuators];
  if ([v8 isEqual:v9])
  {
    v10 = [(GCGenericDeviceRumbleModel *)self nodes];
    v11 = [v4 nodes];
    if ([v10 isEqual:v11])
    {
      uint64_t v12 = [(GCGenericDeviceRumbleModel *)self outputs];
      v13 = [v4 outputs];
      char v14 = [v12 isEqual:v13];
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

LABEL_15:
  return v14;
}

+ (id)description
{
  return @"Rumble";
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  [(GCGenericDeviceRumbleModel *)self dispatchFrequency];
  double v6 = v5;
  float v7 = [(GCGenericDeviceRumbleModel *)self actuators];
  uint64_t v8 = [v7 debugDescription];
  v9 = [v8 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v10 = [(GCGenericDeviceRumbleModel *)self nodes];
  v11 = [(GCGenericDeviceRumbleModel *)self outputs];
  uint64_t v12 = [v11 debugDescription];
  v13 = [v12 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  char v14 = +[NSString stringWithFormat:@"<%@ %p> {\n\t dispatchFrequency = %f\n\t actuators = %@\n\t nodes = %@\n\t outputs = %@\n}", v4, self, *(void *)&v6, v9, v10, v13];

  return v14;
}

- (float)dispatchFrequency
{
  return self->_dispatchFrequency;
}

- (NSArray)actuators
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)nodes
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)outputs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_nodes, 0);

  objc_storeStrong((id *)&self->_actuators, 0);
}

+ (GCGenericDeviceRumbleModel)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  v78 = objc_opt_new();
  v98[0] = 0;
  id v75 = a3;
  float v5 = objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", @"DispatchFrequency", objc_opt_class(), v98);
  id v6 = v98[0];
  if (!v5)
  {
    if (a4)
    {
      v111[0] = NSLocalizedDescriptionKey;
      v55 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v112[0] = v55;
      v111[1] = NSLocalizedFailureReasonErrorKey;
      v56 = [v6 localizedFailureReason];
      v112[1] = v56;
      v57 = +[NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v57);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v53 = 0;
    v52 = v6;
    goto LABEL_57;
  }
  [v5 floatValue];
  objc_msgSend(v78, "setDispatchFrequency:");

  id v97 = 0;
  float v7 = objc_msgSend(v75, "gc_requiredObjectForKey:ofClass:error:", @"Actuators", objc_opt_class(), &v97);
  id v77 = v97;
  if (!v7)
  {
    if (a4)
    {
      v109[0] = NSLocalizedDescriptionKey;
      v58 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v110[0] = v58;
      v109[1] = NSLocalizedFailureReasonErrorKey;
      v59 = [v77 localizedFailureReason];
      v110[1] = v59;
      v60 = +[NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v60);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_71;
  }
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x3032000000;
  v94 = __Block_byref_object_copy__15;
  v95 = __Block_byref_object_dispose__15;
  id v96 = 0;
  uint64_t v8 = objc_msgSend(objc_alloc((Class)&off_26BEEB428), "initWithCapacity:", objc_msgSend(v7, "count"));
  v9 = objc_msgSend(objc_alloc((Class)&off_26BEEB1B8), "initWithCapacity:", objc_msgSend(v7, "count"));
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = __85__GCGenericDeviceRumbleModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke;
  v87[3] = &unk_26BEC3B60;
  v90 = &v91;
  id v10 = v8;
  id v88 = v10;
  id v11 = v9;
  id v89 = v11;
  objc_msgSend(v7, "gc_enumerateObjectsUsingBlock:", v87);
  uint64_t v12 = [v11 count];
  uint64_t v13 = [v7 count];
  if (v12 == v13)
  {
    [v78 setActuators:v11];
  }
  else if (a4)
  {
    v107[0] = NSLocalizedDescriptionKey;
    v71 = [(id)v92[5] localizedDescription];
    if ([v71 length]) {
      [(id)v92[5] localizedDescription];
    }
    else {
    v68 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
    }
    v108[0] = v68;
    v107[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v14 = [(id)v92[5] localizedFailureReason];
    v15 = (void *)v14;
    uint64_t v16 = &stru_26BED82A0;
    if (v14) {
      uint64_t v16 = (__CFString *)v14;
    }
    v108[1] = v16;
    v107[2] = NSUnderlyingErrorKey;
    uint64_t v17 = v92[5];
    if (v17)
    {
      v18 = (void *)v92[5];
      uint64_t v19 = (uint64_t)v18;
    }
    else
    {
      uint64_t v19 = +[NSNull null];
      v18 = (void *)v92[5];
    }
    v67 = (void *)v19;
    v108[2] = v19;
    v107[3] = @"GCFailingKeyPathErrorKey";
    v20 = objc_msgSend(v18, "gc_failingKeyPath");
    v21 = v20;
    if (!v20) {
      v20 = &__NSArray0__struct;
    }
    v22 = [v20 arrayByAddingObject:@"Actuators"];
    v108[3] = v22;
    v23 = +[NSDictionary dictionaryWithObjects:v108 forKeys:v107 count:4];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v23);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v17) {
  }
    }

  _Block_object_dispose(&v91, 8);
  if (v12 != v13) {
    goto LABEL_58;
  }
  id v86 = 0;
  v24 = objc_msgSend(v75, "gc_requiredObjectForKey:ofClass:error:", @"Nodes", objc_opt_class(), &v86);
  id v77 = v86;
  if (!v24)
  {
    if (a4)
    {
      v105[0] = NSLocalizedDescriptionKey;
      v61 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v106[0] = v61;
      v105[1] = NSLocalizedFailureReasonErrorKey;
      v62 = [v77 localizedFailureReason];
      v106[1] = v62;
      v63 = +[NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v63);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_71;
  }
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x3032000000;
  v94 = __Block_byref_object_copy__15;
  v95 = __Block_byref_object_dispose__15;
  id v96 = 0;
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = __85__GCGenericDeviceRumbleModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke_2;
  v83[3] = &unk_26BEC4CD8;
  v85 = &v91;
  id v25 = (id)objc_msgSend(objc_alloc((Class)&off_26BEEB1B8), "initWithCapacity:", objc_msgSend(v24, "count"));
  id v84 = v25;
  objc_msgSend(v24, "gc_enumerateObjectsUsingBlock:", v83);
  uint64_t v26 = [v25 count];
  uint64_t v27 = [v24 count];
  if (v26 == v27)
  {
    [v78 setNodes:v25];
  }
  else if (a4)
  {
    v103[0] = NSLocalizedDescriptionKey;
    v72 = [(id)v92[5] localizedDescription];
    if ([v72 length]) {
      [(id)v92[5] localizedDescription];
    }
    else {
    v69 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
    }
    v104[0] = v69;
    v103[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v28 = [(id)v92[5] localizedFailureReason];
    v29 = (void *)v28;
    v30 = &stru_26BED82A0;
    if (v28) {
      v30 = (__CFString *)v28;
    }
    v104[1] = v30;
    v103[2] = NSUnderlyingErrorKey;
    uint64_t v31 = v92[5];
    if (v31)
    {
      v32 = (void *)v92[5];
      v33 = v32;
    }
    else
    {
      v33 = +[NSNull null];
      v32 = (void *)v92[5];
    }
    v104[2] = v33;
    v103[3] = @"GCFailingKeyPathErrorKey";
    v34 = objc_msgSend(v32, "gc_failingKeyPath");
    v35 = v34;
    if (!v34) {
      v34 = &__NSArray0__struct;
    }
    v36 = [v34 arrayByAddingObject:@"Nodes"];
    v104[3] = v36;
    v37 = +[NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:4];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v37);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v31) {
  }
    }

  _Block_object_dispose(&v91, 8);
  if (v26 != v27) {
    goto LABEL_58;
  }
  id v82 = 0;
  v38 = objc_msgSend(v75, "gc_requiredObjectForKey:ofClass:error:", @"Outputs", objc_opt_class(), &v82);
  id v77 = v82;
  if (!v38)
  {
    if (a4)
    {
      v101[0] = NSLocalizedDescriptionKey;
      v64 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v102[0] = v64;
      v101[1] = NSLocalizedFailureReasonErrorKey;
      v65 = [v77 localizedFailureReason];
      v102[1] = v65;
      v66 = +[NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v66);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_71:
    v53 = 0;
    v52 = v77;
    goto LABEL_57;
  }
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x3032000000;
  v94 = __Block_byref_object_copy__15;
  v95 = __Block_byref_object_dispose__15;
  id v96 = 0;
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = __85__GCGenericDeviceRumbleModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke_3;
  v79[3] = &unk_26BEC4CD8;
  v81 = &v91;
  id v39 = (id)objc_msgSend(objc_alloc((Class)&off_26BEEB1B8), "initWithCapacity:", objc_msgSend(v38, "count"));
  id v80 = v39;
  objc_msgSend(v38, "gc_enumerateObjectsUsingBlock:", v79);
  uint64_t v40 = [v39 count];
  uint64_t v41 = [v38 count];
  if (v40 == v41)
  {
    [v78 setOutputs:v39];
  }
  else if (a4)
  {
    v99[0] = NSLocalizedDescriptionKey;
    v76 = [(id)v92[5] localizedDescription];
    if ([v76 length]) {
      [(id)v92[5] localizedDescription];
    }
    else {
    v70 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
    }
    v100[0] = v70;
    v99[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v42 = [(id)v92[5] localizedFailureReason];
    v43 = (void *)v42;
    v44 = &stru_26BED82A0;
    if (v42) {
      v44 = (__CFString *)v42;
    }
    v100[1] = v44;
    v99[2] = NSUnderlyingErrorKey;
    uint64_t v45 = v92[5];
    if (v45)
    {
      v46 = (void *)v92[5];
      v47 = v46;
    }
    else
    {
      v47 = +[NSNull null];
      v46 = (void *)v92[5];
    }
    v100[2] = v47;
    v99[3] = @"GCFailingKeyPathErrorKey";
    v48 = objc_msgSend(v46, "gc_failingKeyPath");
    v49 = v48;
    if (!v48) {
      v48 = &__NSArray0__struct;
    }
    v50 = [v48 arrayByAddingObject:@"Outputs"];
    v100[3] = v50;
    v51 = +[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:4];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v51);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v45) {
  }
    }

  _Block_object_dispose(&v91, 8);
  if (v40 == v41)
  {
    v52 = v78;
    v53 = [v78 build];
    v78 = 0;
LABEL_57:

    goto LABEL_59;
  }
LABEL_58:
  v53 = 0;
LABEL_59:

  return (GCGenericDeviceRumbleModel *)v53;
}

void __85__GCGenericDeviceRumbleModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke(uint64_t a1, void (**a2)(void, void, void), uint64_t a3, unsigned char *a4)
{
  uint64_t v8 = a2;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v10 + 40);
  id v11 = ((void (**)(void, uint64_t, id *))a2)[2](v8, v9, &obj);

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    uint64_t v12 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v54 = 0;
    uint64_t v13 = +[GCGenericDeviceRumbleActuatorModel modelWithDictionaryRepresentation:v11 error:&v54];
    objc_storeStrong(v12, v54);
    if (v13)
    {
      uint64_t v14 = *(void **)(a1 + 32);
      v15 = [v13 name];
      uint64_t v16 = [v14 member:v15];

      if (v16)
      {
        v57[0] = NSLocalizedFailureReasonErrorKey;
        uint64_t v17 = objc_opt_class();
        v18 = [v13 name];
        uint64_t v19 = +[NSString stringWithFormat:@"Duplicate definition of '%@' with name '%@'.", v17, v18];
        v58[0] = v19;
        v57[1] = @"GCFailingKeyPathErrorKey";
        v20 = +[NSString stringWithFormat:@"[%zd]", a3];
        v56 = v20;
        v21 = +[NSArray arrayWithObjects:&v56 count:1];
        v58[1] = v21;
        v22 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
        uint64_t v23 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v22);
        uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
        id v25 = *(void **)(v24 + 40);
        *(void *)(v24 + 40) = v23;

        *a4 = 1;
      }
      else
      {
        [*(id *)(a1 + 40) addObject:v13];
        uint64_t v26 = *(void **)(a1 + 32);
        uint64_t v27 = [v13 name];
        [v26 addObject:v27];
      }
    }
    else
    {
      v59[0] = NSLocalizedDescriptionKey;
      uint64_t v35 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) localizedDescription];
      v36 = &stru_26BED82A0;
      v53 = (void *)v35;
      if (v35) {
        v36 = (__CFString *)v35;
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
      id v39 = v38;
      uint64_t v40 = (uint64_t)v38;
      if (!v38)
      {
        uint64_t v40 = +[NSNull null];
        id v39 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
      v50 = (void *)v40;
      v60[2] = v40;
      v59[3] = @"GCFailingKeyPathErrorKey";
      uint64_t v41 = objc_msgSend(v39, "gc_failingKeyPath");
      uint64_t v42 = (void *)v41;
      if (v41) {
        v43 = (void *)v41;
      }
      else {
        v43 = &__NSArray0__struct;
      }
      v44 = +[NSString stringWithFormat:@"[%zd]", a3];
      uint64_t v45 = [v43 arrayByAddingObject:v44];
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
    }
  }
  else
  {
    v62[0] = NSLocalizedFailureReasonErrorKey;
    uint64_t v28 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) localizedFailureReason];
    v63[0] = v28;
    v62[1] = @"GCFailingKeyPathErrorKey";
    v29 = +[NSString stringWithFormat:@"[%zd]", a3];
    v61 = v29;
    v30 = +[NSArray arrayWithObjects:&v61 count:1];
    v63[1] = v30;
    uint64_t v31 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
    uint64_t v32 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v31);
    uint64_t v33 = *(void *)(*(void *)(a1 + 48) + 8);
    v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;

    *a4 = 1;
  }
}

void __85__GCGenericDeviceRumbleModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke_2(uint64_t a1, void (**a2)(void, void, void), uint64_t a3, unsigned char *a4)
{
  uint64_t v8 = a2;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v10 + 40);
  id v11 = ((void (**)(void, uint64_t, id *))a2)[2](v8, v9, &obj);

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    [*(id *)(a1 + 32) addObject:v11];
  }
  else
  {
    v21[0] = NSLocalizedFailureReasonErrorKey;
    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) localizedFailureReason];
    v22[0] = v12;
    v21[1] = @"GCFailingKeyPathErrorKey";
    uint64_t v13 = +[NSString stringWithFormat:@"[%zd]", a3];
    v20 = v13;
    uint64_t v14 = +[NSArray arrayWithObjects:&v20 count:1];
    v22[1] = v14;
    v15 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    uint64_t v16 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v15);
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    *a4 = 1;
  }
}

void __85__GCGenericDeviceRumbleModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke_3(uint64_t a1, void (**a2)(void, void, void), uint64_t a3, unsigned char *a4)
{
  uint64_t v8 = a2;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v10 + 40);
  id v11 = ((void (**)(void, uint64_t, id *))a2)[2](v8, v9, &obj);

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    uint64_t v12 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v40 = 0;
    uint64_t v13 = +[GCGenericDeviceRumbleOutputModel modelWithDictionaryRepresentation:v11 error:&v40];
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
      id v39 = (void *)v21;
      if (v21) {
        v22 = (__CFString *)v21;
      }
      v43[0] = v22;
      v42[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v23 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) localizedFailureReason];
      v38 = (void *)v23;
      if (!v23)
      {
        uint64_t v23 = +[NSString stringWithFormat:@"Error instantiating '%@' model.", objc_opt_class()];
      }
      uint64_t v37 = (void *)v23;
      v43[1] = v23;
      v42[2] = NSUnderlyingErrorKey;
      uint64_t v24 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v25 = v24;
      uint64_t v26 = (uint64_t)v24;
      if (!v24)
      {
        uint64_t v26 = +[NSNull null];
        id v25 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      }
      v36 = (void *)v26;
      v43[2] = v26;
      v42[3] = @"GCFailingKeyPathErrorKey";
      uint64_t v27 = objc_msgSend(v25, "gc_failingKeyPath");
      uint64_t v28 = (void *)v27;
      if (v27) {
        v29 = (void *)v27;
      }
      else {
        v29 = &__NSArray0__struct;
      }
      v30 = +[NSString stringWithFormat:@"[%zd]", a3];
      uint64_t v31 = [v29 arrayByAddingObject:v30];
      v43[3] = v31;
      uint64_t v32 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:4];
      uint64_t v33 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v32);
      uint64_t v34 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v35 = *(void **)(v34 + 40);
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
    v44 = v15;
    uint64_t v16 = +[NSArray arrayWithObjects:&v44 count:1];
    v46[1] = v16;
    uint64_t v17 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
    uint64_t v18 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v17);
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    *a4 = 1;
  }
}

@end