@interface ACCNavigationRoadObjectRoadLaneInfo
+ (id)keyForType:(unsigned __int16)a3;
- (ACCNavigationRoadObjectRoadLaneInfo)init;
- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4;
- (BOOL)setInfo:(unsigned __int16)a3 data:(id)a4;
- (NSMutableDictionary)infoDict;
- (id)copyDictionary;
- (id)copyInfo:(unsigned __int16)a3;
- (id)description;
- (void)setInfoDict:(id)a3;
- (void)setInfoFromDictionary:(id)a3;
@end

@implementation ACCNavigationRoadObjectRoadLaneInfo

- (ACCNavigationRoadObjectRoadLaneInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACCNavigationRoadObjectRoadLaneInfo;
  v2 = [(ACCNavigationRoadObjectRoadLaneInfo *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    infoDict = v2->_infoDict;
    v2->_infoDict = v3;
  }
  return v2;
}

- (id)description
{
  id v14 = [(ACCNavigationRoadObjectRoadLaneInfo *)self copyInfo:0];
  id v3 = [(ACCNavigationRoadObjectRoadLaneInfo *)self copyInfo:1];
  id v4 = [(ACCNavigationRoadObjectRoadLaneInfo *)self copyInfo:2];
  id v5 = [(ACCNavigationRoadObjectRoadLaneInfo *)self copyInfo:3];
  id v6 = [(ACCNavigationRoadObjectRoadLaneInfo *)self copyInfo:4];
  id v7 = [(ACCNavigationRoadObjectRoadLaneInfo *)self copyInfo:5];
  id v8 = [(ACCNavigationRoadObjectRoadLaneInfo *)self copyInfo:6];
  id v9 = [(ACCNavigationRoadObjectRoadLaneInfo *)self copyInfo:7];
  id v10 = [(ACCNavigationRoadObjectRoadLaneInfo *)self copyInfo:8];
  id v11 = [(ACCNavigationRoadObjectRoadLaneInfo *)self copyInfo:9];
  v12 = +[NSString stringWithFormat:@"<ACCNavigationRoadObjectRoadLaneInfo: ID %@, state %@, type[left %@, right %@], color[left %@, right %@], width %@, curvature[center %@, left %@, right %@]>", v14, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4
{
  unsigned int v4 = a3;
  id v5 = a4;
  if (v4 > 9)
  {
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 1;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v9 = &_os_log_default;
      id v8 = &_os_log_default;
    }
    else
    {
      id v9 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown RoadObjectDetection:RoadLane InfoType %d", (uint8_t *)v11, 8u);
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
  unsigned int v4 = +[ACCNavigationRoadObjectRoadLaneInfo keyForType:a3];
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
  BOOL v7 = +[ACCNavigationRoadObjectRoadLaneInfo keyForType:v4];
  if (v7
    && [(ACCNavigationRoadObjectRoadLaneInfo *)self _checkDataClassForType:v4 data:v6])
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

- (void)setInfoFromDictionary:(id)a3
{
  if (a3)
  {
    infoDict = self->_infoDict;
    id v5 = a3;
    [(NSMutableDictionary *)infoDict removeAllObjects];
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_ID);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_State);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_TypeLeft);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_TypeRight);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_ColorLeft);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_ColorRight);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_Width);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_CurvatureCenter);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_CurvatureLeft);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_ColorRight);
  }
}

- (id)copyDictionary
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)keyForType:(unsigned __int16)a3
{
  int v3 = a3;
  switch(a3)
  {
    case 0u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_ID;
      goto LABEL_19;
    case 1u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_State;
      goto LABEL_19;
    case 2u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_TypeLeft;
      goto LABEL_19;
    case 3u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_TypeRight;
      goto LABEL_19;
    case 4u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_ColorLeft;
      goto LABEL_19;
    case 5u:
    case 9u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_ColorRight;
      goto LABEL_19;
    case 6u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_Width;
      goto LABEL_19;
    case 7u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_CurvatureCenter;
      goto LABEL_19;
    case 8u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_CurvatureLeft;
LABEL_19:
      BOOL v7 = *v4;
      break;
    default:
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
        v10[1] = v3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown RoadObjectDetectionInfo infoType %d", (uint8_t *)v10, 8u);
      }

      BOOL v7 = 0;
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