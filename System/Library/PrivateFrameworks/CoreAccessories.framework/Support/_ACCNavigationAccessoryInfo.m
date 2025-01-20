@interface _ACCNavigationAccessoryInfo
- (BOOL)componentStarted:(id)a3;
- (NSDictionary)componentList;
- (NSString)accessoryUID;
- (_ACCNavigationAccessoryInfo)initWithUID:(id)a3 componentList:(id)a4;
- (id)componentIdList;
- (id)description;
- (id)startedComponentList;
- (unint64_t)componentOptions:(id)a3;
- (void)assignComponentList:(id)a3;
- (void)componentIdList;
- (void)dealloc;
- (void)setAccessoryUID:(id)a3;
- (void)setComponent:(id)a3 options:(unint64_t)a4;
- (void)setComponent:(id)a3 started:(BOOL)a4;
- (void)setComponentList:(id)a3;
- (void)startedComponentList;
@end

@implementation _ACCNavigationAccessoryInfo

- (_ACCNavigationAccessoryInfo)initWithUID:(id)a3 componentList:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_ACCNavigationAccessoryInfo;
  v9 = [(_ACCNavigationAccessoryInfo *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryUID, a3);
    componentList = v10->_componentList;
    v10->_componentList = 0;

    [(_ACCNavigationAccessoryInfo *)v10 assignComponentList:v8];
  }

  return v10;
}

- (void)dealloc
{
  accessoryUID = self->_accessoryUID;
  self->_accessoryUID = 0;

  componentList = self->_componentList;
  self->_componentList = 0;

  v5.receiver = self;
  v5.super_class = (Class)_ACCNavigationAccessoryInfo;
  [(_ACCNavigationAccessoryInfo *)&v5 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<_ACCNavigationAccessoryInfo>[%@; %lu components]",
           self->_accessoryUID,
           [(NSDictionary *)self->_componentList count]);
}

- (void)assignComponentList:(id)a3
{
  id v4 = a3;
  objc_super v5 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "objectForKey:", ACCNav_DispComp_ComponentID, (void)v15);
        if (v12)
        {
          id v13 = [v11 mutableCopy];
          [(NSDictionary *)v5 setObject:v13 forKey:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  componentList = self->_componentList;
  self->_componentList = v5;
}

- (void)setComponent:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 5;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    uint64_t v9 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    componentList = self->_componentList;
    int v13 = 138412802;
    id v14 = v6;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    __int16 v17 = 2112;
    long long v18 = componentList;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[#Navigation] _ACCNavigationAccessoryInfo: setComponent: %@ options: %llxh, comopnentList %@", (uint8_t *)&v13, 0x20u);
  }

  if (v6)
  {
    v10 = [(NSDictionary *)self->_componentList objectForKey:v6];
    v11 = +[NSNumber numberWithUnsignedLongLong:a4];
    [v10 setObject:v11 forKey:__kComponentOptionsKey];
  }
}

- (unint64_t)componentOptions:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = -[NSDictionary objectForKey:](self->_componentList, "objectForKey:");
  id v4 = [v3 objectForKey:__kComponentOptionsKey];
  id v5 = [v4 unsignedLongLongValue];

  return (unint64_t)v5;
}

- (void)setComponent:(id)a3 started:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 5;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    uint64_t v9 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    componentList = self->_componentList;
    int v13 = 138412802;
    id v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v4;
    __int16 v17 = 2112;
    long long v18 = componentList;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[#Navigation] _ACCNavigationAccessoryInfo: setComponent: %@ started: %d, comopnentList %@", (uint8_t *)&v13, 0x1Cu);
  }

  if (v6)
  {
    v10 = [(NSDictionary *)self->_componentList objectForKey:v6];
    v11 = +[NSNumber numberWithBool:v4];
    [v10 setObject:v11 forKey:__kComponentStartedKey];
  }
}

- (BOOL)componentStarted:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = -[NSDictionary objectForKey:](self->_componentList, "objectForKey:");
  BOOL v4 = [v3 objectForKey:__kComponentStartedKey];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (id)startedComponentList
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v4 = [(NSDictionary *)self->_componentList allValues];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 objectForKey:__kComponentStartedKey];
        if ([v10 BOOLValue]) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    v11 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v11 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    [(_ACCNavigationAccessoryInfo *)(uint64_t)v3 startedComponentList];
  }

  return v3;
}

- (id)componentIdList
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = [(NSDictionary *)self->_componentList allValues];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) objectForKey:ACCNav_DispComp_ComponentID];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    v10 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v10 = &_os_log_default;
    id v11 = &_os_log_default;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    [(_ACCNavigationAccessoryInfo *)(uint64_t)v3 componentIdList];
  }

  return v3;
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (void)setAccessoryUID:(id)a3
{
}

- (NSDictionary)componentList
{
  return self->_componentList;
}

- (void)setComponentList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentList, 0);

  objc_storeStrong((id *)&self->_accessoryUID, 0);
}

- (void)startedComponentList
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[#Navigation] _ACCNavigationAccessoryInfo: startedComponentList: %@", (uint8_t *)&v2, 0xCu);
}

- (void)componentIdList
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[#Navigation] _ACCNavigationAccessoryInfo: componentIdList: %@", (uint8_t *)&v2, 0xCu);
}

@end