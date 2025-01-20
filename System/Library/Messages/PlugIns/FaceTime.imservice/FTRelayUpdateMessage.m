@interface FTRelayUpdateMessage
- (NSData)peerPushToken;
- (NSData)peerRelayIP;
- (NSData)relayCandidateID;
- (NSData)relayConnectionID;
- (NSData)relayTokenAllocRes;
- (NSData)relayTransactionIDAlloc;
- (NSData)selfPushToken;
- (NSData)selfRelayBlob;
- (NSData)selfRelayIP;
- (NSData)selfRelayNATIP;
- (NSNumber)peerRelayPort;
- (NSNumber)relayType;
- (NSNumber)selfRelayNATPort;
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
- (void)setRelayCandidateID:(id)a3;
- (void)setRelayConnectionID:(id)a3;
- (void)setRelayTokenAllocRes:(id)a3;
- (void)setRelayTransactionIDAlloc:(id)a3;
- (void)setRelayType:(id)a3;
- (void)setSelfPushToken:(id)a3;
- (void)setSelfRelayBlob:(id)a3;
- (void)setSelfRelayIP:(id)a3;
- (void)setSelfRelayNATIP:(id)a3;
- (void)setSelfRelayNATPort:(id)a3;
- (void)setSelfRelayPort:(id)a3;
@end

@implementation FTRelayUpdateMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FTRelayUpdateMessage;
  return [(FTFaceTimeMessage *)&v4 copyWithZone:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FTRelayUpdateMessage;
  [(FTFaceTimeMessage *)&v3 dealloc];
}

- (id)bagKey
{
  return @"gk-invitation-relay-update";
}

- (id)requiredKeys
{
  v4.receiver = self;
  v4.super_class = (Class)FTRelayUpdateMessage;
  v2 = objc_msgSend(-[FTFaceTimeMessage requiredKeys](&v4, sel_requiredKeys), "mutableCopy");
  [v2 addObject:@"self-push-token"];
  [v2 addObject:@"peer-id"];
  [v2 addObject:@"peer-push-token"];
  [v2 addObject:@"relay-type"];
  [v2 addObject:@"relay-connection-id"];
  [v2 addObject:@"relay-transaction-id-alloc"];
  [v2 addObject:@"relay-token-alloc-res"];
  [v2 addObject:@"self-relay-ip"];
  [v2 addObject:@"self-relay-port"];
  [v2 addObject:@"self-relay-nat-ip"];
  [v2 addObject:@"self-relay-nat-port"];
  [v2 addObject:@"peer-relay-ip"];
  [v2 addObject:@"peer-relay-port"];
  return v2;
}

- (id)messageBody
{
  v20.receiver = self;
  v20.super_class = (Class)FTRelayUpdateMessage;
  objc_super v3 = (__CFDictionary *)objc_msgSend(-[FTFaceTimeMessage messageBody](&v20, sel_messageBody), "mutableCopy");
  objc_super v4 = [(FTRelayUpdateMessage *)self selfPushToken];
  if (v4)
  {
    CFDictionarySetValue(v3, @"self-push-token", v4);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE358();
  }
  v5 = [(FTRelayUpdateMessage *)self peerID];
  if (v5)
  {
    CFDictionarySetValue(v3, @"peer-id", v5);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE138();
  }
  v6 = [(FTRelayUpdateMessage *)self peerPushToken];
  if (v6)
  {
    CFDictionarySetValue(v3, @"peer-push-token", v6);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE0B0();
  }
  v7 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](-[FTRelayUpdateMessage relayType](self, "relayType"), "intValue"));
  if (v7)
  {
    CFDictionarySetValue(v3, @"relay-type", v7);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE8D0();
  }
  v8 = [(FTRelayUpdateMessage *)self relayConnectionID];
  if (v8)
  {
    CFDictionarySetValue(v3, @"relay-connection-id", v8);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE848();
  }
  v9 = [(FTRelayUpdateMessage *)self relayTransactionIDAlloc];
  if (v9)
  {
    CFDictionarySetValue(v3, @"relay-transaction-id-alloc", v9);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FEAF0();
  }
  v10 = [(FTRelayUpdateMessage *)self relayTokenAllocRes];
  if (v10)
  {
    CFDictionarySetValue(v3, @"relay-token-alloc-res", v10);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FEA68();
  }
  v11 = [(FTRelayUpdateMessage *)self selfRelayIP];
  if (v11)
  {
    CFDictionarySetValue(v3, @"self-relay-ip", v11);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE7C0();
  }
  v12 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](-[FTRelayUpdateMessage selfRelayPort](self, "selfRelayPort"), "intValue"));
  if (v12)
  {
    CFDictionarySetValue(v3, @"self-relay-port", v12);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE738();
  }
  v13 = [(FTRelayUpdateMessage *)self selfRelayNATIP];
  if (v13)
  {
    CFDictionarySetValue(v3, @"self-relay-nat-ip", v13);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE9E0();
  }
  v14 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](-[FTRelayUpdateMessage selfRelayNATPort](self, "selfRelayNATPort"), "intValue"));
  if (v14)
  {
    CFDictionarySetValue(v3, @"self-relay-nat-port", v14);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE958();
  }
  v15 = [(FTRelayUpdateMessage *)self peerRelayIP];
  if (v15)
  {
    CFDictionarySetValue(v3, @"peer-relay-ip", v15);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE6B0();
  }
  v16 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](-[FTRelayUpdateMessage peerRelayPort](self, "peerRelayPort"), "intValue"));
  if (v16)
  {
    CFDictionarySetValue(v3, @"peer-relay-port", v16);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FE628();
  }
  v17 = [(FTRelayUpdateMessage *)self selfRelayBlob];
  if (v17) {
    CFDictionarySetValue(v3, @"self-relay-blob", v17);
  }
  v18 = [(FTRelayUpdateMessage *)self relayCandidateID];
  if (v18) {
    CFDictionarySetValue(v3, @"relay-candidate-id", v18);
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

- (NSData)selfRelayBlob
{
  return (NSData *)objc_getProperty(self, a2, 440, 1);
}

- (void)setSelfRelayBlob:(id)a3
{
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 448, 1);
}

- (void)setPeerID:(id)a3
{
}

- (NSData)peerPushToken
{
  return (NSData *)objc_getProperty(self, a2, 456, 1);
}

- (void)setPeerPushToken:(id)a3
{
}

- (NSNumber)relayType
{
  return (NSNumber *)objc_getProperty(self, a2, 464, 1);
}

- (void)setRelayType:(id)a3
{
}

- (NSData)relayConnectionID
{
  return (NSData *)objc_getProperty(self, a2, 472, 1);
}

- (void)setRelayConnectionID:(id)a3
{
}

- (NSData)relayTransactionIDAlloc
{
  return (NSData *)objc_getProperty(self, a2, 480, 1);
}

- (void)setRelayTransactionIDAlloc:(id)a3
{
}

- (NSData)relayTokenAllocRes
{
  return (NSData *)objc_getProperty(self, a2, 488, 1);
}

- (void)setRelayTokenAllocRes:(id)a3
{
}

- (NSData)relayCandidateID
{
  return (NSData *)objc_getProperty(self, a2, 496, 1);
}

- (void)setRelayCandidateID:(id)a3
{
}

- (NSData)selfRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 504, 1);
}

- (void)setSelfRelayIP:(id)a3
{
}

- (NSNumber)selfRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 512, 1);
}

- (void)setSelfRelayPort:(id)a3
{
}

- (NSData)selfRelayNATIP
{
  return (NSData *)objc_getProperty(self, a2, 520, 1);
}

- (void)setSelfRelayNATIP:(id)a3
{
}

- (NSNumber)selfRelayNATPort
{
  return (NSNumber *)objc_getProperty(self, a2, 528, 1);
}

- (void)setSelfRelayNATPort:(id)a3
{
}

- (NSData)peerRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 536, 1);
}

- (void)setPeerRelayIP:(id)a3
{
}

- (NSNumber)peerRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 544, 1);
}

- (void)setPeerRelayPort:(id)a3
{
}

@end