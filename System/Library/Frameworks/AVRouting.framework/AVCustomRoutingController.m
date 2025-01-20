@interface AVCustomRoutingController
- (AVCustomRoutingController)init;
- (BOOL)isRouteActive:(AVCustomDeviceRoute *)route;
- (BOOL)isSessionSuspended;
- (DADaemonSession)session;
- (NSArray)authorizedRoutes;
- (NSArray)customActionItems;
- (NSArray)knownRouteIPs;
- (NSArray)pendingEvents;
- (id)_routeForDADevice:(id)a3;
- (id)delegate;
- (void)_addAuthorizedRoute:(id)a3;
- (void)_informClientOfEventReason:(int64_t)a3 forRoute:(id)a4;
- (void)_removeAuthorizedRoute:(id)a3;
- (void)_resumeSessionUpdates;
- (void)_setActive:(BOOL)a3 forRoute:(id)a4;
- (void)_setAuthorizedRoutes:(id)a3;
- (void)_setPendingEvents:(id)a3;
- (void)_startSession;
- (void)_stopSession;
- (void)_storeRecordForEvent:(id)a3;
- (void)_suspendSessionUpdates;
- (void)_updateSessionForEvent:(id)a3;
- (void)_updateSessionFromEventRecords;
- (void)_updateSessionStateToMatchRoute:(id)a3;
- (void)_updateSessionToReflectCurrentlyActiveRoutes;
- (void)dealloc;
- (void)handleCustomActionItemSelected:(id)a3;
- (void)invalidateAuthorizationForRoute:(AVCustomDeviceRoute *)route;
- (void)setActive:(BOOL)active forRoute:(AVCustomDeviceRoute *)route;
- (void)setCustomActionItems:(NSArray *)customActionItems;
- (void)setDelegate:(id)delegate;
- (void)setKnownRouteIPs:(NSArray *)knownRouteIPs;
- (void)setSession:(id)a3;
- (void)setSessionSuspended:(BOOL)a3;
@end

@implementation AVCustomRoutingController

- (AVCustomRoutingController)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVCustomRoutingController;
  v2 = [(AVCustomRoutingController *)&v4 init];
  if (v2)
  {
    v2->_pendingEvents = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    v2->_authorizedRoutes = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    v2->_routeEventRecords = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    v2->_customActionItems = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    v2->_knownRouteIPs = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    v2->_session = (DADaemonSession *)objc_alloc_init((Class)getDADaemonSessionClass());
    [(AVCustomRoutingController *)v2 _startSession];
  }
  return v2;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  [(AVCustomRoutingController *)self _stopSession];

  self->_pendingEvents = 0;
  self->_authorizedRoutes = 0;

  self->_routeEventRecords = 0;
  self->_customActionItems = 0;

  self->_knownRouteIPs = 0;
  [(AVCustomRoutingController *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)AVCustomRoutingController;
  [(AVCustomRoutingController *)&v3 dealloc];
}

- (void)setKnownRouteIPs:(NSArray *)knownRouteIPs
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ([(DADaemonSession *)[(AVCustomRoutingController *)self session] appIsUsingDeviceAccess])
  {

    self->_knownRouteIPs = knownRouteIPs;
    v5 = (void *)[MEMORY[0x263EFF980] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    obj = knownRouteIPs;
    uint64_t v6 = [(NSArray *)knownRouteIPs countByEnumeratingWithState:&v13 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v18 = 0;
          v19 = &v18;
          uint64_t v20 = 0x3052000000;
          v21 = __Block_byref_object_copy_;
          v22 = __Block_byref_object_dispose_;
          v10 = (objc_class *)getDAPartialIPClass_softClass;
          uint64_t v23 = getDAPartialIPClass_softClass;
          if (!getDAPartialIPClass_softClass)
          {
            v17[0] = MEMORY[0x263EF8330];
            v17[1] = 3221225472;
            v17[2] = __getDAPartialIPClass_block_invoke;
            v17[3] = &unk_264259CE8;
            v17[4] = &v18;
            __getDAPartialIPClass_block_invoke((uint64_t)v17);
            v10 = (objc_class *)v19[5];
          }
          _Block_object_dispose(&v18, 8);
          v11 = objc_msgSend([v10 alloc], "initWithAddress:mask:", objc_msgSend(v9, "address"), objc_msgSend(v9, "mask"));
          [v5 addObject:v11];
        }
        uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v13 objects:v24 count:16];
      }
      while (v6);
    }
    objc_msgSend((id)getDADaemonSessionClass(), "setPartialIPsForAppBundleID:partialIPs:error:", -[DADaemonSession bundleID](-[AVCustomRoutingController session](self, "session"), "bundleID"), v5, 0);
  }
}

- (void)setCustomActionItems:(NSArray *)customActionItems
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([(DADaemonSession *)[(AVCustomRoutingController *)self session] appIsUsingDeviceAccess])
  {

    self->_customActionItems = customActionItems;
    v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:@"AVCustomRoutingControllerCustomActionItemsDidChangeNotification" object:self];
  }
  else
  {
    uint64_t v6 = _AVRoutingLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      v8 = "-[AVCustomRoutingController setCustomActionItems:]";
      _os_log_impl(&dword_215723000, v6, OS_LOG_TYPE_DEFAULT, "%s Ignoring custom action items. Only support when app provides discovery extension.", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)handleCustomActionItemSelected:(id)a3
{
  [(AVCustomRoutingController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(AVCustomRoutingController *)self delegate];
    [v5 customRoutingController:self didSelectItem:a3];
  }
}

- (void)invalidateAuthorizationForRoute:(AVCustomDeviceRoute *)route
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = _AVRoutingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[AVCustomRoutingController invalidateAuthorizationForRoute:]";
    __int16 v9 = 2112;
    v10 = route;
    _os_log_impl(&dword_215723000, v5, OS_LOG_TYPE_DEFAULT, "%s invalidateAuthorizationForRoute: %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = objc_alloc_init(AVCustomRoutingEvent);
  [(AVCustomRoutingEvent *)v6 setReason:1];
  [(AVCustomRoutingEvent *)v6 setRoute:route];
  [(AVCustomRoutingEvent *)v6 setSucceeded:1];
  if ([(AVCustomRoutingController *)self isSessionSuspended]) {
    [(AVCustomRoutingController *)self _storeRecordForEvent:v6];
  }
  else {
    [(AVCustomRoutingController *)self _updateSessionForEvent:v6];
  }
}

- (void)setActive:(BOOL)active forRoute:(AVCustomDeviceRoute *)route
{
  BOOL v5 = active;
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([(NSArray *)[(AVCustomRoutingController *)self authorizedRoutes] containsObject:route])
  {
    [(AVCustomRoutingController *)self _setActive:v5 forRoute:route];
    [(AVCustomRoutingController *)self _updateSessionStateToMatchRoute:route];
  }
  else
  {
    int v7 = _AVRoutingLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      __int16 v9 = "-[AVCustomRoutingController setActive:forRoute:]";
      __int16 v10 = 2112;
      uint64_t v11 = route;
      _os_log_impl(&dword_215723000, v7, OS_LOG_TYPE_DEFAULT, "%s Route: %@ not authorized. Ignoring setActive:forRoute:", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)isRouteActive:(AVCustomDeviceRoute *)route
{
  return [(AVCustomDeviceRoute *)route isActive];
}

- (DADaemonSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  [(DADaemonSession *)self->_session invalidate];

  self->_session = (DADaemonSession *)a3;
  if (a3)
  {
    [(AVCustomRoutingController *)self _startSession];
  }
}

- (void)_startSession
{
  -[DADaemonSession setBundleID:](-[AVCustomRoutingController session](self, "session"), "setBundleID:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier"));
  objc_initWeak(&location, self);
  uint64_t v3 = MEMORY[0x263EF8330];
  objc_copyWeak(&v4, &location);
  [(DADaemonSession *)[(AVCustomRoutingController *)self session] setEventHandler:&v3];
  [(DADaemonSession *)[(AVCustomRoutingController *)self session] activate];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __42__AVCustomRoutingController__startSession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id Weak = objc_loadWeak((id *)(a1 + 32));
  if (!Weak) {
    return;
  }
  id v4 = Weak;
  uint64_t v5 = [a2 eventType];
  if (v5 <= 30)
  {
    if (v5 <= 19)
    {
      if (v5)
      {
        if (v5 == 10)
        {
          uint64_t v6 = _AVRoutingLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
            _os_log_impl(&dword_215723000, v6, OS_LOG_TYPE_DEFAULT, "%s DAEventTypeActivated", buf, 0xCu);
          }
          [v4 _resumeSessionUpdates];
          return;
        }
        goto LABEL_46;
      }
      int v7 = _AVRoutingLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
      int v8 = "%s DAEventTypeUnknown";
      goto LABEL_43;
    }
    if (v5 == 20)
    {
      int v7 = _AVRoutingLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
      int v8 = "%s DAEventTypeInvalidated";
      goto LABEL_43;
    }
    if (v5 == 30)
    {
      int v7 = _AVRoutingLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
      int v8 = "%s DAEventTypeSessionStarted";
LABEL_43:
      v17 = v7;
      uint32_t v18 = 12;
      goto LABEL_44;
    }
LABEL_46:
    if ([a2 eventType] == 60)
    {
      v19 = _AVRoutingLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
        _os_log_impl(&dword_215723000, v19, OS_LOG_TYPE_DEFAULT, "%s DAEventTypeXPCInterrupted", buf, 0xCu);
      }
      [v4 _suspendSessionUpdates];
    }
    return;
  }
  if (v5 > 40)
  {
    if (v5 == 41)
    {
      int v7 = _AVRoutingLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
      int v8 = "%s DAEventTypeDeviceLost";
      goto LABEL_43;
    }
    if (v5 != 42) {
      goto LABEL_46;
    }
  }
  else
  {
    if (v5 == 31)
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v13 = (void *)[v4 authorizedRoutes];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v40 != v15) {
              objc_enumerationMutation(v13);
            }
            [v4 _informClientOfEventReason:1 forRoute:*(void *)(*((void *)&v39 + 1) + 8 * i)];
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }
        while (v14);
      }
      return;
    }
    if (v5 != 40) {
      goto LABEL_46;
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  uint64_t v49 = getDAEventDeviceClass_softClass;
  if (!getDAEventDeviceClass_softClass)
  {
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __getDAEventDeviceClass_block_invoke;
    v43[3] = &unk_264259CE8;
    v43[4] = buf;
    __getDAEventDeviceClass_block_invoke((uint64_t)v43);
  }
  _Block_object_dispose(buf, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return;
  }
  __int16 v9 = (void *)[a2 device];
  __int16 v10 = _AVRoutingLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_215723000, v10, OS_LOG_TYPE_DEFAULT, "%s DAEventTypeDeviceChanged/DAEventTypeDeviceFound for device: %@", buf, 0x16u);
  }
  uint64_t v11 = [v4 _routeForDADevice:v9];
  if ([v9 state] == 10)
  {
    if (v11)
    {
      uint64_t v12 = _AVRoutingLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        _os_log_impl(&dword_215723000, v12, OS_LOG_TYPE_DEFAULT, "%s DAEventTypeDeviceChanged --> DADeviceStateActivating: Route %@ authorized. Firing AVCustomRoutingEventReasonReactivate.", buf, 0x16u);
      }
      [v4 _informClientOfEventReason:2 forRoute:v11];
    }
    else
    {
      v22 = objc_alloc_init(AVCustomDeviceRoute);
      [(AVCustomDeviceRoute *)v22 setDevice:v9];
      uint64_t v23 = _AVRoutingLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v22;
        _os_log_impl(&dword_215723000, v23, OS_LOG_TYPE_DEFAULT, "%s DAEventTypeDeviceChanged --> DADeviceStateActivating: Route %@ not authorized. Firing AVCustomRoutingEventReasonActivate.", buf, 0x16u);
      }
      [v4 _informClientOfEventReason:0 forRoute:v22];
    }
    return;
  }
  if ([v9 state] != 30)
  {
    if ([v9 state] != 25)
    {
      v24 = _AVRoutingLog();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t v25 = soft_DADeviceStateToString([v9 state]);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2112;
      v47 = (void (*)(uint64_t, uint64_t))v25;
      int v8 = "%s DAEventTypeDeviceFound / DAEventTypeDeviceChanged for route %@ but state = %@. Ignoring.";
      v17 = v24;
      uint32_t v18 = 32;
LABEL_44:
      _os_log_impl(&dword_215723000, v17, OS_LOG_TYPE_DEFAULT, v8, buf, v18);
      return;
    }
    if (!v11)
    {
      v33 = objc_alloc_init(AVCustomDeviceRoute);
      [(AVCustomDeviceRoute *)v33 setDevice:v9];
      v34 = _AVRoutingLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v33;
        _os_log_impl(&dword_215723000, v34, OS_LOG_TYPE_DEFAULT, "%s DAEventTypeDeviceChanged --> DADeviceStateAuthorized: Route %@ not authorized. Adding to authorized routes.", buf, 0x16u);
      }
      [v4 _addAuthorizedRoute:v33];

      return;
    }
    v21 = _AVRoutingLog();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    int v8 = "%s DAEventTypeDeviceChanged --> DADeviceStateAuthorized: Route %@ authorized. Ignoring.";
LABEL_79:
    v17 = v21;
    uint32_t v18 = 22;
    goto LABEL_44;
  }
  if (v11)
  {
    uint64_t v20 = _AVRoutingLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_215723000, v20, OS_LOG_TYPE_DEFAULT, "%s DAEventTypeDeviceChanged --> DADeviceStateInvalidating: Route %@ authorized. Firing AVCustomRoutingEventReasonDeactivate.", buf, 0x16u);
    }
    [v4 _informClientOfEventReason:1 forRoute:v11];
    return;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v26 = objc_msgSend(v4, "pendingEvents", 0);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (!v27)
  {
LABEL_77:
    v21 = _AVRoutingLog();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = 0;
    int v8 = "%s DAEventTypeDeviceChanged --> DADeviceStateInvalidating: Route %@ not authorized and not pending events. Ignoring.";
    goto LABEL_79;
  }
  uint64_t v28 = *(void *)v36;
LABEL_66:
  uint64_t v29 = 0;
  while (1)
  {
    if (*(void *)v36 != v28) {
      objc_enumerationMutation(v26);
    }
    v30 = *(void **)(*((void *)&v35 + 1) + 8 * v29);
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v30, "route"), "device"), "identifier"), "isEqualToString:", objc_msgSend(v9, "identifier")))break; {
    if (v27 == ++v29)
    }
    {
      uint64_t v27 = [v26 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v27) {
        goto LABEL_66;
      }
      goto LABEL_77;
    }
  }
  if (!v30) {
    goto LABEL_77;
  }
  v31 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", objc_msgSend(v4, "pendingEvents"));
  [v31 removeObject:v30];
  [v4 _setPendingEvents:v31];
  v32 = _AVRoutingLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = 0;
    _os_log_impl(&dword_215723000, v32, OS_LOG_TYPE_DEFAULT, "%s DAEventTypeDeviceChanged --> DADeviceStateInvalidating: Route %@ not authorized but activation event pending. Firing AVCustomRoutingEventReasonDeactivate.", buf, 0x16u);
  }
  objc_msgSend(v4, "_informClientOfEventReason:forRoute:", 1, objc_msgSend(v30, "route"));
}

- (void)_stopSession
{
  self->_session = 0;
}

- (void)_addAuthorizedRoute:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(NSArray *)[(AVCustomRoutingController *)self authorizedRoutes] containsObject:a3])
  {
    uint64_t v5 = _AVRoutingLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      int v8 = "-[AVCustomRoutingController _addAuthorizedRoute:]";
      __int16 v9 = 2112;
      id v10 = a3;
      _os_log_impl(&dword_215723000, v5, OS_LOG_TYPE_DEFAULT, "%s AVVSRC.authorizedRoutes already contains route: %@. Ignoring.", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    uint64_t v6 = [(NSArray *)[(AVCustomRoutingController *)self authorizedRoutes] arrayByAddingObject:a3];
    [(AVCustomRoutingController *)self _setAuthorizedRoutes:v6];
  }
}

- (void)_removeAuthorizedRoute:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[AVCustomRoutingController authorizedRoutes](self, "authorizedRoutes"));
  [v5 removeObject:a3];

  [(AVCustomRoutingController *)self _setAuthorizedRoutes:v5];
}

- (void)_setAuthorizedRoutes:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (![(NSArray *)[(AVCustomRoutingController *)self authorizedRoutes] isEqualToArray:a3])
  {
    uint64_t v5 = _AVRoutingLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      __int16 v9 = "-[AVCustomRoutingController _setAuthorizedRoutes:]";
      __int16 v10 = 2112;
      id v11 = a3;
      _os_log_impl(&dword_215723000, v5, OS_LOG_TYPE_DEFAULT, "%s AVVSRC.authorizedRoutes = %@", (uint8_t *)&v8, 0x16u);
    }

    uint64_t v6 = (NSArray *)a3;
    if (!v6) {
      uint64_t v6 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    }
    self->_authorizedRoutes = v6;
    int v7 = _AVRoutingLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      __int16 v9 = "-[AVCustomRoutingController _setAuthorizedRoutes:]";
      _os_log_impl(&dword_215723000, v7, OS_LOG_TYPE_DEFAULT, "%s Posting AVCustomRoutingControllerAuthorizedRoutesDidChangeNotification.", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"AVCustomRoutingControllerAuthorizedRoutesDidChangeNotification", self);
  }
}

- (void)_setPendingEvents:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = _AVRoutingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[AVCustomRoutingController _setPendingEvents:]";
    __int16 v9 = 2112;
    id v10 = a3;
    _os_log_impl(&dword_215723000, v5, OS_LOG_TYPE_DEFAULT, "%s AVVSRC.pendingEvents = %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = (NSArray *)a3;
  if (!v6) {
    uint64_t v6 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
  }
  self->_pendingEvents = v6;
}

- (void)_informClientOfEventReason:(int64_t)a3 forRoute:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v7 = objc_alloc_init(AVCustomRoutingEvent);
  [(AVCustomRoutingEvent *)v7 setRoute:a4];
  [(AVCustomRoutingEvent *)v7 setReason:a3];
  [(AVCustomRoutingController *)self _setPendingEvents:[(NSArray *)[(AVCustomRoutingController *)self pendingEvents] arrayByAddingObject:v7]];
  int v8 = _AVRoutingLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v13 = "-[AVCustomRoutingController _informClientOfEventReason:forRoute:]";
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl(&dword_215723000, v8, OS_LOG_TYPE_DEFAULT, "%s Informing delegate of route event: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  id v9 = [(AVCustomRoutingController *)self delegate];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__AVCustomRoutingController__informClientOfEventReason_forRoute___block_invoke;
  v10[3] = &unk_264259C48;
  objc_copyWeak(&v11, (id *)buf);
  v10[4] = v7;
  [v9 customRoutingController:self handleEvent:v7 completionHandler:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __65__AVCustomRoutingController__informClientOfEventReason_forRoute___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id Weak = objc_loadWeak((id *)(a1 + 40));
  if (Weak)
  {
    uint64_t v5 = Weak;
    uint64_t v6 = _AVRoutingLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v10 = 136315650;
      id v11 = "-[AVCustomRoutingController _informClientOfEventReason:forRoute:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 1024;
      int v15 = a2;
      _os_log_impl(&dword_215723000, v6, OS_LOG_TYPE_DEFAULT, "%s Route event: %@ completed with success: %d", (uint8_t *)&v10, 0x1Cu);
    }
    [*(id *)(a1 + 32) setSucceeded:a2];
    int v8 = [v5 isSessionSuspended];
    uint64_t v9 = *(void *)(a1 + 32);
    if (v8) {
      [v5 _storeRecordForEvent:v9];
    }
    else {
      [v5 _updateSessionForEvent:v9];
    }
  }
}

- (void)_updateSessionForEvent:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  uint64_t v5 = [a3 reason];
  uint64_t v6 = (void *)[a3 route];
  int v7 = [a3 succeeded];
  if (v5) {
    int v8 = 0;
  }
  else {
    int v8 = v7;
  }
  if (v5) {
    int v9 = 0;
  }
  else {
    int v9 = v7 ^ 1;
  }
  if (v5 == 1) {
    int v10 = v7;
  }
  else {
    int v10 = 0;
  }
  if (v5 == 1) {
    int v11 = v7 ^ 1;
  }
  else {
    int v11 = 0;
  }
  if (v5 == 2) {
    int v12 = v7;
  }
  else {
    int v12 = 0;
  }
  if (v5 == 2) {
    int v13 = v7 ^ 1;
  }
  else {
    int v13 = 0;
  }
  __int16 v14 = _AVRoutingLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316674;
    v32 = "-[AVCustomRoutingController _updateSessionForEvent:]";
    __int16 v33 = 1024;
    *(_DWORD *)v34 = v8;
    *(_WORD *)&v34[4] = 1024;
    *(_DWORD *)&v34[6] = v9;
    __int16 v35 = 1024;
    int v36 = v10;
    __int16 v37 = 1024;
    int v38 = v11;
    __int16 v39 = 1024;
    int v40 = v12;
    __int16 v41 = 1024;
    int v42 = v13;
    _os_log_impl(&dword_215723000, v14, OS_LOG_TYPE_DEFAULT, "%s activateSucceeded: %d, activateFailed: %d, deactivateSucceeded: %d, deactivateFailed: %d, reactivateSucceeded: %d, reactivateFailed: %d", buf, 0x30u);
  }
  int v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[AVCustomRoutingController pendingEvents](self, "pendingEvents"));
  [v15 removeObject:a3];
  [(AVCustomRoutingController *)self _setPendingEvents:v15];
  if ((v8 | v12) == 1)
  {
    uint64_t v16 = _AVRoutingLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v6 device];
      *(_DWORD *)buf = 136315394;
      v32 = "-[AVCustomRoutingController _updateSessionForEvent:]";
      __int16 v33 = 2112;
      *(void *)v34 = v17;
    }
    uint32_t v18 = [(AVCustomRoutingController *)self session];
    uint64_t v19 = [v6 device];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __52__AVCustomRoutingController__updateSessionForEvent___block_invoke;
    v27[3] = &unk_264259C70;
    uint64_t v20 = &v28;
    objc_copyWeak(&v28, &location);
    v27[4] = v6;
    char v29 = v12;
    [(DADaemonSession *)v18 setState:20 device:v19 completionHandler:v27];
LABEL_29:
    objc_destroyWeak(v20);
    goto LABEL_30;
  }
  if ((v9 | v13 | v11 | v10) == 1)
  {
    [(AVCustomRoutingController *)self _removeAuthorizedRoute:v6];
    [(AVCustomRoutingController *)self _setActive:0 forRoute:v6];
    v21 = _AVRoutingLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [v6 device];
      *(_DWORD *)buf = 136315394;
      v32 = "-[AVCustomRoutingController _updateSessionForEvent:]";
      __int16 v33 = 2112;
      *(void *)v34 = v22;
    }
    uint64_t v23 = [(AVCustomRoutingController *)self session];
    uint64_t v24 = [v6 device];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __52__AVCustomRoutingController__updateSessionForEvent___block_invoke_19;
    v25[3] = &unk_264259C98;
    uint64_t v20 = &v26;
    objc_copyWeak(&v26, &location);
    v25[4] = v6;
    [(DADaemonSession *)v23 setState:0 device:v24 completionHandler:v25];
    goto LABEL_29;
  }
LABEL_30:
  objc_destroyWeak(&location);
}

void __52__AVCustomRoutingController__updateSessionForEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id Weak = objc_loadWeak((id *)(a1 + 40));
  if (Weak)
  {
    uint64_t v5 = Weak;
    uint64_t v6 = _AVRoutingLog();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v7)
      {
        uint64_t v8 = [*(id *)(a1 + 32) device];
        int v10 = 136315650;
        int v11 = "-[AVCustomRoutingController _updateSessionForEvent:]_block_invoke";
        __int16 v12 = 2112;
        uint64_t v13 = v8;
        __int16 v14 = 2112;
        uint64_t v15 = a2;
      }
    }
    else
    {
      if (v7)
      {
        uint64_t v9 = [*(id *)(a1 + 32) device];
        int v10 = 136315394;
        int v11 = "-[AVCustomRoutingController _updateSessionForEvent:]_block_invoke";
        __int16 v12 = 2112;
        uint64_t v13 = v9;
      }
      if (!*(unsigned char *)(a1 + 48)) {
        [v5 _addAuthorizedRoute:*(void *)(a1 + 32)];
      }
      [v5 _setActive:1 forRoute:*(void *)(a1 + 32)];
    }
  }
}

void __52__AVCustomRoutingController__updateSessionForEvent___block_invoke_19(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (objc_loadWeak((id *)(a1 + 40)))
  {
    id v4 = _AVRoutingLog();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (!v5) {
        return;
      }
      uint64_t v6 = [*(id *)(a1 + 32) device];
      int v11 = 136315650;
      __int16 v12 = "-[AVCustomRoutingController _updateSessionForEvent:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = a2;
      uint64_t v8 = v4;
      uint32_t v9 = 32;
    }
    else
    {
      if (!v5) {
        return;
      }
      uint64_t v10 = [*(id *)(a1 + 32) device];
      int v11 = 136315394;
      __int16 v12 = "-[AVCustomRoutingController _updateSessionForEvent:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      uint64_t v8 = v4;
      uint32_t v9 = 22;
    }
    _os_log_impl(&dword_215723000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, v9);
  }
}

- (id)_routeForDADevice:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(AVCustomRoutingController *)self authorizedRoutes];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    uint32_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "device"), "identifier"), "isEqualToString:", objc_msgSend(a3, "identifier")))return v9; {
    if (v6 == ++v8)
    }
    {
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)_updateSessionStateToMatchRoute:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (![(AVCustomRoutingController *)self isSessionSuspended])
  {
    if ([a3 isActive]) {
      uint64_t v5 = 20;
    }
    else {
      uint64_t v5 = 25;
    }
    uint64_t v6 = _AVRoutingLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      long long v11 = "-[AVCustomRoutingController _updateSessionStateToMatchRoute:]";
      __int16 v12 = 2112;
      uint64_t v13 = soft_DADeviceStateToString(v5);
      __int16 v14 = 2112;
      id v15 = a3;
      _os_log_impl(&dword_215723000, v6, OS_LOG_TYPE_DEFAULT, "%s Setting DA state: %@ for route: %@.", buf, 0x20u);
    }
    uint64_t v7 = [(AVCustomRoutingController *)self session];
    uint64_t v8 = [a3 device];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61__AVCustomRoutingController__updateSessionStateToMatchRoute___block_invoke;
    v9[3] = &unk_264259CC0;
    v9[4] = a3;
    v9[5] = v5;
    [(DADaemonSession *)v7 setState:v5 device:v8 completionHandler:v9];
  }
}

void __61__AVCustomRoutingController__updateSessionStateToMatchRoute___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = _AVRoutingLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (!v5) {
      return;
    }
    uint64_t v6 = soft_DADeviceStateToString(*(void *)(a1 + 40));
    uint64_t v7 = [*(id *)(a1 + 32) device];
    int v13 = 136315906;
    __int16 v14 = "-[AVCustomRoutingController _updateSessionStateToMatchRoute:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = a2;
    uint64_t v8 = "%s Setting state: %@ for device: %@ failed with error: %@.";
    uint32_t v9 = v4;
    uint32_t v10 = 42;
  }
  else
  {
    if (!v5) {
      return;
    }
    uint64_t v11 = soft_DADeviceStateToString(*(void *)(a1 + 40));
    uint64_t v12 = [*(id *)(a1 + 32) device];
    int v13 = 136315650;
    __int16 v14 = "-[AVCustomRoutingController _updateSessionStateToMatchRoute:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    uint64_t v8 = "%s Setting state: %@ for device: %@ succeeded.";
    uint32_t v9 = v4;
    uint32_t v10 = 32;
  }
  _os_log_impl(&dword_215723000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
}

- (void)_setActive:(BOOL)a3 forRoute:(id)a4
{
  [a4 setActive:a3];
  BOOL v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v5 postNotificationName:@"AVCustomRoutingControllerActiveRoutesDidChangeNotification" object:self];
}

- (void)_suspendSessionUpdates
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = _AVRoutingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[AVCustomRoutingController _suspendSessionUpdates]";
    _os_log_impl(&dword_215723000, v3, OS_LOG_TYPE_DEFAULT, "%s Suspending session updates.", (uint8_t *)&v4, 0xCu);
  }
  [(AVCustomRoutingController *)self setSessionSuspended:1];
}

- (void)_resumeSessionUpdates
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = _AVRoutingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[AVCustomRoutingController _resumeSessionUpdates]";
    _os_log_impl(&dword_215723000, v3, OS_LOG_TYPE_DEFAULT, "%s Resuming session updates.", (uint8_t *)&v4, 0xCu);
  }
  [(AVCustomRoutingController *)self setSessionSuspended:0];
  [(AVCustomRoutingController *)self _updateSessionFromEventRecords];
  [(AVCustomRoutingController *)self _updateSessionToReflectCurrentlyActiveRoutes];
}

- (void)_updateSessionFromEventRecords
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = _AVRoutingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v4 = [(NSArray *)self->_routeEventRecords count];
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = "-[AVCustomRoutingController _updateSessionFromEventRecords]";
    __int16 v22 = 2048;
    NSUInteger v23 = v4;
    _os_log_impl(&dword_215723000, v3, OS_LOG_TYPE_DEFAULT, "%s %lu stored event records.", buf, 0x16u);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  routeEventRecords = self->_routeEventRecords;
  uint64_t v6 = [(NSArray *)routeEventRecords countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v16;
    *(void *)&long long v7 = 136315394;
    long long v14 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(routeEventRecords);
        }
        NSUInteger v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = _AVRoutingLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v14;
          uint64_t v21 = "-[AVCustomRoutingController _updateSessionFromEventRecords]";
          __int16 v22 = 2112;
          NSUInteger v23 = v11;
          _os_log_impl(&dword_215723000, v12, OS_LOG_TYPE_DEFAULT, "%s Updating session from event record: %@", buf, 0x16u);
        }
        -[AVCustomRoutingController _updateSessionForEvent:](self, "_updateSessionForEvent:", v11, v14);
      }
      uint64_t v8 = [(NSArray *)routeEventRecords countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  int v13 = _AVRoutingLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v21 = "-[AVCustomRoutingController _updateSessionFromEventRecords]";
    _os_log_impl(&dword_215723000, v13, OS_LOG_TYPE_DEFAULT, "%s Clearing event records.", buf, 0xCu);
  }

  self->_routeEventRecords = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
}

- (void)_storeRecordForEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v5 = _AVRoutingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[AVCustomRoutingController _storeRecordForEvent:]";
    __int16 v9 = 2112;
    id v10 = a3;
    _os_log_impl(&dword_215723000, v5, OS_LOG_TYPE_DEFAULT, "%s Storing event record: %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = [(NSArray *)self->_routeEventRecords arrayByAddingObject:a3];

  self->_routeEventRecords = v6;
}

- (void)_updateSessionToReflectCurrentlyActiveRoutes
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(AVCustomRoutingController *)self authorizedRoutes];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(AVCustomRoutingController *)self _updateSessionStateToMatchRoute:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
}

- (NSArray)authorizedRoutes
{
  return self->_authorizedRoutes;
}

- (NSArray)knownRouteIPs
{
  return self->_knownRouteIPs;
}

- (NSArray)customActionItems
{
  return self->_customActionItems;
}

- (BOOL)isSessionSuspended
{
  return self->_sessionSuspended;
}

- (void)setSessionSuspended:(BOOL)a3
{
  self->_sessionSuspended = a3;
}

- (NSArray)pendingEvents
{
  return self->_pendingEvents;
}

- (void).cxx_destruct
{
}

@end