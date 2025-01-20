@interface IXSDefaultAppDeletionManager
+ (id)sharedInstance;
- (BOOL)_shouldGateDeletionForAppType:(unint64_t)a3;
- (BOOL)getAppRecordNeedsDefaultAppDeletionAlert:(BOOL *)a3 forRecord:(id)a4 defaultAppType:(unint64_t *)a5 gateDeletionOfLastApp:(BOOL *)a6 error:(id *)a7;
- (BOOL)getOtherAppsAreInstalled:(BOOL *)a3 forDefaultAppType:(unint64_t)a4 exceptBundleID:(id)a5 error:(id *)a6;
- (unint64_t)_appTypeForLSDefaultAppCategory:(unint64_t)a3;
- (unint64_t)_lsDefaultAppCategoryForAppType:(unint64_t)a3;
@end

@implementation IXSDefaultAppDeletionManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039640;
  block[3] = &unk_1000E8C70;
  block[4] = a1;
  if (qword_100109EE0 != -1) {
    dispatch_once(&qword_100109EE0, block);
  }
  v2 = (void *)qword_100109ED8;

  return v2;
}

- (unint64_t)_appTypeForLSDefaultAppCategory:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 0;
  }
  else {
    return qword_1000AAF18[a3 - 1];
  }
}

- (unint64_t)_lsDefaultAppCategoryForAppType:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return 0;
  }
  else {
    return qword_1000AAF38[a3 - 1];
  }
}

- (BOOL)getOtherAppsAreInstalled:(BOOL *)a3 forDefaultAppType:(unint64_t)a4 exceptBundleID:(id)a5 error:(id *)a6
{
  id v40 = 0;
  BOOL v10 = sub_100038F14(a5, 18, &v40);
  id v11 = v40;
  v12 = v11;
  if (v10 && v11)
  {
    v13 = [v11 objectForKey:@"TEST_MODE_RESTRICT_DEFAULT_APP_DELETION_OTHER_APPS_AVAILABLE_KEY"];
    objc_opt_class();
    id v14 = v13;
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    if (!v15)
    {
      id v19 = 0;
      unsigned __int8 v18 = 0;
LABEL_18:
      BOOL v21 = 1;
      goto LABEL_19;
    }
    unsigned __int8 v18 = [v15 BOOLValue];
LABEL_17:
    id v19 = 0;
    goto LABEL_18;
  }
  if (a4 > 6)
  {
LABEL_27:
    v26 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100091550(v26, v27, v28, v29, v30, v31, v32, v33);
    }

    sub_10003DAE4((uint64_t)"-[IXSDefaultAppDeletionManager getOtherAppsAreInstalled:forDefaultAppType:exceptBundleID:error:]", 149, @"IXErrorDomain", 1uLL, 0, 0, @"Found unknown default app type", v34, v38);
    goto LABEL_30;
  }
  if (((1 << a4) & 0x6A) != 0)
  {
    unint64_t v16 = [(IXSDefaultAppDeletionManager *)self _lsDefaultAppCategoryForAppType:a4];
    if (v16)
    {
      id v15 = +[LSApplicationRecord enumeratorForViableDefaultAppsForCategory:v16 options:128];
      v17 = [v15 allObjects];
LABEL_16:
      v20 = v17;
      unsigned __int8 v18 = (unint64_t)[v17 count] > 1;

      goto LABEL_17;
    }
    v22 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000915D4(a4, v22);
    }

    sub_10003DAE4((uint64_t)"-[IXSDefaultAppDeletionManager getOtherAppsAreInstalled:forDefaultAppType:exceptBundleID:error:]", 99, @"IXErrorDomain", 1uLL, 0, 0, @"Found invalid LS category for default app type %lu", v23, a4);
LABEL_30:
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v21) = 0;
    goto LABEL_31;
  }
  if (a4 != 2)
  {
    if (a4 == 4)
    {
      id v15 = +[SESNFCAppSettingsContext contextWithBundleId:0 onChange:&stru_1000EA278];
      v17 = [v15 defaultAppCandidates];
      goto LABEL_16;
    }
    goto LABEL_27;
  }
  v24 = +[LSApplicationWorkspace defaultWorkspace];
  id v39 = 0;
  v25 = [v24 getPreferredAppMarketplacesWithError:&v39];
  id v15 = v39;

  BOOL v21 = v25 != 0;
  if (v25)
  {
    id v19 = 0;
    unsigned __int8 v18 = (unint64_t)[v25 count] > 1;
  }
  else
  {
    v36 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_10009166C();
    }

    sub_10003DAE4((uint64_t)"-[IXSDefaultAppDeletionManager getOtherAppsAreInstalled:forDefaultAppType:exceptBundleID:error:]", 121, @"IXErrorDomain", 1uLL, v15, 0, @"Failed to get list of preferred app marketplaces", v37, v38);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    unsigned __int8 v18 = 0;
  }

LABEL_19:
  if (a3 && v21)
  {
    *a3 = v18;
    LOBYTE(v21) = 1;
    goto LABEL_34;
  }
LABEL_31:
  if (a6 && !v21)
  {
    id v19 = v19;
    *a6 = v19;
  }
LABEL_34:

  return v21;
}

- (BOOL)_shouldGateDeletionForAppType:(unint64_t)a3
{
  if (a3 - 1 >= 6)
  {
    v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000916E0(v4);
    }

    LOBYTE(v3) = 0;
  }
  else
  {
    return (7u >> (a3 - 1)) & 1;
  }
  return v3;
}

- (BOOL)getAppRecordNeedsDefaultAppDeletionAlert:(BOOL *)a3 forRecord:(id)a4 defaultAppType:(unint64_t *)a5 gateDeletionOfLastApp:(BOOL *)a6 error:(id *)a7
{
  uint64_t v58 = 0;
  id v54 = a4;
  v12 = [v54 bundleIdentifier];
  if (!sub_1000392E4(v12, 20))
  {
    id v57 = 0;
    BOOL v20 = sub_100038F14(v12, 18, &v57);
    id v21 = v57;
    v53 = v21;
    if (v20)
    {
      v22 = [v21 objectForKey:@"TEST_MODE_RESTRICT_DEFAULT_APP_DELETION_DEFAULT_APP_TYPE_KEY"];
      objc_opt_class();
      id v23 = v22;
      id v24 = (objc_opt_isKindOfClass() & 1) != 0 ? v23 : 0;

      if (v24)
      {
        unint64_t v17 = (unint64_t)[v24 longLongValue];
        unsigned __int8 v19 = [(IXSDefaultAppDeletionManager *)self _shouldGateDeletionForAppType:v17];

        v13 = 0;
        id v14 = 0;
        id v15 = 0;
        unint64_t v16 = 0;
        goto LABEL_10;
      }
    }
    v49 = a6;
    v50 = a7;
    v25 = +[LSApplicationWorkspace defaultWorkspace];
    id v56 = 0;
    unint64_t v16 = [v25 getPreferredAppMarketplacesWithError:&v56];
    id v26 = v56;

    if (v16)
    {
      if ([v16 count])
      {
        uint64_t v27 = [v16 objectAtIndexedSubscript:0];
        unsigned __int8 v28 = [v12 isEqualToString:v27];

        if (v28)
        {
          v13 = 0;
          id v14 = 0;
          unsigned __int8 v19 = 1;
          unint64_t v17 = 2;
          id v15 = v26;
          LOBYTE(v18) = 1;
          goto LABEL_34;
        }
      }
      v47 = self;
      v13 = +[SESNFCAppSettingsContext contextWithBundleId:0 onChange:&stru_1000EA298];
      uint64_t v29 = [v13 getDefaultNFCApplication];
      id v14 = v29;
      if (v29)
      {
        uint64_t v30 = [v29 bundleId];
        unsigned int v31 = [v30 isEqualToString:v12];

        if (v31)
        {
          uint64_t v32 = [v13 defaultAppCandidates];
          [v32 count];

          unsigned __int8 v19 = 0;
          LOBYTE(v18) = 1;
          unint64_t v17 = 4;
          id v15 = v26;
          goto LABEL_34;
        }
      }
      uint64_t v38 = +[LSApplicationWorkspace defaultWorkspace];
      id v55 = v26;
      unsigned __int8 v39 = [v38 getDefaultApplicationCategories:&v58 withCurrentDefaultApplication:v54 error:&v55];
      id v15 = v55;

      if (v39)
      {
        uint64_t v18 = LSDefaultAppCategoryForMask();
        if (v18)
        {
          uint64_t v51 = v18;
          id v40 = [(IXSDefaultAppDeletionManager *)v47 _appTypeForLSDefaultAppCategory:v18];
          a6 = v49;
          if (!v40)
          {
            v44 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v60 = "-[IXSDefaultAppDeletionManager getAppRecordNeedsDefaultAppDeletionAlert:forRecord:defaultAppType:gat"
                    "eDeletionOfLastApp:error:]";
              __int16 v61 = 2112;
              v62 = v12;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%s: Found unknown app category for bundleID %@; assuming default app alerts aren't required and allowing deletion",
                buf,
                0x16u);
            }

            goto LABEL_3;
          }
          unint64_t v17 = (unint64_t)v40;
          unsigned __int8 v19 = [(IXSDefaultAppDeletionManager *)v47 _shouldGateDeletionForAppType:v40];
          if ((v19 & 1) == 0)
          {
            v52 = +[LSApplicationRecord enumeratorForViableDefaultAppsForCategory:v51 options:128];
            v46 = [v52 allObjects];
            id v48 = [v46 count];

            LOBYTE(v18) = (_BYTE)v48;
            if (v48 == (id)1)
            {
              unsigned __int8 v19 = 0;
              goto LABEL_35;
            }
          }
LABEL_10:
          LOBYTE(v18) = 1;
          goto LABEL_35;
        }
        unint64_t v17 = 0;
        unsigned __int8 v19 = 1;
LABEL_34:
        a6 = v49;
        goto LABEL_35;
      }
      v41 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_1000917D8();
      }

      sub_10003DAE4((uint64_t)"-[IXSDefaultAppDeletionManager getAppRecordNeedsDefaultAppDeletionAlert:forRecord:defaultAppType:gateDeletionOfLastApp:error:]", 260, @"IXErrorDomain", 1uLL, v15, 0, @"Failed to find default app categories applicable to bundleID %@", v42, (uint64_t)v12);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      id v26 = v15;
      uint64_t v34 = v50;
      if (!v50) {
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v33 = sub_100004B28((uint64_t)off_100109BB8);
      uint64_t v34 = a7;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_100091764();
      }

      sub_10003DAE4((uint64_t)"-[IXSDefaultAppDeletionManager getAppRecordNeedsDefaultAppDeletionAlert:forRecord:defaultAppType:gateDeletionOfLastApp:error:]", 223, @"IXErrorDomain", 1uLL, v26, 0, @"Failed to get list of preferred app marketplaces", v35, v45);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      id v14 = 0;
      v13 = 0;
      if (!v50)
      {
LABEL_31:
        BOOL v37 = 0;
        goto LABEL_32;
      }
    }
    id v36 = v36;
    BOOL v37 = 0;
    *uint64_t v34 = v36;
LABEL_32:
    id v15 = v26;
    goto LABEL_42;
  }
  v13 = 0;
  id v14 = 0;
  id v15 = 0;
  v53 = 0;
  unint64_t v16 = 0;
LABEL_3:
  unint64_t v17 = 0;
  LOBYTE(v18) = 0;
  unsigned __int8 v19 = 1;
LABEL_35:
  if (a5) {
    *a5 = v17;
  }
  if (a3) {
    *a3 = v18;
  }
  id v36 = 0;
  if (a6) {
    *a6 = v19;
  }
  BOOL v37 = 1;
LABEL_42:

  return v37;
}

@end