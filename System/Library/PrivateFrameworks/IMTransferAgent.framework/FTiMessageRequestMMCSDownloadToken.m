@interface FTiMessageRequestMMCSDownloadToken
- (FTiMessageRequestMMCSDownloadToken)init;
- (NSData)responseContentBody;
- (NSData)signature;
- (NSString)authURLString;
- (NSString)contentHeaders;
- (NSString)owner;
- (NSString)responseAuthToken;
- (NSString)responseRequestorID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)contentVersion;
- (int64_t)responseCommand;
- (int64_t)responseContentVersion;
- (void)dealloc;
- (void)handleResponseDictionary:(id)a3;
- (void)setAuthURLString:(id)a3;
- (void)setContentHeaders:(id)a3;
- (void)setContentVersion:(int64_t)a3;
- (void)setOwner:(id)a3;
- (void)setResponseAuthToken:(id)a3;
- (void)setResponseContentBody:(id)a3;
- (void)setResponseContentVersion:(int64_t)a3;
- (void)setResponseRequestorID:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation FTiMessageRequestMMCSDownloadToken

- (FTiMessageRequestMMCSDownloadToken)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTiMessageRequestMMCSDownloadToken;
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

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)FTiMessageRequestMMCSDownloadToken;
  id v4 = [(IDSMessage *)&v14 copyWithZone:a3];
  v5 = [(FTiMessageRequestMMCSDownloadToken *)self owner];
  [v4 setOwner:v5];

  objc_super v6 = [(IDSBaseMessage *)self topic];
  [v4 setTopic:v6];

  v7 = [(FTiMessageRequestMMCSDownloadToken *)self responseAuthToken];
  [v4 setResponseAuthToken:v7];

  v8 = [(FTiMessageRequestMMCSDownloadToken *)self responseRequestorID];
  [v4 setResponseRequestorID:v8];

  v9 = [(FTiMessageRequestMMCSDownloadToken *)self signature];
  [v4 setSignature:v9];

  objc_msgSend(v4, "setContentVersion:", -[FTiMessageRequestMMCSDownloadToken contentVersion](self, "contentVersion"));
  v10 = [(FTiMessageRequestMMCSDownloadToken *)self contentHeaders];
  [v4 setContentHeaders:v10];

  v11 = [(FTiMessageRequestMMCSDownloadToken *)self authURLString];
  [v4 setAuthURLString:v11];

  v12 = [(FTiMessageRequestMMCSDownloadToken *)self responseContentBody];
  [v4 setResponseContentBody:v12];

  return v4;
}

- (void)dealloc
{
  [(FTiMessageRequestMMCSDownloadToken *)self setOwner:0];
  [(FTiMessageRequestMMCSDownloadToken *)self setResponseAuthToken:0];
  [(FTiMessageRequestMMCSDownloadToken *)self setResponseRequestorID:0];
  [(FTiMessageRequestMMCSDownloadToken *)self setSignature:0];
  [(FTiMessageRequestMMCSDownloadToken *)self setContentHeaders:0];
  [(FTiMessageRequestMMCSDownloadToken *)self setAuthURLString:0];
  [(FTiMessageRequestMMCSDownloadToken *)self setResponseContentBody:0];
  v3.receiver = self;
  v3.super_class = (Class)FTiMessageRequestMMCSDownloadToken;
  [(FTiMessageRequestMMCSDownloadToken *)&v3 dealloc];
}

- (int64_t)command
{
  return 151;
}

- (int64_t)responseCommand
{
  return 151;
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v2 addObject:@"mO"];
  [v2 addObject:@"mS"];
  return v2;
}

- (id)messageBody
{
  v11.receiver = self;
  v11.super_class = (Class)FTiMessageRequestMMCSDownloadToken;
  objc_super v3 = [(IDSMessage *)&v11 messageBody];
  id v4 = (__CFDictionary *)[v3 mutableCopy];

  v5 = [(FTiMessageRequestMMCSDownloadToken *)self owner];
  if (v5)
  {
    CFDictionarySetValue(v4, @"mO", v5);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_23CB05E04();
  }

  objc_super v6 = [(FTiMessageRequestMMCSDownloadToken *)self signature];
  if (v6)
  {
    CFDictionarySetValue(v4, @"mS", v6);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_23CB05D68();
  }

  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[FTiMessageRequestMMCSDownloadToken contentVersion](self, "contentVersion"));
  if (v7) {
    CFDictionarySetValue(v4, @"cV", v7);
  }

  v8 = [(FTiMessageRequestMMCSDownloadToken *)self contentHeaders];
  if (v8) {
    CFDictionarySetValue(v4, @"cH", v8);
  }

  v9 = [(FTiMessageRequestMMCSDownloadToken *)self authURLString];
  if (v9) {
    CFDictionarySetValue(v4, @"mR", v9);
  }

  return v4;
}

- (void)handleResponseDictionary:(id)a3
{
  v19[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKey:@"mA"];
  if (v5) {
    [(FTiMessageRequestMMCSDownloadToken *)self setResponseAuthToken:v5];
  }
  objc_super v6 = [v4 objectForKey:@"mU"];
  if (v6) {
    [(FTiMessageRequestMMCSDownloadToken *)self setResponseRequestorID:v6];
  }
  v7 = [v4 objectForKey:@"cV"];
  -[FTiMessageRequestMMCSDownloadToken setResponseContentVersion:](self, "setResponseContentVersion:", (int)[v7 intValue]);

  v8 = [v4 objectForKey:@"cB"];
  [(FTiMessageRequestMMCSDownloadToken *)self setResponseContentBody:v8];

  if (_IMWillLog())
  {
    v18[0] = @"mA";
    v9 = [(FTiMessageRequestMMCSDownloadToken *)self responseAuthToken];
    v19[0] = v9;
    v18[1] = @"mU";
    v10 = [(FTiMessageRequestMMCSDownloadToken *)self responseRequestorID];
    v19[1] = v10;
    v18[2] = @"cV";
    objc_super v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[FTiMessageRequestMMCSDownloadToken responseContentVersion](self, "responseContentVersion"));
    v19[2] = v11;
    v18[3] = @"cB";
    v12 = NSString;
    v13 = NSNumber;
    objc_super v14 = [(FTiMessageRequestMMCSDownloadToken *)self responseContentBody];
    v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
    v16 = [v12 stringWithFormat:@"%@B", v15];
    v19[3] = v16;
    v17 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
    _IMAlwaysLog();
  }
}

- (NSString)owner
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setOwner:(id)a3
{
}

- (NSString)responseAuthToken
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setResponseAuthToken:(id)a3
{
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 352, 1);
}

- (void)setSignature:(id)a3
{
}

- (NSString)responseRequestorID
{
  return (NSString *)objc_getProperty(self, a2, 360, 1);
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
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setContentHeaders:(id)a3
{
}

- (NSString)authURLString
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void)setAuthURLString:(id)a3
{
}

- (NSData)responseContentBody
{
  return (NSData *)objc_getProperty(self, a2, 392, 1);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseContentBody, 0);
  objc_storeStrong((id *)&self->_authURLString, 0);
  objc_storeStrong((id *)&self->_contentHeaders, 0);
  objc_storeStrong((id *)&self->_responseRequestorID, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_responseAuthToken, 0);
  objc_storeStrong((id *)&self->_owner, 0);
}

@end