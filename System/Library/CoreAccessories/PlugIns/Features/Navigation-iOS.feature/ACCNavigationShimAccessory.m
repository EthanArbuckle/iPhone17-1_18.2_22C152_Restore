@interface ACCNavigationShimAccessory
- (ACCNavigationAccessory)navigationAccessory;
- (ACCNavigationShimAccessory)init;
- (ACCiAP2ShimAccessory)iap2ShimAccessory;
- (OS_dispatch_queue)processingQueue;
- (id)create_xpc_representation;
- (id)description;
- (void)create_xpc_representation;
- (void)dealloc;
- (void)setIap2ShimAccessory:(id)a3;
- (void)setNavigationAccessory:(id)a3;
- (void)setProcessingQueue:(id)a3;
@end

@implementation ACCNavigationShimAccessory

- (ACCNavigationShimAccessory)init
{
  v9.receiver = self;
  v9.super_class = (Class)ACCNavigationShimAccessory;
  v2 = [(ACCNavigationShimAccessory *)&v9 init];
  v3 = v2;
  if (v2)
  {
    iap2ShimAccessory = v2->_iap2ShimAccessory;
    v2->_iap2ShimAccessory = 0;

    navigationAccessory = v3->_navigationAccessory;
    v3->_navigationAccessory = 0;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.accNavigation.NavigationProcessingQueue", 0);
    processingQueue = v3->_processingQueue;
    v3->_processingQueue = (OS_dispatch_queue *)v6;
  }
  return v3;
}

- (void)dealloc
{
  iap2ShimAccessory = self->_iap2ShimAccessory;
  self->_iap2ShimAccessory = 0;

  navigationAccessory = self->_navigationAccessory;
  self->_navigationAccessory = 0;

  processingQueue = self->_processingQueue;
  self->_processingQueue = 0;

  v6.receiver = self;
  v6.super_class = (Class)ACCNavigationShimAccessory;
  [(ACCNavigationShimAccessory *)&v6 dealloc];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<ACCNavigationShimAccessory>[iap2ShimAccessory=%@; navigationAccessory=%@]",
               self->_iap2ShimAccessory,
               self->_navigationAccessory);
}

- (id)create_xpc_representation
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ACCNavigationShimAccessory create_xpc_representation]();
  }

  uint64_t v6 = [(ACCiAP2ShimAccessory *)self->_iap2ShimAccessory connectionID];
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(xdict, "identifier", v6);
  xpc_object_t v7 = xpc_array_create(0, 0);
  v8 = [(ACCNavigationAccessory *)self->_navigationAccessory componentList];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [v8 allKeys];
  uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = objc_msgSend(v8, "objectForKey:", *(void *)(*((void *)&v19 + 1) + 8 * i), xdict);
        xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_BOOL(v14, "isEnabled", [v13 isEnabled]);
        xpc_dictionary_set_uint64(v14, "identifier", [v13 identifier]);
        id v15 = [v13 name];
        xpc_dictionary_set_string(v14, "name", (const char *)[v15 cStringUsingEncoding:4]);

        xpc_dictionary_set_uint64(v14, "maxLength_CurrentRoadName", objc_msgSend(v13, "maxLength_CurrentRoadName"));
        xpc_dictionary_set_uint64(v14, "maxLength_DestinationRoadName", objc_msgSend(v13, "maxLength_DestinationRoadName"));
        xpc_dictionary_set_uint64(v14, "maxLength_PostManeuverRoadName", objc_msgSend(v13, "maxLength_PostManeuverRoadName"));
        xpc_dictionary_set_uint64(v14, "maxLength_ManeuverDescription", objc_msgSend(v13, "maxLength_ManeuverDescription"));
        xpc_dictionary_set_uint64(v14, "maxCapacity_GuidanceManeuver", objc_msgSend(v13, "maxCapacity_GuidanceManeuver"));
        xpc_dictionary_set_uint64(v14, "maxLength_LaneGuidanceDescription", objc_msgSend(v13, "maxLength_LaneGuidanceDescription"));
        xpc_dictionary_set_uint64(v14, "maxCapacity_LaneGuidance", objc_msgSend(v13, "maxCapacity_LaneGuidance"));
        xpc_dictionary_set_uint64(v14, "requestSourceName", [v13 requestSourceName]);
        xpc_dictionary_set_uint64(v14, "requestSourceSupportsRouteGuidance", [v13 requestSourceSupportsRouteGuidance]);
        xpc_dictionary_set_uint64(v14, "supportsExitInfo", [v13 supportsExitInfo]);
        xpc_array_append_value(v7, v14);
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  xpc_dictionary_set_value(xdict, "components", v7);
  return xdict;
}

- (ACCiAP2ShimAccessory)iap2ShimAccessory
{
  return self->_iap2ShimAccessory;
}

- (void)setIap2ShimAccessory:(id)a3
{
}

- (ACCNavigationAccessory)navigationAccessory
{
  return self->_navigationAccessory;
}

- (void)setNavigationAccessory:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProcessingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_navigationAccessory, 0);
  objc_storeStrong((id *)&self->_iap2ShimAccessory, 0);
}

- (void)create_xpc_representation
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2216B2000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

@end