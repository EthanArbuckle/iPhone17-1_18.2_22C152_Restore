@interface ACCNavigationRoadObjectDetectionInfo
+ (id)keyForType:(unsigned __int16)a3;
- (ACCNavigationRoadObjectDetectionInfo)init;
- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4;
- (BOOL)setInfo:(unsigned __int16)a3 data:(id)a4;
- (NSMutableDictionary)infoDict;
- (id)copyDictionary;
- (id)copyInfo:(unsigned __int16)a3;
- (id)description;
- (void)setInfoDict:(id)a3;
- (void)setInfoFromDictionary:(id)a3;
@end

@implementation ACCNavigationRoadObjectDetectionInfo

- (ACCNavigationRoadObjectDetectionInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACCNavigationRoadObjectDetectionInfo;
  v2 = [(ACCNavigationRoadObjectDetectionInfo *)&v6 init];
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
  id v2 = [(ACCNavigationRoadObjectDetectionInfo *)self copyInfo:0];
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"[ "];
  v4 = (char *)[v2 count];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v2;
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v30;
    do
    {
      v10 = 0;
      int v28 = v8;
      uint64_t v11 = v8 + 1;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v10);
        if (v4 > (char *)v10 + v11)
        {
          v13 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)v10) description];
          [v3 appendFormat:@"%@, ", v13];
        }
        v14 = [v12 description];
        [v3 appendFormat:@"%@ ", v14];

        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      int v8 = v28 + v7;
      id v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
  }
  v15 = v5;

  [v3 appendFormat:@"]"];
  id v16 = [v3 copy];

  id v17 = [(ACCNavigationRoadObjectDetectionInfo *)self copyInfo:1];
  id v18 = [(ACCNavigationRoadObjectDetectionInfo *)self copyInfo:2];
  id v19 = [(ACCNavigationRoadObjectDetectionInfo *)self copyInfo:3];
  id v20 = [(ACCNavigationRoadObjectDetectionInfo *)self copyInfo:4];
  id v21 = [v20 count];
  id v22 = [(ACCNavigationRoadObjectDetectionInfo *)self copyInfo:5];
  id v23 = [v22 count];
  id v24 = [(ACCNavigationRoadObjectDetectionInfo *)self copyInfo:6];
  v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<ACCNavigationRoadObjectDetectionInfo: componentIDs %@, timestamp %@, egoSpeed %@, egoYawRate %@, roadSign count %lu, roadLane count %lu, roadObject count %lu>", v16, v17, v18, v19, v21, v23, [v24 count]);

  return v25;
}

- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4
{
  unsigned int v4 = a3;
  id v5 = a4;
  if (v4 > 6)
  {
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
  unsigned int v4 = +[ACCNavigationRoadObjectDetectionInfo keyForType:a3];
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
  id v7 = +[ACCNavigationRoadObjectDetectionInfo keyForType:v4];
  if (v7
    && [(ACCNavigationRoadObjectDetectionInfo *)self _checkDataClassForType:v4 data:v6])
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
  id v4 = a3;
  if (v4)
  {
    [(NSMutableDictionary *)self->_infoDict removeAllObjects];
    _setInfoFromDictionary(v4, self->_infoDict, ACCNav_RODUpdate_ID);
    _setInfoFromDictionary(v4, self->_infoDict, ACCNav_RODUpdate_Timestamp);
    _setInfoFromDictionary(v4, self->_infoDict, ACCNav_RODUpdate_EgoSpeed);
    _setInfoFromDictionary(v4, self->_infoDict, ACCNav_RODUpdate_EgoYawRate);
    id v5 = [v4 objectForKey:ACCNav_RODUpdate_RoadSign];
    long long v32 = self;
    if (v5)
    {
      id v6 = objc_alloc_init((Class)NSMutableArray);
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v7 = v5;
      id v8 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v42;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v42 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v11);
            v13 = objc_alloc_init(ACCNavigationRoadObjectRoadSignInfo);
            [(ACCNavigationRoadObjectRoadSignInfo *)v13 setInfoFromDictionary:v12];
            [v6 addObject:v13];

            uint64_t v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
        }
        while (v9);
      }

      [(NSMutableDictionary *)v32->_infoDict setObject:v6 forKey:ACCNav_RODUpdate_RoadSign];
    }
    v14 = [v4 objectForKey:ACCNav_RODUpdate_RoadLane];

    if (v14)
    {
      id v15 = objc_alloc_init((Class)NSMutableArray);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v16 = v14;
      id v17 = [v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v38;
        do
        {
          id v20 = 0;
          do
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v37 + 1) + 8 * (void)v20);
            id v22 = objc_alloc_init(ACCNavigationRoadObjectRoadLaneInfo);
            [(ACCNavigationRoadObjectRoadLaneInfo *)v22 setInfoFromDictionary:v21];
            [v15 addObject:v22];

            id v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
        }
        while (v18);
      }

      [(NSMutableDictionary *)v32->_infoDict setObject:v15 forKey:ACCNav_RODUpdate_RoadLane];
    }
    id v23 = [v4 objectForKey:ACCNav_RODUpdate_RoadObject];

    if (v23)
    {
      id v24 = objc_alloc_init((Class)NSMutableArray);
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v25 = v23;
      id v26 = [v25 countByEnumeratingWithState:&v33 objects:v45 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v34;
        do
        {
          long long v29 = 0;
          do
          {
            if (*(void *)v34 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v29);
            long long v31 = objc_alloc_init(ACCNavigationRoadObjectRoadObjectInfo);
            [(ACCNavigationRoadObjectRoadObjectInfo *)v31 setInfoFromDictionary:v30];
            [v24 addObject:v31];

            long long v29 = (char *)v29 + 1;
          }
          while (v27 != v29);
          id v27 = [v25 countByEnumeratingWithState:&v33 objects:v45 count:16];
        }
        while (v27);
      }

      [(NSMutableDictionary *)v32->_infoDict setObject:v24 forKey:ACCNav_RODUpdate_RoadObject];
    }
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
      id v4 = &ACCNav_RODUpdate_ID;
      goto LABEL_17;
    case 1u:
      id v4 = &ACCNav_RODUpdate_Timestamp;
      goto LABEL_17;
    case 2u:
      id v4 = &ACCNav_RODUpdate_EgoSpeed;
      goto LABEL_17;
    case 3u:
      id v4 = &ACCNav_RODUpdate_EgoYawRate;
      goto LABEL_17;
    case 4u:
      id v4 = &ACCNav_RODUpdate_RoadSign;
      goto LABEL_17;
    case 5u:
      id v4 = &ACCNav_RODUpdate_RoadLane;
      goto LABEL_17;
    case 6u:
      id v4 = &ACCNav_RODUpdate_RoadObject;
LABEL_17:
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