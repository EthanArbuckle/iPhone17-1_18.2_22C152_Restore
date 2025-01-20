void sub_10000250C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t vars8;

  v6 = a2;
  v5 = a3;
  if ([v6 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v6];
  }
  if (v5) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void sub_100002588(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000250C;
  v6[3] = &unk_1000248D0;
  v5 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  [v5 _relatedPlacesMapItemsIdentifiersForGEOMapItem:a2 relatedPlaceListType:v4 handler:v6];
}

id sub_1000027E4(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  sub_100004BE4(*(void **)(a1 + 32), v2);
  return v2;
}

id sub_10000283C(uint64_t a1)
{
  return +[RTHelperService computeMetricsForAnalyticsIdentifier:*(void *)(a1 + 32) appIdentifier:*(void *)(a1 + 40) requestType:*(void *)(a1 + 64) mapItems:*(void *)(a1 + 48) serviceError:*(void *)(a1 + 56) isBackgroundRequest:*(unsigned __int8 *)(a1 + 72)];
}

void sub_10000285C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3 + 1;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@, mapItem %lu, %@", (uint8_t *)&v8, 0x20u);
  }
}

void sub_100002950(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3 + 1;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@, related mapItem %lu, %@", (uint8_t *)&v8, 0x20u);
  }
}

void sub_100002A44(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3 + 1;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@, mapItem %lu, %@", (uint8_t *)&v8, 0x20u);
  }
}

void sub_100002D50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = NSStringFromSelector(*(SEL *)(a1 + 72));
    id v9 = [v5 count];
    id v10 = [*(id *)(a1 + 32) count];
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    v16 = v8;
    __int16 v17 = 2048;
    id v18 = v9;
    __int16 v19 = 2048;
    id v20 = v10;
    __int16 v21 = 2112;
    uint64_t v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@, %lu, mapItemsIdentifiers for reverseGeocode relatedPlaces, %lu, mapItems, %@, error", buf, 0x2Au);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100002950;
  v14[3] = &unk_100024808;
  v14[4] = *(void *)(a1 + 72);
  [v5 enumerateObjectsUsingBlock:v14];
  if (v6) {
    [*(id *)(a1 + 48) addObject:v6];
  }
  if ([*(id *)(a1 + 48) count])
  {
    __int16 v12 = _RTSafeArray();
    id v13 = _RTMultiErrorCreate();
  }
  else
  {
    id v13 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64));
}

void sub_10000378C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) _mapItemsFromGEOMapItems:v5 mapItemSource:1];
  int v8 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v10 = [v7 count];
    uint64_t v11 = [*(id *)(a1 + 40) coordinateToString];
    *(_DWORD *)buf = 138413058;
    v26 = v9;
    __int16 v27 = 2048;
    id v28 = v10;
    __int16 v29 = 2112;
    v30 = v11;
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@, %lu mapItems from reverseGeocode, %@, error, %@", buf, 0x2Au);
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100002A44;
  v24[3] = &unk_1000247C0;
  v24[4] = *(void *)(a1 + 64);
  [v7 enumerateObjectsUsingBlock:v24];
  if (v6) {
    [*(id *)(a1 + 48) addObject:v6];
  }
  __int16 v12 = *(void **)(a1 + 32);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100002D50;
  v17[3] = &unk_100024830;
  uint64_t v23 = *(void *)(a1 + 64);
  id v18 = v5;
  id v19 = v6;
  id v20 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v21 = v7;
  id v22 = v13;
  id v14 = v7;
  id v15 = v6;
  id v16 = v5;
  [v12 _relatedPlacesMapItemsIdentifiersForGEOMapItems:v16 relatedPlaceListType:2 handler:v17];
}

void sub_100003A10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = NSStringFromSelector(*(SEL *)(a1 + 72));
    id v9 = [v5 count];
    id v10 = [*(id *)(a1 + 32) coordinateToString];
    int v17 = 138413058;
    id v18 = v8;
    __int16 v19 = 2048;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@, %lu geoMapItems from reverseGeocode, %@, error, %@", (uint8_t *)&v17, 0x2Au);
  }
  uint64_t v11 = *(void *)(a1 + 64);
  __int16 v12 = [(id)objc_opt_class() exposedErrorFrom:v6];
  (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v12);

  id v13 = objc_opt_class();
  id v14 = [*(id *)(a1 + 48) analyticsIdentifier];
  id v15 = [*(id *)(a1 + 56) appIdentifier];
  id v16 = [(id)objc_opt_class() exposedErrorFrom:v6];
  objc_msgSend(v13, "submitMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:", v14, v15, 3, v5, v16, objc_msgSend(*(id *)(a1 + 48), "useBackgroundTraits"));
}

id sub_10000406C(void *a1, void *a2)
{
  v3 = *(void **)(a1[4] + 8);
  id v4 = a2;
  id v5 = [v3 handleForMapItem:v4];
  id v6 = objc_alloc((Class)NSString);
  id v7 = [v6 initWithCString:off_10002D3D8 encoding:1];
  CFStringRef v19 = @"geoMapItemHandleSize";
  int v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 length]);
  id v20 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  sub_100004BE4(v7, v9);

  id v10 = +[NSString stringWithFormat:@"com.apple.%@", v7];
  CFStringRef v17 = @"geoMapItemHandleSize";
  uint64_t v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 length]);
  id v18 = v11;
  __int16 v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  AnalyticsSendEvent();

  id v13 = objc_alloc((Class)RTMapItem);
  id v14 = +[NSUUID UUID];
  id v15 = [v13 initWithIdentifier:v14 geoMapItem:v4 geoMapItemHandle:v5 source:a1[7] creationDate:a1[5] expirationDate:a1[6]];

  return v15;
}

void sub_100004BE4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_opt_new();
  [v5 appendFormat:@"\n=== BEGIN analytics submission for event %@ ===\n", v3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [v4 allKeys];
  id v7 = [v6 sortedArrayUsingComparator:&stru_100024700];

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v13 = [v4 objectForKeyedSubscript:v12];
        [v5 appendFormat:@"%@ : %@\n", v12, v13];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v9);
  }

  [v5 appendFormat:@"=== END analytics submission for event %@ ===\n", v3];
  id v14 = sub_1000071D0(&qword_10002D3B8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
}

void sub_100004DD8(uint64_t a1)
{
  [*(id *)(a1 + 32) _extendLifetime];
  if (*(unsigned char *)(a1 + 64))
  {
    [*(id *)(a1 + 40) invoke];
    uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
  else
  {
    id v4 = +[NSDate date];
    id v5 = sub_1000071D0(&qword_10002D370);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = NSStringFromSelector((SEL)[*(id *)(a1 + 40) selector]);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      __int16 v46 = 2112;
      v47 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "client, %@, called, %@", buf, 0x16u);
    }
    id v6 = [*(id *)(a1 + 40) target];
    id v7 = [*(id *)(*(void *)(a1 + 32) + 16) protocol];
    unsigned int v8 = [v6 conformsToProtocol:v7];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 48) exportedInterface];
      uint64_t v10 = objc_msgSend(v9, "replyBlockSignatureForSelector:", objc_msgSend(*(id *)(a1 + 40), "selector"));
    }
    else
    {
      uint64_t v10 = 0;
    }
    id v13 = +[RTXPC executablePathOfConnection:*(void *)(a1 + 48)];
    id v14 = [v13 lastPathComponent];

    unsigned __int8 v15 = [*(id *)(*(void *)(a1 + 32) + 24) containsObject:v14];
    unsigned int v16 = [*(id *)(*(void *)(a1 + 32) + 16) clientConnection:*(void *)(a1 + 48) satisfiesEntitlementRequirementsForInvocation:*(void *)(a1 + 40)];
    if (v10)
    {
      if (v16)
      {
        if (v15)
        {
          id v17 = [*(id *)(a1 + 40) blockArgumentIndex];
          *(void *)buf = 0;
          [*(id *)(a1 + 40) getArgument:buf atIndex:v17];
          long long v18 = NSStringFromSelector((SEL)[*(id *)(a1 + 40) selector]);
          id v19 = [*(id *)buf copy];
          [v10 UTF8String];
          v37 = v18;
          id v38 = v4;
          v39 = v19;
          id v20 = v19;
          id v21 = v18;
          id v40 = (id)__NSMakeSpecialForwardingCaptureBlock();
          [*(id *)(a1 + 40) setArgument:&v40 atIndex:v17];
          [*(id *)(a1 + 40) invoke];
          uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
          __int16 v23 = *(void **)(v22 + 40);
          *(void *)(v22 + 40) = 0;
        }
        else
        {
          NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
          id v32 = +[NSString stringWithFormat:@"This operation is unavailable for %@.", v14];
          v42 = v32;
          v33 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];

          v34 = +[NSError errorWithDomain:RTErrorDomain code:2 userInfo:v33];
          [*(id *)(a1 + 48) rejectInvocation:*(void *)(a1 + 40) withError:v34 replyTypes:v10];
          uint64_t v35 = *(void *)(*(void *)(a1 + 56) + 8);
          v36 = *(void **)(v35 + 40);
          *(void *)(v35 + 40) = 0;
        }
      }
      else
      {
        NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
        v26 = +[NSString stringWithFormat:@"%@ is not entitled for this operation.", v14];
        v44 = v26;
        __int16 v27 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];

        id v28 = objc_alloc((Class)NSError);
        id v29 = [v28 initWithDomain:RTErrorDomain code:3 userInfo:v27];
        [*(id *)(a1 + 48) rejectInvocation:*(void *)(a1 + 40) withError:v29 replyTypes:v10];
        uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
        __int16 v31 = *(void **)(v30 + 40);
        *(void *)(v30 + 40) = 0;
      }
    }
    else
    {
      if (v16 && [*(id *)(*(void *)(a1 + 32) + 24) containsObject:v14]) {
        [*(id *)(a1 + 40) invoke];
      }
      uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
      v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = 0;
    }
  }
}

void sub_100005308(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_1000071D0(&qword_10002D370);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    id v6 = +[NSDate date];
    [v6 timeIntervalSinceDate:a1[5]];
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Sending reply for request \"%@\", latency, %.2f", (uint8_t *)&v8, 0x16u);
  }
  [v3 setTarget:a1[6]];
  [v3 invoke];
}

void sub_10000568C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  if (!getuid()) {
    sub_10000DC74();
  }
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.routined"];
  uint64_t v5 = +[NSDate date];
  id v6 = +[NSProcessInfo processInfo];
  uint64_t v7 = [v6 processName];
  int v8 = [@"LastLaunchDate" stringByAppendingPathExtension:v7];
  uint64_t v9 = [v4 objectForKey:v8];

  if (v9)
  {
    __int16 v10 = +[NSProcessInfo processInfo];
    uint64_t v11 = [v10 processName];
    uint64_t v12 = [@"LastExitDate" stringByAppendingPathExtension:v11];
    id v13 = [v4 objectForKey:v12];

    if (v13) {
      id v14 = v13;
    }
    else {
      id v14 = v5;
    }
    if (v13) {
      unsigned __int8 v15 = v13;
    }
    else {
      unsigned __int8 v15 = v9;
    }
    [v14 timeIntervalSinceDate:v9];
    double v17 = v16;
    [v5 timeIntervalSinceDate:v15];
    double v19 = v18;
    id v20 = objc_opt_new();
    id v21 = +[NSProcessInfo processInfo];
    uint64_t v22 = [v21 processName];
    [v20 setObject:v22 forKeyedSubscript:@"processName"];

    __int16 v23 = +[NSNumber numberWithDouble:v17];
    [v20 setObject:v23 forKeyedSubscript:@"processUptime"];

    uint64_t v24 = +[NSNumber numberWithDouble:v19];
    [v20 setObject:v24 forKeyedSubscript:@"durationSincePreviousLaunch"];

    if (v13)
    {
      v25 = +[NSNumber numberWithInt:0];
      [v20 setObject:v25 forKeyedSubscript:@"previousExitWasUnclean"];
    }
    id v26 = objc_alloc((Class)NSString);
    id v27 = [v26 initWithCString:off_10002D3E0 encoding:1];
    sub_100004BE4(v27, v20);
    id v28 = +[NSString stringWithFormat:@"com.apple.%@", v27];
    AnalyticsSendEvent();
  }
  id v29 = +[NSProcessInfo processInfo];
  uint64_t v30 = [v29 processName];
  __int16 v31 = [@"LastLaunchDate" stringByAppendingPathExtension:v30];
  [v4 setObject:v5 forKey:v31];

  id v32 = +[NSProcessInfo processInfo];
  v33 = [v32 processName];
  v34 = [@"LastExitDate" stringByAppendingPathExtension:v33];
  [v4 setObject:0 forKey:v34];

  uint64_t v35 = [RTHelperServiceLifeCycleManager alloc];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10000DD14;
  v41[3] = &unk_1000245D8;
  id v42 = v4;
  id v36 = v4;
  v37 = [(RTHelperServiceLifeCycleManager *)v35 initWithExitHandler:v41];
  id v38 = objc_opt_new();
  [v38 setDelegate:v37];
  v39 = +[NSXPCListener serviceListener];
  [v39 setDelegate:v38];

  [v39 resume];

  return 0;
}

void sub_100006BD4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 72);
  id v8 = a2;
  uint64_t v9 = [v6 _mapItemsFromGEOMapItems:v8 mapItemSource:v7];
  __int16 v10 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 80));
    id v12 = [v9 count];
    id v13 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 138413058;
    uint64_t v22 = v11;
    __int16 v23 = 2048;
    id v24 = v12;
    __int16 v25 = 2048;
    id v26 = v13;
    __int16 v27 = 2112;
    id v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@, %lu mapItems from %lu GEOMapItem identifiers, error, %@", buf, 0x2Au);
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000285C;
  v20[3] = &unk_1000247C0;
  v20[4] = *(void *)(a1 + 80);
  [v9 enumerateObjectsUsingBlock:v20];
  uint64_t v14 = *(void *)(a1 + 64);
  unsigned __int8 v15 = [(id)objc_opt_class() exposedErrorFrom:v5];
  (*(void (**)(uint64_t, void *, void *))(v14 + 16))(v14, v9, v15);

  double v16 = objc_opt_class();
  double v17 = [*(id *)(a1 + 48) analyticsIdentifier];
  double v18 = [*(id *)(a1 + 56) appIdentifier];
  double v19 = [(id)objc_opt_class() exposedErrorFrom:v5];
  objc_msgSend(v16, "submitMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:", v17, v18, 7, v8, v19, objc_msgSend(*(id *)(a1 + 48), "useBackgroundTraits"));
}

id sub_1000071D0(dispatch_once_t *predicate)
{
  if (*predicate != -1) {
    dispatch_once_f(predicate, predicate, (dispatch_function_t)sub_10000CB1C);
  }
  uint64_t v2 = (void *)predicate[2];
  return v2;
}

int64_t sub_100007230(id a1, NSString *a2, NSString *a3)
{
  return [(NSString *)a2 compare:a3];
}

void sub_100007238(uint64_t a1)
{
}

uint64_t sub_100007240(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

id sub_100007454(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

id sub_10000759C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onNotification:*(void *)(a1 + 40)];
}

id sub_1000076E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fireWithDate:*(void *)(a1 + 40)];
}

id sub_10000777C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

void sub_10000816C(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 isEqualToString:CNPostalAddressStreetKey])
  {
    CFStringRef v6 = @"Street";
  }
  else if ([v7 isEqualToString:CNPostalAddressCityKey])
  {
    CFStringRef v6 = @"City";
  }
  else if ([v7 isEqualToString:CNPostalAddressStateKey])
  {
    CFStringRef v6 = @"State";
  }
  else if ([v7 isEqualToString:CNPostalAddressPostalCodeKey])
  {
    CFStringRef v6 = @"ZIP";
  }
  else if ([v7 isEqualToString:CNPostalAddressCountryKey])
  {
    CFStringRef v6 = @"Country";
  }
  else
  {
    if (![v7 isEqualToString:CNPostalAddressISOCountryCodeKey]) {
      goto LABEL_14;
    }
    CFStringRef v6 = @"CountryCode";
  }
  [*(id *)(a1 + 32) setObject:v5 forKey:v6];
LABEL_14:
}

uint64_t sub_1000089D8()
{
  return 0;
}

void sub_10000B524(id a1)
{
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)qword_10002D4A8;
  qword_10002D4A8 = v1;

  id v3 = +[NSLocale autoupdatingCurrentLocale];
  [(id)qword_10002D4A8 setLocale:v3];

  [(id)qword_10002D4A8 setDateStyle:1];
  id v4 = (void *)qword_10002D4A8;
  [v4 setTimeStyle:3];
}

void sub_10000BD50(uint64_t a1, SEL aSelector)
{
  id v3 = NSStringFromSelector(aSelector);
  uint64_t v4 = +[NSString stringWithFormat:@"%@ requires the use of the initializer: %@", a1, v3];

  id v5 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  objc_exception_throw(v5);
}

id sub_10000BDD0(uint64_t a1)
{
  uint64_t v1 = +[NSString stringWithFormat:@"Invalid parameter not satisfying: %@", a1, NSLocalizedDescriptionKey];
  CFStringRef v6 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  id v3 = +[NSError errorWithDomain:RTErrorDomain code:7 userInfo:v2];

  return v3;
}

uint64_t sub_10000C524()
{
  return 0;
}

os_log_t sub_10000CB1C(uint64_t a1)
{
  os_log_t result = os_log_create("com.apple.CoreRoutine", *(const char **)(a1 + 8));
  *(void *)(a1 + 16) = result;
  return result;
}

int64_t sub_10000DBB8(id a1, NSURL *a2, NSURL *a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = [(NSURL *)a2 lastPathComponent];
  CFStringRef v6 = [(NSURL *)v4 lastPathComponent];

  id v7 = [v5 stringByDeletingPathExtension];
  id v8 = [v6 stringByDeletingPathExtension];
  id v9 = [v7 compare:v8 options:64];
  if (!v9) {
    id v9 = [v5 compare:v6 options:64];
  }

  return (int64_t)v9;
}

void sub_10000DC74()
{
  v0 = sub_1000071D0(&qword_10002D358);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "RTHelperService is not worthy of running as root.", v3, 2u);
  }

  id v1 = +[NSString stringWithFormat:@"RTHelperService is not worthy of running as root.\n"];
  uint64_t v2 = (const char *)[v1 UTF8String];
  fputs(v2, __stderrp);

  exit(0);
}

uint64_t sub_10000DD14(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = +[NSDate date];
  id v3 = +[NSProcessInfo processInfo];
  uint64_t v4 = [v3 processName];
  uint64_t v5 = [@"LastExitDate" stringByAppendingPathExtension:v4];
  [v1 setObject:v2 forKey:v5];

  CFStringRef v6 = sub_1000071D0(&qword_10002D358);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int16 v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Exiting service.", v10, 2u);
  }

  id v7 = +[NSString stringWithFormat:@"Exiting service.\n"];
  id v8 = (const char *)[v7 UTF8String];
  fputs(v8, __stderrp);

  return xpc_transaction_exit_clean();
}

void sub_10000E868(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = +[NSDate date];
    id v8 = [v7 dateByAddingTimeInterval:4838400.0];
    id v9 = objc_alloc((Class)RTMapItem);
    __int16 v10 = +[NSUUID UUID];
    id v11 = [v9 initWithIdentifier:v10 geoMapItem:v5 geoMapItemHandle:*(void *)(a1 + 32) source:1024 creationDate:v7 expirationDate:v8];
  }
  else
  {
    id v11 = 0;
  }
  id v12 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v16 = 138412802;
    double v17 = v13;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@, resolved mapItem from handle, %@, error, %@", (uint8_t *)&v16, 0x20u);
  }
  uint64_t v14 = *(void *)(a1 + 48);
  unsigned __int8 v15 = [(id)objc_opt_class() exposedErrorFrom:v6];
  (*(void (**)(uint64_t, id, void *))(v14 + 16))(v14, v11, v15);
}

void sub_10000ED08(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_1000071D0(&qword_10002D3A0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "failed to resolve mapItem from handle, error, %@, fallback to local attempt", buf, 0xCu);
    }

    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void **)(*(void *)(a1 + 32) + 8);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000EF20;
    v15[3] = &unk_100024750;
    id v16 = *(id *)(a1 + 64);
    [v9 resolveMapItemLocallyFromHandle:v8 completionHandler:v15];
    __int16 v10 = v16;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v11 = objc_opt_class();
    __int16 v10 = [*(id *)(a1 + 48) analyticsIdentifier];
    id v12 = [*(id *)(a1 + 56) appIdentifier];
    if (v5)
    {
      id v17 = v5;
      id v13 = +[NSArray arrayWithObjects:&v17 count:1];
    }
    else
    {
      id v13 = 0;
    }
    uint64_t v14 = [(id)objc_opt_class() exposedErrorFrom:0];
    objc_msgSend(v11, "submitMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:", v10, v12, 5, v13, v14, objc_msgSend(*(id *)(a1 + 48), "useBackgroundTraits"));

    if (v5) {
  }
    }
}

uint64_t sub_10000EF20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F450(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v6 _mapItemsFromGEOMapItems:v7 mapItemSource:512];
  id v9 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = NSStringFromSelector(*(SEL *)(a1 + 72));
    id v11 = [v8 count];
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    id v21 = v10;
    __int16 v22 = 2048;
    id v23 = v11;
    __int16 v24 = 2112;
    uint64_t v25 = v12;
    __int16 v26 = 2112;
    id v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@, %lu mapItems from local search, %@, error, %@", buf, 0x2Au);
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000F698;
  v19[3] = &unk_1000247C0;
  v19[4] = *(void *)(a1 + 72);
  [v8 enumerateObjectsUsingBlock:v19];
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v14 = [(id)objc_opt_class() exposedErrorFrom:v5];
  (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v8, v14);

  unsigned __int8 v15 = objc_opt_class();
  id v16 = [*(id *)(a1 + 48) analyticsIdentifier];
  id v17 = [*(id *)(a1 + 56) appIdentifier];
  __int16 v18 = [(id)objc_opt_class() exposedErrorFrom:v5];
  objc_msgSend(v15, "submitMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:", v16, v17, 1, v7, v18, objc_msgSend(*(id *)(a1 + 48), "useBackgroundTraits"));
}

void sub_10000F698(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    id v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3 + 1;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@, mapItem %lu, %@", (uint8_t *)&v8, 0x20u);
  }
}

void sub_10000F93C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) _mapItemsFromGEOMapItems:a2 mapItemSource:1];
  id v7 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v9 = [v6 count];
    __int16 v10 = [*(id *)(a1 + 40) coordinateToString];
    *(_DWORD *)buf = 138413058;
    unsigned __int8 v15 = v8;
    __int16 v16 = 2048;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@, %lu mapItems from reverseGeocode, %@, error, %@", buf, 0x2Au);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000FB10;
  v13[3] = &unk_1000247C0;
  v13[4] = *(void *)(a1 + 56);
  [v6 enumerateObjectsUsingBlock:v13];
  uint64_t v11 = *(void *)(a1 + 48);
  __int16 v12 = [(id)objc_opt_class() exposedErrorFrom:v5];
  (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v6, v12);
}

void sub_10000FB10(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    id v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3 + 1;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@, mapItem %lu, %@", (uint8_t *)&v8, 0x20u);
  }
}

id sub_10000FDD4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) fetchRelatedPlacesMapItemsForGEOMapItem:a2 relatedPlaceListType:*(unsigned int *)(a1 + 64) options:*(void *)(a1 + 40) source:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

id sub_10000FEC8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) fetchMapItemsFromIdentifiers:a2 options:*(void *)(a1 + 40) source:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

void sub_10001046C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v36 = a3;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v38 objects:v54 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v11 = *(void **)(a1 + 32);
        uint64_t v12 = *(void *)(a1 + 40);
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = [v10 timezone];
        [v11 confidenceWeightForGeoMapItem:v10 startDate:v12 endDate:v13 timeZone:v14];
        double v16 = v15;

        id v17 = [*(id *)(a1 + 32) _mapItemFromGEOMapItem:v10 mapItemSource:0x4000 confidenceScalingFactor:v16 * 0.001];
        __int16 v18 = v17;
        if (v17)
        {
          id v19 = [v17 extendedAttributes];
          [v19 wifiConfidence];
          double v21 = v20;

          if (v21 > 0.0) {
            [*(id *)(a1 + 56) addObject:v18];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v38 objects:v54 count:16];
    }
    while (v7);
  }
  __int16 v22 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = NSStringFromSelector(*(SEL *)(a1 + 104));
    id v24 = [*(id *)(a1 + 56) count];
    uint64_t v25 = [*(id *)(a1 + 64) firstObject];
    id v26 = [*(id *)(a1 + 64) count];
    id v27 = [*(id *)(a1 + 72) count];
    *(_DWORD *)buf = 138413570;
    NSErrorUserInfoKey v43 = v23;
    __int16 v44 = 2048;
    id v45 = v24;
    __int16 v46 = 2112;
    v47 = v25;
    __int16 v48 = 2048;
    id v49 = v26;
    __int16 v50 = 2048;
    id v51 = v27;
    __int16 v52 = 2112;
    id v53 = v36;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%@, %lu mapItems from bluePoi, location, %@, locations, %lu, accessPoints, %lu, error, %@", buf, 0x3Eu);
  }
  id v28 = *(void **)(a1 + 56);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000107F8;
  v37[3] = &unk_1000247C0;
  v37[4] = *(void *)(a1 + 104);
  [v28 enumerateObjectsUsingBlock:v37];
  uint64_t v29 = *(void *)(a1 + 96);
  uint64_t v30 = *(void *)(a1 + 56);
  __int16 v31 = [(id)objc_opt_class() exposedErrorFrom:v36];
  (*(void (**)(uint64_t, uint64_t, void *))(v29 + 16))(v29, v30, v31);

  id v32 = objc_opt_class();
  v33 = [*(id *)(a1 + 80) analyticsIdentifier];
  v34 = [*(id *)(a1 + 88) appIdentifier];
  uint64_t v35 = [(id)objc_opt_class() exposedErrorFrom:v36];
  objc_msgSend(v32, "submitMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:", v33, v34, 4, v5, v35, objc_msgSend(*(id *)(a1 + 80), "useBackgroundTraits"));
}

void sub_1000107F8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    uint64_t v8 = a3 + 1;
    id v9 = [v5 extendedAttributes];
    [v9 wifiConfidence];
    uint64_t v11 = v10;
    uint64_t v12 = [v5 extendedAttributes];
    int v13 = 138413314;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2048;
    uint64_t v20 = v11;
    __int16 v21 = 2048;
    id v22 = [v12 wifiFingerprintLabelType];
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@, mapItem %lu, %@, confidence, %lf, type, %ld", (uint8_t *)&v13, 0x34u);
  }
}

void sub_100010B4C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v6 _mapItemsFromGEOMapItems:v7 mapItemSource:2];
  id v9 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 72));
    id v11 = [v8 count];
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    __int16 v21 = v10;
    __int16 v22 = 2048;
    id v23 = v11;
    __int16 v24 = 2112;
    uint64_t v25 = v12;
    __int16 v26 = 2112;
    id v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@, %lu mapItems from forwardGeocode, addressString, %@, error, %@", buf, 0x2Au);
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100010D94;
  v19[3] = &unk_1000247C0;
  v19[4] = *(void *)(a1 + 72);
  [v8 enumerateObjectsUsingBlock:v19];
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v14 = [(id)objc_opt_class() exposedErrorFrom:v5];
  (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v8, v14);

  __int16 v15 = objc_opt_class();
  uint64_t v16 = [*(id *)(a1 + 48) analyticsIdentifier];
  __int16 v17 = [*(id *)(a1 + 56) appIdentifier];
  id v18 = [(id)objc_opt_class() exposedErrorFrom:v5];
  objc_msgSend(v15, "submitMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:", v16, v17, 2, v7, v18, objc_msgSend(*(id *)(a1 + 48), "useBackgroundTraits"));
}

void sub_100010D94(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    id v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3 + 1;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@, mapItem %lu, %@", (uint8_t *)&v8, 0x20u);
  }
}

void sub_1000110D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  int v8 = [v6 _mapItemsFromGEOMapItems:v7 mapItemSource:2];
  id v9 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = NSStringFromSelector(*(SEL *)(a1 + 72));
    id v11 = [v8 count];
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    __int16 v21 = v10;
    __int16 v22 = 2048;
    id v23 = v11;
    __int16 v24 = 2112;
    uint64_t v25 = v12;
    __int16 v26 = 2112;
    id v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@, %lu mapItems from forwardGeocode, addressDictionary, %@, error, %@", buf, 0x2Au);
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001131C;
  v19[3] = &unk_1000247C0;
  v19[4] = *(void *)(a1 + 72);
  [v8 enumerateObjectsUsingBlock:v19];
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v14 = [(id)objc_opt_class() exposedErrorFrom:v5];
  (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v8, v14);

  __int16 v15 = objc_opt_class();
  uint64_t v16 = [*(id *)(a1 + 48) analyticsIdentifier];
  __int16 v17 = [*(id *)(a1 + 56) appIdentifier];
  id v18 = [(id)objc_opt_class() exposedErrorFrom:v5];
  objc_msgSend(v15, "submitMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:", v16, v17, 2, v7, v18, objc_msgSend(*(id *)(a1 + 48), "useBackgroundTraits"));
}

void sub_10001131C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    id v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3 + 1;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@, mapItem %lu, %@", (uint8_t *)&v8, 0x20u);
  }
}

void sub_1000115AC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a3;
  id v8 = [a2 geoAddress];
  id v6 = [v8 postalAddress];
  id v7 = [(id)objc_opt_class() exposedErrorFrom:v5];

  (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);
}

void sub_1000117F4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = objc_opt_new();
    id v7 = [v5 _quickLinks];
    id v8 = [v7 count];

    if (v8)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = objc_msgSend(v5, "_quickLinks", 0);
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if ([v14 type] == (id)2)
            {
              __int16 v15 = [v14 URLString];
              id v16 = [v15 length];

              if (v16)
              {
                __int16 v17 = [v14 URLString];
                [v6 addObject:v17];
              }
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v11);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100011BA0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 _mapItemsFromGEOMapItems:v7 mapItemSource:1];
  id v9 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = NSStringFromSelector(*(SEL *)(a1 + 72));
    id v11 = [v8 count];
    uint64_t v12 = [*(id *)(a1 + 40) coordinateToString];
    *(_DWORD *)buf = 138413058;
    long long v18 = v10;
    __int16 v19 = 2048;
    id v20 = v11;
    __int16 v21 = 2112;
    __int16 v22 = v12;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@, %lu mapItems from territory lookup, %@, error, %@", buf, 0x2Au);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100011DC0;
  v16[3] = &unk_1000247C0;
  v16[4] = *(void *)(a1 + 72);
  [v8 enumerateObjectsUsingBlock:v16];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  id v13 = objc_opt_class();
  uint64_t v14 = [*(id *)(a1 + 48) analyticsIdentifier];
  __int16 v15 = [*(id *)(a1 + 56) appIdentifier];
  objc_msgSend(v13, "submitMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:", v14, v15, 6, v7, v5, objc_msgSend(*(id *)(a1 + 48), "useBackgroundTraits"));
}

void sub_100011DC0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    id v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3 + 1;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@, mapItem %lu, %@", (uint8_t *)&v8, 0x20u);
  }
}

void sub_1000123D4(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _buildingPolygonsFromGEOBuilding:a2];
  if ([v3 count]) {
    [*(id *)(a1 + 40) addObjectsFromArray:v3];
  }
}

void sub_100012438(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v5 = [*(id *)(a1 + 32) coordinateToString];
    id v6 = *(void **)(a1 + 64);
    id v7 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 138413314;
    uint64_t v29 = v4;
    __int16 v30 = 2112;
    __int16 v31 = v5;
    __int16 v32 = 2048;
    v33 = v6;
    __int16 v34 = 2048;
    id v35 = v7;
    __int16 v36 = 2112;
    id v37 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@, location, %@, radius, %.2f, building polygons count, %lu, error, %@", buf, 0x34u);
  }
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = *(id *)(a1 + 40);
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v24;
      do
      {
        id v13 = 0;
        uint64_t v22 = v11;
        do
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v13);
          __int16 v15 = sub_1000071D0(&qword_10002D3A0);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            id v16 = (char *)v13 + v11;
            __int16 v17 = NSStringFromSelector(*(SEL *)(a1 + 56));
            long long v18 = [v14 centroid];
            __int16 v19 = [v14 vertices];
            id v20 = [v19 count];
            *(_DWORD *)buf = 138413058;
            uint64_t v29 = v17;
            __int16 v30 = 2048;
            __int16 v31 = v16;
            __int16 v32 = 2112;
            v33 = v18;
            __int16 v34 = 2048;
            id v35 = v20;
            _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@, polygon idx, %lu, centroid, %@, vertices count, %lu", buf, 0x2Au);

            uint64_t v11 = v22;
          }

          id v13 = (char *)v13 + 1;
        }
        while (v10 != v13);
        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        v11 += (uint64_t)v13;
      }
      while (v10);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v2 = 0;
  }
}

void sub_1000128C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v9 = *(void **)(a1 + 64);
    *(_DWORD *)buf = 138413058;
    __int16 v44 = v8;
    __int16 v45 = 2048;
    id v46 = v9;
    __int16 v47 = 2048;
    id v48 = [v5 count];
    __int16 v49 = 2112;
    id v50 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@, muid, %lu, geoMapItem count, %lu, error, %@", buf, 0x2Au);
  }
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v10 = +[NSMutableArray array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v11 = v5;
    id v12 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v39;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if ([v16 _hasResultProviderID]) {
            [v10 addObject:v16];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v13);
    }

    if ([v10 count])
    {
      __int16 v17 = [v10 firstObject];
      long long v18 = sub_1000071D0(&qword_10002D3A0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        __int16 v19 = NSStringFromSelector(*(SEL *)(a1 + 56));
        id v31 = [v17 _muid];
        id v20 = [v17 _poiCategory];
        __int16 v21 = [v17 name];
        *(_DWORD *)buf = 138413058;
        __int16 v44 = v19;
        __int16 v45 = 2048;
        id v46 = v31;
        __int16 v47 = 2112;
        id v48 = v20;
        __int16 v49 = 2112;
        id v50 = v21;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@, found geoMapItem, muid, %lu, category, %@, name, %@", buf, 0x2Au);
      }
      uint64_t v22 = [v17 _businessHours];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100012CE8;
      v37[3] = &unk_1000249B8;
      v37[4] = *(void *)(a1 + 56);
      [v22 enumerateObjectsUsingBlock:v37];

      id v23 = objc_alloc((Class)RTCoordinate);
      [v17 coordinate];
      double v25 = v24;
      [v17 coordinate];
      id v26 = objc_msgSend(v23, "initWithLatitude:longitude:", v25);
      id v27 = *(void **)(a1 + 32);
      uint64_t v28 = *(void *)(a1 + 40);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100012DF4;
      v33[3] = &unk_1000249E0;
      uint64_t v36 = *(void *)(a1 + 64);
      id v34 = v17;
      long long v32 = *(_OWORD *)(a1 + 48);
      id v29 = (id)v32;
      long long v35 = v32;
      id v30 = v17;
      [v27 fetchPointOfInterestsAroundCoordinate:v26 radius:v28 options:v33 handler:200.0];
    }
  }
}

void sub_100012CE8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    id v8 = [v5 placeDailyHours];
    int v9 = 138412802;
    id v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = a3;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@, idx, %lu, business hours, %@", (uint8_t *)&v9, 0x20u);
  }
}

void sub_100012DF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v6 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 138412802;
    uint64_t v22 = v5;
    __int16 v23 = 2048;
    id v24 = v6;
    __int16 v25 = 2048;
    id v26 = [v3 count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@, muid, %lu, nearby POI count, %lu", buf, 0x20u);
  }
  if ([*(id *)(a1 + 32) _hasAnyAmenities])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = objc_msgSend(*(id *)(a1 + 32), "_amenities", 0);
    uint64_t v8 = (uint64_t)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          if ([*(id *)(*((void *)&v16 + 1) + 8 * i) isApplePayAmenity])
          {
            uint64_t v8 = 1;
            goto LABEL_15;
          }
        }
        uint64_t v8 = (uint64_t)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v11 = objc_alloc((Class)RTPointOfInterestAttributes);
  uint64_t v12 = [*(id *)(a1 + 32) _poiCategory];
  id v13 = objc_msgSend(v11, "initWithApplePaySupport:category:muid:nearbyPoiCount:", v8, v12, *(void *)(a1 + 56), objc_msgSend(v3, "count"));

  uint64_t v14 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = v15;
    __int16 v23 = 2112;
    id v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@, POI attributes, %@", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001326C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) mapItemsForParameters:*(void *)(a1 + 40)];
    id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v11 _hasMUID])
          {
            uint64_t v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v11 _muid]);
            [v5 addObject:v12];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    if ([v5 count])
    {
      id v13 = [*(id *)(*(void *)(a1 + 48) + 8) ticketForMUIDs:v5 traits:*(void *)(a1 + 56)];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000134F0;
      v14[3] = &unk_100024A30;
      v14[4] = *(void *)(a1 + 48);
      id v15 = *(id *)(a1 + 64);
      [v13 submitWithHandler:v14 networkActivity:0];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

void sub_1000134F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v13, "_hasResultProviderID", (void)v15)) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [*(id *)(a1 + 32) _mapItemsFromGEOMapItems:v7 mapItemSource:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100014AC8()
{
  return 0;
}

id sub_100014F48(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleLifeCycleTimerExpiration];
}

uint64_t sub_100014F50(uint64_t a1)
{
  id v2 = sub_1000071D0(&qword_10002D388);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "handle SIGTERM", v4, 2u);
  }

  uint64_t result = *(void *)(*(void *)(a1 + 32) + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_100015214(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t GEOCoordinateRegionMakeWithDistance()
{
  return _GEOCoordinateRegionMakeWithDistance();
}

uint64_t GEOErrorDomain()
{
  return _GEOErrorDomain();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _RTMultiErrorCreate()
{
  return __RTMultiErrorCreate();
}

uint64_t _RTSafeArray()
{
  return __RTSafeArray();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __NSMakeSpecialForwardingCaptureBlock()
{
  return ___NSMakeSpecialForwardingCaptureBlock();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
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

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

void exit(int a1)
{
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

uid_t getuid(void)
{
  return _getuid();
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

{
}

{
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

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return _protocol_copyMethodDescriptionList(p, isRequiredMethod, isInstanceMethod, outCount);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return _sel_isEqual(lhs, rhs);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_set_event()
{
  return _xpc_set_event();
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

uint64_t xpc_transaction_interrupt_clean_exit()
{
  return _xpc_transaction_interrupt_clean_exit();
}

id objc_msgSend_URLString(void *a1, const char *a2, ...)
{
  return [a1 URLString];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend__additionalPlaceInfos(void *a1, const char *a2, ...)
{
  return [a1 _additionalPlaceInfos];
}

id objc_msgSend__amenities(void *a1, const char *a2, ...)
{
  return [a1 _amenities];
}

id objc_msgSend__businessHours(void *a1, const char *a2, ...)
{
  return [a1 _businessHours];
}

id objc_msgSend__clientAttributes(void *a1, const char *a2, ...)
{
  return [a1 _clientAttributes];
}

id objc_msgSend__deregisterAlarm(void *a1, const char *a2, ...)
{
  return [a1 _deregisterAlarm];
}

id objc_msgSend__detailedErrors(void *a1, const char *a2, ...)
{
  return [a1 _detailedErrors];
}

id objc_msgSend__extendLifetime(void *a1, const char *a2, ...)
{
  return [a1 _extendLifetime];
}

id objc_msgSend__handleDurationExpiry(void *a1, const char *a2, ...)
{
  return [a1 _handleDurationExpiry];
}

id objc_msgSend__hasAnyAmenities(void *a1, const char *a2, ...)
{
  return [a1 _hasAnyAmenities];
}

id objc_msgSend__hasMUID(void *a1, const char *a2, ...)
{
  return [a1 _hasMUID];
}

id objc_msgSend__hasResultProviderID(void *a1, const char *a2, ...)
{
  return [a1 _hasResultProviderID];
}

id objc_msgSend__iso3166CountryCode(void *a1, const char *a2, ...)
{
  return [a1 _iso3166CountryCode];
}

id objc_msgSend__iso3166SubdivisionCode(void *a1, const char *a2, ...)
{
  return [a1 _iso3166SubdivisionCode];
}

id objc_msgSend__muid(void *a1, const char *a2, ...)
{
  return [a1 _muid];
}

id objc_msgSend__placeType(void *a1, const char *a2, ...)
{
  return [a1 _placeType];
}

id objc_msgSend__poiCategory(void *a1, const char *a2, ...)
{
  return [a1 _poiCategory];
}

id objc_msgSend__quickLinks(void *a1, const char *a2, ...)
{
  return [a1 _quickLinks];
}

id objc_msgSend__relatedPlaceLists(void *a1, const char *a2, ...)
{
  return [a1 _relatedPlaceLists];
}

id objc_msgSend__resetState(void *a1, const char *a2, ...)
{
  return [a1 _resetState];
}

id objc_msgSend__resultProviderID(void *a1, const char *a2, ...)
{
  return [a1 _resultProviderID];
}

id objc_msgSend__underlyingErrorsRTMultiError(void *a1, const char *a2, ...)
{
  return [a1 _underlyingErrorsRTMultiError];
}

id objc_msgSend__wifiFingerprintConfidence(void *a1, const char *a2, ...)
{
  return [a1 _wifiFingerprintConfidence];
}

id objc_msgSend__wifiFingerprintLabelType(void *a1, const char *a2, ...)
{
  return [a1 _wifiFingerprintLabelType];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_addressBookAttributes(void *a1, const char *a2, ...)
{
  return [a1 addressBookAttributes];
}

id objc_msgSend_addressIdentifier(void *a1, const char *a2, ...)
{
  return [a1 addressIdentifier];
}

id objc_msgSend_addressObject(void *a1, const char *a2, ...)
{
  return [a1 addressObject];
}

id objc_msgSend_age(void *a1, const char *a2, ...)
{
  return [a1 age];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_analyticsAppIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsAppIdentifier];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_appIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appIdentifier];
}

id objc_msgSend_areaOfInterests(void *a1, const char *a2, ...)
{
  return [a1 areaOfInterests];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentLocale];
}

id objc_msgSend_blockArgumentIndex(void *a1, const char *a2, ...)
{
  return [a1 blockArgumentIndex];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_centerCoordinate(void *a1, const char *a2, ...)
{
  return [a1 centerCoordinate];
}

id objc_msgSend_centroid(void *a1, const char *a2, ...)
{
  return [a1 centroid];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return [a1 channel];
}

id objc_msgSend_clientIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientIdentifier];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_coordinateCount(void *a1, const char *a2, ...)
{
  return [a1 coordinateCount];
}

id objc_msgSend_coordinateToString(void *a1, const char *a2, ...)
{
  return [a1 coordinateToString];
}

id objc_msgSend_coordinates(void *a1, const char *a2, ...)
{
  return [a1 coordinates];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_correctedCoordinate(void *a1, const char *a2, ...)
{
  return [a1 correctedCoordinate];
}

id objc_msgSend_correctedLocationAttributes(void *a1, const char *a2, ...)
{
  return [a1 correctedLocationAttributes];
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

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return [a1 dateFormatter];
}

id objc_msgSend_defaultBackgroundTraits(void *a1, const char *a2, ...)
{
  return [a1 defaultBackgroundTraits];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultTraits(void *a1, const char *a2, ...)
{
  return [a1 defaultTraits];
}

id objc_msgSend_defaultsDomain(void *a1, const char *a2, ...)
{
  return [a1 defaultsDomain];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayLanguage(void *a1, const char *a2, ...)
{
  return [a1 displayLanguage];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_endOfDay(void *a1, const char *a2, ...)
{
  return [a1 endOfDay];
}

id objc_msgSend_endTime(void *a1, const char *a2, ...)
{
  return [a1 endTime];
}

id objc_msgSend_exportedInterface(void *a1, const char *a2, ...)
{
  return [a1 exportedInterface];
}

id objc_msgSend_extendedAttributes(void *a1, const char *a2, ...)
{
  return [a1 extendedAttributes];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flatten(void *a1, const char *a2, ...)
{
  return [a1 flatten];
}

id objc_msgSend_flattenErrors(void *a1, const char *a2, ...)
{
  return [a1 flattenErrors];
}

id objc_msgSend_frameworkBundle(void *a1, const char *a2, ...)
{
  return [a1 frameworkBundle];
}

id objc_msgSend_geoAddress(void *a1, const char *a2, ...)
{
  return [a1 geoAddress];
}

id objc_msgSend_geoMapItemHandle(void *a1, const char *a2, ...)
{
  return [a1 geoMapItemHandle];
}

id objc_msgSend_getDefaultMapServiceOptions(void *a1, const char *a2, ...)
{
  return [a1 getDefaultMapServiceOptions];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_hasCorrectedCoordinate(void *a1, const char *a2, ...)
{
  return [a1 hasCorrectedCoordinate];
}

id objc_msgSend_hasLocality(void *a1, const char *a2, ...)
{
  return [a1 hasLocality];
}

id objc_msgSend_hasStructuredAddress(void *a1, const char *a2, ...)
{
  return [a1 hasStructuredAddress];
}

id objc_msgSend_hasSubLocality(void *a1, const char *a2, ...)
{
  return [a1 hasSubLocality];
}

id objc_msgSend_hasThoroughfare(void *a1, const char *a2, ...)
{
  return [a1 hasThoroughfare];
}

id objc_msgSend_helperServiceProtocolEntitlementProvider(void *a1, const char *a2, ...)
{
  return [a1 helperServiceProtocolEntitlementProvider];
}

id objc_msgSend_horizontalUncertainty(void *a1, const char *a2, ...)
{
  return [a1 horizontalUncertainty];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_hoursType(void *a1, const char *a2, ...)
{
  return [a1 hoursType];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return [a1 invoke];
}

id objc_msgSend_isApplePayAmenity(void *a1, const char *a2, ...)
{
  return [a1 isApplePayAmenity];
}

id objc_msgSend_isDisputed(void *a1, const char *a2, ...)
{
  return [a1 isDisputed];
}

id objc_msgSend_isMe(void *a1, const char *a2, ...)
{
  return [a1 isMe];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lat(void *a1, const char *a2, ...)
{
  return [a1 lat];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lng(void *a1, const char *a2, ...)
{
  return [a1 lng];
}

id objc_msgSend_localTimeIntervals(void *a1, const char *a2, ...)
{
  return [a1 localTimeIntervals];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_locality(void *a1, const char *a2, ...)
{
  return [a1 locality];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_mac(void *a1, const char *a2, ...)
{
  return [a1 mac];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mapIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 mapIdentifiers];
}

id objc_msgSend_methodSignature(void *a1, const char *a2, ...)
{
  return [a1 methodSignature];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_numberOfArguments(void *a1, const char *a2, ...)
{
  return [a1 numberOfArguments];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_placeDailyHours(void *a1, const char *a2, ...)
{
  return [a1 placeDailyHours];
}

id objc_msgSend_placeDailyNormalizedHours(void *a1, const char *a2, ...)
{
  return [a1 placeDailyNormalizedHours];
}

id objc_msgSend_placeType(void *a1, const char *a2, ...)
{
  return [a1 placeType];
}

id objc_msgSend_postalAddress(void *a1, const char *a2, ...)
{
  return [a1 postalAddress];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return [a1 protocol];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return [a1 radius];
}

id objc_msgSend_referenceFrame(void *a1, const char *a2, ...)
{
  return [a1 referenceFrame];
}

id objc_msgSend_region(void *a1, const char *a2, ...)
{
  return [a1 region];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retainArguments(void *a1, const char *a2, ...)
{
  return [a1 retainArguments];
}

id objc_msgSend_routineCacheDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 routineCacheDirectoryPath];
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return [a1 rssi];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return [a1 sections];
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return [a1 selector];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_standardizedURL(void *a1, const char *a2, ...)
{
  return [a1 standardizedURL];
}

id objc_msgSend_startOfDay(void *a1, const char *a2, ...)
{
  return [a1 startOfDay];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringFromDate(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate];
}

id objc_msgSend_structuredAddress(void *a1, const char *a2, ...)
{
  return [a1 structuredAddress];
}

id objc_msgSend_subLocality(void *a1, const char *a2, ...)
{
  return [a1 subLocality];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_thoroughfare(void *a1, const char *a2, ...)
{
  return [a1 thoroughfare];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timezone(void *a1, const char *a2, ...)
{
  return [a1 timezone];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_underlyingErrors(void *a1, const char *a2, ...)
{
  return [a1 underlyingErrors];
}

id objc_msgSend_useBackgroundTraits(void *a1, const char *a2, ...)
{
  return [a1 useBackgroundTraits];
}

id objc_msgSend_userCacheDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 userCacheDirectoryPath];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userLibraryPath(void *a1, const char *a2, ...)
{
  return [a1 userLibraryPath];
}

id objc_msgSend_userPreferencesPath(void *a1, const char *a2, ...)
{
  return [a1 userPreferencesPath];
}

id objc_msgSend_vertices(void *a1, const char *a2, ...)
{
  return [a1 vertices];
}

id objc_msgSend_weekday(void *a1, const char *a2, ...)
{
  return [a1 weekday];
}

id objc_msgSend_wifiConfidence(void *a1, const char *a2, ...)
{
  return [a1 wifiConfidence];
}

id objc_msgSend_wifiFingerprintLabelType(void *a1, const char *a2, ...)
{
  return [a1 wifiFingerprintLabelType];
}

id objc_msgSend_withBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "withBlock:");
}