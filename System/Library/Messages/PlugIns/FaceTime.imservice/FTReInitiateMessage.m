@interface FTReInitiateMessage
- (FTReInitiateMessage)init;
- (NSArray)canonicalizedPeers;
- (NSArray)peers;
- (NSData)selfBlob;
- (NSData)selfNatIP;
- (NSData)selfPushToken;
- (NSDictionary)regionInformation;
- (NSNumber)selfNATType;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)dealloc;
- (void)handleResponseDictionary:(id)a3;
- (void)setCanonicalizedPeers:(id)a3;
- (void)setPeers:(id)a3;
- (void)setRegionInformation:(id)a3;
- (void)setSelfBlob:(id)a3;
- (void)setSelfNATType:(id)a3;
- (void)setSelfNatIP:(id)a3;
- (void)setSelfPushToken:(id)a3;
@end

@implementation FTReInitiateMessage

- (FTReInitiateMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)FTReInitiateMessage;
  v2 = [(FTFaceTimeMessage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IDSBaseMessage *)v2 setTimeout:35.0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FTReInitiateMessage;
  return [(FTFaceTimeMessage *)&v4 copyWithZone:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FTReInitiateMessage;
  [(FTFaceTimeMessage *)&v3 dealloc];
}

- (id)bagKey
{
  return @"gk-invitation-reinitiate";
}

- (id)requiredKeys
{
  v4.receiver = self;
  v4.super_class = (Class)FTReInitiateMessage;
  v2 = objc_msgSend(-[FTFaceTimeMessage requiredKeys](&v4, sel_requiredKeys), "mutableCopy");
  [v2 addObject:@"self-push-token"];
  [v2 addObject:@"self-blob"];
  [v2 addObject:@"self-nat-ip"];
  [v2 addObject:@"self-nat-type"];
  [v2 addObject:@"peers"];
  return v2;
}

- (id)messageBody
{
  v12.receiver = self;
  v12.super_class = (Class)FTReInitiateMessage;
  objc_super v3 = (__CFDictionary *)objc_msgSend(-[FTFaceTimeMessage messageBody](&v12, sel_messageBody), "mutableCopy");
  objc_super v4 = [(FTReInitiateMessage *)self regionInformation];
  if (v4) {
    CFDictionarySetValue(v3, @"service-data", v4);
  }
  objc_super v5 = [(IDSBaseMessage *)self clientInfo];
  if (v5) {
    CFDictionarySetValue(v3, @"client-data", v5);
  }
  v6 = [(FTReInitiateMessage *)self selfPushToken];
  if (v6)
  {
    CFDictionarySetValue(v3, @"self-push-token", v6);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE358();
  }
  v7 = [(FTReInitiateMessage *)self selfBlob];
  if (v7)
  {
    CFDictionarySetValue(v3, @"self-blob", v7);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE248();
  }
  v8 = [(FTReInitiateMessage *)self selfNatIP];
  if (v8)
  {
    CFDictionarySetValue(v3, @"self-nat-ip", v8);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE1C0();
  }
  v9 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](-[FTReInitiateMessage selfNATType](self, "selfNATType"), "intValue"));
  if (v9)
  {
    CFDictionarySetValue(v3, @"self-nat-type", v9);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE2D0();
  }
  v10 = [(FTReInitiateMessage *)self peers];
  if (v10)
  {
    CFDictionarySetValue(v3, @"peers", v10);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE518();
  }
  return v3;
}

- (void)handleResponseDictionary:(id)a3
{
  uint64_t v5 = [a3 objectForKey:@"session-token"];
  if (v5) {
    [(FTFaceTimeMessage *)self setSessionToken:v5];
  }
  uint64_t v6 = [a3 objectForKey:@"peers"];
  if (v6) {
    [(FTReInitiateMessage *)self setCanonicalizedPeers:v6];
  }
  [a3 objectForKey:@"alert"];

  MEMORY[0x270F9A6D0](self, sel_setResponseAlertInfo_);
}

- (NSData)selfBlob
{
  return (NSData *)objc_getProperty(self, a2, 432, 1);
}

- (void)setSelfBlob:(id)a3
{
}

- (NSData)selfPushToken
{
  return (NSData *)objc_getProperty(self, a2, 440, 1);
}

- (void)setSelfPushToken:(id)a3
{
}

- (NSNumber)selfNATType
{
  return (NSNumber *)objc_getProperty(self, a2, 448, 1);
}

- (void)setSelfNATType:(id)a3
{
}

- (NSData)selfNatIP
{
  return (NSData *)objc_getProperty(self, a2, 456, 1);
}

- (void)setSelfNatIP:(id)a3
{
}

- (NSArray)peers
{
  return (NSArray *)objc_getProperty(self, a2, 464, 1);
}

- (void)setPeers:(id)a3
{
}

- (NSArray)canonicalizedPeers
{
  return (NSArray *)objc_getProperty(self, a2, 472, 1);
}

- (void)setCanonicalizedPeers:(id)a3
{
}

- (NSDictionary)regionInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 480, 1);
}

- (void)setRegionInformation:(id)a3
{
}

@end