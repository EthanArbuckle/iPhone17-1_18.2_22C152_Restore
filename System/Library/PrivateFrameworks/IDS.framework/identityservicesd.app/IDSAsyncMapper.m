@interface IDSAsyncMapper
+ (void)mapArray:(id)a3 onQueue:(id)a4 withBlock:(id)a5 completion:(id)a6 onQueue:(id)a7;
+ (void)mapArray:(id)a3 withBlock:(id)a4 completion:(id)a5 onQueue:(id)a6;
+ (void)mapDictionary:(id)a3 onQueue:(id)a4 withBlock:(id)a5 completion:(id)a6 onQueue:(id)a7;
+ (void)mapDictionary:(id)a3 withBlock:(id)a4 completion:(id)a5 onQueue:(id)a6;
@end

@implementation IDSAsyncMapper

+ (void)mapArray:(id)a3 withBlock:(id)a4 completion:(id)a5 onQueue:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  sub_1002CEC94();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [a1 mapArray:v13 onQueue:v14 withBlock:v12 completion:v11 onQueue:v10];
}

+ (void)mapArray:(id)a3 onQueue:(id)a4 withBlock:(id)a5 completion:(id)a6 onQueue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    id v24 = a1;
    id v17 = objc_alloc_init((Class)NSMutableArray);
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    if ([v12 count])
    {
      unint64_t v19 = 0;
      do
      {
        v20 = +[NSNull null];
        [v17 addObject:v20];

        v21 = [v12 objectAtIndexedSubscript:v19];
        v22 = +[NSNumber numberWithUnsignedInteger:v19];
        [v18 setObject:v21 forKey:v22];

        ++v19;
      }
      while (v19 < (unint64_t)[v12 count]);
    }
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1002CEF28;
    v28[3] = &unk_100987FB8;
    id v29 = v14;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1002CEF40;
    v25[3] = &unk_1009807E8;
    id v26 = v17;
    id v27 = v15;
    id v23 = v17;
    [v24 mapDictionary:v18 onQueue:v13 withBlock:v28 completion:v25 onQueue:v16];
  }
}

+ (void)mapDictionary:(id)a3 withBlock:(id)a4 completion:(id)a5 onQueue:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  sub_1002CEC94();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [a1 mapDictionary:v13 onQueue:v14 withBlock:v12 completion:v11 onQueue:v10];
}

+ (void)mapDictionary:(id)a3 onQueue:(id)a4 withBlock:(id)a5 completion:(id)a6 onQueue:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v32 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = v14;
  if (v12)
  {
    queue = v14;
    v30 = v13;
    dispatch_group_t v16 = dispatch_group_create();
    id v17 = objc_alloc_init((Class)NSMutableDictionary);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v31 = v11;
    id v18 = v11;
    id v19 = [v18 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v44;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v44 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          id v24 = [v18 objectForKeyedSubscript:v23];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1002CF414;
          block[3] = &unk_100988008;
          v25 = v16;
          v37 = v25;
          id v42 = v32;
          uint64_t v38 = v23;
          id v39 = v24;
          id v26 = v12;
          v40 = v26;
          id v41 = v17;
          id v27 = v24;
          dispatch_group_async(v25, v26, block);
        }
        id v20 = [v18 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v20);
    }

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1002CF644;
    v33[3] = &unk_10097E818;
    id v13 = v30;
    id v34 = v17;
    id v35 = v30;
    id v28 = v17;
    id v15 = queue;
    dispatch_group_notify(v16, queue, v33);

    id v11 = v31;
  }
}

@end