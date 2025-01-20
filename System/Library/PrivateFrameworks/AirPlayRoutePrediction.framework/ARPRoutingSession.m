@interface ARPRoutingSession
+ (BOOL)supportsSecureCoding;
+ (double)microLocationCorrelationGracePeriod;
+ (double)minimumRoutingEventDuration;
+ (double)routingSessionTimeout;
+ (id)routingSessionsFromNowPlayingEvents:(id)a3 microLocationEvents:(id)a4 routingSessionTimeout:(double)a5;
+ (void)writeSessions:(id)a3 routingSessionTimeout:(double)a4 file:(id)a5 error:(id *)a6;
- (ARPRoutingSession)initWithCoder:(id)a3;
- (ARPRoutingSession)initWithOutputDeviceID:(id)a3 interval:(id)a4 microLocationProbabilityVector:(id)a5;
- (NSDateInterval)interval;
- (NSDictionary)microLocationProbabilityVector;
- (NSString)outputDeviceID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARPRoutingSession

+ (double)routingSessionTimeout
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.AirPlayRoutePrediction"];
  [v2 doubleForKey:@"RoutingSessionTimeout"];
  if (v3 <= 0.0) {
    double v4 = 10800.0;
  }
  else {
    double v4 = v3;
  }

  return v4;
}

+ (double)minimumRoutingEventDuration
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.AirPlayRoutePrediction"];
  [v2 doubleForKey:@"MinimumRoutingEventDuration"];
  if (v3 <= 0.0) {
    double v4 = 30.0;
  }
  else {
    double v4 = v3;
  }

  return v4;
}

+ (double)microLocationCorrelationGracePeriod
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.AirPlayRoutePrediction"];
  [v2 doubleForKey:@"MicroLocationCorrelationGracePeriod"];
  if (v3 <= 0.0) {
    double v4 = 20.0;
  }
  else {
    double v4 = v3;
  }

  return v4;
}

+ (id)routingSessionsFromNowPlayingEvents:(id)a3 microLocationEvents:(id)a4 routingSessionTimeout:(double)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = ARPLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v28 = [v7 count];
    __int16 v29 = 2048;
    uint64_t v30 = [v8 count];
    _os_log_impl(&dword_20BE41000, v9, OS_LOG_TYPE_INFO, "routingSessionsFromNowPlayingEvents: nowPlayingEvents: %lu microLocationEvents: %lu", buf, 0x16u);
  }

  +[ARPRoutePredictor defaultMicroLocationSimilarityThreshold];
  uint64_t v11 = v10;
  +[ARPRoutingSession microLocationCorrelationGracePeriod];
  uint64_t v13 = v12;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v28 = v11;
    __int16 v29 = 2048;
    uint64_t v30 = v13;
    _os_log_impl(&dword_20BE41000, v9, OS_LOG_TYPE_INFO, "routingSessionsFromNowPlayingEvents: defaultMicroLocationSimilarityThreshold: %f microLocationCorrelationGracePeriod: %f", buf, 0x16u);
  }

  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  v15 = [v7 reverseObjectEnumerator];
  v16 = [v15 allObjects];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __99__ARPRoutingSession_routingSessionsFromNowPlayingEvents_microLocationEvents_routingSessionTimeout___block_invoke;
  v21[3] = &unk_2640B4120;
  id v22 = v8;
  id v23 = v14;
  uint64_t v24 = v13;
  double v25 = a5;
  uint64_t v26 = v11;
  id v17 = v14;
  id v18 = v8;
  [v16 enumerateObjectsUsingBlock:v21];

  v19 = (void *)[v17 copy];
  return v19;
}

void __99__ARPRoutingSession_routingSessionsFromNowPlayingEvents_microLocationEvents_routingSessionTimeout___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 metadata];
  v5 = [MEMORY[0x263F350F0] outputDeviceIDs];
  v6 = [v4 objectForKeyedSubscript:v5];

  id v7 = ARPExtractLongFormVideoOutputDeviceIDs(v6);
  if ([v7 count] == 1)
  {
    v41 = [v7 firstObject];
    uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:inSortedRange:options:usingComparator:", v3, 0, objc_msgSend(*(id *)(a1 + 32), "count"), 1024, &__block_literal_global_70);
    v9 = 0;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v10 = v8 ? v8 - 1 : 0;
      unint64_t v11 = [*(id *)(a1 + 32) count];
      v9 = 0;
      unint64_t v12 = v10 + 2 >= v11 ? v11 : v10 + 2;
      if (v10 < v12)
      {
        v9 = 0;
        double v13 = *(double *)(a1 + 48);
        do
        {
          id v14 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v10];
          v15 = [v14 startDate];
          v16 = [v3 startDate];
          [v15 timeIntervalSinceDate:v16];
          double v18 = fabs(v17);

          if (v18 < v13)
          {
            id v19 = v14;

            v9 = v19;
            double v13 = v18;
          }

          ++v10;
        }
        while (v10 < v12);
      }
    }
    v20 = [v9 metadata];
    v21 = [MEMORY[0x263F350D8] probabilityVector];
    id v22 = [v20 objectForKeyedSubscript:v21];

    if (v9 && v22)
    {
      uint64_t v49 = 0;
      v50 = &v49;
      uint64_t v51 = 0x2020000000;
      uint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
      id v23 = *(void **)(a1 + 40);
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __99__ARPRoutingSession_routingSessionsFromNowPlayingEvents_microLocationEvents_routingSessionTimeout___block_invoke_3;
      v42[3] = &unk_2640B40F8;
      id v24 = v3;
      id v43 = v24;
      uint64_t v47 = *(void *)(a1 + 56);
      id v25 = v41;
      id v44 = v25;
      v40 = v22;
      id v26 = v22;
      uint64_t v48 = *(void *)(a1 + 64);
      id v45 = v26;
      v46 = &v49;
      [v23 enumerateObjectsUsingBlock:v42];
      if (v50[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v27 = objc_alloc(MEMORY[0x263F08798]);
        uint64_t v28 = [v24 startDate];
        __int16 v29 = [v24 endDate];
        uint64_t v30 = (void *)[v27 initWithStartDate:v28 endDate:v29];

        uint64_t v31 = [[ARPRoutingSession alloc] initWithOutputDeviceID:v25 interval:v30 microLocationProbabilityVector:v26];
      }
      else
      {
        uint64_t v30 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:");
        id v38 = objc_alloc(MEMORY[0x263F08798]);
        v32 = [v30 interval];
        v33 = [v32 startDate];
        v34 = [v24 endDate];
        v39 = (void *)[v38 initWithStartDate:v33 endDate:v34];

        v35 = [ARPRoutingSession alloc];
        v36 = [v30 outputDeviceID];
        v37 = [v30 microLocationProbabilityVector];
        uint64_t v31 = [(ARPRoutingSession *)v35 initWithOutputDeviceID:v36 interval:v39 microLocationProbabilityVector:v37];

        [*(id *)(a1 + 40) removeObjectAtIndex:v50[3]];
      }

      [*(id *)(a1 + 40) insertObject:v31 atIndex:0];
      _Block_object_dispose(&v49, 8);
      id v22 = v40;
    }
  }
}

uint64_t __99__ARPRoutingSession_routingSessionsFromNowPlayingEvents_microLocationEvents_routingSessionTimeout___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 startDate];
  v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __99__ARPRoutingSession_routingSessionsFromNowPlayingEvents_microLocationEvents_routingSessionTimeout___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a2;
  uint64_t v8 = [*(id *)(a1 + 32) startDate];
  v9 = [v7 interval];
  unint64_t v10 = [v9 endDate];
  [v8 timeIntervalSinceDate:v10];
  double v12 = v11;
  double v13 = *(double *)(a1 + 64);

  if (v12 > v13)
  {
    id v14 = ARPLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = [*(id *)(a1 + 32) startDate];
      v16 = [v7 interval];
      double v17 = [v16 endDate];
      uint64_t v18 = *(void *)(a1 + 64);
      int v24 = 138412802;
      id v25 = v15;
      __int16 v26 = 2112;
      id v27 = v17;
      __int16 v28 = 2048;
      uint64_t v29 = v18;
      _os_log_impl(&dword_20BE41000, v14, OS_LOG_TYPE_INFO, "routingSessionsFromNowPlayingEvents: stopping enumeration of sessions since: [nowPlayingEvent.startDate (%@) timeIntervalSinceDate:session.interval.endDate (%@)] > routingSessionTimeout (%f)", (uint8_t *)&v24, 0x20u);
    }
LABEL_11:
    *a4 = 1;
    goto LABEL_12;
  }
  id v19 = *(void **)(a1 + 40);
  v20 = [v7 outputDeviceID];
  LODWORD(v19) = [v19 isEqualToString:v20];

  if (v19)
  {
    if (![*(id *)(a1 + 40) isEqualToString:@"Speaker"]
      || ([v7 microLocationProbabilityVector],
          v21 = objc_claimAutoreleasedReturnValue(),
          double v22 = ARPMicroLocationSimilarity(v21, *(void **)(a1 + 48)),
          v21,
          v22 >= *(double *)(a1 + 72)))
    {
      id v23 = ARPLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        int v24 = 134217984;
        id v25 = a3;
        _os_log_impl(&dword_20BE41000, v23, OS_LOG_TYPE_INFO, "routingSessionsFromNowPlayingEvents: found sessionIndex: %lu", (uint8_t *)&v24, 0xCu);
      }

      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
      goto LABEL_11;
    }
  }
LABEL_12:
}

- (ARPRoutingSession)initWithOutputDeviceID:(id)a3 interval:(id)a4 microLocationProbabilityVector:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ARPRoutingSession;
  double v11 = [(ARPRoutingSession *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    outputDeviceID = v11->_outputDeviceID;
    v11->_outputDeviceID = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    interval = v11->_interval;
    v11->_interval = (NSDateInterval *)v14;

    objc_storeStrong((id *)&v11->_microLocationProbabilityVector, a5);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ARPRoutingSession allocWithZone:a3];
  v5 = [(ARPRoutingSession *)self outputDeviceID];
  v6 = [(ARPRoutingSession *)self interval];
  id v7 = [(ARPRoutingSession *)self microLocationProbabilityVector];
  id v8 = [(ARPRoutingSession *)v4 initWithOutputDeviceID:v5 interval:v6 microLocationProbabilityVector:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ARPRoutingSession *)self outputDeviceID];
  v6 = NSStringFromSelector(sel_outputDeviceID);
  [v4 encodeObject:v5 forKey:v6];

  id v7 = [(ARPRoutingSession *)self interval];
  id v8 = NSStringFromSelector(sel_interval);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(ARPRoutingSession *)self microLocationProbabilityVector];
  id v9 = NSStringFromSelector(sel_microLocationProbabilityVector);
  [v4 encodeObject:v10 forKey:v9];
}

- (ARPRoutingSession)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_outputDeviceID);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_interval);
  id v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  double v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
  v15 = NSStringFromSelector(sel_microLocationProbabilityVector);
  v16 = [v4 decodeObjectOfClasses:v14 forKey:v15];

  objc_super v17 = [(ARPRoutingSession *)self initWithOutputDeviceID:v7 interval:v10 microLocationProbabilityVector:v16];
  return v17;
}

+ (void)writeSessions:(id)a3 routingSessionTimeout:(double)a4 file:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a3;
  double v11 = [[ARPRoutingSessionArchive alloc] initWithSessions:v10 routingSessionTimeout:a4];

  id v19 = 0;
  uint64_t v12 = [MEMORY[0x263F08910] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v19];
  id v13 = v19;
  if (!v13)
  {
    uint64_t v14 = [v9 stringByDeletingLastPathComponent];
    v15 = [MEMORY[0x263F08850] defaultManager];
    id v18 = 0;
    [v15 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:&v18];
    id v13 = v18;

    if (!v13)
    {
      id v17 = 0;
      [v12 writeToFile:v9 options:1 error:&v17];
      id v13 = v17;
      if (!v13)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"com.apple.AirPlayRoutePrediction:%s", objc_msgSend(v9, "fileSystemRepresentation"));
        id v16 = objc_claimAutoreleasedReturnValue();
        notify_post((const char *)[v16 UTF8String]);

        id v13 = 0;
      }
    }
  }
  if (a6) {
    *a6 = v13;
  }
}

- (NSString)outputDeviceID
{
  return self->_outputDeviceID;
}

- (NSDictionary)microLocationProbabilityVector
{
  return self->_microLocationProbabilityVector;
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interval, 0);
  objc_storeStrong((id *)&self->_microLocationProbabilityVector, 0);
  objc_storeStrong((id *)&self->_outputDeviceID, 0);
}

@end