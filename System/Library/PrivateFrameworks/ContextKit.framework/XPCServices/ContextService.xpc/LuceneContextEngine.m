@interface LuceneContextEngine
+ (unint64_t)queryTypeForRequest:(id)a3;
+ (void)initialize;
- (BOOL)disabled;
- (BOOL)fallbackModeEnabled;
- (BOOL)stillWarmingUp;
- (BOOL)useBloomFilter;
- (ComAppleContextkitCategoriesConstellation)constellation;
- (ComAppleContextkitUtilSpindleArray)queriesArray;
- (KeylessMap)qidToQueriesMap;
- (KeylessMap)tagsMap;
- (KeylessMap)treasureMap;
- (LuceneContextEngine)initWithAssets:(id)a3;
- (NSCharacterSet)allowedNGramSeparators;
- (NSCharacterSet)nGramBreakingSeparators;
- (NSCharacterSet)partialNGramCharacterSet;
- (NSCharacterSet)quotedTokenCharacterSet;
- (OrgApacheLuceneIndexDirectoryReader)reader;
- (Wordlist)wordlist;
- (_PASBloomFilter)bloomFilter;
- (id)ancestorsForTopics:(id)a3;
- (id)debugStatus;
- (id)groupResponses:(id)a3;
- (id)indexId;
- (id)warmUpDatPath;
- (int)maxDoc;
- (int64_t)numTerms;
- (void)dealloc;
- (void)findResultsForRequest:(id)a3 withReply:(id)a4;
- (void)setAllowedNGramSeparators:(id)a3;
- (void)setBloomFilter:(id)a3;
- (void)setConstellation:(id)a3;
- (void)setNGramBreakingSeparators:(id)a3;
- (void)setPartialNGramCharacterSet:(id)a3;
- (void)setQidToQueriesMap:(id)a3;
- (void)setQueriesArray:(id)a3;
- (void)setQuotedTokenCharacterSet:(id)a3;
- (void)setReader:(id)a3;
- (void)setTagsMap:(id)a3;
- (void)setTreasureMap:(id)a3;
- (void)setUseBloomFilter:(BOOL)a3;
- (void)setWordlist:(id)a3;
- (void)updateConfigurationWithConfig:(id)a3;
@end

@implementation LuceneContextEngine

- (int)maxDoc
{
  return self->_nMaxDoc;
}

- (int64_t)numTerms
{
  return self->_nTerms;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.siri.context.service", "LuceneEngine");
    v3 = (void *)qword_100562FE8;
    qword_100562FE8 = (uint64_t)v2;

    uint64_t v4 = +[TokenInfo ignoreUnknownTokenSentinel];
    v5 = (void *)qword_100562FF0;
    qword_100562FF0 = v4;

    uint64_t v6 = +[TokenInfo ignoreStopwordTokenSentinel];
    v7 = (void *)qword_100562FF8;
    qword_100562FF8 = v6;

    uint64_t v8 = ContextKitErrorDomain;
    v9 = +[NSDictionary dictionaryWithObject:@"Constellation unavailable" forKey:NSLocalizedFailureReasonErrorKey];
    uint64_t v10 = +[NSError errorWithDomain:v8 code:7 userInfo:v9];
    v11 = (void *)qword_100563000;
    qword_100563000 = v10;

    v12 = +[NSDictionary dictionaryWithObject:@"groupResponses called with empty responses object" forKey:NSLocalizedFailureReasonErrorKey];
    uint64_t v13 = +[NSError errorWithDomain:v8 code:10 userInfo:v12];
    v14 = (void *)qword_100563008;
    qword_100563008 = v13;

    id v17 = +[NSDictionary dictionaryWithObject:@"groupResponses called with grouping requests unavailable" forKey:NSLocalizedFailureReasonErrorKey];
    uint64_t v15 = +[NSError errorWithDomain:v8 code:7 userInfo:v17];
    v16 = (void *)qword_100563010;
    qword_100563010 = v15;
  }
}

- (LuceneContextEngine)initWithAssets:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)LuceneContextEngine;
  uint64_t v6 = [(LuceneContextEngine *)&v18 init];
  v7 = v6;
  if (v6)
  {
    pthread_mutex_init(&v6->_indexLock, 0);
    id v8 = +[OrgApacheLuceneUtilStringHelper randomId];
    objc_storeStrong((id *)&v7->_assets, a3);
    v9 = (void *)qword_100562FE8;
    if (os_log_type_enabled((os_log_t)qword_100562FE8, OS_LOG_TYPE_DEBUG)) {
      sub_1002ACE28(v9, v7);
    }
    [(ContextEngine *)v7 updateConfiguration];
    objc_initWeak(&location, v7);
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_1002A9D68;
    uint64_t v15 = &unk_10048BA80;
    objc_copyWeak(&v16, &location);
    uint64_t v10 = objc_retainBlock(&v12);
    -[CTKAssetsProtocol registerIndexChangeHandler:](v7->_assets, "registerIndexChangeHandler:", v10, v12, v13, v14, v15);
    +[ContextConfiguration registerUpdateHandler:v10];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  sub_1002A9EB8((uint64_t)self);
  sub_1002A9F18((uint64_t)self);
  pthread_mutex_destroy(&self->_indexLock);
  v3.receiver = self;
  v3.super_class = (Class)LuceneContextEngine;
  [(LuceneContextEngine *)&v3 dealloc];
}

- (void)updateConfigurationWithConfig:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v29.receiver = v5;
  v29.super_class = (Class)LuceneContextEngine;
  [(ContextEngine *)&v29 updateConfigurationWithConfig:v4];
  uint64_t v6 = [v4 luceneIndexPath];
  id v7 = [v6 length];
  if (v7)
  {
    id v8 = [v4 luceneIndexPath];
  }
  else
  {
    id v8 = 0;
  }
  objc_storeStrong((id *)&v5->_overrideIndexPath, v8);
  if (v7) {

  }
  v5->_minFileSizeForNSDataMMap = (unint64_t)[v4 luceneMinFileSizeForNSDataMMap];
  v5->_nsDataBufferSize = (unint64_t)[v4 debugNSDataBufferSize];
  v9 = [v4 nGramBreakingSeparators];

  if (v9)
  {
    uint64_t v10 = [v4 nGramBreakingSeparators];
    v11 = [v10 trim];
    uint64_t v12 = +[NSCharacterSet characterSetWithCharactersInString:v11];
    nGramBreakingSeparators = v5->_nGramBreakingSeparators;
    v5->_nGramBreakingSeparators = (NSCharacterSet *)v12;
  }
  v14 = [v4 allowedNGramSeparators];

  if (v14)
  {
    uint64_t v15 = [v4 allowedNGramSeparators];
    id v16 = [v15 trim];

    if ([v16 isEmpty])
    {
      allowedNGramSeparators = v5->_allowedNGramSeparators;
      v5->_allowedNGramSeparators = 0;
    }
    else
    {
      uint64_t v18 = +[NSCharacterSet characterSetWithCharactersInString:v16];
      allowedNGramSeparators = v5->_allowedNGramSeparators;
      v5->_allowedNGramSeparators = (NSCharacterSet *)v18;
    }
  }
  v19 = [v4 quotedTokenCharacterSet];

  if (v19)
  {
    v20 = [v4 quotedTokenCharacterSet];
    v21 = [v20 trim];
    uint64_t v22 = +[NSCharacterSet characterSetWithCharactersInString:v21];
    quotedTokenCharacterSet = v5->_quotedTokenCharacterSet;
    v5->_quotedTokenCharacterSet = (NSCharacterSet *)v22;
  }
  v24 = [v4 partialNGramCharacterSet];

  if (v24)
  {
    v25 = [v4 partialNGramCharacterSet];
    v26 = [v25 trim];
    uint64_t v27 = +[NSCharacterSet characterSetWithCharactersInString:v26];
    partialNGramCharacterSet = v5->_partialNGramCharacterSet;
    v5->_partialNGramCharacterSet = (NSCharacterSet *)v27;
  }
  sub_1002AA29C((uint64_t)v5);
  objc_sync_exit(v5);
}

- (void)findResultsForRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(LuceneContextEngine *)self reader];

  if (v8)
  {
    ++self->_requestCount;
    uint64_t v9 = [v6 text];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      v11 = [v6 text];
      id v12 = [v11 length];

      if (!v12) {
        [v6 setText:0];
      }
    }
    uint64_t v13 = [v6 text];
    if (v13)
    {
    }
    else if ([v6 textIsRaw])
    {
      [v6 setTextIsRaw:0];
    }
    uint64_t v19 = mach_absolute_time();
    v20 = [v6 desiredLanguageTags];

    if (!v20)
    {
      v21 = [(ContextEngine *)self config];
      uint64_t v22 = [v21 desiredLanguageTags];
      [v6 setDesiredLanguageTags:v22];
    }
    pthread_mutex_lock(&self->_indexLock);
    v24 = [[LuceneContextRequest alloc] initWithEngine:self forRequest:v6];
    pthread_mutex_unlock(&self->_indexLock);
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    uint64_t v27 = sub_1002AB688;
    v28 = &unk_10048BAE8;
    uint64_t v32 = v19;
    id v31 = v7;
    id v29 = v6;
    v30 = self;
    [(LuceneContextRequest *)v24 findResultsWithReply:&v25];
    [(LuceneContextRequest *)v24 discard];
  }
  else
  {
    id v14 = objc_alloc((Class)CKContextResponse);
    uint64_t v15 = ContextKitErrorDomain;
    id v16 = +[NSDictionary dictionaryWithObject:@"Index is unavailable" forKey:NSLocalizedFailureReasonErrorKey];
    id v17 = +[NSError errorWithDomain:v15 code:1 userInfo:v16];
    id v18 = objc_msgSend(v14, "initWithError:requestType:", v17, objc_msgSend(v6, "type"));
    (*((void (**)(id, id))v7 + 2))(v7, v18);
  }
}

+ (unint64_t)queryTypeForRequest:(id)a3
{
  id v3 = a3;
  if ([v3 textIsRaw])
  {
    unint64_t v4 = 3;
  }
  else
  {
    id v5 = [v3 text];

    if (v5)
    {
      unint64_t v4 = 2;
    }
    else
    {
      id v6 = [v3 url];

      unint64_t v4 = v6 != 0;
    }
  }

  return v4;
}

- (id)debugStatus
{
  effectiveIndexPath = self->_effectiveIndexPath;
  id v3 = [(LuceneContextEngine *)self indexId];
  unint64_t v4 = +[NSString stringWithFormat:@"effectiveIndexPath: %@\neffectiveIndexId: %@\n", effectiveIndexPath, v3];

  return v4;
}

- (id)indexId
{
  effectiveIndexId = self->_effectiveIndexId;
  if (effectiveIndexId)
  {
    id v3 = effectiveIndexId;
  }
  else if (self->_reader)
  {
    id v3 = @"unknown";
  }
  else
  {
    id v3 = @"unsupported";
  }
  return v3;
}

- (BOOL)disabled
{
  p_indexLock = &self->_indexLock;
  pthread_mutex_lock(&self->_indexLock);
  BOOL v4 = !self->_effectiveIndexId && !self->_reader || self->_effectiveIndexPath == 0;
  pthread_mutex_unlock(p_indexLock);
  return v4;
}

- (BOOL)fallbackModeEnabled
{
  os_log_t v2 = [(LuceneContextEngine *)self indexId];
  unsigned __int8 v3 = [@"fallback" isEqualToString:v2];

  return v3;
}

- (BOOL)stillWarmingUp
{
  return self->_requestCount < 5;
}

- (id)warmUpDatPath
{
  effectiveIndexPath = self->_effectiveIndexPath;
  if (effectiveIndexPath)
  {
    effectiveIndexPath = [effectiveIndexPath stringByAppendingPathComponent:@"warmup.dat"];
  }
  return effectiveIndexPath;
}

- (id)ancestorsForTopics:(id)a3
{
  id v4 = a3;
  if (self->_constellation)
  {
    id v5 = -[JavaUtilArrayList initWithInt:]([JavaUtilArrayList alloc], "initWithInt:", [v4 count]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v30 = v4;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v46;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v46 != v9) {
            objc_enumerationMutation(v6);
          }
          if (*(void *)(*((void *)&v45 + 1) + 8 * i)) {
            -[JavaUtilArrayList addWithId:](v5, "addWithId:");
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v8);
    }

    constellation = self->_constellation;
    id v12 = [(ComAppleContextkitCategoriesConstellation *)constellation newQIDMapper];
    id v29 = v5;
    uint64_t v13 = [(ComAppleContextkitCategoriesConstellation *)constellation ancestorCategoriesForQIDs:v5 usingMapper:v12];

    id v33 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", (int)objc_msgSend(v13, "size"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v28 = v13;
    id obj = [v13 entrySet];
    id v34 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v34)
    {
      uint64_t v32 = *(void *)v42;
      do
      {
        for (j = 0; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v42 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
          v36 = [v15 getKey];
          id v16 = [v15 getValue];
          id v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (int)objc_msgSend(v16, "size"));
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          v35 = v16;
          id v18 = [v16 entrySet];
          id v19 = [v18 countByEnumeratingWithState:&v37 objects:v49 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v38;
            do
            {
              for (k = 0; k != v20; k = (char *)k + 1)
              {
                if (*(void *)v38 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = *(void **)(*((void *)&v37 + 1) + 8 * (void)k);
                v24 = [v23 getKey];
                v25 = [v23 getValue];
                uint64_t v26 = +[CKContextCountedString string:withCount:](CKContextCountedString, "string:withCount:", v24, (int)[v25 intValue]);

                [v17 addObject:v26];
              }
              id v20 = [v18 countByEnumeratingWithState:&v37 objects:v49 count:16];
            }
            while (v20);
          }

          [v33 setObject:v17 forKey:v36];
        }
        id v34 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v34);
    }

    id v4 = v30;
  }
  else
  {
    id v33 = 0;
  }

  return v33;
}

- (id)groupResponses:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    v63 = +[MetricsLogging instance];
    uint64_t v64 = qword_100563008;
LABEL_68:
    v65 = [(LuceneContextEngine *)self indexId];
    [v63 recordQueryEventWithLuceneResultCount:0 error:v64 requestType:17 indexId:v65];

    id v66 = 0;
    goto LABEL_76;
  }
  constellation = self->_constellation;
  if (!constellation)
  {
    v63 = +[MetricsLogging instance];
    uint64_t v64 = qword_100563000;
    goto LABEL_68;
  }
  id v6 = [(ComAppleContextkitCategoriesConstellation *)constellation newGroupingRequest];
  id v7 = [(ContextEngine *)self config];
  objc_msgSend(v6, "setMaxTopicDistance:", objc_msgSend(v7, "constellationMaxTopicDistance"));

  id v8 = [(ContextEngine *)self config];
  objc_msgSend(v6, "setMaxOverallTopics:", objc_msgSend(v8, "constellationMaxOverallTopics"));

  v102 = v6;
  if (v6)
  {
    v93 = self;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id v90 = v4;
    id obj = v4;
    id v9 = [obj countByEnumeratingWithState:&v131 objects:v141 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v132;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v132 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = [*(id *)(*((void *)&v131 + 1) + 8 * i) results];
          id v14 = -[JavaUtilArrayList initWithInt:]([JavaUtilArrayList alloc], "initWithInt:", [obj count]);
          long long v127 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          id v15 = v13;
          id v16 = [v15 countByEnumeratingWithState:&v127 objects:v140 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v128;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v128 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v20 = [*(id *)(*((void *)&v127 + 1) + 8 * (void)j) topicId];
                [(JavaUtilArrayList *)v14 addWithId:v20];
              }
              id v17 = [v15 countByEnumeratingWithState:&v127 objects:v140 count:16];
            }
            while (v17);
          }

          [v102 addTopicGroup:v14];
        }
        id v10 = [obj countByEnumeratingWithState:&v131 objects:v141 count:16];
      }
      while (v10);
    }

    id v21 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v22 = [v102 overallCategories];
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    id v23 = [v22 countByEnumeratingWithState:&v123 objects:v139 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v124;
      do
      {
        for (k = 0; k != v24; k = (char *)k + 1)
        {
          if (*(void *)v124 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void **)(*((void *)&v123 + 1) + 8 * (void)k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v28 = v27;
            id v29 = [objc_alloc((Class)CKContextResult) initWithTitle:v28[2] query:0 url:0 category:0];
            [v29 setTopicId:v28[1]];

            [v21 addObject:v29];
          }
        }
        id v24 = [v22 countByEnumeratingWithState:&v123 objects:v139 count:16];
      }
      while (v24);
    }
    id v30 = v93;
    id v31 = [(ContextEngine *)v93 config];
    uint64_t v32 = [v31 desiredLanguageTags];
    unsigned int v33 = [v32 containsObject:@"en"];

    v91 = v22;
    v92 = v21;
    if (v33)
    {
      id v34 = objc_alloc_init((Class)NSMutableDictionary);
      long long v119 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id v94 = obj;
      id v98 = [v94 countByEnumeratingWithState:&v119 objects:v138 count:16];
      if (v98)
      {
        uint64_t v96 = *(void *)v120;
        do
        {
          uint64_t v35 = 0;
          do
          {
            if (*(void *)v120 != v96) {
              objc_enumerationMutation(v94);
            }
            uint64_t v100 = v35;
            v36 = *(void **)(*((void *)&v119 + 1) + 8 * v35);
            long long v115 = 0u;
            long long v116 = 0u;
            long long v117 = 0u;
            long long v118 = 0u;
            long long v37 = [v36 level1Topics];
            id v38 = [v37 countByEnumeratingWithState:&v115 objects:v137 count:16];
            if (v38)
            {
              id v39 = v38;
              uint64_t v40 = *(void *)v116;
              do
              {
                for (m = 0; m != v39; m = (char *)m + 1)
                {
                  if (*(void *)v116 != v40) {
                    objc_enumerationMutation(v37);
                  }
                  long long v42 = *(void **)(*((void *)&v115 + 1) + 8 * (void)m);
                  long long v43 = [v42 topicId];
                  unsigned __int8 v44 = [v43 isEqualToString:@"DH1009"];

                  if ((v44 & 1) == 0)
                  {
                    long long v45 = [v34 objectForKeyedSubscript:v42];
                    long long v46 = v45;
                    if (v45)
                    {
                      long long v47 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v45 intValue] + 1);
                      [v34 setObject:v47 forKey:v42];
                    }
                    else
                    {
                      [v34 setObject:&off_1004B1D78 forKey:v42];
                    }
                  }
                }
                id v39 = [v37 countByEnumeratingWithState:&v115 objects:v137 count:16];
              }
              while (v39);
            }

            uint64_t v35 = v100 + 1;
          }
          while ((id)(v100 + 1) != v98);
          id v98 = [v94 countByEnumeratingWithState:&v119 objects:v138 count:16];
        }
        while (v98);
      }

      long long v48 = [v34 keysSortedByValueUsingSelector:"compare:"];
      id v21 = v92;
      [v92 addObjectsFromArray:v48];

      id v30 = v93;
      uint64_t v22 = v91;
    }
    id v49 = objc_alloc_init((Class)NSMutableArray);
    v50 = [v102 groupingResults];
    if (v50)
    {
      v89 = v49;
      id v99 = objc_alloc_init((Class)NSMutableDictionary);
      long long v111 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      v88 = v50;
      id v95 = [v50 entrySet];
      id v101 = [v95 countByEnumeratingWithState:&v111 objects:v136 count:16];
      if (v101)
      {
        uint64_t v97 = *(void *)v112;
        do
        {
          for (n = 0; n != v101; n = (char *)n + 1)
          {
            if (*(void *)v112 != v97) {
              objc_enumerationMutation(v95);
            }
            v52 = *(void **)(*((void *)&v111 + 1) + 8 * (void)n);
            v53 = [v52 getKey];
            id v54 = objc_alloc_init((Class)CKContextItem);
            [v54 setTitle:v53[2]];
            [v54 setTopicId:v53[1]];
            v55 = [v52 getValue];
            id v56 = objc_alloc_init((Class)NSMutableArray);
            long long v107 = 0u;
            long long v108 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            id v57 = v55;
            id v58 = [v57 countByEnumeratingWithState:&v107 objects:v135 count:16];
            if (v58)
            {
              id v59 = v58;
              uint64_t v60 = *(void *)v108;
              do
              {
                for (ii = 0; ii != v59; ii = (char *)ii + 1)
                {
                  if (*(void *)v108 != v60) {
                    objc_enumerationMutation(v57);
                  }
                  uint64_t v62 = *(void *)(*((void *)&v107 + 1) + 8 * (void)ii);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [v56 addObject:v62];
                  }
                }
                id v59 = [v57 countByEnumeratingWithState:&v107 objects:v135 count:16];
              }
              while (v59);
            }

            [v99 setObject:v56 forKey:v54];
          }
          id v101 = [v95 countByEnumeratingWithState:&v111 objects:v136 count:16];
        }
        while (v101);
      }

      v104[0] = _NSConcreteStackBlock;
      v104[1] = 3221225472;
      v104[2] = sub_1002AC868;
      v104[3] = &unk_10048BB10;
      id v105 = obj;
      id v49 = v89;
      id v106 = v89;
      [v99 enumerateKeysAndObjectsUsingBlock:v104];

      id v21 = v92;
      id v30 = v93;
      uint64_t v22 = v91;
      v50 = v88;
    }
    else
    {
      BOOL v76 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v76) {
        sub_1002AD1D4(v76, v77, v78, v79, v80, v81, v82, v83);
      }
    }
    id v66 = [objc_alloc((Class)CKContextResponse) initWithResults:v21 requestType:17];
    [v66 setLevel2Topics:v49];
    v84 = +[MetricsLogging instance];
    id v85 = [v21 count];
    v86 = [(LuceneContextEngine *)v30 indexId];
    [v84 recordQueryEventWithLuceneResultCount:v85 error:0 requestType:17 indexId:v86];

    id v4 = v90;
  }
  else
  {
    BOOL v67 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v67) {
      sub_1002AD198(v67, v68, v69, v70, v71, v72, v73, v74);
    }
    id v21 = +[MetricsLogging instance];
    uint64_t v75 = qword_100563010;
    uint64_t v22 = [(LuceneContextEngine *)self indexId];
    [v21 recordQueryEventWithLuceneResultCount:0 error:v75 requestType:17 indexId:v22];
    id v66 = 0;
  }

LABEL_76:
  return v66;
}

- (OrgApacheLuceneIndexDirectoryReader)reader
{
  return self->_reader;
}

- (void)setReader:(id)a3
{
}

- (Wordlist)wordlist
{
  return self->_wordlist;
}

- (void)setWordlist:(id)a3
{
}

- (_PASBloomFilter)bloomFilter
{
  return self->_bloomFilter;
}

- (void)setBloomFilter:(id)a3
{
}

- (BOOL)useBloomFilter
{
  return self->_useBloomFilter;
}

- (void)setUseBloomFilter:(BOOL)a3
{
  self->_useBloomFilter = a3;
}

- (KeylessMap)treasureMap
{
  return self->_treasureMap;
}

- (void)setTreasureMap:(id)a3
{
}

- (ComAppleContextkitCategoriesConstellation)constellation
{
  return self->_constellation;
}

- (void)setConstellation:(id)a3
{
}

- (KeylessMap)qidToQueriesMap
{
  return self->_qidToQueriesMap;
}

- (void)setQidToQueriesMap:(id)a3
{
}

- (ComAppleContextkitUtilSpindleArray)queriesArray
{
  return self->_queriesArray;
}

- (void)setQueriesArray:(id)a3
{
}

- (KeylessMap)tagsMap
{
  return self->_tagsMap;
}

- (void)setTagsMap:(id)a3
{
}

- (NSCharacterSet)nGramBreakingSeparators
{
  return self->_nGramBreakingSeparators;
}

- (void)setNGramBreakingSeparators:(id)a3
{
}

- (NSCharacterSet)allowedNGramSeparators
{
  return self->_allowedNGramSeparators;
}

- (void)setAllowedNGramSeparators:(id)a3
{
}

- (NSCharacterSet)quotedTokenCharacterSet
{
  return self->_quotedTokenCharacterSet;
}

- (void)setQuotedTokenCharacterSet:(id)a3
{
}

- (NSCharacterSet)partialNGramCharacterSet
{
  return self->_partialNGramCharacterSet;
}

- (void)setPartialNGramCharacterSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialNGramCharacterSet, 0);
  objc_storeStrong((id *)&self->_quotedTokenCharacterSet, 0);
  objc_storeStrong((id *)&self->_allowedNGramSeparators, 0);
  objc_storeStrong((id *)&self->_nGramBreakingSeparators, 0);
  objc_storeStrong((id *)&self->_tagsMap, 0);
  objc_storeStrong((id *)&self->_queriesArray, 0);
  objc_storeStrong((id *)&self->_qidToQueriesMap, 0);
  objc_storeStrong((id *)&self->_constellation, 0);
  objc_storeStrong((id *)&self->_treasureMap, 0);
  objc_storeStrong((id *)&self->_bloomFilter, 0);
  objc_storeStrong((id *)&self->_wordlist, 0);
  objc_storeStrong((id *)&self->_reader, 0);
  objc_storeStrong((id *)&self->_memoryWarningEventSource, 0);
  objc_storeStrong((id *)&self->_effectiveIndexId, 0);
  objc_storeStrong((id *)&self->_effectiveIndexPath, 0);
  objc_storeStrong((id *)&self->_overrideIndexPath, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

@end