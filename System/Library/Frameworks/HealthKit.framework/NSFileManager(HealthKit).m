@interface NSFileManager(HealthKit)
- (uint64_t)hk_enumerateDirectoryAtURL:()HealthKit includingPropertiesForKeys:options:error:handler:;
@end

@implementation NSFileManager(HealthKit)

- (uint64_t)hk_enumerateDirectoryAtURL:()HealthKit includingPropertiesForKeys:options:error:handler:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v28 = a7;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__29;
  v45 = __Block_byref_object_dispose__29;
  id v46 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __104__NSFileManager_HealthKit__hk_enumerateDirectoryAtURL_includingPropertiesForKeys_options_error_handler___block_invoke;
  v40[3] = &unk_1E58C48C0;
  v40[4] = &v41;
  [a1 enumeratorAtURL:v12 includingPropertiesForKeys:v13 options:a5 errorHandler:v40];
  v26 = v12;
  v27 = v13;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 1;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __104__NSFileManager_HealthKit__hk_enumerateDirectoryAtURL_includingPropertiesForKeys_options_error_handler___block_invoke_2;
        v29[3] = &unk_1E58C48E8;
        v31 = &v36;
        id v19 = v28;
        v29[4] = v18;
        id v30 = v19;
        HKWithAutoreleasePool(a6, v29);
        uint64_t v20 = v37[3];
        if (v20 == 2)
        {

          goto LABEL_12;
        }
        if (!v20)
        {

          v23 = v14;
          goto LABEL_18;
        }
      }
      uint64_t v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v47, 16, v26, v27);
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  v21 = (void *)v42[5];
  if (v21)
  {
    id v22 = v21;
    v23 = v22;
    if (a6) {
      *a6 = v22;
    }
    else {
      _HKLogDroppedError(v22);
    }
LABEL_18:

    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = 1;
  }
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v41, 8);
  return v24;
}

@end