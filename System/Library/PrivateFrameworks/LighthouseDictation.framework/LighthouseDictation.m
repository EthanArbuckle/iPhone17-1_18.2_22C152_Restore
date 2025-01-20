id RecordDirPathForRecordType(void *a1)
{
  void *v1;
  void *v2;
  uint64_t vars8;

  v1 = RecordDirURLForRecordType(a1);
  v2 = [v1 path];

  return v2;
}

id RecordDirURLForRecordType(void *a1)
{
  v1 = NSURL;
  id v2 = a1;
  v3 = [v1 fileURLWithPath:@"/var/mobile/Library/DES/Records" isDirectory:1];
  v4 = [v3 URLByAppendingPathComponent:v2 isDirectory:1];

  return v4;
}

id DESAmendedRecordInfo(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a1;
  size_t v22 = 256;
  id v6 = a3;
  id v7 = a2;
  v8 = 0;
  if (!sysctlbyname("kern.osversion", v23, &v22, 0, 0))
  {
    v8 = [NSString stringWithUTF8String:v23];
  }
  v9 = DESGetDeviceType();
  int v10 = [v6 length];
  if (v10 <= 4) {
    int v11 = 4;
  }
  else {
    int v11 = v10;
  }
  v12 = [v6 substringFromIndex:(v11 - 4)];

  if ([v12 length]
    && ((int v13 = [v12 length], v13 <= 1) ? (v14 = 1) : (v14 = v13),
        uint64_t v15 = (char)[v12 characterAtIndex:(v14 - 1)] - 48,
        v15 <= 3))
  {
    v16 = off_2653B3860[v15];
  }
  else
  {
    v16 = @"train";
  }
  v17 = [MEMORY[0x263EFF9A0] dictionary];
  [v17 setValue:v8 forKey:@"$device_os"];
  [v17 setValue:v9 forKey:@"$device_type"];
  [v17 setValue:v12 forKey:@"$dodml_device_identifier"];
  [v17 setValue:v16 forKey:@"$dodml_dataset"];
  [v17 setValue:v7 forKey:@"$record_type"];
  v18 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v19 = [NSString stringWithFormat:@"InfoKeys-%@", v7];

  v20 = [v18 dictionaryForKey:v19];
  if (v20) {
    [v17 addEntriesFromDictionary:v20];
  }
  [v17 addEntriesFromDictionary:v5];

  return v17;
}

void GarbageCollectOldRecords(void *a1)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = RecordDirPathForRecordType(v1);
  id v3 = objc_alloc_init(MEMORY[0x263F08850]);
  id v62 = 0;
  v4 = [v3 contentsOfDirectoryAtPath:v2 error:&v62];
  id v5 = v62;
  id v6 = v5;
  if (v4)
  {
    id v42 = v1;
    v43 = v2;
    [v3 changeCurrentDirectoryPath:v2];
    id v7 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global];
    v41 = v4;
    v8 = [v4 filteredArrayUsingPredicate:v7];

    id v45 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v9 = [MEMORY[0x263EFF8F0] currentCalendar];
    int v10 = [MEMORY[0x263EFF910] date];
    int v11 = [v9 dateByAddingUnit:16 value:-28 toDate:v10 options:0];

    id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    obuint64_t j = v8;
    uint64_t v12 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v59;
      uint64_t v15 = *MEMORY[0x263F08008];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          v17 = v6;
          if (*(void *)v59 != v14) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          id v57 = v6;
          v19 = [v3 attributesOfItemAtPath:v18 error:&v57];
          id v6 = v57;

          v20 = [v19 objectForKey:v15];

          if (v20)
          {
            if ([v20 compare:v11] == -1)
            {
              v21 = [v18 stringByDeletingPathExtension];
              [v45 addObject:v21];
            }
            else
            {
              [v44 addObject:v20];
            }
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
      }
      while (v13);
    }

    if ((unint64_t)[v44 count] < 0x14)
    {
      v46 = v11;
    }
    else
    {
      [v44 sortUsingComparator:&__block_literal_global_40];
      v46 = [v44 objectAtIndex:19];

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      size_t v22 = [v3 contentsOfDirectoryAtPath:v43 error:0];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v64 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v54;
        uint64_t v26 = *MEMORY[0x263F08008];
        do
        {
          uint64_t v27 = 0;
          v28 = v6;
          do
          {
            if (*(void *)v54 != v25) {
              objc_enumerationMutation(v22);
            }
            v29 = *(void **)(*((void *)&v53 + 1) + 8 * v27);
            id v52 = v28;
            v30 = [v3 attributesOfItemAtPath:v29 error:&v52];
            id v6 = v52;

            v31 = [v30 objectForKey:v26];

            if ([v31 compare:v46] == -1)
            {
              v32 = [v29 stringByDeletingPathExtension];
              [v45 addObject:v32];
            }
            ++v27;
            v28 = v6;
          }
          while (v24 != v27);
          uint64_t v24 = [v22 countByEnumeratingWithState:&v53 objects:v64 count:16];
        }
        while (v24);
      }
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v33 = v45;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v48 objects:v63 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = 0;
      uint64_t v37 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v49 != v37) {
            objc_enumerationMutation(v33);
          }
          v39 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          uint64_t v40 = v36 + DeleteFileWithBasePath(v3, v39, @"json");
          uint64_t v36 = v40 + DeleteFileWithBasePath(v3, v39, @"desdata");
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v48 objects:v63 count:16];
      }
      while (v35);
    }
    else
    {
      uint64_t v36 = 0;
    }

    id v1 = v42;
    NSLog(&cfstr_FoundLuRecordS.isa, [v33 count], v36, v42);

    id v2 = v43;
    v4 = v41;
  }
  else if ([v5 code] != 260)
  {
    NSLog(&cfstr_CouldnTReadOld.isa, v6);
  }
}

uint64_t __GarbageCollectOldRecords_block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 pathExtension];
  if ([v2 isEqualToString:@"json"]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isEqualToString:@"desdata"];
  }

  return v3;
}

uint64_t __GarbageCollectOldRecords_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t DeleteFileWithBasePath(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = [a2 stringByAppendingPathExtension:a3];
  id v11 = 0;
  uint64_t v7 = objc_msgSend(v5, "_fides_removeItemAtPath:error:", v6, &v11);

  id v8 = v11;
  v9 = v8;
  if (v7) {
    NSLog(&cfstr_GarbageCollect.isa, v6);
  }
  else {
    NSLog(&cfstr_CouldNotGarbag.isa, v6, v8);
  }

  return v7;
}

BOOL AddRecordsForTypeWithUUIDs(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v34 = a1;
  id v9 = a2;
  id v33 = a3;
  id v32 = a4;
  if (a5) {
    *a5 = 0;
  }
  int v10 = RecordDirPathForRecordType(v34);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v9;
  uint64_t v36 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v36)
  {
    uint64_t v11 = *(void *)v38;
    uint64_t v12 = @"json";
    unint64_t v13 = 0x263EFF000uLL;
    v31 = a5;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v16 = [v15 UUIDString];
        v17 = [v10 stringByAppendingPathComponent:v16];
        v18 = [v17 stringByAppendingPathExtension:v12];

        v19 = (void *)[objc_alloc(*(Class *)(v13 + 2296)) initWithContentsOfFile:v18 options:1 error:a5];
        if (v19)
        {
          v20 = [MEMORY[0x263F08900] JSONObjectWithData:v19 options:0 error:a5];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            DESAmendedRecordInfo(v20, v34, v32);
            unint64_t v21 = v13;
            uint64_t v22 = v11;
            uint64_t v23 = v10;
            v25 = uint64_t v24 = v12;

            [v33 setObject:v25 forKey:v15];
            v20 = (void *)v25;
            uint64_t v12 = v24;
            int v10 = v23;
            uint64_t v11 = v22;
            unint64_t v13 = v21;
            a5 = v31;
          }
          else
          {
            if (a5) {
              uint64_t v27 = *a5;
            }
            else {
              uint64_t v27 = 0;
            }
            NSLog(&cfstr_SkippingUnpars.isa, v18, v27);
          }
        }
        else
        {
          if (a5) {
            uint64_t v26 = *a5;
          }
          else {
            uint64_t v26 = 0;
          }
          NSLog(&cfstr_SkippingUnread.isa, v18, v26);
        }
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v36);
  }

  uint64_t v28 = [obj count];
  BOOL v29 = !a5 || v28 || !*a5;

  return v29;
}

id AddRecordsForType(void *a1, void *a2, void *a3, id *a4)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v39 = a2;
  id v38 = a3;
  GarbageCollectOldRecords(v7);
  if (a4) {
    *a4 = 0;
  }
  id v40 = v7;
  uint64_t v8 = RecordDirPathForRecordType(v7);
  NSLog(&cfstr_SearchingInPat.isa, v8);
  id v9 = objc_alloc_init(MEMORY[0x263F08850]);
  int v10 = [v9 enumeratorAtPath:v8];
  uint64_t v35 = v9;
  uint64_t v36 = (void *)v8;
  id v34 = [v9 contentsOfDirectoryAtPath:v8 error:a4];
  uint64_t v11 = [v34 description];
  uint64_t v12 = NSUserName();
  NSLog(&cfstr_FoundAtLocatio.isa, v11, v12);

  long long v37 = a4;
  unint64_t v13 = [*a4 localizedDescription];
  NSLog(&cfstr_FailedToFindAn.isa, v13);

  id v41 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v43 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        NSLog(&cfstr_FoundPath.isa, v19);
        [v14 skipDescendants];
        v20 = [v19 pathExtension];
        int v21 = [v20 isEqualToString:@"json"];

        if (v21)
        {
          id v22 = objc_alloc(MEMORY[0x263F08C38]);
          uint64_t v23 = [v19 stringByDeletingPathExtension];
          uint64_t v24 = (void *)[v22 initWithUUIDString:v23];

          if (v24) {
            [v41 addObject:v24];
          }
          else {
            NSLog(&cfstr_SkippingBadRec.isa, v19);
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v16);
  }

  uint64_t v25 = v41;
  if ([v41 count])
  {
    uint64_t v27 = v39;
    uint64_t v26 = v40;
    uint64_t v28 = v37;
    BOOL v29 = v38;
  }
  else
  {
    uint64_t v28 = v37;
    BOOL v29 = v38;
    uint64_t v27 = v39;
    uint64_t v26 = v40;
    if (*v37)
    {

      uint64_t v25 = 0;
    }
  }

  NSLog(&cfstr_FoundURecordUu.isa, [v25 count]);
  if (v25 && AddRecordsForTypeWithUUIDs(v26, v25, v27, v29, v28))
  {
    v30 = (void *)MEMORY[0x263EFFA08];
    v31 = [v27 allKeys];
    id v32 = [v30 setWithArray:v31];
  }
  else
  {
    id v32 = 0;
  }

  return v32;
}

id FindRecordTypeForRecordUUID(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  uint64_t v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __FindRecordTypeForRecordUUID_block_invoke;
  v8[3] = &unk_2653B3818;
  id v5 = v4;
  id v9 = v5;
  int v10 = &v11;
  [v3 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_254EAE354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __FindRecordTypeForRecordUUID_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 containsObject:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

id RecordDataForUUID(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = RecordDirPathForRecordType(a1);
  id v7 = [v5 UUIDString];

  id v8 = [v6 stringByAppendingPathComponent:v7];
  id v9 = [v8 stringByAppendingPathExtension:@"desdata"];

  int v10 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v9 options:1 error:a3];
  return v10;
}

id RecordInfoForUUID(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = RecordDirPathForRecordType(a1);
  id v7 = [v5 UUIDString];

  id v8 = [v6 stringByAppendingPathComponent:v7];
  id v9 = [v8 stringByAppendingPathExtension:@"json"];

  id v18 = 0;
  int v10 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v9 options:1 error:&v18];
  id v11 = v18;
  uint64_t v12 = v11;
  if (v10)
  {
    id v17 = v11;
    uint64_t v13 = [MEMORY[0x263F08900] JSONObjectWithData:v10 options:0 error:&v17];
    id v14 = v17;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v13;
    }
    else
    {
      NSLog(&cfstr_UnparsableReco.isa, v9, v14);
      id v15 = 0;
      if (a3) {
        *a3 = v14;
      }
    }
  }
  else
  {
    NSLog(&cfstr_UnreadableReco.isa, v9, v11);
    if (a3)
    {
      id v14 = v12;
      id v15 = 0;
      *a3 = v14;
    }
    else
    {
      id v15 = 0;
      id v14 = v12;
    }
  }

  return v15;
}

void sub_254EB02BC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(a1);
    id v3 = (os_log_t *)MEMORY[0x263F28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28368], OS_LOG_TYPE_ERROR)) {
      -[LoggingHelper _decodingMetricsFromMetricsDict:]();
    }
    id v4 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR)) {
      -[LoggingHelper _decodingMetricsFromMetricsDict:](v4, v5, v6, v7, v8, v9, v10, v11);
    }

    objc_end_catch();
    JUMPOUT(0x254EB0248);
  }
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t DESGetDeviceType()
{
  return MEMORY[0x270F264C8]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x270EF2C70]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}