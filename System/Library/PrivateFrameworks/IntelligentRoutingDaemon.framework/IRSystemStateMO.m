@interface IRSystemStateMO
+ (id)fetchRequest;
+ (id)systemStateMOWithSystemStateDO:(id)a3 historyEventMO:(id)a4 inManagedObjectContext:(id)a5;
+ (id)systemStateMOWithSystemStateDO:(id)a3 replayEventMO:(id)a4 inManagedObjectContext:(id)a5;
+ (void)setPropertiesOfSystemStateMO:(id)a3 withSystemState:(id)a4;
- (id)convert;
@end

@implementation IRSystemStateMO

+ (id)systemStateMOWithSystemStateDO:(id)a3 replayEventMO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[IRSystemStateMO alloc] initWithContext:v7];

  [(IRSystemStateMO *)v10 setReplayEvent:v8];
  +[IRSystemStateMO setPropertiesOfSystemStateMO:v10 withSystemState:v9];

  return v10;
}

+ (void)setPropertiesOfSystemStateMO:(id)a3 withSystemState:(id)a4
{
  id v5 = a4;
  id v16 = a3;
  v6 = [v5 appInFocusBundleID];
  [v16 setAppInFocusBundleID:v6];

  objc_msgSend(v16, "setAppInFocusWindowValid:", objc_msgSend(v5, "appInFocusWindowValid"));
  id v7 = [v5 deviceWiFiSSID];
  [v16 setDeviceWiFiSSID:v7];

  objc_msgSend(v16, "setLocationSemanticUserSpecificPlaceType:", objc_msgSend(v5, "locationSemanticUserSpecificPlaceType"));
  id v8 = [v5 iCloudId];
  [v16 setICloudId:v8];

  id v9 = [v5 locationSemanticLoiIdentifier];
  [v16 setLocationSemanticLoiIdentifier:v9];

  v10 = [v5 avInitialRouteSharingPolicy];
  [v16 setAvInitialRouteSharingPolicy:v10];

  v11 = [v5 mediaRouteGroupLeaderOutputDeviceID];
  [v16 setMediaRouteGroupLeaderOutputDeviceID:v11];

  objc_msgSend(v16, "setTimeZoneSeconds:", objc_msgSend(v5, "timeZoneSeconds"));
  v12 = [v5 outputDeviceName];
  [v16 setOutputDeviceName:v12];

  objc_msgSend(v16, "setOutputDeviceType:", objc_msgSend(v5, "outputDeviceType"));
  objc_msgSend(v16, "setOutputDeviceSubType:", objc_msgSend(v5, "outputDeviceSubType"));
  v13 = [v5 predictedOutputDeviceName];
  [v16 setPredictedOutputDeviceName:v13];

  objc_msgSend(v16, "setPredictedOutputDeviceType:", objc_msgSend(v5, "predictedOutputDeviceType"));
  objc_msgSend(v16, "setPredictedOutputDeviceSubType:", objc_msgSend(v5, "predictedOutputDeviceSubType"));
  objc_msgSend(v16, "setAppInFocusWindowScreenUnlockEvent:", objc_msgSend(v5, "appInFocusWindowScreenUnlockEvent"));
  objc_msgSend(v16, "setPdrFenceActive:", objc_msgSend(v5, "pdrFenceActive"));
  v14 = [v5 latestPickerChoiceDate];
  [v16 setLatestPickerChoiceDate:v14];

  objc_msgSend(v16, "setIsContinuityDisplay:", objc_msgSend(v5, "isContinuityDisplay"));
  uint64_t v15 = [v5 displayOn];

  [v16 setDisplayOn:v15];
}

+ (id)systemStateMOWithSystemStateDO:(id)a3 historyEventMO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[IRSystemStateMO alloc] initWithContext:v7];

  [(IRSystemStateMO *)v10 setHistoryEvent:v8];
  +[IRSystemStateMO setPropertiesOfSystemStateMO:v10 withSystemState:v9];

  return v10;
}

- (id)convert
{
  v25 = [(IRSystemStateMO *)self appInFocusBundleID];
  unsigned int v24 = [(IRSystemStateMO *)self appInFocusWindowValid];
  v23 = [(IRSystemStateMO *)self deviceWiFiSSID];
  unsigned int v22 = [(IRSystemStateMO *)self locationSemanticUserSpecificPlaceType];
  v21 = [(IRSystemStateMO *)self locationSemanticLoiIdentifier];
  v20 = [(IRSystemStateMO *)self iCloudId];
  v19 = [(IRSystemStateMO *)self avInitialRouteSharingPolicy];
  v18 = [(IRSystemStateMO *)self mediaRouteGroupLeaderOutputDeviceID];
  uint64_t v17 = [(IRSystemStateMO *)self timeZoneSeconds];
  v3 = [(IRSystemStateMO *)self outputDeviceName];
  uint64_t v16 = [(IRSystemStateMO *)self outputDeviceType];
  uint64_t v4 = [(IRSystemStateMO *)self outputDeviceSubType];
  id v5 = [(IRSystemStateMO *)self predictedOutputDeviceName];
  uint64_t v6 = [(IRSystemStateMO *)self predictedOutputDeviceType];
  uint64_t v7 = [(IRSystemStateMO *)self predictedOutputDeviceSubType];
  char v8 = [(IRSystemStateMO *)self appInFocusWindowScreenUnlockEvent];
  char v9 = [(IRSystemStateMO *)self pdrFenceActive];
  v10 = [(IRSystemStateMO *)self latestPickerChoiceDate];
  char v11 = [(IRSystemStateMO *)self isContinuityDisplay];
  BYTE1(v15) = [(IRSystemStateMO *)self displayOn];
  LOBYTE(v15) = v11;
  BYTE1(v14) = v9;
  LOBYTE(v14) = v8;
  +[IRSystemStateDO systemStateDOWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:](IRSystemStateDO, "systemStateDOWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", v25, v24, v23, v22, v21, v20, v19, v18, v17, v3, v16, v4, v5, v6,
    v7,
    v14,
    v10,
  v12 = v15);

  return v12;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"IRSystemStateMO"];
}

@end