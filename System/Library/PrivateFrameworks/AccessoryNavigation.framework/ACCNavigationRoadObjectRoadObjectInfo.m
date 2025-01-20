@interface ACCNavigationRoadObjectRoadObjectInfo
+ (id)keyForType:(unsigned __int16)a3;
- (ACCNavigationRoadObjectRoadObjectInfo)init;
- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4;
- (BOOL)setInfo:(unsigned __int16)a3 data:(id)a4;
- (NSMutableDictionary)infoDict;
- (id)copyDictionary;
- (id)copyInfo:(unsigned __int16)a3;
- (id)description;
- (void)setInfoDict:(id)a3;
- (void)setInfoFromDictionary:(id)a3;
@end

@implementation ACCNavigationRoadObjectRoadObjectInfo

- (ACCNavigationRoadObjectRoadObjectInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACCNavigationRoadObjectRoadObjectInfo;
  v2 = [(ACCNavigationRoadObjectRoadObjectInfo *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    infoDict = v2->_infoDict;
    v2->_infoDict = v3;
  }
  return v2;
}

- (id)description
{
  v15 = NSString;
  id v14 = [(ACCNavigationRoadObjectRoadObjectInfo *)self copyInfo:0];
  id v3 = [(ACCNavigationRoadObjectRoadObjectInfo *)self copyInfo:1];
  id v4 = [(ACCNavigationRoadObjectRoadObjectInfo *)self copyInfo:2];
  id v5 = [(ACCNavigationRoadObjectRoadObjectInfo *)self copyInfo:3];
  id v6 = [(ACCNavigationRoadObjectRoadObjectInfo *)self copyInfo:4];
  id v7 = [(ACCNavigationRoadObjectRoadObjectInfo *)self copyInfo:5];
  id v8 = [(ACCNavigationRoadObjectRoadObjectInfo *)self copyInfo:6];
  id v9 = [(ACCNavigationRoadObjectRoadObjectInfo *)self copyInfo:7];
  id v10 = [(ACCNavigationRoadObjectRoadObjectInfo *)self copyInfo:8];
  id v11 = [(ACCNavigationRoadObjectRoadObjectInfo *)self copyInfo:9];
  v12 = [v15 stringWithFormat:@"<ACCNavigationRoadObjectRoadObjectInfo: ID %@, state %@, type %@, isMoving %@, lateral[offset %@, speed %@, accel %@] forward[offset %@, speed %@, accel %@]>", v14, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4
{
  unsigned int v4 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
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
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
      }
      id v9 = &_os_log_internal;
      id v8 = &_os_log_internal;
    }
    else
    {
      id v9 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v4;
      _os_log_impl(&dword_22605D000, v9, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown RoadObjectDetection:RoadObject InfoType %d", (uint8_t *)v11, 8u);
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
  unsigned int v4 = +[ACCNavigationRoadObjectRoadObjectInfo keyForType:a3];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_infoDict objectForKey:v4];
    id v6 = (void *)[v5 copy];
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
  BOOL v7 = +[ACCNavigationRoadObjectRoadObjectInfo keyForType:v4];
  if (v7
    && [(ACCNavigationRoadObjectRoadObjectInfo *)self _checkDataClassForType:v4 data:v6])
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
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_ID);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_State);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_Type);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_IsMoving);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_LateralOffset);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_LateralSpeed);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_LateralAccel);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_ForwardOffset);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_ForwardSpeed);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_ForwardAccel);
  }
}

- (id)copyDictionary
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)keyForType:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadObject_ID;
      goto LABEL_20;
    case 1u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadObject_State;
      goto LABEL_20;
    case 2u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadObject_Type;
      goto LABEL_20;
    case 3u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadObject_IsMoving;
      goto LABEL_20;
    case 4u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadObject_LateralOffset;
      goto LABEL_20;
    case 5u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadObject_LateralSpeed;
      goto LABEL_20;
    case 6u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadObject_LateralAccel;
      goto LABEL_20;
    case 7u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadObject_ForwardOffset;
      goto LABEL_20;
    case 8u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadObject_ForwardSpeed;
      goto LABEL_20;
    case 9u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadObject_ForwardAccel;
LABEL_20:
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
        v10[1] = v3;
        _os_log_impl(&dword_22605D000, v9, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown RoadObjectDetectionInfo infoType %d", (uint8_t *)v10, 8u);
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