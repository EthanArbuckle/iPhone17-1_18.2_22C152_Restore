@interface ANAnalytics
+ (id)shared;
- (ANAnalytics)initWithSystem:(id)a3 assistant:(id)a4 dailyReporter:(id)a5;
- (ANAnalyticsAssistantProtocol)assistant;
- (ANAnalyticsDailyProtocol)dailyReporter;
- (ANAnalyticsSystemProtocol)system;
- (void)announcementEntryAgeLimit:(id)a3 timeExceeded:(double)a4 context:(id)a5;
- (void)announcementFinishedPlaying:(id)a3 withTime:(double)a4 ofGroupCount:(int64_t)a5 context:(id)a6;
- (void)announcementPlayed:(id)a3 withTime:(double)a4 deadlineViolation:(double)a5 playbackSource:(unint64_t)a6 ofGroupCount:(int64_t)a7 context:(id)a8;
- (void)announcementReceived:(id)a3 withTime:(double)a4 receiveTimeType:(unint64_t)a5 context:(id)a6;
- (void)announcementSent:(id)a3 inHome:(id)a4 withError:(int64_t)a5 withTime:(double)a6 sendType:(unint64_t)a7 ofGroupCount:(int64_t)a8 context:(id)a9;
- (void)announcementsExpired:(id)a3 ofGroupCount:(int64_t)a4 context:(id)a5;
- (void)announcementsStorageAgeLimit:(id)a3 context:(id)a4;
- (void)dailyReport:(id)a3 withPayload:(id)a4;
- (void)dailyReportComplete;
- (void)error:(int64_t)a3;
- (void)error:(int64_t)a3 context:(id)a4;
- (void)playbackAction:(unint64_t)a3 fromSource:(unint64_t)a4 context:(id)a5;
- (void)recordReachableHomes:(id)a3;
@end

@implementation ANAnalytics

+ (id)shared
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__ANAnalytics_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken_0 != -1) {
    dispatch_once(&shared_onceToken_0, block);
  }
  v2 = (void *)shared_shared;
  return v2;
}

void __21__ANAnalytics_shared__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  int v3 = [v2 BOOLForDefault:*MEMORY[0x1E4F4A588]];

  id v4 = objc_alloc(*(Class *)(a1 + 32));
  v9 = objc_alloc_init(ANCoreAnalytics);
  v5 = objc_alloc_init(ANAnalyticsAssistant);
  if (v3) {
    v6 = objc_alloc_init(ANAnalyticsDaily);
  }
  else {
    v6 = 0;
  }
  uint64_t v7 = [v4 initWithSystem:v9 assistant:v5 dailyReporter:v6];
  v8 = (void *)shared_shared;
  shared_shared = v7;

  if (v3) {
}
  }

- (ANAnalytics)initWithSystem:(id)a3 assistant:(id)a4 dailyReporter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ANAnalytics;
  v12 = [(ANAnalytics *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_system, a3);
    objc_storeStrong((id *)&v13->_assistant, a4);
    if (v11)
    {
      objc_storeStrong((id *)&v13->_dailyReporter, a5);
      [(ANAnalyticsDailyProtocol *)v13->_dailyReporter setDelegate:v13];
      [(ANAnalyticsDailyProtocol *)v13->_dailyReporter start];
    }
  }

  return v13;
}

- (void)announcementSent:(id)a3 inHome:(id)a4 withError:(int64_t)a5 withTime:(double)a6 sendType:(unint64_t)a7 ofGroupCount:(int64_t)a8 context:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  if (v16)
  {
    id v18 = a9;
    v19 = [(ANAnalytics *)self assistant];
    uint64_t v20 = [v19 audioDataForAnnouncement:v16];
    double v22 = v21;

    long long v43 = 0u;
    v23 = [(ANAnalytics *)self assistant];
    v24 = v23;
    if (v23) {
      [v23 senderDataForAnnouncement:v16];
    }
    else {
      long long v43 = 0u;
    }

    v25 = [(ANAnalytics *)self assistant];
    uint64_t v26 = [v25 boundGroupCount:a8];

    v27 = objc_opt_new();
    v28 = [NSNumber numberWithInteger:0];
    [v27 setObject:v28 forKeyedSubscript:@"action"];

    v29 = [NSNumber numberWithDouble:v22];
    [v27 setObject:v29 forKeyedSubscript:@"duration"];

    v30 = [NSNumber numberWithBool:a5 != 0];
    [v27 setObject:v30 forKeyedSubscript:@"error"];

    v31 = [NSNumber numberWithInteger:a5];
    [v27 setObject:v31 forKeyedSubscript:@"errorCode"];

    v32 = [NSNumber numberWithInteger:v26];
    [v27 setObject:v32 forKeyedSubscript:@"groupCount"];

    v33 = [NSNumber numberWithInteger:(void)v43];
    [v27 setObject:v33 forKeyedSubscript:@"location"];

    v34 = [NSNumber numberWithInteger:a7];
    [v27 setObject:v34 forKeyedSubscript:@"sendType"];

    v35 = [NSNumber numberWithInteger:v20];
    [v27 setObject:v35 forKeyedSubscript:@"size"];

    v36 = [NSNumber numberWithInteger:*((void *)&v43 + 1)];
    [v27 setObject:v36 forKeyedSubscript:@"source"];

    v37 = [NSNumber numberWithDouble:a6];
    [v27 setObject:v37 forKeyedSubscript:@"time"];

    v38 = [v18 analyticsPayload];

    [v27 addEntriesFromDictionary:v38];
    v39 = [(ANAnalytics *)self system];
    v40 = (void *)[v27 copy];
    [v39 send:@"announcementSent" withPayload:v40];

    v41 = [(ANAnalytics *)self dailyReporter];

    if (!a7 && v41)
    {
      v42 = [(ANAnalytics *)self dailyReporter];
      [v42 announcementSent:v16 inHome:v17];
    }
  }
}

- (void)announcementReceived:(id)a3 withTime:(double)a4 receiveTimeType:(unint64_t)a5 context:(id)a6
{
  id v10 = a3;
  if (v10)
  {
    id v11 = a6;
    v12 = [(ANAnalytics *)self assistant];
    uint64_t v13 = [v12 audioDataForAnnouncement:v10];
    double v15 = v14;

    long long v51 = 0u;
    long long v52 = 0u;
    id v16 = [(ANAnalytics *)self assistant];
    id v17 = v16;
    if (v16)
    {
      [v16 senderDataForAnnouncement:v10];
    }
    else
    {
      long long v51 = 0u;
      long long v52 = 0u;
    }

    id v18 = objc_opt_new();
    v19 = [NSNumber numberWithInteger:(void)v51];
    [v18 setObject:v19 forKeyedSubscript:@"action"];

    uint64_t v20 = [NSNumber numberWithDouble:v15];
    [v18 setObject:v20 forKeyedSubscript:@"duration"];

    double v21 = [NSNumber numberWithInteger:(void)v52];
    [v18 setObject:v21 forKeyedSubscript:@"location"];

    double v22 = [NSNumber numberWithInteger:a5];
    [v18 setObject:v22 forKeyedSubscript:@"receiveType"];

    v23 = [NSNumber numberWithInteger:v13];
    [v18 setObject:v23 forKeyedSubscript:@"size"];

    v24 = [NSNumber numberWithInteger:*((void *)&v52 + 1)];
    [v18 setObject:v24 forKeyedSubscript:@"source"];

    v25 = [NSNumber numberWithDouble:a4];
    [v18 setObject:v25 forKeyedSubscript:@"time"];

    uint64_t v26 = [NSNumber numberWithInteger:SDWORD2(v51)];
    [v18 setObject:v26 forKeyedSubscript:@"fromDevice"];

    v27 = objc_msgSend(NSNumber, "numberWithInteger:", (int)objc_msgSend(MEMORY[0x1E4F4A8E8], "deviceClass"));
    [v18 setObject:v27 forKeyedSubscript:@"toDevice"];

    v28 = [v11 analyticsPayload];
    [v18 addEntriesFromDictionary:v28];

    v29 = [(ANAnalytics *)self system];
    v50 = v11;
    v30 = (void *)[v18 copy];
    [v29 send:@"announcementTimeToReceive" withPayload:v30];

    v31 = [(ANAnalytics *)self assistant];
    uint64_t v32 = [v31 bucketFromSize:v13];

    v33 = [(ANAnalytics *)self assistant];
    uint64_t v34 = [v33 bucketFromDuration:v15];

    v35 = [(ANAnalytics *)self assistant];
    uint64_t v36 = [v35 bucketFromReceiveTime:a4];

    v37 = objc_opt_new();
    v38 = [NSNumber numberWithInteger:v32];
    [v37 setObject:v38 forKeyedSubscript:@"sizeBucket"];

    v39 = [NSNumber numberWithInteger:v34];
    [v37 setObject:v39 forKeyedSubscript:@"durationBucket"];

    v40 = [NSNumber numberWithInteger:v36];
    [v37 setObject:v40 forKeyedSubscript:@"timeBucket"];

    v41 = [NSNumber numberWithInteger:v13];
    [v37 setObject:v41 forKeyedSubscript:@"size"];

    v42 = [NSNumber numberWithDouble:v15];
    [v37 setObject:v42 forKeyedSubscript:@"duration"];

    long long v43 = [NSNumber numberWithDouble:a4];
    [v37 setObject:v43 forKeyedSubscript:@"time"];

    v44 = [NSNumber numberWithInteger:a5];
    [v37 setObject:v44 forKeyedSubscript:@"receiveType"];

    v45 = [NSNumber numberWithInteger:SDWORD2(v51)];
    [v37 setObject:v45 forKeyedSubscript:@"fromDevice"];

    v46 = objc_msgSend(NSNumber, "numberWithInteger:", (int)objc_msgSend(MEMORY[0x1E4F4A8E8], "deviceClass"));
    [v37 setObject:v46 forKeyedSubscript:@"toDevice"];

    v47 = [v50 analyticsPayload];

    [v37 addEntriesFromDictionary:v47];
    v48 = [(ANAnalytics *)self system];
    v49 = (void *)[v37 copy];
    [v48 send:@"announcementReceiveMeasure" withPayload:v49];
  }
}

- (void)announcementPlayed:(id)a3 withTime:(double)a4 deadlineViolation:(double)a5 playbackSource:(unint64_t)a6 ofGroupCount:(int64_t)a7 context:(id)a8
{
  id v14 = a3;
  if (v14)
  {
    id v15 = a8;
    id v16 = [(ANAnalytics *)self assistant];
    uint64_t v17 = [v16 audioDataForAnnouncement:v14];
    double v19 = v18;

    long long v37 = 0u;
    uint64_t v20 = [(ANAnalytics *)self assistant];
    double v21 = v20;
    if (v20) {
      [v20 senderDataForAnnouncement:v14];
    }
    else {
      long long v37 = 0u;
    }

    double v22 = [(ANAnalytics *)self assistant];
    uint64_t v23 = [v22 boundGroupCount:a7];

    v24 = objc_opt_new();
    v25 = [NSNumber numberWithInteger:0];
    [v24 setObject:v25 forKeyedSubscript:@"action"];

    uint64_t v26 = [NSNumber numberWithBool:a5 > 0.0];
    [v24 setObject:v26 forKeyedSubscript:@"deadlineViolation"];

    v27 = [NSNumber numberWithDouble:v19];
    [v24 setObject:v27 forKeyedSubscript:@"duration"];

    v28 = [NSNumber numberWithInteger:v23];
    [v24 setObject:v28 forKeyedSubscript:@"groupCount"];

    v29 = [NSNumber numberWithInteger:(void)v37];
    [v24 setObject:v29 forKeyedSubscript:@"location"];

    v30 = [NSNumber numberWithInteger:v17];
    [v24 setObject:v30 forKeyedSubscript:@"size"];

    v31 = [NSNumber numberWithInteger:*((void *)&v37 + 1)];
    [v24 setObject:v31 forKeyedSubscript:@"source"];

    uint64_t v32 = [NSNumber numberWithInteger:a6];
    [v24 setObject:v32 forKeyedSubscript:@"playbackSource"];

    v33 = [NSNumber numberWithDouble:a4];
    [v24 setObject:v33 forKeyedSubscript:@"time"];

    uint64_t v34 = [v15 analyticsPayload];

    [v24 addEntriesFromDictionary:v34];
    v35 = [(ANAnalytics *)self system];
    uint64_t v36 = (void *)[v24 copy];
    [v35 send:@"announcementTimeToPlay" withPayload:v36];
  }
}

- (void)announcementFinishedPlaying:(id)a3 withTime:(double)a4 ofGroupCount:(int64_t)a5 context:(id)a6
{
  id v10 = a3;
  if (v10)
  {
    id v11 = a6;
    v12 = [(ANAnalytics *)self assistant];
    uint64_t v13 = [v12 audioDataForAnnouncement:v10];
    double v15 = v14;

    long long v31 = 0u;
    id v16 = [(ANAnalytics *)self assistant];
    uint64_t v17 = v16;
    if (v16) {
      [v16 senderDataForAnnouncement:v10];
    }
    else {
      long long v31 = 0u;
    }

    double v18 = [(ANAnalytics *)self assistant];
    uint64_t v19 = [v18 boundGroupCount:a5];

    uint64_t v20 = objc_opt_new();
    double v21 = [NSNumber numberWithInteger:0];
    [v20 setObject:v21 forKeyedSubscript:@"action"];

    double v22 = [NSNumber numberWithDouble:v15];
    [v20 setObject:v22 forKeyedSubscript:@"duration"];

    uint64_t v23 = [NSNumber numberWithInteger:v19];
    [v20 setObject:v23 forKeyedSubscript:@"groupCount"];

    v24 = [NSNumber numberWithInteger:(void)v31];
    [v20 setObject:v24 forKeyedSubscript:@"location"];

    v25 = [NSNumber numberWithInteger:v13];
    [v20 setObject:v25 forKeyedSubscript:@"size"];

    uint64_t v26 = [NSNumber numberWithInteger:*((void *)&v31 + 1)];
    [v20 setObject:v26 forKeyedSubscript:@"source"];

    v27 = [NSNumber numberWithDouble:a4];
    [v20 setObject:v27 forKeyedSubscript:@"time"];

    v28 = [v11 analyticsPayload];

    [v20 addEntriesFromDictionary:v28];
    v29 = [(ANAnalytics *)self system];
    v30 = (void *)[v20 copy];
    [v29 send:@"announcementFinishedPlaying" withPayload:v30];
  }
}

- (void)announcementsExpired:(id)a3 ofGroupCount:(int64_t)a4 context:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8 && [v8 count])
  {
    id v10 = [(ANAnalytics *)self assistant];
    uint64_t v11 = [v10 boundGroupCount:a4];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v27 = v8;
    id obj = v8;
    uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v29 = 0u;
          uint64_t v17 = [(ANAnalytics *)self assistant];
          double v18 = v17;
          if (v17) {
            [v17 senderDataForAnnouncement:v16];
          }
          else {
            long long v29 = 0u;
          }

          uint64_t v19 = objc_opt_new();
          uint64_t v20 = [NSNumber numberWithInteger:0];
          [v19 setObject:v20 forKeyedSubscript:@"action"];

          double v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "hasPlayed"));
          [v19 setObject:v21 forKeyedSubscript:@"played"];

          double v22 = [NSNumber numberWithInteger:v11];
          [v19 setObject:v22 forKeyedSubscript:@"groupCount"];

          uint64_t v23 = [NSNumber numberWithInteger:*((void *)&v29 + 1)];
          [v19 setObject:v23 forKeyedSubscript:@"source"];

          v24 = [v9 analyticsPayload];
          [v19 addEntriesFromDictionary:v24];

          v25 = [(ANAnalytics *)self system];
          uint64_t v26 = (void *)[v19 copy];
          [v25 send:@"announcementExpiration" withPayload:v26];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v13);
    }

    id v8 = v27;
  }
}

- (void)announcementEntryAgeLimit:(id)a3 timeExceeded:(double)a4 context:(id)a5
{
  id v8 = a3;
  if (v8)
  {
    long long v20 = 0u;
    id v9 = a5;
    id v10 = [(ANAnalytics *)self assistant];
    uint64_t v11 = v10;
    if (v10) {
      [v10 senderDataForAnnouncement:v8];
    }
    else {
      long long v20 = 0u;
    }

    uint64_t v12 = objc_opt_new();
    uint64_t v13 = [NSNumber numberWithInteger:0];
    [v12 setObject:v13 forKeyedSubscript:@"action"];

    uint64_t v14 = [NSNumber numberWithInteger:(void)v20];
    [v12 setObject:v14 forKeyedSubscript:@"location"];

    double v15 = [NSNumber numberWithInteger:*((void *)&v20 + 1)];
    [v12 setObject:v15 forKeyedSubscript:@"source"];

    id v16 = [NSNumber numberWithDouble:a4];
    [v12 setObject:v16 forKeyedSubscript:@"timeExceeded"];

    uint64_t v17 = [v9 analyticsPayload];

    [v12 addEntriesFromDictionary:v17];
    double v18 = [(ANAnalytics *)self system];
    uint64_t v19 = (void *)[v12 copy];
    [v18 send:@"announcementEntryAgeLimit" withPayload:v19];
  }
}

- (void)announcementsStorageAgeLimit:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 announcements];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [v6 announcements];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      uint64_t v12 = [(ANAnalytics *)self assistant];
      uint64_t v13 = [v6 announcements];
      uint64_t v34 = objc_msgSend(v12, "boundGroupCount:", objc_msgSend(v13, "count"));

      uint64_t v14 = [v6 announcements];
      uint64_t v15 = [v14 count];

      if (v15)
      {
        unint64_t v16 = 0;
        do
        {
          uint64_t v17 = [v6 announcements];
          double v18 = [v17 objectAtIndexedSubscript:v16];

          uint64_t v19 = [v6 metadata];
          long long v20 = [v19 objectAtIndexedSubscript:v16];

          long long v35 = 0u;
          double v21 = [(ANAnalytics *)self assistant];
          double v22 = v21;
          if (v21) {
            [v21 senderDataForAnnouncement:v18];
          }
          else {
            long long v35 = 0u;
          }

          uint64_t v23 = objc_opt_new();
          v24 = [NSNumber numberWithInteger:0];
          [v23 setObject:v24 forKeyedSubscript:@"action"];

          v25 = [NSNumber numberWithInteger:(void)v35];
          [v23 setObject:v25 forKeyedSubscript:@"location"];

          uint64_t v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v18, "hasPlayed"));
          [v23 setObject:v26 forKeyedSubscript:@"played"];

          id v27 = [NSNumber numberWithInteger:*((void *)&v35 + 1)];
          [v23 setObject:v27 forKeyedSubscript:@"source"];

          v28 = [NSNumber numberWithInteger:v34];
          [v23 setObject:v28 forKeyedSubscript:@"groupCount"];

          long long v29 = [v7 analyticsPayload];
          [v23 addEntriesFromDictionary:v29];

          [v23 addEntriesFromDictionary:v20];
          long long v30 = [(ANAnalytics *)self system];
          long long v31 = (void *)[v23 copy];
          [v30 send:@"announcementAgeLimit" withPayload:v31];

          ++v16;
          long long v32 = [v6 announcements];
          unint64_t v33 = [v32 count];
        }
        while (v16 < v33);
      }
    }
  }
}

- (void)error:(int64_t)a3
{
}

- (void)error:(int64_t)a3 context:(id)a4
{
  id v6 = a4;
  if ((unint64_t)(a3 - 5035) >= 0xFFFFFFFFFFFFF03DLL)
  {
    id v11 = v6;
    id v7 = objc_opt_new();
    uint64_t v8 = [NSNumber numberWithInteger:a3];
    [v7 setObject:v8 forKeyedSubscript:@"errorCode"];

    if (v11)
    {
      id v9 = [v11 analyticsPayload];
      [v7 addEntriesFromDictionary:v9];
    }
    id v10 = [(ANAnalytics *)self system];
    [v10 send:@"announcementError" withPayload:v7];

    id v6 = v11;
  }
}

- (void)playbackAction:(unint64_t)a3 fromSource:(unint64_t)a4 context:(id)a5
{
  id v8 = a5;
  id v14 = (id)objc_opt_new();
  id v9 = [NSNumber numberWithInteger:a3];
  [v14 setObject:v9 forKeyedSubscript:@"action"];

  id v10 = [NSNumber numberWithInteger:a4];
  [v14 setObject:v10 forKeyedSubscript:@"source"];

  id v11 = [v8 analyticsPayload];

  [v14 addEntriesFromDictionary:v11];
  uint64_t v12 = [(ANAnalytics *)self system];
  uint64_t v13 = (void *)[v14 copy];
  [v12 send:@"playbackAction" withPayload:v13];
}

- (void)recordReachableHomes:(id)a3
{
  id v4 = a3;
  id v5 = [(ANAnalytics *)self dailyReporter];
  [v5 recordReachableHomes:v4];
}

- (void)dailyReport:(id)a3 withPayload:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ANAnalytics *)self system];
  [v8 send:v7 withPayload:v6];
}

- (void)dailyReportComplete
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (ANLogHandleAnalytics_once != -1) {
    dispatch_once(&ANLogHandleAnalytics_once, &__block_literal_global_15);
  }
  v2 = (id)ANLogHandleAnalytics_logger;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    id v4 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily completed daily report.", (uint8_t *)&v3, 0xCu);
  }
}

- (ANAnalyticsSystemProtocol)system
{
  return (ANAnalyticsSystemProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (ANAnalyticsAssistantProtocol)assistant
{
  return (ANAnalyticsAssistantProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (ANAnalyticsDailyProtocol)dailyReporter
{
  return (ANAnalyticsDailyProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyReporter, 0);
  objc_storeStrong((id *)&self->_assistant, 0);
  objc_storeStrong((id *)&self->_system, 0);
}

@end