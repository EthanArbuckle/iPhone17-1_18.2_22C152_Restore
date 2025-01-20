@interface IDSGroupGetMessage
- (NSArray)responseEntries;
- (NSData)engramID;
- (NSNumber)responseStatus;
- (NSNumber)version;
- (NSString)deviceName;
- (NSString)hardwareVersion;
- (NSString)osVersion;
- (NSString)responseMessage;
- (NSString)softwareVersion;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)handleResponseDictionary:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setEngramID:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setResponseEntries:(id)a3;
- (void)setResponseMessage:(id)a3;
- (void)setResponseStatus:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation IDSGroupGetMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)IDSGroupGetMessage;
  id v4 = [(IDSGroupGetMessage *)&v15 copyWithZone:a3];
  v5 = [(IDSGroupGetMessage *)self hardwareVersion];
  [v4 setHardwareVersion:v5];

  v6 = [(IDSGroupGetMessage *)self osVersion];
  [v4 setOsVersion:v6];

  v7 = [(IDSGroupGetMessage *)self softwareVersion];
  [v4 setSoftwareVersion:v7];

  v8 = [(IDSGroupGetMessage *)self deviceName];
  [v4 setDeviceName:v8];

  v9 = [(IDSGroupGetMessage *)self engramID];
  [v4 setEngramID:v9];

  v10 = [(IDSGroupGetMessage *)self version];
  [v4 setVersion:v10];

  v11 = [(IDSGroupGetMessage *)self responseEntries];
  [v4 setResponseEntries:v11];

  v12 = [(IDSGroupGetMessage *)self responseStatus];
  [v4 setResponseStatus:v12];

  v13 = [(IDSGroupGetMessage *)self responseMessage];
  [v4 setResponseMessage:v13];

  return v4;
}

- (id)additionalMessageHeaders
{
  v12.receiver = self;
  v12.super_class = (Class)IDSGroupGetMessage;
  v3 = [(IDSGroupGetMessage *)&v12 additionalMessageHeaders];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSGroupGetMessage *)self engramID];

  if (v5)
  {
    v6 = [(IDSGroupGetMessage *)self engramID];
    v7 = objc_msgSend(v6, "__imHexString");
    v5 = +[NSString stringWithFormat:@"HASH:%@", v7];
  }
  v8 = [(IDSGroupGetMessage *)self pushCertificate];
  v9 = [v8 _FTStringFromBaseData];

  if (v9)
  {
    CFDictionarySetValue(Mutable, @"x-push-cert", v9);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007091B4();
  }

  id v10 = v5;
  if (v10)
  {
    CFDictionarySetValue(Mutable, @"route", v10);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100722E40();
  }

  return Mutable;
}

- (id)messageBody
{
  v12.receiver = self;
  v12.super_class = (Class)IDSGroupGetMessage;
  v3 = [(IDSGroupGetMessage *)&v12 messageBody];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSGroupGetMessage *)self hardwareVersion];
  if (v5)
  {
    CFDictionarySetValue(Mutable, @"hardware-version", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007094E4();
  }

  v6 = [(IDSGroupGetMessage *)self osVersion];
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"os-version", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070945C();
  }

  v7 = [(IDSGroupGetMessage *)self softwareVersion];
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"software-version", v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100714408();
  }

  v8 = [(IDSGroupGetMessage *)self deviceName];
  if (v8)
  {
    CFDictionarySetValue(Mutable, @"device-name", v8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100722F50();
  }

  v9 = [(IDSGroupGetMessage *)self engramID];
  if (v9)
  {
    CFDictionarySetValue(Mutable, @"engram-id", v9);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100722EC8();
  }

  id v10 = [(IDSGroupGetMessage *)self version];
  if (v10) {
    CFDictionarySetValue(Mutable, @"version", v10);
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
  return @"id-group-get-key";
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 _arrayForKey:@"entries"];
  [(IDSGroupGetMessage *)self setResponseEntries:v5];

  v6 = [v4 _numberForKey:@"status"];
  [(IDSGroupGetMessage *)self setResponseStatus:v6];

  id v7 = [v4 _stringForKey:@"message"];

  [(IDSGroupGetMessage *)self setResponseMessage:v7];
}

- (NSString)hardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setHardwareVersion:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)softwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSoftwareVersion:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (NSData)engramID
{
  return (NSData *)objc_getProperty(self, a2, 264, 1);
}

- (void)setEngramID:(id)a3
{
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 272, 1);
}

- (void)setVersion:(id)a3
{
}

- (NSArray)responseEntries
{
  return (NSArray *)objc_getProperty(self, a2, 280, 1);
}

- (void)setResponseEntries:(id)a3
{
}

- (NSNumber)responseStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 288, 1);
}

- (void)setResponseStatus:(id)a3
{
}

- (NSString)responseMessage
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setResponseMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseMessage, 0);
  objc_storeStrong((id *)&self->_responseStatus, 0);
  objc_storeStrong((id *)&self->_responseEntries, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_engramID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);

  objc_storeStrong((id *)&self->_hardwareVersion, 0);
}

@end