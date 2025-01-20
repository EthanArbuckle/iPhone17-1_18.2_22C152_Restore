@interface IDSPreflightMessage
- (BOOL)requiresPushTokenKeys;
- (NSArray)responseMechanisms;
- (NSNumber)phoneNumberValidationRetryCount;
- (NSNumber)pnrReason;
- (NSNumber)responseStatus;
- (NSString)IMSI;
- (NSString)PLMN;
- (NSString)deviceName;
- (NSString)hardwareVersion;
- (NSString)hostDeviceName;
- (NSString)hostHardwareVersion;
- (NSString)hostOsVersion;
- (NSString)hostSoftwareVersion;
- (NSString)osVersion;
- (NSString)protocolVersion;
- (NSString)softwareVersion;
- (NSString)testData;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)handleResponseDictionary:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setHostDeviceName:(id)a3;
- (void)setHostHardwareVersion:(id)a3;
- (void)setHostOsVersion:(id)a3;
- (void)setHostSoftwareVersion:(id)a3;
- (void)setIMSI:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setPLMN:(id)a3;
- (void)setPhoneNumberValidationRetryCount:(id)a3;
- (void)setPnrReason:(id)a3;
- (void)setProtocolVersion:(id)a3;
- (void)setResponseMechanisms:(id)a3;
- (void)setResponseStatus:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setTestData:(id)a3;
@end

@implementation IDSPreflightMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)IDSPreflightMessage;
  id v4 = [(IDSPreflightMessage *)&v21 copyWithZone:a3];
  v5 = [(IDSPreflightMessage *)self protocolVersion];
  [v4 setProtocolVersion:v5];

  v6 = [(IDSPreflightMessage *)self hardwareVersion];
  [v4 setHardwareVersion:v6];

  v7 = [(IDSPreflightMessage *)self osVersion];
  [v4 setOsVersion:v7];

  v8 = [(IDSPreflightMessage *)self softwareVersion];
  [v4 setSoftwareVersion:v8];

  v9 = [(IDSPreflightMessage *)self deviceName];
  [v4 setDeviceName:v9];

  v10 = [(IDSPreflightMessage *)self hostHardwareVersion];
  [v4 setHostHardwareVersion:v10];

  v11 = [(IDSPreflightMessage *)self hostOsVersion];
  [v4 setHostOsVersion:v11];

  v12 = [(IDSPreflightMessage *)self hostSoftwareVersion];
  [v4 setHostSoftwareVersion:v12];

  v13 = [(IDSPreflightMessage *)self hostDeviceName];
  [v4 setHostDeviceName:v13];

  v14 = [(IDSPreflightMessage *)self IMSI];
  [v4 setIMSI:v14];

  v15 = [(IDSPreflightMessage *)self PLMN];
  [v4 setPLMN:v15];

  v16 = [(IDSPreflightMessage *)self testData];
  [v4 setTestData:v16];

  v17 = [(IDSPreflightMessage *)self pnrReason];
  [v4 setPnrReason:v17];

  v18 = [(IDSPreflightMessage *)self responseStatus];
  [v4 setResponseStatus:v18];

  v19 = [(IDSPreflightMessage *)self responseMechanisms];
  [v4 setResponseMechanisms:v19];

  return v4;
}

- (id)additionalMessageHeaders
{
  v8.receiver = self;
  v8.super_class = (Class)IDSPreflightMessage;
  v3 = [(IDSPreflightMessage *)&v8 additionalMessageHeaders];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSPreflightMessage *)self pushCertificate];
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
  v19.receiver = self;
  v19.super_class = (Class)IDSPreflightMessage;
  v3 = [(IDSPreflightMessage *)&v19 messageBody];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSPreflightMessage *)self phoneNumberValidationRetryCount];
  if (v5)
  {
    CFDictionarySetValue(Mutable, @"pnv-retry-count", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070956C();
  }

  v6 = [(IDSPreflightMessage *)self hardwareVersion];
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"hardware-version", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007094E4();
  }

  v7 = [(IDSPreflightMessage *)self osVersion];
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"os-version", v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070945C();
  }

  objc_super v8 = [(IDSPreflightMessage *)self softwareVersion];
  if (v8)
  {
    CFDictionarySetValue(Mutable, @"software-version", v8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007093D4();
  }

  v9 = [(IDSPreflightMessage *)self deviceName];
  if (v9)
  {
    CFDictionarySetValue(Mutable, @"device-name", v9);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070934C();
  }

  v10 = [(IDSPreflightMessage *)self hostHardwareVersion];
  if (v10) {
    CFDictionarySetValue(Mutable, @"host-hardware-version", v10);
  }

  v11 = [(IDSPreflightMessage *)self hostOsVersion];
  if (v11) {
    CFDictionarySetValue(Mutable, @"host-os-version", v11);
  }

  v12 = [(IDSPreflightMessage *)self hostSoftwareVersion];
  if (v12) {
    CFDictionarySetValue(Mutable, @"host-software-version", v12);
  }

  v13 = [(IDSPreflightMessage *)self hostDeviceName];
  if (v13) {
    CFDictionarySetValue(Mutable, @"host-device-name", v13);
  }

  v14 = [(IDSPreflightMessage *)self IMSI];
  if (v14)
  {
    CFDictionarySetValue(Mutable, @"IMSI", v14);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007092C4();
  }

  v15 = [(IDSPreflightMessage *)self PLMN];
  if (v15)
  {
    CFDictionarySetValue(Mutable, @"PLMN", v15);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070923C();
  }

  v16 = [(IDSPreflightMessage *)self pnrReason];
  if (v16) {
    CFDictionarySetValue(Mutable, @"pnr-reason", v16);
  }

  v17 = [(IDSPreflightMessage *)self testData];
  if (v17) {
    CFDictionarySetValue(Mutable, @"test-data", v17);
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
  return @"id-preflight";
}

- (BOOL)requiresPushTokenKeys
{
  return 1;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 _numberForKey:@"status"];
  v16 = self;
  [(IDSPreflightMessage *)self setResponseStatus:v5];

  id v6 = objc_alloc_init((Class)NSMutableArray);
  v17 = v4;
  [v4 objectForKey:@"mechanisms"];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v12 = [v11 objectForKey:@"mechanism"];
        v13 = [v11 objectForKey:@"mechanism-data"];
        if ([v12 isEqualToString:@"SMS"])
        {
          uint64_t v14 = 1;
        }
        else if ([v12 isEqualToString:@"SMSLess"])
        {
          uint64_t v14 = 2;
        }
        else
        {
          uint64_t v14 = 0;
        }
        id v15 = [objc_alloc((Class)IDSCTPNRValidationMechanism) initWithType:v14 context:v13];
        [v6 addObject:v15];
      }
      id v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  [(IDSPreflightMessage *)v16 setResponseMechanisms:v6];
}

- (NSString)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(id)a3
{
}

- (NSNumber)phoneNumberValidationRetryCount
{
  return self->_phoneNumberValidationRetryCount;
}

- (void)setPhoneNumberValidationRetryCount:(id)a3
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

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)IMSI
{
  return self->_IMSI;
}

- (void)setIMSI:(id)a3
{
}

- (NSString)PLMN
{
  return self->_PLMN;
}

- (void)setPLMN:(id)a3
{
}

- (NSString)testData
{
  return self->_testData;
}

- (void)setTestData:(id)a3
{
}

- (NSNumber)pnrReason
{
  return self->_pnrReason;
}

- (void)setPnrReason:(id)a3
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

- (NSString)hostDeviceName
{
  return self->_hostDeviceName;
}

- (void)setHostDeviceName:(id)a3
{
}

- (NSNumber)responseStatus
{
  return self->_responseStatus;
}

- (void)setResponseStatus:(id)a3
{
}

- (NSArray)responseMechanisms
{
  return self->_responseMechanisms;
}

- (void)setResponseMechanisms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseMechanisms, 0);
  objc_storeStrong((id *)&self->_responseStatus, 0);
  objc_storeStrong((id *)&self->_hostDeviceName, 0);
  objc_storeStrong((id *)&self->_hostSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_hostOsVersion, 0);
  objc_storeStrong((id *)&self->_hostHardwareVersion, 0);
  objc_storeStrong((id *)&self->_pnrReason, 0);
  objc_storeStrong((id *)&self->_testData, 0);
  objc_storeStrong((id *)&self->_PLMN, 0);
  objc_storeStrong((id *)&self->_IMSI, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_phoneNumberValidationRetryCount, 0);

  objc_storeStrong((id *)&self->_protocolVersion, 0);
}

@end