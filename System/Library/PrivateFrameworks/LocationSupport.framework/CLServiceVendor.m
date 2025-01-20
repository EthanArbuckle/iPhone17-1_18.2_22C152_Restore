@interface CLServiceVendor
+ (CLServiceVendor)sharedInstance;
+ (void)initialize;
+ (void)rereadConfiguration:(id)a3;
- (BOOL)ensureServiceIsRunning:(id)a3;
- (BOOL)isServiceEnabled:(id)a3;
- (BOOL)isServiceRunning:(id)a3;
- (BOOL)isTimeCoercionEnabled;
- (CLServiceVendor)init;
- (id)getServiceWithName:(id)a3;
- (id)proxyForService:(id)a3;
- (id)proxyForService:(id)a3 forClient:(id)a4;
- (id)setRecordingTriggerMap:(id)a3 outputPathBase:(id)a4;
- (int)missBehavior;
- (void)amendServiceReplacementMap:(id)a3 missBehavior:(int)a4;
- (void)dealloc;
- (void)enableTimeCoercion;
- (void)intendToSyncServiceWithName:(id)a3;
- (void)retireServiceWithName:(id)a3;
- (void)setCurrentGlobalLatchedAbsoluteTimestamp:(double)a3;
- (void)setServiceReplacementMap:(id)a3 missBehavior:(int)a4;
@end

@implementation CLServiceVendor

- (id)proxyForService:(id)a3
{
  id v4 = a3;
  v5 = [(CLServiceVendor *)self getServiceWithName:v4];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 silo];
    v8 = +[CLIntersiloProxy proxyForRecipientObject:v6 inSilo:v7 recipientName:v4];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getServiceWithName:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 containsString:@"Test"] & 1) != 0
    || [v4 containsString:@"Mock"])
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
    }
    v5 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
    {
      *(void *)buf = 68289282;
      *(_WORD *)v60 = 2082;
      *(void *)&v60[2] = &unk_1A45670B7;
      *(_WORD *)&v60[10] = 2114;
      *(void *)&v60[12] = v4;
      _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Test and Mock services may only be looked up indirectly via -setServiceReplacementMap:\", \"RequestedServiceName\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
      }
    }
    v6 = qword_1EB30CE68;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
    {
      *(void *)buf = 68289282;
      *(_WORD *)v60 = 2082;
      *(void *)&v60[2] = &unk_1A45670B7;
      *(_WORD *)&v60[10] = 2114;
      *(void *)&v60[12] = v4;
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Test and Mock services may only be looked up indirectly via -setServiceReplacementMap:", "{\"msg%{public}.0s\":\"Test and Mock services may only be looked up indirectly via -setServiceReplacementMap:\", \"RequestedServiceName\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    id v7 = 0;
  }
  else
  {
    *(void *)buf = 0;
    *(void *)v60 = buf;
    *(void *)&v60[8] = 0x3032000000;
    *(void *)&v60[16] = sub_1A4560B1C;
    v61 = sub_1A4560B2C;
    id v62 = 0;
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x3032000000;
    v49 = sub_1A4560B1C;
    v50 = sub_1A4560B2C;
    id v51 = v4;
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = sub_1A4560B1C;
    v44 = sub_1A4560B2C;
    id v45 = 0;
    v8 = qword_1EB30CEC8;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A4543E00;
    block[3] = &unk_1E5B3ECC8;
    block[4] = self;
    id v9 = v51;
    id v36 = v9;
    v37 = buf;
    v38 = &v46;
    v39 = &v40;
    dispatch_sync(v8, block);
    v10 = *(void **)(*(void *)v60 + 40);
    if (v10)
    {
      id v7 = v10;
    }
    else if (v47[5])
    {
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
      }
      v11 = qword_1EB30CE68;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v52 = 68289282;
        __int16 v53 = 2082;
        v54 = &unk_1A45670B7;
        __int16 v55 = 2114;
        id v56 = v9;
        _os_log_impl(&dword_1A4540000, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Looking up service identified by name\", \"ServiceName\":%{public, location:escape_only}@}", (uint8_t *)&v52, 0x1Cu);
      }
      id v33 = 0;
      id v34 = 0;
      BOOL v12 = sub_1A4561258(&v34, &v33, (void *)v47[5]);
      id v13 = v33;
      id v14 = v34;
      if (v34)
      {
        v15 = qword_1EB30CEC8;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = sub_1A4562EF8;
        v25[3] = &unk_1E5B3ED18;
        BOOL v32 = v12;
        id v26 = v9;
        v27 = self;
        v29 = &v46;
        v30 = buf;
        id v31 = v14;
        id v28 = v13;
        dispatch_barrier_sync(v15, v25);
        id v7 = *(id *)(*(void *)v60 + 40);
      }
      else
      {
        if (qword_1EB30CE70 != -1) {
          dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
        }
        v20 = qword_1EB30CE68;
        if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
        {
          uint64_t v21 = v47[5];
          uint64_t v52 = 68289538;
          __int16 v53 = 2082;
          v54 = &unk_1A45670B7;
          __int16 v55 = 2114;
          id v56 = v9;
          __int16 v57 = 2114;
          uint64_t v58 = v21;
          _os_log_impl(&dword_1A4540000, v20, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Tried to look up a service by name that doesn't exist\", \"RequestedServiceName\":%{public, location:escape_only}@, \"EffectiveServiceName\":%{public, location:escape_only}@}", (uint8_t *)&v52, 0x26u);
          if (qword_1EB30CE70 != -1) {
            dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
          }
        }
        v22 = qword_1EB30CE68;
        if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
        {
          uint64_t v23 = v47[5];
          uint64_t v52 = 68289538;
          __int16 v53 = 2082;
          v54 = &unk_1A45670B7;
          __int16 v55 = 2114;
          id v56 = v9;
          __int16 v57 = 2114;
          uint64_t v58 = v23;
          _os_signpost_emit_with_name_impl(&dword_1A4540000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Tried to look up a service by name that doesn't exist", "{\"msg%{public}.0s\":\"Tried to look up a service by name that doesn't exist\", \"RequestedServiceName\":%{public, location:escape_only}@, \"EffectiveServiceName\":%{public, location:escape_only}@}", (uint8_t *)&v52, 0x26u);
        }
        id v7 = 0;
      }
    }
    else
    {
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
      }
      v16 = qword_1EB30CE68;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
      {
        uint64_t v17 = v41[5];
        uint64_t v52 = 68289538;
        __int16 v53 = 2082;
        v54 = &unk_1A45670B7;
        __int16 v55 = 2114;
        id v56 = v9;
        __int16 v57 = 2114;
        uint64_t v58 = v17;
        _os_log_impl(&dword_1A4540000, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Service replacement map does not include requested service\", \"RequestedServiceName\":%{public, location:escape_only}@, \"ReplacementMap\":%{public, location:escape_only}@}", (uint8_t *)&v52, 0x26u);
        if (qword_1EB30CE70 != -1) {
          dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
        }
      }
      v18 = qword_1EB30CE68;
      if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
      {
        uint64_t v19 = v41[5];
        uint64_t v52 = 68289538;
        __int16 v53 = 2082;
        v54 = &unk_1A45670B7;
        __int16 v55 = 2114;
        id v56 = v9;
        __int16 v57 = 2114;
        uint64_t v58 = v19;
        _os_signpost_emit_with_name_impl(&dword_1A4540000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Service replacement map does not include requested service", "{\"msg%{public}.0s\":\"Service replacement map does not include requested service\", \"RequestedServiceName\":%{public, location:escape_only}@, \"ReplacementMap\":%{public, location:escape_only}@}", (uint8_t *)&v52, 0x26u);
      }
      id v7 = 0;
    }

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v46, 8);

    _Block_object_dispose(buf, 8);
  }

  return v7;
}

- (void)intendToSyncServiceWithName:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[CLAutoCohortUtilities autoCohortingEnabled])
  {
    if ([(CLServiceVendor *)self isServiceEnabled:v4]
      && ([(CLServiceVendor *)self getServiceWithName:v4],
          v5 = objc_claimAutoreleasedReturnValue(),
          [v5 silo],
          v6 = objc_claimAutoreleasedReturnValue(),
          v5,
          v6))
    {
      [v6 intendToSync];
    }
    else
    {
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
      }
      id v7 = qword_1EB30CE68;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEBUG))
      {
        v8[0] = 68289282;
        v8[1] = 0;
        __int16 v9 = 2082;
        v10 = &unk_1A45670B7;
        __int16 v11 = 2114;
        id v12 = v4;
        _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#Cohorting Cannot deduce toSilo\", \"serviceName\":%{public, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
      }
      v6 = 0;
    }
  }
}

+ (CLServiceVendor)sharedInstance
{
  if (qword_1EB30CEF8 != -1) {
    dispatch_once(&qword_1EB30CEF8, &unk_1EF7F5120);
  }
  v2 = (void *)qword_1EB30CEF0;
  return (CLServiceVendor *)v2;
}

- (BOOL)isServiceRunning:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = qword_1EB30CEC8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A454E74C;
  block[3] = &unk_1E5B3ED40;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);
  LOBYTE(v5) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

- (CLServiceVendor)init
{
  v9.receiver = self;
  v9.super_class = (Class)CLServiceVendor;
  v2 = [(CLServiceVendor *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    catalog = v2->_catalog;
    v2->_catalog = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    unavailableServiceNames = v2->_unavailableServiceNames;
    v2->_unavailableServiceNames = (NSMutableSet *)v5;

    id v7 = v2;
  }

  return v2;
}

+ (void)initialize
{
  if (qword_1EB30CEA8 != -1) {
    dispatch_once(&qword_1EB30CEA8, &unk_1EF7F5060);
  }
}

+ (void)rereadConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = +[CLSettingsDictionary settingsWithDictionary:v3];
  [v4 doubleForKey:@"CLServiceVendor.HeartbeatCheckInterval" defaultValue:60.0];
  uint64_t v6 = v5;
  char v7 = [v4 BOOLForKey:@"HeartAttackStackshot" defaultValue:0];
  char v8 = [v4 BOOLForKey:@"IsInternalInstall" defaultValue:0];
  char v9 = [v4 BOOLForKey:@"IsLocationServicesEnabled" defaultValue:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1A4561700;
  v10[3] = &unk_1E5B3EC78;
  char v11 = v7;
  v10[4] = v6;
  char v12 = v8;
  char v13 = v9;
  dispatch_barrier_async((dispatch_queue_t)qword_1EB30CEC8, v10);
}

- (void)enableTimeCoercion
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_catalog count])
  {
    id v3 = sub_1A4560528();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      char v11 = &unk_1A45670B7;
      __int16 v12 = 2082;
      char v13 = "assert";
      __int16 v14 = 2081;
      v15 = "0 == [_catalog count]";
      _os_log_impl(&dword_1A4540000, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Enabling Time Coercion must be done before any services are started\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    id v4 = sub_1A4560528();
    if (os_signpost_enabled(v4))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      char v11 = &unk_1A45670B7;
      __int16 v12 = 2082;
      char v13 = "assert";
      __int16 v14 = 2081;
      v15 = "0 == [_catalog count]";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Enabling Time Coercion must be done before any services are started", "{\"msg%{public}.0s\":\"Enabling Time Coercion must be done before any services are started\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    uint64_t v5 = sub_1A4560528();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      char v11 = &unk_1A45670B7;
      __int16 v12 = 2082;
      char v13 = "assert";
      __int16 v14 = 2081;
      v15 = "0 == [_catalog count]";
      _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Enabling Time Coercion must be done before any services are started\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_19:

    abort_report_np();
  }
  if (self->_timeCoercibleSilos)
  {
    uint64_t v6 = sub_1A4560528();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      char v11 = &unk_1A45670B7;
      __int16 v12 = 2082;
      char v13 = "assert";
      __int16 v14 = 2081;
      v15 = "!_timeCoercibleSilos";
      _os_log_impl(&dword_1A4540000, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Only enable Time Coercion once, eh?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    char v7 = sub_1A4560528();
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      char v11 = &unk_1A45670B7;
      __int16 v12 = 2082;
      char v13 = "assert";
      __int16 v14 = 2081;
      v15 = "!_timeCoercibleSilos";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Only enable Time Coercion once, eh?", "{\"msg%{public}.0s\":\"Only enable Time Coercion once, eh?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    uint64_t v5 = sub_1A4560528();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      char v11 = &unk_1A45670B7;
      __int16 v12 = 2082;
      char v13 = "assert";
      __int16 v14 = 2081;
      v15 = "!_timeCoercibleSilos";
      _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Only enable Time Coercion once, eh?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_19;
  }
  self->_timeCoercibleSilos = [MEMORY[0x1E4F1CA80] set];
  MEMORY[0x1F41817F8]();
}

- (BOOL)isTimeCoercionEnabled
{
  return self->_timeCoercibleSilos != 0;
}

- (int)missBehavior
{
  return self->_missBehavior;
}

- (void)amendServiceReplacementMap:(id)a3 missBehavior:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_missBehavior <= (int)v4)
  {
    char v11 = (void *)[(NSDictionary *)self->_serviceReplacementMap mutableCopy];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v17 = objc_msgSend(v12, "objectForKeyedSubscript:", v16, (void)v18);
          [v11 setObject:v17 forKeyedSubscript:v16];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [(CLServiceVendor *)self setServiceReplacementMap:v11 missBehavior:v4];
  }
  else
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
    }
    char v7 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
    {
      uint64_t missBehavior = self->_missBehavior;
      uint64_t buf = 68289538;
      __int16 v24 = 2082;
      v25 = &unk_1A45670B7;
      __int16 v26 = 2050;
      uint64_t v27 = missBehavior;
      __int16 v28 = 2050;
      uint64_t v29 = v4;
      _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"When amending replacement maps, you must make the new miss behavior the same or more strict. stock -> nop, stock -> crash and nop -> crash are valid changes here, or otherwise you must leave the behavior the same\", \"current\":%{public, location:CLSVReplacementMapMissBehavior}lld, \"desired\":%{public, location:CLSVReplacementMapMissBehavior}lld}", (uint8_t *)&buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
      }
    }
    int v9 = qword_1EB30CE68;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
    {
      uint64_t v10 = self->_missBehavior;
      uint64_t buf = 68289538;
      __int16 v24 = 2082;
      v25 = &unk_1A45670B7;
      __int16 v26 = 2050;
      uint64_t v27 = v10;
      __int16 v28 = 2050;
      uint64_t v29 = v4;
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "When amending replacement maps, you must make the new miss behavior the same or more strict. stock -> nop, stock -> crash and nop -> crash are valid changes here, or otherwise you must leave the behavior the same", "{\"msg%{public}.0s\":\"When amending replacement maps, you must make the new miss behavior the same or more strict. stock -> nop, stock -> crash and nop -> crash are valid changes here, or otherwise you must leave the behavior the same\", \"current\":%{public, location:CLSVReplacementMapMissBehavior}lld, \"desired\":%{public, location:CLSVReplacementMapMissBehavior}lld}", (uint8_t *)&buf, 0x26u);
    }
  }
}

- (void)setServiceReplacementMap:(id)a3 missBehavior:(int)a4
{
  id v6 = a3;
  char v7 = qword_1EB30CEC8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A45621D4;
  block[3] = &unk_1E5B3ECA0;
  id v10 = v6;
  char v11 = self;
  int v12 = a4;
  id v8 = v6;
  dispatch_barrier_sync(v7, block);
}

- (id)setRecordingTriggerMap:(id)a3 outputPathBase:(id)a4
{
  return 0;
}

- (void)retireServiceWithName:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_1A4560B1C;
  long long v18 = sub_1A4560B2C;
  id v19 = 0;
  uint64_t v5 = qword_1EB30CEC8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4563A5C;
  block[3] = &unk_1E5B3ED40;
  uint64_t v13 = &v14;
  void block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_barrier_sync(v5, block);
  char v7 = (void *)v15[5];
  if (v7)
  {
    id v8 = [v7 silo];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1A4563B60;
    v10[3] = &unk_1E5B3ED68;
    v10[4] = &v14;
    [v8 sync:v10];
  }
  else
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
    }
    int v9 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEBUG))
    {
      uint64_t buf = 68289282;
      __int16 v21 = 2082;
      v22 = &unk_1A45670B7;
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_impl(&dword_1A4540000, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#Warning Service retired redundantly or without ever having been started\", \"RequestedServiceName\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
  }

  _Block_object_dispose(&v14, 8);
}

- (BOOL)isServiceEnabled:(id)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1A4560B1C;
  uint64_t v16 = sub_1A4560B2C;
  id v17 = a3;
  id v4 = qword_1EB30CEC8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4563D08;
  block[3] = &unk_1E5B3ED40;
  char v11 = &v12;
  void block[4] = self;
  id v5 = v17;
  id v10 = v5;
  dispatch_sync(v4, block);
  uint64_t v7 = 0;
  id v8 = 0;
  sub_1A4561258(&v8, &v7, (void *)v13[5]);
  LOBYTE(v4) = v7 != 0;

  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

- (BOOL)ensureServiceIsRunning:(id)a3
{
  id v3 = [(CLServiceVendor *)self getServiceWithName:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)proxyForService:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CLServiceVendor *)self getServiceWithName:v7];
  if (v8)
  {
    int v9 = [(CLServiceVendor *)self proxyForService:v6];
    id v10 = [v8 silo];
    [v9 registerDelegate:v8 inSilo:v10];

    objc_msgSend(v9, "setDelegateEntityName:", objc_msgSend(v7, "UTF8String"));
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (void)setCurrentGlobalLatchedAbsoluteTimestamp:(double)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  timeCoercibleSilos = self->_timeCoercibleSilos;
  if (timeCoercibleSilos)
  {
    self->_currentGlobalLatchedAbsoluteTimestamp = a3;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v6 = timeCoercibleSilos;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * v9++) suspend];
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = self->_timeCoercibleSilos;
    uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = sub_1A4564158;
          v23[3] = &unk_1E5B3EBC0;
          v23[4] = v14;
          *(double *)&v23[5] = a3;
          [v14 async:v23];
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v15 = self->_timeCoercibleSilos;
    uint64_t v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v19 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "resume", (void)v19);
        }
        while (v16 != v18);
        uint64_t v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v19 objects:v32 count:16];
      }
      while (v16);
    }
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CLServiceVendor;
  [(CLServiceVendor *)&v2 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingToTriggersByFrom, 0);
  objc_storeStrong((id *)&self->_recordingFromTriggersByTo, 0);
  objc_storeStrong((id *)&self->_timeCoercibleSilos, 0);
  objc_storeStrong((id *)&self->_unavailableServiceNames, 0);
  objc_storeStrong((id *)&self->_serviceReplacementMap, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
}

@end