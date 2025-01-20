@interface GCDeviceDBBundle
@end

@implementation GCDeviceDBBundle

void __42___GCDeviceDBBundle_initWithBundle_error___block_invoke(uint64_t a1, void (**a2)(void, void, void), uint64_t a3, unsigned char *a4)
{
  v8 = a2;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = a1 + 56;
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v11 + 40);
  v12 = ((void (**)(void, uint64_t, id *))a2)[2](v8, v9, &obj);

  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
  {
    v13 = [_GCDeviceDBBundleDevice alloc];
    uint64_t v14 = *(void *)(a1 + 32);
    v15 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v31 = 0;
    v16 = [(_GCDeviceDBBundleDevice *)v13 initWithBundle:v14 dictionary:v12 error:&v31];
    objc_storeStrong(v15, v31);
    if (v16)
    {
      [*(id *)(a1 + 48) addObject:v16];
    }
    else
    {
      uint64_t v24 = [*(id *)(*(void *)(*(void *)v10 + 8) + 40) code];
      v25 = _gc_log_devicedb();
      v26 = v25;
      if (v24 == 5)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v27 = *(void *)(a1 + 40);
          v28 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) localizedFailureReason];
          *(_DWORD *)buf = 138413058;
          uint64_t v34 = v27;
          __int16 v35 = 2114;
          v36 = @"Devices";
          __int16 v37 = 2048;
          uint64_t v38 = a3;
          __int16 v39 = 2114;
          v40 = v28;
          _os_log_debug_impl(&dword_20AD04000, v26, OS_LOG_TYPE_DEBUG, "📦 Skipping loading device definition at '%@' > '%{public}@' > [%zd]: %{public}@.", buf, 0x2Au);
        }
      }
      else if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        __42___GCDeviceDBBundle_initWithBundle_error___block_invoke_cold_1((uint64_t *)(a1 + 32), a1 + 56, v26);
      }

      uint64_t v29 = *(void *)(*(void *)v10 + 8);
      v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = 0;
    }
  }
  else
  {
    v42[0] = NSLocalizedFailureReasonErrorKey;
    v17 = [*(id *)(*(void *)(*(void *)v10 + 8) + 40) localizedFailureReason];
    v42[1] = 0x26BED8480;
    v43[0] = v17;
    v18 = +[NSString stringWithFormat:@"[%zd]", a3];
    v41 = v18;
    v19 = +[NSArray arrayWithObjects:&v41 count:1];
    v43[1] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
    uint64_t v21 = +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v20);
    uint64_t v22 = *(void *)(*(void *)v10 + 8);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    *a4 = 1;
  }
}

void __42___GCDeviceDBBundle_initWithBundle_error___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_fault_impl(&dword_20AD04000, log, OS_LOG_TYPE_FAULT, "📦 Error loading device definition in bundle %@: %{public}@", (uint8_t *)&v5, 0x16u);
}

@end