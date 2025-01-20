@interface PKEngagementPluginProvider
+ (id)commandFromRequest:(id)a3;
+ (id)malformedRequest;
+ (id)noCommandError;
+ (id)noPropertyError;
+ (id)unknownError;
+ (id)unrecognizedCommandError;
+ (id)unrecognizedPropertyError;
+ (id)wrapBatchResponse:(id)a3;
+ (id)wrapError:(id)a3;
+ (id)wrapValue:(id)a3 forProperty:(id)a4;
+ (void)fetchProperties:(id)a3 finHealthProperties:(id)a4 withParameters:(id)a5 completion:(id)a6;
+ (void)performBatchRequest:(id)a3 completion:(id)a4;
+ (void)performFetchFinHealthPropertyRequest:(id)a3 completion:(id)a4;
+ (void)performFetchPropertyRequest:(id)a3 completion:(id)a4;
+ (void)performRequestWithObject:(id)a3 completion:(id)a4;
@end

@implementation PKEngagementPluginProvider

+ (void)performRequestWithObject:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = [a1 malformedRequest];
      v7[2](v7, 0, v8);
LABEL_18:

      goto LABEL_19;
    }
    v8 = [v6 PKDictionaryForKey:@"json-payload"];
    v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "received engagement request %{public}@", (uint8_t *)&v13, 0xCu);
    }

    if (v8)
    {
      v10 = [a1 commandFromRequest:v8];
      if (v10)
      {
        if (PKEqualObjects())
        {
          [a1 performBatchRequest:v8 completion:v7];
LABEL_17:

          goto LABEL_18;
        }
        if (PKEqualObjects())
        {
          [a1 performFetchPropertyRequest:v8 completion:v7];
          goto LABEL_17;
        }
        if (PKEqualObjects())
        {
          [a1 performFetchFinHealthPropertyRequest:v8 completion:v7];
          goto LABEL_17;
        }
        uint64_t v11 = [a1 unrecognizedCommandError];
      }
      else
      {
        uint64_t v11 = [a1 noCommandError];
      }
      v12 = (void *)v11;
      v7[2](v7, 0, (void *)v11);

      goto LABEL_17;
    }
    v10 = [a1 malformedRequest];
    v7[2](v7, 0, v10);
    goto LABEL_17;
  }
LABEL_19:
}

+ (void)performBatchRequest:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, void, void *))a4;
  id v6 = [a3 PKDictionaryForKey:@"request"];
  v7 = [v6 PKDictionaryForKey:@"batch"];

  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v7 || ![v7 count])
  {
    v36 = [a1 malformedRequest];
    v5[2](v5, 0, v36);

    goto LABEL_25;
  }
  v43 = v8;
  v44 = v12;
  v39 = v11;
  v40 = v10;
  v37 = v5;
  v38 = v9;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = [v7 allKeys];
  id v13 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  v41 = v7;
  id v14 = a1;
  if (!v13) {
    goto LABEL_23;
  }
  id v15 = v13;
  uint64_t v45 = *(void *)v53;
  do
  {
    v16 = 0;
    do
    {
      if (*(void *)v53 != v45) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void *)(*((void *)&v52 + 1) + 8 * (void)v16);
      v18 = [v7 objectForKeyedSubscript:v17];
      v19 = [v18 PKDictionaryForKey:@"request"];
      v20 = [v14 commandFromRequest:v18];
      v21 = [v19 PKStringForKey:@"propertyName"];
      v22 = [v19 PKStringForKey:@"parameter"];
      if (!v20)
      {
        uint64_t v28 = [v14 noCommandError];
        goto LABEL_17;
      }
      if (!v21)
      {
        uint64_t v28 = [v14 noPropertyError];
LABEL_17:
        v29 = (void *)v28;
        [v44 setObject:v28 forKeyedSubscript:v17];

LABEL_18:
        id v14 = a1;
        goto LABEL_19;
      }
      v23 = v20;
      v24 = v43;
      if (v23 == @"fetchProperty") {
        goto LABEL_14;
      }
      unsigned __int8 v25 = [(__CFString *)v23 isEqualToString:@"fetchProperty"];

      v24 = v43;
      if ((v25 & 1) != 0
        || (v26 = v23, v24 = v38, v26 == @"fetchFinHealthProperty")
        || (unsigned __int8 v27 = [(__CFString *)v26 isEqualToString:@"fetchFinHealthProperty"], v26, v24 = v38, (v27 & 1) != 0))
      {
LABEL_14:
        [v24 addObject:v21];
        [v40 setObject:v22 forKeyedSubscript:v21];
        [v39 setObject:v21 forKeyedSubscript:v17];
        v7 = v41;
        goto LABEL_18;
      }
      id v14 = a1;
      v30 = [a1 unrecognizedCommandError];
      [v44 setObject:v30 forKeyedSubscript:v17];

      v7 = v41;
LABEL_19:

      v16 = (char *)v16 + 1;
    }
    while (v15 != v16);
    id v31 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    id v15 = v31;
  }
  while (v31);
LABEL_23:

  v32 = v14;
  id v8 = v43;
  id v33 = [v43 copy];
  id v9 = v38;
  id v34 = [v38 copy];
  id v10 = v40;
  id v35 = [v40 copy];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10000174C;
  v47[3] = &unk_100004230;
  id v11 = v39;
  id v48 = v39;
  id v49 = v44;
  v51 = v32;
  v5 = v37;
  v50 = v37;
  [v32 fetchProperties:v33 finHealthProperties:v34 withParameters:v35 completion:v47];

  id v12 = v44;
  v7 = v41;

LABEL_25:
}

+ (void)performFetchPropertyRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [a3 PKDictionaryForKey:@"request"];
  id v8 = [v7 PKStringForKey:@"propertyName"];
  uint64_t v9 = [v7 PKStringForKey:@"parameter"];
  id v10 = (void *)v9;
  if (v8)
  {
    if (v9)
    {
      v19 = v8;
      uint64_t v20 = v9;
      id v11 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    }
    else
    {
      id v11 = 0;
    }
    v18 = v8;
    id v13 = +[NSArray arrayWithObjects:&v18 count:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100001B74;
    v14[3] = &unk_100004258;
    id v16 = v6;
    id v17 = a1;
    id v15 = v8;
    [a1 fetchProperties:v13 finHealthProperties:&__NSArray0__struct withParameters:v11 completion:v14];
  }
  else
  {
    id v12 = [a1 noPropertyError];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v12);
  }
}

+ (void)performFetchFinHealthPropertyRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [a3 PKDictionaryForKey:@"request"];
  id v8 = [v7 PKStringForKey:@"propertyName"];
  uint64_t v9 = [v7 PKStringForKey:@"parameter"];
  id v10 = (void *)v9;
  if (v8)
  {
    if (v9)
    {
      v19 = v8;
      uint64_t v20 = v9;
      id v11 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    }
    else
    {
      id v11 = 0;
    }
    v18 = v8;
    id v13 = +[NSArray arrayWithObjects:&v18 count:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100001DF8;
    v14[3] = &unk_100004258;
    id v16 = v6;
    id v17 = a1;
    id v15 = v8;
    [a1 fetchProperties:&__NSArray0__struct finHealthProperties:v13 withParameters:v11 completion:v14];
  }
  else
  {
    id v12 = [a1 noPropertyError];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v12);
  }
}

+ (void)fetchProperties:(id)a3 finHealthProperties:(id)a4 withParameters:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v38 = a5;
  id v37 = a6;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = sub_100002520;
  v63[4] = sub_100002530;
  id v64 = (id)objc_opt_new();
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = sub_100002520;
  v61[4] = sub_100002530;
  id v62 = 0;
  id v11 = dispatch_group_create();
  PKLogFacilityTypeGetObject();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, a1);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v12))
    {
      id v15 = [v9 componentsJoinedByString:@","];
      id v16 = [v10 componentsJoinedByString:@","];
      *(_DWORD *)buf = 138543618;
      id v68 = v15;
      __int16 v69 = 2114;
      v70 = v16;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "engagement:fetchProperties", "properties:%{public}@\nfinHealthProperties:%{public}@", buf, 0x16u);
    }
  }

  if (v10 && [v10 count])
  {
    dispatch_group_enter(v11);
    id v17 = objc_alloc_init((Class)NSMutableDictionary);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v18 = v38;
    id v19 = [v18 countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v58;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v58 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void *)(*((void *)&v57 + 1) + 8 * i);
          if (objc_msgSend(v10, "containsObject:", v22, v37))
          {
            v23 = [v18 objectForKeyedSubscript:v22];
            [v17 setObject:v23 forKey:v22];
          }
        }
        id v19 = [v18 countByEnumeratingWithState:&v57 objects:v66 count:16];
      }
      while (v19);
    }

    v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Query FinHealthXPCServices for properties", buf, 2u);
    }

    id v25 = objc_alloc_init(off_1000085C0());
    id v26 = [v17 copy];
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100002538;
    v53[3] = &unk_100004280;
    long long v55 = v63;
    v56 = v61;
    long long v54 = v11;
    [v25 fetchUserProperties:v10 withParameters:v26 completion:v53];
  }
  if (v9 && [v9 count])
  {
    dispatch_group_enter(v11);
    id v27 = objc_alloc_init((Class)NSMutableDictionary);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v50 = 0u;
    long long v49 = 0u;
    id v28 = v38;
    id v29 = [v28 countByEnumeratingWithState:&v49 objects:v65 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v50;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v50 != v30) {
            objc_enumerationMutation(v28);
          }
          uint64_t v32 = *(void *)(*((void *)&v49 + 1) + 8 * (void)j);
          if (objc_msgSend(v9, "containsObject:", v32, v37))
          {
            id v33 = [v28 objectForKeyedSubscript:v32];
            [v27 setObject:v33 forKey:v32];
          }
        }
        id v29 = [v28 countByEnumeratingWithState:&v49 objects:v65 count:16];
      }
      while (v29);
    }

    id v34 = +[PKDiscoveryService sharedInstance];
    id v35 = [v27 copy];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1000025C4;
    v45[3] = &unk_100004280;
    v47 = v63;
    id v48 = v61;
    v46 = v11;
    [v34 fetchUserProperties:v9 withParameters:v35 completion:v45];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002650;
  block[3] = &unk_1000042A8;
  id v41 = v37;
  v42 = v63;
  v43 = v61;
  id v44 = a1;
  id v36 = v37;
  dispatch_group_notify(v11, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v63, 8);
}

+ (id)commandFromRequest:(id)a3
{
  v3 = [a3 PKDictionaryForKey:@"request"];
  v4 = [v3 PKStringForKey:@"command"];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = @"batch";
    v7 = [v3 PKDictionaryForKey:@"batch"];

    if (!v7) {
      id v6 = 0;
    }
  }

  return v6;
}

+ (id)wrapValue:(id)a3 forProperty:(id)a4
{
  if (a3)
  {
    CFStringRef v21 = @"json-payload";
    v19[0] = @"error";
    id v5 = a4;
    id v6 = a3;
    v7 = +[NSNull null];
    v19[1] = @"response";
    v20[0] = v7;
    id v17 = v5;
    id v18 = v6;
    id v8 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v20[1] = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    id v22 = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  }
  else
  {
    CFStringRef v15 = @"json-payload";
    v13[0] = @"error";
    id v6 = a4;
    id v9 = 0;
    v7 = [a1 unrecognizedPropertyError];
    v13[1] = @"response";
    v14[0] = v7;
    v14[1] = &__NSDictionary0__struct;
    id v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    id v16 = v8;
    id v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  }

  return v10;
}

+ (id)wrapError:(id)a3
{
  if (a3)
  {
    CFStringRef v15 = @"json-payload";
    v13[0] = @"error";
    v13[1] = @"response";
    v14[0] = a3;
    v14[1] = &__NSDictionary0__struct;
    id v3 = a3;
    v4 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    id v16 = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  }
  else
  {
    CFStringRef v11 = @"json-payload";
    v9[0] = @"error";
    id v7 = 0;
    v4 = [a1 unknownError];
    v9[1] = @"response";
    v10[0] = v4;
    v10[1] = &__NSDictionary0__struct;
    id v3 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    id v12 = v3;
    id v5 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  }

  return v5;
}

+ (id)wrapBatchResponse:(id)a3
{
  if (a3)
  {
    CFStringRef v19 = @"json-payload";
    v17[0] = @"error";
    id v4 = a3;
    id v5 = +[NSNull null];
    v17[1] = @"response";
    v18[0] = v5;
    v18[1] = v4;
    id v6 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    uint64_t v20 = v6;
    id v7 = &v20;
    id v8 = &v19;
  }
  else
  {
    CFStringRef v15 = @"json-payload";
    v13[0] = @"error";
    id v10 = 0;
    id v5 = [a1 unknownError];
    v13[1] = @"response";
    v14[0] = v5;
    v14[1] = &__NSDictionary0__struct;
    id v6 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    id v16 = v6;
    id v7 = &v16;
    id v8 = &v15;
  }
  CFStringRef v11 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v8 count:1];

  return v11;
}

+ (id)malformedRequest
{
  return +[NSError errorWithDomain:PKEngagementErrorDomain code:0 userInfo:0];
}

+ (id)noCommandError
{
  return +[NSError errorWithDomain:PKEngagementErrorDomain code:1 userInfo:0];
}

+ (id)unrecognizedCommandError
{
  return +[NSError errorWithDomain:PKEngagementErrorDomain code:2 userInfo:0];
}

+ (id)noPropertyError
{
  return +[NSError errorWithDomain:PKEngagementErrorDomain code:3 userInfo:0];
}

+ (id)unrecognizedPropertyError
{
  return +[NSError errorWithDomain:PKEngagementErrorDomain code:4 userInfo:0];
}

+ (id)unknownError
{
  return +[NSError errorWithDomain:PKEngagementErrorDomain code:-1 userInfo:0];
}

@end