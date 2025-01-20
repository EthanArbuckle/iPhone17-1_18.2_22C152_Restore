@interface IDSLocalDeliveryMessage
+ (id)socketPairMessageWithCommand:(int64_t)a3 streamID:(unsigned __int16)a4 sequenceNumber:(unsigned int)a5 messageID:(unsigned int)a6 expectsPeerResponse:(BOOL)a7 wantsAppAck:(BOOL)a8 compressPayload:(BOOL)a9 compressed:(BOOL)a10 didWakeHint:(BOOL)a11 peerResponseIdentifier:(id)a12 messageUUID:(id)a13 payload:(id)a14 protobuf:(id)a15 resourcePath:(id)a16 resourceMetadata:(id)a17 expiryDate:(id)a18;
+ (unsigned)_niceToSocketCommand:(int64_t)a3;
- (BOOL)bypassDuet;
- (BOOL)compressPayload;
- (BOOL)compressed;
- (BOOL)deniedToSend;
- (BOOL)didFallback;
- (BOOL)didWakeHint;
- (BOOL)expectsPeerResponse;
- (BOOL)isDoneSending;
- (BOOL)manualQueueRemoval;
- (BOOL)nonCloudWaking;
- (BOOL)nonWaking;
- (BOOL)requireBluetooth;
- (BOOL)requireLocalWiFi;
- (BOOL)shouldEnforceRemoteTimeout;
- (BOOL)wantsAppAck;
- (IDSLocalDeliveryMessage)init;
- (IDSProtobuf)protobuf;
- (IDSSocketPairMessage)underlyingSocketPairMessage;
- (NSArray)duetIdentifiersOverride;
- (NSData)payload;
- (NSDate)expirationDate;
- (NSDictionary)resourceMetadata;
- (NSNumber)command;
- (NSNumber)domainHash;
- (NSString)awdTopic;
- (NSString)fromID;
- (NSString)messageUUID;
- (NSString)peerResponseIdentifier;
- (NSString)queueOneIdentifier;
- (NSString)resourcePath;
- (NSString)toDeviceID;
- (NSString)toURI;
- (NSString)topic;
- (double)timeEnqueued;
- (double)timeSent;
- (id)completionBlock;
- (id)fallbackBlock;
- (id)progressBlock;
- (id)socketPairMessage;
- (int64_t)messageState;
- (int64_t)messageType;
- (int64_t)priority;
- (unint64_t)minCompatibilityVersion;
- (unint64_t)sentMessageDataSize;
- (unsigned)dataProtectionClass;
- (unsigned)messageID;
- (void)kickProgressBlock;
- (void)processAckForSocketPairMessage:(id)a3;
- (void)setAwdTopic:(id)a3;
- (void)setBypassDuet:(BOOL)a3;
- (void)setCommand:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCompressPayload:(BOOL)a3;
- (void)setCompressed:(BOOL)a3;
- (void)setDataProtectionClass:(unsigned int)a3;
- (void)setDeniedToSend:(BOOL)a3;
- (void)setDidFallback:(BOOL)a3;
- (void)setDidWakeHint:(BOOL)a3;
- (void)setDomainHash:(id)a3;
- (void)setDuetIdentifiersOverride:(id)a3;
- (void)setExpectsPeerResponse:(BOOL)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFallbackBlock:(id)a3;
- (void)setFromID:(id)a3;
- (void)setManualQueueRemoval:(BOOL)a3;
- (void)setMessageID:(unsigned int)a3;
- (void)setMessageType:(int64_t)a3;
- (void)setMessageUUID:(id)a3;
- (void)setMinCompatibilityVersion:(unint64_t)a3;
- (void)setNonCloudWaking:(BOOL)a3;
- (void)setNonWaking:(BOOL)a3;
- (void)setPayload:(id)a3;
- (void)setPeerResponseIdentifier:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setProgressBlock:(id)a3;
- (void)setProtobuf:(id)a3;
- (void)setQueueOneIdentifier:(id)a3;
- (void)setRequireBluetooth:(BOOL)a3;
- (void)setRequireLocalWiFi:(BOOL)a3;
- (void)setResourceMetadata:(id)a3;
- (void)setResourcePath:(id)a3;
- (void)setSentMessageDataSize:(unint64_t)a3;
- (void)setShouldEnforceRemoteTimeout:(BOOL)a3;
- (void)setTimeEnqueued:(double)a3;
- (void)setTimeSent:(double)a3;
- (void)setToDeviceID:(id)a3;
- (void)setToURI:(id)a3;
- (void)setTopic:(id)a3;
- (void)setUnderlyingSocketPairMessage:(id)a3;
- (void)setWantsAppAck:(BOOL)a3;
@end

@implementation IDSLocalDeliveryMessage

- (IDSLocalDeliveryMessage)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSLocalDeliveryMessage;
  result = [(IDSLocalDeliveryMessage *)&v3 init];
  if (result) {
    result->_messageState = 1;
  }
  return result;
}

- (void)setCompletionBlock:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001DD2FC;
    v8[3] = &unk_100985968;
    id v9 = v4;
    v10 = v11;
    v5 = objc_retainBlock(v8);
  }
  else
  {
    v5 = 0;
  }
  if (v5 != self->_completionBlock)
  {
    id v6 = [v5 copy];
    id completionBlock = self->_completionBlock;
    self->_id completionBlock = v6;
  }
  _Block_object_dispose(v11, 8);
}

- (void)kickProgressBlock
{
  if (self->_progressBlock)
  {
    if (self->_isSending)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v3 = self->_underlyingSocketPairMessage;
        id v7 = objc_alloc_init((Class)IDSDeliveryContext);
        [v7 setIdsResponseCode:0];
        [v7 setLastCall:0];
        id progressBlock = self->_progressBlock;
        v5 = +[NSNumber numberWithUnsignedLongLong:[(IDSSocketPairMessage *)v3 nextByte]];
        id v6 = +[NSNumber numberWithUnsignedLongLong:[(IDSSocketPairMessage *)v3 totalBytes]];
        (*((void (**)(id, id, void *, void *, void, void))progressBlock + 2))(progressBlock, v7, v5, v6, 0, 0);
      }
    }
  }
}

- (void)processAckForSocketPairMessage:(id)a3
{
  self->_fullyAckd = 1;
  self->_messageState = 3;
}

- (id)socketPairMessage
{
  p_underlyingSocketPairMessage = &self->_underlyingSocketPairMessage;
  underlyingSocketPairMessage = self->_underlyingSocketPairMessage;
  *((unsigned char *)p_underlyingSocketPairMessage + 8) = 1;
  p_underlyingSocketPairMessage[12] = (IDSSocketPairMessage *)2;
  if (underlyingSocketPairMessage)
  {
    [(IDSSocketPairMessage *)underlyingSocketPairMessage setContext:self];
    v5 = self->_underlyingSocketPairMessage;
  }
  else
  {
    if (self->_shouldEnforceRemoteTimeout)
    {
      v16 = [(IDSLocalDeliveryMessage *)self expirationDate];
    }
    else
    {
      v16 = 0;
    }
    v24 = objc_opt_class();
    v26 = [(IDSLocalDeliveryMessage *)self command];
    id v23 = [v26 integerValue];
    v25 = [(IDSLocalDeliveryMessage *)self domainHash];
    unsigned int v22 = [v25 unsignedShortValue];
    unsigned int v21 = [(IDSLocalDeliveryMessage *)self messageID];
    unsigned int v6 = [(IDSLocalDeliveryMessage *)self messageID];
    BOOL expectsPeerResponse = self->_expectsPeerResponse;
    unsigned int v20 = v6;
    BOOL compressPayload = self->_compressPayload;
    BOOL wantsAppAck = self->_wantsAppAck;
    __int16 v7 = *(_WORD *)&self->_compressed;
    peerResponseIdentifier = self->_peerResponseIdentifier;
    messageUUID = self->_messageUUID;
    v10 = [(IDSLocalDeliveryMessage *)self payload];
    v11 = [(IDSLocalDeliveryMessage *)self protobuf];
    char v12 = [(IDSLocalDeliveryMessage *)self resourcePath];
    v13 = [(IDSLocalDeliveryMessage *)self resourceMetadata];
    *(_WORD *)((char *)&v15 + 1) = v7;
    LOBYTE(v15) = compressPayload;
    objc_msgSend(v24, "socketPairMessageWithCommand:streamID:sequenceNumber:messageID:expectsPeerResponse:wantsAppAck:compressPayload:compressed:didWakeHint:peerResponseIdentifier:messageUUID:payload:protobuf:resourcePath:resourceMetadata:expiryDate:", v23, v22, v21, v20, expectsPeerResponse, wantsAppAck, v15, peerResponseIdentifier, messageUUID, v10, v11, v12, v13, v16);
    v5 = (IDSSocketPairMessage *)objc_claimAutoreleasedReturnValue();

    [(IDSSocketPairMessage *)v5 setContext:self];
    objc_storeStrong((id *)p_underlyingSocketPairMessage, v5);
  }

  return v5;
}

+ (unsigned)_niceToSocketCommand:(int64_t)a3
{
  unsigned __int8 result = 53;
  if (a3 > 180)
  {
    if (a3 <= 194)
    {
      unsigned __int8 v4 = 51;
      if (a3 == 190) {
        char v5 = 35;
      }
      else {
        char v5 = 53;
      }
      if (a3 == 182) {
        unsigned __int8 v6 = 45;
      }
      else {
        unsigned __int8 v6 = v5;
      }
      BOOL v7 = a3 == 181;
LABEL_18:
      if (v7) {
        return v4;
      }
      else {
        return v6;
      }
    }
    else
    {
      switch(a3)
      {
        case 227:
          unsigned __int8 result = 6;
          break;
        case 228:
          unsigned __int8 result = 25;
          break;
        case 229:
          unsigned __int8 result = 26;
          break;
        case 230:
        case 231:
        case 239:
        case 240:
        case 241:
          return result;
        case 232:
          unsigned __int8 result = 8;
          break;
        case 233:
          unsigned __int8 result = 9;
          break;
        case 234:
          unsigned __int8 result = 10;
          break;
        case 235:
          unsigned __int8 result = 11;
          break;
        case 236:
          unsigned __int8 result = 12;
          break;
        case 237:
          unsigned __int8 result = 13;
          break;
        case 238:
          unsigned __int8 result = 41;
          break;
        case 242:
          unsigned __int8 result = 0;
          break;
        case 243:
          unsigned __int8 result = 3;
          break;
        case 244:
          unsigned __int8 result = 7;
          break;
        case 245:
          unsigned __int8 result = 22;
          break;
        default:
          unsigned __int8 v4 = 36;
          if (a3 == 196) {
            unsigned __int8 v6 = 40;
          }
          else {
            unsigned __int8 v6 = 53;
          }
          BOOL v7 = a3 == 195;
          goto LABEL_18;
      }
    }
  }
  else
  {
    switch(a3)
    {
      case 100:
        unsigned __int8 result = 27;
        break;
      case 101:
        unsigned __int8 result = 28;
        break;
      case 102:
        unsigned __int8 result = 29;
        break;
      case 103:
      case 108:
      case 109:
      case 110:
      case 114:
      case 115:
      case 121:
      case 122:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 132:
      case 133:
      case 135:
      case 136:
      case 137:
      case 138:
      case 142:
      case 145:
      case 148:
        return result;
      case 104:
        unsigned __int8 result = 30;
        break;
      case 105:
        unsigned __int8 result = 31;
        break;
      case 106:
        unsigned __int8 result = 32;
        break;
      case 107:
        unsigned __int8 result = 33;
        break;
      case 111:
        unsigned __int8 result = 46;
        break;
      case 112:
        unsigned __int8 result = 47;
        break;
      case 113:
        unsigned __int8 result = 48;
        break;
      case 116:
        unsigned __int8 result = 42;
        break;
      case 117:
        unsigned __int8 result = 43;
        break;
      case 118:
        unsigned __int8 result = 44;
        break;
      case 119:
        unsigned __int8 result = 49;
        break;
      case 120:
        unsigned __int8 result = 38;
        break;
      case 134:
        unsigned __int8 result = 52;
        break;
      case 139:
        unsigned __int8 result = 50;
        break;
      case 140:
        unsigned __int8 result = 14;
        break;
      case 141:
        unsigned __int8 result = 15;
        break;
      case 143:
        unsigned __int8 result = 16;
        break;
      case 144:
        unsigned __int8 result = 17;
        break;
      case 146:
        unsigned __int8 result = 18;
        break;
      case 147:
        unsigned __int8 result = 19;
        break;
      case 149:
        unsigned __int8 result = 20;
        break;
      default:
        if (a3 == 180) {
          unsigned __int8 result = 34;
        }
        else {
          unsigned __int8 result = 53;
        }
        break;
    }
  }
  return result;
}

+ (id)socketPairMessageWithCommand:(int64_t)a3 streamID:(unsigned __int16)a4 sequenceNumber:(unsigned int)a5 messageID:(unsigned int)a6 expectsPeerResponse:(BOOL)a7 wantsAppAck:(BOOL)a8 compressPayload:(BOOL)a9 compressed:(BOOL)a10 didWakeHint:(BOOL)a11 peerResponseIdentifier:(id)a12 messageUUID:(id)a13 payload:(id)a14 protobuf:(id)a15 resourcePath:(id)a16 resourceMetadata:(id)a17 expiryDate:(id)a18
{
  BOOL v33 = a7;
  BOOL v34 = a8;
  unsigned int v36 = a4;
  id v20 = a12;
  id v21 = a13;
  id v22 = a14;
  id v23 = a15;
  id v24 = a16;
  id v25 = a17;
  id v26 = a18;
  unsigned int v27 = [a1 _niceToSocketCommand:a3];
  v28 = 0;
  switch(v27)
  {
    case 0u:
      v29 = (objc_class *)IDSSocketPairDataMessage;
      goto LABEL_45;
    case 3u:
      id v30 = [objc_alloc((Class)IDSSocketPairProtobufMessage) initWithSequenceNumber:a5 streamID:v36 expectsPeerResponse:v33 wantsAppAck:v34 compressed:a10 didWakeHint:a11 peerResponseIdentifier:v20 messageUUID:v21 expiryDate:v26 protobuf:v23];
      goto LABEL_46;
    case 6u:
      v29 = (objc_class *)IDSSocketPairDictionaryMessage;
      goto LABEL_45;
    case 7u:
      id v30 = [objc_alloc((Class)IDSSocketPairAppAckMessage) initWithSequenceNumber:a5 streamID:v36 peerResponseIdentifier:v20];
      goto LABEL_46;
    case 8u:
      v29 = (objc_class *)IDSSocketPairSessionInvitationMessage;
      goto LABEL_45;
    case 9u:
      v29 = (objc_class *)IDSSocketPairSessionAcceptMessage;
      goto LABEL_45;
    case 0xAu:
      v29 = (objc_class *)IDSSocketPairSessionDeclineMessage;
      goto LABEL_45;
    case 0xBu:
      v29 = (objc_class *)IDSSocketPairSessionCancelMessage;
      goto LABEL_45;
    case 0xCu:
      v29 = (objc_class *)IDSSocketPairSessionMessage;
      goto LABEL_45;
    case 0xDu:
      v29 = (objc_class *)IDSSocketPairSessionEndMessage;
      goto LABEL_45;
    case 0xEu:
      v29 = (objc_class *)IDSSocketPairSMSTextMessage;
      goto LABEL_45;
    case 0xFu:
      v29 = (objc_class *)IDSSocketPairSMSTextDownloadMessage;
      goto LABEL_45;
    case 0x10u:
      v29 = (objc_class *)IDSSocketPairSMSOutgoing;
      goto LABEL_45;
    case 0x11u:
      v29 = (objc_class *)IDSSocketPairSMSDownloadOutgoing;
      goto LABEL_45;
    case 0x12u:
      v29 = (objc_class *)IDSSocketPairSMSDeliveryReceipt;
      goto LABEL_45;
    case 0x13u:
      v29 = (objc_class *)IDSSocketPairSMSReadReceipt;
      goto LABEL_45;
    case 0x14u:
      v29 = (objc_class *)IDSSocketPairSMSFailure;
      goto LABEL_45;
    case 0x16u:
      BYTE2(v32) = a11;
      LOWORD(v32) = __PAIR16__(a10, a9);
      id v30 = objc_msgSend(objc_alloc((Class)IDSSocketPairResourceTransferSender), "initWithResourceAtPath:metadata:sequenceNumber:streamID:expectsPeerResponse:wantsAppAck:compressPayload:compressed:didWakeHint:peerResponseIdentifier:messageUUID:expiryDate:", v24, v25, a5, v36, v33, v34, v32, v20, v21, v26);
      goto LABEL_46;
    case 0x19u:
      v29 = (objc_class *)IDSSocketPairProxyOutgoingNiceMessage;
      goto LABEL_45;
    case 0x1Au:
      v29 = (objc_class *)IDSSocketPairProxyIncomingNiceMessage;
      goto LABEL_45;
    case 0x1Bu:
      v29 = (objc_class *)IDSSocketPairTextMessage;
      goto LABEL_45;
    case 0x1Cu:
      v29 = (objc_class *)IDSSocketPairDeliveryReceipt;
      goto LABEL_45;
    case 0x1Du:
      v29 = (objc_class *)IDSSocketPairReadReceipt;
      goto LABEL_45;
    case 0x1Eu:
      v29 = (objc_class *)IDSSocketPairAttachmentMessage;
      goto LABEL_45;
    case 0x1Fu:
      v29 = (objc_class *)IDSSocketPairPlayedReceipt;
      goto LABEL_45;
    case 0x20u:
      v29 = (objc_class *)IDSSocketPairSavedReceipt;
      goto LABEL_45;
    case 0x21u:
      v29 = (objc_class *)IDSSocketPairReflectedDeliveryReceipt;
      goto LABEL_45;
    case 0x22u:
      v29 = (objc_class *)IDSSocketPairGenericCommandMessage;
      goto LABEL_45;
    case 0x23u:
      v29 = (objc_class *)IDSSocketPairGenericGroupMessageCommand;
      goto LABEL_45;
    case 0x24u:
      v29 = (objc_class *)IDSSocketPairLocationShareOfferCommand;
      goto LABEL_45;
    case 0x26u:
      v29 = (objc_class *)IDSSocketPairErrorMessage;
      goto LABEL_45;
    case 0x29u:
      v29 = (objc_class *)IDSSocketPairSessionReinitiateMessage;
      goto LABEL_45;
    case 0x2Au:
      v29 = (objc_class *)IDSSocketPairSyndicationAction;
      goto LABEL_45;
    case 0x2Bu:
      v29 = (objc_class *)IDSSocketPairRetractMessage;
      goto LABEL_45;
    case 0x2Cu:
      v29 = (objc_class *)IDSSocketPairEditMessage;
      goto LABEL_45;
    case 0x2Du:
      v29 = (objc_class *)IDSSocketPairRecoverSyncMessage;
      goto LABEL_45;
    case 0x2Eu:
      v29 = (objc_class *)IDSSocketPairMarkAsUnreadMessage;
      goto LABEL_45;
    case 0x2Fu:
      v29 = (objc_class *)IDSSocketPairDeliveredQuietlyMessage;
      goto LABEL_45;
    case 0x30u:
      v29 = (objc_class *)IDSSocketPairNotifyRecipientMessage;
      goto LABEL_45;
    case 0x31u:
      v29 = (objc_class *)IDSSocketPairRecoverJunkMessage;
      goto LABEL_45;
    case 0x32u:
      v29 = (objc_class *)IDSSocketPairSMSFilteringSettingsMessage;
      goto LABEL_45;
    case 0x33u:
      v29 = (objc_class *)IDSSocketPairDeleteSyncMessage;
      goto LABEL_45;
    case 0x34u:
      v29 = (objc_class *)IDSSocketPairScheduledMessageUpdate;
LABEL_45:
      id v30 = [[v29 alloc] initWithSequenceNumber:a5 streamID:v36 expectsPeerResponse:v33 wantsAppAck:v34 compressed:a10 didWakeHint:a11 peerResponseIdentifier:v20 messageUUID:v21 data:v22 expiryDate:v26];
LABEL_46:
      v28 = v30;
      break;
    default:
      break;
  }

  return v28;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSString)fromID
{
  return self->_fromID;
}

- (void)setFromID:(id)a3
{
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (NSString)awdTopic
{
  return self->_awdTopic;
}

- (void)setAwdTopic:(id)a3
{
}

- (NSNumber)domainHash
{
  return self->_domainHash;
}

- (void)setDomainHash:(id)a3
{
}

- (NSString)toDeviceID
{
  return self->_toDeviceID;
}

- (void)setToDeviceID:(id)a3
{
}

- (NSString)toURI
{
  return self->_toURI;
}

- (void)setToURI:(id)a3
{
}

- (id)fallbackBlock
{
  return self->_fallbackBlock;
}

- (void)setFallbackBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(unsigned int)a3
{
  self->_messageID = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (BOOL)expectsPeerResponse
{
  return self->_expectsPeerResponse;
}

- (void)setExpectsPeerResponse:(BOOL)a3
{
  self->_BOOL expectsPeerResponse = a3;
}

- (BOOL)wantsAppAck
{
  return self->_wantsAppAck;
}

- (void)setWantsAppAck:(BOOL)a3
{
  self->_BOOL wantsAppAck = a3;
}

- (BOOL)nonWaking
{
  return self->_nonWaking;
}

- (void)setNonWaking:(BOOL)a3
{
  self->_nonWaking = a3;
}

- (BOOL)nonCloudWaking
{
  return self->_nonCloudWaking;
}

- (void)setNonCloudWaking:(BOOL)a3
{
  self->_nonCloudWaking = a3;
}

- (BOOL)compressPayload
{
  return self->_compressPayload;
}

- (void)setCompressPayload:(BOOL)a3
{
  self->_BOOL compressPayload = a3;
}

- (BOOL)compressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (BOOL)didWakeHint
{
  return self->_didWakeHint;
}

- (void)setDidWakeHint:(BOOL)a3
{
  self->_didWakeHint = a3;
}

- (NSString)peerResponseIdentifier
{
  return self->_peerResponseIdentifier;
}

- (void)setPeerResponseIdentifier:(id)a3
{
}

- (double)timeEnqueued
{
  return self->_timeEnqueued;
}

- (void)setTimeEnqueued:(double)a3
{
  self->_timeEnqueued = a3;
}

- (double)timeSent
{
  return self->_timeSent;
}

- (void)setTimeSent:(double)a3
{
  self->_timeSent = a3;
}

- (NSNumber)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (BOOL)isDoneSending
{
  return self->_fullyAckd;
}

- (IDSProtobuf)protobuf
{
  return self->_protobuf;
}

- (void)setProtobuf:(id)a3
{
}

- (unint64_t)sentMessageDataSize
{
  return self->_sentMessageDataSize;
}

- (void)setSentMessageDataSize:(unint64_t)a3
{
  self->_sentMessageDataSize = a3;
}

- (BOOL)didFallback
{
  return self->_didFallback;
}

- (void)setDidFallback:(BOOL)a3
{
  self->_didFallback = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSString)queueOneIdentifier
{
  return self->_queueOneIdentifier;
}

- (void)setQueueOneIdentifier:(id)a3
{
}

- (BOOL)requireBluetooth
{
  return self->_requireBluetooth;
}

- (void)setRequireBluetooth:(BOOL)a3
{
  self->_requireBluetooth = a3;
}

- (BOOL)requireLocalWiFi
{
  return self->_requireLocalWiFi;
}

- (void)setRequireLocalWiFi:(BOOL)a3
{
  self->_requireLocalWiFi = a3;
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (void)setResourcePath:(id)a3
{
}

- (NSDictionary)resourceMetadata
{
  return self->_resourceMetadata;
}

- (void)setResourceMetadata:(id)a3
{
}

- (BOOL)manualQueueRemoval
{
  return self->_manualQueueRemoval;
}

- (void)setManualQueueRemoval:(BOOL)a3
{
  self->_manualQueueRemoval = a3;
}

- (BOOL)deniedToSend
{
  return self->_deniedToSend;
}

- (void)setDeniedToSend:(BOOL)a3
{
  self->_deniedToSend = a3;
}

- (BOOL)shouldEnforceRemoteTimeout
{
  return self->_shouldEnforceRemoteTimeout;
}

- (void)setShouldEnforceRemoteTimeout:(BOOL)a3
{
  self->_shouldEnforceRemoteTimeout = a3;
}

- (unsigned)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setDataProtectionClass:(unsigned int)a3
{
  self->_dataProtectionClass = a3;
}

- (NSArray)duetIdentifiersOverride
{
  return self->_duetIdentifiersOverride;
}

- (void)setDuetIdentifiersOverride:(id)a3
{
}

- (BOOL)bypassDuet
{
  return self->_bypassDuet;
}

- (void)setBypassDuet:(BOOL)a3
{
  self->_bypassDuet = a3;
}

- (unint64_t)minCompatibilityVersion
{
  return self->_minCompatibilityVersion;
}

- (void)setMinCompatibilityVersion:(unint64_t)a3
{
  self->_minCompatibilityVersion = a3;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int64_t)a3
{
  self->_messageType = a3;
}

- (IDSSocketPairMessage)underlyingSocketPairMessage
{
  return self->_underlyingSocketPairMessage;
}

- (void)setUnderlyingSocketPairMessage:(id)a3
{
}

- (int64_t)messageState
{
  return self->_messageState;
}

- (NSString)messageUUID
{
  return self->_messageUUID;
}

- (void)setMessageUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duetIdentifiersOverride, 0);
  objc_storeStrong((id *)&self->_resourceMetadata, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_protobuf, 0);
  objc_storeStrong((id *)&self->_underlyingSocketPairMessage, 0);
  objc_storeStrong((id *)&self->_queueOneIdentifier, 0);
  objc_storeStrong((id *)&self->_peerResponseIdentifier, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong(&self->_fallbackBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_toURI, 0);
  objc_storeStrong((id *)&self->_toDeviceID, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_domainHash, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_awdTopic, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_fromID, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

@end