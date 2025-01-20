@interface IDSIncomingNiceMessage
- (BOOL)isEqual:(id)a3;
- (BOOL)isTrustedSender;
- (IDSIncomingNiceMessage)initWithMessageDictionary:(id)a3 topic:(id)a4;
- (IDSPushToken)senderPushToken;
- (IDSURI)fromURI;
- (IDSURI)toURI;
- (NSArray)messageList;
- (NSData)certifiedDeliveryRTS;
- (NSData)encryptedPayload;
- (NSData)groupIDData;
- (NSData)payloadMetadataData;
- (NSData)rawBulkedData;
- (NSData)rawUnencryptedPayload;
- (NSData)updateHash;
- (NSDictionary)messageDictionary;
- (NSDictionary)rawMessage;
- (NSNumber)certifiedDeliveryVersion;
- (NSNumber)command;
- (NSNumber)commandContext;
- (NSNumber)desiredProtocol;
- (NSNumber)expectsPeerResponse;
- (NSNumber)expirationDate;
- (NSNumber)failureReason;
- (NSNumber)isBulkedPayload;
- (NSNumber)messageChunkNumber;
- (NSNumber)originalCommand;
- (NSNumber)originalTimestamp;
- (NSNumber)pendingMessageCount;
- (NSNumber)pendingMessagePerSenderCount;
- (NSNumber)retryCount;
- (NSNumber)serverTimestamp;
- (NSNumber)storageContext;
- (NSNumber)storageFlags;
- (NSNumber)totalChunkCount;
- (NSNumber)wantsAppAck;
- (NSNumber)wantsCheckpointing;
- (NSString)cachedDescription;
- (NSString)encryptionTypeStr;
- (NSString)failureMessageID;
- (NSString)failureReasonMessage;
- (NSString)originalUUID;
- (NSString)peerResponseIdentifier;
- (NSString)pushUUID;
- (NSString)receiverShortHandle;
- (NSString)reportID;
- (NSString)senderShortHandle;
- (NSString)storageFetchUUID;
- (NSString)topic;
- (id)description;
- (void)setCachedDescription:(id)a3;
- (void)setMessageDictionary:(id)a3;
- (void)setTopic:(id)a3;
@end

@implementation IDSIncomingNiceMessage

- (IDSIncomingNiceMessage)initWithMessageDictionary:(id)a3 topic:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSIncomingNiceMessage;
  v9 = [(IDSIncomingNiceMessage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageDictionary, a3);
    objc_storeStrong((id *)&v10->_topic, a4);
  }

  return v10;
}

- (id)description
{
  cachedDescription = self->_cachedDescription;
  if (!cachedDescription)
  {
    v4 = sub_19DABD6CC(self->_messageDictionary, self->_topic);
    v5 = NSString;
    uint64_t v6 = objc_opt_class();
    objc_msgSend_stringWithFormat_(v5, v7, @"<%@:%p %@>", v8, v6, self, v4);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_cachedDescription;
    self->_cachedDescription = v9;

    cachedDescription = self->_cachedDescription;
  }
  return cachedDescription;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IDSIncomingNiceMessage *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  if (v4 == self)
  {
LABEL_7:
    char isEqualToDictionary = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    char isEqualToDictionary = 0;
    goto LABEL_8;
  }
  messageDictionary = self->_messageDictionary;
  uint64_t v9 = (uint64_t)v5->_messageDictionary;
  if (messageDictionary == (NSDictionary *)v9) {
    goto LABEL_7;
  }
  char isEqualToDictionary = objc_msgSend_isEqualToDictionary_(messageDictionary, v6, v9, v7);
LABEL_8:

  return isEqualToDictionary;
}

- (NSDictionary)rawMessage
{
  return self->_messageDictionary;
}

- (NSString)pushUUID
{
  v4 = objc_msgSend_objectForKey_(self->_messageDictionary, a2, @"U", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = (void *)MEMORY[0x1E4F1C9B8];
    double v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"U", v6);
    uint64_t v11 = objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
LABEL_5:
    v14 = (void *)v11;
    v15 = JWUUIDPushObjectToString();

    goto LABEL_7;
  }
  double v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"U", v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_messageDictionary, v12, @"U", v13);
    goto LABEL_5;
  }
  v15 = JWUUIDPushObjectToString();
LABEL_7:

  return (NSString *)v15;
}

- (NSNumber)expirationDate
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"eX");
}

- (NSNumber)command
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"c");
}

- (NSNumber)commandContext
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"cc");
}

- (IDSURI)toURI
{
  uint64_t v3 = objc_opt_class();
  v5 = sub_19DABDB58(v3, self->_messageDictionary, @"tP");
  if (v5)
  {
    double v7 = objc_msgSend_URIWithPrefixedURI_withServiceLoggingHint_(IDSURI, v4, (uint64_t)v5, v6, self->_topic);
  }
  else
  {
    double v7 = 0;
  }

  return (IDSURI *)v7;
}

- (NSString)reportID
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSString *)sub_19DABDB58(v3, messageDictionary, @"hI");
}

- (NSData)groupIDData
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSData *)sub_19DABDB58(v3, messageDictionary, @"gI");
}

- (NSString)peerResponseIdentifier
{
  v4 = objc_msgSend_objectForKey_(self->_messageDictionary, a2, @"rI", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = (void *)MEMORY[0x1E4F1C9B8];
    double v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"rI", v6);
    uint64_t v11 = objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
LABEL_5:
    v14 = (void *)v11;
    v15 = JWUUIDPushObjectToString();

    goto LABEL_7;
  }
  double v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"rI", v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_messageDictionary, v12, @"rI", v13);
    goto LABEL_5;
  }
  v15 = JWUUIDPushObjectToString();
LABEL_7:

  return (NSString *)v15;
}

- (NSNumber)wantsAppAck
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"wA");
}

- (NSNumber)expectsPeerResponse
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"eR");
}

- (NSNumber)certifiedDeliveryVersion
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"cdv");
}

- (NSData)updateHash
{
  v4 = objc_msgSend_objectForKey_(self->_messageDictionary, a2, @"qH", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = (void *)MEMORY[0x1E4F1C9B8];
    double v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"qH", v6);
    uint64_t v11 = objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
LABEL_5:
    v14 = (void *)v11;
    goto LABEL_7;
  }
  double v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"qH", v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_messageDictionary, v12, @"qH", v13);
    goto LABEL_5;
  }
  v14 = 0;
LABEL_7:

  return (NSData *)v14;
}

- (NSData)encryptedPayload
{
  v4 = objc_msgSend_objectForKey_(self->_messageDictionary, a2, @"P", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = (void *)MEMORY[0x1E4F1C9B8];
    double v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"P", v6);
    uint64_t v11 = objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
LABEL_5:
    v14 = (void *)v11;
    goto LABEL_7;
  }
  double v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"P", v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_messageDictionary, v12, @"P", v13);
    goto LABEL_5;
  }
  v14 = 0;
LABEL_7:

  return (NSData *)v14;
}

- (NSData)certifiedDeliveryRTS
{
  v4 = objc_msgSend_objectForKey_(self->_messageDictionary, a2, @"cdr", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = (void *)MEMORY[0x1E4F1C9B8];
    double v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"cdr", v6);
    uint64_t v11 = objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
LABEL_5:
    v14 = (void *)v11;
    goto LABEL_7;
  }
  double v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"cdr", v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_messageDictionary, v12, @"cdr", v13);
    goto LABEL_5;
  }
  v14 = 0;
LABEL_7:

  return (NSData *)v14;
}

- (NSNumber)storageContext
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"H");
}

- (NSNumber)serverTimestamp
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"e");
}

- (NSData)rawBulkedData
{
  v4 = objc_msgSend_objectForKey_(self->_messageDictionary, a2, @"N", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = (void *)MEMORY[0x1E4F1C9B8];
    double v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"N", v6);
    uint64_t v11 = objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
LABEL_5:
    v14 = (void *)v11;
    goto LABEL_7;
  }
  double v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"N", v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_messageDictionary, v12, @"N", v13);
    goto LABEL_5;
  }
  v14 = 0;
LABEL_7:

  return (NSData *)v14;
}

- (NSData)rawUnencryptedPayload
{
  v4 = objc_msgSend_objectForKey_(self->_messageDictionary, a2, @"P", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = (void *)MEMORY[0x1E4F1C9B8];
    double v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"P", v6);
    uint64_t v11 = objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
LABEL_5:
    v14 = (void *)v11;
    goto LABEL_7;
  }
  double v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"P", v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_messageDictionary, v12, @"P", v13);
    goto LABEL_5;
  }
  v14 = 0;
LABEL_7:

  return (NSData *)v14;
}

- (NSNumber)isBulkedPayload
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"iB");
}

- (NSNumber)originalCommand
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"oC");
}

- (IDSPushToken)senderPushToken
{
  v4 = objc_msgSend_objectForKey_(self->_messageDictionary, a2, @"t", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = (void *)MEMORY[0x1E4F1C9B8];
    double v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"t", v6);
    uint64_t v11 = objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
LABEL_5:
    v14 = (void *)v11;
    goto LABEL_7;
  }
  double v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"t", v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_messageDictionary, v12, @"t", v13);
    goto LABEL_5;
  }
  v14 = 0;
LABEL_7:

  if (v14)
  {
    v17 = objc_msgSend_pushTokenWithData_withServiceLoggingHint_(IDSPushToken, v15, (uint64_t)v14, v16, self->_topic);
  }
  else
  {
    v17 = 0;
  }

  return (IDSPushToken *)v17;
}

- (NSNumber)originalTimestamp
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"oe");
}

- (BOOL)isTrustedSender
{
  uint64_t v3 = objc_opt_class();
  v4 = sub_19DABDB58(v3, self->_messageDictionary, @"htu");
  uint64_t v5 = objc_opt_class();
  double v6 = sub_19DABDB58(v5, self->_messageDictionary, @"htu");
  char v10 = objc_msgSend_BOOLValue(v6, v7, v8, v9);

  return v10;
}

- (NSData)payloadMetadataData
{
  v4 = objc_msgSend_objectForKey_(self->_messageDictionary, a2, @"Pm", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"Pm", v6);
    uint64_t v11 = objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
LABEL_5:
    v14 = (void *)v11;
    goto LABEL_7;
  }
  uint64_t v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"Pm", v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_messageDictionary, v12, @"Pm", v13);
    goto LABEL_5;
  }
  v14 = 0;
LABEL_7:

  return (NSData *)v14;
}

- (NSString)encryptionTypeStr
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSString *)sub_19DABDB58(v3, messageDictionary, @"E");
}

- (NSNumber)wantsCheckpointing
{
  return (NSNumber *)objc_msgSend__numberForKey_(self->_messageDictionary, a2, @"mc", v2);
}

- (NSNumber)failureReason
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"fR");
}

- (NSString)failureMessageID
{
  v4 = objc_msgSend_objectForKey_(self->_messageDictionary, a2, @"fU", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"fU", v6);
    uint64_t v11 = objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
LABEL_5:
    v14 = (void *)v11;
    v15 = JWUUIDPushObjectToString();

    goto LABEL_7;
  }
  uint64_t v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"fU", v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_messageDictionary, v12, @"fU", v13);
    goto LABEL_5;
  }
  v15 = JWUUIDPushObjectToString();
LABEL_7:

  return (NSString *)v15;
}

- (NSString)failureReasonMessage
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSString *)sub_19DABDB58(v3, messageDictionary, @"fRM");
}

- (NSNumber)storageFlags
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"H");
}

- (NSString)storageFetchUUID
{
  v4 = objc_msgSend_objectForKey_(self->_messageDictionary, a2, @"scU", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"scU", v6);
    uint64_t v11 = objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
LABEL_5:
    v14 = (void *)v11;
    v15 = JWUUIDPushObjectToString();

    goto LABEL_7;
  }
  uint64_t v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"scU", v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_messageDictionary, v12, @"scU", v13);
    goto LABEL_5;
  }
  v15 = JWUUIDPushObjectToString();
LABEL_7:

  return (NSString *)v15;
}

- (NSNumber)retryCount
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"rc");
}

- (IDSURI)fromURI
{
  uint64_t v3 = objc_opt_class();
  uint64_t v5 = sub_19DABDB58(v3, self->_messageDictionary, @"sP");
  if (v5)
  {
    double v7 = objc_msgSend_URIWithPrefixedURI_withServiceLoggingHint_(IDSURI, v4, (uint64_t)v5, v6, self->_topic);
  }
  else
  {
    double v7 = 0;
  }

  return (IDSURI *)v7;
}

- (NSArray)messageList
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSArray *)sub_19DABDB58(v3, messageDictionary, @"mml");
}

- (NSString)senderShortHandle
{
  v4 = objc_msgSend_objectForKey_(self->_messageDictionary, a2, @"sPs", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"sPs", v6);
    uint64_t v11 = objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
LABEL_5:
    v14 = (void *)v11;
    goto LABEL_7;
  }
  uint64_t v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"sPs", v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_messageDictionary, v12, @"sPs", v13);
    goto LABEL_5;
  }
  v14 = 0;
LABEL_7:

  if (v14)
  {
    v17 = objc_msgSend_base64EncodedStringWithOptions_(v14, v15, 0, v16);
  }
  else
  {
    v17 = 0;
  }

  return (NSString *)v17;
}

- (NSString)receiverShortHandle
{
  v4 = objc_msgSend_objectForKey_(self->_messageDictionary, a2, @"tPs", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"tPs", v6);
    uint64_t v11 = objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
LABEL_5:
    v14 = (void *)v11;
    goto LABEL_7;
  }
  uint64_t v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"tPs", v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_messageDictionary, v12, @"tPs", v13);
    goto LABEL_5;
  }
  v14 = 0;
LABEL_7:

  if (v14)
  {
    v17 = objc_msgSend_base64EncodedStringWithOptions_(v14, v15, 0, v16);
  }
  else
  {
    v17 = 0;
  }

  return (NSString *)v17;
}

- (NSNumber)messageChunkNumber
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"mcn");
}

- (NSNumber)totalChunkCount
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"tcc");
}

- (NSString)originalUUID
{
  v4 = objc_msgSend_objectForKey_(self->_messageDictionary, a2, @"oU", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"oU", v6);
    uint64_t v11 = objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
LABEL_5:
    v14 = (void *)v11;
    v15 = JWUUIDPushObjectToString();

    goto LABEL_7;
  }
  uint64_t v8 = objc_msgSend_objectForKey_(self->_messageDictionary, v5, @"oU", v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_messageDictionary, v12, @"oU", v13);
    goto LABEL_5;
  }
  v15 = JWUUIDPushObjectToString();
LABEL_7:

  return (NSString *)v15;
}

- (NSNumber)pendingMessageCount
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"pmc");
}

- (NSNumber)pendingMessagePerSenderCount
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"pms");
}

- (NSNumber)desiredProtocol
{
  uint64_t v3 = objc_opt_class();
  messageDictionary = self->_messageDictionary;
  return (NSNumber *)sub_19DABDB58(v3, messageDictionary, @"dp");
}

- (NSDictionary)messageDictionary
{
  return self->_messageDictionary;
}

- (void)setMessageDictionary:(id)a3
{
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (NSString)cachedDescription
{
  return self->_cachedDescription;
}

- (void)setCachedDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_messageDictionary, 0);
}

@end