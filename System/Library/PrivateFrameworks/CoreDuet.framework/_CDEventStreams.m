@interface _CDEventStreams
+ (id)ephemeralitySchedule;
+ (id)eventStreamForName:(id)a3;
+ (id)eventStreamPropertiesForEventStream:(id)a3;
+ (id)eventStreamPropertiesForKBName:(id)a3;
+ (id)eventStreamPropertiesForName:(id)a3;
+ (id)privacyPolicyForEventStreamName:(id)a3;
+ (id)rateLimiterForEventStreamName:(id)a3;
+ (id)sharedInstance;
+ (void)loadAllEventStreams;
- (BOOL)allStreamsLoaded;
- (NSDictionary)allEventStreams;
- (NSDictionary)allKBEventStreams;
- (_CDEventStreams)init;
- (id)_eventStreamForName:(id)a3 orKBName:(id)a4;
- (void)setAllEventStreams:(id)a3;
- (void)setAllKBEventStreams:(id)a3;
- (void)setAllStreamsLoaded:(BOOL)a3;
@end

@implementation _CDEventStreams

+ (id)privacyPolicyForEventStreamName:(id)a3
{
  id v3 = a3;
  if (privacyPolicyForEventStreamName__onceToken != -1) {
    dispatch_once(&privacyPolicyForEventStreamName__onceToken, &__block_literal_global_19);
  }
  id v4 = (id)privacyPolicyForEventStreamName__policies;
  objc_sync_enter(v4);
  v5 = [(id)privacyPolicyForEventStreamName__policies objectForKeyedSubscript:v3];
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    int v8 = 1;
  }
  else
  {
    v9 = [(id)objc_opt_class() eventStreamPropertiesForKBName:v3];
    if (v9)
    {
      v10 = [_CDPrivacyPolicy alloc];
      [v9 temporalPrecision];
      v7 = -[_CDPrivacyPolicy initWithTemporalPrecision:canPersistOnStorage:](v10, "initWithTemporalPrecision:canPersistOnStorage:", [v9 isHistorical], v11);
      [(id)privacyPolicyForEventStreamName__policies setObject:v7 forKeyedSubscript:v3];
      int v8 = 0;
    }
    else
    {
      v7 = 0;
      int v8 = 1;
    }
  }
  objc_sync_exit(v4);

  if (!v8) {
    v6 = v7;
  }

  return v6;
}

+ (id)eventStreamPropertiesForKBName:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[_CDEventStreams sharedInstance];
    v5 = [v4 _eventStreamForName:0 orKBName:v3];

    v6 = [v5 eventStreamProperties];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance__sharedContextStoreEvents;
  return v2;
}

- (id)_eventStreamForName:(id)a3 orKBName:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__1;
  v73 = __Block_byref_object_dispose__1;
  id v74 = 0;
  int v8 = self;
  objc_sync_enter(v8);
  v48 = (void *)v6;
  v49 = (void *)v7;
  BOOL v47 = (v6 | v7) == 0;
  p_isa = (id *)&v8->super.isa;
  if (v6 | v7)
  {
    if (v6)
    {
      uint64_t v9 = [(NSDictionary *)v8->_allEventStreams objectForKeyedSubscript:v6];
      v10 = (void *)v70[5];
      v70[5] = v9;
    }
    else
    {
      if (!v7) {
        goto LABEL_12;
      }
      uint64_t v11 = [(NSDictionary *)v8->_allKBEventStreams objectForKeyedSubscript:v7];
      v12 = (void *)v70[5];
      v70[5] = v11;
    }
    v13 = (void *)v70[5];
    if (v13)
    {
      id v43 = v13;
      goto LABEL_11;
    }
  }
  else
  {
    if ([(_CDEventStreams *)v8 allStreamsLoaded])
    {
      id v43 = 0;
LABEL_11:
      int v14 = 1;
      goto LABEL_60;
    }
    [(_CDEventStreams *)v8 setAllStreamsLoaded:1];
  }
LABEL_12:
  v15 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v16 = +[_CDPaths eventPlistPath];
  if (v16)
  {
    [v15 addObject:v16];
  }
  else
  {
    v17 = +[_CDLogging contextChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[_CDEventStreams _eventStreamForName:orKBName:](v17);
    }

    uint64_t v16 = 0;
  }
  v41 = (void *)v16;
  id v46 = p_isa[2];
  id v45 = p_isa[3];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = v15;
  uint64_t v18 = [obj countByEnumeratingWithState:&v65 objects:v80 count:16];
  if (v18)
  {
    id v52 = 0;
    uint64_t v50 = *(void *)v66;
    while (2)
    {
      uint64_t v19 = 0;
      uint64_t v51 = v18;
      do
      {
        if (*(void *)v66 != v50) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v65 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x192FB2F20]();
        v22 = [MEMORY[0x1E4F1CA48] arrayWithContentsOfFile:v20];
        if ([v22 count])
        {
          v23 = +[_CDPaths eventPlistPath];
          int v24 = [v20 isEqualToString:v23];

          if (v24)
          {
            long long v64 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v61 = 0u;
            id v25 = v22;
            uint64_t v26 = [v25 countByEnumeratingWithState:&v61 objects:v79 count:16];
            if (v26)
            {
              uint64_t v27 = *(void *)v62;
              while (2)
              {
                for (uint64_t i = 0; i != v26; ++i)
                {
                  if (*(void *)v62 != v27) {
                    objc_enumerationMutation(v25);
                  }
                  v29 = *(void **)(*((void *)&v61 + 1) + 8 * i);
                  v30 = [v29 objectForKeyedSubscript:kCDESPEventNameKey];
                  int v31 = [v30 isEqualToString:@"Default"];

                  if (v31)
                  {
                    uint64_t v33 = +[_CDEventStreamProperties eventStreamPropertiesFromDictionary:v29];

                    id v52 = (id)v33;
                    goto LABEL_37;
                  }
                }
                uint64_t v26 = [v25 countByEnumeratingWithState:&v61 objects:v79 count:16];
                if (v26) {
                  continue;
                }
                break;
              }
            }
LABEL_37:

            v34 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != 'Default'", kCDESPEventNameKey);
            [v25 filterUsingPredicate:v34];
          }
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __48___CDEventStreams__eventStreamForName_orKBName___block_invoke;
          v53[3] = &unk_1E560D870;
          BOOL v60 = v47;
          v54 = v48;
          id v55 = v49;
          id v52 = v52;
          id v56 = v52;
          id v57 = v46;
          id v58 = v45;
          v59 = &v69;
          [v22 enumerateObjectsUsingBlock:v53];
          v35 = (void *)v70[5];
          if (v35)
          {
            id v43 = v35;
            int v14 = 1;
          }
          else
          {
            int v14 = 0;
          }

          v32 = v54;
        }
        else
        {
          v32 = +[_CDLogging contextChannel];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v76 = v20;
            _os_log_error_impl(&dword_18ECEB000, v32, OS_LOG_TYPE_ERROR, "Unable to load plist from path: %@", buf, 0xCu);
          }
          int v14 = 3;
        }

        if (v14 != 3 && v14)
        {

          goto LABEL_59;
        }
        ++v19;
      }
      while (v19 != v51);
      uint64_t v18 = [obj countByEnumeratingWithState:&v65 objects:v80 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v52 = 0;
  }

  char v36 = v47;
  if (v70[5]) {
    char v36 = 1;
  }
  if ((v36 & 1) == 0)
  {
    v37 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v76 = v48;
      __int16 v77 = 2112;
      v78 = v49;
      _os_log_impl(&dword_18ECEB000, v37, OS_LOG_TYPE_DEFAULT, "unable to find stream (%@, %@) in event stream plists.", buf, 0x16u);
    }

    uint64_t v38 = +[_CDEventStream eventStreamWithProperties:0];
    v39 = (void *)v70[5];
    v70[5] = v38;

    if (v48) {
      [v46 setObject:v70[5] forKeyedSubscript:v48];
    }
    if (v49) {
      objc_msgSend(v45, "setObject:forKeyedSubscript:", v70[5]);
    }
  }
  int v14 = 0;
LABEL_59:

LABEL_60:
  objc_sync_exit(p_isa);

  if (!v14) {
    id v43 = (id)v70[5];
  }
  _Block_object_dispose(&v69, 8);

  return v43;
}

+ (id)rateLimiterForEventStreamName:(id)a3
{
  id v3 = a3;
  if (rateLimiterForEventStreamName__onceToken != -1) {
    dispatch_once(&rateLimiterForEventStreamName__onceToken, &__block_literal_global_16);
  }
  id v4 = (id)rateLimiterForEventStreamName__policies;
  objc_sync_enter(v4);
  v5 = [(id)rateLimiterForEventStreamName__policies objectForKeyedSubscript:v3];
  unint64_t v6 = v5;
  if (v5)
  {
    unint64_t v7 = v5;
    int v8 = 1;
  }
  else
  {
    uint64_t v9 = [(id)objc_opt_class() eventStreamPropertiesForKBName:v3];
    if (v9)
    {
      v10 = [_CDRateAndTotalLimiter alloc];
      uint64_t v11 = [v9 eventsPerPeriod];
      [v9 period];
      unint64_t v7 = -[_CDRateAndTotalLimiter initWithCount:perPeriod:totalCountLimit:](v10, "initWithCount:perPeriod:totalCountLimit:", v11, [v9 eventCountLimit], v12);
      [(id)rateLimiterForEventStreamName__policies setObject:v7 forKeyedSubscript:v3];
      int v8 = 0;
    }
    else
    {
      unint64_t v7 = 0;
      int v8 = 1;
    }
  }
  objc_sync_exit(v4);

  if (!v8) {
    unint64_t v6 = v7;
  }

  return v6;
}

- (_CDEventStreams)init
{
  v8.receiver = self;
  v8.super_class = (Class)_CDEventStreams;
  v2 = [(_CDEventStreams *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    allEventStreams = v2->_allEventStreams;
    v2->_allEventStreams = (NSDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    allKBEventStreams = v2->_allKBEventStreams;
    v2->_allKBEventStreams = (NSDictionary *)v5;
  }
  return v2;
}

+ (void)loadAllEventStreams
{
  id v3 = +[_CDEventStreams sharedInstance];
  id v2 = (id)[v3 _eventStreamForName:0 orKBName:0];
}

- (void)setAllEventStreams:(id)a3
{
}

- (NSDictionary)allEventStreams
{
  [(id)objc_opt_class() loadAllEventStreams];
  allEventStreams = self->_allEventStreams;
  return allEventStreams;
}

- (void)setAllKBEventStreams:(id)a3
{
}

- (NSDictionary)allKBEventStreams
{
  [(id)objc_opt_class() loadAllEventStreams];
  allKBEventStreams = self->_allKBEventStreams;
  return allKBEventStreams;
}

+ (id)eventStreamForName:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[_CDEventStreams sharedInstance];
    uint64_t v5 = [v4 _eventStreamForName:v3 orKBName:0];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

+ (id)eventStreamPropertiesForName:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[_CDEventStreams sharedInstance];
    uint64_t v5 = [v4 _eventStreamForName:v3 orKBName:0];

    unint64_t v6 = [v5 eventStreamProperties];
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v6;
}

+ (id)eventStreamPropertiesForEventStream:(id)a3
{
  id v4 = [a3 name];
  uint64_t v5 = [a1 eventStreamPropertiesForKBName:v4];

  return v5;
}

+ (id)ephemeralitySchedule
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = +[_CDEventStreams sharedInstance];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v20 = v2;
  id v4 = [v2 allKBEventStreams];
  uint64_t v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v11 = [v10 eventStreamProperties];
        double v12 = [v11 knowledgeBaseName];

        if (v12)
        {
          v13 = [v10 eventStreamProperties];
          [v13 timeToLive];
          double v15 = v14;

          uint64_t v16 = [NSNumber numberWithDouble:v15];
          v17 = [v3 objectForKeyedSubscript:v16];

          if (v17)
          {
            [v17 addObject:v12];
          }
          else
          {
            v17 = [MEMORY[0x1E4F1CA80] setWithObject:v12];
            uint64_t v18 = [NSNumber numberWithDouble:v15];
            [v3 setObject:v17 forKeyedSubscript:v18];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  return v3;
}

- (BOOL)allStreamsLoaded
{
  return self->_allStreamsLoaded;
}

- (void)setAllStreamsLoaded:(BOOL)a3
{
  self->_allStreamsLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allKBEventStreams, 0);
  objc_storeStrong((id *)&self->_allEventStreams, 0);
}

- (void)_eventStreamForName:(os_log_t)log orKBName:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18ECEB000, log, OS_LOG_TYPE_FAULT, "Unable to determine system event stream plist path.", v1, 2u);
}

@end