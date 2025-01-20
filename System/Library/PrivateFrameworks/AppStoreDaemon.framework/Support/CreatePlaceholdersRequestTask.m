@interface CreatePlaceholdersRequestTask
- (id)initForClient:(id)a3 withOptions:(id)a4;
- (void)main;
@end

@implementation CreatePlaceholdersRequestTask

- (id)initForClient:(id)a3 withOptions:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CreatePlaceholdersRequestTask;
  v4 = [(RequestTask *)&v8 initForClient:a3 withOptions:a4];
  if (v4)
  {
    v5 = objc_alloc_init(_TtC9appstored6LogKey);
    v6 = (void *)v4[8];
    v4[8] = v5;
  }
  return v4;
}

- (void)main
{
  v2 = self;
  if (self) {
    options = self->super._options;
  }
  else {
    options = 0;
  }
  v4 = options;
  v5 = [(ASDRequestOptions *)v4 items];
  id v6 = [v5 mutableCopy];

  v99 = (char *)[v6 count];
  v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v2) {
      logKey = v2->_logKey;
    }
    else {
      logKey = 0;
    }
    *(_DWORD *)buf = 138412546;
    v128 = logKey;
    __int16 v129 = 2048;
    v130 = v99;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] Creating placeholders for %lu app(s)", buf, 0x16u);
  }

  if ([v6 count])
  {
    v9 = 0;
    id v100 = v6;
    do
    {
      if ((unint64_t)[v6 count] < 0x15)
      {
        id v10 = [v6 copy];
        [v6 removeAllObjects];
      }
      else
      {
        objc_msgSend(v6, "subarrayWithRange:", 0, 20);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeObjectsInRange:", 0, 20);
      }
      id v12 = v10;
      v13 = v12;
      if (v2)
      {
        uint64_t v14 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v12 count]);
        v15 = sub_100259614();
        unsigned int v16 = [v15 isConnected];

        if (v16)
        {
          v17 = sub_1003923F8(v13, &stru_1005294B8);
          id v18 = objc_alloc((Class)AMSMediaTask);
          v19 = sub_10030B11C();
          id v20 = [v18 initWithType:0 clientIdentifier:@"appstore" clientVersion:@"1" bag:v19];

          [v20 setItemIdentifiers:v17];
          v21 = sub_1000169A4();
          [v20 setClientInfo:v21];

          v22 = [(LogKey *)v2->_logKey description];
          [v20 setLogKey:v22];

          v23 = +[ACAccountStore ams_sharedAccountStore];
          objc_msgSend(v23, "ams_activeiTunesAccount");
          v25 = v24 = (void *)v14;
          [v20 setAccount:v25];

          [v20 setAdditionalQueryParams:&off_10054E2E8];
          dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
          v27 = [v20 perform];
          v118[0] = _NSConcreteStackBlock;
          v118[1] = 3221225472;
          v118[2] = sub_10035DA6C;
          v118[3] = &unk_1005294E0;
          uint64_t v28 = (uint64_t)v24;
          id v119 = v24;
          v120 = v2;
          v29 = v26;
          v121 = v29;
          [v27 addFinishBlock:v118];
          dispatch_time_t v30 = dispatch_time(0, 10000000000);
          if (dispatch_semaphore_wait(v29, v30))
          {
            v31 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              v98 = v2->_logKey;
              *(_DWORD *)buf = 138412290;
              v128 = v98;
              _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "[%@] Placeholder artwork will be missing, media task timed out", buf, 0xCu);
            }
          }
          uint64_t v14 = v28;
        }
        else
        {
          v17 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v32 = v2->_logKey;
            *(_DWORD *)buf = 138412290;
            v128 = v32;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[%@] Placeholder artwork will be missing, no network available", buf, 0xCu);
          }
        }

        v103 = v9;
        v101 = v11;
        v104 = (void *)v14;
        if (os_variant_has_internal_content())
        {
          v33 = v2->super._options;
          unsigned int v108 = [(ASDRequestOptions *)v33 createAsMobileBackup];
        }
        else
        {
          unsigned int v108 = 0;
        }
        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        v102 = v13;
        id obj = v13;
        id v107 = [obj countByEnumeratingWithState:&v114 objects:buf count:16];
        if (v107)
        {
          uint64_t v106 = *(void *)v115;
          do
          {
            uint64_t v34 = 0;
            do
            {
              if (*(void *)v115 != v106) {
                objc_enumerationMutation(obj);
              }
              uint64_t v109 = v34;
              v35 = *(void **)(*((void *)&v114 + 1) + 8 * v34);
              v36 = [_TtC9appstored6LogKey alloc];
              v37 = v2;
              v38 = v2->_logKey;
              v39 = [(LogKey *)v38 description];
              uint64_t v40 = [v35 bundleID];
              v41 = (void *)v40;
              if (v40) {
                CFStringRef v42 = (const __CFString *)v40;
              }
              else {
                CFStringRef v42 = &stru_10052E4D8;
              }
              v126[0] = v42;
              v43 = [v35 itemID];
              uint64_t v44 = [v43 stringValue];
              v45 = (void *)v44;
              if (v44) {
                CFStringRef v46 = (const __CFString *)v44;
              }
              else {
                CFStringRef v46 = &stru_10052E4D8;
              }
              v126[1] = v46;
              v47 = +[NSArray arrayWithObjects:v126 count:2];
              v48 = [(LogKey *)v36 initWithBase:v39 IDs:v47];

              v49 = objc_alloc_init(CoordinatorBuilder);
              v50 = [v35 bundleID];
              v52 = v50;
              if (v49)
              {
                objc_setProperty_atomic(v49, v51, v50, 8);

                v49->_intent = 3;
                objc_setProperty_atomic(v49, v53, v48, 40);
                v54 = v48;
                if (v108) {
                  v49->_clientID = 2;
                }
              }
              else
              {

                v54 = v48;
              }
              id v113 = 0;
              v55 = sub_1003BFC54(v49, &v113);
              v56 = v113;
              v57 = v56;
              v2 = v37;
              if (!v55)
              {
                v63 = ASDLogHandleForCategory();
                if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v122 = 138412546;
                  v123 = v54;
                  __int16 v124 = 2114;
                  v125 = v57;
                  _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "[%@] Could not create coordinator: %{public}@", v122, 0x16u);
                }

                goto LABEL_76;
              }
              if (v108)
              {
                v58 = v54;
                v59 = v37->super._options;
                unsigned int v60 = [(ASDRequestOptions *)v59 completeDataPromise];

                v54 = v58;
                if (v60)
                {
                  v61 = ASDLogHandleForCategory();
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v122 = 138412546;
                    v123 = v58;
                    __int16 v124 = 2114;
                    v125 = v57;
                    _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "[%@] Could not complete user data promise: %{public}@", v122, 0x16u);
                  }

                  sub_100279B34(v55, 0);
                }
                v112 = v57;
                if ([v55 conformsToProtocol:&OBJC_PROTOCOL___IXCoordinatorWithAppAssetPromise])unsigned __int8 v62 = objc_msgSend(v55, "setAppAssetPromiseResponsibleClient:error:", 1, &v112); {
                else
                }
                  unsigned __int8 v62 = 0;
                v64 = v112;

                if ((v62 & 1) == 0)
                {
                  v65 = ASDLogHandleForCategory();
                  if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v122 = 138412546;
                    v123 = v54;
                    __int16 v124 = 2114;
                    v125 = v64;
                    _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "[%@] Could not set App Store as app asset DRI: %{public}@", v122, 0x16u);
                  }
                }
              }
              else
              {
                v64 = v56;
              }

              if (sub_100279094(v55))
              {
                v57 = ASDLogHandleForCategory();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v122 = 138412290;
                  v123 = v54;
                  _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "[%@] Coordinator already has a configured placeholder", v122, 0xCu);
                }
              }
              else
              {
                v49 = objc_alloc_init(PlaceholderBuilder);
                v66 = [v35 itemID];
                v68 = [v104 objectForKeyedSubscript:v66];
                if (v49) {
                  objc_setProperty_atomic(v49, v67, v68, 32);
                }

                v70 = [v35 itemName];
                if (v49) {
                  objc_setProperty_atomic(v49, v69, v70, 48);
                }

                v71 = [v35 bundleID];
                v73 = v71;
                if (v49)
                {
                  objc_setProperty_atomic(v49, v72, v71, 40);

                  v49[1]._clientID = 2;
                  v74 = v54;
                  objc_setProperty_atomic(v49, v75, v54, 88);
                  v49[1]._priority = 0;
                }
                else
                {
                  v74 = v54;
                }
                id v76 = objc_alloc_init((Class)MIStoreMetadata);
                v77 = [v35 vendorName];
                [v76 setArtistName:v77];

                v78 = [v35 bundleID];
                [v76 setSoftwareVersionBundleID:v78];

                v79 = [v35 itemName];
                [v76 setItemName:v79];

                v80 = [v35 itemID];
                [v76 setItemID:v80];

                v81 = [v35 externalVersionIdentifier];
                [v76 setSoftwareVersionExternalIdentifier:v81];

                v82 = [v35 storeFront];
                [v76 setStorefront:v82];

                v83 = [v35 accountName];
                [v76 setAppleID:v83];

                v84 = [v35 accountID];
                [v76 setDSPersonID:v84];

                v85 = [v35 downloaderID];
                [v76 setDownloaderID:v85];

                v86 = [v35 familyID];
                [v76 setFamilyID:v86];

                v87 = [v35 purchaserDSID];
                [v76 setPurchaserID:v87];

                v88 = [v35 altDSID];
                [v76 setAltDSID:v88];

                objc_msgSend(v76, "setDeviceBasedVPP:", objc_msgSend(v35, "deviceBasedVPP"));
                [v76 setSourceApp:@"com.apple.AppStore"];
                if (v49) {
                  objc_setProperty_atomic(v49, v89, v76, 120);
                }

                id v111 = 0;
                v90 = sub_10032A178((uint64_t)v49, &v111);
                v91 = v111;
                v57 = v91;
                if (!v90)
                {
                  v94 = ASDLogHandleForCategory();
                  if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v122 = 138412546;
                    v54 = v74;
                    v123 = v74;
                    __int16 v124 = 2114;
                    v125 = v57;
                    _os_log_error_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "[%@] Could not build placeholder for coordinator: %{public}@", v122, 0x16u);
                    goto LABEL_75;
                  }
LABEL_74:
                  v54 = v74;
                  goto LABEL_75;
                }
                v110 = v91;
                unsigned __int8 v92 = sub_10027A504(v55, v90, &v110);
                v93 = v110;

                if ((v92 & 1) == 0)
                {
                  v94 = ASDLogHandleForCategory();
                  if (!os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                  {
                    v57 = v93;
                    goto LABEL_74;
                  }
                  *(_DWORD *)v122 = 138412546;
                  v54 = v74;
                  v123 = v74;
                  __int16 v124 = 2114;
                  v125 = v93;
                  _os_log_error_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "[%@] Could not set placeholder for coordinator: %{public}@", v122, 0x16u);
                  v57 = v93;
LABEL_75:

                  [v55 cancelForReason:v57 client:1 error:0];
LABEL_76:

                  goto LABEL_77;
                }

                v57 = ASDLogHandleForCategory();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v122 = 138412290;
                  v54 = v74;
                  v123 = v74;
                  _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "[%@] Placeholder created successfully", v122, 0xCu);
                }
                else
                {
                  v54 = v74;
                }
              }
LABEL_77:

              uint64_t v34 = v109 + 1;
            }
            while (v107 != (id)(v109 + 1));
            id v95 = [obj countByEnumeratingWithState:&v114 objects:buf count:16];
            id v107 = v95;
          }
          while (v95);
        }

        id v6 = v100;
        v11 = v101;
        v13 = v102;
        v9 = v103;
      }

      v9 = &v9[(void)[v13 count]];
      v96 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
      {
        if (v2) {
          v97 = v2->_logKey;
        }
        else {
          v97 = 0;
        }
        *(_DWORD *)buf = 138412802;
        v128 = v97;
        __int16 v129 = 2048;
        v130 = v9;
        __int16 v131 = 2048;
        v132 = v99;
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "[%@] Created %lu/%lu placeholders", buf, 0x20u);
      }
    }
    while ([v6 count]);
  }
}

- (void).cxx_destruct
{
}

@end