@interface CRBatteryController
+ (id)setBatteryDateOfFirstUse:(id)a3 error:(id *)a4;
@end

@implementation CRBatteryController

+ (id)setBatteryDateOfFirstUse:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_21FC161D4;
  v37 = sub_21FC161E4;
  id v38 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = -536870212;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_21FC161D4;
  v27 = sub_21FC161E4;
  dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
  v6 = dispatch_get_global_queue(0, 0);
  if (v5)
  {
    v7 = handleForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_timeIntervalSinceReferenceDate(v5, v8, v9, v10);
      *(_DWORD *)buf = 138412546;
      id v40 = v5;
      __int16 v41 = 1024;
      int v42 = (int)v11;
      _os_log_impl(&dword_21FBF2000, v7, OS_LOG_TYPE_DEFAULT, "setBatteryDateOfFirstUse with %@ (%d)", buf, 0x12u);
    }

    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t Use = IOPSSetBatteryDateOfFirstUse();
    if (Use)
    {
      v15 = objc_msgSend_stringWithFormat_(NSString, v13, @"Failed to set battery date of first use when starting: 0x%08x", v14, Use, v22, 3221225472, sub_21FC16304, &unk_26452A968, &v29, &v33, &v23);
      uint64_t v16 = sub_21FC161EC(-42, v15);
      goto LABEL_10;
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)v24[5], 0xFFFFFFFFFFFFFFFFLL);
    if (*((_DWORD *)v30 + 6))
    {
      v15 = objc_msgSend_stringWithFormat_(NSString, v18, @"Failed to set battery date of first use when writing: 0x%08x", v19, *((unsigned int *)v30 + 6), v22, 3221225472, sub_21FC16304, &unk_26452A968, &v29, &v33, &v23);
      uint64_t v16 = sub_21FC161EC(-42, v15);
LABEL_10:
      id v17 = (id)v16;
      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    v15 = 0;
    id v17 = 0;
  }
  else
  {
    sub_21FC161EC(-39, @"Invalid input");
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    if (a4)
    {
LABEL_11:
      id v17 = v17;
      *a4 = v17;
    }
  }
LABEL_12:
  id v20 = (id)v34[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v20;
}

@end