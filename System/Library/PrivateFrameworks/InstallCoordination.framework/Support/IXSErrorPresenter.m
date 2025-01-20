@interface IXSErrorPresenter
+ (id)sharedPresenter;
- (BOOL)localizedErrorForAppName:(id)a3 unlocalizedError:(id)a4 localizedError:(id *)a5 withError:(id *)a6;
- (IXSErrorPresenter)init;
- (void)_presentErrorHighlightingLocalizedAppName:(id)a3 withHighlightedAppRecord:(id)a4 bundleIDs:(id)a5 code:(int64_t)a6 errorSource:(unint64_t)a7 underlyingError:(id)a8;
- (void)presentErrorForAppWithLocalizedName:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 errorSource:(unint64_t)a6;
- (void)presentErrorForIdentities:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 errorSource:(unint64_t)a6;
- (void)presentErrorForIdentity:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 errorSource:(unint64_t)a6;
@end

@implementation IXSErrorPresenter

+ (id)sharedPresenter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003944;
  block[3] = &unk_1000E8C70;
  block[4] = a1;
  if (qword_100109D88 != -1) {
    dispatch_once(&qword_100109D88, block);
  }
  v2 = (void *)qword_100109D80;

  return v2;
}

- (IXSErrorPresenter)init
{
  v3.receiver = self;
  v3.super_class = (Class)IXSErrorPresenter;
  return [(IXSErrorPresenter *)&v3 init];
}

- (void)presentErrorForIdentity:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 errorSource:(unint64_t)a6
{
  id v13 = a3;
  id v10 = a5;
  id v11 = a3;
  v12 = +[NSArray arrayWithObjects:&v13 count:1];

  -[IXSErrorPresenter presentErrorForIdentities:code:underlyingError:errorSource:](self, "presentErrorForIdentities:code:underlyingError:errorSource:", v12, a4, v10, a6, v13);
}

- (void)presentErrorForIdentities:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 errorSource:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  v12 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = IXStringForClientID(a6);
    *(_DWORD *)buf = 136316162;
    v69 = "-[IXSErrorPresenter presentErrorForIdentities:code:underlyingError:errorSource:]";
    __int16 v70 = 2048;
    int64_t v71 = a4;
    __int16 v72 = 2112;
    id v73 = v13;
    __int16 v74 = 2112;
    id v75 = v11;
    __int16 v76 = 2112;
    id v77 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Asked to present alert for error %ld source %@ underlying error %@ for identities %@", buf, 0x34u);
  }
  if ([v10 count])
  {
    v43 = self;
    unint64_t v44 = a6;
    int64_t v45 = a4;
    id v46 = v11;
    v14 = +[NSMutableArray array];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v47 = v10;
    id v15 = v10;
    v51 = v15;
    id v54 = [v15 countByEnumeratingWithState:&v62 objects:v67 count:16];
    if (!v54)
    {
      v50 = 0;
      v16 = 0;
      goto LABEL_41;
    }
    v50 = 0;
    v16 = 0;
    uint64_t v53 = *(void *)v63;
    v48 = v14;
    while (1)
    {
      for (i = 0; i != v54; i = (char *)i + 1)
      {
        if (*(void *)v63 != v53) {
          objc_enumerationMutation(v15);
        }
        v18 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        id v19 = objc_alloc((Class)LSApplicationRecord);
        v20 = [v18 bundleID];
        id v61 = 0;
        id v21 = [v19 initWithBundleIdentifier:v20 allowPlaceholder:1 error:&v61];
        id v22 = v61;

        if (v21)
        {
          v23 = [v18 personaUniqueString];
          v24 = &stru_1000E8CB0;
          if ([v18 isPersonalPersonaPlaceholder]) {
            goto LABEL_13;
          }
          if (v23)
          {
            v59[0] = _NSConcreteStackBlock;
            v59[1] = 3221225472;
            v59[2] = sub_100004158;
            v59[3] = &unk_1000E8CD8;
            v60 = v23;
            v24 = objc_retainBlock(v59);

LABEL_13:
            if (v24)
            {
              v52 = v16;
              v25 = +[UMUserManager sharedManager];
              unsigned __int8 v26 = [v25 isSharedIPad];

              if (v26)
              {
                id v15 = v51;
                v16 = v52;
                goto LABEL_31;
              }
              long long v57 = 0u;
              long long v58 = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              v28 = [v21 identities];
              id v29 = [v28 countByEnumeratingWithState:&v55 objects:v66 count:16];
              if (v29)
              {
                id v30 = v29;
                uint64_t v31 = *(void *)v56;
                id v49 = v22;
                while (2)
                {
                  for (j = 0; j != v30; j = (char *)j + 1)
                  {
                    if (*(void *)v56 != v31) {
                      objc_enumerationMutation(v28);
                    }
                    if (((uint64_t (*)(Block_layout *, void))v24->invoke)(v24, *(void *)(*((void *)&v55 + 1) + 8 * (void)j)))
                    {

                      v14 = v48;
                      id v15 = v51;
                      v16 = v52;
                      id v22 = v49;
                      goto LABEL_31;
                    }
                  }
                  id v30 = [v28 countByEnumeratingWithState:&v55 objects:v66 count:16];
                  id v22 = v49;
                  if (v30) {
                    continue;
                  }
                  break;
                }
              }

              v33 = sub_100004B28((uint64_t)off_100109BB8);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                v34 = [v18 bundleID];
                v35 = [v18 personaUniqueString];
                *(_DWORD *)buf = 136315650;
                v69 = "-[IXSErrorPresenter presentErrorForIdentities:code:underlyingError:errorSource:]";
                __int16 v70 = 2112;
                int64_t v71 = (int64_t)v34;
                __int16 v72 = 2112;
                id v73 = v35;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s: Managed personas for %@ do not contain %@", buf, 0x20u);
              }
              v14 = v48;
              v16 = v52;
LABEL_33:

              id v15 = v51;
              goto LABEL_34;
            }
          }
          else
          {
            v24 = 0;
          }
LABEL_31:
          v36 = [v18 bundleID];
          [v14 addObject:v36];

          if (!v16)
          {
            v16 = [v21 localizedName];
            v33 = v50;
            v50 = v21;
            goto LABEL_33;
          }
LABEL_34:

          goto LABEL_35;
        }
        v23 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v27 = [v18 bundleID];
          *(_DWORD *)buf = 136315650;
          v69 = "-[IXSErrorPresenter presentErrorForIdentities:code:underlyingError:errorSource:]";
          __int16 v70 = 2112;
          int64_t v71 = (int64_t)v27;
          __int16 v72 = 2112;
          id v73 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: Failed to get LSApplicationRecord for identifier %@: %@", buf, 0x20u);
        }
LABEL_35:
      }
      id v54 = [v15 countByEnumeratingWithState:&v62 objects:v67 count:16];
      if (!v54)
      {
LABEL_41:

        if ([v14 count])
        {
          id v11 = v46;
          id v10 = v47;
          uint64_t v37 = (uint64_t)v16;
          v38 = v50;
          if (!v16)
          {
            v39 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
              sub_10008AE2C((uint64_t)v14, v39);
            }

            uint64_t v37 = [v14 firstObject];
          }
          [(IXSErrorPresenter *)v43 _presentErrorHighlightingLocalizedAppName:v37 withHighlightedAppRecord:v50 bundleIDs:v14 code:v45 errorSource:v44 underlyingError:v46];
          v16 = v37;
        }
        else
        {
          id v40 = [v15 count];
          v41 = sub_100004B28((uint64_t)off_100109BB8);
          BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
          id v11 = v46;
          id v10 = v47;
          if (v40 == (id)1)
          {
            v38 = v50;
            if (v42) {
              sub_10008ACF0(v51);
            }
          }
          else
          {
            v38 = v50;
            if (v42) {
              sub_10008AD9C(v51);
            }
          }
        }
        goto LABEL_54;
      }
    }
  }
  v16 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10008AC6C(v16);
  }
LABEL_54:
}

- (void)presentErrorForAppWithLocalizedName:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 errorSource:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  v12 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = IXStringForClientID(a6);
    int v14 = 136316162;
    id v15 = "-[IXSErrorPresenter presentErrorForAppWithLocalizedName:code:underlyingError:errorSource:]";
    __int16 v16 = 2048;
    int64_t v17 = a4;
    __int16 v18 = 2112;
    id v19 = v13;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Asked to present alert for error %ld source %@ underlying error %@ for app named %@", (uint8_t *)&v14, 0x34u);
  }
  [(IXSErrorPresenter *)self _presentErrorHighlightingLocalizedAppName:v10 withHighlightedAppRecord:0 bundleIDs:0 code:a4 errorSource:a6 underlyingError:v11];
}

- (void)_presentErrorHighlightingLocalizedAppName:(id)a3 withHighlightedAppRecord:(id)a4 bundleIDs:(id)a5 code:(int64_t)a6 errorSource:(unint64_t)a7 underlyingError:(id)a8
{
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000043E8;
  v18[3] = &unk_1000E8D00;
  id v19 = a5;
  int64_t v20 = a6;
  unint64_t v21 = a7;
  id v13 = v19;
  id v14 = a8;
  id v15 = a4;
  id v16 = a3;
  int64_t v17 = objc_retainBlock(v18);
  IXPresentErrorHighlightingLocalizedAppName(v16, v15, v13, a6, v17, v14);
}

- (BOOL)localizedErrorForAppName:(id)a3 unlocalizedError:(id)a4 localizedError:(id *)a5 withError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [v10 code];
  if (v10
    && a5
    && (uint64_t v12 = (uint64_t)v11,
        [v10 domain],
        id v13 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v14 = [v13 isEqualToString:@"IXUserPresentableErrorDomain"],
        v13,
        (v14 & 1) != 0))
  {
    id v15 = [v10 userInfo];
    id v16 = +[NSMutableDictionary dictionaryWithDictionary:v15];

    int64_t v17 = sub_1000318BC(v9, 1uLL, v12);
    [v16 setObject:v17 forKeyedSubscript:NSLocalizedDescriptionKey];

    if (v12 == 16)
    {
      __int16 v18 = [v10 userInfo];
      id v19 = [v18 objectForKeyedSubscript:NSUnderlyingErrorKey];

      int64_t v20 = sub_1000319A8(v19, v9, 1uLL);
      [v16 setObject:v20 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];
    }
    else
    {
      id v19 = sub_100031AFC(v9, 1uLL, v12);
      [v16 setObject:v19 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];
    }

    *a5 = +[NSError errorWithDomain:@"IXUserPresentableErrorDomain" code:v12 userInfo:v16];

    id v23 = 0;
  }
  else
  {
    unint64_t v21 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10008AEB8(v21);
    }

    sub_10003DAE4((uint64_t)"-[IXSErrorPresenter localizedErrorForAppName:unlocalizedError:localizedError:withError:]", 153, @"IXErrorDomain", 1uLL, 0, 0, @"Invalid parameter(s)", v22, v26);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    if (a6 && v23)
    {
      id v23 = v23;
      *a6 = v23;
    }
  }
  BOOL v24 = v23 == 0;

  return v24;
}

@end