@interface IDSKTOptInStatusMessage
- (NSArray)services;
- (NSNumber)isOptIn;
- (NSNumber)responseStatus;
- (NSString)hardwareVersion;
- (NSString)osVersion;
- (NSString)responseMessage;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)setHardwareVersion:(id)a3;
- (void)setIsOptIn:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setResponseMessage:(id)a3;
- (void)setResponseStatus:(id)a3;
- (void)setServices:(id)a3;
@end

@implementation IDSKTOptInStatusMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)IDSKTOptInStatusMessage;
  id v4 = [(IDSKTOptInStatusMessage *)&v12 copyWithZone:a3];
  v5 = [(IDSKTOptInStatusMessage *)self hardwareVersion];
  [v4 setHardwareVersion:v5];

  v6 = [(IDSKTOptInStatusMessage *)self osVersion];
  [v4 setOsVersion:v6];

  v7 = [(IDSKTOptInStatusMessage *)self isOptIn];
  [v4 setIsOptIn:v7];

  v8 = [(IDSKTOptInStatusMessage *)self services];
  [v4 setServices:v8];

  v9 = [(IDSKTOptInStatusMessage *)self responseStatus];
  [v4 setResponseStatus:v9];

  v10 = [(IDSKTOptInStatusMessage *)self responseMessage];
  [v4 setResponseMessage:v10];

  return v4;
}

- (id)bagKey
{
  return @"id-kt-opt-in-out";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [v2 addObject:@"hardware-version"];
  [v2 addObject:@"os-version"];
  [v2 addObject:@"services"];

  return v2;
}

- (id)messageBody
{
  v9.receiver = self;
  v9.super_class = (Class)IDSKTOptInStatusMessage;
  v3 = [(IDSKTOptInStatusMessage *)&v9 messageBody];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSKTOptInStatusMessage *)self hardwareVersion];
  if (v5)
  {
    CFDictionarySetValue(Mutable, @"hardware-version", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007094E4();
  }

  v6 = [(IDSKTOptInStatusMessage *)self osVersion];
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"os-version", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070945C();
  }

  v7 = [(IDSKTOptInStatusMessage *)self services];
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"services", v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071AE54();
  }

  return Mutable;
}

- (id)additionalMessageHeaders
{
  v7.receiver = self;
  v7.super_class = (Class)IDSKTOptInStatusMessage;
  id v2 = [(IDSKTOptInStatusMessage *)&v7 additionalMessageHeaders];
  Mutable = (__CFDictionary *)[v2 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  id v4 = _IDSKeyTransparencyOptInOutVersionNumber();
  v5 = [v4 stringValue];

  if (v5) {
    CFDictionarySetValue(Mutable, @"x-kt-opt-version", v5);
  }

  return Mutable;
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

- (NSNumber)isOptIn
{
  return self->_isOptIn;
}

- (void)setIsOptIn:(id)a3
{
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (NSNumber)responseStatus
{
  return self->_responseStatus;
}

- (void)setResponseStatus:(id)a3
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
  objc_storeStrong((id *)&self->_responseStatus, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_isOptIn, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);

  objc_storeStrong((id *)&self->_hardwareVersion, 0);
}

@end