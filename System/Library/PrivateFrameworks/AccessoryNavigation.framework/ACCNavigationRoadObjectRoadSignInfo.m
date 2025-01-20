@interface ACCNavigationRoadObjectRoadSignInfo
+ (id)keyForType:(unsigned __int16)a3;
- (ACCNavigationRoadObjectRoadSignInfo)init;
- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4;
- (BOOL)setInfo:(unsigned __int16)a3 data:(id)a4;
- (NSMutableDictionary)infoDict;
- (id)copyDictionary;
- (id)copyInfo:(unsigned __int16)a3;
- (id)description;
- (void)setInfoDict:(id)a3;
- (void)setInfoFromDictionary:(id)a3;
@end

@implementation ACCNavigationRoadObjectRoadSignInfo

- (ACCNavigationRoadObjectRoadSignInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACCNavigationRoadObjectRoadSignInfo;
  v2 = [(ACCNavigationRoadObjectRoadSignInfo *)&v6 init];
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
  v3 = NSString;
  id v4 = [(ACCNavigationRoadObjectRoadSignInfo *)self copyInfo:0];
  id v5 = [(ACCNavigationRoadObjectRoadSignInfo *)self copyInfo:1];
  id v6 = [(ACCNavigationRoadObjectRoadSignInfo *)self copyInfo:2];
  id v7 = [(ACCNavigationRoadObjectRoadSignInfo *)self copyInfo:3];
  id v8 = [(ACCNavigationRoadObjectRoadSignInfo *)self copyInfo:4];
  id v9 = [(ACCNavigationRoadObjectRoadSignInfo *)self copyInfo:5];
  v10 = [v3 stringWithFormat:@"<ACCNavigationRoadObjectRoadSignInfo: ID %@, state %@, type %@, value '%@', lateralOffset %@, forwardOffset %@>", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4
{
  unsigned int v4 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (v4 > 5)
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
      _os_log_impl(&dword_22605D000, v10, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown RoadObjectDetection:RoadSign InfoType %d", (uint8_t *)v11, 8u);
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
  unsigned int v4 = +[ACCNavigationRoadObjectRoadSignInfo keyForType:a3];
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
  id v7 = +[ACCNavigationRoadObjectRoadSignInfo keyForType:v4];
  if (v7
    && [(ACCNavigationRoadObjectRoadSignInfo *)self _checkDataClassForType:v4 data:v6])
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
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadSign_ID);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadSign_State);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadSign_Type);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadSign_Value);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadSign_LateralOffset);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadSign_ForwardOffset);
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
      uint64_t v4 = &ACCNav_RODUpdate_RoadSign_ID;
      goto LABEL_16;
    case 1u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadSign_State;
      goto LABEL_16;
    case 2u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadSign_Type;
      goto LABEL_16;
    case 3u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadSign_Value;
      goto LABEL_16;
    case 4u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadSign_LateralOffset;
      goto LABEL_16;
    case 5u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadSign_ForwardOffset;
LABEL_16:
      id v7 = *v4;
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

      id v7 = 0;
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