@interface ValidateAppleIDsTask
- (void)main;
@end

@implementation ValidateAppleIDsTask

- (void)main
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Validation] Scanning installed applications for outdated metadata", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v5 = +[ACAccountStore ams_sharedAccountStore];
  v6 = objc_msgSend(v5, "ams_iTunesAccounts");
  id v7 = [v6 copy];

  id v8 = [v7 countByEnumeratingWithState:&v57 objects:v68 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v58;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v58 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "ams_DSID");
        if (v13)
        {
          uint64_t v14 = [v12 username];
          if (v14)
          {
            v15 = (void *)v14;
            v16 = objc_msgSend(v12, "ams_altDSID");

            if (v16) {
              [v4 setObject:v12 forKeyedSubscript:v13];
            }
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v57 objects:v68 count:16];
    }
    while (v9);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v17 = sub_1004280A0((uint64_t)LSApplicationRecord, 0, 0);
  id v50 = [v17 countByEnumeratingWithState:&v53 objects:v67 count:16];
  if (v50)
  {
    uint64_t v18 = *(void *)v54;
    v48 = v17;
    uint64_t v49 = *(void *)v54;
    v47 = self;
LABEL_16:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v54 != v18) {
        objc_enumerationMutation(v17);
      }
      v20 = *(void **)(*((void *)&v53 + 1) + 8 * v19);
      Property = sub_100428520(v20);
      v24 = Property;
      if (Property) {
        Property = objc_getProperty(Property, v23, 16, 1);
      }
      v25 = Property;

      if (!v25)
      {
        v45 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v46 = [v20 bundleIdentifier];
          *(_DWORD *)buf = 138543362;
          v62 = v46;
          _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "[Validation] Skipping validation for %{public}@: No owner available or unowned application", buf, 0xCu);
        }
LABEL_55:

        goto LABEL_56;
      }
      context = v21;
      v26 = [v4 objectForKeyedSubscript:v25];
      if (!v26)
      {
        v28 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v42 = [v20 bundleIdentifier];
          *(_DWORD *)buf = 138543618;
          v62 = v42;
          __int16 v63 = 2114;
          v64 = v25;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "[Validation] Skipping validation for %{public}@: No account available for %{public}@", buf, 0x16u);
        }
        int v34 = 1;
        goto LABEL_46;
      }
      v27 = sub_10042889C(v20);
      v28 = v27;
      if (!v27)
      {
        v29 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v43 = [v20 bundleIdentifier];
          *(_DWORD *)buf = 138543362;
          v62 = v43;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[Validation] Skipping validation for %{public}@: Could not read existing metadata", buf, 0xCu);
        }
        int v34 = 1;
        goto LABEL_45;
      }
      v29 = [v27 appleID];
      if (v29)
      {
        v30 = [v26 username];
        unsigned int v31 = [v29 isEqualToString:v30];

        if (v31)
        {
          v32 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = [v20 bundleIdentifier];
            *(_DWORD *)buf = 138543362;
            v62 = v33;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[Validation] Completed validation for %{public}@: Metadata already up to date", buf, 0xCu);
          }
          int v34 = 1;
          goto LABEL_44;
        }
      }
      v35 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = [v20 bundleIdentifier];
        v37 = [v26 username];
        *(_DWORD *)buf = 138543875;
        v62 = v36;
        __int16 v63 = 2113;
        v64 = v29;
        __int16 v65 = 2113;
        v66 = v37;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[Validation] Updating metadata for: %{public}@, current Apple ID: '%{private}@' updated Apple ID: '%{private}@'", buf, 0x20u);

        v17 = v48;
      }

      sub_100401854(v28, v26);
      v38 = [v20 bundleIdentifier];
      id v52 = 0;
      sub_100401B48(v28, v38, 0, &v52);
      v32 = v52;

      v39 = ASDLogHandleForCategory();
      v40 = v39;
      if (v32)
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v41 = [v20 bundleIdentifier];
          *(_DWORD *)buf = 138543618;
          v62 = v41;
          __int16 v63 = 2114;
          v64 = v32;
          _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "[Validation] Failed to update metadata for: %{public}@, error occurred: %{public}@", buf, 0x16u);
LABEL_42:

          v17 = v48;
        }
      }
      else if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v41 = [v20 bundleIdentifier];
        *(_DWORD *)buf = 138543362;
        v62 = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "[Validation] Completed validation for %{public}@: Metadata successfully updated", buf, 0xCu);
        goto LABEL_42;
      }

      int v34 = 0;
LABEL_44:

      uint64_t v18 = v49;
LABEL_45:

LABEL_46:
      if (v34) {
        goto LABEL_55;
      }
      if (v50 == (id)++v19)
      {
        self = v47;
        id v50 = [v17 countByEnumeratingWithState:&v53 objects:v67 count:16];
        if (v50) {
          goto LABEL_16;
        }
        break;
      }
    }
  }

  v44 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "[Validation] Completed scan for installed applications with outdated metadata", buf, 2u);
  }

  [(Task *)self completeWithSuccess];
LABEL_56:
}

@end