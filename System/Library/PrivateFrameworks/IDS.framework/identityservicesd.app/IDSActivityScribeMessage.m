@interface IDSActivityScribeMessage
- (BOOL)highPriority;
- (BOOL)isIDSMessage;
- (BOOL)isWebTunnelMessage;
- (BOOL)wantsAPSRetries;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsIDSProtocolVersion;
- (BOOL)wantsIntegerUniqueIDs;
- (BOOL)wantsResponse;
- (NSArray)tokens;
- (NSData)metadataBlob;
- (NSString)activityTopic;
- (NSString)messageID;
- (NSString)responsePresenceTopic;
- (NSString)subActivity;
- (id)additionalMessageHeadersForOutgoingPush;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)topic;
- (int)responseStatus;
- (int)version;
- (int64_t)command;
- (int64_t)responseCommand;
- (int64_t)ttl;
- (unsigned)activityPolicy;
- (unsigned)pushPriority;
- (void)handleResponseDictionary:(id)a3;
- (void)handleResponseHeaders:(id)a3;
- (void)setActivityPolicy:(unsigned __int8)a3;
- (void)setActivityTopic:(id)a3;
- (void)setMessageID:(id)a3;
- (void)setMetadataBlob:(id)a3;
- (void)setPushPriority:(unsigned __int8)a3;
- (void)setResponsePresenceTopic:(id)a3;
- (void)setResponseStatus:(int)a3;
- (void)setSubActivity:(id)a3;
- (void)setTokens:(id)a3;
- (void)setTtl:(int64_t)a3;
- (void)setVersion:(int)a3;
@end

@implementation IDSActivityScribeMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)IDSActivityScribeMessage;
  id v4 = [(IDSActivityScribeMessage *)&v11 copyWithZone:a3];
  v5 = [(IDSActivityScribeMessage *)self tokens];
  [v4 setTokens:v5];

  v6 = [(IDSActivityScribeMessage *)self activityTopic];
  [v4 setActivityTopic:v6];

  v7 = [(IDSActivityScribeMessage *)self subActivity];
  [v4 setSubActivity:v7];

  v8 = [(IDSActivityScribeMessage *)self metadataBlob];
  [v4 setMetadataBlob:v8];

  objc_msgSend(v4, "setTtl:", -[IDSActivityScribeMessage ttl](self, "ttl"));
  objc_msgSend(v4, "setPushPriority:", -[IDSActivityScribeMessage pushPriority](self, "pushPriority"));
  objc_msgSend(v4, "setActivityPolicy:", -[IDSActivityScribeMessage activityPolicy](self, "activityPolicy"));
  objc_msgSend(v4, "setVersion:", -[IDSActivityScribeMessage version](self, "version"));
  v9 = [(IDSActivityScribeMessage *)self messageID];
  [v4 setMessageID:v9];

  return v4;
}

- (int64_t)command
{
  return 221;
}

- (int64_t)responseCommand
{
  return 222;
}

- (BOOL)wantsBinaryPush
{
  return 1;
}

- (BOOL)wantsCompressedBody
{
  return 0;
}

- (BOOL)isWebTunnelMessage
{
  return 1;
}

- (BOOL)wantsIDSProtocolVersion
{
  return 0;
}

- (BOOL)wantsAPSRetries
{
  return 1;
}

- (BOOL)highPriority
{
  return 1;
}

- (BOOL)isIDSMessage
{
  return 0;
}

- (BOOL)wantsResponse
{
  return 1;
}

- (BOOL)wantsIntegerUniqueIDs
{
  return 1;
}

- (id)topic
{
  return @"com.apple.icloud.presence";
}

- (id)additionalMessageHeadersForOutgoingPush
{
  v5.receiver = self;
  v5.super_class = (Class)IDSActivityScribeMessage;
  v2 = [(IDSActivityScribeMessage *)&v5 additionalMessageHeaders];
  id v3 = [v2 mutableCopy];

  return v3;
}

- (id)messageBody
{
  v20.receiver = self;
  v20.super_class = (Class)IDSActivityScribeMessage;
  id v3 = [(IDSActivityScribeMessage *)&v20 messageBody];
  id v4 = (__CFDictionary *)[v3 mutableCopy];

  uint64_t v5 = [(IDSActivityScribeMessage *)self messageID];
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = [(IDSActivityScribeMessage *)self messageID];
    v8 = (const char *)[v7 UTF8String];

    if (v8)
    {
      memset(uu, 170, sizeof(uu));
      uuid_parse(v8, uu);
      uint64_t v19 = 0;
      jw_uuid_to_data();
      id v9 = 0;
      if (v9)
      {
        CFDictionarySetValue(v4, @"U", v9);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100710AD0();
      }
    }
  }
  v10 = +[NSNumber numberWithInt:[(IDSActivityScribeMessage *)self version]];
  if (v10)
  {
    CFDictionarySetValue(v4, @"v", v10);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100710A48();
  }

  objc_super v11 = +[NSNumber numberWithUnsignedChar:[(IDSActivityScribeMessage *)self pushPriority]];
  if (v11)
  {
    CFDictionarySetValue(v4, @"pMpr", v11);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007109C0();
  }

  v12 = +[NSNumber numberWithUnsignedChar:[(IDSActivityScribeMessage *)self activityPolicy]];
  if (v12)
  {
    CFDictionarySetValue(v4, @"pMpo", v12);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100710938();
  }

  v13 = [(IDSActivityScribeMessage *)self activityTopic];
  if (v13)
  {
    CFDictionarySetValue(v4, @"pAt", v13);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007108B0();
  }

  v14 = [(IDSActivityScribeMessage *)self subActivity];
  if (v14)
  {
    CFDictionarySetValue(v4, @"pSa", v14);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100710828();
  }

  v15 = +[NSNumber numberWithInteger:[(IDSActivityScribeMessage *)self ttl]];
  if (v15)
  {
    CFDictionarySetValue(v4, @"pTtl", v15);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007107A0();
  }

  v16 = [(IDSActivityScribeMessage *)self tokens];
  if (v16) {
    CFDictionarySetValue(v4, @"pSt", v16);
  }

  v17 = [(IDSActivityScribeMessage *)self metadataBlob];
  if (v17) {
    CFDictionarySetValue(v4, @"pAM", v17);
  }

  return v4;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 _stringForKey:@"pAT"];
  [(IDSActivityScribeMessage *)self setResponsePresenceTopic:v5];

  id v6 = [v4 _numberForKey:@"s"];

  -[IDSActivityScribeMessage setResponseStatus:](self, "setResponseStatus:", [v6 intValue]);
}

- (void)handleResponseHeaders:(id)a3
{
  id v3 = a3;
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Web Tunnel Message Completed With Respone Headers %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
}

- (NSString)activityTopic
{
  return self->_activityTopic;
}

- (void)setActivityTopic:(id)a3
{
}

- (NSString)subActivity
{
  return self->_subActivity;
}

- (void)setSubActivity:(id)a3
{
}

- (NSData)metadataBlob
{
  return self->_metadataBlob;
}

- (void)setMetadataBlob:(id)a3
{
}

- (unsigned)pushPriority
{
  return self->_pushPriority;
}

- (void)setPushPriority:(unsigned __int8)a3
{
  self->_pushPriority = a3;
}

- (unsigned)activityPolicy
{
  return self->_activityPolicy;
}

- (void)setActivityPolicy:(unsigned __int8)a3
{
  self->_activityPolicy = a3;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (NSString)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (int64_t)ttl
{
  return self->_ttl;
}

- (void)setTtl:(int64_t)a3
{
  self->_ttl = a3;
}

- (NSString)responsePresenceTopic
{
  return self->_responsePresenceTopic;
}

- (void)setResponsePresenceTopic:(id)a3
{
}

- (int)responseStatus
{
  return self->_responseStatus;
}

- (void)setResponseStatus:(int)a3
{
  self->_responseStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responsePresenceTopic, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_metadataBlob, 0);
  objc_storeStrong((id *)&self->_subActivity, 0);
  objc_storeStrong((id *)&self->_activityTopic, 0);

  objc_storeStrong((id *)&self->_tokens, 0);
}

@end