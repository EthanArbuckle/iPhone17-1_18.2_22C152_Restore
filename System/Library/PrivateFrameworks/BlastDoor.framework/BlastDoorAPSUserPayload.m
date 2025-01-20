@interface BlastDoorAPSUserPayload
- (BOOL)deliveryStatus;
- (BOOL)expectsPeerResponse;
- (BOOL)fanoutLastChunk;
- (BOOL)generateDeliveryReceipt;
- (BOOL)groupMessage;
- (BOOL)has_MMCSExpiryNanos;
- (BOOL)has_MMCSFileLength;
- (BOOL)has_allocateInfoAttribute;
- (BOOL)has_allocationEpochTimeMillis;
- (BOOL)has_allocationStatus;
- (BOOL)has_allowGDR;
- (BOOL)has_attachmentSize;
- (BOOL)has_certifiedDeliveryVersion;
- (BOOL)has_commandContext;
- (BOOL)has_contentVersion;
- (BOOL)has_conversationId;
- (BOOL)has_dateExpirationSeconds;
- (BOOL)has_deliveryStatus;
- (BOOL)has_deliveryStatusFlags;
- (BOOL)has_epochTimeNanos;
- (BOOL)has_errorCode;
- (BOOL)has_expectsPeerResponse;
- (BOOL)has_expiryEpochTimeMillis;
- (BOOL)has_faceTimeRetryCount;
- (BOOL)has_failDownloadAttachmentSize;
- (BOOL)has_failReason;
- (BOOL)has_failTimeElapsed;
- (BOOL)has_failUploadAttachmentSize;
- (BOOL)has_fanoutChunkNumber;
- (BOOL)has_fanoutLastChunk;
- (BOOL)has_generateDeliveryReceipt;
- (BOOL)has_groupMemberCount;
- (BOOL)has_groupMessage;
- (BOOL)has_homekitDeliveryStatus;
- (BOOL)has_httpResponseStatus;
- (BOOL)has_internalBuild;
- (BOOL)has_ipFamilyPreference;
- (BOOL)has_isBulkedPayload;
- (BOOL)has_isInitiatorKey;
- (BOOL)has_isTrustedSender;
- (BOOL)has_isUPlusOneKey;
- (BOOL)has_loggingProfile;
- (BOOL)has_madridProtocol;
- (BOOL)has_messageCheckpoint;
- (BOOL)has_noResponseNeeded;
- (BOOL)has_originalCommand;
- (BOOL)has_originalEpochTimeNanos;
- (BOOL)has_participantId;
- (BOOL)has_pessimisticCheck;
- (BOOL)has_pluginDevMode;
- (BOOL)has_pluginStream;
- (BOOL)has_prevErrorCode;
- (BOOL)has_prevTimestamp;
- (BOOL)has_priority;
- (BOOL)has_protocolVersion;
- (BOOL)has_qrErrorCode;
- (BOOL)has_qrNewSession;
- (BOOL)has_quickRelayUserType;
- (BOOL)has_reason;
- (BOOL)has_relayHighPriorityPort;
- (BOOL)has_relayPort;
- (BOOL)has_relayProvider;
- (BOOL)has_relayServerType;
- (BOOL)has_requestType;
- (BOOL)has_responseStatus;
- (BOOL)has_retryCount;
- (BOOL)has_selfAllocTokenCount;
- (BOOL)has_selfAllocTokenCountOld;
- (BOOL)has_sendMode;
- (BOOL)has_senderExpectsAck;
- (BOOL)has_sharedSession;
- (BOOL)has_storageCheckVersion;
- (BOOL)has_storageFlags;
- (BOOL)has_testDropPoint;
- (BOOL)has_traceProfile;
- (BOOL)has_unfilteredHeaders;
- (BOOL)has_userPlusOne;
- (BOOL)has_version;
- (BOOL)has_wantsAppAck;
- (BOOL)has_webtunnelVersion;
- (BOOL)has_writeToCloudkit;
- (BOOL)internalBuild;
- (BOOL)isBulkedPayload;
- (BOOL)isInitiatorKey;
- (BOOL)isTrustedSender;
- (BOOL)isUPlusOneKey;
- (BOOL)loggingProfile;
- (BOOL)messageCheckpoint;
- (BOOL)noResponseNeeded;
- (BOOL)pessimisticCheck;
- (BOOL)pluginDevMode;
- (BOOL)qrNewSession;
- (BOOL)sharedSession;
- (BOOL)traceProfile;
- (BOOL)unfilteredHeaders;
- (BOOL)userPlusOne;
- (BOOL)wantsAppAck;
- (BOOL)writeToCloudkit;
- (BlastDoorAPSUserPayload)init;
- (BlastDoorAPSUserPayloadDeliveryContext)deliveryContext;
- (BlastDoorAPSUserPayloadHttpHeaders)httpHeaders;
- (NSArray)MMCSDownloadAuthList;
- (NSArray)MMCSDownloadUrlList;
- (NSArray)allocationStatuses;
- (NSArray)dstIdTokenList;
- (NSArray)madridMessageList;
- (NSArray)pluginAllocations;
- (NSArray)pluginRequests;
- (NSArray)selfAllocTokenList;
- (NSData)MMCSFileSignature;
- (NSData)activeAccessToken;
- (NSData)activeRelayIp;
- (NSData)additionalPayload;
- (NSData)bulkedPayload;
- (NSData)certifiedDeliveryRts;
- (NSData)contentBody;
- (NSData)contentReferenceSignature;
- (NSData)failMessageId;
- (NSData)fanoutPayload;
- (NSData)homekitSessionToken;
- (NSData)httpBody;
- (NSData)httpBodyKey;
- (NSData)idsSessionId;
- (NSData)initiatorIp;
- (NSData)messageUUID;
- (NSData)payload;
- (NSData)payloadMetadata;
- (NSData)prevAccessToken;
- (NSData)prevRelayIp;
- (NSData)queryHash;
- (NSData)relayAccessToken;
- (NSData)relayIp;
- (NSData)relayIpv6;
- (NSData)relayReportingBlob;
- (NSData)relaySessionId;
- (NSData)relaySessionKey;
- (NSData)responseIdentifier;
- (NSData)selfSessionToken;
- (NSData)sessionToken;
- (NSData)softwareVersion;
- (NSData)token;
- (NSString)MMCSAuthId;
- (NSString)MMCSAuthToken;
- (NSString)MMCSAuthUrl;
- (NSString)MMCSDownloadUrl;
- (NSString)MMCSOwnerId;
- (NSString)MMCSUploadUrl;
- (NSString)adhocServiceOverride;
- (NSString)applicationId;
- (NSString)asHttpHeader;
- (NSString)conferenceURI;
- (NSString)contentHeaders;
- (NSString)contentType;
- (NSString)description;
- (NSString)destinationId;
- (NSString)encryptionType;
- (NSString)errorDomain;
- (NSString)failMessageIdString;
- (NSString)failReasonMessage;
- (NSString)groupId;
- (NSString)homekitReportId;
- (NSString)httpBodyUrl;
- (NSString)httpErrorMsg;
- (NSString)httpUrl;
- (NSString)messageId;
- (NSString)mspId;
- (NSString)pluginConfig;
- (NSString)pluginName;
- (NSString)queueId;
- (NSString)relayBuildVersion;
- (NSString)responseIdentifierString;
- (NSString)senderId;
- (NSString)senderOpaqueId;
- (NSString)splunkHint;
- (NSString)strictTransportSecurity;
- (NSString)testOptions;
- (NSString)traceId;
- (NSString)url;
- (NSString)userAgent;
- (int64_t)MMCSExpiryNanos;
- (int64_t)MMCSFileLength;
- (int64_t)allocateInfoAttribute;
- (int64_t)allocationEpochTimeMillis;
- (int64_t)allocationStatus;
- (int64_t)allowGDR;
- (int64_t)attachmentSize;
- (int64_t)certifiedDeliveryVersion;
- (int64_t)command;
- (int64_t)commandContext;
- (int64_t)contentVersion;
- (int64_t)conversationId;
- (int64_t)dateExpirationSeconds;
- (int64_t)deliveryStatusFlags;
- (int64_t)epochTimeNanos;
- (int64_t)errorCode;
- (int64_t)expiryEpochTimeMillis;
- (int64_t)faceTimeRetryCount;
- (int64_t)failDownloadAttachmentSize;
- (int64_t)failReason;
- (int64_t)failTimeElapsed;
- (int64_t)failUploadAttachmentSize;
- (int64_t)fanoutChunkNumber;
- (int64_t)groupMemberCount;
- (int64_t)homekitDeliveryStatus;
- (int64_t)httpResponseStatus;
- (int64_t)ipFamilyPreference;
- (int64_t)madridProtocol;
- (int64_t)originalCommand;
- (int64_t)originalEpochTimeNanos;
- (int64_t)pluginStream;
- (int64_t)prevErrorCode;
- (int64_t)prevTimestamp;
- (int64_t)priority;
- (int64_t)protocolVersion;
- (int64_t)qrErrorCode;
- (int64_t)quickRelayUserType;
- (int64_t)reason;
- (int64_t)relayHighPriorityPort;
- (int64_t)relayPort;
- (int64_t)relayProvider;
- (int64_t)relayServerType;
- (int64_t)requestType;
- (int64_t)responseStatus;
- (int64_t)retryCount;
- (int64_t)selfAllocTokenCount;
- (int64_t)selfAllocTokenCountOld;
- (int64_t)sendMode;
- (int64_t)senderExpectsAck;
- (int64_t)storageCheckVersion;
- (int64_t)storageFlags;
- (int64_t)testDropPoint;
- (int64_t)version;
- (int64_t)webtunnelVersion;
- (unint64_t)participantId;
@end

@implementation BlastDoorAPSUserPayload

- (NSString)description
{
  v2 = (const void *)(MEMORY[0x1F4188790](self) + OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload);
  memcpy(__dst, v2, 0x89BuLL);
  memcpy(v5, v2, sizeof(v5));
  sub_1B176C214(__dst);
  sub_1B196A850();
  v3 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (int64_t)command
{
  if ((self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 16] & 1) == 0) {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 8];
  }
  int64_t result = sub_1B196B120();
  __break(1u);
  return result;
}

- (BOOL)has_commandContext
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 32] & 1) == 0;
}

- (int64_t)commandContext
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 32]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 24];
  }
}

- (BOOL)has_version
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 48] & 1) == 0;
}

- (int64_t)version
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 48]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 40];
  }
}

- (NSData)payload
{
  return (NSData *)sub_1B1774F94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload);
}

- (NSData)bulkedPayload
{
  return (NSData *)sub_1B177473C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload);
}

- (NSData)fanoutPayload
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 96];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 88];
    sub_1B11F1108(v4, v2);
    v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSData)additionalPayload
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 112];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 104];
    sub_1B11F1108(v4, v2);
    v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSData)payloadMetadata
{
  return (NSData *)sub_1B178554C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload);
}

- (NSString)messageId
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 144])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSData)messageUUID
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 160];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 152];
    sub_1B11F1108(v4, v2);
    v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSString)queueId
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 176])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_deliveryStatus
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 184] != 2;
}

- (BOOL)deliveryStatus
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 184] & 1;
}

- (BlastDoorAPSUserPayloadDeliveryContext)deliveryContext
{
  unint64_t v2 = (char *)self + OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload;
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 201])
  {
    v3 = 0;
  }
  else
  {
    char v4 = v2[208];
    uint64_t v5 = *((void *)v2 + 25);
    v6 = (objc_class *)type metadata accessor for _ObjCAPSUserPayloadDeliveryContextWrapper();
    v7 = (char *)objc_allocWithZone(v6);
    v8 = &v7[OBJC_IVAR___BlastDoorAPSUserPayloadDeliveryContext_aPSUserPayloadDeliveryContext];
    *(void *)v8 = v5;
    v8[8] = v4 & 1;
    v10.receiver = v7;
    v10.super_class = v6;
    v3 = [(BlastDoorAPSUserPayload *)&v10 init];
  }
  return (BlastDoorAPSUserPayloadDeliveryContext *)v3;
}

- (BOOL)has_certifiedDeliveryVersion
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 216] & 1) == 0;
}

- (int64_t)certifiedDeliveryVersion
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 216]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 208];
  }
}

- (NSData)certifiedDeliveryRts
{
  return (NSData *)sub_1B1786138((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload);
}

- (BOOL)has_noResponseNeeded
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 240] != 2;
}

- (BOOL)noResponseNeeded
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 240] & 1;
}

- (BOOL)has_generateDeliveryReceipt
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 241] != 2;
}

- (BOOL)generateDeliveryReceipt
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 241] & 1;
}

- (NSData)sessionToken
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 256];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 248];
    sub_1B11F1108(v4, v2);
    v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSData)homekitSessionToken
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 272];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 264];
    sub_1B11F1108(v4, v2);
    v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSString)destinationId
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 288])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)userAgent
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 304])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)MMCSOwnerId
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 320])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSData)MMCSFileSignature
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 336];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 328];
    sub_1B11F1108(v4, v2);
    v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (BOOL)has_MMCSFileLength
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 352] & 1) == 0;
}

- (int64_t)MMCSFileLength
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 352]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 344];
  }
}

- (NSString)MMCSAuthToken
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 368])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)MMCSAuthUrl
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 384])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)MMCSAuthId
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 400])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSArray)MMCSDownloadAuthList
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 408])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196AAF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSArray *)v2;
}

- (NSArray)MMCSDownloadUrlList
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 416])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196AAF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSArray *)v2;
}

- (NSString)MMCSDownloadUrl
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 432])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)MMCSUploadUrl
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 448])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_MMCSExpiryNanos
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 464] & 1) == 0;
}

- (int64_t)MMCSExpiryNanos
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 464]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 456];
  }
}

- (BOOL)has_contentVersion
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 480] & 1) == 0;
}

- (int64_t)contentVersion
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 480]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 472];
  }
}

- (NSString)contentHeaders
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 496])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSData)contentBody
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 512];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 504];
    sub_1B11F1108(v4, v2);
    v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSData)contentReferenceSignature
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 528];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 520];
    sub_1B11F1108(v4, v2);
    v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (BOOL)has_attachmentSize
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 544] & 1) == 0;
}

- (int64_t)attachmentSize
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 544]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 536];
  }
}

- (NSData)token
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 560];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 552];
    sub_1B11F1108(v4, v2);
    v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSString)senderId
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 576])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)senderOpaqueId
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 592])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)mspId
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 608])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_responseStatus
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 624] & 1) == 0;
}

- (int64_t)responseStatus
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 624]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 616];
  }
}

- (BOOL)has_epochTimeNanos
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 640] & 1) == 0;
}

- (int64_t)epochTimeNanos
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 640]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 632];
  }
}

- (BOOL)has_originalEpochTimeNanos
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 656] & 1) == 0;
}

- (int64_t)originalEpochTimeNanos
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 656]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 648];
  }
}

- (BOOL)has_failReason
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 672] & 1) == 0;
}

- (int64_t)failReason
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 672]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 664];
  }
}

- (NSData)failMessageId
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 688];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 680];
    sub_1B11F1108(v4, v2);
    v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSString)failMessageIdString
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 704])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_failDownloadAttachmentSize
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 720] & 1) == 0;
}

- (int64_t)failDownloadAttachmentSize
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 720]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 712];
  }
}

- (BOOL)has_failUploadAttachmentSize
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 736] & 1) == 0;
}

- (int64_t)failUploadAttachmentSize
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 736]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 728];
  }
}

- (NSString)failReasonMessage
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 752])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_failTimeElapsed
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 768] & 1) == 0;
}

- (int64_t)failTimeElapsed
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 768]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 760];
  }
}

- (NSString)encryptionType
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 784])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_storageFlags
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 800] & 1) == 0;
}

- (int64_t)storageFlags
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 800]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 792];
  }
}

- (BOOL)has_priority
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 816] & 1) == 0;
}

- (int64_t)priority
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 816]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 808];
  }
}

- (BOOL)has_senderExpectsAck
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 832] & 1) == 0;
}

- (int64_t)senderExpectsAck
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 832]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 824];
  }
}

- (NSArray)dstIdTokenList
{
  return (NSArray *)sub_1B17A0558(self, (uint64_t)a2, (void (*)(void))sub_1B176EA00, (void (*)(void))type metadata accessor for _ObjCAPSUserPayloadWrapper);
}

- (NSArray)madridMessageList
{
  return (NSArray *)sub_1B17A0558(self, (uint64_t)a2, (void (*)(void))sub_1B176EB50, (void (*)(void))type metadata accessor for _ObjCAPSUserPayloadWrapper);
}

- (BOOL)has_storageCheckVersion
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 864] & 1) == 0;
}

- (int64_t)storageCheckVersion
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 864]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 856];
  }
}

- (BOOL)has_dateExpirationSeconds
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 880] & 1) == 0;
}

- (int64_t)dateExpirationSeconds
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 880]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 872];
  }
}

- (BOOL)has_madridProtocol
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 896] & 1) == 0;
}

- (int64_t)madridProtocol
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 896]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 888];
  }
}

- (BOOL)has_internalBuild
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 897] != 2;
}

- (BOOL)internalBuild
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 897] & 1;
}

- (BOOL)has_loggingProfile
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 898] != 2;
}

- (BOOL)loggingProfile
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 898] & 1;
}

- (BOOL)has_traceProfile
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 899] != 2;
}

- (BOOL)traceProfile
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 899] & 1;
}

- (BOOL)has_groupMessage
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 900] != 2;
}

- (BOOL)groupMessage
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 900] & 1;
}

- (NSString)contentType
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 912])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)adhocServiceOverride
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 928])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSData)responseIdentifier
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 944];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 936];
    sub_1B11F1108(v4, v2);
    v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSString)responseIdentifierString
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 960])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)strictTransportSecurity
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 976])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)traceId
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 992])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)splunkHint
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1008])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)asHttpHeader
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1024])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_homekitDeliveryStatus
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1040] & 1) == 0;
}

- (int64_t)homekitDeliveryStatus
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1040]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1032];
  }
}

- (NSString)homekitReportId
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1056])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_retryCount
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1072] & 1) == 0;
}

- (int64_t)retryCount
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1072]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1064];
  }
}

- (NSString)testOptions
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1088])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_fanoutChunkNumber
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1104] & 1) == 0;
}

- (int64_t)fanoutChunkNumber
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1104]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1096];
  }
}

- (BOOL)has_fanoutLastChunk
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1105] != 2;
}

- (BOOL)fanoutLastChunk
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1105] & 1;
}

- (NSString)url
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1120])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_faceTimeRetryCount
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1136] & 1) == 0;
}

- (int64_t)faceTimeRetryCount
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1136]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1128];
  }
}

- (BOOL)has_webtunnelVersion
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1152] & 1) == 0;
}

- (int64_t)webtunnelVersion
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1152]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1144];
  }
}

- (NSString)httpUrl
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1168])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BlastDoorAPSUserPayloadHttpHeaders)httpHeaders
{
  unint64_t v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload);
  uint64_t v3 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1184];
  if (v3 == 1)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v18 = v2[158];
    uint64_t v19 = v2[159];
    uint64_t v5 = v2[157];
    uint64_t v17 = v2[156];
    uint64_t v6 = v2[155];
    uint64_t v7 = v2[154];
    uint64_t v8 = v2[153];
    uint64_t v9 = v2[152];
    uint64_t v10 = v2[151];
    uint64_t v11 = v2[150];
    uint64_t v12 = v2[148];
    v13 = (objc_class *)type metadata accessor for _ObjCAPSUserPayloadHttpHeadersWrapper();
    v14 = (char *)objc_allocWithZone(v13);
    v15 = &v14[OBJC_IVAR___BlastDoorAPSUserPayloadHttpHeaders_aPSUserPayloadHttpHeaders];
    *(void *)v15 = v12;
    *((void *)v15 + 1) = v3;
    *((void *)v15 + 2) = v11;
    *((void *)v15 + 3) = v10;
    *((void *)v15 + 4) = v9;
    *((void *)v15 + 5) = v8;
    *((void *)v15 + 6) = v7;
    *((void *)v15 + 7) = v6;
    *((void *)v15 + 8) = v17;
    *((void *)v15 + 9) = v5;
    *((void *)v15 + 10) = v18;
    *((void *)v15 + 11) = v19;
    v20.receiver = v14;
    v20.super_class = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v4 = [(BlastDoorAPSUserPayload *)&v20 init];
  }
  return (BlastDoorAPSUserPayloadHttpHeaders *)v4;
}

- (NSData)httpBody
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1280];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1272];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSString)httpBodyUrl
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1296])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSData)httpBodyKey
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1312];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1304];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (BOOL)has_httpResponseStatus
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1328] & 1) == 0;
}

- (int64_t)httpResponseStatus
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1328]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1320];
  }
}

- (NSString)httpErrorMsg
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1344])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_writeToCloudkit
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1352] != 2;
}

- (BOOL)writeToCloudkit
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1352] & 1;
}

- (BOOL)has_pessimisticCheck
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1353] != 2;
}

- (BOOL)pessimisticCheck
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1353] & 1;
}

- (BOOL)has_unfilteredHeaders
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1354] != 2;
}

- (BOOL)unfilteredHeaders
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1354] & 1;
}

- (BOOL)has_deliveryStatusFlags
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1368] & 1) == 0;
}

- (int64_t)deliveryStatusFlags
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1368]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1360];
  }
}

- (NSString)conferenceURI
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1384])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSData)selfSessionToken
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1400];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1392];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSData)queryHash
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1416];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1408];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (BOOL)has_testDropPoint
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1432] & 1) == 0;
}

- (int64_t)testDropPoint
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1432]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1424];
  }
}

- (BOOL)has_userPlusOne
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1433] != 2;
}

- (BOOL)userPlusOne
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1433] & 1;
}

- (BOOL)has_isInitiatorKey
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1434] != 2;
}

- (BOOL)isInitiatorKey
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1434] & 1;
}

- (BOOL)has_quickRelayUserType
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1448] & 1) == 0;
}

- (int64_t)quickRelayUserType
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1448]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1440];
  }
}

- (BOOL)has_errorCode
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1464] & 1) == 0;
}

- (int64_t)errorCode
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1464]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1456];
  }
}

- (BOOL)has_messageCheckpoint
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1465] != 2;
}

- (BOOL)messageCheckpoint
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1465] & 1;
}

- (BOOL)has_conversationId
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1480] & 1) == 0;
}

- (int64_t)conversationId
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1480]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1472];
  }
}

- (BOOL)has_protocolVersion
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1496] & 1) == 0;
}

- (int64_t)protocolVersion
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1496]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1488];
  }
}

- (NSString)applicationId
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1512])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_reason
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1528] & 1) == 0;
}

- (int64_t)reason
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1528]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1520];
  }
}

- (BOOL)has_prevErrorCode
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1544] & 1) == 0;
}

- (int64_t)prevErrorCode
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1544]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1536];
  }
}

- (NSData)prevAccessToken
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1560];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1552];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSData)prevRelayIp
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1576];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1568];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (BOOL)has_prevTimestamp
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1592] & 1) == 0;
}

- (int64_t)prevTimestamp
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1592]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1584];
  }
}

- (NSData)activeAccessToken
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1608];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1600];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSData)activeRelayIp
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1624];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1616];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (BOOL)has_selfAllocTokenCountOld
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1640] & 1) == 0;
}

- (int64_t)selfAllocTokenCountOld
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1640]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1632];
  }
}

- (BOOL)has_selfAllocTokenCount
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1656] & 1) == 0;
}

- (int64_t)selfAllocTokenCount
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1656]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1648];
  }
}

- (NSArray)pluginRequests
{
  return (NSArray *)sub_1B17A0558(self, (uint64_t)a2, (void (*)(void))sub_1B1770F3C, (void (*)(void))type metadata accessor for _ObjCAPSQuickRelayPluginRequestWrapper);
}

- (NSString)pluginName
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1680])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)pluginConfig
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1696])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_pluginStream
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1712] & 1) == 0;
}

- (int64_t)pluginStream
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1712]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1704];
  }
}

- (BOOL)has_pluginDevMode
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1713] != 2;
}

- (BOOL)pluginDevMode
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1713] & 1;
}

- (BOOL)has_qrNewSession
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1714] != 2;
}

- (BOOL)qrNewSession
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1714] & 1;
}

- (BOOL)has_requestType
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1728] & 1) == 0;
}

- (int64_t)requestType
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1728]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1720];
  }
}

- (NSData)idsSessionId
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1744];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1736];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (BOOL)has_relayProvider
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1760] & 1) == 0;
}

- (int64_t)relayProvider
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1760]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1752];
  }
}

- (BOOL)has_sharedSession
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1761] != 2;
}

- (BOOL)sharedSession
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1761] & 1;
}

- (NSString)groupId
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1776])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_groupMemberCount
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1792] & 1) == 0;
}

- (int64_t)groupMemberCount
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1792]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1784];
  }
}

- (BOOL)has_allocateInfoAttribute
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1808] & 1) == 0;
}

- (int64_t)allocateInfoAttribute
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1808]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1800];
  }
}

- (NSData)relayIp
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1824];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1816];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSData)relayIpv6
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1840];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1832];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (BOOL)has_relayPort
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1856] & 1) == 0;
}

- (int64_t)relayPort
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1856]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1848];
  }
}

- (NSData)relayAccessToken
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1872];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1864];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSData)relaySessionKey
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1888];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1880];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSData)relaySessionId
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1904];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1896];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (BOOL)has_expiryEpochTimeMillis
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1920] & 1) == 0;
}

- (int64_t)expiryEpochTimeMillis
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1920]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1912];
  }
}

- (NSData)initiatorIp
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1936];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1928];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (BOOL)has_participantId
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1952] & 1) == 0;
}

- (unint64_t)participantId
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1952]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1944];
  }
}

- (NSData)softwareVersion
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1968];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1960];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSString)relayBuildVersion
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1984])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_relayHighPriorityPort
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2000] & 1) == 0;
}

- (int64_t)relayHighPriorityPort
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2000]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 1992];
  }
}

- (BOOL)has_ipFamilyPreference
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2016] & 1) == 0;
}

- (int64_t)ipFamilyPreference
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2016]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2008];
  }
}

- (BOOL)has_allocationEpochTimeMillis
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2032] & 1) == 0;
}

- (int64_t)allocationEpochTimeMillis
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2032]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2024];
  }
}

- (BOOL)has_allocationStatus
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2048] & 1) == 0;
}

- (int64_t)allocationStatus
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2048]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2040];
  }
}

- (NSArray)allocationStatuses
{
  return (NSArray *)sub_1B17A0558(self, (uint64_t)a2, (void (*)(void))sub_1B1772178, (void (*)(void))type metadata accessor for _ObjCAPSQuickRelayAllocationStatusWrapper);
}

- (NSArray)selfAllocTokenList
{
  return (NSArray *)sub_1B17A0558(self, (uint64_t)a2, (void (*)(void))sub_1B177237C, (void (*)(void))type metadata accessor for _ObjCAPSQuickRelaySelfAllocTokenWrapper);
}

- (NSData)relayReportingBlob
{
  unint64_t v2 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2080];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2072];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (BOOL)has_relayServerType
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2096] & 1) == 0;
}

- (int64_t)relayServerType
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2096]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2088];
  }
}

- (NSArray)pluginAllocations
{
  return (NSArray *)sub_1B17A0558(self, (uint64_t)a2, (void (*)(void))sub_1B1772744, (void (*)(void))type metadata accessor for _ObjCAPSQuickRelayPluginAllocationWrapper);
}

- (BOOL)has_qrErrorCode
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2120] & 1) == 0;
}

- (int64_t)qrErrorCode
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2120]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2112];
  }
}

- (BOOL)has_originalCommand
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2136] & 1) == 0;
}

- (int64_t)originalCommand
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2136]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2128];
  }
}

- (BOOL)has_isBulkedPayload
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2137] != 2;
}

- (BOOL)isBulkedPayload
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2137] & 1;
}

- (BOOL)has_wantsAppAck
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2138] != 2;
}

- (BOOL)wantsAppAck
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2138] & 1;
}

- (NSString)errorDomain
{
  if (*(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2152])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)has_expectsPeerResponse
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2160] != 2;
}

- (BOOL)expectsPeerResponse
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2160] & 1;
}

- (BOOL)has_allowGDR
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2176] & 1) == 0;
}

- (int64_t)allowGDR
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2176]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2168];
  }
}

- (BOOL)has_sendMode
{
  return (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2192] & 1) == 0;
}

- (int64_t)sendMode
{
  if (self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2192]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2184];
  }
}

- (BOOL)has_isTrustedSender
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2193] != 2;
}

- (BOOL)isTrustedSender
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2193] & 1;
}

- (BOOL)has_isUPlusOneKey
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2194] != 2;
}

- (BOOL)isUPlusOneKey
{
  return self->aPSUserPayload[OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload + 2194] & 1;
}

- (BlastDoorAPSUserPayload)init
{
  int64_t result = (BlastDoorAPSUserPayload *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  memcpy(v2, (char *)self + OBJC_IVAR___BlastDoorAPSUserPayload_aPSUserPayload, 0x89BuLL);
  sub_1B14DBB74(v2);
}

@end