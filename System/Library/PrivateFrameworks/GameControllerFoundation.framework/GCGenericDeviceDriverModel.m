@interface GCGenericDeviceDriverModel
+ (BOOL)supportsSecureCoding;
+ (GCGenericDeviceDriverModel)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDriverModel)init;
- (GCGenericDeviceDriverModel)initWithCoder:(id)a3;
- (GCGenericDeviceDriverPropertiesModel)properties;
- (GCGenericDeviceInputEventDriverModel)input;
- (GCGenericDeviceRumbleModel)rumble;
- (NSSet)elements;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceDriverModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDriverModel)init
{
  return 0;
}

- (GCGenericDeviceDriverModel)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)GCGenericDeviceDriverModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceDriverModel *)&v16 init];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v5 = +[NSArray arrayWithObjects:v17 count:2];
  v6 = +[NSSet setWithArray:v5];
  uint64_t v7 = [v3 decodeObjectOfClasses:v6 forKey:@"elements"];
  elements = v4->_elements;
  v4->_elements = (NSSet *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"properties"];
  properties = v4->_properties;
  v4->_properties = (GCGenericDeviceDriverPropertiesModel *)v9;

  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"input"];
  input = v4->_input;
  v4->_input = (GCGenericDeviceInputEventDriverModel *)v11;

  uint64_t v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"rumble"];

  rumble = v4->_rumble;
  v4->_rumble = (GCGenericDeviceRumbleModel *)v13;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(GCGenericDeviceDriverModel *)self elements];
  [v4 encodeObject:v5 forKey:@"elements"];

  v6 = [(GCGenericDeviceDriverModel *)self properties];
  [v4 encodeObject:v6 forKey:@"properties"];

  uint64_t v7 = [(GCGenericDeviceDriverModel *)self input];
  [v4 encodeObject:v7 forKey:@"input"];

  id v8 = [(GCGenericDeviceDriverModel *)self rumble];
  [v4 encodeObject:v8 forKey:@"rumble"];
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
      || !-[GCGenericDeviceDriverModel isMemberOfClass:](self, "isMemberOfClass:", [(id)objc_opt_class() modelClass]))
    {
      goto LABEL_10;
    }
LABEL_6:
    v6 = [(GCGenericDeviceDriverModel *)self elements];
    uint64_t v7 = [v5 elements];
    if (![v6 isEqual:v7])
    {
      char v11 = 0;
LABEL_26:

      goto LABEL_27;
    }
    id v8 = [(GCGenericDeviceDriverModel *)self properties];
    uint64_t v9 = [v5 properties];
    if (v8 != v9)
    {
      id v3 = [(GCGenericDeviceDriverModel *)self properties];
      v10 = [v5 properties];
      if (![v3 isEqual:v10])
      {
        char v11 = 0;
        goto LABEL_24;
      }
      v27 = v10;
    }
    v12 = [(GCGenericDeviceDriverModel *)self input];
    uint64_t v13 = [v5 input];
    if (v12 == v13)
    {
      v25 = v12;
    }
    else
    {
      v14 = [(GCGenericDeviceDriverModel *)self input];
      v26 = [v5 input];
      if (!objc_msgSend(v14, "isEqual:"))
      {
        char v11 = 0;
        goto LABEL_22;
      }
      v24 = v14;
      v25 = v12;
    }
    v15 = [(GCGenericDeviceDriverModel *)self rumble];
    uint64_t v16 = [v5 rumble];
    if (v15 == (void *)v16)
    {

      char v11 = 1;
    }
    else
    {
      v17 = (void *)v16;
      [(GCGenericDeviceDriverModel *)self rumble];
      v18 = v23 = v8;
      [v5 rumble];
      v22 = v3;
      v20 = v19 = v9;
      char v11 = [v18 isEqual:v20];

      uint64_t v9 = v19;
      id v3 = v22;

      id v8 = v23;
    }
    v14 = v24;
    v12 = v25;
    if (v25 == v13)
    {
LABEL_23:

      v10 = v27;
      if (v8 == v9)
      {
LABEL_25:

        goto LABEL_26;
      }
LABEL_24:

      goto LABEL_25;
    }
LABEL_22:

    goto LABEL_23;
  }
  if ([(GCGenericDeviceDriverModel *)self isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
LABEL_10:
  char v11 = 0;
LABEL_27:

  return v11;
}

+ (id)description
{
  return @"Driver";
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v3);
  v18 = [(GCGenericDeviceDriverModel *)self elements];
  v17 = [v18 debugDescription];
  id v4 = [v17 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  uint64_t v16 = [(GCGenericDeviceDriverModel *)self properties];
  v15 = [v16 debugDescription];
  id v5 = [v15 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v6 = [(GCGenericDeviceDriverModel *)self input];
  uint64_t v7 = [v6 debugDescription];
  id v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  uint64_t v9 = [(GCGenericDeviceDriverModel *)self rumble];
  v10 = [v9 debugDescription];
  char v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v12 = +[NSString stringWithFormat:@"<%@ %p> {\n\t elements = %@\n\t properties = %@\n\t input = %@\n\t rumble = %@\n}", v14, self, v4, v5, v8, v11];

  return v12;
}

- (NSSet)elements
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (GCGenericDeviceDriverPropertiesModel)properties
{
  return (GCGenericDeviceDriverPropertiesModel *)objc_getProperty(self, a2, 16, 1);
}

- (GCGenericDeviceInputEventDriverModel)input
{
  return (GCGenericDeviceInputEventDriverModel *)objc_getProperty(self, a2, 24, 1);
}

- (GCGenericDeviceRumbleModel)rumble
{
  return (GCGenericDeviceRumbleModel *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rumble, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_elements, 0);
}

+ (GCGenericDeviceDriverModel)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  v81 = objc_opt_new();
  v98[0] = 0;
  id v80 = a3;
  id v5 = objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", @"Elements", objc_opt_class(), v98);
  id v76 = v98[0];
  if (!v5)
  {
    if (a4)
    {
      v113[0] = NSLocalizedDescriptionKey;
      v38 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v114[0] = v38;
      v113[1] = NSLocalizedFailureReasonErrorKey;
      v39 = [v76 localizedFailureReason];
      v114[1] = v39;
      v40 = +[NSDictionary dictionaryWithObjects:v114 forKeys:v113 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v40);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v27 = 0;
    v36 = v76;
    goto LABEL_39;
  }
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x3032000000;
  v95 = __Block_byref_object_copy__12;
  v96 = __Block_byref_object_dispose__12;
  id v97 = 0;
  v6 = objc_msgSend(objc_alloc((Class)&off_26BEEB428), "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v7 = objc_msgSend(objc_alloc((Class)&off_26BEEB428), "initWithCapacity:", objc_msgSend(v5, "count"));
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = __85__GCGenericDeviceDriverModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke;
  v88[3] = &unk_26BEC3B60;
  v91 = &v92;
  id v8 = v6;
  id v89 = v8;
  id v9 = v7;
  id v90 = v9;
  objc_msgSend(v5, "gc_enumerateObjectsUsingBlock:", v88);
  uint64_t v10 = [v9 count];
  uint64_t v11 = [v5 count];
  if (v10 == v11)
  {
    [v81 setElements:v9];
  }
  else if (a4)
  {
    v111[0] = NSLocalizedDescriptionKey;
    v73 = [(id)v93[5] localizedDescription];
    if ([v73 length]) {
      [(id)v93[5] localizedDescription];
    }
    else {
    v72 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
    }
    v112[0] = v72;
    v111[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v12 = [(id)v93[5] localizedFailureReason];
    uint64_t v13 = (void *)v12;
    v14 = &stru_26BED82A0;
    if (v12) {
      v14 = (__CFString *)v12;
    }
    v112[1] = v14;
    v111[2] = NSUnderlyingErrorKey;
    uint64_t v15 = v93[5];
    if (v15)
    {
      uint64_t v16 = (void *)v93[5];
      uint64_t v17 = (uint64_t)v16;
    }
    else
    {
      uint64_t v17 = +[NSNull null];
      uint64_t v16 = (void *)v93[5];
    }
    v71 = (void *)v17;
    v112[2] = v17;
    v111[3] = @"GCFailingKeyPathErrorKey";
    v18 = objc_msgSend(v16, "gc_failingKeyPath");
    v19 = v18;
    if (!v18) {
      v18 = &__NSArray0__struct;
    }
    v20 = [v18 arrayByAddingObject:@"Elements"];
    v112[3] = v20;
    v21 = +[NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:4];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v15) {
  }
    }

  _Block_object_dispose(&v92, 8);
  if (v10 != v11)
  {
    v27 = 0;
    goto LABEL_40;
  }
  id v87 = 0;
  v22 = objc_msgSend(v80, "gc_objectForKey:ofClass:error:", @"Properties", objc_opt_class(), &v87);
  id v23 = v87;
  v24 = v23;
  if (!v22 && v23)
  {
    if (!a4)
    {
      id v26 = v23;
      goto LABEL_101;
    }
    v109[0] = NSLocalizedDescriptionKey;
    v41 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
    v110[0] = v41;
    v109[1] = NSLocalizedFailureReasonErrorKey;
    v42 = [v24 localizedFailureReason];
    v110[1] = v42;
    v43 = +[NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:2];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v43);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    id v26 = v24;
    goto LABEL_48;
  }
  if (!v22)
  {
    id v26 = v23;
    goto LABEL_26;
  }
  id v86 = 0;
  v25 = +[GCGenericDeviceDriverPropertiesModel modelWithDictionaryRepresentation:v22 error:&v86];
  id v26 = v86;

  if (!v25)
  {
    if (!a4)
    {
LABEL_101:

LABEL_106:
      v27 = 0;
      v36 = v26;
      goto LABEL_39;
    }
    v107[0] = NSLocalizedDescriptionKey;
    v41 = [v26 localizedDescription];
    v42 = v41;
    if (!v41)
    {
      v42 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
    }
    v108[0] = v42;
    v107[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v50 = [v26 localizedFailureReason];
    v51 = (void *)v50;
    if (!v50)
    {
      uint64_t v50 = +[NSString stringWithFormat:@"Error instantiating '%@' model for key '%@'.", objc_opt_class(), @"Input"];
    }
    v77 = (void *)v50;
    v108[1] = v50;
    v107[2] = NSUnderlyingErrorKey;
    v52 = v26;
    if (!v26)
    {
      v52 = +[NSNull null];
    }
    v108[2] = v52;
    v107[3] = @"GCFailingKeyPathErrorKey";
    v53 = objc_msgSend(v26, "gc_failingKeyPath");
    v54 = v53;
    if (!v53) {
      v53 = &__NSArray0__struct;
    }
    v55 = [v53 arrayByAddingObject:@"Properties"];
    v108[3] = v55;
    v56 = +[NSDictionary dictionaryWithObjects:v108 forKeys:v107 count:4];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v56);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v26) {
    if (!v51)
    }

    if (v41)
    {
LABEL_69:

      goto LABEL_101;
    }
LABEL_48:

    goto LABEL_69;
  }
  [v81 setProperties:v25];

LABEL_26:
  id v85 = 0;
  v28 = objc_msgSend(v80, "gc_objectForKey:ofClass:error:", @"Input", objc_opt_class(), &v85);
  id v29 = v85;
  v30 = v29;
  if (!v28 && v29)
  {
    if (!a4)
    {
      id v26 = v29;
      goto LABEL_103;
    }
    v105[0] = NSLocalizedDescriptionKey;
    v44 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
    v106[0] = v44;
    v105[1] = NSLocalizedFailureReasonErrorKey;
    v45 = [v30 localizedFailureReason];
    v106[1] = v45;
    v46 = +[NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:2];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v46);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    id v26 = v30;
    goto LABEL_51;
  }
  if (!v28)
  {
    id v26 = v29;
    goto LABEL_32;
  }
  id v84 = 0;
  v31 = +[GCGenericDeviceInputEventDriverModel modelWithDictionaryRepresentation:v28 error:&v84];
  id v26 = v84;

  if (!v31)
  {
    if (!a4)
    {
LABEL_103:

      goto LABEL_106;
    }
    v103[0] = NSLocalizedDescriptionKey;
    v44 = [v26 localizedDescription];
    v45 = v44;
    if (!v44)
    {
      v45 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
    }
    v104[0] = v45;
    v103[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v57 = [v26 localizedFailureReason];
    v58 = (void *)v57;
    if (!v57)
    {
      uint64_t v57 = +[NSString stringWithFormat:@"Error instantiating '%@' model for key '%@'.", objc_opt_class(), @"Input"];
    }
    v78 = (void *)v57;
    v104[1] = v57;
    v103[2] = NSUnderlyingErrorKey;
    v59 = v26;
    if (!v26)
    {
      v59 = +[NSNull null];
    }
    v104[2] = v59;
    v103[3] = @"GCFailingKeyPathErrorKey";
    v60 = objc_msgSend(v26, "gc_failingKeyPath");
    v61 = v60;
    if (!v60) {
      v60 = &__NSArray0__struct;
    }
    v62 = [v60 arrayByAddingObject:@"Input"];
    v104[3] = v62;
    v63 = +[NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:4];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v63);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v26) {
    if (!v58)
    }

    if (v44)
    {
LABEL_84:

      goto LABEL_103;
    }
LABEL_51:

    goto LABEL_84;
  }
  [v81 setInput:v31];

LABEL_32:
  id v83 = 0;
  v32 = objc_msgSend(v80, "gc_objectForKey:ofClass:error:", @"Rumble", objc_opt_class(), &v83);
  id v33 = v83;
  v34 = v33;
  if (!v32 && v33)
  {
    if (!a4)
    {
      id v26 = v33;
      goto LABEL_105;
    }
    v101[0] = NSLocalizedDescriptionKey;
    v47 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
    v102[0] = v47;
    v101[1] = NSLocalizedFailureReasonErrorKey;
    v48 = [v34 localizedFailureReason];
    v102[1] = v48;
    v49 = +[NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:2];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v49);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    id v26 = v34;
    goto LABEL_54;
  }
  if (!v32)
  {
    id v26 = v33;
    goto LABEL_38;
  }
  id v82 = 0;
  v35 = +[GCGenericDeviceRumbleModel modelWithDictionaryRepresentation:v32 error:&v82];
  id v26 = v82;

  if (!v35)
  {
    if (!a4)
    {
LABEL_105:

      goto LABEL_106;
    }
    v99[0] = NSLocalizedDescriptionKey;
    v47 = [v26 localizedDescription];
    v48 = v47;
    if (!v47)
    {
      v48 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
    }
    v100[0] = v48;
    v99[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v64 = [v26 localizedFailureReason];
    v65 = (void *)v64;
    if (!v64)
    {
      uint64_t v64 = +[NSString stringWithFormat:@"Error instantiating '%@' model for key '%@'.", objc_opt_class(), @"Input"];
    }
    v79 = (void *)v64;
    v100[1] = v64;
    v99[2] = NSUnderlyingErrorKey;
    v66 = v26;
    if (!v26)
    {
      v66 = +[NSNull null];
    }
    v100[2] = v66;
    v99[3] = @"GCFailingKeyPathErrorKey";
    v67 = objc_msgSend(v26, "gc_failingKeyPath");
    v68 = v67;
    if (!v67) {
      v67 = &__NSArray0__struct;
    }
    v69 = [v67 arrayByAddingObject:@"Input"];
    v100[3] = v69;
    v70 = +[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:4];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v70);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v26) {
    if (!v65)
    }

    if (v47)
    {
LABEL_99:

      goto LABEL_105;
    }
LABEL_54:

    goto LABEL_99;
  }
  [v81 setRumble:v35];

LABEL_38:
  v36 = v81;
  v27 = [v81 build];
  v81 = 0;
LABEL_39:

LABEL_40:

  return (GCGenericDeviceDriverModel *)v27;
}

void __85__GCGenericDeviceDriverModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke(uint64_t a1, void (**a2)(void, void, void), uint64_t a3, unsigned char *a4)
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
    id v54 = 0;
    uint64_t v13 = +[GCGenericDeviceElementModel modelWithDictionaryRepresentation:v11 error:&v54];
    objc_storeStrong(v12, v54);
    if (v13)
    {
      v14 = *(void **)(a1 + 32);
      uint64_t v15 = [v13 identifier];
      uint64_t v16 = [v14 member:v15];

      if (v16)
      {
        v57[0] = NSLocalizedFailureReasonErrorKey;
        uint64_t v17 = objc_opt_class();
        v18 = [v13 identifier];
        v19 = +[NSString stringWithFormat:@"Duplicate definition of '%@' with identifier '%@'.", v17, v18];
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
      }
      else
      {
        [*(id *)(a1 + 40) addObject:v13];
        id v26 = *(void **)(a1 + 32);
        v27 = [v13 identifier];
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
      v39 = v38;
      uint64_t v40 = (uint64_t)v38;
      if (!v38)
      {
        uint64_t v40 = +[NSNull null];
        v39 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
      uint64_t v50 = (void *)v40;
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
      v44 = +[NSString stringWithFormat:@"[%zd]", a3];
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
    }
  }
  else
  {
    v62[0] = NSLocalizedFailureReasonErrorKey;
    v28 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) localizedFailureReason];
    v63[0] = v28;
    v62[1] = @"GCFailingKeyPathErrorKey";
    id v29 = +[NSString stringWithFormat:@"[%zd]", a3];
    v61 = v29;
    v30 = +[NSArray arrayWithObjects:&v61 count:1];
    v63[1] = v30;
    v31 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
    uint64_t v32 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v31);
    uint64_t v33 = *(void *)(*(void *)(a1 + 48) + 8);
    v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;

    *a4 = 1;
  }
}

@end