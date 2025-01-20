@interface CheckStoreQueueTask
- (void)main;
@end

@implementation CheckStoreQueueTask

- (void)main
{
  v2 = self;
  v106 = [(PurchaseInfo *)self->_purchaseInfo account];
  if (v106
    || (+[ACAccountStore ams_sharedAccountStore],
        v3 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "ams_activeiTunesAccount"),
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        (v106 = (void *)v4) != 0))
  {
    v5 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      logKey = v2->_logKey;
      v7 = objc_msgSend(v106, "ams_DSID");
      *(_DWORD *)buf = 138412546;
      v119 = logKey;
      __int16 v120 = 2114;
      id v121 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] Loading queue for account: %{public}@", buf, 0x16u);
    }
    if (v2->_reason == 1)
    {
      uint64_t v8 = [(PurchaseInfo *)v2->_purchaseInfo requestPresenter];
    }
    else
    {
      uint64_t v8 = objc_opt_new();
    }
    v9 = (void *)v8;
    v10 = [LoadStoreQueueTask alloc];
    queueType = (void *)v2->_queueType;
    v12 = [(PurchaseInfo *)v2->_purchaseInfo account];
    v13 = sub_100408F94((id *)&v10->super.super.super.isa, queueType, v12, v9, v2->_logKey);

    id v115 = 0;
    LODWORD(v10) = [(Task *)v2 runSubTask:v13 returningError:&v115];
    id v15 = v115;
    if (v10)
    {
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      if (v13) {
        id Property = objc_getProperty(v13, v14, 80, 1);
      }
      else {
        id Property = 0;
      }
      id v17 = Property;
      id v109 = [v17 countByEnumeratingWithState:&v111 objects:v117 count:16];
      if (v109)
      {
        v98 = v13;
        v99 = v9;
        char v104 = 0;
        v105 = 0;
        uint64_t v108 = *(void *)v112;
        v100 = v2;
        v19 = v15;
        id v107 = v17;
        while (1)
        {
          v20 = 0;
          do
          {
            if (*(void *)v112 != v108) {
              objc_enumerationMutation(v17);
            }
            v21 = *(void **)(*((void *)&v111 + 1) + 8 * (void)v20);
            if (v21) {
              id v22 = objc_getProperty(*(id *)(*((void *)&v111 + 1) + 8 * (void)v20), v18, 224, 1);
            }
            else {
              id v22 = 0;
            }
            id v23 = v22;
            unsigned __int8 v24 = [v23 isEqualToString:@"software"];

            if (v24)
            {
              uint64_t v25 = [(PurchaseInfo *)v2->_purchaseInfo itemID];
              if (v25)
              {
                v27 = (void *)v25;
                id v28 = v21 ? objc_getProperty(v21, v26, 208, 1) : 0;
                id v29 = v28;
                v30 = [(PurchaseInfo *)v2->_purchaseInfo itemID];
                unsigned int v31 = [v29 isEqualToNumber:v30];

                if (v31)
                {
                  p_super = v2->_purchaseInfo;
                  int v33 = 1;
                  char v104 = 1;
                  if (!p_super) {
                    goto LABEL_24;
                  }
LABEL_54:
                  v72 = [PurchaseImportTask alloc];
                  v116 = v21;
                  v73 = +[NSArray arrayWithObjects:&v116 count:1];
                  v74 = sub_1002517FC((id *)&v72->super.super.super.isa, v73, p_super, v2->_purchaseBatch);

                  if (v33) {
                    char v75 = [p_super isDiscretionary] ^ 1;
                  }
                  else {
                    char v75 = 0;
                  }
                  sub_100251978((uint64_t)v74, v75);
                  id v110 = v19;
                  v76 = v19;
                  unsigned __int8 v77 = [(Task *)v2 runSubTask:v74 returningError:&v110];
                  id v78 = v110;

                  if (v77)
                  {
                    ++v105;
                    id v17 = v107;
                  }
                  else
                  {
                    v79 = ASDLogHandleForCategory();
                    id v17 = v107;
                    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                    {
                      v80 = [p_super logKey];
                      *(_DWORD *)buf = 138412546;
                      v119 = v80;
                      __int16 v120 = 2114;
                      id v121 = v78;
                      _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "[%@] Importing queued purchase failed: %{public}@", buf, 0x16u);

                      v2 = v100;
                    }
                  }
                  v19 = v78;
                  goto LABEL_63;
                }
              }
              id v38 = v21;
              self;
              if (v21) {
                id v40 = objc_getProperty(v38, v39, 96, 1);
              }
              else {
                id v40 = 0;
              }
              id v41 = v40;

              v42 = +[ApplicationProxy proxyForBundleID:v41];

              v43 = v38;
              id v44 = v42;
              id v45 = v106;
              v46 = objc_alloc_init(PurchaseInfo);
              p_super = &v46->super.super;
              if (v21)
              {
                id v48 = objc_getProperty(v43, v47, 96, 1);
                [p_super setBundleID:v48];

                v49 = +[NSUUID UUID];
                [p_super setExternalID:v49];

                id v51 = objc_getProperty(v43, v50, 208, 1);
              }
              else
              {
                [(PurchaseInfo *)v46 setBundleID:0];
                v81 = +[NSUUID UUID];
                [p_super setExternalID:v81];

                id v51 = 0;
              }
              id v52 = v51;
              [p_super setItemID:v52];

              [p_super setAccount:v45];
              if (v21)
              {
                if (v43[16])
                {
                  v55 = ASDLogHandleForCategory();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                  {
                    v57 = v2->_logKey;
                    id v58 = objc_getProperty(v43, v56, 96, 1);
                    *(_DWORD *)buf = 138412546;
                    v119 = v57;
                    __int16 v120 = 2114;
                    id v121 = v58;
                    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "[%@] Queue check contains a redownload with bundleID: %{public}@", buf, 0x16u);
                  }
                  v53 = &off_10054B748;
                  CFStringRef v54 = @"QRD";
                }
                else
                {
                  v53 = &off_10054B760;
                  CFStringRef v54 = @"QDA";
                  if ((v43[8] & 1) == 0) {
                    goto LABEL_36;
                  }
                }
              }
              else
              {
LABEL_36:
                v53 = &off_10054B778;
                CFStringRef v54 = @"BYQ";
              }
              -[NSObject setMetricsType:](p_super, "setMetricsType:", v53, v98, v99);
              [p_super setLogCode:v54];
              int64_t reason = v2->_reason;
              if (reason)
              {
                uint64_t v60 = 2;
              }
              else
              {
                [p_super setDiscretionary:1];
                [p_super setSuppressDialogs:1];
                uint64_t v60 = 1;
              }
              [p_super setCoordinatorImportance:v60];
              [p_super setCoordinatorIntent:1];
              if (v44 && [v44 isInstalled])
              {
                v61 = ASDLogHandleForCategory();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                {
                  v102 = v2->_logKey;
                  v103 = v19;
                  if (v21)
                  {
                    id v63 = objc_getProperty(v43, v62, 96, 1);
                    id v65 = objc_getProperty(v43, v64, 112, 1);
                    v101 = v63;
                  }
                  else
                  {
                    id v63 = 0;
                    v101 = 0;
                    id v65 = 0;
                  }
                  id v66 = v65;
                  v67 = [v44 bundleVersion];
                  id v68 = [v44 storeExternalVersionID];
                  *(_DWORD *)buf = 138413314;
                  v119 = v102;
                  __int16 v120 = 2114;
                  id v121 = v63;
                  __int16 v122 = 2114;
                  id v123 = v66;
                  __int16 v124 = 2114;
                  v125 = v67;
                  __int16 v126 = 2048;
                  id v127 = v68;
                  _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "[%@] Queue check found update for %{public}@ to %{public}@. Installed version = %{public}@ (%lld)", buf, 0x34u);

                  v2 = v100;
                  v19 = v103;
                }

                v69 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v44 storeExternalVersionID]);
                [p_super setInstalledExternalVersionID:v69];

                v70 = [v44 thinningVariantID];
                [p_super setInstalledVariantID:v70];

                if (reason) {
                  uint64_t v71 = 2;
                }
                else {
                  uint64_t v71 = 1;
                }
                [p_super setUpdateType:v71];
                [p_super setCoordinatorIntent:2];
              }
              [p_super updateGeneratedProperties];

              int v33 = 0;
              if (!p_super)
              {
LABEL_24:
                id v17 = v107;
                goto LABEL_63;
              }
              goto LABEL_54;
            }
            p_super = ASDLogHandleForCategory();
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
            {
              v35 = v2->_logKey;
              if (v21) {
                id v36 = objc_getProperty(v21, v34, 224, 1);
              }
              else {
                id v36 = 0;
              }
              id v37 = v36;
              *(_DWORD *)buf = 138412546;
              v119 = v35;
              __int16 v120 = 2114;
              id v121 = v37;
              _os_log_debug_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEBUG, "[%@] Skipping over unsupported '%{public}@' for other clients to collect", buf, 0x16u);

              id v17 = v107;
            }
LABEL_63:

            v20 = (char *)v20 + 1;
          }
          while (v109 != v20);
          id v82 = [v17 countByEnumeratingWithState:&v111 objects:v117 count:16];
          id v109 = v82;
          if (!v82)
          {
            id v15 = v19;

            v13 = v98;
            v9 = v99;
            if (v104) {
              goto LABEL_86;
            }
            goto LABEL_81;
          }
        }
      }

      v105 = 0;
LABEL_81:
      if (v2->_purchaseBatch && v2->_purchaseInfo)
      {
        v86 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
        {
          v97 = [(PurchaseInfo *)v2->_purchaseInfo logKey];
          *(_DWORD *)buf = 138412290;
          v119 = v97;
          _os_log_error_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "[%@] Server sent us to the queue to complete the purchase but the item was not there", buf, 0xCu);
        }
        v87 = ASDErrorWithDescription();
        sub_1002B0C34((uint64_t)v2->_purchaseBatch, v87, v2->_purchaseInfo);
      }
LABEL_86:
      v88 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        v90 = v2->_logKey;
        if (v13) {
          id v91 = objc_getProperty(v13, v89, 80, 1);
        }
        else {
          id v91 = 0;
        }
        id v92 = v91;
        id v93 = [v92 count];
        *(_DWORD *)buf = 138412802;
        v119 = v90;
        __int16 v120 = 2048;
        id v121 = v105;
        __int16 v122 = 2048;
        id v123 = v93;
        _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "[%@] Completed queue check with %lu/%lu download(s) imported", buf, 0x20u);
      }
      [(Task *)v2 completeWithSuccess];
    }
    else
    {
      v83 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        v95 = v2->_logKey;
        *(_DWORD *)buf = 138412546;
        v119 = v95;
        __int16 v120 = 2114;
        id v121 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "[%@] Failed to check queue: %{public}@", buf, 0x16u);
      }

      uint64_t purchaseBatch = (uint64_t)v2->_purchaseBatch;
      if (purchaseBatch)
      {
        purchaseInfo = v2->_purchaseInfo;
        if (purchaseInfo) {
          sub_1002B0C34(purchaseBatch, v15, purchaseInfo);
        }
      }
      [(Task *)v2 completeWithError:v15];
    }
  }
  else
  {
    v94 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    {
      v96 = v2->_logKey;
      *(_DWORD *)buf = 138412290;
      v119 = v96;
      _os_log_error_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "[%@] Failed to check queue: No account available", buf, 0xCu);
    }

    id v15 = +[NSError errorWithDomain:ASDErrorDomain code:509 userInfo:0];
    [(Task *)v2 completeWithError:v15];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseInfo, 0);
  objc_storeStrong((id *)&self->_purchaseBatch, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end