@interface IDEDataProvider_Energy
+ (id)sharedDataProvider;
- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5;
- (IDEDataProvider_Energy)init;
- (id)captureAttributes:(id)a3 forPIDs:(id)a4;
- (id)startSamplingForPIDs:(id)a3;
- (id)stopSamplingForPIDs:(id)a3;
- (id)supportedAttributes;
@end

@implementation IDEDataProvider_Energy

+ (id)sharedDataProvider
{
  if (qword_153E0 != -1) {
    dispatch_once(&qword_153E0, &stru_10608);
  }
  v2 = (void *)qword_153D8;
  return v2;
}

- (IDEDataProvider_Energy)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDEDataProvider_Energy;
  v2 = [(IDEDataProvider_Energy *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queryWasStartedForPidDictionary = v2->_queryWasStartedForPidDictionary;
    v2->_queryWasStartedForPidDictionary = v3;
  }
  return v2;
}

- (id)supportedAttributes
{
  if (qword_153F0 != -1) {
    dispatch_once(&qword_153F0, &stru_10628);
  }
  v2 = (void *)qword_153E8;
  return v2;
}

- (id)startSamplingForPIDs:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableSet set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_queryWasStartedForPidDictionary objectForKey:v9];
        if ([v10 BOOLValue])
        {
          [v5 addObject:v9];
        }
        else
        {
          [v9 intValue];
          if ((PLBatteryGaugeStartTracingForPid() & 0x80000000) == 0)
          {

            [(NSMutableDictionary *)self->_queryWasStartedForPidDictionary setObject:&__kCFBooleanTrue forKey:v9];
            v10 = &__kCFBooleanTrue;
            [v5 addObject:v9];
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v5;
}

- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(NSMutableDictionary *)self->_queryWasStartedForPidDictionary objectForKey:v8];
  if ([v9 BOOLValue])
  {
    v49 = [(NSDictionary *)self->_lastSnapshotForAllPids objectForKeyedSubscript:v8];
    v10 = [v49 objectForKeyedSubscript:@"usage_data"];
    v11 = [v10 objectForKeyedSubscript:&off_11848];
    v12 = v11;
    BOOL v13 = v11 != 0;
    if (v11)
    {
      long long v14 = [v11 objectForKeyedSubscript:@"cost"];
      [v7 setObject:v14 forKeyedSubscript:@"energy.cost"];

      long long v15 = [v12 objectForKeyedSubscript:@"overhead"];
      [v7 setObject:v15 forKeyedSubscript:@"energy.overhead"];

      [v7 setObject:&off_11860 forKeyedSubscript:@"energy.version"];
      long long v16 = [v10 objectForKeyedSubscript:&off_11878];

      if (v16)
      {
        v17 = [v16 objectForKeyedSubscript:@"cost"];
        [v7 setObject:v17 forKeyedSubscript:@"energy.cpu.cost"];

        v18 = [v16 objectForKeyedSubscript:@"overhead"];
        [v7 setObject:v18 forKeyedSubscript:@"energy.cpu.overhead"];
      }
      v19 = [v10 objectForKeyedSubscript:&off_11890];

      if (v19)
      {
        v20 = [v19 objectForKeyedSubscript:@"cost"];
        [v7 setObject:v20 forKeyedSubscript:@"energy.networking.cost"];

        v21 = [v19 objectForKeyedSubscript:@"overhead"];
        [v7 setObject:v21 forKeyedSubscript:@"energy.networkning.overhead"];
      }
      v22 = [v10 objectForKeyedSubscript:&off_118A8];

      if (v22)
      {
        v23 = [v22 objectForKeyedSubscript:@"cost"];
        [v7 setObject:v23 forKeyedSubscript:@"energy.location.cost"];

        v24 = [v22 objectForKeyedSubscript:@"overhead"];
        [v7 setObject:v24 forKeyedSubscript:@"energy.location.overhead"];
      }
      v25 = [v10 objectForKeyedSubscript:&off_118C0];

      if (v25)
      {
        v26 = [v25 objectForKeyedSubscript:@"cost"];
        [v7 setObject:v26 forKeyedSubscript:@"energy.gpu.cost"];

        v27 = [v25 objectForKeyedSubscript:@"overhead"];
        [v7 setObject:v27 forKeyedSubscript:@"energy.gpu.overhead"];
      }
      v28 = [v10 objectForKeyedSubscript:&off_118D8];

      if (v28)
      {
        v29 = [v28 objectForKeyedSubscript:@"cost"];
        [v7 setObject:v29 forKeyedSubscript:@"energy.display.cost"];

        v30 = [v28 objectForKeyedSubscript:@"overhead"];
        [v7 setObject:v30 forKeyedSubscript:@"energy.display.overhead"];
      }
      v31 = [v10 objectForKeyedSubscript:&off_118F0];

      if (v31)
      {
        v32 = [v31 objectForKeyedSubscript:@"cost"];
        [v7 setObject:v32 forKeyedSubscript:@"energy.appstate.cost"];

        v33 = [v31 objectForKeyedSubscript:@"overhead"];
        [v7 setObject:v33 forKeyedSubscript:@"energy.appstate.overhead"];
      }
      v34 = [v10 objectForKeyedSubscript:&off_11908];

      if (v34)
      {
        v35 = [v34 objectForKeyedSubscript:@"cost"];
        uint64_t v36 = sub_8D5C(v35);

        v37 = +[NSNumber numberWithInteger:v36];
        [v7 setObject:v37 forKeyedSubscript:@"energy.thermalstate.cost"];
      }
      v38 = [v10 objectForKeyedSubscript:&off_11920];

      if (v38)
      {
        v39 = [v38 objectForKeyedSubscript:@"cost"];
        uint64_t v40 = sub_8D5C(v39);

        v41 = +[NSNumber numberWithInteger:v40];
        [v7 setObject:v41 forKeyedSubscript:@"energy.inducedthermalstate.cost"];
      }
      v42 = [(IDEDataProvider *)self initialQueryTimeForPidDictionary];
      v43 = [v42 objectForKeyedSubscript:v8];
      +[NSDate date];
      if (v43) {
        v44 = {;
      }
        [v44 timeIntervalSinceDate:v43];
        double v46 = v45;

        v47 = +[NSNumber numberWithUnsignedInteger:vcvtpd_u64_f64(v46)];
        [v7 setObject:v47 forKeyedSubscript:@"kIDEGaugeSecondsSinceInitialQueryKey"];
      }
      else {
        v43 = {;
      }
        [v42 setObject:v43 forKeyedSubscript:v8];
        [v7 setObject:&off_11938 forKeyedSubscript:@"kIDEGaugeSecondsSinceInitialQueryKey"];
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)stopSamplingForPIDs:(id)a3
{
  id v12 = a3;
  id v4 = +[NSMutableSet set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v12;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_queryWasStartedForPidDictionary objectForKey:v9];
        if ([v10 BOOLValue])
        {
          [v9 intValue];
          if ((PLBatteryGaugeStopTracingForPid() & 0x80000000) == 0) {
            [v4 addObject:v9];
          }
          [(NSMutableDictionary *)self->_queryWasStartedForPidDictionary removeObjectForKey:v9];
        }
        else
        {
          [v4 addObject:v9];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)captureAttributes:(id)a3 forPIDs:(id)a4
{
  id v6 = a3;
  id v17 = a4;
  uint64_t v7 = +[NSMutableDictionary dictionary];
  if ([v17 count])
  {
    PLBatteryGaugeGetSnapshot();
    id v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    lastSnapshotForAllPids = self->_lastSnapshotForAllPids;
    self->_lastSnapshotForAllPids = v8;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v17;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v15 = +[NSMutableDictionary dictionary];
        if ([(IDEDataProvider_Energy *)self captureAttributes:v6 toDictionary:v15 forPID:v14])
        {
          [v7 setObject:v15 forKeyedSubscript:v14];
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSnapshotForAllPids, 0);
  objc_storeStrong((id *)&self->_queryWasStartedForPidDictionary, 0);
}

@end