void sub_1000042B4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a64;
  uint64_t a65;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;

  if (a2 == 1)
  {
    v65 = objc_begin_catch(a1);
    v68 = [v65 reason];
    NSLog(@"Bad audioPredicate: %@");

    if (a10)
    {
      v69 = [v65 reason];
      v66 = +[NSString stringWithFormat:@"Bad audioPredicate: %@"];

      a64 = (uint64_t)NSLocalizedDescriptionKey;
      a65 = (uint64_t)v66;
      v67 = +[NSDictionary dictionaryWithObjects:&a65 forKeys:&a64 count:1];
      *a10 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1501 userInfo:v67];
    }
    objc_end_catch();
    JUMPOUT(0x100004238);
  }
  _Unwind_Resume(a1);
}

void sub_100004AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a67, 8);
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

void sub_100005AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
}

void sub_1000061D4(void *a1)
{
}

void sub_1000061E4(_Unwind_Exception *a1)
{
}

id RecordDirPathForRecordType(void *a1)
{
  v1 = RecordDirURLForRecordType(a1);
  v2 = [v1 path];

  return v2;
}

id RecordDirURLForRecordType(void *a1)
{
  id v1 = a1;
  v2 = +[NSURL fileURLWithPath:@"/var/mobile/Library/DES/Records" isDirectory:1];
  v3 = [v2 URLByAppendingPathComponent:v1 isDirectory:1];

  return v3;
}

id DESAmendedRecordInfo(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  size_t v22 = 256;
  id v6 = a3;
  id v7 = a2;
  v8 = 0;
  if (!sysctlbyname("kern.osversion", v23, &v22, 0, 0))
  {
    v8 = +[NSString stringWithUTF8String:v23];
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
    CFStringRef v16 = off_1000146A8[v15];
  }
  else
  {
    CFStringRef v16 = @"train";
  }
  v17 = +[NSMutableDictionary dictionary];
  [v17 setValue:v8 forKey:@"$device_os"];
  [v17 setValue:v9 forKey:@"$device_type"];
  [v17 setValue:v12 forKey:@"$dodml_device_identifier"];
  [v17 setValue:v16 forKey:@"$dodml_dataset"];
  [v17 setValue:v7 forKey:@"$record_type"];
  v18 = +[NSUserDefaults standardUserDefaults];
  v19 = +[NSString stringWithFormat:@"InfoKeys-%@", v7];

  v20 = [v18 dictionaryForKey:v19];
  if (v20) {
    [v17 addEntriesFromDictionary:v20];
  }
  [v17 addEntriesFromDictionary:v5];

  return v17;
}

void GarbageCollectOldRecords(void *a1)
{
  id v1 = a1;
  v2 = RecordDirPathForRecordType(v1);
  id v3 = objc_alloc_init((Class)NSFileManager);
  id v60 = 0;
  v4 = [v3 contentsOfDirectoryAtPath:v2 error:&v60];
  id v5 = v60;
  id v6 = v5;
  if (v4)
  {
    id v40 = v1;
    v41 = v2;
    [v3 changeCurrentDirectoryPath:v2];
    id v7 = +[NSPredicate predicateWithBlock:&__block_literal_global];
    v39 = v4;
    v8 = [v4 filteredArrayUsingPredicate:v7];

    id v43 = objc_alloc_init((Class)NSMutableSet);
    v9 = +[NSCalendar currentCalendar];
    int v10 = +[NSDate date];
    int v11 = [v9 dateByAddingUnit:16 value:-28 toDate:v10 options:0];

    id v42 = objc_alloc_init((Class)NSMutableArray);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = v8;
    id v12 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v57;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          CFStringRef v16 = v6;
          if (*(void *)v57 != v14) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          id v55 = v6;
          v18 = [v3 attributesOfItemAtPath:v17 error:&v55];
          id v6 = v55;

          v19 = [v18 objectForKey:NSFileCreationDate];

          if (v19)
          {
            if ([v19 compare:v11] == (id)-1)
            {
              v20 = [v17 stringByDeletingPathExtension];
              [v43 addObject:v20];
            }
            else
            {
              [v42 addObject:v19];
            }
          }
        }
        id v13 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
      }
      while (v13);
    }

    if ((unint64_t)[v42 count] < 0x14)
    {
      v44 = v11;
    }
    else
    {
      [v42 sortUsingComparator:&__block_literal_global_40];
      v44 = [v42 objectAtIndex:19];

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v21 = [v3 contentsOfDirectoryAtPath:v41 error:0];
      id v22 = [v21 countByEnumeratingWithState:&v51 objects:v62 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v52;
        do
        {
          v25 = 0;
          v26 = v6;
          do
          {
            if (*(void *)v52 != v24) {
              objc_enumerationMutation(v21);
            }
            v27 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v25);
            id v50 = v26;
            v28 = [v3 attributesOfItemAtPath:v27 error:&v50];
            id v6 = v50;

            v29 = [v28 objectForKey:NSFileCreationDate];

            if ([v29 compare:v44] == (id)-1)
            {
              v30 = [v27 stringByDeletingPathExtension];
              [v43 addObject:v30];
            }
            v25 = (char *)v25 + 1;
            v26 = v6;
          }
          while (v23 != v25);
          id v23 = [v21 countByEnumeratingWithState:&v51 objects:v62 count:16];
        }
        while (v23);
      }
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v31 = v43;
    id v32 = [v31 countByEnumeratingWithState:&v46 objects:v61 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = 0;
      uint64_t v35 = *(void *)v47;
      do
      {
        for (j = 0; j != v33; j = (char *)j + 1)
        {
          if (*(void *)v47 != v35) {
            objc_enumerationMutation(v31);
          }
          v37 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
          uint64_t v38 = v34 + DeleteFileWithBasePath(v3, v37, @"json");
          uint64_t v34 = v38 + DeleteFileWithBasePath(v3, v37, @"desdata");
        }
        id v33 = [v31 countByEnumeratingWithState:&v46 objects:v61 count:16];
      }
      while (v33);
    }
    else
    {
      uint64_t v34 = 0;
    }

    id v1 = v40;
    NSLog(@"Found %lu record(s) to garbage collect and deleted %lu file(s) for %@", [v31 count], v34, v40);

    v2 = v41;
    v4 = v39;
  }
  else if ([v5 code] != (id)260)
  {
    NSLog(@"Couldn't read old DES records: %@", v6);
  }
}

id DeleteFileWithBasePath(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = [a2 stringByAppendingPathExtension:a3];
  id v11 = 0;
  id v7 = objc_msgSend(v5, "_fides_removeItemAtPath:error:", v6, &v11);

  id v8 = v11;
  v9 = v8;
  if (v7) {
    NSLog(@"Garbage collected old DES record file %@", v6);
  }
  else {
    NSLog(@"Could not garbage collect old DES record file %@: %@", v6, v8);
  }

  return v7;
}

BOOL AddRecordsForTypeWithUUIDs(void *a1, void *a2, void *a3, void *a4, void *a5)
{
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
  id obj = v9;
  id v36 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v36)
  {
    uint64_t v11 = *(void *)v38;
    CFStringRef v12 = @"json";
    id v13 = &DESGetDeviceType_ptr;
    id v31 = a5;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        CFStringRef v16 = [v15 UUIDString];
        v17 = [v10 stringByAppendingPathComponent:v16];
        v18 = [v17 stringByAppendingPathExtension:v12];

        id v19 = [objc_alloc((Class)v13[117]) initWithContentsOfFile:v18 options:1 error:a5];
        if (v19)
        {
          v20 = +[NSJSONSerialization JSONObjectWithData:v19 options:0 error:a5];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            DESAmendedRecordInfo(v20, v34, v32);
            v21 = v13;
            uint64_t v22 = v11;
            id v23 = v10;
            v25 = CFStringRef v24 = v12;

            [v33 setObject:v25 forKey:v15];
            v20 = (void *)v25;
            CFStringRef v12 = v24;
            int v10 = v23;
            uint64_t v11 = v22;
            id v13 = v21;
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
            NSLog(@"Skipping unparsable record: %@, %@", v18, v27);
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
          NSLog(@"Skipping unreadable record: %@, %@", v18, v26);
        }
      }
      id v36 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v36);
  }

  id v28 = [obj count];
  BOOL v29 = !a5 || v28 || !*a5;

  return v29;
}

id AddRecordsForType(void *a1, void *a2, void *a3, id *a4)
{
  id v7 = a1;
  id v38 = a2;
  id v37 = a3;
  GarbageCollectOldRecords(v7);
  if (a4) {
    *a4 = 0;
  }
  id v39 = v7;
  uint64_t v8 = RecordDirPathForRecordType(v7);
  NSLog(@"Searching in path %@", v8);
  id v9 = objc_alloc_init((Class)NSFileManager);
  int v10 = [v9 enumeratorAtPath:v8];
  id v34 = v9;
  uint64_t v35 = (void *)v8;
  id v33 = [v9 contentsOfDirectoryAtPath:v8 error:a4];
  uint64_t v11 = [v33 description];
  CFStringRef v12 = NSUserName();
  NSLog(@"Found at location: %@ as user %@", v11, v12);

  id v36 = a4;
  id v13 = [*a4 localizedDescription];
  NSLog(@"Failed to find anything: %@", v13);

  id v40 = objc_alloc_init((Class)NSMutableSet);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v14 = v10;
  id v15 = [v14 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v42;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        NSLog(@"Found path %@", v19);
        [v14 skipDescendants];
        v20 = [v19 pathExtension];
        unsigned int v21 = [v20 isEqualToString:@"json"];

        if (v21)
        {
          id v22 = objc_alloc((Class)NSUUID);
          id v23 = [v19 stringByDeletingPathExtension];
          id v24 = [v22 initWithUUIDString:v23];

          if (v24) {
            [v40 addObject:v24];
          }
          else {
            NSLog(@"Skipping bad record name: %@", v19);
          }
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v16);
  }

  uint64_t v25 = v40;
  if ([v40 count])
  {
    uint64_t v27 = v38;
    uint64_t v26 = v39;
    id v28 = v36;
    BOOL v29 = v37;
  }
  else
  {
    id v28 = v36;
    BOOL v29 = v37;
    uint64_t v27 = v38;
    uint64_t v26 = v39;
    if (*v36)
    {

      uint64_t v25 = 0;
    }
  }

  NSLog(@"Found %u record UUIDs", [v25 count]);
  if (v25 && AddRecordsForTypeWithUUIDs(v26, v25, v27, v29, v28))
  {
    v30 = [v27 allKeys];
    id v31 = +[NSSet setWithArray:v30];
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

id FindRecordTypeForRecordUUID(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__0;
  id v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __FindRecordTypeForRecordUUID_block_invoke;
  v7[3] = &unk_100014660;
  id v4 = a2;
  id v8 = v4;
  id v9 = &v10;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_100007F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
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

  id v10 = [objc_alloc((Class)NSData) initWithContentsOfFile:v9 options:1 error:a3];
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
  id v10 = [objc_alloc((Class)NSData) initWithContentsOfFile:v9 options:1 error:&v18];
  id v11 = v18;
  uint64_t v12 = v11;
  if (v10)
  {
    id v17 = v11;
    id v13 = +[NSJSONSerialization JSONObjectWithData:v10 options:0 error:&v17];
    id v14 = v17;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v13;
    }
    else
    {
      NSLog(@"Unparsable record: %@, %@", v9, v14);
      id v15 = 0;
      if (a3) {
        *a3 = v14;
      }
    }
  }
  else
  {
    NSLog(@"Unreadable record: %@, %@", v9, v11);
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

void sub_100009EE4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(a1);
    if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR)) {
      -[LoggingHelper _decodingMetricsFromMetricsDict:]();
    }
    id v3 = AFSiriLogContextFides;
    if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR)) {
      -[LoggingHelper _decodingMetricsFromMetricsDict:](v3, v4, v5, v6, v7, v8, v9, v10);
    }

    objc_end_catch();
    JUMPOUT(0x100009E70);
  }
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t DESGetDeviceType()
{
  return _DESGetDeviceType();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *NSUserName(void)
{
  return _NSUserName();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__invalidate(void *a1, const char *a2, ...)
{
  return [a1 _invalidate];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_alternatives(void *a1, const char *a2, ...)
{
  return [a1 alternatives];
}

id objc_msgSend_asrSelfComponentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 asrSelfComponentIdentifier];
}

id objc_msgSend_attachmentURLs(void *a1, const char *a2, ...)
{
  return [a1 attachmentURLs];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_correctedText(void *a1, const char *a2, ...)
{
  return [a1 correctedText];
}

id objc_msgSend_correctedTextV2(void *a1, const char *a2, ...)
{
  return [a1 correctedTextV2];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deploymentId(void *a1, const char *a2, ...)
{
  return [a1 deploymentId];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictationIsEnabled(void *a1, const char *a2, ...)
{
  return [a1 dictationIsEnabled];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_directoryValue(void *a1, const char *a2, ...)
{
  return [a1 directoryValue];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_experimentId(void *a1, const char *a2, ...)
{
  return [a1 experimentId];
}

id objc_msgSend_fileValue(void *a1, const char *a2, ...)
{
  return [a1 fileValue];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return [a1 language];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_logDictationPersonalizationExperimentStartedOrChanged(void *a1, const char *a2, ...)
{
  return [a1 logDictationPersonalizationExperimentStartedOrChanged];
}

id objc_msgSend_logUserEditExperimentStartedOrChanged(void *a1, const char *a2, ...)
{
  return [a1 logUserEditExperimentStartedOrChanged];
}

id objc_msgSend_modelVersion(void *a1, const char *a2, ...)
{
  return [a1 modelVersion];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nativeRecordInfo(void *a1, const char *a2, ...)
{
  return [a1 nativeRecordInfo];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_postITNRecognizedText(void *a1, const char *a2, ...)
{
  return [a1 postITNRecognizedText];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_recipeUserInfo(void *a1, const char *a2, ...)
{
  return [a1 recipeUserInfo];
}

id objc_msgSend_recognizedNbest(void *a1, const char *a2, ...)
{
  return [a1 recognizedNbest];
}

id objc_msgSend_recognizedText(void *a1, const char *a2, ...)
{
  return [a1 recognizedText];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_samplingRate(void *a1, const char *a2, ...)
{
  return [a1 samplingRate];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_sharedStream(void *a1, const char *a2, ...)
{
  return [a1 sharedStream];
}

id objc_msgSend_siriDataSharingOptInStatus(void *a1, const char *a2, ...)
{
  return [a1 siriDataSharingOptInStatus];
}

id objc_msgSend_skipDescendants(void *a1, const char *a2, ...)
{
  return [a1 skipDescendants];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return [a1 task];
}

id objc_msgSend_thermalState(void *a1, const char *a2, ...)
{
  return [a1 thermalState];
}

id objc_msgSend_treatmentId(void *a1, const char *a2, ...)
{
  return [a1 treatmentId];
}

id objc_msgSend_triClient(void *a1, const char *a2, ...)
{
  return [a1 triClient];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_xpcExitClean(void *a1, const char *a2, ...)
{
  return [a1 xpcExitClean];
}