@interface IDSReportGeneralSpamMessage
- (BOOL)wantsBodySignature;
- (BOOL)wantsExtraTimeoutRetry;
- (BOOL)wantsManagedRetries;
- (IDSReportGeneralSpamMessage)init;
- (NSDictionary)responseSpamMessage;
- (NSDictionary)spamMessage;
- (NSString)responseMessage;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int)maxTimeoutRetries;
- (void)handleResponseDictionary:(id)a3;
- (void)setResponseMessage:(id)a3;
- (void)setResponseSpamMessage:(id)a3;
- (void)setSpamMessage:(id)a3;
@end

@implementation IDSReportGeneralSpamMessage

- (IDSReportGeneralSpamMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)IDSReportGeneralSpamMessage;
  v2 = [(IDSReportGeneralSpamMessage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IDSReportGeneralSpamMessage *)v2 setTimeout:120.0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IDSReportGeneralSpamMessage;
  id v4 = [(IDSReportGeneralSpamMessage *)&v9 copyWithZone:a3];
  objc_super v5 = [(IDSReportGeneralSpamMessage *)self spamMessage];
  [v4 setSpamMessage:v5];

  v6 = [(IDSReportGeneralSpamMessage *)self responseMessage];
  [v4 setResponseMessage:v6];

  v7 = [(IDSReportGeneralSpamMessage *)self responseSpamMessage];
  [v4 setResponseSpamMessage:v7];

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
  return @"id-report-spam";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [v2 addObject:@"spam-message"];

  return v2;
}

- (id)messageBody
{
  v3 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(IDSReportGeneralSpamMessage *)self spamMessage];
  if (v4)
  {
    CFDictionarySetValue(v3, @"spam-message", v4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B590();
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
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "General Report Spam response: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v8 = v4;
    _IDSLogV();
  }
  v9.receiver = self;
  v9.super_class = (Class)IDSReportGeneralSpamMessage;
  -[IDSReportGeneralSpamMessage handleResponseDictionary:](&v9, "handleResponseDictionary:", v4, v8);
  v6 = [v4 objectForKey:@"message"];
  [(IDSReportGeneralSpamMessage *)self setResponseMessage:v6];

  v7 = [v4 objectForKey:@"spam-messages"];
  [(IDSReportGeneralSpamMessage *)self setResponseSpamMessage:v7];
}

- (NSDictionary)spamMessage
{
  return (NSDictionary *)objc_getProperty(self, a2, 232, 1);
}

- (void)setSpamMessage:(id)a3
{
}

- (NSString)responseMessage
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setResponseMessage:(id)a3
{
}

- (NSDictionary)responseSpamMessage
{
  return (NSDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (void)setResponseSpamMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseSpamMessage, 0);
  objc_storeStrong((id *)&self->_responseMessage, 0);

  objc_storeStrong((id *)&self->_spamMessage, 0);
}

@end