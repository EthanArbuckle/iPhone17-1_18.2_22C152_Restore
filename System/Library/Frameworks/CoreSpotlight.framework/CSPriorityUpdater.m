@interface CSPriorityUpdater
+ (id)feedbackLock;
- (BOOL)handleDonation:(id)a3 completionHandler:(id)a4 cancelBlock:(id)a5;
- (BOOL)isAcceptingJournals;
- (BOOL)shouldHandleJournalItem:(id)a3;
- (BOOL)supportsCSIndexType:(int)a3;
- (CSPriorityUpdater)init;
- (id)description;
- (id)excludeBundleIDs;
- (id)excludeContentTypes;
- (id)getProcessorForIndexType:(int)a3;
- (id)includeBundleIDs;
- (id)includeContentTypes;
- (id)optionalAttribures;
- (id)requiredAttributes;
- (id)taskName;
- (int)eventType;
- (unint64_t)eventFlags;
@end

@implementation CSPriorityUpdater

+ (id)feedbackLock
{
  if (qword_1000F90D8 != -1) {
    dispatch_once(&qword_1000F90D8, &stru_1000DB400);
  }
  v2 = (void *)qword_1000F90D0;

  return v2;
}

- (CSPriorityUpdater)init
{
  v3 = sub_1000507C8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Initializing CSSearchableIndexAsyncProcessors for CSPriorityUpdater", buf, 2u);
  }

  v4 = objc_opt_new();
  uint64_t v5 = 0;
  do
  {
    v6 = [CSSearchableIndexAsyncProcessor alloc];
    v7 = +[NSString stringWithFormat:@"%s_%u", "CSPriorityUpdater", v5];
    v8 = [(CSSearchableIndexAsyncProcessor *)v6 initWithName:v7];
    [v4 addObject:v8];

    uint64_t v5 = (v5 + 1);
  }
  while (v5 != 6);
  v9 = (NSArray *)[v4 copy];
  asyncIndexProcessors = self->_asyncIndexProcessors;
  self->_asyncIndexProcessors = v9;

  return self;
}

- (id)getProcessorForIndexType:(int)a3
{
  return [(NSArray *)self->_asyncIndexProcessors objectAtIndexedSubscript:a3];
}

- (BOOL)isAcceptingJournals
{
  v2 = +[SKGProcessorContext sharedContext];
  unsigned __int8 v3 = [v2 enableEmbeddings];

  return v3;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CSPriorityUpdater *)self taskName];
  id v6 = [v3 initWithFormat:@"<%@:%p; %@>", v4, self, v5];

  return v6;
}

- (BOOL)supportsCSIndexType:(int)a3
{
  return 1;
}

- (id)taskName
{
  return @"priority";
}

- (unint64_t)eventFlags
{
  return 0;
}

- (int)eventType
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
  id v3 = [v2 embeddingExcludeBundles];

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

- (BOOL)shouldHandleJournalItem:(id)a3
{
  id v4 = a3;
  long long v15 = 0uLL;
  uint64_t v16 = 0;
  sub_100010024((uint64_t)v4, (uint64_t)v14);
  if (_MDPlistDictionaryGetPlistObjectForKey()
    && ((v12 = v15, v13 = v16, int PlistObjectType = _MDPlistGetPlistObjectType(), (PlistObjectType - 226) < 2)
     || PlistObjectType == 51
     || PlistObjectType == 35))
  {
    long long v12 = v15;
    uint64_t v13 = v16;
    BOOL v6 = _MDPlistNumberGetIntValue() != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  sub_100010024((uint64_t)v4, (uint64_t)v11);
  if (_MDPlistDictionaryGetPlistObjectForKey()
    && ((v12 = v15, v13 = v16, int v7 = _MDPlistGetPlistObjectType(), (v7 - 226) < 2) || v7 == 51 || v7 == 35))
  {
    long long v12 = v15;
    uint64_t v13 = v16;
    BOOL v8 = _MDPlistNumberGetIntValue() == 0;
  }
  else
  {
    BOOL v8 = 1;
  }
  if ([(CSPriorityUpdater *)self isAcceptingJournals]) {
    BOOL v9 = v6 && v8;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)handleDonation:(id)a3 completionHandler:(id)a4 cancelBlock:(id)a5
{
  BOOL v8 = (unsigned int *)a3;
  id v55 = a4;
  id v52 = a5;
  +[CSDeviceListener sharedListener];

  BOOL v9 = objc_alloc_init(CSEventFeedback);
  [(CSEventFeedback *)v9 setIndexType:sub_10000F9BC((uint64_t)v8)];
  [(CSEventFeedback *)v9 start];
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x2020000000;
  char v94 = 0;
  +[CSEventFeedback elapsedTimeSinceFlushForEvent:13];
  if (v10 > 60.0)
  {
    v11 = +[SKGProcessor sharedProcessor];
    [v11 loadEmbedder];

    +[CSEventFeedback logEmbeddingPrewarmRequestTime];
  }
  long long v12 = sub_100050730();
  os_signpost_id_t spid = os_signpost_id_generate(v12);

  uint64_t v13 = sub_100050730();
  v14 = v13;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CSPriorityUpdaterHandleDonation", (const char *)&unk_1000C2652, buf, 2u);
  }

  long long v15 = +[SKGProcessorContext sharedContext];
  uint64_t v16 = [v15 embeddingFetchAttributes];

  id v17 = objc_alloc((Class)NSString);
  v18 = +[NSString stringWithUTF8String:sub_10001E910((uint64_t)v8)];
  v19 = (__CFString *)[v17 initWithString:v18];

  if (v19) {
    CFStringRef v20 = v19;
  }
  else {
    CFStringRef v20 = @"unknown";
  }
  [(CSEventFeedback *)v9 setBundleID:v20];
  id v21 = objc_alloc((Class)NSString);
  v22 = sub_1000592B4(v8);
  id v23 = [v21 initWithString:v22];

  v24 = +[NSNumber numberWithUnsignedLongLong:sub_10001E904((uint64_t)v8)];
  *(void *)buf = 0;
  v86 = buf;
  uint64_t v87 = 0x3032000000;
  v88 = sub_1000126A4;
  v89 = sub_100012570;
  id v90 = 0;
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x3032000000;
  v83[3] = sub_1000126A4;
  v83[4] = sub_100012570;
  id v84 = 0;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x2020000000;
  v82[3] = 0;
  uint64_t v81 = 0;
  v25 = sub_1000507C8();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = sub_1000592E8((char *)v8);
    uint64_t v27 = sub_10001E904((uint64_t)v8);
    unsigned int v28 = [v8 getItemCount];
    *(_DWORD *)v95 = 138413058;
    v96 = self;
    __int16 v97 = 2080;
    v98 = v26;
    __int16 v99 = 2048;
    uint64_t v100 = v27;
    __int16 v101 = 1024;
    LODWORD(v102) = v28;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "### donation %@ %s sn:%llu total incoming %u items", v95, 0x26u);
  }

  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_10005B47C;
  v68[3] = &unk_1000DB4C8;
  v29 = v8;
  v69 = v29;
  v30 = v19;
  v70 = v30;
  v71 = self;
  v31 = (unsigned int (**)(void))v52;
  id v76 = v31;
  v77 = v82;
  v32 = v9;
  v72 = v32;
  v78 = v83;
  id v53 = v16;
  id v73 = v53;
  id v33 = v23;
  id v74 = v33;
  v80 = &v81;
  id v34 = v24;
  id v75 = v34;
  v79 = buf;
  sub_100012034((uint64_t)v29, v68);
  if (v31[2](v31))
  {
    v35 = +[SKGActivityJournal sharedJournal];
    [v35 addEventForItem:36 bundleID:v30 identifier:v30];

    v36 = sub_1000507C8();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      id v37 = [(CSPriorityUpdater *)self taskName];
      v38 = (CSPriorityUpdater *)[v37 UTF8String];
      v39 = sub_1000592E8((char *)v29);
      uint64_t v40 = sub_10001E904((uint64_t)v29);
      *(_DWORD *)v95 = 136315650;
      v96 = v38;
      __int16 v97 = 2080;
      v98 = v39;
      __int16 v99 = 2048;
      uint64_t v100 = v40;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "### cancelling %s due to expiration request while processing type='%s' sn:'%llu'", v95, 0x20u);
    }
    [(CSEventFeedback *)v32 end];
    (*((void (**)(id, void, void, void))v55 + 2))(v55, 0, 0, 0);
    BOOL v41 = 1;
  }
  else
  {
    id v42 = [*((id *)v86 + 5) count];
    v43 = sub_1000507C8();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = sub_1000592E8((char *)v29);
      uint64_t v45 = sub_10001E904((uint64_t)v29);
      *(_DWORD *)v95 = 138413058;
      v96 = self;
      __int16 v97 = 2080;
      v98 = v44;
      __int16 v99 = 2048;
      uint64_t v100 = v45;
      __int16 v101 = 2048;
      id v102 = v42;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "### donation %@ %s sn:%llu found %lu items", v95, 0x2Au);
    }

    if (+[CSEventListenerTasksManager turboMode]) {
      uint64_t v46 = 32;
    }
    else {
      uint64_t v46 = 0;
    }
    if (v42
      && ([(CSPriorityUpdater *)self getProcessorForIndexType:sub_10000F9BC((uint64_t)v29)],
          (v47 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v51 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"CSPriorityUpdater-Indexing-%d", sub_10000F9BC((uint64_t)v29));
      v48 = +[SKGEventsProfiler sharedInstance];
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_10005C3F0;
      v56[3] = &unk_1000DB518;
      v62 = buf;
      v63 = &v91;
      id v49 = v47;
      id v57 = v49;
      id v58 = v33;
      v59 = v30;
      uint64_t v64 = v46;
      v60 = v32;
      os_signpost_id_t v65 = spid;
      id v61 = v55;
      id v66 = v42;
      uint64_t v67 = v81;
      [v48 profileCodeWithType:v51 kind:2 block:v56];
    }
    else
    {
      [(CSEventFeedback *)v32 end];
      id v49 = 0;
    }
    BOOL v41 = *((unsigned char *)v92 + 24) != 0;
  }
  _Block_object_dispose(v82, 8);
  _Block_object_dispose(v83, 8);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v91, 8);

  return v41;
}

- (void).cxx_destruct
{
}

@end