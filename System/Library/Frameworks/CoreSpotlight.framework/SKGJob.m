@interface SKGJob
- (BOOL)_archiveCoreSpotlightItems:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 batchArchivedBlock:(id)a6 cancelBlock:(id)a7 errorBlock:(id)a8;
- (BOOL)_recordIsOld:(id)a3 dateKeys:(id)a4;
- (BOOL)_reindexCoreSpotlightIdentifiers:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 batchProcessedBlock:(id)a6 cancelBlock:(id)a7;
- (BOOL)_runCSCleanupForQueryString:(id)a3 queryContext:(id)a4 flags:(unsigned int)a5 batchUpdatedBlock:(id)a6 cancelBlock:(id)a7;
- (BOOL)_runCSCounterForQueryString:(id)a3 queryContext:(id)a4 counterItemBlock:(id)a5 counterAttrBlock:(id)a6 cancelBlock:(id)a7;
- (BOOL)_runCSExtractForQueryString:(id)a3 queryContext:(id)a4 flags:(unsigned int)a5 processedItemBlock:(id)a6 batchArchivedBlock:(id)a7 batchUpdatedBlock:(id)a8 cancelBlock:(id)a9 errorBlock:(id)a10;
- (BOOL)_runCSReindexForQueryString:(id)a3 queryContext:(id)a4 flags:(unsigned int)a5 batchProcessedBlock:(id)a6 batchUpdatedBlock:(id)a7 cancelBlock:(id)a8;
- (BOOL)_updateCoreSpotlightItems:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 batchUpdatedBlock:(id)a6 cancelBlock:(id)a7;
- (BOOL)requestCSCleanupWithProtectionClasses:(id)a3 batchUpdatedBlock:(id)a4 cancelBlock:(id)a5;
- (BOOL)requestCSDocumentUnderstandingProgressReport:(id)a3 cancelBlock:(id)a4;
- (BOOL)requestCSEmbeddingsProgressReport:(id)a3 cancelBlock:(id)a4;
- (BOOL)requestCSProcessingWithProcessedItemBlock:(id)a3 batchArchivedBlock:(id)a4 batchUpdatedBlock:(id)a5 cancelBlock:(id)a6 errorBlock:(id)a7;
- (BOOL)requestCSReindexForClientWithBundleIdentifier:(id)a3 batchProcessedBlock:(id)a4 batchUpdatedBlock:(id)a5 cancelBlock:(id)a6;
- (BOOL)requestCSReindexWithProtectionClasses:(id)a3 batchProcessedBlock:(id)a4 batchUpdatedBlock:(id)a5 cancelBlock:(id)a6;
- (BOOL)requestCSSuggestedEventsProgressReport:(id)a3 cancelBlock:(id)a4;
- (BOOL)requestMDProcessingWithBatchProcessedBlock:(id)a3 batchUpdatedBlock:(id)a4 cancelBlock:(id)a5;
- (SKGItemMonitor)monitor;
- (SKGJob)initWithJobContext:(id)a3;
- (SKGJobContext)context;
- (id)_coreSpotlightIndexWithBundleIdentifier:(id)a3 protectionClass:(id)a4;
- (id)generateCSDocumentUnderstandingReportWithCancelBlock:(id)a3;
- (id)generateCSEmbeddingsReportWithCancelBlock:(id)a3;
- (id)generateCSReportForQueryFlags:(unsigned int)a3 fetchAttributePairs:(id)a4 additionalQueryString:(id)a5 processedField:(id)a6 succesfullyProcessedField:(id)a7 eligibleFields:(id)a8 dayCompletionStr:(id)a9 genStartTime:(id)a10 bundleIDs:(id)a11 daysToCompleteApproach:(int64_t)a12 includeFiles:(BOOL)a13 withCancelBlock:(id)a14;
- (id)generateCSSuggestedEventsReportWithCancelBlock:(id)a3;
- (void)_markReindexRequestsAsSeen:(id)a3 bundleID:(id)a4 count:(unint64_t)a5;
- (void)setMonitor:(id)a3;
@end

@implementation SKGJob

- (SKGJob)initWithJobContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKGJob;
  v6 = [(SKGJob *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.SpotlightKnowledge.updater", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (BOOL)requestCSReindexForClientWithBundleIdentifier:(id)a3 batchProcessedBlock:(id)a4 batchUpdatedBlock:(id)a5 cancelBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[SKGProcessorContext sharedContext];
  v15 = [v14 excludeBundles];
  v16 = [v15 arrayByAddingObject:@"com.apple.mobilephone"];

  if ([v16 containsObject:v10])
  {
    unsigned __int8 v17 = 1;
  }
  else
  {
    v18 = +[SKGProcessorContext sharedContext];
    if ([v18 enableKeyphrases])
    {
      v19 = +[SKGProcessorContext sharedContext];
      v20 = [v19 keyphraseExcludeBundles];
      unsigned int v66 = [v20 containsObject:v10] ^ 1;
    }
    else
    {
      unsigned int v66 = 0;
    }
    v62 = self;

    v21 = +[SKGProcessorContext sharedContext];
    if ([v21 enableEmbeddings])
    {
      v22 = +[SKGProcessorContext sharedContext];
      v23 = [v22 embeddingExcludeBundles];
      unsigned int v24 = [v23 containsObject:v10] ^ 1;
    }
    else
    {
      unsigned int v24 = 0;
    }
    id v64 = v11;

    v25 = +[SKGProcessorContext sharedContext];
    if ([v25 enableSuggestedEvents])
    {
      v26 = +[SKGProcessorContext sharedContext];
      v27 = [v26 suggestedEventsIncludeBundles];
      unsigned int v65 = [v27 containsObject:v10];
    }
    else
    {
      unsigned int v65 = 0;
    }
    v63 = v16;

    v28 = +[SKGProcessorContext sharedContext];
    if ([v28 enableDocumentUnderstanding])
    {
      v29 = +[SKGProcessorContext sharedContext];
      [v29 docUnderstandingIncludeBundles];
      v31 = id v30 = v13;
      id v32 = v10;
      unsigned int v33 = [v31 containsObject:v10];

      id v13 = v30;
    }
    else
    {
      id v32 = v10;
      unsigned int v33 = 0;
    }

    if (((v24 | v66 | v65) & 1) != 0 || v33)
    {
      id v61 = v12;
      if (v24) {
        int v34 = 8;
      }
      else {
        int v34 = 0;
      }
      if (v66) {
        v34 |= 0x10u;
      }
      if (v65) {
        v34 |= 0x40u;
      }
      if (v33) {
        v34 |= 0x80u;
      }
      unsigned int v60 = v34;
      id v10 = v32;
      id v69 = v32;
      v35 = +[NSArray arrayWithObjects:&v69 count:1];
      id v36 = objc_alloc_init((Class)NSMutableArray);
      v37 = +[SKGProcessorContext sharedContext];
      v38 = [v37 fetchAttributes];
      [v36 addObjectsFromArray:v38];

      if (v24)
      {
        v39 = +[SKGProcessorContext sharedContext];
        v40 = [v39 embeddingFetchAttributes];
        [v36 addObjectsFromArray:v40];
      }
      if (v66)
      {
        v41 = +[SKGProcessorContext sharedContext];
        v42 = [v41 keyphraseFetchAttributes];
        [v36 addObjectsFromArray:v42];
      }
      if (v65)
      {
        v43 = +[SKGProcessorContext sharedContext];
        v44 = [v43 suggestedEventsFetchAttributes];
        [v36 addObjectsFromArray:v44];
      }
      if (v33)
      {
        v45 = +[SKGProcessorContext sharedContext];
        v46 = [v45 docUnderstandingFetchAttributes];
        [v36 addObjectsFromArray:v46];
      }
      id v47 = objc_alloc_init((Class)CSSearchQueryContext);
      v67 = v36;
      [v47 setFetchAttributes:v36];
      [v47 setBundleIDs:v35];
      id v48 = objc_alloc_init((Class)NSMutableArray);
      v49 = [(SKGJob *)v62 context];
      v50 = [v49 filterQuery];

      if (v50)
      {
        v51 = [(SKGJob *)v62 context];
        v52 = [v51 filterQuery];
        [v48 addObject:v52];
      }
      v53 = [(SKGJob *)v62 context];
      v54 = [v53 doNotUpdateList];
      v55 = sub_10000AED8(v35, v63, v54, v60);

      [v48 addObject:v55];
      v56 = [(SKGJob *)v62 context];
      v57 = [v56 currentPreferredLanguages];
      v58 = sub_1000091E8(v57, v35, 0, v48, v60);

      unsigned __int8 v17 = [(SKGJob *)v62 _runCSReindexForQueryString:v58 queryContext:v47 flags:v60 batchProcessedBlock:v64 batchUpdatedBlock:v61 cancelBlock:v13];
      id v11 = v64;
      id v12 = v61;
      v16 = v63;
    }
    else
    {
      unsigned __int8 v17 = 1;
      id v10 = v32;
      v16 = v63;
    }
  }

  return v17;
}

- (BOOL)_runCSReindexForQueryString:(id)a3 queryContext:(id)a4 flags:(unsigned int)a5 batchProcessedBlock:(id)a6 batchUpdatedBlock:(id)a7 cancelBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v49 = a6;
  id v51 = a7;
  id v16 = a8;
  v50 = v14;
  v52 = v15;
  if (!v14)
  {
    BOOL v43 = 1;
    goto LABEL_25;
  }
  v46 = v16;
  [v15 setDisableResultStreaming:1];
  [v15 setMaximumBatchSize:100];
  unsigned __int8 v17 = [(SKGJob *)self context];
  uint64_t v18 = (uint64_t)[v17 maxItemCountPerBatch];

  if (v18 >= 1)
  {
    v19 = [(SKGJob *)self context];
    objc_msgSend(v15, "setMaximumBatchSize:", objc_msgSend(v19, "maxItemCountPerBatch"));
  }
  v20 = [(SKGJob *)self context];
  uint64_t v21 = (uint64_t)[v20 maxItemCountPerJob];

  if (v21 >= 1)
  {
    v22 = [(SKGJob *)self context];
    objc_msgSend(v15, "setMaxCount:", objc_msgSend(v22, "maxItemCountPerJob"));
  }
  id v23 = [objc_alloc((Class)CSSearchQuery) initWithQueryString:v14 queryContext:v15];
  dispatch_group_t v24 = dispatch_group_create();
  id location = 0;
  id v48 = v23;
  objc_initWeak(&location, v23);
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x2020000000;
  char v106 = 0;
  v101[0] = 0;
  v101[1] = v101;
  v101[2] = 0x2020000000;
  char v102 = 1;
  v99[0] = 0;
  v99[1] = v99;
  v99[2] = 0x2020000000;
  char v100 = 0;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x2020000000;
  v98[3] = 0;
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x3032000000;
  v95 = sub_100012684;
  v96 = sub_100012560;
  id v97 = 0;
  id v97 = objc_alloc_init((Class)NSMutableDictionary);
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x3032000000;
  v90[3] = sub_100012684;
  v90[4] = sub_100012560;
  id v91 = 0;
  id v91 = objc_alloc_init((Class)NSMutableDictionary);
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x3032000000;
  v88[3] = sub_100012684;
  v88[4] = sub_100012560;
  id v89 = 0;
  id v89 = objc_alloc_init((Class)NSMutableDictionary);
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_100003F5C;
  v80[3] = &unk_1000DAC08;
  v85 = v90;
  v86 = v88;
  v84 = v101;
  v80[4] = self;
  v87 = &v92;
  id v25 = v49;
  id v81 = v25;
  id v26 = v46;
  id v82 = v26;
  id v27 = v51;
  id v83 = v27;
  v28 = objc_retainBlock(v80);
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_100045EBC;
  v63[3] = &unk_1000DAC30;
  id v64 = v52;
  unsigned int v65 = self;
  v78[1] = (id)((a5 >> 2) & 0x36);
  unsigned int v79 = a5;
  v71 = v90;
  v72 = v88;
  v73 = &v92;
  v74 = v101;
  id v67 = v25;
  id v68 = v26;
  id v69 = v27;
  v75 = v98;
  v76 = &v103;
  objc_copyWeak(v78, &location);
  v29 = v28;
  id v70 = v29;
  v77 = v99;
  id v30 = v24;
  unsigned int v66 = v30;
  [v48 setFoundItemsHandler:v63];
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100047004;
  v57[3] = &unk_1000DAC58;
  unsigned int v60 = v101;
  id v61 = &v103;
  v62 = v99;
  v45 = v29;
  id v59 = v45;
  dispatch_group_t group = v30;
  dispatch_group_t v58 = group;
  [v48 setCompletionHandler:v57];
  dispatch_group_enter(group);
  v31 = [(SKGJob *)self context];
  [v31 logSignpost:3 message:@"starting batch updates"];

  [v48 start];
  id v32 = [(SKGJob *)self context];
  [v32 logSignpost:4 message:@"end batch updates"];

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v33 = (id)v93[5];
  id v34 = [v33 countByEnumeratingWithState:&v53 objects:v112 count:16];
  if (v34)
  {
    char v35 = 0;
    uint64_t v36 = *(void *)v54;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v54 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v53 + 1) + 8 * i);
        v39 = [(id)v93[5] objectForKeyedSubscript:v38];
        if ([v39 intValue])
        {
          v40 = sub_100050698();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v109 = v39;
            __int16 v110 = 2112;
            uint64_t v111 = v38;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "reindexed %@ items for %@", buf, 0x16u);
          }

          if (isAppleInternalInstall()) {
            uint64_t v41 = (int)[v39 intValue];
          }
          else {
            uint64_t v41 = 1;
          }
          v42 = +[CSPowerLog sharedInstance];
          [v42 logWithBundleID:v38 indexOperation:8 itemCount:v41 code:2];

          char v35 = 1;
        }
      }
      id v34 = [v33 countByEnumeratingWithState:&v53 objects:v112 count:16];
    }
    while (v34);

    if ((v35 & 1) == 0) {
      goto LABEL_23;
    }
    id v33 = +[CSPowerLog sharedInstance];
    [v33 flush];
  }

LABEL_23:
  BOOL v43 = *((unsigned char *)v104 + 24) != 0;

  objc_destroyWeak(v78);
  _Block_object_dispose(v88, 8);

  _Block_object_dispose(v90, 8);
  _Block_object_dispose(&v92, 8);

  _Block_object_dispose(v98, 8);
  _Block_object_dispose(v99, 8);
  _Block_object_dispose(v101, 8);
  _Block_object_dispose(&v103, 8);
  objc_destroyWeak(&location);

  id v16 = v46;
LABEL_25:

  return v43;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_monitor, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (SKGJobContext)context
{
  return self->_context;
}

- (SKGItemMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
}

- (BOOL)_archiveCoreSpotlightItems:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 batchArchivedBlock:(id)a6 cancelBlock:(id)a7 errorBlock:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = (void (**)(id, id, void *))a6;
  unsigned __int8 v17 = (uint64_t (**)(id, uint64_t, const __CFString *))a8;
  id v18 = [v13 count];
  if (v18)
  {
    id v19 = v18;
    v20 = +[NSUUID UUID];
    uint64_t v21 = [v20 description];
    v22 = +[NSString stringWithFormat:@"archive-%@", v21];

    if (v22)
    {
      id v35 = 0;
      id v23 = +[NSKeyedArchiver archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v35];
      id v24 = v35;
      if (v24)
      {
        id v25 = v24;
        char v26 = v17[2](v17, 10, @"could not archive");
      }
      else
      {
        id v27 = [(SKGJob *)self context];
        v28 = [v27 peopleArchivePathWithProtectionClass:v15];

        if (v28)
        {
          id v33 = v28;
          id v34 = 0;
          id v32 = [[SKGArchiver alloc] initWithResourceDirectoryPath:v28];
          unsigned int v29 = [(SKGArchiver *)v32 writeArchive:v23 name:v22 error:&v34];
          id v25 = v34;
          if (v29)
          {
            id v30 = +[NSNumber numberWithUnsignedInteger:v19];
            v16[2](v16, v14, v30);

            char v26 = 1;
          }
          else
          {
            char v26 = v17[2](v17, 10, @"could not write archive");
          }

          v28 = v33;
        }
        else
        {
          id v25 = 0;
          char v26 = 1;
        }
      }
    }
    else
    {
      char v26 = 1;
    }
  }
  else
  {
    char v26 = 1;
  }

  return v26;
}

- (BOOL)_runCSExtractForQueryString:(id)a3 queryContext:(id)a4 flags:(unsigned int)a5 processedItemBlock:(id)a6 batchArchivedBlock:(id)a7 batchUpdatedBlock:(id)a8 cancelBlock:(id)a9 errorBlock:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (v16)
  {
    v42 = v22;
    BOOL v43 = v20;
    v44 = v19;
    [v17 setDisableResultStreaming:1];
    [v17 setMaximumBatchSize:100];
    id v23 = [(SKGJob *)self context];
    uint64_t v24 = (uint64_t)[v23 maxItemCountPerBatch];

    if (v24 >= 1)
    {
      id v25 = [(SKGJob *)self context];
      objc_msgSend(v17, "setMaximumBatchSize:", objc_msgSend(v25, "maxItemCountPerBatch"));
    }
    char v26 = [(SKGJob *)self context];
    id v27 = [v26 graphVersion];

    id v28 = [objc_alloc((Class)CSSearchQuery) initWithQueryString:v16 queryContext:v17];
    dispatch_group_t v29 = dispatch_group_create();
    location[0] = 0;
    objc_initWeak(location, v28);
    uint64_t v82 = 0;
    id v83 = &v82;
    uint64_t v84 = 0x2020000000;
    char v85 = 0;
    v80[0] = 0;
    v80[1] = v80;
    v80[2] = 0x2020000000;
    char v81 = 1;
    v78[0] = 0;
    v78[1] = v78;
    id v78[2] = 0x2020000000;
    char v79 = 0;
    v77[0] = 0;
    v77[1] = v77;
    v77[2] = 0x2020000000;
    v77[3] = 0;
    v75[0] = 0;
    v75[1] = v75;
    v75[2] = 0x3032000000;
    v75[3] = sub_100012674;
    v75[4] = sub_100012558;
    id v76 = 0;
    id v41 = v16;
    id v76 = objc_alloc_init((Class)NSMutableDictionary);
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = 0x3032000000;
    v73[3] = sub_100012674;
    v73[4] = sub_100012558;
    id v74 = 0;
    id v74 = objc_alloc_init((Class)NSMutableDictionary);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100043230;
    v56[3] = &unk_1000DAB90;
    unsigned int v72 = a5;
    id v57 = v17;
    unsigned int v65 = v75;
    v71[1] = v27;
    id v60 = v18;
    unsigned int v66 = v73;
    id v40 = v21;
    id v30 = v21;
    id v67 = v80;
    id v61 = v30;
    dispatch_group_t v58 = self;
    id v31 = v44;
    id v62 = v31;
    id v32 = v42;
    id v63 = v32;
    id v33 = v43;
    id v64 = v33;
    id v68 = v77;
    id v69 = &v82;
    objc_copyWeak(v71, location);
    id v70 = v78;
    id v34 = v29;
    id v59 = v34;
    [v28 setFoundItemsHandler:v56];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1000442AC;
    v45[3] = &unk_1000DABB8;
    id v51 = v80;
    v52 = v75;
    v45[4] = self;
    id v47 = v31;
    id v48 = v30;
    id v49 = v32;
    long long v53 = v73;
    id v50 = v33;
    long long v54 = &v82;
    long long v55 = v78;
    id v35 = v34;
    v46 = v35;
    [v28 setCompletionHandler:v45];
    dispatch_group_enter(v35);
    uint64_t v36 = [(SKGJob *)self context];
    [v36 logSignpost:9 message:@"starting people updates"];

    [v28 start];
    v37 = [(SKGJob *)self context];
    [v37 logSignpost:10 message:@"end people updates"];

    dispatch_group_wait(v35, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v38 = *((unsigned char *)v83 + 24) != 0;

    objc_destroyWeak(v71);
    _Block_object_dispose(v73, 8);

    _Block_object_dispose(v75, 8);
    _Block_object_dispose(v77, 8);
    _Block_object_dispose(v78, 8);
    _Block_object_dispose(v80, 8);
    _Block_object_dispose(&v82, 8);
    objc_destroyWeak(location);

    id v21 = v40;
    id v16 = v41;
    id v20 = v43;
    id v19 = v44;
    id v22 = v42;
  }
  else
  {
    BOOL v38 = 1;
  }

  return v38;
}

- (BOOL)requestCSProcessingWithProcessedItemBlock:(id)a3 batchArchivedBlock:(id)a4 batchUpdatedBlock:(id)a5 cancelBlock:(id)a6 errorBlock:(id)a7
{
  id v62 = a3;
  id v61 = a4;
  id v60 = a5;
  id v63 = (uint64_t (**)(id, const __CFString *, void))a6;
  id v59 = a7;
  id v13 = +[SKGProcessorContext sharedContext];
  unsigned int v14 = [v13 enablePeople];

  id v15 = [(SKGJob *)self context];
  unsigned int v16 = [v15 doArchiving];

  if ((v16 & 1) != 0
    || (+[SKGProcessor sharedProcessor],
        id v17 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v18 = [v17 loadPeopleExtractor],
        v17,
        (v18 & 1) != 0))
  {
    if (v14)
    {
      long long v54 = v12;
      if (v16) {
        int v19 = 36;
      }
      else {
        int v19 = 32;
      }
      unsigned int v56 = v19;
      id v20 = +[SKGProcessorContext sharedContext];
      long long v53 = [v20 excludeBundles];

      id v21 = objc_alloc_init((Class)NSMutableArray);
      id v22 = +[SKGProcessorContext sharedContext];
      id v23 = [v22 fetchAttributes];
      [v21 addObjectsFromArray:v23];

      uint64_t v24 = +[SKGProcessorContext sharedContext];
      id v25 = [v24 peopleFetchAttributes];
      id v58 = v21;
      [v21 addObjectsFromArray:v25];

      id v26 = objc_alloc_init((Class)NSMutableArray);
      id v27 = [(SKGJob *)self context];
      id v28 = [v27 filterQuery];

      if (v28)
      {
        dispatch_group_t v29 = [(SKGJob *)self context];
        id v30 = [v29 filterQuery];
        [v26 addObject:v30];
      }
      id v57 = self;
      id v31 = [(SKGJob *)self context];
      id v32 = objc_alloc_init((Class)NSMutableArray);
      [v32 addObject:@"_kMDItemKnowledgeUpdaterVersion!=*"];
      id v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(_kMDItemKnowledgeUpdaterVersion=*&&_kMDItemKnowledgeUpdaterVersion!=%ld)", [v31 graphVersion]);
      [v32 addObject:v33];

      id v34 = +[SKGProcessorContext sharedContext];
      id v35 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(_kMDItemKnowledgeIndexVersion!=* || (_kMDItemKnowledgeIndexVersion=*&&_kMDItemKnowledgeIndexVersion!=%ld))", [v34 knowledgeVersion]);
      [v32 addObject:v35];

      uint64_t v36 = [v32 componentsJoinedByString:@"||"];
      uint64_t v37 = +[NSString stringWithFormat:@"(%@)", v36];

      BOOL v38 = v26;
      long long v55 = (void *)v37;
      [v26 addObject:v37];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      v39 = +[SKGProcessorContext sharedContext];
      id v40 = [v39 peoplePreferredBundles];

      id v41 = [v40 countByEnumeratingWithState:&v64 objects:v69 count:16];
      if (v41)
      {
        id v42 = v41;
        uint64_t v43 = *(void *)v65;
        while (2)
        {
          for (i = 0; i != v42; i = (char *)i + 1)
          {
            if (*(void *)v65 != v43) {
              objc_enumerationMutation(v40);
            }
            uint64_t v68 = *(void *)(*((void *)&v64 + 1) + 8 * i);
            v45 = +[NSArray arrayWithObjects:&v68 count:1];
            id v46 = objc_alloc_init((Class)CSSearchQueryContext);
            [v46 setFetchAttributes:v21];
            [v46 setBundleIDs:v45];
            id v47 = sub_100044C48(v45, 0, v38);
            unsigned int v48 = [(SKGJob *)v57 _runCSExtractForQueryString:v47 queryContext:v46 flags:v56 processedItemBlock:v62 batchArchivedBlock:v61 batchUpdatedBlock:v60 cancelBlock:v63 errorBlock:v59];

            if (!v48)
            {
              LOBYTE(v51) = 0;
              id v49 = v53;
              id v12 = v54;
              id v21 = v58;
              goto LABEL_21;
            }
            id v21 = v58;
          }
          id v42 = [v40 countByEnumeratingWithState:&v64 objects:v69 count:16];
          if (v42) {
            continue;
          }
          break;
        }
      }

      id v40 = objc_alloc_init((Class)CSSearchQueryContext);
      id v49 = v53;
      [v40 setDisableBundles:v53];
      [v40 setFetchAttributes:v21];
      id v50 = sub_100044C48(0, v53, v38);
      LOBYTE(v51) = [(SKGJob *)v57 _runCSExtractForQueryString:v50 queryContext:v40 flags:v56 processedItemBlock:v62 batchArchivedBlock:v61 batchUpdatedBlock:v60 cancelBlock:v63 errorBlock:v59];

      id v12 = v54;
LABEL_21:
    }
    else
    {
      LOBYTE(v51) = 1;
    }
  }
  else
  {
    int v51 = v63[2](v63, @"tried loading people model", 0) ^ 1;
  }

  return v51;
}

- (BOOL)_recordIsOld:(id)a3 dateKeys:(id)a4
{
  id v6 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = a4;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v13 = +[SKGProcessor sharedProcessor];
        unsigned int v14 = [v13 dateFromRecord:v6 key:v12];

        if (v14)
        {

          unsigned int v16 = +[NSCalendar currentCalendar];
          id v17 = +[NSDate now];
          unsigned __int8 v18 = [v16 components:0x2000 fromDate:v14 toDate:v17 options:0];

          id v19 = [v18 weekOfYear];
          id v20 = [(SKGJob *)self context];
          BOOL v15 = (uint64_t)v19 >= (uint64_t)[v20 upgradePathIsOldThresInWeeks];

          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
  unsigned int v14 = v7;
LABEL_11:

  return v15;
}

- (void)_markReindexRequestsAsSeen:(id)a3 bundleID:(id)a4 count:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  uint64_t v10 = (void *)v9;
  id v11 = &off_1000E61C8;
  if (v9) {
    id v11 = (_UNKNOWN **)v9;
  }
  uint64_t v12 = v11;

  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5 + (int)[v12 intValue]);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  [v8 setObject:v13 forKey:v7];
}

- (id)_coreSpotlightIndexWithBundleIdentifier:(id)a3 protectionClass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v8 = (void *)qword_1000F8F00;
  if (!qword_1000F8F00)
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v10 = (void *)qword_1000F8F00;
    qword_1000F8F00 = (uint64_t)v9;

    id v8 = (void *)qword_1000F8F00;
  }
  id v11 = [v8 objectForKeyedSubscript:v5];

  if (!v11)
  {
    uint64_t v12 = +[NSMutableDictionary dictionary];
    [(id)qword_1000F8F00 setObject:v12 forKeyedSubscript:v5];
  }
  id v13 = [(id)qword_1000F8F00 objectForKeyedSubscript:v5];
  unsigned int v14 = [v13 objectForKeyedSubscript:v6];

  if (v14)
  {
    BOOL v15 = [(id)qword_1000F8F00 objectForKeyedSubscript:v5];
    id v16 = [v15 objectForKeyedSubscript:v6];
  }
  else
  {
    id v16 = [objc_alloc((Class)CSSearchableIndex) initWithName:@"KnowledgeIndex" protectionClass:v6 bundleIdentifier:v5];
    BOOL v15 = [(id)qword_1000F8F00 objectForKeyedSubscript:v5];
    [v15 setObject:v16 forKey:v6];
  }

  return v16;
}

- (BOOL)_updateCoreSpotlightItems:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 batchUpdatedBlock:(id)a6 cancelBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  BOOL v15 = (void (**)(id, id, void *))a6;
  id v16 = (uint64_t (**)(id, void, const __CFString *))a7;
  BOOL v17 = 1;
  if ([v12 count])
  {
    unsigned __int8 v18 = dispatch_group_create();
    uint64_t v36 = 0;
    uint64_t v37 = (unsigned __int8 *)&v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 1;
    id v20 = [v12 count];
    if (v20)
    {
      id v21 = [(SKGJob *)self _coreSpotlightIndexWithBundleIdentifier:v13 protectionClass:v14];
      dispatch_group_enter(v18);
      id v30 = _NSConcreteStackBlock;
      uint64_t v31 = 3221225472;
      id v32 = sub_100045AD8;
      id v33 = &unk_1000DAB18;
      id v35 = &v36;
      long long v22 = v18;
      id v34 = v22;
      [v21 indexSearchableItems:v12 completionHandler:&v30];
      dispatch_time_t v23 = dispatch_time(0, 300000000000);
      if (dispatch_group_wait(v22, v23))
      {
        long long v24 = sub_10000BE40();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_1000A0E90(v24);
        }

        atomic_store(0, v37 + 24);
      }
      long long v25 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v20, v30, v31, v32, v33);
      v15[2](v15, v13, v25);

      unsigned __int8 v26 = atomic_load(v37 + 24);
      if (v26) {
        unsigned __int8 v27 = v16[2](v16, 0, @"SKGJob+Text:updateItems:") ^ 1;
      }
      else {
        unsigned __int8 v27 = 0;
      }
      atomic_store(v27, v37 + 24);
    }
    unsigned __int8 v28 = atomic_load(v37 + 24);
    BOOL v17 = v28 & 1;
    _Block_object_dispose(&v36, 8);
  }
  return v17;
}

- (BOOL)_reindexCoreSpotlightIdentifiers:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 batchProcessedBlock:(id)a6 cancelBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, id, void *))a6;
  BOOL v15 = (uint64_t (**)(id, void, const __CFString *))a7;
  BOOL v16 = 1;
  if ([v11 count])
  {
    BOOL v17 = dispatch_group_create();
    uint64_t v37 = 0;
    uint64_t v38 = (unsigned __int8 *)&v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 1;
    id v19 = [v11 count];
    if (v19)
    {
      id v32 = v18;
      id v20 = [objc_alloc((Class)CSSearchableIndex) initWithName:@"KnowledgeIndex" protectionClass:v13];
      id v21 = [v11 componentsJoinedByString:@"=;"];;
      long long v22 = +[NSString stringWithFormat:@"reindexJob:%@:%@:%ld:%@", v12, v13, 4, v21];

      dispatch_group_enter(v17);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100045E54;
      v33[3] = &unk_1000DABE0;
      id v23 = v22;
      id v34 = v23;
      uint64_t v36 = &v37;
      long long v24 = v17;
      id v35 = v24;
      [v20 _issueCommand:v23 completionHandler:v33];
      dispatch_time_t v25 = dispatch_time(0, 30000000000);
      if (dispatch_group_wait(v24, v25))
      {
        unsigned __int8 v26 = sub_10000BE40();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_1000A0ED4(v26);
        }

        atomic_store(0, v38 + 24);
      }
      unsigned __int8 v27 = +[NSNumber numberWithUnsignedInteger:v19];
      v14[2](v14, v12, v27);

      unsigned __int8 v28 = atomic_load(v38 + 24);
      if (v28) {
        unsigned __int8 v29 = v15[2](v15, 0, @"SKGJob+Text:updateItems") ^ 1;
      }
      else {
        unsigned __int8 v29 = 0;
      }
      atomic_store(v29, v38 + 24);

      unsigned __int8 v18 = v32;
    }
    unsigned __int8 v30 = atomic_load(v38 + 24);
    BOOL v16 = v30 & 1;
    _Block_object_dispose(&v37, 8);
  }
  return v16;
}

- (BOOL)requestCSReindexWithProtectionClasses:(id)a3 batchProcessedBlock:(id)a4 batchUpdatedBlock:(id)a5 cancelBlock:(id)a6
{
  id v61 = a3;
  id v10 = a4;
  id v60 = a5;
  id v11 = a6;
  id v13 = +[SKGProcessorContext sharedContext];
  unsigned int v14 = [v13 enableKeyphrases];

  BOOL v15 = +[SKGProcessorContext sharedContext];
  unsigned int v16 = [v15 enableEmbeddings];

  BOOL v17 = +[SKGProcessorContext sharedContext];
  unsigned int v18 = [v17 enableSuggestedEvents];

  id v19 = +[SKGProcessorContext sharedContext];
  unsigned int v20 = [v19 enableDocumentUnderstanding];

  if ((v16 & 1) == 0 && (v14 & 1) == 0 && (v18 & 1) == 0 && !v20)
  {
    unsigned __int8 v21 = 1;
    id v23 = v60;
    long long v22 = v61;
    goto LABEL_23;
  }
  id v57 = v12;
  id v58 = v11;
  id v59 = v10;
  if (v16) {
    int v24 = 8;
  }
  else {
    int v24 = 0;
  }
  if (v14) {
    v24 |= 0x10u;
  }
  if (v18) {
    v24 |= 0x40u;
  }
  if (v20) {
    v24 |= 0x80u;
  }
  unsigned int v55 = v24;
  dispatch_time_t v25 = [(SKGJob *)self context];
  unsigned __int8 v26 = [v25 excludeBundles];

  unsigned __int8 v27 = [(SKGJob *)self context];
  unsigned int v56 = [v27 includeBundles];

  id v28 = objc_alloc_init((Class)NSMutableArray);
  unsigned __int8 v29 = +[SKGProcessorContext sharedContext];
  unsigned __int8 v30 = [v29 fetchAttributes];
  [v28 addObjectsFromArray:v30];

  if (v16)
  {
    unsigned int v48 = +[SKGProcessorContext sharedContext];
    id v49 = [v48 embeddingFetchAttributes];
    [v28 addObjectsFromArray:v49];

    if (!v14)
    {
LABEL_17:
      if (!v18) {
        goto LABEL_18;
      }
LABEL_26:
      v52 = +[SKGProcessorContext sharedContext];
      long long v53 = [v52 suggestedEventsFetchAttributes];
      [v28 addObjectsFromArray:v53];

      if (!v20) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if (!v14)
  {
    goto LABEL_17;
  }
  id v50 = +[SKGProcessorContext sharedContext];
  int v51 = [v50 keyphraseFetchAttributes];
  [v28 addObjectsFromArray:v51];

  if (v18) {
    goto LABEL_26;
  }
LABEL_18:
  if (v20)
  {
LABEL_19:
    uint64_t v31 = +[SKGProcessorContext sharedContext];
    id v32 = [v31 docUnderstandingFetchAttributes];
    [v28 addObjectsFromArray:v32];
  }
LABEL_20:
  id v33 = objc_alloc_init((Class)CSSearchQueryContext);
  [v33 setProtectionClasses:v61];
  [v33 setDisableBundles:v26];
  long long v54 = v28;
  [v33 setFetchAttributes:v28];
  id v34 = objc_alloc_init((Class)NSMutableArray);
  id v35 = [(SKGJob *)self context];
  uint64_t v36 = [v35 filterQuery];

  if (v36)
  {
    uint64_t v37 = [(SKGJob *)self context];
    uint64_t v38 = [v37 filterQuery];
    [v34 addObject:v38];
  }
  uint64_t v39 = [(SKGJob *)self context];
  char v40 = [v39 doNotUpdateList];
  id v41 = sub_10000AED8(v56, v26, v40, v55);

  [v34 addObject:v41];
  id v42 = [(SKGJob *)self context];
  uint64_t v43 = [v42 currentPreferredLanguages];
  sub_1000091E8(v43, v56, v26, v34, v55);
  v45 = v44 = v26;

  id v46 = self;
  id v10 = v59;
  id v23 = v60;
  id v11 = v58;
  unsigned __int8 v21 = [(SKGJob *)v46 _runCSReindexForQueryString:v45 queryContext:v33 flags:v55 batchProcessedBlock:v59 batchUpdatedBlock:v60 cancelBlock:v58];

  id v12 = v57;
  long long v22 = v61;
LABEL_23:

  return v21;
}

- (BOOL)requestMDProcessingWithBatchProcessedBlock:(id)a3 batchUpdatedBlock:(id)a4 cancelBlock:(id)a5
{
  return 1;
}

- (BOOL)_runCSCleanupForQueryString:(id)a3 queryContext:(id)a4 flags:(unsigned int)a5 batchUpdatedBlock:(id)a6 cancelBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if (v11)
  {
    id v33 = v14;
    [v12 setDisableResultStreaming:1];
    [v12 setMaximumBatchSize:100];
    BOOL v15 = [(SKGJob *)self context];
    uint64_t v16 = (uint64_t)[v15 maxItemCountPerBatch];

    if (v16 >= 1)
    {
      BOOL v17 = [(SKGJob *)self context];
      objc_msgSend(v12, "setMaximumBatchSize:", objc_msgSend(v17, "maxItemCountPerBatch"));
    }
    unsigned int v18 = [(SKGJob *)self context];
    uint64_t v19 = (uint64_t)[v18 maxItemCountPerJob];

    if (v19 >= 1)
    {
      unsigned int v20 = [(SKGJob *)self context];
      objc_msgSend(v12, "setMaxCount:", objc_msgSend(v20, "maxItemCountPerJob"));
    }
    id v21 = [objc_alloc((Class)CSSearchQuery) initWithQueryString:v11 queryContext:v12];
    dispatch_group_t v22 = dispatch_group_create();
    location[0] = 0;
    objc_initWeak(location, v21);
    uint64_t v62 = 0;
    id v63 = &v62;
    uint64_t v64 = 0x2020000000;
    char v65 = 0;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x2020000000;
    char v61 = 1;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    char v59 = 0;
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x2020000000;
    v57[3] = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x3032000000;
    v55[3] = sub_100012684;
    v55[4] = sub_100012560;
    id v56 = 0;
    id v56 = objc_alloc_init((Class)NSMutableDictionary);
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000479D8;
    v50[3] = &unk_1000DAC80;
    long long v53 = v60;
    long long v54 = v55;
    v50[4] = self;
    id v32 = v13;
    id v51 = v13;
    id v23 = v33;
    id v52 = v23;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100047C68;
    v40[3] = &unk_1000DACA8;
    v40[4] = self;
    v44 = v55;
    int v24 = objc_retainBlock(v50);
    id v42 = v24;
    v45 = v60;
    id v43 = v23;
    id v46 = v57;
    id v47 = &v62;
    objc_copyWeak(&v49, location);
    unsigned int v48 = v58;
    dispatch_time_t v25 = v22;
    id v41 = v25;
    [v21 setFoundItemsHandler:v40];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000485D4;
    v34[3] = &unk_1000DAC58;
    uint64_t v37 = v60;
    uint64_t v38 = &v62;
    uint64_t v39 = v58;
    unsigned __int8 v26 = v24;
    id v36 = v26;
    unsigned __int8 v27 = v25;
    id v35 = v27;
    [v21 setCompletionHandler:v34];
    dispatch_group_enter(v27);
    id v28 = [(SKGJob *)self context];
    [v28 logSignpost:5 message:@"starting batch cleanup"];

    [v21 start];
    unsigned __int8 v29 = [(SKGJob *)self context];
    [v29 logSignpost:6 message:@"end batch cleanup"];

    dispatch_group_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v30 = *((unsigned char *)v63 + 24) != 0;

    objc_destroyWeak(&v49);
    _Block_object_dispose(v55, 8);

    _Block_object_dispose(v57, 8);
    _Block_object_dispose(v58, 8);
    _Block_object_dispose(v60, 8);
    _Block_object_dispose(&v62, 8);
    objc_destroyWeak(location);

    id v13 = v32;
    id v14 = v33;
  }
  else
  {
    BOOL v30 = 1;
  }

  return v30;
}

- (BOOL)requestCSCleanupWithProtectionClasses:(id)a3 batchUpdatedBlock:(id)a4 cancelBlock:(id)a5
{
  id v7 = a3;
  id v23 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init((Class)CSSearchQueryContext);
  [v9 setProtectionClasses:v7];
  [v9 setFetchAttributes:&off_1000E7068];
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = +[SKGProcessorContext sharedContext];
  id v12 = [v11 cleanupAttributes];

  id v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        BOOL v17 = +[NSString stringWithFormat:@"%@=1", *(void *)(*((void *)&v24 + 1) + 8 * i)];
        [v10 addObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }

  unsigned int v18 = [v10 componentsJoinedByString:@"||"];
  BOOL v19 = [(SKGJob *)self _runCSCleanupForQueryString:v18 queryContext:v9 flags:0 batchUpdatedBlock:v23 cancelBlock:v8];

  return v19;
}

- (BOOL)_runCSCounterForQueryString:(id)a3 queryContext:(id)a4 counterItemBlock:(id)a5 counterAttrBlock:(id)a6 cancelBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [v12 fetchAttributes];
  unsigned __int8 v29 = v11;
  id v17 = [objc_alloc((Class)CSSearchQuery) initWithQueryString:v11 queryContext:v12];
  dispatch_group_t v18 = dispatch_group_create();
  location[0] = 0;
  objc_initWeak(location, v17);
  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  char v49 = 1;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  char v47 = 0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100048BC8;
  v36[3] = &unk_1000DACD0;
  id v19 = v12;
  id v37 = v19;
  id v20 = v13;
  id v40 = v20;
  id v21 = v14;
  id v41 = v21;
  id v22 = v16;
  id v38 = v22;
  id v43 = v48;
  id v23 = v15;
  id v42 = v23;
  objc_copyWeak(&v45, location);
  v44 = v46;
  long long v24 = v18;
  uint64_t v39 = v24;
  [v17 setFoundItemsHandler:v36];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100048F84;
  v31[3] = &unk_1000DACF8;
  id v33 = v48;
  id v34 = &v50;
  id v35 = v46;
  long long v25 = v24;
  id v32 = v25;
  [v17 setCompletionHandler:v31];
  dispatch_group_enter(v25);
  long long v26 = [(SKGJob *)self context];
  [v26 logSignpost:7 message:@"starting counting"];

  [v17 start];
  long long v27 = [(SKGJob *)self context];
  [v27 logSignpost:4 message:@"end counting"];

  dispatch_group_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v27) = *((unsigned char *)v51 + 24);

  objc_destroyWeak(&v45);
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);
  _Block_object_dispose(&v50, 8);
  objc_destroyWeak(location);

  return (char)v27;
}

- (id)generateCSReportForQueryFlags:(unsigned int)a3 fetchAttributePairs:(id)a4 additionalQueryString:(id)a5 processedField:(id)a6 succesfullyProcessedField:(id)a7 eligibleFields:(id)a8 dayCompletionStr:(id)a9 genStartTime:(id)a10 bundleIDs:(id)a11 daysToCompleteApproach:(int64_t)a12 includeFiles:(BOOL)a13 withCancelBlock:(id)a14
{
  char v18 = a3;
  id v19 = a4;
  id v107 = a5;
  id v119 = a6;
  id v115 = a7;
  id v118 = a8;
  id v121 = a9;
  id v108 = a10;
  id v111 = a11;
  id v106 = a14;
  id v20 = +[SKGProcessorContext sharedContext];
  v113 = [v20 excludeBundles];

  id v112 = objc_alloc_init((Class)NSMutableArray);
  id v21 = [(SKGJob *)self context];
  id v22 = [v21 filterQuery];

  if (v22)
  {
    id v23 = [(SKGJob *)self context];
    long long v24 = [v23 filterQuery];
    [v112 addObject:v24];
  }
  v131 = +[NSMutableArray array];
  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  id obj = v19;
  id v25 = [obj countByEnumeratingWithState:&v160 objects:v170 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v161;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v161 != v26) {
          objc_enumerationMutation(obj);
        }
        id v28 = *(void **)(*((void *)&v160 + 1) + 8 * i);
        if ([v28 count])
        {
          unsigned __int8 v29 = [v28 objectAtIndexedSubscript:0];
          [v131 addObject:v29];
        }
      }
      id v25 = [obj countByEnumeratingWithState:&v160 objects:v170 count:16];
    }
    while (v25);
  }

  BOOL v30 = +[NSArray arrayWithArray:v131];
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2020000000;
  uint64_t v159 = 0;
  uint64_t v150 = 0;
  v151 = &v150;
  uint64_t v152 = 0x3032000000;
  v153 = sub_100012684;
  v154 = sub_100012560;
  id v155 = 0;
  id v155 = (id)objc_opt_new();
  uint64_t v31 = (void *)v151[5];
  id v32 = +[NSMutableDictionary dictionary];
  [v31 setObject:v32 forKey:@"Total"];

  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  id v129 = v30;
  id v33 = [v129 countByEnumeratingWithState:&v146 objects:v169 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v147;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v147 != v34) {
          objc_enumerationMutation(v129);
        }
        uint64_t v36 = *(void *)(*((void *)&v146 + 1) + 8 * (void)j);
        id v37 = [(id)v151[5] objectForKeyedSubscript:@"Total"];
        [v37 setObject:&off_1000E61C8 forKeyedSubscript:v36];
      }
      id v33 = [v129 countByEnumeratingWithState:&v146 objects:v169 count:16];
    }
    while (v33);
  }

  id v38 = objc_alloc_init((Class)CSSearchQueryContext);
  [v38 setFetchAttributes:v129];
  [v38 setDisableBundles:v113];
  if (v111) {
    [v38 setBundleIDs:v111];
  }
  uint64_t v105 = v38;
  uint64_t v39 = [(SKGJob *)self context];
  id v40 = [v39 doNotUpdateList];
  __int16 v110 = sub_10000AED8(0, v113, v40, v18);

  [v112 addObject:v110];
  id v41 = [(SKGJob *)self context];
  id v42 = [v41 currentPreferredLanguages];
  id v43 = sub_1000091E8(v42, 0, v113, v112, v18);

  if (v43
    && (+[NSString stringWithFormat:@"%@ || %@", v43, v107],
        v109 = objc_claimAutoreleasedReturnValue(),
        v43,
        v109))
  {
    v145[0] = _NSConcreteStackBlock;
    v145[1] = 3221225472;
    v145[2] = sub_100049E1C;
    v145[3] = &unk_1000DAD20;
    v145[4] = &v150;
    v145[5] = &v156;
    v144[0] = _NSConcreteStackBlock;
    v144[1] = 3221225472;
    v144[2] = sub_10004A008;
    v144[3] = &unk_1000DAD48;
    v144[4] = &v150;
    if (![(SKGJob *)self _runCSCounterForQueryString:v109 queryContext:v105 counterItemBlock:v145 counterAttrBlock:v144 cancelBlock:v106])
    {
      id v44 = 0;
      goto LABEL_73;
    }
  }
  else
  {
    v109 = 0;
  }
  id v45 = +[NSNumber numberWithUnsignedInteger:v157[3]];
  id v46 = [(id)v151[5] objectForKeyedSubscript:@"Total"];
  [v46 setObject:v45 forKeyedSubscript:@"itemCount"];

  v117 = objc_opt_new();
  char v47 = +[NSCalendar currentCalendar];
  unsigned int v48 = +[NSDate now];
  char v49 = [v47 components:16 fromDate:v108 toDate:v48 options:6];
  id v123 = [v49 day];

  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  id v114 = (id)v151[5];
  id v120 = [v114 countByEnumeratingWithState:&v140 objects:v168 count:16];
  if (!v120) {
    goto LABEL_72;
  }
  uint64_t v116 = *(void *)v141;
  do
  {
    for (k = 0; k != v120; k = (char *)k + 1)
    {
      if (*(void *)v141 != v116) {
        objc_enumerationMutation(v114);
      }
      uint64_t v50 = *(void **)(*((void *)&v140 + 1) + 8 * (void)k);
      id v51 = [(id)v151[5] objectForKeyedSubscript:v50];
      uint64_t v52 = [v51 objectForKeyedSubscript:@"itemCount"];
      if (v52)
      {
        char v53 = [(id)v151[5] objectForKeyedSubscript:v50];
        v128 = [v53 objectForKeyedSubscript:@"itemCount"];
      }
      else
      {
        v128 = &off_1000E61C8;
      }

      long long v54 = [(id)v151[5] objectForKeyedSubscript:v50];
      unsigned int v55 = [v54 objectForKeyedSubscript:v119];
      v126 = [v55 unsignedIntegerValue];

      id v56 = [v128 unsignedIntegerValue];
      long long v138 = 0u;
      long long v139 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      id v57 = v118;
      uint64_t v58 = 0;
      id v59 = [v57 countByEnumeratingWithState:&v136 objects:v167 count:16];
      if (v59)
      {
        uint64_t v60 = *(void *)v137;
        do
        {
          for (m = 0; m != v59; m = (char *)m + 1)
          {
            if (*(void *)v137 != v60) {
              objc_enumerationMutation(v57);
            }
            uint64_t v62 = *(void *)(*((void *)&v136 + 1) + 8 * (void)m);
            id v63 = [(id)v151[5] objectForKeyedSubscript:v50];
            uint64_t v64 = [v63 objectForKeyedSubscript:v62];
            BOOL v65 = v64 == 0;

            if (!v65)
            {
              long long v66 = [(id)v151[5] objectForKeyedSubscript:v50];
              long long v67 = [v66 objectForKeyedSubscript:v62];
              id v68 = [v67 unsignedIntegerValue];

              v58 += (uint64_t)v68;
            }
          }
          id v59 = [v57 countByEnumeratingWithState:&v136 objects:v167 count:16];
        }
        while (v59);
      }

      double v69 = 0.0;
      double v70 = 0.0;
      if ([v128 unsignedIntegerValue]) {
        double v70 = (double)(unint64_t)v126 / (double)(unint64_t)[v128 unsignedIntegerValue];
      }
      int64_t v71 = v56 - v126;
      unint64_t v72 = v58 + v56 - v126;
      if (v72)
      {
        v73 = [(id)v151[5] objectForKeyedSubscript:v50];
        id v74 = [v73 objectForKeyedSubscript:v115];
        id v75 = [v74 unsignedIntegerValue];

        double v69 = (double)(unint64_t)v75 / (double)v72;
      }
      if ([v50 isEqualToString:@"Total"]) {
        id v76 = 0;
      }
      else {
        id v76 = v50;
      }
      id v77 = v76;
      v78 = [(SKGJob *)self context];
      unint64_t v79 = (unint64_t)[v78 getGenCompleteDayString:v121 forBundle:v77];
      v124 = v77;

      double v80 = v69;
      if (a12)
      {
        if (a12 != 1) {
          goto LABEL_56;
        }
        double v80 = v70;
      }
      if ((v79 & 0x8000000000000000) != 0 && v80 >= 0.99)
      {
        char v81 = [(SKGJob *)self context];
        [v81 setGenCompleteDayString:v121 forBundle:v77 day:v123];

        unint64_t v79 = (unint64_t)v123;
      }
LABEL_56:
      v166[0] = v50;
      v165[0] = @"bundleID";
      v165[1] = @"days";
      uint64_t v82 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v123, v80);
      v166[1] = v82;
      v165[2] = @"daysToComplete";
      id v83 = +[NSNumber numberWithInteger:v79];
      v166[2] = v83;
      v166[3] = v128;
      v165[3] = @"totalItems";
      v165[4] = @"eligibleItems";
      uint64_t v84 = +[NSNumber numberWithUnsignedInteger:v58];
      v166[4] = v84;
      v165[5] = @"itemsProcessed";
      char v85 = +[NSNumber numberWithUnsignedInteger:v126];
      v166[5] = v85;
      v165[6] = @"itemsNeedProcessing";
      v86 = +[NSNumber numberWithUnsignedInteger:v71];
      v166[6] = v86;
      v165[7] = @"progress";
      v87 = +[NSNumber numberWithDouble:v70];
      v166[7] = v87;
      v165[8] = @"completeness";
      v88 = +[NSNumber numberWithDouble:v69];
      v166[8] = v88;
      v127 = +[NSDictionary dictionaryWithObjects:v166 forKeys:v165 count:9];

      id v89 = +[NSMutableDictionary dictionaryWithDictionary:v127];
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      id v90 = obj;
      id v91 = [v90 countByEnumeratingWithState:&v132 objects:v164 count:16];
      if (v91)
      {
        uint64_t v92 = *(void *)v133;
        do
        {
          for (n = 0; n != v91; n = (char *)n + 1)
          {
            if (*(void *)v133 != v92) {
              objc_enumerationMutation(v90);
            }
            uint64_t v94 = *(void **)(*((void *)&v132 + 1) + 8 * (void)n);
            if ([v94 count] == (id)2)
            {
              v95 = [v94 objectAtIndexedSubscript:0];
              v96 = [v94 objectAtIndexedSubscript:1];
              if (v96)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if ([v96 length])
                  {
                    [v89 setObject:&off_1000E61C8 forKeyedSubscript:v96];
                    id v97 = [(id)v151[5] objectForKeyedSubscript:v50];
                    v98 = [v97 objectForKeyedSubscript:v95];
                    BOOL v99 = v98 == 0;

                    if (!v99)
                    {
                      char v100 = [(id)v151[5] objectForKeyedSubscript:v50];
                      v101 = [v100 objectForKeyedSubscript:v95];
                      [v89 setObject:v101 forKeyedSubscript:v96];
                    }
                  }
                }
              }
            }
          }
          id v91 = [v90 countByEnumeratingWithState:&v132 objects:v164 count:16];
        }
        while (v91);
      }

      id v102 = [v89 copy];
      [v117 setObject:v102 forKeyedSubscript:v50];
    }
    id v120 = [v114 countByEnumeratingWithState:&v140 objects:v168 count:16];
  }
  while (v120);
LABEL_72:

  id v44 = [v117 copy];
LABEL_73:

  _Block_object_dispose(&v150, 8);
  _Block_object_dispose(&v156, 8);

  return v44;
}

- (id)generateCSEmbeddingsReportWithCancelBlock:(id)a3
{
  uint64_t v4 = MDItemMediaEmbeddingVersion;
  v23[0] = MDItemMediaEmbeddingVersion;
  v23[1] = @"itemsWithEmbedding";
  id v5 = a3;
  id v6 = +[NSArray arrayWithObjects:v23 count:2];
  v24[0] = v6;
  v22[0] = MDItemPrimaryTextEmbedding;
  v22[1] = @"itemsWithPrimaryTextEmbedding";
  id v7 = +[NSArray arrayWithObjects:v22 count:2];
  v24[1] = v7;
  v21[0] = MDItemSecondaryTextEmbedding;
  v21[1] = @"itemsWithSecondaryTextEmbedding";
  id v8 = +[NSArray arrayWithObjects:v21 count:2];
  v24[2] = v8;
  v24[3] = &off_1000E7080;
  v24[4] = &off_1000E7098;
  id v9 = +[NSArray arrayWithObjects:v24 count:5];

  id v10 = +[SKGProcessorContext sharedContext];
  id v11 = [v10 embeddingModelVersion];
  id v12 = +[SKGProcessorContext sharedContext];
  id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"_kMDItemNeedsEmbeddings=1 || (%@=*&&%@=%ld) || (kMDItemEmbeddingVersion=*&&kMDItemEmbeddingVersion=%ld)", v4, v4, v11, [v12 embeddingVersion]);

  v20[0] = v4;
  v20[1] = @"_kMDItemNeedsEmbeddings";
  id v14 = +[NSArray arrayWithObjects:v20 count:2];
  id v15 = [(SKGJob *)self context];
  uint64_t v16 = [v15 embeddingGenStartTime];

  LOBYTE(v19) = 1;
  id v17 = [(SKGJob *)self generateCSReportForQueryFlags:8 fetchAttributePairs:v9 additionalQueryString:v13 processedField:@"kMDItemEmbeddingVersion" succesfullyProcessedField:v4 eligibleFields:v14 dayCompletionStr:@"embeddingGenCompleteDay" genStartTime:v16 bundleIDs:0 daysToCompleteApproach:0 includeFiles:v19 withCancelBlock:v5];

  return v17;
}

- (id)generateCSSuggestedEventsReportWithCancelBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[SKGProcessorContext sharedContext];
  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"_kMDItemNeedsSuggestedEvents=1 || kMDItemEventType=* || (kMDItemSuggestedEventsVersion=*&&kMDItemSuggestedEventsVersion=%ld)", [v5 suggestedEventsVersion]);

  id v7 = [(SKGJob *)self context];
  id v8 = [v7 suggestedEventsGenStartTime];

  id v9 = +[SKGProcessorContext sharedContext];
  id v10 = [v9 suggestedEventsIncludeBundles];
  LOBYTE(v13) = 0;
  id v11 = [(SKGJob *)self generateCSReportForQueryFlags:64 fetchAttributePairs:&off_1000E70F8 additionalQueryString:v6 processedField:@"kMDItemSuggestedEventsVersion" succesfullyProcessedField:@"kMDItemEventType" eligibleFields:&off_1000E7110 dayCompletionStr:@"suggestedEventsGenCompleteDay" genStartTime:v8 bundleIDs:v10 daysToCompleteApproach:1 includeFiles:v13 withCancelBlock:v4];

  return v11;
}

- (id)generateCSDocumentUnderstandingReportWithCancelBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[SKGProcessorContext sharedContext];
  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"_kMDItemNeedsDocumentUnderstanding=1 || kMDItemCardType=* || (kMDItemDocumentUnderstandingVersion=*&&kMDItemDocumentUnderstandingVersion=%ld)", [v5 documentUnderstandingVersion]);

  id v7 = [(SKGJob *)self context];
  id v8 = [v7 documentUnderstandingGenStartTime];

  id v9 = +[SKGProcessorContext sharedContext];
  id v10 = [v9 docUnderstandingIncludeBundles];
  LOBYTE(v13) = 0;
  id v11 = [(SKGJob *)self generateCSReportForQueryFlags:128 fetchAttributePairs:&off_1000E7170 additionalQueryString:v6 processedField:@"kMDItemDocumentUnderstandingVersion" succesfullyProcessedField:@"kMDItemCardType" eligibleFields:&off_1000E7188 dayCompletionStr:@"documentUnderstandingGenCompleteDay" genStartTime:v8 bundleIDs:v10 daysToCompleteApproach:1 includeFiles:v13 withCancelBlock:v4];

  return v11;
}

- (BOOL)requestCSEmbeddingsProgressReport:(id)a3 cancelBlock:(id)a4
{
  id v6 = (void (**)(id, void *))a3;
  id v7 = [(SKGJob *)self generateCSEmbeddingsReportWithCancelBlock:a4];
  if (v7) {
    v6[2](v6, v7);
  }

  return v7 != 0;
}

- (BOOL)requestCSSuggestedEventsProgressReport:(id)a3 cancelBlock:(id)a4
{
  id v6 = (void (**)(id, void *))a3;
  id v7 = [(SKGJob *)self generateCSSuggestedEventsReportWithCancelBlock:a4];
  if (v7) {
    v6[2](v6, v7);
  }

  return v7 != 0;
}

- (BOOL)requestCSDocumentUnderstandingProgressReport:(id)a3 cancelBlock:(id)a4
{
  id v6 = (void (**)(id, void *))a3;
  id v7 = [(SKGJob *)self generateCSDocumentUnderstandingReportWithCancelBlock:a4];
  if (v7) {
    v6[2](v6, v7);
  }

  return v7 != 0;
}

@end