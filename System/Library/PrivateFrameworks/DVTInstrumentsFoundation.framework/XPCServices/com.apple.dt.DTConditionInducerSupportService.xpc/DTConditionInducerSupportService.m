@interface DTConditionInducerSupportService
- (BOOL)_disableConditionInducerWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_enableConditionInducerWithIdentifier:(id)a3 profileIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_stopActiveConditionInducerWithError:(id *)a3;
- (COConditionSession)activeConditionSession;
- (DTConditionInducerSupportService)initWithConnection:(id)a3;
- (NSXPCConnection)connection;
- (OS_os_transaction)keepAliveTransaction;
- (id)_availableConditionInducersWithError:(id *)a3;
- (id)_dictRepresentingConditionWithIdentifier:(id)a3 activeProfileIdentifier:(id)a4 configuration:(id)a5;
- (void)_activeConditionEnded;
- (void)_endTransaction:(id)a3;
- (void)_userStoppedActiveConditions;
- (void)_userTearingDownActiveConditions;
- (void)dealloc;
- (void)disableActiveConditionInducerWithReply:(id)a3;
- (void)disableConditionInducerWithIdentifier:(id)a3 reply:(id)a4;
- (void)enableConditionInducerWithIdentifier:(id)a3 profileIdentifier:(id)a4 reply:(id)a5;
- (void)listAvailableConditionInducersWithReply:(id)a3;
- (void)setActiveConditionSession:(id)a3;
- (void)setConnection:(id)a3;
- (void)setKeepAliveTransaction:(id)a3;
@end

@implementation DTConditionInducerSupportService

- (DTConditionInducerSupportService)initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DTConditionInducerSupportService;
  v5 = [(DTConditionInducerSupportService *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_connection, v4);
  }

  return v6;
}

- (void)dealloc
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v3 = objc_opt_class();
    id v4 = v3;
    v5 = [(DTConditionInducerSupportService *)self activeConditionSession];
    *(_DWORD *)buf = 138412546;
    v9 = v3;
    __int16 v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@: connection going away, stopping condition: %@", buf, 0x16u);
  }
  v6 = [(DTConditionInducerSupportService *)self activeConditionSession];
  [v6 stopConditionWithCallback:0];

  [(DTConditionInducerSupportService *)self setKeepAliveTransaction:0];
  v7.receiver = self;
  v7.super_class = (Class)DTConditionInducerSupportService;
  [(DTConditionInducerSupportService *)&v7 dealloc];
}

- (void)listAvailableConditionInducersWithReply:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  id v12 = 0;
  v5 = [(DTConditionInducerSupportService *)self _availableConditionInducersWithError:&v12];
  id v6 = v12;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    objc_super v7 = objc_opt_class();
    id v8 = v7;
    id v9 = [v5 count];
    *(_DWORD *)buf = 138412546;
    v14 = v7;
    __int16 v15 = 2048;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@: Found %lu available condition inducers", buf, 0x16u);
  }
  if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    __int16 v10 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v14 = v10;
    __int16 v15 = 2112;
    id v16 = v6;
    id v11 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%@: Failed to list available condition inducers with error: %@", buf, 0x16u);
  }
  if (v4) {
    v4[2](v4, v5, v6);
  }
}

- (void)enableConditionInducerWithIdentifier:(id)a3 profileIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(id, BOOL, id))a5;
  id v17 = 0;
  BOOL v11 = [(DTConditionInducerSupportService *)self _enableConditionInducerWithIdentifier:v8 profileIdentifier:v9 error:&v17];
  id v12 = v17;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v13 = objc_opt_class();
    *(_DWORD *)buf = 138413058;
    v19 = v13;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 1024;
    LODWORD(v25) = v11;
    id v14 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@: Enable condition inducer %@ / %@ success=%d", buf, 0x26u);
  }
  if (v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    __int16 v15 = objc_opt_class();
    *(_DWORD *)buf = 138413058;
    v19 = v15;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v12;
    id v16 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%@: failed to enable %@ / %@ with error: %@", buf, 0x2Au);
  }
  if (v10) {
    v10[2](v10, v11, v12);
  }
}

- (void)disableConditionInducerWithIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(id, BOOL, id))a4;
  id v14 = 0;
  BOOL v8 = [(DTConditionInducerSupportService *)self _disableConditionInducerWithIdentifier:v6 error:&v14];
  id v9 = v14;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    __int16 v10 = objc_opt_class();
    *(_DWORD *)buf = 138412802;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 1024;
    LODWORD(v20) = v8;
    id v11 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@: Disable condition inducer %@ success=%d", buf, 0x1Cu);
  }
  if (v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    id v12 = objc_opt_class();
    *(_DWORD *)buf = 138412802;
    id v16 = v12;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v9;
    id v13 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%@: failed to disable %@ with error: %@", buf, 0x20u);
  }
  if (v7) {
    v7[2](v7, v8, v9);
  }
}

- (void)disableActiveConditionInducerWithReply:(id)a3
{
  id v4 = (void (**)(id, BOOL, id))a3;
  id v11 = 0;
  BOOL v5 = [(DTConditionInducerSupportService *)self _stopActiveConditionInducerWithError:&v11];
  id v6 = v11;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    objc_super v7 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    id v13 = v7;
    __int16 v14 = 1024;
    LODWORD(v15) = v5;
    id v8 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@: Disable active condition inducer success=%d", buf, 0x12u);
  }
  if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    id v9 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v6;
    id v10 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%@: failed to disable active condition with error: %@", buf, 0x16u);
  }
  if (v4) {
    v4[2](v4, v5, v6);
  }
}

- (id)_availableConditionInducersWithError:(id *)a3
{
  id v30 = +[NSMutableArray array];
  id v4 = +[COConditionSession listAvailableConditions];
  v31 = +[COConditionSession getActiveConditions];
  v32 = self;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    BOOL v5 = objc_opt_class();
    id v6 = v5;
    objc_super v7 = [v31 debugDescription];
    *(_DWORD *)buf = 138412546;
    v41 = v5;
    __int16 v42 = 2112;
    v43 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@: activeConditions = %@", buf, 0x16u);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v4;
  id v8 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v36;
    uint64_t v11 = kCOConditionIdentifierName;
    uint64_t v34 = kCOConditionBundlePath;
    uint64_t v29 = kCOConditionCacheClassName;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          __int16 v14 = objc_opt_class();
          id v15 = v14;
          id v16 = [v13 debugDescription];
          *(_DWORD *)buf = 138412546;
          v41 = v14;
          __int16 v42 = 2112;
          v43 = v16;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@: condition configuration: %@", buf, 0x16u);
        }
        __int16 v17 = [v13 objectForKeyedSubscript:v11];
        if (v17)
        {
          id v18 = [v13 objectForKeyedSubscript:v34];
          if (v18)
          {
            __int16 v19 = [v31 objectForKeyedSubscript:v18];
            id v20 = [v19 objectForKeyedSubscript:v29];

            id v21 = [(DTConditionInducerSupportService *)v32 _dictRepresentingConditionWithIdentifier:v17 activeProfileIdentifier:v20 configuration:v13];
            [v30 addObject:v21];
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            id v25 = objc_opt_class();
            id v26 = v25;
            v27 = [v13 debugDescription];
            *(_DWORD *)buf = 138412546;
            v41 = v25;
            __int16 v42 = 2112;
            v43 = v27;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%@: condition configuration is missing path: %@", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          __int16 v22 = objc_opt_class();
          id v23 = v22;
          __int16 v24 = [v13 debugDescription];
          *(_DWORD *)buf = 138412546;
          v41 = v22;
          __int16 v42 = 2112;
          v43 = v24;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%@: condition configuration is missing identifier: %@", buf, 0x16u);
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v9);
  }

  return v30;
}

- (id)_dictRepresentingConditionWithIdentifier:(id)a3 activeProfileIdentifier:(id)a4 configuration:(id)a5
{
  id v36 = a3;
  long long v35 = (__CFString *)a4;
  id v7 = a5;
  long long v37 = +[NSMutableArray array];
  uint64_t v34 = v7;
  [v7 objectForKeyedSubscript:kCOConditionBundleArray];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
  uint64_t v9 = kCOConditionUserFriendlyName;
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v40;
    uint64_t v12 = kCOConditionIdentifierName;
    uint64_t v13 = kCOConditionDescription;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v16 = [v15 objectForKeyedSubscript:v12];
        __int16 v17 = [v15 objectForKeyedSubscript:v9];
        if ([v16 length] && [v17 length])
        {
          id v18 = [v15 objectForKeyedSubscript:v13];
          v45[0] = @"identifier";
          v45[1] = @"name";
          v46[0] = v16;
          v46[1] = v17;
          v45[2] = @"description";
          v46[2] = v18;
          __int16 v19 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];
          [v37 addObject:v19];
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v10);
  }
  uint64_t v20 = [v34 objectForKeyedSubscript:v9];
  id v21 = (void *)v20;
  if (v20) {
    __int16 v22 = (void *)v20;
  }
  else {
    __int16 v22 = v36;
  }
  id v23 = v22;

  __int16 v24 = [v34 objectForKeyedSubscript:kCOConditionIsDestructive];
  id v25 = [v24 BOOLValue];

  id v26 = [v34 objectForKeyedSubscript:kCOConditionIsInternal];
  id v27 = [v26 BOOLValue];

  v43[0] = @"identifier";
  v43[1] = @"name";
  v44[0] = v36;
  v44[1] = v23;
  v44[2] = v37;
  v43[2] = @"profiles";
  v43[3] = @"isDestructive";
  v28 = +[NSNumber numberWithBool:v25];
  v44[3] = v28;
  v43[4] = @"isInternal";
  uint64_t v29 = +[NSNumber numberWithBool:v27];
  v44[4] = v29;
  v43[5] = @"isActive";
  if (v35) {
    CFStringRef v30 = v35;
  }
  else {
    CFStringRef v30 = &stru_100008418;
  }
  v31 = +[NSNumber numberWithBool:v35 != 0];
  v44[5] = v31;
  v44[6] = v30;
  v43[6] = @"activeProfile";
  v43[7] = @"profilesSorted";
  v44[7] = &__kCFBooleanTrue;
  v32 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:8];

  return v32;
}

- (BOOL)_enableConditionInducerWithIdentifier:(id)a3 profileIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(DTConditionInducerSupportService *)self activeConditionSession];

  if (v10)
  {
    uint64_t v11 = [(DTConditionInducerSupportService *)self activeConditionSession];
    unsigned int v12 = [v11 hasActiveCondition];

    if (v12)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = objc_opt_class();
        id v14 = v13;
        id v15 = [(DTConditionInducerSupportService *)self activeConditionSession];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%@: cannot enable inducer as a condition is already active: %@", buf, 0x16u);
      }
      if (a5)
      {
        NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
        CFStringRef v56 = @"A condition is already active.";
        id v16 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        *a5 = +[NSError errorWithDomain:@"DTConditionInducerSupportService" code:3 userInfo:v16];
      }
      LOBYTE(v17) = 0;
      goto LABEL_22;
    }
    [(DTConditionInducerSupportService *)self setActiveConditionSession:0];
    [(DTConditionInducerSupportService *)self setKeepAliveTransaction:0];
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v52 = sub_100005A98;
  v53 = sub_100005AA8;
  id v54 = 0;
  id v18 = [objc_alloc((Class)COConditionSession) initWithConditionIdentifier:v8 profile:v9];
  objc_initWeak(&location, self);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100005AB0;
  v41[3] = &unk_100008260;
  v41[4] = buf;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100005AC0;
  v39[3] = &unk_100008288;
  objc_copyWeak(&v40, &location);
  uint64_t v34 = _NSConcreteStackBlock;
  uint64_t v35 = 3221225472;
  id v36 = sub_100005B00;
  long long v37 = &unk_1000082B0;
  objc_copyWeak(&v38, &location);
  unsigned int v17 = [v18 startConditionWithCallback:v41 teardownStartedCallback:v39 teardownFinishedCallback:&v34];
  if (v17)
  {
    id v19 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = objc_opt_class();
      *(_DWORD *)v43 = 138412546;
      id v44 = v20;
      __int16 v45 = 2112;
      id v46 = v18;
      id v21 = v20;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@: condition enabled successfully: %@", v43, 0x16u);
    }
    [(DTConditionInducerSupportService *)self setActiveConditionSession:v18];
    id v22 = +[NSString stringWithFormat:@"com.apple.dt.DTConditionInducerSupportService.%@.%@", v8, v9, v34, v35, v36, v37];
    [v22 cStringUsingEncoding:4];
    id v23 = (void *)os_transaction_create();
    [(DTConditionInducerSupportService *)self setKeepAliveTransaction:v23];

    id v24 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      id v25 = (id)objc_opt_class();
      id v26 = [(DTConditionInducerSupportService *)self keepAliveTransaction];
      *(_DWORD *)v43 = 138412546;
      id v44 = v25;
      __int16 v45 = 2112;
      id v46 = v26;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@: transaction created: %@", v43, 0x16u);
    }
  }
  else
  {
    if (!*(void *)(*(void *)&buf[8] + 40))
    {
      NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
      CFStringRef v50 = @"There was a problem enabling the condition inducer.";
      id v27 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      uint64_t v28 = +[NSError errorWithDomain:@"DTConditionInducerSupportService" code:3 userInfo:v27];
      uint64_t v29 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v28;
    }
    id v22 = &_os_log_default;
    id v30 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v31 = (id)objc_opt_class();
      v32 = [*(id *)(*(void *)&buf[8] + 40) localizedDescription];
      *(_DWORD *)v43 = 138412802;
      id v44 = v31;
      __int16 v45 = 2112;
      id v46 = v18;
      __int16 v47 = 2112;
      v48 = v32;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%@: failed to enable %@ with error: %@", v43, 0x20u);

      id v22 = &_os_log_default;
    }
  }

  if (a5) {
    *a5 = *(id *)(*(void *)&buf[8] + 40);
  }
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
LABEL_22:

  return v17;
}

- (void)_userTearingDownActiveConditions
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v3 = objc_opt_class();
    id v4 = v3;
    BOOL v5 = [(DTConditionInducerSupportService *)self activeConditionSession];
    int v8 = 138412546;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%@: user requested tear down of active condition session: %@", (uint8_t *)&v8, 0x16u);
  }
  id v6 = [(DTConditionInducerSupportService *)self connection];
  id v7 = [v6 remoteObjectProxy];

  [v7 activeConditionsWillStop];
}

- (void)_userStoppedActiveConditions
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v3 = objc_opt_class();
    id v4 = v3;
    BOOL v5 = [(DTConditionInducerSupportService *)self activeConditionSession];
    int v8 = 138412546;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%@: user stopped active condition session: %@", (uint8_t *)&v8, 0x16u);
  }
  id v6 = [(DTConditionInducerSupportService *)self connection];
  id v7 = [v6 remoteObjectProxy];

  [v7 activeConditionsDidStop];
  [(DTConditionInducerSupportService *)self _activeConditionEnded];
}

- (BOOL)_disableConditionInducerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(DTConditionInducerSupportService *)self activeConditionSession];
  if (v7)
  {
    int v8 = [(DTConditionInducerSupportService *)self activeConditionSession];
    id v9 = [v8 selectedCondition];
    unsigned int v10 = [v9 isEqualToString:v6];

    if (v10)
    {
      id v13 = 0;
      BOOL v11 = [(DTConditionInducerSupportService *)self _stopActiveConditionInducerWithError:&v13];
      id v7 = v13;
      if (!a4) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    id v7 = 0;
  }
  BOOL v11 = 1;
  if (a4) {
LABEL_7:
  }
    *a4 = v7;
LABEL_8:

  return v11;
}

- (BOOL)_stopActiveConditionInducerWithError:(id *)a3
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100005A98;
  id v22 = sub_100005AA8;
  id v23 = 0;
  BOOL v5 = [(DTConditionInducerSupportService *)self activeConditionSession];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000060E4;
  v17[3] = &unk_100008260;
  v17[4] = &v18;
  unsigned __int8 v6 = [v5 stopConditionWithCallback:v17];

  uint64_t v7 = v19[5];
  if (v7) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v6;
  }
  if (v8)
  {
    [(DTConditionInducerSupportService *)self _activeConditionEnded];
  }
  else
  {
    if (!v7)
    {
      NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
      CFStringRef v31 = @"There was a problem disabling a condition inducer.";
      id v9 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      uint64_t v10 = +[NSError errorWithDomain:@"DTConditionInducerSupportService" code:4 userInfo:v9];
      BOOL v11 = (void *)v19[5];
      v19[5] = v10;
    }
    id v12 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v13 = (id)objc_opt_class();
      id v14 = [(DTConditionInducerSupportService *)self activeConditionSession];
      id v15 = [(id)v19[5] localizedDescription];
      *(_DWORD *)buf = 138412802;
      id v25 = v13;
      __int16 v26 = 2112;
      id v27 = v14;
      __int16 v28 = 2112;
      uint64_t v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%@: failed to disable %@ with error: %@", buf, 0x20u);
    }
  }
  if (a3) {
    *a3 = (id) v19[5];
  }
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (void)_activeConditionEnded
{
  [(DTConditionInducerSupportService *)self setActiveConditionSession:0];
  v3 = [(DTConditionInducerSupportService *)self keepAliveTransaction];
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  BOOL v5 = dispatch_get_global_queue(21, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000061D4;
  v6[3] = &unk_1000082D8;
  v6[4] = self;
  v6[5] = v3;
  dispatch_after(v4, v5, v6);

  [(DTConditionInducerSupportService *)self setKeepAliveTransaction:0];
}

- (void)_endTransaction:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v4 = a3;
    BOOL v5 = objc_opt_class();

    int v7 = 138412546;
    BOOL v8 = v5;
    __int16 v9 = 2112;
    id v10 = v4;
    id v6 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@: transaction ending: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (COConditionSession)activeConditionSession
{
  return (COConditionSession *)objc_getProperty(self, a2, 8, 1);
}

- (void)setActiveConditionSession:(id)a3
{
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (NSXPCConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (OS_os_transaction)keepAliveTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKeepAliveTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepAliveTransaction, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_activeConditionSession, 0);
}

@end