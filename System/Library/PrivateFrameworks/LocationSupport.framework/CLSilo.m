@interface CLSilo
+ (id)globalConfiguration;
+ (id)main;
+ (void)setGlobalConfiguration:(id)a3;
- (BOOL)isSuspended;
- (BOOL)shouldBeIdled;
- (CLSilo)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (double)currentLatchedAbsoluteTimestamp;
- (id)debugDescription;
- (id)newTimer;
- (id)registerForIdleNotifications:(id)a3 onResume:(id)a4;
- (void)afterInterval:(double)a3 async:(id)a4;
- (void)assertInside;
- (void)assertOutside;
- (void)async:(id)a3;
- (void)heartBeat:(id)a3;
- (void)intendToSync;
- (void)prepareAndRunBlock:(id)a3;
- (void)resume;
- (void)runIdleHandlers;
- (void)runResumeHandlers;
- (void)suspend;
- (void)sync:(id)a3;
- (void)unregisterForIdleNotifications:(id)a3;
@end

@implementation CLSilo

- (void)prepareAndRunBlock:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void))a3;
  if (self->_isIdle)
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F4EA0);
    }
    v5 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      int v7 = 138412290;
      v8 = identifier;
      _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_DEFAULT, "#Idleness: Silo is being resumed: %@", (uint8_t *)&v7, 0xCu);
    }
    [(CLSilo *)self runResumeHandlers];
    self->_isIdle = 0;
  }
  self->_currentLatchedAbsoluteTimestamp = CFAbsoluteTimeGetCurrent();
  if (v4) {
    v4[2](v4);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CLSilo)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSilo;
  v6 = [(CLSilo *)&v11 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    uint64_t v8 = objc_opt_new();
    idleHandlers = v7->_idleHandlers;
    v7->_idleHandlers = (NSMutableSet *)v8;
  }
  return v7;
}

+ (id)main
{
  if (qword_1EB30CF10 != -1) {
    dispatch_once(&qword_1EB30CF10, &unk_1EF7F5000);
  }
  v2 = (void *)qword_1EB30CF08;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleHandlers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)setGlobalConfiguration:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"AutoCohortEdgesDirectoryPath"];
  if ([v4 length]) {
    +[CLAutoCohortUtilities enableAutoCohortingForProcessAtPath:v4];
  }
  v48 = v4;
  id v5 = (id)objc_opt_new();
  v50 = v3;
  if (+[CLAutoCohortUtilities autoCohortingEnabled])
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F4EA0);
    }
    v6 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v76 = 0;
      __int16 v77 = 2082;
      v78 = &unk_1A45670B7;
      _os_log_impl(&dword_1A4540000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Cohorting Using syng-get graph file if available\"}", buf, 0x12u);
    }
    int v7 = objc_msgSend(v3, "objectForKeyedSubscript:", @"SyncgetGraphFile", v4);
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA10] inputStreamWithFileAtPath:v7];
      uint64_t v9 = v8;
      if (v8)
      {
        [v8 open];
        id v59 = 0;
        v10 = [MEMORY[0x1E4F28F98] propertyListWithStream:v9 options:0 format:0 error:&v59];
        id v11 = v59;
        [v9 close];
        v12 = 0;
        if (!v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v12 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v10];
            if (qword_1EB30CE70 != -1) {
              dispatch_once(&qword_1EB30CE70, &unk_1EF7F4EA0);
            }
            v13 = qword_1EB30CE68;
            if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68289282;
              int v76 = 0;
              __int16 v77 = 2082;
              v78 = &unk_1A45670B7;
              __int16 v79 = 2114;
              v80 = v7;
              _os_log_impl(&dword_1A4540000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Cohorting Successfully read sync-get graph file\", \"filePath\":%{public, location:escape_only}@}", buf, 0x1Cu);
            }
          }
          else
          {
            v12 = 0;
          }
        }

        v30 = v49;
      }
      else
      {
        if (qword_1EB30CE70 != -1) {
          dispatch_once(&qword_1EB30CE70, &unk_1EF7F4EA0);
        }
        v30 = v49;
        v36 = qword_1EB30CE68;
        if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289282;
          int v76 = 0;
          __int16 v77 = 2082;
          v78 = &unk_1A45670B7;
          __int16 v79 = 2114;
          v80 = v7;
          _os_log_impl(&dword_1A4540000, v36, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Cohorting No sync-get graph file available to read\", \"filePath\":%{public, location:escape_only}@}", buf, 0x1Cu);
        }
        v12 = 0;
      }
    }
    else
    {
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F4EA0);
      }
      v30 = v49;
      v35 = qword_1EB30CE68;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v76 = 0;
        __int16 v77 = 2082;
        v78 = &unk_1A45670B7;
        _os_log_impl(&dword_1A4540000, v35, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Cohorting No sync-get graph filePath supplied\"}", buf, 0x12u);
      }
      v12 = 0;
    }

    v37 = +[CLAutoCohortUtilities computeAutoCohortMapWithStarterGraph:v12];

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v5 = v37;
    uint64_t v38 = [v5 countByEnumeratingWithState:&v55 objects:v74 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      LODWORD(v40) = 0;
      uint64_t v41 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v56 != v41) {
            objc_enumerationMutation(v5);
          }
          v43 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v55 + 1) + 8 * i)];
          int v44 = [v43 intValue];

          if ((int)v40 <= v44) {
            uint64_t v40 = v44;
          }
          else {
            uint64_t v40 = v40;
          }
        }
        uint64_t v39 = [v5 countByEnumeratingWithState:&v55 objects:v74 count:16];
      }
      while (v39);
    }
    else
    {
      uint64_t v40 = 0;
    }

    v45 = [MEMORY[0x1E4F28ED0] numberWithInt:v40];
    [v5 setObject:v45 forKeyedSubscript:@"default"];

LABEL_65:
    v26 = v50;
    goto LABEL_66;
  }
  [v3 objectForKeyedSubscript:@"CohortToNameMap"];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v52 = [obj countByEnumeratingWithState:&v68 objects:v83 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v52; ++j)
      {
        if (*(void *)v69 != v51) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v68 + 1) + 8 * j);
        v16 = objc_msgSend(obj, "objectForKeyedSubscript:", v15, v48);
        v17 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        v54 = v16;
        v18 = [v16 componentsSeparatedByCharactersInSet:v17];

        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v64 objects:v82 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v65;
          do
          {
            for (uint64_t k = 0; k != v21; ++k)
            {
              if (*(void *)v65 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v64 + 1) + 8 * k);
              v25 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v15, "intValue"));
              [v5 setObject:v25 forKeyedSubscript:v24];
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v64 objects:v82 count:16];
          }
          while (v21);
        }
      }
      uint64_t v52 = [obj countByEnumeratingWithState:&v68 objects:v83 count:16];
    }
    while (v52);
  }

  v26 = v50;
  v12 = [v50 objectForKeyedSubscript:@"NameToCohortMap"];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v27 = [v12 countByEnumeratingWithState:&v60 objects:v81 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v61;
    v30 = v48;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v61 != v29) {
          objc_enumerationMutation(v12);
        }
        uint64_t v32 = *(void *)(*((void *)&v60 + 1) + 8 * m);
        v33 = objc_msgSend(v12, "objectForKeyedSubscript:", v32, v48);
        v34 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v33, "intValue"));
        [v5 setObject:v34 forKeyedSubscript:v32];
      }
      uint64_t v28 = [v12 countByEnumeratingWithState:&v60 objects:v81 count:16];
    }
    while (v28);
    goto LABEL_65;
  }
  v30 = v48;
LABEL_66:

  v72 = @"NameToCohortMap";
  id v73 = v5;
  uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
  v47 = (void *)qword_1E964BBC0;
  qword_1E964BBC0 = v46;
}

+ (id)globalConfiguration
{
  return (id)qword_1E964BBC0;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"CLSilo: %@", self->_identifier];
}

- (void)assertInside
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1E964B6C8 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    id v3 = qword_1E964B6C0;
    if (os_signpost_enabled((os_log_t)qword_1E964B6C0))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    v4 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
  }
}

- (void)assertOutside
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1E964B6C8 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    id v3 = qword_1E964B6C0;
    if (os_signpost_enabled((os_log_t)qword_1E964B6C0))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    v4 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
  }
}

- (void)suspend
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1E964B6C8 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    id v3 = qword_1E964B6C0;
    if (os_signpost_enabled((os_log_t)qword_1E964B6C0))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    v4 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
  }
}

- (void)resume
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1E964B6C8 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    id v3 = qword_1E964B6C0;
    if (os_signpost_enabled((os_log_t)qword_1E964B6C0))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    v4 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
  }
}

- (BOOL)isSuspended
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1E964B6C8 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    id v3 = qword_1E964B6C0;
    if (os_signpost_enabled((os_log_t)qword_1E964B6C0))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    v4 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
  }
}

- (double)currentLatchedAbsoluteTimestamp
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1E964B6C8 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    id v3 = qword_1E964B6C0;
    if (os_signpost_enabled((os_log_t)qword_1E964B6C0))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    v4 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
  }
}

- (id)newTimer
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1E964B6C8 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    id v3 = qword_1E964B6C0;
    if (os_signpost_enabled((os_log_t)qword_1E964B6C0))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    v4 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
  }
}

- (void)async:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (qword_1E964B6C8 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v4 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      v10 = &unk_1A45670B7;
      __int16 v11 = 2082;
      v12 = "assert";
      __int16 v13 = 2081;
      v14 = "0";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    id v5 = qword_1E964B6C0;
    if (os_signpost_enabled((os_log_t)qword_1E964B6C0))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      v10 = &unk_1A45670B7;
      __int16 v11 = 2082;
      v12 = "assert";
      __int16 v13 = 2081;
      v14 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    int v6 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      v10 = &unk_1A45670B7;
      __int16 v11 = 2082;
      v12 = "assert";
      __int16 v13 = 2081;
      v14 = "0";
      _os_log_impl(&dword_1A4540000, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
  }
}

- (void)sync:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (qword_1E964B6C8 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v4 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      v10 = &unk_1A45670B7;
      __int16 v11 = 2082;
      v12 = "assert";
      __int16 v13 = 2081;
      v14 = "0";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    id v5 = qword_1E964B6C0;
    if (os_signpost_enabled((os_log_t)qword_1E964B6C0))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      v10 = &unk_1A45670B7;
      __int16 v11 = 2082;
      v12 = "assert";
      __int16 v13 = 2081;
      v14 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    int v6 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      v10 = &unk_1A45670B7;
      __int16 v11 = 2082;
      v12 = "assert";
      __int16 v13 = 2081;
      v14 = "0";
      _os_log_impl(&dword_1A4540000, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
  }
}

- (void)intendToSync
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1E964B6C8 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      int v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    id v3 = qword_1E964B6C0;
    if (os_signpost_enabled((os_log_t)qword_1E964B6C0))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      int v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    v4 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      int v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
  }
}

- (void)afterInterval:(double)a3 async:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  if (qword_1E964B6C8 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    id v5 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      __int16 v11 = &unk_1A45670B7;
      __int16 v12 = 2082;
      uint64_t v13 = "assert";
      __int16 v14 = 2081;
      uint64_t v15 = "0";
      _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    int v6 = qword_1E964B6C0;
    if (os_signpost_enabled((os_log_t)qword_1E964B6C0))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      __int16 v11 = &unk_1A45670B7;
      __int16 v12 = 2082;
      uint64_t v13 = "assert";
      __int16 v14 = 2081;
      uint64_t v15 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    __int16 v7 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      __int16 v11 = &unk_1A45670B7;
      __int16 v12 = 2082;
      uint64_t v13 = "assert";
      __int16 v14 = 2081;
      uint64_t v15 = "0";
      _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
  }
}

- (void)heartBeat:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (qword_1E964B6C8 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    id v4 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      __int16 v10 = &unk_1A45670B7;
      __int16 v11 = 2082;
      __int16 v12 = "assert";
      __int16 v13 = 2081;
      __int16 v14 = "0";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    id v5 = qword_1E964B6C0;
    if (os_signpost_enabled((os_log_t)qword_1E964B6C0))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      __int16 v10 = &unk_1A45670B7;
      __int16 v11 = 2082;
      __int16 v12 = "assert";
      __int16 v13 = 2081;
      __int16 v14 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
      }
    }
    int v6 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      __int16 v10 = &unk_1A45670B7;
      __int16 v11 = 2082;
      __int16 v12 = "assert";
      __int16 v13 = 2081;
      __int16 v14 = "0";
      _os_log_impl(&dword_1A4540000, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1E964B6C8, &unk_1EF7F5100);
  }
}

- (BOOL)shouldBeIdled
{
  double Current = CFAbsoluteTimeGetCurrent();
  lastIdleChecuint64_t k = self->_lastIdleCheck;
  [(CLSilo *)self currentLatchedAbsoluteTimestamp];
  if (lastIdleCheck <= v5)
  {
    BOOL result = 0;
  }
  else
  {
    double v6 = self->_lastIdleCheck;
    [(CLSilo *)self currentLatchedAbsoluteTimestamp];
    BOOL result = v6 - v7 > 900.0;
  }
  self->_lastIdleChecuint64_t k = Current;
  return result;
}

- (id)registerForIdleNotifications:(id)a3 onResume:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [[CLSiloIdleHandler alloc] initWithIdleHandler:v7 onResume:v6];

  os_unfair_lock_lock(&self->_idleHandlersLock);
  [(NSMutableSet *)self->_idleHandlers addObject:v8];
  os_unfair_lock_unlock(&self->_idleHandlersLock);
  return v8;
}

- (void)unregisterForIdleNotifications:(id)a3
{
  id v4 = a3;
  [v4 invalidate];
  os_unfair_lock_lock(&self->_idleHandlersLock);
  [(NSMutableSet *)self->_idleHandlers removeObject:v4];

  os_unfair_lock_unlock(&self->_idleHandlersLock);
}

- (void)runIdleHandlers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(CLSilo *)self assertInside];
  p_idleHandlersLocuint64_t k = &self->_idleHandlersLock;
  os_unfair_lock_lock(&self->_idleHandlersLock);
  id v4 = (void *)[(NSMutableSet *)self->_idleHandlers copy];
  os_unfair_lock_unlock(p_idleHandlersLock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "onIdle", (void)v11);
        __int16 v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v10[2]();

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)runResumeHandlers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(CLSilo *)self assertInside];
  p_idleHandlersLocuint64_t k = &self->_idleHandlersLock;
  os_unfair_lock_lock(&self->_idleHandlersLock);
  id v4 = (void *)[(NSMutableSet *)self->_idleHandlers copy];
  os_unfair_lock_unlock(p_idleHandlersLock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "onResume", (void)v11);
        __int16 v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v10[2]();

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

@end