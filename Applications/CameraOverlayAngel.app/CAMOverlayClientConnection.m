@interface CAMOverlayClientConnection
- (BOOL)focusLocked;
- (BOOL)overlayVisible;
- (BOOL)quietUIActive;
- (BSAuditToken)auditToken;
- (BSServiceConnectionHost)_connection;
- (CAMOverlayClientConnection)initWithBoardServiceConnection:(id)a3 queue:(id)a4;
- (CAMOverlayClientInterface)_clientProxy;
- (NSArray)controls;
- (NSDictionary)controlsByID;
- (NSHashTable)_registeredObservers;
- (NSMutableDictionary)_updatesByID;
- (NSString)description;
- (OS_dispatch_queue)_connectionQueue;
- (id)_loggingHeader;
- (unint64_t)_debugID;
- (unint64_t)status;
- (void)_enumerateObserversWithBlock:(id)a3;
- (void)_handleConnectionDidActivate:(id)a3;
- (void)_handleConnectionDidInterrupt:(id)a3;
- (void)_handleConnectionDidInvalidate:(id)a3;
- (void)_setClientProxy:(id)a3;
- (void)_setControls:(id)a3;
- (void)_setControlsByID:(id)a3;
- (void)_setStatus:(unint64_t)a3;
- (void)_setUpdatesByID:(id)a3;
- (void)_updateStatusWithReason:(unint64_t)a3;
- (void)addObserver:(id)a3;
- (void)applyControlUpdate:(id)a3;
- (void)clientDidConfigureControls:(id)a3 initialUpdates:(id)a4 reply:(id)a5;
- (void)clientDidUpdateControl:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)sendActiveControlIdentifier:(id)a3;
- (void)sendOverlayVisibility:(BOOL)a3 activeControlIdentifier:(id)a4;
- (void)setFocusLocked:(BOOL)a3;
- (void)setQuietUIActive:(BOOL)a3;
- (void)set_connection:(id)a3;
- (void)set_registeredObservers:(id)a3;
@end

@implementation CAMOverlayClientConnection

- (CAMOverlayClientConnection)initWithBoardServiceConnection:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CAMOverlayClientConnection;
  v9 = [(CAMOverlayClientConnection *)&v27 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->__connectionQueue, a4);
    uint64_t v11 = +[NSHashTable hashTableWithOptions:517];
    registeredObservers = v10->__registeredObservers;
    v10->__registeredObservers = (NSHashTable *)v11;

    uint64_t v13 = [v7 remoteToken];
    auditToken = v10->_auditToken;
    v10->_auditToken = (BSAuditToken *)v13;

    v10->__debugID = ++qword_100023540;
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_100007A44;
    v24 = &unk_10001CA18;
    id v25 = v8;
    v15 = v10;
    v26 = v15;
    [v7 configureConnection:&v21];
    v16 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v15 _loggingHeader:v21, v22, v23, v24, v25];
      v18 = [v7 userInfo];
      unsigned int v19 = [(BSAuditToken *)v10->_auditToken pid];
      *(_DWORD *)buf = 138543874;
      v29 = v17;
      __int16 v30 = 2114;
      v31 = v18;
      __int16 v32 = 1024;
      unsigned int v33 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Activating connection from %{public}@:%d", buf, 0x1Cu);
    }
    [v7 activate];
    objc_storeStrong(v15 + 8, a3);
  }
  return v10;
}

- (void)dealloc
{
  [(BSServiceConnectionHost *)self->__connection invalidate];
  connection = self->__connection;
  self->__connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)CAMOverlayClientConnection;
  [(CAMOverlayClientConnection *)&v4 dealloc];
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(CAMOverlayClientConnection *)self _debugID];
  v5 = [(CAMOverlayClientConnection *)self auditToken];
  id v6 = [v5 pid];
  unint64_t v7 = [(CAMOverlayClientConnection *)self status];
  if (v7 > 2) {
    id v8 = 0;
  }
  else {
    id v8 = off_10001CB78[v7];
  }
  v9 = [(CAMOverlayClientConnection *)self updatesByID];
  v10 = [v9 allKeys];
  uint64_t v11 = [v10 componentsJoinedByString:@","];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ ID: [%lu]; pid: %d; status: %@; value IDs: %@>",
    v3,
    v4,
    v6,
    v8,
  v12 = v11);

  return (NSString *)v12;
}

- (id)_loggingHeader
{
  return +[NSString stringWithFormat:@"ClientConnection (ID:%lu)", [(CAMOverlayClientConnection *)self _debugID]];
}

- (void)_updateStatusWithReason:(unint64_t)a3
{
  v5 = [(CAMOverlayClientConnection *)self _connection];

  if (v5)
  {
    id v6 = [(CAMOverlayClientConnection *)self _clientProxy];

    uint64_t v7 = v6 != 0;
  }
  else
  {
    uint64_t v7 = 2;
  }
  if (v7 != [(CAMOverlayClientConnection *)self status])
  {
    id v8 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(CAMOverlayClientConnection *)self _loggingHeader];
      v10 = (void *)v9;
      uint64_t v11 = off_10001CB78[v7];
      if (a3 > 2) {
        v12 = 0;
      }
      else {
        v12 = off_10001CB90[a3];
      }
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      v17 = v11;
      __int16 v18 = 2114;
      unsigned int v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Status became %{public}@ for reason %{public}@", buf, 0x20u);
    }
    [(CAMOverlayClientConnection *)self _setStatus:v7];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000080D4;
    v13[3] = &unk_10001CA40;
    v13[4] = self;
    v13[5] = v7;
    [(CAMOverlayClientConnection *)self _enumerateObserversWithBlock:v13];
  }
}

- (void)invalidate
{
  uint64_t v3 = [(CAMOverlayClientConnection *)self _connection];
  [v3 invalidate];

  [(CAMOverlayClientConnection *)self set_connection:0];
  [(CAMOverlayClientConnection *)self _setClientProxy:0];

  [(CAMOverlayClientConnection *)self _updateStatusWithReason:1];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMOverlayClientConnection *)self _registeredObservers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMOverlayClientConnection *)self _registeredObservers];
  [v5 removeObject:v4];
}

- (void)_enumerateObserversWithBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = [(CAMOverlayClientConnection *)self _registeredObservers];
  id v6 = [v5 copy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * (void)v11));
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_handleConnectionDidActivate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000083C8;
  v4[3] = &unk_10001CA68;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)_handleConnectionDidInterrupt:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008494;
  block[3] = &unk_10001CA90;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_handleConnectionDidInvalidate:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000854C;
  block[3] = &unk_10001CA90;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)applyControlUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 controlIdentifier];
  id v6 = [(CAMOverlayClientConnection *)self controlsByID];
  id v7 = [v6 objectForKeyedSubscript:v5];

  id v8 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(CAMOverlayClientConnection *)self _loggingHeader];
    uint64_t v10 = [v4 debugDescription];
    int v13 = 138543874;
    long long v14 = v9;
    __int16 v15 = 2114;
    __int16 v16 = v10;
    __int16 v17 = 2114;
    __int16 v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending value %{public}@ for ID %{public}@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v11 = [(CAMOverlayClientConnection *)self _updatesByID];
  [v11 setObject:v4 forKeyedSubscript:v5];

  long long v12 = [(CAMOverlayClientConnection *)self _clientProxy];
  [v12 serverDidUpdateControl:v4];
}

- (void)sendOverlayVisibility:(BOOL)a3 activeControlIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_overlayVisible != v4)
  {
    self->_overlayVisible = v4;
    id v7 = [(CAMOverlayClientConnection *)self controlsByID];
    id v8 = [v7 objectForKeyedSubscript:v6];

    if (!v8)
    {
      id v9 = os_log_create("com.apple.camera.overlay", "Angel");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100013BFC(self);
      }

      id v6 = 0;
    }
    uint64_t v10 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(CAMOverlayClientConnection *)self _loggingHeader];
      CFStringRef v12 = @"NO";
      int v15 = 138543874;
      __int16 v16 = v11;
      __int16 v17 = 2114;
      if (v4) {
        CFStringRef v12 = @"YES";
      }
      CFStringRef v18 = v12;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending visibility: %{public}@ for control ID %{public}@", (uint8_t *)&v15, 0x20u);
    }
    int v13 = [(CAMOverlayClientConnection *)self _clientProxy];
    long long v14 = +[NSNumber numberWithBool:v4];
    [v13 serverDidChangeOverlayVisible:v14 activeControlIdentifier:v6];
  }
}

- (void)sendActiveControlIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CAMOverlayClientConnection *)self _loggingHeader];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending active control ID %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(CAMOverlayClientConnection *)self _clientProxy];
  [v7 serverDidChangeActiveControlIdentifier:v4];
}

- (void)setQuietUIActive:(BOOL)a3
{
  if (self->_quietUIActive != a3)
  {
    BOOL v3 = a3;
    self->_quietUIActive = a3;
    id v5 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(CAMOverlayClientConnection *)self _loggingHeader];
      id v7 = (void *)v6;
      CFStringRef v8 = @"NO";
      if (v3) {
        CFStringRef v8 = @"YES";
      }
      int v11 = 138543618;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      CFStringRef v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending interfaceReduced: %{public}@", (uint8_t *)&v11, 0x16u);
    }
    id v9 = [(CAMOverlayClientConnection *)self _clientProxy];
    __int16 v10 = +[NSNumber numberWithBool:v3];
    [v9 didChangeInterfaceReduced:v10];
  }
}

- (void)setFocusLocked:(BOOL)a3
{
  if (self->_focusLocked != a3)
  {
    BOOL v3 = a3;
    self->_focusLocked = a3;
    id v5 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(CAMOverlayClientConnection *)self _loggingHeader];
      id v7 = (void *)v6;
      CFStringRef v8 = @"NO";
      if (v3) {
        CFStringRef v8 = @"YES";
      }
      int v11 = 138543618;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      CFStringRef v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending focusLocked: %{public}@", (uint8_t *)&v11, 0x16u);
    }
    id v9 = [(CAMOverlayClientConnection *)self _clientProxy];
    __int16 v10 = +[NSNumber numberWithBool:v3];
    [v9 serverDidChangeFocusLocked:v10];
  }
}

- (void)clientDidConfigureControls:(id)a3 initialUpdates:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v70 = (void (**)(id, void *))a5;
  v82 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v8 count]);
  v81 = +[NSMutableSet set];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v95 objects:v104 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v96;
    do
    {
      __int16 v13 = 0;
      do
      {
        if (*(void *)v96 != v12) {
          objc_enumerationMutation(v9);
        }
        CFStringRef v14 = *(void **)(*((void *)&v95 + 1) + 8 * (void)v13);
        if ([v14 isValueUpdate])
        {
          int v15 = [v14 controlIdentifier];
          [v82 setObject:v14 forKeyedSubscript:v15];
LABEL_8:

          goto LABEL_11;
        }
        if ([v14 valueType] == (id)5 && (objc_msgSend(v14, "isEnabled") & 1) == 0)
        {
          int v15 = [v14 controlIdentifier];
          [v81 addObject:v15];
          goto LABEL_8;
        }
LABEL_11:
        __int16 v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v16 = [v9 countByEnumeratingWithState:&v95 objects:v104 count:16];
      id v11 = v16;
    }
    while (v16);
  }
  v72 = v9;

  v80 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id obj = v7;
  id v17 = [obj countByEnumeratingWithState:&v91 objects:v103 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v92;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v92 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        uint64_t v22 = [v21 identifier];
        unsigned int v23 = [v81 containsObject:v22];
        v24 = [v82 objectForKeyedSubscript:v22];
        uint64_t v25 = [v24 debugDescription];
        v26 = (void *)v25;
        CFStringRef v27 = &stru_10001D308;
        if (v23) {
          CFStringRef v27 = @" [disabled]";
        }
        v28 = +[NSString stringWithFormat:@"\n\t%@ [%@]%@", v21, v25, v27];
        [v80 addObject:v28];
      }
      id v18 = [obj countByEnumeratingWithState:&v91 objects:v103 count:16];
    }
    while (v18);
  }

  v29 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v30 = [(CAMOverlayClientConnection *)self _loggingHeader];
    v31 = [v80 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v30;
    __int16 v101 = 2114;
    v102 = v31;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Received controls: (%{public}@\n)", buf, 0x16u);
  }
  v75 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [obj count]);
  v74 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [obj count]);
  v73 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v72 count]);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v76 = obj;
  id v32 = [v76 countByEnumeratingWithState:&v87 objects:v99 count:16];
  if (!v32)
  {
    v34 = 0;
    goto LABEL_63;
  }
  id v33 = v32;
  v34 = 0;
  id obja = *(id *)v88;
  uint64_t v77 = CAMOverlayErrorDomain;
  do
  {
    for (j = 0; j != v33; j = (char *)j + 1)
    {
      if (*(id *)v88 != obja) {
        objc_enumerationMutation(v76);
      }
      v36 = *(void **)(*((void *)&v87 + 1) + 8 * (void)j);
      v37 = +[CAMOverlayServiceControlHelpers interpretControl:v36];
      v38 = [v37 identifier];
      v39 = [v82 objectForKeyedSubscript:v38];
      if (!v39)
      {
        NSErrorUserInfoKey v105 = NSDebugDescriptionErrorKey;
        *(void *)buf = @"MissingValue";
        v46 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v105 count:1];
        v47 = +[NSError errorWithDomain:v77 code:-10 userInfo:v46];

        if (v47)
        {
          NSErrorUserInfoKey v105 = NSDebugDescriptionErrorKey;
          *(void *)buf = @"MissingValue";
          v48 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v105 count:1];
          v49 = +[NSError errorWithDomain:v77 code:-10 userInfo:v48];

          if ([v49 code] != (id)-13)
          {

LABEL_53:
            v54 = os_log_create("com.apple.camera.overlay", "Angel");
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              NSErrorUserInfoKey v105 = NSDebugDescriptionErrorKey;
              *(void *)buf = @"MissingValue";
              v57 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v105 count:1];
              v58 = +[NSError errorWithDomain:v77 code:-10 userInfo:v57];

              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v36;
              __int16 v101 = 2114;
              v102 = v58;
              _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Rejecting control %{public}@: %{public}@", buf, 0x16u);
            }
            if (!v34)
            {
              v34 = +[NSMutableArray array];
            }
            NSErrorUserInfoKey v105 = NSDebugDescriptionErrorKey;
            *(void *)buf = @"MissingValue";
            v55 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v105 count:1];
            v53 = +[NSError errorWithDomain:v77 code:-10 userInfo:v55];

LABEL_58:
            [v34 addObject:v53];

            goto LABEL_59;
          }
          id v50 = [v36 controlType];

          if (v50) {
            goto LABEL_53;
          }
          v51 = os_log_create("com.apple.camera.overlay", "Angel");
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            NSErrorUserInfoKey v105 = NSDebugDescriptionErrorKey;
            *(void *)buf = @"MissingValue";
            v60 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v105 count:1];
            v61 = +[NSError errorWithDomain:v77 code:-10 userInfo:v60];

            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v36;
            __int16 v101 = 2114;
            v102 = v61;
            _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Ignoring update validation error for control %{public}@: %{public}@", buf, 0x16u);
          }
        }
      }
      v40 = [v37 validateUpdate:v39];

      if (!v40) {
        goto LABEL_38;
      }
      v41 = [v37 validateUpdate:v39];
      if ([v41 code] != (id)-13)
      {

LABEL_47:
        v52 = os_log_create("com.apple.camera.overlay", "Angel");
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          v56 = [v37 validateUpdate:v39];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v36;
          __int16 v101 = 2114;
          v102 = v56;
          _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Rejecting control %{public}@: %{public}@", buf, 0x16u);
        }
        if (!v34)
        {
          v34 = +[NSMutableArray array];
        }
        v53 = [v37 validateUpdate:v39];
        goto LABEL_58;
      }
      id v42 = [v36 controlType];

      if (v42) {
        goto LABEL_47;
      }
      v43 = os_log_create("com.apple.camera.overlay", "Angel");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v59 = [v37 validateUpdate:v39];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v36;
        __int16 v101 = 2114;
        v102 = v59;
        _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Ignoring update validation error for control %{public}@: %{public}@", buf, 0x16u);
      }
LABEL_38:
      [v75 addObject:v37];
      [v74 setObject:v37 forKeyedSubscript:v38];
      [v73 setObject:v39 forKeyedSubscript:v38];
      v44 = [v37 identifier];
      unsigned int v45 = [v81 containsObject:v44];

      if (v45) {
        [v37 setEnabled:0];
      }
LABEL_59:
    }
    id v33 = [v76 countByEnumeratingWithState:&v87 objects:v99 count:16];
  }
  while (v33);
LABEL_63:

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009850;
  block[3] = &unk_10001CAE0;
  block[4] = self;
  id v62 = v75;
  id v84 = v62;
  id v63 = v74;
  id v85 = v63;
  id v64 = v73;
  id v86 = v64;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  id v65 = v34;
  if ([v65 count] == (id)1)
  {
    v66 = [v65 firstObject];
  }
  else
  {
    id v67 = [v65 count];

    if ((unint64_t)v67 < 2)
    {
      v66 = 0;
    }
    else
    {
      uint64_t v68 = CAMOverlayErrorDomain;
      NSErrorUserInfoKey v105 = NSDebugDescriptionErrorKey;
      *(void *)buf = @"MultipleErrors";
      v69 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v105 count:1];
      v66 = +[NSError errorWithDomain:v68 code:-1000 userInfo:v69];
    }
  }
  v70[2](v70, v66);
}

- (void)clientDidUpdateControl:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 controlIdentifier];
  id v9 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(CAMOverlayClientConnection *)self _loggingHeader];
    id v11 = [v6 debugDescription];
    *(_DWORD *)buf = 138543874;
    id v20 = v10;
    __int16 v21 = 2114;
    uint64_t v22 = v11;
    __int16 v23 = 2114;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Received value %{public}@ for ID %{public}@", buf, 0x20u);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100009AB8;
  v15[3] = &unk_10001CB58;
  v15[4] = self;
  id v16 = v8;
  id v17 = v6;
  id v18 = v7;
  id v12 = v7;
  id v13 = v6;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)_setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (BOOL)overlayVisible
{
  return self->_overlayVisible;
}

- (BOOL)quietUIActive
{
  return self->_quietUIActive;
}

- (BOOL)focusLocked
{
  return self->_focusLocked;
}

- (NSDictionary)controlsByID
{
  return self->_controlsByID;
}

- (void)_setControlsByID:(id)a3
{
}

- (NSArray)controls
{
  return self->_controls;
}

- (void)_setControls:(id)a3
{
}

- (NSMutableDictionary)_updatesByID
{
  return self->__updatesByID;
}

- (void)_setUpdatesByID:(id)a3
{
}

- (OS_dispatch_queue)_connectionQueue
{
  return self->__connectionQueue;
}

- (BSServiceConnectionHost)_connection
{
  return self->__connection;
}

- (void)set_connection:(id)a3
{
}

- (CAMOverlayClientInterface)_clientProxy
{
  return self->__clientProxy;
}

- (void)_setClientProxy:(id)a3
{
}

- (NSHashTable)_registeredObservers
{
  return self->__registeredObservers;
}

- (void)set_registeredObservers:(id)a3
{
}

- (unint64_t)_debugID
{
  return self->__debugID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__registeredObservers, 0);
  objc_storeStrong((id *)&self->__clientProxy, 0);
  objc_storeStrong((id *)&self->__connection, 0);
  objc_storeStrong((id *)&self->__connectionQueue, 0);
  objc_storeStrong((id *)&self->__updatesByID, 0);
  objc_storeStrong((id *)&self->_controls, 0);
  objc_storeStrong((id *)&self->_controlsByID, 0);

  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end