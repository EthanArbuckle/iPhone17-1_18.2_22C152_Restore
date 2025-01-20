@interface IDSProvisionTemporaryPhoneMessage
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsHTTPHeaders;
- (IDSProvisionTemporaryPhoneMessage)init;
- (NSData)responseCertificate;
- (NSDate)responseCertificateExpiration;
- (NSNumber)responseStatus;
- (NSString)authToken;
- (NSString)countryCode;
- (NSString)networkCode;
- (NSString)profileID;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)addPhoneAuthenticationCertificate:(id)a3 withUserID:(id)a4;
- (void)handleResponseDictionary:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setNetworkCode:(id)a3;
- (void)setProfileID:(id)a3;
- (void)setResponseCertificate:(id)a3;
- (void)setResponseCertificateExpiration:(id)a3;
- (void)setResponseStatus:(id)a3;
@end

@implementation IDSProvisionTemporaryPhoneMessage

- (IDSProvisionTemporaryPhoneMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSProvisionTemporaryPhoneMessage;
  v2 = [(IDSProvisionTemporaryPhoneMessage *)&v6 init];
  if (v2)
  {
    IMGetConferenceSettings();
    id v3 = 0;
    v4 = [v3 lastObject];
    [(IDSProvisionTemporaryPhoneMessage *)v2 setTopic:v4];

    [(IDSProvisionTemporaryPhoneMessage *)v2 setWantsResponse:1];
  }
  return v2;
}

- (void)addPhoneAuthenticationCertificate:(id)a3 withUserID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[IDSRegistrationKeyManager sharedInstance];
  -[IDSProvisionTemporaryPhoneMessage addAuthUserID:certificate:privateKey:publicKey:](self, "addAuthUserID:certificate:privateKey:publicKey:", v6, v7, [v8 identityPrivateKey], objc_msgSend(v8, "identityPublicKey"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)IDSProvisionTemporaryPhoneMessage;
  id v4 = [(IDSProvisionTemporaryPhoneMessage *)&v13 copyWithZone:a3];
  v5 = [(IDSProvisionTemporaryPhoneMessage *)self profileID];
  [v4 setProfileID:v5];

  id v6 = [(IDSProvisionTemporaryPhoneMessage *)self authToken];
  [v4 setAuthToken:v6];

  id v7 = [(IDSProvisionTemporaryPhoneMessage *)self countryCode];
  [v4 setCountryCode:v7];

  id v8 = [(IDSProvisionTemporaryPhoneMessage *)self networkCode];
  [v4 setNetworkCode:v8];

  v9 = [(IDSProvisionTemporaryPhoneMessage *)self responseStatus];
  [v4 setResponseStatus:v9];

  v10 = [(IDSProvisionTemporaryPhoneMessage *)self responseCertificate];
  [v4 setResponseCertificate:v10];

  v11 = [(IDSProvisionTemporaryPhoneMessage *)self responseCertificateExpiration];
  [v4 setResponseCertificateExpiration:v11];

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
  return @"id-provision-temporary";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [v2 addObject:@"vc-profile-id"];
  [v2 addObject:@"vc-auth-token"];

  return v2;
}

- (id)messageBody
{
  v10.receiver = self;
  v10.super_class = (Class)IDSProvisionTemporaryPhoneMessage;
  id v3 = [(IDSProvisionTemporaryPhoneMessage *)&v10 messageBody];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSProvisionTemporaryPhoneMessage *)self profileID];
  if (v5)
  {
    CFDictionarySetValue(Mutable, @"vc-profile-id", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100712B64();
  }

  id v6 = [(IDSProvisionTemporaryPhoneMessage *)self authToken];
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"vc-auth-token", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100712ADC();
  }

  id v7 = [(IDSProvisionTemporaryPhoneMessage *)self countryCode];
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"sim-mcc", v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100712A54();
  }

  id v8 = [(IDSProvisionTemporaryPhoneMessage *)self networkCode];
  if (v8)
  {
    CFDictionarySetValue(Mutable, @"sim-mnc", v8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007129CC();
  }

  return Mutable;
}

- (id)additionalMessageHeaders
{
  v10.receiver = self;
  v10.super_class = (Class)IDSProvisionTemporaryPhoneMessage;
  id v3 = [(IDSProvisionTemporaryPhoneMessage *)&v10 additionalMessageHeaders];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSProvisionTemporaryPhoneMessage *)self pushCertificate];
  id v6 = [v5 _FTStringFromBaseData];

  if (v6)
  {
    CFDictionarySetValue(Mutable, @"x-push-cert", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007091B4();
  }

  id v7 = [(IDSProvisionTemporaryPhoneMessage *)self pushToken];
  id v8 = [v7 _FTStringFromBaseData];

  if (v8)
  {
    CFDictionarySetValue(Mutable, @"x-push-token", v8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100712BEC();
  }

  return Mutable;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IDS Provision Temporary Phone response: %@", (uint8_t *)&v18, 0xCu);
  }

  id v6 = [v4 _numberForKey:@"status"];
  [(IDSProvisionTemporaryPhoneMessage *)self setResponseStatus:v6];

  uint64_t v7 = [(IDSProvisionTemporaryPhoneMessage *)self responseStatus];
  if (v7)
  {
    id v8 = (void *)v7;
    v9 = [(IDSProvisionTemporaryPhoneMessage *)self responseStatus];
    id v10 = [v9 integerValue];

    if (!v10)
    {
      v11 = [v4 objectForKeyedSubscript:@"temporary-credential"];
      [(IDSProvisionTemporaryPhoneMessage *)self setResponseCertificate:v11];

      v12 = [v4 _stringForKey:@"expiry"];
      id v13 = objc_alloc_init((Class)NSNumberFormatter);
      v14 = [v13 numberFromString:v12];
      if (v14)
      {
        uint64_t v15 = +[IMUserDefaults homeNumberSecondsUntilExpiration];
        if (CUTIsInternalInstall() && v15)
        {
          uint64_t v16 = +[NSDate dateWithTimeIntervalSinceNow:(double)v15];
        }
        else
        {
          uint64_t v16 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)((unint64_t)[v14 unsignedLongLongValue] / 0x3E8));
        }
        v17 = v16;
        [(IDSProvisionTemporaryPhoneMessage *)self setResponseCertificateExpiration:v16];
      }
      else
      {
        if (!v12)
        {
LABEL_15:

          goto LABEL_16;
        }
        v17 = +[IMRGLog registration];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          sub_100712C74((uint64_t)v12, v17);
        }
      }

      goto LABEL_15;
    }
  }
LABEL_16:
}

- (NSString)profileID
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setProfileID:(id)a3
{
}

- (NSString)authToken
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAuthToken:(id)a3
{
}

- (NSString)countryCode
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)networkCode
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setNetworkCode:(id)a3
{
}

- (NSNumber)responseStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setResponseStatus:(id)a3
{
}

- (NSData)responseCertificate
{
  return (NSData *)objc_getProperty(self, a2, 272, 1);
}

- (void)setResponseCertificate:(id)a3
{
}

- (NSDate)responseCertificateExpiration
{
  return (NSDate *)objc_getProperty(self, a2, 280, 1);
}

- (void)setResponseCertificateExpiration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseCertificateExpiration, 0);
  objc_storeStrong((id *)&self->_responseCertificate, 0);
  objc_storeStrong((id *)&self->_responseStatus, 0);
  objc_storeStrong((id *)&self->_networkCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_authToken, 0);

  objc_storeStrong((id *)&self->_profileID, 0);
}

@end