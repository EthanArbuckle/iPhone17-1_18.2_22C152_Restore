@interface FTiMessageRequestMMCSUploadToken
- (FTiMessageRequestMMCSUploadToken)init;
- (NSData)contentBody;
- (NSData)pushToken;
- (NSData)responseContentBody;
- (NSData)sessionToken;
- (NSData)signature;
- (NSNumber)length;
- (NSString)anonymousSenderID;
- (NSString)contentHeaders;
- (NSString)destinationID;
- (NSString)responseAuthToken;
- (NSString)responseContentHeaders;
- (NSString)responseRequestURL;
- (NSString)responseRequestorID;
- (NSString)senderID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)contentVersion;
- (int64_t)responseCommand;
- (int64_t)responseContentVersion;
- (void)dealloc;
- (void)handleResponseDictionary:(id)a3;
- (void)setAnonymousSenderID:(id)a3;
- (void)setContentBody:(id)a3;
- (void)setContentHeaders:(id)a3;
- (void)setContentVersion:(int64_t)a3;
- (void)setDestinationID:(id)a3;
- (void)setLength:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setResponseAuthToken:(id)a3;
- (void)setResponseContentBody:(id)a3;
- (void)setResponseContentHeaders:(id)a3;
- (void)setResponseContentVersion:(int64_t)a3;
- (void)setResponseRequestURL:(id)a3;
- (void)setResponseRequestorID:(id)a3;
- (void)setSenderID:(id)a3;
- (void)setSessionToken:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation FTiMessageRequestMMCSUploadToken

- (FTiMessageRequestMMCSUploadToken)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTiMessageRequestMMCSUploadToken;
  v2 = [(IDSMessage *)&v6 init];
  if (v2)
  {
    IMGetiMessageSettings();
    id v3 = 0;
    v4 = [v3 lastObject];
    [(IDSBaseMessage *)v2 setTopic:v4];

    [(IDSBaseMessage *)v2 setWantsResponse:1];
  }
  return v2;
}

- (void)dealloc
{
  [(FTiMessageRequestMMCSUploadToken *)self setResponseAuthToken:0];
  [(FTiMessageRequestMMCSUploadToken *)self setResponseRequestURL:0];
  [(FTiMessageRequestMMCSUploadToken *)self setResponseRequestorID:0];
  [(FTiMessageRequestMMCSUploadToken *)self setLength:0];
  [(IDSBaseMessage *)self setTopic:0];
  [(FTiMessageRequestMMCSUploadToken *)self setSignature:0];
  [(FTiMessageRequestMMCSUploadToken *)self setContentBody:0];
  [(FTiMessageRequestMMCSUploadToken *)self setContentHeaders:0];
  [(FTiMessageRequestMMCSUploadToken *)self setResponseContentHeaders:0];
  [(FTiMessageRequestMMCSUploadToken *)self setSenderID:0];
  [(FTiMessageRequestMMCSUploadToken *)self setDestinationID:0];
  [(FTiMessageRequestMMCSUploadToken *)self setAnonymousSenderID:0];
  [(FTiMessageRequestMMCSUploadToken *)self setSessionToken:0];
  [(FTiMessageRequestMMCSUploadToken *)self setPushToken:0];
  v3.receiver = self;
  v3.super_class = (Class)FTiMessageRequestMMCSUploadToken;
  [(FTiMessageRequestMMCSUploadToken *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v19.receiver = self;
  v19.super_class = (Class)FTiMessageRequestMMCSUploadToken;
  id v4 = [(IDSMessage *)&v19 copyWithZone:a3];
  v5 = [(FTiMessageRequestMMCSUploadToken *)self responseAuthToken];
  [v4 setResponseAuthToken:v5];

  objc_super v6 = [(FTiMessageRequestMMCSUploadToken *)self responseRequestURL];
  [v4 setResponseRequestURL:v6];

  v7 = [(FTiMessageRequestMMCSUploadToken *)self responseRequestorID];
  [v4 setResponseRequestorID:v7];

  v8 = [(FTiMessageRequestMMCSUploadToken *)self length];
  [v4 setLength:v8];

  v9 = [(FTiMessageRequestMMCSUploadToken *)self signature];
  [v4 setSignature:v9];

  v10 = [(FTiMessageRequestMMCSUploadToken *)self contentBody];
  [v4 setContentBody:v10];

  v11 = [(FTiMessageRequestMMCSUploadToken *)self contentHeaders];
  [v4 setContentHeaders:v11];

  objc_msgSend(v4, "setContentVersion:", -[FTiMessageRequestMMCSUploadToken contentVersion](self, "contentVersion"));
  v12 = [(FTiMessageRequestMMCSUploadToken *)self responseContentHeaders];
  [v4 setResponseContentHeaders:v12];

  objc_msgSend(v4, "setResponseContentVersion:", -[FTiMessageRequestMMCSUploadToken responseContentVersion](self, "responseContentVersion"));
  v13 = [(FTiMessageRequestMMCSUploadToken *)self senderID];
  [v4 setSenderID:v13];

  v14 = [(FTiMessageRequestMMCSUploadToken *)self destinationID];
  [v4 setDestinationID:v14];

  v15 = [(FTiMessageRequestMMCSUploadToken *)self anonymousSenderID];
  [v4 setAnonymousSenderID:v15];

  v16 = [(FTiMessageRequestMMCSUploadToken *)self sessionToken];
  [v4 setSessionToken:v16];

  v17 = [(FTiMessageRequestMMCSUploadToken *)self pushToken];
  [v4 setPushToken:v17];

  return v4;
}

- (int64_t)command
{
  return 150;
}

- (int64_t)responseCommand
{
  return 150;
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v2 addObject:@"mS"];
  [v2 addObject:@"mL"];
  return v2;
}

- (id)messageBody
{
  v16.receiver = self;
  v16.super_class = (Class)FTiMessageRequestMMCSUploadToken;
  objc_super v3 = [(IDSMessage *)&v16 messageBody];
  id v4 = (__CFDictionary *)[v3 mutableCopy];

  v5 = [(FTiMessageRequestMMCSUploadToken *)self signature];
  if (v5)
  {
    CFDictionarySetValue(v4, @"mS", v5);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_23CB05D68();
  }

  objc_super v6 = [(FTiMessageRequestMMCSUploadToken *)self length];
  if (v6)
  {
    CFDictionarySetValue(v4, @"mL", v6);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_23CB05EA0();
  }

  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[FTiMessageRequestMMCSUploadToken contentVersion](self, "contentVersion"));
  if (v7) {
    CFDictionarySetValue(v4, @"cV", v7);
  }

  v8 = [(FTiMessageRequestMMCSUploadToken *)self contentHeaders];
  if (v8) {
    CFDictionarySetValue(v4, @"cH", v8);
  }

  v9 = [(FTiMessageRequestMMCSUploadToken *)self contentBody];
  if (v9) {
    CFDictionarySetValue(v4, @"cB", v9);
  }

  v10 = [(FTiMessageRequestMMCSUploadToken *)self pushToken];
  if (v10) {
    CFDictionarySetValue(v4, @"t", v10);
  }

  v11 = [(FTiMessageRequestMMCSUploadToken *)self anonymousSenderID];
  if (v11) {
    CFDictionarySetValue(v4, @"sI", v11);
  }

  v12 = [(FTiMessageRequestMMCSUploadToken *)self sessionToken];
  if (v12) {
    CFDictionarySetValue(v4, @"sT", v12);
  }

  v13 = [(FTiMessageRequestMMCSUploadToken *)self senderID];
  if (v13) {
    CFDictionarySetValue(v4, @"sP", v13);
  }

  v14 = [(FTiMessageRequestMMCSUploadToken *)self destinationID];
  if (v14) {
    CFDictionarySetValue(v4, @"tP", v14);
  }

  return v4;
}

- (void)handleResponseDictionary:(id)a3
{
  v23[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKey:@"mA"];
  if (v5) {
    [(FTiMessageRequestMMCSUploadToken *)self setResponseAuthToken:v5];
  }
  objc_super v6 = [v4 objectForKey:@"mR"];
  if (v6) {
    [(FTiMessageRequestMMCSUploadToken *)self setResponseRequestURL:v6];
  }
  v7 = [v4 objectForKey:@"mU"];
  if (v7) {
    [(FTiMessageRequestMMCSUploadToken *)self setResponseRequestorID:v7];
  }
  v8 = [v4 objectForKey:@"cV"];
  -[FTiMessageRequestMMCSUploadToken setResponseContentVersion:](self, "setResponseContentVersion:", (int)[v8 intValue]);

  v9 = [v4 objectForKey:@"cH"];
  [(FTiMessageRequestMMCSUploadToken *)self setResponseContentHeaders:v9];

  v10 = [v4 objectForKey:@"cB"];
  [(FTiMessageRequestMMCSUploadToken *)self setResponseContentBody:v10];

  if (_IMWillLog())
  {
    v22[0] = @"mA";
    v21 = [(FTiMessageRequestMMCSUploadToken *)self responseAuthToken];
    v23[0] = v21;
    v22[1] = @"mU";
    v20 = [(FTiMessageRequestMMCSUploadToken *)self responseRequestorID];
    v23[1] = v20;
    v22[2] = @"mR";
    objc_super v19 = [(FTiMessageRequestMMCSUploadToken *)self responseRequestURL];
    v23[2] = v19;
    v22[3] = @"cV";
    v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[FTiMessageRequestMMCSUploadToken responseContentVersion](self, "responseContentVersion"));
    v23[3] = v11;
    v22[4] = @"cH";
    v12 = [(FTiMessageRequestMMCSUploadToken *)self responseContentHeaders];
    v23[4] = v12;
    v22[5] = @"cB";
    v13 = NSString;
    v14 = NSNumber;
    v15 = [(FTiMessageRequestMMCSUploadToken *)self responseContentBody];
    objc_super v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "length"));
    v17 = [v13 stringWithFormat:@"%@B", v16];
    v23[5] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:6];
    _IMAlwaysLog();
  }
}

- (NSData)pushToken
{
  return self->pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSString)responseAuthToken
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setResponseAuthToken:(id)a3
{
}

- (NSNumber)length
{
  return (NSNumber *)objc_getProperty(self, a2, 352, 1);
}

- (void)setLength:(id)a3
{
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 360, 1);
}

- (void)setSignature:(id)a3
{
}

- (NSString)responseRequestURL
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (void)setResponseRequestURL:(id)a3
{
}

- (NSString)responseRequestorID
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setResponseRequestorID:(id)a3
{
}

- (int64_t)contentVersion
{
  return self->_contentVersion;
}

- (void)setContentVersion:(int64_t)a3
{
  self->_contentVersion = a3;
}

- (NSString)contentHeaders
{
  return (NSString *)objc_getProperty(self, a2, 392, 1);
}

- (void)setContentHeaders:(id)a3
{
}

- (NSData)contentBody
{
  return (NSData *)objc_getProperty(self, a2, 400, 1);
}

- (void)setContentBody:(id)a3
{
}

- (NSString)responseContentHeaders
{
  return (NSString *)objc_getProperty(self, a2, 408, 1);
}

- (void)setResponseContentHeaders:(id)a3
{
}

- (NSData)responseContentBody
{
  return (NSData *)objc_getProperty(self, a2, 416, 1);
}

- (void)setResponseContentBody:(id)a3
{
}

- (int64_t)responseContentVersion
{
  return self->_responseContentVersion;
}

- (void)setResponseContentVersion:(int64_t)a3
{
  self->_responseContentVersion = a3;
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
}

- (NSString)senderID
{
  return self->_senderID;
}

- (void)setSenderID:(id)a3
{
}

- (NSString)destinationID
{
  return self->_destinationID;
}

- (void)setDestinationID:(id)a3
{
}

- (NSString)anonymousSenderID
{
  return self->_anonymousSenderID;
}

- (void)setAnonymousSenderID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymousSenderID, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_senderID, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_responseContentBody, 0);
  objc_storeStrong((id *)&self->_responseContentHeaders, 0);
  objc_storeStrong((id *)&self->_contentBody, 0);
  objc_storeStrong((id *)&self->_contentHeaders, 0);
  objc_storeStrong((id *)&self->_responseRequestorID, 0);
  objc_storeStrong((id *)&self->_responseRequestURL, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_length, 0);
  objc_storeStrong((id *)&self->_responseAuthToken, 0);
  objc_storeStrong((id *)&self->pushToken, 0);
}

@end