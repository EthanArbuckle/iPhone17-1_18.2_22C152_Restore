@interface IXSContainerRefreshManager
+ (id)sharedInstance;
- (BOOL)_onQueue_refreshContainerTypes:(unint64_t)a3 forAppWithIdentity:(id)a4 error:(id *)a5;
- (BOOL)_onQueue_terminateBundleID:(id)a3 reason:(id)a4 terminationAssertion:(id *)a5 error:(id *)a6;
- (void)refreshContainerTypes:(unint64_t)a3 forAppWithIdentity:(id)a4 reason:(id)a5 completion:(id)a6;
@end

@implementation IXSContainerRefreshManager

+ (id)sharedInstance
{
  if (qword_100109F40 != -1) {
    dispatch_once(&qword_100109F40, &stru_1000EACA0);
  }
  v2 = (void *)qword_100109F48;

  return v2;
}

- (BOOL)_onQueue_terminateBundleID:(id)a3 reason:(id)a4 terminationAssertion:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc((Class)RBSTerminateContext);
  v12 = +[NSString stringWithFormat:@"Refreshing data container: %@", v10];

  id v13 = [v11 initWithExplanation:v12];
  [v13 setMaximumTerminationResistance:40];
  id v14 = objc_alloc((Class)RBSTerminationAssertion);
  v15 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v9];
  id v16 = [v14 initWithPredicate:v15 context:v13];

  if (v16)
  {
    id v26 = 0;
    unsigned __int8 v17 = [v16 acquireWithError:&v26];
    id v18 = v26;
    if (v17)
    {
      BOOL v19 = 1;
      if (!a5) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    v23 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v28 = "-[IXSContainerRefreshManager _onQueue_terminateBundleID:reason:terminationAssertion:error:]";
      __int16 v29 = 2112;
      id v30 = v9;
      __int16 v31 = 2112;
      id v32 = v16;
      __int16 v33 = 2112;
      id v34 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s: Failed to acquire termination assertion for identifier %@: assertion = %@ : %@", buf, 0x2Au);
    }

    uint64_t v25 = sub_10003DAE4((uint64_t)"-[IXSContainerRefreshManager _onQueue_terminateBundleID:reason:terminationAssertion:error:]", 62, @"IXErrorDomain", 0x13uLL, v18, 0, @"Failed to acquire termination assertion for identifier %@: assertion = %@", v24, (uint64_t)v9);

    id v18 = (id)v25;
    if (!a6) {
      goto LABEL_14;
    }
  }
  else
  {
    v20 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100095A74();
    }

    sub_10003DAE4((uint64_t)"-[IXSContainerRefreshManager _onQueue_terminateBundleID:reason:terminationAssertion:error:]", 56, @"IXErrorDomain", 0x13uLL, 0, 0, @"Failed to create termination assertion for identifier %@", v21, (uint64_t)v9);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!a6)
    {
LABEL_14:
      BOOL v19 = 0;
      id v16 = 0;
      if (!a5) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  id v18 = v18;
  BOOL v19 = 0;
  id v16 = 0;
  *a6 = v18;
  if (a5) {
LABEL_9:
  }
    *a5 = v16;
LABEL_10:

  return v19;
}

- (BOOL)_onQueue_refreshContainerTypes:(unint64_t)a3 forAppWithIdentity:(id)a4 error:(id *)a5
{
  char v6 = a3;
  id v7 = a4;
  v8 = [v7 personaUniqueString];
  id v9 = [v7 bundleID];
  if ((v6 & 2) != 0)
  {
    id v41 = 0;
    id v12 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v9 allowPlaceholder:1 error:&v41];
    id v13 = v41;
    if (!v12)
    {
      uint64_t v25 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100095AF4((uint64_t)v7, (uint64_t)v13, v25);
      }

      sub_10003DAE4((uint64_t)"-[IXSContainerRefreshManager _onQueue_refreshContainerTypes:forAppWithIdentity:error:]", 152, @"IXErrorDomain", 0x23uLL, v13, 0, @"Failed to fetch application record for \"%@\"", v26, (uint64_t)v7);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

      if (!a5) {
        goto LABEL_25;
      }
      goto LABEL_19;
    }
    char v30 = v6;
    __int16 v31 = v12;
    id v32 = a5;
    __int16 v33 = v9;
    id v34 = v7;
    [v12 applicationExtensionRecords];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v38;
      id v10 = v13;
      while (2)
      {
        id v18 = 0;
        BOOL v19 = v10;
        do
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          v20 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v18);
          uint64_t v21 = [IXApplicationIdentity alloc];
          v22 = [v20 bundleIdentifier];
          v23 = [(IXApplicationIdentity *)v21 initWithBundleIdentifier:v22 personaUniqueString:v8];

          id v36 = v19;
          int v24 = sub_100065050(v23, 4, &v36);
          id v10 = v36;

          if (!v24)
          {

            id v13 = v31;
            a5 = v32;
            id v9 = v33;
            id v7 = v34;
            goto LABEL_18;
          }
          id v18 = (char *)v18 + 1;
          BOOL v19 = v10;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v10 = v13;
    }

    id v9 = v33;
    id v7 = v34;
    a5 = v32;
    if ((v30 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_22:
    id v35 = v10;
    char v27 = sub_100065050(v7, 2, &v35);
    id v28 = v35;

    if (v27)
    {
      BOOL v11 = 1;
      id v10 = v28;
      goto LABEL_26;
    }
    id v10 = v28;
    if (!a5)
    {
LABEL_25:
      BOOL v11 = 0;
      goto LABEL_26;
    }
LABEL_19:
    id v10 = v10;
    BOOL v11 = 0;
    *a5 = v10;
    goto LABEL_26;
  }
  id v10 = 0;
  if (v6) {
    goto LABEL_22;
  }
LABEL_3:
  BOOL v11 = 1;
LABEL_26:

  return v11;
}

- (void)refreshContainerTypes:(unint64_t)a3 forAppWithIdentity:(id)a4 reason:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  +[IXSCoordinatorManager sharedInstance];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100065504;
  v17[3] = &unk_1000EACC8;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v10;
  v20 = self;
  id v21 = v11;
  id v22 = v12;
  unint64_t v23 = a3;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v18;
  [v16 performCreationBlockingOperation:v17];
}

@end