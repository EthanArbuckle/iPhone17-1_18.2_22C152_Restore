@interface ContentRestoreTask
- (void)main;
@end

@implementation ContentRestoreTask

- (void)main
{
  if ([(NSArray *)self->_restoreInstalls count])
  {
    v3 = sub_10030B11C();
    uint64_t v117 = sub_10030C564(v3, @"p2-content-restore/url");

    v4 = [ContentRestoreURLRequestEncoder alloc];
    v5 = sub_10030B11C();
    v6 = [(ContentRestoreURLRequestEncoder *)v4 initWithBag:v5];

    [(ContentRestoreURLRequestEncoder *)v6 setAccount:self->_account];
    v7 = +[AppInstallationEvent additionalMetricsWithRestoreInstalls:self->_restoreInstalls];
    [(ContentRestoreURLRequestEncoder *)v6 setAdditionalMetrics:v7];

    id v8 = [(ACAccount *)self->_account ams_DSID];
    v9 = objc_opt_new();
    if (os_variant_has_internal_content()) {
      [v9 setObject:@"internal" forKeyedSubscript:@"OSBuildType"];
    }
    v10 = sub_1003F45A8();
    v11 = v10;
    if (v10
      && (([v10 isEqualToNumber:&off_10054BD48] & 1) != 0
       || [v11 isEqualToNumber:&off_10054BD60]))
    {
      v12 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v145) = [v11 intValue];
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Content restore setting ForceAppDRMMode: %d", buf, 8u);
      }

      v13 = [v11 stringValue];
      [v9 setObject:v13 forKeyedSubscript:@"ForceAppDRMMode"];
    }
    uint64_t v14 = +[AMSDevice deviceName];
    if (v14) {
      [v9 setObject:v14 forKeyedSubscript:@"device-name"];
    }
    v109 = (void *)v14;
    uint64_t v15 = +[AMSDevice deviceGUID];
    if (v15) {
      [v9 setObject:v15 forKeyedSubscript:@"guid"];
    }
    v107 = (void *)v15;
    v16 = +[AMSKeybag sharedInstance];
    id v136 = 0;
    uint64_t v17 = [v16 keybagSyncDataWithAccountID:v8 transactionType:1 error:&v136];
    id v18 = v136;

    v115 = v9;
    v116 = v6;
    v111 = v11;
    v113 = v8;
    uint64_t v103 = v17;
    v105 = v18;
    if (v17)
    {
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, @"kbsync", v17);
    }
    else
    {
      v21 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v145 = v8;
        __int16 v146 = 2114;
        id v147 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "KBSync unavailable for account: %{public}@ error: %{public}@", buf, 0x16u);
      }
    }
    v22 = objc_opt_new();
    long long v132 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    v118 = self;
    obj = self->_restoreInstalls;
    id v23 = [(NSArray *)obj countByEnumeratingWithState:&v132 objects:buf count:16];
    v122 = v22;
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v133;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v133 != v25) {
            objc_enumerationMutation(obj);
          }
          v27 = *(unsigned char **)(*((void *)&v132 + 1) + 8 * i);
          v28 = [[_TtC9appstored6LogKey alloc] initWithAppInstallMemoryEntity:v27];
          v29 = sub_100424E64(v27);

          v30 = ASDLogHandleForCategory();
          BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
          if (v29)
          {
            if (v31)
            {
              *(_DWORD *)v140 = 138412546;
              v141 = v28;
              __int16 v142 = 2114;
              v143 = v27;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[%@] ContentRestore lookup: %{public}@", v140, 0x16u);
            }

            id v32 = objc_alloc((Class)NSMutableDictionary);
            v138[0] = @"item-id";
            v33 = sub_100424E64(v27);
            v138[1] = @"kind";
            v139[0] = v33;
            v139[1] = @"software";
            v34 = +[NSDictionary dictionaryWithObjects:v139 forKeys:v138 count:2];
            v30 = [v32 initWithDictionary:v34];

            v35 = sub_1003B804C(v27);

            if (v35)
            {
              v36 = sub_1003B804C(v27);
              [v30 setObject:v36 forKeyedSubscript:@"store-front-id"];
            }
            v37 = sub_1003B7FFC(v27);

            if (v37)
            {
              v38 = sub_1003B7FFC(v27);
              [v30 setObject:v38 forKeyedSubscript:@"software-external-version-identifier"];
            }
            v39 = sub_1003B8084(v27);

            if (v39)
            {
              v40 = sub_1003B8084(v27);
              v41 = [v40 UUIDString];
              [v30 setObject:v41 forKeyedSubscript:@"vid"];
            }
            uint64_t v42 = sub_1003B7F90(v27);
            if (v42)
            {
              v43 = (void *)v42;
              v44 = sub_1003B7F90(v27);
              v45 = sub_1003B7F58(v27);
              unsigned __int8 v46 = [v44 isEqualToNumber:v45];

              if ((v46 & 1) == 0)
              {
                v47 = sub_1003B7F58(v27);
                [v30 setObject:v47 forKeyedSubscript:@"ownerDsid"];
              }
            }
            v22 = v122;
            objc_msgSend(v122, "addObject:", v30, v103);
          }
          else if (v31)
          {
            *(_DWORD *)v140 = 138412546;
            v141 = v28;
            __int16 v142 = 2114;
            v143 = v27;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[%@] item: %{public}@ due to lack of required metadata", v140, 0x16u);
          }
        }
        id v24 = [(NSArray *)obj countByEnumeratingWithState:&v132 objects:buf count:16];
      }
      while (v24);
    }

    v48 = v115;
    if ([v22 count]) {
      [v115 setObject:v22 forKeyedSubscript:@"items"];
    }
    v49 = +[AMSDevice serialNumber];
    v51 = (void *)v117;
    v50 = v118;
    v52 = v116;
    if (v49) {
      [v115 setObject:v49 forKeyedSubscript:@"serial-number"];
    }

    v53 = [(ContentRestoreURLRequestEncoder *)v116 requestWithMethod:4 bagURL:v117 parameters:v115];
    id v131 = 0;
    v54 = [v53 resultWithError:&v131];
    id v55 = v131;

    v56 = &OBJC_IVAR___XPCClient__clientVersion;
    if (v55)
    {
      v57 = 0;
      v58 = 0;
    }
    else
    {
      v59 = sub_100295080();
      v60 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = [v59 bundleIdentifier];
        *(_DWORD *)buf = 138543362;
        id v145 = v61;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Content restore attributing network to: %{public}@", buf, 0xCu);
      }
      v58 = sub_100223974((uint64_t)AMSURLSession, v59);
      v62 = [v58 dataTaskPromiseWithRequest:v54];
      id v130 = 0;
      v57 = [v62 resultWithError:&v130];
      id v55 = v130;

      if (!v55)
      {
        v63 = [v57 object];
        Property = sub_1003DD184((uint64_t)StoreItemResponse, v63, 0);
        v66 = Property;
        if (Property) {
          Property = objc_getProperty(Property, v65, 56, 1);
        }
        id v119 = Property;
        uint64_t v67 = [v63 objectForKeyedSubscript:@"failed-items"];
        v110 = (void *)v67;
        v112 = v66;
        v114 = v63;
        if (v67)
        {
          v68 = (void *)v67;
          v104 = v57;
          v106 = v58;
          v108 = v54;
          v123 = objc_opt_new();
          long long v126 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          id obja = v68;
          id v69 = [obja countByEnumeratingWithState:&v126 objects:v137 count:16];
          if (v69)
          {
            id v70 = v69;
            uint64_t v71 = *(void *)v127;
            do
            {
              for (j = 0; j != v70; j = (char *)j + 1)
              {
                if (*(void *)v127 != v71) {
                  objc_enumerationMutation(obja);
                }
                v73 = *(void **)(*((void *)&v126 + 1) + 8 * (void)j);
                v74 = objc_msgSend(v73, "objectForKeyedSubscript:", @"customerMessage", v104);
                v75 = [v73 objectForKeyedSubscript:@"item-id"];
                v76 = [v73 objectForKeyedSubscript:@"failureType"];
                id v77 = [v76 integerValue];

                if (v77)
                {
                  v78 = [v73 objectForKeyedSubscript:@"failureType"];
                  [v78 integerValue];
                }
                v79 = ASDErrorWithTitleAndMessage();
                if (v75) {
                  [v123 setObject:v79 forKeyedSubscript:v75];
                }
              }
              id v70 = [obja countByEnumeratingWithState:&v126 objects:v137 count:16];
            }
            while (v70);
          }

          v51 = (void *)v117;
          v50 = v118;
          v48 = v115;
          v52 = v116;
          v58 = v106;
          v54 = v108;
          v80 = &OBJC_IVAR___XPCClient__clientVersion;
          v57 = v104;
          v81 = v123;
        }
        else
        {
          v81 = 0;
          v80 = &OBJC_IVAR___XPCClient__clientVersion;
        }
        v82 = (objc_class *)objc_msgSend(v119, "copy", v104);
        uint64_t v83 = v80[92];
        v84 = *(Class *)((char *)&v50->super.super.super.isa + v83);
        *(Class *)((char *)&v50->super.super.super.isa + v83) = v82;

        v124 = v81;
        if (v81)
        {
          v86 = (NSDictionary *)[v81 copy];
          failedItems = v50->_failedItems;
          v50->_failedItems = v86;
        }
        if (v66) {
          id v88 = objc_getProperty(v66, v85, 64, 1);
        }
        else {
          id v88 = 0;
        }
        v89 = v114;
        id v90 = v88;

        if (v90)
        {
          uint64_t v91 = +[AMSKeybag sharedInstance];
          v93 = v66;
          v94 = (void *)v91;
          if (v93) {
            id v95 = objc_getProperty(v93, v92, 64, 1);
          }
          else {
            id v95 = 0;
          }
          id v96 = v95;
          id v125 = 0;
          [v94 importKeybagWithData:v96 error:&v125];
          id v97 = v125;

          if (v97)
          {
            v98 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v145 = v97;
              _os_log_error_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, "Content restore keybag resulted in error: %{public}@", buf, 0xCu);
            }
          }
          v66 = v112;
          v89 = v114;
        }
        v99 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
        {
          id v100 = [v119 count];
          *(_DWORD *)buf = 134217984;
          id v145 = v100;
          _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_INFO, "Successfully completed content restore call with %ld appinstall(s)", buf, 0xCu);
        }

        id v55 = 0;
      }
      v56 = &OBJC_IVAR___XPCClient__clientVersion;
    }
    v101 = ASDErrorWithSafeUserInfo();
    objc_setProperty_atomic_copy(v50, v102, v101, 32);

    v50->super._success = [*(id *)((char *)&v50->super.super.super.isa + v56[92]) count] != 0;
  }
  else
  {
    v19 = ASDErrorWithTitleAndMessage();
    objc_setProperty_atomic_copy(self, v20, v19, 32);

    self->super._success = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedItems, 0);
  objc_storeStrong((id *)&self->_successfulItems, 0);
  objc_storeStrong((id *)&self->_restoreInstalls, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end