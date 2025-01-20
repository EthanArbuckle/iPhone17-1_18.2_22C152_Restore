@interface _GCDeviceDBBundleDevice
- (NSArray)ioMatchingPredicates;
- (NSString)identifier;
- (_GCDeviceDBBundleDevice)init;
- (_GCDeviceDBBundleDevice)initWithBundle:(id)a3 dictionary:(id)a4 error:(id *)a5;
- (id)description;
- (id)personalities;
- (id)redactedDescription;
@end

@implementation _GCDeviceDBBundleDevice

- (_GCDeviceDBBundleDevice)initWithBundle:(id)a3 dictionary:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  v69 = v9;
  if (!v9)
  {
    v49 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCDeviceDBBundleDevice.m", 41, @"Invalid parameter not satisfying: %s", "bundle != nil");

    if (v11) {
      goto LABEL_3;
    }
LABEL_36:
    v50 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCDeviceDBBundleDevice.m", 42, @"Invalid parameter not satisfying: %s", "dict != nil");

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_36;
  }
LABEL_3:
  v86.receiver = self;
  v86.super_class = (Class)_GCDeviceDBBundleDevice;
  v12 = [(_GCDeviceDBBundleDevice *)&v86 init];
  objc_storeStrong((id *)&v12->_bundle, a3);
  id v85 = 0;
  v13 = objc_msgSend(v11, "gc_objectForKey:ofClass:error:", @"CompatibilityVersion", objc_opt_class(), &v85);
  id v14 = v85;
  v15 = v14;
  if (!v13 && v14)
  {
    if (a5)
    {
      v104[0] = @"Invalid device definition";
      v103[0] = NSLocalizedDescriptionKey;
      v103[1] = NSLocalizedFailureReasonErrorKey;
      v51 = [v14 localizedFailureReason];
      v104[1] = v51;
      v52 = +[NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:2];
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v52);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_56;
  }
  if (v13)
  {
    v16 = [[GCVersion alloc] initWithString:v13];
    if (!v16)
    {
      if (!a5) {
        goto LABEL_11;
      }
      v102[0] = @"Invalid device definition.";
      v101[0] = NSLocalizedDescriptionKey;
      v101[1] = NSLocalizedFailureReasonErrorKey;
      v19 = +[NSString stringWithFormat:@"'%@' is not a valid version.", v13];
      v102[1] = v19;
      v101[2] = 0x26BED8480;
      v100 = @"CompatibilityVersion";
      v20 = +[NSArray arrayWithObjects:&v100 count:1];
      v102[2] = v20;
      v59 = +[NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:3];
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v59);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    v17 = +[GCVersion currentSourceVersion];
    BOOL v18 = [(GCVersion *)v16 isGreaterThanSourceVersion:v17];

    if (v18)
    {
      if (!a5)
      {
LABEL_11:

LABEL_56:
        v48 = 0;
        goto LABEL_57;
      }
      v99[0] = @"Incompatible device definition.";
      v98[0] = NSLocalizedDescriptionKey;
      v98[1] = NSLocalizedFailureReasonErrorKey;
      v19 = +[NSString stringWithFormat:@"Device definition requires version '%@'.", v16];
      v99[1] = v19;
      v20 = +[NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:2];
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 5, v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

      goto LABEL_11;
    }
  }
  else
  {
    v16 = 0;
  }

  id v84 = 0;
  uint64_t v21 = objc_msgSend(v11, "gc_requiredObjectForKey:ofClass:error:", @"Identifier", objc_opt_class(), &v84);
  id v22 = v84;
  v23 = v22;
  if (!v21)
  {
    if (a5)
    {
      v97[0] = @"Invalid device definition";
      v96[0] = NSLocalizedDescriptionKey;
      v96[1] = NSLocalizedFailureReasonErrorKey;
      v53 = [v22 localizedFailureReason];
      v97[1] = v53;
      v54 = +[NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:2];
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v54);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_56;
  }
  identifier = v12->_identifier;
  v12->_identifier = (NSString *)v21;

  uint64_t v25 = objc_msgSend(v11, "gc_objectForKey:ofClass:error:", @"IOPropertyMatch", objc_opt_class(), 0);
  v26 = (void *)v25;
  if (v25)
  {
    uint64_t v95 = v25;
    v27 = +[NSArray arrayWithObjects:&v95 count:1];
    v28 = 0;
    goto LABEL_17;
  }
  id v83 = 0;
  v27 = objc_msgSend(v11, "gc_requiredObjectForKey:ofClass:error:", @"IOPropertyMatch", objc_opt_class(), &v83);
  id v29 = v83;
  v28 = v29;
  if (v27)
  {
LABEL_17:
    uint64_t v77 = 0;
    v78 = &v77;
    uint64_t v79 = 0x3032000000;
    v80 = __Block_byref_object_copy__9;
    v81 = __Block_byref_object_dispose__9;
    id v82 = 0;
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = __59___GCDeviceDBBundleDevice_initWithBundle_dictionary_error___block_invoke;
    v74[3] = &unk_26BEC4CD8;
    v76 = &v77;
    id v30 = (id)objc_msgSend(objc_alloc((Class)&off_26BEEB1B8), "initWithCapacity:", objc_msgSend(v27, "count"));
    id v75 = v30;
    objc_msgSend(v27, "gc_enumerateObjectsUsingBlock:", v74);
    uint64_t v31 = [v30 count];
    if (v31 == [v27 count])
    {
      uint64_t v32 = [v30 copy];
      int v33 = 0;
      ioMatchingPredicates = v12->_ioMatchingPredicates;
      v12->_ioMatchingPredicates = (NSArray *)v32;
    }
    else
    {
      if (!a5)
      {
        int v33 = 1;
        goto LABEL_20;
      }
      v92[0] = @"Invalid device definition.";
      v91[0] = NSLocalizedDescriptionKey;
      v91[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v55 = [(id)v78[5] localizedFailureReason];
      ioMatchingPredicates = (void *)v55;
      v56 = &stru_26BED82A0;
      if (v55) {
        v56 = (__CFString *)v55;
      }
      v92[1] = v56;
      v91[2] = @"GCFailingKeyPathErrorKey";
      v57 = objc_msgSend((id)v78[5], "gc_failingKeyPath");
      v67 = v57;
      if (!v57) {
        v57 = &__NSArray0__struct;
      }
      v65 = [v57 arrayByAddingObject:@"IOPropertyMatch"];
      v92[2] = v65;
      v58 = +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:3];
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v58);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      int v33 = 1;
    }

LABEL_20:
    _Block_object_dispose(&v77, 8);

LABEL_21:
    goto LABEL_22;
  }
  if (a5)
  {
    v94[0] = @"Invalid device definition";
    v93[0] = NSLocalizedDescriptionKey;
    v93[1] = NSLocalizedFailureReasonErrorKey;
    v27 = [v29 localizedFailureReason];
    v94[1] = v27;
    v60 = +[NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:2];
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v60);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    int v33 = 1;
    goto LABEL_21;
  }
  int v33 = 1;
LABEL_22:

  if (v33) {
    goto LABEL_56;
  }
  id v73 = 0;
  v35 = objc_msgSend(v11, "gc_requiredObjectForKey:ofClass:error:", @"Personalities", objc_opt_class(), &v73);
  id v36 = v73;
  if (!v35)
  {
    if (a5)
    {
      v90[0] = @"Invalid device definition";
      v89[0] = NSLocalizedDescriptionKey;
      v89[1] = NSLocalizedFailureReasonErrorKey;
      id v61 = v36;
      v62 = [v36 localizedFailureReason];
      v90[1] = v62;
      v63 = +[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:2];
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v63);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      id v36 = v61;
    }

    goto LABEL_56;
  }
  v66 = v36;
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__9;
  v81 = __Block_byref_object_dispose__9;
  id v82 = 0;
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = __59___GCDeviceDBBundleDevice_initWithBundle_dictionary_error___block_invoke_2;
  v70[3] = &unk_26BEC4CD8;
  v72 = &v77;
  id v37 = (id)objc_msgSend(objc_alloc((Class)&off_26BEEB1B8), "initWithCapacity:", objc_msgSend(v35, "count"));
  id v71 = v37;
  objc_msgSend(v35, "gc_enumerateObjectsUsingBlock:", v70);
  uint64_t v38 = [v37 count];
  uint64_t v39 = [v35 count];
  if (v38 == v39)
  {
    uint64_t v40 = [v37 copy];
    personalityPaths = v12->_personalityPaths;
    v12->_personalityPaths = (NSArray *)v40;
  }
  else
  {
    if (!a5) {
      goto LABEL_33;
    }
    v88[0] = @"Invalid device definition.";
    v87[0] = NSLocalizedDescriptionKey;
    v87[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v42 = [(id)v78[5] localizedFailureReason];
    personalityPaths = (void *)v42;
    v43 = &stru_26BED82A0;
    if (v42) {
      v43 = (__CFString *)v42;
    }
    v88[1] = v43;
    v87[2] = 0x26BED8480;
    v44 = -[NSError gc_dbFailingPath]((void *)v78[5]);
    v45 = v44;
    if (!v44) {
      v44 = &__NSArray0__struct;
    }
    v46 = [v44 arrayByAddingObject:@"Personalities"];
    v88[2] = v46;
    v47 = +[NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:3];
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v47);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_33:

  _Block_object_dispose(&v77, 8);
  if (v38 != v39) {
    goto LABEL_56;
  }
  v48 = v12;
LABEL_57:

  return v48;
}

- (_GCDeviceDBBundleDevice)init
{
  return 0;
}

- (id)personalities
{
  v3 = [_GCDeviceDBBundleDevicePersonalitiesEnumerator alloc];
  bundle = self->_bundle;
  v5 = [(NSArray *)self->_personalityPaths objectEnumerator];
  v6 = [(_GCDeviceDBBundleDevicePersonalitiesEnumerator *)v3 initWithBundle:bundle personalityPaths:v5];

  return v6;
}

- (id)redactedDescription
{
  return self->_identifier;
}

- (id)description
{
  return self->_identifier;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)ioMatchingPredicates
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalityPaths, 0);
  objc_storeStrong((id *)&self->_ioMatchingPredicates, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_bundle, 0);
}

@end