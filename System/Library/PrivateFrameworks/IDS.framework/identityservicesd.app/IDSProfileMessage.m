@interface IDSProfileMessage
- (BOOL)hasRequiredKeys:(id *)a3;
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsHTTPHeaders;
- (IDSProfileMessage)init;
- (NSData)pushCertificate;
- (NSData)pushToken;
- (NSString)authToken;
- (NSString)profileID;
- (__SecKey)pushPrivateKey;
- (__SecKey)pushPublicKey;
- (id)additionalMessageHeaders;
- (id)additionalMessageHeadersForOutgoingPush;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)dealloc;
- (void)handleResponseDictionary:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setProfileID:(id)a3;
- (void)setPushCertificate:(id)a3;
- (void)setPushPrivateKey:(__SecKey *)a3;
- (void)setPushPublicKey:(__SecKey *)a3;
- (void)setPushToken:(id)a3;
@end

@implementation IDSProfileMessage

- (IDSProfileMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSProfileMessage;
  v2 = [(IDSProfileMessage *)&v6 init];
  if (v2)
  {
    IMGetConferenceSettings();
    id v3 = 0;
    v4 = [v3 lastObject];
    [(IDSProfileMessage *)v2 setTopic:v4];

    [(IDSProfileMessage *)v2 setTimeout:60.0];
    [(IDSProfileMessage *)v2 setWantsResponse:1];
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)IDSProfileMessage;
  id v4 = [(IDSProfileMessage *)&v10 copyWithZone:a3];
  v5 = [(IDSProfileMessage *)self authToken];
  [v4 setAuthToken:v5];

  objc_super v6 = [(IDSProfileMessage *)self profileID];
  [v4 setProfileID:v6];

  v7 = [(IDSProfileMessage *)self pushCertificate];
  [v4 setPushCertificate:v7];

  objc_msgSend(v4, "setPushPrivateKey:", -[IDSProfileMessage pushPrivateKey](self, "pushPrivateKey"));
  objc_msgSend(v4, "setPushPublicKey:", -[IDSProfileMessage pushPublicKey](self, "pushPublicKey"));
  v8 = [(IDSProfileMessage *)self pushToken];
  [v4 setPushToken:v8];

  return v4;
}

- (void)dealloc
{
  [(IDSProfileMessage *)self setPushCertificate:0];
  [(IDSProfileMessage *)self setPushPrivateKey:0];
  [(IDSProfileMessage *)self setPushPublicKey:0];
  v3.receiver = self;
  v3.super_class = (Class)IDSProfileMessage;
  [(IDSProfileMessage *)&v3 dealloc];
}

- (void)setPushPublicKey:(__SecKey *)a3
{
  pushPublicKey = self->_pushPublicKey;
  if (pushPublicKey != a3)
  {
    if (pushPublicKey)
    {
      CFRelease(pushPublicKey);
      self->_pushPublicKey = 0;
    }
    if (a3)
    {
      self->_pushPublicKey = a3;
      CFRetain(a3);
    }
  }
}

- (void)setPushPrivateKey:(__SecKey *)a3
{
  pushKey = self->_pushKey;
  if (pushKey != a3)
  {
    if (pushKey)
    {
      CFRelease(pushKey);
      self->_pushKey = 0;
    }
    if (a3)
    {
      self->_pushKey = a3;
      CFRetain(a3);
    }
  }
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

- (int64_t)command
{
  return 96;
}

- (int64_t)responseCommand
{
  return 97;
}

- (BOOL)hasRequiredKeys:(id *)a3
{
  v5 = [(IDSProfileMessage *)self authToken];
  id v6 = [v5 length];

  if (v6)
  {
    v7 = [(IDSProfileMessage *)self profileID];
    id v8 = [v7 length];

    if (v8)
    {
      v12.receiver = self;
      v12.super_class = (Class)IDSProfileMessage;
      return [(IDSProfileMessage *)&v12 hasRequiredKeys:a3];
    }
    _IMWarn();
    if (a3)
    {
      CFStringRef v10 = @"profile-id";
      goto LABEL_8;
    }
  }
  else
  {
    _IMWarn();
    if (a3)
    {
      CFStringRef v10 = @"auth token";
LABEL_8:
      id v11 = +[NSArray arrayWithObject:v10];
      BOOL result = 0;
      *a3 = v11;
      return result;
    }
  }
  return 0;
}

- (id)additionalMessageHeadersForOutgoingPush
{
  v13.receiver = self;
  v13.super_class = (Class)IDSProfileMessage;
  objc_super v3 = [(IDSProfileMessage *)&v13 additionalMessageHeaders];
  id v4 = (__CFDictionary *)[v3 mutableCopy];

  if (!v4) {
    id v4 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  v5 = [(IDSProfileMessage *)self profileID];
  if (v5)
  {
    CFDictionarySetValue(v4, @"vp", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070FA14();
  }

  id v6 = [(IDSProfileMessage *)self authToken];
  v7 = [v6 _FTDataFromHexString];

  if (v7)
  {
    CFDictionarySetValue(v4, @"va", v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F98C();
  }

  id v8 = [(IDSProfileMessage *)self authToken];
  v9 = [v8 _FTDataFromHexString];

  if (v9)
  {
    CFDictionarySetValue(v4, @"xp", v9);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F87C();
  }

  CFStringRef v10 = [(IDSProfileMessage *)self dsAuthID];
  if (v10)
  {
    CFDictionarySetValue(v4, @"x-ds-client-id", v10);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F904();
  }

  id v11 = _IDSIDProtocolVersionNumber();
  if (v11)
  {
    CFDictionarySetValue(v4, @"xp", v11);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F87C();
  }

  return v4;
}

- (id)additionalMessageHeaders
{
  v11.receiver = self;
  v11.super_class = (Class)IDSProfileMessage;
  objc_super v3 = [(IDSProfileMessage *)&v11 additionalMessageHeaders];
  id v4 = (__CFDictionary *)[v3 mutableCopy];

  if (!v4) {
    id v4 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  v5 = [(IDSProfileMessage *)self profileID];
  if (v5)
  {
    CFDictionarySetValue(v4, @"x-vc-profile-id", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070FBAC();
  }

  id v6 = [(IDSProfileMessage *)self authToken];
  if (v6)
  {
    CFDictionarySetValue(v4, @"x-vc-auth-token", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070FB24();
  }

  v7 = [(IDSProfileMessage *)self dsAuthID];
  if (v7)
  {
    CFDictionarySetValue(v4, @"x-ds-client-id", v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F904();
  }

  id v8 = _IDSIDProtocolVersionNumber();
  v9 = [v8 stringValue];

  if (v9)
  {
    CFDictionarySetValue(v4, @"x-protocol-version", v9);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070FA9C();
  }

  return v4;
}

- (void)handleResponseDictionary:(id)a3
{
  id v6 = a3;
  if (_IMWillLog())
  {
    id v5 = v6;
    _IMAlwaysLog();
  }
  id v4 = objc_msgSend(v6, "objectForKey:", @"alert", v5);
  [(IDSProfileMessage *)self setResponseAlertInfo:v4];
}

- (NSData)pushCertificate
{
  return self->_pushCert;
}

- (void)setPushCertificate:(id)a3
{
}

- (__SecKey)pushPrivateKey
{
  return self->_pushKey;
}

- (__SecKey)pushPublicKey
{
  return self->_pushPublicKey;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
}

- (NSString)profileID
{
  return self->_profileID;
}

- (void)setProfileID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileID, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);

  objc_storeStrong((id *)&self->_pushCert, 0);
}

@end