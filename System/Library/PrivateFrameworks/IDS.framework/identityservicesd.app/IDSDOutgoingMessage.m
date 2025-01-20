@interface IDSDOutgoingMessage
- (BOOL)alwaysIncludeSelf;
- (BOOL)alwaysSkipSelf;
- (BOOL)bypassDuet;
- (BOOL)canCombineWithMessage:(id)a3;
- (BOOL)compressPayload;
- (BOOL)encryptPayload;
- (BOOL)enforceRemoteTimeouts;
- (BOOL)expectsPeerResponse;
- (BOOL)fireAndForget;
- (BOOL)forcedLocal;
- (BOOL)ignoreMaxRetryCount;
- (BOOL)liveMessageDelivery;
- (BOOL)nonCloudWaking;
- (BOOL)nonWaking;
- (BOOL)requireBluetooth;
- (BOOL)requireLocalWiFi;
- (BOOL)sent;
- (BOOL)useDictAsTopLevel;
- (BOOL)wantsAppAck;
- (BOOL)wantsCertifiedDelivery;
- (BOOL)wantsDeliveryStatus;
- (BOOL)wantsFirewallDonation;
- (BOOL)wantsProgress;
- (BOOL)wantsResponse;
- (IDSDOutgoingMessage)initWithMessage:(id)a3 data:(id)a4 protobuf:(id)a5 fromID:(id)a6 toDestinations:(id)a7 accountGUID:(id)a8 useDictAsTopLevel:(BOOL)a9 dataToEncrypt:(id)a10 encryptPayload:(BOOL)a11 compressPayload:(BOOL)a12 wantsResponse:(BOOL)a13 expirationDate:(id)a14 enforceRemoteTimeouts:(BOOL)a15 command:(id)a16 wantsDeliveryStatus:(BOOL)a17 deliveryStatusContext:(id)a18 messageUUID:(id)a19 priority:(int64_t)a20 guid:(id)a21 alternateGUID:(id)a22 identifier:(id)a23 forcedLocal:(BOOL)a24 peerResponseIdentifier:(id)a25 expectsPeerResponse:(BOOL)a26 wantsAppAck:(BOOL)a27 fireAndForget:(BOOL)a28 nonWaking:(BOOL)a29 nonCloudWaking:(BOOL)a30 storedSize:(id)a31 duetIdentifiersOverride:(id)a32 bypassDuet:(BOOL)a33 mainAccountGuid:(id)a34 localDestinationDeviceUUID:(id)a35 enqueuedDate:(id)a36 messageType:(id)a37 alwaysSkipSelf:(BOOL)a38 alwaysIncludeSelf:(BOOL)a39 pushPriority:(id)a40 queueOneIdentifier:(id)a41 liveMessageDelivery:(BOOL)a42 requireBluetooth:(BOOL)a43 requireLocalWiFi:(BOOL)a44 sent:(BOOL)a45 wantsProgress:(BOOL)a46 ignoreMaxRetryCount:(BOOL)a47 wantsCertifiedDelivery:(BOOL)a48 originalTimestamp:(id)a49 ktUriVerificationMap:(id)a50 wantsFirewallDonation:(BOOL)a51 sendMode:(id)a52 deliveryMinimumTimeDelay:(id)a53 deliveryMinimumTime:(id)a54;
- (IDSDestination)destinations;
- (NSArray)combinedMessages;
- (NSArray)duetIdentifiersOverride;
- (NSData)data;
- (NSData)dataToEncrypt;
- (NSData)messageUUID;
- (NSDate)enqueuedDate;
- (NSDate)expirationDate;
- (NSDictionary)deliveryStatusContext;
- (NSDictionary)ktUriVerificationMap;
- (NSDictionary)message;
- (NSDictionary)protobuf;
- (NSNumber)command;
- (NSNumber)deliveryMinimumTime;
- (NSNumber)deliveryMinimumTimeDelay;
- (NSNumber)messageType;
- (NSNumber)originalTimestamp;
- (NSNumber)pushPriority;
- (NSNumber)sendMode;
- (NSNumber)storedSize;
- (NSString)accountGUID;
- (NSString)alternateGUID;
- (NSString)fromID;
- (NSString)guid;
- (NSString)identifier;
- (NSString)localDestinationDeviceUUID;
- (NSString)mainAccountGuid;
- (NSString)peerResponseIdentifier;
- (NSString)queueOneIdentifier;
- (id)copySendParameters;
- (int64_t)priority;
- (void)combineWithMessage:(id)a3;
- (void)setAccountGUID:(id)a3;
- (void)setAlternateGUID:(id)a3;
- (void)setAlwaysIncludeSelf:(BOOL)a3;
- (void)setAlwaysSkipSelf:(BOOL)a3;
- (void)setBypassDuet:(BOOL)a3;
- (void)setCommand:(id)a3;
- (void)setCompressPayload:(BOOL)a3;
- (void)setData:(id)a3;
- (void)setDataToEncrypt:(id)a3;
- (void)setDeliveryMinimumTime:(id)a3;
- (void)setDeliveryMinimumTimeDelay:(id)a3;
- (void)setDeliveryStatusContext:(id)a3;
- (void)setDestinations:(id)a3;
- (void)setDuetIdentifiersOverride:(id)a3;
- (void)setEncryptPayload:(BOOL)a3;
- (void)setEnforceRemoteTimeouts:(BOOL)a3;
- (void)setEnqueuedDate:(id)a3;
- (void)setExpectsPeerResponse:(BOOL)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFireAndForget:(BOOL)a3;
- (void)setForcedLocal:(BOOL)a3;
- (void)setFromID:(id)a3;
- (void)setGuid:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIgnoreMaxRetryCount:(BOOL)a3;
- (void)setKtUriVerificationMap:(id)a3;
- (void)setLiveMessageDelivery:(BOOL)a3;
- (void)setLocalDestinationDeviceUUID:(id)a3;
- (void)setMainAccountGuid:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageType:(id)a3;
- (void)setMessageUUID:(id)a3;
- (void)setNonCloudWaking:(BOOL)a3;
- (void)setNonWaking:(BOOL)a3;
- (void)setOriginalTimestamp:(id)a3;
- (void)setPeerResponseIdentifier:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setProtobuf:(id)a3;
- (void)setPushPriority:(id)a3;
- (void)setQueueOneIdentifier:(id)a3;
- (void)setRequireBluetooth:(BOOL)a3;
- (void)setRequireLocalWiFi:(BOOL)a3;
- (void)setSendMode:(id)a3;
- (void)setSent:(BOOL)a3;
- (void)setStoredSize:(id)a3;
- (void)setUseDictAsTopLevel:(BOOL)a3;
- (void)setWantsAppAck:(BOOL)a3;
- (void)setWantsCertifiedDelivery:(BOOL)a3;
- (void)setWantsDeliveryStatus:(BOOL)a3;
- (void)setWantsFirewallDonation:(BOOL)a3;
- (void)setWantsProgress:(BOOL)a3;
- (void)setWantsResponse:(BOOL)a3;
@end

@implementation IDSDOutgoingMessage

- (IDSDOutgoingMessage)initWithMessage:(id)a3 data:(id)a4 protobuf:(id)a5 fromID:(id)a6 toDestinations:(id)a7 accountGUID:(id)a8 useDictAsTopLevel:(BOOL)a9 dataToEncrypt:(id)a10 encryptPayload:(BOOL)a11 compressPayload:(BOOL)a12 wantsResponse:(BOOL)a13 expirationDate:(id)a14 enforceRemoteTimeouts:(BOOL)a15 command:(id)a16 wantsDeliveryStatus:(BOOL)a17 deliveryStatusContext:(id)a18 messageUUID:(id)a19 priority:(int64_t)a20 guid:(id)a21 alternateGUID:(id)a22 identifier:(id)a23 forcedLocal:(BOOL)a24 peerResponseIdentifier:(id)a25 expectsPeerResponse:(BOOL)a26 wantsAppAck:(BOOL)a27 fireAndForget:(BOOL)a28 nonWaking:(BOOL)a29 nonCloudWaking:(BOOL)a30 storedSize:(id)a31 duetIdentifiersOverride:(id)a32 bypassDuet:(BOOL)a33 mainAccountGuid:(id)a34 localDestinationDeviceUUID:(id)a35 enqueuedDate:(id)a36 messageType:(id)a37 alwaysSkipSelf:(BOOL)a38 alwaysIncludeSelf:(BOOL)a39 pushPriority:(id)a40 queueOneIdentifier:(id)a41 liveMessageDelivery:(BOOL)a42 requireBluetooth:(BOOL)a43 requireLocalWiFi:(BOOL)a44 sent:(BOOL)a45 wantsProgress:(BOOL)a46 ignoreMaxRetryCount:(BOOL)a47 wantsCertifiedDelivery:(BOOL)a48 originalTimestamp:(id)a49 ktUriVerificationMap:(id)a50 wantsFirewallDonation:(BOOL)a51 sendMode:(id)a52 deliveryMinimumTimeDelay:(id)a53 deliveryMinimumTime:(id)a54
{
  id v90 = a3;
  id v89 = a4;
  id v88 = a5;
  id v87 = a6;
  id v86 = a7;
  id v85 = a8;
  id v59 = a10;
  id v60 = a14;
  id v61 = a16;
  id v62 = a18;
  id v63 = a19;
  id v64 = a21;
  id v65 = a22;
  id v66 = a23;
  id v67 = a25;
  id v84 = a31;
  id v83 = a32;
  id v82 = a34;
  id v81 = a35;
  id v80 = a36;
  id v79 = a37;
  id v78 = a40;
  id v77 = a41;
  id v76 = a49;
  id v75 = a50;
  id v74 = a52;
  id v73 = a53;
  id v72 = a54;
  v91.receiver = self;
  v91.super_class = (Class)IDSDOutgoingMessage;
  v68 = [(IDSDOutgoingMessage *)&v91 init];
  v69 = v68;
  if (v68)
  {
    [(IDSDOutgoingMessage *)v68 setMessage:v90];
    [(IDSDOutgoingMessage *)v69 setData:v89];
    [(IDSDOutgoingMessage *)v69 setProtobuf:v88];
    [(IDSDOutgoingMessage *)v69 setFromID:v87];
    [(IDSDOutgoingMessage *)v69 setDestinations:v86];
    [(IDSDOutgoingMessage *)v69 setAccountGUID:v85];
    [(IDSDOutgoingMessage *)v69 setUseDictAsTopLevel:a9];
    [(IDSDOutgoingMessage *)v69 setDataToEncrypt:v59];
    [(IDSDOutgoingMessage *)v69 setEncryptPayload:a11];
    [(IDSDOutgoingMessage *)v69 setCompressPayload:a12];
    [(IDSDOutgoingMessage *)v69 setWantsResponse:a13];
    [(IDSDOutgoingMessage *)v69 setExpirationDate:v60];
    [(IDSDOutgoingMessage *)v69 setEnforceRemoteTimeouts:a15];
    [(IDSDOutgoingMessage *)v69 setCommand:v61];
    [(IDSDOutgoingMessage *)v69 setWantsDeliveryStatus:a17];
    [(IDSDOutgoingMessage *)v69 setDeliveryStatusContext:v62];
    [(IDSDOutgoingMessage *)v69 setMessageUUID:v63];
    [(IDSDOutgoingMessage *)v69 setPriority:a20];
    [(IDSDOutgoingMessage *)v69 setGuid:v64];
    [(IDSDOutgoingMessage *)v69 setAlternateGUID:v65];
    [(IDSDOutgoingMessage *)v69 setIdentifier:v66];
    [(IDSDOutgoingMessage *)v69 setForcedLocal:a24];
    [(IDSDOutgoingMessage *)v69 setPeerResponseIdentifier:v67];
    [(IDSDOutgoingMessage *)v69 setExpectsPeerResponse:a26];
    [(IDSDOutgoingMessage *)v69 setWantsAppAck:a27];
    [(IDSDOutgoingMessage *)v69 setFireAndForget:a28];
    [(IDSDOutgoingMessage *)v69 setNonWaking:a29];
    [(IDSDOutgoingMessage *)v69 setNonCloudWaking:a30];
    [(IDSDOutgoingMessage *)v69 setStoredSize:v84];
    [(IDSDOutgoingMessage *)v69 setDuetIdentifiersOverride:v83];
    [(IDSDOutgoingMessage *)v69 setBypassDuet:a33];
    [(IDSDOutgoingMessage *)v69 setQueueOneIdentifier:v77];
    [(IDSDOutgoingMessage *)v69 setMainAccountGuid:v82];
    [(IDSDOutgoingMessage *)v69 setLocalDestinationDeviceUUID:v81];
    [(IDSDOutgoingMessage *)v69 setEnqueuedDate:v80];
    [(IDSDOutgoingMessage *)v69 setMessageType:v79];
    [(IDSDOutgoingMessage *)v69 setAlwaysSkipSelf:a38];
    [(IDSDOutgoingMessage *)v69 setAlwaysIncludeSelf:a39];
    [(IDSDOutgoingMessage *)v69 setPushPriority:v78];
    [(IDSDOutgoingMessage *)v69 setLiveMessageDelivery:a42];
    [(IDSDOutgoingMessage *)v69 setRequireBluetooth:a43];
    [(IDSDOutgoingMessage *)v69 setRequireLocalWiFi:a44];
    [(IDSDOutgoingMessage *)v69 setSent:a45];
    [(IDSDOutgoingMessage *)v69 setWantsProgress:a46];
    [(IDSDOutgoingMessage *)v69 setIgnoreMaxRetryCount:a47];
    [(IDSDOutgoingMessage *)v69 setWantsCertifiedDelivery:a48];
    [(IDSDOutgoingMessage *)v69 setOriginalTimestamp:v76];
    [(IDSDOutgoingMessage *)v69 setKtUriVerificationMap:v75];
    [(IDSDOutgoingMessage *)v69 setWantsFirewallDonation:a51];
    [(IDSDOutgoingMessage *)v69 setSendMode:v74];
    [(IDSDOutgoingMessage *)v69 setDeliveryMinimumTimeDelay:v73];
    [(IDSDOutgoingMessage *)v69 setDeliveryMinimumTime:v72];
  }

  return v69;
}

- (BOOL)canCombineWithMessage:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_18;
  }
  v6 = [v4 dataToEncrypt];
  if (v6
    || ([v5 encryptPayload] & 1) != 0
    || ([v5 useDictAsTopLevel] & 1) != 0)
  {
    goto LABEL_12;
  }
  uint64_t v7 = [v5 deliveryStatusContext];
  if (!v7)
  {
    v6 = [(IDSDOutgoingMessage *)self dataToEncrypt];
    if (v6) {
      goto LABEL_12;
    }
    if ([(IDSDOutgoingMessage *)self encryptPayload]) {
      goto LABEL_12;
    }
    if ([(IDSDOutgoingMessage *)self useDictAsTopLevel]) {
      goto LABEL_12;
    }
    v6 = [(IDSDOutgoingMessage *)self deliveryStatusContext];
    if (v6 || [(IDSDOutgoingMessage *)self expectsPeerResponse]) {
      goto LABEL_12;
    }
    uint64_t v7 = [(IDSDOutgoingMessage *)self peerResponseIdentifier];
    if (!v7)
    {
      uint64_t v7 = [(IDSDOutgoingMessage *)self protobuf];
      if (!v7)
      {
        v9 = self;
        uint64_t v7 = [(IDSDOutgoingMessage *)self data];
        if (!v7)
        {
          v10 = [(IDSDOutgoingMessage *)self queueOneIdentifier];

          if (!v10)
          {
            v6 = [(IDSDOutgoingMessage *)self fromID];
            v12 = [v5 fromID];
            if ([v6 isEqual:v12])
            {
              v13 = [(IDSDOutgoingMessage *)v9 destinations];
              v14 = [v5 destinations];
              if ([v13 isEqual:v14])
              {
                v15 = [(IDSDOutgoingMessage *)v9 accountGUID];
                v16 = [v5 accountGUID];
                if ([v15 isEqual:v16]
                  && (unsigned int v17 = [(IDSDOutgoingMessage *)v9 wantsResponse],
                      v17 == [v5 wantsResponse]))
                {
                  v18 = [(IDSDOutgoingMessage *)v9 command];
                  v19 = [v5 command];
                  v31 = v18;
                  if ([v18 isEqual:v19])
                  {
                    v30 = [(IDSDOutgoingMessage *)v9 command];
                    if ([v30 integerValue] == (id)227
                      && (unsigned int v20 = [(IDSDOutgoingMessage *)v9 wantsDeliveryStatus],
                          v20 == [v5 wantsDeliveryStatus])
                      && (unsigned int v21 = [(IDSDOutgoingMessage *)v9 wantsCertifiedDelivery],
                          v21 == [v5 wantsCertifiedDelivery]))
                    {
                      v22 = [(IDSDOutgoingMessage *)v9 originalTimestamp];
                      v28 = [v5 originalTimestamp];
                      v29 = v22;
                      BOOL v8 = objc_msgSend(v22, "isEqual:")
                        && (unsigned int v23 = [(IDSDOutgoingMessage *)v9 wantsAppAck],
                            v23 == [v5 wantsAppAck])
                        && (unsigned int v24 = [(IDSDOutgoingMessage *)v9 fireAndForget],
                            v24 == [v5 fireAndForget])
                        && (unsigned int v25 = [(IDSDOutgoingMessage *)v9 nonWaking],
                            v25 == [v5 nonWaking])
                        && (unsigned int v26 = [(IDSDOutgoingMessage *)v9 nonCloudWaking],
                            v26 == [v5 nonCloudWaking])
                        && (id v27 = -[IDSDOutgoingMessage priority](v9, "priority"), v27 == [v5 priority])
                        && (id)[(IDSDOutgoingMessage *)v9 priority] != (id)300;
                    }
                    else
                    {
                      BOOL v8 = 0;
                    }
                  }
                  else
                  {
                    BOOL v8 = 0;
                  }
                }
                else
                {
                  BOOL v8 = 0;
                }
              }
              else
              {
                BOOL v8 = 0;
              }
            }
            else
            {
              BOOL v8 = 0;
            }

            goto LABEL_13;
          }
LABEL_18:
          BOOL v8 = 0;
          goto LABEL_19;
        }
      }
    }
  }
  v6 = (void *)v7;
LABEL_12:
  BOOL v8 = 0;
LABEL_13:

LABEL_19:
  return v8;
}

- (void)combineWithMessage:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v8)
  {
    combinedMessages = v4->_combinedMessages;
    if (!combinedMessages)
    {
      v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      uint64_t v7 = v4->_combinedMessages;
      v4->_combinedMessages = v6;

      combinedMessages = v4->_combinedMessages;
    }
    [(NSMutableArray *)combinedMessages addObject:v8];
  }
  objc_sync_exit(v4);
}

- (id)copySendParameters
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc_init((Class)IDSSendParameters);
  id v4 = [(IDSDOutgoingMessage *)v2 message];
  [v3 setMessage:v4];

  v5 = [(IDSDOutgoingMessage *)v2 data];
  [v3 setData:v5];

  v6 = [(IDSDOutgoingMessage *)v2 protobuf];
  [v3 setProtobuf:v6];

  uint64_t v7 = [(IDSDOutgoingMessage *)v2 accountGUID];
  [v3 setAccountUUID:v7];

  id v8 = [(IDSDOutgoingMessage *)v2 destinations];
  [v3 setDestinations:v8];

  v9 = [(IDSDOutgoingMessage *)v2 expirationDate];

  if (v9)
  {
    v10 = [(IDSDOutgoingMessage *)v2 expirationDate];
    [v10 timeIntervalSinceNow];
    objc_msgSend(v3, "setTimeout:");
  }
  objc_msgSend(v3, "setEnforceRemoteTimeouts:", -[IDSDOutgoingMessage enforceRemoteTimeouts](v2, "enforceRemoteTimeouts"));
  objc_msgSend(v3, "setEncryptPayload:", -[IDSDOutgoingMessage encryptPayload](v2, "encryptPayload"));
  objc_msgSend(v3, "setCompressPayload:", -[IDSDOutgoingMessage compressPayload](v2, "compressPayload"));
  objc_msgSend(v3, "setPriority:", -[IDSDOutgoingMessage priority](v2, "priority"));
  objc_msgSend(v3, "setLocalDelivery:", -[IDSDOutgoingMessage forcedLocal](v2, "forcedLocal"));
  v11 = [(IDSDOutgoingMessage *)v2 identifier];
  [v3 setIdentifier:v11];

  v12 = [(IDSDOutgoingMessage *)v2 alternateGUID];
  [v3 setAlternateCallbackID:v12];

  objc_msgSend(v3, "setExpectsPeerResponse:", -[IDSDOutgoingMessage expectsPeerResponse](v2, "expectsPeerResponse"));
  v13 = [(IDSDOutgoingMessage *)v2 peerResponseIdentifier];
  [v3 setPeerResponseIdentifier:v13];

  v14 = [(IDSDOutgoingMessage *)v2 fromID];
  [v3 setFromID:v14];

  objc_msgSend(v3, "setUseDictAsTopLevel:", -[IDSDOutgoingMessage useDictAsTopLevel](v2, "useDictAsTopLevel"));
  objc_msgSend(v3, "setWantsResponse:", -[IDSDOutgoingMessage wantsResponse](v2, "wantsResponse"));
  v15 = [(IDSDOutgoingMessage *)v2 dataToEncrypt];
  [v3 setDataToEncrypt:v15];

  v16 = [(IDSDOutgoingMessage *)v2 messageUUID];
  [v3 setMessageUUID:v16];

  unsigned int v17 = [(IDSDOutgoingMessage *)v2 command];
  [v3 setCommand:v17];

  objc_msgSend(v3, "setWantsDeliveryStatus:", -[IDSDOutgoingMessage wantsDeliveryStatus](v2, "wantsDeliveryStatus"));
  v18 = [(IDSDOutgoingMessage *)v2 deliveryStatusContext];
  [v3 setDeliveryStatusContext:v18];

  objc_msgSend(v3, "setWantsAppAck:", -[IDSDOutgoingMessage wantsAppAck](v2, "wantsAppAck"));
  objc_msgSend(v3, "setNonWaking:", -[IDSDOutgoingMessage nonWaking](v2, "nonWaking"));
  objc_msgSend(v3, "setNonCloudWaking:", -[IDSDOutgoingMessage nonCloudWaking](v2, "nonCloudWaking"));
  objc_msgSend(v3, "setFireAndForget:", -[IDSDOutgoingMessage fireAndForget](v2, "fireAndForget"));
  v19 = [(IDSDOutgoingMessage *)v2 duetIdentifiersOverride];
  [v3 setDuetIdentifiersOverride:v19];

  objc_msgSend(v3, "setBypassDuet:", -[IDSDOutgoingMessage bypassDuet](v2, "bypassDuet"));
  unsigned int v20 = [(IDSDOutgoingMessage *)v2 queueOneIdentifier];
  [v3 setQueueOneIdentifier:v20];

  unsigned int v21 = [(IDSDOutgoingMessage *)v2 mainAccountGuid];
  [v3 setMainAccountUUID:v21];

  v22 = [(IDSDOutgoingMessage *)v2 localDestinationDeviceUUID];
  [v3 setLocalDestinationDeviceUUID:v22];

  unsigned int v23 = [(IDSDOutgoingMessage *)v2 messageType];
  [v3 setMessageType:v23];

  objc_msgSend(v3, "setWantsProgress:", -[IDSDOutgoingMessage wantsProgress](v2, "wantsProgress"));
  objc_msgSend(v3, "setAlwaysSkipSelf:", -[IDSDOutgoingMessage alwaysSkipSelf](v2, "alwaysSkipSelf"));
  objc_msgSend(v3, "setAlwaysIncludeSelf:", -[IDSDOutgoingMessage alwaysIncludeSelf](v2, "alwaysIncludeSelf"));
  unsigned int v24 = [(IDSDOutgoingMessage *)v2 pushPriority];
  [v3 setPushPriority:v24];

  objc_msgSend(v3, "setLiveMessageDelivery:", -[IDSDOutgoingMessage liveMessageDelivery](v2, "liveMessageDelivery"));
  objc_msgSend(v3, "setRequireBluetooth:", -[IDSDOutgoingMessage requireBluetooth](v2, "requireBluetooth"));
  objc_msgSend(v3, "setRequireLocalWiFi:", -[IDSDOutgoingMessage requireLocalWiFi](v2, "requireLocalWiFi"));
  objc_msgSend(v3, "setIgnoreMaxRetryCount:", -[IDSDOutgoingMessage ignoreMaxRetryCount](v2, "ignoreMaxRetryCount"));
  objc_msgSend(v3, "setWantsCertifiedDelivery:", -[IDSDOutgoingMessage wantsCertifiedDelivery](v2, "wantsCertifiedDelivery"));
  unsigned int v25 = [(IDSDOutgoingMessage *)v2 originalTimestamp];
  [v3 setOriginalTimestamp:v25];

  unsigned int v26 = [(IDSDOutgoingMessage *)v2 ktUriVerificationMap];
  [v3 setKeyTransparencyURIVerificationMap:v26];

  id v27 = [(IDSDOutgoingMessage *)v2 sendMode];
  [v3 setSendMode:v27];

  v28 = [(IDSDOutgoingMessage *)v2 deliveryMinimumTimeDelay];
  [v3 setDeliveryMinimumTimeDelay:v28];

  v29 = [(IDSDOutgoingMessage *)v2 deliveryMinimumTime];
  [v3 setDeliveryMinimumTime:v29];

  objc_msgSend(v3, "setWantsFirewallDonation:", -[IDSDOutgoingMessage wantsFirewallDonation](v2, "wantsFirewallDonation"));
  objc_sync_exit(v2);

  return v3;
}

- (NSDictionary)message
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMessage:(id)a3
{
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setData:(id)a3
{
}

- (NSDictionary)protobuf
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProtobuf:(id)a3
{
}

- (NSString)fromID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFromID:(id)a3
{
}

- (IDSDestination)destinations
{
  return (IDSDestination *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDestinations:(id)a3
{
}

- (NSString)accountGUID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAccountGUID:(id)a3
{
}

- (BOOL)useDictAsTopLevel
{
  return self->_useDictAsTopLevel;
}

- (void)setUseDictAsTopLevel:(BOOL)a3
{
  self->_useDictAsTopLevel = a3;
}

- (NSData)dataToEncrypt
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDataToEncrypt:(id)a3
{
}

- (BOOL)encryptPayload
{
  return self->_encryptPayload;
}

- (void)setEncryptPayload:(BOOL)a3
{
  self->_encryptPayload = a3;
}

- (BOOL)compressPayload
{
  return self->_compressPayload;
}

- (void)setCompressPayload:(BOOL)a3
{
  self->_compressPayload = a3;
}

- (BOOL)wantsResponse
{
  return self->_wantsResponse;
}

- (void)setWantsResponse:(BOOL)a3
{
  self->_wantsResponse = a3;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExpirationDate:(id)a3
{
}

- (NSNumber)command
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCommand:(id)a3
{
}

- (BOOL)wantsDeliveryStatus
{
  return self->_wantsDeliveryStatus;
}

- (void)setWantsDeliveryStatus:(BOOL)a3
{
  self->_wantsDeliveryStatus = a3;
}

- (NSDictionary)deliveryStatusContext
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDeliveryStatusContext:(id)a3
{
}

- (NSData)messageUUID
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setMessageUUID:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (NSString)guid
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setGuid:(id)a3
{
}

- (NSString)alternateGUID
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAlternateGUID:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)forcedLocal
{
  return self->_forcedLocal;
}

- (void)setForcedLocal:(BOOL)a3
{
  self->_forcedLocal = a3;
}

- (NSString)peerResponseIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPeerResponseIdentifier:(id)a3
{
}

- (BOOL)expectsPeerResponse
{
  return self->_expectsPeerResponse;
}

- (void)setExpectsPeerResponse:(BOOL)a3
{
  self->_expectsPeerResponse = a3;
}

- (BOOL)wantsAppAck
{
  return self->_wantsAppAck;
}

- (void)setWantsAppAck:(BOOL)a3
{
  self->_wantsAppAck = a3;
}

- (BOOL)fireAndForget
{
  return self->_fireAndForget;
}

- (void)setFireAndForget:(BOOL)a3
{
  self->_fireAndForget = a3;
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

- (NSNumber)storedSize
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setStoredSize:(id)a3
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

- (NSArray)duetIdentifiersOverride
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDuetIdentifiersOverride:(id)a3
{
}

- (NSString)queueOneIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setQueueOneIdentifier:(id)a3
{
}

- (BOOL)enforceRemoteTimeouts
{
  return self->_enforceRemoteTimeouts;
}

- (void)setEnforceRemoteTimeouts:(BOOL)a3
{
  self->_enforceRemoteTimeouts = a3;
}

- (NSString)mainAccountGuid
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setMainAccountGuid:(id)a3
{
}

- (NSString)localDestinationDeviceUUID
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setLocalDestinationDeviceUUID:(id)a3
{
}

- (NSDate)enqueuedDate
{
  return (NSDate *)objc_getProperty(self, a2, 232, 1);
}

- (void)setEnqueuedDate:(id)a3
{
}

- (NSNumber)messageType
{
  return (NSNumber *)objc_getProperty(self, a2, 240, 1);
}

- (void)setMessageType:(id)a3
{
}

- (BOOL)alwaysSkipSelf
{
  return self->_alwaysSkipSelf;
}

- (void)setAlwaysSkipSelf:(BOOL)a3
{
  self->_alwaysSkipSelf = a3;
}

- (BOOL)alwaysIncludeSelf
{
  return self->_alwaysIncludeSelf;
}

- (void)setAlwaysIncludeSelf:(BOOL)a3
{
  self->_alwaysIncludeSelf = a3;
}

- (NSNumber)pushPriority
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setPushPriority:(id)a3
{
}

- (BOOL)liveMessageDelivery
{
  return self->_liveMessageDelivery;
}

- (void)setLiveMessageDelivery:(BOOL)a3
{
  self->_liveMessageDelivery = a3;
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

- (BOOL)sent
{
  return self->_sent;
}

- (void)setSent:(BOOL)a3
{
  self->_sent = a3;
}

- (BOOL)wantsProgress
{
  return self->_wantsProgress;
}

- (void)setWantsProgress:(BOOL)a3
{
  self->_wantsProgress = a3;
}

- (BOOL)ignoreMaxRetryCount
{
  return self->_ignoreMaxRetryCount;
}

- (void)setIgnoreMaxRetryCount:(BOOL)a3
{
  self->_ignoreMaxRetryCount = a3;
}

- (BOOL)wantsCertifiedDelivery
{
  return self->_wantsCertifiedDelivery;
}

- (void)setWantsCertifiedDelivery:(BOOL)a3
{
  self->_wantsCertifiedDelivery = a3;
}

- (NSNumber)originalTimestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setOriginalTimestamp:(id)a3
{
}

- (BOOL)wantsFirewallDonation
{
  return self->_wantsFirewallDonation;
}

- (void)setWantsFirewallDonation:(BOOL)a3
{
  self->_wantsFirewallDonation = a3;
}

- (NSArray)combinedMessages
{
  return (NSArray *)objc_getProperty(self, a2, 248, 1);
}

- (NSDictionary)ktUriVerificationMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 272, 1);
}

- (void)setKtUriVerificationMap:(id)a3
{
}

- (NSNumber)sendMode
{
  return (NSNumber *)objc_getProperty(self, a2, 280, 1);
}

- (void)setSendMode:(id)a3
{
}

- (NSNumber)deliveryMinimumTimeDelay
{
  return (NSNumber *)objc_getProperty(self, a2, 288, 1);
}

- (void)setDeliveryMinimumTimeDelay:(id)a3
{
}

- (NSNumber)deliveryMinimumTime
{
  return (NSNumber *)objc_getProperty(self, a2, 296, 1);
}

- (void)setDeliveryMinimumTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryMinimumTime, 0);
  objc_storeStrong((id *)&self->_deliveryMinimumTimeDelay, 0);
  objc_storeStrong((id *)&self->_sendMode, 0);
  objc_storeStrong((id *)&self->_ktUriVerificationMap, 0);
  objc_storeStrong((id *)&self->_pushPriority, 0);
  objc_storeStrong((id *)&self->_combinedMessages, 0);
  objc_storeStrong((id *)&self->_messageType, 0);
  objc_storeStrong((id *)&self->_enqueuedDate, 0);
  objc_storeStrong((id *)&self->_localDestinationDeviceUUID, 0);
  objc_storeStrong((id *)&self->_mainAccountGuid, 0);
  objc_storeStrong((id *)&self->_originalTimestamp, 0);
  objc_storeStrong((id *)&self->_storedSize, 0);
  objc_storeStrong((id *)&self->_duetIdentifiersOverride, 0);
  objc_storeStrong((id *)&self->_peerResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_queueOneIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_alternateGUID, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_deliveryStatusContext, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_dataToEncrypt, 0);
  objc_storeStrong((id *)&self->_accountGUID, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_fromID, 0);
  objc_storeStrong((id *)&self->_protobuf, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end