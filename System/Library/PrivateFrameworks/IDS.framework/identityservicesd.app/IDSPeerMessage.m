@interface IDSPeerMessage
- (BOOL)fireAndForget;
- (IDSPeerMessage)init;
- (IDSPeerMessage)initWithHighPriority:(BOOL)a3;
- (NSData)encryptedData;
- (NSData)targetSessionToken;
- (NSData)targetToken;
- (NSDate)expirationDate;
- (NSDictionary)additionalDictionary;
- (NSNumber)deliveryMinimumTime;
- (NSNumber)deliveryMinimumTimeDelay;
- (NSNumber)priority;
- (NSNumber)sendMode;
- (NSString)encryptionType;
- (NSString)messageID;
- (NSString)sourcePeerID;
- (NSString)sourceShortHandle;
- (NSString)targetPeerID;
- (NSString)targetShortHandle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)setAdditionalDictionary:(id)a3;
- (void)setDeliveryMinimumTime:(id)a3;
- (void)setDeliveryMinimumTimeDelay:(id)a3;
- (void)setEncryptedData:(id)a3;
- (void)setEncryptionType:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFireAndForget:(BOOL)a3;
- (void)setMessageID:(id)a3;
- (void)setPriority:(id)a3;
- (void)setSendMode:(id)a3;
- (void)setSourcePeerID:(id)a3;
- (void)setSourceShortHandle:(id)a3;
- (void)setTargetPeerID:(id)a3;
- (void)setTargetSessionToken:(id)a3;
- (void)setTargetShortHandle:(id)a3;
- (void)setTargetToken:(id)a3;
@end

@implementation IDSPeerMessage

- (IDSPeerMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)IDSPeerMessage;
  v2 = [(IDSPeerMessage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IDSPeerMessage *)v2 setWantsResponse:1];
  }
  return v3;
}

- (IDSPeerMessage)initWithHighPriority:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(IDSPeerMessage *)self init];
  objc_super v5 = v4;
  if (v4)
  {
    [(IDSPeerMessage *)v4 setHighPriority:v3];
    if (!v3) {
      [(IDSPeerMessage *)v5 setTimeout:1200.0];
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)IDSPeerMessage;
  id v4 = [(IDSPeerMessage *)&v21 copyWithZone:a3];
  objc_super v5 = [(IDSPeerMessage *)self priority];
  [v4 setPriority:v5];

  v6 = [(IDSPeerMessage *)self encryptionType];
  [v4 setEncryptionType:v6];

  v7 = [(IDSPeerMessage *)self encryptedData];
  [v4 setEncryptedData:v7];

  v8 = [(IDSPeerMessage *)self targetPeerID];
  [v4 setTargetPeerID:v8];

  v9 = [(IDSPeerMessage *)self targetShortHandle];
  [v4 setTargetShortHandle:v9];

  v10 = [(IDSPeerMessage *)self sourcePeerID];
  [v4 setSourcePeerID:v10];

  v11 = [(IDSPeerMessage *)self sourceShortHandle];
  [v4 setSourceShortHandle:v11];

  v12 = [(IDSPeerMessage *)self targetToken];
  [v4 setTargetToken:v12];

  v13 = [(IDSPeerMessage *)self targetSessionToken];
  [v4 setTargetSessionToken:v13];

  v14 = [(IDSPeerMessage *)self expirationDate];
  [v4 setExpirationDate:v14];

  objc_msgSend(v4, "setFireAndForget:", -[IDSPeerMessage fireAndForget](self, "fireAndForget"));
  v15 = [(IDSPeerMessage *)self additionalDictionary];
  [v4 setAdditionalDictionary:v15];

  v16 = [(IDSPeerMessage *)self messageID];
  [v4 setMessageID:v16];

  v17 = [(IDSPeerMessage *)self deliveryMinimumTimeDelay];
  [v4 setDeliveryMinimumTimeDelay:v17];

  v18 = [(IDSPeerMessage *)self deliveryMinimumTime];
  [v4 setDeliveryMinimumTime:v18];

  v19 = [(IDSPeerMessage *)self sendMode];
  [v4 setSendMode:v19];

  return v4;
}

- (id)requiredKeys
{
  v5.receiver = self;
  v5.super_class = (Class)IDSPeerMessage;
  v2 = [(IDSPeerMessage *)&v5 requiredKeys];
  id v3 = [v2 mutableCopy];

  if (!v3) {
    id v3 = objc_alloc_init((Class)NSMutableArray);
  }
  [v3 addObject:@"sP"];
  [v3 addObject:@"t"];
  [v3 addObject:@"sT"];

  return v3;
}

- (id)messageBody
{
  v43.receiver = self;
  v43.super_class = (Class)IDSPeerMessage;
  id v3 = [(IDSPeerMessage *)&v43 messageBody];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  objc_super v5 = [(IDSPeerMessage *)self messageID];
  v6 = v5;
  if (v5)
  {
    v7 = (const char *)[v5 UTF8String];
    if (v7)
    {
      memset(uu, 170, sizeof(uu));
      uuid_parse(v7, uu);
      uint64_t v42 = 0;
      jw_uuid_to_data();
      id v8 = 0;
      if (v8) {
        CFDictionarySetValue(Mutable, @"U", v8);
      }
    }
  }
  additionalDictionary = self->_additionalDictionary;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100112470;
  v40[3] = &unk_100980928;
  v10 = Mutable;
  v41 = v10;
  [(NSDictionary *)additionalDictionary enumerateKeysAndObjectsUsingBlock:v40];
  v11 = [(IDSPeerMessage *)self sourcePeerID];
  if (v11)
  {
    CFDictionarySetValue(v10, @"sP", v11);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070BF00();
  }

  v12 = [(IDSPeerMessage *)self sourceShortHandle];
  if (v12) {
    CFDictionarySetValue(v10, @"sPs", v12);
  }

  v13 = [(IDSPeerMessage *)self targetPeerID];
  if (v13) {
    CFDictionarySetValue(v10, @"tP", v13);
  }

  v14 = [(IDSPeerMessage *)self targetShortHandle];
  if (v14) {
    CFDictionarySetValue(v10, @"tPs", v14);
  }

  v15 = [(IDSPeerMessage *)self targetSessionToken];
  if (v15) {
    CFDictionarySetValue(v10, @"sT", v15);
  }

  v16 = [(IDSPeerMessage *)self targetToken];
  if (v16) {
    CFDictionarySetValue(v10, @"t", v16);
  }

  v17 = [(IDSPeerMessage *)self encryptedData];
  if (v17) {
    CFDictionarySetValue(v10, @"P", v17);
  }

  if ([(IDSPeerMessage *)self fireAndForget])
  {
    CFDictionarySetValue(v10, IDSExpirationDateKey, &off_1009D1068);
  }
  else
  {
    v18 = [(IDSPeerMessage *)self expirationDate];

    if (v18)
    {
      v19 = [(IDSPeerMessage *)self expirationDate];
      [v19 timeIntervalSince1970];
      objc_super v21 = +[NSNumber numberWithUnsignedLong:(unint64_t)v20];

      if (v21) {
        CFDictionarySetValue(v10, IDSExpirationDateKey, v21);
      }
    }
  }
  uint64_t v22 = [(IDSPeerMessage *)self encryptionType];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(IDSPeerMessage *)self encryptionType];
    v25 = IDSEncryptionTypeStringFromEncryptionType();
    unsigned __int8 v26 = [v24 isEqualToIgnoringCase:v25];

    if ((v26 & 1) == 0)
    {
      v27 = [(IDSPeerMessage *)self encryptionType];
      if (v27) {
        CFDictionarySetValue(v10, @"E", v27);
      }
    }
  }
  uint64_t v28 = [(IDSPeerMessage *)self priority];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(IDSPeerMessage *)self priority];
    unsigned int v31 = [v30 intValue];

    if (v31 != 10)
    {
      v32 = [(IDSPeerMessage *)self priority];
      if (v32) {
        CFDictionarySetValue(v10, @"pri", v32);
      }
    }
  }
  v33 = [(IDSPeerMessage *)self deliveryMinimumTimeDelay];

  if (v33)
  {
    v34 = [(IDSPeerMessage *)self deliveryMinimumTimeDelay];
    if (v34) {
      CFDictionarySetValue(v10, IDSDeliveryMinimumTimeDelayKey, v34);
    }
  }
  v35 = [(IDSPeerMessage *)self deliveryMinimumTime];

  if (v35)
  {
    v36 = [(IDSPeerMessage *)self deliveryMinimumTime];
    if (v36) {
      CFDictionarySetValue(v10, IDSDeliveryMinimumTimeKey, v36);
    }
  }
  v37 = [(IDSPeerMessage *)self sendMode];

  if (v37)
  {
    v38 = [(IDSPeerMessage *)self sendMode];
    if (v38) {
      CFDictionarySetValue(v10, IDSDeliverySendModeKey, v38);
    }
  }

  return v10;
}

- (NSNumber)priority
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setPriority:(id)a3
{
}

- (NSString)encryptionType
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setEncryptionType:(id)a3
{
}

- (NSData)encryptedData
{
  return (NSData *)objc_getProperty(self, a2, 280, 1);
}

- (void)setEncryptedData:(id)a3
{
}

- (NSData)targetToken
{
  return (NSData *)objc_getProperty(self, a2, 288, 1);
}

- (void)setTargetToken:(id)a3
{
}

- (NSString)targetPeerID
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setTargetPeerID:(id)a3
{
}

- (NSString)sourcePeerID
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (void)setSourcePeerID:(id)a3
{
}

- (NSData)targetSessionToken
{
  return (NSData *)objc_getProperty(self, a2, 312, 1);
}

- (void)setTargetSessionToken:(id)a3
{
}

- (NSString)messageID
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setMessageID:(id)a3
{
}

- (NSDictionary)additionalDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 328, 1);
}

- (void)setAdditionalDictionary:(id)a3
{
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 336, 1);
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)fireAndForget
{
  return self->_fireAndForget;
}

- (void)setFireAndForget:(BOOL)a3
{
  self->_fireAndForget = a3;
}

- (NSNumber)deliveryMinimumTimeDelay
{
  return (NSNumber *)objc_getProperty(self, a2, 344, 1);
}

- (void)setDeliveryMinimumTimeDelay:(id)a3
{
}

- (NSNumber)deliveryMinimumTime
{
  return (NSNumber *)objc_getProperty(self, a2, 352, 1);
}

- (void)setDeliveryMinimumTime:(id)a3
{
}

- (NSNumber)sendMode
{
  return (NSNumber *)objc_getProperty(self, a2, 360, 1);
}

- (void)setSendMode:(id)a3
{
}

- (NSString)targetShortHandle
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (void)setTargetShortHandle:(id)a3
{
}

- (NSString)sourceShortHandle
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setSourceShortHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceShortHandle, 0);
  objc_storeStrong((id *)&self->_targetShortHandle, 0);
  objc_storeStrong((id *)&self->_sendMode, 0);
  objc_storeStrong((id *)&self->_deliveryMinimumTime, 0);
  objc_storeStrong((id *)&self->_deliveryMinimumTimeDelay, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_additionalDictionary, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_targetSessionToken, 0);
  objc_storeStrong((id *)&self->_sourcePeerID, 0);
  objc_storeStrong((id *)&self->_targetPeerID, 0);
  objc_storeStrong((id *)&self->_targetToken, 0);
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_encryptionType, 0);

  objc_storeStrong((id *)&self->_priority, 0);
}

@end