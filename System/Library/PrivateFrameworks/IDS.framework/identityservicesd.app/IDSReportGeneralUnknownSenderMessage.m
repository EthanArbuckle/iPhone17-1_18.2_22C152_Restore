@interface IDSReportGeneralUnknownSenderMessage
- (BOOL)wantsBodySignature;
- (BOOL)wantsExtraTimeoutRetry;
- (BOOL)wantsManagedRetries;
- (IDSReportGeneralUnknownSenderMessage)init;
- (NSDictionary)unknownSenderInfo;
- (NSString)responseMessage;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int)maxTimeoutRetries;
- (void)handleResponseDictionary:(id)a3;
- (void)setResponseMessage:(id)a3;
- (void)setUnknownSenderInfo:(id)a3;
@end

@implementation IDSReportGeneralUnknownSenderMessage

- (IDSReportGeneralUnknownSenderMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)IDSReportGeneralUnknownSenderMessage;
  v2 = [(IDSReportGeneralUnknownSenderMessage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IDSReportGeneralUnknownSenderMessage *)v2 setTimeout:120.0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IDSReportGeneralUnknownSenderMessage;
  id v4 = [(IDSReportGeneralUnknownSenderMessage *)&v8 copyWithZone:a3];
  objc_super v5 = [(IDSReportGeneralUnknownSenderMessage *)self unknownSenderInfo];
  [v4 setUnknownSenderInfo:v5];

  v6 = [(IDSReportGeneralUnknownSenderMessage *)self responseMessage];
  [v4 setResponseMessage:v6];

  return v4;
}

- (BOOL)wantsExtraTimeoutRetry
{
  return 1;
}

- (int)maxTimeoutRetries
{
  return 2;
}

- (BOOL)wantsBodySignature
{
  return 1;
}

- (BOOL)wantsManagedRetries
{
  return 0;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (id)bagKey
{
  return @"id-report-unknown";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [v2 addObject:@"unknown-sender-info"];

  return v2;
}

- (id)messageBody
{
  v3 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(IDSReportGeneralUnknownSenderMessage *)self unknownSenderInfo];
  if (v4)
  {
    CFDictionarySetValue(v3, @"unknown-sender-info", v4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071DBD8();
  }

  return v3;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  objc_super v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "General unknown sender response: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v7 = v4;
    _IDSLogV();
  }
  v8.receiver = self;
  v8.super_class = (Class)IDSReportGeneralUnknownSenderMessage;
  -[IDSReportGeneralUnknownSenderMessage handleResponseDictionary:](&v8, "handleResponseDictionary:", v4, v7);
  v6 = [v4 objectForKey:@"message"];
  [(IDSReportGeneralUnknownSenderMessage *)self setResponseMessage:v6];
}

- (NSDictionary)unknownSenderInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 232, 1);
}

- (void)setUnknownSenderInfo:(id)a3
{
}

- (NSString)responseMessage
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setResponseMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseMessage, 0);

  objc_storeStrong((id *)&self->_unknownSenderInfo, 0);
}

@end