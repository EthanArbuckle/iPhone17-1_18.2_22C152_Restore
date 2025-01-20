@interface FTProtobufMessage
- (BOOL)highPriority;
- (BOOL)isIDSMessage;
- (BOOL)isWebTunnelMessage;
- (BOOL)wantsAPSRetries;
- (BOOL)wantsBAASigning;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsIDSProtocolVersion;
- (BOOL)wantsIntegerUniqueIDs;
- (BOOL)wantsResponse;
- (BOOL)wantsUserAgentInHeaders;
- (FTProtobufMessage)initWithPushTopic:(id)a3 protoData:(id)a4;
- (NSData)protoData;
- (NSData)protoResponse;
- (NSString)messageID;
- (NSString)pushTopic;
- (id)additionalMessageHeadersForOutgoingPush;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)topic;
- (id)userAgentHeaderString;
- (int)responseValue;
- (int)version;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)handleResponseDictionary:(id)a3;
- (void)handleResponseHeaders:(id)a3;
- (void)setMessageID:(id)a3;
- (void)setProtoData:(id)a3;
- (void)setProtoResponse:(id)a3;
- (void)setPushTopic:(id)a3;
- (void)setResponseValue:(int)a3;
- (void)setVersion:(int)a3;
@end

@implementation FTProtobufMessage

- (FTProtobufMessage)initWithPushTopic:(id)a3 protoData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FTProtobufMessage;
  v9 = [(FTIDSMessage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pushTopic, a3);
    objc_storeStrong((id *)&v10->_protoData, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)FTProtobufMessage;
  id v4 = [(FTIDSMessage *)&v22 copyWithZone:a3];
  id v7 = objc_msgSend_messageID(self, v5, v6);
  objc_msgSend_setMessageID_(v4, v8, (uint64_t)v7);

  uint64_t v11 = objc_msgSend_version(self, v9, v10);
  objc_msgSend_setVersion_(v4, v12, v11);
  v15 = objc_msgSend_protoData(self, v13, v14);
  objc_msgSend_setProtoData_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_pushTopic(self, v17, v18);
  objc_msgSend_setPushTopic_(v4, v20, (uint64_t)v19);

  return v4;
}

- (int64_t)command
{
  return 226;
}

- (int64_t)responseCommand
{
  return 226;
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

- (BOOL)wantsBAASigning
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
  return self->_pushTopic;
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
  v7.super_class = (Class)FTProtobufMessage;
  v2 = [(FTIDSMessage *)&v7 additionalMessageHeaders];
  v5 = objc_msgSend_mutableCopy(v2, v3, v4);

  return v5;
}

- (id)messageBody
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)FTProtobufMessage;
  v3 = [(IDSBaseMessage *)&v28 messageBody];
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

  v26 = objc_msgSend_protoData(self, v24, v25);
  if (v26)
  {
    CFDictionarySetValue(v6, @"req", v26);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1A7BFE080();
  }

  return v6;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_msgSend__dataForKey_(v4, v5, @"res");
  objc_msgSend_setProtoResponse_(self, v7, (uint64_t)v6);

  v9 = objc_msgSend__stringForKey_(v4, v8, @"U");
  objc_msgSend_setMessageID_(self, v10, (uint64_t)v9);

  objc_msgSend__numberForKey_(v4, v11, @"s");
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v14 = objc_msgSend_intValue(v16, v12, v13);
  objc_msgSend_setResponseValue_(self, v15, v14);
}

- (void)handleResponseHeaders:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = OSLogHandleForIDSCategory();
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

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoResponse, 0);
  objc_storeStrong((id *)&self->_protoData, 0);
  objc_storeStrong((id *)&self->_messageID, 0);

  objc_storeStrong((id *)&self->_pushTopic, 0);
}

@end