@interface SystemAppLookupTask
- (void)main;
@end

@implementation SystemAppLookupTask

- (void)main
{
  v2 = self;
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_bundleIDs, "count"));
  v4 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    bundleIDs = v2->_bundleIDs;
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = bundleIDs;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Looking up system apps for bundle IDs: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v6 = (void *)MGGetStringAnswer();
  v7 = (void *)MGGetStringAnswer();
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100301CEC;
  v47[3] = &unk_1005277B8;
  id v8 = v6;
  id v48 = v8;
  id v39 = v7;
  id v49 = v39;
  v9 = objc_retainBlock(v47);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v10 = v2->_bundleIDs;
  id v42 = [(NSArray *)v10 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (!v42)
  {

    v11 = 0;
LABEL_40:
    [(Task *)v2 lock];
    v35 = (NSArray *)[v3 copy];
    lookupResults = v2->_lookupResults;
    v2->_lookupResults = v35;

    [(Task *)v2 unlock];
    [(Task *)v2 completeWithSuccess];
    goto LABEL_41;
  }
  id v37 = v8;
  v38 = v2;
  v11 = 0;
  char v12 = 0;
  obj = v10;
  uint64_t v41 = *(void *)v44;
  do
  {
    for (i = 0; i != v42; i = (char *)i + 1)
    {
      if (*(void *)v44 != v41) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void *)(*((void *)&v43 + 1) + 8 * i);
      id v15 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.SystemApp"];
      uint64_t v16 = ((uint64_t (*)(void *, id, uint64_t))v9[2])(v9, v15, v14);
      uint64_t v17 = v16;
      if (v12)
      {
        char v12 = 1;
        goto LABEL_18;
      }
      if (v16 != 2)
      {
        v18 = [v15 results];
        if ([v18 count])
        {
          unsigned __int8 v19 = [v15 isCatalogFetchedWithinThePastFewDays:1];

          if (v19)
          {
            char v12 = 0;
            goto LABEL_18;
          }
        }
        else
        {
        }
      }
      v20 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Downloading MobileAsset catalog", (uint8_t *)&buf, 2u);
      }

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v53 = 0x3032000000;
      v54 = sub_100018188;
      v55 = sub_100017C80;
      id v56 = 0;
      v21 = dispatch_get_global_queue(25, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1003013C0;
      block[3] = &unk_1005243D0;
      block[4] = &buf;
      dispatch_sync(v21, block);

      id v22 = *(id *)(*((void *)&buf + 1) + 40);
      _Block_object_dispose(&buf, 8);

      id v23 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.SystemApp"];
      uint64_t v17 = ((uint64_t (*)(void *, id, uint64_t))v9[2])(v9, v23, v14);
      char v12 = 1;
      id v15 = v23;
      v11 = v22;
LABEL_18:
      v24 = ASDLogHandleForCategory();
      v25 = v24;
      if (v17)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = v17;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "MAAssetQuery failed with error %ld", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v26 = [v15 results];
          id v27 = [v26 count];
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = v27;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Received %lu system app asset(s)", (uint8_t *)&buf, 0xCu);
        }
        v28 = [v15 results];
        v25 = [v28 firstObject];

        v29 = ASDLogHandleForCategory();
        v30 = v29;
        if (v25)
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v25;
            _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Discovered matching asset: %{public}@", (uint8_t *)&buf, 0xCu);
          }

          v31 = [SystemAppLookupItem alloc];
          v30 = [v25 assetServerUrl];
          v32 = [v25 attributes];
          v33 = sub_1002AF2C4((id *)&v31->super.isa, v30, v32);
          [v3 addObject:v33];
        }
        else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v14;
          _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Asset for %{public}@ not found in catalog.", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    id v42 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  }
  while (v42);

  if (!v11)
  {
    v2 = v38;
    goto LABEL_39;
  }
  v2 = v38;
  if ([v3 count])
  {
LABEL_39:
    id v8 = v37;
    goto LABEL_40;
  }
  v34 = ASDLogHandleForCategory();
  id v8 = v37;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to lookup system app asset(s): %{public}@", (uint8_t *)&buf, 0xCu);
  }

  [(Task *)v38 completeWithError:v11];
LABEL_41:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupResults, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

@end