@interface CSDocumentUnderstandingUpdater
- (BOOL)handleDonation:(id)a3 completionHandler:(id)a4 cancelBlock:(id)a5;
- (BOOL)isAcceptingJournals;
- (BOOL)journalItemHasDocUnderstandingSN:(id)a3;
- (BOOL)journalItemIsSupportedDocument:(id)a3;
- (BOOL)journalItemNeedsDocUnderstanding:(id)a3;
- (BOOL)shouldHandleJournalItem:(id)a3;
- (BOOL)supportsCSIndexType:(int)a3;
- (id)description;
- (id)excludeBundleIDs;
- (id)excludeContentTypes;
- (id)includeBundleIDs;
- (id)includeContentTypes;
- (id)optionalAttribures;
- (id)requiredAttributes;
- (id)taskName;
- (int)eventType;
- (int64_t)getItemDocumentType:(id)a3;
- (unint64_t)eventFlags;
@end

@implementation CSDocumentUnderstandingUpdater

- (BOOL)isAcceptingJournals
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(CSDocumentUnderstandingUpdater *)self taskName];
  id v6 = [v3 initWithFormat:@"<%@:%p; %@>", v4, self, v5];

  return v6;
}

- (BOOL)supportsCSIndexType:(int)a3
{
  return 1;
}

- (id)taskName
{
  return @"CSDocumentUnderstandingUpdater";
}

- (unint64_t)eventFlags
{
  return 32;
}

- (int)eventType
{
  return 7;
}

- (id)includeBundleIDs
{
  v2 = +[SKGProcessorContext sharedContext];
  id v3 = [v2 docUnderstandingIncludeBundles];

  return v3;
}

- (id)excludeBundleIDs
{
  return 0;
}

- (id)includeContentTypes
{
  return 0;
}

- (id)excludeContentTypes
{
  return 0;
}

- (id)requiredAttributes
{
  return 0;
}

- (id)optionalAttribures
{
  return 0;
}

- (BOOL)journalItemNeedsDocUnderstanding:(id)a3
{
  long long v7 = 0uLL;
  uint64_t v8 = 0;
  sub_100010024((uint64_t)a3, (uint64_t)v6);
  int PlistObjectForKey = _MDPlistDictionaryGetPlistObjectForKey();
  if (PlistObjectForKey)
  {
    int PlistObjectType = _MDPlistGetPlistObjectType();
    LOBYTE(PlistObjectForKey) = ((PlistObjectType - 226) < 2
                              || PlistObjectType == 51
                              || PlistObjectType == 35)
                             && _MDPlistNumberGetIntValue();
  }
  return PlistObjectForKey;
}

- (BOOL)journalItemHasDocUnderstandingSN:(id)a3
{
  long long v7 = 0uLL;
  uint64_t v8 = 0;
  sub_100010024((uint64_t)a3, (uint64_t)v6);
  int PlistObjectForKey = _MDPlistDictionaryGetPlistObjectForKey();
  if (PlistObjectForKey)
  {
    int PlistObjectType = _MDPlistGetPlistObjectType();
    LOBYTE(PlistObjectForKey) = ((PlistObjectType - 226) < 2
                              || PlistObjectType == 51
                              || PlistObjectType == 35)
                             && _MDPlistNumberGetIntValue();
  }
  return PlistObjectForKey;
}

- (BOOL)journalItemIsSupportedDocument:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  long long v7 = 0uLL;
  uint64_t v8 = 0;
  sub_100010024((uint64_t)v3, (uint64_t)v6);
  if (_MDPlistDictionaryGetPlistObjectForKey() && _MDPlistGetPlistObjectType() == 240) {
    _MDPlistArrayIterate();
  }
  char v4 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v4;
}

- (BOOL)shouldHandleJournalItem:(id)a3
{
  id v4 = a3;
  if ([(CSDocumentUnderstandingUpdater *)self journalItemNeedsDocUnderstanding:v4])
  {
    unsigned int v5 = ![(CSDocumentUnderstandingUpdater *)self journalItemHasDocUnderstandingSN:v4];
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (int64_t)getItemDocumentType:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  long long v7 = 0uLL;
  uint64_t v8 = 0;
  sub_100010024((uint64_t)v3, (uint64_t)v6);
  if (_MDPlistDictionaryGetPlistObjectForKey() && _MDPlistGetPlistObjectType() == 240) {
    _MDPlistArrayIterate();
  }
  int64_t v4 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v4;
}

- (BOOL)handleDonation:(id)a3 completionHandler:(id)a4 cancelBlock:(id)a5
{
  long long v7 = (unsigned int *)a3;
  id v8 = a4;
  id v9 = a5;
  v10 = sub_100050730();
  os_signpost_id_t spid = os_signpost_id_generate(v10);

  uint64_t v11 = sub_100050730();
  uint64_t v12 = v11;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CSDocUnderstandingUpdaterHandleDonation", (const char *)&unk_1000C2652, buf, 2u);
  }

  v13 = objc_alloc_init(CSEventFeedback);
  [(CSEventFeedback *)v13 setIndexType:sub_10000F9BC((uint64_t)v7)];
  [(CSEventFeedback *)v13 start];
  v14 = +[SKGProcessorContext sharedContext];
  v54 = [v14 docUnderstandingFetchAttributes];

  id v15 = objc_alloc((Class)NSString);
  v16 = +[NSString stringWithUTF8String:sub_10001E910((uint64_t)v7)];
  v17 = (__CFString *)[v15 initWithString:v16];

  if (v17) {
    CFStringRef v18 = v17;
  }
  else {
    CFStringRef v18 = @"unknown";
  }
  [(CSEventFeedback *)v13 setBundleID:v18];
  id v19 = objc_alloc((Class)NSString);
  v20 = sub_1000592B4(v7);
  id v21 = [v19 initWithString:v20];

  v22 = +[NSNumber numberWithUnsignedLongLong:sub_10001E904((uint64_t)v7)];
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x2020000000;
  uint64_t v97 = 0;
  *(void *)buf = 0;
  v89 = buf;
  uint64_t v90 = 0x3032000000;
  v91 = sub_1000125C0;
  v92 = sub_1000124F8;
  id v93 = 0;
  id v93 = objc_alloc_init((Class)NSMutableArray);
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x2020000000;
  v87[3] = 0;
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x3032000000;
  v84 = sub_1000125C0;
  v85 = sub_1000124F8;
  id v86 = 0;
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  char v80 = 0;
  dispatch_time_t v48 = dispatch_time(0, 0);
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_100013FA0;
  v66[3] = &unk_1000D95D0;
  v66[4] = self;
  v57 = (uint64_t (**)(void))v9;
  v72 = v57;
  v23 = v7;
  v67 = v23;
  v73 = v87;
  v56 = v13;
  v68 = v56;
  id v49 = v54;
  id v69 = v49;
  v24 = v17;
  v70 = v24;
  id v50 = v22;
  id v71 = v50;
  v74 = buf;
  v75 = &v81;
  v76 = &v77;
  sub_100012034((uint64_t)v23, v66);
  v25 = v21;
  int v55 = v57[2]();
  if (v55)
  {
    id v26 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [(CSDocumentUnderstandingUpdater *)self taskName];
      v28 = (char *)[v27 UTF8String];
      v29 = sub_1000592E8((char *)v23);
      uint64_t v30 = sub_10001E904((uint64_t)v23);
      *(_DWORD *)v98 = 138413058;
      v99 = self;
      __int16 v100 = 2080;
      v101 = v28;
      __int16 v102 = 2080;
      uint64_t v103 = (uint64_t)v29;
      __int16 v104 = 2048;
      uint64_t v105 = v30;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "### %@ cancelling %s due to expiration request while processing type='%s' sn:'%llu'", v98, 0x2Au);
    }
    [(CSEventFeedback *)v56 end];
    (*((void (**)(id, void, void, void))v8 + 2))(v8, 0, 0, 0);
    char v31 = 0;
  }
  else
  {
    v32 = v82[5];
    if (v32)
    {
      v33 = (unsigned __int8 *)(v78 + 3);
      dispatch_time_t v34 = dispatch_time(0, 600000000000);
      atomic_store(dispatch_group_wait(v32, v34) != 0, v33);
    }
    v95[3] = dispatch_time(0, 0) - v48;
    id v35 = [*((id *)v89 + 5) count];
    id v36 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v37 = sub_1000592E8((char *)v23);
      uint64_t v38 = sub_10001E904((uint64_t)v23);
      *(_DWORD *)v98 = 138413058;
      v99 = self;
      __int16 v100 = 2080;
      v101 = v37;
      __int16 v102 = 2048;
      uint64_t v103 = v38;
      __int16 v104 = 2048;
      uint64_t v105 = (uint64_t)v35;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "### %@ donation %s sn:%llu found %lu items", v98, 0x2Au);
    }

    if (v35
      && (v39 = [objc_alloc((Class)CSSearchableIndex) _initWithName:@"DocumentUnderstandingUpdate" protectionClass:v25 bundleIdentifier:v24 options:32]) != 0)
    {
      v40 = sub_100050730();
      os_signpost_id_t v41 = os_signpost_id_generate(v40);

      v42 = sub_100050730();
      v43 = v42;
      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        *(_WORD *)v98 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_BEGIN, v41, "CSDocUnderstandingUpdaterIndexItems", (const char *)&unk_1000C2652, v98, 2u);
      }

      id v44 = [objc_alloc((Class)NSError) initWithDomain:@"CSDocUnderstandingUpdaterTimeout" code:-1 userInfo:0];
      uint64_t v45 = *((void *)v89 + 5);
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_100014864;
      v58[3] = &unk_1000D95F8;
      v61 = &v94;
      dispatch_time_t v62 = v48;
      v59 = v56;
      os_signpost_id_t v63 = v41;
      os_signpost_id_t v64 = spid;
      id v60 = v8;
      id v65 = v35;
      [v39 indexSearchableItems:v45 timeout:v44 timeoutError:v58 completion:3.0e11];

      char v31 = 1;
    }
    else
    {
      [(CSEventFeedback *)v56 end];
      v46 = sub_100050730();
      v39 = v46;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
      {
        *(_WORD *)v98 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_END, spid, "CSDocUnderstandingUpdaterHandleDonation", (const char *)&unk_1000C2652, v98, 2u);
      }
      char v31 = 0;
    }
  }
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);

  _Block_object_dispose(v87, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v94, 8);

  return v55 | v31;
}

@end