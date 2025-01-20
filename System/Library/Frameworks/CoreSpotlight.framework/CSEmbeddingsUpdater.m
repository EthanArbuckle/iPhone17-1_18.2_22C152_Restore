@interface CSEmbeddingsUpdater
- (BOOL)handleDonation:(id)a3 completionHandler:(id)a4 cancelBlock:(id)a5;
- (BOOL)isAcceptingJournals;
- (BOOL)shouldHandleJournalItem:(id)a3;
- (BOOL)supportsCSIndexType:(int)a3;
- (CSEmbeddingsUpdater)init;
- (id)description;
- (id)excludeBundleIDs;
- (id)excludeContentTypes;
- (id)getEmbeddingWithCache:(id)a3 key:(id)a4 bundleId:(id)a5;
- (id)getProcessorForIndexType:(int)a3;
- (id)includeBundleIDs;
- (id)includeContentTypes;
- (id)optionalAttribures;
- (id)requiredAttributes;
- (id)taskName;
- (int)eventType;
- (unint64_t)eventFlags;
- (void)storeEmbeddingWithCache:(id)a3 key:(id)a4 attributeSet:(id)a5;
@end

@implementation CSEmbeddingsUpdater

- (CSEmbeddingsUpdater)init
{
  v3 = sub_1000507C8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Initializing CSSearchableIndexAsyncProcessors for CSEmbeddingsUpdater", buf, 2u);
  }

  v4 = objc_opt_new();
  uint64_t v5 = 0;
  do
  {
    v6 = [CSSearchableIndexAsyncProcessor alloc];
    v7 = +[NSString stringWithFormat:@"%s_%u", "CSEmbeddingsUpdater", v5];
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

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CSEmbeddingsUpdater *)self taskName];
  id v6 = [v3 initWithFormat:@"<%@:%p; %@>", v4, self, v5];

  return v6;
}

- (BOOL)isAcceptingJournals
{
  v2 = +[SKGProcessorContext sharedContext];
  unsigned __int8 v3 = [v2 enableEmbeddings];

  return v3;
}

- (BOOL)supportsCSIndexType:(int)a3
{
  return 1;
}

- (id)taskName
{
  return @"embeddings";
}

- (unint64_t)eventFlags
{
  return 0;
}

- (int)eventType
{
  return 1;
}

- (id)includeBundleIDs
{
  return 0;
}

- (id)excludeBundleIDs
{
  v2 = +[SKGProcessorContext sharedContext];
  unsigned __int8 v3 = [v2 embeddingExcludeBundles];

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
  if ([(CSEmbeddingsUpdater *)self isAcceptingJournals]) {
    BOOL v9 = v6 && v8;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)storeEmbeddingWithCache:(id)a3 key:(id)a4 attributeSet:(id)a5
{
  if (a3)
  {
    id v7 = a4;
    id v8 = a3;
    id v11 = +[EmbeddingCacheUtil serialize:a5];
    id v9 = v7;
    id v10 = [v9 UTF8String];

    [v8 put:v10 value:v11];
  }
}

- (id)getEmbeddingWithCache:(id)a3 key:(id)a4 bundleId:(id)a5
{
  uint64_t v5 = 0;
  if (a3 && a4 && a5)
  {
    id v7 = a4;
    id v8 = a3;
    id v9 = objc_msgSend(v8, "get:", objc_msgSend(v7, "UTF8String"));

    uint64_t v5 = +[EmbeddingCacheUtil deserialize:v9];
  }

  return v5;
}

- (BOOL)handleDonation:(id)a3 completionHandler:(id)a4 cancelBlock:(id)a5
{
  id v7 = (unsigned int *)a3;
  id v63 = a4;
  id v8 = a5;
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x2020000000;
  char v103 = 0;
  +[CSEventFeedback elapsedTimeSinceFlushForEvent:13];
  if (v9 > 60.0)
  {
    id v10 = +[SKGProcessor sharedProcessor];
    [v10 loadEmbedder];

    +[CSEventFeedback logEmbeddingPrewarmRequestTime];
  }
  id v11 = sub_100050730();
  os_signpost_id_t spid = os_signpost_id_generate(v11);

  long long v12 = sub_100050730();
  uint64_t v13 = v12;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CSEmbeddingsUpdaterHandleDonation", (const char *)&unk_1000C2652, buf, 2u);
  }

  v14 = objc_alloc_init(CSEventFeedback);
  [(CSEventFeedback *)v14 setIndexType:sub_10000F9BC((uint64_t)v7)];
  [(CSEventFeedback *)v14 start];
  long long v15 = +[SKGProcessorContext sharedContext];
  uint64_t v16 = [v15 embeddingFetchAttributes];

  id v17 = objc_alloc((Class)NSString);
  v18 = +[NSString stringWithUTF8String:sub_10001E910((uint64_t)v7)];
  v19 = (__CFString *)[v17 initWithString:v18];

  if (v19) {
    CFStringRef v20 = v19;
  }
  else {
    CFStringRef v20 = @"unknown";
  }
  [(CSEventFeedback *)v14 setBundleID:v20];
  id v21 = objc_alloc((Class)NSString);
  v22 = sub_1000592B4(v7);
  id v23 = [v21 initWithString:v22];

  *(void *)buf = 0;
  v95 = buf;
  uint64_t v96 = 0x3032000000;
  v97 = sub_1000126B4;
  v98 = sub_100012578;
  id v99 = 0;
  v92[0] = 0;
  v92[1] = v92;
  v92[2] = 0x3032000000;
  v92[3] = sub_1000126B4;
  v92[4] = sub_100012578;
  id v93 = 0;
  v91[0] = 0;
  v91[1] = v91;
  v91[2] = 0x2020000000;
  v91[3] = 0;
  uint64_t v90 = 0;
  v24 = sub_1000507C8();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = sub_1000592E8((char *)v7);
    uint64_t v26 = sub_10001E904((uint64_t)v7);
    unsigned int v27 = [v7 getItemCount];
    *(_DWORD *)v104 = 138413058;
    *(void *)v105 = self;
    *(_WORD *)&v105[8] = 2080;
    v106 = v25;
    __int16 v107 = 2048;
    uint64_t v108 = v26;
    __int16 v109 = 1024;
    LODWORD(v110) = v27;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "### donation %@ %s sn:%llu total incoming %u items", v104, 0x26u);
  }

  v28 = +[EmbeddingCache sharedInstanceWithType:sub_10000F9BC((uint64_t)v7)];
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_100062398;
  v77[3] = &unk_1000DB798;
  v29 = v7;
  v78 = v29;
  v30 = v19;
  v79 = v30;
  v80 = self;
  id v59 = v16;
  id v81 = v59;
  v31 = (uint64_t (**)(void))v8;
  id v85 = v31;
  v86 = v91;
  v32 = v14;
  v82 = v32;
  v87 = v92;
  id v33 = v28;
  id v83 = v33;
  v89 = &v90;
  id v61 = v23;
  id v84 = v61;
  v88 = buf;
  sub_100012034((uint64_t)v29, v77);
  if (v33)
  {
    [v33 flush];
    v34 = sub_1000507C8();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v35 = [v33 hitRate];
      int v36 = sub_10000F9BC((uint64_t)v29);
      unsigned int v37 = [v33 itemCount];
      *(_DWORD *)v104 = 67109632;
      *(_DWORD *)v105 = v35;
      *(_WORD *)&v105[4] = 1024;
      *(_DWORD *)&v105[6] = v36;
      LOWORD(v106) = 1024;
      *(_DWORD *)((char *)&v106 + 2) = v37;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "### EmbeddingCache HitRate = %u, (%d) Total Items = %u", v104, 0x14u);
    }

    v38 = +[SKGActivityJournal sharedJournal];
    objc_msgSend(v38, "addEventForItemWithNum:num:", 54, objc_msgSend(v33, "hitRate") + 100 * sub_10000F9BC((uint64_t)v29));
  }
  int v39 = v31[2](v31);
  char v40 = v39;
  if (v39)
  {
    v41 = +[SKGActivityJournal sharedJournal];
    [v41 addEventForItem:35 bundleID:v30 identifier:v30];

    v42 = sub_1000507C8();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      id v43 = [(CSEmbeddingsUpdater *)self taskName];
      id v44 = [v43 UTF8String];
      v45 = sub_1000592E8((char *)v29);
      uint64_t v46 = sub_10001E904((uint64_t)v29);
      *(_DWORD *)v104 = 136315650;
      *(void *)v105 = v44;
      *(_WORD *)&v105[8] = 2080;
      v106 = v45;
      __int16 v107 = 2048;
      uint64_t v108 = v46;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "### cancelling %s due to expiration request while processing type='%s' sn:'%llu'", v104, 0x20u);
    }
    [(CSEventFeedback *)v32 end];
    (*((void (**)(id, void, void, void))v63 + 2))(v63, 0, 0, 0);
  }
  else
  {
    v47 = (void *)*((void *)v95 + 5);
    if (v47) {
      id v48 = [v47 count];
    }
    else {
      id v48 = 0;
    }
    v49 = sub_1000507C8();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      v50 = sub_1000592E8((char *)v29);
      uint64_t v51 = sub_10001E904((uint64_t)v29);
      *(_DWORD *)v104 = 138413058;
      *(void *)v105 = self;
      *(_WORD *)&v105[8] = 2080;
      v106 = v50;
      __int16 v107 = 2048;
      uint64_t v108 = v51;
      __int16 v109 = 2048;
      id v110 = v48;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "### donation %@ %s sn:%llu found %lu items", v104, 0x2Au);
    }

    if (v48
      && ([(CSEmbeddingsUpdater *)self getProcessorForIndexType:sub_10000F9BC((uint64_t)v29)], (v52 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v53 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"CSEmbeddingsUpdater-Indexing-%d", sub_10000F9BC((uint64_t)v29));
      v54 = +[SKGEventsProfiler sharedInstance];
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_1000636AC;
      v65[3] = &unk_1000DB518;
      v71 = &v100;
      v72 = buf;
      id v55 = v52;
      id v66 = v55;
      id v67 = v61;
      v68 = v30;
      uint64_t v73 = 32;
      v69 = v32;
      os_signpost_id_t v74 = spid;
      id v70 = v63;
      id v75 = v48;
      uint64_t v76 = v90;
      [v54 profileCodeWithType:v53 kind:1 block:v65];
    }
    else
    {
      v56 = +[SKGActivityJournal sharedJournal];
      [v56 addVerboseEventForCSSearchableItems:200 items:*((void *)v95 + 5)];

      [(CSEventFeedback *)v32 end];
    }
  }

  _Block_object_dispose(v91, 8);
  _Block_object_dispose(v92, 8);

  _Block_object_dispose(buf, 8);
  BOOL v57 = (v40 & 1) != 0 || *((unsigned char *)v101 + 24) != 0;
  _Block_object_dispose(&v100, 8);

  return v57;
}

- (void).cxx_destruct
{
}

@end