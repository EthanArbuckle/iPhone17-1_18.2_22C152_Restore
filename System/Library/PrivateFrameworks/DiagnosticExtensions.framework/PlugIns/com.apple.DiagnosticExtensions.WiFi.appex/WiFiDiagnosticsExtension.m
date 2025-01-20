@interface WiFiDiagnosticsExtension
- (id)__attachmentsForAirPlayWithParameters:(id)a3;
- (id)__attachmentsForFBAWithParameters:(id)a3;
- (id)__attachmentsForSymptomsDiagWithParameters:(id)a3;
- (id)__attachmentsForTTRWithParameters:(id)a3;
- (id)__attachmentsForWiFiDEWithParameters:(id)a3;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation WiFiDiagnosticsExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)__attachmentsForSymptomsDiagWithParameters:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableString stringWithUTF8String:"symptomsd"];
  v5 = [v3 objectForKeyedSubscript:@"trigger"];

  if (v5) {
    [v4 appendFormat:@".%@", v5];
  }
  v6 = +[NSMutableArray array];
  v7 = [sub_100001FB4() sharedClient];
  if (v7)
  {
    id v8 = sub_1000020C4();
    CFStringRef v17 = @"Reason";
    v18 = v4;
    v9 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v10 = [v8 requestWithItemID:82 configuration:v9];
    v19 = v10;
    v11 = +[NSArray arrayWithObjects:&v19 count:1];
    id v16 = 0;
    v12 = [v7 collectLogs:v11 configuration:0 update:0 receipts:0 error:&v16];
    id v13 = v16;

    if (v12)
    {
      v14 = +[DEAttachmentItem attachmentWithPathURL:v12];
      [v6 addObject:v14];
    }
  }

  return v6;
}

- (id)__attachmentsForAirPlayWithParameters:(id)a3
{
  id v3 = a3;
  id v69 = +[NSMutableArray array];
  v4 = [sub_100001FB4() sharedClient];
  if (v4)
  {
    v5 = [v3 objectForKeyedSubscript:@"uuid"];
    if (v5)
    {
      id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:v5];

      if (!v6)
      {

        v5 = 0;
      }
    }
    v7 = [v3 objectForKeyedSubscript:@"DEExtensionHostAppKey"];
    id v8 = [v3 objectForKeyedSubscript:@"trigger"];
    v9 = v8;
    v68 = v8;
    if (v5)
    {
      if ([v8 isEqualToString:@"pre"])
      {
        id v63 = v3;
        v10 = [v5 substringToIndex:5];
        v67 = v7;
        uint64_t v65 = +[NSString stringWithFormat:@"%@.%@[%@]", v7, v9, v10];

        id v11 = sub_1000020C4();
        CFStringRef v96 = @"Reason";
        uint64_t v97 = v65;
        v62 = +[NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
        v12 = [v11 requestWithItemID:21 configuration:v62];
        v98[0] = v12;
        id v13 = [sub_1000020C4() requestWithItemID:39 configuration:0];
        v98[1] = v13;
        v64 = v4;
        id v14 = sub_1000020C4();
        CFStringRef v94 = @"UUID";
        v95 = v5;
        v15 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
        id v16 = [v14 requestWithItemID:24 configuration:v15];
        v98[2] = v16;
        CFStringRef v17 = [sub_1000020C4() requestWithItemID:45 configuration:0];
        v98[3] = v17;
        v18 = [sub_1000020C4() requestWithItemID:46 configuration:0];
        v98[4] = v18;
        v19 = [sub_1000020C4() requestWithItemID:47 configuration:0];
        v98[5] = v19;
        v20 = [sub_1000020C4() requestWithItemID:44 configuration:0];
        v98[6] = v20;
        v21 = +[NSArray arrayWithObjects:v98 count:7];

        v22 = (void *)v65;
        v4 = v64;

        CFStringRef v92 = @"Reason";
        uint64_t v93 = v65;
        v23 = +[NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
        v24 = [v64 collectLogs:v21 configuration:v23 update:0 receipts:0 error:0];

        if (v24)
        {
          v25 = +[DEAttachmentItem attachmentWithPathURL:v24];
          [v69 addObject:v25];
        }
        id v3 = v63;
LABEL_10:
        v7 = v67;
        goto LABEL_25;
      }
      if ([v9 isEqualToString:@"abort"])
      {
        id v26 = sub_1000020C4();
        CFStringRef v89 = @"UUID";
        v90 = v5;
        v27 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
        v28 = [v26 requestWithItemID:25 configuration:v27];
        v91 = v28;
        v22 = +[NSArray arrayWithObjects:&v91 count:1];

        v21 = [v4 collectLogs:v22 configuration:0 update:0 receipts:0 error:0];
        if (!v21)
        {
LABEL_26:

          goto LABEL_27;
        }
        v24 = +[DEAttachmentItem attachmentWithPathURL:v21];
        [v69 addObject:v24];
LABEL_25:

        goto LABEL_26;
      }
      if ([v9 isEqualToString:@"post"])
      {
        v29 = [v5 substringToIndex:5];
        v67 = v7;
        uint64_t v30 = +[NSString stringWithFormat:@"%@.%@[%@]", v7, v9, v29];

        v21 = +[NSMutableArray array];
        id v31 = sub_1000020C4();
        CFStringRef v87 = @"UUID";
        v88 = v5;
        v32 = +[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
        v33 = [v31 requestWithItemID:25 configuration:v32];
        [v21 addObject:v33];

        id v34 = sub_1000020C4();
        CFStringRef v85 = @"Reason";
        uint64_t v86 = v30;
        v35 = +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
        v36 = [v34 requestWithItemID:82 configuration:v35];
        [v21 addObject:v36];

        id v37 = sub_1000020C4();
        CFStringRef v83 = @"IncludeMatching";
        v38 = [v5 substringToIndex:5];
        v39 = +[NSRegularExpression escapedPatternForString:v38];
        v84 = v39;
        v40 = +[NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        v41 = [v37 requestWithItemID:70 configuration:v40];
        [v21 addObject:v41];

        v22 = (void *)v30;
        v81[0] = @"Compress";
        v81[1] = @"Reason";
        v82[0] = &__kCFBooleanTrue;
        v82[1] = v30;
        v42 = +[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:2];
        v24 = [v4 collectLogs:v21 configuration:v42 update:0 receipts:0 error:0];

        if (v24)
        {
          v43 = +[DEAttachmentItem attachmentWithPathURL:v24];
          [v69 addObject:v43];
        }
        goto LABEL_10;
      }
    }
    if ([v9 isEqualToString:@"datapath"])
    {
      uint64_t v44 = +[NSString stringWithFormat:@"%@.%@", v7, v9];
      v45 = [sub_1000020C4() requestWithItemID:72 configuration:0];
      v80 = v45;
      v46 = +[NSArray arrayWithObjects:&v80 count:1];
      v78[0] = @"Compress";
      v78[1] = @"Reason";
      v79[0] = &__kCFBooleanTrue;
      v79[1] = v44;
      v47 = (void *)v44;
      v48 = v79;
      v49 = v78;
    }
    else
    {
      unsigned int v50 = [v9 isEqualToString:@"abc"];
      uint64_t v51 = +[NSString stringWithFormat:@"%@.%@", v7, v9];
      id v52 = sub_1000020C4();
      v53 = v52;
      if (v50)
      {
        CFStringRef v75 = @"Reason";
        uint64_t v76 = v51;
        v54 = +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
        v55 = [v53 requestWithItemID:82 configuration:v54];
        v77 = v55;
        uint64_t v56 = +[NSArray arrayWithObjects:&v77 count:1];
        uint64_t v57 = v51;
        v58 = (void *)v56;
        v73[0] = @"Compress";
        v73[1] = @"Reason";
        v74[0] = &__kCFBooleanTrue;
        v74[1] = v57;
        v66 = (void *)v57;
        v59 = +[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:2];
        v21 = [v4 collectLogs:v58 configuration:v59 update:0 receipts:0 error:0];

        if (!v21)
        {
          v22 = v66;
          goto LABEL_26;
        }
        v24 = +[DEAttachmentItem attachmentWithPathURL:v21];
        [v69 addObject:v24];
        v22 = v66;
        goto LABEL_25;
      }
      v45 = [v52 requestWithItemID:60 configuration:0];
      v72 = v45;
      v46 = +[NSArray arrayWithObjects:&v72 count:1];
      v70[0] = @"Compress";
      v70[1] = @"Reason";
      v71[0] = &__kCFBooleanTrue;
      v71[1] = v51;
      v47 = (void *)v51;
      v48 = v71;
      v49 = v70;
    }
    v60 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v49 count:2];
    v21 = [v4 collectLogs:v46 configuration:v60 update:0 receipts:0 error:0];

    if (!v21)
    {
      v22 = v47;
      goto LABEL_26;
    }
    v24 = +[DEAttachmentItem attachmentWithPathURL:v21];
    [v69 addObject:v24];
    v22 = v47;
    goto LABEL_25;
  }
LABEL_27:

  return v69;
}

- (id)__attachmentsForFBAWithParameters:(id)a3
{
  id v3 = +[NSMutableArray array];
  v4 = [sub_100001FB4() sharedClient];
  if (v4)
  {
    v5 = [sub_1000020C4() requestWithItemID:59 configuration:0];
    v12 = v5;
    id v6 = +[NSArray arrayWithObjects:&v12 count:1];
    id v11 = 0;
    v7 = [v4 collectLogs:v6 configuration:&off_1000044B0 update:0 receipts:0 error:&v11];
    id v8 = v11;

    if (v7)
    {
      v9 = +[DEAttachmentItem attachmentWithPathURL:v7];
      [v3 addObject:v9];
    }
  }

  return v3;
}

- (id)__attachmentsForTTRWithParameters:(id)a3
{
  id v3 = +[NSMutableArray array];
  v4 = [sub_100001FB4() sharedClient];
  if (v4)
  {
    v5 = [sub_1000020C4() requestWithItemID:60 configuration:0];
    id v13 = v5;
    id v6 = +[NSArray arrayWithObjects:&v13 count:1];
    id v12 = 0;
    v7 = [v4 collectLogs:v6 configuration:&off_1000044D8 update:0 receipts:0 error:&v12];
    id v8 = v12;

    if (v7)
    {
      v9 = [v7 path];
      v10 = +[DEAttachmentItem attachmentWithPath:v9];

      [v3 addObject:v10];
    }
  }
  return v3;
}

- (id)__attachmentsForWiFiDEWithParameters:(id)a3
{
  id v3 = +[NSMutableArray array];
  v4 = [sub_100001FB4() sharedClient];
  if (v4)
  {
    v5 = [sub_1000020C4() requestWithItemID:55 configuration:0];
    id v13 = v5;
    id v6 = +[NSArray arrayWithObjects:&v13 count:1];
    id v12 = 0;
    v7 = [v4 collectLogs:v6 configuration:&off_100004500 update:0 receipts:0 error:&v12];
    id v8 = v12;

    if (v7)
    {
      v9 = [v7 path];
      v10 = +[DEAttachmentItem attachmentWithPath:v9];

      [v3 addObject:v10];
    }
  }
  return v3;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "WiFi DE: params=%@", (uint8_t *)&v13, 0xCu);
  }
  v5 = [v4 objectForKeyedSubscript:@"DEExtensionHostAppKey"];
  if ([v5 isEqualToString:@"com.apple.symptomsd"])
  {
    uint64_t v6 = [(WiFiDiagnosticsExtension *)self __attachmentsForSymptomsDiagWithParameters:v4];
  }
  else
  {
    v7 = [v5 lowercaseString];
    unsigned int v8 = [v7 hasPrefix:@"airplay"];

    if (v8)
    {
      uint64_t v6 = [(WiFiDiagnosticsExtension *)self __attachmentsForAirPlayWithParameters:v4];
    }
    else if ([v5 isEqualToString:@"Feedback Assistant"])
    {
      uint64_t v6 = [(WiFiDiagnosticsExtension *)self __attachmentsForFBAWithParameters:v4];
    }
    else
    {
      v9 = [v5 lowercaseString];
      unsigned int v10 = [v9 hasPrefix:@"com.apple.taptoradar"];

      if (v10) {
        [(WiFiDiagnosticsExtension *)self __attachmentsForTTRWithParameters:v4];
      }
      else {
      uint64_t v6 = [(WiFiDiagnosticsExtension *)self __attachmentsForWiFiDEWithParameters:v4];
      }
    }
  }
  id v11 = (void *)v6;

  return v11;
}

@end