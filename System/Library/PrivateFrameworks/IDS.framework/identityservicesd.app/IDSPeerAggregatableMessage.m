@interface IDSPeerAggregatableMessage
- (BOOL)wantsCertifiedDelivery;
- (IDSPeerAggregatableMessage)initWithTargetToken:(id)a3 sessionToken:(id)a4 targetPeerID:(id)a5 encryptedData:(id)a6 wantsDeliveryStatus:(BOOL)a7 wantsCertifiedDelivery:(BOOL)a8 ackBlock:(id)a9 completionBlock:(id)a10;
- (IDSPushToken)targetToken;
- (IDSURI)targetPeerID;
- (NSData)encryptedData;
- (NSData)payloadMetadata;
- (NSData)targetSessionToken;
- (NSDate)expirationDate;
- (NSNumber)command;
- (NSNumber)dataLength;
- (NSNumber)wantsDeliveryStatus;
- (NSString)anonymizedSenderID;
- (NSString)encryptionType;
- (NSString)senderShortHandle;
- (NSString)targetShortHandle;
- (id)ackBlock;
- (id)completionBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)sizeOfKeysWithValues;
- (void)setAckBlock:(id)a3;
- (void)setAnonymizedSenderID:(id)a3;
- (void)setCommand:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDataLength:(id)a3;
- (void)setEncryptedData:(id)a3;
- (void)setEncryptionType:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setPayloadMetadata:(id)a3;
- (void)setSenderShortHandle:(id)a3;
- (void)setTargetPeerID:(id)a3;
- (void)setTargetSessionToken:(id)a3;
- (void)setTargetShortHandle:(id)a3;
- (void)setTargetToken:(id)a3;
- (void)setWantsCertifiedDelivery:(BOOL)a3;
- (void)setWantsDeliveryStatus:(id)a3;
@end

@implementation IDSPeerAggregatableMessage

- (IDSPeerAggregatableMessage)initWithTargetToken:(id)a3 sessionToken:(id)a4 targetPeerID:(id)a5 encryptedData:(id)a6 wantsDeliveryStatus:(BOOL)a7 wantsCertifiedDelivery:(BOOL)a8 ackBlock:(id)a9 completionBlock:(id)a10
{
  BOOL v29 = a7;
  id v31 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  id v19 = a10;
  v32.receiver = self;
  v32.super_class = (Class)IDSPeerAggregatableMessage;
  v20 = [(IDSPeerAggregatableMessage *)&v32 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_targetToken, a3);
    objc_storeStrong((id *)&v21->_targetSessionToken, a4);
    objc_storeStrong((id *)&v21->_targetPeerID, a5);
    objc_storeStrong((id *)&v21->_encryptedData, a6);
    id v22 = objc_retainBlock(v18);
    id ackBlock = v21->_ackBlock;
    v21->_id ackBlock = v22;

    id v24 = objc_retainBlock(v19);
    id completionBlock = v21->_completionBlock;
    v21->_id completionBlock = v24;

    if (v29)
    {
      uint64_t v26 = +[NSNumber numberWithBool:1];
      wantsDeliveryStatus = v21->_wantsDeliveryStatus;
      v21->_wantsDeliveryStatus = (NSNumber *)v26;
    }
    v21->_wantsCertifiedDelivery = a8;
  }

  return v21;
}

- (id)dictionaryRepresentation
{
  Mutable = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v4 = [(IDSPeerAggregatableMessage *)self targetToken];
  v5 = [v4 rawToken];

  if (v5)
  {
    CFDictionarySetValue(Mutable, @"t", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100712670();
  }

  v6 = [(IDSPeerAggregatableMessage *)self targetSessionToken];
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"sT", v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007125E8();
  }

  v7 = [(IDSPeerAggregatableMessage *)self targetPeerID];
  v8 = [v7 prefixedURI];

  if (v8)
  {
    CFDictionarySetValue(Mutable, @"tP", v8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100712560();
  }

  v9 = [(IDSPeerAggregatableMessage *)self targetShortHandle];
  if (v9) {
    CFDictionarySetValue(Mutable, @"tPs", v9);
  }

  v10 = [(IDSPeerAggregatableMessage *)self senderShortHandle];
  if (v10) {
    CFDictionarySetValue(Mutable, @"sTs", v10);
  }

  v11 = [(IDSPeerAggregatableMessage *)self encryptedData];
  if (v11)
  {
    CFDictionarySetValue(Mutable, @"P", v11);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007124D8();
  }

  v12 = [(IDSPeerAggregatableMessage *)self wantsDeliveryStatus];
  if (v12) {
    CFDictionarySetValue(Mutable, @"D", v12);
  }

  if ([(IDSPeerAggregatableMessage *)self wantsCertifiedDelivery])
  {
    v13 = +[NSNumber numberWithInteger:_IDSCertifiedDeliveryVersion()];
    if (v13) {
      CFDictionarySetValue(Mutable, IDSCertifiedDeliveryVersionKey, v13);
    }
  }
  v14 = [(IDSPeerAggregatableMessage *)self anonymizedSenderID];
  if (v14) {
    CFDictionarySetValue(Mutable, @"sI", v14);
  }

  id v15 = [(IDSPeerAggregatableMessage *)self encryptionType];
  if (v15) {
    CFDictionarySetValue(Mutable, @"E", v15);
  }

  id v16 = [(IDSPeerAggregatableMessage *)self payloadMetadata];
  if (v16) {
    CFDictionarySetValue(Mutable, @"Pm", v16);
  }

  id v17 = [(IDSPeerAggregatableMessage *)self dataLength];
  if (v17) {
    CFDictionarySetValue(Mutable, @"mT", v17);
  }

  return Mutable;
}

- (unint64_t)sizeOfKeysWithValues
{
  v3 = [(IDSPeerAggregatableMessage *)self encryptedData];
  id v4 = [v3 length];

  v5 = [(IDSPeerAggregatableMessage *)self targetToken];
  v6 = [v5 rawToken];
  id v7 = [v6 length];

  v8 = [(IDSPeerAggregatableMessage *)self targetSessionToken];
  id v9 = [v8 length];

  v10 = [(IDSPeerAggregatableMessage *)self targetPeerID];
  v11 = [v10 prefixedURI];
  id v12 = [v11 lengthOfBytesUsingEncoding:4];

  v13 = [(IDSPeerAggregatableMessage *)self payloadMetadata];
  id v14 = [v13 length];

  return (unint64_t)v7 + (unint64_t)v9 + (void)v4 + (unint64_t)v14 + (void)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(IDSPeerAggregatableMessage *)self encryptedData];
  [v4 setEncryptedData:v5];

  v6 = [(IDSPeerAggregatableMessage *)self targetPeerID];
  [v4 setTargetPeerID:v6];

  id v7 = [(IDSPeerAggregatableMessage *)self targetToken];
  [v4 setTargetToken:v7];

  v8 = [(IDSPeerAggregatableMessage *)self targetSessionToken];
  [v4 setTargetSessionToken:v8];

  id v9 = [(IDSPeerAggregatableMessage *)self targetShortHandle];
  [v4 setTargetShortHandle:v9];

  v10 = [(IDSPeerAggregatableMessage *)self senderShortHandle];
  [v4 setSenderShortHandle:v10];

  v11 = [(IDSPeerAggregatableMessage *)self completionBlock];
  [v4 setCompletionBlock:v11];

  id v12 = [(IDSPeerAggregatableMessage *)self ackBlock];
  [v4 setAckBlock:v12];

  v13 = [(IDSPeerAggregatableMessage *)self wantsDeliveryStatus];
  [v4 setWantsDeliveryStatus:v13];

  objc_msgSend(v4, "setWantsCertifiedDelivery:", -[IDSPeerAggregatableMessage wantsCertifiedDelivery](self, "wantsCertifiedDelivery"));
  id v14 = [(IDSPeerAggregatableMessage *)self anonymizedSenderID];
  [v4 setAnonymizedSenderID:v14];

  id v15 = [(IDSPeerAggregatableMessage *)self encryptionType];
  [v4 setEncryptionType:v15];

  id v16 = [(IDSPeerAggregatableMessage *)self payloadMetadata];
  [v4 setPayloadMetadata:v16];

  [v4 setCommand:self->_command];
  [v4 setDataLength:self->_dataLength];
  [v4 setExpirationDate:self->_expirationDate];
  return v4;
}

- (NSData)encryptedData
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEncryptedData:(id)a3
{
}

- (IDSPushToken)targetToken
{
  return (IDSPushToken *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTargetToken:(id)a3
{
}

- (IDSURI)targetPeerID
{
  return (IDSURI *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTargetPeerID:(id)a3
{
}

- (NSString)anonymizedSenderID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAnonymizedSenderID:(id)a3
{
}

- (NSData)targetSessionToken
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTargetSessionToken:(id)a3
{
}

- (NSNumber)wantsDeliveryStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWantsDeliveryStatus:(id)a3
{
}

- (BOOL)wantsCertifiedDelivery
{
  return self->_wantsCertifiedDelivery;
}

- (void)setWantsCertifiedDelivery:(BOOL)a3
{
  self->_wantsCertifiedDelivery = a3;
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)ackBlock
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setAckBlock:(id)a3
{
}

- (NSString)targetShortHandle
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTargetShortHandle:(id)a3
{
}

- (NSString)senderShortHandle
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSenderShortHandle:(id)a3
{
}

- (NSString)encryptionType
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setEncryptionType:(id)a3
{
}

- (NSData)payloadMetadata
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPayloadMetadata:(id)a3
{
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setExpirationDate:(id)a3
{
}

- (NSNumber)dataLength
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDataLength:(id)a3
{
}

- (NSNumber)command
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCommand:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_dataLength, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_payloadMetadata, 0);
  objc_storeStrong((id *)&self->_encryptionType, 0);
  objc_storeStrong((id *)&self->_senderShortHandle, 0);
  objc_storeStrong((id *)&self->_targetShortHandle, 0);
  objc_storeStrong(&self->_ackBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_wantsDeliveryStatus, 0);
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_anonymizedSenderID, 0);
  objc_storeStrong((id *)&self->_targetPeerID, 0);
  objc_storeStrong((id *)&self->_targetSessionToken, 0);

  objc_storeStrong((id *)&self->_targetToken, 0);
}

@end