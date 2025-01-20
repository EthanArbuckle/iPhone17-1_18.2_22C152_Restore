@interface ACCNavigationAccessory
- (ACCNavigationAccessory)initWithAccessoryUID:(id)a3 provider:(id)a4;
- (ACCNavigationProvider)provider;
- (BOOL)componentIdListIsEnabled:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)objectDetectionComponentIdListIsEnabled:(id)a3;
- (BOOL)requestedSourceNameForAnyComponent;
- (BOOL)requestedSourceSupportsRouteGuidanceForAnyComponent;
- (BOOL)supportsExitInfoForAnyComponent;
- (BOOL)supportsLaneGuidanceForAnyComponent;
- (BOOL)supportsPreconditioningForAnyComponent;
- (BOOL)supportsTimeZoneOffsetForAnyComponent;
- (NSDictionary)componentList;
- (NSMutableDictionary)componentListInternal;
- (NSMutableDictionary)objectDetectionComponentListInternal;
- (NSString)accessoryUID;
- (id)componentListForIdList:(id)a3;
- (id)description;
- (id)objectDetectionComponentList;
- (id)objectDetectionComponentListForIdList:(id)a3;
- (unint64_t)hash;
- (void)iterateComponentIdList:(id)a3 block:(id)a4;
- (void)setAccessoryUID:(id)a3;
- (void)setComponentListInternal:(id)a3;
- (void)setObjectDetectionComponentListInternal:(id)a3;
- (void)updateLaneGuidanceInfo:(id)a3 componentList:(id)a4;
- (void)updateManeuverInfo:(id)a3 componentList:(id)a4;
- (void)updateRouteGuidanceInfo:(id)a3 componentList:(id)a4;
@end

@implementation ACCNavigationAccessory

- (ACCNavigationAccessory)initWithAccessoryUID:(id)a3 provider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ACCNavigationAccessory;
  v9 = [(ACCNavigationAccessory *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryUID, a3);
    objc_storeWeak((id *)&v10->_provider, v8);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    componentListInternal = v10->_componentListInternal;
    v10->_componentListInternal = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    objectDetectionComponentListInternal = v10->_objectDetectionComponentListInternal;
    v10->_objectDetectionComponentListInternal = v13;
  }
  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ACCNavigationAccessory - %@ components: count=%lu objectDetectionComponents: count=%lu>", self->_accessoryUID, -[NSMutableDictionary count](self->_componentListInternal, "count"), -[NSMutableDictionary count](self->_objectDetectionComponentListInternal, "count")];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    accessoryUID = self->_accessoryUID;
    v6 = [v4 accessoryUID];
    BOOL v7 = [(NSString *)accessoryUID isEqualToString:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_accessoryUID hash];
}

- (NSDictionary)componentList
{
  return (NSDictionary *)self->_componentListInternal;
}

- (id)objectDetectionComponentList
{
  return self->_objectDetectionComponentListInternal;
}

- (id)componentListForIdList:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_super v16 = v4;
  v6 = [MEMORY[0x263EFFA08] setWithArray:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v7 = [(NSMutableDictionary *)self->_componentListInternal allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v13 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v12, "identifier"));
        int v14 = [v6 containsObject:v13];

        if (v14) {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  if (![v5 count])
  {

    id v5 = 0;
  }

  return v5;
}

- (void)iterateComponentIdList:(id)a3 block:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *, unsigned char *))a4;
  char v26 = 0;
  if (v6)
  {
    long long v24 = 0uLL;
    long long v25 = 0uLL;
    long long v22 = 0uLL;
    long long v23 = 0uLL;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = [(NSMutableDictionary *)self->_componentListInternal objectForKey:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          v7[2](v7, v12, &v26);
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v9);
    }
  }
  else
  {
    long long v20 = 0uLL;
    long long v21 = 0uLL;
    long long v18 = 0uLL;
    long long v19 = 0uLL;
    v13 = [(NSMutableDictionary *)self->_componentListInternal allValues];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          v7[2](v7, *(void **)(*((void *)&v18 + 1) + 8 * j), &v26);
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v27 count:16];
      }
      while (v15);
    }
  }
}

- (BOOL)componentIdListIsEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__ACCNavigationAccessory_componentIdListIsEnabled___block_invoke;
  v6[3] = &unk_26478D038;
  v6[4] = &v7;
  [(ACCNavigationAccessory *)self iterateComponentIdList:v4 block:v6];
  LOBYTE(self) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

void __51__ACCNavigationAccessory_componentIdListIsEnabled___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    *a3 = 1;
    if (![v5 isEnabled]) {
      goto LABEL_6;
    }
    *a3 = 0;
  }
  else if (([v5 isEnabled] & 1) == 0)
  {
    goto LABEL_6;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
LABEL_6:
}

- (BOOL)requestedSourceSupportsRouteGuidanceForAnyComponent
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __77__ACCNavigationAccessory_requestedSourceSupportsRouteGuidanceForAnyComponent__block_invoke;
  v4[3] = &unk_26478D038;
  v4[4] = &v5;
  [(ACCNavigationAccessory *)self iterateComponentIdList:0 block:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __77__ACCNavigationAccessory_requestedSourceSupportsRouteGuidanceForAnyComponent__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    *a3 = 1;
    if (![v5 requestSourceSupportsRouteGuidance]) {
      goto LABEL_6;
    }
    *a3 = 0;
  }
  else if (([v5 requestSourceSupportsRouteGuidance] & 1) == 0)
  {
    goto LABEL_6;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
LABEL_6:
}

- (BOOL)requestedSourceNameForAnyComponent
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__ACCNavigationAccessory_requestedSourceNameForAnyComponent__block_invoke;
  v4[3] = &unk_26478D038;
  v4[4] = &v5;
  [(ACCNavigationAccessory *)self iterateComponentIdList:0 block:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __60__ACCNavigationAccessory_requestedSourceNameForAnyComponent__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    *a3 = 1;
    if (![v5 requestSourceName]) {
      goto LABEL_6;
    }
    *a3 = 0;
  }
  else if (([v5 requestSourceName] & 1) == 0)
  {
    goto LABEL_6;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
LABEL_6:
}

- (BOOL)supportsExitInfoForAnyComponent
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__ACCNavigationAccessory_supportsExitInfoForAnyComponent__block_invoke;
  v4[3] = &unk_26478D038;
  v4[4] = &v5;
  [(ACCNavigationAccessory *)self iterateComponentIdList:0 block:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __57__ACCNavigationAccessory_supportsExitInfoForAnyComponent__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    *a3 = 1;
    if (![v5 supportsExitInfo]) {
      goto LABEL_6;
    }
    *a3 = 0;
  }
  else if (([v5 supportsExitInfo] & 1) == 0)
  {
    goto LABEL_6;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
LABEL_6:
}

- (BOOL)supportsLaneGuidanceForAnyComponent
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__ACCNavigationAccessory_supportsLaneGuidanceForAnyComponent__block_invoke;
  v4[3] = &unk_26478D038;
  v4[4] = &v5;
  [(ACCNavigationAccessory *)self iterateComponentIdList:0 block:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __61__ACCNavigationAccessory_supportsLaneGuidanceForAnyComponent__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    *a3 = 1;
    if (![v5 supportsLaneGuidance]) {
      goto LABEL_6;
    }
    *a3 = 0;
  }
  else if (([v5 supportsLaneGuidance] & 1) == 0)
  {
    goto LABEL_6;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
LABEL_6:
}

- (BOOL)supportsTimeZoneOffsetForAnyComponent
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__ACCNavigationAccessory_supportsTimeZoneOffsetForAnyComponent__block_invoke;
  v4[3] = &unk_26478D038;
  v4[4] = &v5;
  [(ACCNavigationAccessory *)self iterateComponentIdList:0 block:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __63__ACCNavigationAccessory_supportsTimeZoneOffsetForAnyComponent__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    *a3 = 1;
    if (![v5 supportsTimeZoneOffset]) {
      goto LABEL_6;
    }
    *a3 = 0;
  }
  else if (([v5 supportsTimeZoneOffset] & 1) == 0)
  {
    goto LABEL_6;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
LABEL_6:
}

- (BOOL)supportsPreconditioningForAnyComponent
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__ACCNavigationAccessory_supportsPreconditioningForAnyComponent__block_invoke;
  v4[3] = &unk_26478D038;
  v4[4] = &v5;
  [(ACCNavigationAccessory *)self iterateComponentIdList:0 block:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __64__ACCNavigationAccessory_supportsPreconditioningForAnyComponent__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    *a3 = 1;
    if (![v5 supportsPreconditioning]) {
      goto LABEL_6;
    }
    *a3 = 0;
  }
  else if (([v5 supportsPreconditioning] & 1) == 0)
  {
    goto LABEL_6;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
LABEL_6:
}

- (void)updateRouteGuidanceInfo:(id)a3 componentList:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "identifier", (void)v16));
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v8 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  [WeakRetained routeGuidance:self updateInfo:v6 componentIdList:v8];
}

- (void)updateManeuverInfo:(id)a3 componentList:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "identifier", (void)v16));
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v8 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  [WeakRetained routeGuidance:self maneuverUpdateInfo:v6 componentIdList:v8];
}

- (void)updateLaneGuidanceInfo:(id)a3 componentList:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "identifier", (void)v16));
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v8 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  [WeakRetained routeGuidance:self laneGuidanceInfo:v6 componentIdList:v8];
}

- (id)objectDetectionComponentListForIdList:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v20 = v4;
  if (v4)
  {
    id v6 = [MEMORY[0x263EFFA08] setWithArray:v4];
  }
  else
  {
    id v6 = 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [(NSMutableDictionary *)self->_objectDetectionComponentListInternal allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (v6)
        {
          v13 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "identifier"));
          int v14 = [v6 containsObject:v13];

          if (!v14) {
            continue;
          }
        }
        [v5 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v9);
  }

  if (![v5 count])
  {

    id v5 = 0;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v15 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationAccessory objectDetectionComponentListForIdList:]();
    }
    uint64_t v15 = &_os_log_internal;
    id v16 = &_os_log_internal;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = *(void *)(v19 + 16);
    *(_DWORD *)buf = 138412802;
    uint64_t v26 = v18;
    __int16 v27 = 2112;
    v28 = v20;
    __int16 v29 = 2112;
    id v30 = v5;
    _os_log_debug_impl(&dword_22605D000, v15, OS_LOG_TYPE_DEBUG, "[#Navigation] NavigationAccessory objectDetectionComponentListForIdList: accessoryUID %@, componentIdList %@, componentList %@", buf, 0x20u);
  }

  return v5;
}

- (BOOL)objectDetectionComponentIdListIsEnabled:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  obuint64_t j = v4;
  if (v4)
  {
    id v5 = v4;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v43 objects:v54 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      char v8 = 0;
      uint64_t v9 = *(void *)v44;
      uint64_t v10 = &_os_log_internal;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v44 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = [(NSMutableDictionary *)self->_objectDetectionComponentListInternal objectForKey:*(void *)(*((void *)&v43 + 1) + 8 * i)];
          uint64_t v13 = gLogObjects;
          int v14 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v15 = gNumLogObjects < 1;
          }
          else {
            BOOL v15 = 1;
          }
          if (v15)
          {
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v48 = v13;
              __int16 v49 = 1024;
              LODWORD(v50) = v14;
              _os_log_error_impl(&dword_22605D000, v10, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v16 = v10;
            long long v17 = v10;
          }
          else
          {
            long long v17 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            accessoryUID = self->_accessoryUID;
            *(_DWORD *)buf = 138412546;
            uint64_t v48 = (uint64_t)accessoryUID;
            __int16 v49 = 2112;
            v50 = v12;
            _os_log_debug_impl(&dword_22605D000, v17, OS_LOG_TYPE_DEBUG, "[#Navigation] NavigationAccessory objectDetectionComponentIdListIsEnabled: accessoryUID %@, select components, component %@", buf, 0x16u);
          }

          if ([v12 isEnabled]) {
            char v8 = 1;
          }
        }
        id v5 = obj;
        uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
      }
      while (v7);
      LOBYTE(v19) = v8 & 1;
    }
    else
    {
      LOBYTE(v19) = 0;
    }
  }
  else
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v37 = [(NSMutableDictionary *)self->_objectDetectionComponentListInternal allValues];
    uint64_t v20 = [v37 countByEnumeratingWithState:&v39 objects:v53 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      int v19 = 0;
      uint64_t v22 = *(void *)v40;
      long long v23 = &_os_log_internal;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v37);
          }
          long long v25 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          uint64_t v26 = gLogObjects;
          int v27 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v28 = gNumLogObjects < 1;
          }
          else {
            BOOL v28 = 1;
          }
          if (v28)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v48 = v26;
              __int16 v49 = 1024;
              LODWORD(v50) = v27;
              _os_log_error_impl(&dword_22605D000, v23, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            __int16 v29 = v23;
            id v30 = v23;
          }
          else
          {
            id v30 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            v31 = self->_accessoryUID;
            *(_DWORD *)buf = 138412546;
            uint64_t v48 = (uint64_t)v31;
            __int16 v49 = 2112;
            v50 = v25;
            _os_log_debug_impl(&dword_22605D000, v30, OS_LOG_TYPE_DEBUG, "[#Navigation] NavigationAccessory objectDetectionComponentIdListIsEnabled: accessoryUID %@, all components, component %@", buf, 0x16u);
          }

          v19 |= [v25 isEnabled];
        }
        uint64_t v21 = [v37 countByEnumeratingWithState:&v39 objects:v53 count:16];
      }
      while (v21);
    }
    else
    {
      LOBYTE(v19) = 0;
    }

    id v5 = 0;
  }
  if (gLogObjects) {
    BOOL v32 = gNumLogObjects < 1;
  }
  else {
    BOOL v32 = 1;
  }
  if (v32)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationAccessory objectDetectionComponentListForIdList:]();
    }
    v34 = &_os_log_internal;
    id v33 = &_os_log_internal;
  }
  else
  {
    v34 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    v36 = self->_accessoryUID;
    *(_DWORD *)buf = 138412802;
    uint64_t v48 = (uint64_t)v36;
    __int16 v49 = 2112;
    v50 = v5;
    __int16 v51 = 1024;
    int v52 = v19 & 1;
    _os_log_debug_impl(&dword_22605D000, v34, OS_LOG_TYPE_DEBUG, "[#Navigation] Navigation objectDetectionComponentIdListIsEnabled: accessoryUID %@, componentIDList %@, isEnabled=%d", buf, 0x1Cu);
  }

  return v19 & 1;
}

- (ACCNavigationProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (ACCNavigationProvider *)WeakRetained;
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (void)setAccessoryUID:(id)a3
{
}

- (NSMutableDictionary)componentListInternal
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setComponentListInternal:(id)a3
{
}

- (NSMutableDictionary)objectDetectionComponentListInternal
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObjectDetectionComponentListInternal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectDetectionComponentListInternal, 0);
  objc_storeStrong((id *)&self->_componentListInternal, 0);
  objc_storeStrong((id *)&self->_accessoryUID, 0);
  objc_destroyWeak((id *)&self->_provider);
}

- (void)objectDetectionComponentListForIdList:.cold.1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22605D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v0, 0x12u);
}

@end