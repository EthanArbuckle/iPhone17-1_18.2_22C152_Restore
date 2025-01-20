@interface ACCNavigationLaneGuidanceLaneInfo
+ (id)keyForType:(unsigned __int16)a3;
- (ACCNavigationLaneGuidanceLaneInfo)init;
- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4;
- (BOOL)setInfo:(unsigned __int16)a3 data:(id)a4;
- (NSMutableDictionary)infoDict;
- (id)copyDictionary;
- (id)copyInfo:(unsigned __int16)a3;
- (void)setInfoDict:(id)a3;
@end

@implementation ACCNavigationLaneGuidanceLaneInfo

- (ACCNavigationLaneGuidanceLaneInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACCNavigationLaneGuidanceLaneInfo;
  v2 = [(ACCNavigationLaneGuidanceLaneInfo *)&v6 init];
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
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (v4 >= 4)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
      }
      v8 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v4;
      _os_log_impl(&dword_22605D000, v8, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown LaneGuidanceInfoUpdate:LaneInfo InfoType %d", (uint8_t *)v10, 8u);
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
  unsigned int v4 = +[ACCNavigationLaneGuidanceLaneInfo keyForType:a3];
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
  v7 = +[ACCNavigationLaneGuidanceLaneInfo keyForType:v4];
  if (v7
    && [(ACCNavigationLaneGuidanceLaneInfo *)self _checkDataClassForType:v4 data:v6])
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
  int v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0u:
      uint64_t v4 = &ACCNav_LGIUpdate_LaneInfo_Index;
      goto LABEL_14;
    case 1u:
      uint64_t v4 = &ACCNav_LGIUpdate_LaneInfo_Status;
      goto LABEL_14;
    case 2u:
      uint64_t v4 = &ACCNav_LGIUpdate_LaneInfo_Angle;
      goto LABEL_14;
    case 3u:
      uint64_t v4 = &ACCNav_LGIUpdate_LaneInfo_AngleHighlight;
LABEL_14:
      v7 = *v4;
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
        _os_log_impl(&dword_22605D000, v9, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown LaneGuidanceInfoUpdate:LaneInfo InfoType %d", (uint8_t *)v10, 8u);
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