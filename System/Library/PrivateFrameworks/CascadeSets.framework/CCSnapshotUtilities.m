@interface CCSnapshotUtilities
+ (id)_filenameFromDate:(id)a3 set:(id)a4 format:(unsigned __int8)a5;
+ (id)pathFromDate:(id)a3;
+ (id)snapshotSets:(id)a3 directory:(id)a4 useCase:(id)a5 format:(unsigned __int8)a6 date:(id)a7 error:(id *)a8;
@end

@implementation CCSnapshotUtilities

+ (id)_filenameFromDate:(id)a3 set:(id)a4 format:(unsigned __int8)a5
{
  int v5 = a5;
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = CCTypeIdentifierRegistryBridge();
    v10 = objc_msgSend(v9, "descriptionForTypeIdentifier:", objc_msgSend(v8, "itemType"));

    v11 = [v8 descriptors];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      v13 = NSString;
      v14 = [v8 encodedDescriptors];
      v15 = [v13 stringWithFormat:@"_<%@>", v14];
    }
    else
    {
      v15 = &stru_26FDBF2B8;
    }
    v17 = [(id)objc_opt_class() pathFromDate:v7];
    if (v5 == 1)
    {
      v18 = @"dat";
    }
    else
    {
      if (v5 != 2)
      {
        v19 = __biome_log_for_category();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          +[CCSnapshotUtilities _filenameFromDate:set:format:](v5, v19);
        }

        v16 = 0;
        goto LABEL_16;
      }
      v18 = @"json";
    }
    v16 = [NSString stringWithFormat:@"%@%@_%@.%@", v10, v15, v17, v18];
LABEL_16:

    goto LABEL_17;
  }
  v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    +[CCSnapshotUtilities _filenameFromDate:set:format:]((uint64_t)v8, v10);
  }
  v16 = 0;
LABEL_17:

  return v16;
}

+ (id)pathFromDate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F088C0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setFormatOptions:", objc_msgSend(v5, "formatOptions") | 0x800);
  v6 = [v5 stringFromDate:v4];

  return v6;
}

+ (id)snapshotSets:(id)a3 directory:(id)a4 useCase:(id)a5 format:(unsigned __int8)a6 date:(id)a7 error:(id *)a8
{
  unsigned int v45 = a6;
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v39 = a5;
  id v44 = a7;
  v13 = __biome_log_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [v11 count];
    v15 = [(id)objc_opt_class() pathFromDate:v44];
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v57 = v14;
    *(_WORD *)&v57[4] = 2112;
    *(void *)&v57[6] = v15;
    *(_WORD *)&v57[14] = 2112;
    *(void *)&v57[16] = v12;
    *(_WORD *)&v57[24] = 2112;
    *(void *)&v57[26] = v11;
    _os_log_impl(&dword_249B92000, v13, OS_LOG_TYPE_DEFAULT, "Capturing %u set snapshot(s) with timestamp: %@ to directory: %@ [%@]", buf, 0x26u);
  }
  id v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v11;
  uint64_t v43 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  id v16 = 0;
  if (v43)
  {
    uint64_t v41 = *(void *)v50;
    uint64_t v37 = *MEMORY[0x263F07F80];
    uint64_t v38 = *MEMORY[0x263F07F70];
    id v42 = v12;
    do
    {
      uint64_t v17 = 0;
      v18 = v16;
      do
      {
        if (*(void *)v50 != v41) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v49 + 1) + 8 * v17);
        v20 = (void *)MEMORY[0x24C5B1100]();
        v21 = [(id)objc_opt_class() _filenameFromDate:v44 set:v19 format:v45];
        v22 = [NSURL fileURLWithPath:v21 isDirectory:0 relativeToURL:v12];
        v23 = [MEMORY[0x263EFF9E0] outputStreamWithURL:v22 append:0];
        [v23 open];
        if ([v23 streamStatus] != 2)
        {
          v30 = (void *)MEMORY[0x263F087E8];
          uint64_t v53 = v37;
          v31 = [NSString stringWithFormat:@"Failed to open NSOutputStream with filename: %@ directory: %@", v21, v12];
          v54 = v31;
          v32 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
          id v16 = [v30 errorWithDomain:v38 code:-1000 userInfo:v32];

          v33 = __biome_log_for_category();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)v57 = v19;
            *(_WORD *)&v57[8] = 2112;
            *(void *)&v57[10] = v16;
            _os_log_error_impl(&dword_249B92000, v33, OS_LOG_TYPE_ERROR, "Failed to create snapshot file for set: %@ error: %@", buf, 0x16u);
          }

          int v29 = 0;
          v24 = v46;
          goto LABEL_20;
        }
        id v48 = v18;
        v24 = [v19 serializeWithUseCase:v39 error:&v48];
        id v16 = v48;

        if (!v24)
        {
          v34 = __biome_log_for_category();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)v57 = v19;
            *(_WORD *)&v57[8] = 2112;
            *(void *)&v57[10] = v16;
            _os_log_error_impl(&dword_249B92000, v34, OS_LOG_TYPE_ERROR, "Failed to serialize set: %@ error: %@", buf, 0x16u);
          }

          int v29 = 0;
LABEL_20:
          id v46 = 0;
          goto LABEL_25;
        }
        id v47 = v16;
        char v25 = [v24 writeToStream:v23 format:v45 error:&v47];
        id v26 = v47;

        v27 = __biome_log_for_category();
        v28 = v27;
        if (v25)
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v57 = v22;
            _os_log_impl(&dword_249B92000, v28, OS_LOG_TYPE_DEFAULT, "Snapshot written to file: %@", buf, 0xCu);
          }

          [v46 addObject:v22];
          int v29 = 1;
        }
        else
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)v57 = v24;
            *(_WORD *)&v57[8] = 2112;
            *(void *)&v57[10] = v23;
            *(_WORD *)&v57[18] = 2112;
            *(void *)&v57[20] = v26;
            _os_log_error_impl(&dword_249B92000, v28, OS_LOG_TYPE_ERROR, "Failed to write serialized set: %@ to stream: %@ error: %@", buf, 0x20u);
          }

          int v29 = 0;
          id v46 = 0;
        }
        id v16 = v26;
LABEL_25:
        id v12 = v42;

        if (!v29) {
          goto LABEL_28;
        }
        ++v17;
        v18 = v16;
      }
      while (v43 != v17);
      uint64_t v43 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v43);
  }
LABEL_28:

  CCSetError(a8, v16);

  return v46;
}

+ (void)_filenameFromDate:(int)a1 set:(NSObject *)a2 format:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "Unexpected format: %u", (uint8_t *)v2, 8u);
}

+ (void)_filenameFromDate:(uint64_t)a1 set:(NSObject *)a2 format:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "Unexpected set: %@", (uint8_t *)&v5, 0xCu);
}

@end