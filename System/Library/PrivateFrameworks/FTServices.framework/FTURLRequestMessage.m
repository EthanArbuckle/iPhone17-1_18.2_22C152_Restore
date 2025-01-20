@interface FTURLRequestMessage
- (BOOL)allowDualDelivery;
- (BOOL)isIDSMessage;
- (BOOL)wantsBodySignature;
- (BOOL)wantsHTTPGet;
- (BOOL)wantsIDSServer;
- (BOOL)wantsIDSSignatures;
- (BOOL)wantsManagedRetries;
- (FTURLRequestMessage)initWithURL:(id)a3 type:(unint64_t)a4 headers:(id)a5 stringParams:(id)a6 body:(id)a7;
- (NSData)requestBody;
- (NSData)responseBody;
- (NSDictionary)requestHeaders;
- (NSDictionary)requestStringParams;
- (NSDictionary)responseHeaders;
- (NSDictionary)timingData;
- (NSNumber)responseStatusCode;
- (NSURL)requestURL;
- (id)additionalMessageHeaders;
- (id)additionalQueryStringParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBodyDataOverride;
- (unint64_t)requestType;
- (void)handleResponseHeaders:(id)a3;
- (void)handleResponseStatus:(unint64_t)a3;
- (void)setRequestBody:(id)a3;
- (void)setRequestHeaders:(id)a3;
- (void)setRequestStringParams:(id)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)setRequestURL:(id)a3;
- (void)setResponseBody:(id)a3;
- (void)setResponseHeaders:(id)a3;
- (void)setResponseStatusCode:(id)a3;
- (void)setTimingData:(id)a3;
@end

@implementation FTURLRequestMessage

- (FTURLRequestMessage)initWithURL:(id)a3 type:(unint64_t)a4 headers:(id)a5 stringParams:(id)a6 body:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)FTURLRequestMessage;
  v17 = [(FTIDSMessage *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_requestURL, a3);
    objc_msgSend_setURLOverride_(v18, v19, (uint64_t)v13);
    v18->_requestType = a4;
    objc_storeStrong((id *)&v18->_requestHeaders, a5);
    objc_storeStrong((id *)&v18->_requestStringParams, a6);
    objc_storeStrong((id *)&v18->_requestBody, a7);
    objc_msgSend_setImportanceLevel_(v18, v20, 2);
    objc_msgSend_setHttpDoNotDecodeData_(v18, v21, 1);
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v34.receiver = self;
  v34.super_class = (Class)FTURLRequestMessage;
  id v4 = [(FTIDSMessage *)&v34 copyWithZone:a3];
  uint64_t v7 = objc_msgSend_requestType(self, v5, v6);
  objc_msgSend_setRequestType_(v4, v8, v7);
  v11 = objc_msgSend_requestURL(self, v9, v10);
  objc_msgSend_setRequestURL_(v4, v12, (uint64_t)v11);

  id v15 = objc_msgSend_requestHeaders(self, v13, v14);
  objc_msgSend_setRequestHeaders_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_requestStringParams(self, v17, v18);
  objc_msgSend_setRequestStringParams_(v4, v20, (uint64_t)v19);

  objc_super v23 = objc_msgSend_responseHeaders(self, v21, v22);
  objc_msgSend_setResponseHeaders_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_responseBody(self, v25, v26);
  objc_msgSend_setResponseBody_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_responseStatusCode(self, v29, v30);
  objc_msgSend_setResponseStatusCode_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)additionalQueryStringParameters
{
  v12.receiver = self;
  v12.super_class = (Class)FTURLRequestMessage;
  v3 = [(IDSBaseMessage *)&v12 additionalQueryStringParameters];
  Mutable = objc_msgSend_mutableCopy(v3, v4, v5);

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  v9 = objc_msgSend_requestStringParams(self, v7, v8);
  objc_msgSend_addEntriesFromDictionary_(Mutable, v10, (uint64_t)v9);

  return Mutable;
}

- (id)additionalMessageHeaders
{
  v24.receiver = self;
  v24.super_class = (Class)FTURLRequestMessage;
  v3 = [(FTIDSMessage *)&v24 additionalMessageHeaders];
  Mutable = objc_msgSend_mutableCopy(v3, v4, v5);

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  v9 = objc_msgSend_requestHeaders(self, v7, v8);
  objc_msgSend_addEntriesFromDictionary_(Mutable, v10, (uint64_t)v9);

  objc_msgSend_removeObjectForKey_(Mutable, v11, @"x-apple-apns-dual-mode-delivery-type");
  int hasAttemptedAPSDelivery = objc_msgSend_hasAttemptedAPSDelivery(self, v12, v13);
  id v15 = objc_alloc(NSNumber);
  if (hasAttemptedAPSDelivery) {
    v17 = objc_msgSend_initWithInt_(v15, v16, 1);
  }
  else {
    v17 = objc_msgSend_initWithInt_(v15, v16, 3);
  }
  v20 = v17;
  v21 = objc_msgSend_stringValue(v17, v18, v19);
  objc_msgSend_setValue_forKey_(Mutable, v22, (uint64_t)v21, @"x-apple-apns-dual-mode-delivery-type");

  return Mutable;
}

- (id)messageBodyDataOverride
{
  return (id)((uint64_t (*)(FTURLRequestMessage *, char *))MEMORY[0x1F4181798])(self, sel_requestBody);
}

- (BOOL)wantsManagedRetries
{
  return 0;
}

- (BOOL)wantsHTTPGet
{
  return objc_msgSend_requestType(self, a2, v2) == 0;
}

- (BOOL)allowDualDelivery
{
  return 1;
}

- (BOOL)wantsBodySignature
{
  return 0;
}

- (BOOL)wantsIDSSignatures
{
  return 0;
}

- (BOOL)wantsIDSServer
{
  return 0;
}

- (BOOL)isIDSMessage
{
  return 0;
}

- (void)handleResponseHeaders:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1A7BC0000, v5, OS_LOG_TYPE_DEFAULT, "FT URL  Message Completed With Respone Headers %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v7 = v4;
    _IDSLogV();
  }
  objc_msgSend_setResponseHeaders_(self, v6, (uint64_t)v4, v7);
}

- (void)handleResponseStatus:(unint64_t)a3
{
  objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseStatusCode_(self, v4, (uint64_t)v5);
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (void)setRequestURL:(id)a3
{
}

- (NSDictionary)requestHeaders
{
  return self->_requestHeaders;
}

- (void)setRequestHeaders:(id)a3
{
}

- (NSDictionary)requestStringParams
{
  return self->_requestStringParams;
}

- (void)setRequestStringParams:(id)a3
{
}

- (NSData)requestBody
{
  return self->_requestBody;
}

- (void)setRequestBody:(id)a3
{
}

- (NSDictionary)responseHeaders
{
  return self->_responseHeaders;
}

- (void)setResponseHeaders:(id)a3
{
}

- (NSData)responseBody
{
  return self->_responseBody;
}

- (void)setResponseBody:(id)a3
{
}

- (NSNumber)responseStatusCode
{
  return self->_responseStatusCode;
}

- (void)setResponseStatusCode:(id)a3
{
}

- (NSDictionary)timingData
{
  return self->_timingData;
}

- (void)setTimingData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_storeStrong((id *)&self->_responseStatusCode, 0);
  objc_storeStrong((id *)&self->_responseBody, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_requestBody, 0);
  objc_storeStrong((id *)&self->_requestStringParams, 0);
  objc_storeStrong((id *)&self->_requestHeaders, 0);

  objc_storeStrong((id *)&self->_requestURL, 0);
}

@end