@interface FTSendMessage
- (NSArray)peers;
- (NSData)selfPushToken;
- (NSNumber)reason;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)dealloc;
- (void)setPeers:(id)a3;
- (void)setReason:(id)a3;
- (void)setSelfPushToken:(id)a3;
@end

@implementation FTSendMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FTSendMessage;
  id v4 = [(FTFaceTimeMessage *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setPeers:", -[FTSendMessage peers](self, "peers"));
  objc_msgSend(v4, "setReason:", -[FTSendMessage reason](self, "reason"));
  objc_msgSend(v4, "setSelfPushToken:", -[FTSendMessage selfPushToken](self, "selfPushToken"));
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FTSendMessage;
  [(FTFaceTimeMessage *)&v3 dealloc];
}

- (id)bagKey
{
  return @"gk-invitation-send";
}

- (id)requiredKeys
{
  v4.receiver = self;
  v4.super_class = (Class)FTSendMessage;
  id v2 = (id)objc_msgSend(-[FTFaceTimeMessage requiredKeys](&v4, sel_requiredKeys), "mutableCopy");
  if (!v2) {
    id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  [v2 addObject:@"reason"];
  [v2 addObject:@"peers"];
  [v2 addObject:@"self-push-token"];
  return v2;
}

- (id)messageBody
{
  v8.receiver = self;
  v8.super_class = (Class)FTSendMessage;
  objc_super v3 = (__CFDictionary *)objc_msgSend(-[FTFaceTimeMessage messageBody](&v8, sel_messageBody), "mutableCopy");
  objc_super v4 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](-[FTSendMessage reason](self, "reason"), "intValue"));
  if (v4)
  {
    CFDictionarySetValue(v3, @"reason", v4);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE5A0();
  }
  v5 = [(FTSendMessage *)self peers];
  if (v5)
  {
    CFDictionarySetValue(v3, @"peers", v5);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE518();
  }
  objc_super v6 = [(FTSendMessage *)self selfPushToken];
  if (v6)
  {
    CFDictionarySetValue(v3, @"self-push-token", v6);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE358();
  }
  return v3;
}

- (NSArray)peers
{
  return (NSArray *)objc_getProperty(self, a2, 432, 1);
}

- (void)setPeers:(id)a3
{
}

- (NSNumber)reason
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setReason:(id)a3
{
}

- (NSData)selfPushToken
{
  return (NSData *)objc_getProperty(self, a2, 448, 1);
}

- (void)setSelfPushToken:(id)a3
{
}

@end