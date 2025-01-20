@interface SAAceDomainSignal
- (id)_ad_likelyApplicationBundleIdentifiers;
- (id)_ad_preheatableDomain;
- (void)_ad_handleAceDomainSignalRequest:(id)a3 completionHandler:(id)a4;
- (void)_ad_recordPreheatLaunchOf:(id)a3;
@end

@implementation SAAceDomainSignal

- (id)_ad_preheatableDomain
{
  if (qword_100586278 != -1) {
    dispatch_once(&qword_100586278, &stru_10050B848);
  }
  v3 = [(SAAceDomainSignal *)self domain];
  if (v3)
  {
    v4 = [(id)qword_100586270 objectForKeyedSubscript:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_ad_handleAceDomainSignalRequest:(id)a3 completionHandler:(id)a4
{
  id v18 = a3;
  id v19 = a4;
  v22 = self;
  v20 = [(SAAceDomainSignal *)self _ad_likelyApplicationBundleIdentifiers];
  if ([v20 count])
  {
    v6 = dispatch_group_create();
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    char v35 = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v20;
    id v7 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v31;
      uint64_t v9 = BKSOpenApplicationOptionKeyActivateSuspended;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v12 = [off_100583E40() serviceWithDefaultShellEndpoint];
          if (v12)
          {
            dispatch_group_enter(v6);
            [(SAAceDomainSignal *)v22 _ad_recordPreheatLaunchOf:v11];
            id v13 = off_100583E48();
            uint64_t v36 = v9;
            v37 = &__kCFBooleanTrue;
            v14 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
            v15 = [v13 optionsWithDictionary:v14];
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472;
            v27[2] = sub_1002F73B4;
            v27[3] = &unk_10050B800;
            v29 = v34;
            v28 = v6;
            [v12 openApplication:v11 withOptions:v15 completion:v27];
          }
        }
        id v7 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v7);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002F7470;
    block[3] = &unk_10050B828;
    v26 = v34;
    id v25 = v19;
    id v24 = v18;
    dispatch_group_notify(v6, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v34, 8);
  }
  else
  {
    id v16 = objc_alloc_init((Class)SACommandSucceeded);
    v17 = [v18 createResponseWithReplyCommand:v16];
    (*((void (**)(id, void *, void))v19 + 2))(v19, v17, 0);
  }
}

- (void)_ad_recordPreheatLaunchOf:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v6 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
    [v6 setObject:v3 forKeyedSubscript:AFAnalyticsContextKey[0]];
    v4 = sub_1001FB5B4(v3);

    [v6 setObject:v4 forKeyedSubscript:AFAnalyticsContextKey[1]];
    v5 = +[AFAnalytics sharedAnalytics];
    [v5 logEventWithType:801 context:v6];
  }
}

- (id)_ad_likelyApplicationBundleIdentifiers
{
  if (AFIsNano())
  {
    if (qword_100586268 != -1) {
      dispatch_once(&qword_100586268, &stru_10050B7D8);
    }
    id v3 = (void *)qword_100586260;
    v4 = [(SAAceDomainSignal *)self domain];
    v5 = [v3 objectForKey:v4];

    if (v5)
    {
      v10 = v5;
      id v6 = +[NSArray arrayWithObjects:&v10 count:1];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v7 = [(SAAceDomainSignal *)self domain];
    unsigned int v8 = [v7 isEqualToString:SAAceDomainSignalDomainSYNAPSEValue];

    if (v8)
    {
      id v6 = [(SAAceDomainSignal *)self appIdHints];
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

@end