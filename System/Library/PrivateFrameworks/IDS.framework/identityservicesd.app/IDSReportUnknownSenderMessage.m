@interface IDSReportUnknownSenderMessage
- (BOOL)isBlackholed;
- (BOOL)isJunked;
- (BOOL)wantsBodySignature;
- (BOOL)wantsExtraTimeoutRetry;
- (BOOL)wantsManagedRetries;
- (IDSReportUnknownSenderMessage)init;
- (NSString)messageID;
- (NSString)responseMessage;
- (NSString)unknownSenderURI;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int)maxTimeoutRetries;
- (int)messageServerTimestamp;
- (void)handleResponseDictionary:(id)a3;
- (void)setIsBlackholed:(BOOL)a3;
- (void)setIsJunked:(BOOL)a3;
- (void)setMessageID:(id)a3;
- (void)setMessageServerTimestamp:(int)a3;
- (void)setResponseMessage:(id)a3;
- (void)setUnknownSenderURI:(id)a3;
@end

@implementation IDSReportUnknownSenderMessage

- (IDSReportUnknownSenderMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)IDSReportUnknownSenderMessage;
  v2 = [(IDSReportUnknownSenderMessage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IDSReportUnknownSenderMessage *)v2 setTimeout:120.0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IDSReportUnknownSenderMessage;
  id v4 = [(IDSReportUnknownSenderMessage *)&v9 copyWithZone:a3];
  objc_super v5 = [(IDSReportUnknownSenderMessage *)self unknownSenderURI];
  [v4 setUnknownSenderURI:v5];

  v6 = [(IDSReportUnknownSenderMessage *)self messageID];
  [v4 setMessageID:v6];

  objc_msgSend(v4, "setIsBlackholed:", -[IDSReportUnknownSenderMessage isBlackholed](self, "isBlackholed"));
  objc_msgSend(v4, "setIsJunked:", -[IDSReportUnknownSenderMessage isJunked](self, "isJunked"));
  objc_msgSend(v4, "setMessageServerTimestamp:", -[IDSReportUnknownSenderMessage messageServerTimestamp](self, "messageServerTimestamp"));
  v7 = [(IDSReportUnknownSenderMessage *)self responseMessage];
  [v4 setResponseMessage:v7];

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
  [v2 addObject:@"message-id"];
  [v2 addObject:@"sender-uri"];
  [v2 addObject:@"time-of-message"];

  return v2;
}

- (id)messageBody
{
  v3 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(IDSReportUnknownSenderMessage *)self messageID];
  if (v4)
  {
    CFDictionarySetValue(v3, @"message-id", v4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007230E8();
  }

  objc_super v5 = +[NSNumber numberWithBool:[(IDSReportUnknownSenderMessage *)self isBlackholed]];
  if (v5) {
    CFDictionarySetValue(v3, @"message-is-blackholed", v5);
  }

  v6 = +[NSNumber numberWithBool:[(IDSReportUnknownSenderMessage *)self isJunked]];
  if (v6) {
    CFDictionarySetValue(v3, @"message-is-junked", v6);
  }

  v7 = [(IDSReportUnknownSenderMessage *)self unknownSenderURI];
  if (v7)
  {
    CFDictionarySetValue(v3, @"sender-uri", v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100723060();
  }

  v8 = +[NSNumber numberWithInt:[(IDSReportUnknownSenderMessage *)self messageServerTimestamp]];
  if (v8)
  {
    CFDictionarySetValue(v3, @"time-of-message", v8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100722FD8();
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
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Report Unknown Sender response: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v7 = v4;
    _IDSLogV();
  }
  v8.receiver = self;
  v8.super_class = (Class)IDSReportUnknownSenderMessage;
  -[IDSReportUnknownSenderMessage handleResponseDictionary:](&v8, "handleResponseDictionary:", v4, v7);
  v6 = [v4 objectForKey:@"message"];
  [(IDSReportUnknownSenderMessage *)self setResponseMessage:v6];
}

- (NSString)unknownSenderURI
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setUnknownSenderURI:(id)a3
{
}

- (NSString)messageID
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setMessageID:(id)a3
{
}

- (BOOL)isBlackholed
{
  return self->_isBlackholed;
}

- (void)setIsBlackholed:(BOOL)a3
{
  self->_isBlackholed = a3;
}

- (BOOL)isJunked
{
  return self->_isJunked;
}

- (void)setIsJunked:(BOOL)a3
{
  self->_isJunked = a3;
}

- (int)messageServerTimestamp
{
  return self->_messageServerTimestamp;
}

- (void)setMessageServerTimestamp:(int)a3
{
  self->_messageServerTimestamp = a3;
}

- (NSString)responseMessage
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setResponseMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseMessage, 0);
  objc_storeStrong((id *)&self->_messageID, 0);

  objc_storeStrong((id *)&self->_unknownSenderURI, 0);
}

@end