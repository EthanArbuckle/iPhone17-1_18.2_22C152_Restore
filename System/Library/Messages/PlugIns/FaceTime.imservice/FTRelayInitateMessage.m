@interface FTRelayInitateMessage
- (NSData)peerPushToken;
- (NSData)peerRelayIP;
- (NSData)relayCandidateID;
- (NSData)relayConnectionId;
- (NSData)relayTokenAllocReq;
- (NSData)relayTransactionIdAlloc;
- (NSData)selfPushToken;
- (NSData)selfRelayIP;
- (NSNumber)peerNATIP;
- (NSNumber)peerNatType;
- (NSNumber)peerRelayPort;
- (NSNumber)relayType;
- (NSNumber)selfNATIP;
- (NSNumber)selfNatType;
- (NSNumber)selfRelayPort;
- (NSString)peerID;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)dealloc;
- (void)handleResponseDictionary:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPeerNATIP:(id)a3;
- (void)setPeerNatType:(id)a3;
- (void)setPeerPushToken:(id)a3;
- (void)setPeerRelayIP:(id)a3;
- (void)setPeerRelayPort:(id)a3;
- (void)setRelayCandidateID:(id)a3;
- (void)setRelayConnectionId:(id)a3;
- (void)setRelayTokenAllocReq:(id)a3;
- (void)setRelayTransactionIdAlloc:(id)a3;
- (void)setRelayType:(id)a3;
- (void)setSelfNATIP:(id)a3;
- (void)setSelfNatType:(id)a3;
- (void)setSelfPushToken:(id)a3;
- (void)setSelfRelayIP:(id)a3;
- (void)setSelfRelayPort:(id)a3;
@end

@implementation FTRelayInitateMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FTRelayInitateMessage;
  return [(FTFaceTimeMessage *)&v4 copyWithZone:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FTRelayInitateMessage;
  [(FTFaceTimeMessage *)&v3 dealloc];
}

- (id)bagKey
{
  return @"gk-invitation-relay-initiate";
}

- (id)requiredKeys
{
  v4.receiver = self;
  v4.super_class = (Class)FTRelayInitateMessage;
  v2 = objc_msgSend(-[FTFaceTimeMessage requiredKeys](&v4, sel_requiredKeys), "mutableCopy");
  [v2 addObject:@"self-push-token"];
  [v2 addObject:@"self-nat-type"];
  [v2 addObject:@"self-nat-ip"];
  [v2 addObject:@"peer-id"];
  [v2 addObject:@"peer-push-token"];
  [v2 addObject:@"peer-nat-type"];
  [v2 addObject:@"peer-nat-ip"];
  return v2;
}

- (id)messageBody
{
  v13.receiver = self;
  v13.super_class = (Class)FTRelayInitateMessage;
  objc_super v3 = (__CFDictionary *)objc_msgSend(-[FTFaceTimeMessage messageBody](&v13, sel_messageBody), "mutableCopy");
  objc_super v4 = [(FTRelayInitateMessage *)self selfPushToken];
  if (v4)
  {
    CFDictionarySetValue(v3, @"self-push-token", v4);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE358();
  }
  v5 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](-[FTRelayInitateMessage selfNatType](self, "selfNatType"), "intValue"));
  if (v5)
  {
    CFDictionarySetValue(v3, @"self-nat-type", v5);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE2D0();
  }
  v6 = [(FTRelayInitateMessage *)self selfNATIP];
  if (v6)
  {
    CFDictionarySetValue(v3, @"self-nat-ip", v6);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE1C0();
  }
  v7 = [(FTRelayInitateMessage *)self peerID];
  if (v7)
  {
    CFDictionarySetValue(v3, @"peer-id", v7);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE138();
  }
  v8 = [(FTRelayInitateMessage *)self peerPushToken];
  if (v8)
  {
    CFDictionarySetValue(v3, @"peer-push-token", v8);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE0B0();
  }
  v9 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](-[FTRelayInitateMessage peerNatType](self, "peerNatType"), "intValue"));
  if (v9)
  {
    CFDictionarySetValue(v3, @"peer-nat-type", v9);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE028();
  }
  v10 = [(FTRelayInitateMessage *)self peerNATIP];
  if (v10)
  {
    CFDictionarySetValue(v3, @"peer-nat-ip", v10);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FDF18();
  }
  v11 = [(FTRelayInitateMessage *)self relayCandidateID];
  if (v11) {
    CFDictionarySetValue(v3, @"relay-candidate-id", v11);
  }
  return v3;
}

- (void)handleResponseDictionary:(id)a3
{
  -[FTRelayInitateMessage setRelayType:](self, "setRelayType:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"relay-type"), "intValue")));
  -[FTRelayInitateMessage setRelayConnectionId:](self, "setRelayConnectionId:", [a3 objectForKey:@"relay-connection-id"]);
  -[FTRelayInitateMessage setRelayTransactionIdAlloc:](self, "setRelayTransactionIdAlloc:", [a3 objectForKey:@"relay-transaction-id-alloc"]);
  -[FTRelayInitateMessage setRelayTokenAllocReq:](self, "setRelayTokenAllocReq:", [a3 objectForKey:@"relay-token-alloc-req"]);
  -[FTRelayInitateMessage setSelfRelayIP:](self, "setSelfRelayIP:", [a3 objectForKey:@"self-relay-ip"]);
  -[FTRelayInitateMessage setSelfRelayPort:](self, "setSelfRelayPort:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"self-relay-port"), "intValue")));
  -[FTRelayInitateMessage setPeerRelayIP:](self, "setPeerRelayIP:", [a3 objectForKey:@"peer-relay-ip"]);
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"peer-relay-port"), "intValue"));

  [(FTRelayInitateMessage *)self setPeerRelayPort:v5];
}

- (NSData)selfPushToken
{
  return (NSData *)objc_getProperty(self, a2, 432, 1);
}

- (void)setSelfPushToken:(id)a3
{
}

- (NSNumber)selfNatType
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setSelfNatType:(id)a3
{
}

- (NSNumber)selfNATIP
{
  return (NSNumber *)objc_getProperty(self, a2, 448, 1);
}

- (void)setSelfNATIP:(id)a3
{
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 456, 1);
}

- (void)setPeerID:(id)a3
{
}

- (NSData)peerPushToken
{
  return (NSData *)objc_getProperty(self, a2, 464, 1);
}

- (void)setPeerPushToken:(id)a3
{
}

- (NSNumber)peerNatType
{
  return (NSNumber *)objc_getProperty(self, a2, 472, 1);
}

- (void)setPeerNatType:(id)a3
{
}

- (NSNumber)peerNATIP
{
  return (NSNumber *)objc_getProperty(self, a2, 480, 1);
}

- (void)setPeerNATIP:(id)a3
{
}

- (NSNumber)relayType
{
  return (NSNumber *)objc_getProperty(self, a2, 488, 1);
}

- (void)setRelayType:(id)a3
{
}

- (NSData)relayConnectionId
{
  return (NSData *)objc_getProperty(self, a2, 496, 1);
}

- (void)setRelayConnectionId:(id)a3
{
}

- (NSData)relayTransactionIdAlloc
{
  return (NSData *)objc_getProperty(self, a2, 504, 1);
}

- (void)setRelayTransactionIdAlloc:(id)a3
{
}

- (NSData)relayTokenAllocReq
{
  return (NSData *)objc_getProperty(self, a2, 512, 1);
}

- (void)setRelayTokenAllocReq:(id)a3
{
}

- (NSData)relayCandidateID
{
  return (NSData *)objc_getProperty(self, a2, 520, 1);
}

- (void)setRelayCandidateID:(id)a3
{
}

- (NSData)selfRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 528, 1);
}

- (void)setSelfRelayIP:(id)a3
{
}

- (NSNumber)selfRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 536, 1);
}

- (void)setSelfRelayPort:(id)a3
{
}

- (NSData)peerRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 544, 1);
}

- (void)setPeerRelayIP:(id)a3
{
}

- (NSNumber)peerRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 552, 1);
}

- (void)setPeerRelayPort:(id)a3
{
}

@end