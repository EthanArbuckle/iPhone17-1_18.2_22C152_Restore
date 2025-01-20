@interface IDSCheckUnknownSenderMessage
- (BOOL)abusive;
- (BOOL)wantsHTTPGet;
- (NSNumber)attemptCount;
- (NSString)OSVersion;
- (NSString)geo;
- (NSString)hardwareVersion;
- (NSString)sender;
- (NSString)softwareVersion;
- (double)delay;
- (id)additionalMessageHeaders;
- (id)additionalQueryStringParameters;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)status;
- (void)handleResponseDictionary:(id)a3;
- (void)setAbusive:(BOOL)a3;
- (void)setAttemptCount:(id)a3;
- (void)setDelay:(double)a3;
- (void)setGeo:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setOSVersion:(id)a3;
- (void)setSender:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation IDSCheckUnknownSenderMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)IDSCheckUnknownSenderMessage;
  id v4 = [(IDSCheckUnknownSenderMessage *)&v12 copyWithZone:a3];
  v5 = [(IDSCheckUnknownSenderMessage *)self hardwareVersion];
  [v4 setHardwareVersion:v5];

  v6 = [(IDSCheckUnknownSenderMessage *)self OSVersion];
  [v4 setOSVersion:v6];

  v7 = [(IDSCheckUnknownSenderMessage *)self softwareVersion];
  [v4 setSoftwareVersion:v7];

  v8 = [(IDSCheckUnknownSenderMessage *)self sender];
  [v4 setSender:v8];

  v9 = [(IDSCheckUnknownSenderMessage *)self attemptCount];
  [v4 setAttemptCount:v9];

  v10 = [(IDSCheckUnknownSenderMessage *)self geo];
  [v4 setGeo:v10];

  objc_msgSend(v4, "setStatus:", -[IDSCheckUnknownSenderMessage status](self, "status"));
  objc_msgSend(v4, "setAbusive:", -[IDSCheckUnknownSenderMessage abusive](self, "abusive"));
  [(IDSCheckUnknownSenderMessage *)self delay];
  objc_msgSend(v4, "setDelay:");
  return v4;
}

- (id)bagKey
{
  return @"id-check-unknown";
}

- (id)additionalMessageHeaders
{
  v11.receiver = self;
  v11.super_class = (Class)IDSCheckUnknownSenderMessage;
  v3 = [(IDSCheckUnknownSenderMessage *)&v11 additionalMessageHeaders];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSCheckUnknownSenderMessage *)self pushToken];
  v6 = [v5 _FTStringFromBaseData];

  if (v6) {
    CFDictionarySetValue(Mutable, @"x-push-token", v6);
  }

  v7 = [(IDSCheckUnknownSenderMessage *)self hardwareVersion];
  if (v7) {
    CFDictionarySetValue(Mutable, @"x-hardware-version", v7);
  }

  v8 = [(IDSCheckUnknownSenderMessage *)self OSVersion];
  if (v8) {
    CFDictionarySetValue(Mutable, @"x-os-version", v8);
  }

  v9 = [(IDSCheckUnknownSenderMessage *)self softwareVersion];
  if (v9) {
    CFDictionarySetValue(Mutable, @"x-software-version", v9);
  }

  return Mutable;
}

- (id)additionalQueryStringParameters
{
  v10.receiver = self;
  v10.super_class = (Class)IDSCheckUnknownSenderMessage;
  v3 = [(IDSCheckUnknownSenderMessage *)&v10 additionalQueryStringParameters];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSCheckUnknownSenderMessage *)self sender];
  if (v5) {
    CFDictionarySetValue(Mutable, @"sender", v5);
  }

  v6 = [(IDSCheckUnknownSenderMessage *)self attemptCount];
  v7 = [v6 stringValue];

  if (v7) {
    CFDictionarySetValue(Mutable, @"count", v7);
  }

  v8 = [(IDSCheckUnknownSenderMessage *)self geo];
  if (v8) {
    CFDictionarySetValue(Mutable, @"geo", v8);
  }

  return Mutable;
}

- (BOOL)wantsHTTPGet
{
  return 1;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 _numberForKey:@"status"];
  -[IDSCheckUnknownSenderMessage setStatus:](self, "setStatus:", [v5 integerValue]);

  v6 = [v4 _numberForKey:@"abusive"];
  -[IDSCheckUnknownSenderMessage setAbusive:](self, "setAbusive:", [v6 BOOLValue]);

  id v7 = [v4 _numberForKey:@"delay"];

  [v7 doubleValue];
  -[IDSCheckUnknownSenderMessage setDelay:](self, "setDelay:");
}

- (NSString)hardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setHardwareVersion:(id)a3
{
}

- (NSString)OSVersion
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setOSVersion:(id)a3
{
}

- (NSString)softwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSoftwareVersion:(id)a3
{
}

- (NSString)sender
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setSender:(id)a3
{
}

- (NSNumber)attemptCount
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setAttemptCount:(id)a3
{
}

- (NSString)geo
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setGeo:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BOOL)abusive
{
  return self->_abusive;
}

- (void)setAbusive:(BOOL)a3
{
  self->_abusive = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geo, 0);
  objc_storeStrong((id *)&self->_attemptCount, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_OSVersion, 0);

  objc_storeStrong((id *)&self->_hardwareVersion, 0);
}

@end