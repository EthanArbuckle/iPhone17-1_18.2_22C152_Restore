@interface IDSReportApprovedTempUser
- (BOOL)wantsBodySignature;
- (BOOL)wantsExtraTimeoutRetry;
- (BOOL)wantsManagedRetries;
- (IDSReportApprovedTempUser)init;
- (NSString)responseMessage;
- (NSString)tempUserID;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int)maxTimeoutRetries;
- (int64_t)reportAction;
- (void)handleResponseDictionary:(id)a3;
- (void)setReportAction:(int64_t)a3;
- (void)setResponseMessage:(id)a3;
- (void)setTempUserID:(id)a3;
@end

@implementation IDSReportApprovedTempUser

- (IDSReportApprovedTempUser)init
{
  v5.receiver = self;
  v5.super_class = (Class)IDSReportApprovedTempUser;
  v2 = [(IDSReportApprovedTempUser *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IDSReportApprovedTempUser *)v2 setTimeout:120.0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IDSReportApprovedTempUser;
  id v4 = [(IDSReportApprovedTempUser *)&v8 copyWithZone:a3];
  objc_super v5 = [(IDSReportApprovedTempUser *)self tempUserID];
  [v4 setTempUserID:v5];

  objc_msgSend(v4, "setReportAction:", -[IDSReportApprovedTempUser reportAction](self, "reportAction"));
  v6 = [(IDSReportApprovedTempUser *)self responseMessage];
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
  return @"id-report-web-approval-status";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [v2 addObject:@"web-uri"];
  [v2 addObject:@"is-approved"];

  return v2;
}

- (id)messageBody
{
  v3 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v4 = +[NSNumber numberWithInt:(id)[(IDSReportApprovedTempUser *)self reportAction] == (id)1];
  if (v4)
  {
    CFDictionarySetValue(v3, @"is-approved", v4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100708C08();
  }

  objc_super v5 = [(IDSReportApprovedTempUser *)self tempUserID];
  if (v5)
  {
    CFDictionarySetValue(v3, @"web-uri", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100708B6C();
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
  v8.super_class = (Class)IDSReportApprovedTempUser;
  -[IDSReportApprovedTempUser handleResponseDictionary:](&v8, "handleResponseDictionary:", v4, v7);
  v6 = [v4 objectForKey:@"message"];
  [(IDSReportApprovedTempUser *)self setResponseMessage:v6];
}

- (NSString)tempUserID
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setTempUserID:(id)a3
{
}

- (int64_t)reportAction
{
  return self->_reportAction;
}

- (void)setReportAction:(int64_t)a3
{
  self->_reportAction = a3;
}

- (NSString)responseMessage
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setResponseMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseMessage, 0);

  objc_storeStrong((id *)&self->_tempUserID, 0);
}

@end