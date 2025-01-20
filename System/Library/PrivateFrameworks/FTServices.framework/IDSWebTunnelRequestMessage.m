@interface IDSWebTunnelRequestMessage
- (BOOL)disableIDSTranslation;
- (BOOL)isIDSMessage;
- (BOOL)isWebTunnelMessage;
- (BOOL)wantsBAASigning;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsIDSProtocolVersion;
- (IDSWebTunnelRequestMessage)initWithMessage:(id)a3;
- (NSData)messageRequestBodyData;
- (NSData)responseBodyData;
- (NSDictionary)messageRequestBodyDictionary;
- (NSDictionary)responseBodyDictionary;
- (NSDictionary)responseHeaders;
- (NSMutableDictionary)messageHeaders;
- (NSNumber)maximumResponseSize;
- (NSNumber)responseCode;
- (NSNumber)responseStatus;
- (NSString)messageRequestUUID;
- (NSString)messageURL;
- (NSString)userAgentOverride;
- (id)additionalMessageHeadersForOutgoingPush;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (void)handleResponseDictionary:(id)a3;
- (void)handleResponseHeaders:(id)a3;
- (void)setDisableIDSTranslation:(BOOL)a3;
- (void)setMaximumResponseSize:(id)a3;
- (void)setMessageHeaders:(id)a3;
- (void)setMessageRequestBodyData:(id)a3;
- (void)setMessageRequestBodyDictionary:(id)a3;
- (void)setMessageRequestUUID:(id)a3;
- (void)setMessageURL:(id)a3;
- (void)setResponseBodyData:(id)a3;
- (void)setResponseBodyDictionary:(id)a3;
- (void)setResponseCode:(id)a3;
- (void)setResponseHeaders:(id)a3;
- (void)setResponseStatus:(id)a3;
- (void)setUserAgentOverride:(id)a3;
@end

@implementation IDSWebTunnelRequestMessage

- (IDSWebTunnelRequestMessage)initWithMessage:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)IDSWebTunnelRequestMessage;
  v3 = [(FTIDSMessage *)&v15 init];
  v5 = v3;
  if (v3)
  {
    objc_msgSend_setWantsResponse_(v3, v4, 1);
    objc_msgSend_setWantsIntegerUniqueIDs_(v5, v6, 1);
    v9 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v7, v8);
    v12 = objc_msgSend_UUIDString(v9, v10, v11);
    objc_msgSend_setMessageRequestUUID_(v5, v13, (uint64_t)v12);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v54.receiver = self;
  v54.super_class = (Class)IDSWebTunnelRequestMessage;
  id v4 = [(FTIDSMessage *)&v54 copyWithZone:a3];
  v7 = objc_msgSend_messageRequestUUID(self, v5, v6);
  objc_msgSend_setMessageRequestUUID_(v4, v8, (uint64_t)v7);

  uint64_t v11 = objc_msgSend_messageURL(self, v9, v10);
  objc_msgSend_setMessageURL_(v4, v12, (uint64_t)v11);

  objc_super v15 = objc_msgSend_messageRequestBodyData(self, v13, v14);
  objc_msgSend_setMessageRequestBodyData_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_messageRequestBodyDictionary(self, v17, v18);
  objc_msgSend_setMessageRequestBodyDictionary_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_messageHeaders(self, v21, v22);
  objc_msgSend_setMessageHeaders_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_responseBodyDictionary(self, v25, v26);
  objc_msgSend_setResponseBodyDictionary_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_responseBodyData(self, v29, v30);
  objc_msgSend_setResponseBodyData_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_responseHeaders(self, v33, v34);
  objc_msgSend_setResponseHeaders_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_responseCode(self, v37, v38);
  objc_msgSend_setResponseCode_(v4, v40, (uint64_t)v39);

  v43 = objc_msgSend_responseStatus(self, v41, v42);
  objc_msgSend_setResponseStatus_(v4, v44, (uint64_t)v43);

  uint64_t v47 = objc_msgSend_disableIDSTranslation(self, v45, v46);
  objc_msgSend_setDisableIDSTranslation_(v4, v48, v47);
  v51 = objc_msgSend_userAgentOverride(self, v49, v50);
  objc_msgSend_setUserAgentOverride_(v4, v52, (uint64_t)v51);

  return v4;
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

- (BOOL)wantsBAASigning
{
  return 0;
}

- (BOOL)isIDSMessage
{
  return !self->_disableIDSTranslation;
}

- (id)additionalMessageHeadersForOutgoingPush
{
  v20.receiver = self;
  v20.super_class = (Class)IDSWebTunnelRequestMessage;
  v3 = [(FTIDSMessage *)&v20 additionalMessageHeaders];
  Mutable = objc_msgSend_mutableCopy(v3, v4, v5);

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  v9 = objc_msgSend_messageHeaders(self, v7, v8);
  objc_msgSend_addEntriesFromDictionary_(Mutable, v10, (uint64_t)v9);

  objc_msgSend_removeObjectForKey_(Mutable, v11, @"x-apple-apns-dual-mode-delivery-type");
  id v12 = objc_alloc(NSNumber);
  uint64_t v14 = objc_msgSend_initWithInt_(v12, v13, 2);
  v17 = objc_msgSend_stringValue(v14, v15, v16);
  objc_msgSend_setValue_forKey_(Mutable, v18, (uint64_t)v17, @"x-apple-apns-dual-mode-delivery-type");

  return Mutable;
}

- (id)messageBody
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)IDSWebTunnelRequestMessage;
  v3 = [(IDSBaseMessage *)&v42 messageBody];
  uint64_t v6 = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5);

  uint64_t v9 = objc_msgSend_messageRequestUUID(self, v7, v8);
  if (v9)
  {
    id v12 = (void *)v9;
    objc_msgSend_messageRequestUUID(self, v10, v11);
    id v13 = objc_claimAutoreleasedReturnValue();
    uint64_t v16 = (const char *)objc_msgSend_UTF8String(v13, v14, v15);

    if (v16)
    {
      memset(uu, 170, sizeof(uu));
      uuid_parse(v16, uu);
      jw_uuid_to_data();
      id v17 = 0;
      if (v17) {
        CFDictionarySetValue(v6, @"U", v17);
      }
    }
  }
  uint64_t v18 = _IDSWebTunnelServiceVersionNumber();
  if (v18)
  {
    CFDictionarySetValue(v6, @"v", v18);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1A7BFE608();
  }

  v21 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C320], v19, v20);
  v24 = objc_msgSend_userAgentString(v21, v22, v23);

  if (v24) {
    CFDictionarySetValue(v6, @"ua", v24);
  }

  if ((objc_msgSend_isIDSMessage(self, v25, v26) & 1) == 0)
  {
    v29 = objc_msgSend_userAgentOverride(self, v27, v28);
    uint64_t v32 = objc_msgSend_length(v29, v30, v31);

    if (v32)
    {
      v35 = objc_msgSend_userAgentOverride(self, v33, v34);
      if (v35) {
        CFDictionarySetValue(v6, @"ua", v35);
      }
    }
    CFDictionarySetValue(v6, @"nH", &unk_1EFE11BC8);
  }
  CFDictionarySetValue(v6, @"cT", @"application/x-apple-plist");
  messageURL = self->_messageURL;
  if (messageURL) {
    CFDictionarySetValue(v6, @"u", messageURL);
  }
  messageRequestBodyData = self->_messageRequestBodyData;
  if (messageRequestBodyData) {
    CFDictionarySetValue(v6, @"b", messageRequestBodyData);
  }
  uint64_t v38 = MEMORY[0x1AD0D4E20](@"com.apple.ids", @"x-test-opts");
  if (objc_msgSend_length(v38, v39, v40) && v38) {
    CFDictionarySetValue(v6, @"x-test-opts", v38);
  }

  return v6;
}

- (void)handleResponseDictionary:(id)a3
{
  id v26 = a3;
  uint64_t v5 = objc_msgSend__numberForKey_(v26, v4, @"hs");
  objc_msgSend_setResponseCode_(self, v6, (uint64_t)v5);

  uint64_t v8 = objc_msgSend__numberForKey_(v26, v7, @"s");
  objc_msgSend_setResponseStatus_(self, v9, (uint64_t)v8);

  uint64_t v11 = objc_msgSend__dictionaryForKey_(v26, v10, @"h");
  objc_msgSend_setResponseHeaders_(self, v12, (uint64_t)v11);

  uint64_t v14 = objc_msgSend_objectForKey_(v26, v13, @"b");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = objc_msgSend__dataForKey_(v26, v15, @"b");
    objc_msgSend_setResponseBodyData_(self, v17, (uint64_t)v16);

    v19 = objc_msgSend__dataForKey_(v26, v18, @"b");
    uint64_t v22 = objc_msgSend_length(v19, v20, v21);
    objc_msgSend_setReceivedByteCount_(self, v23, v22);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    v19 = objc_msgSend__dictionaryForKey_(v26, v24, @"b");
    objc_msgSend_setResponseBodyDictionary_(self, v25, (uint64_t)v19);
  }

LABEL_6:
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

- (NSString)messageRequestUUID
{
  return self->_messageRequestUUID;
}

- (void)setMessageRequestUUID:(id)a3
{
}

- (NSString)messageURL
{
  return self->_messageURL;
}

- (void)setMessageURL:(id)a3
{
}

- (NSData)messageRequestBodyData
{
  return self->_messageRequestBodyData;
}

- (void)setMessageRequestBodyData:(id)a3
{
}

- (NSDictionary)messageRequestBodyDictionary
{
  return self->_messageRequestBodyDictionary;
}

- (void)setMessageRequestBodyDictionary:(id)a3
{
}

- (NSMutableDictionary)messageHeaders
{
  return self->_messageHeaders;
}

- (void)setMessageHeaders:(id)a3
{
}

- (NSNumber)maximumResponseSize
{
  return self->_maximumResponseSize;
}

- (void)setMaximumResponseSize:(id)a3
{
}

- (NSString)userAgentOverride
{
  return self->_userAgentOverride;
}

- (void)setUserAgentOverride:(id)a3
{
}

- (NSData)responseBodyData
{
  return self->_responseBodyData;
}

- (void)setResponseBodyData:(id)a3
{
}

- (NSDictionary)responseBodyDictionary
{
  return self->_responseBodyDictionary;
}

- (void)setResponseBodyDictionary:(id)a3
{
}

- (NSDictionary)responseHeaders
{
  return self->_responseHeaders;
}

- (void)setResponseHeaders:(id)a3
{
}

- (NSNumber)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(id)a3
{
}

- (NSNumber)responseStatus
{
  return self->_responseStatus;
}

- (void)setResponseStatus:(id)a3
{
}

- (BOOL)disableIDSTranslation
{
  return self->_disableIDSTranslation;
}

- (void)setDisableIDSTranslation:(BOOL)a3
{
  self->_disableIDSTranslation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgentOverride, 0);
  objc_storeStrong((id *)&self->_responseStatus, 0);
  objc_storeStrong((id *)&self->_responseCode, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_responseBodyData, 0);
  objc_storeStrong((id *)&self->_responseBodyDictionary, 0);
  objc_storeStrong((id *)&self->_maximumResponseSize, 0);
  objc_storeStrong((id *)&self->_messageHeaders, 0);
  objc_storeStrong((id *)&self->_messageRequestBodyDictionary, 0);
  objc_storeStrong((id *)&self->_messageRequestBodyData, 0);
  objc_storeStrong((id *)&self->_messageURL, 0);

  objc_storeStrong((id *)&self->_messageRequestUUID, 0);
}

@end