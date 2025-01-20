@interface PreparePurchaseTask
- (void)completeWithError:(id)a3;
- (void)main;
@end

@implementation PreparePurchaseTask

- (void)completeWithError:(id)a3
{
  purchaseInfo = self->_purchaseInfo;
  id v5 = a3;
  v6 = [(PurchaseInfo *)purchaseInfo account];
  v7 = objc_msgSend(v6, "ams_DSID");
  v8 = sub_1003DDB9C((uint64_t)StoreItemResponse, v5, v7);
  [(PurchaseInfo *)self->_purchaseInfo setItemResponse:v8];

  v9.receiver = self;
  v9.super_class = (Class)PreparePurchaseTask;
  [(Task *)&v9 completeWithError:v5];
}

- (void)main
{
  if (!+[RestoreKeeper activeRestoreSupportEnabled])goto LABEL_6; {
  v3 = +[RestoreKeeper shared];
  }
  v4 = [(PurchaseInfo *)self->_purchaseInfo bundleID];
  id v5 = [(PurchaseInfo *)self->_purchaseInfo logKey];
  id v113 = [v3 restoringCoordinatorForBundleID:v4 logKey:v5];

  if (!v113)
  {
LABEL_6:
    if ([(PurchaseInfo *)self->_purchaseInfo isRemoteInstall])
    {
      id v10 = 0;
      if (![0 hasUnknownDistributor])
      {
LABEL_91:
        id v10 = [(PurchaseInfo *)self->_purchaseInfo bundleID];

        if (v10)
        {
          v72 = [(PurchaseInfo *)self->_purchaseInfo bundleID];
          id v10 = +[ApplicationProxy proxyForBundleID:v72];

          if (v10 && [v10 hasUnknownDistributor])
          {
            v71 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              v73 = [(PurchaseInfo *)self->_purchaseInfo logKey];
              *(_DWORD *)buf = 138412290;
              v120 = v73;
              v74 = "[%@] Cannot overwrite an app placeholder from a different distributor";
LABEL_133:
              _os_log_error_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, v74, buf, 0xCu);

              goto LABEL_89;
            }
            goto LABEL_89;
          }

          id v10 = 0;
        }
LABEL_97:
        if (![(PurchaseInfo *)self->_purchaseInfo coordinatorImportance])
        {
          if ([(PurchaseInfo *)self->_purchaseInfo isDiscretionary])
          {
            if (_os_feature_enabled_impl()) {
              uint64_t v75 = 4;
            }
            else {
              uint64_t v75 = 1;
            }
            [(PurchaseInfo *)self->_purchaseInfo setCoordinatorImportance:v75];
            uint64_t v76 = -2;
          }
          else
          {
            [(PurchaseInfo *)self->_purchaseInfo setCoordinatorImportance:3];
            uint64_t v76 = 1;
          }
          [(PurchaseInfo *)self->_purchaseInfo setPriority:v76];
        }
        v77 = [(PurchaseInfo *)self->_purchaseInfo bundleID];

        if (v77)
        {
          v78 = [(PurchaseInfo *)self->_purchaseInfo bundleID];
          uint64_t v79 = [(PurchaseInfo *)self->_purchaseInfo coordinatorIntent];
          v80 = [(PurchaseInfo *)self->_purchaseInfo coordinatorImportance];
          id v118 = 0;
          v81 = sub_1002780FC((uint64_t)IXAppInstallCoordinator, v78, v79, v80, 1, &v118);
          v82 = v118;
          [(PurchaseInfo *)self->_purchaseInfo setCoordinator:v81];

          v83 = [(PurchaseInfo *)self->_purchaseInfo coordinator];

          if (!v83)
          {
            v84 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            {
              v104 = [(PurchaseInfo *)self->_purchaseInfo logKey];
              *(_DWORD *)buf = 138412546;
              v120 = v104;
              __int16 v121 = 2114;
              v122 = v82;
              _os_log_error_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "[%@] Cannot create coordinator for purchase: %{public}@", buf, 0x16u);
            }
            v85 = ASDErrorWithSafeUserInfo();
            [(PreparePurchaseTask *)self completeWithError:v85];

            goto LABEL_131;
          }
        }
        else
        {
          v82 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
          {
            v103 = [(PurchaseInfo *)self->_purchaseInfo logKey];
            *(_DWORD *)buf = 138412290;
            v120 = v103;
            _os_log_error_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "[%@] Cannot create coordinator for purchase without bundle identifier", buf, 0xCu);
          }
        }

        if (![(PurchaseInfo *)self->_purchaseInfo isRemoteInstall])
        {
          v86 = [(PurchaseInfo *)self->_purchaseInfo bundleID];
          v87 = +[ApplicationProxy proxyForBundleID:v86];

          sub_10030AE4C(self->_purchaseInfo, v87);
        }
        v88 = [(PurchaseInfo *)self->_purchaseInfo account];
        if (!v88)
        {
          if ([(PurchaseInfo *)self->_purchaseInfo isMachineBased])
          {
LABEL_118:
            if ([(PurchaseInfo *)self->_purchaseInfo requireUniversal])
            {
              v90 = ASDLogHandleForCategory();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
              {
                v91 = [(PurchaseInfo *)self->_purchaseInfo logKey];
                *(_DWORD *)buf = 138412290;
                v120 = v91;
                _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "[%@] Requesting universal variant, not adding thinning headers", buf, 0xCu);
              }
            }
            else
            {
              sub_10030AD48(self->_purchaseInfo);
            }
            if (![(PurchaseInfo *)self->_purchaseInfo purchaseType])
            {
              int v92 = sub_1003C4D74();
              v93 = sub_1003C44E0();
              v94 = [(PurchaseInfo *)self->_purchaseInfo itemID];
              if (v92)
              {
                v95 = sub_1003CA268((uint64_t)v93, v94);

                id v96 = [(PurchaseInfo *)self->_purchaseInfo buyParams];
                [v96 setParameter:v95 forKey:@"ad-network"];
              }
              else
              {
                v95 = sub_1003C6954(v93, v94);

                v97 = objc_opt_new();
                sub_10030B11C();
                v98 = (id *)objc_claimAutoreleasedReturnValue();
                unsigned __int8 v99 = sub_10030BBA8(v98, @"skadnetwork-allow-stub-impressions", 0);

                v115[0] = _NSConcreteStackBlock;
                v115[1] = 3221225472;
                v115[2] = sub_10035B668;
                v115[3] = &unk_100529430;
                id v96 = v97;
                id v116 = v96;
                unsigned __int8 v117 = v99;
                [v95 enumerateObjectsUsingBlock:v115];
                v100 = [(PurchaseInfo *)self->_purchaseInfo buyParams];
                [v100 setParameter:v96 forKey:@"ad-networks"];

                v101 = ASDLogHandleForCategory();
                if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                {
                  v102 = [(PurchaseInfo *)self->_purchaseInfo logKey];
                  *(_DWORD *)buf = 138412290;
                  v120 = v102;
                  _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "[%@] Set params for install validation", buf, 0xCu);
                }
              }
            }
            [(Task *)self completeWithSuccess];
            goto LABEL_131;
          }
          v88 = +[ACAccountStore ams_sharedAccountStore];
          v89 = objc_msgSend(v88, "ams_activeiTunesAccount");
          [(PurchaseInfo *)self->_purchaseInfo setAccount:v89];
        }
        goto LABEL_118;
      }
      goto LABEL_88;
    }
    v11 = self->_purchaseInfo;
    self;
    v12 = [(PurchaseInfo *)v11 itemID];

    if (!v12
      || ([(PurchaseInfo *)v11 itemID],
          v13 = objc_claimAutoreleasedReturnValue(),
          +[ApplicationProxy proxyForItemID:v13],
          v14 = objc_claimAutoreleasedReturnValue(),
          v13,
          !v14))
    {
      v14 = [(PurchaseInfo *)v11 bundleID];

      if (!v14)
      {
        if ([0 isInstalled]) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }
      v15 = [(PurchaseInfo *)v11 bundleID];
      v14 = +[ApplicationProxy proxyForBundleID:v15];
    }
    if ([v14 isInstalled])
    {
      if (v14)
      {
        v16 = [(PurchaseInfo *)v11 bundleID];

        if (!v16)
        {
          v17 = [v14 bundleID];
          [(PurchaseInfo *)v11 setBundleID:v17];
        }
        v18 = [(PurchaseInfo *)v11 bundleURL];

        if (!v18)
        {
          v19 = [v14 bundleURL];
          [(PurchaseInfo *)v11 setBundleURL:v19];
        }
        v20 = [v14 ratingRank];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v21 = [(PurchaseInfo *)v11 buyParams];
          v22 = [v20 stringValue];
          [v21 setParameter:v22 forKey:AMSBuyParamPropertyInstalledSoftwareRating];
        }
        id v114 = v20;
        unsigned int v23 = [v14 isArcade];
        if (v23)
        {
          v24 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = [(PurchaseInfo *)v11 logKey];
            *(_DWORD *)buf = 138412290;
            v120 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[%@] Preparing purchase for Arcade app.", buf, 0xCu);
          }
        }
        [(PurchaseInfo *)v11 setCoordinatorIntent:2];
        v26 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = [(PurchaseInfo *)v11 logKey];
          v28 = [(PurchaseInfo *)v11 bundleID];
          *(_DWORD *)buf = 138412546;
          v120 = v27;
          __int16 v121 = 2114;
          v122 = v28;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[%@][%{public}@] Installed app found. Setting coordinator intent to IXCoordinatorIntentUpdating", buf, 0x16u);
        }
        v29 = sub_10001A308();
        [(PurchaseInfo *)v11 setDiscoveredUpdate:sub_1002E8C5C((BOOL)v29, 3, v11)];

        if ([(PurchaseInfo *)v11 discoveredUpdate])
        {
          if ([(PurchaseInfo *)v11 isDiscretionary])
          {
            [(PurchaseInfo *)v11 setPurchaseType:1];
            v30 = &off_1005231B8;
            if (v23) {
              v30 = &off_100523120;
            }
          }
          else
          {
            [(PurchaseInfo *)v11 setPurchaseType:4];
            if (v23)
            {
              [(PurchaseInfo *)v11 setArcade:1];
              v30 = &off_100523128;
            }
            else
            {
              v30 = &off_1005231C8;
            }
          }
          [(PurchaseInfo *)v11 setLogCode:*v30];
        }
        if ([v14 hasMIDBasedSINF]
          && +[UpdatesManager isTVProviderApp:](UpdatesManager, "isTVProviderApp:", [v14 storeItemID]))
        {
          [(PurchaseInfo *)v11 setPurchaseType:2];
          [(PurchaseInfo *)v11 setLogCode:@"PTV"];
          [(PurchaseInfo *)v11 setMetricsType:&off_10054CAE0];
          [(PurchaseInfo *)v11 setMachineBased:1];
          v34 = [(PurchaseInfo *)v11 buyParams];
          v35 = [v34 parameterForKey:AMSBuyParamPropertyAppExtVrsId];

          v36 = [(PurchaseInfo *)v11 buyParams];
          uint64_t v37 = AMSBuyParamPropertyExternalVersionId;
          v38 = [v36 parameterForKey:AMSBuyParamPropertyExternalVersionId];

          if (!v38 && v35)
          {
            v39 = [(PurchaseInfo *)v11 buyParams];
            [v39 setParameter:v35 forKey:v37];
          }
          [(PurchaseInfo *)v11 updateGeneratedProperties];
        }
        v40 = [v14 appStoreToolsBuildVersion];
        v41 = sub_10030B11C();
        v42 = sub_10030BA90((uint64_t)v41, @"invalid-build-tools/delta-incompatible-versions", &__NSArray0__struct);

        if (([v42 containsObject:v40] & 1) == 0)
        {
          v43 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v14 storeExternalVersionID]);
          [(PurchaseInfo *)v11 setInstalledExternalVersionID:v43];

          v44 = [v14 thinningVariantID];
          [(PurchaseInfo *)v11 setInstalledVariantID:v44];
        }
        id v10 = v14;
        v45 = v11;
        self;
        if ([v10 hasMIDBasedSINF])
        {
          v46 = ASDLogHandleForCategory();
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
LABEL_86:

            goto LABEL_87;
          }
          v47 = [(PurchaseInfo *)v45 logKey];
          v48 = [v10 bundleID];
          *(_DWORD *)buf = 138412546;
          v120 = v47;
          __int16 v121 = 2114;
          v122 = v48;
          _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "[%@] Will not update purchase for MID-based app with bundleID: %{public}@", buf, 0x16u);

LABEL_85:
          goto LABEL_86;
        }
        v49 = +[ACAccountStore ams_sharedAccountStore];
        v46 = objc_msgSend(v49, "ams_activeiTunesAccount");

        v47 = [v46 ams_DSID];
        if (!v47) {
          goto LABEL_85;
        }
        uint64_t v50 = [v10 purchaserDSID];
        v111 = (void *)v50;
        v112 = v45;
        if (!v50) {
          goto LABEL_75;
        }
        if ([v47 isEqual:v50])
        {
          [(PurchaseInfo *)v45 setAccount:v46];
          v51 = ASDLogHandleForCategory();
          v110 = v51;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            [(PurchaseInfo *)v45 logKey];
            v52 = v107 = v47;
            *(_DWORD *)buf = 138412290;
            v120 = v52;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "[%@] Using active account that matches the purchaser.", buf, 0xCu);
            goto LABEL_82;
          }
LABEL_84:

          v45 = v112;
          goto LABEL_85;
        }
        v53 = [v10 downloaderDSID];
        if (v53)
        {
          if ([v47 isEqual:v53])
          {
            v108 = v47;
            v110 = v53;
            [(PurchaseInfo *)v112 setAccount:v46];
            [(PurchaseInfo *)v112 setOriginalPurchaserDSID:v111];
            v54 = [(PurchaseInfo *)v112 buyParams];
            [v54 setParameter:v111 forKey:AMSBuyParamPropertyOwnerDsid];

            v55 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              v56 = [(PurchaseInfo *)v112 logKey];
              *(_DWORD *)buf = 138412290;
              v120 = v56;
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "[%@] Using active account that matches the downloader.", buf, 0xCu);
            }
            v47 = v108;
            v57 = v55;
            goto LABEL_72;
          }
          goto LABEL_74;
        }
        v110 = 0;
        sub_100420D50();
        v58 = v109 = v47;
        v57 = sub_1004212C8((uint64_t)v58, [(PurchaseInfo *)v112 isDiscretionary]);

        if ([v57 containsObject:v109]
          && [v57 containsObject:v111])
        {
          [(PurchaseInfo *)v112 setAccount:v46];
          [(PurchaseInfo *)v112 setOriginalPurchaserDSID:v111];
          v59 = [(PurchaseInfo *)v112 buyParams];
          [v59 setParameter:v111 forKey:AMSBuyParamPropertyOwnerDsid];

          v60 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            v61 = [(PurchaseInfo *)v112 logKey];
            *(_DWORD *)buf = 138412290;
            v120 = v61;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "[%@] Using active account that has a qualifying family account.", buf, 0xCu);
          }
        }
        else
        {
          v62 = +[ACAccountStore ams_sharedAccountStore];
          uint64_t v63 = objc_msgSend(v62, "ams_iTunesAccountWithDSID:", v111);

          if (!v63)
          {

            v47 = v109;
            v53 = 0;
LABEL_74:

LABEL_75:
            v107 = v47;
            v66 = [v10 storeMetadata];
            v110 = v66;
            if (v66)
            {
              uint64_t v67 = sub_100330660((uint64_t)ACAccount, v66);
              if (v67)
              {
                v68 = (void *)v67;
                v69 = ASDLogHandleForCategory();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                {
                  v70 = [(PurchaseInfo *)v112 logKey];
                  *(_DWORD *)buf = 138412290;
                  v120 = v70;
                  _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "[%@] Using unknown account that matches the store metadata.", buf, 0xCu);
                }
                [(PurchaseInfo *)v112 setAccount:v68];

                goto LABEL_83;
              }
            }
            v52 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              v105 = [(PurchaseInfo *)v112 logKey];
              *(_DWORD *)buf = 138412290;
              v120 = v105;
              _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "[%@] No matching account found.", buf, 0xCu);
            }
LABEL_82:

LABEL_83:
            v47 = v107;
            goto LABEL_84;
          }
          v106 = (void *)v63;
          [(PurchaseInfo *)v112 setAccount:v63];
          v64 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            v65 = [(PurchaseInfo *)v112 logKey];
            *(_DWORD *)buf = 138412290;
            v120 = v65;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "[%@] Using non-active account that matches the purchaser.", buf, 0xCu);
          }
        }
        v47 = v109;
LABEL_72:

        goto LABEL_84;
      }
LABEL_34:
      v31 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = [(PurchaseInfo *)v11 logKey];
        v33 = [(PurchaseInfo *)v11 bundleID];
        *(_DWORD *)buf = 138412546;
        v120 = v32;
        __int16 v121 = 2114;
        v122 = v33;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[%@][%{public}@] No installed app found. Defaulting coordinator intent to IXCoordinatorIntentInitiating", buf, 0x16u);
      }
      [(PurchaseInfo *)v11 setCoordinatorIntent:1];
      id v10 = 0;
LABEL_87:

      if (([v10 hasUnknownDistributor] & 1) == 0)
      {
        if (v10) {
          goto LABEL_97;
        }
        goto LABEL_91;
      }
LABEL_88:
      v71 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        v73 = [(PurchaseInfo *)self->_purchaseInfo logKey];
        *(_DWORD *)buf = 138412290;
        v120 = v73;
        v74 = "[%@] Cannot overwrite an app from a different distributor";
        goto LABEL_133;
      }
LABEL_89:

      sub_10035B5AC(self, v10);
LABEL_131:

      return;
    }
LABEL_33:

    goto LABEL_34;
  }
  v6 = +[RestoreKeeper shared];
  BOOL v7 = [(PurchaseInfo *)self->_purchaseInfo isUserInitiated];
  v8 = [(PurchaseInfo *)self->_purchaseInfo logKey];
  [v6 handleActiveRestoreWithCoordinator:v113 userInitiated:v7 logKey:v8];

  objc_super v9 = ASDErrorWithDescription();
  [(PreparePurchaseTask *)self completeWithError:v9];
}

- (void).cxx_destruct
{
}

@end