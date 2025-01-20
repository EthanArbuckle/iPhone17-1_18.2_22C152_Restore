@interface FTInitiateMessage
- (FTInitiateMessage)init;
- (NSArray)canonicalizedPeers;
- (NSArray)peers;
- (NSArray)pushTokensToExclude;
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
- (void)setPushTokensToExclude:(id)a3;
- (void)setRegionInformation:(id)a3;
- (void)setSelfBlob:(id)a3;
- (void)setSelfNATType:(id)a3;
- (void)setSelfNatIP:(id)a3;
- (void)setSelfPushToken:(id)a3;
@end

@implementation FTInitiateMessage

- (FTInitiateMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)FTInitiateMessage;
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
  v4.super_class = (Class)FTInitiateMessage;
  return [(FTFaceTimeMessage *)&v4 copyWithZone:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FTInitiateMessage;
  [(FTFaceTimeMessage *)&v3 dealloc];
}

- (id)bagKey
{
  return @"gk-invitation-initiate";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v2 addObject:@"self-push-token"];
  [v2 addObject:@"self-blob"];
  [v2 addObject:@"self-nat-ip"];
  [v2 addObject:@"self-nat-type"];
  [v2 addObject:@"peers"];

  return v2;
}

- (id)messageBody
{
  objc_super v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_super v4 = [(FTFaceTimeMessage *)self sessionToken];
  if (v4) {
    CFDictionarySetValue(v3, @"session-token", v4);
  }
  objc_super v5 = [(FTInitiateMessage *)self regionInformation];
  if (v5) {
    CFDictionarySetValue(v3, @"service-data", v5);
  }
  v6 = [(IDSBaseMessage *)self clientInfo];
  if (v6) {
    CFDictionarySetValue(v3, @"client-data", v6);
  }
  v7 = [(FTInitiateMessage *)self selfPushToken];
  if (v7)
  {
    CFDictionarySetValue(v3, @"self-push-token", v7);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE358();
  }
  v8 = [(FTInitiateMessage *)self selfBlob];
  if (v8)
  {
    CFDictionarySetValue(v3, @"self-blob", v8);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE248();
  }
  v9 = [(FTInitiateMessage *)self selfNatIP];
  if (v9)
  {
    CFDictionarySetValue(v3, @"self-nat-ip", v9);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE1C0();
  }
  v10 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](-[FTInitiateMessage selfNATType](self, "selfNATType"), "intValue"));
  if (v10)
  {
    CFDictionarySetValue(v3, @"self-nat-type", v10);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE2D0();
  }
  v11 = [(FTInitiateMessage *)self peers];
  if (v11)
  {
    CFDictionarySetValue(v3, @"peers", v11);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE518();
  }
  v12 = [(FTInitiateMessage *)self pushTokensToExclude];
  if (v12) {
    CFDictionarySetValue(v3, @"exclude-peers", v12);
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
    [(FTInitiateMessage *)self setCanonicalizedPeers:v6];
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

- (NSArray)pushTokensToExclude
{
  return (NSArray *)objc_getProperty(self, a2, 472, 1);
}

- (void)setPushTokensToExclude:(id)a3
{
}

- (NSArray)canonicalizedPeers
{
  return (NSArray *)objc_getProperty(self, a2, 480, 1);
}

- (void)setCanonicalizedPeers:(id)a3
{
}

- (NSDictionary)regionInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 488, 1);
}

- (void)setRegionInformation:(id)a3
{
}

@end