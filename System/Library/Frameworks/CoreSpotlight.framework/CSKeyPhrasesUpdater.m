@interface CSKeyPhrasesUpdater
- (BOOL)handleDonation:(id)a3 completionHandler:(id)a4 cancelBlock:(id)a5;
- (BOOL)isAcceptingJournals;
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
- (unint64_t)eventFlags;
@end

@implementation CSKeyPhrasesUpdater

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(CSKeyPhrasesUpdater *)self taskName];
  id v6 = [v3 initWithFormat:@"<%@:%p; %@>", v4, self, v5];

  return v6;
}

- (id)taskName
{
  return @"keyphrases";
}

- (int)eventType
{
  return 2;
}

- (BOOL)shouldHandleJournalItem:(id)a3
{
  id v3 = a3;
  long long v14 = 0uLL;
  uint64_t v15 = 0;
  sub_100010024((uint64_t)v3, (uint64_t)v13);
  if (_MDPlistDictionaryGetPlistObjectForKey()
    && ((v11 = v14, v12 = v15, int PlistObjectType = _MDPlistGetPlistObjectType(), (PlistObjectType - 226) < 2)
     || PlistObjectType == 51
     || PlistObjectType == 35))
  {
    long long v11 = v14;
    uint64_t v12 = v15;
    BOOL v5 = _MDPlistNumberGetIntValue() != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  sub_100010024((uint64_t)v3, (uint64_t)v10);
  if (_MDPlistDictionaryGetPlistObjectForKey()
    && ((v11 = v14, v12 = v15, int v6 = _MDPlistGetPlistObjectType(), (v6 - 226) < 2) || v6 == 51 || v6 == 35))
  {
    long long v11 = v14;
    uint64_t v12 = v15;
    BOOL v7 = _MDPlistNumberGetIntValue() == 0;
  }
  else
  {
    BOOL v7 = 1;
  }
  BOOL v8 = v5 && v7;

  return v8;
}

- (BOOL)isAcceptingJournals
{
  return 1;
}

- (BOOL)supportsCSIndexType:(int)a3
{
  return (a3 - 3) < 0xFFFFFFFE;
}

- (unint64_t)eventFlags
{
  return 0;
}

- (id)includeBundleIDs
{
  return 0;
}

- (id)excludeBundleIDs
{
  v2 = +[SKGProcessorContext sharedContext];
  id v3 = [v2 keyphraseExcludeBundles];

  return v3;
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

- (BOOL)handleDonation:(id)a3 completionHandler:(id)a4 cancelBlock:(id)a5
{
  BOOL v8 = (unsigned int *)a3;
  id v62 = a4;
  id v63 = a5;
  v9 = sub_100050730();
  os_signpost_id_t spid = os_signpost_id_generate(v9);

  v10 = sub_100050730();
  long long v11 = v10;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CSKeyphraseUpdaterHandleDonation", (const char *)&unk_1000C2652, buf, 2u);
  }

  uint64_t v12 = +[SKGProcessor sharedProcessor];
  [v12 loadKeyphraser];

  v13 = objc_alloc_init(CSEventFeedback);
  [(CSEventFeedback *)v13 setIndexType:sub_10000F9BC((uint64_t)v8)];
  [(CSEventFeedback *)v13 start];
  long long v14 = +[SKGProcessorContext sharedContext];
  uint64_t v15 = [v14 keyphraseFetchAttributes];

  id v16 = objc_alloc((Class)NSString);
  v17 = +[NSString stringWithUTF8String:sub_10001E910((uint64_t)v8)];
  v18 = (__CFString *)[v16 initWithString:v17];

  if (v18) {
    CFStringRef v19 = v18;
  }
  else {
    CFStringRef v19 = @"unknown";
  }
  -[CSEventFeedback setBundleID:](v13, "setBundleID:", v19, spid - 1);
  id v20 = objc_alloc((Class)NSString);
  v21 = sub_1000592B4(v8);
  id v22 = [v20 initWithString:v21];

  id v23 = objc_alloc((Class)NSString);
  v24 = +[NSString stringWithUTF8String:sub_10000F9B0((uint64_t)v8)];
  id v25 = [v23 initWithString:v24];

  v26 = +[NSNumber numberWithUnsignedLongLong:sub_10001E904((uint64_t)v8)];
  *(void *)buf = 0;
  v90 = buf;
  uint64_t v91 = 0x3032000000;
  v92 = sub_1000126C4;
  v93 = sub_100012580;
  id v94 = 0;
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x3032000000;
  v87[3] = sub_1000126C4;
  v87[4] = sub_100012580;
  id v88 = 0;
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x2020000000;
  v86[3] = 0;
  uint64_t v85 = 0;
  id v27 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v28 = sub_1000592E8((char *)v8);
    uint64_t v29 = sub_10001E904((uint64_t)v8);
    unsigned int v30 = [v8 getItemCount];
    *(_DWORD *)v95 = 138413058;
    v96 = self;
    __int16 v97 = 2080;
    v98 = v28;
    __int16 v99 = 2048;
    uint64_t v100 = v29;
    __int16 v101 = 1024;
    LODWORD(v102) = v30;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "### donation %@ %s sn:%llu total incoming %u items", v95, 0x26u);
  }

  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_100067754;
  v72[3] = &unk_1000DBA10;
  v72[4] = self;
  v31 = (uint64_t (**)(void))v63;
  id v80 = v31;
  v32 = v8;
  v73 = v32;
  v81 = v86;
  id v58 = v25;
  id v74 = v58;
  v33 = v13;
  v75 = v33;
  v82 = v87;
  id v57 = v15;
  id v76 = v57;
  v34 = v18;
  v77 = v34;
  id v35 = v22;
  id v78 = v35;
  v84 = &v85;
  id v59 = v26;
  id v79 = v59;
  v83 = buf;
  sub_100012034((uint64_t)v32, v72);
  int v64 = v31[2](v31);
  if (v64)
  {
    id v36 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = [(CSKeyPhrasesUpdater *)self taskName];
      v38 = (CSKeyPhrasesUpdater *)[v37 UTF8String];
      v39 = sub_1000592E8((char *)v32);
      uint64_t v40 = sub_10001E904((uint64_t)v32);
      *(_DWORD *)v95 = 136315650;
      v96 = v38;
      __int16 v97 = 2080;
      v98 = v39;
      __int16 v99 = 2048;
      uint64_t v100 = v40;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "### cancelling %s due to expiration request while processing type='%s' sn:'%llu'", v95, 0x20u);
    }
    [(CSEventFeedback *)v33 end];
    (*((void (**)(id, void, void, void))v62 + 2))(v62, 0, 0, 0);
    char v41 = 0;
  }
  else
  {
    v42 = (void *)*((void *)v90 + 5);
    if (v42) {
      id v43 = [v42 count];
    }
    else {
      id v43 = 0;
    }
    id v44 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v45 = sub_1000592E8((char *)v32);
      uint64_t v46 = sub_10001E904((uint64_t)v32);
      *(_DWORD *)v95 = 138413058;
      v96 = self;
      __int16 v97 = 2080;
      v98 = v45;
      __int16 v99 = 2048;
      uint64_t v100 = v46;
      __int16 v101 = 2048;
      id v102 = v43;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "### donation %@ %s sn:%llu found %lu items", v95, 0x2Au);
    }

    if (v43
      && (v47 = [objc_alloc((Class)CSSearchableIndex) _initWithName:@"KeyphraseUpdate" protectionClass:v35 bundleIdentifier:v34 options:32]) != 0)
    {
      v48 = sub_100050730();
      os_signpost_id_t v49 = os_signpost_id_generate(v48);

      v50 = sub_100050730();
      v51 = v50;
      if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
      {
        *(_WORD *)v95 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_INTERVAL_BEGIN, v49, "CSKeyphraseUpdaterHandleDonation", (const char *)&unk_1000C2652, v95, 2u);
      }

      id v52 = [objc_alloc((Class)NSError) initWithDomain:@"CSEmbeddingsUpdaterTimeout" code:-1 userInfo:0];
      uint64_t v53 = *((void *)v90 + 5);
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_100068188;
      v65[3] = &unk_1000DBA38;
      v66 = v33;
      os_signpost_id_t v68 = v49;
      os_signpost_id_t v69 = spid;
      id v67 = v62;
      id v70 = v43;
      uint64_t v71 = v85;
      [v47 indexSearchableItems:v53 timeout:v52 timeoutError:v65 completion:3.0e11];

      char v41 = 1;
    }
    else
    {
      [(CSEventFeedback *)v33 end];
      v54 = sub_100050730();
      v47 = v54;
      if (v56 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
      {
        *(_WORD *)v95 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_END, spid, "CSKeyphraseUpdaterHandleDonation", (const char *)&unk_1000C2652, v95, 2u);
      }
      char v41 = 0;
    }
  }
  _Block_object_dispose(v86, 8);
  _Block_object_dispose(v87, 8);

  _Block_object_dispose(buf, 8);

  return v64 | v41;
}

@end