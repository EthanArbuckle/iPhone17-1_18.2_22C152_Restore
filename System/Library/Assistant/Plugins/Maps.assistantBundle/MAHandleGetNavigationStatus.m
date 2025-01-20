@interface MAHandleGetNavigationStatus
- (id)_maneuverETAForGuidanceState:(id)a3;
- (id)_metersToMiles:(id)a3;
- (id)_navigationVolumeForGuidanceState:(id)a3;
- (id)_overallETAForGuidanceState:(id)a3;
- (id)_routeForGuidanceState:(id)a3;
- (id)_secondsToMinutes:(id)a3;
- (id)_trafficIncidentAlertTypeForGuidanceState:(id)a3;
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation MAHandleGetNavigationStatus

- (id)_routeForGuidanceState:(id)a3
{
  id v3 = a3;
  v4 = [v3 originalWaypointRouteData];
  v5 = [v3 legacyRouteData];
  uint64_t v6 = [v3 navSessionData];
  v13 = (void *)v6;
  if (v4 || v5 || v6)
  {
    id v14 = objc_alloc_init((Class)SALocalSearchRoute);
    [v14 setRouteAsZilchBinary:v5];
    [v14 setSessionState:v13];
    v15 = [v3 etaFilterData];
    [v14 setEtaFilter:v15];

    v16 = [v3 incidentsOnRouteData];
    [v14 setRouteIncidents:v16];

    v17 = [v3 incidentsOnRouteOffsets];
    [v14 setRouteIncidentOffsets:v17];

    v18 = [v3 evChargingMetadata];
    [v14 setEvChargingMetadata:v18];

    [v14 setOriginalWaypointRoute:v4];
  }
  else
  {
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Requested route but couldn't create one, originalWaypointRouteData: %d sessionState: %d", v7, v8, v9, v10, v11, v12, 0);
    id v14 = 0;
  }

  return v14;
}

- (id)_maneuverETAForGuidanceState:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)SALocalSearchAceNavigationEta);
  id v6 = objc_alloc_init((Class)SADuration);
  uint64_t v7 = [v4 timeToNextManeuver];
  uint64_t v8 = [(MAHandleGetNavigationStatus *)self _secondsToMinutes:v7];
  [v6 setValue:v8];

  [v6 setUnit:SADurationUnitMinutesValue];
  [v5 setTimeEta:v6];
  id v9 = objc_alloc_init((Class)SADistance);
  uint64_t v10 = [v4 distance];

  uint64_t v11 = [(MAHandleGetNavigationStatus *)self _metersToMiles:v10];
  [v9 setValue:v11];

  [v9 setUnit:SADistanceUnitMilesValue];
  [v5 setDistanceEta:v9];

  return v5;
}

- (id)_overallETAForGuidanceState:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)SALocalSearchAceNavigationEta);
  id v6 = objc_alloc_init((Class)SADuration);
  uint64_t v7 = [v4 remainingMinutesOnRoute];
  [v6 setValue:v7];

  [v6 setUnit:SADurationUnitMinutesValue];
  [v5 setTimeEta:v6];
  id v8 = objc_alloc_init((Class)SADistance);
  id v9 = [v4 remainingDistanceOnRoute];

  uint64_t v10 = [(MAHandleGetNavigationStatus *)self _metersToMiles:v9];
  [v8 setValue:v10];

  [v8 setUnit:SADistanceUnitMilesValue];
  [v5 setDistanceEta:v8];

  return v5;
}

- (id)_trafficIncidentAlertTypeForGuidanceState:(id)a3
{
  id v3 = [a3 trafficIncidentAlert];
  id v4 = v3;
  if (v3 && (id v5 = (char *)[v3 type], (unint64_t)(v5 - 1) <= 5)) {
    id v6 = *(id *)*(&off_418A0 + (void)(v5 - 1));
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)_navigationVolumeForGuidanceState:(id)a3
{
  id v3 = [a3 navVolumeSetting];
  if ([v3 isEqualToString:@"Loud Volume"])
  {
    id v4 = (id *)&SALocalSearchNavigationVoiceVolumeLoudValue;
LABEL_8:
    id v5 = *v4;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"Normal Volume"])
  {
    id v4 = (id *)&SALocalSearchNavigationVoiceVolumeNormalValue;
    goto LABEL_8;
  }
  if (([v3 isEqualToString:@"Low Volume"] & 1) != 0
    || [v3 isEqualToString:@"Off Volume"])
  {
    id v4 = (id *)&SALocalSearchNavigationVoiceVolumeLowValue;
    goto LABEL_8;
  }
  id v5 = 0;
LABEL_9:

  return v5;
}

- (id)_metersToMiles:(id)a3
{
  [a3 doubleValue];
  double v4 = v3 * 0.000621371192;

  return +[NSNumber numberWithDouble:v4];
}

- (id)_secondsToMinutes:(id)a3
{
  [a3 doubleValue];
  double v4 = v3 / 60.0;

  return +[NSNumber numberWithDouble:v4];
}

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)SACommandFailed);
  id v7 = [v6 initWithErrorCode:SALocalSearchNavigationNotRunningErrorCode];
  id v8 = +[MKMapService sharedService];
  [v8 captureUserAction:8006 onTarget:802 eventValue:0];

  id v9 = +[MapsSiriIPCInterface sharedInterface];
  [v9 initializeBrokerConnectionIfNeeded];
  if ([v9 canReceiveMessages]
    && ![v9 isMapsBackgroundTaskSuspended])
  {
    v18 = objc_alloc_init(IPCGuidanceStateMessage);
    v19 = [(MAHandleGetNavigationStatus *)self getRoute];
    -[IPCGuidanceStateMessage setIncludeRoute:](v18, "setIncludeRoute:", [v19 BOOLValue]);

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_19514;
    v20[3] = &unk_41880;
    v20[4] = self;
    id v22 = v5;
    id v21 = v7;
    [v9 getGuidanceState:v18 completion:v20];
  }
  else
  {
    unsigned int v10 = [v9 canReceiveMessages];
    [v9 isMapsBackgroundTaskSuspended];
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Failed as IPC can't receive messages. canReceiveMessages: %d isMapsBackgroundTaskSuspended: %d", v11, v12, v13, v14, v15, v16, v10);
    v17 = [v7 dictionary];
    (*((void (**)(id, void *))v5 + 2))(v5, v17);
  }
}

@end