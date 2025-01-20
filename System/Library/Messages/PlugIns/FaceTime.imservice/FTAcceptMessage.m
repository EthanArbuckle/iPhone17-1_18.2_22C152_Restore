@interface FTAcceptMessage
- (FTAcceptMessage)init;
- (NSData)peerBlob;
- (NSData)peerNATIP;
- (NSData)peerPushToken;
- (NSData)peerRelayIP;
- (NSData)relayConnectionId;
- (NSData)relayTokenAllocReq;
- (NSData)relayTransactionIdAlloc;
- (NSData)selfBlob;
- (NSData)selfNATIP;
- (NSData)selfPushToken;
- (NSData)selfRelayIP;
- (NSNumber)peerNATType;
- (NSNumber)peerRelayPort;
- (NSNumber)relayType;
- (NSNumber)selfNATType;
- (NSNumber)selfRelayPort;
- (NSString)peerID;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)dealloc;
- (void)handleResponseDictionary:(id)a3;
- (void)setPeerBlob:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPeerNATIP:(id)a3;
- (void)setPeerNATType:(id)a3;
- (void)setPeerPushToken:(id)a3;
- (void)setPeerRelayIP:(id)a3;
- (void)setPeerRelayPort:(id)a3;
- (void)setRelayConnectionId:(id)a3;
- (void)setRelayTokenAllocReq:(id)a3;
- (void)setRelayTransactionIdAlloc:(id)a3;
- (void)setRelayType:(id)a3;
- (void)setSelfBlob:(id)a3;
- (void)setSelfNATIP:(id)a3;
- (void)setSelfNATType:(id)a3;
- (void)setSelfPushToken:(id)a3;
- (void)setSelfRelayIP:(id)a3;
- (void)setSelfRelayPort:(id)a3;
@end

@implementation FTAcceptMessage

- (FTAcceptMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)FTAcceptMessage;
  v2 = [(FTFaceTimeMessage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IDSBaseMessage *)v2 setTimeout:60.0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FTAcceptMessage;
  return [(FTFaceTimeMessage *)&v4 copyWithZone:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FTAcceptMessage;
  [(FTFaceTimeMessage *)&v3 dealloc];
}

- (id)bagKey
{
  return @"gk-invitation-accept";
}

- (id)requiredKeys
{
  v4.receiver = self;
  v4.super_class = (Class)FTAcceptMessage;
  id v2 = (id)objc_msgSend(-[FTFaceTimeMessage requiredKeys](&v4, sel_requiredKeys), "mutableCopy");
  if (!v2) {
    id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  [v2 addObject:@"self-push-token"];
  [v2 addObject:@"self-nat-type"];
  [v2 addObject:@"self-blob"];
  [v2 addObject:@"self-nat-ip"];
  [v2 addObject:@"peer-id"];
  [v2 addObject:@"peer-push-token"];
  [v2 addObject:@"peer-nat-type"];
  [v2 addObject:@"peer-blob"];
  [v2 addObject:@"peer-nat-ip"];
  return v2;
}

- (id)messageBody
{
  v14.receiver = self;
  v14.super_class = (Class)FTAcceptMessage;
  objc_super v3 = (__CFDictionary *)objc_msgSend(-[FTFaceTimeMessage messageBody](&v14, sel_messageBody), "mutableCopy");
  objc_super v4 = [(FTAcceptMessage *)self selfPushToken];
  if (v4)
  {
    CFDictionarySetValue(v3, @"self-push-token", v4);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE358();
  }
  objc_super v5 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](-[FTAcceptMessage selfNATType](self, "selfNATType"), "intValue"));
  if (v5)
  {
    CFDictionarySetValue(v3, @"self-nat-type", v5);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE2D0();
  }
  v6 = [(FTAcceptMessage *)self selfBlob];
  if (v6)
  {
    CFDictionarySetValue(v3, @"self-blob", v6);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE248();
  }
  v7 = [(FTAcceptMessage *)self selfNATIP];
  if (v7)
  {
    CFDictionarySetValue(v3, @"self-nat-ip", v7);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE1C0();
  }
  v8 = [(FTAcceptMessage *)self peerID];
  if (v8)
  {
    CFDictionarySetValue(v3, @"peer-id", v8);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE138();
  }
  v9 = [(FTAcceptMessage *)self peerPushToken];
  if (v9)
  {
    CFDictionarySetValue(v3, @"peer-push-token", v9);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE0B0();
  }
  v10 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](-[FTAcceptMessage peerNATType](self, "peerNATType"), "intValue"));
  if (v10)
  {
    CFDictionarySetValue(v3, @"peer-nat-type", v10);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE028();
  }
  v11 = [(FTAcceptMessage *)self peerBlob];
  if (v11)
  {
    CFDictionarySetValue(v3, @"peer-blob", v11);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FDFA0();
  }
  v12 = [(FTAcceptMessage *)self peerNATIP];
  if (v12)
  {
    CFDictionarySetValue(v3, @"peer-nat-ip", v12);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FDF18();
  }
  return v3;
}

- (void)handleResponseDictionary:(id)a3
{
  if ([a3 objectForKey:@"relay-type"])
  {
    -[FTAcceptMessage setRelayType:](self, "setRelayType:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"relay-type"), "intValue")));
    -[FTAcceptMessage setRelayConnectionId:](self, "setRelayConnectionId:", [a3 objectForKey:@"relay-connection-id"]);
    -[FTAcceptMessage setRelayTransactionIdAlloc:](self, "setRelayTransactionIdAlloc:", [a3 objectForKey:@"relay-transaction-id-alloc"]);
    -[FTAcceptMessage setRelayTokenAllocReq:](self, "setRelayTokenAllocReq:", [a3 objectForKey:@"relay-token-alloc-req"]);
    -[FTAcceptMessage setSelfRelayIP:](self, "setSelfRelayIP:", [a3 objectForKey:@"self-relay-ip"]);
    -[FTAcceptMessage setSelfRelayPort:](self, "setSelfRelayPort:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"self-relay-port"), "intValue")));
    -[FTAcceptMessage setPeerRelayIP:](self, "setPeerRelayIP:", [a3 objectForKey:@"peer-relay-ip"]);
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"peer-relay-port"), "intValue"));
    [(FTAcceptMessage *)self setPeerRelayPort:v5];
  }
}

- (NSData)selfPushToken
{
  return (NSData *)objc_getProperty(self, a2, 432, 1);
}

- (void)setSelfPushToken:(id)a3
{
}

- (NSNumber)selfNATType
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setSelfNATType:(id)a3
{
}

- (NSData)selfBlob
{
  return (NSData *)objc_getProperty(self, a2, 448, 1);
}

- (void)setSelfBlob:(id)a3
{
}

- (NSData)selfNATIP
{
  return (NSData *)objc_getProperty(self, a2, 456, 1);
}

- (void)setSelfNATIP:(id)a3
{
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 464, 1);
}

- (void)setPeerID:(id)a3
{
}

- (NSData)peerPushToken
{
  return (NSData *)objc_getProperty(self, a2, 472, 1);
}

- (void)setPeerPushToken:(id)a3
{
}

- (NSNumber)peerNATType
{
  return (NSNumber *)objc_getProperty(self, a2, 480, 1);
}

- (void)setPeerNATType:(id)a3
{
}

- (NSData)peerBlob
{
  return (NSData *)objc_getProperty(self, a2, 488, 1);
}

- (void)setPeerBlob:(id)a3
{
}

- (NSData)peerNATIP
{
  return (NSData *)objc_getProperty(self, a2, 496, 1);
}

- (void)setPeerNATIP:(id)a3
{
}

- (NSNumber)relayType
{
  return (NSNumber *)objc_getProperty(self, a2, 504, 1);
}

- (void)setRelayType:(id)a3
{
}

- (NSData)relayConnectionId
{
  return (NSData *)objc_getProperty(self, a2, 512, 1);
}

- (void)setRelayConnectionId:(id)a3
{
}

- (NSData)relayTransactionIdAlloc
{
  return (NSData *)objc_getProperty(self, a2, 520, 1);
}

- (void)setRelayTransactionIdAlloc:(id)a3
{
}

- (NSData)relayTokenAllocReq
{
  return (NSData *)objc_getProperty(self, a2, 528, 1);
}

- (void)setRelayTokenAllocReq:(id)a3
{
}

- (NSData)selfRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 536, 1);
}

- (void)setSelfRelayIP:(id)a3
{
}

- (NSNumber)selfRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 544, 1);
}

- (void)setSelfRelayPort:(id)a3
{
}

- (NSData)peerRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 552, 1);
}

- (void)setPeerRelayIP:(id)a3
{
}

- (NSNumber)peerRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 560, 1);
}

- (void)setPeerRelayPort:(id)a3
{
}

@end