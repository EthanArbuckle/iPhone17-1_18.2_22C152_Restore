@interface SKGKnowledgeFeedback
- (BOOL)generateReportUsingBlock:(id)a3;
- (BOOL)hasCurrentFlagWithName:(id)a3;
- (BOOL)hasError:(int64_t)a3;
- (BOOL)hasEvent:(int64_t)a3;
- (BOOL)hasFlag:(int64_t)a3;
- (BOOL)modeWithKey:(id)a3;
- (NSDate)documentUnderstandingGenStartTime;
- (NSDate)embeddingGenStartTime;
- (NSDate)suggestedEventsGenStartTime;
- (NSDictionary)feedbackData;
- (NSDictionary)feedbackDefaults;
- (SKGKnowledgeFeedback)init;
- (SKGKnowledgeFeedback)initWithVersionName:(id)a3;
- (double)elapsedTime;
- (double)timeWithKey:(id)a3;
- (id)defaultPropertiesForVersionName:(id)a3;
- (id)defaultValueWithKey:(id)a3;
- (id)defaultValueWithKey:(id)a3 versionName:(id)a4;
- (id)defaults;
- (id)getDefaultWithIdentifier:(id)a3 protectionClass:(id)a4 key:(id)a5;
- (id)recoveryTimesWithKey:(id)a3;
- (id)versionName;
- (int64_t)archiveGeneratedCount;
- (int64_t)archiveItemExtractedCount;
- (int64_t)archiveProcessedCount;
- (int64_t)currentArchiveCount;
- (int64_t)currentArchiveSize;
- (int64_t)currentDeletesCount;
- (int64_t)currentGraphSize;
- (int64_t)currentJournalCount;
- (int64_t)currentJournalSize;
- (int64_t)getCurrentExtractedArchiveItemCount;
- (int64_t)getCurrentExtractedJournalItemCount;
- (int64_t)getCurrentExtractedQueryItemCount;
- (int64_t)getGenCompleteDayString:(id)a3 forBundle:(id)a4;
- (int64_t)graphVersion;
- (int64_t)journalItemExtractedCount;
- (int64_t)journalProcessedCount;
- (int64_t)queryItemArchivedCount;
- (int64_t)queryItemExtractedCount;
- (int64_t)queryItemUpdatedCount;
- (unint64_t)getReindexCountForTask:(id)a3;
- (unint64_t)indexWithKey:(id)a3;
- (unint64_t)itemCountWithKey:(id)a3;
- (void)clear;
- (void)clearDefaultWithIdentifier:(id)a3 protectionClass:(id)a4 key:(id)a5;
- (void)clearDocumentUnderstandingGenCompleteDay;
- (void)clearEmbeddingDefaults;
- (void)clearEmbeddingGenCompleteDay;
- (void)clearSuggestedEventsGenCompleteDay;
- (void)commonInitWithVersionName:(id)a3 graphVersion:(id)a4 stats:(id)a5;
- (void)getQueryTimeWithIdentifier:(id)a3 protectionClass:(id)a4 startTime:(double *)a5 endTime:(double *)a6 processingEndTime:(double *)a7;
- (void)logArchiveCount:(unint64_t)a3;
- (void)logArchiveSize:(unint64_t)a3;
- (void)logArchiveWithIdentifier:(id)a3 protectionClass:(id)a4;
- (void)logArchivedQueryItemCount:(unint64_t)a3 bundleIdentifier:(id)a4;
- (void)logDefaultWithIdentifier:(id)a3 protectionClass:(id)a4 key:(id)a5 value:(id)a6;
- (void)logDeletesCount:(unint64_t)a3;
- (void)logEnd;
- (void)logError:(int64_t)a3 message:(id)a4;
- (void)logEvent:(int64_t)a3 message:(id)a4;
- (void)logExtractedArchiveItemCount:(unint64_t)a3 bundleIdentifier:(id)a4;
- (void)logExtractedJournalItemCount:(unint64_t)a3 bundleIdentifier:(id)a4;
- (void)logExtractedQueryItemCount:(unint64_t)a3 bundleIdentifier:(id)a4;
- (void)logFlag:(int64_t)a3 message:(id)a4;
- (void)logGraphSize:(unint64_t)a3;
- (void)logGraphVersion:(int64_t)a3;
- (void)logJournalCount:(unint64_t)a3;
- (void)logJournalSize:(unint64_t)a3;
- (void)logMarkedPurgeableAtPath:(id)a3;
- (void)logProcessedArchiveWithName:(id)a3;
- (void)logProcessedJournalWithName:(id)a3;
- (void)logQueryTimeWithIdentifier:(id)a3 protectionClass:(id)a4 startTime:(double)a5 doneProcessing:(BOOL)a6;
- (void)logSignpost:(int64_t)a3 message:(id)a4;
- (void)logStart;
- (void)logUpdateTaskReindexCount:(unint64_t)a3 taskName:(id)a4;
- (void)logUpdatedQueryItemCount:(unint64_t)a3 bundleIdentifier:(id)a4;
- (void)removeDefaults;
- (void)removeKey:(id)a3;
- (void)setDefaultWithKey:(id)a3 value:(id)a4;
- (void)setGenCompleteDayString:(id)a3 forBundle:(id)a4 day:(int64_t)a5;
- (void)setIndexWithKey:(id)a3 value:(unint64_t)a4;
- (void)setModeWithKey:(id)a3 value:(BOOL)a4;
- (void)setTimeWithKey:(id)a3 value:(double)a4;
- (void)updateDefaults;
- (void)updateFeedback;
- (void)updateItemCountWithKey:(id)a3;
@end

@implementation SKGKnowledgeFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentUnderstandingGenStartTime, 0);
  objc_storeStrong((id *)&self->_suggestedEventsGenStartTime, 0);
  objc_storeStrong((id *)&self->_embeddingGenStartTime, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_signposts, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_currentDateKey, 0);
  objc_storeStrong((id *)&self->_bundles, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);

  objc_storeStrong((id *)&self->_versionName, 0);
}

- (void)commonInitWithVersionName:(id)a3 graphVersion:(id)a4 stats:(id)a5
{
  id v61 = a3;
  id v60 = a4;
  id v9 = a5;
  objc_storeStrong((id *)&self->_versionName, a3);
  uint64_t v10 = +[NSTimeZone timeZoneWithName:@"GMT"];
  v11 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
  currentCalendar = self->_currentCalendar;
  self->_currentCalendar = v11;

  v59 = (void *)v10;
  [(NSCalendar *)self->_currentCalendar setTimeZone:v10];
  id v13 = objc_alloc_init((Class)NSDateComponents);
  v14 = self->_currentCalendar;
  v15 = +[NSDate date];
  objc_msgSend(v13, "setDay:", -[NSCalendar component:fromDate:](v14, "component:fromDate:", 16, v15));

  v16 = self->_currentCalendar;
  v17 = +[NSDate date];
  objc_msgSend(v13, "setMonth:", -[NSCalendar component:fromDate:](v16, "component:fromDate:", 8, v17));

  v18 = self->_currentCalendar;
  v19 = +[NSDate date];
  objc_msgSend(v13, "setYear:", -[NSCalendar component:fromDate:](v18, "component:fromDate:", 4, v19));

  v58 = v13;
  v20 = [(NSCalendar *)self->_currentCalendar dateFromComponents:v13];
  currentDate = self->_currentDate;
  self->_currentDate = v20;

  id v22 = objc_alloc_init((Class)NSDateFormatter);
  [v22 setCalendar:self->_currentCalendar];
  [v22 setDateStyle:1];
  v57 = v22;
  v23 = [v22 stringFromDate:self->_currentDate];
  currentDateKey = self->_currentDateKey;
  self->_currentDateKey = v23;

  *(_OWORD *)&self->_numArchivesGenerated = 0u;
  *(_OWORD *)&self->_numJournalsProcessed = 0u;
  *(_OWORD *)&self->_numArchiveItemsExtracted = 0u;
  *(_OWORD *)&self->_numQueryItemsArchived = 0u;
  *(_OWORD *)&self->_currentDeletesCount = 0u;
  *(_OWORD *)&self->_currentArchiveCount = 0u;
  *(_OWORD *)&self->_currentArchiveSize = 0u;
  *(_OWORD *)&self->_startTime = 0u;
  v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  feedback = self->_feedback;
  self->_feedback = v25;

  v27 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  defaults = self->_defaults;
  self->_defaults = v27;

  v29 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  bundles = self->_bundles;
  self->_bundles = v29;

  v31 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  sessions = self->_sessions;
  self->_sessions = v31;

  v33 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  signposts = self->_signposts;
  self->_signposts = v33;

  v35 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  stats = self->_stats;
  self->_stats = v35;

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v37 = v9;
  id v38 = [v37 countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v63;
    do
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v63 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        if ([v42 hasPrefix:self->_currentDateKey])
        {
          v43 = [v42 componentsSeparatedByString:@":"];
          if ([v43 count] == (id)3)
          {
            v44 = [v43 objectAtIndex:1];
            v45 = [v43 lastObject];
            uint64_t v46 = (int)[v45 intValue];

            v47 = self->_stats;
            v48 = +[NSNumber numberWithInteger:v46];
            [(NSMutableDictionary *)v47 setObject:v48 forKey:v44];
          }
        }
      }
      id v39 = [v37 countByEnumeratingWithState:&v62 objects:v66 count:16];
    }
    while (v39);
  }

  v49 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:@"currentPid"];

  if (!v49) {
    [(NSMutableDictionary *)self->_stats setObject:&off_1000E61F8 forKeyedSubscript:@"currentPid"];
  }
  v50 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:@"currentPid"];
  self->_currentPid = (int)([v50 intValue] + 1);

  v51 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  errors = self->_errors;
  self->_errors = v51;

  v53 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  events = self->_events;
  self->_events = v53;

  v55 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  flags = self->_flags;
  self->_flags = v55;

  self->_graphVersion = (int64_t)[v60 integerValue];
}

- (SKGKnowledgeFeedback)init
{
  v10.receiver = self;
  v10.super_class = (Class)SKGKnowledgeFeedback;
  v2 = [(SKGKnowledgeFeedback *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(SKGKnowledgeFeedback *)v2 defaultValueWithKey:@"stats" versionName:@"SpotlightKnowledgeV2"];
    v5 = [(SKGKnowledgeFeedback *)v3 defaultValueWithKey:@"graphVersionV2" versionName:@"SpotlightKnowledgeV2"];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      v8 = +[SKGProcessorContext sharedContext];
      +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 graphVersion]);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    [(SKGKnowledgeFeedback *)v3 commonInitWithVersionName:@"SpotlightKnowledgeV2" graphVersion:v7 stats:v4];
    [(SKGKnowledgeFeedback *)v3 updateDefaults];
  }
  return v3;
}

- (id)defaultValueWithKey:(id)a3 versionName:(id)a4
{
  id v6 = a3;
  id v7 = [(SKGKnowledgeFeedback *)self defaultPropertiesForVersionName:a4];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  v8 = [v7 objectForKey:v6];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);

  return v8;
}

- (void)updateDefaults
{
  v3 = [(SKGKnowledgeFeedback *)self versionName];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  feedback = self->_feedback;
  v5 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent() - self->_startTime];
  [(NSMutableDictionary *)feedback setObject:v5 forKey:@"timeSinceStart"];

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v6 = self->_events;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v109 objects:v117 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v110;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v110 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        if ([v11 intValue] != 6 && objc_msgSend(v11, "intValue") != 5)
        {
          if (self->_numQueryItemsExtracted)
          {
            v12 = +[NSString stringWithFormat:@"[%@]queryItemExtractedCount", v11];
            unint64_t numQueryItemsExtracted = self->_numQueryItemsExtracted;
            v14 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v12];

            if (v14)
            {
              v15 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v12];
              numQueryItemsExtracted += (int)[v15 intValue];
            }
            stats = self->_stats;
            v17 = +[NSNumber numberWithUnsignedInteger:numQueryItemsExtracted];
            [(NSMutableDictionary *)stats setObject:v17 forKey:v12];
          }
          if (self->_numQueryItemsUpdated)
          {
            v18 = +[NSString stringWithFormat:@"[%@]queryItemUpdatedCount", v11];
            unint64_t numQueryItemsUpdated = self->_numQueryItemsUpdated;
            v20 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v18];

            if (v20)
            {
              v21 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v18];
              numQueryItemsUpdated += (int)[v21 intValue];
            }
            id v22 = self->_stats;
            v23 = +[NSNumber numberWithUnsignedInteger:numQueryItemsUpdated];
            [(NSMutableDictionary *)v22 setObject:v23 forKey:v18];
          }
          if (self->_numQueryItemsArchived)
          {
            v24 = +[NSString stringWithFormat:@"[%@]queryItemArchivedCount", v11];
            unint64_t numQueryItemsArchived = self->_numQueryItemsArchived;
            v26 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v24];

            if (v26)
            {
              v27 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v24];
              numQueryItemsArchived += (int)[v27 intValue];
            }
            v28 = self->_stats;
            v29 = +[NSNumber numberWithUnsignedInteger:numQueryItemsArchived];
            [(NSMutableDictionary *)v28 setObject:v29 forKey:v24];
          }
          if (self->_numArchiveItemsExtracted)
          {
            v30 = +[NSString stringWithFormat:@"[%@]archiveItemExtractedCount", v11];
            unint64_t numArchiveItemsExtracted = self->_numArchiveItemsExtracted;
            v32 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v30];

            if (v32)
            {
              v33 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v30];
              numArchiveItemsExtracted += (int)[v33 intValue];
            }
            v34 = self->_stats;
            v35 = +[NSNumber numberWithUnsignedInteger:numArchiveItemsExtracted];
            [(NSMutableDictionary *)v34 setObject:v35 forKey:v30];
          }
          if (self->_numJournalItemsExtracted)
          {
            v36 = +[NSString stringWithFormat:@"[%@]journalItemExtractedCount", v11];
            unint64_t numJournalItemsExtracted = self->_numJournalItemsExtracted;
            id v38 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v36];

            if (v38)
            {
              id v39 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v36];
              numJournalItemsExtracted += (int)[v39 intValue];
            }
            uint64_t v40 = self->_stats;
            v41 = +[NSNumber numberWithUnsignedInteger:numJournalItemsExtracted];
            [(NSMutableDictionary *)v40 setObject:v41 forKey:v36];
          }
          if (self->_numJournalsProcessed)
          {
            v42 = +[NSString stringWithFormat:@"[%@]journalProcessedCount", v11];
            unint64_t numJournalsProcessed = self->_numJournalsProcessed;
            v44 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v42];

            if (v44)
            {
              v45 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v42];
              numJournalsProcessed += (int)[v45 intValue];
            }
            uint64_t v46 = self->_stats;
            v47 = +[NSNumber numberWithUnsignedInteger:numJournalsProcessed];
            [(NSMutableDictionary *)v46 setObject:v47 forKey:v42];
          }
          if (self->_numArchivesProcessed)
          {
            v48 = +[NSString stringWithFormat:@"[%@]archiveProcessedCount", v11];
            unint64_t numArchivesProcessed = self->_numArchivesProcessed;
            v50 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v48];

            if (v50)
            {
              v51 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v48];
              numArchivesProcessed += (int)[v51 intValue];
            }
            v52 = self->_stats;
            v53 = +[NSNumber numberWithUnsignedInteger:numArchivesProcessed];
            [(NSMutableDictionary *)v52 setObject:v53 forKey:v48];
          }
        }
      }
      id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v109 objects:v117 count:16];
    }
    while (v8);
  }

  v54 = self->_stats;
  v55 = +[NSNumber numberWithInteger:self->_currentPid];
  [(NSMutableDictionary *)v54 setObject:v55 forKey:@"currentPid"];

  if ([(NSMutableDictionary *)self->_stats count])
  {
    v99 = v3;
    id v56 = objc_alloc_init((Class)NSMutableArray);
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    obj = self->_stats;
    id v57 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v105 objects:v116 count:16];
    if (v57)
    {
      id v58 = v57;
      uint64_t v59 = *(void *)v106;
      do
      {
        for (j = 0; j != v58; j = (char *)j + 1)
        {
          if (*(void *)v106 != v59) {
            objc_enumerationMutation(obj);
          }
          uint64_t v61 = *(void *)(*((void *)&v105 + 1) + 8 * (void)j);
          currentDateKey = self->_currentDateKey;
          long long v63 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v61];
          long long v64 = +[NSString stringWithFormat:@"%@:%@:%@", currentDateKey, v61, v63];

          [v56 addObject:v64];
        }
        id v58 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v105 objects:v116 count:16];
      }
      while (v58);
    }

    v3 = v99;
    long long v65 = v56;
  }
  else
  {
    long long v65 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  if (_os_feature_enabled_impl()
    && (+[SPEmbeddingModel sharedInstance],
        v66 = objc_claimAutoreleasedReturnValue(),
        unsigned int v67 = [v66 deviceCanGenerateEmbeddings],
        v66,
        v67))
  {
    v68 = objc_opt_new();
    v69 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:@"embeddingModelVersion"];
    v70 = v69;
    if (v69
      && (unsigned int v71 = [v69 unsignedIntValue],
          +[SPEmbeddingModel version] == (id)v71))
    {
      v72 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:@"embeddingGenStartTime"];
      v73 = [v68 dateFromString:v72];
      if (!v73)
      {
        v73 = +[NSDate now];
        v74 = [v68 stringFromDate:v73];
        [(SKGKnowledgeFeedback *)self setDefaultWithKey:@"embeddingGenStartTime" value:v74];

        [(SKGKnowledgeFeedback *)self clearEmbeddingGenCompleteDay];
      }

      v75 = v70;
    }
    else
    {
      v75 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[SPEmbeddingModel version]);

      [(SKGKnowledgeFeedback *)self setDefaultWithKey:@"embeddingModelVersion" value:v75];
      v76 = sub_10000BE40();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v115 = v75;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "SKG: updated embedding model version to %@", buf, 0xCu);
      }

      v73 = +[NSDate now];
      v77 = [v68 stringFromDate:v73];
      [(SKGKnowledgeFeedback *)self setDefaultWithKey:@"embeddingGenStartTime" value:v77];

      [(SKGKnowledgeFeedback *)self clearEmbeddingGenCompleteDay];
    }
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
    embeddingGenStartTime = self->_embeddingGenStartTime;
    self->_embeddingGenStartTime = v73;

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  }
  else
  {
    [(SKGKnowledgeFeedback *)self clearEmbeddingDefaults];
  }
  if (_os_feature_enabled_impl())
  {
    v79 = objc_opt_new();
    v80 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:@"suggestedEventsGenStartTime"];
    v81 = [v79 dateFromString:v80];
    if (!v81)
    {
      v81 = +[NSDate now];
      v82 = [v79 stringFromDate:v81];
      [(SKGKnowledgeFeedback *)self setDefaultWithKey:@"suggestedEventsGenStartTime" value:v82];

      [(SKGKnowledgeFeedback *)self clearSuggestedEventsGenCompleteDay];
    }
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
    suggestedEventsGenStartTime = self->_suggestedEventsGenStartTime;
    self->_suggestedEventsGenStartTime = v81;

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  }
  if (_os_feature_enabled_impl())
  {
    v84 = objc_opt_new();
    v85 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:@"documentUnderstandingGenStartTime"];
    v86 = [v84 dateFromString:v85];
    if (!v86)
    {
      v86 = +[NSDate now];
      v87 = [v84 stringFromDate:v86];
      [(SKGKnowledgeFeedback *)self setDefaultWithKey:@"documentUnderstandingGenStartTime" value:v87];

      [(SKGKnowledgeFeedback *)self clearDocumentUnderstandingGenCompleteDay];
    }
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
    documentUnderstandingGenStartTime = self->_documentUnderstandingGenStartTime;
    self->_documentUnderstandingGenStartTime = v86;

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  }
  if (v65) {
    [(SKGKnowledgeFeedback *)self setDefaultWithKey:@"stats" value:v65];
  }
  v89 = +[NSNumber numberWithInteger:self->_graphVersion];
  [(SKGKnowledgeFeedback *)self setDefaultWithKey:@"graphVersionV2" value:v89];

  v90 = [(SKGKnowledgeFeedback *)self defaultPropertiesForVersionName:v3];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  [(NSMutableDictionary *)self->_defaults removeAllObjects];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v91 = v90;
  id v92 = [v91 countByEnumeratingWithState:&v101 objects:v113 count:16];
  if (v92)
  {
    id v93 = v92;
    uint64_t v94 = *(void *)v102;
    do
    {
      for (k = 0; k != v93; k = (char *)k + 1)
      {
        if (*(void *)v102 != v94) {
          objc_enumerationMutation(v91);
        }
        uint64_t v96 = *(void *)(*((void *)&v101 + 1) + 8 * (void)k);
        defaults = self->_defaults;
        v98 = [v91 objectForKeyedSubscript:v96];
        [(NSMutableDictionary *)defaults setObject:v98 forKey:v96];
      }
      id v93 = [v91 countByEnumeratingWithState:&v101 objects:v113 count:16];
    }
    while (v93);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)setDefaultWithKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = [(SKGKnowledgeFeedback *)self versionName];
  id v8 = -[SKGKnowledgeFeedback defaultPropertiesForVersionName:](self, "defaultPropertiesForVersionName:");
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  uint64_t v9 = [(SKGKnowledgeFeedback *)self defaults];
  if (v8) {
    id v10 = [v8 mutableCopy];
  }
  else {
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v11 = v10;
  [v10 setObject:v6 forKey:v7];

  [v9 setObject:v11 forKey:v12];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (id)defaultPropertiesForVersionName:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  v5 = [(SKGKnowledgeFeedback *)self defaults];
  id v6 = [v5 dictionaryRepresentation];
  id v7 = [v6 objectForKey:v4];

  if (!v7)
  {
    [v5 setObject:&off_1000E6E50 forKey:v4];
    id v8 = [v5 dictionaryRepresentation];
    id v7 = [v8 objectForKey:v4];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);

  return v7;
}

- (id)defaults
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.spotlightknowledge"];

  return v2;
}

- (id)versionName
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  id v3 = [(NSString *)self->_versionName copy];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);

  return v3;
}

- (void)logSignpost:(int64_t)a3 message:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  id v7 = sub_10000BE94();
  id v8 = v7;
  if ((unint64_t)a3 <= 0x19 && ((1 << a3) & 0x2AAAA02) != 0)
  {
    uint64_t v9 = (char *)os_signpost_id_make_with_pointer(v7, self);
    id v10 = +[NSNumber numberWithUnsignedLongLong:v9];
    [(NSMutableDictionary *)self->_signposts setObject:v10 forKeyedSubscript:v6];

    v11 = v8;
    if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
    id v12 = v11;
    if (!os_signpost_enabled(v11)) {
      goto LABEL_7;
    }
    int v20 = 138412290;
    id v21 = v6;
    id v13 = "SKG start";
    v14 = v12;
    os_signpost_type_t v15 = OS_SIGNPOST_INTERVAL_BEGIN;
    goto LABEL_6;
  }
  v16 = [(NSMutableDictionary *)self->_signposts objectForKeyedSubscript:v6];

  if (!v16) {
    goto LABEL_8;
  }
  v17 = [(NSMutableDictionary *)self->_signposts objectForKeyedSubscript:v6];
  uint64_t v9 = (char *)[v17 unsignedLongLongValue];

  v18 = v8;
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v19 = v18;
    if (os_signpost_enabled(v18))
    {
      int v20 = 138412290;
      id v21 = v6;
      id v13 = "SKG end";
      v14 = v19;
      os_signpost_type_t v15 = OS_SIGNPOST_INTERVAL_END;
LABEL_6:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, v15, (os_signpost_id_t)v9, v13, "%@", (uint8_t *)&v20, 0xCu);
    }
  }
LABEL_7:

LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (SKGKnowledgeFeedback)initWithVersionName:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKGKnowledgeFeedback;
  v5 = [(SKGKnowledgeFeedback *)&v13 init];
  id v6 = v5;
  if (v5)
  {
    id v7 = [(SKGKnowledgeFeedback *)v5 defaultValueWithKey:@"stats" versionName:v4];
    id v8 = [(SKGKnowledgeFeedback *)v6 defaultValueWithKey:@"graphVersionV2" versionName:v4];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      v11 = +[SKGProcessorContext sharedContext];
      +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v11 graphVersion]);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    [(SKGKnowledgeFeedback *)v6 commonInitWithVersionName:v4 graphVersion:v10 stats:v7];
    [(SKGKnowledgeFeedback *)v6 updateDefaults];
  }
  return v6;
}

- (void)clear
{
  if (qword_1000F90C0 != -1) {
    dispatch_once(&qword_1000F90C0, &stru_1000DB138);
  }
  id v3 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:@"graphVersionV2"];
  id v4 = v3;
  if (v3)
  {
    id v26 = v3;
  }
  else
  {
    v5 = +[SKGProcessorContext sharedContext];
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 graphVersion]);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(SKGKnowledgeFeedback *)self versionName];
  v25 = v27 = self;
  id v6 = -[SKGKnowledgeFeedback defaultPropertiesForVersionName:](self, "defaultPropertiesForVersionName:");
  id v7 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v34;
    id v12 = &qword_1000F9000;
    uint64_t v28 = *(void *)v34;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ([(id)v12[22] containsObject:v14])
        {
LABEL_22:
          id v15 = [v8 objectForKeyedSubscript:v14];
          [v7 setObject:v15 forKeyedSubscript:v14];
        }
        else
        {
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v15 = (id)qword_1000F90B8;
          id v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v16)
          {
            id v17 = v16;
            v18 = v7;
            v19 = v12;
            uint64_t v20 = *(void *)v30;
            while (2)
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v30 != v20) {
                  objc_enumerationMutation(v15);
                }
                if ([v14 hasPrefix:*(void *)(*((void *)&v29 + 1) + 8 * (void)j)])
                {

                  id v12 = v19;
                  id v7 = v18;
                  uint64_t v11 = v28;
                  goto LABEL_22;
                }
              }
              id v17 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
              if (v17) {
                continue;
              }
              break;
            }
            id v12 = v19;
            id v7 = v18;
            uint64_t v11 = v28;
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v10);
  }

  [(SKGKnowledgeFeedback *)v27 removeDefaults];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  [(SKGKnowledgeFeedback *)v27 commonInitWithVersionName:v25 graphVersion:v26 stats:&__NSArray0__struct];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  id v22 = [(SKGKnowledgeFeedback *)v27 defaultPropertiesForVersionName:v25];
  id v23 = [v22 mutableCopy];

  [v23 addEntriesFromDictionary:v7];
  v24 = [(SKGKnowledgeFeedback *)v27 defaults];
  [v24 setObject:v23 forKey:v25];

  [(SKGKnowledgeFeedback *)v27 updateDefaults];
}

- (int64_t)getGenCompleteDayString:(id)a3 forBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    id v8 = +[NSString stringWithFormat:@"%@#%@", v6, v7];
  }
  else
  {
    id v8 = v6;
  }
  id v9 = v8;
  id v10 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:v8];
  uint64_t v11 = v10;
  if (v10) {
    int64_t v12 = (int64_t)[v10 integerValue];
  }
  else {
    int64_t v12 = -1;
  }

  return v12;
}

- (void)setGenCompleteDayString:(id)a3 forBundle:(id)a4 day:(int64_t)a5
{
  id v12 = a3;
  id v8 = a4;
  if ([v8 length])
  {
    id v9 = +[NSString stringWithFormat:@"%@#%@", v12, v8];
  }
  else
  {
    id v9 = v12;
  }
  id v10 = v9;
  uint64_t v11 = +[NSNumber numberWithInteger:a5];
  [(SKGKnowledgeFeedback *)self setDefaultWithKey:v10 value:v11];
}

- (void)clearEmbeddingDefaults
{
  id v3 = [(SKGKnowledgeFeedback *)self versionName];
  id v4 = [(SKGKnowledgeFeedback *)self defaultPropertiesForVersionName:v3];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  v5 = [(SKGKnowledgeFeedback *)self defaults];
  id v6 = [v4 mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v12, "hasPrefix:", @"embeddingGenCompleteDay", (void)v13) & 1) != 0
          || [v12 isEqual:@"embeddingModelVersion"])
        {
          [v6 removeObjectForKey:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [v5 setObject:v6 forKey:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)clearEmbeddingGenCompleteDay
{
  id v3 = [(SKGKnowledgeFeedback *)self versionName];
  id v4 = [(SKGKnowledgeFeedback *)self defaultPropertiesForVersionName:v3];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  v5 = [(SKGKnowledgeFeedback *)self defaults];
  id v6 = [v4 mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasPrefix:", @"embeddingGenCompleteDay", (void)v13)) {
          [v6 removeObjectForKey:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [v5 setObject:v6 forKey:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)clearSuggestedEventsGenCompleteDay
{
  id v3 = [(SKGKnowledgeFeedback *)self versionName];
  id v4 = [(SKGKnowledgeFeedback *)self defaultPropertiesForVersionName:v3];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  v5 = [(SKGKnowledgeFeedback *)self defaults];
  id v6 = [v4 mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasPrefix:", @"suggestedEventsGenCompleteDay", (void)v13)) {
          [v6 removeObjectForKey:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [v5 setObject:v6 forKey:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)clearDocumentUnderstandingGenCompleteDay
{
  id v3 = [(SKGKnowledgeFeedback *)self versionName];
  id v4 = [(SKGKnowledgeFeedback *)self defaultPropertiesForVersionName:v3];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  v5 = [(SKGKnowledgeFeedback *)self defaults];
  id v6 = [v4 mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasPrefix:", @"documentUnderstandingGenCompleteDay", (void)v13)) {
          [v6 removeObjectForKey:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [v5 setObject:v6 forKey:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)updateFeedback
{
  id v25 = objc_alloc_init((Class)NSMutableDictionary);
  id v3 = +[NSNumber numberWithBool:[(SKGKnowledgeFeedback *)self hasEvent:6]];
  [v25 setObject:v3 forKey:@"shouldReset"];

  [v25 setObject:&__kCFBooleanFalse forKey:@"shouldRefresh"];
  id v4 = +[NSNumber numberWithBool:[(SKGKnowledgeFeedback *)self hasFlag:1]];
  [v25 setObject:v4 forKey:@"shouldIgnore"];

  v5 = +[NSNumber numberWithBool:[(SKGKnowledgeFeedback *)self hasEvent:1]];
  [v25 setObject:v5 forKey:@"shouldAnalyze"];

  id v6 = +[NSNumber numberWithBool:[(SKGKnowledgeFeedback *)self hasFlag:11]];
  [v25 setObject:v6 forKey:@"didReset"];

  [v25 setObject:&__kCFBooleanFalse forKey:@"didRefresh"];
  id v7 = +[NSNumber numberWithBool:[(SKGKnowledgeFeedback *)self hasFlag:10]];
  [v25 setObject:v7 forKey:@"didIgnore"];

  id v8 = +[NSNumber numberWithBool:[(SKGKnowledgeFeedback *)self hasFlag:0]];
  [v25 setObject:v8 forKey:@"didComplete"];

  id v9 = +[NSNumber numberWithBool:[(SKGKnowledgeFeedback *)self hasFlag:28]];
  [v25 setObject:v9 forKey:@"didExceedItems"];

  uint64_t v10 = +[NSNumber numberWithBool:[(SKGKnowledgeFeedback *)self hasFlag:17]];
  [v25 setObject:v10 forKey:@"didRunTooLong"];

  uint64_t v11 = +[NSNumber numberWithBool:[(SKGKnowledgeFeedback *)self hasFlag:18]];
  [v25 setObject:v11 forKey:@"invalidGraphVersion"];

  id v12 = +[NSNumber numberWithUnsignedInteger:[(SKGKnowledgeFeedback *)self hasFlag:9]];
  [v25 setObject:v12 forKey:@"numAnalysisRuns"];

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  long long v13 = +[NSNumber numberWithUnsignedInteger:self->_numPeopleGenerated];
  [v25 setObject:v13 forKey:@"numPeopleGenerated"];

  long long v14 = +[NSNumber numberWithUnsignedInteger:self->_numQueryItemsArchived];
  [v25 setObject:v14 forKey:@"numArchivedItems"];

  long long v15 = +[NSNumber numberWithUnsignedInteger:self->_numArchiveItemsExtracted + self->_numQueryItemsExtracted];
  [v25 setObject:v15 forKey:@"numItemsExtracted"];

  long long v16 = +[NSNumber numberWithUnsignedInteger:self->_numQueryItemsExtracted + self->_numJournalItemsExtracted];
  [v25 setObject:v16 forKey:@"numJournalItemsExtracted"];

  id v17 = +[NSNumber numberWithUnsignedInteger:[(NSMutableDictionary *)self->_bundles count]];
  [v25 setObject:v17 forKey:@"numBundlesExtracted"];

  [v25 setObject:&off_1000E61F8 forKey:@"timeSinceRefresh"];
  v18 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent() - self->_startTime];
  [v25 setObject:v18 forKey:@"timeSinceStart"];

  v19 = +[NSNumber numberWithUnsignedInteger:self->_currentGraphSize];
  [v25 setObject:v19 forKey:@"graphSize"];

  uint64_t v20 = +[NSNumber numberWithUnsignedInteger:self->_currentArchiveSize];
  [v25 setObject:v20 forKey:@"archiveSize"];

  id v21 = +[NSNumber numberWithUnsignedInteger:self->_currentJournalSize];
  [v25 setObject:v21 forKey:@"journalSize"];

  id v22 = +[NSNumber numberWithUnsignedInteger:self->_currentArchiveCount];
  [v25 setObject:v22 forKey:@"archiveCount"];

  id v23 = +[NSNumber numberWithUnsignedInteger:self->_currentJournalCount];
  [v25 setObject:v23 forKey:@"journalCount"];

  v24 = +[NSNumber numberWithUnsignedInteger:self->_currentDeletesCount];
  [v25 setObject:v24 forKey:@"deletesCount"];

  [(NSMutableDictionary *)self->_feedback removeAllObjects];
  [(NSMutableDictionary *)self->_feedback addEntriesFromDictionary:v25];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (NSDictionary)feedbackDefaults
{
  if ([(SKGKnowledgeFeedback *)self hasFlag:12])
  {
    id v3 = 0;
  }
  else
  {
    [(SKGKnowledgeFeedback *)self updateDefaults];
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
    id v3 = [(NSMutableDictionary *)self->_defaults copy];
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  }

  return (NSDictionary *)v3;
}

- (NSDictionary)feedbackData
{
  [(SKGKnowledgeFeedback *)self updateFeedback];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  id v3 = [(NSMutableDictionary *)self->_feedback copy];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);

  return (NSDictionary *)v3;
}

- (NSDate)embeddingGenStartTime
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  id v3 = [(NSDate *)self->_embeddingGenStartTime copy];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);

  return (NSDate *)v3;
}

- (NSDate)suggestedEventsGenStartTime
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  id v3 = [(NSDate *)self->_suggestedEventsGenStartTime copy];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);

  return (NSDate *)v3;
}

- (NSDate)documentUnderstandingGenStartTime
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  id v3 = [(NSDate *)self->_documentUnderstandingGenStartTime copy];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);

  return (NSDate *)v3;
}

- (int64_t)graphVersion
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  int64_t graphVersion = self->_graphVersion;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return graphVersion;
}

- (int64_t)currentGraphSize
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  unint64_t currentGraphSize = self->_currentGraphSize;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return currentGraphSize;
}

- (int64_t)currentArchiveSize
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  unint64_t currentArchiveSize = self->_currentArchiveSize;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return currentArchiveSize;
}

- (int64_t)currentJournalSize
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  unint64_t currentJournalSize = self->_currentJournalSize;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return currentJournalSize;
}

- (int64_t)currentArchiveCount
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  unint64_t currentArchiveCount = self->_currentArchiveCount;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return currentArchiveCount;
}

- (int64_t)currentJournalCount
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  unint64_t currentJournalCount = self->_currentJournalCount;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return currentJournalCount;
}

- (int64_t)currentDeletesCount
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  unint64_t currentDeletesCount = self->_currentDeletesCount;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return currentDeletesCount;
}

- (int64_t)queryItemExtractedCount
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  unint64_t numQueryItemsExtracted = self->_numQueryItemsExtracted;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return numQueryItemsExtracted;
}

- (int64_t)queryItemUpdatedCount
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  unint64_t numQueryItemsUpdated = self->_numQueryItemsUpdated;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return numQueryItemsUpdated;
}

- (int64_t)queryItemArchivedCount
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  unint64_t numQueryItemsArchived = self->_numQueryItemsArchived;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return numQueryItemsArchived;
}

- (int64_t)archiveItemExtractedCount
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  unint64_t numArchiveItemsExtracted = self->_numArchiveItemsExtracted;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return numArchiveItemsExtracted;
}

- (int64_t)journalItemExtractedCount
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  unint64_t numJournalItemsExtracted = self->_numJournalItemsExtracted;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return numJournalItemsExtracted;
}

- (int64_t)journalProcessedCount
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  unint64_t numJournalsProcessed = self->_numJournalsProcessed;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return numJournalsProcessed;
}

- (int64_t)archiveProcessedCount
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  unint64_t numArchivesProcessed = self->_numArchivesProcessed;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return numArchivesProcessed;
}

- (int64_t)archiveGeneratedCount
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  unint64_t numArchivesGenerated = self->_numArchivesGenerated;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return numArchivesGenerated;
}

- (double)elapsedTime
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  double v3 = CFAbsoluteTimeGetCurrent() - self->_startTime;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return v3;
}

- (void)logStart
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  self->_startTime = CFAbsoluteTimeGetCurrent();

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)logEnd
{
  [(SKGKnowledgeFeedback *)self updateDefaults];
  double v3 = [(SKGKnowledgeFeedback *)self versionName];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  if (self->_sessions)
  {
    uint64_t v40 = v3;
    id v41 = objc_alloc_init((Class)NSMutableArray);
    id v4 = [(NSMutableDictionary *)self->_sessions allKeys];
    v5 = [v4 sortedArrayUsingSelector:"compare:"];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v43 = *(void *)v49;
      CFStringRef v9 = @"start";
      CFStringRef v10 = @"end";
      do
      {
        uint64_t v11 = 0;
        id v42 = v8;
        do
        {
          if (*(void *)v49 != v43) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v11);
          long long v13 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v12];
          long long v14 = [v13 objectForKey:v9];

          long long v15 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v12];
          long long v16 = [v15 objectForKey:v10];

          [v14 doubleValue];
          CFDateRef v18 = CFDateCreate(kCFAllocatorDefault, v17);
          unsigned int v19 = [v12 intValue] - 1;
          if (v19 <= 3 && v18 != 0 && v16 != 0)
          {
            uint64_t v22 = (uint64_t)*(&off_1000DB158 + (int)v19);
            CFStringRef v23 = v10;
            CFStringRef v24 = v9;
            id v25 = v6;
            currentDateKey = self->_currentDateKey;
            [v16 doubleValue];
            uint64_t v39 = v22;
            id v8 = v42;
            id v38 = currentDateKey;
            id v6 = v25;
            CFStringRef v9 = v24;
            CFStringRef v10 = v23;
            uint64_t v28 = +[NSString stringWithFormat:@"%@ - %@ (%@): %5.0f", v38, v39, v18, v27];
            [v41 addObject:v28];
          }
          uint64_t v11 = (char *)v11 + 1;
        }
        while (v8 != v11);
        id v8 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v8);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
    double v3 = v40;
    if (v41)
    {
      long long v29 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:@"sessions" versionName:v40];
      long long v30 = v29;
      if (v29)
      {
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v31 = v29;
        id v32 = [v31 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v32)
        {
          id v33 = v32;
          unint64_t v34 = 0;
          uint64_t v35 = *(void *)v45;
          do
          {
            for (i = 0; i != v33; i = (char *)i + 1)
            {
              if (*(void *)v45 != v35) {
                objc_enumerationMutation(v31);
              }
              id v37 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              if ([v37 hasPrefix:self->_currentDateKey])
              {
                [v41 addObject:v37];
              }
              else
              {
                if (v34 > 0x13) {
                  goto LABEL_30;
                }
                [v41 addObject:v37];
                ++v34;
              }
            }
            id v33 = [v31 countByEnumeratingWithState:&v44 objects:v52 count:16];
          }
          while (v33);
        }
LABEL_30:
      }
      [(SKGKnowledgeFeedback *)self setDefaultWithKey:@"sessions" value:v41];
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  }
}

- (void)logGraphVersion:(int64_t)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  self->_int64_t graphVersion = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  id v5 = +[NSNumber numberWithInteger:self->_graphVersion];
  [(SKGKnowledgeFeedback *)self setDefaultWithKey:@"graphVersionV2" value:v5];
}

- (void)logFlag:(int64_t)a3 message:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v12 = 134218242;
      int64_t v13 = a3;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "SKG: flag (%lu) %@", (uint8_t *)&v12, 0x16u);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
    flags = self->_flags;
    id v8 = +[NSNumber numberWithInteger:a3];
    [(NSMutableSet *)flags addObject:v8];

    stats = self->_stats;
    CFStringRef v10 = +[NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)stats setObject:v10 forKey:v6];
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
    uint64_t v11 = self->_flags;
    CFStringRef v10 = +[NSNumber numberWithInteger:a3];
    [(NSMutableSet *)v11 addObject:v10];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)logEvent:(int64_t)a3 message:(id)a4
{
  id v6 = a4;
  if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    int64_t v10 = a3;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: event (%lu) %@", (uint8_t *)&v9, 0x16u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  events = self->_events;
  id v8 = +[NSNumber numberWithInteger:a3];
  [(NSMutableSet *)events addObject:v8];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)logError:(int64_t)a3 message:(id)a4
{
  id v6 = a4;
  if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000A1090((uint64_t)v6, a3);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  errors = self->_errors;
  id v8 = +[NSNumber numberWithInteger:a3];
  [(NSMutableSet *)errors addObject:v8];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  [(SKGKnowledgeFeedback *)self updateDefaults];
}

- (void)logGraphSize:(unint64_t)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: graph size %lu", (uint8_t *)&v5, 0xCu);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  self->_unint64_t currentGraphSize = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)logArchiveSize:(unint64_t)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: archive size %lu", (uint8_t *)&v5, 0xCu);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  self->_unint64_t currentArchiveSize = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)logJournalSize:(unint64_t)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: journal size %lu", (uint8_t *)&v5, 0xCu);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  self->_unint64_t currentJournalSize = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)logArchiveCount:(unint64_t)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: archive count %lu", (uint8_t *)&v5, 0xCu);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  self->_unint64_t currentArchiveCount = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)logJournalCount:(unint64_t)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: journal count %lu", (uint8_t *)&v5, 0xCu);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  self->_unint64_t currentJournalCount = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)logDeletesCount:(unint64_t)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: deletes journal count %lu", (uint8_t *)&v5, 0xCu);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  self->_unint64_t currentDeletesCount = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)logMarkedPurgeableAtPath:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: purgeable %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)logProcessedJournalWithName:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: processed journal %@", (uint8_t *)&v5, 0xCu);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  ++self->_numJournalsProcessed;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)logProcessedArchiveWithName:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: processed archive %@", (uint8_t *)&v5, 0xCu);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  ++self->_numArchivesProcessed;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)logExtractedQueryItemCount:(unint64_t)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  unint64_t v7 = self->_numQueryItemsExtracted + a3;
  self->_unint64_t numQueryItemsExtracted = v7;
  if (__ROR8__(0x8F5C28F5C28F5C29 * v7, 2) <= 0x28F5C28F5C28F5CuLL
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t numQueryItemsExtracted = self->_numQueryItemsExtracted;
    int v14 = 134217984;
    unint64_t v15 = numQueryItemsExtracted;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: %lu items extracted", (uint8_t *)&v14, 0xCu);
  }
  int v9 = [(NSMutableDictionary *)self->_bundles objectForKeyedSubscript:v6];

  if (!v9) {
    [(NSMutableDictionary *)self->_bundles setObject:&off_1000E61F8 forKey:v6];
  }
  int64_t v10 = [(NSMutableDictionary *)self->_bundles objectForKeyedSubscript:v6];
  unint64_t v11 = a3 + (int)[v10 intValue];

  bundles = self->_bundles;
  int64_t v13 = +[NSNumber numberWithInteger:v11];
  [(NSMutableDictionary *)bundles setObject:v13 forKey:v6];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)logUpdatedQueryItemCount:(unint64_t)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  self->_numQueryItemsUpdated += a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t numQueryItemsUpdated = self->_numQueryItemsUpdated;
    int v13 = 134217984;
    unint64_t v14 = numQueryItemsUpdated;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: %lu query items updated", (uint8_t *)&v13, 0xCu);
  }
  id v8 = [(NSMutableDictionary *)self->_bundles objectForKeyedSubscript:v6];

  if (!v8) {
    [(NSMutableDictionary *)self->_bundles setObject:&off_1000E61F8 forKey:v6];
  }
  int v9 = [(NSMutableDictionary *)self->_bundles objectForKeyedSubscript:v6];
  unint64_t v10 = a3 + (int)[v9 intValue];

  bundles = self->_bundles;
  id v12 = +[NSNumber numberWithInteger:v10];
  [(NSMutableDictionary *)bundles setObject:v12 forKey:v6];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)logArchivedQueryItemCount:(unint64_t)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  self->_numQueryItemsArchived += a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t numQueryItemsArchived = self->_numQueryItemsArchived;
    int v13 = 134217984;
    unint64_t v14 = numQueryItemsArchived;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: %lu query items archived", (uint8_t *)&v13, 0xCu);
  }
  id v8 = [(NSMutableDictionary *)self->_bundles objectForKeyedSubscript:v6];

  if (!v8) {
    [(NSMutableDictionary *)self->_bundles setObject:&off_1000E61F8 forKey:v6];
  }
  int v9 = [(NSMutableDictionary *)self->_bundles objectForKeyedSubscript:v6];
  unint64_t v10 = a3 + (int)[v9 intValue];

  bundles = self->_bundles;
  id v12 = +[NSNumber numberWithInteger:v10];
  [(NSMutableDictionary *)bundles setObject:v12 forKey:v6];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)logExtractedJournalItemCount:(unint64_t)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  unint64_t v7 = self->_numJournalItemsExtracted + a3;
  self->_unint64_t numJournalItemsExtracted = v7;
  if (__ROR8__(0x8F5C28F5C28F5C29 * v7, 2) <= 0x28F5C28F5C28F5CuLL
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t numJournalItemsExtracted = self->_numJournalItemsExtracted;
    int v14 = 134217984;
    unint64_t v15 = numJournalItemsExtracted;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: %lu journal items extracted", (uint8_t *)&v14, 0xCu);
  }
  int v9 = [(NSMutableDictionary *)self->_bundles objectForKeyedSubscript:v6];

  if (!v9) {
    [(NSMutableDictionary *)self->_bundles setObject:&off_1000E61F8 forKey:v6];
  }
  unint64_t v10 = [(NSMutableDictionary *)self->_bundles objectForKeyedSubscript:v6];
  unint64_t v11 = a3 + (int)[v10 intValue];

  bundles = self->_bundles;
  int v13 = +[NSNumber numberWithInteger:v11];
  [(NSMutableDictionary *)bundles setObject:v13 forKey:v6];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)logExtractedArchiveItemCount:(unint64_t)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  unint64_t v7 = self->_numArchiveItemsExtracted + a3;
  self->_unint64_t numArchiveItemsExtracted = v7;
  if (__ROR8__(0x8F5C28F5C28F5C29 * v7, 2) <= 0x28F5C28F5C28F5CuLL
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t numArchiveItemsExtracted = self->_numArchiveItemsExtracted;
    int v14 = 134217984;
    unint64_t v15 = numArchiveItemsExtracted;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKG: %lu archive items extracted", (uint8_t *)&v14, 0xCu);
  }
  int v9 = [(NSMutableDictionary *)self->_bundles objectForKeyedSubscript:v6];

  if (!v9) {
    [(NSMutableDictionary *)self->_bundles setObject:&off_1000E61F8 forKey:v6];
  }
  unint64_t v10 = [(NSMutableDictionary *)self->_bundles objectForKeyedSubscript:v6];
  unint64_t v11 = a3 + (int)[v10 intValue];

  bundles = self->_bundles;
  int v13 = +[NSNumber numberWithInteger:v11];
  [(NSMutableDictionary *)bundles setObject:v13 forKey:v6];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (int64_t)getCurrentExtractedQueryItemCount
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v3 = self->_events;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    int64_t v7 = -1;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        int v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 intValue] != 6 && objc_msgSend(v9, "intValue") != 5)
        {
          unint64_t v10 = +[NSString stringWithFormat:@"[%@]queryItemExtractedCount", v9];
          unint64_t v11 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v10];

          if (v11)
          {
            if (v7 == -1) {
              int64_t v7 = 0;
            }
            id v12 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v10];
            v7 += (int64_t)[v12 integerValue];
          }
        }
      }
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v7 = -1;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return v7;
}

- (int64_t)getCurrentExtractedJournalItemCount
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v3 = self->_events;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    int64_t v7 = -1;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        int v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 intValue] != 6 && objc_msgSend(v9, "intValue") != 5)
        {
          unint64_t v10 = +[NSString stringWithFormat:@"[%@]journalItemExtractedCount", v9];
          unint64_t v11 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v10];

          if (v11)
          {
            if (v7 == -1) {
              int64_t v7 = 0;
            }
            id v12 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v10];
            v7 += (int64_t)[v12 integerValue];
          }
        }
      }
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v7 = -1;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return v7;
}

- (int64_t)getCurrentExtractedArchiveItemCount
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v3 = self->_events;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    int64_t v7 = -1;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        int v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 intValue] != 6 && objc_msgSend(v9, "intValue") != 5)
        {
          unint64_t v10 = +[NSString stringWithFormat:@"[%@]archiveItemExtractedCount", v9];
          unint64_t v11 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v10];

          if (v11)
          {
            if (v7 == -1) {
              int64_t v7 = 0;
            }
            id v12 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v10];
            v7 += (int64_t)[v12 integerValue];
          }
        }
      }
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v7 = -1;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return v7;
}

- (BOOL)hasCurrentFlagWithName:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  id v5 = [(NSMutableDictionary *)self->_stats objectForKey:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return v5 != 0;
}

- (void)logQueryTimeWithIdentifier:(id)a3 protectionClass:(id)a4 startTime:(double)a5 doneProcessing:(BOOL)a6
{
  BOOL v6 = a6;
  CFStringRef v9 = @"None";
  if (a4) {
    CFStringRef v9 = (const __CFString *)a4;
  }
  uint64_t v10 = +[NSString stringWithFormat:@"%@.%@", v9, a3];
  id v18 = (id)v10;
  if (v6)
  {
    unint64_t v11 = +[NSString stringWithFormat:@"startTime.%@", v10];
    [(SKGKnowledgeFeedback *)self timeWithKey:v11];
    double v13 = v12;

    long long v14 = +[NSString stringWithFormat:@"processingTime.%@", v18];
    [(SKGKnowledgeFeedback *)self setTimeWithKey:v14 value:v13];

    long long v15 = +[NSString stringWithFormat:@"finished.%@", v18];
    [(SKGKnowledgeFeedback *)self setModeWithKey:v15 value:1];

    long long v16 = +[NSString stringWithFormat:@"startTime.%@", v18];
    [(SKGKnowledgeFeedback *)self removeKey:v16];

    long long v17 = +[NSString stringWithFormat:@"endTime.%@", v18];
    [(SKGKnowledgeFeedback *)self removeKey:v17];
  }
  else
  {
    long long v17 = +[NSString stringWithFormat:@"endTime.%@", v10];
    [(SKGKnowledgeFeedback *)self setTimeWithKey:v17 value:a5];
  }

  [(SKGKnowledgeFeedback *)self updateDefaults];
}

- (void)getQueryTimeWithIdentifier:(id)a3 protectionClass:(id)a4 startTime:(double *)a5 endTime:(double *)a6 processingEndTime:(double *)a7
{
  CFStringRef v11 = @"None";
  if (a4) {
    CFStringRef v11 = (const __CFString *)a4;
  }
  id v23 = +[NSString stringWithFormat:@"%@.%@", v11, a3];
  double v12 = +[NSString stringWithFormat:@"finished.%@", v23];
  unsigned __int8 v13 = [(SKGKnowledgeFeedback *)self modeWithKey:v12];

  long long v14 = +[NSString stringWithFormat:@"endTime.%@", v23];
  [(SKGKnowledgeFeedback *)self timeWithKey:v14];
  CFAbsoluteTime Current = v15;

  long long v17 = +[NSString stringWithFormat:@"processingTime.%@", v23];
  [(SKGKnowledgeFeedback *)self timeWithKey:v17];
  double v19 = v18;

  if ((v13 & 1) != 0 || Current == 0.0)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    if (Current + -60.0 >= v19) {
      double v20 = Current + -60.0;
    }
    else {
      double v20 = v19;
    }
    id v21 = +[NSString stringWithFormat:@"startTime.%@", v23];
    [(SKGKnowledgeFeedback *)self setTimeWithKey:v21 value:Current];

    uint64_t v22 = +[NSString stringWithFormat:@"finished.%@", v23];
    [(SKGKnowledgeFeedback *)self removeKey:v22];
  }
  else
  {
    double v20 = Current + -60.0;
  }
  *a6 = Current;
  *a5 = v20;
  *a7 = v19;
  [(SKGKnowledgeFeedback *)self updateDefaults];
}

- (void)logArchiveWithIdentifier:(id)a3 protectionClass:(id)a4
{
  CFStringRef v5 = @"None";
  if (a4) {
    CFStringRef v5 = (const __CFString *)a4;
  }
  id v6 = +[NSString stringWithFormat:@"%@.CurrentFileIndex-%@", v5, a3];
  [(SKGKnowledgeFeedback *)self setIndexWithKey:v6 value:(char *)[(SKGKnowledgeFeedback *)self indexWithKey:v6] + 1];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  ++self->_numArchivesGenerated;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)logDefaultWithIdentifier:(id)a3 protectionClass:(id)a4 key:(id)a5 value:(id)a6
{
  if (a4) {
    CFStringRef v9 = (const __CFString *)a4;
  }
  else {
    CFStringRef v9 = @"None";
  }
  id v10 = a6;
  id v11 = a5;
  id v13 = +[NSString stringWithFormat:@"%@.%@", v9, a3];
  double v12 = +[NSString stringWithFormat:@"%@.%@", v13, v11];

  [(SKGKnowledgeFeedback *)self setDefaultWithKey:v12 value:v10];
  [(SKGKnowledgeFeedback *)self updateDefaults];
}

- (id)getDefaultWithIdentifier:(id)a3 protectionClass:(id)a4 key:(id)a5
{
  if (a4) {
    CFStringRef v7 = (const __CFString *)a4;
  }
  else {
    CFStringRef v7 = @"None";
  }
  id v8 = a5;
  CFStringRef v9 = +[NSString stringWithFormat:@"%@.%@", v7, a3];
  id v10 = +[NSString stringWithFormat:@"%@.%@", v9, v8];

  id v11 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:v10];

  return v11;
}

- (void)clearDefaultWithIdentifier:(id)a3 protectionClass:(id)a4 key:(id)a5
{
  if (a4) {
    CFStringRef v7 = (const __CFString *)a4;
  }
  else {
    CFStringRef v7 = @"None";
  }
  id v8 = a5;
  id v10 = +[NSString stringWithFormat:@"%@.%@", v7, a3];
  CFStringRef v9 = +[NSString stringWithFormat:@"%@.%@", v10, v8];

  [(SKGKnowledgeFeedback *)self removeKey:v9];
}

- (BOOL)hasEvent:(int64_t)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  events = self->_events;
  if (events)
  {
    id v6 = +[NSNumber numberWithInteger:a3];
    unsigned __int8 v7 = [(NSMutableSet *)events containsObject:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return v7;
}

- (BOOL)hasError:(int64_t)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  errors = self->_errors;
  if (errors)
  {
    id v6 = +[NSNumber numberWithInteger:a3];
    unsigned __int8 v7 = [(NSMutableSet *)errors containsObject:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return v7;
}

- (BOOL)hasFlag:(int64_t)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  flags = self->_flags;
  if (flags)
  {
    id v6 = +[NSNumber numberWithInteger:a3];
    unsigned __int8 v7 = [(NSMutableSet *)flags containsObject:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
  return v7;
}

- (BOOL)generateReportUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  char v48 = 0;
  CFStringRef v5 = [(SKGKnowledgeFeedback *)self feedbackData];
  unint64_t v34 = v5;
  if ([v5 count])
  {
    id v32 = self;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v5;
    id v6 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    if (v6)
    {
      id v7 = v6;
      id v8 = 0;
      uint64_t v9 = *(void *)v45;
      while (2)
      {
        id v10 = 0;
        id v11 = v8;
        do
        {
          if (*(void *)v45 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v44 + 1) + 8 * (void)v10);
          id v13 = [obj objectForKeyedSubscript:v12];
          id v8 = +[NSString stringWithFormat:@"%@: %@", v12, v13];

          v4[2](v4, v8, &v48);
          if (v48)
          {
            BOOL v14 = 0;
            goto LABEL_38;
          }
          id v10 = (char *)v10 + 1;
          id v11 = v8;
        }
        while (v7 != v10);
        id v7 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v8 = 0;
    }

    self = v32;
  }
  else
  {
    id v8 = 0;
  }
  id obj = [(SKGKnowledgeFeedback *)self versionName];
  -[SKGKnowledgeFeedback defaultPropertiesForVersionName:](self, "defaultPropertiesForVersionName:");
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v33 = [v15 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v33)
  {
    uint64_t v16 = *(void *)v41;
    uint64_t v29 = *(void *)v41;
    id v30 = v15;
    while (2)
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v15);
        }
        uint64_t v18 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        double v19 = [v15 objectForKeyedSubscript:v18];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v31 = v19;
          id v20 = v19;
          id v21 = [v20 countByEnumeratingWithState:&v36 objects:v49 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v37;
            while (2)
            {
              CFStringRef v24 = 0;
              id v25 = v8;
              do
              {
                if (*(void *)v37 != v23) {
                  objc_enumerationMutation(v20);
                }
                id v8 = +[NSString stringWithFormat:@"%@", *(void *)(*((void *)&v36 + 1) + 8 * (void)v24)];

                v4[2](v4, v8, &v48);
                if (v48)
                {

                  uint64_t v27 = (uint64_t)v8;
                  id v15 = v30;
                  id v26 = v31;
                  goto LABEL_35;
                }
                CFStringRef v24 = (char *)v24 + 1;
                id v25 = v8;
              }
              while (v22 != v24);
              id v22 = [v20 countByEnumeratingWithState:&v36 objects:v49 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }

          uint64_t v16 = v29;
          id v15 = v30;
          id v26 = v31;
        }
        else
        {
          +[NSString stringWithFormat:@"%@: %@", v18, v19];
          v27 = id v26 = v19;

          v4[2](v4, (void *)v27, &v48);
          id v8 = (void *)v27;
          if (v48)
          {
LABEL_35:

            BOOL v14 = 0;
            id v8 = (void *)v27;
            goto LABEL_37;
          }
        }
      }
      BOOL v14 = 1;
      id v33 = [v15 countByEnumeratingWithState:&v40 objects:v50 count:16];
      if (v33) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v14 = 1;
  }
LABEL_37:

LABEL_38:
  return v14;
}

- (void)logUpdateTaskReindexCount:(unint64_t)a3 taskName:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 && [v6 length])
  {
    id v8 = +[NSDate date];
    uint64_t v9 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:v7];
    id v10 = v9;
    if (v9)
    {
      id v11 = [v9 mutableCopy];
      uint64_t v12 = [v8 dateByAddingTimeInterval:-86400.0];
      id v13 = (char *)[v11 count];
      if (v13)
      {
        BOOL v14 = v13 - 1;
        do
        {
          id v15 = [v11 objectAtIndexedSubscript:v14];
          uint64_t v16 = [v15 objectAtIndexedSubscript:0];
          if ([v16 compare:v12] == (id)-1) {
            [v11 removeObjectAtIndex:v14];
          }

          --v14;
        }
        while (v14 != (char *)-1);
      }
      v22[0] = v8;
      long long v17 = +[NSNumber numberWithUnsignedInteger:a3];
      v22[1] = v17;
      uint64_t v18 = +[NSArray arrayWithObjects:v22 count:2];
      [v11 addObject:v18];

      [(SKGKnowledgeFeedback *)self setDefaultWithKey:v7 value:v11];
    }
    else
    {
      +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3, v8);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      v20[1] = v11;
      uint64_t v12 = +[NSArray arrayWithObjects:v20 count:2];
      id v21 = v12;
      double v19 = +[NSArray arrayWithObjects:&v21 count:1];
      [(SKGKnowledgeFeedback *)self setDefaultWithKey:v7 value:v19];
    }
  }
}

- (unint64_t)getReindexCountForTask:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    CFStringRef v5 = +[NSDate date];
    id v6 = [v5 dateByAddingTimeInterval:-86400.0];
    id v7 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:v4];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          BOOL v14 = [v13 objectAtIndexedSubscript:0];
          if ([v14 compare:v6] == (id)1)
          {
            id v15 = [v13 objectAtIndexedSubscript:1];
            v10 += (unint64_t)[v15 unsignedIntegerValue];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
    else
    {
      unint64_t v10 = 0;
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (id)defaultValueWithKey:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(SKGKnowledgeFeedback *)self versionName];
  id v6 = [(SKGKnowledgeFeedback *)self defaultPropertiesForVersionName:v5];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  id v7 = [v6 objectForKey:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);

  return v7;
}

- (void)removeKey:(id)a3
{
  id v4 = a3;
  id v8 = [(SKGKnowledgeFeedback *)self versionName];
  CFStringRef v5 = [(SKGKnowledgeFeedback *)self defaultPropertiesForVersionName:v8];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  id v6 = [(SKGKnowledgeFeedback *)self defaults];
  id v7 = [v5 mutableCopy];
  [v7 removeObjectForKey:v4];

  [v6 setObject:v7 forKey:v8];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)removeDefaults
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F90C8);
  id v2 = +[NSUserDefaults standardUserDefaults];
  [v2 removePersistentDomainForName:@"com.apple.spotlightknowledge"];

  +[NSUserDefaults resetStandardUserDefaults];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F90C8);
}

- (void)setModeWithKey:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[NSNumber numberWithBool:v4];
  [(SKGKnowledgeFeedback *)self setDefaultWithKey:v6 value:v7];
}

- (BOOL)modeWithKey:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:v4];
  if (v5)
  {
    id v6 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:v4];
    unsigned __int8 v7 = [v6 BOOLValue];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)recoveryTimesWithKey:(id)a3
{
  double v3 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:a3];
  id v4 = v3;
  if (!v3) {
    double v3 = &__NSArray0__struct;
  }
  id v5 = v3;

  return v5;
}

- (void)setTimeWithKey:(id)a3 value:(double)a4
{
  id v6 = a3;
  id v7 = +[NSNumber numberWithDouble:a4];
  [(SKGKnowledgeFeedback *)self setDefaultWithKey:v6 value:v7];
}

- (double)timeWithKey:(id)a3
{
  id v4 = a3;
  id v5 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:v4];
  if (v5)
  {
    id v6 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:v4];
    [v6 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (void)setIndexWithKey:(id)a3 value:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedInteger:a4];
  [(SKGKnowledgeFeedback *)self setDefaultWithKey:v6 value:v7];
}

- (unint64_t)indexWithKey:(id)a3
{
  id v4 = a3;
  id v5 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:v4];
  if (v5)
  {
    id v6 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:v4];
    unint64_t v7 = (int)[v6 intValue];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)updateItemCountWithKey:(id)a3
{
  id v4 = a3;
  id v5 = +[NSNumber numberWithUnsignedInteger:(char *)[(SKGKnowledgeFeedback *)self itemCountWithKey:v4] + 1];
  [(SKGKnowledgeFeedback *)self setDefaultWithKey:v4 value:v5];
}

- (unint64_t)itemCountWithKey:(id)a3
{
  id v4 = a3;
  id v5 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:v4];
  if (v5)
  {
    id v6 = [(SKGKnowledgeFeedback *)self defaultValueWithKey:v4];
    unint64_t v7 = (int)[v6 intValue];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

@end