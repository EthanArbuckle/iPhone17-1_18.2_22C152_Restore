@interface DASProcessor
+ (void)initialize;
- (id)_dump:(id)a3;
- (void)_nameAll:(id)a3;
- (void)dumpAllWithCompletion:(id)a3;
- (void)nameAllWithCompletion:(id)a3;
- (void)nameAndDumpAllWithCompletion:(id)a3;
- (void)stitchWithInfo:(id)a3 completion:(id)a4;
@end

@implementation DASProcessor

+ (void)initialize
{
  if (qword_1000153F8 != -1) {
    dispatch_once(&qword_1000153F8, &stru_1000105B8);
  }
}

- (id)_dump:(id)a3
{
  id v3 = a3;
  v4 = sub_100005E28();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "archiving all display hierarchies", buf, 2u);
  }

  v5 = +[NSMutableDictionary dictionary];
  v7 = [v3 parseErrors];
  id v8 = [v7 mutableCopy];

  v9 = [v3 displays];
  id v10 = [v9 count];

  if (!v10)
  {
    v11 = sub_100005E28();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = [v3 raw];
      *(_DWORD *)buf = 138412290;
      v24 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "failed to find any displays to dump : info=%@", buf, 0xCu);
    }
  }
  v12 = [v3 displays];
  v13 = [v12 array];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000651C;
  v19[3] = &unk_1000108C8;
  id v14 = v3;
  id v20 = v14;
  id v21 = v8;
  id v15 = v5;
  id v22 = v15;
  id v16 = v8;
  objc_msgSend(v13, "bs_each:", v19);

  return v15;
}

- (void)_nameAll:(id)a3
{
  id v3 = a3;
  v5 = sub_100005E28();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "naming layers of all contexts", buf, 2u);
  }

  v6 = +[NSMutableSet set];
  v7 = [v3 contexts];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100009D98;
  v15[3] = &unk_100010738;
  id v16 = v6;
  id v8 = v6;
  objc_msgSend(v7, "bs_each:", v15);

  objc_msgSend(v8, "bs_each:", &stru_100010778);
  +[NSMutableSet set];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_100009E04;
  v13 = &unk_1000107A0;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v14;
  objc_msgSend(v8, "bs_each:", &v10);
  usleep(0x493E0u);
  objc_msgSend(v9, "bs_each:", &stru_1000107E0, v10, v11, v12, v13);
}

- (void)stitchWithInfo:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v47 = (void (**)(id, void *))a4;
  v52 = +[NSMutableDictionary dictionary];
  v53 = +[NSMutableDictionary dictionary];
  v54 = v5;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = [v5 contexts];
  id v6 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v50 = *(void *)v76;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v76 != v50) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        [sub_1000074E0() begin];
        v12 = +[NSMutableOrderedSet orderedSetWithObject:v9];
        v73[0] = _NSConcreteStackBlock;
        v73[1] = 3221225472;
        v73[2] = sub_10000A6E4;
        v73[3] = &unk_100010600;
        id v74 = v12;
        id v13 = v12;
        id v14 = objc_retainBlock(v73);
        id v15 = [v9 description];
        id v16 = +[NSOrderedSet orderedSetWithObject:v9];
        sub_100006F0C(v15, v16, v54, v14, 0);

        [v13 removeObject:v9];
        id v17 = [v13 copy];
        [v53 setObject:v17 forKey:v9];

        [sub_1000074E0() commit];
      }
      id v7 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
    }
    while (v7);
  }

  v18 = [v54 contexts];
  id v19 = [v18 mutableCopy];

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v20 = [v54 contexts];
  id v21 = [v20 countByEnumeratingWithState:&v69 objects:v83 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v70;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v70 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v69 + 1) + 8 * (void)j);
        v26 = [v53 objectForKey:v25];
        if ([v26 count])
        {
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          id v27 = v26;
          id v28 = [v27 countByEnumeratingWithState:&v65 objects:v82 count:16];
          if (v28)
          {
            id v29 = v28;
            uint64_t v30 = *(void *)v66;
            do
            {
              for (k = 0; k != v29; k = (char *)k + 1)
              {
                if (*(void *)v66 != v30) {
                  objc_enumerationMutation(v27);
                }
                [v19 removeObject:*(void *)(*((void *)&v65 + 1) + 8 * (void)k)];
              }
              id v29 = [v27 countByEnumeratingWithState:&v65 objects:v82 count:16];
            }
            while (v29);
          }
        }
        else
        {
          [v19 removeObject:v25];
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v69 objects:v83 count:16];
    }
    while (v22);
  }

  if (![v19 count])
  {
    v32 = sub_100005E28();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v81 = v54;
      _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "failed to find any roots to dump in %@", buf, 0xCu);
    }
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v48 = v19;
  id v33 = [v48 countByEnumeratingWithState:&v61 objects:v79 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v51 = *(void *)v62;
    do
    {
      for (m = 0; m != v34; m = (char *)m + 1)
      {
        if (*(void *)v62 != v51) {
          objc_enumerationMutation(v48);
        }
        v36 = *(void **)(*((void *)&v61 + 1) + 8 * (void)m);
        [sub_1000074E0() begin];
        v39 = +[NSMutableOrderedSet orderedSetWithObject:v36];
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = sub_10000A6F0;
        v59[3] = &unk_100010600;
        id v40 = v39;
        id v60 = v40;
        v41 = objc_retainBlock(v59);
        v42 = [v36 description];
        v43 = +[NSOrderedSet orderedSetWithObject:v36];
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_10000A6FC;
        v55[3] = &unk_100010710;
        v55[4] = v36;
        id v44 = v54;
        id v56 = v44;
        id v57 = v52;
        id v58 = v40;
        id v45 = v40;
        sub_100006F0C(v42, v43, v44, v41, v55);

        [sub_1000074E0() commit];
      }
      id v34 = [v48 countByEnumeratingWithState:&v61 objects:v79 count:16];
    }
    while (v34);
  }

  v47[2](v47, v52);
}

- (void)dumpAllWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  if (!v4)
  {
    id v9 = sub_100005E28();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    __int16 v12 = 0;
    id v10 = "ignoring archive request because no completion handler was supplied";
    uint64_t v11 = (uint8_t *)&v12;
LABEL_10:
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
    goto LABEL_7;
  }
  sub_10000B420();
  if (!v5)
  {
    id v9 = sub_100005E28();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    id v10 = "could not find default render server";
    uint64_t v11 = buf;
    goto LABEL_10;
  }
  mach_port_name_t v6 = v5;
  id v7 = +[DASRenderServerInfo infoFromServerWithPort:v5];
  mach_port_deallocate(mach_task_self_, v6);
  id v8 = [(DASProcessor *)self _dump:v7];
  v4[2](v4, v8, 0);

LABEL_8:
}

- (void)nameAndDumpAllWithCompletion:(id)a3
{
  v4 = (void (**)(id, NSObject *, void))a3;
  sub_10000B420();
  if (v5)
  {
    mach_port_name_t v6 = v5;
    id v7 = +[DASRenderServerInfo infoFromServerWithPort:v5];
    mach_port_deallocate(mach_task_self_, v6);
    [(DASProcessor *)self _nameAll:v7];
    if (v4)
    {
      id v8 = [(DASProcessor *)self _dump:v7];
      v4[2](v4, v8, 0);
    }
    else
    {
      id v8 = sub_100005E28();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        __int16 v10 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "ignoring archive request because no completion handler was supplied", (uint8_t *)&v10, 2u);
      }
    }
    goto LABEL_10;
  }
  id v9 = sub_100005E28();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __int16 v10 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "could not find default render server", (uint8_t *)&v10, 2u);
  }

  if (v4)
  {
    NSErrorUserInfoKey v11 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v12 = @"could not find default render server";
    id v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v8 = +[NSError errorWithDomain:NSMachErrorDomain code:5 userInfo:v7];
    ((void (**)(id, NSObject *, NSObject *))v4)[2](v4, 0, v8);
LABEL_10:
  }
}

- (void)nameAllWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  sub_10000B420();
  if (v5)
  {
    mach_port_name_t v6 = v5;
    id v7 = +[DASRenderServerInfo infoFromServerWithPort:v5];
    mach_port_deallocate(mach_task_self_, v6);
    [(DASProcessor *)self _nameAll:v7];
    if (v4) {
      v4[2](v4, 0);
    }
  }
  else
  {
    id v8 = sub_100005E28();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)NSErrorUserInfoKey v11 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "could not find default render server", v11, 2u);
    }

    if (v4)
    {
      NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v13 = @"could not find default render server";
      id v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      __int16 v10 = +[NSError errorWithDomain:NSMachErrorDomain code:5 userInfo:v9];
      ((void (**)(id, void *))v4)[2](v4, v10);
    }
  }
}

@end