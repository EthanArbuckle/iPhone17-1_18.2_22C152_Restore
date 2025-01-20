@interface ACCTransportPlugin
- (ACCTransportPlugin)initWithDelegate:(id)a3;
- (ACCTransportPluginManagerProtocol)delegate;
- (BOOL)connectedThroughAdapter:(id)a3;
- (BOOL)destroyConnectionWithUUID:(id)a3;
- (BOOL)destroyEndpointWithUUID:(id)a3;
- (BOOL)processIncomingData:(id)a3 forEndpointWithUUID:(id)a4;
- (BOOL)publishConnectionWithUUID:(id)a3;
- (BOOL)routeOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5;
- (BOOL)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5;
- (BOOL)setAccessoryInfo:(id)a3 forEndpointWithUUID:(id)a4;
- (BOOL)setAuthenticationStatus:(int)a3 andCertificateData:(id)a4 authCTA:(BOOL)a5 forConnectionWithUUID:(id)a6;
- (BOOL)setProperties:(id)a3 forConnectionWithUUID:(id)a4;
- (BOOL)setProperties:(id)a3 forEndpointWithUUID:(id)a4;
- (BOOL)setSupervisedTransportsRestricted:(BOOL)a3 forConnectionWithUUID:(id)a4;
- (NSMutableDictionary)connectionPropertyChangeHandlers;
- (NSMutableDictionary)endpointPropertyChangeHandlers;
- (NSMutableSet)activeConnectionUUIDs;
- (NSString)pluginClassAndName;
- (NSString)pluginName;
- (id)allConnectionUUIDs;
- (id)allEndpointsUUIDs;
- (id)certificateCapabilitiesForConnectionWithUUID:(id)a3;
- (id)certificateDataForConnectionWithUUID:(id)a3;
- (id)certificateSerialForConnectionWithUUID:(id)a3;
- (id)certificateSerialStringForConnectionWithUUID:(id)a3;
- (id)connectionUUIDForEndpointWithUUID:(id)a3;
- (id)createConnectionWithType:(int)a3 andIdentifier:(id)a4;
- (id)createEndpointWithTransportType:(int)a3 andProtocol:(int)a4 andIdentifier:(id)a5 forConnectionWithUUID:(id)a6 publishConnection:(BOOL)a7;
- (id)endpointUUIDsForConnectionWithUUID:(id)a3;
- (id)identifierForConnectionWithUUID:(id)a3;
- (id)identifierForEndpointWithUUID:(id)a3;
- (id)propertiesForConnectionWithUUID:(id)a3;
- (id)propertiesForEndpointWithUUID:(id)a3;
- (int)authStatusForConnectionWithUUID:(id)a3 authType:(int)a4;
- (int)connectionTypeForConnectionWithUUID:(id)a3;
- (int)protocolForEndpointWithUUID:(id)a3;
- (int)transportTypeForEndpointWithUUID:(id)a3;
- (void)authStatusDidChangeHandler:(id)a3;
- (void)connectionPropertiesDidChangeHandler:(id)a3;
- (void)dealloc;
- (void)endpointPropertiesDidChangeHandler:(id)a3;
- (void)initPlugin;
- (void)setActiveConnectionUUIDs:(id)a3;
- (void)setConnectionPropertyChangeHandlers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndpointPropertyChangeHandlers:(id)a3;
- (void)setHandler:(id)a3 forConnectionProperty:(id)a4;
- (void)setHandler:(id)a3 forEndpointProperty:(id)a4;
- (void)startPlugin;
- (void)startSafeConnectionTransaction;
- (void)stopPlugin;
- (void)stopSafeConnectionTransaction;
@end

@implementation ACCTransportPlugin

- (ACCTransportPlugin)initWithDelegate:(id)a3
{
  id v4 = a3;
  init_logging();
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 2;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    v7 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPlugin initWithDelegate:](self);
  }

  v17.receiver = self;
  v17.super_class = (Class)ACCTransportPlugin;
  v8 = [(ACCTransportPlugin *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v4);
    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    activeConnectionUUIDs = v9->_activeConnectionUUIDs;
    v9->_activeConnectionUUIDs = (NSMutableSet *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    connectionPropertyChangeHandlers = v9->_connectionPropertyChangeHandlers;
    v9->_connectionPropertyChangeHandlers = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    endpointPropertyChangeHandlers = v9->_endpointPropertyChangeHandlers;
    v9->_endpointPropertyChangeHandlers = v14;
  }
  return v9;
}

- (void)dealloc
{
  v1 = [a1 pluginClassAndName];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1B3C21000, v2, v3, "Dealloc %@", v4, v5, v6, v7, v8);
}

- (NSString)pluginClassAndName
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(ACCTransportPlugin *)self pluginName];
  uint64_t v7 = [v3 stringWithFormat:@"%@ (%@)", v5, v6];

  return (NSString *)v7;
}

- (void)initPlugin
{
  v1 = [a1 pluginClassAndName];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1B3C21000, v2, v3, "initPlugin for %@", v4, v5, v6, v7, v8);
}

- (void)startPlugin
{
  v1 = [a1 pluginClassAndName];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1B3C21000, v2, v3, "startPlugin for %@", v4, v5, v6, v7, v8);
}

- (void)stopPlugin
{
  v1 = [a1 pluginClassAndName];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1B3C21000, v2, v3, "stopPlugin for %@", v4, v5, v6, v7, v8);
}

- (void)authStatusDidChangeHandler:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 2;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPlugin authStatusDidChangeHandler:](self);
  }

  if ([(ACCTransportPlugin *)self conformsToProtocol:&unk_1F0C7AFC0]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint8_t v8 = [v4 userInfo];
    v9 = [v8 objectForKey:@"ACCTransportPlugin_AuthStatusDidChangeNotification_ConnectionUUID"];

    uint64_t v10 = [v4 userInfo];
    v11 = [v10 objectForKey:@"ACCTransportPlugin_AuthStatusDidChangeNotification_AuthStatusOld"];
    uint64_t v12 = [v11 intValue];

    v13 = [v4 userInfo];
    v14 = [v13 objectForKey:@"ACCTransportPlugin_AuthStatusDidChangeNotification_AuthStatusNew"];
    uint64_t v15 = [v14 intValue];

    v16 = [v4 userInfo];
    objc_super v17 = [v16 objectForKey:@"ACCTransportPlugin_AuthStatusDidChangeNotification_AuthType"];
    uint64_t v18 = [v17 intValue];

    v19 = [v4 userInfo];
    v20 = [v19 objectForKey:@"ACCTransportPlugin_AuthStatusDidChangeNotification_ConnectionIsAuthenticated"];
    uint64_t v21 = [v20 BOOLValue];

    v22 = [v4 userInfo];
    v23 = [v22 objectForKey:@"ACCTransportPlugin_AuthStatusDidChangeNotification_ConnectionWasAuthenticated"];
    uint64_t v24 = [v23 BOOLValue];

    [(ACCTransportPlugin *)self authStatusDidChange:v15 forConnectionWithUUID:v9 previousAuthStatus:v12 authType:v18 connectionIsAuthenticated:v21 connectionWasAuthenticated:v24];
  }
}

- (void)connectionPropertiesDidChangeHandler:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 2;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPlugin authStatusDidChangeHandler:](self);
  }

  uint8_t v8 = [v4 userInfo];
  uint64_t v9 = [v8 objectForKey:@"ACCTransportPlugin_PropertiesDidChangeNotification_ConnectionUUID"];

  uint64_t v10 = [(ACCTransportPlugin *)self activeConnectionUUIDs];
  v36 = (void *)v9;
  LODWORD(v9) = [v10 containsObject:v9];

  if (v9)
  {
    v11 = [v4 userInfo];
    uint64_t v12 = [v11 objectForKey:@"ACCTransportPlugin_PropertiesDidChangeNotification_PropertiesOld"];

    id v34 = v4;
    v13 = [v4 userInfo];
    v14 = [v13 objectForKey:@"ACCTransportPlugin_PropertiesDidChangeNotification_PropertiesNew"];

    if ([(ACCTransportPlugin *)self conformsToProtocol:&unk_1F0C7AFC0]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [(ACCTransportPlugin *)self propertiesDidChange:v14 forConnectionWithUUID:v36 previousProperties:v12];
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v37 = self;
    uint64_t v15 = [(ACCTransportPlugin *)self connectionPropertyChangeHandlers];
    v16 = [v15 allKeys];

    id obj = v16;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v40;
      do
      {
        uint64_t v20 = 0;
        uint64_t v35 = v18;
        do
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8 * v20);
          v22 = [v14 objectForKey:v21];
          v23 = [v12 objectForKey:v21];
          if ((isNSObjectEqual((unint64_t)v22, (uint64_t)v23) & 1) == 0)
          {
            uint64_t v24 = gLogObjects;
            int v25 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 2)
            {
              v26 = *(id *)(gLogObjects + 8);
            }
            else
            {
              uint64_t v27 = v19;
              v28 = v14;
              v29 = v12;
              v30 = MEMORY[0x1E4F14500];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v44 = v24;
                __int16 v45 = 1024;
                LODWORD(v46) = v25;
                _os_log_error_impl(&dword_1B3C21000, v30, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v31 = v30;
              v26 = v30;
              uint64_t v12 = v29;
              v14 = v28;
              uint64_t v19 = v27;
              uint64_t v18 = v35;
            }
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v44 = v21;
              __int16 v45 = 2112;
              v46 = v22;
              __int16 v47 = 2112;
              v48 = v23;
              _os_log_debug_impl(&dword_1B3C21000, v26, OS_LOG_TYPE_DEBUG, "Calling connection property did change handler for property: %@ (newValue: %@, oldValue: %@)", buf, 0x20u);
            }

            v32 = [(ACCTransportPlugin *)v37 connectionPropertyChangeHandlers];
            v33 = [v32 objectForKey:v21];

            if (v33) {
              ((void (**)(void, void *, uint64_t, void *, void *))v33)[2](v33, v36, v21, v22, v23);
            }
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
      }
      while (v18);
    }

    id v4 = v34;
  }
}

- (void)endpointPropertiesDidChangeHandler:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 2;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPlugin authStatusDidChangeHandler:](self);
  }

  uint8_t v8 = [v4 userInfo];
  uint64_t v9 = [v8 objectForKey:@"ACCTransportPlugin_PropertiesDidChangeNotification_ConnectionUUID"];

  uint64_t v10 = [(ACCTransportPlugin *)self activeConnectionUUIDs];
  uint64_t v35 = (void *)v9;
  LODWORD(v9) = [v10 containsObject:v9];

  if (v9)
  {
    v11 = [v4 userInfo];
    id v34 = [v11 objectForKey:@"ACCTransportPlugin_EndpointPropertiesDidChangeNotification_EndpointUUID"];

    uint64_t v12 = [v4 userInfo];
    v13 = [v12 objectForKey:@"ACCTransportPlugin_PropertiesDidChangeNotification_PropertiesOld"];

    id v32 = v4;
    v14 = [v4 userInfo];
    uint64_t v33 = [v14 objectForKey:@"ACCTransportPlugin_PropertiesDidChangeNotification_PropertiesNew"];

    if ([(ACCTransportPlugin *)self conformsToProtocol:&unk_1F0C7AFC0]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [(ACCTransportPlugin *)self propertiesDidChange:v33 forEndpointWithUUID:v34 previousProperties:v13 connectionUUID:v35];
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v36 = self;
    uint64_t v15 = [(ACCTransportPlugin *)self endpointPropertyChangeHandlers];
    v16 = [v15 allKeys];

    id obj = v16;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v49 count:16];
    uint64_t v18 = (void *)v33;
    if (v17)
    {
      uint64_t v19 = v17;
      uint64_t v20 = *(void *)v40;
      uint64_t v21 = MEMORY[0x1E4F14500];
      do
      {
        uint64_t v22 = 0;
        uint64_t v37 = v19;
        do
        {
          if (*(void *)v40 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v39 + 1) + 8 * v22);
          uint64_t v24 = [v18 objectForKey:v23];
          int v25 = [v13 objectForKey:v23];
          if ((isNSObjectEqual((unint64_t)v24, (uint64_t)v25) & 1) == 0)
          {
            uint64_t v26 = gLogObjects;
            int v27 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 2)
            {
              v28 = *(id *)(gLogObjects + 8);
            }
            else
            {
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v44 = v26;
                __int16 v45 = 1024;
                LODWORD(v46) = v27;
                _os_log_error_impl(&dword_1B3C21000, v21, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v29 = v21;
              v28 = v21;
              uint64_t v18 = (void *)v33;
            }
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v44 = v23;
              __int16 v45 = 2112;
              v46 = v24;
              __int16 v47 = 2112;
              v48 = v25;
              _os_log_debug_impl(&dword_1B3C21000, v28, OS_LOG_TYPE_DEBUG, "Calling endpoint property did change handler for property: %@ (newValue: %@, oldValue: %@)", buf, 0x20u);
            }

            v30 = [(ACCTransportPlugin *)v36 endpointPropertyChangeHandlers];
            v31 = [v30 objectForKey:v23];

            if (v31) {
              ((void (**)(void, void *, uint64_t, void *, void *, void *))v31)[2](v31, v34, v23, v24, v25, v35);
            }

            uint64_t v19 = v37;
          }

          ++v22;
        }
        while (v19 != v22);
        uint64_t v19 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
      }
      while (v19);
    }

    id v4 = v32;
  }
}

- (id)createConnectionWithType:(int)a3 andIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = [(ACCTransportPlugin *)self delegate];
  if (v7
    && (uint8_t v8 = (void *)v7,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    v11 = [(ACCTransportPlugin *)self delegate];
    uint64_t v12 = [v11 createConnectionWithType:v4 andIdentifier:v6];

    if (v12)
    {
      v13 = [(ACCTransportPlugin *)self activeConnectionUUIDs];
      [v13 addObject:v12];
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)setSupervisedTransportsRestricted:(BOOL)a3 forConnectionWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(ACCTransportPlugin *)self delegate];
  if (v7
    && (uint8_t v8 = (void *)v7,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    v11 = [(ACCTransportPlugin *)self delegate];
    char v12 = [v11 setSupervisedTransportsRestricted:v4 forConnectionWithUUID:v6];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)setProperties:(id)a3 forConnectionWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ACCTransportPlugin *)self delegate];
  if (v8
    && (uint64_t v9 = (void *)v8,
        [(ACCTransportPlugin *)self delegate],
        char v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    char v12 = [(ACCTransportPlugin *)self delegate];
    char v13 = [v12 setProperties:v6 forConnectionWithUUID:v7];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)setAuthenticationStatus:(int)a3 andCertificateData:(id)a4 authCTA:(BOOL)a5 forConnectionWithUUID:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [(ACCTransportPlugin *)self delegate];
  if (v12
    && (char v13 = (void *)v12,
        [(ACCTransportPlugin *)self delegate],
        v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = objc_opt_respondsToSelector(),
        v14,
        v13,
        (v15 & 1) != 0))
  {
    v16 = [(ACCTransportPlugin *)self delegate];
    char v17 = [v16 setAuthenticationStatus:v8 andCertificateData:v10 authCTA:v7 forConnectionWithUUID:v11];
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (id)createEndpointWithTransportType:(int)a3 andProtocol:(int)a4 andIdentifier:(id)a5 forConnectionWithUUID:(id)a6 publishConnection:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(ACCTransportPlugin *)self delegate];
  if (v14
    && (char v15 = (void *)v14,
        [(ACCTransportPlugin *)self delegate],
        v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = objc_opt_respondsToSelector(),
        v16,
        v15,
        (v17 & 1) != 0))
  {
    uint64_t v18 = [(ACCTransportPlugin *)self delegate];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __120__ACCTransportPlugin_createEndpointWithTransportType_andProtocol_andIdentifier_forConnectionWithUUID_publishConnection___block_invoke;
    v21[3] = &unk_1E6072F00;
    v21[4] = self;
    uint64_t v19 = [v18 createEndpointWithTransportType:v10 andProtocol:v9 andIdentifier:v12 dataOutHandler:v21 forConnectionWithUUID:v13];

    if (v19 && v7) {
      [(ACCTransportPlugin *)self publishConnectionWithUUID:v13];
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

uint64_t __120__ACCTransportPlugin_createEndpointWithTransportType_andProtocol_andIdentifier_forConnectionWithUUID_publishConnection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) routeOutgoingData:a4 forEndpointWithUUID:a3 connectionUUID:a2];
}

- (BOOL)setAccessoryInfo:(id)a3 forEndpointWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ACCTransportPlugin *)self delegate];
  if (v8
    && (uint64_t v9 = (void *)v8,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    id v12 = [(ACCTransportPlugin *)self delegate];
    char v13 = [v12 setAccessoryInfo:v6 forEndpointWithUUID:v7];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)setProperties:(id)a3 forEndpointWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ACCTransportPlugin *)self delegate];
  if (v8
    && (uint64_t v9 = (void *)v8,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    id v12 = [(ACCTransportPlugin *)self delegate];
    char v13 = [v12 setProperties:v6 forEndpointWithUUID:v7];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)publishConnectionWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCTransportPlugin *)self delegate];
  if (v5
    && (id v6 = (void *)v5,
        [(ACCTransportPlugin *)self delegate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    uint64_t v9 = [(ACCTransportPlugin *)self delegate];
    char v10 = [v9 publishConnectionWithUUID:v4];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)destroyEndpointWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCTransportPlugin *)self delegate];
  if (v5
    && (id v6 = (void *)v5,
        [(ACCTransportPlugin *)self delegate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    uint64_t v9 = [(ACCTransportPlugin *)self delegate];
    char v10 = [v9 destroyEndpointWithUUID:v4];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)destroyConnectionWithUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(ACCTransportPlugin *)self activeConnectionUUIDs];
    [v5 removeObject:v4];
  }
  uint64_t v6 = [(ACCTransportPlugin *)self delegate];
  if (v6
    && (id v7 = (void *)v6,
        [(ACCTransportPlugin *)self delegate],
        char v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    char v10 = [(ACCTransportPlugin *)self delegate];
    char v11 = [v10 destroyConnectionWithUUID:v4];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)startSafeConnectionTransaction
{
  uint64_t v3 = [(ACCTransportPlugin *)self delegate];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [(ACCTransportPlugin *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(ACCTransportPlugin *)self delegate];
      [v7 startSafeConnectionTransaction];
    }
  }
}

- (void)stopSafeConnectionTransaction
{
  uint64_t v3 = [(ACCTransportPlugin *)self delegate];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [(ACCTransportPlugin *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(ACCTransportPlugin *)self delegate];
      [v7 stopSafeConnectionTransaction];
    }
  }
}

- (id)allConnectionUUIDs
{
  uint64_t v3 = [(ACCTransportPlugin *)self delegate];
  if (v3
    && (id v4 = (void *)v3,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    id v7 = [(ACCTransportPlugin *)self delegate];
    char v8 = [v7 allConnectionUUIDs];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)allEndpointsUUIDs
{
  uint64_t v3 = [(ACCTransportPlugin *)self delegate];
  if (v3
    && (id v4 = (void *)v3,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    id v7 = [(ACCTransportPlugin *)self delegate];
    char v8 = [v7 allEndpointsUUIDs];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)connectionUUIDForEndpointWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCTransportPlugin *)self delegate];
  if (v5
    && (char v6 = (void *)v5,
        [(ACCTransportPlugin *)self delegate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    char v9 = [(ACCTransportPlugin *)self delegate];
    char v10 = [v9 connectionUUIDForEndpointWithUUID:v4];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)endpointUUIDsForConnectionWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCTransportPlugin *)self delegate];
  if (v5
    && (char v6 = (void *)v5,
        [(ACCTransportPlugin *)self delegate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    char v9 = [(ACCTransportPlugin *)self delegate];
    char v10 = [v9 endpointUUIDsForConnectionWithUUID:v4];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (int)authStatusForConnectionWithUUID:(id)a3 authType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = [(ACCTransportPlugin *)self delegate];
  if (v7
    && (char v8 = (void *)v7,
        [(ACCTransportPlugin *)self delegate],
        char v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    char v11 = [(ACCTransportPlugin *)self delegate];
    int v12 = [v11 authStatusForConnectionWithUUID:v6 authType:v4];
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (int)connectionTypeForConnectionWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCTransportPlugin *)self delegate];
  if (v5
    && (id v6 = (void *)v5,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    char v9 = [(ACCTransportPlugin *)self delegate];
    int v10 = [v9 connectionTypeForConnectionWithUUID:v4];
  }
  else
  {
    int v10 = 11;
  }

  return v10;
}

- (id)certificateDataForConnectionWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCTransportPlugin *)self delegate];
  if (v5
    && (id v6 = (void *)v5,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    char v9 = [(ACCTransportPlugin *)self delegate];
    int v10 = [v9 certificateDataForConnectionWithUUID:v4];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (id)certificateSerialForConnectionWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCTransportPlugin *)self delegate];
  if (v5
    && (id v6 = (void *)v5,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    char v9 = [(ACCTransportPlugin *)self delegate];
    int v10 = [v9 certificateSerialForConnectionWithUUID:v4];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (id)certificateSerialStringForConnectionWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCTransportPlugin *)self delegate];
  if (v5
    && (id v6 = (void *)v5,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    char v9 = [(ACCTransportPlugin *)self delegate];
    int v10 = [v9 certificateSerialStringForConnectionWithUUID:v4];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (id)certificateCapabilitiesForConnectionWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCTransportPlugin *)self delegate];
  if (v5
    && (id v6 = (void *)v5,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    char v9 = [(ACCTransportPlugin *)self delegate];
    int v10 = [v9 certificateCapabilitiesForConnectionWithUUID:v4];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (int)transportTypeForEndpointWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCTransportPlugin *)self delegate];
  if (v5
    && (id v6 = (void *)v5,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    char v9 = [(ACCTransportPlugin *)self delegate];
    int v10 = [v9 transportTypeForEndpointWithUUID:v4];
  }
  else
  {
    int v10 = 17;
  }

  return v10;
}

- (int)protocolForEndpointWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCTransportPlugin *)self delegate];
  if (v5
    && (id v6 = (void *)v5,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    char v9 = [(ACCTransportPlugin *)self delegate];
    int v10 = [v9 protocolForEndpointWithUUID:v4];
  }
  else
  {
    int v10 = 18;
  }

  return v10;
}

- (id)identifierForConnectionWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCTransportPlugin *)self delegate];
  if (v5
    && (id v6 = (void *)v5,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    char v9 = [(ACCTransportPlugin *)self delegate];
    int v10 = [v9 identifierForConnectionWithUUID:v4];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (id)identifierForEndpointWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCTransportPlugin *)self delegate];
  if (v5
    && (id v6 = (void *)v5,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    char v9 = [(ACCTransportPlugin *)self delegate];
    int v10 = [v9 identifierForEndpointWithUUID:v4];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (id)propertiesForConnectionWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCTransportPlugin *)self delegate];
  if (v5
    && (id v6 = (void *)v5,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    char v9 = [(ACCTransportPlugin *)self delegate];
    int v10 = [v9 propertiesForConnectionWithUUID:v4];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (id)propertiesForEndpointWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCTransportPlugin *)self delegate];
  if (v5
    && (id v6 = (void *)v5,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    char v9 = [(ACCTransportPlugin *)self delegate];
    int v10 = [v9 propertiesForEndpointWithUUID:v4];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (void)setHandler:(id)a3 forConnectionProperty:(id)a4
{
  id aBlock = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [(ACCTransportPlugin *)self connectionPropertyChangeHandlers];
    if (aBlock)
    {
      char v8 = _Block_copy(aBlock);
      [v7 setObject:v8 forKey:v6];
    }
    else
    {
      [v7 removeObjectForKey:v6];
    }
  }
}

- (void)setHandler:(id)a3 forEndpointProperty:(id)a4
{
  id aBlock = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [(ACCTransportPlugin *)self endpointPropertyChangeHandlers];
    if (aBlock)
    {
      char v8 = _Block_copy(aBlock);
      [v7 setObject:v8 forKey:v6];
    }
    else
    {
      [v7 removeObjectForKey:v6];
    }
  }
}

- (BOOL)connectedThroughAdapter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCTransportPlugin *)self delegate];
  if (v5
    && (id v6 = (void *)v5,
        [(ACCTransportPlugin *)self delegate],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    char v9 = [(ACCTransportPlugin *)self delegate];
    char v10 = [v9 connectedThroughAdapter:v4];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)processIncomingData:(id)a3 forEndpointWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v8 = [(ACCTransportPlugin *)self delegate];
  if (!v8) {
    goto LABEL_5;
  }
  char v9 = (void *)v8;
  char v10 = [(ACCTransportPlugin *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    int v12 = [(ACCTransportPlugin *)self delegate];
    char v13 = [v12 processIncomingData:v6 forEndpointWithUUID:v7];
  }
  else
  {
LABEL_5:
    char v13 = 0;
  }

  return v13;
}

- (BOOL)routeOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(ACCTransportPlugin *)self conformsToProtocol:&unk_1F0C7AFC0]
     && (objc_opt_respondsToSelector() & 1) != 0
     && [(ACCTransportPlugin *)self sendOutgoingData:v8 forEndpointWithUUID:v9 connectionUUID:v10];

  return v11;
}

- (BOOL)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 2;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    char v13 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  else
  {
    char v13 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[ACCTransportPlugin sendOutgoingData:forEndpointWithUUID:connectionUUID:]((uint64_t)self, v13);
  }

  return 0;
}

- (ACCTransportPluginManagerProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ACCTransportPluginManagerProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)activeConnectionUUIDs
{
  return self->_activeConnectionUUIDs;
}

- (void)setActiveConnectionUUIDs:(id)a3
{
}

- (NSString)pluginName
{
  return self->_pluginName;
}

- (NSMutableDictionary)connectionPropertyChangeHandlers
{
  return self->_connectionPropertyChangeHandlers;
}

- (void)setConnectionPropertyChangeHandlers:(id)a3
{
}

- (NSMutableDictionary)endpointPropertyChangeHandlers
{
  return self->_endpointPropertyChangeHandlers;
}

- (void)setEndpointPropertyChangeHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointPropertyChangeHandlers, 0);
  objc_storeStrong((id *)&self->_connectionPropertyChangeHandlers, 0);
  objc_storeStrong((id *)&self->_pluginName, 0);
  objc_storeStrong((id *)&self->_activeConnectionUUIDs, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 pluginClassAndName];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1B3C21000, v2, v3, "Init %@", v4, v5, v6, v7, v8);
}

- (void)initWithDelegate:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1B3C21000, MEMORY[0x1E4F14500], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

- (void)authStatusDidChangeHandler:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 pluginClassAndName];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1B3C21000, v2, v3, "Notification received for %@:\n%@", v4, v5, v6, v7, v8);
}

- (void)sendOutgoingData:(uint64_t)a1 forEndpointWithUUID:(NSObject *)a2 connectionUUID:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1B3C21000, a2, OS_LOG_TYPE_ERROR, "Class '%@' is missing implementation for the sendOutgoingData:forConnectionWithUUID: method!", v5, 0xCu);
}

@end