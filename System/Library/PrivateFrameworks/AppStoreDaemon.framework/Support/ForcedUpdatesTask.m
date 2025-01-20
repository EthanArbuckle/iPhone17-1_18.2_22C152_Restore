@interface ForcedUpdatesTask
- (void)main;
@end

@implementation ForcedUpdatesTask

- (void)main
{
  v2 = self;
  if (self)
  {
    v3 = objc_opt_new();
    v4 = sub_10030B11C();
    id v5 = &__NSArray0__struct;
    v6 = sub_10030BA90((uint64_t)v4, @"invalid-build-tools/invalid-versions", &__NSArray0__struct);

    v7 = sub_1003F4848();
    if (([v7 isEqualToArray:v6] & 1) == 0) {
      id v5 = v6;
    }

    v8 = sub_10030B11C();
    *(void *)&long long v44 = 0;
    v9 = sub_10030B948((uint64_t)v8, @"drm-recovery", &v44);
    id v10 = (id)v44;

    if (v10)
    {
      v11 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        logKey = v2->_logKey;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = logKey;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%@] Error looking up DRM recovery key: %{public}@", buf, 0x16u);
      }
    }
    if ([v5 count] || v9)
    {
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1003A60A4;
      v40[3] = &unk_100526A88;
      v40[4] = v2;
      id v13 = v5;
      id v41 = v13;
      id v42 = v9;
      id v43 = v3;
      +[ApplicationProxy enumerateApplicationsOfType:0 usingBlock:v40];
      sub_1003F49BC((uint64_t)AppDefaultsManager, v13);
    }
    if ([v3 count])
    {
      v34 = v9;
      id v35 = v5;
      v37 = v2;
      v33 = objc_opt_new();
      v36 = v3;
      id v14 = v3;
      v15 = objc_opt_new();
      v39 = +[ACAccountStore ams_sharedAccountStore];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id obj = v14;
      id v16 = [obj countByEnumeratingWithState:&v44 objects:buf count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v45;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v45 != v18) {
              objc_enumerationMutation(obj);
            }
            v20 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            v21 = [v20 downloaderDSID];
            if (sub_1002F35F4(v21))
            {
              v22 = objc_msgSend(v39, "ams_iTunesAccountWithDSID:", v21);
            }
            else
            {
              v22 = 0;
            }
            v23 = [v20 purchaserDSID];
            v24 = v23;
            if (!v22)
            {
              if (!sub_1002F35F4(v23)
                || (objc_msgSend(v39, "ams_iTunesAccountWithDSID:", v24),
                    (v22 = objc_claimAutoreleasedReturnValue()) == 0))
              {
                v22 = objc_msgSend(v39, "ams_activeiTunesAccount");
              }
            }
            v25 = objc_msgSend(v22, "ams_DSID");

            if (v25)
            {
              v26 = objc_msgSend(v22, "ams_DSID");
              v27 = [v15 objectForKeyedSubscript:v26];

              if (!v27) {
                v27 = objc_opt_new();
              }
              [v27 addObject:v20];
              v28 = objc_msgSend(v22, "ams_DSID");
              [v15 setObject:v27 forKeyedSubscript:v28];
            }
          }
          id v17 = [obj countByEnumeratingWithState:&v44 objects:buf count:16];
        }
        while (v17);
      }

      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_1003A62B4;
      v49 = &unk_10052B6A8;
      v2 = v37;
      id v50 = obj;
      v51 = v37;
      id v29 = v33;
      id v52 = v29;
      [v15 enumerateKeysAndObjectsUsingBlock:buf];
      v30 = v52;
      v31 = (NSArray *)v29;

      id v5 = v35;
      v3 = v36;
      v9 = v34;
    }
    else
    {
      v31 = 0;
    }
  }
  else
  {
    v31 = 0;
  }
  updates = v2->_updates;
  v2->_updates = v31;

  [(Task *)v2 completeWithSuccess];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end