@interface ACCNavigationShim
- (ACCNavigationShim)initWithDelegate:(id)a3;
- (ACCNavigationShimProtocol)delegate;
- (BOOL)tryProcessXPCMessage:(id)a3 connection:(id)a4 server:(id)a5;
- (NSString)uid;
- (id)convertIAP2ACCManeuverInfo:(id)a3 forAccessory:(id)a4;
- (id)convertIAP2ACCRouteGuidanceInfo:(id)a3 forAccessory:(id)a4;
- (id)description;
- (id)getUID;
- (void)accessoryAttached:(id)a3;
- (void)accessoryDetached:(id)a3;
- (void)accessoryNavigation:(id)a3 updateManeuverInfo:(id)a4;
- (void)accessoryNavigation:(id)a3 updateRouteGuidanceInfo:(id)a4;
- (void)accessoryStartRouteGuidance:(id)a3 componentList:(id)a4;
- (void)accessoryStopRouteGuidance:(id)a3 componentList:(id)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation ACCNavigationShim

- (ACCNavigationShim)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACCNavigationShim;
  v5 = [(ACCNavigationShim *)&v10 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F08C38] UUID];
    uint64_t v7 = [v6 UUIDString];
    uid = v5->_uid;
    v5->_uid = (NSString *)v7;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)dealloc
{
  uid = self->_uid;
  self->_uid = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)ACCNavigationShim;
  [(ACCNavigationShim *)&v4 dealloc];
}

- (id)description
{
  v2 = NSString;
  uid = self->_uid;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = [v2 stringWithFormat:@"<ACCNavigationShim>[_uid=%@ _delegate=%@]", uid, WeakRetained];

  return v5;
}

- (void)accessoryAttached:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    uint64_t v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_2216B2000, v7, OS_LOG_TYPE_INFO, "[#Navigation] accessoryAttached: %@", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained notifyNavigationAccessoryClientsOfStateChange];
}

- (void)accessoryDetached:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    uint64_t v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_2216B2000, v7, OS_LOG_TYPE_INFO, "[#Navigation] accessoryDetached: %@", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained notifyNavigationAccessoryClientsOfStateChange];
}

- (void)accessoryStartRouteGuidance:(id)a3 componentList:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    id v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    id v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_2216B2000, v10, OS_LOG_TYPE_INFO, "[#Navigation] accessoryStartRouteGuidance: %@ componentList: %@", (uint8_t *)&v12, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained notifyNavigationAccessoryClientsOfStateChange];
}

- (void)accessoryStopRouteGuidance:(id)a3 componentList:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    id v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    id v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_2216B2000, v10, OS_LOG_TYPE_INFO, "[#Navigation] accessoryStopRouteGuidance: %@ componentList: %@", (uint8_t *)&v12, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained notifyNavigationAccessoryClientsOfStateChange];
}

- (void)accessoryNavigation:(id)a3 updateRouteGuidanceInfo:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    id v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    id v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_2216B2000, v10, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigation: %@ updateRouteGuidanceInfo: %@", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v11 = [NSNumber numberWithInt:0];
  int v12 = [v7 objectForKey:v11];

  if (v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v13 addObject:v12];
  }
  else
  {
    id v13 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v15 = [(ACCNavigationShim *)self convertIAP2ACCRouteGuidanceInfo:v7 forAccessory:v6];
  [WeakRetained updateRouteGuidanceInfo:v15 componentIdList:v13 accessory:v6];
}

- (void)accessoryNavigation:(id)a3 updateManeuverInfo:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    id v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    id v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_2216B2000, v10, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigation: %@ updateManeuverInfo: %@", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v11 = [NSNumber numberWithInt:0];
  int v12 = [v7 objectForKey:v11];

  if (v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v13 addObject:v12];
  }
  else
  {
    id v13 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v15 = [(ACCNavigationShim *)self convertIAP2ACCManeuverInfo:v7 forAccessory:v6];
  [WeakRetained updateManeuverInfo:v15 componentIdList:v13 accessory:v6];
}

- (id)convertIAP2ACCRouteGuidanceInfo:(id)a3 forAccessory:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F22EA8]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unsigned __int16 v12 = [v11 integerValue];
        id v13 = [v4 objectForKey:v11];
        [v5 setInfo:v12 data:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)convertIAP2ACCManeuverInfo:(id)a3 forAccessory:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F22E98]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unsigned __int16 v12 = [v11 integerValue];
        id v13 = [v4 objectForKey:v11];
        [v5 setInfo:v12 data:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)getUID
{
  return self->_uid;
}

- (BOOL)tryProcessXPCMessage:(id)a3 connection:(id)a4 server:(id)a5
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = (_xpc_connection_s *)a4;
  string = xpc_dictionary_get_string(v7, MEMORY[0x263F230B8]);
  unint64_t v10 = 0x26ABFC000uLL;
  unint64_t v11 = 0x26ABFC000uLL;
  if (!string)
  {
    if (gLogObjects) {
      BOOL v12 = gNumLogObjects < 1;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationShimAccessory create_xpc_representation]();
      }
      __int16 v14 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    else
    {
      __int16 v14 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v55[0]) = 0;
      _os_log_impl(&dword_2216B2000, v14, OS_LOG_TYPE_DEFAULT, "[#Navigation] RequestType not specified in xpc message!", (uint8_t *)v55, 2u);
    }

    string = "<nil>";
  }
  if (gLogObjects) {
    BOOL v15 = gNumLogObjects < 1;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    long long v17 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
  }
  else
  {
    long long v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[ACCNavigationShim tryProcessXPCMessage:connection:server:].cold.9((uint64_t)string, v17);
  }

  if (strcmp(string, "nav_requestConnectedAccessories"))
  {
    if (strcmp(string, "nav_sendGuidanceUpdate"))
    {
      if (strcmp(string, "nav_sendManeuverUpdate"))
      {
        char v18 = 0;
        goto LABEL_73;
      }
      uint64_t uint64 = xpc_dictionary_get_uint64(v7, "nav_accessoryIdentifier");
      v55[0] = 0xAAAAAAAAAAAAAAAALL;
      data = xpc_dictionary_get_data(v7, "nav_payload", v55);
      v32 = [MEMORY[0x263EFF8F8] dataWithBytes:data length:v55[0]];
      v60[0] = NSClassFromString(&cfstr_Nsdictionary.isa);
      v60[1] = NSClassFromString(&cfstr_Nsarray.isa);
      v60[2] = NSClassFromString(&cfstr_Nsstring.isa);
      v60[3] = NSClassFromString(&cfstr_Nsnumber.isa);
      v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:4];
      v34 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v33];
      v35 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v34 fromData:v32 error:0];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v37 = [WeakRetained navigationShimAccessoryForConnectionID:uint64];

      if (v37)
      {
        [(ACCNavigationShim *)self accessoryNavigation:v37 updateManeuverInfo:v35];
        reply = xpc_dictionary_create_reply(v7);
        unint64_t v11 = 0x26ABFC000uLL;
        if (reply) {
          goto LABEL_41;
        }
LABEL_59:
        int v48 = *(_DWORD *)(v11 + 3912);
        if (gLogObjects && v48 >= 1)
        {
          v42 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCNavigationShimAccessory create_xpc_representation]();
          }
          v42 = MEMORY[0x263EF8438];
          id v50 = MEMORY[0x263EF8438];
        }
        unint64_t v11 = 0x26ABFC000uLL;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          -[ACCNavigationShim tryProcessXPCMessage:connection:server:].cold.7();
        }
        goto LABEL_72;
      }
      reply = xpc_dictionary_create_reply(v7);
      unint64_t v11 = 0x26ABFC000;
      if (!reply) {
        goto LABEL_59;
      }
LABEL_57:
      v42 = reply;
      v43 = (const char *)MEMORY[0x263F230C0];
      BOOL v44 = 0;
      goto LABEL_58;
    }
    uint64_t v30 = xpc_dictionary_get_uint64(v7, "nav_accessoryIdentifier");
    v55[0] = 0xAAAAAAAAAAAAAAAALL;
    v31 = xpc_dictionary_get_data(v7, "nav_payload", v55);
    v32 = [MEMORY[0x263EFF8F8] dataWithBytes:v31 length:v55[0]];
    v61[0] = NSClassFromString(&cfstr_Nsdictionary.isa);
    v61[1] = NSClassFromString(&cfstr_Nsarray.isa);
    v61[2] = NSClassFromString(&cfstr_Nsstring.isa);
    v61[3] = NSClassFromString(&cfstr_Nsnumber.isa);
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:4];
    v34 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v33];
    v35 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v34 fromData:v32 error:0];
    id v36 = objc_loadWeakRetained((id *)&self->_delegate);
    v37 = [v36 navigationShimAccessoryForConnectionID:v30];

    if (v37)
    {
      [(ACCNavigationShim *)self accessoryNavigation:v37 updateRouteGuidanceInfo:v35];
      reply = xpc_dictionary_create_reply(v7);
      unint64_t v11 = 0x26ABFC000;
      if (reply)
      {
LABEL_41:
        v42 = reply;
        v43 = (const char *)MEMORY[0x263F230C0];
        BOOL v44 = 1;
LABEL_58:
        xpc_dictionary_set_BOOL(reply, v43, v44);
        xpc_connection_send_message(v8, v42);
LABEL_72:

        char v18 = 1;
        unint64_t v10 = 0x26ABFC000uLL;
        goto LABEL_73;
      }
    }
    else
    {
      reply = xpc_dictionary_create_reply(v7);
      unint64_t v11 = 0x26ABFC000uLL;
      if (reply) {
        goto LABEL_57;
      }
    }
    int v46 = *(_DWORD *)(v11 + 3912);
    if (gLogObjects && v46 >= 1)
    {
      v42 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationShimAccessory create_xpc_representation]();
      }
      v42 = MEMORY[0x263EF8438];
      id v49 = MEMORY[0x263EF8438];
    }
    unint64_t v11 = 0x26ABFC000;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShim tryProcessXPCMessage:connection:server:].cold.5();
    }
    goto LABEL_72;
  }
  xpc_object_t v19 = xpc_array_create(0, 0);
  id v20 = objc_loadWeakRetained((id *)&self->_delegate);
  v21 = [v20 navigationShimAccessoryList];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v22 = v21;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v57 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * i), "create_xpc_representation");
        xpc_array_append_value(v19, v27);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v24);
  }

  xpc_object_t v28 = xpc_dictionary_create_reply(v7);
  v29 = v28;
  if (v28)
  {
    xpc_dictionary_set_BOOL(v28, MEMORY[0x263F230C0], 1);
    xpc_dictionary_set_value(v29, "nav_accessoriesConnected", v19);
    xpc_connection_send_message(v8, v29);
    unint64_t v10 = 0x26ABFC000;
  }
  else
  {
    unint64_t v10 = 0x26ABFC000uLL;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v45 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationShimAccessory create_xpc_representation]();
      }
      v45 = MEMORY[0x263EF8438];
      id v47 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShim tryProcessXPCMessage:connection:server:]();
    }
  }
  char v18 = 1;
LABEL_73:
  v51 = *(id **)(v10 + 3904);
  if (v51 && *(int *)(v11 + 3912) >= 1)
  {
    v52 = *v51;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    v52 = MEMORY[0x263EF8438];
    id v53 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
    -[ACCNavigationShim tryProcessXPCMessage:connection:server:]((uint64_t)string, v18, v52);
  }

  return v18;
}

- (ACCNavigationShimProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACCNavigationShimProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)uid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)tryProcessXPCMessage:(uint64_t)a1 connection:(char)a2 server:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl(&dword_2216B2000, log, OS_LOG_TYPE_DEBUG, "[#Navigation] tryProcessXPCMessage: messagetype=%s processed=%d", (uint8_t *)&v3, 0x12u);
}

- (void)tryProcessXPCMessage:connection:server:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2216B2000, v0, v1, "[#Navigation] ERROR: Client sent kXPCIAPNavigationRequestConnectedAccessoriesStr xpc message without a reply context", v2, v3, v4, v5, v6);
}

- (void)tryProcessXPCMessage:connection:server:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2216B2000, v0, v1, "[#Navigation] ERROR: Client sent kXPCIAPNavigationSendGuidanceUpdateStr xpc message without a reply context", v2, v3, v4, v5, v6);
}

- (void)tryProcessXPCMessage:connection:server:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2216B2000, v0, v1, "[#Navigation] ERROR: Client sent kXPCIAPNavigationSendManeuverUpdateStr xpc message without a reply context", v2, v3, v4, v5, v6);
}

- (void)tryProcessXPCMessage:(uint64_t)a1 connection:(NSObject *)a2 server:.cold.9(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2216B2000, a2, OS_LOG_TYPE_DEBUG, "[#Navigation] tryProcessXPCMessage: messagetype=%s", (uint8_t *)&v2, 0xCu);
}

@end