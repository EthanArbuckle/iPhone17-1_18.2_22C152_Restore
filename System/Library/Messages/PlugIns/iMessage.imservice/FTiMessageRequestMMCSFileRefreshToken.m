@interface FTiMessageRequestMMCSFileRefreshToken
- (FTiMessageRequestMMCSFileRefreshToken)init;
- (NSData)responseContentBody;
- (NSData)signature;
- (NSNumber)failReason;
- (NSNumber)fileLength;
- (NSNumber)requestContentVersion;
- (NSNumber)responseCode;
- (NSNumber)responseContentVersion;
- (NSString)authURL;
- (NSString)owner;
- (NSString)requestContentHeaders;
- (NSString)responseContentHeaders;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)dealloc;
- (void)handleResponseDictionary:(id)a3;
- (void)setAuthURL:(id)a3;
- (void)setFailReason:(id)a3;
- (void)setFileLength:(id)a3;
- (void)setOwner:(id)a3;
- (void)setRequestContentHeaders:(id)a3;
- (void)setRequestContentVersion:(id)a3;
- (void)setResponseCode:(id)a3;
- (void)setResponseContentBody:(id)a3;
- (void)setResponseContentHeaders:(id)a3;
- (void)setResponseContentVersion:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation FTiMessageRequestMMCSFileRefreshToken

- (FTiMessageRequestMMCSFileRefreshToken)init
{
  v4.receiver = self;
  v4.super_class = (Class)FTiMessageRequestMMCSFileRefreshToken;
  v2 = [(FTiMessageRequestMMCSFileRefreshToken *)&v4 init];
  if (v2)
  {
    IMGetiMessageSettings();
    -[FTiMessageRequestMMCSFileRefreshToken setTopic:](v2, "setTopic:", [0 lastObject]);
    [(FTiMessageRequestMMCSFileRefreshToken *)v2 setWantsResponse:1];
    v2->_requestContentVersion = (NSNumber *)[objc_alloc((Class)NSNumber) initWithInt:1];
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FTiMessageRequestMMCSFileRefreshToken;
  id v4 = [(FTiMessageRequestMMCSFileRefreshToken *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setOwner:", -[FTiMessageRequestMMCSFileRefreshToken owner](self, "owner"));
  objc_msgSend(v4, "setSignature:", -[FTiMessageRequestMMCSFileRefreshToken signature](self, "signature"));
  objc_msgSend(v4, "setFileLength:", -[FTiMessageRequestMMCSFileRefreshToken fileLength](self, "fileLength"));
  objc_msgSend(v4, "setAuthURL:", -[FTiMessageRequestMMCSFileRefreshToken authURL](self, "authURL"));
  objc_msgSend(v4, "setRequestContentVersion:", -[FTiMessageRequestMMCSFileRefreshToken requestContentVersion](self, "requestContentVersion"));
  objc_msgSend(v4, "setRequestContentHeaders:", -[FTiMessageRequestMMCSFileRefreshToken requestContentHeaders](self, "requestContentHeaders"));
  objc_msgSend(v4, "setResponseContentVersion:", -[FTiMessageRequestMMCSFileRefreshToken responseContentVersion](self, "responseContentVersion"));
  objc_msgSend(v4, "setResponseContentHeaders:", -[FTiMessageRequestMMCSFileRefreshToken responseContentHeaders](self, "responseContentHeaders"));
  objc_msgSend(v4, "setResponseContentBody:", -[FTiMessageRequestMMCSFileRefreshToken responseContentBody](self, "responseContentBody"));
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FTiMessageRequestMMCSFileRefreshToken;
  [(FTiMessageRequestMMCSFileRefreshToken *)&v3 dealloc];
}

- (int64_t)command
{
  return 152;
}

- (int64_t)responseCommand
{
  return 152;
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [v2 addObject:@"mU"];
  [v2 addObject:@"mS"];

  return v2;
}

- (id)messageBody
{
  v10.receiver = self;
  v10.super_class = (Class)FTiMessageRequestMMCSFileRefreshToken;
  objc_super v3 = (__CFDictionary *)objc_msgSend(-[FTiMessageRequestMMCSFileRefreshToken messageBody](&v10, "messageBody"), "mutableCopy");
  id v4 = [(FTiMessageRequestMMCSFileRefreshToken *)self owner];
  if (v4)
  {
    CFDictionarySetValue(v3, @"mU", v4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_96BB0();
  }
  v5 = [(FTiMessageRequestMMCSFileRefreshToken *)self signature];
  if (v5)
  {
    CFDictionarySetValue(v3, @"mS", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_96B28();
  }
  objc_super v6 = [(FTiMessageRequestMMCSFileRefreshToken *)self authURL];
  if (v6)
  {
    CFDictionarySetValue(v3, @"mR", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_96AA0();
  }
  CFDictionarySetValue(v3, @"mL", &off_E37F8);
  v7 = [(FTiMessageRequestMMCSFileRefreshToken *)self requestContentVersion];
  if (v7)
  {
    CFDictionarySetValue(v3, @"cV", v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_96A18();
  }
  v8 = [(FTiMessageRequestMMCSFileRefreshToken *)self requestContentHeaders];
  if (v8)
  {
    CFDictionarySetValue(v3, @"cH", v8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_96990();
  }
  return v3;
}

- (void)handleResponseDictionary:(id)a3
{
  -[FTiMessageRequestMMCSFileRefreshToken setResponseContentVersion:](self, "setResponseContentVersion:", [a3 objectForKeyedSubscript:@"cV"]);
  -[FTiMessageRequestMMCSFileRefreshToken setResponseContentBody:](self, "setResponseContentBody:", [a3 objectForKeyedSubscript:@"cB"]);
  -[FTiMessageRequestMMCSFileRefreshToken setResponseContentHeaders:](self, "setResponseContentHeaders:", [a3 objectForKeyedSubscript:@"cH"]);
  -[FTiMessageRequestMMCSFileRefreshToken setFailReason:](self, "setFailReason:", [a3 objectForKeyedSubscript:@"fR"]);
  id v5 = [a3 objectForKeyedSubscript:@"s"];

  [(FTiMessageRequestMMCSFileRefreshToken *)self setResponseCode:v5];
}

- (NSString)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSNumber)fileLength
{
  return self->_fileLength;
}

- (void)setFileLength:(id)a3
{
}

- (NSString)requestContentHeaders
{
  return self->_requestContentHeaders;
}

- (void)setRequestContentHeaders:(id)a3
{
}

- (NSNumber)requestContentVersion
{
  return self->_requestContentVersion;
}

- (void)setRequestContentVersion:(id)a3
{
}

- (NSString)responseContentHeaders
{
  return self->_responseContentHeaders;
}

- (void)setResponseContentHeaders:(id)a3
{
}

- (NSData)responseContentBody
{
  return self->_responseContentBody;
}

- (void)setResponseContentBody:(id)a3
{
}

- (NSString)authURL
{
  return self->_authURL;
}

- (void)setAuthURL:(id)a3
{
}

- (NSNumber)failReason
{
  return self->_failReason;
}

- (void)setFailReason:(id)a3
{
}

- (NSNumber)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(id)a3
{
}

- (NSNumber)responseContentVersion
{
  return self->_responseContentVersion;
}

- (void)setResponseContentVersion:(id)a3
{
}

@end