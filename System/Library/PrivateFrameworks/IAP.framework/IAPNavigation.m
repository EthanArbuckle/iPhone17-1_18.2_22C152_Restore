@interface IAPNavigation
- (BOOL)connected;
- (IAPNavigation)init;
- (IAPNavigation)initWithDelegate:(id)a3;
- (IAPNavigationDelegate)delegate;
- (NSSet)availableAccessories;
- (OS_dispatch_queue)processingQ;
- (OS_xpc_object)iap2d_connection;
- (id)_convert_xpc_array_to_NSArray:(id)a3;
- (void)_getConnectedAccessories;
- (void)_iap2d_server_did_die;
- (void)_iap2d_server_did_launch;
- (void)_updateInternalStateWithArrayOfAccessories:(id)a3;
- (void)dealloc;
- (void)setAvailableAccessories:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIap2d_connection:(id)a3;
- (void)setProcessingQ:(id)a3;
- (void)updateNavigationGuidanceInfo:(id)a3 forAccessory:(id)a4 withComponent:(id)a5;
- (void)updateNavigationManeuverInfo:(id)a3 forAccessory:(id)a4 withComponent:(id)a5;
@end

@implementation IAPNavigation

- (IAPNavigation)init
{
  return 0;
}

- (IAPNavigation)initWithDelegate:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IAPNavigation;
  v5 = [(IAPNavigation *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    availableAccessories = v5->_availableAccessories;
    v5->_availableAccessories = (NSSet *)v6;

    objc_storeWeak((id *)&v5->_delegate, v4);
    v5->_connected = 0;
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.iap.navigation.processingQ", 0);
    processingQ = v5->_processingQ;
    v5->_processingQ = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    localNotificationCenter = v5->_localNotificationCenter;
    v5->_localNotificationCenter = (NSNotificationCenter *)v10;

    [(NSNotificationCenter *)v5->_localNotificationCenter addObserver:v5 selector:sel__iap2d_server_did_launch name:@"iAP2ServerLaunch" object:0];
    [(NSNotificationCenter *)v5->_localNotificationCenter addObserver:v5 selector:sel__iap2d_server_did_die name:@"iAP2ServerDie" object:0];
    v12 = [MEMORY[0x1E4F28C40] defaultCenter];
    v13 = [NSString stringWithUTF8String:"nav_frameworkShouldPollNotification"];
    [v12 addObserver:v5 selector:sel__getConnectedAccessories name:v13 object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v5->_darwinNotificationCenter = DarwinNotifyCenter;
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__iap2dServerLaunched, @"kIAP2ServerLaunchedNotification", 0, (CFNotificationSuspensionBehavior)0);
    CFNotificationCenterAddObserver(v5->_darwinNotificationCenter, 0, (CFNotificationCallback)__iap2dServerDied, @"kIAP2ServerDiedNotification", 0, (CFNotificationSuspensionBehavior)0);
    uint64_t v15 = RetainConnectionToIAP2Daemon();
    iap2d_connection = v5->_iap2d_connection;
    v5->_iap2d_connection = (OS_xpc_object *)v15;

    if (v5->_iap2d_connection)
    {
      v5->_connected = 1;
      [(IAPNavigation *)v5 _getConnectedAccessories];
    }
  }

  return v5;
}

- (void)dealloc
{
  [(NSNotificationCenter *)self->_localNotificationCenter removeObserver:self];
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  CFNotificationCenterRemoveObserver(self->_darwinNotificationCenter, 0, @"kIAP2ServerLaunchedNotification", 0);
  CFNotificationCenterRemoveObserver(self->_darwinNotificationCenter, 0, @"kIAP2ServerDiedNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)IAPNavigation;
  [(IAPNavigation *)&v4 dealloc];
}

- (void)updateNavigationGuidanceInfo:(id)a3 forAccessory:(id)a4 withComponent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
    if (!__debugLogEnabled___bNavigationDebug) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (__debugLogEnabled___bNavigationDebug) {
LABEL_3:
  }
    NSLog(&cfstr_NavigationVoid.isa, v8, v9, v10);
LABEL_4:
  processingQ = self->_processingQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__IAPNavigation_updateNavigationGuidanceInfo_forAccessory_withComponent___block_invoke;
  block[3] = &unk_1E62279B8;
  block[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(processingQ, block);
}

void __73__IAPNavigation_updateNavigationGuidanceInfo_forAccessory_withComponent___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 24) || !*(void *)(v1 + 48)) {
    return;
  }
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "requestType", "nav_sendGuidanceUpdate");
  xpc_dictionary_set_uint64(xdict, "nav_accessoryIdentifier", [*(id *)(a1 + 40) identifier]);
  v3 = *(void **)(a1 + 48);
  if (v3) {
    xpc_dictionary_set_uint64(xdict, "nav_componentIdentifier", [v3 identifier]);
  }
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(a1 + 56)];
  xpc_dictionary_set_data(xdict, "nav_payload", (const void *)[v4 bytes], objc_msgSend(v4, "length"));
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(*(void *)(a1 + 32) + 48), xdict);
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = MEMORY[0x1BA9F0E70](v5);
    if (v6 == (void *)MEMORY[0x1E4F14528] && v7 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_NavigationErro.isa);
    }
    else
    {
      if (v6 != (void *)MEMORY[0x1E4F14520] || v7 != MEMORY[0x1E4F145A8])
      {
        if (v7 == MEMORY[0x1E4F14590])
        {
          if (xpc_dictionary_get_uint64(v6, "result")) {
            NSLog(&cfstr_NavigationErro_1.isa);
          }
        }
        else if (v7 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_NavigationSDUn.isa, "-[IAPNavigation updateNavigationGuidanceInfo:forAccessory:withComponent:]_block_invoke", 561);
        }
        else
        {
          NSLog(&cfstr_NavigationSDUn_0.isa, "-[IAPNavigation updateNavigationGuidanceInfo:forAccessory:withComponent:]_block_invoke", 565, v7);
        }
        goto LABEL_15;
      }
      NSLog(&cfstr_NavigationErro_0.isa);
    }
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"iAP2ServerDie" object:0];
  }
  else
  {
    NSLog(&cfstr_NavigationSDNo.isa, "-[IAPNavigation updateNavigationGuidanceInfo:forAccessory:withComponent:]_block_invoke", 570);
  }
LABEL_15:
}

- (void)updateNavigationManeuverInfo:(id)a3 forAccessory:(id)a4 withComponent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
    if (!__debugLogEnabled___bNavigationDebug) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (__debugLogEnabled___bNavigationDebug) {
LABEL_3:
  }
    NSLog(&cfstr_NavigationVoid_0.isa, v8, v9, v10);
LABEL_4:
  processingQ = self->_processingQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__IAPNavigation_updateNavigationManeuverInfo_forAccessory_withComponent___block_invoke;
  block[3] = &unk_1E62279B8;
  block[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(processingQ, block);
}

void __73__IAPNavigation_updateNavigationManeuverInfo_forAccessory_withComponent___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 24) || !*(void *)(v1 + 48)) {
    return;
  }
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "requestType", "nav_sendManeuverUpdate");
  xpc_dictionary_set_uint64(xdict, "nav_accessoryIdentifier", [*(id *)(a1 + 40) identifier]);
  v3 = *(void **)(a1 + 48);
  if (v3) {
    xpc_dictionary_set_uint64(xdict, "nav_componentIdentifier", [v3 identifier]);
  }
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(a1 + 56)];
  xpc_dictionary_set_data(xdict, "nav_payload", (const void *)[v4 bytes], objc_msgSend(v4, "length"));
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(*(void *)(a1 + 32) + 48), xdict);
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = MEMORY[0x1BA9F0E70](v5);
    if (v6 == (void *)MEMORY[0x1E4F14528] && v7 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_NavigationErro.isa);
    }
    else
    {
      if (v6 != (void *)MEMORY[0x1E4F14520] || v7 != MEMORY[0x1E4F145A8])
      {
        if (v7 == MEMORY[0x1E4F14590])
        {
          if (xpc_dictionary_get_uint64(v6, "result")) {
            NSLog(&cfstr_NavigationErro_1.isa);
          }
        }
        else if (v7 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_NavigationSDUn.isa, "-[IAPNavigation updateNavigationManeuverInfo:forAccessory:withComponent:]_block_invoke", 628);
        }
        else
        {
          NSLog(&cfstr_NavigationSDUn_0.isa, "-[IAPNavigation updateNavigationManeuverInfo:forAccessory:withComponent:]_block_invoke", 632, v7);
        }
        goto LABEL_15;
      }
      NSLog(&cfstr_NavigationErro_0.isa);
    }
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"iAP2ServerDie" object:0];
  }
  else
  {
    NSLog(&cfstr_NavigationSDNo.isa, "-[IAPNavigation updateNavigationManeuverInfo:forAccessory:withComponent:]_block_invoke", 637);
  }
LABEL_15:
}

- (void)_iap2d_server_did_launch
{
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
    if (!__debugLogEnabled___bNavigationDebug) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (__debugLogEnabled___bNavigationDebug) {
LABEL_3:
  }
    NSLog(&cfstr_NavigationVoid_1.isa, a2);
LABEL_4:
  processingQ = self->_processingQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__IAPNavigation__iap2d_server_did_launch__block_invoke;
  block[3] = &unk_1E62279E0;
  block[4] = self;
  dispatch_async(processingQ, block);
}

void __41__IAPNavigation__iap2d_server_did_launch__block_invoke(uint64_t a1)
{
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
    if (!__debugLogEnabled___bNavigationDebug) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (__debugLogEnabled___bNavigationDebug) {
LABEL_3:
  }
    NSLog(&cfstr_NavigationRunn.isa, *(unsigned __int8 *)(*(void *)(a1 + 32) + 24));
LABEL_4:
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    uint64_t v2 = RetainConnectionToIAP2Daemon();
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = v2;

    uint64_t v5 = *(void *)(a1 + 32);
    if (*(void *)(v5 + 48))
    {
      *(unsigned char *)(v5 + 24) = 1;
      uint64_t v6 = *(void **)(a1 + 32);
      [v6 _getConnectedAccessories];
    }
  }
}

- (void)_iap2d_server_did_die
{
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
    if (!__debugLogEnabled___bNavigationDebug) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (__debugLogEnabled___bNavigationDebug) {
LABEL_3:
  }
    NSLog(&cfstr_NavigationVoid_2.isa, a2);
LABEL_4:
  processingQ = self->_processingQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__IAPNavigation__iap2d_server_did_die__block_invoke;
  block[3] = &unk_1E62279E0;
  block[4] = self;
  dispatch_async(processingQ, block);
}

void __38__IAPNavigation__iap2d_server_did_die__block_invoke(uint64_t a1)
{
  if (__debugLogEnabled___bNavigationDebug != -1)
  {
    if (!__debugLogEnabled___bNavigationDebug) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
  if (__debugLogEnabled___bNavigationDebug) {
LABEL_3:
  }
    NSLog(&cfstr_NavigationRunn.isa, *(unsigned __int8 *)(*(void *)(a1 + 32) + 24));
LABEL_4:
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t v3 = *(void **)(v2 + 48);
    *(void *)(v2 + 48) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    [*(id *)(a1 + 32) _updateInternalStateWithArrayOfAccessories:v4];
  }
}

- (void)_getConnectedAccessories
{
  processingQ = self->_processingQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__IAPNavigation__getConnectedAccessories__block_invoke;
  block[3] = &unk_1E62279E0;
  block[4] = self;
  dispatch_async(processingQ, block);
}

void __41__IAPNavigation__getConnectedAccessories__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 24) || !*(void *)(v1 + 48)) {
    return;
  }
  xpc_object_t message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, "requestType", "nav_requestConnectedAccessories");
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(*(void *)(a1 + 32) + 48), message);
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = MEMORY[0x1BA9F0E70](v3);
    if (v4 == (void *)MEMORY[0x1E4F14528] && v5 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_NavigationIapn.isa);
    }
    else
    {
      if (v4 != (void *)MEMORY[0x1E4F14520] || v5 != MEMORY[0x1E4F145A8])
      {
        if (v5 == MEMORY[0x1E4F14590])
        {
          if (xpc_dictionary_get_BOOL(v4, "result"))
          {
            id v9 = xpc_dictionary_get_value(v4, "nav_accessoriesConnected");
            if (__debugLogEnabled()) {
              NSLog(&cfstr_NavigationConn.isa, v9);
            }
            id v10 = objc_msgSend(*(id *)(a1 + 32), "_convert_xpc_array_to_NSArray:", v9);
            [*(id *)(a1 + 32) _updateInternalStateWithArrayOfAccessories:v10];
          }
        }
        else if (v5 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_NavigationSDUn.isa, "-[IAPNavigation _getConnectedAccessories]_block_invoke", 728);
        }
        else
        {
          NSLog(&cfstr_NavigationSDUn_0.isa, "-[IAPNavigation _getConnectedAccessories]_block_invoke", 732, v5);
        }
        goto LABEL_20;
      }
      NSLog(&cfstr_NavigationIapn_0.isa);
    }
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"iAP2ServerDie" object:0];
  }
  else
  {
    NSLog(&cfstr_NavigationSDNo.isa, "-[IAPNavigation _getConnectedAccessories]_block_invoke", 737);
  }
LABEL_20:
}

- (void)_updateInternalStateWithArrayOfAccessories:(id)a3
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int AppBooleanValue = __debugLogEnabled___bNavigationDebug;
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
    __debugLogEnabled___bNavigationDebug = AppBooleanValue;
  }
  if (AppBooleanValue)
  {
    NSLog(&cfstr_NavigationBegi.isa);
    int v6 = __debugLogEnabled___bNavigationDebug;
    if (__debugLogEnabled___bNavigationDebug == -1)
    {
      int v6 = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
      __debugLogEnabled___bNavigationDebug = v6;
    }
    if (v6) {
      NSLog(&cfstr_NavigationInpu.isa, v4);
    }
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  v94 = [MEMORY[0x1E4F1CA80] set];
  v95 = [MEMORY[0x1E4F1CA80] set];
  id v97 = [MEMORY[0x1E4F1CA80] set];
  long long v149 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  obuint64_t j = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v149 objects:v161 count:16];
  v112 = self;
  if (v8)
  {
    id v9 = (id)v8;
    unint64_t v10 = 0x1E6227000uLL;
    uint64_t v11 = *(void *)v150;
    v93 = v7;
    uint64_t v96 = *(void *)v150;
    do
    {
      id v12 = 0;
      id v99 = v9;
      do
      {
        if (*(void *)v150 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = (void *)[objc_alloc(*(Class *)(v10 + 880)) initWithDict:*(void *)(*((void *)&v149 + 1) + 8 * (void)v12)];
        if (__debugLogEnabled___bNavigationDebug != -1)
        {
          if (!__debugLogEnabled___bNavigationDebug) {
            goto LABEL_16;
          }
LABEL_15:
          NSLog(&cfstr_NavigationIapn_1.isa, v13);
          goto LABEL_16;
        }
        __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
        if (__debugLogEnabled___bNavigationDebug) {
          goto LABEL_15;
        }
LABEL_16:
        BOOL v14 = [(NSSet *)self->_availableAccessories containsObject:v13];
        int v15 = __debugLogEnabled___bNavigationDebug;
        if (!v14)
        {
          if (__debugLogEnabled___bNavigationDebug == -1)
          {
            __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
            if (__debugLogEnabled___bNavigationDebug) {
LABEL_28:
            }
              NSLog(&cfstr_NavigationAcce_2.isa);
          }
          else if (__debugLogEnabled___bNavigationDebug)
          {
            goto LABEL_28;
          }
          [(NSSet *)self->_availableAccessories addObject:v13];
          objc_msgSend(v13, "set_wasFoundInLastUpdate:", 1);
          [v7 addObject:v13];
          goto LABEL_46;
        }
        if (__debugLogEnabled___bNavigationDebug == -1)
        {
          int v15 = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
          __debugLogEnabled___bNavigationDebug = v15;
        }
        v104 = v12;
        if (v15) {
          NSLog(&cfstr_NavigationAcce.isa);
        }
        id v16 = (void *)MEMORY[0x1E4F28F60];
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "identifier"));
        id v18 = v17 = v13;
        uint64_t v19 = [v16 predicateWithFormat:@"identifier = %@", v18];

        v20 = [(NSSet *)self->_availableAccessories allObjects];
        id v102 = (id)v19;
        v21 = [v20 filteredArrayUsingPredicate:v19];
        v22 = [v21 firstObject];

        objc_msgSend(v22, "set_wasFoundInLastUpdate:", 1);
        v23 = [v22 components];
        v108 = v17;
        v24 = [v17 components];
        int v25 = [v23 isEqualToSet:v24];

        int v26 = __debugLogEnabled___bNavigationDebug;
        if (!v25)
        {
          if (__debugLogEnabled___bNavigationDebug == -1)
          {
            __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
            if (__debugLogEnabled___bNavigationDebug) {
LABEL_34:
            }
              NSLog(&cfstr_NavigationAcce_1.isa);
          }
          else if (__debugLogEnabled___bNavigationDebug)
          {
            goto LABEL_34;
          }
          long long v147 = 0u;
          long long v148 = 0u;
          long long v145 = 0u;
          long long v146 = 0u;
          id v113 = [v17 components];
          uint64_t v29 = [v113 countByEnumeratingWithState:&v145 objects:v160 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v146;
            do
            {
              for (uint64_t i = 0; i != v30; ++i)
              {
                if (*(void *)v146 != v31) {
                  objc_enumerationMutation(v113);
                }
                v33 = *(void **)(*((void *)&v145 + 1) + 8 * i);
                v34 = (void *)MEMORY[0x1E4F28F60];
                v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v33, "identifier"));
                v36 = [v34 predicateWithFormat:@"identifier = %@", v35];

                v37 = [v22 components];
                v38 = [v37 allObjects];
                v39 = [v38 filteredArrayUsingPredicate:v36];
                v40 = [v39 firstObject];

                LODWORD(v39) = [v33 isEnabled];
                if (v39 != [v40 isEnabled])
                {
                  objc_msgSend(v40, "setIsEnabled:", objc_msgSend(v33, "isEnabled"));
                  objc_msgSend(v40, "set_enabledModified:", 1);
                }
              }
              uint64_t v30 = [v113 countByEnumeratingWithState:&v145 objects:v160 count:16];
            }
            while (v30);
          }

          uint64_t v7 = v93;
          v27 = v94;
          self = v112;
          unint64_t v10 = 0x1E6227000;
          id v9 = v99;
          uint64_t v11 = v96;
          v28 = v102;
          id v12 = v104;
          goto LABEL_45;
        }
        id v9 = v99;
        uint64_t v11 = v96;
        if (__debugLogEnabled___bNavigationDebug == -1)
        {
          int v26 = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
          __debugLogEnabled___bNavigationDebug = v26;
        }
        v27 = v95;
        v28 = v102;
        id v12 = v104;
        if (v26)
        {
          NSLog(&cfstr_NavigationAcce_0.isa, v95);
          v27 = v95;
        }
LABEL_45:
        [v27 addObject:v22];

        id v13 = v108;
LABEL_46:

        id v12 = (char *)v12 + 1;
      }
      while (v12 != v9);
      uint64_t v41 = [obj countByEnumeratingWithState:&v149 objects:v161 count:16];
      id v9 = (id)v41;
    }
    while (v41);
  }

  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  v42 = self->_availableAccessories;
  uint64_t v43 = [(NSSet *)v42 countByEnumeratingWithState:&v141 objects:v159 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v142;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v142 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = *(void **)(*((void *)&v141 + 1) + 8 * j);
        if ([v47 _wasFoundInLastUpdate]) {
          objc_msgSend(v47, "set_wasFoundInLastUpdate:", 0);
        }
        else {
          [v97 addObject:v47];
        }
      }
      uint64_t v44 = [(NSSet *)v42 countByEnumeratingWithState:&v141 objects:v159 count:16];
    }
    while (v44);
  }

  int v48 = __debugLogEnabled___bNavigationDebug;
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    int v48 = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
    __debugLogEnabled___bNavigationDebug = v48;
  }
  if (v48) {
    NSLog(&cfstr_NavigationAddi.isa, v7);
  }
  availableAccessories = self->_availableAccessories;
  v50 = [v7 allObjects];
  [(NSSet *)availableAccessories addObjectsFromArray:v50];

  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v103 = v7;
  uint64_t v109 = [v103 countByEnumeratingWithState:&v137 objects:v158 count:16];
  if (v109)
  {
    p_delegate = (id *)&v112->_delegate;
    uint64_t v105 = *(void *)v138;
    do
    {
      v52 = 0;
      do
      {
        if (*(void *)v138 != v105) {
          objc_enumerationMutation(v103);
        }
        v53 = *(void **)(*((void *)&v137 + 1) + 8 * (void)v52);
        int v54 = __debugLogEnabled___bNavigationDebug;
        if (__debugLogEnabled___bNavigationDebug == -1)
        {
          int v54 = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
          __debugLogEnabled___bNavigationDebug = v54;
        }
        v114 = v52;
        if (v54) {
          NSLog(&cfstr_NavigationCall.isa, v53);
        }
        id WeakRetained = objc_loadWeakRetained(p_delegate);
        [WeakRetained IAPNavigationAccessoryDidBecomeAvailable:v53];

        long long v135 = 0u;
        long long v136 = 0u;
        long long v133 = 0u;
        long long v134 = 0u;
        v56 = [v53 components];
        uint64_t v57 = [v56 countByEnumeratingWithState:&v133 objects:v157 count:16];
        if (v57)
        {
          uint64_t v58 = v57;
          uint64_t v59 = *(void *)v134;
          do
          {
            uint64_t v60 = 0;
            do
            {
              if (*(void *)v134 != v59) {
                objc_enumerationMutation(v56);
              }
              v61 = *(void **)(*((void *)&v133 + 1) + 8 * v60);
              if ([v61 isEnabled])
              {
                if (__debugLogEnabled___bNavigationDebug == -1)
                {
                  __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
                  if (__debugLogEnabled___bNavigationDebug) {
LABEL_84:
                  }
                    NSLog(&cfstr_NavigationCall_0.isa, v53, v61);
                }
                else if (__debugLogEnabled___bNavigationDebug)
                {
                  goto LABEL_84;
                }
                id v62 = objc_loadWeakRetained(p_delegate);
                [v62 IAPNavigationAccessory:v53 didEnableNavigationUpdatesForComponent:v61];
              }
              ++v60;
            }
            while (v58 != v60);
            uint64_t v63 = [v56 countByEnumeratingWithState:&v133 objects:v157 count:16];
            uint64_t v58 = v63;
          }
          while (v63);
        }

        v52 = v114 + 1;
      }
      while (v114 + 1 != (char *)v109);
      uint64_t v109 = [v103 countByEnumeratingWithState:&v137 objects:v158 count:16];
    }
    while (v109);
  }

  int v64 = __debugLogEnabled___bNavigationDebug;
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    int v64 = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
    __debugLogEnabled___bNavigationDebug = v64;
  }
  if (v64)
  {
    NSLog(&cfstr_NavigationAvai.isa, v112->_availableAccessories);
    int v65 = __debugLogEnabled___bNavigationDebug;
    if (__debugLogEnabled___bNavigationDebug == -1)
    {
      int v65 = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
      __debugLogEnabled___bNavigationDebug = v65;
    }
    if (v65) {
      NSLog(&cfstr_NavigationUpda.isa, v94);
    }
  }
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v100 = v94;
  uint64_t v110 = [v100 countByEnumeratingWithState:&v129 objects:v156 count:16];
  if (v110)
  {
    v66 = (id *)&v112->_delegate;
    uint64_t v106 = *(void *)v130;
    do
    {
      v67 = 0;
      do
      {
        if (*(void *)v130 != v106) {
          objc_enumerationMutation(v100);
        }
        v115 = v67;
        v68 = *(void **)(*((void *)&v129 + 1) + 8 * (void)v67);
        long long v125 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        v69 = [v68 components];
        uint64_t v70 = [v69 countByEnumeratingWithState:&v125 objects:v155 count:16];
        if (v70)
        {
          uint64_t v71 = v70;
          uint64_t v72 = *(void *)v126;
          do
          {
            uint64_t v73 = 0;
            do
            {
              if (*(void *)v126 != v72) {
                objc_enumerationMutation(v69);
              }
              v74 = *(void **)(*((void *)&v125 + 1) + 8 * v73);
              if ([v74 _enabledModified])
              {
                objc_msgSend(v74, "set_enabledModified:", 0);
                if ([v74 isEnabled])
                {
                  if (__debugLogEnabled___bNavigationDebug == -1)
                  {
                    __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
                    if (__debugLogEnabled___bNavigationDebug) {
LABEL_114:
                    }
                      NSLog(&cfstr_NavigationCall_1.isa, v68, v74);
                  }
                  else if (__debugLogEnabled___bNavigationDebug)
                  {
                    goto LABEL_114;
                  }
                  id v75 = objc_loadWeakRetained(v66);
                  [v75 IAPNavigationAccessory:v68 didEnableNavigationUpdatesForComponent:v74];
LABEL_120:

                  goto LABEL_121;
                }
                if (__debugLogEnabled___bNavigationDebug == -1)
                {
                  __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
                  if (__debugLogEnabled___bNavigationDebug) {
LABEL_118:
                  }
                    NSLog(&cfstr_NavigationCall_2.isa, v68, v74);
                }
                else if (__debugLogEnabled___bNavigationDebug)
                {
                  goto LABEL_118;
                }
                id v75 = objc_loadWeakRetained(v66);
                [v75 IAPNavigationAccessory:v68 didDisableNavigationUpdatesForComponent:v74];
                goto LABEL_120;
              }
LABEL_121:
              ++v73;
            }
            while (v71 != v73);
            uint64_t v76 = [v69 countByEnumeratingWithState:&v125 objects:v155 count:16];
            uint64_t v71 = v76;
          }
          while (v76);
        }

        v67 = v115 + 1;
      }
      while (v115 + 1 != (char *)v110);
      uint64_t v110 = [v100 countByEnumeratingWithState:&v129 objects:v156 count:16];
    }
    while (v110);
  }

  int v77 = __debugLogEnabled___bNavigationDebug;
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    int v77 = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
    __debugLogEnabled___bNavigationDebug = v77;
  }
  v78 = v112;
  if (v77) {
    NSLog(&cfstr_NavigationRemo.isa, v97);
  }
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v98 = v97;
  uint64_t v111 = [v98 countByEnumeratingWithState:&v121 objects:v154 count:16];
  if (v111)
  {
    v79 = (id *)&v112->_delegate;
    uint64_t v107 = *(void *)v122;
    do
    {
      v80 = 0;
      do
      {
        if (*(void *)v122 != v107) {
          objc_enumerationMutation(v98);
        }
        v116 = v80;
        v81 = *(void **)(*((void *)&v121 + 1) + 8 * (void)v80);
        [(NSSet *)v78->_availableAccessories removeObject:v81];
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        v82 = [v81 components];
        uint64_t v83 = [v82 countByEnumeratingWithState:&v117 objects:v153 count:16];
        if (v83)
        {
          uint64_t v84 = v83;
          uint64_t v85 = *(void *)v118;
          do
          {
            uint64_t v86 = 0;
            do
            {
              if (*(void *)v118 != v85) {
                objc_enumerationMutation(v82);
              }
              v87 = *(void **)(*((void *)&v117 + 1) + 8 * v86);
              if ([v87 isEnabled])
              {
                if (__debugLogEnabled___bNavigationDebug == -1)
                {
                  __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
                  if (__debugLogEnabled___bNavigationDebug) {
LABEL_147:
                  }
                    NSLog(&cfstr_NavigationCall_3.isa, v81, v87);
                }
                else if (__debugLogEnabled___bNavigationDebug)
                {
                  goto LABEL_147;
                }
                id v88 = objc_loadWeakRetained(v79);
                [v88 IAPNavigationAccessory:v81 didDisableNavigationUpdatesForComponent:v87];
              }
              ++v86;
            }
            while (v84 != v86);
            uint64_t v89 = [v82 countByEnumeratingWithState:&v117 objects:v153 count:16];
            uint64_t v84 = v89;
          }
          while (v89);
        }

        int v90 = __debugLogEnabled___bNavigationDebug;
        if (__debugLogEnabled___bNavigationDebug == -1)
        {
          int v90 = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
          __debugLogEnabled___bNavigationDebug = v90;
        }
        if (v90) {
          NSLog(&cfstr_NavigationCall_4.isa, v81);
        }
        id v91 = objc_loadWeakRetained(v79);
        [v91 IAPNavigationAccessoryDidBecomeUnavailable:v81];

        v80 = v116 + 1;
        v78 = v112;
      }
      while (v116 + 1 != (char *)v111);
      uint64_t v111 = [v98 countByEnumeratingWithState:&v121 objects:v154 count:16];
    }
    while (v111);
  }

  int v92 = __debugLogEnabled___bNavigationDebug;
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    int v92 = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
    __debugLogEnabled___bNavigationDebug = v92;
  }
  if (v92) {
    NSLog(&cfstr_NavigationAvai.isa, v78->_availableAccessories);
  }
}

- (id)_convert_xpc_array_to_NSArray:(id)a3
{
  id v3 = a3;
  if (MEMORY[0x1BA9F0E70]() != MEMORY[0x1E4F14568]) {
    -[IAPNavigation _convert_xpc_array_to_NSArray:]();
  }
  id v4 = [MEMORY[0x1E4F1CA48] array];
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __47__IAPNavigation__convert_xpc_array_to_NSArray___block_invoke;
  applier[3] = &unk_1E6227A30;
  id v5 = v4;
  id v8 = v5;
  xpc_array_apply(v3, applier);

  return v5;
}

uint64_t __47__IAPNavigation__convert_xpc_array_to_NSArray___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = MEMORY[0x1BA9F0E70](v4);
  uint64_t v7 = MEMORY[0x1E4F14590];
  if (v6 == MEMORY[0x1E4F14590])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "identifier");
    id v9 = xpc_dictionary_get_array(v4, "components");
    unint64_t v10 = [NSNumber numberWithUnsignedLongLong:uint64];
    [v5 setObject:v10 forKey:@"identifier"];

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    if (MEMORY[0x1BA9F0E70](v9) == MEMORY[0x1E4F14568])
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      id v17 = __47__IAPNavigation__convert_xpc_array_to_NSArray___block_invoke_2;
      id v18 = &unk_1E6227A08;
      id v19 = v11;
      uint64_t v20 = v7;
      id v14 = v11;
      xpc_array_apply(v9, &v15);
      objc_msgSend(v5, "setObject:forKey:", v14, @"components", v15, v16, v17, v18);

      [*(id *)(a1 + 32) addObject:v5];
      uint64_t v12 = 1;
      goto LABEL_5;
    }
  }
  uint64_t v12 = 0;
LABEL_5:

  return v12;
}

BOOL __47__IAPNavigation__convert_xpc_array_to_NSArray___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = MEMORY[0x1E4F14590];
  if (v6 == MEMORY[0x1E4F14590])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "identifier");
    BOOL v9 = xpc_dictionary_get_BOOL(v4, "isEnabled");
    unint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", xpc_dictionary_get_string(v4, "name"), 4);
    uint64_t v11 = xpc_dictionary_get_uint64(v4, "maxLength_CurrentRoadName");
    uint64_t v12 = xpc_dictionary_get_uint64(v4, "maxLength_DestinationRoadName");
    uint64_t v22 = xpc_dictionary_get_uint64(v4, "maxLength_PostManeuverRoadName");
    uint64_t v23 = xpc_dictionary_get_uint64(v4, "maxLength_ManeuverDescription");
    uint64_t v24 = xpc_dictionary_get_uint64(v4, "maxCapacity_GuidanceManeuver");
    if (v9) {
      id v13 = @"YES";
    }
    else {
      id v13 = @"NO";
    }
    [v5 setValue:v13 forKey:@"isEnabled"];
    id v14 = [NSNumber numberWithUnsignedLongLong:uint64];
    [v5 setValue:v14 forKey:@"identifier"];

    [v5 setValue:v10 forKey:@"name"];
    uint64_t v15 = [NSNumber numberWithUnsignedLongLong:v11];
    [v5 setValue:v15 forKey:@"maxLength_CurrentRoadName"];

    uint64_t v16 = [NSNumber numberWithUnsignedLongLong:v12];
    [v5 setValue:v16 forKey:@"maxLength_DestinationRoadName"];

    id v17 = [NSNumber numberWithUnsignedLongLong:v22];
    [v5 setValue:v17 forKey:@"maxLength_PostManeuverRoadName"];

    id v18 = [NSNumber numberWithUnsignedLongLong:v23];
    [v5 setValue:v18 forKey:@"maxLength_ManeuverDescription"];

    id v19 = [NSNumber numberWithUnsignedLongLong:v24];
    [v5 setValue:v19 forKey:@"maxCapacity_GuidanceManeuver"];

    [*(id *)(a1 + 32) addObject:v5];
    uint64_t v7 = MEMORY[0x1E4F14590];
  }
  BOOL v20 = v6 == v7;

  return v20;
}

- (IAPNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IAPNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)availableAccessories
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAvailableAccessories:(id)a3
{
}

- (OS_xpc_object)iap2d_connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIap2d_connection:(id)a3
{
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (OS_dispatch_queue)processingQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProcessingQ:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQ, 0);
  objc_storeStrong((id *)&self->_iap2d_connection, 0);
  objc_storeStrong((id *)&self->_availableAccessories, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_localNotificationCenter, 0);
}

- (void)_convert_xpc_array_to_NSArray:.cold.1()
{
  __assert_rtn("-[IAPNavigation _convert_xpc_array_to_NSArray:]", "IAPNavigation.m", 915, "xpc_get_type(x_array) == XPC_TYPE_ARRAY");
}

@end