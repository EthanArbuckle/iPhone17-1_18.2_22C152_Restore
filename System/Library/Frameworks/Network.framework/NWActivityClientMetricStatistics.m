@interface NWActivityClientMetricStatistics
- (NSData)metricData;
- (NSDictionary)clientMetric;
- (NSDictionary)dictionaryRepresentation;
- (NSString)bundleID;
- (NSString)clientMetricName;
- (NSString)clientMetricString;
- (NSUUID)activityUUID;
- (NSUUID)externallyVisibleActivityUUID;
- (NWActivityClientMetricStatistics)initWithData:(id)a3;
- (NWActivityClientMetricStatistics)initWithNWActivityClientMetricReport:(nw_activity_client_metric_report_s *)a3 length:(unint64_t)a4;
- (nw_activity_client_metric_report_s)report;
- (void)setActivityUUID:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setClientMetricName:(id)a3;
- (void)setClientMetricString:(id)a3;
- (void)setDictionaryRepresentation:(id)a3;
- (void)setExternallyVisibleActivityUUID:(id)a3;
- (void)setMetricData:(id)a3;
- (void)setReport:(nw_activity_client_metric_report_s *)a3;
@end

@implementation NWActivityClientMetricStatistics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricData, 0);
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_externallyVisibleActivityUUID, 0);

  objc_storeStrong((id *)&self->_activityUUID, 0);
}

- (void)setReport:(nw_activity_client_metric_report_s *)a3
{
}

- (nw_activity_client_metric_report_s)report
{
  return (nw_activity_client_metric_report_s *)memcpy(retstr, &self->_report, sizeof(nw_activity_client_metric_report_s));
}

- (void)setMetricData:(id)a3
{
}

- (void)setDictionaryRepresentation:(id)a3
{
}

- (void)setBundleID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setExternallyVisibleActivityUUID:(id)a3
{
}

- (NSUUID)externallyVisibleActivityUUID
{
  return self->_externallyVisibleActivityUUID;
}

- (void)setActivityUUID:(id)a3
{
}

- (NWActivityClientMetricStatistics)initWithData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NWActivityClientMetricStatistics;
  v5 = [(NWActivityClientMetricStatistics *)&v22 init];
  if (v5)
  {
    if (v4 && [v4 length])
    {
      id v19 = 0;
      v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v19];
      v7 = v19;
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v6 = v6;
        p_super = &v5->_dictionaryRepresentation->super;
        v5->_dictionaryRepresentation = v6;
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        p_super = (id)gLogObj;
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v24 = "-[NWActivityClientMetricStatistics initWithData:]";
          __int16 v25 = 2112;
          v26 = v7;
          _os_log_impl(&dword_1830D4000, p_super, OS_LOG_TYPE_ERROR, "%{public}s Failed to decode client metric data, skipping (error %@)", buf, 0x16u);
        }
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityClientMetricStatistics initWithData:]";
        _os_log_impl(&dword_1830D4000, v7, OS_LOG_TYPE_ERROR, "%{public}s Client metric data not present, skipping", buf, 0xCu);
      }
    }

    v17 = v5;
    goto LABEL_31;
  }
  v9 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v24 = "-[NWActivityClientMetricStatistics initWithData:]";
  v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v20 = 0;
  if (__nwlog_fault(v10, &type, &v20))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v11 = __nwlog_obj();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityClientMetricStatistics initWithData:]";
        _os_log_impl(&dword_1830D4000, v11, v12, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v20)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v11 = __nwlog_obj();
      os_log_type_t v14 = type;
      BOOL v15 = os_log_type_enabled(v11, type);
      if (backtrace_string)
      {
        if (v15)
        {
          *(_DWORD *)buf = 136446466;
          v24 = "-[NWActivityClientMetricStatistics initWithData:]";
          __int16 v25 = 2082;
          v26 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v11, v14, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_25;
      }
      if (v15)
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityClientMetricStatistics initWithData:]";
        _os_log_impl(&dword_1830D4000, v11, v14, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v11 = __nwlog_obj();
      os_log_type_t v16 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityClientMetricStatistics initWithData:]";
        _os_log_impl(&dword_1830D4000, v11, v16, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
LABEL_25:
  if (v10) {
    free(v10);
  }
LABEL_31:

  return v5;
}

- (NWActivityClientMetricStatistics)initWithNWActivityClientMetricReport:(nw_activity_client_metric_report_s *)a3 length:(unint64_t)a4
{
  v6 = (void *)MEMORY[0x1F4188790](self);
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (v5 == 5272)
  {
    memcpy(__dst, v4, sizeof(__dst));
    [v6 setReport:__dst];
    v7 = v6;
  }
  else
  {
    uint64_t v8 = v5;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446722;
      os_log_type_t v12 = "-[NWActivityClientMetricStatistics initWithNWActivityClientMetricReport:length:]";
      __int16 v13 = 2048;
      uint64_t v14 = 5272;
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1830D4000, v9, OS_LOG_TYPE_ERROR, "%{public}s Failed to initialize statistics object from nw_activity client metrics report, expected size %zd actual size %zd", (uint8_t *)&v11, 0x20u);
    }

    v7 = 0;
  }

  return v7;
}

- (NSData)metricData
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  metricData = self->_metricData;
  if (!metricData)
  {
    id v4 = [(NWActivityClientMetricStatistics *)self dictionaryRepresentation];
    if ([MEMORY[0x1E4F28D90] isValidJSONObject:v4])
    {
      id v9 = 0;
      uint64_t v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:0 error:&v9];
      id v6 = v9;
      if (v6 || !v5)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (NSData *)(id)gLogObj;
        if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136446466;
          int v11 = "-[NWActivityClientMetricStatistics metricData]";
          __int16 v12 = 2112;
          __int16 v13 = self;
          _os_log_impl(&dword_1830D4000, &v7->super, OS_LOG_TYPE_DEBUG, "%{public}s Failed to serialize client metric %@", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v5 = v5;
        id v6 = 0;
        v7 = self->_metricData;
        self->_metricData = v5;
      }
    }
    metricData = self->_metricData;
  }

  return metricData;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  dictionaryRepresentation = self->_dictionaryRepresentation;
  if (!dictionaryRepresentation)
  {
    id v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v5 = [(NWActivityClientMetricStatistics *)self clientMetricName];
    if (v5)
    {
      id v6 = [(NWActivityClientMetricStatistics *)self clientMetricName];
      [(NSDictionary *)v4 setObject:v6 forKey:@"name"];
    }
    v7 = [(NWActivityClientMetricStatistics *)self clientMetric];
    if (v7) {
      [(NSDictionary *)v4 setObject:v7 forKey:@"metric"];
    }
    uint64_t v8 = [(NWActivityClientMetricStatistics *)self bundleID];
    if (v8)
    {
      id v9 = (void *)v8;
      v10 = [(NWActivityClientMetricStatistics *)self bundleID];
      uint64_t v11 = [v10 length];

      if (v11)
      {
        __int16 v12 = [(NWActivityClientMetricStatistics *)self bundleID];
        [(NSDictionary *)v4 setObject:v12 forKey:@"bundleID"];
      }
    }
    __int16 v13 = [(NWActivityClientMetricStatistics *)self externallyVisibleActivityUUID];

    if (v13)
    {
      uint64_t v14 = [(NWActivityClientMetricStatistics *)self externallyVisibleActivityUUID];
      __int16 v15 = [v14 UUIDString];
      [(NSDictionary *)v4 setObject:v15 forKey:@"activityUUID"];
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 136446466;
      char v20 = "-[NWActivityClientMetricStatistics dictionaryRepresentation]";
      __int16 v21 = 2114;
      objc_super v22 = v4;
      _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_DEBUG, "%{public}s Generated nw_activity client metric report: %{public}@", (uint8_t *)&v19, 0x16u);
    }

    v17 = self->_dictionaryRepresentation;
    self->_dictionaryRepresentation = v4;

    dictionaryRepresentation = self->_dictionaryRepresentation;
  }

  return dictionaryRepresentation;
}

- (NSDictionary)clientMetric
{
  v2 = (void *)MEMORY[0x1F4188790](self);
  v19[625] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  [v2 report];
  [v2 report];
  if (strlen(v18) >> 3 > 0x270)
  {
    size_t v4 = 5000;
  }
  else
  {
    [v2 report];
    size_t v4 = strlen(v17);
  }
  uint64_t v5 = (void *)[v3 initWithBytesNoCopy:v19 length:v4 freeWhenDone:0];
  if (v5)
  {
    id v12 = 0;
    id v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v12];
    v7 = v12;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v8 = (id)gLogObj;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v14 = "-[NWActivityClientMetricStatistics clientMetric]";
        _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_DEBUG, "%{public}s Client metric is valid JSON", buf, 0xCu);
      }

      id v6 = v6;
      id v9 = v6;
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v14 = "-[NWActivityClientMetricStatistics clientMetric]";
        __int16 v15 = 2112;
        uint64_t v16 = v7;
        _os_log_impl(&dword_1830D4000, v10, OS_LOG_TYPE_DEBUG, "%{public}s Client metric is not valid JSON: %@", buf, 0x16u);
      }

      id v9 = 0;
    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v14 = "-[NWActivityClientMetricStatistics clientMetric]";
      _os_log_impl(&dword_1830D4000, v7, OS_LOG_TYPE_DEBUG, "%{public}s Failed to create clientMetric data", buf, 0xCu);
    }
    id v9 = 0;
  }

  return (NSDictionary *)v9;
}

- (void)setClientMetricString:(id)a3
{
  id v3 = (void *)MEMORY[0x1F4188790](self);
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = v4;
  if (gLogDatapath)
  {
    id v6 = __nwlog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      id v9 = "-[NWActivityClientMetricStatistics setClientMetricString:]";
      __int16 v10 = 2112;
      id v11 = v5;
      __int16 v12 = 2112;
      __int16 v13 = v3;
      _os_log_impl(&dword_1830D4000, v6, OS_LOG_TYPE_DEBUG, "%{public}s Set clientMetricString to %@ for %@", buf, 0x20u);
    }
  }
  [v3 report];
  strlcpy(v7, (const char *)[v5 UTF8String], 0x1388uLL);
}

- (NSString)clientMetricString
{
  v2 = (void *)MEMORY[0x1F4188790](self);
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (gLogDatapath)
  {
    id v6 = __nwlog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      [v2 report];
      *(_DWORD *)buf = 136446466;
      __int16 v10 = "-[NWActivityClientMetricStatistics clientMetricString]";
      __int16 v11 = 2080;
      __int16 v12 = &v8;
      _os_log_impl(&dword_1830D4000, v6, OS_LOG_TYPE_DEBUG, "%{public}s Client metric C string: %s", buf, 0x16u);
    }
  }
  id v3 = NSString;
  [v2 report];
  id v4 = [v3 stringWithCString:&v7 encoding:134217984];

  return (NSString *)v4;
}

- (void)setClientMetricName:(id)a3
{
  id v3 = (void *)MEMORY[0x1F4188790](self);
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = v4;
  if (gLogDatapath)
  {
    id v6 = __nwlog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      id v9 = "-[NWActivityClientMetricStatistics setClientMetricName:]";
      __int16 v10 = 2112;
      id v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v3;
      _os_log_impl(&dword_1830D4000, v6, OS_LOG_TYPE_DEBUG, "%{public}s Set clientMetricName to %@ for %@", buf, 0x20u);
    }
  }
  [v3 report];
  strlcpy(v7, (const char *)[v5 UTF8String], 0x100uLL);
}

- (NSString)clientMetricName
{
  v5[657] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  [(NWActivityClientMetricStatistics *)self report];
  id v3 = [v2 stringWithCString:v5 encoding:134217984];

  return (NSString *)v3;
}

- (NSUUID)activityUUID
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_activityUUID)
  {
    [(NWActivityClientMetricStatistics *)self report];
    if (!uuid_is_null(v9))
    {
      id v3 = objc_alloc(MEMORY[0x1E4F29128]);
      [(NWActivityClientMetricStatistics *)self report];
      id v4 = (NSUUID *)[v3 initWithUUIDBytes:v8];
      activityUUID = self->_activityUUID;
      self->_activityUUID = v4;
    }
  }
  id v6 = self->_activityUUID;

  return v6;
}

@end