@interface DECrashLogsExtension
- (DECrashLogsExtension)init;
- (id)_attachmentsWithDisplayName:(id)a3;
- (id)_submittableLogsWithPattern:(id)a3 excludingPattern:(id)a4 excludingPathComponents:(id)a5;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)shortname:(id)a3;
- (int64_t)cutOffSeconds;
- (void)setCutOffSeconds:(int64_t)a3;
@end

@implementation DECrashLogsExtension

- (DECrashLogsExtension)init
{
  v10.receiver = self;
  v10.super_class = (Class)DECrashLogsExtension;
  v2 = [(DECrashLogsExtension *)&v10 init];
  if (v2)
  {
    if (MGGetBoolAnswer())
    {
      v3 = +[NSUserDefaults standardUserDefaults];
      v4 = [v3 valueForKey:@"RCInternalMode"];
      if ([v4 integerValue])
      {
        v5 = +[NSUserDefaults standardUserDefaults];
        v6 = [v5 valueForKey:@"RCInternalMode"];
        id v7 = [v6 integerValue];

        if (v7 != (id)2) {
          goto LABEL_5;
        }
      }
      else
      {
      }
      uint64_t v8 = -259200;
      goto LABEL_8;
    }
LABEL_5:
    uint64_t v8 = -10800;
LABEL_8:
    v2->_cutOffSeconds = v8;
  }
  return v2;
}

- (id)attachmentList
{
  return [(DECrashLogsExtension *)self _attachmentsWithDisplayName:0];
}

- (id)attachmentsForParameters:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [v5 objectForKey:@"DEExtensionAttachmentsParamDisplayNameKey"];

  if (v7)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v8 = [v5 objectForKeyedSubscript:@"DEExtensionAttachmentsParamDisplayNameKey"];
    id v9 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v44;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v44 != v11) {
            objc_enumerationMutation(v8);
          }
          v3 = [(DECrashLogsExtension *)self _attachmentsWithDisplayName:*(void *)(*((void *)&v43 + 1) + 8 * i)];
          if (v3) {
            [v6 addObjectsFromArray:v3];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v10);
    }
  }
  v36 = v5;
  if (![v6 count])
  {
    if (!MGGetBoolAnswer())
    {
LABEL_20:
      v19 = [(DECrashLogsExtension *)self _attachmentsWithDisplayName:0];
      [v6 addObjectsFromArray:v19];

      goto LABEL_21;
    }
    id v13 = v6;
    v14 = +[NSUserDefaults standardUserDefaults];
    v15 = [v14 valueForKey:@"RCInternalMode"];
    id v16 = [v15 integerValue];
    if (v16)
    {
      v3 = +[NSUserDefaults standardUserDefaults];
      id v5 = [v3 valueForKey:@"RCInternalMode"];
      if ([v5 integerValue] != (id)2)
      {

        id v6 = v13;
        goto LABEL_20;
      }
    }
    v17 = [v36 objectForKeyedSubscript:@"DEExtensionHostAppKey"];
    unsigned __int8 v18 = [@"Feedback Assistant" isEqualToString:v17];

    if (v16)
    {
    }
    id v6 = v13;
    if (v18) {
      goto LABEL_20;
    }
  }
LABEL_21:
  id v20 = objc_alloc_init((Class)NSMutableDictionary);
  id v37 = v6;
  id v21 = [v6 mutableCopy];
  [v21 sortUsingComparator:&stru_100004190];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v21;
  id v22 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v40;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v40 != v24) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
        v27 = [v26 path];
        v28 = [v27 lastPathComponent];
        v29 = [(DECrashLogsExtension *)self shortname:v28];

        v30 = [v20 objectForKey:v29];

        if (!v30) {
          [v20 setObject:&off_100004388 forKeyedSubscript:v29];
        }
        v31 = [v20 objectForKeyedSubscript:v29];
        v32 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v31 integerValue] + 1);
        [v20 setObject:v32 forKeyedSubscript:v29];

        v33 = [v20 objectForKeyedSubscript:v29];
        uint64_t v34 = (uint64_t)[v33 integerValue];

        if (v34 >= 6) {
          [v37 removeObject:v26];
        }
      }
      id v23 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v23);
  }

  return v37;
}

- (id)_attachmentsWithDisplayName:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:@".*\\.%@.*", @"ips"];
  if (v4)
  {
    uint64_t v6 = +[NSString stringWithFormat:@"%@.*\\.%@.*", v4, @"ips"];

    CFStringRef v7 = @"(JetsamEvent|Sandbox|^stacks|log-aggregated).*";
    id v5 = (void *)v6;
  }
  else
  {
    CFStringRef v7 = @"(AutoBugCapture|CMActivityLog|CoreTime|DuetKnowledgeCollector|ExcResource|FlashStatus|JetsamEvent|KeyboardAccuracy|log-aggregated|memory-snapshot|OTAUpdate|Sandbox|^stacks|SymptomJournal|SystemMemoryReset|Ultra_1).*";
  }
  uint64_t v8 = +[NSRegularExpression regularExpressionWithPattern:v5 options:1 error:0];
  id v9 = +[NSRegularExpression regularExpressionWithPattern:v7 options:1 error:0];
  id v10 = +[NSRegularExpression regularExpressionWithPattern:@"JetsamEvent.*\\.ips.*" options:1 error:0];
  uint64_t v11 = [(DECrashLogsExtension *)self _submittableLogsWithPattern:v8 excludingPattern:v9 excludingPathComponents:&off_1000043A8];
  v12 = [(DECrashLogsExtension *)self _submittableLogsWithPattern:v10 excludingPattern:0 excludingPathComponents:&off_1000043A8];
  id v13 = [v11 mutableCopy];
  [v13 addObjectsFromArray:v12];
  if (v4)
  {
    uint64_t v24 = v12;
    v25 = v10;
    v26 = v9;
    v27 = v8;
    v28 = v5;
    id v29 = v4;
    id v14 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceNow:", (double)-[DECrashLogsExtension cutOffSeconds](self, "cutOffSeconds"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v15 = v11;
    id v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v21 = [v20 modificationDate];
          id v22 = [v21 compare:v14];

          if (v22 == (id)-1) {
            [v13 removeObject:v20];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v17);
    }

    id v5 = v28;
    id v4 = v29;
    id v9 = v26;
    uint64_t v8 = v27;
    v12 = v24;
    id v10 = v25;
  }

  return v13;
}

- (id)_submittableLogsWithPattern:(id)a3 excludingPattern:(id)a4 excludingPathComponents:(id)a5
{
  id v7 = a3;
  id v36 = a4;
  id v8 = a5;
  id v9 = OSASubmittableLogs();
  if ([v9 count])
  {
    id v10 = v7;
    if (!v10)
    {
      id v10 = +[NSRegularExpression regularExpressionWithPattern:@"*" options:1 error:0];
    }
    id v31 = v8;
    id v32 = v7;
    if (v8 && [v8 count])
    {
      v35 = +[NSSet setWithArray:v8];
    }
    else
    {
      v35 = 0;
    }
    id v33 = (id)objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v30 = v9;
    id obj = v9;
    id v11 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v41;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v39 = 0;
          objc_msgSend(v15, "getResourceValue:forKey:error:", &v39, NSURLNameKey, 0, v30);
          id v16 = v39;
          id v17 = [v16 length];
          if (v17) {
            BOOL v18 = v10 == 0;
          }
          else {
            BOOL v18 = 1;
          }
          if (v18
            || (objc_msgSend(v10, "firstMatchInString:options:range:", v16, 8, 0, v17),
                v19 = objc_claimAutoreleasedReturnValue(),
                v19,
                v19))
          {
            if (!v36
              || !v17
              || (objc_msgSend(v36, "firstMatchInString:options:range:", v16, 8, 0, v17),
                  id v20 = objc_claimAutoreleasedReturnValue(),
                  v20,
                  !v20))
            {
              if (!v35
                || (id v21 = objc_alloc((Class)NSSet),
                    [v15 pathComponents],
                    id v22 = objc_claimAutoreleasedReturnValue(),
                    id v23 = [v21 initWithArray:v22],
                    unsigned __int8 v24 = [v23 intersectsSet:v35],
                    v23,
                    v22,
                    (v24 & 1) == 0))
              {
                id v38 = 0;
                [v15 getResourceValue:&v38 forKey:NSURLFileSizeKey error:0];
                id v37 = 0;
                id v25 = v38;
                [v15 getResourceValue:&v37 forKey:NSURLContentModificationDateKey error:0];
                id v26 = v37;
                v27 = [v15 lastPathComponent];
                v28 = +[DEAttachmentItem attachmentWithPath:v15 withDisplayName:v27 modificationDate:v26 andFilesize:v25];

                [v33 addObject:v28];
              }
            }
          }
        }
        id v12 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v12);
    }

    id v8 = v31;
    id v7 = v32;
    id v9 = v30;
  }
  else
  {
    id v33 = &__NSArray0__struct;
  }

  return v33;
}

- (id)shortname:(id)a3
{
  id v3 = a3;
  id v4 = (void *)qword_100008278;
  if (!qword_100008278)
  {
    uint64_t v5 = +[NSRegularExpression regularExpressionWithPattern:@"([^_-]*)" options:1 error:0];
    uint64_t v6 = (void *)qword_100008278;
    qword_100008278 = v5;

    id v4 = (void *)qword_100008278;
  }
  id v7 = objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 range];
    objc_msgSend(v3, "substringWithRange:", v9, v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = v3;
  }
  id v12 = v11;

  return v12;
}

- (int64_t)cutOffSeconds
{
  return self->_cutOffSeconds;
}

- (void)setCutOffSeconds:(int64_t)a3
{
  self->_cutOffSeconds = a3;
}

@end