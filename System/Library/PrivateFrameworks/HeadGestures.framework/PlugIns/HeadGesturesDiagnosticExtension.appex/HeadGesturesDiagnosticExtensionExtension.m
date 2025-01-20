@interface HeadGesturesDiagnosticExtensionExtension
- (BOOL)createZipArchiveForURL:(id)a3 destinationURL:(id)a4;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)generateTimeStamp;
@end

@implementation HeadGesturesDiagnosticExtensionExtension

- (BOOL)createZipArchiveForURL:(id)a3 destinationURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (BOMCopierNew())
  {
    id v7 = [objc_alloc((Class)NSOutputStream) initWithURL:v6 append:1];
    [v7 open];
    v22[0] = @"createPKZip";
    v22[1] = @"outputStream";
    v23[0] = &__kCFBooleanTrue;
    v23[1] = v7;
    v8 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    v9 = _HGObjCLoggingFacility((uint64_t)kHGObjCLogCategoryDE);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v5 absoluteString];
      id v11 = [v10 UTF8String];
      id v12 = [v6 absoluteString];
      int v18 = 136315394;
      id v19 = v11;
      __int16 v20 = 2080;
      id v21 = [v12 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "zipping %s to %s", (uint8_t *)&v18, 0x16u);
    }
    id v13 = [v5 path];
    [v13 fileSystemRepresentation];
    int v14 = BOMCopierCopyWithOptions();
    BOOL v15 = v14 == 0;

    if (v14)
    {
      v16 = _HGObjCLoggingFacility((uint64_t)kHGObjCLogCategoryDE);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10000316C(v16);
      }
    }
    else
    {
      BOMCopierFree();
    }
  }
  else
  {
    v8 = _HGObjCLoggingFacility((uint64_t)kHGObjCLogCategoryDE);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100003128(v8);
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (id)generateTimeStamp
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  [v2 setDateFormat:@"yyyyMMdd-HHmmss"];
  id v3 = objc_alloc_init((Class)NSDate);
  v4 = [v2 stringFromDate:v3];

  return v4;
}

- (id)attachmentList
{
  id v3 = objc_opt_new();
  v4 = +[NSFileManager defaultManager];
  uint64_t v5 = [(HeadGesturesDiagnosticExtensionExtension *)self generateTimeStamp];
  v49 = v4;
  v47 = (void *)v5;
  if (![v4 fileExistsAtPath:@"/var/tmp/HeadGestures/RawData"])
  {
    v48 = 0;
    goto LABEL_12;
  }
  id v6 = +[NSString stringWithFormat:@"HeadGestures_RawDataArchive_%@.zip", v5];
  id v7 = [@"/var/tmp/HeadGestures" stringByAppendingPathComponent:v6];
  v8 = +[NSURL fileURLWithPath:@"/var/tmp/HeadGestures/RawData"];
  v9 = +[NSURL fileURLWithPath:v7];
  unsigned __int8 v10 = [(HeadGesturesDiagnosticExtensionExtension *)self createZipArchiveForURL:v8 destinationURL:v9];

  if (v10)
  {
    id v61 = 0;
    [v4 removeItemAtPath:@"/var/tmp/HeadGestures/RawData" error:&v61];
    v48 = v61;
    if (!v48)
    {
      v48 = 0;
      uint64_t v5 = (uint64_t)v47;
      goto LABEL_11;
    }
    id v11 = _HGObjCLoggingFacility((uint64_t)kHGObjCLogCategoryDE);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000032D8(v48, v6);
    }
  }
  else
  {
    id v11 = _HGObjCLoggingFacility((uint64_t)kHGObjCLogCategoryDE);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100003258(v6);
    }
    v48 = 0;
  }
  uint64_t v5 = (uint64_t)v47;

LABEL_11:
LABEL_12:
  if ([v4 fileExistsAtPath:@"/var/mobile/tmp/HeadGestures/RawData"])
  {
    id v12 = +[NSString stringWithFormat:@"HeadGestures_RawDataArchive_mobile_%@.zip", v5];
    id v13 = [@"/var/mobile/tmp/HeadGestures/" stringByAppendingPathComponent:v12];
    int v14 = +[NSURL fileURLWithPath:@"/var/mobile/tmp/HeadGestures/RawData"];
    BOOL v15 = +[NSURL fileURLWithPath:v13];
    unsigned __int8 v16 = [(HeadGesturesDiagnosticExtensionExtension *)self createZipArchiveForURL:v14 destinationURL:v15];

    if (v16)
    {
      v17 = v48;
      v60 = v48;
      [v4 removeItemAtPath:@"/var/mobile/tmp/HeadGestures/RawData" error:&v60];
      int v18 = v60;
    }
    else
    {
      v17 = _HGObjCLoggingFacility((uint64_t)kHGObjCLogCategoryDE);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100003258(v12);
      }
      int v18 = v48;
    }

    if (v18)
    {
      id v19 = _HGObjCLoggingFacility((uint64_t)kHGObjCLogCategoryDE);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000031B0(v18, v12);
      }
    }
    v48 = v18;
  }
  __int16 v20 = +[NSRegularExpression regularExpressionWithPattern:@"HeadGestures_RawDataArchive*" options:1 error:0];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v67[0] = @"/var/tmp/HeadGestures";
  v67[1] = @"/var/mobile/tmp/HeadGestures/";
  id v21 = +[NSArray arrayWithObjects:v67 count:2];
  id v22 = [v21 countByEnumeratingWithState:&v56 objects:v68 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v57;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v57 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = +[NSURL fileURLWithPath:*(void *)(*((void *)&v56 + 1) + 8 * i)];
        v27 = [(HeadGesturesDiagnosticExtensionExtension *)self filesInDir:v26 matchingPattern:v20 excludingPattern:0];

        [v3 addObjectsFromArray:v27];
      }
      id v23 = [v21 countByEnumeratingWithState:&v56 objects:v68 count:16];
    }
    while (v23);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v28 = v3;
  id v29 = [v28 countByEnumeratingWithState:&v52 objects:v66 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v53;
    v32 = &BOMCopierCopyWithOptions_ptr;
    v33 = &__kCFBooleanTrue;
    v34 = (uint64_t *)&kHGObjCLogCategoryDE;
    uint64_t v50 = *(void *)v53;
    do
    {
      v35 = 0;
      id v51 = v30;
      do
      {
        if (*(void *)v53 != v31) {
          objc_enumerationMutation(v28);
        }
        v36 = *(void **)(*((void *)&v52 + 1) + 8 * (void)v35);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v37 = v36;
          [v37 setDeleteOnAttach:v33];
          v38 = _HGObjCLoggingFacility(*v34);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            [v37 displayName];
            v40 = id v39 = v28;
            [v37 filesize];
            v41 = v34;
            v42 = v20;
            v43 = v32;
            v45 = v44 = v33;
            *(_DWORD *)buf = 138412546;
            v63 = v40;
            __int16 v64 = 2112;
            v65 = v45;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "attachment %@ file size %@", buf, 0x16u);

            v33 = v44;
            v32 = v43;
            __int16 v20 = v42;
            v34 = v41;

            id v28 = v39;
            uint64_t v31 = v50;
            id v30 = v51;
          }
        }
        v35 = (char *)v35 + 1;
      }
      while (v30 != v35);
      id v30 = [v28 countByEnumeratingWithState:&v52 objects:v66 count:16];
    }
    while (v30);
  }

  return v28;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _HGObjCLoggingFacility((uint64_t)kHGObjCLogCategoryDE);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received attachment request: %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [v4 objectForKeyedSubscript:@"DEExtensionAttachmentsParamConsentProvidedKey"];
  if ([v6 BOOLValue])
  {
    id v7 = [(HeadGesturesDiagnosticExtensionExtension *)self attachmentList];
  }
  else
  {
    id v7 = &__NSArray0__struct;
  }

  return v7;
}

@end