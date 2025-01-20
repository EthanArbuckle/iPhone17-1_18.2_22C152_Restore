@interface IDSValidationCertificateMessage
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsHTTPGet;
- (BOOL)wantsHTTPHeaders;
- (IDSValidationCertificateMessage)init;
- (NSData)pushToken;
- (NSData)responseCertificateData;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)handleResponseDictionary:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setResponseCertificateData:(id)a3;
@end

@implementation IDSValidationCertificateMessage

- (IDSValidationCertificateMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSValidationCertificateMessage;
  v2 = [(IDSValidationCertificateMessage *)&v6 init];
  if (v2)
  {
    IMGetConferenceSettings();
    id v3 = 0;
    v4 = [v3 lastObject];
    [(IDSValidationCertificateMessage *)v2 setTopic:v4];

    [(IDSValidationCertificateMessage *)v2 setWantsResponse:1];
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IDSValidationCertificateMessage;
  id v4 = [(IDSValidationCertificateMessage *)&v8 copyWithZone:a3];
  v5 = [(IDSValidationCertificateMessage *)self responseCertificateData];
  [v4 setResponseCertificateData:v5];

  objc_super v6 = [(IDSValidationCertificateMessage *)self pushToken];
  [v4 setPushToken:v6];

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

- (BOOL)wantsHTTPGet
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
  return @"id-validation-cert";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);

  return v2;
}

- (id)messageBody
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);

  return v2;
}

- (id)additionalMessageHeaders
{
  v5.receiver = self;
  v5.super_class = (Class)IDSValidationCertificateMessage;
  id v2 = [(IDSValidationCertificateMessage *)&v5 additionalMessageHeaders];
  CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v2 mutableCopy];

  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }

  return Mutable;
}

- (void)handleResponseDictionary:(id)a3
{
  id v6 = a3;
  if (_IMWillLog())
  {
    id v5 = v6;
    _IMAlwaysLog();
  }
  id v4 = objc_msgSend(v6, "objectForKey:", @"cert", v5);
  [(IDSValidationCertificateMessage *)self setResponseCertificateData:v4];
}

- (NSData)responseCertificateData
{
  return self->_responseCertificateData;
}

- (void)setResponseCertificateData:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);

  objc_storeStrong((id *)&self->_responseCertificateData, 0);
}

@end