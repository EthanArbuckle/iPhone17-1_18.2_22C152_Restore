@interface IDSGetSIMAuthTokenMessage
- (BOOL)isMultipleAuthCertCapable;
- (NSNumber)responseStatus;
- (NSString)IMEI;
- (NSString)carrierNonce;
- (NSString)hardwareVersion;
- (NSString)hostHardwareVersion;
- (NSString)hostOsVersion;
- (NSString)hostSoftwareVersion;
- (NSString)osVersion;
- (NSString)protocolVersion;
- (NSString)responseCarrierToken;
- (NSString)responseMessage;
- (NSString)softwareVersion;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)handleResponseDictionary:(id)a3;
- (void)setCarrierNonce:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setHostHardwareVersion:(id)a3;
- (void)setHostOsVersion:(id)a3;
- (void)setHostSoftwareVersion:(id)a3;
- (void)setIMEI:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setProtocolVersion:(id)a3;
- (void)setResponseCarrierToken:(id)a3;
- (void)setResponseMessage:(id)a3;
- (void)setResponseStatus:(id)a3;
- (void)setSoftwareVersion:(id)a3;
@end

@implementation IDSGetSIMAuthTokenMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)IDSGetSIMAuthTokenMessage;
  id v4 = [(IDSGetSIMAuthTokenMessage *)&v18 copyWithZone:a3];
  v5 = [(IDSGetSIMAuthTokenMessage *)self protocolVersion];
  [v4 setProtocolVersion:v5];

  v6 = [(IDSGetSIMAuthTokenMessage *)self hardwareVersion];
  [v4 setHardwareVersion:v6];

  v7 = [(IDSGetSIMAuthTokenMessage *)self osVersion];
  [v4 setOsVersion:v7];

  v8 = [(IDSGetSIMAuthTokenMessage *)self softwareVersion];
  [v4 setSoftwareVersion:v8];

  v9 = [(IDSGetSIMAuthTokenMessage *)self hostHardwareVersion];
  [v4 setHostHardwareVersion:v9];

  v10 = [(IDSGetSIMAuthTokenMessage *)self hostOsVersion];
  [v4 setHostOsVersion:v10];

  v11 = [(IDSGetSIMAuthTokenMessage *)self hostSoftwareVersion];
  [v4 setHostSoftwareVersion:v11];

  v12 = [(IDSGetSIMAuthTokenMessage *)self carrierNonce];
  [v4 setCarrierNonce:v12];

  v13 = [(IDSGetSIMAuthTokenMessage *)self IMEI];
  [v4 setIMEI:v13];

  v14 = [(IDSGetSIMAuthTokenMessage *)self responseStatus];
  [v4 setResponseStatus:v14];

  v15 = [(IDSGetSIMAuthTokenMessage *)self responseCarrierToken];
  [v4 setResponseCarrierToken:v15];

  v16 = [(IDSGetSIMAuthTokenMessage *)self responseMessage];
  [v4 setResponseMessage:v16];

  return v4;
}

- (id)additionalMessageHeaders
{
  v8.receiver = self;
  v8.super_class = (Class)IDSGetSIMAuthTokenMessage;
  v3 = [(IDSGetSIMAuthTokenMessage *)&v8 additionalMessageHeaders];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSGetSIMAuthTokenMessage *)self pushCertificate];
  v6 = [v5 _FTStringFromBaseData];

  if (v6)
  {
    CFDictionarySetValue(Mutable, @"x-push-cert", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007091B4();
  }

  return Mutable;
}

- (id)messageBody
{
  v14.receiver = self;
  v14.super_class = (Class)IDSGetSIMAuthTokenMessage;
  v3 = [(IDSGetSIMAuthTokenMessage *)&v14 messageBody];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSGetSIMAuthTokenMessage *)self hardwareVersion];
  if (v5)
  {
    CFDictionarySetValue(Mutable, @"hardware-version", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007094E4();
  }

  v6 = [(IDSGetSIMAuthTokenMessage *)self osVersion];
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"os-version", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070945C();
  }

  v7 = [(IDSGetSIMAuthTokenMessage *)self softwareVersion];
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"software-version", v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100714408();
  }

  objc_super v8 = [(IDSGetSIMAuthTokenMessage *)self hostHardwareVersion];
  if (v8) {
    CFDictionarySetValue(Mutable, @"host-hardware-version", v8);
  }

  v9 = [(IDSGetSIMAuthTokenMessage *)self hostOsVersion];
  if (v9) {
    CFDictionarySetValue(Mutable, @"host-os-version", v9);
  }

  v10 = [(IDSGetSIMAuthTokenMessage *)self hostSoftwareVersion];
  if (v10) {
    CFDictionarySetValue(Mutable, @"host-software-version", v10);
  }

  v11 = [(IDSGetSIMAuthTokenMessage *)self carrierNonce];
  if (v11)
  {
    CFDictionarySetValue(Mutable, @"carrier-nonce", v11);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007244B8();
  }

  v12 = [(IDSGetSIMAuthTokenMessage *)self IMEI];
  if (v12)
  {
    CFDictionarySetValue(Mutable, @"imei", v12);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100724430();
  }

  return Mutable;
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);

  return v2;
}

- (id)bagKey
{
  return @"id-get-esat";
}

- (BOOL)isMultipleAuthCertCapable
{
  return 1;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 _numberForKey:@"status"];
  [(IDSGetSIMAuthTokenMessage *)self setResponseStatus:v5];

  v6 = [v4 _stringForKey:@"esim-auth-token"];
  [(IDSGetSIMAuthTokenMessage *)self setResponseCarrierToken:v6];

  id v7 = [v4 _stringForKey:@"message"];

  [(IDSGetSIMAuthTokenMessage *)self setResponseMessage:v7];
}

- (NSString)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(id)a3
{
}

- (NSString)hardwareVersion
{
  return self->_hardwareVersion;
}

- (void)setHardwareVersion:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(id)a3
{
}

- (NSString)hostHardwareVersion
{
  return self->_hostHardwareVersion;
}

- (void)setHostHardwareVersion:(id)a3
{
}

- (NSString)hostOsVersion
{
  return self->_hostOsVersion;
}

- (void)setHostOsVersion:(id)a3
{
}

- (NSString)hostSoftwareVersion
{
  return self->_hostSoftwareVersion;
}

- (void)setHostSoftwareVersion:(id)a3
{
}

- (NSString)carrierNonce
{
  return self->_carrierNonce;
}

- (void)setCarrierNonce:(id)a3
{
}

- (NSString)IMEI
{
  return self->_IMEI;
}

- (void)setIMEI:(id)a3
{
}

- (NSNumber)responseStatus
{
  return self->_responseStatus;
}

- (void)setResponseStatus:(id)a3
{
}

- (NSString)responseCarrierToken
{
  return self->_responseCarrierToken;
}

- (void)setResponseCarrierToken:(id)a3
{
}

- (NSString)responseMessage
{
  return self->_responseMessage;
}

- (void)setResponseMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseMessage, 0);
  objc_storeStrong((id *)&self->_responseCarrierToken, 0);
  objc_storeStrong((id *)&self->_responseStatus, 0);
  objc_storeStrong((id *)&self->_IMEI, 0);
  objc_storeStrong((id *)&self->_carrierNonce, 0);
  objc_storeStrong((id *)&self->_hostSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_hostOsVersion, 0);
  objc_storeStrong((id *)&self->_hostHardwareVersion, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);

  objc_storeStrong((id *)&self->_protocolVersion, 0);
}

@end