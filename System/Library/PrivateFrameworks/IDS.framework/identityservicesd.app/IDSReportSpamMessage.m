@interface IDSReportSpamMessage
- (BOOL)wantsBodySignature;
- (BOOL)wantsExtraTimeoutRetry;
- (BOOL)wantsManagedRetries;
- (IDSReportSpamMessage)init;
- (NSArray)responseSpamMessages;
- (NSArray)spamMessages;
- (NSString)responseMessage;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int)maxTimeoutRetries;
- (void)handleResponseDictionary:(id)a3;
- (void)setResponseMessage:(id)a3;
- (void)setResponseSpamMessages:(id)a3;
- (void)setSpamMessages:(id)a3;
@end

@implementation IDSReportSpamMessage

- (IDSReportSpamMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)IDSReportSpamMessage;
  v2 = [(IDSReportSpamMessage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IDSReportSpamMessage *)v2 setTimeout:120.0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IDSReportSpamMessage;
  id v4 = [(IDSReportSpamMessage *)&v9 copyWithZone:a3];
  objc_super v5 = [(IDSReportSpamMessage *)self spamMessages];
  [v4 setSpamMessages:v5];

  v6 = [(IDSReportSpamMessage *)self responseMessage];
  [v4 setResponseMessage:v6];

  v7 = [(IDSReportSpamMessage *)self responseSpamMessages];
  [v4 setResponseSpamMessages:v7];

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
  [v2 addObject:@"spam-messages"];

  return v2;
}

- (id)messageBody
{
  v3 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(IDSReportSpamMessage *)self spamMessages];
  if (v4)
  {
    CFDictionarySetValue(v3, @"spam-messages", v4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071DDB8();
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
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Report Spam response: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v8 = v4;
    _IDSLogV();
  }
  v9.receiver = self;
  v9.super_class = (Class)IDSReportSpamMessage;
  -[IDSReportSpamMessage handleResponseDictionary:](&v9, "handleResponseDictionary:", v4, v8);
  v6 = [v4 objectForKey:@"message"];
  [(IDSReportSpamMessage *)self setResponseMessage:v6];

  v7 = [v4 objectForKey:@"spam-messages"];
  [(IDSReportSpamMessage *)self setResponseSpamMessages:v7];
}

- (NSArray)spamMessages
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setSpamMessages:(id)a3
{
}

- (NSString)responseMessage
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setResponseMessage:(id)a3
{
}

- (NSArray)responseSpamMessages
{
  return (NSArray *)objc_getProperty(self, a2, 248, 1);
}

- (void)setResponseSpamMessages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseSpamMessages, 0);
  objc_storeStrong((id *)&self->_responseMessage, 0);

  objc_storeStrong((id *)&self->_spamMessages, 0);
}

@end