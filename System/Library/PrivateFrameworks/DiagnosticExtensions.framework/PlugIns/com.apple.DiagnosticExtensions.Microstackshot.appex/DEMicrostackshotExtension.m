@interface DEMicrostackshotExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DEMicrostackshotExtension

- (id)attachmentList
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = +[NSDate dateWithTimeIntervalSinceNow:0.0];
  [v3 setObject:v4 forKeyedSubscript:@"endDate"];

  v5 = +[NSDate dateWithTimeIntervalSinceNow:-86400.0];
  [v3 setObject:v5 forKeyedSubscript:@"startDate"];

  v6 = PLQueryRegistered();
  v7 = [v6 objectForKeyedSubscript:@"microstackshots"];
  NSLog(@"[DEMicrostackshotExtension] attachmentList: %@\n", v7);
  v8 = PowerMSSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "attachmentList: %@", buf, 0xCu);
  }

  v9 = +[DEAttachmentItem attachmentWithPath:v7];
  [v2 addObject:v9];

  return v2;
}

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  v4 = PowerMSSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "parameters: %@", buf, 0xCu);
  }

  uint64_t v5 = [v3 objectForKey:@"from"];

  if (v5)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"from"];
  }
  uint64_t v6 = [v3 objectForKey:@"to"];

  if (v6)
  {
    uint64_t v6 = [v3 objectForKeyedSubscript:@"to"];
  }
  if (v5 && !v6)
  {
    uint64_t v7 = +[NSDate dateWithTimeInterval:v5 sinceDate:86400.0];
LABEL_15:
    uint64_t v6 = v7;
    goto LABEL_16;
  }
  if (!v5 && v6)
  {
    uint64_t v5 = +[NSDate dateWithTimeInterval:v6 sinceDate:-86400.0];
    goto LABEL_16;
  }
  if (!(v5 | v6))
  {
    uint64_t v5 = +[NSDate dateWithTimeIntervalSinceNow:-86400.0];
    uint64_t v7 = +[NSDate dateWithTimeIntervalSinceNow:0.0];
    goto LABEL_15;
  }
LABEL_16:
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  [v8 setObject:v6 forKeyedSubscript:@"endDate"];
  [v8 setObject:v5 forKeyedSubscript:@"startDate"];
  v9 = PLQueryRegistered();
  v10 = v9;
  if (v9)
  {
    v11 = [v9 objectForKeyedSubscript:@"microstackshots"];
    NSLog(@"[DEMicrostackshotExtension] attachmentsForParameters(parameters=%@): %@\n", v3, v11);
    v12 = PowerMSSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000038C8((uint64_t)v11, v12);
    }

    v13 = +[NSFileManager defaultManager];
    if ([v13 fileExistsAtPath:v11])
    {
      v14 = +[DEAttachmentItem attachmentWithPath:v11];
      [v14 setDeleteOnAttach:&__kCFBooleanTrue];
      [v14 setShouldCompress:&__kCFBooleanTrue];
      v17 = v14;
      v15 = +[NSArray arrayWithObjects:&v17 count:1];
    }
    else
    {
      v14 = PowerMSSLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100003884(v14);
      }
      v15 = &__NSArray0__struct;
    }
  }
  else
  {
    v11 = PowerMSSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100003840(v11);
    }
    v15 = &__NSArray0__struct;
  }

  return v15;
}

@end