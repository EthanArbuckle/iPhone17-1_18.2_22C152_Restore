@interface FTRejectMessage
- (NSData)peerPushToken;
- (NSData)selfPushToken;
- (NSNumber)reason;
- (NSString)peerID;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)dealloc;
- (void)setPeerID:(id)a3;
- (void)setPeerPushToken:(id)a3;
- (void)setReason:(id)a3;
- (void)setSelfPushToken:(id)a3;
@end

@implementation FTRejectMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FTRejectMessage;
  return [(FTFaceTimeMessage *)&v4 copyWithZone:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FTRejectMessage;
  [(FTFaceTimeMessage *)&v3 dealloc];
}

- (id)bagKey
{
  return @"gk-invitation-reject";
}

- (id)requiredKeys
{
  v4.receiver = self;
  v4.super_class = (Class)FTRejectMessage;
  v2 = objc_msgSend(-[FTFaceTimeMessage requiredKeys](&v4, sel_requiredKeys), "mutableCopy");
  [v2 addObject:@"peer-id"];
  [v2 addObject:@"self-push-token"];
  [v2 addObject:@"peer-push-token"];
  [v2 addObject:@"reason"];
  return v2;
}

- (id)messageBody
{
  v9.receiver = self;
  v9.super_class = (Class)FTRejectMessage;
  objc_super v3 = (__CFDictionary *)objc_msgSend(-[FTFaceTimeMessage messageBody](&v9, sel_messageBody), "mutableCopy");
  objc_super v4 = [(FTRejectMessage *)self peerID];
  if (v4)
  {
    CFDictionarySetValue(v3, @"peer-id", v4);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE138();
  }
  v5 = [(FTRejectMessage *)self selfPushToken];
  if (v5)
  {
    CFDictionarySetValue(v3, @"self-push-token", v5);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE358();
  }
  v6 = [(FTRejectMessage *)self peerPushToken];
  if (v6)
  {
    CFDictionarySetValue(v3, @"peer-push-token", v6);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE0B0();
  }
  v7 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](-[FTRejectMessage reason](self, "reason"), "intValue"));
  if (v7)
  {
    CFDictionarySetValue(v3, @"reason", v7);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE5A0();
  }
  return v3;
}

- (NSData)selfPushToken
{
  return (NSData *)objc_getProperty(self, a2, 432, 1);
}

- (void)setSelfPushToken:(id)a3
{
}

- (NSData)peerPushToken
{
  return (NSData *)objc_getProperty(self, a2, 440, 1);
}

- (void)setPeerPushToken:(id)a3
{
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 448, 1);
}

- (void)setPeerID:(id)a3
{
}

- (NSNumber)reason
{
  return (NSNumber *)objc_getProperty(self, a2, 456, 1);
}

- (void)setReason:(id)a3
{
}

@end