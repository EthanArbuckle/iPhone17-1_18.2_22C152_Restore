@interface _GCDeviceDBPersonality
- (GCGenericDeviceModel)model;
- (GCVersion)compatibilityVersion;
- (GCVersion)obsoletedInVersion;
- (NSPredicate)ioMatchingPredicate;
- (_GCDeviceDBPersonality)init;
- (_GCDeviceDBPersonality)initWithDictionary:(id)a3 error:(id *)a4;
- (_GCDeviceDBPersonality)initWithURL:(id)a3 error:(id *)a4;
@end

@implementation _GCDeviceDBPersonality

- (_GCDeviceDBPersonality)initWithDictionary:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v52 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCDeviceDBPersonality.m", 34, @"Invalid parameter not satisfying: %s", "dict != nil");
  }
  v73.receiver = self;
  v73.super_class = (Class)_GCDeviceDBPersonality;
  v8 = [(_GCDeviceDBPersonality *)&v73 init];
  uint64_t v9 = objc_opt_class();
  id v72 = 0;
  v10 = objc_msgSend(v7, "gc_requiredObjectForKey:ofClass:error:", @"CompatibilityVersion", v9, &v72);
  id v11 = v72;
  v12 = v11;
  if (!v10)
  {
    if (a4)
    {
      v96[0] = @"Invalid 'Personality' definition.";
      v95[0] = NSLocalizedDescriptionKey;
      v95[1] = NSLocalizedFailureReasonErrorKey;
      v53 = [v11 localizedFailureReason];
      v96[1] = v53;
      v54 = +[NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:2];
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v54);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_60;
  }
  v13 = [[GCVersion alloc] initWithString:v10];
  if (!v13)
  {
    if (!a4) {
      goto LABEL_9;
    }
    v94[0] = @"Invalid 'Personality' definition.";
    v93[0] = NSLocalizedDescriptionKey;
    v93[1] = NSLocalizedFailureReasonErrorKey;
    v16 = +[NSString stringWithFormat:@"'%@' is not a valid version.", v10];
    v94[1] = v16;
    v93[2] = 0x26BED8480;
    v92 = @"CompatibilityVersion";
    v17 = +[NSArray arrayWithObjects:&v92 count:1];
    v94[2] = v17;
    v55 = +[NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:3];
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v55);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v14 = +[GCVersion currentSourceVersion];
  BOOL v15 = [(GCVersion *)v13 isGreaterThanSourceVersion:v14];

  if (v15)
  {
    if (!a4)
    {
LABEL_9:

LABEL_60:
      v42 = 0;
      goto LABEL_61;
    }
    v91[0] = @"Incompatible 'Personality' definition.";
    v90[0] = NSLocalizedDescriptionKey;
    v90[1] = NSLocalizedFailureReasonErrorKey;
    v16 = +[NSString stringWithFormat:@"Personality definition requires version '%@'.", v13];
    v91[1] = v16;
    v17 = +[NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:2];
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 5, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_9;
  }
  compatibilityVersion = v8->_compatibilityVersion;
  v8->_compatibilityVersion = v13;

  uint64_t v19 = objc_opt_class();
  id v71 = 0;
  v20 = objc_msgSend(v7, "gc_objectForKey:ofClass:error:", @"ObsoletedInVersion", v19, &v71);
  id v21 = v71;
  v22 = v21;
  if (!v20 && v21)
  {
    if (!a4) {
      goto LABEL_20;
    }
    v89[0] = @"Invalid 'Personality' definition.";
    v88[0] = NSLocalizedDescriptionKey;
    v88[1] = NSLocalizedFailureReasonErrorKey;
    v23 = [v21 localizedFailureReason];
    v89[1] = v23;
    v26 = +[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:2];
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v26);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (v20)
  {
    v23 = [[GCVersion alloc] initWithString:v20];
    if (!v23)
    {
      if (!a4) {
        goto LABEL_19;
      }
      v87[0] = @"Invalid 'Personality' definition.";
      v86[0] = NSLocalizedDescriptionKey;
      v86[1] = NSLocalizedFailureReasonErrorKey;
      v26 = +[NSString stringWithFormat:@"'%@' is not a valid version.", v20];
      v87[1] = v26;
      v86[2] = 0x26BED8480;
      v85 = @"ObsoletedInVersion";
      v27 = +[NSArray arrayWithObjects:&v85 count:1];
      v87[2] = v27;
      v57 = +[NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:3];
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v57);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
LABEL_18:

      goto LABEL_19;
    }
    v24 = +[GCVersion currentSourceVersion];
    BOOL v25 = [(GCVersion *)v23 isLessThanOrEqualToSourceVersion:v24];

    if (v25)
    {
      if (!a4)
      {
LABEL_19:

LABEL_20:
        goto LABEL_60;
      }
      v84[0] = @"Incompatible 'Personality' definition.";
      v83[0] = NSLocalizedDescriptionKey;
      v83[1] = NSLocalizedFailureReasonErrorKey;
      v26 = +[NSString stringWithFormat:@"Personality definition requires version not greater than '%@'.", v23];
      v84[1] = v26;
      v27 = +[NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:2];
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 5, v27);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    obsoletedInVersion = v8->_obsoletedInVersion;
    v8->_obsoletedInVersion = v23;
  }
  uint64_t v29 = objc_opt_class();
  id v70 = 0;
  v30 = objc_msgSend(v7, "gc_objectForKey:ofClass:error:", @"IOPropertyMatchingPredicate", v29, &v70);
  id v31 = v70;
  v32 = v31;
  if (!v30 && v31)
  {
    if (!a4)
    {
LABEL_59:

      goto LABEL_60;
    }
    v82[0] = @"Invalid 'Personality' definition.";
    v81[0] = NSLocalizedDescriptionKey;
    v81[1] = NSLocalizedFailureReasonErrorKey;
    v56 = [v31 localizedFailureReason];
    v82[1] = v56;
    v66 = +[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:2];
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v66);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_58:
    goto LABEL_59;
  }
  if (!v30) {
    goto LABEL_27;
  }
  uint64_t v33 = +[NSPredicate predicateWithFormat:v30];
  if (!v33)
  {
    uint64_t v60 = +[NSString stringWithFormat:@"String is not a valid predicate: '%@'.", v30];
    v56 = (void *)v60;
    if (a4)
    {
      v79[0] = NSLocalizedDescriptionKey;
      v79[1] = NSLocalizedFailureReasonErrorKey;
      v80[0] = @"Invalid 'Personality' definition.";
      v80[1] = v60;
      v79[2] = NSUnderlyingErrorKey;
      uint64_t v61 = (uint64_t)v32;
      if (!v32)
      {
        uint64_t v61 = +[NSNull null];
      }
      v67 = (void *)v61;
      v80[2] = v61;
      v79[3] = 0x26BED8480;
      v78 = @"IOPropertyMatchingPredicate";
      v62 = +[NSArray arrayWithObjects:&v78 count:1];
      v80[3] = v62;
      v63 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:4];
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v63);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v32) {
    }
      }
    goto LABEL_58;
  }
  ioMatchingPredicate = v8->_ioMatchingPredicate;
  v8->_ioMatchingPredicate = (NSPredicate *)v33;

LABEL_27:
  uint64_t v35 = objc_opt_class();
  id v69 = 0;
  v36 = objc_msgSend(v7, "gc_requiredObjectForKey:ofClass:error:", @"Model", v35, &v69);
  id v37 = v69;
  v38 = v37;
  if (!v36)
  {
    if (a4)
    {
      v77[0] = @"Invalid 'Personality' definition.";
      v76[0] = NSLocalizedDescriptionKey;
      v76[1] = NSLocalizedFailureReasonErrorKey;
      v58 = [v37 localizedFailureReason];
      v77[1] = v58;
      v59 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v59);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_60;
  }
  id v68 = 0;
  uint64_t v39 = +[GCGenericDeviceModel modelWithDictionaryRepresentation:v36 error:&v68];
  id v40 = v68;

  if (!v39)
  {
    if (a4)
    {
      v74[0] = NSLocalizedDescriptionKey;
      uint64_t v43 = [v40 localizedDescription];
      v65 = (void *)v43;
      v44 = @"Invalid 'Personality' definition.";
      if (v43) {
        v44 = (__CFString *)v43;
      }
      v75[0] = v44;
      v74[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v45 = [v40 localizedFailureReason];
      v46 = (void *)v45;
      v47 = @"Invalid 'Model' definition.";
      if (v45) {
        v47 = (__CFString *)v45;
      }
      v75[1] = v47;
      v74[2] = 0x26BED8480;
      v48 = objc_msgSend(v40, "gc_failingKeyPath");
      v49 = v48;
      if (!v48) {
        v48 = &__NSArray0__struct;
      }
      v50 = [v48 arrayByAddingObject:@"Model"];
      v75[2] = v50;
      v51 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:3];
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v51);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_60;
  }
  model = v8->_model;
  v8->_model = (GCGenericDeviceModel *)v39;

  v42 = v8;
LABEL_61:

  return v42;
}

- (_GCDeviceDBPersonality)initWithURL:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    a4 = 0;
    goto LABEL_11;
  }
  id v31 = 0;
  v8 = +[NSData dataWithContentsOfURL:v7 options:0 error:&v31];
  id v9 = v31;
  v10 = v9;
  if (!v8)
  {
    if (!a4) {
      goto LABEL_9;
    }
    v34[0] = NSLocalizedDescriptionKey;
    v34[1] = NSLocalizedFailureReasonErrorKey;
    v35[0] = @"Invalid device personality";
    v35[1] = @"Error loading file.";
    v34[2] = NSUnderlyingErrorKey;
    v13 = v9;
    if (!v9)
    {
      v13 = +[NSNull null];
    }
    v35[2] = v13;
    v34[3] = NSFilePathErrorKey;
    uint64_t v19 = [v7 path];
    v35[3] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 2, v20);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    p_isa = 0;
    a4 = 0;
    if (v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v30 = 0;
  id v11 = +[NSPropertyListSerialization propertyListWithData:v8 options:0 format:0 error:&v30];
  id v12 = v30;
  v13 = v12;
  if (v11)
  {
    id v29 = 0;
    self = [(_GCDeviceDBPersonality *)self initWithDictionary:v11 error:&v29];
    id v14 = v29;
    BOOL v15 = v14;
    if (self)
    {
      objc_storeStrong((id *)&self->_url, a3);
      self = self;
      v16 = self;
    }
    else
    {
      v23 = [v14 userInfo];
      v24 = (void *)[v23 mutableCopy];

      BOOL v25 = [v7 path];
      [v24 setObject:v25 forKeyedSubscript:NSFilePathErrorKey];

      if (a4)
      {
        v26 = [v15 domain];
        +[NSError errorWithDomain:code:userInfo:](&off_26BEEAB30, "errorWithDomain:code:userInfo:", v26, [v15 code], v24);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = 0;
    }
  }
  else
  {
    if (!a4)
    {
      p_isa = 0;
      goto LABEL_7;
    }
    v27 = &off_26BEEAB30;
    v32[0] = NSLocalizedDescriptionKey;
    v32[1] = NSLocalizedFailureReasonErrorKey;
    v33[0] = @"Invalid device personality";
    v33[1] = @"Property list syntax error.";
    v32[2] = NSUnderlyingErrorKey;
    BOOL v15 = v12;
    if (!v12)
    {
      BOOL v15 = +[NSNull null];
    }
    v33[2] = v15;
    v32[3] = NSFilePathErrorKey;
    id v21 = objc_msgSend(v7, "path", v27);
    v33[3] = v21;
    v22 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:4];
    +[NSError gc_deviceDBError:userInfo:](v28, 3, v22);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    p_isa = 0;
    if (v13) {
      goto LABEL_7;
    }
  }

  p_isa = (id *)&v16->super.isa;
LABEL_7:

LABEL_8:
  a4 = p_isa;
LABEL_9:

LABEL_11:
  return (_GCDeviceDBPersonality *)a4;
}

- (_GCDeviceDBPersonality)init
{
  return 0;
}

- (GCVersion)compatibilityVersion
{
  return (GCVersion *)objc_getProperty(self, a2, 16, 1);
}

- (GCVersion)obsoletedInVersion
{
  return (GCVersion *)objc_getProperty(self, a2, 24, 1);
}

- (NSPredicate)ioMatchingPredicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 32, 1);
}

- (GCGenericDeviceModel)model
{
  return (GCGenericDeviceModel *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_ioMatchingPredicate, 0);
  objc_storeStrong((id *)&self->_obsoletedInVersion, 0);
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end