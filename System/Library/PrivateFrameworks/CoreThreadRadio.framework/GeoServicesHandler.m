@interface GeoServicesHandler
- (BOOL)startMonitoring:(id)a3;
- (NSString)lastCountryCode;
- (void)regulatoryAreaGeoChanged;
- (void)setLastCountryCode:(id)a3;
- (void)stopMonitoring;
@end

@implementation GeoServicesHandler

- (BOOL)startMonitoring:(id)a3
{
  v4 = log_get_logging_obg("com.apple.threadradiod", "default");
  if (v4)
  {
    if (syslog_is_the_mask_enabled(6) && os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int monitoring = self->_monitoring;
      v9[0] = 67109120;
      v9[1] = monitoring;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[PowerTable] startMonitoring: Geo _monitoring: %d", (uint8_t *)v9, 8u);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    PcapManager::start_pcap_capture();
  }

  if (self->_monitoring)
  {
    v6 = log_get_logging_obg("com.apple.threadradiod", "default");
    if (v6)
    {
      if (syslog_is_the_mask_enabled(6) && os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[PowerTable] regulatory,geo,geosvc,startMonitoring, _monitoring is already true, done.", (uint8_t *)v9, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      PcapManager::start_pcap_capture();
    }
  }
  else
  {
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"countryConfigurationDidChangeNotification:" name:GEOCountryConfigurationCountryCodeDidChangeNotification object:0];

    self->_int monitoring = 1;
    [(GeoServicesHandler *)self regulatoryAreaGeoChanged];
  }
  return 1;
}

- (void)regulatoryAreaGeoChanged
{
  v4 = log_get_logging_obg("com.apple.threadradiod", "default");
  if (v4)
  {
    if (syslog_is_the_mask_enabled(6) && os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[PowerTable] regulatoryAreaGeoChanged: regulatory,geo,geosvc,regulatory area GEO changed notification.", buf, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    PcapManager::start_pcap_capture();
  }

  v5 = +[GEOCountryConfiguration sharedConfiguration];
  v6 = [v5 countryCode];

  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    v8 = log_get_logging_obg("com.apple.threadradiod", "default");
    if (v8)
    {
      if (syslog_is_the_mask_enabled(6) && os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[PowerTable] regulatory,geo,geosvc,regulatory area GEO changed: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      PcapManager::start_pcap_capture();
    }

    objc_storeStrong((id *)&v7->_lastCountryCode, v6);
    std::string::assign((std::string *)country, (const std::string::value_type *)[v6 cStringUsingEncoding:4]);
    if (country[23] < 0) {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)country, *(std::string::size_type *)&country[8]);
    }
    else {
      std::string __p = *(std::string *)country;
    }
    updateRegionNcp((uint64_t *)&__p);
  }
}

- (void)stopMonitoring
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:GEOCountryConfigurationCountryCodeDidChangeNotification object:0];

  v4 = log_get_logging_obg("com.apple.threadradiod", "default");
  if (v4)
  {
    if (syslog_is_the_mask_enabled(6))
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[PowerTable] regulatory,geo,geosvc,stopMonitoring done.", v5, 2u);
      }
    }
    goto LABEL_5;
  }
  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
LABEL_5:

    return;
  }
  PcapManager::start_pcap_capture();
}

- (NSString)lastCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end