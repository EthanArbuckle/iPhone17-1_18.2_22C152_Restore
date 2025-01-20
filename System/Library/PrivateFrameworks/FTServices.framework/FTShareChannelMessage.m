@interface FTShareChannelMessage
- (BOOL)highPriority;
- (BOOL)isIDSMessage;
- (BOOL)isWebTunnelMessage;
- (BOOL)ultraConstrainedAllowed;
- (BOOL)wantsAPSRetries;
- (BOOL)wantsBAASigning;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsIDSProtocolVersion;
- (BOOL)wantsIntegerUniqueIDs;
- (BOOL)wantsResponse;
- (BOOL)wantsUserAgentInHeaders;
- (FTShareChannelMessage)initWithProtoData:(id)a3 messageType:(int)a4;
- (NSData)protoData;
- (NSData)protoResponse;
- (NSString)messageID;
- (id)additionalMessageHeadersForOutgoingPush;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)topic;
- (id)userAgentHeaderString;
- (int)messageType;
- (int)responseValue;
- (int)version;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)handleResponseDictionary:(id)a3;
- (void)handleResponseHeaders:(id)a3;
- (void)setMessageID:(id)a3;
- (void)setMessageType:(int)a3;
- (void)setProtoData:(id)a3;
- (void)setProtoResponse:(id)a3;
- (void)setResponseValue:(int)a3;
- (void)setVersion:(int)a3;
@end

@implementation FTShareChannelMessage

- (FTShareChannelMessage)initWithProtoData:(id)a3 messageType:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FTShareChannelMessage;
  v8 = [(FTIDSMessage *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_protoData, a3);
    v9->_messageType = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)FTShareChannelMessage;
  id v4 = [(FTIDSMessage *)&v18 copyWithZone:a3];
  id v7 = objc_msgSend_messageID(self, v5, v6);
  objc_msgSend_setMessageID_(v4, v8, (uint64_t)v7);

  uint64_t v11 = objc_msgSend_version(self, v9, v10);
  objc_msgSend_setVersion_(v4, v12, v11);
  v15 = objc_msgSend_protoData(self, v13, v14);
  objc_msgSend_setProtoData_(v4, v16, (uint64_t)v15);

  return v4;
}

- (int64_t)command
{
  int v3 = objc_msgSend_messageType(self, a2, v2);
  int64_t v4 = 224;
  if (v3 == 2) {
    int64_t v4 = 225;
  }
  if (v3 == 3) {
    return 226;
  }
  else {
    return v4;
  }
}

- (int64_t)responseCommand
{
  int v3 = objc_msgSend_messageType(self, a2, v2);
  int64_t v4 = 224;
  if (v3 == 2) {
    int64_t v4 = 225;
  }
  if (v3 == 3) {
    return 226;
  }
  else {
    return v4;
  }
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

- (BOOL)wantsBAASigning
{
  return 0;
}

- (BOOL)ultraConstrainedAllowed
{
  return 1;
}

- (id)topic
{
  return @"com.apple.icloud.presence.channel.management";
}

- (id)userAgentHeaderString
{
  return @"ua";
}

- (BOOL)wantsUserAgentInHeaders
{
  return 0;
}

- (id)additionalMessageHeadersForOutgoingPush
{
  v7.receiver = self;
  v7.super_class = (Class)FTShareChannelMessage;
  uint64_t v2 = [(FTIDSMessage *)&v7 additionalMessageHeaders];
  v5 = objc_msgSend_mutableCopy(v2, v3, v4);

  return v5;
}

- (id)messageBody
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)FTShareChannelMessage;
  int v3 = [(IDSBaseMessage *)&v33 messageBody];
  uint64_t v6 = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5);

  uint64_t v11 = objc_msgSend_messageID(self, v7, v8);
  if (v11) {
    objc_msgSend_messageID(self, v9, v10);
  }
  else {
    objc_msgSend_stringGUID(NSString, v9, v10);
  }
  id v12 = objc_claimAutoreleasedReturnValue();
  v15 = (const char *)objc_msgSend_UTF8String(v12, v13, v14);

  memset(uu, 170, sizeof(uu));
  uuid_parse(v15, uu);
  jw_uuid_to_data();
  id v16 = 0;
  unsigned int v19 = objc_msgSend_version(self, v17, v18);
  if (v19 <= 1) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = v19;
  }
  id v21 = v16;
  if (v21)
  {
    CFDictionarySetValue(v6, @"U", v21);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1A7BFE190();
  }

  v23 = objc_msgSend_numberWithInt_(NSNumber, v22, v20);
  if (v23)
  {
    CFDictionarySetValue(v6, @"v", v23);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1A7BFE108();
  }

  int v26 = objc_msgSend_messageType(self, v24, v25);
  v29 = objc_msgSend_protoData(self, v27, v28);
  v30 = v29;
  if (v26 == 3)
  {
    if (v29)
    {
      v31 = @"scPrReq";
LABEL_20:
      CFDictionarySetValue(v6, v31, v29);
      goto LABEL_25;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      sub_1A7BFF0C4();
    }
  }
  else
  {
    if (v29)
    {
      v31 = @"scReq";
      goto LABEL_20;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      sub_1A7BFF14C();
    }
  }
LABEL_25:

  return v6;
}

- (void)handleResponseDictionary:(id)a3
{
  id v18 = a3;
  if (objc_msgSend_messageType(self, v4, v5) == 3) {
    objc_msgSend__dataForKey_(v18, v6, @"scPrRes");
  }
  else {
  objc_super v7 = objc_msgSend__dataForKey_(v18, v6, @"scRes");
  }
  objc_msgSend_setProtoResponse_(self, v8, (uint64_t)v7);

  uint64_t v10 = objc_msgSend__stringForKey_(v18, v9, @"U");
  objc_msgSend_setMessageID_(self, v11, (uint64_t)v10);

  v13 = objc_msgSend__numberForKey_(v18, v12, @"s");
  uint64_t v16 = objc_msgSend_intValue(v13, v14, v15);
  objc_msgSend_setResponseValue_(self, v17, v16);
}

- (void)handleResponseHeaders:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Web Tunnel Message Completed With Respone Headers %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
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

- (NSData)protoData
{
  return self->_protoData;
}

- (void)setProtoData:(id)a3
{
}

- (NSData)protoResponse
{
  return self->_protoResponse;
}

- (void)setProtoResponse:(id)a3
{
}

- (int)responseValue
{
  return self->_responseValue;
}

- (void)setResponseValue:(int)a3
{
  self->_responseValue = a3;
}

- (int)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int)a3
{
  self->_messageType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoResponse, 0);
  objc_storeStrong((id *)&self->_protoData, 0);

  objc_storeStrong((id *)&self->_messageID, 0);
}

@end