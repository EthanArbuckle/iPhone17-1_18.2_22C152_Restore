@interface FTRelayCancelMessage
- (NSData)peerPushToken;
- (NSData)peerRelayIP;
- (NSData)relayCandidateID;
- (NSData)relayConnectionID;
- (NSData)selfRelayIP;
- (NSNumber)peerRelayPort;
- (NSNumber)reason;
- (NSNumber)relayType;
- (NSNumber)selfRelayPort;
- (NSString)peerID;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)dealloc;
- (void)setPeerID:(id)a3;
- (void)setPeerPushToken:(id)a3;
- (void)setPeerRelayIP:(id)a3;
- (void)setPeerRelayPort:(id)a3;
- (void)setReason:(id)a3;
- (void)setRelayCandidateID:(id)a3;
- (void)setRelayConnectionID:(id)a3;
- (void)setRelayType:(id)a3;
- (void)setSelfRelayIP:(id)a3;
- (void)setSelfRelayPort:(id)a3;
@end

@implementation FTRelayCancelMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FTRelayCancelMessage;
  return [(FTFaceTimeMessage *)&v4 copyWithZone:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FTRelayCancelMessage;
  [(FTFaceTimeMessage *)&v3 dealloc];
}

- (id)bagKey
{
  return @"gk-invitation-relay-cancel";
}

- (id)requiredKeys
{
  v4.receiver = self;
  v4.super_class = (Class)FTRelayCancelMessage;
  v2 = objc_msgSend(-[FTFaceTimeMessage requiredKeys](&v4, sel_requiredKeys), "mutableCopy");
  [v2 addObject:@"peer-id"];
  [v2 addObject:@"peer-push-token"];
  [v2 addObject:@"reason"];
  [v2 addObject:@"relay-type"];
  [v2 addObject:@"relay-connection-id"];
  [v2 addObject:@"self-relay-ip"];
  [v2 addObject:@"self-relay-port"];
  [v2 addObject:@"peer-relay-ip"];
  [v2 addObject:@"peer-relay-port"];
  return v2;
}

- (id)messageBody
{
  v15.receiver = self;
  v15.super_class = (Class)FTRelayCancelMessage;
  objc_super v3 = (__CFDictionary *)objc_msgSend(-[FTFaceTimeMessage messageBody](&v15, sel_messageBody), "mutableCopy");
  objc_super v4 = [(FTRelayCancelMessage *)self peerID];
  if (v4)
  {
    CFDictionarySetValue(v3, @"peer-id", v4);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE138();
  }
  v5 = [(FTRelayCancelMessage *)self peerPushToken];
  if (v5)
  {
    CFDictionarySetValue(v3, @"peer-push-token", v5);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE0B0();
  }
  v6 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](-[FTRelayCancelMessage reason](self, "reason"), "intValue"));
  if (v6)
  {
    CFDictionarySetValue(v3, @"reason", v6);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE5A0();
  }
  v7 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](-[FTRelayCancelMessage relayType](self, "relayType"), "intValue"));
  if (v7)
  {
    CFDictionarySetValue(v3, @"relay-type", v7);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE8D0();
  }
  v8 = [(FTRelayCancelMessage *)self relayConnectionID];
  if (v8)
  {
    CFDictionarySetValue(v3, @"relay-connection-id", v8);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE848();
  }
  v9 = [(FTRelayCancelMessage *)self selfRelayIP];
  if (v9)
  {
    CFDictionarySetValue(v3, @"self-relay-ip", v9);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE7C0();
  }
  v10 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](-[FTRelayCancelMessage selfRelayPort](self, "selfRelayPort"), "intValue"));
  if (v10)
  {
    CFDictionarySetValue(v3, @"self-relay-port", v10);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE738();
  }
  v11 = [(FTRelayCancelMessage *)self peerRelayIP];
  if (v11)
  {
    CFDictionarySetValue(v3, @"peer-relay-ip", v11);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE6B0();
  }
  v12 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](-[FTRelayCancelMessage peerRelayPort](self, "peerRelayPort"), "intValue"));
  if (v12)
  {
    CFDictionarySetValue(v3, @"peer-relay-port", v12);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE628();
  }
  v13 = [(FTRelayCancelMessage *)self relayCandidateID];
  if (v13) {
    CFDictionarySetValue(v3, @"relay-candidate-id", v13);
  }
  return v3;
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 432, 1);
}

- (void)setPeerID:(id)a3
{
}

- (NSData)peerPushToken
{
  return (NSData *)objc_getProperty(self, a2, 440, 1);
}

- (void)setPeerPushToken:(id)a3
{
}

- (NSNumber)relayType
{
  return (NSNumber *)objc_getProperty(self, a2, 448, 1);
}

- (void)setRelayType:(id)a3
{
}

- (NSNumber)reason
{
  return (NSNumber *)objc_getProperty(self, a2, 456, 1);
}

- (void)setReason:(id)a3
{
}

- (NSData)relayConnectionID
{
  return (NSData *)objc_getProperty(self, a2, 464, 1);
}

- (void)setRelayConnectionID:(id)a3
{
}

- (NSData)relayCandidateID
{
  return (NSData *)objc_getProperty(self, a2, 472, 1);
}

- (void)setRelayCandidateID:(id)a3
{
}

- (NSData)selfRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 480, 1);
}

- (void)setSelfRelayIP:(id)a3
{
}

- (NSNumber)selfRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 488, 1);
}

- (void)setSelfRelayPort:(id)a3
{
}

- (NSData)peerRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 496, 1);
}

- (void)setPeerRelayIP:(id)a3
{
}

- (NSNumber)peerRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 504, 1);
}

- (void)setPeerRelayPort:(id)a3
{
}

@end