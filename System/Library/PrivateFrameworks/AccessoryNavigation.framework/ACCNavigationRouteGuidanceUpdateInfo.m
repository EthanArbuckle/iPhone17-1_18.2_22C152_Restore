@interface ACCNavigationRouteGuidanceUpdateInfo
+ (id)keyForChargingStationInfoType:(unsigned __int16)a3;
+ (id)keyForType:(unsigned __int16)a3;
- (ACCNavigationRouteGuidanceUpdateInfo)init;
- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4;
- (BOOL)setInfo:(unsigned __int16)a3 data:(id)a4;
- (NSMutableDictionary)infoDict;
- (id)copyDictionary;
- (id)copyInfo:(unsigned __int16)a3;
- (void)setInfoDict:(id)a3;
@end

@implementation ACCNavigationRouteGuidanceUpdateInfo

- (ACCNavigationRouteGuidanceUpdateInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACCNavigationRouteGuidanceUpdateInfo;
  v2 = [(ACCNavigationRouteGuidanceUpdateInfo *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    infoDict = v2->_infoDict;
    v2->_infoDict = v3;
  }
  return v2;
}

- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4
{
  unsigned int v4 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (v4 > 0x1A)
  {
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 1;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
      }
      v10 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    else
    {
      v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v4;
      _os_log_impl(&dword_22605D000, v10, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown RouteGuidnaceUpdate InfoType %d", (uint8_t *)v11, 8u);
    }

    char isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)copyInfo:(unsigned __int16)a3
{
  unsigned int v4 = +[ACCNavigationRouteGuidanceUpdateInfo keyForType:a3];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_infoDict objectForKey:v4];
    objc_super v6 = (void *)[v5 copy];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (BOOL)setInfo:(unsigned __int16)a3 data:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = +[ACCNavigationRouteGuidanceUpdateInfo keyForType:v4];
  if (v7
    && [(ACCNavigationRouteGuidanceUpdateInfo *)self _checkDataClassForType:v4 data:v6])
  {
    [(NSMutableDictionary *)self->_infoDict setObject:v6 forKey:v7];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)copyDictionary
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)keyForType:(unsigned __int16)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 1u:
      v3 = &ACCNav_RGUpdate_RouteGuidanceState;
      goto LABEL_36;
    case 2u:
      v3 = &ACCNav_RGUpdate_ManeuverState;
      goto LABEL_36;
    case 3u:
      v3 = &ACCNav_RGUpdate_CurrentRoadName;
      goto LABEL_36;
    case 4u:
      v3 = &ACCNav_RGUpdate_DestinationName;
      goto LABEL_36;
    case 5u:
      v3 = &ACCNav_RGUpdate_EstimatedTimeOfArrival;
      goto LABEL_36;
    case 6u:
      v3 = &ACCNav_RGUpdate_TimeRemainingToDestination;
      goto LABEL_36;
    case 7u:
      v3 = &ACCNav_RGUpdate_DistanceRemaining;
      goto LABEL_36;
    case 8u:
      v3 = &ACCNav_RGUpdate_DistanceRemainingDisplayString;
      goto LABEL_36;
    case 9u:
      v3 = &ACCNav_RGUpdate_DistanceRemainingDisplayUnits;
      goto LABEL_36;
    case 0xAu:
      v3 = &ACCNav_RGUpdate_DistanceRemainingToNextManeuver;
      goto LABEL_36;
    case 0xBu:
      v3 = &ACCNav_RGUpdate_DistanceRemainingToNextManeuverDisplayString;
      goto LABEL_36;
    case 0xCu:
      v3 = &ACCNav_RGUpdate_DistanceRemainingToNextManeuverDisplayUnits;
      goto LABEL_36;
    case 0xDu:
      v3 = &ACCNav_RGUpdate_RouteGuidanceManeuverCurrentList;
      goto LABEL_36;
    case 0xEu:
      v3 = &ACCNav_RGUpdate_RouteGuidanceManeuverCount;
      goto LABEL_36;
    case 0xFu:
      v3 = &ACCNav_RGUpdate_RouteGuidanceBeingShownInApp;
      goto LABEL_36;
    case 0x10u:
      v3 = &ACCNav_RGUpdate_LaneGuidanceCurrentIndex;
      goto LABEL_36;
    case 0x11u:
      v3 = &ACCNav_RGUpdate_LaneGuidanceTotalCount;
      goto LABEL_36;
    case 0x12u:
      v3 = &ACCNav_RGUpdate_LaneGuidanceShowing;
      goto LABEL_36;
    case 0x13u:
      v3 = &ACCNav_RGUpdate_SourceName;
      goto LABEL_36;
    case 0x14u:
      v3 = &ACCNav_RGUpdate_SourceSupportsRouteGuidance;
      goto LABEL_36;
    case 0x15u:
      v3 = &ACCNav_RGUpdate_DestinationTimeZoneOffsetMinutes;
      goto LABEL_36;
    case 0x16u:
      v3 = &ACCNav_RGUpdate_StopType;
      goto LABEL_36;
    case 0x17u:
      v3 = &ACCNav_RGUpdate_ChargingStationInfoList;
      goto LABEL_36;
    case 0x18u:
      v3 = &ACCNav_RGUpdate_ArrivalBatteryLevel;
      goto LABEL_36;
    case 0x19u:
      v3 = &ACCNav_RGUpdate_DepartureBatteryLevel;
      goto LABEL_36;
    case 0x1Au:
      v3 = &ACCNav_RGUpdate_FinalWaypointBatteryLevel;
LABEL_36:
      v7 = *v3;
      break;
    default:
      int v4 = a3;
      if (gLogObjects) {
        BOOL v5 = gNumLogObjects < 1;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
        }
        id v9 = &_os_log_internal;
        id v6 = &_os_log_internal;
      }
      else
      {
        id v9 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = v4;
        _os_log_impl(&dword_22605D000, v9, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown RouteGuidnaceUpdate InfoType %d", (uint8_t *)v10, 8u);
      }

      v7 = 0;
      break;
  }
  return v7;
}

+ (id)keyForChargingStationInfoType:(unsigned __int16)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    int v4 = &ACCNav_RGUpdate_ChargingStationInfo_Power;
    goto LABEL_7;
  }
  int v3 = a3;
  if (a3 == 1)
  {
    int v4 = &ACCNav_RGUpdate_ChargingStationInfo_Voltage;
    goto LABEL_7;
  }
  if (!a3)
  {
    int v4 = &ACCNav_RGUpdate_ChargingStationInfo_ConnectorType;
LABEL_7:
    BOOL v5 = *v4;
    goto LABEL_19;
  }
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    BOOL v8 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  else
  {
    BOOL v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl(&dword_22605D000, v8, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown RouteGuidnaceUpdate CharginStation InfoType %d", (uint8_t *)v10, 8u);
  }

  BOOL v5 = 0;
LABEL_19:
  return v5;
}

- (NSMutableDictionary)infoDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInfoDict:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_checkDataClassForType:data:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22605D000, &_os_log_internal, v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

@end