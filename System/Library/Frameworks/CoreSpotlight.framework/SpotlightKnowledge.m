@interface SpotlightKnowledge
+ (void)initialize;
+ (void)runWithJobContext:(id)a3 group:(id)a4 delegate:(id)a5;
+ (void)runWithJobContext:(id)a3 queue:(id)a4 group:(id)a5 progressBlock:(id)a6 checkpointBlock:(id)a7 completeBlock:(id)a8 cancelBlock:(id)a9 deferBlock:(id)a10;
- (BOOL)addProcessedItem:(id)a3 cancelBlock:(id)a4;
- (BOOL)addProcessedPerson:(id)a3 group:(id)a4 cancelBlock:(id)a5;
- (BOOL)analyzeGraphWithCancelBlock:(id)a3;
- (BOOL)canProcessItemAttributes:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5;
- (BOOL)flushGraphWithGroup:(id)a3 cancelBlock:(id)a4;
- (BOOL)graphNeedsAnalysis;
- (BOOL)loadGraphWithGroup:(id)a3 cancelBlock:(id)a4;
- (BOOL)processCSArchivesWithGroup:(id)a3 protectionClasses:(id)a4 shouldRemove:(BOOL)a5 archiverNextPathBlock:(id)a6 processedPathBlock:(id)a7 processedItemsBlock:(id)a8 errorLogBlock:(id)a9 cancelBlock:(id)a10;
- (BOOL)processCSJournalsWithGroup:(id)a3 protectionClasses:(id)a4 includeEmbeddings:(BOOL)a5 includeKeyphrases:(BOOL)a6 shouldRemove:(BOOL)a7 readerNextPathBlock:(id)a8 deletedReferencesBlock:(id)a9 processedPathBlock:(id)a10 processedItemsBlock:(id)a11 errorLogBlock:(id)a12 cancelBlock:(id)a13;
- (BOOL)processDeletesWithJobContext:(id)a3 group:(id)a4 cancelBlock:(id)a5;
- (BOOL)processDocumentUnderstandingReportWithJobContext:(id)a3 cancelBlock:(id)a4;
- (BOOL)processEmbeddingsReportWithJobContext:(id)a3 group:(id)a4 progressBlock:(id)a5 checkpointBlock:(id)a6 cancelBlock:(id)a7;
- (BOOL)processGraphWithGroup:(id)a3 cancelBlock:(id)a4;
- (BOOL)processPeopleWithGroup:(id)a3 cancelBlock:(id)a4;
- (BOOL)processSuggestedEventsReportWithJobContext:(id)a3 cancelBlock:(id)a4;
- (BOOL)processTextWithJobContext:(id)a3 group:(id)a4 cancelBlock:(id)a5;
- (BOOL)processUpdatesWithJobContext:(id)a3 group:(id)a4 cancelBlock:(id)a5;
- (BOOL)removeGraphEntitiesWithCancelBlock:(id)a3;
- (BOOL)removeGraphPeopleWithCancelBlock:(id)a3;
- (BOOL)removeReferences:(id)a3 bundleIdentifier:(id)a4 cancelBlock:(id)a5;
- (BOOL)scoreGraphWithCancelBlock:(id)a3;
- (BOOL)spotlightGraphAvailable;
- (BOOL)updateSpotlightContactsWithJobContext:(id)a3 group:(id)a4 cancelBlock:(id)a5;
- (SpotlightKnowledge)initWithJobContext:(id)a3;
- (id)coreSpotlightIndexWithBundleIdentifier:(id)a3 protectionClass:(id)a4;
- (id)coreSpotlightItemWithAttributes:(id)a3 referenceIdentifier:(id)a4 bundleIdentifier:(id)a5;
- (id)peopleAttributesWithProcessedItem:(id)a3;
- (id)spotlightContext;
- (id)spotlightGraph;
- (id)timerWithBlock:(id)a3;
- (void)runWithGroup:(id)a3 delegate:(id)a4;
- (void)runWithQueue:(id)a3 group:(id)a4 progressBlock:(id)a5 checkpointBlock:(id)a6 completeBlock:(id)a7 cancelBlock:(id)a8 deferBlock:(id)a9;
- (void)sendAnalytics;
- (void)unloadGraphWithGroup:(id)a3 cancelBlock:(id)a4;
- (void)updateCoreSpotlightWithItems:(id)a3 index:(id)a4 group:(id)a5 cancelBlock:(id)a6;
@end

@implementation SpotlightKnowledge

+ (void)initialize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000828EC;
  block[3] = &unk_1000D9FB0;
  block[4] = a1;
  if (qword_1000F9200 != -1) {
    dispatch_once(&qword_1000F9200, block);
  }
}

+ (void)runWithJobContext:(id)a3 queue:(id)a4 group:(id)a5 progressBlock:(id)a6 checkpointBlock:(id)a7 completeBlock:(id)a8 cancelBlock:(id)a9 deferBlock:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = [[SpotlightKnowledge alloc] initWithJobContext:v23];

  [(SpotlightKnowledge *)v24 runWithQueue:v22 group:v21 progressBlock:v20 checkpointBlock:v19 completeBlock:v18 cancelBlock:v17 deferBlock:v16];
}

+ (void)runWithJobContext:(id)a3 group:(id)a4 delegate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[SpotlightKnowledge alloc] initWithJobContext:v9];

  [(SpotlightKnowledge *)v10 runWithGroup:v8 delegate:v7];
}

- (SpotlightKnowledge)initWithJobContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SpotlightKnowledge;
  v6 = [(SpotlightKnowledge *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    spotlightGraph = v6->_spotlightGraph;
    v6->_spotlightGraph = 0;

    objc_storeStrong((id *)&v7->_spotlightContext, a3);
  }

  return v7;
}

- (BOOL)loadGraphWithGroup:(id)a3 cancelBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  spotlightGraph = self->_spotlightGraph;
  if (spotlightGraph)
  {
    [(SpotlightGraph *)spotlightGraph closeWithCancelBlock:v7];
    id v9 = self->_spotlightGraph;
    self->_spotlightGraph = 0;
  }
  objc_super v10 = [(SpotlightKnowledge *)self spotlightContext];
  v11 = [v10 spotlightKnowledgeGraphConfigPath];
  v12 = +[NSFileManager defaultManager];
  unsigned __int8 v13 = [v12 fileExistsAtPath:v11];

  v14 = [SKGConfig alloc];
  v15 = v14;
  if (v13)
  {
    id v16 = [(SKGConfig *)v14 initWithConfigPath:v11];
  }
  else
  {
    id v17 = [v10 spotlightKnowledgeGraphPath];
    id v16 = -[SKGConfig initWithConfigPath:resourceDirectoryPath:resourceVersion:](v15, "initWithConfigPath:resourceDirectoryPath:resourceVersion:", v11, v17, [v10 graphVersion]);
  }
  id v18 = [[SpotlightGraph alloc] initWithConfig:v16];
  id v19 = self->_spotlightGraph;
  self->_spotlightGraph = v18;

  [(SpotlightGraph *)self->_spotlightGraph openWithCancelBlock:v7];
  if (![(SpotlightGraph *)self->_spotlightGraph available])
  {
    id v20 = [(SpotlightKnowledge *)self spotlightContext];
    [v20 logError:4 message:@"graph unavailable"];

    id v21 = self->_spotlightGraph;
    self->_spotlightGraph = 0;
  }
  BOOL v22 = [(SpotlightKnowledge *)self spotlightGraphAvailable];

  return v22;
}

- (void)unloadGraphWithGroup:(id)a3 cancelBlock:(id)a4
{
  spotlightGraph = self->_spotlightGraph;
  if (spotlightGraph)
  {
    [(SpotlightGraph *)spotlightGraph closeWithCancelBlock:a4];
    id v6 = self->_spotlightGraph;
    self->_spotlightGraph = 0;
  }
}

- (BOOL)spotlightGraphAvailable
{
  return [(SpotlightGraph *)self->_spotlightGraph available];
}

- (id)spotlightGraph
{
  return self->_spotlightGraph;
}

- (id)spotlightContext
{
  return self->_spotlightContext;
}

- (id)peopleAttributesWithProcessedItem:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[SKGProcessorContext sharedContext];
  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 knowledgeVersion]);
  [v4 setObject:v6 forKey:@"_kMDItemKnowledgeIndexVersion"];

  id v7 = [(SpotlightKnowledge *)self spotlightContext];
  id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 graphVersion]);
  [v4 setObject:v8 forKey:@"_kMDItemKnowledgeUpdaterVersion"];

  id v9 = objc_alloc_init((Class)CSSearchableItemAttributeSet);
  [v9 addAttributesFromDictionary:v4];

  return v9;
}

- (id)coreSpotlightItemWithAttributes:(id)a3 referenceIdentifier:(id)a4 bundleIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)CSSearchableItem) initWithUniqueIdentifier:v8 domainIdentifier:0 attributeSet:v9];

  [v10 setBundleID:v7];
  [v10 setIsUpdate:1];

  return v10;
}

- (id)coreSpotlightIndexWithBundleIdentifier:(id)a3 protectionClass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1000F9210 != -1) {
    dispatch_once(&qword_1000F9210, &stru_1000DC2A0);
  }
  id v8 = [(id)qword_1000F9208 objectForKeyedSubscript:v5];

  if (!v8)
  {
    id v9 = +[NSMutableDictionary dictionary];
    [(id)qword_1000F9208 setObject:v9 forKeyedSubscript:v5];
  }
  id v10 = [(id)qword_1000F9208 objectForKeyedSubscript:v5];
  v11 = [v10 objectForKeyedSubscript:v6];

  if (v11)
  {
    v12 = [(id)qword_1000F9208 objectForKeyedSubscript:v5];
    id v13 = [v12 objectForKeyedSubscript:v6];
  }
  else
  {
    id v13 = [objc_alloc((Class)CSSearchableIndex) initWithName:@"KnowledgeIndex" protectionClass:v6 bundleIdentifier:v5];
    v12 = [(id)qword_1000F9208 objectForKeyedSubscript:v5];
    [v12 setObject:v13 forKey:v6];
  }

  return v13;
}

- (void)updateCoreSpotlightWithItems:(id)a3 index:(id)a4 group:(id)a5 cancelBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = a5;
  id v12 = a6;
  if (v10 && [v9 count])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v16 = [v9 count];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: indexing %lu items", buf, 0xCu);
    }
    dispatch_group_enter(v11);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100083270;
    v13[3] = &unk_1000D97D8;
    v14 = v11;
    [v10 indexSearchableItems:v9 completionHandler:v13];
  }
}

- (BOOL)addProcessedItem:(id)a3 cancelBlock:(id)a4
{
  if (!a3) {
    return 1;
  }
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SpotlightKnowledge *)self spotlightGraph];
  unsigned __int8 v9 = [v8 addItem:v7 cancelBlock:v6];

  return v9;
}

- (BOOL)addProcessedPerson:(id)a3 group:(id)a4 cancelBlock:(id)a5
{
  if (!a3) {
    return 1;
  }
  id v7 = a5;
  id v8 = a3;
  unsigned __int8 v9 = [(SpotlightKnowledge *)self spotlightGraph];
  unsigned __int8 v10 = [v9 addPerson:v8 cancelBlock:v7];

  return v10;
}

- (BOOL)canProcessItemAttributes:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count]
    && (+[SKGProcessor sharedProcessor],
        v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v11 recordIsValid:v8],
        v11,
        v12))
  {
    id v13 = +[SKGProcessor sharedProcessor];
    id v14 = [v13 copyReferenceIdentifierFromRecord:v8];

    if (v14)
    {
      if (v10)
      {
        id v15 = v10;
      }
      else
      {
        id v17 = +[SKGProcessor sharedProcessor];
        id v15 = [v17 copyProtectionClassFromRecord:v8];
      }
      if ([v15 length])
      {
        if (v9)
        {
          id v18 = v9;
        }
        else
        {
          id v19 = +[SKGProcessor sharedProcessor];
          id v18 = [v19 copyBundleIdentifierFromRecord:v8];
        }
        if ([v18 length])
        {
          id v20 = [(SpotlightKnowledge *)self spotlightGraph];
          unsigned int v16 = [v20 containsReference:v14 personaIdentifier:0 protectionClass:v15 domainIdentifier:v18] ^ 1;
        }
        else
        {
          LOBYTE(v16) = 0;
        }
      }
      else
      {
        LOBYTE(v16) = 0;
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (BOOL)removeReferences:(id)a3 bundleIdentifier:(id)a4 cancelBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v8 count])
  {
    v11 = [(SpotlightKnowledge *)self spotlightGraph];
    if ([v11 available]) {
      unsigned __int8 v12 = [v11 deleteReferences:v8 domainIdentifier:v9 cancelBlock:v10];
    }
    else {
      unsigned __int8 v12 = 1;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (BOOL)removeGraphPeopleWithCancelBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SpotlightKnowledge *)self spotlightGraph];
  unsigned __int8 v6 = [v5 deletePeopleWithCancelBlock:v4];

  return v6;
}

- (BOOL)removeGraphEntitiesWithCancelBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SpotlightKnowledge *)self spotlightGraph];
  unsigned __int8 v6 = [v5 deleteEntitiesWithCancelBlock:v4];

  return v6;
}

- (BOOL)graphNeedsAnalysis
{
  v2 = [(SpotlightKnowledge *)self spotlightGraph];
  char v3 = [v2 hasPeople] ^ 1;

  return v3;
}

- (BOOL)analyzeGraphWithCancelBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SpotlightKnowledge *)self spotlightGraph];
  unsigned __int8 v6 = [v5 analyzePeopleWithCancelBlock:v4];

  return v6;
}

- (BOOL)scoreGraphWithCancelBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SpotlightKnowledge *)self spotlightGraph];
  unsigned __int8 v6 = [v5 scorePeopleWithCancelBlock:v4];

  return v6;
}

- (BOOL)updateSpotlightContactsWithJobContext:(id)a3 group:(id)a4 cancelBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v24 = a5;
  if (qword_1000F9218 != -1) {
    dispatch_once(&qword_1000F9218, &stru_1000DC2C0);
  }
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 1;
  id v10 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  id v11 = objc_alloc((Class)CSSearchableIndex);
  unsigned __int8 v12 = [v8 knowledgeIndexIdentifier];
  id v13 = [v11 initWithName:@"KnowledgeIndex" protectionClass:v10 bundleIdentifier:v12];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: clearing spotlight knowledge", buf, 2u);
  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100083D48;
  v37[3] = &unk_1000DC2E8;
  v37[4] = &v38;
  objc_msgSend(v13, "deleteAllSearchableItemsWithCompletionHandler:", v37, context);
  if (*((unsigned char *)v39 + 24))
  {
    *(void *)buf = 0;
    v32 = buf;
    uint64_t v33 = 0x3032000000;
    v34 = sub_100012714;
    v35 = sub_1000125A8;
    id v36 = 0;
    id v36 = objc_alloc_init((Class)NSMutableArray);
    id v14 = [(SpotlightKnowledge *)self spotlightGraph];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100083DA4;
    v25[3] = &unk_1000DC330;
    v29 = buf;
    v25[4] = self;
    id v15 = v13;
    id v26 = v15;
    id v16 = v9;
    id v27 = v16;
    id v17 = v24;
    id v28 = v17;
    v30 = &v38;
    [v14 enumeratePeopleUsingBlock:v25];
    if (*((unsigned char *)v39 + 24) && [*((id *)v32 + 5) count])
    {
      id v18 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = [*((id *)v32 + 5) count];
        *(_DWORD *)v42 = 134217984;
        id v43 = v19;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: indexing %lu items", v42, 0xCu);
      }

      [(SpotlightKnowledge *)self updateCoreSpotlightWithItems:*((void *)v32 + 5) index:v15 group:v16 cancelBlock:v17];
    }

    _Block_object_dispose(buf, 8);
  }

  BOOL v20 = *((unsigned char *)v39 + 24) != 0;
  _Block_object_dispose(&v38, 8);

  return v20;
}

- (BOOL)flushGraphWithGroup:(id)a3 cancelBlock:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = [(SpotlightKnowledge *)self spotlightGraph];
  if ([v6 available]) {
    unsigned __int8 v7 = [v6 flushWithCancelBlock:v5];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)processCSJournalsWithGroup:(id)a3 protectionClasses:(id)a4 includeEmbeddings:(BOOL)a5 includeKeyphrases:(BOOL)a6 shouldRemove:(BOOL)a7 readerNextPathBlock:(id)a8 deletedReferencesBlock:(id)a9 processedPathBlock:(id)a10 processedItemsBlock:(id)a11 errorLogBlock:(id)a12 cancelBlock:(id)a13
{
  BOOL v53 = a7;
  id v44 = a3;
  id v16 = a4;
  v51 = (SKGJournalReader *)a8;
  id v57 = a9;
  v54 = (uint64_t (**)(id, void, void *))a10;
  id v59 = a11;
  v50 = (uint64_t (**)(id, uint64_t, void *))a12;
  id v17 = (unsigned int (**)(id, const __CFString *))a13;
  v58 = [(SpotlightKnowledge *)self spotlightContext];
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x2020000000;
  char v87 = 1;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = v16;
  id v18 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
  id v19 = v51;
  if (v18)
  {
    uint64_t v48 = *(void *)v81;
    unsigned __int8 v20 = 1;
LABEL_3:
    id v47 = v18;
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v81 != v48) {
        objc_enumerationMutation(obj);
      }
      if ((v20 & 1) == 0) {
        break;
      }
      uint64_t v22 = *(void *)(*((void *)&v80 + 1) + 8 * v21);
      if (v17[2](v17, @"processCSJournalsWithQueryID:protectionClass"))
      {
        *((unsigned char *)v85 + 24) = 0;
        break;
      }
      if (v19)
      {
        uint64_t v23 = ((void (*)(SKGJournalReader *, uint64_t))v19[1].super.isa)(v19, v22);
        if (v23)
        {
          id v24 = [[SKGJournalReader alloc] initWithResourceDirectoryPath:v23];
          id v19 = v24;
          if (v24)
          {
            v25 = [(SKGJournalReader *)v24 journalPaths];
          }
          else
          {
            v25 = 0;
          }
        }
        else
        {
          v25 = 0;
          id v19 = 0;
        }
      }
      else
      {
        v25 = 0;
        uint64_t v23 = 0;
      }
      v52 = (void *)v23;
      if ([v25 count])
      {
        v49 = v25;
        id v26 = [v25 keysSortedByValueUsingSelector:"compare:"];
        id v27 = [v26 mutableCopy];
        unsigned __int8 v20 = 1;
LABEL_17:

        while ([v27 count])
        {
          if (v17[2](v17, @"processCSJournalsWithQueryID:journal"))
          {
            *((unsigned char *)v85 + 24) = 0;
            break;
          }
          uint64_t v74 = 0;
          v75 = &v74;
          uint64_t v76 = 0x3032000000;
          v77 = sub_100012714;
          v78 = sub_1000125A8;
          id v79 = 0;
          id v26 = [v27 firstObject];
          v66[0] = _NSConcreteStackBlock;
          v66[1] = 3221225472;
          v66[2] = sub_100085128;
          v66[3] = &unk_1000DC380;
          BOOL v72 = a5;
          BOOL v73 = a6;
          v66[4] = v22;
          v70 = &v84;
          v71 = &v74;
          v29 = v17;
          v68 = v29;
          id v67 = v58;
          id v30 = v59;
          id v69 = v30;
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472;
          v63[2] = sub_1000854A4;
          v63[3] = &unk_1000DC3A8;
          v65 = &v84;
          v31 = v29;
          v64 = v31;
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472;
          v60[2] = sub_100085508;
          v60[3] = &unk_1000DC3D0;
          v62 = &v84;
          id v61 = v57;
          unsigned __int8 v20 = [(SKGJournalReader *)v19 enumerateItemsOfJournalAtPath:v26 itemAdds:v66 itemUpdates:v63 itemDeletes:v60 cancelBlock:v31];
          if ([(id)v75[5] count])
          {
            char v32 = (*((uint64_t (**)(id, uint64_t))v59 + 2))(v30, v75[5]);
            *((unsigned char *)v85 + 24) = v32;
            uint64_t v33 = (void *)v75[5];
            v75[5] = 0;
          }
          _Block_object_dispose(&v74, 8);

          if ((v20 & 1) == 0)
          {
            v39 = +[NSString stringWithFormat:@"could not read journal path for %@", v22, v44, context];
            char v40 = v50[2](v50, 8, v39);
            *((unsigned char *)v85 + 24) = v40;

            [v27 removeObject:v26];
            goto LABEL_17;
          }
          int v34 = *((unsigned __int8 *)v85 + 24);
          if (*((unsigned char *)v85 + 24) && v26)
          {
            v35 = [v26 lastPathComponent];
            char v36 = v54[2](v54, v22, v35);
            *((unsigned char *)v85 + 24) = v36;

            if (!*((unsigned char *)v85 + 24))
            {

LABEL_36:
              unsigned __int8 v20 = 1;
              break;
            }
            if (v53 && ![(SKGJournalReader *)v19 removeJournalPath:v26 error:0])
            {
              char v37 = v50[2](v50, 9, @"could not delete journal path");
              *((unsigned char *)v85 + 24) = v37;
            }
            [v27 removeObject:v26];
            int v34 = *((unsigned __int8 *)v85 + 24);
          }
          BOOL v38 = v34 == 0;

          if (v38) {
            goto LABEL_36;
          }
        }

        v25 = v49;
      }
      else
      {
        unsigned __int8 v20 = 1;
      }
      BOOL v41 = *((unsigned char *)v85 + 24) == 0;

      id v19 = v51;
      if (v41) {
        break;
      }
      if ((id)++v21 == v47)
      {
        id v18 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
        if (v18) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  BOOL v42 = *((unsigned char *)v85 + 24) != 0;
  _Block_object_dispose(&v84, 8);

  return v42;
}

- (BOOL)processCSArchivesWithGroup:(id)a3 protectionClasses:(id)a4 shouldRemove:(BOOL)a5 archiverNextPathBlock:(id)a6 processedPathBlock:(id)a7 processedItemsBlock:(id)a8 errorLogBlock:(id)a9 cancelBlock:(id)a10
{
  BOOL v56 = a5;
  id v54 = a3;
  id v15 = a4;
  v60 = (void (**)(void))a6;
  v66 = (uint64_t (**)(id, void, void *))a7;
  id v16 = (uint64_t (**)(id, void *))a8;
  v68 = (uint64_t (**)(void))a9;
  uint64_t v76 = (uint64_t (**)(id, const __CFString *))a10;
  v77 = [(SpotlightKnowledge *)self spotlightContext];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id obj = v15;
  id v61 = [obj countByEnumeratingWithState:&v95 objects:v100 count:16];
  if (v61)
  {
    uint64_t v59 = *(void *)v96;
    id v17 = &selRef__doStart;
    do
    {
      v64 = 0;
      id v57 = v17[166];
      do
      {
        if (*(void *)v96 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v75 = *(void *)(*((void *)&v95 + 1) + 8 * (void)v64);
        if (v76[2](v76, @"processCSArchivesWithGroup:protectionClass"))
        {
LABEL_69:
          BOOL v52 = 0;
          goto LABEL_70;
        }
        id v18 = (SKGArchiver *)v60;
        if (!v60) {
          goto LABEL_12;
        }
        id v67 = v60[2]();
        if (!v67)
        {
          id v18 = 0;
LABEL_12:
          v65 = 0;
          id v67 = 0;
          goto LABEL_13;
        }
        id v18 = [[SKGArchiver alloc] initWithResourceDirectoryPath:v67];
        v65 = v18;
        if (v18)
        {
          id v18 = [(SKGArchiver *)v18 archivePaths];
          int v19 = 1;
          goto LABEL_14;
        }
        v65 = 0;
LABEL_13:
        int v19 = 0;
LABEL_14:
        v63 = v18;
        if ([(SKGArchiver *)v18 count])
        {
          unsigned __int8 v20 = [(SKGArchiver *)v63 keysSortedByValueUsingSelector:v57];
          id v71 = [v20 mutableCopy];

          uint64_t v21 = 0;
          int v62 = v19 & v56;
          while (1)
          {
            if (![v71 count])
            {

              break;
            }
            if (v76 && (v76[2](v76, @"processCSArchivesWithGroup:archive") & 1) != 0) {
              goto LABEL_60;
            }
            uint64_t v89 = 0;
            v90 = &v89;
            uint64_t v91 = 0x3032000000;
            v92 = sub_100012714;
            v93 = sub_1000125A8;
            id v94 = 0;
            uint64_t v22 = [v71 lastObject];
            id v88 = v21;
            BOOL v72 = (void *)v22;
            uint64_t v74 = +[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:");
            id v73 = v88;

            if (!v74)
            {
              if (v68) {
                char v50 = v68[2]();
              }
              else {
                char v50 = 1;
              }
              goto LABEL_59;
            }
            uint64_t v23 = +[NSKeyedUnarchiver unarchivedArrayOfObjectsOfClass:objc_opt_class() fromData:v74 error:0];
            long long v86 = 0u;
            long long v87 = 0u;
            long long v84 = 0u;
            long long v85 = 0u;
            id v24 = v23;
            id v25 = [v24 countByEnumeratingWithState:&v84 objects:v99 count:16];
            if (!v25) {
              goto LABEL_38;
            }
            uint64_t v26 = *(void *)v85;
            while (2)
            {
              for (i = 0; i != v25; i = (char *)i + 1)
              {
                if (*(void *)v85 != v26) {
                  objc_enumerationMutation(v24);
                }
                id v28 = [*(id *)(*((void *)&v84 + 1) + 8 * i) attributeSet];
                v29 = [v28 attributeDictionary];

                id v30 = +[SKGProcessor sharedProcessor];
                unsigned int v31 = [v30 recordIsValid:v29];

                if (v31)
                {
                  char v32 = +[SKGProcessor sharedProcessor];
                  unsigned int v33 = [v32 needsPeopleForRecord:v29];

                  int v34 = +[SKGProcessor sharedProcessor];
                  unsigned int v35 = [v34 shouldGeneratePeopleForRecord:v29];

                  char v36 = +[SKGProcessor sharedProcessor];
                  uint64_t v37 = (v33 & v35) != 0 ? 8 : 0;
                  v81[0] = _NSConcreteStackBlock;
                  v81[1] = 3221225472;
                  v81[2] = sub_100085E04;
                  v81[3] = &unk_1000DC358;
                  long long v83 = &v89;
                  long long v82 = v76;
                  v79[0] = _NSConcreteStackBlock;
                  v79[1] = 3221225472;
                  v79[2] = sub_100085EA0;
                  v79[3] = &unk_1000DAB68;
                  long long v80 = v82;
                  unsigned __int8 v38 = objc_msgSend(v36, "enumerateProcessedItemsFromRecord:referenceIdentifier:bundleIdentifier:protectionClass:processorFlags:processedItemBlock:cancelBlock:", v29, 0, 0, v75, v37, v81, v79, v54, v55);

                  if ((v38 & 1) == 0)
                  {

LABEL_51:
                    goto LABEL_52;
                  }
                }
                id v39 = [(id)v90[5] count];
                if (v39 < [v77 maxItemCountPerBatch]) {
                  goto LABEL_35;
                }
                char v40 = (void *)v90[5];
                if (!v16)
                {
                  v90[5] = 0;

LABEL_35:
                  continue;
                }
                char v41 = v16[2](v16, v40);
                BOOL v42 = (void *)v90[5];
                v90[5] = 0;

                if ((v41 & 1) == 0) {
                  goto LABEL_51;
                }
              }
              id v25 = [v24 countByEnumeratingWithState:&v84 objects:v99 count:16];
              if (v25) {
                continue;
              }
              break;
            }
LABEL_38:

            id v43 = [(id)v90[5] count];
            if (v43 >= [v77 maxItemCountPerBatch])
            {
              if (v16) {
                v16[2](v16, (void *)v90[5]);
              }
              id v44 = (void *)v90[5];
              v90[5] = 0;
            }
            if (v66
              && ([v72 lastPathComponent],
                  v45 = objc_claimAutoreleasedReturnValue(),
                  int v46 = v66[2](v66, v75, v45),
                  v45,
                  !v46))
            {
LABEL_52:
              char v50 = 0;
            }
            else
            {
              if (v62)
              {
                id v78 = v73;
                [(SKGArchiver *)v65 removeArchivePath:v72 error:&v78];
                id v48 = v78;

                if (v48 && v68) {
                  int v49 = v68[2]();
                }
                else {
                  int v49 = 1;
                }
              }
              else
              {
                int v49 = 1;
                id v48 = v73;
              }
              char v50 = v49 != 0;
              [v71 removeObject:v72];
              id v73 = v48;
            }

LABEL_59:
            uint64_t v21 = v73;

            _Block_object_dispose(&v89, 8);
            if ((v50 & 1) == 0)
            {
LABEL_60:

              goto LABEL_69;
            }
          }
        }

        v64 = (char *)v64 + 1;
      }
      while (v64 != v61);
      id v51 = [obj countByEnumeratingWithState:&v95 objects:v100 count:16];
      id v61 = v51;
      id v17 = &selRef__doStart;
    }
    while (v51);
  }
  BOOL v52 = 1;
LABEL_70:

  return v52;
}

- (BOOL)processDeletesWithJobContext:(id)a3 group:(id)a4 cancelBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 startDeletes];
  id v11 = [v8 protectionClasses];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000861CC;
  v31[3] = &unk_1000DC3F8;
  id v32 = v8;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000861D8;
  v28[3] = &unk_1000DC420;
  v28[4] = self;
  id v30 = v10;
  id v29 = v32;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100086284;
  v24[3] = &unk_1000DC448;
  v24[4] = self;
  id v12 = v9;
  id v25 = v12;
  id v27 = v30;
  id v26 = v29;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100086324;
  v22[3] = &unk_1000DC470;
  id v23 = v27;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100086354;
  v19[3] = &unk_1000DC498;
  id v13 = v26;
  id v20 = v13;
  uint64_t v21 = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100086398;
  v17[3] = &unk_1000DAB68;
  id v14 = v23;
  id v18 = v14;
  [(SpotlightKnowledge *)self processCSJournalsWithGroup:v12 protectionClasses:v11 includeEmbeddings:0 includeKeyphrases:0 shouldRemove:1 readerNextPathBlock:v31 deletedReferencesBlock:v28 processedPathBlock:v24 processedItemsBlock:v22 errorLogBlock:v19 cancelBlock:v17];

  [v13 finishedDeletes];

  return 1;
}

- (BOOL)processUpdatesWithJobContext:(id)a3 group:(id)a4 cancelBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 startItemUpdatesJob];
  id v10 = +[SKGProcessorContext sharedContext];
  unsigned __int8 v11 = [v10 enableKeyphrases];

  id v12 = +[SKGProcessorContext sharedContext];
  unsigned __int8 v13 = [v12 enableEmbeddings];

  if (v13 & 1) != 0 || (v11)
  {
    id v15 = [[SKGJob alloc] initWithJobContext:v7];
    id v16 = [SKGItemMonitor alloc];
    id v17 = [v7 updateArchivePath];
    id v18 = [(SKGItemMonitor *)v16 initWithResourceDirectoryPath:v17];
    [(SKGJob *)v15 setMonitor:v18];

    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    v53[3] = 0;
    int v19 = [v7 protectionClasses];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000868A8;
    v50[3] = &unk_1000DC4C0;
    id v20 = v15;
    id v51 = v20;
    BOOL v52 = v53;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100086AD4;
    v46[3] = &unk_1000DC568;
    id v21 = v7;
    id v47 = v21;
    int v49 = v53;
    id v22 = v9;
    id v48 = v22;
    LODWORD(v18) = +[CSEventJournalStats enumerateEventsWithProtectionClasses:v19 itemAdds:v50 itemUpdates:&stru_1000DC500 itemDeletes:&stru_1000DC540 cancelBlock:v46];

    if (!v18) {
      goto LABEL_7;
    }
    [v21 startTextQueries];
    uint64_t v42 = 0;
    id v43 = &v42;
    uint64_t v44 = 0x2020000000;
    uint64_t v45 = 0;
    id v23 = [v21 protectionClasses];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100086B70;
    v41[3] = &unk_1000DC590;
    v41[4] = &v42;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100086B88;
    v39[3] = &unk_1000DC5B8;
    id v24 = v21;
    id v40 = v24;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100086C38;
    v37[3] = &unk_1000DC5E0;
    id v25 = v22;
    id v38 = v25;
    unsigned int v26 = [(SKGJob *)v20 requestCSReindexWithProtectionClasses:v23 batchProcessedBlock:v41 batchUpdatedBlock:v39 cancelBlock:v37];

    [v24 logReindexCount:v43[3]];
    [v24 finishedTextQueries];

    _Block_object_dispose(&v42, 8);
    if (v26)
    {
      id v27 = [v24 protectionClasses];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100086C48;
      v35[3] = &unk_1000DC5B8;
      id v36 = v24;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100086CF8;
      v33[3] = &unk_1000DC5E0;
      id v34 = v25;
      unsigned int v28 = [(SKGJob *)v20 requestCSCleanupWithProtectionClasses:v27 batchUpdatedBlock:v35 cancelBlock:v33];
    }
    else
    {
LABEL_7:
      unsigned int v28 = 0;
    }
    id v29 = [(SKGJob *)v20 monitor];
    [v29 clear];

    _Block_object_dispose(v53, 8);
    if (v28) {
      [v21 logFlag:24 message:@"text updating all done"];
    }
    char v14 = v28 ^ 1;
    [v21 finishedItemUpdatesJob];
  }
  else
  {
    [v7 finishedItemUpdatesJob];
    char v14 = 1;
  }

  return v14;
}

- (BOOL)processEmbeddingsReportWithJobContext:(id)a3 group:(id)a4 progressBlock:(id)a5 checkpointBlock:(id)a6 cancelBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = +[SKGProcessorContext sharedContext];
  unsigned __int8 v17 = [v16 enableEmbeddings];

  if (v17)
  {
    int v19 = [[SKGJob alloc] initWithJobContext:v11];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100086EF4;
    v25[3] = &unk_1000DC650;
    id v26 = v14;
    id v27 = v13;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000875C8;
    v23[3] = &unk_1000DC5E0;
    id v24 = v15;
    unsigned int v20 = [(SKGJob *)v19 requestCSEmbeddingsProgressReport:v25 cancelBlock:v23];
    if (v20) {
      [v11 logFlag:27 message:@"completed reporting progress"];
    }
    char v21 = v20 ^ 1;
  }
  else
  {
    AnalyticsSendEventLazy();
    char v21 = 0;
  }

  return v21;
}

- (BOOL)processSuggestedEventsReportWithJobContext:(id)a3 cancelBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SKGProcessorContext sharedContext];
  unsigned __int8 v8 = [v7 enableSuggestedEvents];

  if (v8)
  {
    id v10 = [[SKGJob alloc] initWithJobContext:v5];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100087DE4;
    v14[3] = &unk_1000DC5E0;
    id v15 = v6;
    unsigned int v11 = [(SKGJob *)v10 requestCSSuggestedEventsProgressReport:&stru_1000DC6B0 cancelBlock:v14];
    if (v11) {
      [v5 logFlag:27 message:@"completed reporting progress for suggested events pre-extraction"];
    }
    char v12 = v11 ^ 1;
  }
  else
  {
    AnalyticsSendEventLazy();
    char v12 = 0;
  }

  return v12;
}

- (BOOL)processDocumentUnderstandingReportWithJobContext:(id)a3 cancelBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SKGProcessorContext sharedContext];
  unsigned __int8 v8 = [v7 enableDocumentUnderstanding];

  if (v8)
  {
    id v10 = [[SKGJob alloc] initWithJobContext:v5];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100088228;
    v14[3] = &unk_1000DC5E0;
    id v15 = v6;
    unsigned int v11 = [(SKGJob *)v10 requestCSDocumentUnderstandingProgressReport:&stru_1000DC6F0 cancelBlock:v14];
    if (v11) {
      [v5 logFlag:27 message:@"completed reporting progress for DocumentUnderstanding pre-extraction"];
    }
    char v12 = v11 ^ 1;
  }
  else
  {
    AnalyticsSendEventLazy();
    char v12 = 0;
  }

  return v12;
}

- (BOOL)processTextWithJobContext:(id)a3 group:(id)a4 cancelBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (unsigned int (**)(id, const __CFString *))a5;
  [v8 startTextProcessingJob];
  if (![v8 doJournals]) {
    goto LABEL_6;
  }
  unsigned int v11 = +[SKGProcessorContext sharedContext];
  unsigned __int8 v12 = [v11 enableEventUpdater];

  if (v12) {
    goto LABEL_6;
  }
  id v13 = +[SKGProcessorContext sharedContext];
  unsigned int v14 = [v13 enableKeyphrases];

  id v15 = +[SKGProcessorContext sharedContext];
  unsigned int v16 = [v15 enableEmbeddings];

  if ((v16 & 1) == 0 && (v14 & 1) == 0)
  {
    [v8 finishedTextProcessingJob];
LABEL_6:
    char v17 = 1;
    goto LABEL_7;
  }
  if (v14)
  {
    int v19 = +[SKGProcessor sharedProcessor];
    unsigned __int8 v20 = [v19 loadKeyphraser];

    if (v20)
    {
      uint64_t v21 = 1;
      if (!v16) {
        goto LABEL_18;
      }
      goto LABEL_14;
    }
    if (v10[2](v10, @"tried loading keyphrase model"))
    {
LABEL_17:
      [v8 finishedTextProcessingJob];
      char v17 = 0;
      goto LABEL_7;
    }
  }
  uint64_t v21 = 0;
  if (!v16) {
    goto LABEL_18;
  }
LABEL_14:
  id v22 = +[SKGProcessor sharedProcessor];
  unsigned __int8 v23 = [v22 loadEmbedder];

  if ((v23 & 1) == 0)
  {
    if (v10[2](v10, @"tried loading embedding model")) {
      goto LABEL_17;
    }
LABEL_18:
    uint64_t v24 = 0;
    goto LABEL_19;
  }
  uint64_t v24 = 1;
LABEL_19:
  [v8 startJournals];
  id v27 = [v8 protectionClasses];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000886DC;
  v46[3] = &unk_1000DC3F8;
  id v47 = v8;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000886E8;
  v44[3] = &unk_1000DC718;
  uint64_t v45 = v10;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100088718;
  v41[3] = &unk_1000DC740;
  id v42 = v47;
  id v43 = v45;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100088760;
  v35[3] = &unk_1000DC768;
  char v39 = v21;
  char v40 = v24;
  void v35[4] = self;
  id v36 = v42;
  id v38 = v43;
  id v37 = v9;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100088E44;
  v32[3] = &unk_1000DC790;
  id v25 = v36;
  id v33 = v25;
  id v34 = v38;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100088EAC;
  v30[3] = &unk_1000DAB68;
  unsigned int v31 = v34;
  unsigned int v26 = [(SpotlightKnowledge *)self processCSJournalsWithGroup:v37 protectionClasses:v27 includeEmbeddings:v24 includeKeyphrases:v21 shouldRemove:1 readerNextPathBlock:v46 deletedReferencesBlock:v44 processedPathBlock:v41 processedItemsBlock:v35 errorLogBlock:v32 cancelBlock:v30];

  [v25 finishedJournals];
  if (v26) {
    [v25 logFlag:23 message:@"text processing all done"];
  }
  char v17 = v26 ^ 1;
  [v25 finishedTextProcessingJob];
LABEL_7:

  return v17;
}

- (BOOL)processPeopleWithGroup:(id)a3 cancelBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SpotlightKnowledge *)self spotlightContext];
  [v8 startPeopleIndexingJob];
  unsigned __int8 v9 = [v8 doArchiving];
  if (v9) {
    goto LABEL_3;
  }
  [v8 startPeopleArchives];
  unsigned __int8 v23 = [v8 protectionClasses];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100089424;
  v49[3] = &unk_1000DC7B8;
  v49[4] = self;
  id v51 = v7;
  id v50 = v8;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100089494;
  v45[3] = &unk_1000DC448;
  v45[4] = self;
  id v46 = v6;
  id v48 = v51;
  id v47 = v50;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100089534;
  v41[3] = &unk_1000DC7E0;
  void v41[4] = self;
  id v44 = v48;
  id v42 = v47;
  id v43 = v46;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100089B9C;
  v38[3] = &unk_1000DC790;
  id v11 = v7;
  id v12 = v6;
  id v13 = v10;
  id v14 = v42;
  id v39 = v14;
  id v40 = v44;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100089C04;
  v36[3] = &unk_1000DAB68;
  id v37 = v40;
  BOOL v15 = 1;
  unsigned int v16 = [(SpotlightKnowledge *)self processCSArchivesWithGroup:v43 protectionClasses:v23 shouldRemove:1 archiverNextPathBlock:v49 processedPathBlock:v45 processedItemsBlock:v41 errorLogBlock:v38 cancelBlock:v36];

  char v17 = v14;
  id v10 = v13;
  id v6 = v12;
  id v7 = v11;
  [v17 finishedPeopleArchives];

  if (v16)
  {
LABEL_3:
    [v8 startPeopleQueries];
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    char v35 = 0;
    id v18 = [[SKGJob alloc] initWithJobContext:v8];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100089C14;
    v30[3] = &unk_1000DC808;
    void v30[4] = self;
    id v32 = v7;
    id v31 = v8;
    id v33 = v34;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100089D28;
    v28[3] = &unk_1000DC5B8;
    id v29 = v31;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100089DD8;
    v26[3] = &unk_1000DC5B8;
    id v19 = v29;
    id v27 = v19;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100089E88;
    v24[3] = &unk_1000DC5E0;
    id v20 = v32;
    id v25 = v20;
    unsigned int v21 = [(SKGJob *)v18 requestCSProcessingWithProcessedItemBlock:v30 batchArchivedBlock:v28 batchUpdatedBlock:v26 cancelBlock:v24 errorBlock:&stru_1000DC848];
    if (![(SpotlightKnowledge *)self flushGraphWithGroup:v6 cancelBlock:v20])
    {
      [v19 logError:4 message:@"graph unavailable"];
      unsigned int v21 = 0;
    }
    [v19 finishedPeopleQueries];

    _Block_object_dispose(v34, 8);
    if (v21)
    {
      [v19 logFlag:25 message:@"people indexing all done"];
      BOOL v15 = 0;
    }
    else
    {
      BOOL v15 = 1;
    }
  }
  [v8 finishedPeopleIndexingJob];

  return v15;
}

- (BOOL)processGraphWithGroup:(id)a3 cancelBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SpotlightKnowledge *)self spotlightGraphAvailable])
  {
    id v8 = [(SpotlightKnowledge *)self spotlightContext];
    [v8 startGraphAnalysisJob];
    if ([(SpotlightKnowledge *)self graphNeedsAnalysis])
    {
      id v10 = +[SKGProcessorContext sharedContext];
      unsigned int v11 = [v10 enableMegadomePeople];

      if (v11)
      {
        [v8 startMegadomeIndexing];
        if ([(SpotlightKnowledge *)self removeGraphEntitiesWithCancelBlock:v7])
        {
          uint64_t v27 = 0;
          unsigned int v28 = &v27;
          uint64_t v29 = 0x2020000000;
          char v30 = 1;
          id v13 = +[SKGProcessor sharedProcessor];
          id v19 = _NSConcreteStackBlock;
          uint64_t v20 = 3221225472;
          unsigned int v21 = sub_10008A148;
          id v22 = &unk_1000DC870;
          unsigned __int8 v23 = self;
          id v24 = v6;
          id v25 = v7;
          unsigned int v26 = &v27;
          [v13 generateMegadomePeopleUsingBlock:&v19 cancelBlock:v25];

          LODWORD(v13) = *((unsigned __int8 *)v28 + 24);
          _Block_object_dispose(&v27, 8);
          objc_msgSend(v8, "finishedMegadomeIndexing", v19, v20, v21, v22, v23);
          if (!v13)
          {
LABEL_14:
            BOOL v14 = 1;
            goto LABEL_15;
          }
        }
        else
        {
          [v8 finishedMegadomeIndexing];
        }
      }
      [v8 startGraphAnalysis];
      unsigned int v16 = [(SpotlightKnowledge *)self analyzeGraphWithCancelBlock:v7];
      [v8 finishedGraphAnalysis];
      if (!v16) {
        goto LABEL_14;
      }
      [v8 startGraphScoring];
      unsigned int v17 = [(SpotlightKnowledge *)self scoreGraphWithCancelBlock:v7];
      [v8 finishedGraphScoring];
      if (!v17) {
        goto LABEL_14;
      }
      [(SpotlightKnowledge *)self updateSpotlightContactsWithJobContext:v8 group:v6 cancelBlock:v7];
    }
    else
    {
      [(SpotlightKnowledge *)self updateSpotlightContactsWithJobContext:v8 group:v6 cancelBlock:v7];
    }
    [v8 logFlag:26 message:@"completed graph analysis"];
    BOOL v14 = 0;
LABEL_15:
    [v8 finishedGraphAnalysisJob];

    goto LABEL_16;
  }
  BOOL v14 = 0;
LABEL_16:

  return v14;
}

- (void)sendAnalytics
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  unsigned int v21 = [(SpotlightKnowledge *)self spotlightContext];
  id v4 = [v21 feedback];
  id v5 = [v4 feedbackData];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v10);
        id v12 = [v6 objectForKeyedSubscript:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (([v11 hasPrefix:@"should"] & 1) != 0
            || ([v11 hasPrefix:@"did"] & 1) != 0
            || [v11 hasPrefix:@"invalid"])
          {
            id v13 = [v6 objectForKeyedSubscript:v11];
            unsigned __int8 v14 = [v13 BOOLValue];

            xpc_dictionary_set_BOOL(empty, (const char *)[v11 UTF8String], v14);
          }
          else if (([v11 hasPrefix:@"num"] & 1) != 0 {
                 || ([v11 hasSuffix:@"Size"] & 1) != 0
          }
                 || [v11 hasSuffix:@"Count"])
          {
            BOOL v15 = [v6 objectForKeyedSubscript:v11];
            int64_t v16 = (int)[v15 intValue];

            xpc_dictionary_set_int64(empty, (const char *)[v11 UTF8String], v16);
          }
          else if ([v11 hasSuffix:@"time"])
          {
            unsigned int v17 = [v6 objectForKeyedSubscript:v11];
            [v17 doubleValue];
            double v19 = v18;

            xpc_dictionary_set_double(empty, (const char *)[v11 UTF8String], v19);
          }
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v20 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      id v8 = v20;
    }
    while (v20);
  }

  analytics_send_event();
}

- (id)timerWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = [SKGTimer alloc];
  id v5 = [(SKGTimer *)v4 initWithTimeIntervalSinceNow:qword_1000F91F8 tolerance:v3 queue:5.0 block:2.0];

  return v5;
}

- (void)runWithQueue:(id)a3 group:(id)a4 progressBlock:(id)a5 checkpointBlock:(id)a6 completeBlock:(id)a7 cancelBlock:(id)a8 deferBlock:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008A694;
  block[3] = &unk_1000DC8E8;
  block[4] = self;
  id v26 = v15;
  id v27 = a8;
  id v28 = a9;
  id v29 = v18;
  id v30 = v16;
  id v31 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v18;
  id v22 = v28;
  id v23 = v27;
  long long v24 = v15;
  dispatch_group_async(v24, (dispatch_queue_t)a3, block);
}

- (void)runWithGroup:(id)a3 delegate:(id)a4
{
  id v5 = a3;
  id v6 = [(SpotlightKnowledge *)self spotlightContext];
  [v6 start];
  if ([v6 shouldReportProgress])
  {
    [(SpotlightKnowledge *)self processEmbeddingsReportWithJobContext:v6 group:v5 progressBlock:0 checkpointBlock:0 cancelBlock:&stru_1000DC908];
    [(SpotlightKnowledge *)self processSuggestedEventsReportWithJobContext:v6 cancelBlock:&stru_1000DC908];
    [(SpotlightKnowledge *)self processDocumentUnderstandingReportWithJobContext:v6 cancelBlock:&stru_1000DC908];
  }
  if ([v6 shouldProcessText]) {
    [(SpotlightKnowledge *)self processTextWithJobContext:v6 group:v5 cancelBlock:&stru_1000DC908];
  }
  if ([v6 shouldProcessUpdates]) {
    [(SpotlightKnowledge *)self processUpdatesWithJobContext:v6 group:v5 cancelBlock:&stru_1000DC908];
  }
  if ((([v6 shouldIndexPeople] & 1) != 0
     || [v6 shouldAnalyzeGraph])
    && [(SpotlightKnowledge *)self loadGraphWithGroup:v5 cancelBlock:&stru_1000DC908])
  {
    if ([v6 shouldIndexPeople]) {
      [(SpotlightKnowledge *)self processPeopleWithGroup:v5 cancelBlock:&stru_1000DC908];
    }
    if ([v6 shouldAnalyzeGraph]) {
      [(SpotlightKnowledge *)self processGraphWithGroup:v5 cancelBlock:&stru_1000DC908];
    }
    [(SpotlightKnowledge *)self unloadGraphWithGroup:v5 cancelBlock:&stru_1000DC908];
  }
  [v6 end];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: done", v7, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingGraphQueue, 0);
  objc_storeStrong((id *)&self->_spotlightContext, 0);

  objc_storeStrong((id *)&self->_spotlightGraph, 0);
}

@end