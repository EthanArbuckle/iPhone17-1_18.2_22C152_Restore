@interface BCSWiFiConfigurationParser
+ (id)parseString:(id)a3;
@end

@implementation BCSWiFiConfigurationParser

+ (id)parseString:(id)a3
{
  id v3 = a3;
  BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v4) {
    +[BCSWiFiConfigurationParser parseString:].cold.5(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if ((unint64_t)[v3 length] <= 4)
  {
    BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v12) {
      +[BCSWiFiConfigurationParser parseString:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
LABEL_25:
    v31 = 0;
    goto LABEL_30;
  }
  if (([v3 hasPrefix:@"WIFI:"] & 1) == 0)
  {
    BOOL v36 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v36) {
      +[BCSWiFiConfigurationParser parseString:].cold.4(v36, v37, v38, v39, v40, v41, v42, v43);
    }
    goto LABEL_25;
  }
  v20 = [[BCSKeyValueParser alloc] initWithString:v3 startIndex:5];
  v21 = [(BCSKeyValueParser *)v20 keyValuePairs];
  v22 = [v21 objectForKeyedSubscript:@"S"];
  if (![v22 length])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BCSWiFiConfigurationParser parseString:]();
    }
    v31 = [[BCSInvalidParsedData alloc] initWithInvalidDataType:8 invalidContents:v3];
    goto LABEL_29;
  }
  v23 = [v21 objectForKeyedSubscript:@"T"];
  v24 = [v21 objectForKeyedSubscript:@"P"];
  v25 = [v21 objectForKeyedSubscript:@"H"];
  uint64_t v26 = [v25 BOOLValue];

  if ([v23 isEqualToString:@"WEP"])
  {
    uint64_t v27 = objc_msgSend(v24, "_bcs_stringWithEnclosingDoubleQuotesRemoved");

    v24 = (void *)v27;
  }
  if (v23 && ![v23 isEqualToString:@"nopass"])
  {
    if ([v23 isEqualToString:@"WEP"])
    {
      uint64_t v28 = 1;
    }
    else
    {
      if (([v23 isEqualToString:@"WPA"] & 1) == 0
        && ([v23 isEqualToString:@"WPA2"] & 1) == 0
        && ([v23 isEqualToString:@"WPA/WPA2"] & 1) == 0
        && ([v23 isEqualToString:@"SAE"] & 1) == 0)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          +[BCSWiFiConfigurationParser parseString:]();
        }
        v31 = [[BCSInvalidParsedData alloc] initWithInvalidDataType:8 invalidContents:v3];
        goto LABEL_22;
      }
      uint64_t v28 = 0;
    }
  }
  else
  {

    uint64_t v28 = 0;
    v24 = 0;
  }
  v45 = v23;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSWiFiConfigurationParser: Successfully parsed WiFi Network configuration", buf, 2u);
  }
  v29 = v20;
  v30 = v22;
  v31 = [[BCSWiFiConfigurationData alloc] initWithSSID:v22 isWEP:v28 password:v24 isHidden:v26];
  v32 = [v21 objectForKeyedSubscript:@"AAB"];
  v33 = [v21 objectForKeyedSubscript:@"AAP"];
  v34 = [v21 objectForKeyedSubscript:@"CPT"];
  if (v32 && v33)
  {
    [(BCSInvalidParsedData *)v31 setAirplayBrokerID:v32];
    [(BCSInvalidParsedData *)v31 setAirplayBrokerPin:v33];
  }
  v35 = [(BCSInvalidParsedData *)v31 airplayBrokerID];

  if (v35 && v34) {
    [(BCSInvalidParsedData *)v31 setCaptivePortalToken:v34];
  }

  v20 = v29;
  v22 = v30;
  v23 = v45;
LABEL_22:

LABEL_29:
LABEL_30:

  return v31;
}

+ (void)parseString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:.cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSWiFiConfigurationParser: Network SSID not specified", v0, 2u);
}

+ (void)parseString:.cold.3()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSWiFiConfigurationParser: Illegal authentication type specified", v0, 2u);
}

+ (void)parseString:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end