@interface IDSQueryUtilities
+ (id)URIToQueryFrom:(id)a3 withPreferredFromURI:(id)a4;
+ (id)accountToQueryFrom:(id)a3 fromURI:(id)a4 destinationStrings:(id)a5 allowLocalAccount:(BOOL)a6;
+ (id)accountToQueryFrom:(id)a3 fromURI:(id)a4 destinationURIs:(id)a5 allowLocalAccount:(BOOL)a6;
+ (id)prefixedAliasStringToQueryFrom:(id)a3 withPreferredFromURI:(id)a4;
@end

@implementation IDSQueryUtilities

+ (id)accountToQueryFrom:(id)a3 fromURI:(id)a4 destinationURIs:(id)a5 allowLocalAccount:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_msgSend(a5, "__imArrayByApplyingBlock:", &stru_100980738);
  v13 = [a1 accountToQueryFrom:v11 fromURI:v10 destinationStrings:v12 allowLocalAccount:v6];

  return v13;
}

+ (id)accountToQueryFrom:(id)a3 fromURI:(id)a4 destinationStrings:(id)a5 allowLocalAccount:(BOOL)a6
{
  BOOL v56 = a6;
  id v8 = a3;
  id v60 = a4;
  id v9 = a5;
  id v61 = objc_alloc_init((Class)NSMutableArray);
  v57 = v9;
  id v10 = objc_msgSend(v9, "__imArrayByApplyingBlock:", &stru_100980758);
  id v62 = [v10 mutableCopy];

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v70 objects:v79 count:16];
  if (v11)
  {
    v64 = 0;
    BOOL v12 = 0;
    v13 = 0;
    uint64_t v14 = *(void *)v71;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v71 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        if ([v16 accountType] == 1)
        {
          id v17 = v16;

          v18 = [v17 unprefixedURIStringsFromRegistration];
          v69[0] = _NSConcreteStackBlock;
          v69[1] = 3221225472;
          v69[2] = sub_10006EA5C;
          v69[3] = &unk_100980780;
          v69[4] = v17;
          v19 = +[NSPredicate predicateWithBlock:v69];
          v20 = [v18 filteredArrayUsingPredicate:v19];

          BOOL v12 = [v20 count] != 0;
          v21 = [v17 unprefixedURIStringsFromRegistration];
          [v62 removeObjectsInArray:v21];

          v13 = v17;
        }
        else if ([v16 accountType] {
               || ![v16 isUsableForSending])
        }
        {
          id v22 = v16;

          v64 = v22;
        }
        else
        {
          [v61 addObject:v16];
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v70 objects:v79 count:16];
    }
    while (v11);
  }
  else
  {
    v64 = 0;
    BOOL v12 = 0;
    v13 = 0;
  }

  id v58 = [v62 count];
  if (v60)
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v59 = obj;
    id v23 = [v59 countByEnumeratingWithState:&v65 objects:v78 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v66;
LABEL_19:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v66 != v24) {
          objc_enumerationMutation(v59);
        }
        v26 = *(void **)(*((void *)&v65 + 1) + 8 * v25);
        v27 = [v26 unprefixedURIStringsFromRegistration];
        v28 = [v60 prefixedURI];
        v29 = [v28 _stripFZIDPrefix];
        if ([v27 containsObject:v29])
        {
          unsigned __int8 v30 = [v26 isUsableForSending];

          if (v30)
          {
            unsigned int v31 = [v26 accountType];
            BOOL v32 = v31 != 1 || v58 == 0;
            if (v32 || v12) {
              v33 = v26;
            }
            else {
              v33 = 0;
            }
            id v34 = v33;

            if (!v34) {
              goto LABEL_42;
            }
            v35 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              v36 = [v34 smallDescription];
              *(_DWORD *)buf = 138412290;
              CFStringRef v75 = v36;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Selected account {accountMatchingFromID: %@}", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              v50 = [v34 smallDescription];
              MarcoLogMadridLevel();

              v51 = objc_msgSend(v34, "smallDescription", v50);
              IMLogString();

              if (_IMWillLog())
              {
                v52 = objc_msgSend(v34, "smallDescription", v51);
                _IMAlwaysLog();
              }
            }
            id v37 = v34;
            id v38 = v26;
LABEL_78:

            goto LABEL_79;
          }
        }
        else
        {
        }
        if (v23 == (id)++v25)
        {
          id v23 = [v59 countByEnumeratingWithState:&v65 objects:v78 count:16];
          if (v23) {
            goto LABEL_19;
          }
          break;
        }
      }
    }
  }
LABEL_42:
  [v61 sortUsingComparator:&stru_1009807C0];
  v39 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v40 = @"YES";
    if (v58) {
      CFStringRef v41 = @"YES";
    }
    else {
      CFStringRef v41 = @"NO";
    }
    if (!v12) {
      CFStringRef v40 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v75 = v41;
    __int16 v76 = 2112;
    CFStringRef v77 = v40;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Selecting account {forOutsideiCloudMessaging: %@, iCloudUsableForOutside: %@}", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    v42 = v58 ? @"YES" : @"NO";
    v43 = v12 ? @"YES" : @"NO";
    MarcoLogMadridLevel();
    v49 = v42;
    v55 = v43;
    IMLogString();
    if (_IMWillLog())
    {
      v49 = v42;
      v55 = v43;
      _IMAlwaysLog();
    }
  }
  if (v13 && (v58 == 0 || v12) && [v13 isUsableForSending]) {
    goto LABEL_71;
  }
  if (objc_msgSend(v61, "count", v49, v55))
  {
    id v44 = [v61 firstObject];
LABEL_72:
    id v38 = v44;
    goto LABEL_73;
  }
  if (!v56 || ![v64 isEnabled])
  {
    if (!v13)
    {
      id v38 = 0;
      goto LABEL_73;
    }
LABEL_71:
    id v44 = v13;
    goto LABEL_72;
  }
  id v38 = v64;
  v45 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Selected local account", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    MarcoLogMadridLevel();
    IMLogString();
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
LABEL_73:
  v46 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v47 = [v38 smallDescription];
    *(_DWORD *)buf = 138412290;
    CFStringRef v75 = v47;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Selected account {registeredAccount: %@}", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v53 = [v38 smallDescription];
    MarcoLogMadridLevel();

    v54 = objc_msgSend(v38, "smallDescription", v53);
    IMLogString();

    if (_IMWillLog())
    {
      v26 = objc_msgSend(v38, "smallDescription", v54);
      _IMAlwaysLog();
      goto LABEL_78;
    }
  }
LABEL_79:

  return v38;
}

+ (id)prefixedAliasStringToQueryFrom:(id)a3 withPreferredFromURI:(id)a4
{
  v4 = [a1 URIToQueryFrom:a3 withPreferredFromURI:a4];
  v5 = [v4 prefixedURI];

  return v5;
}

+ (id)URIToQueryFrom:(id)a3 withPreferredFromURI:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 accountType] == 2)
  {
    id v7 = objc_alloc((Class)IDSURI);
    id v8 = [v5 loginID];
    id v9 = [v5 service];
    id v10 = [v9 identifier];
    id v11 = [v7 initWithPrefixedURI:v8 withServiceLoggingHint:v10];
  }
  else
  {
    BOOL v12 = [v5 service];
    v13 = [v12 identifier];
    _IDSPrefersPhoneNumbersForServiceIdentifier();

    if ([v5 shouldRegisterUsingDSHandle])
    {
      uint64_t v14 = [v5 primaryRegistration];
      id v8 = [v14 dsHandle];
    }
    else
    {
      id v8 = 0;
    }
    v15 = [v6 unprefixedURI];
    v16 = [v5 unprefixedURIStringsFromRegistration];
    id v9 = (void *)_IDSCopyCallerIDWithSelfMessagingHint();

    id v17 = objc_alloc((Class)IDSURI);
    id v10 = [v5 service];
    v18 = [v10 identifier];
    id v11 = [v17 initWithUnprefixedURI:v9 withServiceLoggingHint:v18];
  }

  return v11;
}

@end