@interface IDSReportClientEventMessage
- (BOOL)wantsIDSProtocolVersion;
- (IDSReportClientEventMessage)init;
- (NSDictionary)report;
- (NSDictionary)responseMessage;
- (NSString)hardwareVersion;
- (NSString)osVersion;
- (NSString)reportType;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)handleResponseBody:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setReport:(id)a3;
- (void)setReportType:(id)a3;
- (void)setResponseMessage:(id)a3;
@end

@implementation IDSReportClientEventMessage

- (IDSReportClientEventMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)IDSReportClientEventMessage;
  v2 = [(IDSReportClientEventMessage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IDSReportClientEventMessage *)v2 setTimeout:120.0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IDSReportClientEventMessage;
  id v4 = [(IDSReportClientEventMessage *)&v9 copyWithZone:a3];
  objc_super v5 = [(IDSReportClientEventMessage *)self report];
  [v4 setReport:v5];

  v6 = [(IDSReportClientEventMessage *)self reportType];
  [v4 setReportType:v6];

  v7 = [(IDSReportClientEventMessage *)self responseMessage];
  [v4 setResponseMessage:v7];

  return v4;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (BOOL)wantsIDSProtocolVersion
{
  return 1;
}

- (id)bagKey
{
  return @"id-client-report";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [v2 addObject:@"report-type"];
  [v2 addObject:@"report"];

  return v2;
}

- (id)messageBody
{
  v3 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(IDSReportClientEventMessage *)self reportType];
  if (v4)
  {
    CFDictionarySetValue(v3, @"report-type", v4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F004();
  }

  objc_super v5 = [(IDSReportClientEventMessage *)self report];
  if (v5)
  {
    CFDictionarySetValue(v3, @"report", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070EF7C();
  }

  v6 = [(IDSReportClientEventMessage *)self hardwareVersion];
  if (v6)
  {
    CFDictionarySetValue(v3, @"hardware-version", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007094E4();
  }

  v7 = [(IDSReportClientEventMessage *)self osVersion];
  if (v7)
  {
    CFDictionarySetValue(v3, @"os-version", v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070945C();
  }

  return v3;
}

- (void)handleResponseBody:(id)a3
{
  id v4 = a3;
  objc_super v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling client event response body", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  id v11 = 0;
  v6 = +[NSJSONSerialization JSONObjectWithData:v4 options:0 error:&v11];
  id v7 = v11;
  if (v7)
  {
    v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error parsing JSON response: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  else
  {
    objc_super v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Converted client event response: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v10 = v6;
      _IDSLogV();
    }
    -[IDSReportClientEventMessage setResponseMessage:](self, "setResponseMessage:", v6, v10);
  }
}

- (NSDictionary)report
{
  return (NSDictionary *)objc_getProperty(self, a2, 232, 1);
}

- (void)setReport:(id)a3
{
}

- (NSString)reportType
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setReportType:(id)a3
{
}

- (NSString)hardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setHardwareVersion:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (NSDictionary)responseMessage
{
  return (NSDictionary *)objc_getProperty(self, a2, 264, 1);
}

- (void)setResponseMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseMessage, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_reportType, 0);

  objc_storeStrong((id *)&self->_report, 0);
}

@end