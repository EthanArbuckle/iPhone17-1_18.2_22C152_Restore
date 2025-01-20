@interface IDSGroupPutMessage
- (BOOL)allowDualDelivery;
- (NSArray)responseEntries;
- (NSData)data;
- (NSData)engramID;
- (NSData)forwardingSig;
- (NSData)key;
- (NSData)responseEngramID;
- (NSData)signature;
- (NSNumber)requiredUpdate;
- (NSNumber)responseStatus;
- (NSNumber)responseVersion;
- (NSNumber)version;
- (NSString)deviceName;
- (NSString)forwardingSigAlgorithm;
- (NSString)hardwareVersion;
- (NSString)osVersion;
- (NSString)responseMessage;
- (NSString)route;
- (NSString)sigAlgorithm;
- (NSString)softwareVersion;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)handleResponseDictionary:(id)a3;
- (void)setData:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setEngramID:(id)a3;
- (void)setForwardingSig:(id)a3;
- (void)setForwardingSigAlgorithm:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setKey:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setRequiredUpdate:(id)a3;
- (void)setResponseEngramID:(id)a3;
- (void)setResponseEntries:(id)a3;
- (void)setResponseMessage:(id)a3;
- (void)setResponseStatus:(id)a3;
- (void)setResponseVersion:(id)a3;
- (void)setRoute:(id)a3;
- (void)setSigAlgorithm:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation IDSGroupPutMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v25.receiver = self;
  v25.super_class = (Class)IDSGroupPutMessage;
  id v4 = [(IDSGroupPutMessage *)&v25 copyWithZone:a3];
  v5 = [(IDSGroupPutMessage *)self route];
  [v4 setRoute:v5];

  v6 = [(IDSGroupPutMessage *)self retryCount];
  [v4 setRetryCount:v6];

  v7 = [(IDSGroupPutMessage *)self hardwareVersion];
  [v4 setHardwareVersion:v7];

  v8 = [(IDSGroupPutMessage *)self osVersion];
  [v4 setOsVersion:v8];

  v9 = [(IDSGroupPutMessage *)self softwareVersion];
  [v4 setSoftwareVersion:v9];

  v10 = [(IDSGroupPutMessage *)self deviceName];
  [v4 setDeviceName:v10];

  v11 = [(IDSGroupPutMessage *)self engramID];
  [v4 setEngramID:v11];

  v12 = [(IDSGroupPutMessage *)self version];
  [v4 setVersion:v12];

  v13 = [(IDSGroupPutMessage *)self key];
  [v4 setKey:v13];

  v14 = [(IDSGroupPutMessage *)self data];
  [v4 setData:v14];

  v15 = [(IDSGroupPutMessage *)self signature];
  [v4 setSignature:v15];

  v16 = [(IDSGroupPutMessage *)self sigAlgorithm];
  [v4 setSigAlgorithm:v16];

  v17 = [(IDSGroupPutMessage *)self forwardingSig];
  [v4 setForwardingSig:v17];

  v18 = [(IDSGroupPutMessage *)self forwardingSigAlgorithm];
  [v4 setForwardingSigAlgorithm:v18];

  v19 = [(IDSGroupPutMessage *)self responseEngramID];
  [v4 setResponseEngramID:v19];

  v20 = [(IDSGroupPutMessage *)self responseVersion];
  [v4 setResponseVersion:v20];

  v21 = [(IDSGroupPutMessage *)self responseEntries];
  [v4 setResponseEntries:v21];

  v22 = [(IDSGroupPutMessage *)self responseStatus];
  [v4 setResponseStatus:v22];

  v23 = [(IDSGroupPutMessage *)self responseMessage];
  [v4 setResponseMessage:v23];

  return v4;
}

- (BOOL)allowDualDelivery
{
  return 1;
}

- (id)additionalMessageHeaders
{
  v9.receiver = self;
  v9.super_class = (Class)IDSGroupPutMessage;
  v3 = [(IDSGroupPutMessage *)&v9 additionalMessageHeaders];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSGroupPutMessage *)self pushCertificate];
  v6 = [v5 _FTStringFromBaseData];

  if (v6)
  {
    CFDictionarySetValue(Mutable, @"x-push-cert", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007091B4();
  }

  v7 = [(IDSGroupPutMessage *)self route];
  if (v7) {
    CFDictionarySetValue(Mutable, @"route", v7);
  }

  return Mutable;
}

- (id)messageBody
{
  v21.receiver = self;
  v21.super_class = (Class)IDSGroupPutMessage;
  v3 = [(IDSGroupPutMessage *)&v21 messageBody];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSGroupPutMessage *)self route];
  if (v5) {
    CFDictionarySetValue(Mutable, @"route", v5);
  }

  v6 = [(IDSGroupPutMessage *)self retryCount];
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"retry-count", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100714490();
  }

  v7 = [(IDSGroupPutMessage *)self hardwareVersion];
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"hardware-version", v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007094E4();
  }

  v8 = [(IDSGroupPutMessage *)self osVersion];
  if (v8)
  {
    CFDictionarySetValue(Mutable, @"os-version", v8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070945C();
  }

  objc_super v9 = [(IDSGroupPutMessage *)self softwareVersion];
  if (v9)
  {
    CFDictionarySetValue(Mutable, @"software-version", v9);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100714408();
  }

  v10 = [(IDSGroupPutMessage *)self deviceName];
  if (v10)
  {
    CFDictionarySetValue(Mutable, @"device-name", v10);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100714380();
  }

  v11 = [(IDSGroupPutMessage *)self engramID];
  if (v11) {
    CFDictionarySetValue(Mutable, @"engram-id", v11);
  }

  v12 = [(IDSGroupPutMessage *)self version];
  if (v12) {
    CFDictionarySetValue(Mutable, @"version", v12);
  }

  v13 = [(IDSGroupPutMessage *)self requiredUpdate];
  if (v13) {
    CFDictionarySetValue(Mutable, @"required-update", v13);
  }

  v14 = [(IDSGroupPutMessage *)self key];
  if (v14)
  {
    CFDictionarySetValue(Mutable, @"key", v14);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007142F8();
  }

  v15 = [(IDSGroupPutMessage *)self data];
  if (v15)
  {
    CFDictionarySetValue(Mutable, @"data", v15);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100714270();
  }

  v16 = [(IDSGroupPutMessage *)self signature];
  if (v16)
  {
    CFDictionarySetValue(Mutable, @"signature", v16);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007141E8();
  }

  v17 = [(IDSGroupPutMessage *)self sigAlgorithm];
  if (v17)
  {
    CFDictionarySetValue(Mutable, @"sig-algorithm", v17);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100714160();
  }

  v18 = [(IDSGroupPutMessage *)self forwardingSig];
  if (v18) {
    CFDictionarySetValue(Mutable, @"forwarding-sig", v18);
  }

  v19 = [(IDSGroupPutMessage *)self forwardingSigAlgorithm];
  if (v19) {
    CFDictionarySetValue(Mutable, @"forwarding-sig-algorithm", v19);
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
  return @"id-group-put-key";
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 _dataForKey:@"engram-id"];
  [(IDSGroupPutMessage *)self setResponseEngramID:v5];

  v6 = [v4 _numberForKey:@"version"];
  [(IDSGroupPutMessage *)self setResponseVersion:v6];

  v7 = [v4 _arrayForKey:@"entries"];
  [(IDSGroupPutMessage *)self setResponseEntries:v7];

  v8 = [v4 _numberForKey:@"status"];
  [(IDSGroupPutMessage *)self setResponseStatus:v8];

  id v9 = [v4 _stringForKey:@"message"];

  [(IDSGroupPutMessage *)self setResponseMessage:v9];
}

- (NSString)route
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setRoute:(id)a3
{
}

- (NSString)hardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setHardwareVersion:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)softwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setSoftwareVersion:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (NSData)engramID
{
  return (NSData *)objc_getProperty(self, a2, 272, 1);
}

- (void)setEngramID:(id)a3
{
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 280, 1);
}

- (void)setVersion:(id)a3
{
}

- (NSData)key
{
  return (NSData *)objc_getProperty(self, a2, 288, 1);
}

- (void)setKey:(id)a3
{
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 296, 1);
}

- (void)setData:(id)a3
{
}

- (NSNumber)requiredUpdate
{
  return (NSNumber *)objc_getProperty(self, a2, 304, 1);
}

- (void)setRequiredUpdate:(id)a3
{
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 312, 1);
}

- (void)setSignature:(id)a3
{
}

- (NSString)sigAlgorithm
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setSigAlgorithm:(id)a3
{
}

- (NSData)forwardingSig
{
  return (NSData *)objc_getProperty(self, a2, 328, 1);
}

- (void)setForwardingSig:(id)a3
{
}

- (NSString)forwardingSigAlgorithm
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setForwardingSigAlgorithm:(id)a3
{
}

- (NSData)responseEngramID
{
  return (NSData *)objc_getProperty(self, a2, 344, 1);
}

- (void)setResponseEngramID:(id)a3
{
}

- (NSNumber)responseVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 352, 1);
}

- (void)setResponseVersion:(id)a3
{
}

- (NSArray)responseEntries
{
  return (NSArray *)objc_getProperty(self, a2, 360, 1);
}

- (void)setResponseEntries:(id)a3
{
}

- (NSNumber)responseStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 368, 1);
}

- (void)setResponseStatus:(id)a3
{
}

- (NSString)responseMessage
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setResponseMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseMessage, 0);
  objc_storeStrong((id *)&self->_responseStatus, 0);
  objc_storeStrong((id *)&self->_responseEntries, 0);
  objc_storeStrong((id *)&self->_responseVersion, 0);
  objc_storeStrong((id *)&self->_responseEngramID, 0);
  objc_storeStrong((id *)&self->_forwardingSigAlgorithm, 0);
  objc_storeStrong((id *)&self->_forwardingSig, 0);
  objc_storeStrong((id *)&self->_sigAlgorithm, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_requiredUpdate, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_engramID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);

  objc_storeStrong((id *)&self->_route, 0);
}

@end