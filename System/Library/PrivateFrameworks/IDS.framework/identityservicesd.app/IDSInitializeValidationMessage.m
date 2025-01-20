@interface IDSInitializeValidationMessage
- (BOOL)requiresPushTokenKeys;
- (BOOL)wantsBAASigning;
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsHTTPHeaders;
- (IDSInitializeValidationMessage)init;
- (NSData)absintheHello;
- (NSData)pushToken;
- (NSData)responseAbsintheResponse;
- (NSData)responseAbsintheServKey;
- (NSData)responseSessionInfo;
- (NSData)sessionInfoRequest;
- (NSNumber)responseTTL;
- (NSString)absintheUDID;
- (double)anisetteHeadersTimeout;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)handleResponseDictionary:(id)a3;
- (void)setAbsintheHello:(id)a3;
- (void)setAbsintheUDID:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setResponseAbsintheResponse:(id)a3;
- (void)setResponseAbsintheServKey:(id)a3;
- (void)setResponseSessionInfo:(id)a3;
- (void)setResponseTTL:(id)a3;
- (void)setSessionInfoRequest:(id)a3;
@end

@implementation IDSInitializeValidationMessage

- (IDSInitializeValidationMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSInitializeValidationMessage;
  v2 = [(IDSInitializeValidationMessage *)&v6 init];
  if (v2)
  {
    IMGetConferenceSettings();
    id v3 = 0;
    v4 = [v3 lastObject];
    [(IDSInitializeValidationMessage *)v2 setTopic:v4];

    [(IDSInitializeValidationMessage *)v2 setWantsResponse:1];
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)IDSInitializeValidationMessage;
  id v4 = [(IDSInitializeValidationMessage *)&v14 copyWithZone:a3];
  v5 = [(IDSInitializeValidationMessage *)self pushToken];
  [v4 setPushToken:v5];

  objc_super v6 = [(IDSInitializeValidationMessage *)self sessionInfoRequest];
  [v4 setSessionInfoRequest:v6];

  v7 = [(IDSInitializeValidationMessage *)self responseSessionInfo];
  [v4 setResponseSessionInfo:v7];

  v8 = [(IDSInitializeValidationMessage *)self responseTTL];
  [v4 setResponseTTL:v8];

  v9 = [(IDSInitializeValidationMessage *)self absintheUDID];
  [v4 setAbsintheUDID:v9];

  v10 = [(IDSInitializeValidationMessage *)self absintheHello];
  [v4 setAbsintheHello:v10];

  v11 = [(IDSInitializeValidationMessage *)self responseAbsintheServKey];
  [v4 setResponseAbsintheServKey:v11];

  v12 = [(IDSInitializeValidationMessage *)self responseAbsintheResponse];
  [v4 setResponseAbsintheResponse:v12];

  return v4;
}

- (BOOL)wantsBagKey
{
  return 1;
}

- (BOOL)wantsHTTPHeaders
{
  return 1;
}

- (BOOL)wantsCompressedBody
{
  return 1;
}

- (BOOL)wantsBinaryPush
{
  return 1;
}

- (BOOL)wantsBAASigning
{
  return 0;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (int64_t)command
{
  return 96;
}

- (int64_t)responseCommand
{
  return 97;
}

- (id)bagKey
{
  return @"id-initialize-validation";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [v2 addObject:@"session-info-request"];

  return v2;
}

- (id)messageBody
{
  v9.receiver = self;
  v9.super_class = (Class)IDSInitializeValidationMessage;
  id v3 = [(IDSInitializeValidationMessage *)&v9 messageBody];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSInitializeValidationMessage *)self sessionInfoRequest];
  if (v5)
  {
    CFDictionarySetValue(Mutable, @"session-info-request", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100723170();
  }

  objc_super v6 = [(IDSInitializeValidationMessage *)self absintheUDID];
  if (v6) {
    CFDictionarySetValue(Mutable, @"absinthe-udid", v6);
  }

  v7 = [(IDSInitializeValidationMessage *)self absintheHello];
  if (v7) {
    CFDictionarySetValue(Mutable, @"absinthe-hello", v7);
  }

  return Mutable;
}

- (id)additionalMessageHeaders
{
  v10.receiver = self;
  v10.super_class = (Class)IDSInitializeValidationMessage;
  id v3 = [(IDSInitializeValidationMessage *)&v10 additionalMessageHeaders];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSInitializeValidationMessage *)self pushToken];
  objc_super v6 = [v5 _FTStringFromBaseData];

  if (v6) {
    CFDictionarySetValue(Mutable, @"x-push-token", v6);
  }

  v7 = _IDSIDProtocolVersionNumber();
  v8 = [v7 stringValue];

  if (v8) {
    CFDictionarySetValue(Mutable, @"x-protocol-version", v8);
  }

  return Mutable;
}

- (BOOL)requiresPushTokenKeys
{
  return 1;
}

- (void)handleResponseDictionary:(id)a3
{
  id v9 = a3;
  if (_IMWillLog())
  {
    id v8 = v9;
    _IMAlwaysLog();
  }
  id v4 = objc_msgSend(v9, "objectForKey:", @"session-info", v8);
  [(IDSInitializeValidationMessage *)self setResponseSessionInfo:v4];

  v5 = [v9 objectForKey:@"ttl"];
  [(IDSInitializeValidationMessage *)self setResponseTTL:v5];

  objc_super v6 = [v9 objectForKey:@"absinthe-serv-key"];
  [(IDSInitializeValidationMessage *)self setResponseAbsintheServKey:v6];

  v7 = [v9 objectForKey:@"absinthe-response"];
  [(IDSInitializeValidationMessage *)self setResponseAbsintheResponse:v7];
}

- (NSData)sessionInfoRequest
{
  return self->_sessionInfoRequest;
}

- (void)setSessionInfoRequest:(id)a3
{
}

- (NSData)responseSessionInfo
{
  return self->_responseSessionInfo;
}

- (void)setResponseSessionInfo:(id)a3
{
}

- (NSNumber)responseTTL
{
  return self->_responseTTL;
}

- (void)setResponseTTL:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSString)absintheUDID
{
  return self->_absintheUDID;
}

- (void)setAbsintheUDID:(id)a3
{
}

- (NSData)absintheHello
{
  return self->_absintheHello;
}

- (void)setAbsintheHello:(id)a3
{
}

- (NSData)responseAbsintheServKey
{
  return self->_responseAbsintheServKey;
}

- (void)setResponseAbsintheServKey:(id)a3
{
}

- (NSData)responseAbsintheResponse
{
  return self->_responseAbsintheResponse;
}

- (void)setResponseAbsintheResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseAbsintheResponse, 0);
  objc_storeStrong((id *)&self->_responseAbsintheServKey, 0);
  objc_storeStrong((id *)&self->_absintheHello, 0);
  objc_storeStrong((id *)&self->_absintheUDID, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_responseTTL, 0);
  objc_storeStrong((id *)&self->_responseSessionInfo, 0);

  objc_storeStrong((id *)&self->_sessionInfoRequest, 0);
}

@end