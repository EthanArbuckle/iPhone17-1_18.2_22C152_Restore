@interface IRLogQEUtility
+ (id)BOOLPropertyToString:(BOOL)a3;
+ (id)datePropertyToString:(id)a3 timeZone:(int64_t)a4;
+ (id)getCandidateAsString:(id)a3;
+ (id)getContextAsString:(id)a3;
+ (id)getEventAsString:(id)a3;
+ (id)getSystemStateAsString:(id)a3;
+ (id)stringPropertyToString:(id)a3;
@end

@implementation IRLogQEUtility

+ (id)getSystemStateAsString:(id)a3
{
  id v3 = a3;
  v4 = [v3 appInFocusBundleID];
  v38 = +[IRLogQEUtility stringPropertyToString:v4];

  v37 = +[IRLogQEUtility BOOLPropertyToString:](IRLogQEUtility, "BOOLPropertyToString:", [v3 appInFocusWindowValid]);
  v5 = [v3 deviceWiFiSSID];
  v36 = +[IRLogQEUtility stringPropertyToString:v5];

  v6 = [v3 locationSemanticLoiIdentifier];
  v35 = +[IRLogQEUtility stringPropertyToString:v6];

  v7 = [v3 iCloudId];
  v34 = +[IRLogQEUtility stringPropertyToString:v7];

  v8 = [v3 avInitialRouteSharingPolicy];
  v33 = +[IRLogQEUtility stringPropertyToString:v8];

  v9 = [v3 mediaRouteGroupLeaderOutputDeviceID];
  v32 = +[IRLogQEUtility stringPropertyToString:v9];

  v10 = [v3 outputDeviceName];
  v31 = +[IRLogQEUtility stringPropertyToString:v10];

  v11 = IRAVOutputDeviceTypeToString([v3 outputDeviceType]);
  v30 = +[IRLogQEUtility stringPropertyToString:v11];

  v12 = IRAVOutputDeviceSubTypeToString([v3 outputDeviceSubType]);
  v29 = +[IRLogQEUtility stringPropertyToString:v12];

  v13 = [v3 predictedOutputDeviceName];
  v28 = +[IRLogQEUtility stringPropertyToString:v13];

  v14 = IRAVOutputDeviceTypeToString([v3 predictedOutputDeviceType]);
  v25 = +[IRLogQEUtility stringPropertyToString:v14];

  v15 = IRAVOutputDeviceSubTypeToString([v3 predictedOutputDeviceSubType]);
  v24 = +[IRLogQEUtility stringPropertyToString:v15];

  v16 = IRLocationSemanticUserSpecificPlaceTypeToString([v3 locationSemanticUserSpecificPlaceType]);
  v27 = +[IRLogQEUtility BOOLPropertyToString:](IRLogQEUtility, "BOOLPropertyToString:", [v3 appInFocusWindowScreenUnlockEvent]);
  v23 = +[IRLogQEUtility BOOLPropertyToString:](IRLogQEUtility, "BOOLPropertyToString:", [v3 pdrFenceActive]);
  v17 = [v3 latestPickerChoiceDate];
  v18 = +[IRLogQEUtility datePropertyToString:timeZone:](IRLogQEUtility, "datePropertyToString:timeZone:", v17, [v3 timeZoneSeconds]);

  v19 = +[IRLogQEUtility BOOLPropertyToString:](IRLogQEUtility, "BOOLPropertyToString:", [v3 isContinuityDisplay]);
  uint64_t v20 = [v3 displayOn];

  v21 = +[IRLogQEUtility BOOLPropertyToString:v20];
  objc_msgSend(NSString, "stringWithFormat:", @"appInFocusBundleID: %@\n appInFocusWindowValid: %@\n appInFocusWindowScreenUnlockEvent: %@\n deviceWiFiSSID: %@\n locationSemanticLoiIdentifier: %@\n iCloudId: %@\n locationSemanticUserSpecificPlaceType: %@\n avInitialRouteSharingPolicy: %@\n mediaRouteGroupLeaderOutputDeviceID: %@\n outputDevice: Name - %@, Type - %@, SubType - %@\n predictedOutputDevice: Name - %@, Type - %@, SubType - %@\n pdrFenceActive: %@\n latestPickerChoiceDate: %@\n isContinuityDisplay: %@\n displayOn: %@\n", v38, v37, v27, v36, v35, v34, v16, v33, v32, v31, v30, v29, v28, v25, v24, v23,
    v18,
    v19,
    v21);
  id v26 = (id)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)stringPropertyToString:(id)a3
{
  if (a3) {
    return a3;
  }
  else {
    return @"nil";
  }
}

+ (id)BOOLPropertyToString:(BOOL)a3
{
  if (a3) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

+ (id)datePropertyToString:(id)a3 timeZone:(int64_t)a4
{
  if (a3)
  {
    v5 = (objc_class *)MEMORY[0x263F08790];
    id v6 = a3;
    id v7 = objc_alloc_init(v5);
    [v7 setDateFormat:@"yyyy-MM-dd HH:mm:ss (Z)"];
    v8 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:a4];
    [v7 setTimeZone:v8];

    v9 = [v7 stringFromDate:v6];
  }
  else
  {
    v9 = @"nil";
  }

  return v9;
}

+ (id)getContextAsString:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = [a3 candidateResults];
  v4 = [v3 allObjects];
  v5 = [v4 sortedArrayUsingComparator:&__block_literal_global];

  id v6 = [MEMORY[0x263F089D8] string];
  [v6 appendString:@"{\n"];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v5;
  uint64_t v27 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v34;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v7;
        v8 = *(void **)(*((void *)&v33 + 1) + 8 * v7);
        [v6 appendString:@"    {\n"];
        v9 = [v8 candidate];
        v10 = [v9 candidateIdentifier];
        [v8 classification];
        v11 = IRCandidateClassificationToString();
        v12 = [v8 classificationDescription];
        [v6 appendFormat:@"        candidateIdentifier: %@, classification: %@, desc: %@\n", v10, v11, v12];

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v13 = [v8 candidate];
        v14 = [v13 nodes];

        uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v30 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              uint64_t v20 = [v19 name];
              v21 = [v19 avOutpuDeviceIdentifier];
              v22 = [v19 rapportIdentifier];
              v23 = [v19 idsIdentifier];
              [v6 appendFormat:@"        node: name: %@, avOutpuDeviceIdentifier: %@, rapportIdentifier: %@, idsIdentifier: %@\n", v20, v21, v22, v23];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v16);
        }

        [v6 appendString:@"    \n    }\n"];
        uint64_t v7 = v28 + 1;
      }
      while (v28 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v27);
  }

  [v6 appendString:@"}\n"];

  return v6;
}

+ (id)getEventAsString:(id)a3
{
  id v3 = a3;
  v4 = [v3 name];
  v5 = +[IRLogQEUtility stringPropertyToString:v4];

  id v6 = NSString;
  uint64_t v7 = [MEMORY[0x263F500D8] eventTypeStringEventDO:v3];
  v8 = [MEMORY[0x263F500D8] eventSubTypeStringEventDO:v3];
  v9 = [v3 bundleID];
  v10 = [v3 contextIdentifier];

  v11 = [v6 stringWithFormat:@"eventType: %@ eventSubType: %@ name: %@ bundleID: %@ contextIdentifier: %@", v7, v8, v5, v9, v10];

  return v11;
}

+ (id)getCandidateAsString:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 candidateIdentifier];
  uint64_t v5 = +[IRLogQEUtility stringPropertyToString:v4];

  uint64_t v6 = +[IRLogQEUtility BOOLPropertyToString:](IRLogQEUtility, "BOOLPropertyToString:", [v3 isSameWiFi]);
  uint64_t v7 = NSString;
  v8 = [v3 lastSeenDate];
  v9 = [v3 lastUsedDate];
  v10 = [v3 firstSeenDate];
  v11 = [v3 name];
  long long v36 = (void *)v6;
  v37 = (void *)v5;
  v12 = [v7 stringWithFormat:@"candidateIdentifier: %@\nlastSeen: %@\nlastUsed: %@\nfirstSeen: %@\nname: %@\nisSameWiFi: %@\n", v5, v8, v9, v10, v11, v6];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v38 = v3;
  id obj = [v3 nodes];
  uint64_t v41 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v41)
  {
    v13 = &unk_2703AEFD8;
    uint64_t v40 = *(void *)v53;
    do
    {
      uint64_t v14 = 0;
      uint64_t v15 = v13;
      uint64_t v16 = v12;
      do
      {
        v46 = v16;
        if (*(void *)v53 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v52 + 1) + 8 * v14);
        v18 = [v17 avOutpuDeviceIdentifier];
        v47 = +[IRLogQEUtility stringPropertyToString:v18];

        v19 = [v17 rapportIdentifier];
        v51 = +[IRLogQEUtility stringPropertyToString:v19];

        uint64_t v20 = [v17 idsIdentifier];
        v50 = +[IRLogQEUtility stringPropertyToString:v20];

        v21 = [v17 avOutputDevice];
        v22 = [v21 modelID];
        v49 = +[IRLogQEUtility stringPropertyToString:v22];

        v23 = [v17 avOutputDevice];
        v24 = [v23 deviceName];
        v48 = +[IRLogQEUtility stringPropertyToString:v24];

        v25 = NSString;
        uint64_t v26 = [v15 stringValue];
        uint64_t v27 = [v17 avOutputDevice];
        if (v27)
        {
          v45 = [v17 avOutputDevice];
          IRAVOutputDeviceTypeToString([v45 deviceType]);
          uint64_t v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v43 = v28;
        }
        else
        {
          uint64_t v28 = @"Invalid";
        }
        long long v29 = [v17 avOutputDevice];
        if (v29)
        {
          v44 = [v17 avOutputDevice];
          IRAVOutputDeviceSubTypeToString([v44 deviceSubType]);
          long long v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v42 = v30;
        }
        else
        {
          long long v30 = @"Invalid";
        }
        long long v31 = [v17 rapportDevice];
        long long v32 = [v31 iCloudId];
        long long v33 = [v25 stringWithFormat:@" device%@:\n  avOutpuDeviceIdentifier: %@\n  rapportIdentifier: %@\n  idsIdentifier: %@\n  modelID: %@\n  deviceName: %@\n  deviceType: %@\n  deviceSubType: %@\n  iCloudId: %@\n", v26, v47, v51, v50, v49, v48, v28, v30, v32];

        if (v29)
        {
        }
        if (v27)
        {
        }
        long long v34 = [v46 stringByAppendingString:v33];
        v12 = [v34 stringByAppendingString:@"\n"];

        v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "intValue") + 1);

        ++v14;
        uint64_t v15 = v13;
        uint64_t v16 = v12;
      }
      while (v41 != v14);
      uint64_t v41 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v41);
  }
  else
  {
    v13 = &unk_2703AEFD8;
  }

  return v12;
}

uint64_t __37__IRLogQEUtility_getContextAsString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 classification];
  if (v6 <= [v5 classification])
  {
    uint64_t v8 = [v4 classification];
    uint64_t v7 = v8 < [v5 classification];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

@end