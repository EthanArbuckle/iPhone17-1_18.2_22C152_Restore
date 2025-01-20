@interface CSEventFeedback
+ (BOOL)flagWithKey:(id)a3;
+ (double)elapsedTimeSinceFlushForEvent:(int64_t)a3;
+ (double)timeWithKey:(id)a3;
+ (id)defaultProperties;
+ (id)defaultValueWithKey:(id)a3;
+ (id)defaultValueWithKey:(id)a3 versionName:(id)a4;
+ (id)defaults;
+ (id)versionName;
+ (int64_t)version;
+ (void)logEmbeddingPrewarmRequestTime;
+ (void)removeDefaults;
+ (void)removeKey:(id)a3;
+ (void)reset;
+ (void)setDefaultWithKey:(id)a3 value:(id)a4;
+ (void)setFlagWithKey:(id)a3 value:(BOOL)a4;
+ (void)setIndexWithKey:(id)a3 value:(unint64_t)a4;
+ (void)setTimeWithKey:(id)a3 value:(double)a4;
+ (void)updateDefaultWithKey:(id)a3 value:(id)a4;
- (BOOL)canProcessEvent:(id)a3;
- (BOOL)completedBatch;
- (BOOL)ignoredBatch;
- (CSEventFeedback)init;
- (CSEventFeedback)initWithVersionName:(id)a3 dateComponents:(id)a4;
- (NSCalendar)currentCalendar;
- (NSDate)currentDate;
- (NSString)bundleID;
- (double)elapsedTime;
- (id)feedback;
- (int)indexType;
- (int64_t)periodForMax:(int64_t)a3;
- (unint64_t)bucketedSizeForValue:(id)a3 numBuckets:(unint64_t)a4;
- (unint64_t)indexWithKey:(id)a3;
- (unint64_t)maxCount;
- (unint64_t)numItemsInBatch;
- (void)clear;
- (void)commonInitWithVersionName:(id)a3 dateComponents:(id)a4;
- (void)end;
- (void)flush;
- (void)logCachedItemForBundleID:(id)a3 counts:(id)a4;
- (void)logError:(int64_t)a3;
- (void)logError:(int64_t)a3 message:(id)a4;
- (void)logFlag:(int64_t)a3 message:(id)a4;
- (void)logProcessedItemForBundleID:(id)a3 language:(id)a4 textSize:(unint64_t)a5 counts:(id)a6;
- (void)reset;
- (void)sendAnalytics;
- (void)setBundleID:(id)a3;
- (void)setCompletedBatch:(BOOL)a3;
- (void)setCurrentDate:(id)a3;
- (void)setIgnoredBatch:(BOOL)a3;
- (void)setIndexType:(int)a3;
- (void)setMaxCount:(unint64_t)a3;
- (void)setNumItemsInBatch:(unint64_t)a3;
- (void)setUnitGranularity:(unint64_t)a3;
- (void)setUnitGranularity:(unint64_t)a3 periods:(int64_t)a4;
- (void)start;
- (void)updateProcessedItemsDefaults;
@end

@implementation CSEventFeedback

+ (id)versionName
{
  return @"CSEvents.V1";
}

+ (int64_t)version
{
  return 3;
}

+ (double)elapsedTimeSinceFlushForEvent:(int64_t)a3
{
  double v3 = 0.0;
  switch(a3)
  {
    case 13:
      CFStringRef v4 = @"lastEmbeddingPreWarmRequest";
      break;
    case 8:
      CFStringRef v4 = @"lastEmbeddingDate";
      break;
    case 7:
      CFStringRef v4 = @"lastPriorityDate";
      break;
    default:
      return v3;
  }
  CFDateRef v5 = [(id)objc_opt_class() defaultValueWithKey:v4];
  if (v5)
  {
    CFDateRef v6 = v5;
    double AbsoluteTime = CFDateGetAbsoluteTime(v5);
    double v3 = CFAbsoluteTimeGetCurrent() - AbsoluteTime;
  }
  return v3;
}

+ (void)reset
{
  v2 = objc_opt_class();

  [v2 removeDefaults];
}

- (void)commonInitWithVersionName:(id)a3 dateComponents:(id)a4
{
  id v13 = a4;
  CFDateRef v5 = +[NSTimeZone timeZoneWithName:@"GMT"];
  CFDateRef v6 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
  currentCalendar = self->_currentCalendar;
  self->_currentCalendar = v6;

  [(NSCalendar *)self->_currentCalendar setTimeZone:v5];
  if (v13)
  {
    -[NSCalendar dateFromComponents:](self->_currentCalendar, "dateFromComponents:");
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    currentDate = self->_currentDate;
    self->_currentDate = v8;
  }
  else
  {
    currentDate = self->_currentDate;
    self->_currentDate = 0;
  }

  self->_forTesting = 0;
  [(CSEventFeedback *)self setNumItemsInBatch:0];
  [(CSEventFeedback *)self setIndexType:0];
  [(CSEventFeedback *)self setMaxCount:1800];
  [(CSEventFeedback *)self setUnitGranularity:16 periods:24];
  v10 = [(id)objc_opt_class() defaultValueWithKey:@"version"];
  v11 = v10;
  if (!v10
    || (unsigned int v12 = [v10 unsignedIntValue],
        [(id)objc_opt_class() version] != (id)v12))
  {
    [(CSEventFeedback *)self clear];
  }
  [(CSEventFeedback *)self flush];
  [(CSEventFeedback *)self reset];
}

- (CSEventFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSEventFeedback;
  v2 = [(CSEventFeedback *)&v5 init];
  double v3 = v2;
  if (v2) {
    [(CSEventFeedback *)v2 commonInitWithVersionName:@"CSEvents.V1" dateComponents:0];
  }
  return v3;
}

- (CSEventFeedback)initWithVersionName:(id)a3 dateComponents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSEventFeedback;
  v8 = [(CSEventFeedback *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CSEventFeedback *)v8 commonInitWithVersionName:v6 dateComponents:v7];
    v9->_forTesting = 1;
  }

  return v9;
}

- (NSCalendar)currentCalendar
{
  currentCalendar = self->_currentCalendar;
  if (currentCalendar)
  {
    double v3 = currentCalendar;
  }
  else
  {
    double v3 = +[NSCalendar currentCalendar];
  }

  return v3;
}

- (void)setCurrentDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentDate, a3);
  id v5 = a3;
  [(id)objc_opt_class() setDefaultWithKey:@"currentDate" value:self->_currentDate];
}

- (NSDate)currentDate
{
  currentDate = self->_currentDate;
  if (currentDate)
  {
    double v3 = currentDate;
  }
  else
  {
    double v3 = +[NSDate now];
  }

  return v3;
}

- (void)setMaxCount:(unint64_t)a3
{
  self->_maxCount = a3;
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (void)setCompletedBatch:(BOOL)a3
{
  self->_completedBatch = a3;
}

- (BOOL)completedBatch
{
  return self->_completedBatch;
}

- (void)setIgnoredBatch:(BOOL)a3
{
  self->_ignoredBatch = a3;
}

- (BOOL)ignoredBatch
{
  return self->_ignoredBatch;
}

- (unint64_t)numItemsInBatch
{
  return self->_numItemsInBatch;
}

- (int)indexType
{
  return self->_indexType;
}

- (double)elapsedTime
{
  return CFAbsoluteTimeGetCurrent() - self->_startTime;
}

- (void)setUnitGranularity:(unint64_t)a3
{
}

- (void)setUnitGranularity:(unint64_t)a3 periods:(int64_t)a4
{
  self->_CFCalendarUnit unitGranularity = a3;
  if (a3 == 16)
  {
    self->_CFCalendarUnit unitGranularity = 32;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL || a4 == 0) {
      unint64_t length = 1;
    }
    else {
      unint64_t length = a4;
    }
  }
  else
  {
    id v7 = [(CSEventFeedback *)self currentCalendar];
    CFCalendarUnit unitGranularity = self->_unitGranularity;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    unint64_t length = CFCalendarGetRangeOfUnit(v7, unitGranularity, 0x10uLL, Current).length;
  }
  self->_numPeriods = length;
}

- (int64_t)periodForMax:(int64_t)a3
{
  id v5 = [(CSEventFeedback *)self currentCalendar];
  unint64_t unitGranularity = self->_unitGranularity;
  id v7 = [(CSEventFeedback *)self currentDate];
  id v8 = [v5 component:unitGranularity fromDate:v7];

  CFCalendarUnit v9 = self->_unitGranularity;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFRange RangeOfUnit = CFCalendarGetRangeOfUnit((CFCalendarRef)v5, v9, 0x10uLL, Current);

  return ((int64_t)v8 - RangeOfUnit.location)
       * (a3 - RangeOfUnit.location)
       / (RangeOfUnit.length - RangeOfUnit.location)
       + RangeOfUnit.location;
}

+ (void)logEmbeddingPrewarmRequestTime
{
  v2 = objc_opt_class();
  id v3 = +[NSDate now];
  [v2 setDefaultWithKey:@"lastEmbeddingPreWarmRequest" value:v3];
}

- (void)logCachedItemForBundleID:(id)a3 counts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSEventFeedback *)self bundleID];
  unsigned __int8 v9 = [v6 isEqualToString:v8];

  if ((v9 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000A0AC4((uint64_t)v6, self);
  }
  v26 = v6;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v27 = *(void *)v29;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v29 != v27) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v15 = objc_msgSend(v10, "objectForKeyedSubscript:", v14, v26);
        v16 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v14];

        if (!v16)
        {
          stats = self->_stats;
          v18 = +[NSMutableDictionary dictionary];
          [(NSMutableDictionary *)stats setObject:v18 forKey:v14];
        }
        v19 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v14];
        v20 = [v19 objectForKeyedSubscript:@"cachedCount"];

        if (!v20)
        {
          v21 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v14];
          [v21 setObject:&off_1000E6198 forKey:@"cachedCount"];
        }
        v22 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v14];
        v23 = [v22 objectForKeyedSubscript:@"cachedCount"];

        v24 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v23 unsignedIntValue] + objc_msgSend(v15, "unsignedIntValue"));
        v25 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v14];
        [v25 setObject:v24 forKeyedSubscript:@"cachedCount"];
      }
      id v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }
}

- (void)logProcessedItemForBundleID:(id)a3 language:(id)a4 textSize:(unint64_t)a5 counts:(id)a6
{
  id v9 = a3;
  id v46 = a4;
  id v10 = a6;
  id v11 = [(CSEventFeedback *)self bundleID];
  unsigned __int8 v12 = [v9 isEqualToString:v11];

  if ((v12 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000A0B54((uint64_t)v9, self);
  }
  v47 = v9;
  [(CSEventFeedback *)self flush];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v13 = v10;
  id v14 = [v13 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v48 = *(void *)v50;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v50 != v48) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v18 = [v13 objectForKeyedSubscript:v17];
        v19 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v17];

        if (!v19)
        {
          stats = self->_stats;
          v21 = +[NSMutableDictionary dictionary];
          [(NSMutableDictionary *)stats setObject:v21 forKey:v17];
        }
        v22 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v17];
        v23 = [v22 objectForKeyedSubscript:@"lastProcessedDate"];

        if (!v23)
        {
          v24 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v17];
          v25 = [(CSEventFeedback *)self currentDate];
          [v24 setObject:v25 forKey:@"lastProcessedDate"];
        }
        v26 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v17];
        uint64_t v27 = [v26 objectForKeyedSubscript:@"count"];

        if (!v27)
        {
          long long v28 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v17];
          [v28 setObject:&off_1000E6198 forKey:@"count"];
        }
        long long v29 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v17];
        long long v30 = [v29 objectForKeyedSubscript:@"count"];

        long long v31 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v30 unsignedIntValue] + objc_msgSend(v18, "unsignedIntValue"));
        v32 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v17];
        [v32 setObject:v31 forKeyedSubscript:@"count"];

        if ([v17 unsignedIntValue] == 8)
        {
          v33 = objc_opt_class();
          v34 = [(CSEventFeedback *)self currentDate];
          [v33 setDefaultWithKey:@"lastEmbeddingDate" value:v34];
        }
        if ([v17 unsignedIntValue] == 7
          && [v18 unsignedIntValue])
        {
          v35 = objc_opt_class();
          v36 = [(CSEventFeedback *)self currentDate];
          [v35 setDefaultWithKey:@"lastPriorityDate" value:v36];

          self->_numProcessedOnBudget += [v18 unsignedIntValue];
          [(id)objc_opt_class() updateDefaultWithKey:@"processedEmbedCountOnBudget" value:v18];
        }
        v37 = objc_opt_class();
        v38 = [v17 stringValue];
        [v37 updateDefaultWithKey:v38 value:&off_1000E61B0];
      }
      id v15 = [v13 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v15);
  }

  if (v46) {
    uint64_t LanguageIDForIdentifier = SILanguagesGetLanguageIDForIdentifier();
  }
  else {
    uint64_t LanguageIDForIdentifier = 0;
  }
  languages = self->_languages;
  v41 = +[NSNumber numberWithUnsignedInt:LanguageIDForIdentifier];
  [(NSMutableSet *)languages addObject:v41];

  textSizes = self->_textSizes;
  v43 = +[NSNumber numberWithUnsignedInteger:v45];
  [(NSMutableSet *)textSizes addObject:v43];

  ++self->_numProcessedItemsInBatch;
}

- (unint64_t)bucketedSizeForValue:(id)a3 numBuckets:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && [v5 unsignedIntValue])
  {
    if ([v6 unsignedIntValue] <= 0x1388) {
      a4 = (unint64_t)(float)((float)[v6 unsignedIntValue] / 5000.0) % a4;
    }
  }
  else
  {
    a4 = 0;
  }

  return a4;
}

- (id)feedback
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [(CSEventFeedback *)self elapsedTime];
  CFStringRef v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v4 forKey:@"duration"];

  id v5 = +[NSNumber numberWithUnsignedInteger:[(CSEventFeedback *)self numItemsInBatch]];
  [v3 setObject:v5 forKey:@"batchCount"];

  id v6 = +[NSNumber numberWithUnsignedInteger:self->_numProcessedItemsInBatch];
  [v3 setObject:v6 forKey:@"processedCount"];

  id v7 = +[NSNumber numberWithUnsignedInt:[(CSEventFeedback *)self indexType]];
  [v3 setObject:v7 forKey:@"protectionClass"];

  id v8 = [(CSEventFeedback *)self bundleID];
  id v9 = [v8 length];

  if (v9)
  {
    id v10 = [(CSEventFeedback *)self bundleID];
    [v3 setObject:v10 forKey:@"bundleID"];
  }
  if ([(NSMutableSet *)self->_textSizes count])
  {
    id v11 = [(NSMutableSet *)self->_textSizes valueForKeyPath:@"@avg.self"];
    unsigned __int8 v12 = +[NSNumber numberWithUnsignedInteger:[(CSEventFeedback *)self bucketedSizeForValue:v11 numBuckets:3]];
    [v3 setObject:v12 forKey:@"textSize"];
  }
  if ([(NSMutableSet *)self->_languages count])
  {
    id v13 = [(NSMutableSet *)self->_languages valueForKeyPath:@"@avg.self"];
    [v3 setObject:v13 forKey:@"language"];
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v14 = self->_stats;
  id v15 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v45;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v45 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v20 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v19];
        uint64_t v21 = [v20 objectForKeyedSubscript:@"count"];

        if (v21) {
          v22 = (_UNKNOWN **)v21;
        }
        else {
          v22 = &off_1000E6198;
        }
        switch([v19 unsignedIntValue])
        {
          case 8u:
            [v3 setObject:v22 forKey:@"embeddingCount"];
            v23 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v19];
            v24 = [v23 objectForKeyedSubscript:@"cachedCount"];

            if (v24)
            {
              v25 = [(NSMutableDictionary *)self->_stats objectForKeyedSubscript:v19];
              v26 = [v25 objectForKeyedSubscript:@"cachedCount"];
              [v3 setObject:v26 forKey:@"embeddingCachedCount"];
            }
            break;
          case 9u:
            uint64_t v27 = v3;
            long long v28 = v22;
            CFStringRef v29 = @"keyphraseCount";
            goto LABEL_22;
          case 0xAu:
            uint64_t v27 = v3;
            long long v28 = v22;
            CFStringRef v29 = @"appEntityCount";
            goto LABEL_22;
          case 0xBu:
            uint64_t v27 = v3;
            long long v28 = v22;
            CFStringRef v29 = @"suggestedEventsCount";
            goto LABEL_22;
          case 0xCu:
            uint64_t v27 = v3;
            long long v28 = v22;
            CFStringRef v29 = @"documentUnderstandingCount";
LABEL_22:
            [v27 setObject:v28 forKey:v29];
            break;
          default:
            break;
        }
      }
      id v16 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v16);
  }

  long long v30 = +[NSNumber numberWithBool:self->_completedBatch];
  [v3 setObject:v30 forKey:@"CompletedBatch"];

  long long v31 = +[NSNumber numberWithBool:self->_ignoredBatch];
  [v3 setObject:v31 forKey:@"IgnoredBatch"];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v32 = self->_errors;
  id v33 = [(NSMutableSet *)v32 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v41;
    do
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v41 != v35) {
          objc_enumerationMutation(v32);
        }
        unsigned int v37 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * (void)j), "intValue", (void)v40) - 14;
        if (v37 <= 4) {
          [v3 setObject:&__kCFBooleanTrue forKey:off_1000DAA80[v37]];
        }
      }
      id v34 = [(NSMutableSet *)v32 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v34);
  }

  id v38 = [v3 copy];

  return v38;
}

- (void)sendAnalytics
{
  if ((self->_numProcessedItemsInBatch
     || [(NSMutableDictionary *)self->_stats count]
     || [(NSMutableSet *)self->_textSizes count]
     || [(NSMutableSet *)self->_languages count]
     || [(NSMutableSet *)self->_errors count]
     || self->_completedBatch
     || self->_ignoredBatch)
    && !self->_forTesting)
  {
    id v3 = [(CSEventFeedback *)self feedback];
    AnalyticsSendEvent();
  }
}

- (void)logError:(int64_t)a3
{
  errors = self->_errors;
  id v4 = +[NSNumber numberWithInteger:a3];
  [(NSMutableSet *)errors addObject:v4];
}

- (void)start
{
  self->_startTime = CFAbsoluteTimeGetCurrent();
}

- (void)updateProcessedItemsDefaults
{
  if (self->_numProcessedItemsInBatch)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t numProcessedItemsInBatch = self->_numProcessedItemsInBatch;
      int v11 = 134217984;
      unint64_t v12 = numProcessedItemsInBatch;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "### %lu journal items processed", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v4 = [(id)objc_opt_class() defaultValueWithKey:@"processedCount"];
    id v5 = (void *)v4;
    id v6 = &off_1000E6198;
    if (v4) {
      id v6 = (_UNKNOWN **)v4;
    }
    id v7 = v6;

    unint64_t numProcessedOnBudget = self->_numProcessedOnBudget;
    unsigned int v9 = [v7 unsignedIntValue];

    id v10 = +[NSNumber numberWithUnsignedInteger:numProcessedOnBudget + v9];
    [(id)objc_opt_class() updateDefaultWithKey:@"processedCount" value:v10];
  }
}

- (void)end
{
  id v3 = objc_opt_class();
  uint64_t v4 = [(CSEventFeedback *)self currentDate];
  [v3 setDefaultWithKey:@"lastFlushDate" value:v4];

  [(CSEventFeedback *)self updateProcessedItemsDefaults];
  [(CSEventFeedback *)self sendAnalytics];

  [(CSEventFeedback *)self reset];
}

- (void)flush
{
  id v3 = [(CSEventFeedback *)self currentDate];
  uint64_t v4 = [(id)objc_opt_class() defaultValueWithKey:@"currentDate"];
  id v5 = [(CSEventFeedback *)self currentCalendar];
  unsigned __int8 v6 = [v5 isDate:v3 equalToDate:v4 toUnitGranularity:16];

  if ((v6 & 1) == 0)
  {
    [(CSEventFeedback *)self sendAnalytics];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "### clearing stats for new day", v7, 2u);
    }
    [(CSEventFeedback *)self clear];
  }
}

- (void)reset
{
  *(_OWORD *)&self->_unint64_t numProcessedItemsInBatch = 0u;
  *(_OWORD *)&self->_startTime = 0u;
  id v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  stats = self->_stats;
  self->_stats = v3;

  id v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  textSizes = self->_textSizes;
  self->_textSizes = v5;

  id v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  languages = self->_languages;
  self->_languages = v7;

  unsigned int v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  errors = self->_errors;
  self->_errors = v9;

  *(_WORD *)&self->_completedBatch = 0;
  id v24 = [(CSEventFeedback *)self currentDate];
  id v11 = objc_alloc_init((Class)NSDateComponents);
  unint64_t v12 = [(CSEventFeedback *)self currentCalendar];
  objc_msgSend(v11, "setDay:", objc_msgSend(v12, "component:fromDate:", 16, v24));

  id v13 = [(CSEventFeedback *)self currentCalendar];
  objc_msgSend(v11, "setMonth:", objc_msgSend(v13, "component:fromDate:", 8, v24));

  id v14 = [(CSEventFeedback *)self currentCalendar];
  objc_msgSend(v11, "setYear:", objc_msgSend(v14, "component:fromDate:", 4, v24));

  id v15 = objc_alloc_init((Class)NSDateFormatter);
  id v16 = [(CSEventFeedback *)self currentCalendar];
  [v15 setCalendar:v16];

  [v15 setDateStyle:1];
  uint64_t v17 = [(CSEventFeedback *)self currentDate];
  v18 = [v15 stringFromDate:v17];
  currentDateKey = self->_currentDateKey;
  self->_currentDateKey = v18;

  v20 = objc_opt_class();
  uint64_t v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [(id)objc_opt_class() version]);
  [v20 setDefaultWithKey:@"version" value:v21];

  v22 = objc_opt_class();
  v23 = [(CSEventFeedback *)self currentDate];
  [v22 setDefaultWithKey:@"currentDate" value:v23];
}

- (void)clear
{
  [(id)objc_opt_class() removeDefaults];

  [(CSEventFeedback *)self reset];
}

- (BOOL)canProcessEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 intValue];
  if (v5 == 9)
  {
    uint64_t v17 = objc_opt_class();
    v18 = [v4 stringValue];
    uint64_t v19 = [v17 defaultValueWithKey:v18];
    v20 = (void *)v19;
    uint64_t v21 = &off_1000E6198;
    if (v19) {
      uint64_t v21 = (_UNKNOWN **)v19;
    }
    v22 = v21;

    unsigned int v23 = [v22 unsignedIntValue];
    BOOL v16 = v23 < 0x186A1;
  }
  else if (v5 == 7)
  {
    uint64_t v6 = [(id)objc_opt_class() defaultValueWithKey:@"processedEmbedCountOnBudget"];
    id v7 = (void *)v6;
    id v8 = &off_1000E6198;
    if (v6) {
      id v8 = (_UNKNOWN **)v6;
    }
    unsigned int v9 = v8;

    unsigned int v10 = [v9 unsignedIntValue];
    unint64_t maxCount = self->_maxCount;
    if (maxCount <= v10)
    {
      BOOL v16 = 0;
    }
    else
    {
      if (maxCount >= self->_numPeriods) {
        int64_t numPeriods = self->_numPeriods;
      }
      else {
        int64_t numPeriods = self->_maxCount;
      }
      int64_t v13 = [(CSEventFeedback *)self periodForMax:numPeriods];
      int64_t v14 = self->_maxCount;
      uint64_t v15 = v14 / numPeriods;
      if ((unint64_t)(v14 / numPeriods) <= 1) {
        uint64_t v15 = 1;
      }
      BOOL v16 = v14 - [v9 unsignedIntValue] + v15 + v15 * (v13 - numPeriods) > 0;
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (void)logError:(int64_t)a3 message:(id)a4
{
  id v6 = a4;
  if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000A0BE4((uint64_t)v6, a3, v7, v8, v9, v10, v11, v12);
  }
  errors = self->_errors;
  int64_t v14 = +[NSNumber numberWithInteger:a3];
  [(NSMutableSet *)errors addObject:v14];
}

- (void)logFlag:(int64_t)a3 message:(id)a4
{
  if (a3 == 10)
  {
    uint64_t v4 = 122;
  }
  else
  {
    if (a3 != 22) {
      return;
    }
    uint64_t v4 = 121;
  }
  *((unsigned char *)&self->super.isa + v4) = 1;
}

+ (id)defaults
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.cseventlistener"];

  return v2;
}

+ (id)defaultProperties
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F8EE8);
  id v2 = [(id)objc_opt_class() defaults];
  id v3 = [(id)objc_opt_class() versionName];
  uint64_t v4 = [v2 dictionaryRepresentation];
  unsigned int v5 = [v4 objectForKey:v3];

  if (!v5)
  {
    id v6 = [v2 dictionaryRepresentation];
    unsigned int v5 = [v6 objectForKey:v3];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F8EE8);

  return v5;
}

+ (void)setDefaultWithKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = [(id)objc_opt_class() versionName];
  uint64_t v8 = [(id)objc_opt_class() defaultProperties];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F8EE8);
  uint64_t v9 = [a1 defaults];
  if (v8) {
    id v10 = [v8 mutableCopy];
  }
  else {
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
  }
  uint64_t v11 = v10;
  [v10 setObject:v6 forKey:v7];

  [v9 setObject:v11 forKey:v12];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F8EE8);
}

+ (void)updateDefaultWithKey:(id)a3 value:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [(id)objc_opt_class() versionName];
  uint64_t v8 = [(id)objc_opt_class() defaultProperties];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F8EE8);
  uint64_t v9 = [a1 defaults];
  if (v8) {
    id v10 = [v8 mutableCopy];
  }
  else {
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
  }
  uint64_t v11 = v10;
  id v12 = [v10 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v13 = objc_alloc_init((Class)NSMutableArray);
      [v13 addObject:v6];
      if (v12) {
        [v13 addObject:v12];
      }
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  if (!v12)
  {
    uint64_t v15 = (char *)[v6 unsignedIntegerValue];
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_13:
    [v11 setObject:v6 forKey:v16];
    goto LABEL_17;
  }
  int64_t v14 = (char *)[v6 unsignedIntegerValue];
  uint64_t v15 = &v14[(void)[v12 unsignedIntegerValue]];
LABEL_15:
  id v13 = +[NSNumber numberWithUnsignedInteger:v15];
LABEL_16:
  [v11 setObject:v13 forKey:v16];

LABEL_17:
  [v9 setObject:v11 forKey:v7];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F8EE8);
}

+ (id)defaultValueWithKey:(id)a3 versionName:(id)a4
{
  id v4 = a3;
  unsigned int v5 = [(id)objc_opt_class() defaultProperties];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F8EE8);
  id v6 = [v5 objectForKey:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F8EE8);

  return v6;
}

+ (id)defaultValueWithKey:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [a1 defaultProperties];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F8EE8);
  id v6 = [v5 objectForKey:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F8EE8);

  return v6;
}

+ (void)removeKey:(id)a3
{
  id v4 = a3;
  id v8 = [(id)objc_opt_class() versionName];
  unsigned int v5 = [a1 defaultProperties];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F8EE8);
  id v6 = [a1 defaults];
  id v7 = [v5 mutableCopy];
  [v7 removeObjectForKey:v4];

  [v6 setObject:v7 forKey:v8];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F8EE8);
}

+ (void)removeDefaults
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F8EE8);
  id v2 = +[NSUserDefaults standardUserDefaults];
  [v2 removePersistentDomainForName:@"com.apple.cseventlistener"];

  +[NSUserDefaults resetStandardUserDefaults];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F8EE8);
}

+ (void)setFlagWithKey:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_opt_class();
  id v7 = +[NSNumber numberWithBool:v4];
  [v6 setDefaultWithKey:v5 value:v7];
}

+ (BOOL)flagWithKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(id)objc_opt_class() defaultValueWithKey:v3];
  if (v4)
  {
    id v5 = [(id)objc_opt_class() defaultValueWithKey:v3];
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (void)setTimeWithKey:(id)a3 value:(double)a4
{
  id v5 = a3;
  unsigned __int8 v6 = objc_opt_class();
  id v7 = +[NSNumber numberWithDouble:a4];
  [v6 setDefaultWithKey:v5 value:v7];
}

+ (double)timeWithKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(id)objc_opt_class() defaultValueWithKey:v3];
  if (v4)
  {
    id v5 = [(id)objc_opt_class() defaultValueWithKey:v3];
    [v5 doubleValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

+ (void)setIndexWithKey:(id)a3 value:(unint64_t)a4
{
  id v5 = a3;
  double v6 = objc_opt_class();
  id v7 = +[NSNumber numberWithUnsignedInteger:a4];
  [v6 setDefaultWithKey:v5 value:v7];
}

- (unint64_t)indexWithKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(id)objc_opt_class() defaultValueWithKey:v3];
  if (v4)
  {
    id v5 = [(id)objc_opt_class() defaultValueWithKey:v3];
    unint64_t v6 = (int)[v5 intValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)setNumItemsInBatch:(unint64_t)a3
{
  self->_numItemsInBatch = a3;
}

- (void)setIndexType:(int)a3
{
  self->_indexType = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_textSizes, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_currentDateKey, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);

  objc_storeStrong((id *)&self->_currentDate, 0);
}

@end