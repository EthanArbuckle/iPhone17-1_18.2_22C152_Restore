@interface _GCConfigurationBundle
- (GCVersion)compatibilityVersion;
- (GCVersion)version;
- (NSString)configurationType;
- (_GCConfigurationBundle)init;
- (_GCConfigurationBundle)initWithPath:(id)a3;
- (_GCConfigurationBundle)initWithPath:(id)a3 error:(id *)a4;
- (id)debugDescription;
- (id)description;
- (id)redactedDescription;
@end

@implementation _GCConfigurationBundle

- (_GCConfigurationBundle)initWithPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_getAssociatedObject(v6, self);

  if (!v7)
  {
    objc_setAssociatedObject(v6, self, self, 0);
    v62.receiver = self;
    v62.super_class = (Class)_GCConfigurationBundle;
    v9 = [(_GCConfigurationBundle *)&v62 _initUniqueWithPath:v6];
    objc_setAssociatedObject(v6, v9, 0, 0);
    if (!v9)
    {
      v8 = 0;
      goto LABEL_24;
    }
    v10 = [v9 infoDictionary];
    if (!v10)
    {
      if (a4)
      {
        v78[0] = NSLocalizedDescriptionKey;
        v78[1] = NSLocalizedFailureReasonErrorKey;
        v79[0] = @"Invalid bundle.";
        v79[1] = @"Missing information property list.";
        v78[2] = NSFilePathErrorKey;
        v37 = [v9 bundleURL];
        uint64_t v38 = [v37 path];
        v39 = (void *)v38;
        v40 = @"<missing path>";
        if (v38) {
          v40 = (__CFString *)v38;
        }
        v79[2] = v40;
        v41 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:3];
        +[NSError gc_ConfigurationError:userInfo:]((uint64_t)&off_26BEEAB30, 1, v41);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v8 = 0;
      v24 = 0;
      goto LABEL_23;
    }
    id v61 = 0;
    v57 = v10;
    v11 = objc_msgSend(v10, "gc_requiredObjectForKey:ofClass:error:", @"CompatibilityVersion", objc_opt_class(), &v61);
    id v12 = v61;
    v13 = v12;
    if (!v11)
    {
      if (!a4) {
        goto LABEL_16;
      }
      v77[0] = @"Invalid bundle information property list.";
      v76[0] = NSLocalizedDescriptionKey;
      v76[1] = NSLocalizedFailureReasonErrorKey;
      v11 = [v12 localizedFailureReason];
      v77[1] = v11;
      v76[2] = NSFilePathErrorKey;
      v14 = [v9 bundleURL];
      uint64_t v42 = [(GCVersion *)v14 path];
      v17 = (void *)v42;
      v43 = @"<missing path>";
      if (v42) {
        v43 = (__CFString *)v42;
      }
      v77[2] = v43;
      v18 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:3];
      +[NSError gc_ConfigurationError:userInfo:]((uint64_t)&off_26BEEAB30, 1, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v14 = [[GCVersion alloc] initWithString:v11];
    if (v14)
    {
      v15 = +[GCVersion currentSourceVersion];
      BOOL v16 = [(GCVersion *)v14 isGreaterThanSourceVersion:v15];

      if (!v16)
      {
        uint64_t v25 = [(GCVersion *)v14 copy];
        v26 = (void *)v9[11];
        v9[11] = v25;

        id v60 = 0;
        v27 = objc_msgSend(v57, "gc_requiredObjectForKey:ofClass:error:", kCFBundleIdentifierKey, objc_opt_class(), &v60);
        id v28 = v60;
        v13 = v28;
        if (v27)
        {

          id v59 = 0;
          v11 = objc_msgSend(v57, "gc_requiredObjectForKey:ofClass:error:", kCFBundleVersionKey, objc_opt_class(), &v59);
          id v29 = v59;
          v13 = v29;
          if (v11)
          {
            v30 = [[GCVersion alloc] initWithString:v11];
            v14 = v30;
            if (!v30)
            {
              if (!a4) {
                goto LABEL_15;
              }
              v67[0] = @"Invalid bundle information property list.";
              v66[0] = NSLocalizedDescriptionKey;
              v66[1] = NSLocalizedFailureReasonErrorKey;
              v17 = +[NSString stringWithFormat:@"'%@' is not a valid %@.", v11, kCFBundleVersionKey];
              v67[1] = v17;
              v66[2] = NSFilePathErrorKey;
              v18 = [v9 bundleURL];
              uint64_t v53 = [v18 path];
              v20 = (void *)v53;
              v54 = @"<missing path>";
              if (v53) {
                v54 = (__CFString *)v53;
              }
              v67[2] = v54;
              v22 = +[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:3];
              +[NSError gc_ConfigurationError:userInfo:]((uint64_t)&off_26BEEAB30, 1, v22);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_13;
            }
            v31 = (void *)v9[9];
            v9[9] = v30;

            id v58 = 0;
            v24 = v57;
            v32 = objc_msgSend(v57, "gc_requiredObjectForKey:ofClass:error:", @"ConfigurationType", objc_opt_class(), &v58);
            id v33 = v58;
            v13 = v33;
            if (v32)
            {
              uint64_t v34 = [v32 copy];
              v35 = (void *)v9[10];
              v9[10] = v34;

              v8 = v9;
              goto LABEL_23;
            }
            if (!a4)
            {
LABEL_16:

              v8 = 0;
              v24 = v57;
LABEL_23:

              goto LABEL_24;
            }
            v46 = a4;
            v65[0] = @"Invalid bundle information property list.";
            v64[0] = NSLocalizedDescriptionKey;
            v64[1] = NSLocalizedFailureReasonErrorKey;
            v11 = [v33 localizedFailureReason];
            v65[1] = v11;
            v64[2] = NSFilePathErrorKey;
            v14 = [v9 bundleURL];
            uint64_t v55 = [(GCVersion *)v14 path];
            v17 = (void *)v55;
            v56 = @"<missing path>";
            if (v55) {
              v56 = (__CFString *)v55;
            }
            v65[2] = v56;
            v49 = v65;
            v50 = v64;
          }
          else
          {
            if (!a4) {
              goto LABEL_16;
            }
            v46 = a4;
            v69[0] = @"Invalid bundle information property list.";
            v68[0] = NSLocalizedDescriptionKey;
            v68[1] = NSLocalizedFailureReasonErrorKey;
            v11 = [v29 localizedFailureReason];
            v69[1] = v11;
            v68[2] = NSFilePathErrorKey;
            v14 = [v9 bundleURL];
            uint64_t v51 = [(GCVersion *)v14 path];
            v17 = (void *)v51;
            v52 = @"<missing path>";
            if (v51) {
              v52 = (__CFString *)v51;
            }
            v69[2] = v52;
            v49 = v69;
            v50 = v68;
          }
        }
        else
        {
          if (!a4) {
            goto LABEL_16;
          }
          v46 = a4;
          v71[0] = @"Invalid bundle information property list.";
          v70[0] = NSLocalizedDescriptionKey;
          v70[1] = NSLocalizedFailureReasonErrorKey;
          v11 = [v28 localizedFailureReason];
          v71[1] = v11;
          v70[2] = NSFilePathErrorKey;
          v14 = [v9 bundleURL];
          uint64_t v47 = [(GCVersion *)v14 path];
          v17 = (void *)v47;
          v48 = @"<missing path>";
          if (v47) {
            v48 = (__CFString *)v47;
          }
          v71[2] = v48;
          v49 = v71;
          v50 = v70;
        }
        v18 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v50 count:3];
        +[NSError gc_ConfigurationError:userInfo:]((uint64_t)&off_26BEEAB30, 1, v18);
        id *v46 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      if (!a4)
      {
LABEL_15:

        goto LABEL_16;
      }
      v73[0] = @"Failed to initialize Configuration DB Bundle.";
      v72[0] = NSLocalizedDescriptionKey;
      v72[1] = NSLocalizedFailureReasonErrorKey;
      v17 = +[NSString stringWithFormat:@"Bundle requires framework version '%@'.", v14];
      v73[1] = v17;
      v72[2] = NSFilePathErrorKey;
      v18 = [v9 bundleURL];
      uint64_t v19 = [v18 path];
      v20 = (void *)v19;
      v21 = @"<missing path>";
      if (v19) {
        v21 = (__CFString *)v19;
      }
      v73[2] = v21;
      v22 = +[NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:3];
      uint64_t v23 = 2;
    }
    else
    {
      if (!a4) {
        goto LABEL_15;
      }
      v75[0] = @"Invalid bundle information property list.";
      v74[0] = NSLocalizedDescriptionKey;
      v74[1] = NSLocalizedFailureReasonErrorKey;
      v17 = +[NSString stringWithFormat:@"Invalid '%@' format: '%@'", @"CompatibilityVersion", v11];
      v75[1] = v17;
      v74[2] = NSFilePathErrorKey;
      v18 = [v9 bundleURL];
      uint64_t v44 = [v18 path];
      v20 = (void *)v44;
      v45 = @"<missing path>";
      if (v44) {
        v45 = (__CFString *)v44;
      }
      v75[2] = v45;
      v22 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:3];
      uint64_t v23 = 1;
    }
    +[NSError gc_ConfigurationError:userInfo:]((uint64_t)&off_26BEEAB30, v23, v22);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }
  v63.receiver = self;
  v63.super_class = (Class)_GCConfigurationBundle;
  v8 = [(_GCConfigurationBundle *)&v63 initWithPath:v6];
LABEL_24:

  return v8;
}

- (_GCConfigurationBundle)initWithPath:(id)a3
{
  return [(_GCConfigurationBundle *)self initWithPath:a3 error:0];
}

- (_GCConfigurationBundle)init
{
  return 0;
}

- (id)description
{
  v3 = [(_GCConfigurationBundle *)self identifier];
  v4 = [(_GCConfigurationBundle *)self version];
  v5 = +[NSString stringWithFormat:@"%@ (v%@)", v3, v4];

  return v5;
}

- (id)redactedDescription
{
  v3 = [(_GCConfigurationBundle *)self identifier];
  v4 = [(_GCConfigurationBundle *)self version];
  v5 = +[NSString stringWithFormat:@"%@ (v%@)", v3, v4];

  return v5;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(_GCConfigurationBundle *)self identifier];
  id v6 = [(_GCConfigurationBundle *)self version];
  v7 = +[NSString stringWithFormat:@"<%@ %p> %@ (v%@)", v4, self, v5, v6];

  return v7;
}

- (GCVersion)version
{
  return (GCVersion *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)configurationType
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (GCVersion)compatibilityVersion
{
  return (GCVersion *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_storeStrong((id *)&self->_configurationType, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

@end