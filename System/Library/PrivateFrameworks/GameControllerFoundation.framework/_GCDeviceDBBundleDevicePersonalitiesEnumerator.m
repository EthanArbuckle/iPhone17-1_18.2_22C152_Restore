@interface _GCDeviceDBBundleDevicePersonalitiesEnumerator
- (_GCDeviceDBBundleDevicePersonalitiesEnumerator)initWithBundle:(id)a3 personalityPaths:(id)a4;
- (id)nextObject;
@end

@implementation _GCDeviceDBBundleDevicePersonalitiesEnumerator

- (_GCDeviceDBBundleDevicePersonalitiesEnumerator)initWithBundle:(id)a3 personalityPaths:(id)a4
{
  v6 = (NSBundle *)a3;
  v7 = (NSEnumerator *)a4;
  v13.receiver = self;
  v13.super_class = (Class)_GCDeviceDBBundleDevicePersonalitiesEnumerator;
  v8 = [(_GCDeviceDBBundleDevicePersonalitiesEnumerator *)&v13 init];
  bundle = v8->_bundle;
  v8->_bundle = v6;
  v10 = v6;

  personalitiesPaths = v8->_personalitiesPaths;
  v8->_personalitiesPaths = v7;

  return v8;
}

- (id)nextObject
{
  v4 = 0;
  while (1)
  {
    v5 = v4;
    v4 = [(NSEnumerator *)self->_personalitiesPaths nextObject];

    if (!v4) {
      break;
    }
    v6 = [(NSBundle *)self->_bundle URLForResource:v4 withExtension:0];
    if (v6)
    {
      v7 = [_GCDeviceDBPersonality alloc];
      id v18 = 0;
      v8 = [(_GCDeviceDBPersonality *)v7 initWithURL:v6 error:&v18];
      v9 = v18;
      v10 = v9;
      if (v8)
      {
        v2 = v8;
        int v11 = 1;
      }
      else
      {
        uint64_t v16 = [v9 code];
        v12 = _gc_log_devicedb();
        objc_super v13 = v12;
        if (v16 == 5)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            v17 = [v6 path];
            v15 = [v10 localizedFailureReason];
            *(_DWORD *)buf = 138412546;
            v20 = v17;
            __int16 v21 = 2114;
            v22 = v15;
            _os_log_debug_impl(&dword_20AD04000, v13, OS_LOG_TYPE_DEBUG, "📦 Skipping loading device personality at '%@': %{public}@.", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v10;
          _os_log_fault_impl(&dword_20AD04000, v13, OS_LOG_TYPE_FAULT, "📦 Error loading device personality: %@", buf, 0xCu);
        }

        int v11 = 2;
      }
    }
    else
    {
      v10 = _gc_log_devicedb();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_fault_impl(&dword_20AD04000, v10, OS_LOG_TYPE_FAULT, "📦 Device personality file does not exist: %@.", buf, 0xCu);
      }
      int v11 = 2;
    }

    if (v11 != 2) {
      goto LABEL_19;
    }
  }
  v2 = 0;
LABEL_19:

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalitiesPaths, 0);

  objc_storeStrong((id *)&self->_bundle, 0);
}

@end