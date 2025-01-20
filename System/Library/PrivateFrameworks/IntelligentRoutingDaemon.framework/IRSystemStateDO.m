@interface IRSystemStateDO
+ (BOOL)supportsSecureCoding;
+ (IRSystemStateDO)systemStateDOWithAppInFocusBundleID:(id)a3 appInFocusWindowValid:(BOOL)a4 deviceWiFiSSID:(id)a5 locationSemanticUserSpecificPlaceType:(int)a6 locationSemanticLoiIdentifier:(id)a7 iCloudId:(id)a8 avInitialRouteSharingPolicy:(id)a9 mediaRouteGroupLeaderOutputDeviceID:(id)a10 timeZoneSeconds:(int64_t)a11 outputDeviceName:(id)a12 outputDeviceType:(unint64_t)a13 outputDeviceSubType:(unint64_t)a14 predictedOutputDeviceName:(id)a15 predictedOutputDeviceType:(unint64_t)a16 predictedOutputDeviceSubType:(unint64_t)a17 appInFocusWindowScreenUnlockEvent:(BOOL)a18 pdrFenceActive:(BOOL)a19 latestPickerChoiceDate:(id)a20 isContinuityDisplay:(BOOL)a21 displayOn:(BOOL)a22;
- (BOOL)appInFocusWindowScreenUnlockEvent;
- (BOOL)appInFocusWindowValid;
- (BOOL)displayOn;
- (BOOL)isContinuityDisplay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSystemStateDO:(id)a3;
- (BOOL)isHeadphonesRoutedOrPredicted;
- (BOOL)isMiLoSupportedLocation;
- (BOOL)pdrFenceActive;
- (IRSystemStateDO)initWithAppInFocusBundleID:(id)a3 appInFocusWindowValid:(BOOL)a4 deviceWiFiSSID:(id)a5 locationSemanticUserSpecificPlaceType:(int)a6 locationSemanticLoiIdentifier:(id)a7 iCloudId:(id)a8 avInitialRouteSharingPolicy:(id)a9 mediaRouteGroupLeaderOutputDeviceID:(id)a10 timeZoneSeconds:(int64_t)a11 outputDeviceName:(id)a12 outputDeviceType:(unint64_t)a13 outputDeviceSubType:(unint64_t)a14 predictedOutputDeviceName:(id)a15 predictedOutputDeviceType:(unint64_t)a16 predictedOutputDeviceSubType:(unint64_t)a17 appInFocusWindowScreenUnlockEvent:(BOOL)a18 pdrFenceActive:(BOOL)a19 latestPickerChoiceDate:(id)a20 isContinuityDisplay:(BOOL)a21 displayOn:(BOOL)a22;
- (IRSystemStateDO)initWithCoder:(id)a3;
- (NSDate)latestPickerChoiceDate;
- (NSString)appInFocusBundleID;
- (NSString)avInitialRouteSharingPolicy;
- (NSString)deviceWiFiSSID;
- (NSString)iCloudId;
- (NSString)locationSemanticLoiIdentifier;
- (NSString)mediaRouteGroupLeaderOutputDeviceID;
- (NSString)outputDeviceName;
- (NSString)predictedOutputDeviceName;
- (id)copyWithReplacementAppInFocusBundleID:(id)a3;
- (id)copyWithReplacementAppInFocusWindowScreenUnlockEvent:(BOOL)a3;
- (id)copyWithReplacementAppInFocusWindowValid:(BOOL)a3;
- (id)copyWithReplacementAvInitialRouteSharingPolicy:(id)a3;
- (id)copyWithReplacementDeviceWiFiSSID:(id)a3;
- (id)copyWithReplacementDisplayOn:(BOOL)a3;
- (id)copyWithReplacementICloudId:(id)a3;
- (id)copyWithReplacementIsContinuityDisplay:(BOOL)a3;
- (id)copyWithReplacementLatestPickerChoiceDate:(id)a3;
- (id)copyWithReplacementLocationSemanticLoiIdentifier:(id)a3;
- (id)copyWithReplacementLocationSemanticUserSpecificPlaceType:(int)a3;
- (id)copyWithReplacementMediaRouteGroupLeaderOutputDeviceID:(id)a3;
- (id)copyWithReplacementOutputDeviceName:(id)a3;
- (id)copyWithReplacementOutputDeviceSubType:(unint64_t)a3;
- (id)copyWithReplacementOutputDeviceType:(unint64_t)a3;
- (id)copyWithReplacementPdrFenceActive:(BOOL)a3;
- (id)copyWithReplacementPredictedOutputDeviceName:(id)a3;
- (id)copyWithReplacementPredictedOutputDeviceSubType:(unint64_t)a3;
- (id)copyWithReplacementPredictedOutputDeviceType:(unint64_t)a3;
- (id)copyWithReplacementTimeZoneSeconds:(int64_t)a3;
- (id)description;
- (id)exportAsDictionary;
- (id)overrideSystemStateIfNeeded:(id)a3;
- (int)locationSemanticUserSpecificPlaceType;
- (int64_t)timeZoneSeconds;
- (unint64_t)hash;
- (unint64_t)outputDeviceSubType;
- (unint64_t)outputDeviceType;
- (unint64_t)predictedOutputDeviceSubType;
- (unint64_t)predictedOutputDeviceType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRSystemStateDO

- (id)overrideSystemStateIfNeeded:(id)a3
{
  id v32 = a3;
  v30 = [IRSystemStateDO alloc];
  v29 = [(IRSystemStateDO *)self appInFocusBundleID];
  BOOL v28 = [(IRSystemStateDO *)self appInFocusWindowValid];
  v27 = [(IRSystemStateDO *)self deviceWiFiSSID];
  unsigned int v26 = [(IRSystemStateDO *)self locationSemanticUserSpecificPlaceType];
  v25 = [(IRSystemStateDO *)self locationSemanticLoiIdentifier];
  v24 = [(IRSystemStateDO *)self iCloudId];
  v23 = [(IRSystemStateDO *)self avInitialRouteSharingPolicy];
  v22 = [(IRSystemStateDO *)self mediaRouteGroupLeaderOutputDeviceID];
  int64_t v21 = [(IRSystemStateDO *)self timeZoneSeconds];
  v4 = [(IRSystemStateDO *)self outputDeviceName];
  unint64_t v20 = [(IRSystemStateDO *)self outputDeviceType];
  unint64_t v5 = [(IRSystemStateDO *)self outputDeviceSubType];
  v6 = [(IRSystemStateDO *)self predictedOutputDeviceName];
  unint64_t v7 = [(IRSystemStateDO *)self predictedOutputDeviceType];
  unint64_t v8 = [(IRSystemStateDO *)self predictedOutputDeviceSubType];
  BOOL v9 = [(IRSystemStateDO *)self appInFocusWindowScreenUnlockEvent];
  BOOL v10 = [(IRSystemStateDO *)self pdrFenceActive];
  v11 = [(IRSystemStateDO *)self latestPickerChoiceDate];
  BOOL v12 = [(IRSystemStateDO *)self isContinuityDisplay];
  BYTE1(v19) = [(IRSystemStateDO *)self displayOn];
  LOBYTE(v19) = v12;
  BYTE1(v18) = v10;
  LOBYTE(v18) = v9;
  v31 = -[IRSystemStateDO initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:](v30, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", v29, v28, v27, v26, v25, v24, v23, v22, v21, v4, v20, v5, v6,
          v7,
          v8,
          v18,
          v11,
          v19);

  if (v32)
  {
    if ([v32 overrideAppInFocusWindow])
    {
      id v13 = [(IRSystemStateDO *)v31 copyWithReplacementAppInFocusWindowValid:1];
    }
    else
    {
      id v13 = v31;
    }
    v14 = [v32 overrideBundleId];

    if (v14)
    {
      v15 = [v32 overrideBundleId];
      uint64_t v16 = [v13 copyWithReplacementAppInFocusBundleID:v15];

      id v13 = (id)v16;
    }
  }
  else
  {
    id v13 = v31;
  }

  return v13;
}

- (int64_t)timeZoneSeconds
{
  return self->_timeZoneSeconds;
}

- (unint64_t)predictedOutputDeviceType
{
  return self->_predictedOutputDeviceType;
}

- (unint64_t)predictedOutputDeviceSubType
{
  return self->_predictedOutputDeviceSubType;
}

- (NSString)predictedOutputDeviceName
{
  return self->_predictedOutputDeviceName;
}

- (BOOL)pdrFenceActive
{
  return self->_pdrFenceActive;
}

- (unint64_t)outputDeviceType
{
  return self->_outputDeviceType;
}

- (unint64_t)outputDeviceSubType
{
  return self->_outputDeviceSubType;
}

- (NSString)outputDeviceName
{
  return self->_outputDeviceName;
}

- (NSString)mediaRouteGroupLeaderOutputDeviceID
{
  return self->_mediaRouteGroupLeaderOutputDeviceID;
}

- (int)locationSemanticUserSpecificPlaceType
{
  return self->_locationSemanticUserSpecificPlaceType;
}

- (NSString)locationSemanticLoiIdentifier
{
  return self->_locationSemanticLoiIdentifier;
}

- (NSDate)latestPickerChoiceDate
{
  return self->_latestPickerChoiceDate;
}

- (BOOL)isContinuityDisplay
{
  return self->_isContinuityDisplay;
}

- (NSString)iCloudId
{
  return self->_iCloudId;
}

- (NSString)deviceWiFiSSID
{
  return self->_deviceWiFiSSID;
}

- (NSString)avInitialRouteSharingPolicy
{
  return self->_avInitialRouteSharingPolicy;
}

- (BOOL)appInFocusWindowValid
{
  return self->_appInFocusWindowValid;
}

- (BOOL)appInFocusWindowScreenUnlockEvent
{
  return self->_appInFocusWindowScreenUnlockEvent;
}

- (NSString)appInFocusBundleID
{
  return self->_appInFocusBundleID;
}

- (id)copyWithReplacementAvInitialRouteSharingPolicy:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v9) = *(_WORD *)&self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  v6 = objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, v4, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 self->_latestPickerChoiceDate,
                 v9);

  return v6;
}

- (id)copyWithReplacementAppInFocusWindowValid:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isContinuityDisplay;
  LOWORD(v7) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, v3, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementAppInFocusWindowScreenUnlockEvent:(BOOL)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isContinuityDisplay;
  BYTE1(v7) = self->_pdrFenceActive;
  LOBYTE(v7) = a3;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementAppInFocusBundleID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v9) = *(_WORD *)&self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  v6 = objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", v4, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 self->_latestPickerChoiceDate,
                 v9);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestPickerChoiceDate, 0);
  objc_storeStrong((id *)&self->_predictedOutputDeviceName, 0);
  objc_storeStrong((id *)&self->_outputDeviceName, 0);
  objc_storeStrong((id *)&self->_mediaRouteGroupLeaderOutputDeviceID, 0);
  objc_storeStrong((id *)&self->_avInitialRouteSharingPolicy, 0);
  objc_storeStrong((id *)&self->_iCloudId, 0);
  objc_storeStrong((id *)&self->_locationSemanticLoiIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceWiFiSSID, 0);

  objc_storeStrong((id *)&self->_appInFocusBundleID, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appInFocusBundleID hash];
  uint64_t v4 = self->_appInFocusWindowValid - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_deviceWiFiSSID hash];
  uint64_t v6 = self->_locationSemanticUserSpecificPlaceType - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  NSUInteger v7 = [(NSString *)self->_locationSemanticLoiIdentifier hash] - v6 + 32 * v6;
  NSUInteger v8 = [(NSString *)self->_iCloudId hash] - v7 + 32 * v7;
  NSUInteger v9 = [(NSString *)self->_avInitialRouteSharingPolicy hash] - v8 + 32 * v8;
  NSUInteger v10 = [(NSString *)self->_mediaRouteGroupLeaderOutputDeviceID hash];
  int64_t v11 = self->_timeZoneSeconds - (v10 - v9 + 32 * v9) + 32 * (v10 - v9 + 32 * v9);
  NSUInteger v12 = [(NSString *)self->_outputDeviceName hash];
  unint64_t v13 = self->_outputDeviceType - (v12 - v11 + 32 * v11) + 32 * (v12 - v11 + 32 * v11);
  unint64_t v14 = self->_outputDeviceSubType - v13 + 32 * v13;
  NSUInteger v15 = [(NSString *)self->_predictedOutputDeviceName hash];
  unint64_t v16 = self->_predictedOutputDeviceType - (v15 - v14 + 32 * v14) + 32 * (v15 - v14 + 32 * v14);
  unint64_t v17 = self->_appInFocusWindowScreenUnlockEvent
      - (self->_predictedOutputDeviceSubType
       - v16
       + 32 * v16)
      + 32 * (self->_predictedOutputDeviceSubType - v16 + 32 * v16);
  uint64_t v18 = self->_pdrFenceActive - v17 + 32 * v17;
  uint64_t v19 = [(NSDate *)self->_latestPickerChoiceDate hash];
  uint64_t v20 = self->_isContinuityDisplay - (v19 - v18 + 32 * v18) + 32 * (v19 - v18 + 32 * v18);
  return self->_displayOn - v20 + 32 * v20;
}

- (id)exportAsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v4 = [(IRSystemStateDO *)self appInFocusBundleID];
  if (v4)
  {
    NSUInteger v5 = [(IRSystemStateDO *)self appInFocusBundleID];
    [v3 setObject:v5 forKeyedSubscript:@"appInFocusBundleID"];
  }
  else
  {
    [v3 setObject:&stru_27039A840 forKeyedSubscript:@"appInFocusBundleID"];
  }

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[IRSystemStateDO appInFocusWindowValid](self, "appInFocusWindowValid"));
  [v3 setObject:v6 forKeyedSubscript:@"appInFocusWindowValid"];

  NSUInteger v7 = [(IRSystemStateDO *)self deviceWiFiSSID];
  if (v7)
  {
    NSUInteger v8 = [(IRSystemStateDO *)self deviceWiFiSSID];
    [v3 setObject:v8 forKeyedSubscript:@"deviceWiFiSSID"];
  }
  else
  {
    [v3 setObject:&stru_27039A840 forKeyedSubscript:@"deviceWiFiSSID"];
  }

  NSUInteger v9 = IRLocationSemanticUserSpecificPlaceTypeToString([(IRSystemStateDO *)self locationSemanticUserSpecificPlaceType]);
  [v3 setObject:v9 forKeyedSubscript:@"locationSemanticUserSpecificPlaceType"];

  NSUInteger v10 = [(IRSystemStateDO *)self locationSemanticLoiIdentifier];
  if (v10)
  {
    int64_t v11 = [(IRSystemStateDO *)self locationSemanticLoiIdentifier];
    [v3 setObject:v11 forKeyedSubscript:@"locationSemanticLoiIdentifier"];
  }
  else
  {
    [v3 setObject:&stru_27039A840 forKeyedSubscript:@"locationSemanticLoiIdentifier"];
  }

  NSUInteger v12 = [(IRSystemStateDO *)self avInitialRouteSharingPolicy];
  if (v12)
  {
    unint64_t v13 = [(IRSystemStateDO *)self avInitialRouteSharingPolicy];
    [v3 setObject:v13 forKeyedSubscript:@"avInitialRouteSharingPolicy"];
  }
  else
  {
    [v3 setObject:&stru_27039A840 forKeyedSubscript:@"avInitialRouteSharingPolicy"];
  }

  unint64_t v14 = [(IRSystemStateDO *)self iCloudId];
  if (v14)
  {
    NSUInteger v15 = [(IRSystemStateDO *)self iCloudId];
    [v3 setObject:v15 forKeyedSubscript:@"iCloudId"];
  }
  else
  {
    [v3 setObject:&stru_27039A840 forKeyedSubscript:@"iCloudId"];
  }

  unint64_t v16 = [(IRSystemStateDO *)self mediaRouteGroupLeaderOutputDeviceID];
  if (v16)
  {
    unint64_t v17 = [(IRSystemStateDO *)self mediaRouteGroupLeaderOutputDeviceID];
    [v3 setObject:v17 forKeyedSubscript:@"mediaRouteGroupLeaderOutputDeviceID"];
  }
  else
  {
    [v3 setObject:&stru_27039A840 forKeyedSubscript:@"mediaRouteGroupLeaderOutputDeviceID"];
  }

  uint64_t v18 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IRSystemStateDO timeZoneSeconds](self, "timeZoneSeconds"));
  [v3 setObject:v18 forKeyedSubscript:@"timeZoneSeconds"];

  uint64_t v19 = [(IRSystemStateDO *)self outputDeviceName];
  [v3 setObject:v19 forKeyedSubscript:@"outputDeviceName"];

  uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IRSystemStateDO outputDeviceType](self, "outputDeviceType"));
  [v3 setObject:v20 forKeyedSubscript:@"outputDeviceType"];

  int64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IRSystemStateDO outputDeviceSubType](self, "outputDeviceSubType"));
  [v3 setObject:v21 forKeyedSubscript:@"outputDeviceSubType"];

  v22 = [(IRSystemStateDO *)self predictedOutputDeviceName];
  [v3 setObject:v22 forKeyedSubscript:@"predictedOutputDeviceName"];

  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IRSystemStateDO predictedOutputDeviceType](self, "predictedOutputDeviceType"));
  [v3 setObject:v23 forKeyedSubscript:@"predictedOutputDeviceType"];

  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IRSystemStateDO predictedOutputDeviceSubType](self, "predictedOutputDeviceSubType"));
  [v3 setObject:v24 forKeyedSubscript:@"predictedOutputDeviceSubType"];

  v25 = objc_msgSend(NSNumber, "numberWithBool:", -[IRSystemStateDO appInFocusWindowScreenUnlockEvent](self, "appInFocusWindowScreenUnlockEvent"));
  [v3 setObject:v25 forKeyedSubscript:@"appInFocusWindowScreenUnlockEvent"];

  return v3;
}

- (BOOL)isHeadphonesRoutedOrPredicted
{
  return [(IRSystemStateDO *)self outputDeviceType] == 1
      && ([(IRSystemStateDO *)self outputDeviceSubType] == 3
       || [(IRSystemStateDO *)self outputDeviceSubType] == 2)
      || [(IRSystemStateDO *)self predictedOutputDeviceType] == 1;
}

- (BOOL)isMiLoSupportedLocation
{
  int v3 = [(IRSystemStateDO *)self locationSemanticUserSpecificPlaceType];
  if (v3 != 1) {
    LOBYTE(v3) = [(IRSystemStateDO *)self locationSemanticUserSpecificPlaceType] == 5;
  }
  return v3;
}

- (IRSystemStateDO)initWithAppInFocusBundleID:(id)a3 appInFocusWindowValid:(BOOL)a4 deviceWiFiSSID:(id)a5 locationSemanticUserSpecificPlaceType:(int)a6 locationSemanticLoiIdentifier:(id)a7 iCloudId:(id)a8 avInitialRouteSharingPolicy:(id)a9 mediaRouteGroupLeaderOutputDeviceID:(id)a10 timeZoneSeconds:(int64_t)a11 outputDeviceName:(id)a12 outputDeviceType:(unint64_t)a13 outputDeviceSubType:(unint64_t)a14 predictedOutputDeviceName:(id)a15 predictedOutputDeviceType:(unint64_t)a16 predictedOutputDeviceSubType:(unint64_t)a17 appInFocusWindowScreenUnlockEvent:(BOOL)a18 pdrFenceActive:(BOOL)a19 latestPickerChoiceDate:(id)a20 isContinuityDisplay:(BOOL)a21 displayOn:(BOOL)a22
{
  id v41 = a3;
  id v37 = a5;
  id v36 = a7;
  id v27 = a7;
  id v40 = a8;
  id v39 = a9;
  id v38 = a10;
  id v28 = a12;
  id v29 = a15;
  id v30 = a20;
  v42.receiver = self;
  v42.super_class = (Class)IRSystemStateDO;
  v31 = [(IRSystemStateDO *)&v42 init];
  id v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_appInFocusBundleID, a3);
    v32->_appInFocusWindowValid = a4;
    objc_storeStrong((id *)&v32->_deviceWiFiSSID, a5);
    v32->_locationSemanticUserSpecificPlaceType = a6;
    objc_storeStrong((id *)&v32->_locationSemanticLoiIdentifier, v36);
    objc_storeStrong((id *)&v32->_iCloudId, a8);
    objc_storeStrong((id *)&v32->_avInitialRouteSharingPolicy, a9);
    objc_storeStrong((id *)&v32->_mediaRouteGroupLeaderOutputDeviceID, a10);
    v32->_timeZoneSeconds = a11;
    objc_storeStrong((id *)&v32->_outputDeviceName, a12);
    v32->_outputDeviceType = a13;
    v32->_outputDeviceSubType = a14;
    objc_storeStrong((id *)&v32->_predictedOutputDeviceName, a15);
    v32->_predictedOutputDeviceType = a16;
    v32->_predictedOutputDeviceSubType = a17;
    v32->_appInFocusWindowScreenUnlockEvent = a18;
    v32->_pdrFenceActive = a19;
    objc_storeStrong((id *)&v32->_latestPickerChoiceDate, a20);
    v32->_isContinuityDisplay = a21;
    v32->_displayOn = a22;
  }

  return v32;
}

+ (IRSystemStateDO)systemStateDOWithAppInFocusBundleID:(id)a3 appInFocusWindowValid:(BOOL)a4 deviceWiFiSSID:(id)a5 locationSemanticUserSpecificPlaceType:(int)a6 locationSemanticLoiIdentifier:(id)a7 iCloudId:(id)a8 avInitialRouteSharingPolicy:(id)a9 mediaRouteGroupLeaderOutputDeviceID:(id)a10 timeZoneSeconds:(int64_t)a11 outputDeviceName:(id)a12 outputDeviceType:(unint64_t)a13 outputDeviceSubType:(unint64_t)a14 predictedOutputDeviceName:(id)a15 predictedOutputDeviceType:(unint64_t)a16 predictedOutputDeviceSubType:(unint64_t)a17 appInFocusWindowScreenUnlockEvent:(BOOL)a18 pdrFenceActive:(BOOL)a19 latestPickerChoiceDate:(id)a20 isContinuityDisplay:(BOOL)a21 displayOn:(BOOL)a22
{
  BOOL v40 = a4;
  id v26 = a20;
  id v27 = a15;
  id v28 = a12;
  id v29 = a10;
  id v30 = a9;
  id v31 = a8;
  id v32 = a7;
  id v33 = a5;
  id v34 = a3;
  LOWORD(v38) = __PAIR16__(a22, a21);
  LOWORD(v37) = __PAIR16__(a19, a18);
  v35 = objc_msgSend(objc_alloc((Class)a1), "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", v34, v40, v33, a6, v32, v31, v30, v29, a11, v28, a13, a14, v27,
                  a16,
                  a17,
                  v37,
                  v26,
                  v38);

  return (IRSystemStateDO *)v35;
}

- (id)copyWithReplacementDeviceWiFiSSID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v9) = *(_WORD *)&self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  uint64_t v6 = objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, v4, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 self->_latestPickerChoiceDate,
                 v9);

  return v6;
}

- (id)copyWithReplacementLocationSemanticUserSpecificPlaceType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isContinuityDisplay;
  LOWORD(v7) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, v3, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementLocationSemanticLoiIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v9) = *(_WORD *)&self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  uint64_t v6 = objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, v4, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 self->_latestPickerChoiceDate,
                 v9);

  return v6;
}

- (id)copyWithReplacementICloudId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v9) = *(_WORD *)&self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  uint64_t v6 = objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, v4, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 self->_latestPickerChoiceDate,
                 v9);

  return v6;
}

- (id)copyWithReplacementMediaRouteGroupLeaderOutputDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v9) = *(_WORD *)&self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  uint64_t v6 = objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, v4, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 self->_latestPickerChoiceDate,
                 v9);

  return v6;
}

- (id)copyWithReplacementTimeZoneSeconds:(int64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isContinuityDisplay;
  LOWORD(v7) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, a3, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementOutputDeviceName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v9) = *(_WORD *)&self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  uint64_t v6 = objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, v4, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 self->_latestPickerChoiceDate,
                 v9);

  return v6;
}

- (id)copyWithReplacementOutputDeviceType:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isContinuityDisplay;
  LOWORD(v7) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, a3, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementOutputDeviceSubType:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isContinuityDisplay;
  LOWORD(v7) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, a3, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementPredictedOutputDeviceName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v9) = *(_WORD *)&self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  uint64_t v6 = objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, v4,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 self->_latestPickerChoiceDate,
                 v9);

  return v6;
}

- (id)copyWithReplacementPredictedOutputDeviceType:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isContinuityDisplay;
  LOWORD(v7) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               a3,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementPredictedOutputDeviceSubType:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isContinuityDisplay;
  LOWORD(v7) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               a3,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementPdrFenceActive:(BOOL)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isContinuityDisplay;
  BYTE1(v7) = a3;
  LOBYTE(v7) = self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementLatestPickerChoiceDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v9) = *(_WORD *)&self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  uint64_t v6 = objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 v4,
                 v9);

  return v6;
}

- (id)copyWithReplacementIsContinuityDisplay:(BOOL)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  BYTE1(v8) = self->_displayOn;
  LOBYTE(v8) = a3;
  LOWORD(v7) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementDisplayOn:(BOOL)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  BYTE1(v8) = a3;
  LOBYTE(v8) = self->_isContinuityDisplay;
  LOWORD(v7) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (BOOL)isEqualToSystemStateDO:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_40;
  }
  int v6 = self->_appInFocusBundleID != 0;
  uint64_t v7 = [v4 appInFocusBundleID];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_40;
  }
  appInFocusBundleID = self->_appInFocusBundleID;
  if (appInFocusBundleID)
  {
    NSUInteger v10 = [v5 appInFocusBundleID];
    int v11 = [(NSString *)appInFocusBundleID isEqual:v10];

    if (!v11) {
      goto LABEL_40;
    }
  }
  int appInFocusWindowValid = self->_appInFocusWindowValid;
  if (appInFocusWindowValid != [v5 appInFocusWindowValid]) {
    goto LABEL_40;
  }
  int v13 = self->_deviceWiFiSSID != 0;
  unint64_t v14 = [v5 deviceWiFiSSID];
  int v15 = v14 == 0;

  if (v13 == v15) {
    goto LABEL_40;
  }
  deviceWiFiSSID = self->_deviceWiFiSSID;
  if (deviceWiFiSSID)
  {
    unint64_t v17 = [v5 deviceWiFiSSID];
    int v18 = [(NSString *)deviceWiFiSSID isEqual:v17];

    if (!v18) {
      goto LABEL_40;
    }
  }
  int locationSemanticUserSpecificPlaceType = self->_locationSemanticUserSpecificPlaceType;
  if (locationSemanticUserSpecificPlaceType != [v5 locationSemanticUserSpecificPlaceType]) {
    goto LABEL_40;
  }
  int v20 = self->_locationSemanticLoiIdentifier != 0;
  int64_t v21 = [v5 locationSemanticLoiIdentifier];
  int v22 = v21 == 0;

  if (v20 == v22) {
    goto LABEL_40;
  }
  locationSemanticLoiIdentifier = self->_locationSemanticLoiIdentifier;
  if (locationSemanticLoiIdentifier)
  {
    v24 = [v5 locationSemanticLoiIdentifier];
    int v25 = [(NSString *)locationSemanticLoiIdentifier isEqual:v24];

    if (!v25) {
      goto LABEL_40;
    }
  }
  int v26 = self->_iCloudId != 0;
  id v27 = [v5 iCloudId];
  int v28 = v27 == 0;

  if (v26 == v28) {
    goto LABEL_40;
  }
  iCloudId = self->_iCloudId;
  if (iCloudId)
  {
    id v30 = [v5 iCloudId];
    int v31 = [(NSString *)iCloudId isEqual:v30];

    if (!v31) {
      goto LABEL_40;
    }
  }
  int v32 = self->_avInitialRouteSharingPolicy != 0;
  id v33 = [v5 avInitialRouteSharingPolicy];
  int v34 = v33 == 0;

  if (v32 == v34) {
    goto LABEL_40;
  }
  avInitialRouteSharingPolicy = self->_avInitialRouteSharingPolicy;
  if (avInitialRouteSharingPolicy)
  {
    id v36 = [v5 avInitialRouteSharingPolicy];
    int v37 = [(NSString *)avInitialRouteSharingPolicy isEqual:v36];

    if (!v37) {
      goto LABEL_40;
    }
  }
  int v38 = self->_mediaRouteGroupLeaderOutputDeviceID != 0;
  id v39 = [v5 mediaRouteGroupLeaderOutputDeviceID];
  int v40 = v39 == 0;

  if (v38 == v40) {
    goto LABEL_40;
  }
  mediaRouteGroupLeaderOutputDeviceID = self->_mediaRouteGroupLeaderOutputDeviceID;
  if (mediaRouteGroupLeaderOutputDeviceID)
  {
    objc_super v42 = [v5 mediaRouteGroupLeaderOutputDeviceID];
    int v43 = [(NSString *)mediaRouteGroupLeaderOutputDeviceID isEqual:v42];

    if (!v43) {
      goto LABEL_40;
    }
  }
  int64_t timeZoneSeconds = self->_timeZoneSeconds;
  if (timeZoneSeconds != [v5 timeZoneSeconds]) {
    goto LABEL_40;
  }
  int v45 = self->_outputDeviceName != 0;
  v46 = [v5 outputDeviceName];
  int v47 = v46 == 0;

  if (v45 == v47) {
    goto LABEL_40;
  }
  outputDeviceName = self->_outputDeviceName;
  if (outputDeviceName)
  {
    v49 = [v5 outputDeviceName];
    int v50 = [(NSString *)outputDeviceName isEqual:v49];

    if (!v50) {
      goto LABEL_40;
    }
  }
  unint64_t outputDeviceType = self->_outputDeviceType;
  if (outputDeviceType != [v5 outputDeviceType]) {
    goto LABEL_40;
  }
  unint64_t outputDeviceSubType = self->_outputDeviceSubType;
  if (outputDeviceSubType != [v5 outputDeviceSubType]) {
    goto LABEL_40;
  }
  int v53 = self->_predictedOutputDeviceName != 0;
  v54 = [v5 predictedOutputDeviceName];
  int v55 = v54 == 0;

  if (v53 == v55) {
    goto LABEL_40;
  }
  predictedOutputDeviceName = self->_predictedOutputDeviceName;
  if (predictedOutputDeviceName)
  {
    v57 = [v5 predictedOutputDeviceName];
    int v58 = [(NSString *)predictedOutputDeviceName isEqual:v57];

    if (!v58) {
      goto LABEL_40;
    }
  }
  unint64_t predictedOutputDeviceType = self->_predictedOutputDeviceType;
  if (predictedOutputDeviceType != [v5 predictedOutputDeviceType]) {
    goto LABEL_40;
  }
  unint64_t predictedOutputDeviceSubType = self->_predictedOutputDeviceSubType;
  if (predictedOutputDeviceSubType != [v5 predictedOutputDeviceSubType]) {
    goto LABEL_40;
  }
  int appInFocusWindowScreenUnlockEvent = self->_appInFocusWindowScreenUnlockEvent;
  if (appInFocusWindowScreenUnlockEvent != [v5 appInFocusWindowScreenUnlockEvent]) {
    goto LABEL_40;
  }
  int pdrFenceActive = self->_pdrFenceActive;
  if (pdrFenceActive != [v5 pdrFenceActive]) {
    goto LABEL_40;
  }
  int v63 = self->_latestPickerChoiceDate != 0;
  v64 = [v5 latestPickerChoiceDate];
  int v65 = v64 == 0;

  if (v63 == v65) {
    goto LABEL_40;
  }
  latestPickerChoiceDate = self->_latestPickerChoiceDate;
  if (latestPickerChoiceDate)
  {
    v67 = [v5 latestPickerChoiceDate];
    int v68 = [(NSDate *)latestPickerChoiceDate isEqual:v67];

    if (!v68) {
      goto LABEL_40;
    }
  }
  int isContinuityDisplay = self->_isContinuityDisplay;
  if (isContinuityDisplay == [v5 isContinuityDisplay])
  {
    int displayOn = self->_displayOn;
    BOOL v71 = displayOn == [v5 displayOn];
  }
  else
  {
LABEL_40:
    BOOL v71 = 0;
  }

  return v71;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IRSystemStateDO *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IRSystemStateDO *)self isEqualToSystemStateDO:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRSystemStateDO)initWithCoder:(id)a3
{
  v153[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appInFocusBundleID"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      int v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      NSUInteger v10 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRSystemStateDO key \"appInFocusBundleID\" (expected %@, decoded %@)", v7, v9, 0];
      uint64_t v152 = *MEMORY[0x263F08320];
      v153[0] = v10;
      int v11 = [NSDictionary dictionaryWithObjects:v153 forKeys:&v152 count:1];
      NSUInteger v12 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRSystemStateDOOCNTErrorDomain" code:3 userInfo:v11];
      [v4 failWithError:v12];

LABEL_4:
      int v13 = 0;
LABEL_39:

      goto LABEL_40;
    }
  }
  else
  {
    unint64_t v14 = [v4 error];

    if (v14) {
      goto LABEL_12;
    }
  }
  uint64_t v15 = [v4 decodeInt64ForKey:@"appInFocusWindowValid"];
  if (v15) {
    goto LABEL_7;
  }
  int v22 = [v4 error];

  if (!v22)
  {
    if (([v4 containsValueForKey:@"appInFocusWindowValid"] & 1) == 0)
    {
      uint64_t v150 = *MEMORY[0x263F08320];
      v151 = @"Missing serialized value for IRSystemStateDO.appInFocusWindowValid";
      uint64_t v7 = [NSDictionary dictionaryWithObjects:&v151 forKeys:&v150 count:1];
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRSystemStateDOOCNTErrorDomain" code:1 userInfo:v7];
      [v4 failWithError:v9];
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceWiFiSSID"];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        unint64_t v16 = (objc_class *)objc_opt_class();
        uint64_t v9 = NSStringFromClass(v16);
        unint64_t v17 = (objc_class *)objc_opt_class();
        int v18 = NSStringFromClass(v17);
        uint64_t v19 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRSystemStateDO key \"deviceWiFiSSID\" (expected %@, decoded %@)", v9, v18, 0];
        uint64_t v148 = *MEMORY[0x263F08320];
        v149 = v19;
        int v20 = [NSDictionary dictionaryWithObjects:&v149 forKeys:&v148 count:1];
        int64_t v21 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRSystemStateDOOCNTErrorDomain" code:3 userInfo:v20];
        [v4 failWithError:v21];

LABEL_10:
        int v13 = 0;
LABEL_38:

        goto LABEL_39;
      }
    }
    else
    {
      v23 = [v4 error];

      if (v23) {
        goto LABEL_21;
      }
    }
    uint64_t v24 = [v4 decodeInt64ForKey:@"locationSemanticUserSpecificPlaceType"];
    if (v24) {
      goto LABEL_15;
    }
    id v30 = [v4 error];

    if (!v30)
    {
      if (([v4 containsValueForKey:@"locationSemanticUserSpecificPlaceType"] & 1) == 0)
      {
        uint64_t v146 = *MEMORY[0x263F08320];
        v147 = @"Missing serialized value for IRSystemStateDO.locationSemanticUserSpecificPlaceType";
        uint64_t v9 = [NSDictionary dictionaryWithObjects:&v147 forKeys:&v146 count:1];
        int v18 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRSystemStateDOOCNTErrorDomain" code:1 userInfo:v9];
        [v4 failWithError:v18];
        goto LABEL_10;
      }
LABEL_15:
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationSemanticLoiIdentifier"];
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v25 = (objc_class *)objc_opt_class();
          int v18 = NSStringFromClass(v25);
          int v26 = (objc_class *)objc_opt_class();
          id v27 = NSStringFromClass(v26);
          int v28 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRSystemStateDO key \"locationSemanticLoiIdentifier\" (expected %@, decoded %@)", v18, v27, 0];
          uint64_t v144 = *MEMORY[0x263F08320];
          v145 = v28;
          uint64_t v113 = [NSDictionary dictionaryWithObjects:&v145 forKeys:&v144 count:1];
          id v29 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRSystemStateDOOCNTErrorDomain" code:3 userInfo:v113];
          [v4 failWithError:v29];
LABEL_33:
          int v13 = 0;
LABEL_34:

          int v40 = (void *)v113;
LABEL_35:

LABEL_36:
LABEL_37:

          goto LABEL_38;
        }
      }
      else
      {
        int v31 = [v4 error];

        if (v31) {
          goto LABEL_4;
        }
      }
      int v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iCloudId"];
      if (v18)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v32 = (objc_class *)objc_opt_class();
          id v27 = NSStringFromClass(v32);
          id v33 = (objc_class *)objc_opt_class();
          int v28 = NSStringFromClass(v33);
          uint64_t v34 = [[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRSystemStateDO key \"iCloudId\" (expected %@, decoded %@)", v27, v28, 0];
          uint64_t v142 = *MEMORY[0x263F08320];
          uint64_t v143 = v34;
          uint64_t v113 = v34;
          id v29 = [NSDictionary dictionaryWithObjects:&v143 forKeys:&v142 count:1];
          v35 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRSystemStateDOOCNTErrorDomain" code:3 userInfo:v29];
          [v4 failWithError:v35];
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
        id v36 = [v4 error];

        if (v36) {
          goto LABEL_10;
        }
      }
      uint64_t v109 = v24;
      id v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"avInitialRouteSharingPolicy"];
      if (v27)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v37 = (objc_class *)objc_opt_class();
          uint64_t v111 = NSStringFromClass(v37);
          int v38 = (objc_class *)objc_opt_class();
          uint64_t v113 = NSStringFromClass(v38);
          id v29 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRSystemStateDO key \"avInitialRouteSharingPolicy\" (expected %@, decoded %@)", v111, v113, 0];
          uint64_t v140 = *MEMORY[0x263F08320];
          v141 = v29;
          v35 = [NSDictionary dictionaryWithObjects:&v141 forKeys:&v140 count:1];
          id v39 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRSystemStateDOOCNTErrorDomain" code:3 userInfo:v35];
          [v4 failWithError:v39];

          int v28 = (void *)v111;
          goto LABEL_32;
        }
      }
      else
      {
        objc_super v42 = [v4 error];

        if (v42)
        {
          int v13 = 0;
          goto LABEL_37;
        }
      }
      v108 = v27;
      uint64_t v112 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaRouteGroupLeaderOutputDeviceID"];
      if (v112)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v43 = (objc_class *)objc_opt_class();
          uint64_t v44 = NSStringFromClass(v43);
          int v45 = (objc_class *)objc_opt_class();
          id v29 = NSStringFromClass(v45);
          uint64_t v113 = v44;
          v46 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRSystemStateDO key \"mediaRouteGroupLeaderOutputDeviceID\" (expected %@, decoded %@)", v44, v29, 0];
          uint64_t v138 = *MEMORY[0x263F08320];
          v139 = v46;
          int v47 = [NSDictionary dictionaryWithObjects:&v139 forKeys:&v138 count:1];
          v48 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRSystemStateDOOCNTErrorDomain" code:3 userInfo:v47];
          [v4 failWithError:v48];

          int v28 = (void *)v112;
          int v13 = 0;
          id v27 = v108;
          goto LABEL_34;
        }
      }
      else
      {
        v49 = [v4 error];

        if (v49) {
          goto LABEL_57;
        }
      }
      uint64_t v50 = [v4 decodeInt64ForKey:@"timeZoneSeconds"];
      if (v50) {
        goto LABEL_49;
      }
      int v58 = [v4 error];

      if (!v58)
      {
        if (([v4 containsValueForKey:@"timeZoneSeconds"] & 1) == 0)
        {
          uint64_t v136 = *MEMORY[0x263F08320];
          v137 = @"Missing serialized value for IRSystemStateDO.timeZoneSeconds";
          uint64_t v113 = [NSDictionary dictionaryWithObjects:&v137 forKeys:&v136 count:1];
          id v29 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRSystemStateDOOCNTErrorDomain" code:1 userInfo:v113];
          [v4 failWithError:v29];
          int v13 = 0;
          id v27 = v108;
          int v28 = (void *)v112;
          goto LABEL_34;
        }
LABEL_49:
        uint64_t v105 = v50;
        int v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outputDeviceName"];
        if (v40)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v51 = (objc_class *)objc_opt_class();
            uint64_t v52 = NSStringFromClass(v51);
            uint64_t v113 = (uint64_t)v40;
            int v53 = (objc_class *)objc_opt_class();
            v54 = NSStringFromClass(v53);
            uint64_t v107 = v52;
            int v55 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRSystemStateDO key \"outputDeviceName\" (expected %@, decoded %@)", v52, v54, 0];
            uint64_t v134 = *MEMORY[0x263F08320];
            v135 = v55;
            v56 = [NSDictionary dictionaryWithObjects:&v135 forKeys:&v134 count:1];
            v57 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRSystemStateDOOCNTErrorDomain" code:3 userInfo:v56];
            [v4 failWithError:v57];

LABEL_52:
LABEL_53:
            int v13 = 0;
            id v27 = v108;
            int v28 = (void *)v112;
LABEL_54:

LABEL_55:
            id v29 = (void *)v107;
            goto LABEL_34;
          }
        }
        else
        {
          v59 = [v4 error];

          if (v59) {
            goto LABEL_71;
          }
        }
        uint64_t v104 = [v4 decodeInt64ForKey:@"outputDeviceType"];
        if (!v104)
        {
          int v65 = [v4 error];

          if (v65) {
            goto LABEL_71;
          }
          if (([v4 containsValueForKey:@"outputDeviceType"] & 1) == 0)
          {
            uint64_t v113 = (uint64_t)v40;
            uint64_t v132 = *MEMORY[0x263F08320];
            v133 = @"Missing serialized value for IRSystemStateDO.outputDeviceType";
            v66 = NSDictionary;
            v67 = &v133;
            int v68 = &v132;
            goto LABEL_82;
          }
        }
        uint64_t v103 = [v4 decodeInt64ForKey:@"outputDeviceSubType"];
        if (v103) {
          goto LABEL_61;
        }
        v69 = [v4 error];

        if (!v69)
        {
          if ([v4 containsValueForKey:@"outputDeviceSubType"])
          {
LABEL_61:
            uint64_t v113 = (uint64_t)v40;
            uint64_t v107 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predictedOutputDeviceName"];
            if (v107)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v60 = (objc_class *)objc_opt_class();
                v54 = NSStringFromClass(v60);
                v61 = (objc_class *)objc_opt_class();
                v110 = NSStringFromClass(v61);
                v62 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRSystemStateDO key \"predictedOutputDeviceName\" (expected %@, decoded %@)", v54, v110, 0];
                uint64_t v128 = *MEMORY[0x263F08320];
                v129 = v62;
                int v63 = [NSDictionary dictionaryWithObjects:&v129 forKeys:&v128 count:1];
                v64 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRSystemStateDOOCNTErrorDomain" code:3 userInfo:v63];
                [v4 failWithError:v64];

LABEL_64:
                goto LABEL_53;
              }
            }
            else
            {
              v70 = [v4 error];

              if (v70) {
                goto LABEL_93;
              }
            }
            uint64_t v71 = [v4 decodeInt64ForKey:@"predictedOutputDeviceType"];
            if (!v71)
            {
              v78 = [v4 error];

              if (v78) {
                goto LABEL_93;
              }
              if (([v4 containsValueForKey:@"predictedOutputDeviceType"] & 1) == 0)
              {
                uint64_t v126 = *MEMORY[0x263F08320];
                v127 = @"Missing serialized value for IRSystemStateDO.predictedOutputDeviceType";
                v79 = NSDictionary;
                v80 = &v127;
                v81 = &v126;
                goto LABEL_100;
              }
            }
            uint64_t v102 = v71;
            uint64_t v101 = [v4 decodeInt64ForKey:@"predictedOutputDeviceSubType"];
            if (!v101)
            {
              v82 = [v4 error];

              if (v82) {
                goto LABEL_93;
              }
              if (([v4 containsValueForKey:@"predictedOutputDeviceSubType"] & 1) == 0)
              {
                uint64_t v124 = *MEMORY[0x263F08320];
                v125 = @"Missing serialized value for IRSystemStateDO.predictedOutputDeviceSubType";
                v79 = NSDictionary;
                v80 = &v125;
                v81 = &v124;
                goto LABEL_100;
              }
            }
            uint64_t v99 = [v4 decodeInt64ForKey:@"appInFocusWindowScreenUnlockEvent"];
            if (!v99)
            {
              v83 = [v4 error];

              if (v83) {
                goto LABEL_93;
              }
              if (([v4 containsValueForKey:@"appInFocusWindowScreenUnlockEvent"] & 1) == 0)
              {
                uint64_t v122 = *MEMORY[0x263F08320];
                v123 = @"Missing serialized value for IRSystemStateDO.appInFocusWindowScreenUnlockEvent";
                v79 = NSDictionary;
                v80 = &v123;
                v81 = &v122;
                goto LABEL_100;
              }
            }
            uint64_t v72 = [v4 decodeInt64ForKey:@"pdrFenceActive"];
            if (v72) {
              goto LABEL_77;
            }
            v84 = [v4 error];

            if (!v84)
            {
              if ([v4 containsValueForKey:@"pdrFenceActive"])
              {
LABEL_77:
                uint64_t v100 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"latestPickerChoiceDate"];
                if (v100)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v73 = (objc_class *)objc_opt_class();
                    v110 = NSStringFromClass(v73);
                    v54 = (void *)v100;
                    v74 = (objc_class *)objc_opt_class();
                    v106 = NSStringFromClass(v74);
                    v75 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRSystemStateDO key \"latestPickerChoiceDate\" (expected %@, decoded %@)", v110, v106, 0];
                    uint64_t v118 = *MEMORY[0x263F08320];
                    v119 = v75;
                    v76 = [NSDictionary dictionaryWithObjects:&v119 forKeys:&v118 count:1];
                    v77 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRSystemStateDOOCNTErrorDomain" code:3 userInfo:v76];
                    [v4 failWithError:v77];

                    goto LABEL_64;
                  }
                }
                else
                {
                  v85 = [v4 error];

                  if (v85) {
                    goto LABEL_108;
                  }
                }
                uint64_t v86 = [v4 decodeInt64ForKey:@"isContinuityDisplay"];
                if (!v86)
                {
                  v89 = [v4 error];

                  if (v89) {
                    goto LABEL_108;
                  }
                  if (([v4 containsValueForKey:@"isContinuityDisplay"] & 1) == 0)
                  {
                    uint64_t v116 = *MEMORY[0x263F08320];
                    v117 = @"Missing serialized value for IRSystemStateDO.isContinuityDisplay";
                    v90 = NSDictionary;
                    v91 = &v117;
                    v92 = &v116;
LABEL_107:
                    v94 = [v90 dictionaryWithObjects:v91 forKeys:v92 count:1];
                    v95 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRSystemStateDOOCNTErrorDomain" code:1 userInfo:v94];
                    [v4 failWithError:v95];

                    goto LABEL_108;
                  }
                }
                uint64_t v98 = [v4 decodeInt64ForKey:@"displayOn"];
                if (v98)
                {
LABEL_97:
                  BOOL v87 = v86 != 0;
                  BOOL v88 = v72 != 0;
                  v54 = (void *)v100;
                  id v27 = v108;
                  int v28 = (void *)v112;
                  BYTE1(v97) = v98 != 0;
                  LOBYTE(v97) = v87;
                  BYTE1(v96) = v88;
                  LOBYTE(v96) = v99 != 0;
                  self = objc_retain(-[IRSystemStateDO initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:](self, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", v5, v15 != 0, v7, v109, v9, v18, v108, v112, v105, v113, v104, v103,
                             v107,
                             v102,
                             v101,
                             v96,
                             v100,
                             v97));
                  int v13 = self;
                  goto LABEL_54;
                }
                v93 = [v4 error];

                if (!v93)
                {
                  if ([v4 containsValueForKey:@"displayOn"]) {
                    goto LABEL_97;
                  }
                  uint64_t v114 = *MEMORY[0x263F08320];
                  v115 = @"Missing serialized value for IRSystemStateDO.displayOn";
                  v90 = NSDictionary;
                  v91 = &v115;
                  v92 = &v114;
                  goto LABEL_107;
                }
LABEL_108:
                int v13 = 0;
                id v27 = v108;
                int v28 = (void *)v112;
                v54 = (void *)v100;
                goto LABEL_54;
              }
              uint64_t v120 = *MEMORY[0x263F08320];
              v121 = @"Missing serialized value for IRSystemStateDO.pdrFenceActive";
              v79 = NSDictionary;
              v80 = &v121;
              v81 = &v120;
LABEL_100:
              v54 = [v79 dictionaryWithObjects:v80 forKeys:v81 count:1];
              int v55 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRSystemStateDOOCNTErrorDomain" code:1 userInfo:v54];
              [v4 failWithError:v55];
              goto LABEL_52;
            }
LABEL_93:
            int v13 = 0;
            id v27 = v108;
            int v28 = (void *)v112;
            goto LABEL_55;
          }
          uint64_t v113 = (uint64_t)v40;
          uint64_t v130 = *MEMORY[0x263F08320];
          v131 = @"Missing serialized value for IRSystemStateDO.outputDeviceSubType";
          v66 = NSDictionary;
          v67 = &v131;
          int v68 = &v130;
LABEL_82:
          uint64_t v107 = [v66 dictionaryWithObjects:v67 forKeys:v68 count:1];
          v54 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRSystemStateDOOCNTErrorDomain" code:1 userInfo:v107];
          [v4 failWithError:v54];
          goto LABEL_53;
        }
LABEL_71:
        int v13 = 0;
        id v27 = v108;
        int v28 = (void *)v112;
        goto LABEL_35;
      }
LABEL_57:
      int v13 = 0;
      id v27 = v108;
      int v28 = (void *)v112;
      goto LABEL_36;
    }
LABEL_21:
    int v13 = 0;
LABEL_40:

    goto LABEL_41;
  }
LABEL_12:
  int v13 = 0;
LABEL_41:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  appInFocusBundleID = self->_appInFocusBundleID;
  id v15 = v4;
  if (appInFocusBundleID)
  {
    [v4 encodeObject:appInFocusBundleID forKey:@"appInFocusBundleID"];
    id v4 = v15;
  }
  [v4 encodeInt64:self->_appInFocusWindowValid forKey:@"appInFocusWindowValid"];
  deviceWiFiSSID = self->_deviceWiFiSSID;
  if (deviceWiFiSSID) {
    [v15 encodeObject:deviceWiFiSSID forKey:@"deviceWiFiSSID"];
  }
  [v15 encodeInt64:self->_locationSemanticUserSpecificPlaceType forKey:@"locationSemanticUserSpecificPlaceType"];
  locationSemanticLoiIdentifier = self->_locationSemanticLoiIdentifier;
  if (locationSemanticLoiIdentifier) {
    [v15 encodeObject:locationSemanticLoiIdentifier forKey:@"locationSemanticLoiIdentifier"];
  }
  iCloudId = self->_iCloudId;
  if (iCloudId) {
    [v15 encodeObject:iCloudId forKey:@"iCloudId"];
  }
  avInitialRouteSharingPolicy = self->_avInitialRouteSharingPolicy;
  NSUInteger v10 = v15;
  if (avInitialRouteSharingPolicy)
  {
    [v15 encodeObject:avInitialRouteSharingPolicy forKey:@"avInitialRouteSharingPolicy"];
    NSUInteger v10 = v15;
  }
  mediaRouteGroupLeaderOutputDeviceID = self->_mediaRouteGroupLeaderOutputDeviceID;
  if (mediaRouteGroupLeaderOutputDeviceID)
  {
    [v15 encodeObject:mediaRouteGroupLeaderOutputDeviceID forKey:@"mediaRouteGroupLeaderOutputDeviceID"];
    NSUInteger v10 = v15;
  }
  [v10 encodeInt64:self->_timeZoneSeconds forKey:@"timeZoneSeconds"];
  outputDeviceName = self->_outputDeviceName;
  if (outputDeviceName) {
    [v15 encodeObject:outputDeviceName forKey:@"outputDeviceName"];
  }
  [v15 encodeInt64:self->_outputDeviceType forKey:@"outputDeviceType"];
  [v15 encodeInt64:self->_outputDeviceSubType forKey:@"outputDeviceSubType"];
  predictedOutputDeviceName = self->_predictedOutputDeviceName;
  if (predictedOutputDeviceName) {
    [v15 encodeObject:predictedOutputDeviceName forKey:@"predictedOutputDeviceName"];
  }
  [v15 encodeInt64:self->_predictedOutputDeviceType forKey:@"predictedOutputDeviceType"];
  [v15 encodeInt64:self->_predictedOutputDeviceSubType forKey:@"predictedOutputDeviceSubType"];
  [v15 encodeInt64:self->_appInFocusWindowScreenUnlockEvent forKey:@"appInFocusWindowScreenUnlockEvent"];
  [v15 encodeInt64:self->_pdrFenceActive forKey:@"pdrFenceActive"];
  latestPickerChoiceDate = self->_latestPickerChoiceDate;
  if (latestPickerChoiceDate) {
    [v15 encodeObject:latestPickerChoiceDate forKey:@"latestPickerChoiceDate"];
  }
  [v15 encodeInt64:self->_isContinuityDisplay forKey:@"isContinuityDisplay"];
  [v15 encodeInt64:self->_displayOn forKey:@"displayOn"];
}

- (id)description
{
  id v3 = [NSString alloc];
  appInFocusBundleID = self->_appInFocusBundleID;
  id v25 = v3;
  uint64_t v4 = [NSNumber numberWithBool:self->_appInFocusWindowValid];
  deviceWiFiSSID = self->_deviceWiFiSSID;
  v23 = (void *)v4;
  int64_t v21 = [NSNumber numberWithInt:self->_locationSemanticUserSpecificPlaceType];
  long long v20 = *(_OWORD *)&self->_locationSemanticLoiIdentifier;
  mediaRouteGroupLeaderOutputDeviceID = self->_mediaRouteGroupLeaderOutputDeviceID;
  avInitialRouteSharingPolicy = self->_avInitialRouteSharingPolicy;
  unint64_t v17 = [NSNumber numberWithLongLong:self->_timeZoneSeconds];
  outputDeviceName = self->_outputDeviceName;
  unint64_t v14 = [NSNumber numberWithUnsignedInteger:self->_outputDeviceType];
  id v5 = [NSNumber numberWithUnsignedInteger:self->_outputDeviceSubType];
  predictedOutputDeviceName = self->_predictedOutputDeviceName;
  BOOL v6 = [NSNumber numberWithUnsignedInteger:self->_predictedOutputDeviceType];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:self->_predictedOutputDeviceSubType];
  int v8 = [NSNumber numberWithBool:self->_appInFocusWindowScreenUnlockEvent];
  uint64_t v9 = [NSNumber numberWithBool:self->_pdrFenceActive];
  latestPickerChoiceDate = self->_latestPickerChoiceDate;
  int v11 = [NSNumber numberWithBool:self->_isContinuityDisplay];
  NSUInteger v12 = [NSNumber numberWithBool:self->_displayOn];
  int v26 = objc_msgSend(v25, "initWithFormat:", @"<IRSystemStateDO | appInFocusBundleID:%@ appInFocusWindowValid:%@ deviceWiFiSSID:%@ locationSemanticUserSpecificPlaceType:%@ locationSemanticLoiIdentifier:%@ iCloudId:%@ avInitialRouteSharingPolicy:%@ mediaRouteGroupLeaderOutputDeviceID:%@ timeZoneSeconds:%@ outputDeviceName:%@ outputDeviceType:%@ outputDeviceSubType:%@ predictedOutputDeviceName:%@ predictedOutputDeviceType:%@ predictedOutputDeviceSubType:%@ appInFocusWindowScreenUnlockEvent:%@ pdrFenceActive:%@ latestPickerChoiceDate:%@ isContinuityDisplay:%@ displayOn:%@>", appInFocusBundleID, v23, deviceWiFiSSID, v21, v20, avInitialRouteSharingPolicy, mediaRouteGroupLeaderOutputDeviceID, v17, outputDeviceName, v14, v5, predictedOutputDeviceName, v6, v7, v8, v9,
                  latestPickerChoiceDate,
                  v11,
                  v12);

  return v26;
}

- (BOOL)displayOn
{
  return self->_displayOn;
}

@end