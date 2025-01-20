@interface AMDDataSync
+ (id)fetchDeviceID:(id *)a3;
+ (id)generateDeviceIDFileAtLocation:(id)a3 error:(id *)a4;
+ (id)processDataReplicationPayload:(id)a3 error:(id *)a4;
- (AMDDataSync)initWithDataReplicationConfig:(id)a3 error:(id *)a4;
- (NSArray)streamsToSync;
- (NSNumber)deviceForgetThresholdDays;
- (NSNumber)eventLifetimeDays;
- (NSNumber)eventsDeltaSize;
- (NSNumber)fullSyncDeviceResetThresholdDays;
- (NSNumber)fullSyncEventsDeltaSize;
- (NSString)localDeviceId;
- (id)clearUserDataForDevice:(id)a3 fromTimestamp:(id)a4;
- (id)createDeviceEntryWithDevicesData:(id)a3 error:(id *)a4;
- (id)fetch:(id)a3 SortedEventListFromTimestamp:(id)a4 forCurrentDevice:(BOOL)a5 error:(id *)a6;
- (id)fetch:(id)a3 SortedEventListFromTimestamp:(id)a4 onlyForCurrentDevice:(BOOL)a5 forStream:(id)a6 error:(id *)a7;
- (id)fetchEventsForStream:(id)a3 withPredicates:(id)a4 error:(id *)a5;
- (id)fetchLastReadTimestampFromPayload:(id)a3;
- (id)fetchLastReadTimestampFromPayload:(id)a3 forStream:(id)a4;
- (id)filterEventsList:(id)a3 withLastReadTimestamp:(id)a4;
- (id)findAvailableDeviceForFullSyncIn:(id)a3;
- (id)generateFullSyncPayloadWithDevicesData:(id)a3 error:(id *)a4;
- (id)ingestDataFromDevice:(id)a3 withDevicePayload:(id)a4 forStream:(id)a5 fromTimestamp:(id)a6 error:(id *)a7;
- (id)ingestEventsIntoCoreData:(id)a3 withPreviousCheckpoint:(id *)a4 andStreamCheckpointDict:(id)a5 error:(id *)a6;
- (id)ingestEventsIntoSQLite:(id)a3 forStream:(id)a4 withPreviousCheckpoint:(id *)a5 andStreamCheckpointDict:(id)a6 error:(id *)a7;
- (id)performDataReplicationPayloadUpdates:(id)a3 withDeviceRegistry:(id)a4 error:(id *)a5;
- (id)pruneInactiveDevicesFrom:(id)a3;
- (id)updateDataDeletionDict:(id)a3 withDevicesData:(id)a4 error:(id *)a5;
- (void)ingestFullSyncEventsFor:(id)a3 withDeviceData:(id)a4 error:(id *)a5;
- (void)performEventDeltaUpdateFor:(id)a3 withDeviceData:(id)a4 error:(id *)a5;
- (void)pushFullSyncDataFrom:(id)a3 withDeviceData:(id)a4 error:(id *)a5;
- (void)setDeviceForgetThresholdDays:(id)a3;
- (void)setEventLifetimeDays:(id)a3;
- (void)setEventsDeltaSize:(id)a3;
- (void)setFullSyncDeviceResetThresholdDays:(id)a3;
- (void)setFullSyncEventsDeltaSize:(id)a3;
- (void)setLocalDeviceId:(id)a3;
- (void)setStreamsToSync:(id)a3;
@end

@implementation AMDDataSync

- (AMDDataSync)initWithDataReplicationConfig:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v39 = a4;
  id v4 = v41;
  id v41 = 0;
  v38.receiver = v4;
  v38.super_class = (Class)AMDDataSync;
  id v41 = [(AMDDataSync *)&v38 init];
  objc_storeStrong(&v41, v41);
  if (location[0])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v30 = location[0];
      id v29 = (id)[v30 objectForKey:@"isEnabled"];
      if (v29 && ([v29 BOOLValue] & 1) != 0)
      {
        id v25 = (id)[v30 objectForKey:@"eventsDeltaSize"];
        objc_msgSend(v41, "setEventsDeltaSize:");

        id v7 = (id)[v41 eventsDeltaSize];
        BOOL v26 = v7 != 0;

        if (!v26) {
          [v41 setEventsDeltaSize:&unk_26BEC19B8];
        }
        id v23 = (id)[v30 objectForKey:@"eventLifetime"];
        objc_msgSend(v41, "setEventLifetimeDays:");

        id v8 = (id)[v41 eventLifetimeDays];
        BOOL v24 = v8 != 0;

        if (!v24) {
          [v41 setEventLifetimeDays:&unk_26BEC19D0];
        }
        id v21 = (id)[v30 objectForKey:@"deviceForgetThreshold"];
        objc_msgSend(v41, "setDeviceForgetThresholdDays:");

        id v9 = (id)[v41 deviceForgetThresholdDays];
        BOOL v22 = v9 != 0;

        if (!v22) {
          [v41 setDeviceForgetThresholdDays:&unk_26BEC19E8];
        }
        id v19 = (id)[v30 objectForKey:@"fullSyncEventsDeltaSize"];
        objc_msgSend(v41, "setFullSyncEventsDeltaSize:");

        id v10 = (id)[v41 fullSyncEventsDeltaSize];
        BOOL v20 = v10 != 0;

        if (!v20) {
          [v41 setFullSyncEventsDeltaSize:&unk_26BEC1A00];
        }
        id v17 = (id)[v30 objectForKey:@"fullSyncDeviceResetThreshold"];
        objc_msgSend(v41, "setFullSyncDeviceResetThresholdDays:");

        id v11 = (id)[v41 fullSyncDeviceResetThresholdDays];
        BOOL v18 = v11 != 0;

        if (!v18) {
          [v41 setFullSyncDeviceResetThresholdDays:&unk_26BEC1A18];
        }
        id v15 = (id)[v30 objectForKey:@"supportedStreams"];
        objc_msgSend(v41, "setStreamsToSync:");

        id v12 = (id)[v41 streamsToSync];
        BOOL v16 = v12 != 0;

        if (!v16)
        {
          v43 = @"AppUsageDataCoreData";
          id v14 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
          objc_msgSend(v41, "setStreamsToSync:");
        }
        id v28 = +[AMDDataSync fetchDeviceID:v39];
        if (*v39)
        {
          v42 = 0;
        }
        else
        {
          [v41 setLocalDeviceId:v28];
          v42 = (AMDDataSync *)v41;
        }
        int v34 = 1;
        objc_storeStrong(&v28, 0);
      }
      else
      {
        v42 = 0;
        int v34 = 1;
      }
      objc_storeStrong(&v29, 0);
      objc_storeStrong(&v30, 0);
    }
    else
    {
      v33 = @"Data Replication Config is not a dictionary";
      id v32 = &_os_log_internal;
      os_log_type_t v31 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v44, (uint64_t)v33);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v32, v31, "%@", v44, 0xCu);
      }
      objc_storeStrong(&v32, 0);
      id v6 = +[AMDError allocError:10 withMessage:v33];
      id *v39 = v6;
      v42 = 0;
      int v34 = 1;
      objc_storeStrong((id *)&v33, 0);
    }
  }
  else
  {
    v37 = @"Missing Data Replication Config";
    id v36 = &_os_log_internal;
    os_log_type_t v35 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v45, (uint64_t)v37);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v36, v35, "%@", v45, 0xCu);
    }
    objc_storeStrong(&v36, 0);
    id v5 = +[AMDError allocError:10 withMessage:v37];
    id *v39 = v5;
    v42 = 0;
    int v34 = 1;
    objc_storeStrong((id *)&v37, 0);
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v41, 0);
  return v42;
}

+ (id)generateDeviceIDFileAtLocation:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v24 = a4;
  id v11 = objc_alloc_init(MEMORY[0x263F08C38]);
  id v10 = (id)[v11 UUIDString];
  id v23 = (id)objc_msgSend(@"__DR__", "stringByAppendingString:");

  id v12 = +[AMDMiscHelpers getCurrentEpochSeconds];
  v13 = (void *)[v12 longLongValue];

  v22[1] = v13;
  id v14 = (id)[NSNumber numberWithLong:v13];
  v22[0] = (id)[v14 stringValue];

  id v15 = (id)[v23 stringByAppendingString:@"_"];
  id v21 = (id)[v15 stringByAppendingString:v22[0]];

  id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v20 setObject:v21 forKey:@"deviceUUID"];
  id v19 = (id)[MEMORY[0x263F08900] dataWithJSONObject:v20 options:1 error:a4];
  if (*a4)
  {
    id v18 = &_os_log_internal;
    char v17 = 16;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
    {
      log = v18;
      os_log_type_t type = v17;
      id v8 = (id)[*v24 localizedDescription];
      id v16 = v8;
      __os_log_helper_16_2_1_8_64((uint64_t)v27, (uint64_t)v16);
      _os_log_error_impl(&dword_20ABD4000, log, type, "DeviceId creation failed. Error: %@", v27, 0xCu);

      objc_storeStrong(&v16, 0);
    }
    objc_storeStrong(&v18, 0);
    id v26 = 0;
  }
  else
  {
    [v19 writeToURL:location[0] atomically:1];
    id v26 = v23;
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  id v4 = v26;

  return v4;
}

+ (id)fetchDeviceID:(id *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v27 = a1;
  SEL v26 = a2;
  id v25 = a3;
  id v24 = (id)[MEMORY[0x263F08850] defaultManager];
  id v12 = (id)[v24 URLsForDirectory:14 inDomains:1];
  id v23 = (id)[v12 lastObject];

  id v22 = (id)[v23 URLByAppendingPathComponent:0x26BEB2F98];
  id v13 = (id)[v22 URLByAppendingPathComponent:@"__deviceId"];
  id v21 = (id)[v13 URLByAppendingPathExtension:@"json"];

  id v20 = (id)[MEMORY[0x263EFF8F8] dataWithContentsOfURL:v21];
  id v19 = 0;
  if (!v20)
  {
    id v3 = (id)[v27 generateDeviceIDFileAtLocation:v21 error:v25];
    id v4 = v19;
    id v19 = v3;

    if (*v25)
    {
      id v28 = 0;
      int v18 = 1;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  id v17 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v20 options:4 error:v25];
  if (*v25)
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v10 = type;
      id v11 = (id)[*v25 localizedDescription];
      id v14 = v11;
      __os_log_helper_16_2_1_8_64((uint64_t)v29, (uint64_t)v14);
      _os_log_error_impl(&dword_20ABD4000, log, v10, "DeviceId read failed. Error: %@", v29, 0xCu);

      objc_storeStrong(&v14, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v28 = 0;
    int v18 = 1;
  }
  else
  {
    id v5 = (id)[v17 objectForKey:@"deviceUUID"];
    id v6 = v19;
    id v19 = v5;

    int v18 = 0;
  }
  objc_storeStrong(&v17, 0);
  if (!v18)
  {
LABEL_11:
    id v28 = v19;
    int v18 = 1;
  }
LABEL_12:
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  id v7 = v28;

  return v7;
}

- (id)findAvailableDeviceForFullSyncIn:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = &stru_26BEAC9D8;
  unint64_t v18 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(id *)(__b[1] + 8 * v9);
      id v15 = (id)[location[0] objectForKey:v17];
      id v6 = (id)[v15 objectForKey:@"fullSyncResponse"];

      if (v6)
      {
        int v14 = 3;
      }
      else
      {
        id v13 = (id)[v15 objectForKey:@"lastUpdateTimeMilliSeconds"];
        unint64_t v3 = [v13 longLongValue];
        if (v3 > v18)
        {
          unint64_t v18 = [v13 longLongValue];
          objc_storeStrong(&v19, v17);
        }
        objc_storeStrong(&v13, 0);
        int v14 = 0;
      }
      objc_storeStrong(&v15, 0);
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }

  id v5 = v19;
  int v14 = 1;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (id)generateFullSyncPayloadWithDevicesData:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = a4;
  if ([location[0] count])
  {
    char v21 = 1;
    memset(__b, 0, sizeof(__b));
    id obj = location[0];
    uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
    if (v13)
    {
      uint64_t v9 = *(void *)__b[2];
      uint64_t v10 = 0;
      unint64_t v11 = v13;
      while (1)
      {
        uint64_t v8 = v10;
        if (*(void *)__b[2] != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(__b[1] + 8 * v10);
        id v18 = (id)[location[0] objectForKey:v20];
        if ([v18 count]) {
          char v21 = 0;
        }
        objc_storeStrong(&v18, 0);
        ++v10;
        if (v8 + 1 >= v11)
        {
          uint64_t v10 = 0;
          unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
          if (!v11) {
            break;
          }
        }
      }
    }

    if (v21)
    {
      id v26 = 0;
      int v22 = 1;
    }
    else
    {
      id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v16 = [(AMDDataSync *)v25 findAvailableDeviceForFullSyncIn:location[0]];
      [v17 setObject:v16 forKey:@"sourceUUID"];
      [v17 setObject:MEMORY[0x263EFFA78] forKey:@"fsCheckpoint"];
      id v6 = NSNumber;
      id v7 = +[AMDMiscHelpers getCurrentEpochSeconds];
      id v15 = (id)objc_msgSend(v6, "numberWithLongLong:", 1000 * objc_msgSend(v7, "longLongValue"));

      [v17 setObject:v15 forKey:@"fsRequestTime"];
      id v26 = v17;
      int v22 = 1;
      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v16, 0);
      objc_storeStrong(&v17, 0);
    }
  }
  else
  {
    id v26 = 0;
    int v22 = 1;
  }
  objc_storeStrong(location, 0);
  id v4 = v26;

  return v4;
}

- (id)fetchLastReadTimestampFromPayload:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = +[AMDMiscHelpers getCurrentEpochSeconds];
  uint64_t v14 = 1000 * [v13 longLongValue];

  unint64_t v23 = v14;
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v16 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
  if (v16)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0;
    unint64_t v12 = v16;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void *)(__b[1] + 8 * v11);
      id v20 = (id)[location[0] objectForKey:v22];
      id v19 = (id)[v20 objectForKey:@"checkpoints"];
      id v6 = v19;
      id v7 = [(AMDDataSync *)v25 localDeviceId];
      id v18 = (id)objc_msgSend(v6, "objectForKey:");

      id v8 = (id)[v20 objectForKey:@"fullSyncRequest"];
      if (v8)
      {
        int v17 = 3;
      }
      else if (v18)
      {
        unint64_t v3 = [v18 unsignedLongLongValue];
        if (v3 < v23) {
          unint64_t v23 = [v18 unsignedLongLongValue];
        }
        int v17 = 0;
      }
      else
      {
        id v26 = &unk_26BEC1A30;
        int v17 = 1;
      }
      objc_storeStrong(&v18, 0);
      objc_storeStrong(&v19, 0);
      objc_storeStrong(&v20, 0);
      if (v17)
      {
        if (v17 != 3) {
          break;
        }
      }
      ++v11;
      if (v9 + 1 >= v12)
      {
        uint64_t v11 = 0;
        unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
        if (!v12) {
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
LABEL_16:
    int v17 = 0;
  }

  if (!v17) {
    id v26 = (id)[NSNumber numberWithUnsignedLongLong:v23];
  }
  objc_storeStrong(location, 0);
  id v4 = v26;

  return v4;
}

- (id)fetchLastReadTimestampFromPayload:(id)a3 forStream:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = 0;
  objc_storeStrong(&v27, a4);
  id v15 = +[AMDMiscHelpers getCurrentEpochSeconds];
  uint64_t v16 = 1000 * [v15 longLongValue];

  unint64_t v26 = v16;
  memset(__b, 0, sizeof(__b));
  id v17 = location[0];
  uint64_t v18 = [v17 countByEnumeratingWithState:__b objects:v31 count:16];
  if (v18)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0;
    unint64_t v13 = v18;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(v17);
      }
      uint64_t v25 = *(void *)(__b[1] + 8 * v12);
      id v23 = (id)[location[0] objectForKey:v25];
      id v9 = (id)[v23 objectForKey:@"fullSyncRequest"];

      if (v9)
      {
        int v22 = 3;
      }
      else
      {
        id v21 = (id)[v23 objectForKey:@"checkpoints"];
        id v20 = (id)[v21 objectForKey:v27];
        if (v20)
        {
          id v7 = v20;
          id v8 = [(AMDDataSync *)v29 localDeviceId];
          id v19 = (id)objc_msgSend(v7, "objectForKey:");

          if (v19)
          {
            unint64_t v4 = [v19 unsignedLongLongValue];
            if (v4 < v26) {
              unint64_t v26 = [v19 unsignedLongLongValue];
            }
            int v22 = 0;
          }
          else
          {
            id v30 = &unk_26BEC1A30;
            int v22 = 1;
          }
          objc_storeStrong(&v19, 0);
        }
        else
        {
          int v22 = 3;
        }
        objc_storeStrong(&v20, 0);
        objc_storeStrong(&v21, 0);
      }
      objc_storeStrong(&v23, 0);
      if (v22)
      {
        if (v22 != 3) {
          break;
        }
      }
      ++v12;
      if (v10 + 1 >= v13)
      {
        uint64_t v12 = 0;
        unint64_t v13 = [v17 countByEnumeratingWithState:__b objects:v31 count:16];
        if (!v13) {
          goto LABEL_20;
        }
      }
    }
  }
  else
  {
LABEL_20:
    int v22 = 0;
  }

  if (!v22)
  {
    id v30 = (id)[NSNumber numberWithUnsignedLongLong:v26];
    int v22 = 1;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  id v5 = v30;

  return v5;
}

- (id)pruneInactiveDevicesFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = +[AMDMiscHelpers getCurrentEpochSeconds];
  uint64_t v10 = [v12 longLongValue];
  uint64_t v11 = [(AMDDataSync *)v23 deviceForgetThresholdDays];
  uint64_t v13 = 1000 * (v10 - 86400 * [(NSNumber *)v11 longValue]);

  unint64_t v21 = v13;
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v15 = [obj countByEnumeratingWithState:__b objects:v24 count:16];
  if (v15)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0;
    unint64_t v9 = v15;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void *)(__b[1] + 8 * v8);
      id v17 = (id)[location[0] objectForKey:v19];
      id v16 = (id)[v17 objectForKey:@"lastUpdateTimeMilliSeconds"];
      unint64_t v3 = [v16 longLongValue];
      if (v3 < v21) {
        [v20 addObject:v19];
      }
      objc_storeStrong(&v16, 0);
      objc_storeStrong(&v17, 0);
      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0;
        unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v24 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  +[AMDFrameworkMetrics log:v20 withKey:@"prunedDeviceIds" atVerbosity:0];
  id v5 = v20;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (id)filterEventsList:(id)a3 withLastReadTimestamp:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  id v17 = +[AMDMiscHelpers getCurrentEpochSeconds];
  uint64_t v15 = [v17 longLongValue];
  id v16 = [(AMDDataSync *)v32 eventLifetimeDays];
  unint64_t v18 = 1000 * (v15 - 86400 * [(NSNumber *)v16 longValue]);

  unint64_t v29 = v18;
  unint64_t v28 = v18;
  unint64_t v27 = [v30 unsignedLongLongValue];
  if (v18 >= v27) {
    unint64_t v13 = v28;
  }
  else {
    unint64_t v13 = v27;
  }
  unint64_t v26 = v13;
  unint64_t v29 = v13;
  int v25 = 0;
  memset(__b, 0, sizeof(__b));
  id v11 = location[0];
  uint64_t v12 = [v11 countByEnumeratingWithState:__b objects:v33 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(v11);
      }
      id v24 = *(id *)(__b[1] + 8 * v9);
      id v22 = (id)[v24 objectForKey:@"time"];
      if ([v22 unsignedLongLongValue] <= v29)
      {
        ++v25;
        int v21 = 0;
      }
      else
      {
        int v21 = 2;
      }
      objc_storeStrong(&v22, 0);
      if (v21) {
        break;
      }
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [v11 countByEnumeratingWithState:__b objects:v33 count:16];
        if (!v10) {
          goto LABEL_14;
        }
      }
    }
  }
  else
  {
LABEL_14:
    int v21 = 0;
  }

  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  for (int i = v25; i < (unint64_t)[location[0] count]; ++i)
  {
    id v6 = (id)[location[0] objectAtIndex:i];
    objc_msgSend(v20, "addObject:");
  }
  id v5 = v20;
  int v21 = 1;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (id)fetch:(id)a3 SortedEventListFromTimestamp:(id)a4 forCurrentDevice:(BOOL)a5 error:(id *)a6
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v45 = 0;
  objc_storeStrong(&v45, a4);
  BOOL v44 = a5;
  v43 = a6;
  id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a5)
  {
    id v23 = (void *)MEMORY[0x263F08A98];
    int v25 = [(AMDDataSync *)v47 localDeviceId];
    id v24 = (id)[v23 predicateWithFormat:@"deviceId == %@ || deviceId == %@", v25, @"undefined"];
    objc_msgSend(v42, "addObject:");
  }
  if (v45)
  {
    id v22 = (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"time > %llu", objc_msgSend(v45, "longLongValue"));
    objc_msgSend(v42, "addObject:");
  }
  id v41 = +[AMDAppEvent fetchEventsWithPredicate:v42 error:v43];
  id v40 = objc_alloc_init(MEMORY[0x263EFF980]);
  memset(__b, 0, sizeof(__b));
  id v20 = v41;
  uint64_t v21 = [v20 countByEnumeratingWithState:__b objects:v54 count:16];
  if (v21)
  {
    uint64_t v17 = *(void *)__b[2];
    uint64_t v18 = 0;
    unint64_t v19 = v21;
    while (1)
    {
      uint64_t v16 = v18;
      if (*(void *)__b[2] != v17) {
        objc_enumerationMutation(v20);
      }
      id v39 = *(id *)(__b[1] + 8 * v18);
      id v14 = (id)[v39 objectForKey:0x26BEB2838];
      char v15 = [v14 isEqualToString:@"undefined"];

      if (v15)
      {
        id v37 = (id)[v39 mutableCopy];
        id v12 = v37;
        unint64_t v13 = [(AMDDataSync *)v47 localDeviceId];
        objc_msgSend(v12, "setObject:forKey:");

        [v40 addObject:v37];
        objc_storeStrong(&v37, 0);
      }
      else
      {
        [v40 addObject:v39];
      }
      ++v18;
      if (v16 + 1 >= v19)
      {
        uint64_t v18 = 0;
        unint64_t v19 = [v20 countByEnumeratingWithState:__b objects:v54 count:16];
        if (!v19) {
          break;
        }
      }
    }
  }

  if (*v43)
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v10 = type;
      id v11 = (id)[*v43 localizedDescription];
      id v34 = v11;
      __os_log_helper_16_2_1_8_64((uint64_t)v53, (uint64_t)v34);
      _os_log_error_impl(&dword_20ABD4000, log, v10, "Event fetch failed during data sync with error: %@", v53, 0xCu);

      objc_storeStrong(&v34, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v48 = 0;
    int v33 = 1;
  }
  else
  {
    id v32 = +[AMDMiscHelpers sortArrayElements:v40 inDescendingOrder:0 withComparisonKey:0x26BEB24D8 isKeyString:0];
    unint64_t v30 = [v32 count];
    int v29 = [location[0] intValue];
    if (v30 >= v29) {
      unint64_t v8 = v29;
    }
    else {
      unint64_t v8 = v30;
    }
    uint64_t v50 = 0;
    unint64_t v49 = v8;
    uint64_t v51 = 0;
    unint64_t v52 = v8;
    id v31 = (id)objc_msgSend(v32, "subarrayWithRange:", 0, v8);
    id v48 = v31;
    int v33 = 1;
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
  id v6 = v48;

  return v6;
}

- (id)fetchEventsForStream:(id)a3 withPredicates:(id)a4 error:(id *)a5
{
  v47[5] = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v43 = 0;
  objc_storeStrong(&v43, a4);
  id v42 = a5;
  id v41 = +[AMDSQLite getSharedInstance];
  if ([v41 isUsable])
  {
    id v39 = (id)[v41 getDataSchema];
    id v38 = (id)[v39 getTableForStream:location[0]];
    if (v38)
    {
      v46[0] = 0x26BEB4FB8;
      v47[0] = @"fetchEventsFromTable";
      v46[1] = 0x26BEB5158;
      v47[1] = v38;
      v46[2] = 0x26BEB4F98;
      id v15 = +[AMDSQLiteSchema fetchColumnSpecsForTable:v38];
      v47[2] = v15;
      v46[3] = 0x26BEB50D8;
      v47[3] = v43;
      v46[4] = 0x26BEB5138;
      v47[4] = @"time ASC";
      id v36 = (id)[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:5];

      uint64_t v16 = [AMDFetchDescriptor alloc];
      id v17 = (id)[v41 getDataSchema];
      id v35 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v16, "initWithDict:usingSchema:error:", v36);

      if (*v42)
      {
        id v45 = 0;
        int v40 = 1;
      }
      else
      {
        id v34 = (id)[v41 fetchRows:v35 andPersist:0 error:v42];
        id v33 = (id)[v34 objectForKey:0x26BEAD2B8];
        id v32 = (id)[v33 objectForKey:0x26BEAEE58];
        id v31 = (id)[v33 objectForKey:0x26BEAEE38];
        uint64_t v30 = [v32 count];
        if (v30)
        {
          id v13 = (id)[v32 firstObject];
          uint64_t v14 = [v13 count];

          uint64_t v28 = v14;
          id v27 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v14];
          for (int i = 0; i < v28; ++i)
          {
            id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            objc_msgSend(v27, "addObject:");
          }
          for (int j = 0; j < v30; ++j)
          {
            id v24 = (id)[v32 objectAtIndex:j];
            id v23 = (id)[v31 objectAtIndex:j];
            for (int k = 0; k < v28; ++k)
            {
              id v21 = (id)[v27 objectAtIndex:k];
              id v20 = (id)[v24 objectAtIndex:k];
              id v10 = v21;
              id v9 = v20;
              id v11 = (id)[v23 objectForKey:0x26BEACC58];
              objc_msgSend(v10, "setObject:forKey:", v9);

              objc_storeStrong(&v20, 0);
              objc_storeStrong(&v21, 0);
            }
            objc_storeStrong(&v23, 0);
            objc_storeStrong(&v24, 0);
          }
          id v45 = v27;
          int v40 = 1;
          objc_storeStrong(&v27, 0);
        }
        else
        {
          id v29 = (id)[NSString stringWithFormat:@"No column info returned by descriptor"];
          id v6 = +[AMDError allocError:22 withMessage:v29];
          id *v42 = v6;
          id v45 = 0;
          int v40 = 1;
          objc_storeStrong(&v29, 0);
        }
        objc_storeStrong(&v31, 0);
        objc_storeStrong(&v32, 0);
        objc_storeStrong(&v33, 0);
        objc_storeStrong(&v34, 0);
      }
      objc_storeStrong(&v35, 0);
      objc_storeStrong(&v36, 0);
    }
    else
    {
      id v37 = (id)[NSString stringWithFormat:@"No table found for stream: %@", location[0]];
      id v5 = +[AMDError allocError:22 withMessage:v37];
      id *v42 = v5;
      id v45 = 0;
      int v40 = 1;
      objc_storeStrong(&v37, 0);
    }
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
  }
  else
  {
    id *v42 = (id)[v41 generateDBLoadError];
    id v45 = 0;
    int v40 = 1;
  }
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  uint64_t v7 = v45;

  return v7;
}

- (id)fetch:(id)a3 SortedEventListFromTimestamp:(id)a4 onlyForCurrentDevice:(BOOL)a5 forStream:(id)a6 error:(id *)a7
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  v61 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v59 = 0;
  objc_storeStrong(&v59, a4);
  BOOL v58 = a5;
  id v57 = 0;
  objc_storeStrong(&v57, a6);
  v56 = a7;
  id v55 = 0;
  if ([v57 isEqualToString:@"AppUsageDataCoreData"])
  {
    id v54 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v58)
    {
      id v31 = (void *)MEMORY[0x263F08A98];
      id v33 = [(AMDDataSync *)v61 localDeviceId];
      id v32 = (id)[v31 predicateWithFormat:@"deviceId == %@ || deviceId == %@", v33, @"undefined"];
      objc_msgSend(v54, "addObject:");
    }
    if (v59)
    {
      id v30 = (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"time > %llu", objc_msgSend(v59, "longLongValue"));
      objc_msgSend(v54, "addObject:");
    }
    id v53 = +[AMDAppEvent fetchEventsWithPredicate:v54 error:v56];
    id v7 = +[AMDMiscHelpers sortArrayElements:v53 inDescendingOrder:0 withComparisonKey:0x26BEB24D8 isKeyString:0];
    id v8 = v55;
    id v55 = v7;

    objc_storeStrong(&v53, 0);
    objc_storeStrong(&v54, 0);
LABEL_15:
    id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
    memset(__b, 0, sizeof(__b));
    id v26 = v55;
    uint64_t v27 = [v26 countByEnumeratingWithState:__b objects:v68 count:16];
    if (v27)
    {
      uint64_t v23 = *(void *)__b[2];
      uint64_t v24 = 0;
      unint64_t v25 = v27;
      while (1)
      {
        uint64_t v22 = v24;
        if (*(void *)__b[2] != v23) {
          objc_enumerationMutation(v26);
        }
        id v46 = *(id *)(__b[1] + 8 * v24);
        id v20 = (id)[v46 objectForKey:0x26BEB2838];
        char v21 = [v20 isEqualToString:@"undefined"];

        if (v21)
        {
          id v44 = (id)[v46 mutableCopy];
          id v18 = v44;
          unint64_t v19 = [(AMDDataSync *)v61 localDeviceId];
          objc_msgSend(v18, "setObject:forKey:");

          [v47 addObject:v44];
          objc_storeStrong(&v44, 0);
        }
        else
        {
          [v47 addObject:v46];
        }
        ++v24;
        if (v22 + 1 >= v25)
        {
          uint64_t v24 = 0;
          unint64_t v25 = [v26 countByEnumeratingWithState:__b objects:v68 count:16];
          if (!v25) {
            break;
          }
        }
      }
    }

    if (*v56)
    {
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        os_log_type_t v16 = type;
        id v17 = (id)[*v56 localizedDescription];
        id v41 = v17;
        __os_log_helper_16_2_1_8_64((uint64_t)v67, (uint64_t)v41);
        _os_log_error_impl(&dword_20ABD4000, log, v16, "Event fetch failed during data sync with error: %@", v67, 0xCu);

        objc_storeStrong(&v41, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v62 = 0;
      int v48 = 1;
    }
    else
    {
      id v14 = v55;
      unint64_t v39 = [v55 count];
      int v38 = [location[0] intValue];
      if (v39 >= v38) {
        unint64_t v13 = v38;
      }
      else {
        unint64_t v13 = v39;
      }
      uint64_t v64 = 0;
      unint64_t v63 = v13;
      uint64_t v65 = 0;
      unint64_t v66 = v13;
      id v40 = (id)objc_msgSend(v14, "subarrayWithRange:", 0, v13);
      id v62 = v40;
      int v48 = 1;
      objc_storeStrong(&v40, 0);
    }
    objc_storeStrong(&v47, 0);
    goto LABEL_33;
  }
  id v52 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v58)
  {
    uint64_t v28 = NSString;
    id v29 = [(AMDDataSync *)v61 localDeviceId];
    id v51 = (id)[v28 stringWithFormat:@"deviceId = '%@' OR deviceId = '%@'", v29, @"undefined"];

    [v52 addObject:v51];
    objc_storeStrong(&v51, 0);
  }
  if (v59)
  {
    id v50 = (id)objc_msgSend(NSString, "stringWithFormat:", @"time > %llu", objc_msgSend(v59, "longLongValue"));
    [v52 addObject:v50];
    objc_storeStrong(&v50, 0);
  }
  id v49 = (id)[v52 componentsJoinedByString:@" AND "];
  id v9 = [(AMDDataSync *)v61 fetchEventsForStream:v57 withPredicates:v49 error:v56];
  id v10 = v55;
  id v55 = v9;

  if (*v56)
  {
    id v62 = 0;
    int v48 = 1;
  }
  else
  {
    int v48 = 0;
  }
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v52, 0);
  if (!v48) {
    goto LABEL_15;
  }
LABEL_33:
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(location, 0);
  id v11 = v62;

  return v11;
}

- (id)createDeviceEntryWithDevicesData:(id)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v52 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v50 = a4;
  id v49 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v48 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v47 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  memset(__b, 0, sizeof(__b));
  id obj = [(AMDDataSync *)v52 streamsToSync];
  uint64_t v33 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v55 count:16];
  if (v33)
  {
    uint64_t v28 = *(void *)__b[2];
    uint64_t v29 = 0;
    unint64_t v30 = v33;
    while (1)
    {
      uint64_t v27 = v29;
      if (*(void *)__b[2] != v28) {
        objc_enumerationMutation(obj);
      }
      uint64_t v46 = *(void *)(__b[1] + 8 * v29);
      id v44 = 0;
      uint64_t v24 = v52;
      id v26 = [(AMDDataSync *)v52 eventsDeltaSize];
      id v42 = v44;
      id v25 = -[AMDDataSync fetch:SortedEventListFromTimestamp:onlyForCurrentDevice:forStream:error:](v24, "fetch:SortedEventListFromTimestamp:onlyForCurrentDevice:forStream:error:");
      objc_storeStrong(&v44, v42);
      id v43 = v25;

      if (v44)
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          os_log_type_t v22 = type;
          uint64_t v20 = v46;
          id v23 = (id)[v44 localizedDescription];
          id v39 = v23;
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v54, v20, (uint64_t)v39);
          _os_log_error_impl(&dword_20ABD4000, log, v22, "Data fetch failed for stream: %@ error: %@", v54, 0x16u);

          objc_storeStrong(&v39, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
        id v18 = v48;
        id v19 = (id)[v44 localizedDescription];
        objc_msgSend(v18, "setObject:forKey:");

        int v38 = 3;
      }
      else
      {
        [v47 setObject:v43 forKey:v46];
        id v16 = v48;
        id v17 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v43, "count"));
        objc_msgSend(v16, "setObject:forKey:");

        int v38 = 0;
      }
      objc_storeStrong(&v43, 0);
      objc_storeStrong(&v44, 0);
      ++v29;
      if (v27 + 1 >= v30)
      {
        uint64_t v29 = 0;
        unint64_t v30 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v55 count:16];
        if (!v30) {
          break;
        }
      }
    }
  }

  +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v48, @"NewDevicePayloadDataFetchSummary");
  [v49 setObject:v47 forKey:@"eventsDict"];
  id v10 = +[AMDMiscHelpers getCurrentEpochSeconds];
  uint64_t v11 = 1000 * [v10 longLongValue];

  v37[1] = (id)v11;
  id v12 = v49;
  id v13 = (id)[NSNumber numberWithUnsignedLongLong:v11];
  objc_msgSend(v12, "setObject:forKey:");

  v37[0] = objc_alloc_init(MEMORY[0x263EFF9A0]);
  memset(v35, 0, sizeof(v35));
  id v14 = [(AMDDataSync *)v52 streamsToSync];
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:v35 objects:v53 count:16];
  if (v15)
  {
    uint64_t v7 = *(void *)v35[2];
    uint64_t v8 = 0;
    unint64_t v9 = v15;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)v35[2] != v7) {
        objc_enumerationMutation(v14);
      }
      uint64_t v36 = *(void *)(v35[1] + 8 * v8);
      [v37[0] setObject:MEMORY[0x263EFFA78] forKey:v36];
      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0;
        unint64_t v9 = [(NSArray *)v14 countByEnumeratingWithState:v35 objects:v53 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  [v49 setObject:v37[0] forKey:@"checkpoints"];
  [v49 setObject:MEMORY[0x263EFFA78] forKey:@"bookmarks"];
  id v34 = [(AMDDataSync *)v52 generateFullSyncPayloadWithDevicesData:location[0] error:v50];
  if (v34) {
    [v49 setObject:v34 forKey:@"fullSyncRequest"];
  }
  id v5 = v49;
  int v38 = 1;
  objc_storeStrong(&v34, 0);
  objc_storeStrong(v37, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (id)ingestDataFromDevice:(id)a3 withDevicePayload:(id)a4 forStream:(id)a5 fromTimestamp:(id)a6 error:(id *)a7
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v44 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v42 = 0;
  objc_storeStrong(&v42, a4);
  id v41 = 0;
  objc_storeStrong(&v41, a5);
  id v40 = 0;
  objc_storeStrong(&v40, a6);
  id v39 = a7;
  id v38 = (id)[v42 objectForKey:@"eventsDict"];
  id v37 = (id)[v38 objectForKey:v41];
  if (v37)
  {
    id v32 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
    memset(__b, 0, sizeof(__b));
    id v18 = v37;
    uint64_t v19 = [v18 countByEnumeratingWithState:__b objects:v46 count:16];
    if (v19)
    {
      uint64_t v15 = *(void *)__b[2];
      uint64_t v16 = 0;
      unint64_t v17 = v19;
      while (1)
      {
        uint64_t v14 = v16;
        if (*(void *)__b[2] != v15) {
          objc_enumerationMutation(v18);
        }
        id v30 = *(id *)(__b[1] + 8 * v16);
        id v28 = (id)[v30 mutableCopy];
        [v28 setObject:location[0] forKey:0x26BEB2838];
        [v31 addObject:v28];
        objc_storeStrong(&v28, 0);
        ++v16;
        if (v14 + 1 >= v17)
        {
          uint64_t v16 = 0;
          unint64_t v17 = [v18 countByEnumeratingWithState:__b objects:v46 count:16];
          if (!v17) {
            break;
          }
        }
      }
    }

    id v27 = 0;
    id v26 = v40;
    if ([v41 isEqualToString:@"AppUsageDataCoreData"])
    {
      id v25 = v26;
      id v13 = [(AMDDataSync *)v44 ingestEventsIntoCoreData:v31 withPreviousCheckpoint:&v25 andStreamCheckpointDict:0 error:v39];
      objc_storeStrong(&v26, v25);
      id v8 = v27;
      id v27 = v13;
    }
    else
    {
      id v24 = v26;
      id v12 = [(AMDDataSync *)v44 ingestEventsIntoSQLite:v31 forStream:v41 withPreviousCheckpoint:&v24 andStreamCheckpointDict:0 error:v39];
      objc_storeStrong(&v26, v24);
      id v9 = v27;
      id v27 = v12;
    }
    if (*v39)
    {
      id v45 = 0;
      int v33 = 1;
    }
    else
    {
      [v32 setObject:v27 forKey:@"eventsSaved"];
      if (v26) {
        [v32 setObject:v26 forKey:@"lastSavedEventTimestamp"];
      }
      id v45 = v32;
      int v33 = 1;
    }
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  else
  {
    uint64_t v36 = @"Missing events list";
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v47, (uint64_t)v36);
      _os_log_error_impl(&dword_20ABD4000, oslog, type, "%@", v47, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v7 = +[AMDError allocError:10 withMessage:v36];
    id *v39 = v7;
    id v45 = 0;
    int v33 = 1;
    objc_storeStrong((id *)&v36, 0);
  }
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
  id v10 = v45;

  return v10;
}

- (id)clearUserDataForDevice:(id)a3 fromTimestamp:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  int v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  memset(__b, 0, sizeof(__b));
  uint64_t v20 = [(AMDDataSync *)v33 streamsToSync];
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:__b objects:v35 count:16];
  if (v21)
  {
    uint64_t v16 = *(void *)__b[2];
    uint64_t v17 = 0;
    unint64_t v18 = v21;
    while (1)
    {
      uint64_t v15 = v17;
      if (*(void *)__b[2] != v16) {
        objc_enumerationMutation(v20);
      }
      id v29 = *(id *)(__b[1] + 8 * v17);
      id v27 = 0;
      if ([v29 isEqualToString:@"AppUsageDataCoreData"])
      {
        id v26 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
        id v10 = v26;
        id v11 = (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"time < %llu", objc_msgSend(v31, "longLongValue"));
        objc_msgSend(v10, "addObject:");

        id v12 = v26;
        id v13 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"deviceId == %@", location[0]];
        objc_msgSend(v12, "addObject:");

        id v24 = v27;
        id v14 = +[AMDAppEvent deleteUsingPredicates:v26 error:&v24];
        objc_storeStrong(&v27, v24);
        id v25 = v14;
        if (v27)
        {
          id v8 = v30;
          id v9 = (id)[v27 localizedDescription];
          objc_msgSend(v8, "setObject:forKey:");
        }
        else
        {
          [v30 setObject:v25 forKey:v29];
        }
        objc_storeStrong(&v25, 0);
        objc_storeStrong(&v26, 0);
      }
      else
      {
        id v23 = (id)[NSString stringWithFormat:@"deviceId = '%@' AND time < %llu", location[0], objc_msgSend(v31, "longLongValue")];
        id v6 = v23;
        id v34 = v29;
        id v7 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
        id v22 = +[AMDSQLite deleteEventsWithPredicate:forStreams:](AMDSQLite, "deleteEventsWithPredicate:forStreams:", v6);

        [v30 setObject:v22 forKey:v29];
        objc_storeStrong(&v22, 0);
        objc_storeStrong(&v23, 0);
      }
      objc_storeStrong(&v27, 0);
      ++v17;
      if (v15 + 1 >= v18)
      {
        uint64_t v17 = 0;
        unint64_t v18 = [(NSArray *)v20 countByEnumeratingWithState:__b objects:v35 count:16];
        if (!v18) {
          break;
        }
      }
    }
  }

  id v5 = v30;
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (id)updateDataDeletionDict:(id)a3 withDevicesData:(id)a4 error:(id *)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v40 = 0;
  objc_storeStrong(&v40, a4);
  id v39 = a5;
  id v38 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v37 = (id)[location[0] mutableCopy];
  id v36 = (id)[location[0] objectForKey:@"otherDevicesStatus"];
  id v35 = 0;
  if (v36) {
    id v5 = (id)[v36 mutableCopy];
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v6 = v35;
  id v35 = v5;

  memset(__b, 0, sizeof(__b));
  id v18 = v40;
  uint64_t v19 = [v18 countByEnumeratingWithState:__b objects:v45 count:16];
  if (v19)
  {
    uint64_t v15 = *(void *)__b[2];
    uint64_t v16 = 0;
    unint64_t v17 = v19;
    while (1)
    {
      uint64_t v14 = v16;
      if (*(void *)__b[2] != v15) {
        objc_enumerationMutation(v18);
      }
      uint64_t v34 = *(void *)(__b[1] + 8 * v16);
      id v32 = (id)[v40 objectForKey:v34];
      id v31 = (id)[v32 objectForKey:@"clearData"];
      if (v31)
      {
        id v29 = (id)[v31 objectForKey:@"RequestTimeMilliSeconds"];
        if (v29)
        {
          id v28 = (id)[v35 objectForKey:v34];
          if (v28 && (uint64_t v13 = [v28 longLongValue], v13 >= objc_msgSend(v29, "longLongValue")))
          {
            uint64_t v12 = [v28 longLongValue];
            if (v12 > [v29 longLongValue]) {
              +[AMDFrameworkMetrics log:@"LogicalError" withKey:@"DataSyncDeletionError" atVerbosity:0];
            }
            int v30 = 3;
          }
          else
          {
            id v27 = [(AMDDataSync *)v42 clearUserDataForDevice:v34 fromTimestamp:v29];
            [v38 setObject:v27 forKey:v34];
            [v35 setObject:v29 forKey:v34];
            objc_storeStrong(&v27, 0);
            int v30 = 0;
          }
          objc_storeStrong(&v28, 0);
        }
        else
        {
          int v30 = 3;
        }
        objc_storeStrong(&v29, 0);
      }
      else
      {
        int v30 = 3;
      }
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v32, 0);
      ++v16;
      if (v14 + 1 >= v17)
      {
        uint64_t v16 = 0;
        unint64_t v17 = [v18 countByEnumeratingWithState:__b objects:v45 count:16];
        if (!v17) {
          break;
        }
      }
    }
  }

  [v37 setObject:v35 forKey:@"otherDevicesStatus"];
  id v26 = +[AMDKVStore fetchValueForKey:0x26BEB0CF8 error:v39];
  if (*v39)
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v10 = type;
      id v11 = (id)[*v39 localizedDescription];
      id v23 = v11;
      __os_log_helper_16_2_1_8_64((uint64_t)v44, (uint64_t)v23);
      _os_log_error_impl(&dword_20ABD4000, log, v10, "Clear user data timestamp fetch failed: %@", v44, 0xCu);

      objc_storeStrong(&v23, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v43 = 0;
    int v30 = 1;
  }
  else
  {
    if (v26)
    {
      id v22 = (id)[v26 objectForKey:@"time"];
      [v37 setObject:v22 forKey:@"RequestTimeMilliSeconds"];
      objc_storeStrong(&v22, 0);
    }
    +[AMDFrameworkMetrics log:v38 withKey:@"DataSyncDeletionSummary" atVerbosity:0];
    id v43 = v37;
    int v30 = 1;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
  id v7 = v43;

  return v7;
}

- (void)performEventDeltaUpdateFor:(id)a3 withDeviceData:(id)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v53 = 0;
  objc_storeStrong(&v53, a4);
  v52[1] = a5;
  v52[0] = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v29 = (id)[location[0] objectForKey:@"eventsDict"];
  id v51 = (id)[v29 mutableCopy];

  id v30 = (id)[location[0] objectForKey:@"checkpoints"];
  id v50 = (id)[v30 mutableCopy];

  id v31 = (id)[location[0] objectForKey:@"bookmarks"];
  id v49 = (id)[v31 mutableCopy];

  memset(__b, 0, sizeof(__b));
  id v32 = [(AMDDataSync *)v55 streamsToSync];
  uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:__b objects:v56 count:16];
  if (v33)
  {
    uint64_t v24 = *(void *)__b[2];
    uint64_t v25 = 0;
    unint64_t v26 = v33;
    while (1)
    {
      uint64_t v23 = v25;
      if (*(void *)__b[2] != v24) {
        objc_enumerationMutation(v32);
      }
      uint64_t v48 = *(void *)(__b[1] + 8 * v25);
      id v46 = 0;
      id v45 = (id)[v51 objectForKey:v48];
      id v44 = 0;
      if (v45)
      {
        id v41 = [(AMDDataSync *)v55 fetchLastReadTimestampFromPayload:v53 forStream:v48];
        id v40 = [(AMDDataSync *)v55 filterEventsList:v45 withLastReadTimestamp:v41];
        uint64_t v39 = 0;
        uint64_t v13 = [(AMDDataSync *)v55 eventsDeltaSize];
        uint64_t v12 = [(NSNumber *)v13 longValue];
        uint64_t v14 = v12 - [v40 count];

        uint64_t v39 = v14;
        id v38 = (id)[v49 objectForKey:v48];
        uint64_t v15 = v55;
        id v17 = (id)[NSNumber numberWithLong:v39];
        id v36 = v46;
        id v16 = -[AMDDataSync fetch:SortedEventListFromTimestamp:onlyForCurrentDevice:forStream:error:](v15, "fetch:SortedEventListFromTimestamp:onlyForCurrentDevice:forStream:error:");
        objc_storeStrong(&v46, v36);
        id v37 = v16;

        if (v46)
        {
          id v10 = v52[0];
          id v11 = (id)[v46 localizedDescription];
          objc_msgSend(v10, "setObject:forKey:");

          int v42 = 3;
        }
        else
        {
          id v6 = (id)[v40 arrayByAddingObjectsFromArray:v37];
          id v7 = v44;
          id v44 = v6;

          int v42 = 0;
        }
        objc_storeStrong(&v37, 0);
        objc_storeStrong(&v38, 0);
        objc_storeStrong(&v40, 0);
        objc_storeStrong(&v41, 0);
        if (!v42) {
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v20 = v55;
        id v22 = [(AMDDataSync *)v55 eventsDeltaSize];
        id v43 = v46;
        id v21 = -[AMDDataSync fetch:SortedEventListFromTimestamp:onlyForCurrentDevice:forStream:error:](v20, "fetch:SortedEventListFromTimestamp:onlyForCurrentDevice:forStream:error:");
        objc_storeStrong(&v46, v43);
        id v5 = v44;
        id v44 = v21;

        if (!v46)
        {
          [v50 setObject:MEMORY[0x263EFFA78] forKey:v48];
LABEL_13:
          [v51 setObject:v44 forKey:v48];
          if ([v44 count])
          {
            id v35 = (id)[v44 lastObject];
            id v34 = (id)[v35 objectForKey:@"time"];
            [v49 setObject:v34 forKey:v48];
            objc_storeStrong(&v34, 0);
            objc_storeStrong(&v35, 0);
          }
          id v8 = v52[0];
          id v9 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v44, "count"));
          objc_msgSend(v8, "setObject:forKey:");

          int v42 = 0;
          goto LABEL_16;
        }
        id v18 = v52[0];
        id v19 = (id)[v46 localizedDescription];
        objc_msgSend(v18, "setObject:forKey:");

        int v42 = 3;
      }
LABEL_16:
      objc_storeStrong(&v44, 0);
      objc_storeStrong(&v45, 0);
      objc_storeStrong(&v46, 0);
      ++v25;
      if (v23 + 1 >= v26)
      {
        uint64_t v25 = 0;
        unint64_t v26 = [(NSArray *)v32 countByEnumeratingWithState:__b objects:v56 count:16];
        if (!v26) {
          break;
        }
      }
    }
  }

  [location[0] setObject:v51 forKey:@"eventsDict"];
  [location[0] setObject:v50 forKey:@"checkpoints"];
  [location[0] setObject:v49 forKey:@"bookmarks"];
  +[AMDFrameworkMetrics log:v52[0] withKey:@"EventDeltaPushStatus" atVerbosity:0];
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(v52, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(location, 0);
}

- (void)pushFullSyncDataFrom:(id)a3 withDeviceData:(id)a4 error:(id *)a5
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  v76 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v74 = 0;
  objc_storeStrong(&v74, a4);
  v73 = a5;
  id v72 = 0;
  id v71 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v70 = (id)[location[0] objectForKey:@"fullSyncResponse"];
  if (v70)
  {
    id v5 = (id)[v70 objectForKey:@"targetUUID"];
    id v6 = v72;
    id v72 = v5;
  }
  else
  {
    memset(__b, 0, sizeof(__b));
    id v34 = v74;
    uint64_t v35 = [v34 countByEnumeratingWithState:__b objects:v81 count:16];
    if (v35)
    {
      uint64_t v31 = *(void *)__b[2];
      uint64_t v32 = 0;
      unint64_t v33 = v35;
      while (1)
      {
        uint64_t v30 = v32;
        if (*(void *)__b[2] != v31) {
          objc_enumerationMutation(v34);
        }
        id v69 = *(id *)(__b[1] + 8 * v32);
        id v67 = (id)[v74 objectForKey:v69];
        id v66 = (id)[v67 objectForKey:@"fullSyncRequest"];
        if (v66)
        {
          id v64 = (id)[v66 objectForKey:@"sourceUUID"];
          id v27 = v64;
          id v28 = [(AMDDataSync *)v76 localDeviceId];
          char v29 = objc_msgSend(v27, "isEqualToString:");

          if (v29)
          {
            objc_storeStrong(&v72, v69);
            int v65 = 2;
          }
          else
          {
            int v65 = 0;
          }
          objc_storeStrong(&v64, 0);
        }
        else
        {
          int v65 = 3;
        }
        objc_storeStrong(&v66, 0);
        objc_storeStrong(&v67, 0);
        if (v65)
        {
          if (v65 != 3) {
            break;
          }
        }
        ++v32;
        if (v30 + 1 >= v33)
        {
          uint64_t v32 = 0;
          unint64_t v33 = [v34 countByEnumeratingWithState:__b objects:v81 count:16];
          if (!v33) {
            goto LABEL_16;
          }
        }
      }
    }
    else
    {
LABEL_16:
      int v65 = 0;
    }
  }
  if (v72)
  {
    id v63 = (id)[v74 objectForKey:v72];
    if (v63)
    {
      id v60 = (id)[v63 objectForKey:@"fullSyncRequest"];
      char v58 = 0;
      char v56 = 0;
      LOBYTE(v26) = 1;
      if (v60)
      {
        id v59 = (id)[v60 objectForKey:@"sourceUUID"];
        char v58 = 1;
        id v57 = [(AMDDataSync *)v76 localDeviceId];
        char v56 = 1;
        int v26 = objc_msgSend(v59, "isEqualToString:") ^ 1;
      }
      if (v56) {

      }
      if (v58) {
      if (v26)
      }
      {
        if (v60)
        {
          os_log_t v52 = (os_log_t)&_os_log_internal;
          os_log_type_t v51 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            id v21 = v52;
            os_log_type_t v22 = v51;
            id v23 = (id)[v60 objectForKey:@"sourceUUID"];
            id v50 = v23;
            __os_log_helper_16_2_1_8_64((uint64_t)v79, (uint64_t)v50);
            _os_log_impl(&dword_20ABD4000, v21, v22, "Full Sync target device changed source: %@", v79, 0xCu);

            objc_storeStrong(&v50, 0);
          }
          objc_storeStrong((id *)&v52, 0);
          [v71 setObject:@"FullSyncTargetDeviceChangedSource" forKey:@"Status"];
        }
        else
        {
          os_log_t v55 = (os_log_t)&_os_log_internal;
          os_log_type_t v54 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            uint64_t v24 = v55;
            os_log_type_t v25 = v54;
            __os_log_helper_16_0_0(v53);
            _os_log_impl(&dword_20ABD4000, v24, v25, "Full Sync request completed", v53, 2u);
          }
          objc_storeStrong((id *)&v55, 0);
          [v71 setObject:@"TargetDeviceFullSyncRequestCompleted" forKey:@"Status"];
        }
        +[AMDFrameworkMetrics log:v71 withKey:@"FullSyncDataPushStatus" atVerbosity:2];
        [location[0] removeObjectForKey:@"fullSyncResponse"];
        int v65 = 1;
      }
      else
      {
        id v49 = (id)[v60 objectForKey:@"fsCheckpoint"];
        if (v49)
        {
          id v45 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          memset(v43, 0, sizeof(v43));
          id v19 = [(AMDDataSync *)v76 streamsToSync];
          uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:v43 objects:v77 count:16];
          if (v20)
          {
            uint64_t v16 = *(void *)v43[2];
            uint64_t v17 = 0;
            unint64_t v18 = v20;
            while (1)
            {
              uint64_t v15 = v17;
              if (*(void *)v43[2] != v16) {
                objc_enumerationMutation(v19);
              }
              uint64_t v44 = *(void *)(v43[1] + 8 * v17);
              id v42 = 0;
              id v41 = (id)[v49 objectForKey:v44];
              uint64_t v12 = v76;
              uint64_t v14 = [(AMDDataSync *)v76 fullSyncEventsDeltaSize];
              id v39 = v42;
              id v13 = -[AMDDataSync fetch:SortedEventListFromTimestamp:onlyForCurrentDevice:forStream:error:](v12, "fetch:SortedEventListFromTimestamp:onlyForCurrentDevice:forStream:error:");
              objc_storeStrong(&v42, v39);
              id v40 = v13;

              if (v42)
              {
                id v10 = v71;
                id v11 = (id)[v42 localizedDescription];
                objc_msgSend(v10, "setObject:forKey:");

                int v65 = 5;
              }
              else
              {
                [v45 setObject:v40 forKey:v44];
                id v8 = v71;
                id v9 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v40, "count"));
                objc_msgSend(v8, "setObject:forKey:");

                int v65 = 0;
              }
              objc_storeStrong(&v40, 0);
              objc_storeStrong(&v41, 0);
              objc_storeStrong(&v42, 0);
              ++v17;
              if (v15 + 1 >= v18)
              {
                uint64_t v17 = 0;
                unint64_t v18 = [(NSArray *)v19 countByEnumeratingWithState:v43 objects:v77 count:16];
                if (!v18) {
                  break;
                }
              }
            }
          }

          id v38 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          [v38 setObject:v72 forKey:@"targetUUID"];
          [v38 setObject:v45 forKey:@"events"];
          [location[0] setObject:v38 forKey:@"fullSyncResponse"];
          [v71 setObject:@"Ongoing" forKey:@"Status"];
          +[AMDFrameworkMetrics log:v71 withKey:@"FullSyncDataPushStatus" atVerbosity:2];
          objc_storeStrong(&v38, 0);
          objc_storeStrong(&v45, 0);
          int v65 = 0;
        }
        else
        {
          id v48 = (id)[NSString stringWithFormat:@"Full Sync Request payload missing checkpoint dict for device %@", v72];
          os_log_t v47 = (os_log_t)&_os_log_internal;
          os_log_type_t v46 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v78, (uint64_t)v48);
            _os_log_error_impl(&dword_20ABD4000, v47, v46, "%@", v78, 0xCu);
          }
          objc_storeStrong((id *)&v47, 0);
          id v7 = +[AMDError allocError:10 withMessage:v48];
          id *v73 = v7;
          int v65 = 1;
          objc_storeStrong(&v48, 0);
        }
        objc_storeStrong(&v49, 0);
      }
      objc_storeStrong(&v60, 0);
    }
    else
    {
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v80, (uint64_t)v72);
        _os_log_impl(&dword_20ABD4000, oslog, type, "Target device payload absent for devId: %@", v80, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      [v71 setObject:@"TargetDevicePayloadNil" forKey:@"Status"];
      +[AMDFrameworkMetrics log:v71 withKey:@"FullSyncDataPushStatus" atVerbosity:2];
      [location[0] removeObjectForKey:@"fullSyncResponse"];
      int v65 = 1;
    }
    objc_storeStrong(&v63, 0);
  }
  else
  {
    int v65 = 1;
  }
  objc_storeStrong(&v70, 0);
  objc_storeStrong(&v71, 0);
  objc_storeStrong(&v72, 0);
  objc_storeStrong(&v74, 0);
  objc_storeStrong(location, 0);
}

- (id)ingestEventsIntoCoreData:(id)a3 withPreviousCheckpoint:(id *)a4 andStreamCheckpointDict:(id)a5 error:(id *)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v39 = a4;
  id v38 = 0;
  objc_storeStrong(&v38, a5);
  id v37 = a6;
  unsigned int v36 = 0;
  id v35 = 0;
  if ([location[0] count])
  {
    memset(__b, 0, sizeof(__b));
    id v19 = location[0];
    uint64_t v20 = [v19 countByEnumeratingWithState:__b objects:v43 count:16];
    if (v20)
    {
      uint64_t v16 = *(void *)__b[2];
      uint64_t v17 = 0;
      unint64_t v18 = v20;
      while (1)
      {
        uint64_t v15 = v17;
        if (*(void *)__b[2] != v16) {
          objc_enumerationMutation(v19);
        }
        id v33 = *(id *)(__b[1] + 8 * v17);
        id v31 = (id)[v33 objectForKey:@"time"];
        if (*v39 && (uint64_t v14 = [v31 longLongValue], v14 <= objc_msgSend(*v39, "longLongValue")))
        {
          int v34 = 3;
        }
        else
        {
          id v30 = 0;
          unsigned int v29 = 0;
          id v28 = 0;
          unsigned int v13 = +[AMDAppEvent saveEvent:v33 error:&v28];
          objc_storeStrong(&v30, v28);
          unsigned int v29 = v13;
          if (!v30 && v29)
          {
            ++v36;
            objc_storeStrong(&v35, v31);
            if (v38)
            {
              id v24 = (id)[v33 objectForKey:@"deviceId"];
              [v38 setObject:v31 forKey:v24];
              objc_storeStrong(&v24, 0);
            }
            int v34 = 0;
          }
          else
          {
            os_log_t oslog = (os_log_t)&_os_log_internal;
            os_log_type_t type = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              log = oslog;
              os_log_type_t v11 = type;
              uint64_t v9 = (uint64_t)v33;
              id v12 = (id)[v30 localizedDescription];
              id v25 = v12;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v42, v9, (uint64_t)v25);
              _os_log_error_impl(&dword_20ABD4000, log, v11, "Event save operation failed for dictionary: %@ with error: %@", v42, 0x16u);

              objc_storeStrong(&v25, 0);
            }
            objc_storeStrong((id *)&oslog, 0);
            int v34 = 3;
          }
          objc_storeStrong(&v30, 0);
        }
        objc_storeStrong(&v31, 0);
        ++v17;
        if (v15 + 1 >= v18)
        {
          uint64_t v17 = 0;
          unint64_t v18 = [v19 countByEnumeratingWithState:__b objects:v43 count:16];
          if (!v18) {
            break;
          }
        }
      }
    }

    id v6 = v35;
    id *v39 = v6;
    id v41 = (id)[NSNumber numberWithInt:v36];
    int v34 = 1;
  }
  else
  {
    id v41 = &unk_26BEC1A30;
    int v34 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
  id v7 = v41;

  return v7;
}

- (id)ingestEventsIntoSQLite:(id)a3 forStream:(id)a4 withPreviousCheckpoint:(id *)a5 andStreamCheckpointDict:(id)a6 error:(id *)a7
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v49 = 0;
  objc_storeStrong(&v49, a4);
  id v48 = a5;
  id v47 = 0;
  objc_storeStrong(&v47, a6);
  os_log_type_t v46 = a7;
  unsigned int v45 = 0;
  id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
  memset(__b, 0, sizeof(__b));
  id v30 = location[0];
  uint64_t v31 = [v30 countByEnumeratingWithState:__b objects:v56 count:16];
  if (v31)
  {
    uint64_t v23 = *(void *)__b[2];
    uint64_t v24 = 0;
    unint64_t v25 = v31;
    while (1)
    {
      uint64_t v22 = v24;
      if (*(void *)__b[2] != v23) {
        objc_enumerationMutation(v30);
      }
      id v43 = *(id *)(__b[1] + 8 * v24);
      id v41 = (id)[v43 objectForKey:@"time"];
      if (*v48 && (uint64_t v21 = [v41 longLongValue], v21 <= objc_msgSend(*v48, "longLongValue")))
      {
        int v40 = 3;
      }
      else
      {
        [v44 addObject:v43];
        int v40 = 0;
      }
      objc_storeStrong(&v41, 0);
      ++v24;
      if (v22 + 1 >= v25)
      {
        uint64_t v24 = 0;
        unint64_t v25 = [v30 countByEnumeratingWithState:__b objects:v56 count:16];
        if (!v25) {
          break;
        }
      }
    }
  }

  if ([v44 count])
  {
    v54[0] = 0x26BEAEC38;
    v55[0] = v49;
    v54[1] = 0x26BEAEC18;
    v55[1] = v44;
    id v39 = (id)[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
    id v7 = +[AMDSQLite saveEvents:v39 error:v46];
    if (*v46)
    {
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        os_log_type_t v19 = type;
        id v20 = (id)[*v46 localizedDescription];
        id v36 = v20;
        __os_log_helper_16_2_1_8_64((uint64_t)v53, (uint64_t)v36);
        _os_log_error_impl(&dword_20ABD4000, log, v19, "Event save operation failed with error: %@", v53, 0xCu);

        objc_storeStrong(&v36, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v51 = 0;
      int v40 = 1;
    }
    else
    {
      id v17 = (id)[v44 lastObject];
      id v8 = (id)[v17 objectForKey:@"time"];
      *id v48 = v8;

      unsigned int v45 = [v44 count];
      if (v47)
      {
        memset(v34, 0, sizeof(v34));
        id v15 = v44;
        uint64_t v16 = [v15 countByEnumeratingWithState:v34 objects:v52 count:16];
        if (v16)
        {
          uint64_t v12 = *(void *)v34[2];
          uint64_t v13 = 0;
          unint64_t v14 = v16;
          while (1)
          {
            uint64_t v11 = v13;
            if (*(void *)v34[2] != v12) {
              objc_enumerationMutation(v15);
            }
            id v35 = *(id *)(v34[1] + 8 * v13);
            id v33 = (id)[v35 objectForKey:@"time"];
            id v32 = (id)[v35 objectForKey:@"deviceId"];
            [v47 setObject:v33 forKey:v32];
            objc_storeStrong(&v32, 0);
            objc_storeStrong(&v33, 0);
            ++v13;
            if (v11 + 1 >= v14)
            {
              uint64_t v13 = 0;
              unint64_t v14 = [v15 countByEnumeratingWithState:v34 objects:v52 count:16];
              if (!v14) {
                break;
              }
            }
          }
        }

        id v51 = (id)[NSNumber numberWithInt:v45];
        int v40 = 1;
      }
      else
      {
        id v51 = (id)[NSNumber numberWithInt:v45];
        int v40 = 1;
      }
    }
    objc_storeStrong(&v39, 0);
  }
  else
  {
    id v51 = &unk_26BEC1A30;
    int v40 = 1;
  }
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(location, 0);
  uint64_t v9 = v51;

  return v9;
}

- (void)ingestFullSyncEventsFor:(id)a3 withDeviceData:(id)a4 error:(id *)a5
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  v103 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v101 = 0;
  objc_storeStrong(&v101, a4);
  v100[1] = a5;
  v100[0] = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v99 = (id)[location[0] objectForKey:@"fullSyncRequest"];
  id v98 = (id)[v99 objectForKey:@"sourceUUID"];
  if (v98)
  {
    if ([v98 isEqualToString:&stru_26BEAC9D8])
    {
      id v96 = [(AMDDataSync *)v103 findAvailableDeviceForFullSyncIn:v101];
      id v95 = (id)[v99 mutableCopy];
      [v95 setObject:v96 forKey:@"sourceUUID"];
      [location[0] setObject:v95 forKey:@"fullSyncRequest"];
      [v100[0] setObject:@"SourceDeviceNotAssigned" forKey:@"Status"];
      +[AMDFrameworkMetrics log:v100[0] withKey:@"FullSyncDataIngestionStatus" atVerbosity:2];
      int v97 = 1;
      objc_storeStrong(&v95, 0);
      objc_storeStrong(&v96, 0);
    }
    else
    {
      id v94 = (id)[v101 objectForKey:v98];
      id v41 = +[AMDMiscHelpers getCurrentEpochSeconds];
      uint64_t v39 = [v41 longLongValue];
      int v40 = [(AMDDataSync *)v103 fullSyncDeviceResetThresholdDays];
      uint64_t v42 = 1000 * (v39 - 86400 * [(NSNumber *)v40 intValue]);

      unint64_t v93 = v42;
      if (v94)
      {
        id v89 = (id)[v94 objectForKey:@"fullSyncResponse"];
        if (v89)
        {
          id v84 = (id)[v89 objectForKey:@"events"];
          if (v84)
          {
            id v35 = (id)[v99 objectForKey:@"fsCheckpoint"];
            id v80 = (id)[v35 mutableCopy];

            id v36 = (id)[location[0] objectForKey:@"checkpoints"];
            id v79 = (id)[v36 mutableCopy];

            memset(__b, 0, sizeof(__b));
            id v37 = [(AMDDataSync *)v103 streamsToSync];
            uint64_t v38 = [(NSArray *)v37 countByEnumeratingWithState:__b objects:v107 count:16];
            if (v38)
            {
              uint64_t v32 = *(void *)__b[2];
              uint64_t v33 = 0;
              unint64_t v34 = v38;
              while (1)
              {
                uint64_t v31 = v33;
                if (*(void *)__b[2] != v32) {
                  objc_enumerationMutation(v37);
                }
                id v78 = *(id *)(__b[1] + 8 * v33);
                id v76 = (id)[v84 objectForKey:v78];
                id v30 = (id)[v79 objectForKey:v78];
                char v73 = 0;
                char v71 = 0;
                char v69 = 0;
                if (v30)
                {
                  id v74 = (id)[v79 objectForKey:v78];
                  char v73 = 1;
                  id v72 = (id)[v74 mutableCopy];
                  char v71 = 1;
                  id v6 = v72;
                }
                else
                {
                  id v70 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                  char v69 = 1;
                  id v6 = v70;
                }
                id v75 = v6;
                if (v69) {

                }
                if (v71) {
                if (v73)
                }

                id v29 = (id)[v80 objectForKey:v78];
                char v66 = 0;
                if (v29)
                {
                  id v67 = (id)[v80 objectForKey:v78];
                  char v66 = 1;
                  id v7 = v67;
                }
                else
                {
                  id v7 = &unk_26BEC1A30;
                }
                id v68 = v7;
                if (v66) {

                }
                if (v76)
                {
                  id v65 = 0;
                  id v64 = 0;
                  if ([v78 isEqualToString:@"AppUsageDataCoreData"])
                  {
                    id v63 = v68;
                    id v62 = v64;
                    id v28 = [(AMDDataSync *)v103 ingestEventsIntoCoreData:v76 withPreviousCheckpoint:&v63 andStreamCheckpointDict:v75 error:&v62];
                    objc_storeStrong(&v68, v63);
                    objc_storeStrong(&v64, v62);
                    id v8 = v65;
                    id v65 = v28;
                  }
                  else
                  {
                    id v61 = v68;
                    id v60 = v64;
                    id v27 = [(AMDDataSync *)v103 ingestEventsIntoSQLite:v76 forStream:v78 withPreviousCheckpoint:&v61 andStreamCheckpointDict:v75 error:&v60];
                    objc_storeStrong(&v68, v61);
                    objc_storeStrong(&v64, v60);
                    id v8 = v65;
                    id v65 = v27;
                  }

                  if (v64)
                  {
                    int v97 = 3;
                  }
                  else
                  {
                    [v79 setObject:v75 forKey:v78];
                    [v80 setObject:v68 forKey:v78];
                    [v100[0] setObject:v65 forKey:v78];
                    int v97 = 0;
                  }
                  objc_storeStrong(&v64, 0);
                  objc_storeStrong(&v65, 0);
                }
                else
                {
                  [v100[0] setObject:@"New stream added" forKey:v78];
                  int v97 = 3;
                }
                objc_storeStrong(&v68, 0);
                objc_storeStrong(&v75, 0);
                objc_storeStrong(&v76, 0);
                ++v33;
                if (v31 + 1 >= v34)
                {
                  uint64_t v33 = 0;
                  unint64_t v34 = [(NSArray *)v37 countByEnumeratingWithState:__b objects:v107 count:16];
                  if (!v34) {
                    break;
                  }
                }
              }
            }

            char v59 = 1;
            memset(v57, 0, sizeof(v57));
            unint64_t v25 = [(AMDDataSync *)v103 streamsToSync];
            uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:v57 objects:v106 count:16];
            if (v26)
            {
              uint64_t v22 = *(void *)v57[2];
              uint64_t v23 = 0;
              unint64_t v24 = v26;
              while (1)
              {
                uint64_t v21 = v23;
                if (*(void *)v57[2] != v22) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v58 = *(void *)(v57[1] + 8 * v23);
                id v56 = (id)[v80 objectForKey:v58];
                memset(v54, 0, sizeof(v54));
                id v19 = v101;
                uint64_t v20 = [v19 countByEnumeratingWithState:v54 objects:v105 count:16];
                if (v20)
                {
                  uint64_t v16 = *(void *)v54[2];
                  uint64_t v17 = 0;
                  unint64_t v18 = v20;
                  while (1)
                  {
                    uint64_t v15 = v17;
                    if (*(void *)v54[2] != v16) {
                      objc_enumerationMutation(v19);
                    }
                    uint64_t v55 = *(void *)(v54[1] + 8 * v17);
                    id v53 = (id)[v101 objectForKey:v55];
                    id v52 = (id)[v53 objectForKey:@"eventsDict"];
                    id v51 = (id)[v52 objectForKey:v58];
                    if (v51)
                    {
                      id v50 = (id)[v51 firstObject];
                      if (v50)
                      {
                        id v49 = (id)[v50 objectForKey:0x26BEB0DF8];
                        uint64_t v14 = [v56 longLongValue];
                        if (v14 >= [v49 longLongValue])
                        {
                          int v97 = 0;
                        }
                        else
                        {
                          char v59 = 0;
                          int v97 = 6;
                        }
                        objc_storeStrong(&v49, 0);
                      }
                      else
                      {
                        int v97 = 7;
                      }
                      objc_storeStrong(&v50, 0);
                    }
                    else
                    {
                      int v97 = 7;
                    }
                    objc_storeStrong(&v51, 0);
                    objc_storeStrong(&v52, 0);
                    objc_storeStrong(&v53, 0);
                    if (v97)
                    {
                      if (v97 != 7) {
                        break;
                      }
                    }
                    ++v17;
                    if (v15 + 1 >= v18)
                    {
                      uint64_t v17 = 0;
                      unint64_t v18 = [v19 countByEnumeratingWithState:v54 objects:v105 count:16];
                      if (!v18) {
                        goto LABEL_70;
                      }
                    }
                  }
                }
                else
                {
LABEL_70:
                  int v97 = 0;
                }

                int v97 = (v59 & 1) != 0 ? 0 : 4;
                objc_storeStrong(&v56, 0);
                if (v97) {
                  break;
                }
                ++v23;
                if (v21 + 1 >= v24)
                {
                  uint64_t v23 = 0;
                  unint64_t v24 = [(NSArray *)v25 countByEnumeratingWithState:v57 objects:v106 count:16];
                  if (!v24) {
                    goto LABEL_77;
                  }
                }
              }
            }
            else
            {
LABEL_77:
              int v97 = 0;
            }

            if (v59)
            {
              v47[0] = (os_log_t)&_os_log_internal;
              os_log_type_t v46 = OS_LOG_TYPE_DEBUG;
              if (os_log_type_enabled(v47[0], OS_LOG_TYPE_DEBUG))
              {
                uint64_t v9 = v47[0];
                os_log_type_t v10 = v46;
                id v11 = +[AMDMiscHelpers getCurrentEpochSeconds];
                id v45 = v11;
                __os_log_helper_16_2_1_8_64((uint64_t)v104, (uint64_t)v45);
                _os_log_debug_impl(&dword_20ABD4000, v9, v10, "Full sync done at time: %@", v104, 0xCu);

                objc_storeStrong(&v45, 0);
              }
              objc_storeStrong((id *)v47, 0);
              [location[0] removeObjectForKey:@"fullSyncRequest"];
              [v100[0] setObject:@"Complete" forKey:@"Status"];
            }
            else
            {
              id v48 = (id)[v99 mutableCopy];
              id v12 = (id)[v94 objectForKey:@"lastUpdateTimeMilliSeconds"];
              uint64_t v13 = [v12 longLongValue];

              v47[1] = v13;
              if ((unint64_t)v13 < v93) {
                [v48 setObject:&stru_26BEAC9D8 forKey:@"sourceUUID"];
              }
              [v48 setObject:v80 forKey:@"fsCheckpoint"];
              [location[0] setObject:v48 forKey:@"fullSyncRequest"];
              [v100[0] setObject:@"Incomplete" forKey:@"Status"];
              objc_storeStrong(&v48, 0);
            }
            [location[0] setObject:v79 forKey:@"checkpoints"];
            +[AMDFrameworkMetrics log:v100[0] withKey:@"FullSyncDataIngestionStatus" atVerbosity:2];
            objc_storeStrong(&v79, 0);
            objc_storeStrong(&v80, 0);
            int v97 = 0;
          }
          else
          {
            v83 = @"Events dict is absent for source device";
            os_log_t v82 = (os_log_t)&_os_log_internal;
            os_log_type_t v81 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v108, (uint64_t)v83);
              _os_log_error_impl(&dword_20ABD4000, v82, v81, "%@", v108, 0xCu);
            }
            objc_storeStrong((id *)&v82, 0);
            +[AMDFrameworkMetrics log:v83 withKey:@"FullSyncInternalErrorNoEvents" atVerbosity:2];
            int v97 = 1;
            objc_storeStrong((id *)&v83, 0);
          }
          objc_storeStrong(&v84, 0);
        }
        else
        {
          os_log_t v88 = (os_log_t)&_os_log_internal;
          os_log_type_t v87 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v109, (uint64_t)v98);
            _os_log_impl(&dword_20ABD4000, v88, v87, "The source device %@ has not responded to the full sync request", v109, 0xCu);
          }
          objc_storeStrong((id *)&v88, 0);
          id v86 = (id)[v99 objectForKey:@"fsRequestTime"];
          unint64_t v5 = [v86 longLongValue];
          if (v5 >= v93)
          {
            [v100[0] setObject:@"FullSyncRequestContinue" forKey:@"Status"];
          }
          else
          {
            id v85 = (id)[v99 mutableCopy];
            [v85 setObject:&stru_26BEAC9D8 forKey:@"sourceUUID"];
            [location[0] setObject:v85 forKey:@"fullSyncRequest"];
            [v100[0] setObject:@"FullSyncRequestResetTimeout" forKey:@"Status"];
            objc_storeStrong(&v85, 0);
          }
          [v100[0] setObject:v86 forKey:@"FullSyncRequestTime"];
          +[AMDFrameworkMetrics log:v100[0] withKey:@"FullSyncDataIngestionStatus" atVerbosity:2];
          int v97 = 1;
          objc_storeStrong(&v86, 0);
        }
        objc_storeStrong(&v89, 0);
      }
      else
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t type = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v110, (uint64_t)v98);
          _os_log_impl(&dword_20ABD4000, oslog, type, "Source device payload is absent for devId: %@", v110, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        id v90 = (id)[v99 mutableCopy];
        [v90 setObject:&stru_26BEAC9D8 forKey:@"sourceUUID"];
        [location[0] setObject:v90 forKey:@"fullSyncRequest"];
        [v100[0] setObject:@"SourceDevicePayloadUnavailable" forKey:@"Status"];
        +[AMDFrameworkMetrics log:v100[0] withKey:@"FullSyncDataIngestionStatus" atVerbosity:2];
        int v97 = 1;
        objc_storeStrong(&v90, 0);
      }
      objc_storeStrong(&v94, 0);
    }
  }
  else
  {
    [v100[0] setObject:@"SourceDeviceUndefined" forKey:@"Status"];
    +[AMDFrameworkMetrics log:v100[0] withKey:@"FullSyncDataIngestionStatus" atVerbosity:2];
    int v97 = 1;
  }
  objc_storeStrong(&v98, 0);
  objc_storeStrong(&v99, 0);
  objc_storeStrong(v100, 0);
  objc_storeStrong(&v101, 0);
  objc_storeStrong(location, 0);
}

- (id)performDataReplicationPayloadUpdates:(id)a3 withDeviceRegistry:(id)a4 error:(id *)a5
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v84 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v82 = 0;
  objc_storeStrong(&v82, a4);
  os_log_type_t v81 = a5;
  id v80 = (id)[location[0] mutableCopy];
  id v79 = 0;
  id v49 = v82;
  id v50 = [(AMDDataSync *)v84 localDeviceId];
  id v51 = (id)objc_msgSend(v49, "objectForKey:");

  if (v51)
  {
    os_log_type_t v46 = [(AMDDataSync *)v84 localDeviceId];
    id v78 = (id)objc_msgSend(v80, "objectForKey:");

    if (v78 && [v78 count])
    {
      unint64_t v5 = (void *)[v78 mutableCopy];
      id v6 = v79;
      id v79 = v5;

      id v45 = [(AMDDataSync *)v84 localDeviceId];
      objc_msgSend(v80, "removeObjectForKey:");
    }
    else if ([v78 count])
    {
      id v43 = NSString;
      id v44 = [(AMDDataSync *)v84 localDeviceId];
      id v77 = (id)[v43 stringWithFormat:@"DeviceId present in the registry but payload absent for: %@", v44];

      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v92, (uint64_t)v77);
        _os_log_error_impl(&dword_20ABD4000, oslog, type, "%@", v92, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      +[AMDFrameworkMetrics log:v77 withKey:@"DataReplicationError" atVerbosity:0];
      objc_storeStrong(&v77, 0);
    }
    else
    {
      objc_storeStrong(&v79, 0);
    }
    objc_storeStrong(&v78, 0);
  }
  id v74 = [(AMDDataSync *)v84 pruneInactiveDevicesFrom:v80];
  if (v79)
  {
    [(AMDDataSync *)v84 performEventDeltaUpdateFor:v79 withDeviceData:v80 error:v81];
    if (*v81)
    {
      id v85 = 0;
      int v73 = 1;
      goto LABEL_55;
    }
    [(AMDDataSync *)v84 pushFullSyncDataFrom:v79 withDeviceData:v80 error:v81];
    if (*v81)
    {
      id v85 = 0;
      int v73 = 1;
      goto LABEL_55;
    }
  }
  else
  {
    id v7 = [(AMDDataSync *)v84 createDeviceEntryWithDevicesData:v80 error:v81];
    id v8 = v79;
    id v79 = v7;

    if (*v81)
    {
      id v85 = 0;
      int v73 = 1;
      goto LABEL_55;
    }
    id v41 = v82;
    uint64_t v42 = [(AMDDataSync *)v84 localDeviceId];
    objc_msgSend(v41, "setObject:forKey:", MEMORY[0x263EFFA78]);
  }
  id v40 = (id)[v79 objectForKey:@"fullSyncRequest"];

  if (v40)
  {
    [(AMDDataSync *)v84 ingestFullSyncEventsFor:v79 withDeviceData:v80 error:v81];
  }
  else
  {
    id v72 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v37 = (id)[v79 objectForKey:@"checkpoints"];
    id v71 = (id)[v37 mutableCopy];

    memset(__b, 0, sizeof(__b));
    uint64_t v38 = [(AMDDataSync *)v84 streamsToSync];
    uint64_t v39 = [(NSArray *)v38 countByEnumeratingWithState:__b objects:v91 count:16];
    if (v39)
    {
      uint64_t v34 = *(void *)__b[2];
      uint64_t v35 = 0;
      unint64_t v36 = v39;
      while (1)
      {
        uint64_t v33 = v35;
        if (*(void *)__b[2] != v34) {
          objc_enumerationMutation(v38);
        }
        uint64_t v70 = *(void *)(__b[1] + 8 * v35);
        id v68 = 0;
        id v32 = (id)[v71 objectForKey:v70];

        if (v32)
        {
          id v31 = (id)[v71 objectForKey:v70];
          uint64_t v9 = (void *)[v31 mutableCopy];
          id v10 = v68;
          id v68 = v9;
        }
        else
        {
          id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          id v12 = v68;
          id v68 = v11;
        }
        id v67 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        if (!v68)
        {
          id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          id v14 = v68;
          id v68 = v13;
        }
        memset(v65, 0, sizeof(v65));
        id v29 = v80;
        uint64_t v30 = [v29 countByEnumeratingWithState:v65 objects:v90 count:16];
        if (v30)
        {
          uint64_t v26 = *(void *)v65[2];
          uint64_t v27 = 0;
          unint64_t v28 = v30;
          while (1)
          {
            uint64_t v25 = v27;
            if (*(void *)v65[2] != v26) {
              objc_enumerationMutation(v29);
            }
            uint64_t v66 = *(void *)(v65[1] + 8 * v27);
            id v64 = (id)[v80 objectForKey:v66];
            id v63 = (id)[v68 objectForKey:v66];
            id v62 = 0;
            id v60 = 0;
            id v24 = [(AMDDataSync *)v84 ingestDataFromDevice:v66 withDevicePayload:v64 forStream:v70 fromTimestamp:v63 error:&v60];
            objc_storeStrong(&v62, v60);
            id v61 = v24;
            if (v62)
            {
              uint64_t v22 = NSString;
              uint64_t v21 = v66;
              id v23 = (id)[v62 localizedDescription];
              id v59 = (id)[v22 stringWithFormat:@"Data ingestion failed for device: %@ with error: %@", v21, v23];

              os_log_t v58 = (os_log_t)&_os_log_internal;
              os_log_type_t v57 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                id v19 = v58;
                os_log_type_t v20 = v57;
                __os_log_helper_16_2_1_8_64((uint64_t)v89, (uint64_t)v59);
                _os_log_error_impl(&dword_20ABD4000, v19, v20, "%@", v89, 0xCu);
              }
              objc_storeStrong((id *)&v58, 0);
              [v72 setObject:v59 forKey:v66];
              int v73 = 5;
              objc_storeStrong(&v59, 0);
            }
            else
            {
              id v56 = (id)[v61 objectForKey:@"lastSavedEventTimestamp"];
              if (v56)
              {
                [v68 setObject:v56 forKey:v66];
                [v67 setObject:v61 forKey:v66];
                int v73 = 0;
              }
              else
              {
                os_log_t v55 = (os_log_t)&_os_log_internal;
                os_log_type_t v54 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                {
                  unint64_t v18 = v55;
                  __os_log_helper_16_2_1_8_64((uint64_t)v88, v66);
                  _os_log_impl(&dword_20ABD4000, v18, v54, "No data was ingested for deviceId: %@", v88, 0xCu);
                }
                objc_storeStrong((id *)&v55, 0);
                int v73 = 5;
              }
              objc_storeStrong(&v56, 0);
            }
            objc_storeStrong(&v61, 0);
            objc_storeStrong(&v62, 0);
            objc_storeStrong(&v63, 0);
            objc_storeStrong(&v64, 0);
            ++v27;
            if (v25 + 1 >= v28)
            {
              uint64_t v27 = 0;
              unint64_t v28 = [v29 countByEnumeratingWithState:v65 objects:v90 count:16];
              if (!v28) {
                break;
              }
            }
          }
        }

        [v71 setObject:v68 forKey:v70];
        [v72 setObject:v67 forKey:v70];
        objc_storeStrong(&v67, 0);
        objc_storeStrong(&v68, 0);
        ++v35;
        if (v33 + 1 >= v36)
        {
          uint64_t v35 = 0;
          unint64_t v36 = [(NSArray *)v38 countByEnumeratingWithState:__b objects:v91 count:16];
          if (!v36) {
            break;
          }
        }
      }
    }

    [v79 setObject:v71 forKey:@"checkpoints"];
    +[AMDFrameworkMetrics log:v72 withKey:@"EventDeltaIngestionStatus" atVerbosity:0];
    objc_storeStrong(&v71, 0);
    objc_storeStrong(&v72, 0);
  }
  id v53 = (id)[v79 objectForKey:@"clearData"];
  if (!v53) {
    objc_storeStrong(&v53, MEMORY[0x263EFFA78]);
  }
  id v52 = [(AMDDataSync *)v84 updateDataDeletionDict:v53 withDevicesData:v80 error:v81];
  if (*v81)
  {
    id v85 = 0;
  }
  else
  {
    [v79 setObject:v52 forKey:@"clearData"];
    v86[0] = @"myUUID";
    uint64_t v17 = [(AMDDataSync *)v84 localDeviceId];
    v87[0] = v17;
    v86[1] = @"localDeviceData";
    v87[1] = v79;
    v86[2] = @"expiredDeviceIds";
    v87[2] = v74;
    v86[3] = @"deviceRegistry";
    v87[3] = v82;
    id v85 = (id)[NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:4];
  }
  int v73 = 1;
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v53, 0);
LABEL_55:
  objc_storeStrong(&v74, 0);
  objc_storeStrong(&v79, 0);
  objc_storeStrong(&v80, 0);
  objc_storeStrong(&v82, 0);
  objc_storeStrong(location, 0);
  uint64_t v15 = v85;

  return v15;
}

+ (id)processDataReplicationPayload:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = a4;
  id v30 = (id)[location[0] objectForKey:@"drConfig"];
  id v29 = (id)[location[0] objectForKey:@"drData"];
  id v28 = (id)[location[0] objectForKey:@"deviceRegistry"];
  id v27 = [[AMDDataSync alloc] initWithDataReplicationConfig:v30 error:a4];
  if (*a4)
  {
    id v33 = 0;
    int v26 = 1;
  }
  else if (v29)
  {
    if (v28)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v29;
          id v12 = (id)[v28 mutableCopy];
          id v11 = (id)[v27 performDataReplicationPayloadUpdates:v13 withDeviceRegistry:v12 error:v31];
          if (*v31) {
            id v33 = 0;
          }
          else {
            id v33 = v11;
          }
          int v26 = 1;
          objc_storeStrong(&v11, 0);
          objc_storeStrong(&v12, 0);
          objc_storeStrong(&v13, 0);
        }
        else
        {
          uint64_t v16 = @"Device registry is not a dictionary";
          os_log_t oslog = (os_log_t)&_os_log_internal;
          os_log_type_t v14 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v34, (uint64_t)v16);
            _os_log_error_impl(&dword_20ABD4000, oslog, v14, "%@", v34, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          id v7 = +[AMDError allocError:10 withMessage:v16];
          *id v31 = v7;
          id v33 = 0;
          int v26 = 1;
          objc_storeStrong((id *)&v16, 0);
        }
      }
      else
      {
        id v19 = @"Data Replication data is not a dictionary";
        id v18 = &_os_log_internal;
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v35, (uint64_t)v19);
          _os_log_error_impl(&dword_20ABD4000, (os_log_t)v18, v17, "%@", v35, 0xCu);
        }
        objc_storeStrong(&v18, 0);
        id v6 = +[AMDError allocError:10 withMessage:v19];
        *id v31 = v6;
        id v33 = 0;
        int v26 = 1;
        objc_storeStrong((id *)&v19, 0);
      }
    }
    else
    {
      uint64_t v22 = @"Missing Device registry dict";
      id v21 = &_os_log_internal;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v36, (uint64_t)v22);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v21, v20, "%@", v36, 0xCu);
      }
      objc_storeStrong(&v21, 0);
      id v5 = +[AMDError allocError:10 withMessage:v22];
      *id v31 = v5;
      id v33 = 0;
      int v26 = 1;
      objc_storeStrong((id *)&v22, 0);
    }
  }
  else
  {
    uint64_t v25 = @"Missing DR Data payload";
    id v24 = &_os_log_internal;
    os_log_type_t v23 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v37, (uint64_t)v25);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v24, v23, "%@", v37, 0xCu);
    }
    objc_storeStrong(&v24, 0);
    id v4 = +[AMDError allocError:10 withMessage:v25];
    *id v31 = v4;
    id v33 = 0;
    int v26 = 1;
    objc_storeStrong((id *)&v25, 0);
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  id v8 = v33;

  return v8;
}

- (NSNumber)deviceForgetThresholdDays
{
  return self->_deviceForgetThresholdDays;
}

- (void)setDeviceForgetThresholdDays:(id)a3
{
}

- (NSNumber)eventsDeltaSize
{
  return self->_eventsDeltaSize;
}

- (void)setEventsDeltaSize:(id)a3
{
}

- (NSNumber)eventLifetimeDays
{
  return self->_eventLifetimeDays;
}

- (void)setEventLifetimeDays:(id)a3
{
}

- (NSNumber)fullSyncDeviceResetThresholdDays
{
  return self->_fullSyncDeviceResetThresholdDays;
}

- (void)setFullSyncDeviceResetThresholdDays:(id)a3
{
}

- (NSNumber)fullSyncEventsDeltaSize
{
  return self->_fullSyncEventsDeltaSize;
}

- (void)setFullSyncEventsDeltaSize:(id)a3
{
}

- (NSString)localDeviceId
{
  return self->_localDeviceId;
}

- (void)setLocalDeviceId:(id)a3
{
}

- (NSArray)streamsToSync
{
  return self->_streamsToSync;
}

- (void)setStreamsToSync:(id)a3
{
}

- (void).cxx_destruct
{
}

@end