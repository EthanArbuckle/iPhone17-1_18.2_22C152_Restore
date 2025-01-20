@interface ACCNavigationLaneGuidanceInfo
+ (id)keyForType:(unsigned __int16)a3;
- (ACCNavigationLaneGuidanceInfo)init;
- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4;
- (BOOL)setInfo:(unsigned __int16)a3 data:(id)a4;
- (NSMutableDictionary)infoDict;
- (id)copyDictionary;
- (id)copyInfo:(unsigned __int16)a3;
- (void)setInfoDict:(id)a3;
@end

@implementation ACCNavigationLaneGuidanceInfo

- (ACCNavigationLaneGuidanceInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACCNavigationLaneGuidanceInfo;
  v2 = [(ACCNavigationLaneGuidanceInfo *)&v6 init];
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
      _os_log_impl(&dword_22605D000, v8, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown LaneGuidanceInfoUpdate InfoType %d", (uint8_t *)v10, 8u);
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
  unsigned int v4 = +[ACCNavigationLaneGuidanceInfo keyForType:a3];
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
  v7 = +[ACCNavigationLaneGuidanceInfo keyForType:v4];
  if (v7 && [(ACCNavigationLaneGuidanceInfo *)self _checkDataClassForType:v4 data:v6])
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
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_infoDict];
  v3 = [v2 objectForKey:ACCNav_LGIUpdate_LaneInfo];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "copyDictionary", (void)v12);
          [v4 addObject:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v2 setObject:v4 forKey:ACCNav_LGIUpdate_LaneInfo];
  }

  return v2;
}

+ (id)keyForType:(unsigned __int16)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3 == 3)
  {
    id v4 = &ACCNav_LGIUpdate_InstructionText;
    goto LABEL_7;
  }
  int v3 = a3;
  if (a3 == 2)
  {
    id v4 = &ACCNav_LGIUpdate_LaneInfo;
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    id v4 = &ACCNav_LGIUpdate_LaneGuidanceIndex;
LABEL_7:
    id v5 = *v4;
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
    uint64_t v8 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  else
  {
    uint64_t v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl(&dword_22605D000, v8, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown LaneGuidanceInfoUpdate InfoType %d", (uint8_t *)v10, 8u);
  }

  id v5 = 0;
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

@end