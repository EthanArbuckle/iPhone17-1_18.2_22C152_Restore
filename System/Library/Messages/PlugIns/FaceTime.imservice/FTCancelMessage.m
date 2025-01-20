@interface FTCancelMessage
- (NSArray)peers;
- (NSNumber)reason;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)dealloc;
- (void)setPeers:(id)a3;
- (void)setReason:(id)a3;
@end

@implementation FTCancelMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FTCancelMessage;
  id v4 = [(FTFaceTimeMessage *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setPeers:", -[FTCancelMessage peers](self, "peers"));
  objc_msgSend(v4, "setReason:", -[FTCancelMessage reason](self, "reason"));
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FTCancelMessage;
  [(FTFaceTimeMessage *)&v3 dealloc];
}

- (id)bagKey
{
  return @"gk-invitation-cancel";
}

- (id)requiredKeys
{
  v4.receiver = self;
  v4.super_class = (Class)FTCancelMessage;
  id v2 = (id)objc_msgSend(-[FTFaceTimeMessage requiredKeys](&v4, sel_requiredKeys), "mutableCopy");
  if (!v2) {
    id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  [v2 addObject:@"reason"];
  [v2 addObject:@"peers"];
  return v2;
}

- (id)messageBody
{
  v7.receiver = self;
  v7.super_class = (Class)FTCancelMessage;
  objc_super v3 = (__CFDictionary *)objc_msgSend(-[FTFaceTimeMessage messageBody](&v7, sel_messageBody), "mutableCopy");
  objc_super v4 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](-[FTCancelMessage reason](self, "reason"), "intValue"));
  if (v4)
  {
    CFDictionarySetValue(v3, @"reason", v4);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE47C();
  }
  v5 = [(FTCancelMessage *)self peers];
  if (v5)
  {
    CFDictionarySetValue(v3, @"peers", v5);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE3E0();
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

@end