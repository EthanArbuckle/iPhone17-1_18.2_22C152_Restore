@interface GCDeviceDBBundleDevice
@end

@implementation GCDeviceDBBundleDevice

void __59___GCDeviceDBBundleDevice_initWithBundle_dictionary_error___block_invoke(uint64_t a1, void (**a2)(void, void, void), uint64_t a3, unsigned char *a4)
{
  v8 = a2;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v10 + 40);
  v11 = ((void (**)(void, uint64_t, id *))a2)[2](v8, v9, &obj);

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    id v28 = 0;
    v12 = GCHIDDeviceAttributesPredicateFromMatchingDictionary(v11, &v28);
    id v13 = v28;
    v14 = v13;
    if (v12)
    {
      [*(id *)(a1 + 32) addObject:v12];
    }
    else
    {
      v31[0] = NSLocalizedFailureReasonErrorKey;
      v31[1] = 0x26BED8480;
      v32[0] = v13;
      v22 = +[NSString stringWithFormat:@"[%zd]", a3];
      v30 = v22;
      v23 = +[NSArray arrayWithObjects:&v30 count:1];
      v32[1] = v23;
      v24 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
      uint64_t v25 = +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v24);
      uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8);
      v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;

      *a4 = 1;
    }
  }
  else
  {
    v34[0] = NSLocalizedFailureReasonErrorKey;
    v15 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) localizedFailureReason];
    v34[1] = 0x26BED8480;
    v35[0] = v15;
    v16 = +[NSString stringWithFormat:@"[%zd]", a3];
    v33 = v16;
    v17 = +[NSArray arrayWithObjects:&v33 count:1];
    v35[1] = v17;
    v18 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    uint64_t v19 = +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v18);
    uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
    v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    *a4 = 1;
  }
}

void __59___GCDeviceDBBundleDevice_initWithBundle_dictionary_error___block_invoke_2(uint64_t a1, void (**a2)(void, void, void), uint64_t a3, unsigned char *a4)
{
  v8 = a2;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v10 + 40);
  v11 = ((void (**)(void, uint64_t, id *))a2)[2](v8, v9, &obj);

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    [*(id *)(a1 + 32) addObject:v11];
  }
  else
  {
    v21[0] = NSLocalizedFailureReasonErrorKey;
    v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) localizedFailureReason];
    v21[1] = 0x26BED8480;
    v22[0] = v12;
    id v13 = +[NSString stringWithFormat:@"[%zd]", a3];
    uint64_t v20 = v13;
    v14 = +[NSArray arrayWithObjects:&v20 count:1];
    v22[1] = v14;
    v15 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    uint64_t v16 = +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_26BEEAB30, 3, v15);
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    *a4 = 1;
  }
}

@end