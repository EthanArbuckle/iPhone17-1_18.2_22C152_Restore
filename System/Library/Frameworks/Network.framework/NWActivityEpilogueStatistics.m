@interface NWActivityEpilogueStatistics
+ (id)createActivityEpilogueDictionary:(nw_activity_epilogue_report_s *)a3;
- (BOOL)retry;
- (NSDictionary)deviceReport;
- (NSDictionary)layer2Report;
- (NSMutableDictionary)dictionaryReport;
- (NSString)bundleID;
- (NSUUID)activityUUID;
- (NSUUID)externallyVisibleActivityUUID;
- (NSUUID)externallyVisibleParentUUID;
- (NSUUID)parentUUID;
- (NWActivityEpilogueStatistics)initWithJSONData:(id)a3;
- (NWActivityEpilogueStatistics)initWithNWActivityEpilogueReport:(nw_activity_epilogue_report_s *)a3 length:(unint64_t)a4;
- (const)underlyingErrorDomainString;
- (int)completionReason;
- (int)underlyingErrorCode;
- (int)underlyingErrorDomain;
- (nw_activity_epilogue_report_s)report;
- (unint64_t)durationMsecs;
- (unint64_t)investigation_identifier;
- (unsigned)domain;
- (unsigned)fragmentsQuenched;
- (unsigned)label;
- (unsigned)metricType;
- (void)setActivityUUID:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setDeviceReport:(id)a3;
- (void)setDictionaryReport:(id)a3;
- (void)setExternallyVisibleActivityUUID:(id)a3;
- (void)setExternallyVisibleParentUUID:(id)a3;
- (void)setLayer2Report:(id)a3;
- (void)setMetricType:(unsigned __int8)a3;
- (void)setParentUUID:(id)a3;
- (void)setReport:(nw_activity_epilogue_report_s *)a3;
@end

@implementation NWActivityEpilogueStatistics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryReport, 0);
  objc_storeStrong((id *)&self->_deviceReport, 0);
  objc_storeStrong((id *)&self->_layer2Report, 0);
  objc_storeStrong((id *)&self->_parentUUID, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
  objc_storeStrong((id *)&self->_externallyVisibleParentUUID, 0);

  objc_storeStrong((id *)&self->_externallyVisibleActivityUUID, 0);
}

- (void)setReport:(nw_activity_epilogue_report_s *)a3
{
}

- (nw_activity_epilogue_report_s)report
{
  return (nw_activity_epilogue_report_s *)memcpy(retstr, &self->_report, sizeof(nw_activity_epilogue_report_s));
}

- (void)setDictionaryReport:(id)a3
{
}

- (void)setMetricType:(unsigned __int8)a3
{
  self->_metricType = a3;
}

- (void)setDeviceReport:(id)a3
{
}

- (NSDictionary)deviceReport
{
  return self->_deviceReport;
}

- (void)setLayer2Report:(id)a3
{
}

- (NSDictionary)layer2Report
{
  return self->_layer2Report;
}

- (void)setParentUUID:(id)a3
{
}

- (void)setActivityUUID:(id)a3
{
}

- (void)setExternallyVisibleParentUUID:(id)a3
{
}

- (NSUUID)externallyVisibleParentUUID
{
  return self->_externallyVisibleParentUUID;
}

- (void)setExternallyVisibleActivityUUID:(id)a3
{
}

- (NSUUID)externallyVisibleActivityUUID
{
  return self->_externallyVisibleActivityUUID;
}

- (NWActivityEpilogueStatistics)initWithJSONData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NWActivityEpilogueStatistics;
  v5 = [(NWActivityEpilogueStatistics *)&v22 init];
  if (v5)
  {
    if (v4 && [v4 length])
    {
      id v19 = 0;
      uint64_t v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:1 error:&v19];
      id v7 = v19;
      dictionaryReport = v5->_dictionaryReport;
      v5->_dictionaryReport = (NSMutableDictionary *)v6;
    }
    v9 = v5;
    goto LABEL_6;
  }
  v11 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v24 = "-[NWActivityEpilogueStatistics initWithJSONData:]";
  v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v20 = 0;
  if (__nwlog_fault(v12, &type, &v20))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v13 = __nwlog_obj();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityEpilogueStatistics initWithJSONData:]";
        _os_log_impl(&dword_1830D4000, v13, v14, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v20)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v13 = __nwlog_obj();
      os_log_type_t v16 = type;
      BOOL v17 = os_log_type_enabled(v13, type);
      if (backtrace_string)
      {
        if (v17)
        {
          *(_DWORD *)buf = 136446466;
          v24 = "-[NWActivityEpilogueStatistics initWithJSONData:]";
          __int16 v25 = 2082;
          v26 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v13, v16, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_23;
      }
      if (v17)
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityEpilogueStatistics initWithJSONData:]";
        _os_log_impl(&dword_1830D4000, v13, v16, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v13 = __nwlog_obj();
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityEpilogueStatistics initWithJSONData:]";
        _os_log_impl(&dword_1830D4000, v13, v18, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
LABEL_23:
  if (v12) {
    free(v12);
  }
LABEL_6:

  return v5;
}

- (NWActivityEpilogueStatistics)initWithNWActivityEpilogueReport:(nw_activity_epilogue_report_s *)a3 length:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a4 == 592)
  {
    memcpy(__dst, a3, sizeof(__dst));
    [(NWActivityEpilogueStatistics *)self setReport:__dst];
    v5 = self;
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v7 = (id)gLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446722;
      v10 = "-[NWActivityEpilogueStatistics initWithNWActivityEpilogueReport:length:]";
      __int16 v11 = 2048;
      uint64_t v12 = 592;
      __int16 v13 = 2048;
      unint64_t v14 = a4;
      _os_log_impl(&dword_1830D4000, v7, OS_LOG_TYPE_ERROR, "%{public}s failure to initialize statistics object from nw_activity epilogue report, expected size %zd actual size %zd", (uint8_t *)&v9, 0x20u);
    }

    v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)dictionaryReport
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_dictionaryReport = &self->_dictionaryReport;
  dictionaryReport = self->_dictionaryReport;
  if (dictionaryReport)
  {
LABEL_2:
    id v4 = dictionaryReport;
    goto LABEL_3;
  }
  [(NWActivityEpilogueStatistics *)self report];
  id v4 = +[NWActivityEpilogueStatistics createActivityEpilogueDictionary:v26];
  if (v4)
  {
    id v7 = v4;
    v8 = [(NWActivityEpilogueStatistics *)self externallyVisibleActivityUUID];

    if (v8)
    {
      int v9 = [(NWActivityEpilogueStatistics *)self externallyVisibleActivityUUID];
      v8 = [v9 UUIDString];
    }
    v10 = [(NWActivityEpilogueStatistics *)self externallyVisibleParentUUID];

    if (v10)
    {
      __int16 v11 = [(NWActivityEpilogueStatistics *)self externallyVisibleParentUUID];
      v10 = [v11 UUIDString];
    }
    [(NWActivityEpilogueStatistics *)self report];
    memcpy(__dst, v24, sizeof(__dst));
    uint64_t v12 = +[NWActivityStatistics createActivityReportDictionary:__dst uuidString:v8 parentUUIDString:v10];
    if (v12)
    {
      __int16 v13 = (void *)v12;
      [(NSMutableDictionary *)v7 setObject:v12 forKeyedSubscript:@"activity"];
      unint64_t v14 = [(NWActivityEpilogueStatistics *)self layer2Report];

      if (v14)
      {
        v15 = [(NWActivityEpilogueStatistics *)self layer2Report];
        [(NSMutableDictionary *)v7 setObject:v15 forKeyedSubscript:@"l2Report"];
      }
      uint64_t v16 = [(NWActivityEpilogueStatistics *)self deviceReport];

      if (v16)
      {
        BOOL v17 = [(NWActivityEpilogueStatistics *)self deviceReport];
        [(NSMutableDictionary *)v7 setObject:v17 forKeyedSubscript:@"deviceReport"];
      }
      [(NWActivityEpilogueStatistics *)self setMetricType:4];
      objc_storeStrong((id *)p_dictionaryReport, v7);
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v18 = (id)gLogObj;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        id v19 = *p_dictionaryReport;
        int v20 = 136446466;
        v21 = "-[NWActivityEpilogueStatistics dictionaryReport]";
        __int16 v22 = 2114;
        v23 = v19;
        _os_log_impl(&dword_1830D4000, v18, OS_LOG_TYPE_DEBUG, "%{public}s Generated nw_activity epilogue report: %{public}@", (uint8_t *)&v20, 0x16u);
      }

      dictionaryReport = *p_dictionaryReport;
      goto LABEL_2;
    }

    id v4 = 0;
  }
LABEL_3:

  return v4;
}

- (unsigned)metricType
{
  if (self->_metricType) {
    return self->_metricType;
  }
  else {
    return 4;
  }
}

- (void)setBundleID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogDatapath)
  {
    v5 = __nwlog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      v8 = "-[NWActivityEpilogueStatistics setBundleID:]";
      __int16 v9 = 2112;
      id v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = self;
      _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_DEBUG, "%{public}s Set bundle ID to %@ for %@", buf, 0x20u);
    }
  }
  [(NWActivityEpilogueStatistics *)self report];
  strlcpy(v6, (const char *)[v4 UTF8String], 0x100uLL);
}

- (NSString)bundleID
{
  v5[67] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  [(NWActivityEpilogueStatistics *)self report];
  v3 = [v2 stringWithCString:v5 encoding:134217984];

  return (NSString *)v3;
}

- (unsigned)fragmentsQuenched
{
  [(NWActivityEpilogueStatistics *)self report];
  return v3;
}

- (unint64_t)durationMsecs
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(NWActivityEpilogueStatistics *)self report];
  return v3;
}

- (unint64_t)investigation_identifier
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(NWActivityEpilogueStatistics *)self report];
  return v3;
}

- (NSUUID)parentUUID
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_parentUUID)
  {
    [(NWActivityEpilogueStatistics *)self report];
    if (!uuid_is_null(v9))
    {
      id v3 = objc_alloc(MEMORY[0x1E4F29128]);
      [(NWActivityEpilogueStatistics *)self report];
      uint64_t v4 = (NSUUID *)[v3 initWithUUIDBytes:&v8];
      parentUUID = self->_parentUUID;
      self->_parentUUID = v4;
    }
  }
  uint64_t v6 = self->_parentUUID;

  return v6;
}

- (NSUUID)activityUUID
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_activityUUID)
  {
    [(NWActivityEpilogueStatistics *)self report];
    if (!uuid_is_null(v9))
    {
      id v3 = objc_alloc(MEMORY[0x1E4F29128]);
      [(NWActivityEpilogueStatistics *)self report];
      uint64_t v4 = (NSUUID *)[v3 initWithUUIDBytes:&v8];
      activityUUID = self->_activityUUID;
      self->_activityUUID = v4;
    }
  }
  uint64_t v6 = self->_activityUUID;

  return v6;
}

- (int)underlyingErrorCode
{
  [(NWActivityEpilogueStatistics *)self report];
  return v3;
}

- (int)underlyingErrorDomain
{
  [(NWActivityEpilogueStatistics *)self report];
  return v3;
}

- (const)underlyingErrorDomainString
{
  v3[32] = *MEMORY[0x1E4F143B8];
  [(NWActivityEpilogueStatistics *)self report];
  return (const char *)v3;
}

- (int)completionReason
{
  [(NWActivityEpilogueStatistics *)self report];
  return v3;
}

- (BOOL)retry
{
  [(NWActivityEpilogueStatistics *)self report];
  return v3 & 1;
}

- (unsigned)label
{
  [(NWActivityEpilogueStatistics *)self report];
  return v3;
}

- (unsigned)domain
{
  [(NWActivityEpilogueStatistics *)self report];
  return v3;
}

+ (id)createActivityEpilogueDictionary:(nw_activity_epilogue_report_s *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v4)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:a3->duration_msecs];
    [v4 setObject:v5 forKeyedSubscript:@"durationMsecs"];

    uint64_t v6 = [NSNumber numberWithUnsignedInt:a3->fragments_quenched];
    [v4 setObject:v6 forKeyedSubscript:@"fragmentsQuenched"];

    unsigned int v7 = a3->completion_reason - 1;
    if (v7 > 3) {
      uint64_t v8 = @"NW_ACTIVITY_COMPLETION_REASON_INVALID";
    }
    else {
      uint64_t v8 = off_1E52486C0[v7];
    }
    [v4 setObject:v8 forKeyedSubscript:@"completionReason"];
    __int16 v9 = [NSString stringWithUTF8String:a3->underlying_error_domain_string];
    [v4 setObject:v9 forKeyedSubscript:@"underlyingErrorDomainString"];

    uint64_t v10 = [NSNumber numberWithInt:a3->underlying_error_domain];
    [v4 setObject:v10 forKeyedSubscript:@"underlyingErrorDomain"];

    __int16 v11 = [NSNumber numberWithInt:a3->underlying_error_code];
    [v4 setObject:v11 forKeyedSubscript:@"underlyingErrorCode"];

    id v12 = v4;
  }

  return v4;
}

@end