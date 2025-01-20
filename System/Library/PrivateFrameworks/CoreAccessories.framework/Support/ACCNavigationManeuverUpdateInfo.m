@interface ACCNavigationManeuverUpdateInfo
+ (id)keyForType:(unsigned __int16)a3;
- (ACCNavigationManeuverUpdateInfo)init;
- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4;
- (BOOL)setInfo:(unsigned __int16)a3 data:(id)a4;
- (NSMutableDictionary)infoDict;
- (id)copyDictionary;
- (id)copyInfo:(unsigned __int16)a3;
- (void)setInfoDict:(id)a3;
@end

@implementation ACCNavigationManeuverUpdateInfo

- (ACCNavigationManeuverUpdateInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACCNavigationManeuverUpdateInfo;
  v2 = [(ACCNavigationManeuverUpdateInfo *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    infoDict = v2->_infoDict;
    v2->_infoDict = v3;
  }
  return v2;
}

- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4
{
  unsigned int v4 = a3;
  id v5 = a4;
  if (v4 <= 0xD && (((1 << v4) & 0x1BAA) != 0 || ((1 << v4) & 0x2054) != 0 || v4 == 10))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 1;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v10 = &_os_log_default;
      id v9 = &_os_log_default;
    }
    else
    {
      v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown ManeuverInfoUpdate InfoType %d", (uint8_t *)v11, 8u);
    }

    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)copyInfo:(unsigned __int16)a3
{
  unsigned int v4 = +[ACCNavigationManeuverUpdateInfo keyForType:a3];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_infoDict objectForKey:v4];
    id v6 = [v5 copy];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)setInfo:(unsigned __int16)a3 data:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = +[ACCNavigationManeuverUpdateInfo keyForType:v4];
  if (v7
    && [(ACCNavigationManeuverUpdateInfo *)self _checkDataClassForType:v4 data:v6])
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
  switch(a3)
  {
    case 1u:
      v3 = &ACCNav_MIUpdate_Index;
      goto LABEL_23;
    case 2u:
      v3 = &ACCNav_MIUpdate_ManeuverDescription;
      goto LABEL_23;
    case 3u:
      v3 = &ACCNav_MIUpdate_ManeuverType;
      goto LABEL_23;
    case 4u:
      v3 = &ACCNav_MIUpdate_AfterManeuverRoadName;
      goto LABEL_23;
    case 5u:
      v3 = &ACCNav_MIUpdate_DistanceBetweenManeuver;
      goto LABEL_23;
    case 6u:
      v3 = &ACCNav_MIUpdate_DistanceBetweenManeuverDisplayString;
      goto LABEL_23;
    case 7u:
      v3 = &ACCNav_MIUpdate_DistanceBetweenManeuverDisplayUnits;
      goto LABEL_23;
    case 8u:
      v3 = &ACCNav_MIUpdate_DrivingSide;
      goto LABEL_23;
    case 9u:
      v3 = &ACCNav_MIUpdate_JunctionType;
      goto LABEL_23;
    case 0xAu:
      v3 = &ACCNav_MIUpdate_JunctionElementAngle;
      goto LABEL_23;
    case 0xBu:
      v3 = &ACCNav_MIUpdate_JunctionElementExitAngle;
      goto LABEL_23;
    case 0xCu:
      v3 = &ACCNav_MIUpdate_LinkedLaneGuidanceInfo;
      goto LABEL_23;
    case 0xDu:
      v3 = &ACCNav_MIUpdate_ExitInfo;
LABEL_23:
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
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v9 = &_os_log_default;
        id v6 = &_os_log_default;
      }
      else
      {
        id v9 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown ManeuverInfoUpdate InfoType %d", (uint8_t *)v10, 8u);
      }

      v7 = 0;
      break;
  }

  return v7;
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

@end