@interface _GCDeviceDBBundle
- (GCVersion)version;
- (NSArray)devices;
- (NSString)identifier;
- (_GCDeviceDBBundle)initWithBundle:(id)a3 error:(id *)a4;
- (id)debugDescription;
- (id)description;
- (id)redactedDescription;
@end

@implementation _GCDeviceDBBundle

- (_GCDeviceDBBundle)initWithBundle:(id)a3 error:(id *)a4
{
  id v8 = a3;
  v73.receiver = self;
  v73.super_class = (Class)_GCDeviceDBBundle;
  v9 = [(_GCDeviceDBBundle *)&v73 init];
  if (!v8)
  {
    v48 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, @"_GCDeviceDBBundle.m", 24, @"Invalid parameter not satisfying: %s", "bundle");
  }
  objc_storeStrong((id *)&v9->_bundle, a3);
  v10 = [v8 configurationType];
  char v11 = [v10 isEqualToString:0x26BED8440];

  if ((v11 & 1) == 0)
  {
    if (a4)
    {
      v83[0] = @"Failed to initialize Device DB Bundle.";
      v82[0] = NSLocalizedDescriptionKey;
      v82[1] = NSLocalizedFailureReasonErrorKey;
      v15 = [v8 configurationType];
      v22 = +[NSString stringWithFormat:@"The provided bundle has the wrong configuration type: '%@'.", v15];
      v83[1] = v22;
      v82[2] = NSFilePathErrorKey;
      v23 = [v8 bundleURL];
      uint64_t v24 = [v23 path];
      v25 = (void *)v24;
      v26 = @"<missing path>";
      if (v24) {
        v26 = (__CFString *)v24;
      }
      v83[2] = v26;
      v27 = +[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:3];
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v27);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_29;
    }
    goto LABEL_31;
  }
  v12 = [v8 compatibilityVersion];
  v13 = +[GCVersion currentSourceVersion];
  int v14 = [v12 isGreaterThanSourceVersion:v13];

  if (!v14)
  {
    v15 = [v8 infoDictionary];
    if (!v15)
    {
      if (!a4)
      {
LABEL_30:

        goto LABEL_31;
      }
      v78[0] = NSLocalizedDescriptionKey;
      v78[1] = NSLocalizedFailureReasonErrorKey;
      v79[0] = @"Failed to initialize Device DB Bundle.";
      v79[1] = @"The provided bundle did not return an Info Dictionary.";
      v78[2] = NSFilePathErrorKey;
      v41 = [v8 bundleURL];
      uint64_t v42 = [v41 path];
      v43 = (void *)v42;
      v44 = @"<missing path>";
      if (v42) {
        v44 = (__CFString *)v42;
      }
      v79[2] = v44;
      v45 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:3];
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v45);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_29:
      a4 = 0;
      goto LABEL_30;
    }
    id v72 = 0;
    v28 = objc_msgSend(v15, "gc_requiredObjectForKey:ofClass:error:", @"Devices", objc_opt_class(), &v72);
    id v29 = v72;
    if (!v28)
    {
      if (a4)
      {
        v77[0] = @"Failed to initialize Device DB Bundle.";
        v76[0] = NSLocalizedDescriptionKey;
        v76[1] = NSLocalizedFailureReasonErrorKey;
        id v49 = v29;
        v50 = [v29 localizedFailureReason];
        v77[1] = v50;
        v76[2] = NSFilePathErrorKey;
        v51 = [v8 bundleURL];
        uint64_t v52 = [v51 path];
        v53 = (void *)v52;
        v54 = @"<missing path>";
        if (v52) {
          v54 = (__CFString *)v52;
        }
        v77[2] = v54;
        v55 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:3];
        +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v55);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        id v29 = v49;
      }

      goto LABEL_29;
    }
    v60 = v29;
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__16;
    v70 = __Block_byref_object_dispose__16;
    id v71 = 0;
    v30 = objc_msgSend(objc_alloc((Class)&off_26BEEB1B8), "initWithCapacity:", objc_msgSend(v28, "count"));
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = __42___GCDeviceDBBundle_initWithBundle_error___block_invoke;
    v61[3] = &unk_26BEC51E0;
    v65 = &v66;
    id v31 = v8;
    id v62 = v31;
    v59 = v9;
    v63 = v59;
    id v32 = v30;
    id v64 = v32;
    objc_msgSend(v28, "gc_enumerateObjectsUsingBlock:", v61);
    v33 = (void *)v67[5];
    if (v33)
    {
      if (!a4) {
        goto LABEL_28;
      }
      v75[0] = @"Failed to initialize Device DB Bundle.";
      v74[0] = NSLocalizedDescriptionKey;
      v74[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v58 = [v33 localizedFailureReason];
      v75[1] = v58;
      v74[2] = NSFilePathErrorKey;
      v57 = [v31 bundleURL];
      uint64_t v34 = [v57 path];
      v56 = (void *)v34;
      v35 = @"<missing path>";
      if (v34) {
        v35 = (__CFString *)v34;
      }
      v75[2] = v35;
      v74[3] = 0x26BED8480;
      v36 = -[NSError gc_dbFailingPath]((void *)v67[5]);
      v37 = v36;
      if (!v36) {
        v36 = &__NSArray0__struct;
      }
      v38 = [v36 arrayByAddingObject:@"Devices"];
      v75[3] = v38;
      v39 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:4];
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v39);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      devices = (void *)v58;
    }
    else
    {
      uint64_t v46 = [v32 copy];
      devices = v59->_devices;
      v59->_devices = (NSArray *)v46;
    }

LABEL_28:
    _Block_object_dispose(&v66, 8);

    if (!v33)
    {
      a4 = v59;
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (a4)
  {
    v81[0] = @"Failed to initialize Device DB Bundle.";
    v80[0] = NSLocalizedDescriptionKey;
    v80[1] = NSLocalizedFailureReasonErrorKey;
    v15 = [v8 compatibilityVersion];
    v16 = +[NSString stringWithFormat:@"Bundle requires version '%@'.", v15];
    v81[1] = v16;
    v80[2] = NSFilePathErrorKey;
    v17 = [v8 bundleURL];
    uint64_t v18 = [v17 path];
    v19 = (void *)v18;
    v20 = @"<missing path>";
    if (v18) {
      v20 = (__CFString *)v18;
    }
    v81[2] = v20;
    v21 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:3];
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 5, v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
LABEL_31:

  return (_GCDeviceDBBundle *)a4;
}

- (NSString)identifier
{
  return [(_GCConfigurationBundle *)self->_bundle identifier];
}

- (GCVersion)version
{
  return [(_GCConfigurationBundle *)self->_bundle version];
}

- (id)redactedDescription
{
  v3 = [(_GCDeviceDBBundle *)self identifier];
  v4 = [(_GCDeviceDBBundle *)self version];
  v5 = +[NSString stringWithFormat:@"%@ (v%@)", v3, v4];

  return v5;
}

- (id)description
{
  v3 = [(_GCDeviceDBBundle *)self identifier];
  v4 = [(_GCDeviceDBBundle *)self version];
  v5 = +[NSString stringWithFormat:@"%@ (v%@)", v3, v4];

  return v5;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(_GCDeviceDBBundle *)self identifier];
  v6 = [(_GCDeviceDBBundle *)self version];
  v7 = +[NSString stringWithFormat:@"<%@ %p> %@ (v%@)", v4, self, v5, v6];

  return v7;
}

- (NSArray)devices
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);

  objc_storeStrong((id *)&self->_bundle, 0);
}

@end