@interface IDSRegistrationMessage
- (BOOL)hasRequiredKeys:(id *)a3;
- (BOOL)isMultipleAuthCertCapable;
- (BOOL)requiresPushTokenKeys;
- (NSArray)responseServices;
- (NSArray)services;
- (NSData)validationData;
- (NSDictionary)privateDeviceData;
- (NSNumber)responseHBI;
- (NSString)deviceName;
- (NSString)hardwareVersion;
- (NSString)hostDeviceName;
- (NSString)hostHardwareVersion;
- (NSString)hostLanguage;
- (NSString)hostOsVersion;
- (NSString)hostSoftwareVersion;
- (NSString)language;
- (NSString)osVersion;
- (NSString)requestReasonString;
- (NSString)softwareVersion;
- (double)anisetteHeadersTimeout;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)nonStandardMessageHeadersForOutgoingPush;
- (id)requiredKeys;
- (void)handleResponseDictionary:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setHostDeviceName:(id)a3;
- (void)setHostHardwareVersion:(id)a3;
- (void)setHostLanguage:(id)a3;
- (void)setHostOsVersion:(id)a3;
- (void)setHostSoftwareVersion:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setPrivateDeviceData:(id)a3;
- (void)setRequestReasonString:(id)a3;
- (void)setResponseHBI:(id)a3;
- (void)setResponseServices:(id)a3;
- (void)setServices:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setValidationData:(id)a3;
@end

@implementation IDSRegistrationMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)IDSRegistrationMessage;
  id v4 = [(IDSRegistrationMessage *)&v21 copyWithZone:a3];
  v5 = [(IDSRegistrationMessage *)self deviceName];
  [v4 setDeviceName:v5];

  v6 = [(IDSRegistrationMessage *)self language];
  [v4 setLanguage:v6];

  v7 = [(IDSRegistrationMessage *)self services];
  [v4 setServices:v7];

  v8 = [(IDSRegistrationMessage *)self osVersion];
  [v4 setOsVersion:v8];

  v9 = [(IDSRegistrationMessage *)self softwareVersion];
  [v4 setSoftwareVersion:v9];

  v10 = [(IDSRegistrationMessage *)self hardwareVersion];
  [v4 setHardwareVersion:v10];

  v11 = [(IDSRegistrationMessage *)self privateDeviceData];
  [v4 setPrivateDeviceData:v11];

  v12 = [(IDSRegistrationMessage *)self hostDeviceName];
  [v4 setHostDeviceName:v12];

  v13 = [(IDSRegistrationMessage *)self hostLanguage];
  [v4 setHostLanguage:v13];

  v14 = [(IDSRegistrationMessage *)self hostOsVersion];
  [v4 setHostOsVersion:v14];

  v15 = [(IDSRegistrationMessage *)self hostSoftwareVersion];
  [v4 setHostSoftwareVersion:v15];

  v16 = [(IDSRegistrationMessage *)self hostHardwareVersion];
  [v4 setHostHardwareVersion:v16];

  v17 = [(IDSRegistrationMessage *)self validationData];
  [v4 setValidationData:v17];

  v18 = [(IDSRegistrationMessage *)self responseServices];
  [v4 setResponseServices:v18];

  v19 = [(IDSRegistrationMessage *)self responseHBI];
  [v4 setResponseHBI:v19];

  return v4;
}

- (BOOL)hasRequiredKeys:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IDSRegistrationMessage;
  return [(IDSRegistrationMessage *)&v4 hasRequiredKeys:a3];
}

- (BOOL)requiresPushTokenKeys
{
  return 1;
}

- (id)bagKey
{
  return @"id-register";
}

- (BOOL)isMultipleAuthCertCapable
{
  return 1;
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [v2 addObject:@"services"];
  [v2 addObject:@"hardware-version"];
  [v2 addObject:@"os-version"];
  [v2 addObject:@"software-version"];
  [v2 addObject:@"validation-data"];

  return v2;
}

- (id)additionalMessageHeaders
{
  v7.receiver = self;
  v7.super_class = (Class)IDSRegistrationMessage;
  v3 = [(IDSRegistrationMessage *)&v7 additionalMessageHeaders];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSRegistrationMessage *)self requestReasonString];
  if (v5) {
    CFDictionarySetValue(Mutable, @"x-apple-req-reason", v5);
  }

  return Mutable;
}

- (id)messageBody
{
  v19.receiver = self;
  v19.super_class = (Class)IDSRegistrationMessage;
  v3 = [(IDSRegistrationMessage *)&v19 messageBody];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSRegistrationMessage *)self hardwareVersion];
  if (v5)
  {
    CFDictionarySetValue(Mutable, @"hardware-version", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007094E4();
  }

  v6 = [(IDSRegistrationMessage *)self osVersion];
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"os-version", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070945C();
  }

  objc_super v7 = [(IDSRegistrationMessage *)self privateDeviceData];
  if (v7) {
    CFDictionarySetValue(Mutable, @"private-device-data", v7);
  }

  v8 = [(IDSRegistrationMessage *)self softwareVersion];
  if (v8)
  {
    CFDictionarySetValue(Mutable, @"software-version", v8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100714408();
  }

  v9 = [(IDSRegistrationMessage *)self validationData];
  if (v9)
  {
    CFDictionarySetValue(Mutable, @"validation-data", v9);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071AF64();
  }

  v10 = IMCurrentPreferredLanguage();
  if (v10)
  {
    CFDictionarySetValue(Mutable, @"language", v10);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071AEDC();
  }

  v11 = [(IDSRegistrationMessage *)self services];
  if (v11)
  {
    CFDictionarySetValue(Mutable, @"services", v11);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071AE54();
  }

  v12 = [(IDSRegistrationMessage *)self deviceName];
  if (v12) {
    CFDictionarySetValue(Mutable, @"device-name", v12);
  }

  v13 = [(IDSRegistrationMessage *)self hostHardwareVersion];
  if (v13) {
    CFDictionarySetValue(Mutable, @"host-hardware-version", v13);
  }

  v14 = [(IDSRegistrationMessage *)self hostOsVersion];
  if (v14) {
    CFDictionarySetValue(Mutable, @"host-os-version", v14);
  }

  v15 = [(IDSRegistrationMessage *)self hostDeviceName];
  if (v15) {
    CFDictionarySetValue(Mutable, @"host-device-name", v15);
  }

  v16 = [(IDSRegistrationMessage *)self hostSoftwareVersion];
  if (v16) {
    CFDictionarySetValue(Mutable, @"host-software-version", v16);
  }

  v17 = [(IDSRegistrationMessage *)self hostLanguage];
  if (v17) {
    CFDictionarySetValue(Mutable, @"host-language", v17);
  }

  return Mutable;
}

- (id)nonStandardMessageHeadersForOutgoingPush
{
  return 0;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (void)handleResponseDictionary:(id)a3
{
  id v8 = a3;
  if (_IMWillLog())
  {
    id v7 = v8;
    _IMAlwaysLog();
  }
  objc_super v4 = objc_msgSend(v8, "objectForKey:", @"services", v7);
  [(IDSRegistrationMessage *)self setResponseServices:v4];

  v5 = [v8 objectForKey:@"next-hbi"];
  [(IDSRegistrationMessage *)self setResponseHBI:v5];

  v6 = [v8 objectForKey:@"alert"];
  [(IDSRegistrationMessage *)self setResponseAlertInfo:v6];
}

- (NSData)validationData
{
  return (NSData *)objc_getProperty(self, a2, 232, 1);
}

- (void)setValidationData:(id)a3
{
}

- (NSArray)responseServices
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setResponseServices:(id)a3
{
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setLanguage:(id)a3
{
}

- (NSArray)services
{
  return (NSArray *)objc_getProperty(self, a2, 256, 1);
}

- (void)setServices:(id)a3
{
}

- (NSString)hardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setHardwareVersion:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)softwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setSoftwareVersion:(id)a3
{
}

- (NSDictionary)privateDeviceData
{
  return (NSDictionary *)objc_getProperty(self, a2, 288, 1);
}

- (void)setPrivateDeviceData:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)hostLanguage
{
  return self->_hostLanguage;
}

- (void)setHostLanguage:(id)a3
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

- (NSString)hostDeviceName
{
  return self->_hostDeviceName;
}

- (void)setHostDeviceName:(id)a3
{
}

- (NSString)hostSoftwareVersion
{
  return self->_hostSoftwareVersion;
}

- (void)setHostSoftwareVersion:(id)a3
{
}

- (NSNumber)responseHBI
{
  return (NSNumber *)objc_getProperty(self, a2, 344, 1);
}

- (void)setResponseHBI:(id)a3
{
}

- (NSString)requestReasonString
{
  return (NSString *)objc_getProperty(self, a2, 352, 1);
}

- (void)setRequestReasonString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestReasonString, 0);
  objc_storeStrong((id *)&self->_responseHBI, 0);
  objc_storeStrong((id *)&self->_hostSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_hostDeviceName, 0);
  objc_storeStrong((id *)&self->_hostOsVersion, 0);
  objc_storeStrong((id *)&self->_hostHardwareVersion, 0);
  objc_storeStrong((id *)&self->_hostLanguage, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_privateDeviceData, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_responseServices, 0);

  objc_storeStrong((id *)&self->_validationData, 0);
}

@end