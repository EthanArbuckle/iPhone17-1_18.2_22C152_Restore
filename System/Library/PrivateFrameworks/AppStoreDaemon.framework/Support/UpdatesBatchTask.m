@interface UpdatesBatchTask
- (void)main;
@end

@implementation UpdatesBatchTask

- (void)main
{
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v69 = sub_1003D7700;
  v70 = &unk_10052C2E8;
  v71 = self;
  v3 = v68;
  v64 = self;
  if (self)
  {
    v4 = +[ACAccountStore ams_sharedAccountStore];
    v5 = objc_opt_new();
    id v6 = (id)objc_opt_new();
    v7 = sub_10030B11C();
    unsigned int v8 = sub_10030CE24(v7, @"ignore-maid-accounts", 0, 0);

    if (v8)
    {
      v9 = v6;
      id v6 = [(NSArray *)v64->_apps mutableCopy];
    }
    else
    {
      v62 = v4;
      v63 = v3;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      v10 = self->_apps;
      id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v80 objects:v93 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v81;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v81 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v80 + 1) + 8 * i);
            if ([v15 isB2BCustomApp])
            {
              v16 = [UpdatableApp alloc];
              v17 = [v15 storeItemID];
              v18 = [v15 storeExternalVersionID];
              v19 = sub_100332AB8((id *)&v16->super.isa, v17, v18);
              [v5 addObject:v19];
            }
            else
            {
              [v6 addObject:v15];
            }
          }
          id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v80 objects:v93 count:16];
        }
        while (v12);
      }

      if (![v5 count])
      {
        v3 = v63;
LABEL_42:
        v4 = v62;
        goto LABEL_43;
      }
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      v20 = +[ACAccountStore ams_sharedAccountStore];
      v21 = objc_msgSend(v20, "ams_iTunesAccounts");

      id v22 = [v21 countByEnumeratingWithState:&v76 objects:v92 count:16];
      v3 = v63;
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v77;
LABEL_17:
        uint64_t v25 = 0;
        while (1)
        {
          if (*(void *)v77 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v76 + 1) + 8 * v25);
          if (objc_msgSend(v26, "ams_isManagedAppleID")) {
            break;
          }
          if (v23 == (id)++v25)
          {
            id v23 = [v21 countByEnumeratingWithState:&v76 objects:v92 count:16];
            if (v23) {
              goto LABEL_17;
            }
            goto LABEL_23;
          }
        }
        id v27 = v26;

        if (!v27) {
          goto LABEL_42;
        }
        v28 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          logKey = v64->_logKey;
          v30 = objc_msgSend(v27, "ams_DSID");
          *(_DWORD *)buf = 138412546;
          v89 = logKey;
          __int16 v90 = 2114;
          v91 = v30;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[%@] ╒ Checking for updates for MAID: %{public}@", buf, 0x16u);
        }
        id v61 = v27;

        long long v75 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v72 = 0u;
        id v31 = v5;
        id v32 = [v31 countByEnumeratingWithState:&v72 objects:buf count:16];
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void *)v73;
          do
          {
            for (j = 0; j != v33; j = (char *)j + 1)
            {
              if (*(void *)v73 != v34) {
                objc_enumerationMutation(v31);
              }
              uint64_t v36 = *(void *)(*((void *)&v72 + 1) + 8 * (void)j);
              v37 = ASDLogHandleForCategory();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                v38 = v64->_logKey;
                *(_DWORD *)v84 = 138412546;
                *(void *)&v84[4] = v38;
                *(_WORD *)&v84[12] = 2114;
                *(void *)&v84[14] = v36;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[%@] ├ %{public}@", v84, 0x16u);
              }
            }
            id v33 = [v31 countByEnumeratingWithState:&v72 objects:buf count:16];
          }
          while (v33);
        }

        v39 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = v64->_logKey;
          *(_DWORD *)v84 = 138412290;
          *(void *)&v84[4] = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "[%@] ╘", v84, 0xCu);
        }

        v3 = v63;
        v9 = v61;
        v69((uint64_t)v63, v61, v31);
      }
      else
      {
LABEL_23:
        v9 = v21;
      }
      v4 = v62;
    }

LABEL_43:
    v41 = sub_100392008(v6, &stru_10052C350);
    *(void *)v84 = _NSConcreteStackBlock;
    *(void *)&v84[8] = 3221225472;
    *(void *)&v84[16] = sub_1003D7FE4;
    v85 = &unk_10052C378;
    id v86 = v4;
    v87 = v3;
    id v42 = v4;
    [v41 enumerateKeysAndObjectsUsingBlock:v84];
  }
  v43 = objc_opt_new();
  updates = v64->_updates;
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_1003D7F34;
  v66[3] = &unk_10052C310;
  id v45 = v43;
  id v67 = v45;
  [(NSMutableArray *)updates enumerateObjectsUsingBlock:v66];
  v46 = sub_1003A5AEC((uint64_t)ForcedUpdatesTask, v45, v64->_logKey);
  id v65 = 0;
  unsigned int v47 = [(Task *)v64 runSubTask:v46 returningError:&v65];
  id v48 = v65;
  if (!v47)
  {
    v59 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v60 = v64->_logKey;
      *(_DWORD *)v93 = 138412546;
      v94 = v60;
      __int16 v95 = 2114;
      id v96 = v48;
      _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "[%@] Failed to run forced updates task: %{public}@", v93, 0x16u);
    }
    goto LABEL_57;
  }
  if (v46) {
    v49 = (void *)v46[7];
  }
  else {
    v49 = 0;
  }
  id v50 = v49;
  id v51 = [v50 count];

  if (v51)
  {
    v52 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = v64->_logKey;
      if (v46) {
        v54 = (void *)v46[7];
      }
      else {
        v54 = 0;
      }
      id v55 = v54;
      id v56 = [v55 count];
      *(_DWORD *)v93 = 138412546;
      v94 = v53;
      __int16 v95 = 2048;
      id v96 = v56;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "[%@] Received %lu forced update(s)", v93, 0x16u);
    }
    v57 = v64->_updates;
    if (v46) {
      v58 = (void *)v46[7];
    }
    else {
      v58 = 0;
    }
    v59 = v58;
    [(NSMutableArray *)v57 addObjectsFromArray:v59];
LABEL_57:
  }
  [(Task *)v64 completeWithSuccess];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_apps, 0);
}

@end