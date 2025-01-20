@interface NWActivityStatistics
+ (id)createActivityReportDictionary:(nw_activity_report_s *)a3 uuidString:(id)a4 parentUUIDString:(id)a5;
- (BOOL)retry;
- (NSDictionary)deviceReport;
- (NSDictionary)layer2Report;
- (NSMutableDictionary)dictionaryReport;
- (NSString)bundleID;
- (NSUUID)activityUUID;
- (NSUUID)externallyVisibleActivityUUID;
- (NSUUID)externallyVisibleParentUUID;
- (NSUUID)parentUUID;
- (NWActivityStatistics)initWithJSONData:(id)a3;
- (NWActivityStatistics)initWithNWActivityReport:(nw_activity_report_s *)a3 length:(unint64_t)a4;
- (nw_activity_report_s)report;
- (unint64_t)investigation_identifier;
- (unsigned)domain;
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
- (void)setReport:(nw_activity_report_s *)a3;
@end

@implementation NWActivityStatistics

+ (id)createActivityReportDictionary:(nw_activity_report_s *)a3 uuidString:(id)a4 parentUUIDString:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v9)
  {
    v10 = [NSNumber numberWithUnsignedInt:a3->domain];
    [v9 setObject:v10 forKeyedSubscript:@"activityDomain"];

    v11 = [NSNumber numberWithUnsignedInt:a3->label];
    [v9 setObject:v11 forKeyedSubscript:@"activityLabel"];

    v12 = [NSNumber numberWithInt:*((unsigned char *)a3 + 304) & 1];
    [v9 setObject:v12 forKeyedSubscript:@"isRetry"];

    [v9 setObject:v7 forKeyedSubscript:@"activityUUID"];
    [v9 setObject:v8 forKeyedSubscript:@"parentActivityUUID"];
    v13 = [NSString stringWithCString:a3->bundle_id encoding:134217984];
    [v9 setObject:v13 forKeyedSubscript:@"bundleID"];

    if (os_variant_has_internal_diagnostics())
    {
      v14 = [NSNumber numberWithUnsignedLongLong:a3->investigation_identifier];
      [v9 setObject:v14 forKeyedSubscript:@"investigationID"];
    }
    id v15 = v9;
  }

  return v9;
}

- (NSMutableDictionary)dictionaryReport
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_dictionaryReport = &self->_dictionaryReport;
  dictionaryReport = self->_dictionaryReport;
  if (dictionaryReport)
  {
LABEL_14:
    v17 = dictionaryReport;
    goto LABEL_15;
  }
  v5 = [(NWActivityStatistics *)self externallyVisibleActivityUUID];

  if (v5)
  {
    v6 = [(NWActivityStatistics *)self externallyVisibleActivityUUID];
    v5 = [v6 UUIDString];
  }
  id v7 = [(NWActivityStatistics *)self externallyVisibleParentUUID];

  if (v7)
  {
    id v8 = [(NWActivityStatistics *)self externallyVisibleParentUUID];
    id v7 = [v8 UUIDString];
  }
  [(NWActivityStatistics *)self report];
  uint64_t v9 = +[NWActivityStatistics createActivityReportDictionary:v23 uuidString:v5 parentUUIDString:v7];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(NWActivityStatistics *)self layer2Report];

    if (v11)
    {
      v12 = [(NWActivityStatistics *)self layer2Report];
      [v10 setObject:v12 forKeyedSubscript:@"l2Report"];
    }
    v13 = [(NWActivityStatistics *)self deviceReport];

    if (v13)
    {
      v14 = [(NWActivityStatistics *)self deviceReport];
      [v10 setObject:v14 forKeyedSubscript:@"deviceReport"];
    }
    [(NWActivityStatistics *)self setMetricType:3];
    objc_storeStrong((id *)p_dictionaryReport, v10);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v15 = (id)gLogObj;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = *p_dictionaryReport;
      int v19 = 136446466;
      v20 = "-[NWActivityStatistics dictionaryReport]";
      __int16 v21 = 2114;
      v22 = v16;
      _os_log_impl(&dword_1830D4000, v15, OS_LOG_TYPE_DEBUG, "%{public}s Generated nw_activity report: %{public}@", (uint8_t *)&v19, 0x16u);
    }

    dictionaryReport = *p_dictionaryReport;
    goto LABEL_14;
  }

  v17 = 0;
LABEL_15:

  return v17;
}

- (NSDictionary)layer2Report
{
  return self->_layer2Report;
}

- (NSUUID)externallyVisibleActivityUUID
{
  return self->_externallyVisibleActivityUUID;
}

- (NSDictionary)deviceReport
{
  return self->_deviceReport;
}

- (NSUUID)activityUUID
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_activityUUID)
  {
    [(NWActivityStatistics *)self report];
    if (!uuid_is_null(v9))
    {
      id v3 = objc_alloc(MEMORY[0x1E4F29128]);
      [(NWActivityStatistics *)self report];
      v4 = (NSUUID *)[v3 initWithUUIDBytes:&v8];
      activityUUID = self->_activityUUID;
      self->_activityUUID = v4;
    }
  }
  v6 = self->_activityUUID;

  return v6;
}

- (nw_activity_report_s)report
{
  return (nw_activity_report_s *)memcpy(retstr, &self->_report, sizeof(nw_activity_report_s));
}

- (void)setReport:(nw_activity_report_s *)a3
{
}

- (void)setMetricType:(unsigned __int8)a3
{
  self->_metricType = a3;
}

- (void)setLayer2Report:(id)a3
{
}

- (void)setExternallyVisibleActivityUUID:(id)a3
{
}

- (void)setDeviceReport:(id)a3
{
}

- (NSUUID)parentUUID
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_parentUUID)
  {
    [(NWActivityStatistics *)self report];
    if (!uuid_is_null(v9))
    {
      id v3 = objc_alloc(MEMORY[0x1E4F29128]);
      [(NWActivityStatistics *)self report];
      v4 = (NSUUID *)[v3 initWithUUIDBytes:&v8];
      parentUUID = self->_parentUUID;
      self->_parentUUID = v4;
    }
  }
  v6 = self->_parentUUID;

  return v6;
}

- (NWActivityStatistics)initWithNWActivityReport:(nw_activity_report_s *)a3 length:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a4 == 312)
  {
    memcpy(__dst, a3, sizeof(__dst));
    [(NWActivityStatistics *)self setReport:__dst];
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
      uint64_t v10 = "-[NWActivityStatistics initWithNWActivityReport:length:]";
      __int16 v11 = 2048;
      uint64_t v12 = 312;
      __int16 v13 = 2048;
      unint64_t v14 = a4;
      _os_log_impl(&dword_1830D4000, v7, OS_LOG_TYPE_ERROR, "%{public}s failure to initialize statistics object from nw_activity report, expected size %zd actual size %zd", (uint8_t *)&v9, 0x20u);
    }

    v5 = 0;
  }

  return v5;
}

- (NSUUID)externallyVisibleParentUUID
{
  return self->_externallyVisibleParentUUID;
}

- (unsigned)domain
{
  [(NWActivityStatistics *)self report];
  return v3;
}

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

- (void)setDictionaryReport:(id)a3
{
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

- (NWActivityStatistics)initWithJSONData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NWActivityStatistics;
  v5 = [(NWActivityStatistics *)&v22 init];
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
    int v9 = v5;
    goto LABEL_6;
  }
  __int16 v11 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  uint64_t v24 = "-[NWActivityStatistics initWithJSONData:]";
  uint64_t v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v20 = 0;
  if (__nwlog_fault(v12, &type, &v20))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __int16 v13 = __nwlog_obj();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v24 = "-[NWActivityStatistics initWithJSONData:]";
        _os_log_impl(&dword_1830D4000, v13, v14, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v20)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __int16 v13 = __nwlog_obj();
      os_log_type_t v16 = type;
      BOOL v17 = os_log_type_enabled(v13, type);
      if (backtrace_string)
      {
        if (v17)
        {
          *(_DWORD *)buf = 136446466;
          uint64_t v24 = "-[NWActivityStatistics initWithJSONData:]";
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
        uint64_t v24 = "-[NWActivityStatistics initWithJSONData:]";
        _os_log_impl(&dword_1830D4000, v13, v16, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __int16 v13 = __nwlog_obj();
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v24 = "-[NWActivityStatistics initWithJSONData:]";
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

- (unsigned)metricType
{
  if (self->_metricType) {
    return self->_metricType;
  }
  else {
    return 3;
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
      uint64_t v8 = "-[NWActivityStatistics setBundleID:]";
      __int16 v9 = 2112;
      id v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = self;
      _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_DEBUG, "%{public}s Set bundle ID to %@ for %@", buf, 0x20u);
    }
  }
  [(NWActivityStatistics *)self report];
  strlcpy(v6, (const char *)[v4 UTF8String], 0x100uLL);
}

- (NSString)bundleID
{
  v5[33] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  [(NWActivityStatistics *)self report];
  unsigned int v3 = [v2 stringWithCString:v5 encoding:134217984];

  return (NSString *)v3;
}

- (unint64_t)investigation_identifier
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(NWActivityStatistics *)self report];
  return v3;
}

- (BOOL)retry
{
  [(NWActivityStatistics *)self report];
  return v3 & 1;
}

- (unsigned)label
{
  [(NWActivityStatistics *)self report];
  return v3;
}

@end