@interface DSIDRecord(Private)
- (BOOL)isEqual:()Private;
- (BOOL)resetDeviceNewsPlusSubscriberIDIfNeeded;
- (uint64_t)hasIDForClientType:()Private;
- (uint64_t)isActiveRecord;
- (void)ensureiAdIDs;
- (void)removeIDForClientType:()Private;
- (void)retrieveSegmentDataFromiTunes:()Private;
- (void)sendPersonalizedAdsStatusToAdPlatforms:()Private;
- (void)sendSegmentDataToAdPlatforms:()Private;
@end

@implementation DSIDRecord(Private)

- (uint64_t)hasIDForClientType:()Private
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a1;
  objc_sync_enter(v4);
  v5 = [v4 ADIDRecords];
  v6 = [NSNumber numberWithInteger:a3];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7) {
    goto LABEL_5;
  }
  v8 = [v4 idForClientType:a3];
  char v9 = StringIsFromUUID();

  if ((v9 & 1) == 0)
  {
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"Generating IDs due to client type %ld not being in UUID format", a3);
    _ADLog();

    v15 = @"ClientIDType";
    v12 = [NSNumber numberWithInteger:a3];
    v16[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    AnalyticsSendEvent();

LABEL_5:
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = 1;
LABEL_6:
  objc_sync_exit(v4);

  return v10;
}

- (void)removeIDForClientType:()Private
{
  id obj = a1;
  objc_sync_enter(obj);
  id v4 = [obj ADIDRecords];
  v5 = [NSNumber numberWithInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    v7 = [obj ADIDRecords];
    v8 = [NSNumber numberWithInteger:a3];
    [v7 removeObjectForKey:v8];

    [obj setDirty:1];
  }
  objc_sync_exit(obj);
}

- (void)ensureiAdIDs
{
  id obj = a1;
  objc_sync_enter(obj);
  uint64_t v1 = 0;
  int v2 = 0;
  do
  {
    if (v1 != 1) {
      v2 |= [obj hasIDForClientType:v1] ^ 1;
    }
    ++v1;
  }
  while (v1 != 5);
  if (v2 & 1 | (([obj hasIDForClientType:6] & 1) == 0))
  {
    for (uint64_t i = 0; i != 5; ++i)
    {
      id v4 = objc_alloc_init(MEMORY[0x263F241E0]);
      v5 = [obj ADIDRecords];
      v6 = [NSNumber numberWithInteger:i];
      [v5 setObject:v4 forKeyedSubscript:v6];

      v7 = NSString;
      v8 = [obj ADIDRecords];
      char v9 = [NSNumber numberWithInteger:i];
      uint64_t v10 = [v8 objectForKeyedSubscript:v9];
      v11 = [obj DSID];
      v12 = ClientTypeToString();
      v13 = [v7 stringWithFormat:@"Generated ID %@ for DSID %@ and client type %ld(%@)", v10, v11, i, v12];
      _ADLog();
    }
    [obj setLastSentSegmentDataTimestamp:0];
    id v14 = objc_alloc_init(MEMORY[0x263F241E0]);
    v15 = [obj ADIDRecords];
    v16 = [NSNumber numberWithInteger:6];
    [v15 setObject:v14 forKeyedSubscript:v16];

    v17 = NSString;
    v18 = [obj ADIDRecords];
    v19 = [NSNumber numberWithInteger:6];
    v20 = [v18 objectForKeyedSubscript:v19];
    v21 = [obj DSID];
    v22 = ClientTypeToString();
    v23 = [v17 stringWithFormat:@"Generated ID %@ for DSID %@ and client type %ld(%@)", v20, v21, 6, v22];
    _ADLog();

    v24 = [MEMORY[0x263EFF910] date];
    objc_msgSend(obj, "setDeviceIDRotationTimestamp:", objc_msgSend(v24, "AD_toSinceReferenceTime"));
  }
  objc_sync_exit(obj);
}

- (BOOL)resetDeviceNewsPlusSubscriberIDIfNeeded
{
  int v2 = [MEMORY[0x263EFF910] date];
  uint64_t v3 = objc_msgSend(v2, "AD_toSinceReferenceTime");

  int v4 = v3 - [a1 deviceIDRotationTimestamp];
  if (v4 <= 86399)
  {
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"It has not yet been 24 hours since deviceID was rotated. Last rotated at %d", objc_msgSend(a1, "deviceIDRotationTimestamp"));
    _ADLog();
  }
  else
  {
    id v5 = a1;
    objc_sync_enter(v5);
    v6 = NSString;
    v7 = [v5 DSID];
    v8 = [v6 stringWithFormat:@"Resetting deviceNewsPlusSubscriberID at time %d for DSID record %@.", v3, v7];
    _ADLog();

    char v9 = [v5 ADIDRecords];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __62__DSIDRecord_Private__resetDeviceNewsPlusSubscriberIDIfNeeded__block_invoke;
    v12[3] = &unk_264669B90;
    v12[4] = v5;
    [v9 enumerateKeysAndObjectsUsingBlock:v12];

    [v5 setDeviceIDRotationTimestamp:v3];
    objc_sync_exit(v5);
  }
  return v4 > 86399;
}

- (uint64_t)isActiveRecord
{
  uint64_t v1 = [a1 DSID];
  int v2 = [MEMORY[0x263F241D8] sharedInstance];
  uint64_t v3 = [v2 activeDSIDRecord];
  int v4 = [v3 DSID];
  uint64_t v5 = [v1 isEqualToString:v4];

  return v5;
}

- (void)retrieveSegmentDataFromiTunes:()Private
{
  id v4 = a3;
  id v6 = +[ADSegmentDataManager sharedInstance];
  uint64_t v5 = [a1 DSID];
  [v6 retrieveSegmentData:v5 forceSegments:0 completionHandler:v4];
}

- (void)sendSegmentDataToAdPlatforms:()Private
{
  id v4 = a3;
  id v6 = +[ADSegmentDataManager sharedInstance];
  uint64_t v5 = [a1 DSID];
  [v6 sendSegmentDataToAdPlatforms:v5 completionHandler:v4];
}

- (void)sendPersonalizedAdsStatusToAdPlatforms:()Private
{
  id v4 = a3;
  id v6 = +[ADPersonalizedAdsStatusManager sharedInstance];
  uint64_t v5 = [a1 DSID];
  [v6 sendPersonalizedAdsStatusToAdPlatforms:v5 completionHandler:v4];
}

- (BOOL)isEqual:()Private
{
  id v4 = a3;
  if (v4 == a1)
  {
    BOOL v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [a1 DSID];
      v7 = [v5 DSID];
      int v8 = [v6 isEqualToString:v7];

      if (!v8) {
        goto LABEL_25;
      }
      char v9 = [a1 ADIDRecords];
      uint64_t v10 = [v5 ADIDRecords];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_25;
      }
      uint64_t v12 = [a1 segmentData];
      if (v12)
      {
        v13 = (void *)v12;
        uint64_t v14 = [v5 segmentData];
        if (v14)
        {
          v15 = (void *)v14;
          v16 = [a1 segmentData];
          v17 = [v5 segmentData];
          int v18 = [v16 isEqualToString:v17];

          if (!v18) {
            goto LABEL_25;
          }
        }
        else
        {
        }
      }
      int v20 = [a1 accountIsT13];
      if (v20 == [v5 accountIsT13])
      {
        int v21 = [a1 accountIsU18];
        if (v21 == [v5 accountIsU18])
        {
          int v22 = [a1 accountIsU13];
          if (v22 == [v5 accountIsU13])
          {
            int v23 = [a1 sensitiveContentEligible];
            if (v23 == [v5 sensitiveContentEligible])
            {
              int v24 = [a1 effectiveBirthYear];
              if (v24 == [v5 effectiveBirthYear])
              {
                int v25 = [a1 noiseAppliedVersion];
                if (v25 == [v5 noiseAppliedVersion])
                {
                  int v26 = [a1 lastSentPersonalizedAdsStatus];
                  if (v26 == [v5 lastSentPersonalizedAdsStatus])
                  {
                    int v27 = [a1 personalizedAdsTimestamp];
                    if (v27 == [v5 personalizedAdsTimestamp])
                    {
                      int v28 = [a1 lastSentSegmentDataTimestamp];
                      if (v28 == [v5 lastSentSegmentDataTimestamp])
                      {
                        int v29 = [a1 segmentDataTimestamp];
                        if (v29 == [v5 segmentDataTimestamp])
                        {
                          int v30 = [a1 lastSentPersonalizedAdsTimestamp];
                          if (v30 == [v5 lastSentPersonalizedAdsTimestamp])
                          {
                            int v31 = [a1 lastSegmentServedTimestamp];
                            if (v31 == [v5 lastSegmentServedTimestamp])
                            {
                              int v32 = [a1 deviceIDRotationTimestamp];
                              BOOL v19 = v32 == [v5 deviceIDRotationTimestamp];
LABEL_26:

                              goto LABEL_27;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_25:
      BOOL v19 = 0;
      goto LABEL_26;
    }
    BOOL v19 = 0;
  }
LABEL_27:

  return v19;
}

@end