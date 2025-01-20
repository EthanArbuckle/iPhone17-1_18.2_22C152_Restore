@interface _ApplicationContext
- (void)launchApplicationWithOptions:(id)a3 completionHandler:(id)a4;
@end

@implementation _ApplicationContext

- (void)launchApplicationWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_1002430F0((char *)self);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  self;
  os_unfair_lock_lock_with_options();
  v9 = [v8 bundleID];
  if (!v9
    || (v10 = (void *)qword_1005B0BA0,
        [v8 bundleID],
        v11 = objc_claimAutoreleasedReturnValue(),
        [v10 objectForKeyedSubscript:v11],
        v12 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v12))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1005B0B98);

    goto LABEL_7;
  }
  [v12 timeIntervalSinceNow];
  double v14 = v13;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1005B0B98);
  if (v14 < -15.0)
  {
LABEL_7:
    id v36 = v6;
    id v17 = v8;
    self;
    os_unfair_lock_lock_with_options();
    v18 = (void *)qword_1005B0BA0;
    if (!qword_1005B0BA0)
    {
      id v19 = objc_alloc_init((Class)NSMutableDictionary);
      v20 = (void *)qword_1005B0BA0;
      qword_1005B0BA0 = (uint64_t)v19;

      v18 = (void *)qword_1005B0BA0;
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v21 = objc_msgSend(v18, "allKeys", v7);
    id v22 = [v21 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v42;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v42 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          v27 = [(id)qword_1005B0BA0 objectForKeyedSubscript:v26];
          v28 = v27;
          if (v27)
          {
            [v27 timeIntervalSinceNow];
            if (v29 < -15.0) {
              [(id)qword_1005B0BA0 removeObjectForKey:v26];
            }
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v23);
    }

    v30 = [v17 bundleID];
    if (v30)
    {
      id v31 = objc_alloc_init((Class)NSDate);
      [(id)qword_1005B0BA0 setObject:v31 forKeyedSubscript:v30];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1005B0B98);

    id v7 = v35;
    id v6 = v36;
    if (v36)
    {
      v16 = +[FBSOpenApplicationOptions optionsWithDictionary:v36];
    }
    else
    {
      v16 = 0;
    }
    v32 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
    v33 = sub_1002430F0((char *)self);
    v34 = [v33 bundleID];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100243560;
    v39[3] = &unk_100523488;
    id v40 = v35;
    [v32 openApplication:v34 withOptions:v16 completion:v39];

    goto LABEL_25;
  }
  if (v7)
  {
    v15 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002435D4;
    block[3] = &unk_100521F40;
    id v38 = v7;
    dispatch_async(v15, block);

    v16 = v38;
LABEL_25:
  }
}

@end