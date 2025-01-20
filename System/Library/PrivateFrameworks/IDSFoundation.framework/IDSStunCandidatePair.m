@interface IDSStunCandidatePair
+ (id)candidatePairWithLocalCandidate:(id)a3 remoteCandidate:(id)a4 sessionID:(id)a5 delegate:(id)a6;
- (BOOL)_didLocalExternalAddressChange:(const sockaddr *)a3;
- (BOOL)_optionallyCheckEncMarker:(id)a3;
- (BOOL)enableSKE;
- (BOOL)hasNoSessionStateTestOptions;
- (BOOL)hasValidCapabilityFlags;
- (BOOL)hbStarted;
- (BOOL)isAcceptedRelaySession;
- (BOOL)isActive;
- (BOOL)isActualRelayStunCandidatePair;
- (BOOL)isConnectToQRIPv6Enabled;
- (BOOL)isDisconnecting;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInitiator;
- (BOOL)isNAT64;
- (BOOL)isNominated;
- (BOOL)isP2P;
- (BOOL)isQUIC;
- (BOOL)isRealloc;
- (BOOL)isRelayStunCandidatePair;
- (BOOL)isSelfQRSession;
- (BOOL)isSharedQRSession;
- (BOOL)isValidRelayStunCandidatePair;
- (BOOL)isVirtualRelayStunCandidatePair;
- (BOOL)pendingNoSessionStateAllocbind;
- (BOOL)pendingRealloc;
- (BOOL)processDataMessageErrorIndication:(id)a3;
- (BOOL)processInfoIndication:(id)a3 arrivalTime:(double)a4;
- (BOOL)processInfoResponse:(id)a3 packetBuffer:(id *)a4 headerOverhead:(unint64_t)a5;
- (BOOL)processParticipantUpdateIndication:(id)a3 arrivalTime:(double)a4;
- (BOOL)processParticipantUpdateResponse:(id)a3;
- (BOOL)processPluginControlIndication:(id)a3;
- (BOOL)processPluginRegistrationResponse:(id)a3;
- (BOOL)processPutMaterialResponse:(id)a3;
- (BOOL)processQUICErrorIndication:(id)a3;
- (BOOL)processQUICErrorResponse:(id)a3 packetBuffer:(id *)a4 startTime:(double)a5 headerOverhead:(unint64_t)a6;
- (BOOL)processQUICGetMaterialResponse:(id)a3;
- (BOOL)processQUICInfoResponse:(id)a3 receivedBytes:(unint64_t)a4;
- (BOOL)processQUICParticipantUpdateIndication:(id)a3;
- (BOOL)processQUICParticipantUpdateResponse:(id)a3;
- (BOOL)processQUICPluginControlIndication:(id)a3;
- (BOOL)processQUICPluginRegistrationResponse:(id)a3;
- (BOOL)processQUICPutMaterialIndication:(id)a3;
- (BOOL)processQUICPutMaterialResponse:(id)a3;
- (BOOL)processQUICSessionInfoIndication:(id)a3 arrivalTime:(double)a4 isLightweightParticipant:(BOOL)a5;
- (BOOL)processQUICSessionInfoResponse:(id)a3 receivedBytes:(unint64_t)a4 isLightweightParticipant:(BOOL)a5;
- (BOOL)processQUICStatsResponse:(id)a3 arrivalTime:(double)a4;
- (BOOL)processQUICTestResponse:(id)a3 arrivalTime:(double)a4;
- (BOOL)processSessionInfoIndication:(id)a3 arrivalTime:(double)a4 isLightweightParticipant:(BOOL)a5;
- (BOOL)processSessionInfoResponse:(id)a3 packetBuffer:(id *)a4 headerOverhead:(unint64_t)a5 isLightweightParticipant:(BOOL)a6;
- (BOOL)processStatsResponse:(id)a3 arrivalTime:(double)a4;
- (BOOL)processStunErrorResponse:(id)a3 packetBuffer:(id *)a4 headerOverhead:(unint64_t)a5;
- (BOOL)processTestResponse:(id)a3 arrivalTime:(double)a4;
- (BOOL)recvConnected;
- (BOOL)recvConnectedAck;
- (BOOL)recvDisconnected;
- (BOOL)recvDisconnectedAck;
- (BOOL)recvSKEData;
- (BOOL)removeProtoRequest:(unint64_t)a3;
- (BOOL)sendQUICGetMaterialRequest:(id)a3;
- (BOOL)sendQUICPutMaterialRequest:(id)a3;
- (BOOL)sentSKEData;
- (BOOL)serverIsDegraded;
- (BOOL)shouldProcessStunResponse:(id)a3;
- (BOOL)shouldRexmitStunRequest:(id)a3;
- (IDSGFTMetricsLink)linkMetrics;
- (IDSGlobalLinkP2PKeyNegotiationProtocol)p2pNegotiation;
- (IDSGlobalLinkP2PNegotiatedKeysProtocol)p2pNegotiatedKeys;
- (IDSQUICConnectionIDs)QUICConnectionIDs;
- (IDSQuickRelaySessionInfo)relaySessionInfo;
- (IDSStunCandidate)local;
- (IDSStunCandidate)relayRemote;
- (IDSStunCandidate)remote;
- (IDSStunCandidatePair)initWithLocalCandidate:(id)a3 remoteCandidate:(id)a4 sessionID:(id)a5 delegate:(id)a6;
- (NSData)decKey;
- (NSData)encKey;
- (NSData)hbhDecKey;
- (NSData)hbhEncKey;
- (NSData)hbhSalt;
- (NSData)hmacKey;
- (NSData)relaySessionKey;
- (NSData)relaySessionToken;
- (NSData)skeData;
- (NSData)softwareData;
- (NSDictionary)URIToParticipantIDs;
- (NSDictionary)participantIDMap;
- (NSDictionary)sessionInfoDict;
- (NSMutableArray)pendingStunRequests;
- (NSMutableArray)repliedStunRequests;
- (NSMutableDictionary)connections;
- (NSString)appName;
- (NSString)groupID;
- (NSString)pskH3Settings;
- (NSString)pskTransportParameters;
- (NSString)sessionID;
- (NSString)testSubOperation;
- (NSUUID)defaultLocalDeviceCBUUID;
- (NSUUID)defaultRemoteDeviceCBUUID;
- (NSUUID)linkUUID;
- (OS_dispatch_source)allocbindFailoverTimer;
- (char)delegatedLinkID;
- (char)linkID;
- (double)allocateTime;
- (double)hbStartTime;
- (double)lastIncomingPacketTime;
- (double)lastOutgoingPacketTime;
- (double)lastStatsReport;
- (double)selfAllocateStartTime;
- (double)serverLatency;
- (double)testStartTime;
- (double)triggeredCheckTime;
- (id)_pluginNameForProtoRequest:(unint64_t)a3;
- (id)_pluginNameForStunRequest:(id)a3;
- (id)candidatePairToken;
- (id)description;
- (int64_t)allocateType;
- (int64_t)relayProviderType;
- (unint64_t)capabilityFlags;
- (unint64_t)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4;
- (unint64_t)getParticipantIDHash:(id)a3;
- (unint64_t)getStunSentBytes:(id)a3;
- (unint64_t)participantID;
- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4;
- (unint64_t)remoteParticipantID;
- (unint64_t)state;
- (unsigned)channelNumber;
- (unsigned)hbCounter;
- (unsigned)nextSessionInfoReqID;
- (unsigned)protocolVersion;
- (unsigned)relayLinkID;
- (unsigned)remoteRelayLinkID;
- (unsigned)sessionInfoReqCount;
- (unsigned)stateFlags;
- (unsigned)statsIntervalInSeconds;
- (unsigned)testOptions;
- (unsigned)testRequestedErrorCode;
- (unsigned)totalPacketsReceivedOnLink;
- (unsigned)totalPacketsSentOnLink;
- (void)_addParticipantIDs:(id)a3 toParticipantIDMap:(id)a4;
- (void)_handleLinkProbingTimer;
- (void)_handleNoSessionStateTimer;
- (void)_handleReallocTimer;
- (void)_handleSessionConnectedTimer;
- (void)_handleSessionConvergenceTimer;
- (void)_handleSessionGoAwayTimer;
- (void)_notifyQREventAdded:(id)a3;
- (void)_notifySessionStreamInfoReceived:(id)a3 withParticipants:(id)a4 lightweightParticipants:(id)a5 joinedParticipantInfo:(id)a6 leftParticipantInfo:(id)a7 sentBytes:(unint64_t)a8 receivedBytes:(unint64_t)a9 offlineRequest:(BOOL)a10 streamInfoRequest:(BOOL)a11 status:(unsigned int)a12 commandFlag:(unsigned int)a13 isIndication:(BOOL)a14;
- (void)_removeProtoPluginRegistrationRequest:(unint64_t)a3;
- (void)_removeStunPluginRegistrationRequest:(id)a3;
- (void)_savePluginNameForProtoRequest:(unint64_t)a3 pluginName:(id)a4;
- (void)_savePluginNameForRequest:(id)a3 pluginName:(id)a4;
- (void)_startNoSessionStateTimer;
- (void)_startReallocTimer;
- (void)_stopNoSessionStateTimer;
- (void)_stopReallocTimer;
- (void)addProtoRequest:(unint64_t)a3;
- (void)addStunRequest:(id)a3;
- (void)dealloc;
- (void)deriveAES128CTRKeys:(id)a3;
- (void)initParticipantIDMap:(id)a3;
- (void)invalidate;
- (void)processSessionInfoRequestTimeout:(id)a3;
- (void)removeFromParticipantIDMap:(id)a3;
- (void)removeStunRequest:(id)a3;
- (void)sendInfoRequest:(id)a3;
- (void)sendParticipantUpdateRequest:(id)a3 options:(id)a4;
- (void)sendPutMaterialRequest:(id)a3 options:(id)a4;
- (void)sendQRPluginRegistrationRequest:(id)a3 options:(id)a4;
- (void)sendQUICInfoRequest;
- (void)sendQUICParticipantUpdateRequestWithOptions:(id)a3;
- (void)sendQUICPluginRegistrationRequestWithOptions:(id)a3;
- (void)sendQUICSessionInfoRequestWithOptions:(id)a3;
- (void)sendQUICStatsRequestWithOptions:(id)a3;
- (void)sendQUICTestRequest;
- (void)sendSessionInfoRequest:(id)a3 options:(id)a4;
- (void)sendStatsRequest:(id)a3 options:(id)a4;
- (void)sendTestRequest:(id)a3;
- (void)setAllocateTime:(double)a3;
- (void)setAllocateType:(int64_t)a3;
- (void)setAllocbindFailoverTimer:(id)a3;
- (void)setChannelNumber:(unsigned __int16)a3;
- (void)setChannelSettings:(unsigned int)a3;
- (void)setDefaultLocalDeviceCBUUID:(id)a3;
- (void)setDefaultRemoteDeviceCBUUID:(id)a3;
- (void)setDelegatedLinkID:(char)a3;
- (void)setGroupID:(id)a3;
- (void)setHbStartTime:(double)a3;
- (void)setHbStarted:(BOOL)a3;
- (void)setHbhDecKey:(id)a3;
- (void)setHbhEncKey:(id)a3;
- (void)setIsAcceptedRelaySession:(BOOL)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsConnectToQRIPv6Enabled:(BOOL)a3;
- (void)setIsDisconnecting:(BOOL)a3;
- (void)setIsNAT64:(BOOL)a3;
- (void)setIsNominated:(BOOL)a3;
- (void)setIsQUIC:(BOOL)a3;
- (void)setIsRealloc:(BOOL)a3;
- (void)setLastIncomingPacketTime:(double)a3;
- (void)setLastOutgoingPacketTime:(double)a3;
- (void)setLastStatsReport:(double)a3;
- (void)setLinkID:(char)a3;
- (void)setLinkMetrics:(id)a3;
- (void)setLinkUUID:(id)a3;
- (void)setLinkUUIDWithRelayLinkIDs;
- (void)setP2pNegotiatedKeys:(id)a3;
- (void)setP2pNegotiation:(id)a3;
- (void)setParticipantID:(unint64_t)a3;
- (void)setPendingNoSessionState:(BOOL)a3;
- (void)setPendingNoSessionStateAllocbind:(BOOL)a3;
- (void)setPendingRealloc:(BOOL)a3;
- (void)setPropertiesWithReallocCandidatePair:(id)a3 reallocToken:(id)a4;
- (void)setPropertiesWithRelaySessionInfo:(id)a3 sessionInfoDict:(id)a4 enableSKE:(BOOL)a5;
- (void)setProtocolVersion:(unsigned __int8)a3 isInitiator:(BOOL)a4 enableSKE:(BOOL)a5;
- (void)setQUICConnectionIDs:(id)a3;
- (void)setRecvConnected:(BOOL)a3;
- (void)setRecvConnectedAck:(BOOL)a3;
- (void)setRecvDisconnected:(BOOL)a3;
- (void)setRecvDisconnectedAck:(BOOL)a3;
- (void)setRecvSKEData:(BOOL)a3;
- (void)setRelayLinkID:(unsigned __int16)a3;
- (void)setRelayProviderType:(int64_t)a3;
- (void)setRelayRemote:(id)a3;
- (void)setRemoteParticipantID:(unint64_t)a3;
- (void)setRemoteRelayLinkID:(unsigned __int16)a3;
- (void)setSelfAllocateStartTime:(double)a3;
- (void)setSentSKEData:(BOOL)a3;
- (void)setServerIsDegraded:(BOOL)a3;
- (void)setServerLatency:(double)a3;
- (void)setSkeData:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTestOptionsFromUserDefaults;
- (void)setTotalPacketsReceivedOnLink:(unsigned int)a3;
- (void)setTotalPacketsSentOnLink:(unsigned int)a3;
- (void)setTriggeredCheckTime:(double)a3;
- (void)startLinkProbingTimer:(unsigned int)a3;
- (void)startSessionConnectedTimer:(int)a3 block:(id)a4;
- (void)startSessionConvergenceTimer:(int)a3 block:(id)a4;
- (void)startSessionGoAwayTimer:(int)a3 block:(id)a4;
- (void)stopLinkProbingTimer;
- (void)stopSessionConnectedTimer;
- (void)stopSessionConvergenceTimer;
- (void)stopSessionGoAwayTimer;
- (void)synthesizeNat64WithPrefix;
- (void)updateParticipantIDMap:(id)a3;
- (void)updateStunSentBytes:(int64_t)a3 requestID:(id)a4;
- (void)updateURIToParticipantIDMapping:(id)a3;
@end

@implementation IDSStunCandidatePair

+ (id)candidatePairWithLocalCandidate:(id)a3 remoteCandidate:(id)a4 sessionID:(id)a5 delegate:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [IDSStunCandidatePair alloc];
  v16 = objc_msgSend_initWithLocalCandidate_remoteCandidate_sessionID_delegate_(v13, v14, (uint64_t)v12, v15, v11, v10, v9);

  return v16;
}

- (IDSStunCandidatePair)initWithLocalCandidate:(id)a3 remoteCandidate:(id)a4 sessionID:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)IDSStunCandidatePair;
  v16 = [(IDSStunCandidatePair *)&v35 init];
  if (v16)
  {
    uint64_t v18 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v14, v15, v17);
    connections = v16->_connections;
    v16->_connections = (NSMutableDictionary *)v18;

    v16->_state = 0;
    uint64_t v23 = objc_msgSend_copy(v10, v20, v21, v22);
    local = v16->_local;
    v16->_local = (IDSStunCandidate *)v23;

    uint64_t v28 = objc_msgSend_copy(v11, v25, v26, v27);
    remote = v16->_remote;
    v16->_remote = (IDSStunCandidate *)v28;

    objc_storeStrong((id *)&v16->_sessionID, a5);
    objc_storeWeak((id *)&v16->_delegate, v13);
    v16->_statsIntervalInSeconds = 12;
    v16->_triggeredCheckTime = 0.0;
    if (v13)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v32 = objc_msgSend_createLinkCycleForCandidatePair_(v13, v30, (uint64_t)v16, v31);
        linkMetrics = v16->_linkMetrics;
        v16->_linkMetrics = (IDSGFTMetricsLink *)v32;
      }
    }
  }

  return v16;
}

- (void)dealloc
{
  objc_msgSend__stopReallocTimer(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)IDSStunCandidatePair;
  [(IDSStunCandidatePair *)&v5 dealloc];
}

- (void)invalidate
{
  self->_state = 6;
  pendingStunRequests = self->_pendingStunRequests;
  self->_pendingStunRequests = 0;

  repliedStunRequests = self->_repliedStunRequests;
  self->_repliedStunRequests = 0;

  requestIDToQueryLinkIDs = self->_requestIDToQueryLinkIDs;
  self->_requestIDToQueryLinkIDs = 0;

  id sessionConnectedTimeoutBlock = self->_sessionConnectedTimeoutBlock;
  self->_id sessionConnectedTimeoutBlock = 0;

  id sessionConvergenceBlock = self->_sessionConvergenceBlock;
  self->_id sessionConvergenceBlock = 0;

  requestIDToStatsIDs = self->_requestIDToStatsIDs;
  self->_requestIDToStatsIDs = 0;

  stunSentBytesToRequestID = self->_stunSentBytesToRequestID;
  self->_stunSentBytesToRequestID = 0;

  pluginNameToStunReqID = self->_pluginNameToStunReqID;
  self->_pluginNameToStunReqID = 0;

  objc_msgSend_setAllocbindFailoverTimer_(self, v11, 0, v12);
  objc_msgSend_setIsRealloc_(self, v13, 0, v14);
  objc_msgSend_stopLinkProbingTimer(self, v15, v16, v17);
  hbhEncKey = self->_hbhEncKey;
  self->_hbhEncKey = 0;

  hbhDecKey = self->_hbhDecKey;
  self->_hbhDecKey = 0;
}

- (id)description
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v76 = v4;
  long long v77 = v4;
  long long v74 = v4;
  long long v75 = v4;
  long long v72 = v4;
  long long v73 = v4;
  *(_OWORD *)__str = v4;
  long long v71 = v4;
  long long v68 = v4;
  long long v69 = v4;
  long long v66 = v4;
  long long v67 = v4;
  long long v64 = v4;
  long long v65 = v4;
  *(_OWORD *)v62 = v4;
  long long v63 = v4;
  long long v60 = v4;
  long long v61 = v4;
  long long v58 = v4;
  long long v59 = v4;
  long long v56 = v4;
  long long v57 = v4;
  *(_OWORD *)v54 = v4;
  long long v55 = v4;
  uint64_t v5 = objc_msgSend_address(self->_local, a2, v2, -3.72066208e-103);
  uint64_t v9 = objc_msgSend_external(self->_local, v6, v7, v8);
  uint64_t v13 = objc_msgSend_external(self->_remote, v10, v11, v12);
  SAToIPPortString(__str, 0x80uLL, v5);
  SAToIPPortString(v62, 0x80uLL, v9);
  SAToIPPortString(v54, 0x80uLL, v13);
  LODWORD(v13) = objc_msgSend_radioAccessTechnology(self->_local, v14, v15, v16);
  unsigned int v20 = objc_msgSend_radioAccessTechnology(self->_remote, v17, v18, v19);
  uint64_t v53 = objc_msgSend_mtu(self->_local, v21, v22, v23);
  uint64_t v27 = objc_msgSend_type(self->_local, v24, v25, v26);
  uint64_t v31 = objc_msgSend_type(self->_remote, v28, v29, v30);
  uint64_t v35 = objc_msgSend_mtu(self->_remote, v32, v33, v34);
  remote = self->_remote;
  local = self->_local;
  v52 = NSString;
  v37 = (&_IDSStunCandidateTypeStrings)[v27];
  v38 = IDSRadioAccessTechnologyToString(v13);
  v39 = (&_IDSStunCandidateTypeStrings)[v31];
  v40 = IDSRadioAccessTechnologyToString(v20);
  uint64_t v41 = bswap32(self->_channelNumber) >> 16;
  v42 = (&_IDSStunCandidatePairStateStrings)[self->_state];
  v46 = objc_msgSend_UUIDString(self->_linkUUID, v43, v44, v45);
  objc_msgSend_stringWithFormat_(v52, v47, @"[%s(%s,%p)-%s(%p)/%s/%s/%u/%s/%s/%u/(%04x)/%s/%@/%d|%d/%04x/%04x/%@/%@]", v48, __str, v62, local, v54, remote, v37, v38, v53, v39, v40, v35, v41, v42, v46, self->_linkID,
    self->_delegatedLinkID,
    self->_relayLinkID,
    self->_remoteRelayLinkID,
    self->_sessionID,
  v49 = self->_connections);

  return v49;
}

- (id)candidatePairToken
{
  uint64_t v5 = objc_msgSend_address(self->_local, a2, v2, v3);
  uint64_t v9 = objc_msgSend_external(self->_remote, v6, v7, v8);
  sessionID = self->_sessionID;
  return tokenForStunCandidatePair(v5, v9, sessionID);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_address(self->_local, v5, v6, v7);
  double v12 = objc_msgSend_local(v4, v9, v10, v11);
  uint64_t v16 = objc_msgSend_address(v12, v13, v14, v15);
  BOOL v17 = IsSameSA(v8, v16);

  uint64_t v21 = objc_msgSend_external(self->_remote, v18, v19, v20);
  uint64_t v25 = objc_msgSend_remote(v4, v22, v23, v24);
  uint64_t v29 = objc_msgSend_external((void *)v25, v26, v27, v28);
  BOOL v30 = IsSameSA(v21, v29);

  LODWORD(v25) = objc_msgSend_isRelayStunCandidate(self->_local, v31, v32, v33);
  v37 = objc_msgSend_local(v4, v34, v35, v36);
  int v41 = v25 ^ objc_msgSend_isRelayStunCandidate(v37, v38, v39, v40);

  if (self->_remoteRelayLinkID)
  {
    int relayLinkID = self->_relayLinkID;
    if (relayLinkID == objc_msgSend_relayLinkID(v4, v42, v43, v44))
    {
      int remoteRelayLinkID = self->_remoteRelayLinkID;
      BOOL v50 = remoteRelayLinkID == objc_msgSend_remoteRelayLinkID(v4, v46, v47, v48);
    }
    else
    {
      BOOL v50 = 0;
    }
  }
  else
  {
    BOOL v50 = 1;
  }
  BOOL v51 = v50 & ~(_BYTE)v41;
  BOOL v52 = v17 && v30 && v51;

  return v52;
}

- (BOOL)isRelayStunCandidatePair
{
  if (objc_msgSend_isRelayStunCandidate(self->_local, a2, v2, v3)) {
    return 1;
  }
  remote = self->_remote;
  return objc_msgSend_isRelayStunCandidate(remote, v5, v6, v7);
}

- (BOOL)isValidRelayStunCandidatePair
{
  uint64_t v5 = objc_msgSend_length(self->_relaySessionToken, a2, v2, v3);
  if (v5) {
    LOBYTE(v5) = objc_msgSend_length(self->_relaySessionKey, v6, v7, v8) != 0;
  }
  return v5;
}

- (BOOL)isSharedQRSession
{
  return self->_allocateType == 3;
}

- (BOOL)isSelfQRSession
{
  return self->_allocateType == 2;
}

- (BOOL)isVirtualRelayStunCandidatePair
{
  return self->_remoteRelayLinkID != 0;
}

- (BOOL)isActualRelayStunCandidatePair
{
  if (objc_msgSend_isVirtualRelayStunCandidatePair(self, a2, v2, v3)) {
    return 0;
  }
  return objc_msgSend_isRelayStunCandidatePair(self, v5, v6, v7);
}

- (BOOL)isP2P
{
  if (objc_msgSend_isVirtualRelayStunCandidatePair(self, a2, v2, v3)) {
    return 0;
  }
  else {
    return objc_msgSend_isRelayStunCandidatePair(self, v5, v6, v7) ^ 1;
  }
}

- (void)setPropertiesWithRelaySessionInfo:(id)a3 sessionInfoDict:(id)a4 enableSKE:(BOOL)a5
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  objc_msgSend_relaySessionToken(v9, v11, v12, v13);
  uint64_t v14 = (NSData *)objc_claimAutoreleasedReturnValue();
  relaySessionToken = self->_relaySessionToken;
  self->_relaySessionToken = v14;

  objc_msgSend_relaySessionKey(v9, v16, v17, v18);
  uint64_t v19 = (NSData *)objc_claimAutoreleasedReturnValue();
  relaySessionKey = self->_relaySessionKey;
  self->_relaySessionKey = v19;

  objc_msgSend_pskTransportParameters(v9, v21, v22, v23);
  double v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  pskTransportParameters = self->_pskTransportParameters;
  self->_pskTransportParameters = v24;

  objc_msgSend_pskH3Settings(v9, v26, v27, v28);
  uint64_t v29 = (NSString *)objc_claimAutoreleasedReturnValue();
  pskH3Settings = self->_pskH3Settings;
  self->_pskH3Settings = v29;

  self->_relayProviderType = objc_msgSend_relayServerProviderType(v9, v31, v32, v33);
  self->_int64_t allocateType = objc_msgSend_allocateType(v9, v34, v35, v36);
  objc_msgSend_allocateTime(v9, v37, v38, v39);
  self->_allocateTime = v40;
  self->_participantID = objc_msgSend_participantID(v9, v41, v42, v40);
  self->_isPseudoParticipant = objc_msgSend_isPseudoParticipant(v9, v43, v44, v45);
  self->_unint64_t callType = objc_msgSend_callType(v9, v46, v47, v48);
  self->_sessionIsNonUserParticipantInitiated = objc_msgSend_sessionIsUserParticipantInitiated(v9, v49, v50, v51);
  int v55 = objc_msgSend_handOffOverQREnabled(v9, v52, v53, v54);
  objc_msgSend_defaultDeviceLocalCBUUID(v9, v56, v57, v58);
  long long v59 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  defaultLocalDeviceCBUUID = self->_defaultLocalDeviceCBUUID;
  self->_defaultLocalDeviceCBUUID = v59;

  objc_msgSend_defaultDeviceRemoteCBUUID(v9, v61, v62, v63);
  long long v64 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  defaultRemoteDeviceCBUUID = self->_defaultRemoteDeviceCBUUID;
  self->_defaultRemoteDeviceCBUUID = v64;

  objc_msgSend_groupID(v9, v66, v67, v68);
  long long v69 = (NSString *)objc_claimAutoreleasedReturnValue();
  groupID = self->_groupID;
  self->_groupID = v69;

  self->_protocolVersion = objc_msgSend_protocolVersion(v9, v71, v72, v73);
  self->_isInitiator = objc_msgSend_isInitiator(v9, v74, v75, v76);
  objc_msgSend_softwareData(v9, v77, v78, v79);
  v80 = (NSData *)objc_claimAutoreleasedReturnValue();
  softwareData = self->_softwareData;
  self->_softwareData = v80;

  if (self->_softwareData)
  {
    id v85 = [NSString alloc];
    v88 = objc_msgSend_initWithData_encoding_(v85, v86, (uint64_t)self->_softwareData, v87, 4);
    if ((objc_msgSend_isEqualToString_(self->_appName, v89, (uint64_t)v88, v90) & 1) == 0)
    {
      v93 = objc_msgSend_base64EncodedStringWithOptions_(self->_softwareData, v91, 0, v92);
      v94 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        v95 = self->_softwareData;
        sessionID = self->_sessionID;
        *(_DWORD *)buf = 138412802;
        *(void *)v114 = v95;
        *(_WORD *)&v114[8] = 2112;
        *(void *)&v114[10] = v93;
        __int16 v115 = 2112;
        v116 = sessionID;
        _os_log_impl(&dword_19D9BE000, v94, OS_LOG_TYPE_DEFAULT, "update app name to (%@, %@) for %@.", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v111 = v93;
          v112 = self->_sessionID;
          v110 = self->_softwareData;
          _IDSLogTransport(@"GL", @"IDS", @"update app name to (%@, %@) for %@.");
          if (_IDSShouldLog())
          {
            v111 = v93;
            v112 = self->_sessionID;
            v110 = self->_softwareData;
            _IDSLogV(0, @"IDSFoundation", @"GL", @"update app name to (%@, %@) for %@.");
          }
        }
      }
      objc_storeStrong((id *)&self->_appName, v88);
    }
  }
  if (objc_msgSend_isInitiator(v9, v82, v83, v84, v110, v111, v112))
  {
    objc_msgSend_UUID(MEMORY[0x1E4F29128], v97, v98, v99);
    v100 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    linkUUID = self->_linkUUID;
    self->_linkUUID = v100;
  }
  objc_storeStrong((id *)&self->_relaySessionInfo, a3);
  objc_storeStrong((id *)&self->_sessionInfoDict, a4);
  self->_enableSKE = a5;
  int64_t allocateType = self->_allocateType;
  if (allocateType == 3)
  {
    unint64_t v103 = 293359;
    goto LABEL_18;
  }
  if (allocateType == 1 && self->_relayProviderType == 2)
  {
    unint64_t v103 = 8197;
LABEL_18:
    self->_unint64_t capabilityFlags = v103;
  }
  if (v55) {
    self->_capabilityFlags |= 0x1000000uLL;
  }
  v104 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t capabilityFlags = self->_capabilityFlags;
    *(_DWORD *)buf = 134218242;
    *(void *)v114 = capabilityFlags;
    *(_WORD *)&v114[8] = 2112;
    *(void *)&v114[10] = self;
    _os_log_impl(&dword_19D9BE000, v104, OS_LOG_TYPE_DEFAULT, "_capabilityFlags: 0x%llx for %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"_capabilityFlags: 0x%llx for %@");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"_capabilityFlags: 0x%llx for %@");
      }
    }
  }
  if (self->_sessionIsNonUserParticipantInitiated) {
    self->_unsigned int stateFlags = 1;
  }
  unint64_t callType = self->_callType;
  if (callType)
  {
    unsigned int stateFlags = self->_stateFlags;
    self->_unsigned int stateFlags = stateFlags | 2;
    if (callType == 1) {
      self->_unsigned int stateFlags = stateFlags | 6;
    }
  }
  v108 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v109 = self->_stateFlags;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v114 = v109;
    *(_WORD *)&v114[4] = 2112;
    *(void *)&v114[6] = self;
    _os_log_impl(&dword_19D9BE000, v108, OS_LOG_TYPE_DEFAULT, "_stateFlags: 0x%x for %@", buf, 0x12u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"_stateFlags: 0x%x for %@");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"_stateFlags: 0x%x for %@");
      }
    }
  }
}

- (void)setIsQUIC:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_isQUIC = a3;
  uint64_t v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"NO";
    unint64_t capabilityFlags = self->_capabilityFlags;
    *(_DWORD *)buf = 138412802;
    if (v3) {
      uint64_t v6 = @"YES";
    }
    id v9 = v6;
    __int16 v10 = 2048;
    unint64_t v11 = capabilityFlags;
    __int16 v12 = 2112;
    double v13 = self;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "QUICForQREnabled = %@ _capabilityFlags: 0x%llx for %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    _IDSLogTransport(@"GL", @"IDS", @"QUICForQREnabled = %@ _capabilityFlags: 0x%llx for %@");
    if (_IDSShouldLog()) {
      _IDSLogV(0, @"IDSFoundation", @"GL", @"QUICForQREnabled = %@ _capabilityFlags: 0x%llx for %@");
    }
  }
}

- (void)setPropertiesWithReallocCandidatePair:(id)a3 reallocToken:(id)a4
{
  objc_storeStrong((id *)&self->_relaySessionToken, a4);
  id v106 = a4;
  id v7 = a3;
  self->_pendingRealloc = 1;
  objc_msgSend_relaySessionInfo(v7, v8, v9, v10);
  unint64_t v11 = (IDSQuickRelaySessionInfo *)objc_claimAutoreleasedReturnValue();
  relaySessionInfo = self->_relaySessionInfo;
  self->_relaySessionInfo = v11;

  objc_msgSend_sessionInfoDict(v7, v13, v14, v15);
  uint64_t v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  sessionInfoDict = self->_sessionInfoDict;
  self->_sessionInfoDict = v16;

  self->_int64_t allocateType = objc_msgSend_allocateType(v7, v18, v19, v20);
  objc_msgSend_allocateTime(v7, v21, v22, v23);
  self->_allocateTime = v24;
  self->_participantID = objc_msgSend_participantID(v7, v25, v26, v24);
  objc_msgSend_relaySessionKey(v7, v27, v28, v29);
  BOOL v30 = (NSData *)objc_claimAutoreleasedReturnValue();
  relaySessionKey = self->_relaySessionKey;
  self->_relaySessionKey = v30;

  self->_relayProviderType = objc_msgSend_relayProviderType(v7, v32, v33, v34);
  objc_msgSend_pskTransportParameters(v7, v35, v36, v37);
  uint64_t v38 = (NSString *)objc_claimAutoreleasedReturnValue();
  pskTransportParameters = self->_pskTransportParameters;
  self->_pskTransportParameters = v38;

  objc_msgSend_pskH3Settings(v7, v40, v41, v42);
  uint64_t v43 = (NSString *)objc_claimAutoreleasedReturnValue();
  pskH3Settings = self->_pskH3Settings;
  self->_pskH3Settings = v43;

  self->_isAcceptedRelaySession = objc_msgSend_isAcceptedRelaySession(v7, v45, v46, v47);
  objc_msgSend_relayRemote(v7, v48, v49, v50);
  double v51 = (IDSStunCandidate *)objc_claimAutoreleasedReturnValue();
  relayRemote = self->_relayRemote;
  self->_relayRemote = v51;

  self->_recvSKEData = objc_msgSend_recvSKEData(v7, v53, v54, v55);
  self->_sentSKEData = objc_msgSend_sentSKEData(v7, v56, v57, v58);
  objc_msgSend_skeData(v7, v59, v60, v61);
  uint64_t v62 = (NSData *)objc_claimAutoreleasedReturnValue();
  skeData = self->_skeData;
  self->_skeData = v62;

  objc_msgSend_defaultLocalDeviceCBUUID(v7, v64, v65, v66);
  uint64_t v67 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  defaultLocalDeviceCBUUID = self->_defaultLocalDeviceCBUUID;
  self->_defaultLocalDeviceCBUUID = v67;

  objc_msgSend_defaultRemoteDeviceCBUUID(v7, v69, v70, v71);
  uint64_t v72 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  defaultRemoteDeviceCBUUID = self->_defaultRemoteDeviceCBUUID;
  self->_defaultRemoteDeviceCBUUID = v72;

  objc_msgSend_groupID(v7, v74, v75, v76);
  long long v77 = (NSString *)objc_claimAutoreleasedReturnValue();
  groupID = self->_groupID;
  self->_groupID = v77;

  objc_msgSend_linkUUID(v7, v79, v80, v81);
  v82 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  linkUUID = self->_linkUUID;
  self->_linkUUID = v82;

  self->_unint64_t capabilityFlags = objc_msgSend_capabilityFlags(v7, v84, v85, v86);
  self->_protocolVersion = objc_msgSend_protocolVersion(v7, v87, v88, v89);
  self->_isInitiator = objc_msgSend_isInitiator(v7, v90, v91, v92);
  self->_enableSKE = objc_msgSend_enableSKE(v7, v93, v94, v95);
  objc_msgSend_softwareData(v7, v96, v97, v98);
  double v99 = (NSData *)objc_claimAutoreleasedReturnValue();
  softwareData = self->_softwareData;
  self->_softwareData = v99;

  objc_msgSend_appName(v7, v101, v102, v103);
  v104 = (NSString *)objc_claimAutoreleasedReturnValue();

  appName = self->_appName;
  self->_appName = v104;
}

- (unsigned)nextSessionInfoReqID
{
  unsigned int v2 = self->_sessionInfoReqCount + 1;
  self->_sessionInfoReqCount = v2;
  return v2;
}

- (void)setLinkUUIDWithRelayLinkIDs
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v17 = 0;
  uint64_t v16 = 0;
  unsigned int relayLinkID = self->_relayLinkID;
  unsigned int remoteRelayLinkID = self->_remoteRelayLinkID;
  __int16 v5 = __rev16(relayLinkID);
  __int16 v6 = __rev16(remoteRelayLinkID);
  BOOL v7 = relayLinkID >= remoteRelayLinkID;
  if (relayLinkID >= remoteRelayLinkID) {
    __int16 v8 = v6;
  }
  else {
    __int16 v8 = v5;
  }
  if (v7) {
    __int16 v9 = v5;
  }
  else {
    __int16 v9 = v6;
  }
  v15[0] = v8;
  v15[1] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F29128]);
  double v13 = (NSUUID *)objc_msgSend_initWithUUIDBytes_(v10, v11, (uint64_t)v15, v12);
  linkUUID = self->_linkUUID;
  self->_linkUUID = v13;
}

- (void)synthesizeNat64WithPrefix
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v44 = v4;
  long long v45 = v4;
  long long v42 = v4;
  long long v43 = v4;
  long long v40 = v4;
  long long v41 = v4;
  *(_OWORD *)__str = v4;
  long long v39 = v4;
  long long v36 = v4;
  long long v37 = v4;
  long long v34 = v4;
  long long v35 = v4;
  long long v32 = v4;
  long long v33 = v4;
  *(_OWORD *)BOOL v30 = v4;
  long long v31 = v4;
  if (objc_msgSend_prefix(self->_local, a2, v2, -3.72066208e-103))
  {
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v28 = v7;
    long long v29 = v7;
    long long v26 = v7;
    long long v27 = v7;
    long long v24 = v7;
    long long v25 = v7;
    *(_OWORD *)uint64_t v22 = v7;
    long long v23 = v7;
    uint64_t v8 = objc_msgSend_address(self->_local, v5, v6, -3.72066208e-103);
    uint64_t v12 = objc_msgSend_external(self->_remote, v9, v10, v11);
    if (*(unsigned char *)(v8 + 1) == 30)
    {
      uint64_t v13 = v12;
      if (*(unsigned char *)(v12 + 1) == 2)
      {
        if (nw_nat64_synthesize_v6())
        {
          *(_WORD *)uint64_t v22 = 7708;
          *(_WORD *)&v22[2] = *(_WORD *)(v13 + 2);
          SAToIPPortString(__str, 0x80uLL, v13);
          SAToIPPortString(v30, 0x80uLL, (uint64_t)v22);
          objc_msgSend_setExternal_(self->_remote, v14, (uint64_t)v22, v15);
          uint64_t v16 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v19 = __str;
            __int16 v20 = 2080;
            uint64_t v21 = v30;
            _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "nat64 translation: %s -> %s.", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"nat64 translation: %s -> %s.");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"nat64 translation: %s -> %s.");
            }
          }
        }
      }
    }
  }
  else
  {
    int v17 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_19D9BE000, v17, OS_LOG_TYPE_DEFAULT, "nat64 translation failed due to invalid prefix.", v22, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"nat64 translation failed due to invalid prefix.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"nat64 translation failed due to invalid prefix.");
        }
      }
    }
  }
}

- (void)setPendingNoSessionState:(BOOL)a3
{
  self->_pendingNoSessionStateAllocbind = a3;
  if (a3) {
    ((void (*)(IDSStunCandidatePair *, char *, BOOL))MEMORY[0x1F4181798])(self, sel__startNoSessionStateTimer, a3);
  }
  else {
    objc_msgSend__stopNoSessionStateTimer(self, a2, a3, v3);
  }
}

- (void)_handleNoSessionStateTimer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  self->_pendingNoSessionStateAllocbind = 0;
  double v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    noSessionStateTimer = self->_noSessionStateTimer;
    *(_DWORD *)buf = 134217984;
    uint64_t v10 = noSessionStateTimer;
    _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEFAULT, "noSessionStateTimer %p fires, _noSessionStateTimer timed out.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v8 = self->_noSessionStateTimer;
      _IDSLogTransport(@"GL", @"IDS", @"noSessionStateTimer %p fires, _noSessionStateTimer timed out.");
      if (_IDSShouldLog())
      {
        uint64_t v8 = self->_noSessionStateTimer;
        _IDSLogV(0, @"IDSFoundation", @"GL", @"noSessionStateTimer %p fires, _noSessionStateTimer timed out.");
      }
    }
  }
  objc_msgSend__stopNoSessionStateTimer(self, v5, v6, v7, v8);
}

- (void)_startNoSessionStateTimer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  noSessionStateTimer = self->_noSessionStateTimer;
  if (noSessionStateTimer) {
    dispatch_source_cancel(noSessionStateTimer);
  }
  long long v4 = im_primary_queue();
  __int16 v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
  uint64_t v6 = self->_noSessionStateTimer;
  self->_noSessionStateTimer = v5;

  double v7 = self->_noSessionStateTimer;
  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v7, v8, 0x12A05F200uLL, 0x5F5E100uLL);
  __int16 v9 = self->_noSessionStateTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_19DB28334;
  handler[3] = &unk_1E5973BA8;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume((dispatch_object_t)self->_noSessionStateTimer);
  uint64_t v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = self->_noSessionStateTimer;
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = v11;
    _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "start noSessionStateTimer %p.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    _IDSLogTransport(@"GL", @"IDS", @"start noSessionStateTimer %p.");
    if (_IDSShouldLog()) {
      _IDSLogV(0, @"IDSFoundation", @"GL", @"start noSessionStateTimer %p.");
    }
  }
}

- (void)_stopNoSessionStateTimer
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  noSessionStateTimer = self->_noSessionStateTimer;
  if (noSessionStateTimer)
  {
    dispatch_source_cancel(noSessionStateTimer);
    long long v4 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v5 = self->_noSessionStateTimer;
      *(_DWORD *)buf = 134217984;
      dispatch_time_t v8 = v5;
      _os_log_impl(&dword_19D9BE000, v4, OS_LOG_TYPE_DEFAULT, "stop noSessionStateTimer %p.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"stop noSessionStateTimer %p.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"stop noSessionStateTimer %p.");
      }
    }
    uint64_t v6 = self->_noSessionStateTimer;
    self->_noSessionStateTimer = 0;
  }
}

- (void)setPendingRealloc:(BOOL)a3
{
  self->_pendingRealloc = a3;
  if (a3) {
    ((void (*)(IDSStunCandidatePair *, char *, BOOL))MEMORY[0x1F4181798])(self, sel__startReallocTimer, a3);
  }
  else {
    objc_msgSend__stopReallocTimer(self, a2, a3, v3);
  }
}

- (void)_handleReallocTimer
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  self->_pendingRealloc = 0;
  double v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    reallocTimer = self->_reallocTimer;
    *(_DWORD *)buf = 134217984;
    double v7 = reallocTimer;
    _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEFAULT, "realloc timer %p fires, realloc timed out.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"realloc timer %p fires, realloc timed out.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"realloc timer %p fires, realloc timed out.");
      }
    }
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19DB28698;
  v5[3] = &unk_1E5973568;
  v5[4] = self;
  IDSTransportThreadAddBlock(v5);
}

- (void)_startReallocTimer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  reallocTimer = self->_reallocTimer;
  if (reallocTimer) {
    dispatch_source_cancel(reallocTimer);
  }
  long long v4 = im_primary_queue();
  __int16 v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
  uint64_t v6 = self->_reallocTimer;
  self->_reallocTimer = v5;

  double v7 = self->_reallocTimer;
  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v7, v8, 0x12A05F200uLL, 0x5F5E100uLL);
  uint64_t v9 = self->_reallocTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_19DB288AC;
  handler[3] = &unk_1E5973BA8;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume((dispatch_object_t)self->_reallocTimer);
  uint64_t v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = self->_reallocTimer;
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = v11;
    _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "start realloc timer %p.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    _IDSLogTransport(@"GL", @"IDS", @"start realloc timer %p.");
    if (_IDSShouldLog()) {
      _IDSLogV(0, @"IDSFoundation", @"GL", @"start realloc timer %p.");
    }
  }
}

- (void)_stopReallocTimer
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  reallocTimer = self->_reallocTimer;
  if (reallocTimer)
  {
    dispatch_source_cancel(reallocTimer);
    long long v4 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v5 = self->_reallocTimer;
      *(_DWORD *)buf = 134217984;
      dispatch_time_t v8 = v5;
      _os_log_impl(&dword_19D9BE000, v4, OS_LOG_TYPE_DEFAULT, "stop realloc timer %p.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"stop realloc timer %p.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"stop realloc timer %p.");
      }
    }
    uint64_t v6 = self->_reallocTimer;
    self->_reallocTimer = 0;
  }
}

- (void)_handleSessionConnectedTimer
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    sessionConnectedTimer = self->_sessionConnectedTimer;
    __int16 v5 = _Block_copy(self->_sessionConnectedTimeoutBlock);
    *(_DWORD *)buf = 134218240;
    uint64_t v13 = sessionConnectedTimer;
    __int16 v14 = 2048;
    uint64_t v15 = v5;
    _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEFAULT, "session connected timer %p fired, block %p.", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v10 = self->_sessionConnectedTimer;
      uint64_t v11 = _Block_copy(self->_sessionConnectedTimeoutBlock);
      _IDSLogTransport(@"GL", @"IDS", @"session connected timer %p fired, block %p.");

      if (_IDSShouldLog())
      {
        uint64_t v10 = self->_sessionConnectedTimer;
        uint64_t v11 = _Block_copy(self->_sessionConnectedTimeoutBlock);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"session connected timer %p fired, block %p.");
      }
    }
  }
  id sessionConnectedTimeoutBlock = (void (**)(id, const char *))self->_sessionConnectedTimeoutBlock;
  if (sessionConnectedTimeoutBlock) {
    sessionConnectedTimeoutBlock[2](sessionConnectedTimeoutBlock, v6);
  }
  objc_msgSend_stopSessionConnectedTimer(self, v6, v7, v8, v10, v11);
}

- (void)startSessionConnectedTimer:(int)a3 block:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  sessionConnectedTimer = self->_sessionConnectedTimer;
  if (sessionConnectedTimer) {
    dispatch_source_cancel(sessionConnectedTimer);
  }
  double v8 = im_primary_queue();
  uint64_t v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v8);
  uint64_t v10 = self->_sessionConnectedTimer;
  self->_sessionConnectedTimer = v9;

  uint64_t v11 = self->_sessionConnectedTimer;
  dispatch_time_t v12 = dispatch_time(0, 1000000000 * a3);
  dispatch_source_set_timer(v11, v12, 1000000000 * a3, 0x5F5E100uLL);
  uint64_t v13 = self->_sessionConnectedTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_19DB28E84;
  handler[3] = &unk_1E5973BA8;
  handler[4] = self;
  dispatch_source_set_event_handler(v13, handler);
  __int16 v14 = _Block_copy(v6);
  id sessionConnectedTimeoutBlock = self->_sessionConnectedTimeoutBlock;
  self->_id sessionConnectedTimeoutBlock = v14;

  dispatch_resume((dispatch_object_t)self->_sessionConnectedTimer);
  uint64_t v16 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = self->_sessionConnectedTimer;
    uint64_t v18 = _Block_copy(self->_sessionConnectedTimeoutBlock);
    *(_DWORD *)buf = 134218496;
    long long v23 = v17;
    __int16 v24 = 1024;
    int v25 = a3;
    __int16 v26 = 2048;
    long long v27 = v18;
    _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "start session connected timer %p, timeout %d sec, block %p.", buf, 0x1Cu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v19 = _Block_copy(self->_sessionConnectedTimeoutBlock);
      _IDSLogTransport(@"GL", @"IDS", @"start session connected timer %p, timeout %d sec, block %p.");

      if (_IDSShouldLog())
      {
        __int16 v20 = _Block_copy(self->_sessionConnectedTimeoutBlock);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"start session connected timer %p, timeout %d sec, block %p.");
      }
    }
  }
}

- (void)stopSessionConnectedTimer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  sessionConnectedTimer = self->_sessionConnectedTimer;
  if (sessionConnectedTimer)
  {
    dispatch_source_cancel(sessionConnectedTimer);
    long long v4 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v5 = self->_sessionConnectedTimer;
      id v6 = _Block_copy(self->_sessionConnectedTimeoutBlock);
      *(_DWORD *)buf = 134218240;
      dispatch_time_t v12 = v5;
      __int16 v13 = 2048;
      __int16 v14 = v6;
      _os_log_impl(&dword_19D9BE000, v4, OS_LOG_TYPE_DEFAULT, "stop session connected timer %p, block %p.", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      uint64_t v9 = _Block_copy(self->_sessionConnectedTimeoutBlock);
      _IDSLogTransport(@"GL", @"IDS", @"stop session connected timer %p, block %p.");

      if (_IDSShouldLog())
      {
        uint64_t v10 = _Block_copy(self->_sessionConnectedTimeoutBlock);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"stop session connected timer %p, block %p.");
      }
    }
    uint64_t v7 = self->_sessionConnectedTimer;
    self->_sessionConnectedTimer = 0;

    id sessionConnectedTimeoutBlock = self->_sessionConnectedTimeoutBlock;
    self->_id sessionConnectedTimeoutBlock = 0;
  }
}

- (void)_handleSessionConvergenceTimer
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    sessionConvergenceTimer = self->_sessionConvergenceTimer;
    __int16 v5 = _Block_copy(self->_sessionConvergenceBlock);
    *(_DWORD *)buf = 134218240;
    __int16 v13 = sessionConvergenceTimer;
    __int16 v14 = 2048;
    uint64_t v15 = v5;
    _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEFAULT, "session convergence timer %p fired, block %p.", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v10 = self->_sessionConvergenceTimer;
      uint64_t v11 = _Block_copy(self->_sessionConvergenceBlock);
      _IDSLogTransport(@"GL", @"IDS", @"session convergence timer %p fired, block %p.");

      if (_IDSShouldLog())
      {
        uint64_t v10 = self->_sessionConvergenceTimer;
        uint64_t v11 = _Block_copy(self->_sessionConvergenceBlock);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"session convergence timer %p fired, block %p.");
      }
    }
  }
  id sessionConvergenceBlock = (void (**)(id, const char *))self->_sessionConvergenceBlock;
  if (sessionConvergenceBlock) {
    sessionConvergenceBlock[2](sessionConvergenceBlock, v6);
  }
  objc_msgSend_stopSessionConvergenceTimer(self, v6, v7, v8, v10, v11);
}

- (void)startSessionConvergenceTimer:(int)a3 block:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (*(_OWORD *)&self->_sessionConvergenceTimer == 0)
  {
    long long v23 = im_primary_queue();
    __int16 v24 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v23);
    sessionConvergenceTimer = self->_sessionConvergenceTimer;
    self->_sessionConvergenceTimer = v24;

    __int16 v26 = self->_sessionConvergenceTimer;
    dispatch_time_t v27 = dispatch_time(0, 1000000000 * (int)v4);
    dispatch_source_set_timer(v26, v27, 1000000000 * (int)v4, 0x5F5E100uLL);
    uint64_t v28 = self->_sessionConvergenceTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_19DB29660;
    handler[3] = &unk_1E5973BA8;
    handler[4] = self;
    dispatch_source_set_event_handler(v28, handler);
    long long v29 = _Block_copy(v6);
    id sessionConvergenceBlock = self->_sessionConvergenceBlock;
    self->_id sessionConvergenceBlock = v29;

    dispatch_resume((dispatch_object_t)self->_sessionConvergenceTimer);
    long long v31 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      long long v32 = self->_sessionConvergenceTimer;
      long long v33 = _Block_copy(self->_sessionConvergenceBlock);
      long long v37 = objc_msgSend_candidatePairToken(self, v34, v35, v36);
      *(_DWORD *)buf = 134218754;
      double v55 = v32;
      __int16 v56 = 1024;
      *(_DWORD *)uint64_t v57 = v4;
      *(_WORD *)&v57[4] = 2048;
      *(void *)&v57[6] = v33;
      *(_WORD *)&v57[14] = 2112;
      *(void *)&v57[16] = v37;
      _os_log_impl(&dword_19D9BE000, v31, OS_LOG_TYPE_DEFAULT, "start session convergence timer %p, timeout %d sec, block %p for %@.", buf, 0x26u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v38 = self->_sessionConvergenceTimer;
        long long v39 = _Block_copy(self->_sessionConvergenceBlock);
        objc_msgSend_candidatePairToken(self, v40, v41, v42);
        v51 = double v50 = v39;
        _IDSLogTransport(@"GL", @"IDS", @"start session convergence timer %p, timeout %d sec, block %p for %@.");

        if (_IDSShouldLog())
        {
          long long v43 = _Block_copy(self->_sessionConvergenceBlock);
          BOOL v52 = objc_msgSend_candidatePairToken(self, v44, v45, v46, v38, v4, v50, v51);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"start session convergence timer %p, timeout %d sec, block %p for %@.");
        }
      }
    }
  }
  else
  {
    uint64_t v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = self->_sessionConvergenceTimer;
      uint64_t v9 = _Block_copy(self->_sessionConvergenceBlock);
      __int16 v13 = objc_msgSend_candidatePairToken(self, v10, v11, v12);
      *(_DWORD *)buf = 134218498;
      double v55 = v8;
      __int16 v56 = 2048;
      *(void *)uint64_t v57 = v9;
      *(_WORD *)&v57[8] = 2112;
      *(void *)&v57[10] = v13;
      _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "session convergence timer %p and block %p for %@ are already scheduled.", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        __int16 v14 = self->_sessionConvergenceTimer;
        uint64_t v15 = _Block_copy(self->_sessionConvergenceBlock);
        objc_msgSend_candidatePairToken(self, v16, v17, v18);
        double v48 = v47 = v15;
        _IDSLogTransport(@"GL", @"IDS", @"session convergence timer %p and block %p for %@ are already scheduled.");

        if (_IDSShouldLog())
        {
          uint64_t v19 = _Block_copy(self->_sessionConvergenceBlock);
          uint64_t v49 = objc_msgSend_candidatePairToken(self, v20, v21, v22, v14, v47, v48);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"session convergence timer %p and block %p for %@ are already scheduled.");
        }
      }
    }
  }
}

- (void)stopSessionConvergenceTimer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  sessionConvergenceTimer = self->_sessionConvergenceTimer;
  if (sessionConvergenceTimer)
  {
    dispatch_source_cancel(sessionConvergenceTimer);
    uint64_t v4 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v5 = self->_sessionConvergenceTimer;
      id v6 = _Block_copy(self->_sessionConvergenceBlock);
      *(_DWORD *)buf = 134218240;
      double v12 = v5;
      __int16 v13 = 2048;
      __int16 v14 = v6;
      _os_log_impl(&dword_19D9BE000, v4, OS_LOG_TYPE_DEFAULT, "stop session convergence timer %p, block %p.", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      uint64_t v9 = _Block_copy(self->_sessionConvergenceBlock);
      _IDSLogTransport(@"GL", @"IDS", @"stop session convergence timer %p, block %p.");

      if (_IDSShouldLog())
      {
        uint64_t v10 = _Block_copy(self->_sessionConvergenceBlock);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"stop session convergence timer %p, block %p.");
      }
    }
    uint64_t v7 = self->_sessionConvergenceTimer;
    self->_sessionConvergenceTimer = 0;

    id sessionConvergenceBlock = self->_sessionConvergenceBlock;
    self->_id sessionConvergenceBlock = 0;
  }
}

- (void)_handleSessionGoAwayTimer
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    sessionConvergenceTimer = self->_sessionConvergenceTimer;
    __int16 v5 = _Block_copy(self->_sessionConvergenceBlock);
    *(_DWORD *)buf = 134218240;
    __int16 v13 = sessionConvergenceTimer;
    __int16 v14 = 2048;
    uint64_t v15 = v5;
    _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEFAULT, "session goaway timer %p fired, block %p.", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v10 = self->_sessionConvergenceTimer;
      uint64_t v11 = _Block_copy(self->_sessionConvergenceBlock);
      _IDSLogTransport(@"GL", @"IDS", @"session goaway timer %p fired, block %p.");

      if (_IDSShouldLog())
      {
        uint64_t v10 = self->_sessionConvergenceTimer;
        uint64_t v11 = _Block_copy(self->_sessionConvergenceBlock);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"session goaway timer %p fired, block %p.");
      }
    }
  }
  sessionGoAwayBlock = (void (**)(id, const char *))self->_sessionGoAwayBlock;
  if (sessionGoAwayBlock) {
    sessionGoAwayBlock[2](sessionGoAwayBlock, v6);
  }
  objc_msgSend_stopSessionGoAwayTimer(self, v6, v7, v8, v10, v11);
}

- (void)startSessionGoAwayTimer:(int)a3 block:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (*(_OWORD *)&self->_sessionGoAwayTimer == 0)
  {
    long long v23 = im_primary_queue();
    __int16 v24 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v23);
    sessionGoAwayTimer = self->_sessionGoAwayTimer;
    self->_sessionGoAwayTimer = v24;

    __int16 v26 = self->_sessionGoAwayTimer;
    dispatch_time_t v27 = dispatch_time(0, 1000000000 * (int)v4);
    dispatch_source_set_timer(v26, v27, 1000000000 * (int)v4, 0x5F5E100uLL);
    uint64_t v28 = self->_sessionGoAwayTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_19DB29E3C;
    handler[3] = &unk_1E5973BA8;
    handler[4] = self;
    dispatch_source_set_event_handler(v28, handler);
    long long v29 = _Block_copy(v6);
    id sessionGoAwayBlock = self->_sessionGoAwayBlock;
    self->_id sessionGoAwayBlock = v29;

    dispatch_resume((dispatch_object_t)self->_sessionGoAwayTimer);
    long long v31 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      long long v32 = self->_sessionGoAwayTimer;
      long long v33 = _Block_copy(self->_sessionGoAwayBlock);
      long long v37 = objc_msgSend_candidatePairToken(self, v34, v35, v36);
      *(_DWORD *)buf = 134218754;
      double v55 = v32;
      __int16 v56 = 1024;
      *(_DWORD *)uint64_t v57 = v4;
      *(_WORD *)&v57[4] = 2048;
      *(void *)&v57[6] = v33;
      *(_WORD *)&v57[14] = 2112;
      *(void *)&v57[16] = v37;
      _os_log_impl(&dword_19D9BE000, v31, OS_LOG_TYPE_DEFAULT, "start session goaway timer %p, timeout %d sec, block %p for %@.", buf, 0x26u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v38 = self->_sessionGoAwayTimer;
        long long v39 = _Block_copy(self->_sessionGoAwayBlock);
        objc_msgSend_candidatePairToken(self, v40, v41, v42);
        v51 = double v50 = v39;
        _IDSLogTransport(@"GL", @"IDS", @"start session goaway timer %p, timeout %d sec, block %p for %@.");

        if (_IDSShouldLog())
        {
          long long v43 = _Block_copy(self->_sessionGoAwayBlock);
          BOOL v52 = objc_msgSend_candidatePairToken(self, v44, v45, v46, v38, v4, v50, v51);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"start session goaway timer %p, timeout %d sec, block %p for %@.");
        }
      }
    }
  }
  else
  {
    uint64_t v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = self->_sessionGoAwayTimer;
      uint64_t v9 = _Block_copy(self->_sessionGoAwayBlock);
      __int16 v13 = objc_msgSend_candidatePairToken(self, v10, v11, v12);
      *(_DWORD *)buf = 134218498;
      double v55 = v8;
      __int16 v56 = 2048;
      *(void *)uint64_t v57 = v9;
      *(_WORD *)&v57[8] = 2112;
      *(void *)&v57[10] = v13;
      _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "session goaway timer %p and block %p for %@ are already scheduled.", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        __int16 v14 = self->_sessionGoAwayTimer;
        uint64_t v15 = _Block_copy(self->_sessionGoAwayBlock);
        objc_msgSend_candidatePairToken(self, v16, v17, v18);
        double v48 = v47 = v15;
        _IDSLogTransport(@"GL", @"IDS", @"session goaway timer %p and block %p for %@ are already scheduled.");

        if (_IDSShouldLog())
        {
          uint64_t v19 = _Block_copy(self->_sessionGoAwayBlock);
          uint64_t v49 = objc_msgSend_candidatePairToken(self, v20, v21, v22, v14, v47, v48);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"session goaway timer %p and block %p for %@ are already scheduled.");
        }
      }
    }
  }
}

- (void)stopSessionGoAwayTimer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  sessionGoAwayTimer = self->_sessionGoAwayTimer;
  if (sessionGoAwayTimer)
  {
    dispatch_source_cancel(sessionGoAwayTimer);
    uint64_t v4 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v5 = self->_sessionGoAwayTimer;
      id v6 = _Block_copy(self->_sessionGoAwayBlock);
      *(_DWORD *)buf = 134218240;
      double v12 = v5;
      __int16 v13 = 2048;
      __int16 v14 = v6;
      _os_log_impl(&dword_19D9BE000, v4, OS_LOG_TYPE_DEFAULT, "stop session GoAway timer %p, block %p.", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      uint64_t v9 = _Block_copy(self->_sessionGoAwayBlock);
      _IDSLogTransport(@"GL", @"IDS", @"stop session GoAway timer %p, block %p.");

      if (_IDSShouldLog())
      {
        uint64_t v10 = _Block_copy(self->_sessionGoAwayBlock);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"stop session GoAway timer %p, block %p.");
      }
    }
    uint64_t v7 = self->_sessionGoAwayTimer;
    self->_sessionGoAwayTimer = 0;

    id sessionGoAwayBlock = self->_sessionGoAwayBlock;
    self->_id sessionGoAwayBlock = 0;
  }
}

- (unsigned)hbCounter
{
  unsigned __int16 v2 = self->_hbCounter + 1;
  self->_hbCounter = v2;
  return v2;
}

- (void)setChannelSettings:(unsigned int)a3
{
  __int16 v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_statsIntervalInSeconds != a3)
  {
    int v5 = a3;
    id v6 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int statsIntervalInSeconds = self->_statsIntervalInSeconds;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)__int16 v13 = statsIntervalInSeconds;
      *(_WORD *)&v13[4] = 1024;
      *(_DWORD *)&v13[6] = v5;
      _os_log_impl(&dword_19D9BE000, v6, OS_LOG_TYPE_DEFAULT, "update stats interval (%u->%u).", buf, 0xEu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"update stats interval (%u->%u).");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"update stats interval (%u->%u).");
        }
      }
    }
    self->_int statsIntervalInSeconds = v3;
  }
  unsigned int v8 = v3 & 0x100;
  if (self->_serverIsDegraded != v8 >> 8)
  {
    uint64_t v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = @"YES";
      if (self->_serverIsDegraded) {
        uint64_t v11 = @"YES";
      }
      else {
        uint64_t v11 = @"NO";
      }
      if (!v8) {
        uint64_t v10 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)__int16 v13 = v11;
      *(_WORD *)&v13[8] = 2112;
      __int16 v14 = v10;
      _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "update server degraded status (%@->%@).", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"update server degraded status (%@->%@).");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"update server degraded status (%@->%@).");
      }
    }
    self->_serverIsDegraded = BYTE1(v8);
  }
}

- (void)setTestOptionsFromUserDefaults
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v16 = MEMORY[0x19F3AD8C0](@"com.apple.ids", @"QuickRelayTestOptions");
    uint64_t v15 = v16;
    if (!v16)
    {
LABEL_32:
      uint64_t v54 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        double testStartTime = self->_testStartTime;
        *(_DWORD *)buf = 138412546;
        long long v59 = v15;
        __int16 v60 = 2048;
        double v61 = testStartTime;
        _os_log_impl(&dword_19D9BE000, v54, OS_LOG_TYPE_DEFAULT, "test(%@) start time = %f", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"test(%@) start time = %f");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"test(%@) start time = %f");
          }
        }
      }
      goto LABEL_38;
    }
    uint64_t v19 = objc_msgSend_componentsSeparatedByString_(v16, v17, @",", v18);
    unint64_t v23 = objc_msgSend_count(v19, v20, v21, v22);
    if (v23 < 2)
    {
      double v42 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v42, OS_LOG_TYPE_DEFAULT, "invalid test configs", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"invalid test configs");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"invalid test configs");
          }
        }
      }
    }
    else
    {
      unint64_t v26 = v23;
      dispatch_time_t v27 = objc_msgSend_objectAtIndex_(v19, v24, 0, v25);
      self->_unsigned int testOptions = objc_msgSend_hexValue(v27, v28, v29, v30);

      if (self->_testOptions)
      {
        long long v33 = objc_msgSend_objectAtIndex_(v19, v31, v26 - 1, v32);
        objc_msgSend_doubleValue(v33, v34, v35, v36);
        self->_double testStartTime = v37;

        if (self->_testStartTime < 0.0) {
          self->_double testStartTime = 0.0;
        }
        double v39 = ids_monotonic_time() + self->_testStartTime;
        self->_double testStartTime = v39;
        if (v26 == 4)
        {
          uint64_t v45 = objc_msgSend_objectAtIndex_(v19, v38, 1, v39);
          self->_testRequestedMessageType = objc_msgSend_unsignedIntValue(v45, v46, v47, v48);

          testSubOperation = objc_msgSend_objectAtIndex_(v19, v49, 2, v50);
          self->_testRequestedErrorCode = objc_msgSend_unsignedIntValue(testSubOperation, v51, v52, v53);
        }
        else
        {
          if (v26 != 3)
          {
LABEL_31:

            goto LABEL_32;
          }
          objc_msgSend_objectAtIndex_(v19, v38, 1, v39);
          long long v40 = (NSString *)objc_claimAutoreleasedReturnValue();
          testSubOperation = self->_testSubOperation;
          self->_testSubOperation = v40;
        }

        goto LABEL_31;
      }
      long long v43 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int testOptions = self->_testOptions;
        *(_DWORD *)buf = 67109120;
        LODWORD(v59) = testOptions;
        _os_log_impl(&dword_19D9BE000, v43, OS_LOG_TYPE_DEFAULT, "Invalid unsigned int testOptions = %d", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"Invalid unsigned int testOptions = %d");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"Invalid unsigned int testOptions = %d");
          }
        }
      }
    }

    goto LABEL_38;
  }
  __int16 v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_msgSend_candidatePairToken(self, v4, v5, v6);
    unsigned int v8 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    long long v59 = v7;
    __int16 v60 = 2080;
    double v61 = *(double *)&v8;
    _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEFAULT, "skip setting test options for %@, state [%s].", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      __int16 v56 = objc_msgSend_candidatePairToken(self, v9, v10, v11);
      uint64_t v57 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(@"GL", @"IDS", @"skip setting test options for %@, state [%s].");

      if (_IDSShouldLog())
      {
        uint64_t v15 = objc_msgSend_candidatePairToken(self, v12, v13, v14, v56, v57);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"skip setting test options for %@, state [%s].");
LABEL_38:
      }
    }
  }
}

- (BOOL)hasNoSessionStateTestOptions
{
  return (self->_testOptions & 8) != 0 && self->_testRequestedErrorCode == 601;
}

- (BOOL)hasValidCapabilityFlags
{
  return self->_capabilityFlags != 0;
}

- (void)setRelayLinkID:(unsigned __int16)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_relayLinkID != a3)
  {
    int v3 = a3;
    uint64_t v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int relayLinkID = self->_relayLinkID;
      *(_DWORD *)buf = 67109634;
      int v8 = relayLinkID;
      __int16 v9 = 1024;
      int v10 = v3;
      __int16 v11 = 2112;
      double v12 = self;
      _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "update relay-link-id (%04x->%04x) for %@.", buf, 0x18u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"update relay-link-id (%04x->%04x) for %@.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"update relay-link-id (%04x->%04x) for %@.");
      }
    }
    self->_int relayLinkID = v3;
  }
}

- (void)setRemoteRelayLinkID:(unsigned __int16)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_remoteRelayLinkID != a3)
  {
    int v3 = a3;
    uint64_t v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int remoteRelayLinkID = self->_remoteRelayLinkID;
      *(_DWORD *)buf = 67109634;
      int v8 = remoteRelayLinkID;
      __int16 v9 = 1024;
      int v10 = v3;
      __int16 v11 = 2112;
      double v12 = self;
      _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "update remote relay-link-id (%04x->%04x) for %@.", buf, 0x18u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"update remote relay-link-id (%04x->%04x) for %@.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"update remote relay-link-id (%04x->%04x) for %@.");
      }
    }
    self->_int remoteRelayLinkID = v3;
  }
}

- (void)setDelegatedLinkID:(char)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_delegatedLinkID != a3)
  {
    int v3 = a3;
    uint64_t v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int delegatedLinkID = self->_delegatedLinkID;
      *(_DWORD *)buf = 67109634;
      int v8 = delegatedLinkID;
      __int16 v9 = 1024;
      int v10 = v3;
      __int16 v11 = 2112;
      double v12 = self;
      _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "update delegated linkID (%d->%d) for %@.", buf, 0x18u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"update delegated linkID (%d->%d) for %@.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"update delegated linkID (%d->%d) for %@.");
      }
    }
    self->_int delegatedLinkID = v3;
  }
}

- (void)setServerIsDegraded:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_serverIsDegraded != a3)
  {
    BOOL v3 = a3;
    uint64_t v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = @"YES";
      if (self->_serverIsDegraded) {
        uint64_t v7 = @"YES";
      }
      else {
        uint64_t v7 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      __int16 v9 = v7;
      __int16 v10 = 2112;
      if (!v3) {
        double v6 = @"NO";
      }
      __int16 v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = self;
      _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "update server degraded (%@->%@) for %@.", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"update server degraded (%@->%@) for %@.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"update server degraded (%@->%@) for %@.");
      }
    }
    self->_serverIsDegraded = v3;
  }
}

- (void)setProtocolVersion:(unsigned __int8)a3 isInitiator:(BOOL)a4 enableSKE:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  int v7 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  __int16 v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int protocolVersion = self->_protocolVersion;
    __int16 v11 = @"YES";
    if (self->_isInitiator) {
      __int16 v12 = @"YES";
    }
    else {
      __int16 v12 = @"NO";
    }
    if (v6) {
      uint64_t v13 = @"YES";
    }
    else {
      uint64_t v13 = @"NO";
    }
    sessionID = self->_sessionID;
    if (self->_enableSKE) {
      uint64_t v15 = @"YES";
    }
    else {
      uint64_t v15 = @"NO";
    }
    *(_DWORD *)buf = 67110658;
    if (!v5) {
      __int16 v11 = @"NO";
    }
    int v17 = protocolVersion;
    __int16 v18 = 1024;
    int v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    unint64_t v23 = v13;
    __int16 v24 = 2112;
    double v25 = v15;
    __int16 v26 = 2112;
    dispatch_time_t v27 = v11;
    __int16 v28 = 2112;
    uint64_t v29 = sessionID;
    _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "update protocol version (%u->%u), isInitiator (%@->%@), enableSKE (%@->%@) for %@.", buf, 0x40u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"update protocol version (%u->%u), isInitiator (%@->%@), enableSKE (%@->%@) for %@.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"update protocol version (%u->%u), isInitiator (%@->%@), enableSKE (%@->%@) for %@.");
      }
    }
  }
  self->_int protocolVersion = v7;
  self->_isInitiator = v6;
  self->_enableSKE = v5;
}

- (void)deriveAES128CTRKeys:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  if (StunUtilDeriveHKDFSha256Keys(self->_relaySessionKey, self->_sessionID, self->_participantID, v4, (uint64_t)&v41))
  {
    int v8 = (NSData *)objc_msgSend_copy(v4, v5, v6, v7);
    hbhSalt = self->_hbhSalt;
    self->_hbhSalt = v8;

    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v10, (uint64_t)&v41, v11, 16);
    __int16 v12 = (NSData *)objc_claimAutoreleasedReturnValue();
    encKey = self->_encKey;
    self->_encKey = v12;

    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v14, (uint64_t)&v42, v15, 16);
    uint64_t v16 = (NSData *)objc_claimAutoreleasedReturnValue();
    decKey = self->_decKey;
    self->_decKey = v16;

    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v18, (uint64_t)&v43, v19, 16);
    __int16 v20 = (NSData *)objc_claimAutoreleasedReturnValue();
    hmacKey = self->_hmacKey;
    self->_hmacKey = v20;

    __int16 v22 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v23 = self->_encKey;
      __int16 v24 = self->_decKey;
      double v25 = self->_hmacKey;
      relaySessionKey = self->_relaySessionKey;
      dispatch_time_t v27 = self->_hbhSalt;
      *(_DWORD *)buf = 138413570;
      uint64_t v30 = v23;
      __int16 v31 = 2112;
      double v32 = v24;
      __int16 v33 = 2112;
      long long v34 = v25;
      __int16 v35 = 2112;
      double v36 = relaySessionKey;
      __int16 v37 = 2112;
      uint64_t v38 = v27;
      __int16 v39 = 2112;
      long long v40 = self;
      _os_log_impl(&dword_19D9BE000, v22, OS_LOG_TYPE_DEFAULT, "derived AES128-CTR keys: %@, %@, %@ relaySessionKey = %@, salt = %@ for %@", buf, 0x3Eu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"derived AES128-CTR keys: %@, %@, %@ relaySessionKey = %@, salt = %@ for %@");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"derived AES128-CTR keys: %@, %@, %@ relaySessionKey = %@, salt = %@ for %@");
        }
      }
    }
  }
  else
  {
    __int16 v28 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v28, OS_LOG_TYPE_DEFAULT, "StunUtilDeriveHKDFSha256Keys failed.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"StunUtilDeriveHKDFSha256Keys failed.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"StunUtilDeriveHKDFSha256Keys failed.");
        }
      }
    }
  }
}

- (unint64_t)getParticipantIDHash:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  macOut[0] = v4;
  macOut[1] = v4;
  unint64_t data = bswap64(objc_msgSend_unsignedLongLongValue(a3, a2, (uint64_t)a3, -3.72066208e-103));
  int v8 = (const void *)objc_msgSend_bytes(self->_hmacKey, v5, v6, v7);
  size_t v12 = objc_msgSend_length(self->_hmacKey, v9, v10, v11);
  CCHmac(2u, v8, v12, &data, 8uLL, macOut);
  return bswap64(*(unint64_t *)&macOut[0]);
}

- (void)_addParticipantIDs:(id)a3 toParticipantIDMap:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  Mutable = (NSDictionary *)a4;
  uint64_t v10 = objc_msgSend_allKeys(Mutable, v7, v8, v9);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v11 = v5;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v41, v13, v45, 16);
  if (v14)
  {
    uint64_t v18 = v14;
    uint64_t v19 = *(void *)v42;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v42 != v19) {
          objc_enumerationMutation(v11);
        }
        uint64_t v21 = NSNumber;
        uint64_t v22 = objc_msgSend_unsignedLongLongValue(*(void **)(*((void *)&v41 + 1) + 8 * v20), v15, v16, v17);
        double v25 = objc_msgSend_numberWithUnsignedLongLong_(v21, v23, v22, v24);
        if ((objc_msgSend_containsObject_(v10, v26, (uint64_t)v25, v27) & 1) == 0)
        {
          uint64_t ParticipantIDHash = objc_msgSend_getParticipantIDHash_(self, v28, (uint64_t)v25, v29);
          if (!Mutable) {
            Mutable = (NSDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          }
          id v32 = v25;
          if (v32)
          {
            long long v34 = (const void *)objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v31, ParticipantIDHash, v33);
            CFDictionarySetValue((CFMutableDictionaryRef)Mutable, v34, v32);
          }

          __int16 v37 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v35, ParticipantIDHash, v36);
          if (v37) {
            CFDictionarySetValue((CFMutableDictionaryRef)Mutable, v32, v37);
          }
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v15, (uint64_t)&v41, v17, v45, 16);
    }
    while (v18);
  }

  participantIDMap = self->_participantIDMap;
  self->_participantIDMap = Mutable;
  __int16 v39 = Mutable;
}

- (void)initParticipantIDMap:(id)a3
{
  id v6 = a3;
  if (self->_hmacKey)
  {
    uint64_t v10 = objc_msgSend_allParticipantIDs(self->_relaySessionInfo, v4, v5, v7);
    if (v6)
    {
      size_t v12 = objc_msgSend_mutableCopy(v6, v8, v9, v11);
      objc_msgSend__addParticipantIDs_toParticipantIDMap_(self, v13, (uint64_t)v10, v14, v12);
    }
    else
    {
      size_t v12 = 0;
      objc_msgSend__addParticipantIDs_toParticipantIDMap_(self, v8, (uint64_t)v10, v11, 0);
    }
  }
  else
  {
    double v15 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_DEFAULT, "initParticipantIDMap failed due to invalid hmac key.", v16, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"initParticipantIDMap failed due to invalid hmac key.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"initParticipantIDMap failed due to invalid hmac key.");
        }
      }
    }
  }
}

- (void)updateParticipantIDMap:(id)a3
{
  id v6 = a3;
  if (self->_hmacKey)
  {
    uint64_t v8 = objc_msgSend_mutableCopy(self->_participantIDMap, v4, v5, v7);
    objc_msgSend__addParticipantIDs_toParticipantIDMap_(self, v9, (uint64_t)v6, v10, v8);
    char linkID = self->_linkID;
    double v15 = objc_msgSend_description(v8, v12, v13, v14);
    uint64_t v27 = MEMORY[0x1E4F143A8];
    char v29 = linkID;
    id v16 = v15;
    __int16 v28 = v16;
    cut_dispatch_log_queue();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      id v19 = objc_loadWeakRetained((id *)&self->_delegate);
      unint64_t v23 = objc_msgSend_copy(self->_participantIDMap, v20, v21, v22, v27, 3221225472, sub_19DB2BA60, &unk_1E5975860, v16, v29);
      objc_msgSend_candidatePair_didReceiveMappedParticipantsDict_forLinkID_(v19, v24, (uint64_t)self, v25, v23, self->_linkID);
    }
  }
  else
  {
    __int16 v26 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v26, OS_LOG_TYPE_DEFAULT, "updateParticipantIDMap failed due to invalid hmac key.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"updateParticipantIDMap failed due to invalid hmac key.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"updateParticipantIDMap failed due to invalid hmac key.");
        }
      }
    }
  }
}

- (void)removeFromParticipantIDMap:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v29 = v4;
  if (self->_hmacKey)
  {
    uint64_t v8 = v4;
    uint64_t v9 = (__CFDictionary *)objc_msgSend_mutableCopy(self->_participantIDMap, v5, v6, v7);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = v8;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v30, v12, v40, 16);
    if (v14)
    {
      uint64_t v16 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v10);
          }
          char v18 = *(const void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t ParticipantIDHash = objc_msgSend_getParticipantIDHash_(self, v13, (uint64_t)v18, v15);
          if (v18) {
            BOOL v22 = v9 != 0;
          }
          else {
            BOOL v22 = 0;
          }
          if (v22) {
            CFDictionaryRemoveValue(v9, v18);
          }
          if (objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v19, ParticipantIDHash, v21)) {
            BOOL v23 = v9 != 0;
          }
          else {
            BOOL v23 = 0;
          }
          if (v23)
          {
            double v24 = (const void *)objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v13, ParticipantIDHash, v15);
            CFDictionaryRemoveValue(v9, v24);
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v30, v15, v40, 16);
      }
      while (v14);
    }

    objc_storeStrong((id *)&self->_participantIDMap, v9);
    double v25 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int linkID = self->_linkID;
      participantIDMap = self->_participantIDMap;
      *(_DWORD *)buf = 138412802;
      id v35 = v10;
      __int16 v36 = 1024;
      int v37 = linkID;
      __int16 v38 = 2112;
      __int16 v39 = participantIDMap;
      _os_log_impl(&dword_19D9BE000, v25, OS_LOG_TYPE_DEFAULT, "removed %@ from participantID map for link %d:%@", buf, 0x1Cu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"removed %@ from participantID map for link %d:%@");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"removed %@ from participantID map for link %d:%@");
        }
      }
    }
  }
  else
  {
    __int16 v28 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v28, OS_LOG_TYPE_DEFAULT, "removeFromParticipantIDMap failed due to invalid hmac key.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"removeFromParticipantIDMap failed due to invalid hmac key.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"removeFromParticipantIDMap failed due to invalid hmac key.");
        }
      }
    }
  }
}

- (void)updateURIToParticipantIDMapping:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  Value = 0;
  CFDictionaryRef theDict = v3;
  if (v3 && @"qal") {
    Value = (void *)CFDictionaryGetValue(v3, @"qal");
  }
  id v5 = Value;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  __int16 v60 = v5;
  objc_msgSend_addObjectsFromArray_(v6, v7, (uint64_t)v5, v8);
  if (!self->_URIToParticipantIDs)
  {
    Mutable = (NSDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    URIToParticipantIDs = self->_URIToParticipantIDs;
    self->_URIToParticipantIDs = Mutable;
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v6;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v64, v12, v72, 16);
  if (v15)
  {
    uint64_t v16 = *(void *)v65;
    uint64_t v17 = 138412546;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v65 != v16) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v19 = *(const __CFDictionary **)(*((void *)&v64 + 1) + 8 * i);
        if (v19) {
          BOOL v20 = @"qri" == 0;
        }
        else {
          BOOL v20 = 1;
        }
        if (v20) {
          double v21 = 0;
        }
        else {
          double v21 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(*((void *)&v64 + 1) + 8 * i), @"qri");
        }
        BOOL v22 = NSNumber;
        uint64_t v23 = objc_msgSend_unsignedLongLongValue(v21, v13, v14, *(double *)&v17);
        __int16 v26 = objc_msgSend_numberWithUnsignedLongLong_(v22, v24, v23, v25);
        if (v19 != 0 && @"tP" != 0)
        {
          uint64_t v27 = (id)CFDictionaryGetValue(v19, @"tP");
          if (v27)
          {
            long long v30 = v27;
            long long v31 = objc_msgSend_objectForKeyedSubscript_(self->_URIToParticipantIDs, v28, (uint64_t)v27, v29);
            long long v34 = v31;
            if (v31)
            {
              if ((objc_msgSend_containsObject_(v31, v32, (uint64_t)v26, v33) & 1) == 0)
              {
                objc_msgSend_addObject_(v34, v35, (uint64_t)v26, v36);
                CFDictionarySetValue((CFMutableDictionaryRef)self->_URIToParticipantIDs, v30, v34);
              }
            }
            else
            {
              id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              objc_msgSend_addObject_(v37, v38, (uint64_t)v26, v39);
              id v40 = v37;
              if (v40)
              {
                CFDictionarySetValue((CFMutableDictionaryRef)self->_URIToParticipantIDs, v30, v40);
              }
              else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v69 = (uint64_t)v30;
                __int16 v70 = 2080;
                double v71 = "_URIToParticipantIDs";
                _os_log_error_impl(&dword_19D9BE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
              }
            }
          }
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v64, *(double *)&v17, v72, 16);
    }
    while (v15);
  }

  long long v44 = objc_msgSend_description(self->_URIToParticipantIDs, v41, v42, v43);
  if (@"qai") {
    BOOL v45 = theDict != 0;
  }
  else {
    BOOL v45 = 0;
  }
  if (v45)
  {
    uint64_t v46 = (id)CFDictionaryGetValue(theDict, @"qai");
    if (v46)
    {
      uint64_t v47 = IDSLoggableDescriptionForObjectOnService(v44, v46);

      long long v44 = (void *)v47;
    }
  }
  else
  {
    uint64_t v46 = 0;
  }
  double v48 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v52 = objc_msgSend_count(self->_URIToParticipantIDs, v49, v50, v51);
    *(_DWORD *)buf = 134218242;
    uint64_t v69 = v52;
    __int16 v70 = 2112;
    double v71 = (const char *)v44;
    _os_log_impl(&dword_19D9BE000, v48, OS_LOG_TYPE_DEFAULT, "URIToParticipantIDs count %lu: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v59 = objc_msgSend_count(self->_URIToParticipantIDs, v53, v54, v55);
      _IDSLogTransport(@"GL", @"IDS", @"URIToParticipantIDs count %lu: %@");
      if (_IDSShouldLog())
      {
        objc_msgSend_count(self->_URIToParticipantIDs, v56, v57, v58, v59, v44);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"URIToParticipantIDs count %lu: %@");
      }
    }
  }
}

- (unint64_t)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  participantIDMap = self->_participantIDMap;
  id v10 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v8, a3, v9);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(participantIDMap, v11, (uint64_t)v10, v12);

  if (v13)
  {
    unint64_t v17 = objc_msgSend_unsignedLongLongValue(v13, v14, v15, v16);
    unint64_t v18 = IDSIDAliasHashUInt64(v17, v6);
    CFDictionaryRef v19 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218755;
      uint64_t v32 = objc_msgSend_unsignedLongLongValue(v13, v20, v21, v22);
      __int16 v33 = 2048;
      unint64_t v34 = a3;
      __int16 v35 = 2112;
      id v36 = v6;
      __int16 v37 = 2049;
      unint64_t v38 = v18;
      _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "createAliasForParticipantID real participantID %llu translated %llu salt %@ to alias %{private}llu", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v30 = objc_msgSend_unsignedLongLongValue(v13, v23, v24, v25);
        _IDSLogTransport(@"GL", @"IDS", @"createAliasForParticipantID real participantID %llu translated %llu salt %@ to alias %{private}llu");
        if (_IDSShouldLog())
        {
          objc_msgSend_unsignedLongLongValue(v13, v26, v27, v28, v30, a3, v6, v18);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"createAliasForParticipantID real participantID %llu translated %llu salt %@ to alias %{private}llu");
        }
      }
    }
  }
  else
  {
    unint64_t v18 = 0;
  }

  return v18;
}

- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v7 = self->_participantIDMap;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v19, v9, v27, 16);
  if (v12)
  {
    uint64_t v14 = *(void *)v20;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v7);
        }
        unint64_t v16 = objc_msgSend_unsignedLongLongValue(*(void **)(*((void *)&v19 + 1) + 8 * v15), v10, v11, v13);
        if (IDSIDAliasHashUInt64(v16, v6) == a3)
        {

          goto LABEL_17;
        }
        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v19, v13, v27, 16);
      if (v12) {
        continue;
      }
      break;
    }
  }

  unint64_t v17 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v24 = a3;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_19D9BE000, v17, OS_LOG_TYPE_DEFAULT, "participantIDForAlias: No match found for alias %llu salt %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"participantIDForAlias: No match found for alias %llu salt %@");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"participantIDForAlias: No match found for alias %llu salt %@");
      }
    }
  }
  unint64_t v16 = 0;
LABEL_17:

  return v16;
}

- (BOOL)_didLocalExternalAddressChange:(const sockaddr *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v26 = v4;
  long long v27 = v4;
  long long v24 = v4;
  long long v25 = v4;
  long long v22 = v4;
  long long v23 = v4;
  *(_OWORD *)__str = v4;
  long long v21 = v4;
  long long v18 = v4;
  long long v19 = v4;
  long long v16 = v4;
  long long v17 = v4;
  long long v14 = v4;
  long long v15 = v4;
  *(_OWORD *)uint64_t v12 = v4;
  long long v13 = v4;
  uint64_t v5 = objc_msgSend_external(self->_local, a2, (uint64_t)a3, -3.72066208e-103);
  id v6 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v9 = SAToIPPortString(__str, 0x80uLL, v5);
    __int16 v10 = 2080;
    uint64_t v11 = SAToIPPortString(v12, 0x80uLL, (uint64_t)a3);
    _os_log_impl(&dword_19D9BE000, v6, OS_LOG_TYPE_DEFAULT, "original external address = %s, new external address = %s", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      SAToIPPortString(__str, 0x80uLL, v5);
      SAToIPPortString(v12, 0x80uLL, (uint64_t)a3);
      _IDSLogTransport(@"GL", @"IDS", @"original external address = %s, new external address = %s");
      if (_IDSShouldLog())
      {
        SAToIPPortString(__str, 0x80uLL, v5);
        SAToIPPortString(v12, 0x80uLL, (uint64_t)a3);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"original external address = %s, new external address = %s");
      }
    }
  }
  return !IsSameSA((uint64_t)a3, v5) && a3->sa_family != 0;
}

- (void)addStunRequest:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((objc_msgSend_containsObject_(self->_pendingStunRequests, v5, (uint64_t)v4, v6) & 1) == 0)
  {
    pendingStunRequests = self->_pendingStunRequests;
    if (!pendingStunRequests)
    {
      double v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      double v9 = self->_pendingStunRequests;
      self->_pendingStunRequests = v8;

      pendingStunRequests = self->_pendingStunRequests;
    }
    if (v4 && pendingStunRequests) {
      CFArrayAppendValue((CFMutableArrayRef)pendingStunRequests, v4);
    }
    __int16 v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      long long v14 = self;
      _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "add pending stun request: %@ for %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV(0, @"IDSFoundation", @"GL", @"add pending stun request: %@ for %@");
    }
  }
}

- (void)removeStunRequest:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_containsObject_(self->_pendingStunRequests, v5, (uint64_t)v4, v6))
  {
    objc_msgSend_removeObject_(self->_pendingStunRequests, v7, (uint64_t)v4, v8);
    double v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      long long v18 = self;
      _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "remove pending stun request: %@ for %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v13 = v4;
        long long v14 = self;
        _IDSLogTransport(@"GL", @"IDS", @"remove pending stun request: %@ for %@");
        if (_IDSShouldLog())
        {
          id v13 = v4;
          long long v14 = self;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"remove pending stun request: %@ for %@");
        }
      }
    }
  }
  if (objc_msgSend_containsObject_(self->_repliedStunRequests, v7, (uint64_t)v4, v8, v13, v14))
  {
    objc_msgSend_removeObject_(self->_repliedStunRequests, v10, (uint64_t)v4, v11);
    id v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      long long v18 = self;
      _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "remove replied stun request: %@ for %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"remove replied stun request: %@ for %@");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"remove replied stun request: %@ for %@");
        }
      }
    }
  }
}

- (BOOL)shouldRexmitStunRequest:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_containsObject_(self->_repliedStunRequests, v5, (uint64_t)v4, v6)) {
    char v9 = 0;
  }
  else {
    char v9 = objc_msgSend_containsObject_(self->_pendingStunRequests, v7, (uint64_t)v4, v8);
  }

  return v9;
}

- (BOOL)shouldProcessStunResponse:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v8 = objc_msgSend_containsObject_(self->_pendingStunRequests, v5, (uint64_t)v4, v6);
  if (v8)
  {
    repliedStunRequests = self->_repliedStunRequests;
    if (!repliedStunRequests)
    {
      double v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v12 = self->_repliedStunRequests;
      self->_repliedStunRequests = v11;

      repliedStunRequests = self->_repliedStunRequests;
    }
    if (v4 && repliedStunRequests) {
      CFArrayAppendValue((CFMutableArrayRef)repliedStunRequests, v4);
    }
    objc_msgSend_removeObject_(self->_pendingStunRequests, v7, (uint64_t)v4, v9);
  }
  else
  {
    id v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      long long v18 = self;
      _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_DEFAULT, "stun request %@ is no longer pending for %@, ignore response.", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"stun request %@ is no longer pending for %@, ignore response.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"stun request %@ is no longer pending for %@, ignore response.");
        }
      }
    }
  }

  return v8;
}

- (void)_savePluginNameForRequest:(id)a3 pluginName:(id)a4
{
  id key = a3;
  id v6 = a4;
  if (objc_msgSend_containsObject_(self->_pendingStunRequests, v7, (uint64_t)key, v8))
  {
    if (self->_pluginNameToStunReqID)
    {
      if (!v6) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    pluginNameToStunReqID = self->_pluginNameToStunReqID;
    self->_pluginNameToStunReqID = Mutable;

    if (v6) {
LABEL_4:
    }
      CFDictionarySetValue((CFMutableDictionaryRef)self->_pluginNameToStunReqID, key, v6);
  }
LABEL_5:
}

- (id)_pluginNameForStunRequest:(id)a3
{
  Value = 0;
  if (a3)
  {
    pluginNameToStunReqID = self->_pluginNameToStunReqID;
    if (pluginNameToStunReqID) {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)pluginNameToStunReqID, a3);
    }
    uint64_t v3 = vars8;
  }
  return Value;
}

- (void)_removeStunPluginRegistrationRequest:(id)a3
{
  objc_msgSend_removeObjectForKey_(self->_pluginNameToStunReqID, a2, (uint64_t)a3, v3);
}

- (void)updateStunSentBytes:(int64_t)a3 requestID:(id)a4
{
  id v6 = a4;
  if ((a3 & 0x8000000000000000) == 0)
  {
    Value = 0;
    id key = v6;
    if (v6 && self->_stunSentBytesToRequestID) {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_stunSentBytesToRequestID, v6);
    }
    uint64_t v11 = a3 + objc_msgSend_unsignedIntValue(Value, (const char *)v6, v7, v8);
    if (!self->_stunSentBytesToRequestID)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      stunSentBytesToRequestID = self->_stunSentBytesToRequestID;
      self->_stunSentBytesToRequestID = Mutable;
    }
    uint64_t v15 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v10, v11, v12);
    if (v15) {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_stunSentBytesToRequestID, key, v15);
    }

    id v6 = key;
  }
}

- (unint64_t)getStunSentBytes:(id)a3
{
  id v6 = a3;
  if (v6 && (stunSentBytesToRequestID = self->_stunSentBytesToRequestID) != 0)
  {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)stunSentBytesToRequestID, v6);
    unsigned int v13 = objc_msgSend_unsignedIntValue(Value, v10, v11, v12);
  }
  else
  {
    unsigned int v13 = objc_msgSend_unsignedIntValue(0, v4, v5, v7);
    if (!v6) {
      goto LABEL_7;
    }
  }
  long long v14 = self->_stunSentBytesToRequestID;
  if (v14) {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)v14, v6);
  }
LABEL_7:

  return v13;
}

- (void)sendStatsRequest:(id)a3 options:(id)a4
{
  *(void *)&v87[13] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v9 = a4;
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    long long v23 = objc_msgSend_requestID(v6, v7, v8, v10);
    double v24 = ids_monotonic_time();
    objc_msgSend_startTime(v6, v25, v26, v24);
    if (v29 == 0.0
      || (uint64_t v31 = self->_statsIntervalInSeconds >> 1,
          double v30 = v24 - v29,
          BOOL v32 = v24 - v29 < (double)v31,
          double v24 = v29,
          v32))
    {
      if (v23 && (objc_msgSend_shouldRexmitStunRequest_(self, v27, (uint64_t)v23, v29, v30) & 1) == 0)
      {
        objc_msgSend_removeStunRequest_(self, v27, (uint64_t)v23, v29);
      }
      else
      {
        __int16 v33 = objc_msgSend_transactionID(v6, v27, v28, v29, v30);
        unint64_t v34 = StunUtilCreateMessage(3811, v33, self, v9);

        if (v34)
        {
          objc_msgSend_requestID(v34, v35, v36, v37);
          unint64_t v38 = (const void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_setStartTime_(v34, v39, v40, v24);
          objc_msgSend_addStunRequest_(self, v41, (uint64_t)v38, v42);
          Value = 0;
          if (v9)
          {
            double v43 = (const char *)@"ids-extchannel-stat-identifier-key";
            if (@"ids-extchannel-stat-identifier-key") {
              Value = (void *)CFDictionaryGetValue((CFDictionaryRef)v9, @"ids-extchannel-stat-identifier-key");
            }
          }
          uint64_t v49 = objc_msgSend_unsignedLongLongValue(Value, v43, v44, v45);
          double v51 = 0;
          if (self->_requestIDToStatsIDs && v38) {
            double v51 = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_requestIDToStatsIDs, v38);
          }
          uint64_t v52 = objc_msgSend_unsignedLongLongValue(v51, v47, v48, v50);
          if (v49 && v49 != v52)
          {
            if (!self->_requestIDToStatsIDs)
            {
              Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
              requestIDToStatsIDs = self->_requestIDToStatsIDs;
              self->_requestIDToStatsIDs = Mutable;
            }
            uint64_t v57 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v53, v49, v54);
            if (v57) {
              CFDictionarySetValue((CFMutableDictionaryRef)self->_requestIDToStatsIDs, v38, v57);
            }

            double v58 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              uint64_t v85 = v49;
              __int16 v86 = 2112;
              *(void *)double v87 = v38;
              _os_log_impl(&dword_19D9BE000, v58, OS_LOG_TYPE_DEFAULT, "add stats identifier %llu for %@.", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"add stats identifier %llu for %@.");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"add stats identifier %llu for %@.");
                }
              }
            }
          }
          uint64_t v59 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            int linkID = self->_linkID;
            *(_DWORD *)buf = 138412802;
            uint64_t v85 = (uint64_t)v38;
            __int16 v86 = 1024;
            *(_DWORD *)double v87 = linkID;
            v87[2] = 2048;
            *(void *)&v87[3] = v49;
            _os_log_impl(&dword_19D9BE000, v59, OS_LOG_TYPE_DEFAULT, "send stats req %@ for link %d, statsIdentifier: %llu.", buf, 0x1Cu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"GL", @"IDS", @"send stats req %@ for link %d, statsIdentifier: %llu.");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"GL", @"send stats req %@ for link %d, statsIdentifier: %llu.");
              }
            }
          }
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend_sendStunMessage_candidatePair_(WeakRetained, v62, (uint64_t)v34, v63, self);

          if ((unint64_t)(objc_msgSend_transport(self->_local, v64, v65, v66) - 1) > 1)
          {
            long long v23 = (void *)v38;
            id v6 = v34;
          }
          else
          {
            v81[0] = MEMORY[0x1E4F143A8];
            v81[1] = 3221225472;
            v81[2] = sub_19DB2D984;
            v81[3] = &unk_1E5974300;
            v81[4] = self;
            id v6 = v34;
            id v82 = v6;
            id v83 = v9;
            IDSTransportThreadAddBlockAfter(v81, 1.0);

            long long v23 = (void *)v38;
          }
        }
        else
        {
          long long v67 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D9BE000, v67, OS_LOG_TYPE_DEFAULT, "failed to create stats request.", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"GL", @"IDS", @"failed to create stats request.");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to create stats request.");
              }
            }
          }
          id v6 = 0;
        }
      }
    }
    else
    {
      double v68 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v85 = (uint64_t)v23;
        __int16 v86 = 1024;
        *(_DWORD *)double v87 = v31;
        _os_log_impl(&dword_19D9BE000, v68, OS_LOG_TYPE_DEFAULT, "stats request %@ timed out after %u seconds.", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          long long v77 = v23;
          uint64_t v79 = v31;
          _IDSLogTransport(@"GL", @"IDS", @"stats request %@ timed out after %u seconds.");
          if (_IDSShouldLog())
          {
            long long v77 = v23;
            uint64_t v79 = v31;
            _IDSLogV(0, @"IDSFoundation", @"GL", @"stats request %@ timed out after %u seconds.");
          }
        }
      }
      objc_msgSend_removeStunRequest_(self, v70, (uint64_t)v23, v71, v77, v79);
      uint64_t v72 = self->_requestIDToStatsIDs;
      if (v72)
      {
        if (v23)
        {
          uint64_t v73 = (id)CFDictionaryGetValue((CFDictionaryRef)v72, v23);
          if (v73)
          {
            double v76 = v73;
            objc_msgSend_removeObjectForKey_(self->_requestIDToStatsIDs, v74, (uint64_t)v23, v75);
          }
        }
      }
    }
    goto LABEL_59;
  }
  uint64_t v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend_candidatePairToken(self, v12, v13, v14);
    id v16 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    uint64_t v85 = (uint64_t)v15;
    __int16 v86 = 2080;
    *(void *)double v87 = v16;
    _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "skip stats request for %@, state [%s].", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v78 = objc_msgSend_candidatePairToken(self, v17, v18, v19);
      uint64_t v80 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(@"GL", @"IDS", @"skip stats request for %@, state [%s].");

      if (_IDSShouldLog())
      {
        long long v23 = objc_msgSend_candidatePairToken(self, v20, v21, v22, v78, v80);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"skip stats request for %@, state [%s].");
LABEL_59:
      }
    }
  }
}

- (void)sendInfoRequest:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = v4;
  if (self->_state < 5)
  {
    uint64_t v21 = objc_msgSend_requestID(v4, v5, v6, v7);
    if (v8)
    {
      double v22 = ids_monotonic_time();
      objc_msgSend_startTime(v8, v23, v24, v22);
      double v27 = v22 - v26;
      if (v27 >= 10.0)
      {
        uint64_t v28 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v32 = objc_msgSend_transactionID(v8, v29, v30, v31);
          *(_DWORD *)buf = 138412546;
          id v83 = v32;
          __int16 v84 = 1024;
          LODWORD(v85) = 10;
          _os_log_impl(&dword_19D9BE000, v28, OS_LOG_TYPE_DEFAULT, "info request %@ timed out after %d seconds.", buf, 0x12u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            long long v74 = objc_msgSend_transactionID(v8, v33, v34, v35);
            uint64_t v76 = 10;
            _IDSLogTransport(@"GL", @"IDS", @"info request %@ timed out after %d seconds.");

            if (_IDSShouldLog())
            {
              long long v74 = objc_msgSend_transactionID(v8, v36, v37, v38, v74, 10);
              uint64_t v76 = 10;
              _IDSLogV(0, @"IDSFoundation", @"GL", @"info request %@ timed out after %d seconds.");
            }
          }
        }
        GLUtilReportAWDStunMessageEvent(v8, 26, self, 0.0);
        uint64_t v40 = GLUCreateQRStunMessageEvent(v8, 26, self, 0, 0.0);
        if (v40) {
          objc_msgSend__notifyQREventAdded_(self, v39, (uint64_t)v40, v41);
        }
        objc_msgSend_removeStunRequest_(self, v39, (uint64_t)v21, v41, v74, v76);
        objc_msgSend_processSessionInfoRequestTimeout_(self, v42, (uint64_t)v21, v43);

        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v44 = StunUtilCreateMessage(3812, 0, self, 0);
      id v8 = v44;
      if (!v44)
      {
        uint64_t v73 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v73, OS_LOG_TYPE_DEFAULT, "failed to create info request.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"failed to create info request.");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to create info request.");
            }
          }
        }
        id v8 = 0;
        goto LABEL_38;
      }
      uint64_t v48 = objc_msgSend_requestID(v44, v45, v46, v47);

      objc_msgSend_addStunRequest_(self, v49, v48, v50);
      uint64_t v21 = (void *)v48;
    }
    if (objc_msgSend_shouldRexmitStunRequest_(self, v25, (uint64_t)v21, v27))
    {
      double v53 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v54, v55, v56);
        uint64_t v57 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        id v83 = v8;
        __int16 v84 = 2112;
        uint64_t v85 = v57;
        _os_log_impl(&dword_19D9BE000, v53, OS_LOG_TYPE_DEFAULT, "send info request %@ for %@.", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v78 = objc_msgSend_candidatePairToken(self, v58, v59, v60);
          _IDSLogTransport(@"GL", @"IDS", @"send info request %@ for %@.");

          if (_IDSShouldLog())
          {
            uint64_t v79 = objc_msgSend_candidatePairToken(self, v61, v62, v63, v8, v78);
            _IDSLogV(0, @"IDSFoundation", @"GL", @"send info request %@ for %@.");
          }
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v67 = objc_msgSend_sendStunMessage_candidatePair_(WeakRetained, v65, (uint64_t)v8, v66, self);

      objc_msgSend_updateStunSentBytes_requestID_(self, v68, v67, v69, v21);
      if ((unint64_t)(objc_msgSend_transport(self->_local, v70, v71, v72) - 1) <= 1)
      {
        v80[0] = MEMORY[0x1E4F143A8];
        v80[1] = 3221225472;
        v80[2] = sub_19DB2E028;
        v80[3] = &unk_1E5973CF8;
        v80[4] = self;
        id v8 = v8;
        id v81 = v8;
        IDSTransportThreadAddBlockAfter(v80, 1.0);
      }
    }
    else
    {
      objc_msgSend_removeStunRequest_(self, v51, (uint64_t)v21, v52);
    }
    goto LABEL_38;
  }
  id v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_msgSend_candidatePairToken(self, v10, v11, v12);
    double v14 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    id v83 = v13;
    __int16 v84 = 2080;
    uint64_t v85 = v14;
    _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "skip info request for %@, state [%s].", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      double v75 = objc_msgSend_candidatePairToken(self, v15, v16, v17);
      long long v77 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(@"GL", @"IDS", @"skip info request for %@, state [%s].");

      if (_IDSShouldLog())
      {
        uint64_t v21 = objc_msgSend_candidatePairToken(self, v18, v19, v20, v75, v77);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"skip info request for %@, state [%s].");
LABEL_38:
      }
    }
  }
}

- (void)sendQRPluginRegistrationRequest:(id)a3 options:(id)a4
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v9 = a4;
  if (self->_state < 5)
  {
    long long v23 = objc_msgSend_requestID(v6, v7, v8, v10);
    if (v6)
    {
      double v24 = ids_monotonic_time();
      objc_msgSend_startTime(v6, v25, v26, v24);
      double v29 = v24 - v28;
      if (v29 >= 10.0)
      {
        uint64_t v80 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v84 = objc_msgSend_transactionID(v6, v81, v82, v83);
          *(_DWORD *)buf = 138412546;
          id v109 = v84;
          __int16 v110 = 1024;
          LODWORD(v111) = 10;
          _os_log_impl(&dword_19D9BE000, v80, OS_LOG_TYPE_DEFAULT, "plugin registration request %@ timed out after %d seconds.", buf, 0x12u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            double v99 = objc_msgSend_transactionID(v6, v85, v86, v87);
            uint64_t v101 = 10;
            _IDSLogTransport(@"GL", @"IDS", @"plugin registration request %@ timed out after %d seconds.");

            if (_IDSShouldLog())
            {
              double v99 = objc_msgSend_transactionID(v6, v88, v89, v90, v99, 10);
              uint64_t v101 = 10;
              _IDSLogV(0, @"IDSFoundation", @"GL", @"plugin registration request %@ timed out after %d seconds.");
            }
          }
        }
        GLUtilReportAWDStunMessageEvent(v6, 26, self, 0.0);
        double v92 = GLUCreateQRStunMessageEvent(v6, 33, self, 0, 0.0);
        if (v92) {
          objc_msgSend__notifyQREventAdded_(self, v91, (uint64_t)v92, v93);
        }
        objc_msgSend_removeStunRequest_(self, v91, (uint64_t)v23, v93, v99, v101);
        objc_msgSend__removeStunPluginRegistrationRequest_(self, v94, (uint64_t)v23, v95);

        goto LABEL_48;
      }
      uint64_t v30 = (uint64_t)v23;
      char shouldRexmitStunRequest = objc_msgSend_shouldRexmitStunRequest_(self, v27, (uint64_t)v23, v29);
    }
    else
    {
      StunUtilCreateMessage(3816, 0, self, v9);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v37 = objc_msgSend_encKey(self, v34, v35, v36);
      objc_msgSend_initAES128CTR_(v6, v38, (uint64_t)v37, v39);

      if (!v6)
      {
        double v98 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v98, OS_LOG_TYPE_DEFAULT, "failed to create QR plugin registration request.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"failed to create QR plugin registration request.");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to create QR plugin registration request.");
            }
          }
        }
        id v6 = 0;
        goto LABEL_48;
      }
      uint64_t v30 = objc_msgSend_requestID(v6, v40, v41, v42);

      objc_msgSend_addStunRequest_(self, v43, v30, v44);
      Value = 0;
      if (v9)
      {
        double v45 = (const char *)@"gl-option-plugin-operation";
        if (@"gl-option-plugin-operation") {
          Value = (void *)CFDictionaryGetValue((CFDictionaryRef)v9, @"gl-option-plugin-operation");
        }
      }
      int isEqualToNumber = objc_msgSend_isEqualToNumber_(Value, v45, (uint64_t)&unk_1EF028D68, v46);
      uint64_t v49 = @"Unregister";
      if (isEqualToNumber) {
        uint64_t v49 = @"Register";
      }
      double v51 = v49;
      double v53 = 0;
      double v54 = NSString;
      if (v9)
      {
        double v50 = (const char *)@"gl-option-plugin-name";
        if (@"gl-option-plugin-name") {
          double v53 = CFDictionaryGetValue((CFDictionaryRef)v9, @"gl-option-plugin-name");
        }
      }
      uint64_t v55 = objc_msgSend_stringWithFormat_(v54, v50, @"%@.%@", v52, v53, v51);
      objc_msgSend__savePluginNameForRequest_pluginName_(self, v56, v30, v57, v55);

      char shouldRexmitStunRequest = objc_msgSend_shouldRexmitStunRequest_(self, v58, v30, v59);
    }
    if (shouldRexmitStunRequest)
    {
      double v60 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v61, v62, v63);
        long long v64 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        id v109 = v6;
        __int16 v110 = 2112;
        v111 = v64;
        _os_log_impl(&dword_19D9BE000, v60, OS_LOG_TYPE_DEFAULT, "send QR plugin registration request %@ for %@.", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          double v103 = objc_msgSend_candidatePairToken(self, v65, v66, v67);
          _IDSLogTransport(@"GL", @"IDS", @"send QR plugin registration request %@ for %@.");

          if (_IDSShouldLog())
          {
            v104 = objc_msgSend_candidatePairToken(self, v68, v69, v70, v6, v103);
            _IDSLogV(0, @"IDSFoundation", @"GL", @"send QR plugin registration request %@ for %@.");
          }
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v74 = objc_msgSend_sendStunMessage_candidatePair_(WeakRetained, v72, (uint64_t)v6, v73, self);

      objc_msgSend_updateStunSentBytes_requestID_(self, v75, v74, v76, v30);
      if ((unint64_t)(objc_msgSend_transport(self->_local, v77, v78, v79) - 1) <= 1)
      {
        v105[0] = MEMORY[0x1E4F143A8];
        v105[1] = 3221225472;
        v105[2] = sub_19DB2E7C8;
        v105[3] = &unk_1E5974300;
        v105[4] = self;
        id v6 = v6;
        id v106 = v6;
        id v107 = v9;
        IDSTransportThreadAddBlockAfter(v105, 1.0);
      }
    }
    else
    {
      objc_msgSend_removeStunRequest_(self, v32, v30, v33);
      objc_msgSend__removeStunPluginRegistrationRequest_(self, v96, v30, v97);
    }
    long long v23 = (void *)v30;
LABEL_48:

    goto LABEL_49;
  }
  uint64_t v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend_candidatePairToken(self, v12, v13, v14);
    uint64_t v16 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    id v109 = v15;
    __int16 v110 = 2080;
    v111 = v16;
    _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "skip plugin registration request for %@, state [%s].", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v100 = objc_msgSend_candidatePairToken(self, v17, v18, v19);
      uint64_t v102 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(@"GL", @"IDS", @"skip plugin registration request for %@, state [%s].");

      if (_IDSShouldLog())
      {
        long long v23 = objc_msgSend_candidatePairToken(self, v20, v21, v22, v100, v102);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"skip plugin registration request for %@, state [%s].");
        goto LABEL_48;
      }
    }
  }
LABEL_49:
}

- (void)sendSessionInfoRequest:(id)a3 options:(id)a4
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v9 = a4;
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    long long v23 = objc_msgSend_requestID(v6, v7, v8, v10);
    if (v6)
    {
      double v24 = ids_monotonic_time();
      objc_msgSend_startTime(v6, v25, v26, v24);
      double v29 = v24 - v28;
      if (v29 >= 10.0)
      {
        double v79 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          double v83 = objc_msgSend_transactionID(v6, v80, v81, v82);
          *(_DWORD *)buf = 138412546;
          id v117 = v83;
          __int16 v118 = 1024;
          LODWORD(v119) = 10;
          _os_log_impl(&dword_19D9BE000, v79, OS_LOG_TYPE_DEFAULT, "session-info request %@ timed out after %d seconds.", buf, 0x12u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v108 = objc_msgSend_transactionID(v6, v84, v85, v86);
            uint64_t v110 = 10;
            _IDSLogTransport(@"GL", @"IDS", @"session-info request %@ timed out after %d seconds.");

            if (_IDSShouldLog())
            {
              v108 = objc_msgSend_transactionID(v6, v87, v88, v89, v108, 10);
              uint64_t v110 = 10;
              _IDSLogV(0, @"IDSFoundation", @"GL", @"session-info request %@ timed out after %d seconds.");
            }
          }
        }
        GLUtilReportAWDStunMessageEvent(v6, 30, self, 0.0);
        uint64_t v91 = GLUCreateQRStunMessageEvent(v6, 30, self, 0, 0.0);
        if (v91) {
          objc_msgSend__notifyQREventAdded_(self, v90, (uint64_t)v91, v92);
        }
        objc_msgSend_removeStunRequest_(self, v90, (uint64_t)v23, v92, v108, v110);
        objc_msgSend_processSessionInfoRequestTimeout_(self, v93, (uint64_t)v23, v94);

        goto LABEL_52;
      }
      uint64_t v30 = v23;
    }
    else
    {
      double v54 = StunUtilCreateMessage(3813, 0, self, v9);
      id v6 = v54;
      if (!v54)
      {
        double v99 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v99, OS_LOG_TYPE_DEFAULT, "failed to create session-info request.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"failed to create session-info request.");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to create session-info request.");
            }
          }
        }
        id v6 = 0;
        goto LABEL_52;
      }
      objc_msgSend_initAES128CTR_(v54, v55, (uint64_t)self->_encKey, v56);
      objc_msgSend_requestID(v6, v57, v58, v59);
      uint64_t v30 = (const void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_addStunRequest_(self, v60, (uint64_t)v30, v61);
      Value = 0;
      if (v9)
      {
        uint64_t v62 = (const char *)@"gl-option-sessioninfo-link-id-to-query";
        if (@"gl-option-sessioninfo-link-id-to-query") {
          Value = (void *)CFDictionaryGetValue((CFDictionaryRef)v9, @"gl-option-sessioninfo-link-id-to-query");
        }
      }
      char v67 = objc_msgSend_intValue(Value, v62, v63, v64);
      requestIDToQueryLinkIDs = self->_requestIDToQueryLinkIDs;
      if (!requestIDToQueryLinkIDs)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        uint64_t v71 = self->_requestIDToQueryLinkIDs;
        self->_requestIDToQueryLinkIDs = Mutable;

        requestIDToQueryLinkIDs = self->_requestIDToQueryLinkIDs;
      }
      double v72 = objc_msgSend_numberWithChar_(NSNumber, v66, v67, v68);
      objc_msgSend_setObject_forKey_(requestIDToQueryLinkIDs, v73, (uint64_t)v72, v74, v30);

      if (!self->_requestIDToSessionInfoReqType)
      {
        double v75 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        requestIDToSessionInfoReqType = self->_requestIDToSessionInfoReqType;
        self->_requestIDToSessionInfoReqType = v75;
      }
      if (v9)
      {
        double v27 = (const char *)@"gl-option-sessioninfo-request-type";
        if (@"gl-option-sessioninfo-request-type")
        {
          long long v77 = (id)CFDictionaryGetValue((CFDictionaryRef)v9, @"gl-option-sessioninfo-request-type");
          if (v77)
          {
            uint64_t v78 = v77;
            CFDictionarySetValue((CFMutableDictionaryRef)self->_requestIDToSessionInfoReqType, v30, v77);
          }
        }
      }
    }
    if (objc_msgSend_shouldRexmitStunRequest_(self, v27, (uint64_t)v30, v29))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v36 = objc_msgSend_sendStunMessage_candidatePair_(WeakRetained, v34, (uint64_t)v6, v35, self);

      if (v36 == -2)
      {
        double v39 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_candidatePairToken(self, v40, v41, v42);
          double v43 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          id v117 = v6;
          __int16 v118 = 2112;
          v119 = v43;
          _os_log_impl(&dword_19D9BE000, v39, OS_LOG_TYPE_DEFAULT, "error: failed to send session-info request %@ for %@ because it exceeds MTU size", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_candidatePairToken(self, v44, v46, v45);
            uint64_t v110 = v108 = v6;
            _IDSLogTransport(@"GL", @"IDS", @"error: failed to send session-info request %@ for %@ because it exceeds MTU size");

            if (_IDSShouldLog())
            {
              objc_msgSend_candidatePairToken(self, v44, v47, v45, v6, v110);
              uint64_t v110 = v108 = v6;
              _IDSLogV(0, @"IDSFoundation", @"GL", @"error: failed to send session-info request %@ for %@ because it exceeds MTU size");
            }
          }
        }
        objc_msgSend_removeStunRequest_(self, v44, (uint64_t)v30, v45, v108, v110);
        id v48 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend_candidatePair_didReceiveSessionInfo_status_(v48, v49, (uint64_t)self, v50, 0, 1);

        double v52 = GLUCreateQRStunMessageEvent(v6, 36, self, 0, 0.0);
        if (v52) {
          objc_msgSend__notifyQREventAdded_(self, v51, (uint64_t)v52, v53);
        }
      }
      else
      {
        objc_msgSend_updateStunSentBytes_requestID_(self, v37, v36, v38, v30);
        v100 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_candidatePairToken(self, v101, v102, v103);
          v104 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          id v117 = v6;
          __int16 v118 = 2112;
          v119 = v104;
          __int16 v120 = 2048;
          uint64_t v121 = v36;
          _os_log_impl(&dword_19D9BE000, v100, OS_LOG_TYPE_DEFAULT, "send session-info request %@ for %@, sentBytes: %lu", buf, 0x20u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            uint64_t v110 = objc_msgSend_candidatePairToken(self, v105, v106, v107);
            uint64_t v112 = v36;
            v108 = v6;
            _IDSLogTransport(@"GL", @"IDS", @"send session-info request %@ for %@, sentBytes: %lu");

            if (_IDSShouldLog())
            {
              uint64_t v110 = objc_msgSend_candidatePairToken(self, v105, v106, v107, v6, v110, v36);
              uint64_t v112 = v36;
              v108 = v6;
              _IDSLogV(0, @"IDSFoundation", @"GL", @"send session-info request %@ for %@, sentBytes: %lu");
            }
          }
        }
        if ((unint64_t)(objc_msgSend_transport(self->_local, v105, v106, v107, v108, v110, v112) - 1) <= 1)
        {
          v113[0] = MEMORY[0x1E4F143A8];
          v113[1] = 3221225472;
          v113[2] = sub_19DB2F164;
          v113[3] = &unk_1E5974300;
          v113[4] = self;
          id v6 = v6;
          id v114 = v6;
          id v115 = v9;
          IDSTransportThreadAddBlockAfter(v113, 1.0);
        }
      }
    }
    else
    {
      objc_msgSend_removeStunRequest_(self, v31, (uint64_t)v30, v32);
      objc_msgSend_removeObjectForKey_(self->_requestIDToQueryLinkIDs, v95, (uint64_t)v30, v96);
      objc_msgSend_removeObjectForKey_(self->_requestIDToSessionInfoReqType, v97, (uint64_t)v30, v98);
    }
    long long v23 = (void *)v30;
LABEL_52:

    goto LABEL_53;
  }
  uint64_t v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend_candidatePairToken(self, v12, v13, v14);
    uint64_t v16 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    id v117 = v15;
    __int16 v118 = 2080;
    v119 = v16;
    _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "skip session-info request for %@, state [%s].", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v109 = objc_msgSend_candidatePairToken(self, v17, v18, v19);
      v111 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(@"GL", @"IDS", @"skip session-info request for %@, state [%s].");

      if (_IDSShouldLog())
      {
        long long v23 = objc_msgSend_candidatePairToken(self, v20, v21, v22, v109, v111);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"skip session-info request for %@, state [%s].");
        goto LABEL_52;
      }
    }
  }
LABEL_53:
}

- (void)sendPutMaterialRequest:(id)a3 options:(id)a4
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v9 = a4;
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    long long v23 = objc_msgSend_requestID(v6, v7, v8, v10);
    if (v6)
    {
      double v24 = ids_monotonic_time();
      objc_msgSend_startTime(v6, v25, v26, v24);
      double v29 = v24 - v28;
      if (v29 >= 10.0)
      {
        uint64_t v78 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          double v82 = objc_msgSend_transactionID(v6, v79, v80, v81);
          *(_DWORD *)buf = 138412546;
          double v99 = v82;
          __int16 v100 = 1024;
          LODWORD(v101) = 10;
          _os_log_impl(&dword_19D9BE000, v78, OS_LOG_TYPE_DEFAULT, "PutMaterial request %@ timed out after %d seconds.", buf, 0x12u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            uint64_t v91 = objc_msgSend_transactionID(v6, v83, v85, v84);
            uint64_t v93 = 10;
            _IDSLogTransport(@"GL", @"IDS", @"PutMaterial request %@ timed out after %d seconds.");

            if (_IDSShouldLog())
            {
              uint64_t v91 = objc_msgSend_transactionID(v6, v83, v86, v84, v91, 10);
              uint64_t v93 = 10;
              _IDSLogV(0, @"IDSFoundation", @"GL", @"PutMaterial request %@ timed out after %d seconds.");
            }
          }
        }
        objc_msgSend_removeStunRequest_(self, v83, (uint64_t)v23, v84, v91, v93);
        uint64_t v88 = GLUCreateQRStunMessageEventWithEventSubType(244, 40, self, 0, 10.0);
        if (v88) {
          objc_msgSend__notifyQREventAdded_(self, v87, (uint64_t)v88, v89);
        }

        goto LABEL_53;
      }
      uint64_t v30 = v6;
    }
    else
    {
      double v31 = StunUtilCreateMessage(3817, 0, self, v9);
      uint64_t v30 = v31;
      if (!v31)
      {
        double v90 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v90, OS_LOG_TYPE_DEFAULT, "failed to create PutMaterial request.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"failed to create PutMaterial request.");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to create PutMaterial request.");
            }
          }
        }
        id v6 = 0;
        goto LABEL_53;
      }
      objc_msgSend_initAES128CTR_(v31, v32, (uint64_t)self->_encKey, v33);
      uint64_t v37 = objc_msgSend_requestID(v30, v34, v35, v36);

      objc_msgSend_addStunRequest_(self, v38, v37, v39);
      long long v23 = (void *)v37;
    }
    if (objc_msgSend_shouldRexmitStunRequest_(self, v27, (uint64_t)v23, v29))
    {
      double v42 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v43, v44, v45);
        uint64_t v46 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        double v99 = v30;
        __int16 v100 = 2112;
        uint64_t v101 = v46;
        _os_log_impl(&dword_19D9BE000, v42, OS_LOG_TYPE_DEFAULT, "send PutMaterial request %@ for %@.", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_candidatePairToken(self, v47, v48, v49);
          v93 = uint64_t v91 = v30;
          _IDSLogTransport(@"GL", @"IDS", @"send PutMaterial request %@ for %@.");

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(self, v50, v51, v52, v30, v93);
            v93 = uint64_t v91 = v30;
            _IDSLogV(0, @"IDSFoundation", @"GL", @"send PutMaterial request %@ for %@.");
          }
        }
      }
      BOOL v53 = v6 != 0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v57 = objc_msgSend_sendStunMessage_candidatePair_(WeakRetained, v55, (uint64_t)v30, v56, self);

      char v60 = v57 != -2 || v53;
      if ((v60 & 1) == 0)
      {
        double v61 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_candidatePairToken(self, v62, v63, v64);
          uint64_t v65 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          double v99 = v30;
          __int16 v100 = 2112;
          uint64_t v101 = v65;
          _os_log_impl(&dword_19D9BE000, v61, OS_LOG_TYPE_DEFAULT, "warning: send PutMaterial request %@ for %@ exceeds MTU size", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_candidatePairToken(self, v66, v67, v68);
            v93 = uint64_t v91 = v30;
            _IDSLogTransport(@"GL", @"IDS", @"warning: send PutMaterial request %@ for %@ exceeds MTU size");

            if (_IDSShouldLog())
            {
              objc_msgSend_candidatePairToken(self, v69, v70, v71, v30, v93);
              v93 = uint64_t v91 = v30;
              _IDSLogV(0, @"IDSFoundation", @"GL", @"warning: send PutMaterial request %@ for %@ exceeds MTU size");
            }
          }
        }
        double v73 = GLUCreateQRStunMessageEvent(v30, 36, self, 0, 0.0);
        if (v73) {
          objc_msgSend__notifyQREventAdded_(self, v72, (uint64_t)v73, v74);
        }
      }
      objc_msgSend_updateStunSentBytes_requestID_(self, v58, v57, v59, v23, v91, v93);
      if ((unint64_t)(objc_msgSend_transport(self->_local, v75, v76, v77) - 1) <= 1)
      {
        v95[0] = MEMORY[0x1E4F143A8];
        v95[1] = 3221225472;
        v95[2] = sub_19DB2F998;
        v95[3] = &unk_1E5974300;
        v95[4] = self;
        id v6 = v30;
        id v96 = v6;
        id v97 = v9;
        IDSTransportThreadAddBlockAfter(v95, 1.0);

        goto LABEL_53;
      }
    }
    else
    {
      objc_msgSend_removeStunRequest_(self, v40, (uint64_t)v23, v41);
    }
    id v6 = v30;
    goto LABEL_53;
  }
  uint64_t v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend_candidatePairToken(self, v12, v13, v14);
    uint64_t v16 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    double v99 = v15;
    __int16 v100 = 2080;
    uint64_t v101 = v16;
    _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "skip PutMaterial request for %@, state [%s].", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      double v92 = objc_msgSend_candidatePairToken(self, v17, v18, v19);
      double v94 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(@"GL", @"IDS", @"skip PutMaterial request for %@, state [%s].");

      if (_IDSShouldLog())
      {
        long long v23 = objc_msgSend_candidatePairToken(self, v20, v21, v22, v92, v94);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"skip PutMaterial request for %@, state [%s].");
LABEL_53:
      }
    }
  }
}

- (void)sendParticipantUpdateRequest:(id)a3 options:(id)a4
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CFDictionaryRef v9 = (const __CFDictionary *)a4;
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend_requestID(v6, v7, v8, v10);
    long long v23 = (char *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      double v24 = ids_monotonic_time();
      objc_msgSend_startTime(v6, v25, v26, v24);
      double v29 = v24 - v28;
      if (v29 >= 10.0)
      {
        uint64_t v78 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          double v82 = objc_msgSend_transactionID(v6, v79, v80, v81);
          *(_DWORD *)buf = 138412802;
          id v117 = v82;
          __int16 v118 = 2112;
          v119 = v23;
          __int16 v120 = 1024;
          int v121 = 10;
          _os_log_impl(&dword_19D9BE000, v78, OS_LOG_TYPE_DEFAULT, "participant update request %@ requestID: %@ timed out after %d seconds.", buf, 0x1Cu);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_transactionID(v6, v83, v84, v85);
            uint64_t v110 = v23;
            v108 = uint64_t v112 = 10;
            _IDSLogTransport(@"GL", @"IDS", @"participant update request %@ requestID: %@ timed out after %d seconds.");

            if (_IDSShouldLog())
            {
              objc_msgSend_transactionID(v6, v86, v87, v88, v108, v23, 10);
              uint64_t v110 = v23;
              v108 = uint64_t v112 = 10;
              _IDSLogV(0, @"IDSFoundation", @"GL", @"participant update request %@ requestID: %@ timed out after %d seconds.");
            }
          }
        }
        GLUtilReportAWDStunMessageEvent(v6, 32, self, 0.0);
        double v90 = GLUCreateQRStunMessageEvent(v6, 32, self, 0, 0.0);
        if (v90) {
          objc_msgSend__notifyQREventAdded_(self, v89, (uint64_t)v90, v91);
        }
        objc_msgSend_removeStunRequest_(self, v89, (uint64_t)v23, v91, v108, v110, v112);
        double v94 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        Value = 0;
        if (v9)
        {
          double v92 = (const char *)@"gl-option-participant-update-request-type";
          if (@"gl-option-participant-update-request-type") {
            Value = (void *)CFDictionaryGetValue(v9, @"gl-option-participant-update-request-type");
          }
        }
        unsigned __int16 v97 = objc_msgSend_intValue(Value, v92, v93, v95);
        __int16 v100 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v98, v97, v99);
        if (v100) {
          CFDictionarySetValue(v94, @"ids-stun-attribute-session-state-type", v100);
        }

        double v103 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v101, 2, v102);
        if (v103)
        {
          CFDictionarySetValue(v94, @"ids-stun-message-type", v103);
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          sub_19DB7E34C();
        }

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend_candidatePair_didReceiveParticipantUpdate_status_(WeakRetained, v106, (uint64_t)self, v107, v94, 2);

        goto LABEL_62;
      }
      uint64_t v30 = v6;
    }
    else
    {
      double v31 = StunUtilCreateMessage(3815, 0, self, v9);
      uint64_t v30 = v31;
      if (!v31)
      {
        v104 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v104, OS_LOG_TYPE_DEFAULT, "failed to create participant update request.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"failed to create participant update request.");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to create participant update request.");
            }
          }
        }
        id v6 = 0;
        goto LABEL_62;
      }
      objc_msgSend_initAES128CTR_(v31, v32, (uint64_t)self->_encKey, v33);
      uint64_t v37 = objc_msgSend_requestID(v30, v34, v35, v36);

      objc_msgSend_addStunRequest_(self, v38, v37, v39);
      long long v23 = (char *)v37;
    }
    if (objc_msgSend_shouldRexmitStunRequest_(self, v27, (uint64_t)v23, v29))
    {
      double v42 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v43, v44, v45);
        uint64_t v46 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        id v117 = v30;
        __int16 v118 = 2112;
        v119 = v46;
        _os_log_impl(&dword_19D9BE000, v42, OS_LOG_TYPE_DEFAULT, "send participant update request %@ for %@.", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_candidatePairToken(self, v47, v48, v49);
          uint64_t v110 = v108 = v30;
          _IDSLogTransport(@"GL", @"IDS", @"send participant update request %@ for %@.");

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(self, v50, v51, v52, v30, v110);
            uint64_t v110 = v108 = v30;
            _IDSLogV(0, @"IDSFoundation", @"GL", @"send participant update request %@ for %@.");
          }
        }
      }
      BOOL v53 = v6 != 0;
      id v54 = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v57 = objc_msgSend_sendStunMessage_candidatePair_(v54, v55, (uint64_t)v30, v56, self);

      char v60 = v57 != -2 || v53;
      if ((v60 & 1) == 0)
      {
        double v61 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_candidatePairToken(self, v62, v63, v64);
          uint64_t v65 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          id v117 = v30;
          __int16 v118 = 2112;
          v119 = v65;
          _os_log_impl(&dword_19D9BE000, v61, OS_LOG_TYPE_DEFAULT, "warning: send participant update request %@ for %@ exceeds MTU size", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_candidatePairToken(self, v66, v67, v68);
            uint64_t v110 = v108 = v30;
            _IDSLogTransport(@"GL", @"IDS", @"warning: send participant update request %@ for %@ exceeds MTU size");

            if (_IDSShouldLog())
            {
              objc_msgSend_candidatePairToken(self, v69, v70, v71, v30, v110);
              uint64_t v110 = v108 = v30;
              _IDSLogV(0, @"IDSFoundation", @"GL", @"warning: send participant update request %@ for %@ exceeds MTU size");
            }
          }
        }
        double v73 = GLUCreateQRStunMessageEvent(v30, 36, self, 0, 0.0);
        if (v73) {
          objc_msgSend__notifyQREventAdded_(self, v72, (uint64_t)v73, v74);
        }
      }
      objc_msgSend_updateStunSentBytes_requestID_(self, v58, v57, v59, v23, v108, v110);
      if ((unint64_t)(objc_msgSend_transport(self->_local, v75, v76, v77) - 1) <= 1)
      {
        v113[0] = MEMORY[0x1E4F143A8];
        v113[1] = 3221225472;
        v113[2] = sub_19DB302D8;
        v113[3] = &unk_1E5974300;
        v113[4] = self;
        id v6 = v30;
        id v114 = v6;
        CFDictionaryRef v115 = v9;
        IDSTransportThreadAddBlockAfter(v113, 1.0);

        goto LABEL_62;
      }
    }
    else
    {
      objc_msgSend_removeStunRequest_(self, v40, (uint64_t)v23, v41);
    }
    id v6 = v30;
    goto LABEL_62;
  }
  uint64_t v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend_candidatePairToken(self, v12, v13, v14);
    uint64_t v16 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    id v117 = v15;
    __int16 v118 = 2080;
    v119 = v16;
    _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "skip participant update request for %@, state [%s].", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v109 = objc_msgSend_candidatePairToken(self, v17, v18, v19);
      v111 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(@"GL", @"IDS", @"skip participant update request for %@, state [%s].");

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v20, v21, v22, v109, v111);
        long long v23 = (char *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, @"IDSFoundation", @"GL", @"skip participant update request for %@, state [%s].");
LABEL_62:
      }
    }
  }
}

- (BOOL)sendQUICGetMaterialRequest:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = self->_state - 3;
  if (v5 < 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v9 = objc_msgSend_sendProtoMessage_candidatePair_(WeakRetained, v7, (uint64_t)v4, v8, self);

    uint64_t v13 = objc_msgSend_transactionID(v4, v10, v11, v12);
    objc_msgSend_addProtoRequest_(self, v14, v13, v15);
    uint64_t v18 = objc_msgSend_stringWithFormat_(NSString, v16, @"%llu", v17, v13);
    objc_msgSend_updateStunSentBytes_requestID_(self, v19, v9, v20, v18);
    uint64_t v21 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_candidatePairToken(self, v22, v23, v24);
      long long v25 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v51 = v4;
      __int16 v52 = 2112;
      BOOL v53 = v25;
      __int16 v54 = 2048;
      uint64_t v55 = v9;
      _os_log_impl(&dword_19D9BE000, v21, OS_LOG_TYPE_DEFAULT, "send get material request %@ for %@, sentBytes: %lu", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v46 = objc_msgSend_candidatePairToken(self, v26, v27, v28);
        _IDSLogTransport(@"GL", @"IDS", @"send get material request %@ for %@, sentBytes: %lu");

        if (_IDSShouldLog())
        {
          uint64_t v47 = objc_msgSend_candidatePairToken(self, v29, v30, v31, v4, v46, v9);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"send get material request %@ for %@, sentBytes: %lu");
        }
      }
    }
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = sub_19DB306C0;
    v49[3] = &unk_1E5975888;
    v49[4] = self;
    v49[5] = v13;
    IDSTransportThreadAddBlockAfter(v49, 10.0);
    goto LABEL_9;
  }
  double v32 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    double v36 = objc_msgSend_candidatePairToken(self, v33, v34, v35);
    uint64_t v37 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    id v51 = v36;
    __int16 v52 = 2080;
    BOOL v53 = v37;
    _os_log_impl(&dword_19D9BE000, v32, OS_LOG_TYPE_DEFAULT, "skip get material request for %@, state [%s].", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      double v45 = objc_msgSend_candidatePairToken(self, v38, v39, v40);
      uint64_t v48 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(@"GL", @"IDS", @"skip get material request for %@, state [%s].");

      if (_IDSShouldLog())
      {
        uint64_t v18 = objc_msgSend_candidatePairToken(self, v41, v42, v43, v45, v48);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"skip get material request for %@, state [%s].");
LABEL_9:
      }
    }
  }

  return v5 < 2;
}

- (BOOL)sendQUICPutMaterialRequest:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = self->_state - 3;
  if (v5 < 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v9 = objc_msgSend_sendProtoMessage_candidatePair_(WeakRetained, v7, (uint64_t)v4, v8, self);

    uint64_t v13 = objc_msgSend_transactionID(v4, v10, v11, v12);
    objc_msgSend_addProtoRequest_(self, v14, v13, v15);
    uint64_t v18 = objc_msgSend_stringWithFormat_(NSString, v16, @"%llu", v17, v13);
    objc_msgSend_updateStunSentBytes_requestID_(self, v19, v9, v20, v18);
    uint64_t v21 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_candidatePairToken(self, v22, v23, v24);
      long long v25 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v51 = v4;
      __int16 v52 = 2112;
      BOOL v53 = v25;
      __int16 v54 = 2048;
      uint64_t v55 = v9;
      _os_log_impl(&dword_19D9BE000, v21, OS_LOG_TYPE_DEFAULT, "send put material request %@ for %@, sentBytes: %lu", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v46 = objc_msgSend_candidatePairToken(self, v26, v27, v28);
        _IDSLogTransport(@"GL", @"IDS", @"send put material request %@ for %@, sentBytes: %lu");

        if (_IDSShouldLog())
        {
          uint64_t v47 = objc_msgSend_candidatePairToken(self, v29, v30, v31, v4, v46, v9);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"send put material request %@ for %@, sentBytes: %lu");
        }
      }
    }
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = sub_19DB30C58;
    v49[3] = &unk_1E5975888;
    v49[4] = self;
    v49[5] = v13;
    IDSTransportThreadAddBlockAfter(v49, 10.0);
    goto LABEL_9;
  }
  double v32 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    double v36 = objc_msgSend_candidatePairToken(self, v33, v34, v35);
    uint64_t v37 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    id v51 = v36;
    __int16 v52 = 2080;
    BOOL v53 = v37;
    _os_log_impl(&dword_19D9BE000, v32, OS_LOG_TYPE_DEFAULT, "skip put material request for %@, state [%s].", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      double v45 = objc_msgSend_candidatePairToken(self, v38, v39, v40);
      uint64_t v48 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(@"GL", @"IDS", @"skip put material request for %@, state [%s].");

      if (_IDSShouldLog())
      {
        uint64_t v18 = objc_msgSend_candidatePairToken(self, v41, v42, v43, v45, v48);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"skip put material request for %@, state [%s].");
LABEL_9:
      }
    }
  }

  return v5 < 2;
}

- (void)sendTestRequest:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    self->_double testStartTime = 0.0;
    BOOL v20 = self->_testSubOperation == 0;
    uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v23 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v4, self->_testOptions, v6);
    if (v20) {
      objc_msgSend_dictionaryWithObject_forKey_(v21, v22, (uint64_t)v23, v24, @"gl-option-test-options-flags");
    }
    else {
    double v19 = objc_msgSend_dictionaryWithObjectsAndKeys_(v21, v22, (uint64_t)v23, v24, @"gl-option-test-options-flags", self->_testSubOperation, @"gl-option-test-sub-operation", 0);
    }

    double v28 = objc_msgSend_requestID(v5, v25, v26, v27);
    if (v5)
    {
      double v29 = ids_monotonic_time();
      objc_msgSend_startTime(v5, v30, v31, v29);
      double v34 = v29 - v33;
      if (v34 >= 10.0)
      {
        double v35 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v39 = objc_msgSend_transactionID(v5, v36, v37, v38);
          *(_DWORD *)buf = 138412546;
          *(void *)double v89 = v39;
          *(_WORD *)&v89[8] = 1024;
          *(_DWORD *)&v89[10] = 10;
          _os_log_impl(&dword_19D9BE000, v35, OS_LOG_TYPE_DEFAULT, "test request %@ timed out after %d seconds.", buf, 0x12u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            double v81 = objc_msgSend_transactionID(v5, v40, v42, v41);
            uint64_t v83 = 10;
            _IDSLogTransport(@"GL", @"IDS", @"test request %@ timed out after %d seconds.");

            if (_IDSShouldLog())
            {
              double v81 = objc_msgSend_transactionID(v5, v40, v43, v41, v81, 10);
              uint64_t v83 = 10;
              _IDSLogV(0, @"IDSFoundation", @"GL", @"test request %@ timed out after %d seconds.");
            }
          }
        }
        objc_msgSend_removeStunRequest_(self, v40, (uint64_t)v28, v41, v81, v83);
LABEL_39:

        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v44 = StunUtilCreateMessage(2049, 0, self, v19);
      id v5 = v44;
      if (!v44)
      {
        uint64_t v80 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v80, OS_LOG_TYPE_DEFAULT, "failed to create test request.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"failed to create test request.");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to create test request.");
            }
          }
        }
        id v5 = 0;
        goto LABEL_39;
      }
      uint64_t v48 = objc_msgSend_requestID(v44, v45, v46, v47);

      objc_msgSend_addStunRequest_(self, v49, v48, v50);
      double v28 = (void *)v48;
    }
    if (objc_msgSend_shouldRexmitStunRequest_(self, v32, (uint64_t)v28, v34))
    {
      BOOL v53 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int testOptions = self->_testOptions;
        testSubOperation = self->_testSubOperation;
        double v59 = objc_msgSend_candidatePairToken(self, v54, v55, v56);
        int linkID = self->_linkID;
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)double v89 = testOptions;
        *(_WORD *)&v89[4] = 2112;
        *(void *)&v89[6] = testSubOperation;
        *(_WORD *)&v89[14] = 2112;
        *(void *)&v89[16] = v5;
        __int16 v90 = 2112;
        double v91 = v59;
        __int16 v92 = 2112;
        uint64_t v93 = v28;
        __int16 v94 = 1024;
        int v95 = linkID;
        _os_log_impl(&dword_19D9BE000, v53, OS_LOG_TYPE_DEFAULT, "send test(0x%x,%@) request %@ for %@, %@ link: %d", buf, 0x36u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v64 = self->_testOptions;
          uint64_t v65 = self->_testSubOperation;
          uint64_t v66 = objc_msgSend_candidatePairToken(self, v61, v62, v63);
          uint64_t v85 = self->_linkID;
          _IDSLogTransport(@"GL", @"IDS", @"send test(0x%x,%@) request %@ for %@, %@ link: %d");

          if (_IDSShouldLog())
          {
            uint64_t v70 = objc_msgSend_candidatePairToken(self, v67, v68, v69, v64, v65, v5, v66, v28, v85);
            _IDSLogV(0, @"IDSFoundation", @"GL", @"send test(0x%x,%@) request %@ for %@, %@ link: %d");
          }
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v74 = objc_msgSend_sendStunMessage_candidatePair_(WeakRetained, v72, (uint64_t)v5, v73, self);

      objc_msgSend_updateStunSentBytes_requestID_(self, v75, v74, v76, v28);
      if ((unint64_t)(objc_msgSend_transport(self->_local, v77, v78, v79) - 1) <= 1)
      {
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = sub_19DB31574;
        v86[3] = &unk_1E5973CF8;
        v86[4] = self;
        id v5 = v5;
        id v87 = v5;
        IDSTransportThreadAddBlockAfter(v86, 1.0);
      }
    }
    else
    {
      objc_msgSend_removeStunRequest_(self, v51, (uint64_t)v28, v52);
    }
    goto LABEL_39;
  }
  double v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_msgSend_candidatePairToken(self, v8, v9, v10);
    double v12 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    *(void *)double v89 = v11;
    *(_WORD *)&v89[8] = 2080;
    *(void *)&v89[10] = v12;
    _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "skip test request for %@, state [%s].", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      double v82 = objc_msgSend_candidatePairToken(self, v13, v14, v15);
      uint64_t v84 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(@"GL", @"IDS", @"skip test request for %@, state [%s].");

      if (_IDSShouldLog())
      {
        double v19 = objc_msgSend_candidatePairToken(self, v16, v17, v18, v82, v84);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"skip test request for %@, state [%s].");
LABEL_40:
      }
    }
  }
}

- (void)_handleLinkProbingTimer
{
  v30[1] = *MEMORY[0x1E4F143B8];
  double v29 = @"gl-attr-active-probing-link-id";
  id v4 = objc_msgSend_numberWithChar_(NSNumber, a2, self->_linkID, v2);
  v30[0] = v4;
  double v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v5, (uint64_t)v30, v6, &v29, 1);

  if (self->_remoteRelayLinkID)
  {
    v27[0] = @"gl-attr-active-probing-link-id";
    double v10 = objc_msgSend_numberWithChar_(NSNumber, v8, self->_linkID, v9);
    v28[0] = v10;
    v27[1] = @"gl-attr-remote-relay-link-id";
    uint64_t v13 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v11, self->_remoteRelayLinkID, v12);
    v28[1] = v13;
    uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v14, (uint64_t)v28, v15, v27, 2);

    double v7 = (void *)v16;
  }
  uint64_t v17 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = self;
    _os_log_impl(&dword_19D9BE000, v17, OS_LOG_TYPE_DEFAULT, "_handleLinkProbingTimer for %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"_handleLinkProbingTimer for %@");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"_handleLinkProbingTimer for %@");
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v22 = objc_msgSend_candidatePairToken(self, v19, v20, v21);
  objc_msgSend_sendProbingRequestWithoptions_candidatePairToken_(WeakRetained, v23, (uint64_t)v7, v24, v22);
}

- (void)startLinkProbingTimer:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  probingTimer = self->_probingTimer;
  if (probingTimer) {
    dispatch_source_cancel(probingTimer);
  }
  double v6 = im_primary_queue();
  double v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v6);
  double v8 = self->_probingTimer;
  self->_probingTimer = v7;

  dispatch_source_set_timer((dispatch_source_t)self->_probingTimer, 0, (unint64_t)((double)a3 / 1000.0 * 1000000000.0), 0xF4240uLL);
  double v9 = self->_probingTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_19DB319F4;
  handler[3] = &unk_1E5973BA8;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume((dispatch_object_t)self->_probingTimer);
  double v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = self->_probingTimer;
    *(_DWORD *)buf = 134218498;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    uint64_t v16 = self;
    __int16 v17 = 1024;
    unsigned int v18 = a3;
    _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "start link probing timer %p for %@, interval: %u", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    _IDSLogTransport(@"GL", @"IDS", @"start link probing timer %p for %@, interval: %u");
    if (_IDSShouldLog()) {
      _IDSLogV(0, @"IDSFoundation", @"GL", @"start link probing timer %p for %@, interval: %u");
    }
  }
}

- (void)stopLinkProbingTimer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  probingTimer = self->_probingTimer;
  if (probingTimer)
  {
    dispatch_source_cancel(probingTimer);
    id v4 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = self->_probingTimer;
      *(_DWORD *)buf = 134218242;
      double v8 = v5;
      __int16 v9 = 2112;
      double v10 = self;
      _os_log_impl(&dword_19D9BE000, v4, OS_LOG_TYPE_DEFAULT, "stop link probing timer %p for %@.", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"stop link probing timer %p for %@.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"stop link probing timer %p for %@.");
      }
    }
    double v6 = self->_probingTimer;
    self->_probingTimer = 0;
  }
}

- (BOOL)processStatsResponse:(id)a3 arrivalTime:(double)a4
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v10 = objc_msgSend_requestID(v6, v7, v8, v9);
  int shouldProcessStunResponse = objc_msgSend_shouldProcessStunResponse_(self, v11, (uint64_t)v10, v12);

  if (shouldProcessStunResponse)
  {
    int v83 = 0;
    char HasValidUInt32Attr = StunUtilHasValidUInt32Attr((uint64_t)v6, 65523, &v83);
    if (HasValidUInt32Attr)
    {
      int v15 = ntpTime32(a4);
      unsigned int v16 = (v15 - v83) >> 16;
      double v17 = (double)(unsigned __int16)(v15 - v83) * 0.0000152587891 + (double)v16;
      double serverLatency = self->_serverLatency;
      if (serverLatency == 0.0) {
        double v19 = (double)(unsigned __int16)(v15 - v83) * 0.0000152587891 + (double)v16;
      }
      else {
        double v19 = v17 * 0.1 + serverLatency * 0.9;
      }
      self->_double serverLatency = v19;
      uint64_t v20 = (int)(v17 * 1000.0);
      double v21 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        long long v25 = objc_msgSend_requestID(v6, v22, v23, v24);
        int v26 = (int)(self->_serverLatency * 1000.0);
        int linkID = self->_linkID;
        *(_DWORD *)buf = 138413058;
        uint64_t v85 = (uint64_t)v25;
        __int16 v86 = 1024;
        *(_DWORD *)id v87 = linkID;
        *(_WORD *)&v87[4] = 1024;
        *(_DWORD *)&v87[6] = v20;
        __int16 v88 = 1024;
        int v89 = v26;
        _os_log_impl(&dword_19D9BE000, v21, OS_LOG_TYPE_DEFAULT, "recv stats resp %@ (link: %2d rtt: %5d ms mean: %5d ms).", buf, 0x1Eu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v31 = objc_msgSend_requestID(v6, v28, v29, v30);
          uint64_t v81 = v20;
          uint64_t v82 = (int)(self->_serverLatency * 1000.0);
          double v75 = v31;
          uint64_t v78 = self->_linkID;
          _IDSLogTransport(@"GL", @"IDS", @"recv stats resp %@ (link: %2d rtt: %5d ms mean: %5d ms).");

          if (_IDSShouldLog())
          {
            double v32 = objc_msgSend_requestID(v6, v28, v29, v30, v31, v78, v20, v82);
            uint64_t v81 = v20;
            uint64_t v82 = (int)(self->_serverLatency * 1000.0);
            double v75 = v32;
            uint64_t v78 = self->_linkID;
            _IDSLogV(0, @"IDSFoundation", @"GL", @"recv stats resp %@ (link: %2d rtt: %5d ms mean: %5d ms).");
          }
        }
      }
      double v33 = objc_msgSend_requestID(v6, v28, v29, v30, v75, v78, v81, v82);
      Value = 0;
      if (self->_requestIDToStatsIDs && v33) {
        Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_requestIDToStatsIDs, v33);
      }
      id v35 = Value;
      double v36 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = objc_msgSend_unsignedLongLongValue(v35, v37, v38, v39);
        requestIDToStatsIDs = self->_requestIDToStatsIDs;
        *(_DWORD *)buf = 134218242;
        uint64_t v85 = v40;
        __int16 v86 = 2112;
        *(void *)id v87 = requestIDToStatsIDs;
        _os_log_impl(&dword_19D9BE000, v36, OS_LOG_TYPE_DEFAULT, "statsIdentifier: %llu, requestIDToStatsIDs: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v76 = objc_msgSend_unsignedLongLongValue(v35, v42, v43, v44);
          double v79 = self->_requestIDToStatsIDs;
          _IDSLogTransport(@"GL", @"IDS", @"statsIdentifier: %llu, requestIDToStatsIDs: %@");
          if (_IDSShouldLog())
          {
            objc_msgSend_unsignedLongLongValue(v35, v45, v46, v47, v76, v79);
            _IDSLogV(0, @"IDSFoundation", @"GL", @"statsIdentifier: %llu, requestIDToStatsIDs: %@");
          }
        }
      }
      if (v35)
      {
        uint64_t v48 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        CFDictionarySetValue(v48, @"gl-option-stats-identifier", v35);
        id v51 = objc_msgSend_numberWithChar_(NSNumber, v49, self->_linkID, v50);
        if (v51)
        {
          CFDictionarySetValue(v48, @"gl-option-linkid", v51);
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          sub_19DB81A10();
        }

        uint64_t v55 = objc_msgSend_numberWithInt_(NSNumber, v53, v20, v54);
        if (v55)
        {
          CFDictionarySetValue(v48, @"gl-option-stats-server-timestamp", v55);
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          sub_19DB81988();
        }

        double v56 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v60 = objc_msgSend_unsignedLongLongValue(v35, v57, v58, v59);
          int v61 = self->_linkID;
          *(_DWORD *)buf = 134218496;
          uint64_t v85 = v60;
          __int16 v86 = 1024;
          *(_DWORD *)id v87 = v61;
          *(_WORD *)&v87[4] = 1024;
          *(_DWORD *)&v87[6] = v20;
          _os_log_impl(&dword_19D9BE000, v56, OS_LOG_TYPE_DEFAULT, "processStatsResponse: statsIdentifier: %llu, linkID: %d, rtt: %d ms", buf, 0x18u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            uint64_t v65 = objc_msgSend_unsignedLongLongValue(v35, v62, v63, v64);
            uint64_t v80 = self->_linkID;
            uint64_t v77 = v65;
            _IDSLogTransport(@"GL", @"IDS", @"processStatsResponse: statsIdentifier: %llu, linkID: %d, rtt: %d ms");
            if (_IDSShouldLog())
            {
              objc_msgSend_unsignedLongLongValue(v35, v66, v67, v68, v77, v80, v20);
              _IDSLogV(0, @"IDSFoundation", @"GL", @"processStatsResponse: statsIdentifier: %llu, linkID: %d, rtt: %d ms");
            }
          }
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend_candidatePair_didReceiveSessionStats_success_(WeakRetained, v70, (uint64_t)self, v71, v48, 1);

        objc_msgSend_removeObjectForKey_(self->_requestIDToStatsIDs, v72, (uint64_t)v33, v73);
      }
    }
    else
    {
      double v52 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v52, OS_LOG_TYPE_DEFAULT, "receive invalid stats response, missing client-timestamp.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"receive invalid stats response, missing client-timestamp.");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"receive invalid stats response, missing client-timestamp.");
          }
        }
      }
    }
  }
  else
  {
    char HasValidUInt32Attr = 1;
  }

  return HasValidUInt32Attr;
}

- (BOOL)_optionallyCheckEncMarker:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  memset(__b, 170, sizeof(__b));
  int v9 = 0;
  if (!StunUtilHasValidBinaryDataAttr(v3, 60934, __b, &v9)) {
    goto LABEL_4;
  }
  if (v9 != 4)
  {
    id v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = v9;
      _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "optionallyCheckEncMarker failed due to invalid marker length (%d)", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"optionallyCheckEncMarker failed due to invalid marker length (%d)");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"optionallyCheckEncMarker failed due to invalid marker length (%d)");
        }
      }
    }
    goto LABEL_17;
  }
  if (__b[0] != 1414938954)
  {
    unsigned int v6 = bswap32(__b[0]);
    double v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v11 = v6;
      __int16 v12 = 1024;
      int v13 = 1245795924;
      _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "optionallyCheckEncMarker failed due to marker mismatch (%08X != %08X).", buf, 0xEu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"optionallyCheckEncMarker failed due to marker mismatch (%08X != %08X).");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"optionallyCheckEncMarker failed due to marker mismatch (%08X != %08X).");
        }
      }
    }
LABEL_17:
    BOOL v4 = 0;
    goto LABEL_18;
  }
LABEL_4:
  BOOL v4 = 1;
LABEL_18:

  return v4;
}

- (BOOL)processInfoResponse:(id)a3 packetBuffer:(id *)a4 headerOverhead:(unint64_t)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  __int16 v12 = objc_msgSend_requestID(v8, v9, v10, v11);
  int shouldProcessStunResponse = objc_msgSend_shouldProcessStunResponse_(self, v13, (uint64_t)v12, v14);

  if (shouldProcessStunResponse)
  {
    if ((StunUtilHasValidChannelNumber(v8, self->_channelNumber, 0) & 1) != 0 || self->_state < 3)
    {
      *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v58 = v18;
      long long v59 = v18;
      long long v56 = v18;
      long long v57 = v18;
      long long v54 = v18;
      long long v55 = v18;
      *(_OWORD *)buf = v18;
      long long v53 = v18;
      v51[6] = v18;
      v51[7] = v18;
      v51[4] = v18;
      v51[5] = v18;
      v51[2] = v18;
      v51[3] = v18;
      v51[0] = v18;
      v51[1] = v18;
      int HasValidXorMappedAddress = StunUtilHasValidXorMappedAddress((uint64_t)v8, v51);
      if (HasValidXorMappedAddress)
      {
        double v19 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)double v49 = 136315138;
          double v50 = SAToIPPortString((char *)buf, 0x80uLL, (uint64_t)v51);
          _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "Got info response with xor-mapped-address [%s]", v49, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            SAToIPPortString((char *)buf, 0x80uLL, (uint64_t)v51);
            _IDSLogTransport(@"GL", @"IDS", @"Got info response with xor-mapped-address [%s]");
            if (_IDSShouldLog())
            {
              SAToIPPortString((char *)buf, 0x80uLL, (uint64_t)v51);
              _IDSLogV(0, @"IDSFoundation", @"GL", @"Got info response with xor-mapped-address [%s]");
            }
          }
        }
        uint64_t v20 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_candidatePairToken(self, v21, v22, v23);
          double v24 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)double v49 = 138412290;
          double v50 = v24;
          _os_log_impl(&dword_19D9BE000, v20, OS_LOG_TYPE_DEFAULT, "receive info-response for %@.", v49, 0xCu);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            uint64_t v46 = objc_msgSend_candidatePairToken(self, v25, v26, v27);
            _IDSLogTransport(@"GL", @"IDS", @"receive info-response for %@.");

            if (_IDSShouldLog())
            {
              double v47 = objc_msgSend_candidatePairToken(self, v28, v29, v30, v46);
              _IDSLogV(0, @"IDSFoundation", @"GL", @"receive info-response for %@.");
            }
          }
        }
        uint64_t v31 = StunUtilProcessActiveParticipants(v8);
        double v32 = StunUtilProcessLightweightParticipants(v8);
        if (objc_msgSend__optionallyCheckEncMarker_(self, v33, (uint64_t)v8, v34))
        {
          int64_t var2 = a4->var2;
          double v39 = objc_msgSend_requestID(v8, v35, v36, v37);
          uint64_t StunSentBytes = objc_msgSend_getStunSentBytes_(self, v40, (uint64_t)v39, v41);

          unint64_t v43 = var2 + a5;
        }
        else
        {
          unint64_t v43 = 0;
          uint64_t StunSentBytes = 0;
        }
        BYTE4(v48) = 0;
        LODWORD(v48) = 0;
        objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v35, 0, v37, v31, v32, 0, 0, StunSentBytes, v43, 1, v48);
      }
      else
      {
        double v44 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v49 = 0;
          _os_log_impl(&dword_19D9BE000, v44, OS_LOG_TYPE_DEFAULT, "processInfoResponse failed due to invalid xor-mapped-address.", v49, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"processInfoResponse failed due to invalid xor-mapped-address.");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"processInfoResponse failed due to invalid xor-mapped-address.");
            }
          }
        }
      }
    }
    else
    {
      unsigned int v16 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "processInfoResponse failed due to invalid channel-number.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"processInfoResponse failed due to invalid channel-number.");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"processInfoResponse failed due to invalid channel-number.");
          }
        }
      }
      LOBYTE(HasValidXorMappedAddress) = 0;
    }
  }
  else
  {
    LOBYTE(HasValidXorMappedAddress) = 1;
  }

  return HasValidXorMappedAddress;
}

- (BOOL)processSessionInfoResponse:(id)a3 packetBuffer:(id *)a4 headerOverhead:(unint64_t)a5 isLightweightParticipant:(BOOL)a6
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  double v14 = objc_msgSend_requestID(v10, v11, v12, v13);
  int shouldProcessStunResponse = objc_msgSend_shouldProcessStunResponse_(self, v15, (uint64_t)v14, v16);

  if (!shouldProcessStunResponse)
  {
LABEL_35:
    BOOL v54 = 1;
    goto LABEL_36;
  }
  if (StunUtilHasValidChannelNumber(v10, self->_channelNumber, 0))
  {
    long long v18 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_requestID(v10, v19, v20, v21);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = objc_msgSend_candidatePairToken(self, v23, v24, v25);
      *(_DWORD *)buf = 138412546;
      id v88 = v22;
      __int16 v89 = 2112;
      uint64_t v90 = v26;
      _os_log_impl(&dword_19D9BE000, v18, OS_LOG_TYPE_DEFAULT, "receive session-info response %@ for %@.", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        double v30 = objc_msgSend_requestID(v10, v27, v29, v28);
        objc_msgSend_candidatePairToken(self, v31, v32, v33);
        int v83 = v82 = v30;
        _IDSLogTransport(@"GL", @"IDS", @"receive session-info response %@ for %@.");

        if (_IDSShouldLog())
        {
          id v35 = objc_msgSend_requestID(v10, v27, v34, v28, v30, v83);
          objc_msgSend_candidatePairToken(self, v36, v37, v38);
          int v83 = v82 = v35;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"receive session-info response %@ for %@.");
        }
      }
    }
    if (objc_msgSend__optionallyCheckEncMarker_(self, v27, (uint64_t)v10, v28, v82, v83))
    {
      if (self->_requestIDToQueryLinkIDs)
      {
        double v44 = objc_msgSend_requestID(v10, v39, v40, v41);
        if (v44)
        {
          requestIDToQueryLinkIDs = self->_requestIDToQueryLinkIDs;
          double v47 = objc_msgSend_requestID(v10, v42, v43, v45);
          Value = (void *)CFDictionaryGetValue((CFDictionaryRef)requestIDToQueryLinkIDs, v47);
          char v52 = objc_msgSend_intValue(Value, v49, v50, v51);
        }
        else
        {
          char v52 = objc_msgSend_intValue(0, v42, v43, v45);
        }
      }
      else
      {
        char v52 = objc_msgSend_intValue(0, v39, v40, v41);
      }
      StunUtilProcessStreamInfo(v10, self->_linkID, v52);
      CFDictionaryRef v55 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      uint64_t v60 = 0;
      if (v55 && @"stream-info-peer-published-streams") {
        uint64_t v60 = (void *)CFDictionaryGetValue(v55, @"stream-info-peer-published-streams");
      }
      long long v56 = StunUtilProcessParticipants(v60, self->_participantID, a6);
      long long v58 = StunUtilProcessLightweightParticipants(v10);
      int64_t var2 = a4->var2;
      uint64_t v65 = objc_msgSend_requestID(v10, v62, v63, v64);
      uint64_t StunSentBytes = objc_msgSend_getStunSentBytes_(self, v66, (uint64_t)v65, v67);

      int v59 = 0;
      unint64_t v57 = var2 + a5;
    }
    else
    {
      CFDictionaryRef v55 = 0;
      long long v56 = 0;
      unint64_t v57 = 0;
      uint64_t StunSentBytes = 0;
      long long v58 = 0;
      int v59 = 4;
    }
    if (self->_requestIDToSessionInfoReqType)
    {
      uint64_t v70 = objc_msgSend_requestID(v10, v39, v40, v41);
      if (v70)
      {
        requestIDToSessionInfoReqType = self->_requestIDToSessionInfoReqType;
        double v73 = objc_msgSend_requestID(v10, v68, v69, v71);
        uint64_t v74 = (void *)CFDictionaryGetValue((CFDictionaryRef)requestIDToSessionInfoReqType, v73);
        int v78 = objc_msgSend_intValue(v74, v75, v76, v77);
      }
      else
      {
        int v78 = objc_msgSend_intValue(0, v68, v69, v71);
      }
    }
    else
    {
      int v78 = objc_msgSend_intValue(0, v39, v40, v41);
    }
    BYTE4(v85) = 0;
    HIDWORD(v84) = v59;
    LODWORD(v85) = 0;
    BYTE1(v84) = v78 == 2;
    LOBYTE(v84) = 0;
    objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v79, (uint64_t)v55, v80, v56, v58, 0, 0, StunSentBytes, v57, v84, v85);

    goto LABEL_35;
  }
  long long v53 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v53, OS_LOG_TYPE_DEFAULT, "processSessionInfoResponse failed due to invalid channel-number.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"processSessionInfoResponse failed due to invalid channel-number.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"processSessionInfoResponse failed due to invalid channel-number.");
      }
    }
  }
  BOOL v54 = 0;
LABEL_36:

  return v54;
}

- (BOOL)processTestResponse:(id)a3 arrivalTime:(double)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v9 = objc_msgSend_requestID(v5, v6, v7, v8);
  int shouldProcessStunResponse = objc_msgSend_shouldProcessStunResponse_(self, v10, (uint64_t)v9, v11);

  if (!shouldProcessStunResponse)
  {
LABEL_9:
    BOOL v24 = 1;
    goto LABEL_17;
  }
  if (StunUtilHasValidChannelNumber(v5, self->_channelNumber, 0))
  {
    double v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v17 = objc_msgSend_candidatePairToken(self, v14, v15, v16);
      *(_DWORD *)buf = 138412290;
      double v30 = v17;
      _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_DEFAULT, "receive test response for %@.", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        double v27 = objc_msgSend_candidatePairToken(self, v18, v19, v20);
        _IDSLogTransport(@"GL", @"IDS", @"receive test response for %@.");

        if (_IDSShouldLog())
        {
          double v28 = objc_msgSend_candidatePairToken(self, v21, v22, v23, v27);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"receive test response for %@.");
        }
      }
    }
    goto LABEL_9;
  }
  double v25 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v25, OS_LOG_TYPE_DEFAULT, "processTestResponse failed due to invalid channel-number.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"processTestResponse failed due to invalid channel-number.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"processTestResponse failed due to invalid channel-number.");
      }
    }
  }
  BOOL v24 = 0;
LABEL_17:

  return v24;
}

- (BOOL)processParticipantUpdateResponse:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v8 = objc_msgSend_requestID(v4, v5, v6, v7);
  int shouldProcessStunResponse = objc_msgSend_shouldProcessStunResponse_(self, v9, (uint64_t)v8, v10);

  if (!shouldProcessStunResponse)
  {
LABEL_13:
    BOOL v40 = 1;
    goto LABEL_21;
  }
  if (StunUtilHasValidChannelNumber(v4, self->_channelNumber, 0))
  {
    uint64_t v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_requestID(v4, v13, v14, v15);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      double v20 = objc_msgSend_candidatePairToken(self, v17, v18, v19);
      *(_DWORD *)buf = 138412546;
      id v46 = v16;
      __int16 v47 = 2112;
      uint64_t v48 = v20;
      _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "receive participant update response %@ for %@.", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        BOOL v24 = objc_msgSend_requestID(v4, v21, v22, v23);
        objc_msgSend_candidatePairToken(self, v25, v26, v27);
        double v44 = v43 = v24;
        _IDSLogTransport(@"GL", @"IDS", @"receive participant update response %@ for %@.");

        if (_IDSShouldLog())
        {
          double v28 = objc_msgSend_requestID(v4, v21, v22, v23, v24, v44);
          objc_msgSend_candidatePairToken(self, v29, v30, v31);
          double v44 = v43 = v28;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"receive participant update response %@ for %@.");
        }
      }
    }
    uint64_t v32 = objc_msgSend_type(v4, v21, v22, v23, v43, v44);
    double v33 = StunUtilProcessParticipantUpdate(v4, 0, v32);
    if (objc_msgSend__optionallyCheckEncMarker_(self, v34, (uint64_t)v4, v35)) {
      uint64_t v36 = 0;
    }
    else {
      uint64_t v36 = 4;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_candidatePair_didReceiveParticipantUpdate_status_(WeakRetained, v38, (uint64_t)self, v39, v33, v36);

    goto LABEL_13;
  }
  double v41 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v41, OS_LOG_TYPE_DEFAULT, "processParticipantUpdateResponse failed due to invalid channel-number.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"processParticipantUpdateResponse failed due to invalid channel-number.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"processParticipantUpdateResponse failed due to invalid channel-number.");
      }
    }
  }
  BOOL v40 = 0;
LABEL_21:

  return v40;
}

- (BOOL)processPutMaterialResponse:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v8 = objc_msgSend_requestID(v4, v5, v6, v7);
  int shouldProcessStunResponse = objc_msgSend_shouldProcessStunResponse_(self, v9, (uint64_t)v8, v10);

  if (!shouldProcessStunResponse)
  {
LABEL_9:
    BOOL v35 = 1;
    goto LABEL_17;
  }
  if (StunUtilHasValidChannelNumber(v4, self->_channelNumber, 0))
  {
    uint64_t v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_requestID(v4, v13, v14, v15);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      double v20 = objc_msgSend_candidatePairToken(self, v17, v18, v19);
      *(_DWORD *)buf = 138412546;
      id v41 = v16;
      __int16 v42 = 2112;
      uint64_t v43 = v20;
      _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "receive PutMaterial response %@ for %@.", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        BOOL v24 = objc_msgSend_requestID(v4, v21, v22, v23);
        double v38 = objc_msgSend_candidatePairToken(self, v25, v26, v27);
        _IDSLogTransport(@"GL", @"IDS", @"receive PutMaterial response %@ for %@.");

        if (_IDSShouldLog())
        {
          double v31 = objc_msgSend_requestID(v4, v28, v29, v30, v24, v38);
          double v39 = objc_msgSend_candidatePairToken(self, v32, v33, v34);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"receive PutMaterial response %@ for %@.");
        }
      }
    }
    goto LABEL_9;
  }
  uint64_t v36 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v36, OS_LOG_TYPE_DEFAULT, "processPutMaterialResponse failed due to invalid channel-number.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"processPutMaterialResponse failed due to invalid channel-number.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"processPutMaterialResponse failed due to invalid channel-number.");
      }
    }
  }
  BOOL v35 = 0;
LABEL_17:

  return v35;
}

- (BOOL)processInfoIndication:(id)a3 arrivalTime:(double)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = objc_msgSend_candidatePairToken(self, v7, v8, v9);
    *(_DWORD *)buf = 138412290;
    double v21 = v10;
    _os_log_impl(&dword_19D9BE000, v6, OS_LOG_TYPE_DEFAULT, "receive info indication for %@.", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v18 = objc_msgSend_candidatePairToken(self, v11, v12, v13);
      _IDSLogTransport(@"GL", @"IDS", @"receive info indication for %@.");

      if (_IDSShouldLog())
      {
        double v19 = objc_msgSend_candidatePairToken(self, v14, v15, v16, v18);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"receive info indication for %@.");
      }
    }
  }

  return 1;
}

- (BOOL)processSessionInfoIndication:(id)a3 arrivalTime:(double)a4 isLightweightParticipant:(BOOL)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  char HasValidChannelNumber = StunUtilHasValidChannelNumber(v7, self->_channelNumber, 0);
  if (HasValidChannelNumber)
  {
    double v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = objc_msgSend_candidatePairToken(self, v10, v11, v12);
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v13;
      _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "receive session-info indication for %@.", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        double v28 = objc_msgSend_candidatePairToken(self, v14, v15, v16);
        _IDSLogTransport(@"GL", @"IDS", @"receive session-info indication for %@.");

        if (_IDSShouldLog())
        {
          uint64_t v29 = objc_msgSend_candidatePairToken(self, v17, v18, v19, v28);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"receive session-info indication for %@.");
        }
      }
    }
    StunUtilProcessStreamInfo(v7, self->_linkID, self->_linkID);
    CFDictionaryRef v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    Value = 0;
    if (v20 && @"stream-info-peer-published-streams") {
      Value = (void *)CFDictionaryGetValue(v20, @"stream-info-peer-published-streams");
    }
    uint64_t v22 = StunUtilProcessParticipants(Value, self->_participantID, a5);
    double v23 = StunUtilProcessLightweightParticipants(v7);
    BYTE4(v31) = 1;
    LODWORD(v31) = 0;
    LOWORD(v30) = 0;
    objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v24, (uint64_t)v20, v25, v22, v23, 0, 0, 0, 0, v30, v31);
  }
  else
  {
    uint64_t v26 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v26, OS_LOG_TYPE_DEFAULT, "processSessionInfoIndication failed due to invalid channel-number.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"processSessionInfoIndication failed due to invalid channel-number.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"processSessionInfoIndication failed due to invalid channel-number.");
        }
      }
    }
  }

  return HasValidChannelNumber;
}

- (BOOL)processDataMessageErrorIndication:(id)a3
{
  v77[184] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  bzero(v74, 0x5D0uLL);
  if (objc_msgSend_getAttribute_attribute_(v4, v5, 9, v6, v74))
  {
    unsigned __int16 v7 = v76 + 100 * v75;
    uint64_t v8 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = objc_msgSend_candidatePairToken(self, v9, v10, v11);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v7;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v77;
      _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "receive data message error indication for %@, error_code(%u) reason(%s)", buf, 0x1Cu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v62 = objc_msgSend_candidatePairToken(self, v13, v14, v15);
        _IDSLogTransport(@"GL", @"IDS", @"receive data message error indication for %@, error_code(%u) reason(%s)");

        if (_IDSShouldLog())
        {
          uint64_t v63 = objc_msgSend_candidatePairToken(self, v16, v17, v18, v62, v7, v77);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"receive data message error indication for %@, error_code(%u) reason(%s)");
        }
      }
    }
    *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v72 = v19;
    long long v73 = v19;
    long long v70 = v19;
    long long v71 = v19;
    long long v68 = v19;
    long long v69 = v19;
    *(_OWORD *)buf = v19;
    *(_OWORD *)&uint8_t buf[16] = v19;
    v66[6] = v19;
    v66[7] = v19;
    v66[4] = v19;
    v66[5] = v19;
    v66[2] = v19;
    v66[3] = v19;
    v66[0] = v19;
    v66[1] = v19;
    if (StunUtilHasValidXorMappedAddress((uint64_t)v4, v66))
    {
      CFDictionaryRef v20 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)double v64 = 136315138;
        uint64_t v65 = SAToIPPortString(buf, 0x80uLL, (uint64_t)v66);
        _os_log_impl(&dword_19D9BE000, v20, OS_LOG_TYPE_DEFAULT, "Got error indication with xor-mapped-address [%s]", v64, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          SAToIPPortString(buf, 0x80uLL, (uint64_t)v66);
          _IDSLogTransport(@"GL", @"IDS", @"Got error indication with xor-mapped-address [%s]");
          if (_IDSShouldLog())
          {
            SAToIPPortString(buf, 0x80uLL, (uint64_t)v66);
            _IDSLogV(0, @"IDSFoundation", @"GL", @"Got error indication with xor-mapped-address [%s]");
          }
        }
      }
    }
    switch(v7)
    {
      case 0x259u:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v22 = objc_opt_respondsToSelector();

        if ((v22 & 1) == 0) {
          goto LABEL_39;
        }
        uint64_t v25 = objc_msgSend__didLocalExternalAddressChange_(self, v23, (uint64_t)v66, v24);
        id v26 = objc_loadWeakRetained((id *)&self->_delegate);
        char v29 = objc_msgSend_receiveNoSessionStateForCandidatePair_didLocalExternalAddressChange_(v26, v27, (uint64_t)self, v28, v25);

        break;
      case 0x25Au:
        id v44 = objc_loadWeakRetained((id *)&self->_delegate);
        char v45 = objc_opt_respondsToSelector();

        if (v45)
        {
          id v46 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend_receiveIdleClientErrorForCandidatePair_(v46, v47, (uint64_t)self, v48);
        }
        goto LABEL_39;
      case 0x25Bu:
        p_delegate = &self->_delegate;
        id v32 = objc_loadWeakRetained((id *)p_delegate);
        char v33 = objc_opt_respondsToSelector();

        if (v33)
        {
          id v34 = objc_loadWeakRetained((id *)p_delegate);
          objc_msgSend_receiveBlockedIndicationWithReason_(v34, v35, 44, v36);
        }
        goto LABEL_39;
      case 0x260u:
        uint64_t v49 = &self->_delegate;
        id v50 = objc_loadWeakRetained((id *)v49);
        char v51 = objc_opt_respondsToSelector();

        if (v51)
        {
          id v52 = objc_loadWeakRetained((id *)v49);
          objc_msgSend_receiveBlockedIndicationWithReason_(v52, v53, 49, v54);
        }
        goto LABEL_39;
      case 0x262u:
        CFDictionaryRef v55 = &self->_delegate;
        id v56 = objc_loadWeakRetained((id *)v55);
        char v57 = objc_opt_respondsToSelector();

        if (v57)
        {
          id v58 = objc_loadWeakRetained((id *)v55);
          objc_msgSend_receiveErrorIndicationWithCode_(v58, v59, 1, v60);
        }
        goto LABEL_39;
      case 0x263u:
        double v38 = &self->_delegate;
        id v39 = objc_loadWeakRetained((id *)v38);
        char v40 = objc_opt_respondsToSelector();

        if (v40)
        {
          id v41 = objc_loadWeakRetained((id *)v38);
          objc_msgSend_receiveBlockedIndicationWithReason_(v41, v42, 46, v43);
        }
LABEL_39:
        char v29 = 1;
        break;
      default:
        uint64_t v37 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)double v64 = 67109120;
          LODWORD(v65) = v7;
          _os_log_impl(&dword_19D9BE000, v37, OS_LOG_TYPE_DEFAULT, "invalid case: %hu", v64, 8u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"invalid case: %hu");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"invalid case: %hu");
            }
          }
        }
        goto LABEL_22;
    }
  }
  else
  {
    unsigned int v30 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v30, OS_LOG_TYPE_ERROR, "receive invalid data message error indication.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV(0, @"IDSFoundation", @"Warning", @"receive invalid data message error indication.");
      _IDSLogTransport(@"Warning", @"IDS", @"receive invalid data message error indication.");
    }
LABEL_22:
    char v29 = 0;
  }

  return v29;
}

- (BOOL)processParticipantUpdateIndication:(id)a3 arrivalTime:(double)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char HasValidChannelNumber = StunUtilHasValidChannelNumber(v5, self->_channelNumber, 0);
  if (HasValidChannelNumber)
  {
    unsigned __int16 v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = objc_msgSend_candidatePairToken(self, v8, v9, v10);
      *(_DWORD *)buf = 138412290;
      double v27 = v11;
      _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "receive participant update indication for %@.", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v25 = objc_msgSend_candidatePairToken(self, v12, v13, v14);
        _IDSLogTransport(@"GL", @"IDS", @"receive participant update indication for %@.");

        if (_IDSShouldLog())
        {
          uint64_t v25 = objc_msgSend_candidatePairToken(self, v12, v13, v14, v25);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"receive participant update indication for %@.");
        }
      }
    }
    uint64_t v15 = objc_msgSend_type(v5, v12, v13, v14, v25);
    double v16 = StunUtilProcessParticipantUpdate(v5, 0, v15);
    if (objc_msgSend__optionallyCheckEncMarker_(self, v17, (uint64_t)v5, v18)) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = 4;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_candidatePair_didReceiveParticipantUpdate_status_(WeakRetained, v21, (uint64_t)self, v22, v16, v19);
  }
  else
  {
    double v23 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "processParticipantUpdateIndication failed due to invalid channel number.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"processParticipantUpdateIndication failed due to invalid channel number.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"processParticipantUpdateIndication failed due to invalid channel number.");
        }
      }
    }
  }

  return HasValidChannelNumber;
}

- (BOOL)processPluginRegistrationResponse:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (StunUtilHasValidChannelNumber(v4, self->_channelNumber, 0))
  {
    uint64_t v8 = objc_msgSend_requestID(v4, v5, v6, v7);
    int shouldProcessStunResponse = objc_msgSend_shouldProcessStunResponse_(self, v9, (uint64_t)v8, v10);

    if (shouldProcessStunResponse)
    {
      uint64_t v15 = objc_msgSend_requestID(v4, v12, v13, v14);
      double v18 = objc_msgSend__pluginNameForStunRequest_(self, v16, (uint64_t)v15, v17);

      if (v18)
      {
        double v22 = objc_msgSend_requestID(v4, v19, v20, v21);
        objc_msgSend__removeStunPluginRegistrationRequest_(self, v23, (uint64_t)v22, v24);
      }
      uint64_t v25 = objc_msgSend_pathExtension(v18, v19, v20, v21);
      int isEqualToString = objc_msgSend_isEqualToString_(v25, v26, @"Register", v27);
      if ((isEqualToString & 1) != 0
        || (objc_msgSend_isEqualToString_(v25, v28, @"Unregister", v30) & 1) != 0)
      {
        uint64_t v54 = 0;
        int v31 = StunUtilHasValidUInt64Attr((uint64_t)v4, 65493, &v54) | isEqualToString ^ 1;
        if (v31)
        {
          id v32 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            double v36 = objc_msgSend_candidatePairToken(self, v33, v34, v35);
            *(_DWORD *)buf = 138412802;
            id v56 = v36;
            __int16 v57 = 2048;
            uint64_t v58 = v54;
            __int16 v59 = 2112;
            double v60 = v18;
            _os_log_impl(&dword_19D9BE000, v32, OS_LOG_TYPE_DEFAULT, "receive plugin update for %@, with participant id: %llu, and name %@", buf, 0x20u);
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              char v40 = objc_msgSend_candidatePairToken(self, v37, v38, v39);
              uint64_t v52 = v54;
              long long v53 = v18;
              char v51 = v40;
              _IDSLogTransport(@"GL", @"IDS", @"receive plugin update for %@, with participant id: %llu, and name %@");

              if (_IDSShouldLog())
              {
                id v41 = objc_msgSend_candidatePairToken(self, v37, v38, v39, v40, v52, v18);
                uint64_t v52 = v54;
                long long v53 = v18;
                char v51 = v41;
                _IDSLogV(0, @"IDSFoundation", @"GL", @"receive plugin update for %@, with participant id: %llu, and name %@");
              }
            }
          }
          __int16 v42 = objc_msgSend_stringByDeletingPathExtension(v18, v37, v38, v39, v51, v52, v53);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          id v46 = WeakRetained;
          if (isEqualToString) {
            objc_msgSend_candidatePair_didReceivePluginRegistration_pluginName_(WeakRetained, v44, (uint64_t)self, v45, v54, v42);
          }
          else {
            objc_msgSend_candidatePair_didReceivePluginUnregistration_pluginName_(WeakRetained, v44, (uint64_t)self, v45, v54, v42);
          }
        }
        else
        {
          double v48 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D9BE000, v48, OS_LOG_TYPE_DEFAULT, "received update plugin needs valid participant id when registering.", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"GL", @"IDS", @"received update plugin needs valid participant id when registering.");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"GL", @"received update plugin needs valid participant id when registering.");
              }
            }
          }
        }
      }
      else
      {
        uint64_t v49 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v49, OS_LOG_TYPE_DEFAULT, "invalid plugin operation - ignoring this response", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"invalid plugin operation - ignoring this response");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"invalid plugin operation - ignoring this response");
            }
          }
        }
        LOBYTE(v31) = 0;
      }
    }
    else
    {
      LOBYTE(v31) = 1;
    }
  }
  else
  {
    __int16 v47 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v47, OS_LOG_TYPE_DEFAULT, "processPluginRegistrationResponse failed due to invalid channel number.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"processPluginRegistrationResponse failed due to invalid channel number.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"processPluginRegistrationResponse failed due to invalid channel number.");
        }
      }
    }
    LOBYTE(v31) = 0;
  }

  return v31;
}

- (BOOL)processPluginControlIndication:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((StunUtilHasValidChannelNumber(v4, self->_channelNumber, 0) & 1) == 0)
  {
    id v26 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v26, OS_LOG_TYPE_DEFAULT, "processPluginControlIndication failed due to invalid channel number.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"processPluginControlIndication failed due to invalid channel number.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"processPluginControlIndication failed due to invalid channel number.");
        }
      }
    }
    goto LABEL_23;
  }
  uint64_t v33 = 0;
  if ((StunUtilHasValidUInt64Attr((uint64_t)v4, 65493, &v33) & 1) == 0)
  {
    double v27 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v27, OS_LOG_TYPE_DEFAULT, "received plugin event needs valid participant id.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"received plugin event needs valid participant id.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"received plugin event needs valid participant id.");
        }
      }
    }
LABEL_23:
    char HasValidUInt8Attr = 0;
    goto LABEL_24;
  }
  unsigned __int8 v32 = 0;
  char HasValidUInt8Attr = StunUtilHasValidUInt8Attr((uint64_t)v4, 65491, &v32);
  if (HasValidUInt8Attr)
  {
    uint64_t v9 = objc_msgSend_transactionID(v4, v5, v6, v8);
    double v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = objc_msgSend_candidatePairToken(self, v11, v12, v13);
      *(_DWORD *)buf = 138413058;
      double v35 = v14;
      __int16 v36 = 2048;
      uint64_t v37 = v33;
      __int16 v38 = 1024;
      int v39 = v32;
      __int16 v40 = 2112;
      id v41 = v9;
      _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "receive plugin event for %@, with participant id: %llu, operation %u, transactionID %@", buf, 0x26u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        double v18 = objc_msgSend_candidatePairToken(self, v15, v16, v17);
        uint64_t v31 = v32;
        uint64_t v30 = v33;
        _IDSLogTransport(@"GL", @"IDS", @"receive plugin event for %@, with participant id: %llu, operation %u, transactionID %@");

        if (_IDSShouldLog())
        {
          double v22 = objc_msgSend_candidatePairToken(self, v19, v20, v21, v18, v30, v31, v9);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"receive plugin event for %@, with participant id: %llu, operation %u, transactionID %@");
        }
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_candidatePair_didReceivePluginControlEvent_operation_transactionID_(WeakRetained, v24, (uint64_t)self, v25, v33, v32, v9);
  }
  else
  {
    char v29 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v29, OS_LOG_TYPE_DEFAULT, "received plugin event needs valid operation.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"received plugin event needs valid operation.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"received plugin event needs valid operation.");
        }
      }
    }
  }
LABEL_24:

  return HasValidUInt8Attr;
}

- (BOOL)processStunErrorResponse:(id)a3 packetBuffer:(id *)a4 headerOverhead:(unint64_t)a5
{
  uint64_t v161 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v12 = objc_msgSend_requestID(v8, v9, v10, v11);
  int shouldProcessStunResponse = objc_msgSend_shouldProcessStunResponse_(self, v13, (uint64_t)v12, v14);

  if (!shouldProcessStunResponse)
  {
LABEL_10:
    BOOL v31 = 1;
    goto LABEL_65;
  }
  unsigned __int16 v146 = -21846;
  *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v160[6] = v18;
  v160[7] = v18;
  v160[4] = v18;
  v160[5] = v18;
  v160[2] = v18;
  v160[3] = v18;
  v160[0] = v18;
  v160[1] = v18;
  int v145 = 0;
  uint64_t v19 = objc_msgSend_type(v8, v16, v17, -3.72066208e-103);
  if (StunUtilHasValidErrorCodeAttr(v8, &v146, (char *)v160, &v145))
  {
    if (self->_state == 2)
    {
      uint64_t v20 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        double v24 = objc_msgSend_candidatePairToken(self, v21, v22, v23);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = (unsigned __int16)v19;
        _os_log_impl(&dword_19D9BE000, v20, OS_LOG_TYPE_DEFAULT, "%@ is already in error state, ignore error response %04x.", buf, 0x12u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v136 = objc_msgSend_candidatePairToken(self, v25, v26, v27);
          _IDSLogTransport(@"GL", @"IDS", @"%@ is already in error state, ignore error response %04x.");

          if (_IDSShouldLog())
          {
            v137 = objc_msgSend_candidatePairToken(self, v28, v29, v30, v136, (unsigned __int16)v19);
            _IDSLogV(0, @"IDSFoundation", @"GL", @"%@ is already in error state, ignore error response %04x.");
          }
        }
      }
      goto LABEL_10;
    }
    uint64_t v33 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = v146;
      double v35 = ids_monotonic_time();
      objc_msgSend_startTime(v8, v36, v37, v35);
      double v39 = v38;
      int v42 = *(unsigned __int8 *)(objc_msgSend_address(self->_local, v40, v41, v38) + 1);
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&uint8_t buf[4] = (unsigned __int16)v19;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v34;
      *(_WORD *)&buf[14] = 2080;
      *(void *)&uint8_t buf[16] = v160;
      *(_WORD *)&buf[24] = 2048;
      *(double *)&buf[26] = (v35 - v39) * 1000.0;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v42;
      _os_log_impl(&dword_19D9BE000, v33, OS_LOG_TYPE_DEFAULT, "receive stun error response - type(%04x) error_code(%u) reason(%s) after %0.3lf ms family: %d.", buf, 0x28u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v43 = v146;
        double v44 = ids_monotonic_time();
        objc_msgSend_startTime(v8, v45, v46, v44);
        double v48 = v47;
        uint64_t v144 = *(unsigned __int8 *)(objc_msgSend_address(self->_local, v49, v50, v47) + 1);
        double v143 = (v44 - v48) * 1000.0;
        *(void *)&long long v142 = v43;
        *((void *)&v142 + 1) = v160;
        unint64_t v135 = (unsigned __int16)v19;
        _IDSLogTransport(@"GL", @"IDS", @"receive stun error response - type(%04x) error_code(%u) reason(%s) after %0.3lf ms family: %d.");
        if (_IDSShouldLog())
        {
          uint64_t v51 = v146;
          double v52 = ids_monotonic_time();
          objc_msgSend_startTime(v8, v53, v54, v52, (unsigned __int16)v19, (void)v142, v160, *(void *)&v143, v144);
          double v56 = v55;
          uint64_t v144 = *(unsigned __int8 *)(objc_msgSend_address(self->_local, v57, v58, v55) + 1);
          double v143 = (v52 - v56) * 1000.0;
          *(void *)&long long v142 = v51;
          *((void *)&v142 + 1) = v160;
          unint64_t v135 = (unsigned __int16)v19;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"receive stun error response - type(%04x) error_code(%u) reason(%s) after %0.3lf ms family: %d.");
        }
      }
    }
    uint64_t v59 = GLUtilStunErrorToGlobalLinkError(v146);
    GLUtilReportAWDStunMessageEvent(v8, v59, self, 0.0);
    *(void *)&long long v60 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v60 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v158 = v60;
    long long v159 = v60;
    long long v156 = v60;
    long long v157 = v60;
    *(_OWORD *)&unsigned char buf[32] = v60;
    long long v155 = v60;
    *(_OWORD *)buf = v60;
    *(_OWORD *)&uint8_t buf[16] = v60;
    v153[6] = v60;
    v153[7] = v60;
    v153[4] = v60;
    v153[5] = v60;
    v153[2] = v60;
    v153[3] = v60;
    v153[0] = v60;
    v153[1] = v60;
    if (StunUtilHasValidXorMappedAddress((uint64_t)v8, v153))
    {
      uint64_t v61 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v62 = SAToIPPortString(buf, 0x80uLL, (uint64_t)v153);
        *(_DWORD *)v147 = 136315138;
        unint64_t v148 = (unint64_t)v62;
        _os_log_impl(&dword_19D9BE000, v61, OS_LOG_TYPE_DEFAULT, "Got error response with xor-mapped-address [%s]", v147, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          unint64_t v135 = (unint64_t)SAToIPPortString(buf, 0x80uLL, (uint64_t)v153);
          _IDSLogTransport(@"GL", @"IDS", @"Got error response with xor-mapped-address [%s]");
          if (_IDSShouldLog())
          {
            unint64_t v135 = (unint64_t)SAToIPPortString(buf, 0x80uLL, (uint64_t)v153);
            _IDSLogV(0, @"IDSFoundation", @"GL", @"Got error response with xor-mapped-address [%s]");
          }
        }
      }
    }
    uint64_t v63 = GLUtilStunErrorToGlobalLinkError(v146);
    uint64_t v66 = GLUCreateQRStunMessageEvent(v8, v63, self, 0, 0.0);
    if (v66) {
      objc_msgSend__notifyQREventAdded_(self, v64, (uint64_t)v66, v67);
    }
    if ((v19 & 0xFFFFFFFFFFFFFFFELL) == 0xFF0)
    {
      long long v68 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        long long v72 = (&_IDSStunCandidatePairStateStrings)[self->_state];
        long long v73 = off_1E944EAA0;
        uint64_t v74 = objc_msgSend_candidatePairToken(self, v69, v70, v71);
        *(_DWORD *)v147 = 136315650;
        unint64_t v148 = (unint64_t)v72;
        __int16 v149 = 2080;
        v150 = v73;
        __int16 v151 = 2112;
        v152 = v74;
        _os_log_impl(&dword_19D9BE000, v68, OS_LOG_TYPE_DEFAULT, "update state (%s->%s) for %@.", v147, 0x20u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          int v78 = (&_IDSStunCandidatePairStateStrings)[self->_state];
          double v79 = off_1E944EAA0;
          objc_msgSend_candidatePairToken(self, v75, v76, v77);
          *((void *)&v142 + 1) = *(void *)&long long v142 = v79;
          unint64_t v135 = (unint64_t)v78;
          _IDSLogTransport(@"GL", @"IDS", @"update state (%s->%s) for %@.");

          if (_IDSShouldLog())
          {
            int v83 = (&_IDSStunCandidatePairStateStrings)[self->_state];
            uint64_t v84 = off_1E944EAA0;
            objc_msgSend_candidatePairToken(self, v80, v81, v82, v135, v79, *((void *)&v142 + 1));
            *((void *)&v142 + 1) = *(void *)&long long v142 = v84;
            unint64_t v135 = (unint64_t)v83;
            _IDSLogV(0, @"IDSFoundation", @"GL", @"update state (%s->%s) for %@.");
          }
        }
      }
      self->_state = 2;
      uint64_t v85 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t participantID = self->_participantID;
        objc_msgSend_base64EncodedStringWithOptions_(self->_relaySessionToken, v86, 0, v87);
        __int16 v89 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v147 = 134218242;
        unint64_t v148 = participantID;
        __int16 v149 = 2112;
        v150 = v89;
        _os_log_impl(&dword_19D9BE000, v85, OS_LOG_TYPE_DEFAULT, "failed participant:[%16llX], token:[%@]", v147, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          unint64_t v90 = self->_participantID;
          objc_msgSend_base64EncodedStringWithOptions_(self->_relaySessionToken, v64, 0, v67);
          *(void *)&v142 = unint64_t v135 = v90;
          _IDSLogTransport(@"GL", @"IDS", @"failed participant:[%16llX], token:[%@]");

          if (_IDSShouldLog())
          {
            unint64_t v91 = self->_participantID;
            objc_msgSend_base64EncodedStringWithOptions_(self->_relaySessionToken, v64, 0, v67, v135, (void)v142);
            *(void *)&v142 = unint64_t v135 = v91;
            _IDSLogV(0, @"IDSFoundation", @"GL", @"failed participant:[%16llX], token:[%@]");
          }
        }
      }
    }
    else
    {
      switch(v19)
      {
        case 4088:
          uint64_t v106 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v147 = 0;
            _os_log_impl(&dword_19D9BE000, v106, OS_LOG_TYPE_DEFAULT, "receive plugin registrion error response", v147, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"GL", @"IDS", @"receive plugin registrion error response");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"GL", @"receive plugin registrion error response");
              }
            }
          }
          break;
        case 4087:
          uint64_t v112 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
          {
            v116 = objc_msgSend_candidatePairToken(self, v113, v114, v115);
            *(_DWORD *)v147 = 138412290;
            unint64_t v148 = (unint64_t)v116;
            _os_log_impl(&dword_19D9BE000, v112, OS_LOG_TYPE_DEFAULT, "receive participant update error response for %@.", v147, 0xCu);
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              v140 = objc_msgSend_candidatePairToken(self, v117, v118, v119);
              _IDSLogTransport(@"GL", @"IDS", @"receive participant update error response for %@.");

              if (_IDSShouldLog())
              {
                v141 = objc_msgSend_candidatePairToken(self, v120, v121, v122, v140);
                _IDSLogV(0, @"IDSFoundation", @"GL", @"receive participant update error response for %@.");
              }
            }
          }
          v123 = StunUtilProcessParticipantUpdate(v8, v146, 4087);
          id v108 = v123;
          if (!v123 || !objc_msgSend_count(v123, v124, v125, v126))
          {
            v134 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v147 = 0;
              _os_log_impl(&dword_19D9BE000, v134, OS_LOG_TYPE_DEFAULT, "receive participant update error response: invalid participantUpdateInfo", v147, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"receive participant update error response: invalid participantUpdateInfo");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"receive participant update error response: invalid participantUpdateInfo");
                }
              }
            }
            BOOL v31 = 0;
            goto LABEL_64;
          }
          unsigned int v127 = sub_19DB27BE8(v146);
          if (objc_msgSend__optionallyCheckEncMarker_(self, v128, (uint64_t)v8, v129)) {
            uint64_t v130 = v127;
          }
          else {
            uint64_t v130 = 4;
          }
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend_candidatePair_didReceiveParticipantUpdate_status_(WeakRetained, v132, (uint64_t)self, v133, v108, v130);

LABEL_63:
          BOOL v31 = 1;
LABEL_64:

          goto LABEL_65;
        case 4085:
          int64_t var2 = a4->var2;
          uint64_t v93 = objc_msgSend_requestID(v8, v64, v65, v67);
          uint64_t StunSentBytes = objc_msgSend_getStunSentBytes_(self, v94, (uint64_t)v93, v95);

          unsigned __int16 v97 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v101 = objc_msgSend_candidatePairToken(self, v98, v99, v100);
            *(_DWORD *)v147 = 138412290;
            unint64_t v148 = (unint64_t)v101;
            _os_log_impl(&dword_19D9BE000, v97, OS_LOG_TYPE_DEFAULT, "receive session-info error response for %@.", v147, 0xCu);
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              v138 = objc_msgSend_candidatePairToken(self, v102, v104, v103);
              _IDSLogTransport(@"GL", @"IDS", @"receive session-info error response for %@.");

              if (_IDSShouldLog())
              {
                v139 = objc_msgSend_candidatePairToken(self, v102, v105, v103, v138);
                _IDSLogV(0, @"IDSFoundation", @"GL", @"receive session-info error response for %@.");
              }
            }
          }
          BYTE12(v142) = 0;
          *(void *)((char *)&v142 + 4) = 2;
          LOWORD(v142) = 0;
          objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v102, 0, v103, 0, 0, 0, 0, StunSentBytes, var2 + a5, v142, *(void *)&v143, v144);
          break;
      }
    }
    uint64_t v107 = objc_msgSend__didLocalExternalAddressChange_(self, v64, (uint64_t)v153, v67, v135, v142);
    id v108 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_candidatePair_didReceiveStunErrorResponse_errorCode_didLocalExternalAddressChange_(v108, v109, (uint64_t)self, v110, v19, v146, v107);
    goto LABEL_63;
  }
  unsigned __int8 v32 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = (unsigned __int16)v19;
    _os_log_impl(&dword_19D9BE000, v32, OS_LOG_TYPE_DEFAULT, "receive invalid stun error code attr, ignore error response %04x.", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"receive invalid stun error code attr, ignore error response %04x.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"receive invalid stun error code attr, ignore error response %04x.");
      }
    }
  }
  BOOL v31 = 0;
LABEL_65:

  return v31;
}

- (void)processSessionInfoRequestTimeout:(id)a3
{
  uint64_t StunSentBytes = objc_msgSend_getStunSentBytes_(self, a2, (uint64_t)a3, v3);
  v9[8] = 0;
  *(void *)uint64_t v9 = 3;
  __int16 v8 = 0;
  objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v6, 0, v7, 0, 0, 0, 0, StunSentBytes, 0, v8, *(void *)&v9[4]);
}

- (void)_notifySessionStreamInfoReceived:(id)a3 withParticipants:(id)a4 lightweightParticipants:(id)a5 joinedParticipantInfo:(id)a6 leftParticipantInfo:(id)a7 sentBytes:(unint64_t)a8 receivedBytes:(unint64_t)a9 offlineRequest:(BOOL)a10 streamInfoRequest:(BOOL)a11 status:(unsigned int)a12 commandFlag:(unsigned int)a13 isIndication:(BOOL)a14
{
  id value = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  double v23 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v26 = v23;
  if (v21) {
    CFDictionarySetValue(v23, @"gl-option-sessioninfo-response-joined-participant-info-key", v21);
  }
  if (v22) {
    CFDictionarySetValue(v26, @"gl-option-sessioninfo-response-left-participant-info-key", v22);
  }
  if (value) {
    CFDictionarySetValue(v26, @"gl-option-sessioninfo-response-streaminfo-key", value);
  }
  if (v19) {
    CFDictionarySetValue(v26, @"gl-option-sessioninfo-response-participants-key", v19);
  }
  if (v20) {
    CFDictionarySetValue(v26, @"gl-option-sessioninfo-response-lightweight-participants-key", v20);
  }
  if (a8)
  {
    double v27 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v24, a8, v25);
    if (v27) {
      CFDictionarySetValue(v26, @"gl-option-sessioninfo-request-bytes-sent-key", v27);
    }
  }
  if (a9)
  {
    uint64_t v28 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v24, a9, v25);
    if (v28) {
      CFDictionarySetValue(v26, @"gl-option-sessioninfo-response-bytes-received-key", v28);
    }
  }
  if (a10)
  {
    uint64_t v29 = objc_msgSend_numberWithBool_(NSNumber, v24, 1, v25);
    if (v29) {
      CFDictionarySetValue(v26, @"gl-option-sessioninfo-response-offline-request-key", v29);
    }
  }
  if (a11) {
    CFDictionarySetValue(v26, @"gl-option-sessioninfo-request-type", &unk_1EF028D80);
  }
  if (a13)
  {
    double v30 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v24, a13, v25);
    if (v30) {
      CFDictionarySetValue(v26, @"gl-option-sessioninfo-command-flag", v30);
    }
  }
  if (a14)
  {
    BOOL v31 = objc_msgSend_numberWithBool_(NSNumber, v24, 1, v25);
    if (v31) {
      CFDictionarySetValue(v26, @"gl-option-sessioninfo-Indication", v31);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend_candidatePair_didReceiveSessionInfo_status_(WeakRetained, v33, (uint64_t)self, v34, v26, a12);
}

- (void)_notifyQREventAdded:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_candidatePair_didAddQREvent_(v6, v7, (uint64_t)self, v8, v9);
  }
}

- (void)addProtoRequest:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  pendingProtoRequests = self->_pendingProtoRequests;
  if (!pendingProtoRequests)
  {
    double v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    double v8 = self->_pendingProtoRequests;
    self->_pendingProtoRequests = v7;

    pendingProtoRequests = self->_pendingProtoRequests;
  }
  id v9 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, a2, a3, v3);
  char v12 = objc_msgSend_containsObject_(pendingProtoRequests, v10, (uint64_t)v9, v11);

  if ((v12 & 1) == 0)
  {
    uint64_t v15 = self->_pendingProtoRequests;
    uint64_t v16 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v13, a3, v14);
    objc_msgSend_addObject_(v15, v17, (uint64_t)v16, v18);

    id v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v21 = a3;
      __int16 v22 = 2112;
      double v23 = self;
      _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "add pending proto request: %llu for %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"add pending proto request: %llu for %@");
      }
    }
  }
}

- (BOOL)removeProtoRequest:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  pendingProtoRequests = self->_pendingProtoRequests;
  if (!pendingProtoRequests)
  {
    double v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    double v8 = self->_pendingProtoRequests;
    self->_pendingProtoRequests = v7;

    pendingProtoRequests = self->_pendingProtoRequests;
  }
  id v9 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, a2, a3, v3);
  int v12 = objc_msgSend_containsObject_(pendingProtoRequests, v10, (uint64_t)v9, v11);

  if (v12)
  {
    uint64_t v15 = self->_pendingProtoRequests;
    uint64_t v16 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v13, a3, v14);
    objc_msgSend_removeObject_(v15, v17, (uint64_t)v16, v18);

    id v19 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v22 = a3;
      __int16 v23 = 2112;
      uint64_t v24 = self;
      _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "remove pending proto request: %llu for %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"remove pending proto request: %llu for %@");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"remove pending proto request: %llu for %@");
        }
      }
    }
  }
  return v12;
}

- (void)_savePluginNameForProtoRequest:(unint64_t)a3 pluginName:(id)a4
{
  id v19 = a4;
  pendingProtoRequests = self->_pendingProtoRequests;
  id v9 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v7, a3, v8);
  LODWORD(pendingProtoRequests) = objc_msgSend_containsObject_(pendingProtoRequests, v10, (uint64_t)v9, v11);

  if (pendingProtoRequests)
  {
    if (!self->_pluginNameToStunReqID)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      pluginNameToStunReqID = self->_pluginNameToStunReqID;
      self->_pluginNameToStunReqID = Mutable;
    }
    id v15 = v19;
    if (v15)
    {
      uint64_t v17 = self->_pluginNameToStunReqID;
      double v18 = (const void *)objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v14, a3, v16);
      CFDictionarySetValue((CFMutableDictionaryRef)v17, v18, v15);
    }
  }
}

- (id)_pluginNameForProtoRequest:(unint64_t)a3
{
  if (self->_pluginNameToStunReqID)
  {
    double v7 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, a2, a3, v3);
    if (v7)
    {
      pluginNameToStunReqID = self->_pluginNameToStunReqID;
      uint64_t v10 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v6, a3, v8);
      double v11 = (id)CFDictionaryGetValue((CFDictionaryRef)pluginNameToStunReqID, v10);
    }
    else
    {
      double v11 = 0;
    }
  }
  else
  {
    double v11 = 0;
  }
  return v11;
}

- (void)_removeProtoPluginRegistrationRequest:(unint64_t)a3
{
  pluginNameToStunReqID = self->_pluginNameToStunReqID;
  objc_msgSend_numberWithUnsignedLongLong_(NSNumber, a2, a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(pluginNameToStunReqID, v5, (uint64_t)v7, v6);
}

- (void)sendQUICInfoRequest
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (self->_state < 5)
  {
    double v16 = [IDSQRProtoMessage alloc];
    id v15 = objc_msgSend_initWithType_candidatePair_options_(v16, v17, 5, v18, self, 0);
    if (v15)
    {
      id v19 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v20, v21, v22);
        __int16 v23 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        double v56 = v15;
        __int16 v57 = 2112;
        uint64_t v58 = v23;
        _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "send info request %@ for %@.", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v49 = objc_msgSend_candidatePairToken(self, v24, v25, v26);
          _IDSLogTransport(@"GL", @"IDS", @"send info request %@ for %@.");

          if (_IDSShouldLog())
          {
            uint64_t v50 = objc_msgSend_candidatePairToken(self, v27, v28, v29, v15, v49);
            _IDSLogV(0, @"IDSFoundation", @"GL", @"send info request %@ for %@.");
          }
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v33 = objc_msgSend_sendProtoMessage_candidatePair_(WeakRetained, v31, (uint64_t)v15, v32, self);

      uint64_t v37 = objc_msgSend_transactionID(v15, v34, v35, v36);
      objc_msgSend_addProtoRequest_(self, v38, v37, v39);
      int v42 = objc_msgSend_stringWithFormat_(NSString, v40, @"%llu", v41, v37);
      objc_msgSend_updateStunSentBytes_requestID_(self, v43, v33, v44, v42);
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = sub_19DB36D4C;
      v51[3] = &unk_1E59758B0;
      id v52 = v42;
      uint64_t v53 = v37;
      int v54 = 5;
      v51[4] = self;
      id v45 = v42;
      IDSTransportThreadAddBlockAfter(v51, 10.0);
    }
    else
    {
      uint64_t v46 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v46, OS_LOG_TYPE_DEFAULT, "failed to create info request.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"failed to create info request.");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to create info request.");
          }
        }
      }
    }
    goto LABEL_22;
  }
  double v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_msgSend_candidatePairToken(self, v4, v5, v6);
    double v8 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    double v56 = v7;
    __int16 v57 = 2080;
    uint64_t v58 = v8;
    _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEFAULT, "skip info request for %@, state [%s].", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      double v47 = objc_msgSend_candidatePairToken(self, v9, v10, v11);
      double v48 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(@"GL", @"IDS", @"skip info request for %@, state [%s].");

      if (_IDSShouldLog())
      {
        id v15 = objc_msgSend_candidatePairToken(self, v12, v13, v14, v47, v48);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"skip info request for %@, state [%s].");
LABEL_22:
      }
    }
  }
}

- (void)sendQUICParticipantUpdateRequestWithOptions:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    double v18 = [IDSQRProtoMessage alloc];
    uint64_t v17 = objc_msgSend_initWithType_candidatePair_options_(v18, v19, 7, v20, self, v4);
    if (v17)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v24 = objc_msgSend_sendProtoMessage_candidatePair_(WeakRetained, v22, (uint64_t)v17, v23, self);

      uint64_t v28 = objc_msgSend_transactionID(v17, v25, v26, v27);
      objc_msgSend_addProtoRequest_(self, v29, v28, v30);
      uint64_t v33 = objc_msgSend_stringWithFormat_(NSString, v31, @"%llu", v32, v28);
      objc_msgSend_updateStunSentBytes_requestID_(self, v34, v24, v35, v33);
      double v36 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v37, v38, v39);
        __int16 v40 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        __int16 v57 = v17;
        __int16 v58 = 2112;
        uint64_t v59 = v40;
        __int16 v60 = 2048;
        uint64_t v61 = v24;
        _os_log_impl(&dword_19D9BE000, v36, OS_LOG_TYPE_DEFAULT, "send participant update request %@ for %@, sentBytes: %lu", buf, 0x20u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v50 = objc_msgSend_candidatePairToken(self, v41, v42, v43);
          _IDSLogTransport(@"GL", @"IDS", @"send participant update request %@ for %@, sentBytes: %lu");

          if (_IDSShouldLog())
          {
            uint64_t v51 = objc_msgSend_candidatePairToken(self, v44, v45, v46, v17, v50, v24);
            _IDSLogV(0, @"IDSFoundation", @"GL", @"send participant update request %@ for %@, sentBytes: %lu");
          }
        }
      }
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = sub_19DB37428;
      v52[3] = &unk_1E59758B0;
      v52[4] = self;
      uint64_t v54 = v28;
      int v55 = 7;
      id v53 = v4;
      IDSTransportThreadAddBlockAfter(v52, 10.0);
    }
    else
    {
      double v47 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v47, OS_LOG_TYPE_DEFAULT, "failed to create participant update request.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"failed to create participant update request.");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to create participant update request.");
          }
        }
      }
    }
    goto LABEL_22;
  }
  uint64_t v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend_candidatePairToken(self, v6, v7, v8);
    uint64_t v10 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    __int16 v57 = v9;
    __int16 v58 = 2080;
    uint64_t v59 = v10;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "skip participant update request for %@, state [%s].", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      double v48 = objc_msgSend_candidatePairToken(self, v11, v12, v13);
      uint64_t v49 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(@"GL", @"IDS", @"skip participant update request for %@, state [%s].");

      if (_IDSShouldLog())
      {
        uint64_t v17 = objc_msgSend_candidatePairToken(self, v14, v15, v16, v48, v49);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"skip participant update request for %@, state [%s].");
LABEL_22:
      }
    }
  }
}

- (void)sendQUICPluginRegistrationRequestWithOptions:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  if (self->_state < 5)
  {
    double v18 = [IDSQRProtoMessage alloc];
    uint64_t v17 = objc_msgSend_initWithType_candidatePair_options_(v18, v19, 10, v20, self, v4);
    if (v17)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v24 = objc_msgSend_sendProtoMessage_candidatePair_(WeakRetained, v22, (uint64_t)v17, v23, self);

      uint64_t v28 = objc_msgSend_transactionID(v17, v25, v26, v27);
      objc_msgSend_addProtoRequest_(self, v29, v28, v30);
      uint64_t v33 = objc_msgSend_stringWithFormat_(NSString, v31, @"%llu", v32, v28);
      objc_msgSend_updateStunSentBytes_requestID_(self, v34, v24, v35, v33);
      Value = 0;
      if (v4 && @"gl-option-plugin-operation") {
        Value = (void *)CFDictionaryGetValue(v4, @"gl-option-plugin-operation");
      }
      id v37 = Value;
      int isEqualToNumber = objc_msgSend_isEqualToNumber_(v37, v38, (uint64_t)&unk_1EF028D68, v39);
      double v41 = @"Unregister";
      if (isEqualToNumber) {
        double v41 = @"Register";
      }
      double v43 = v41;
      uint64_t v45 = 0;
      double v46 = NSString;
      if (v4)
      {
        uint64_t v42 = (const char *)@"gl-option-plugin-name";
        if (@"gl-option-plugin-name") {
          uint64_t v45 = CFDictionaryGetValue(v4, @"gl-option-plugin-name");
        }
      }
      double v47 = objc_msgSend_stringWithFormat_(v46, v42, @"%@.%@", v44, v45, v43);
      objc_msgSend__savePluginNameForProtoRequest_pluginName_(self, v48, v28, v49, v47);
      uint64_t v50 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v51, v52, v53);
        uint64_t v54 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        long long v69 = v17;
        __int16 v70 = 2112;
        double v71 = v54;
        _os_log_impl(&dword_19D9BE000, v50, OS_LOG_TYPE_DEFAULT, "send QR plugin registration request %@ for %@.", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          double v64 = objc_msgSend_candidatePairToken(self, v55, v56, v57);
          _IDSLogTransport(@"GL", @"IDS", @"send QR plugin registration request %@ for %@.");

          if (_IDSShouldLog())
          {
            uint64_t v65 = objc_msgSend_candidatePairToken(self, v58, v59, v60, v17, v64);
            _IDSLogV(0, @"IDSFoundation", @"GL", @"send QR plugin registration request %@ for %@.");
          }
        }
      }
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = sub_19DB37C20;
      v66[3] = &unk_1E59758D8;
      v66[4] = self;
      v66[5] = v28;
      int v67 = 10;
      IDSTransportThreadAddBlockAfter(v66, 10.0);
    }
    else
    {
      uint64_t v61 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v61, OS_LOG_TYPE_DEFAULT, "failed to create QR plugin registration request.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"failed to create QR plugin registration request.");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to create QR plugin registration request.");
          }
        }
      }
    }
    goto LABEL_30;
  }
  uint64_t v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend_candidatePairToken(self, v6, v7, v8);
    uint64_t v10 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    long long v69 = v9;
    __int16 v70 = 2080;
    double v71 = v10;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "skip plugin registration request for %@, state [%s].", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v62 = objc_msgSend_candidatePairToken(self, v11, v12, v13);
      uint64_t v63 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(@"GL", @"IDS", @"skip plugin registration request for %@, state [%s].");

      if (_IDSShouldLog())
      {
        uint64_t v17 = objc_msgSend_candidatePairToken(self, v14, v15, v16, v62, v63);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"skip plugin registration request for %@, state [%s].");
LABEL_30:
      }
    }
  }
}

- (void)sendQUICSessionInfoRequestWithOptions:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    double v18 = [IDSQRProtoMessage alloc];
    uint64_t v17 = objc_msgSend_initWithType_candidatePair_options_(v18, v19, 15, v20, self, v4);
    if (v17)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v24 = objc_msgSend_sendProtoMessage_candidatePair_(WeakRetained, v22, (uint64_t)v17, v23, self);

      uint64_t v28 = objc_msgSend_transactionID(v17, v25, v26, v27);
      objc_msgSend_addProtoRequest_(self, v29, v28, v30);
      double v35 = objc_msgSend_stringWithFormat_(NSString, v31, @"%llu", v32, v28);
      Value = 0;
      if (v4)
      {
        uint64_t v33 = (const char *)@"gl-option-sessioninfo-link-id-to-query";
        if (@"gl-option-sessioninfo-link-id-to-query") {
          Value = (void *)CFDictionaryGetValue(v4, @"gl-option-sessioninfo-link-id-to-query");
        }
      }
      char v39 = objc_msgSend_intValue(Value, v33, v34, v36);
      requestIDToQueryLinkIDs = self->_requestIDToQueryLinkIDs;
      if (!requestIDToQueryLinkIDs)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        double v43 = self->_requestIDToQueryLinkIDs;
        self->_requestIDToQueryLinkIDs = Mutable;

        requestIDToQueryLinkIDs = self->_requestIDToQueryLinkIDs;
      }
      double v44 = objc_msgSend_numberWithChar_(NSNumber, v38, v39, v40);
      objc_msgSend_setObject_forKey_(requestIDToQueryLinkIDs, v45, (uint64_t)v44, v46, v35);

      if (!self->_requestIDToSessionInfoReqType)
      {
        double v49 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        requestIDToSessionInfoReqType = self->_requestIDToSessionInfoReqType;
        self->_requestIDToSessionInfoReqType = v49;
      }
      if (v4)
      {
        double v47 = (const char *)@"gl-option-sessioninfo-request-type";
        if (@"gl-option-sessioninfo-request-type")
        {
          uint64_t v51 = (id)CFDictionaryGetValue(v4, @"gl-option-sessioninfo-request-type");
          if (v51)
          {
            uint64_t v52 = v51;
            CFDictionarySetValue((CFMutableDictionaryRef)self->_requestIDToSessionInfoReqType, v35, v51);
          }
        }
      }
      objc_msgSend_updateStunSentBytes_requestID_(self, v47, v24, v48, v35);
      double v53 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v54, v55, v56);
        double v57 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        int v75 = v17;
        __int16 v76 = 2112;
        double v77 = v57;
        __int16 v78 = 2048;
        uint64_t v79 = v24;
        _os_log_impl(&dword_19D9BE000, v53, OS_LOG_TYPE_DEFAULT, "send session-info request %@ for %@, sentBytes: %lu", buf, 0x20u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          long long v68 = objc_msgSend_candidatePairToken(self, v58, v59, v60);
          _IDSLogTransport(@"GL", @"IDS", @"send session-info request %@ for %@, sentBytes: %lu");

          if (_IDSShouldLog())
          {
            long long v69 = objc_msgSend_candidatePairToken(self, v61, v62, v63, v17, v68, v24);
            _IDSLogV(0, @"IDSFoundation", @"GL", @"send session-info request %@ for %@, sentBytes: %lu");
          }
        }
      }
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = sub_19DB383D8;
      v70[3] = &unk_1E59758B0;
      id v71 = v35;
      uint64_t v72 = v28;
      int v73 = 15;
      v70[4] = self;
      id v64 = v35;
      IDSTransportThreadAddBlockAfter(v70, 10.0);
    }
    else
    {
      uint64_t v65 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v65, OS_LOG_TYPE_DEFAULT, "failed to create session-info request.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"failed to create session-info request.");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to create session-info request.");
          }
        }
      }
    }
    goto LABEL_33;
  }
  uint64_t v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend_candidatePairToken(self, v6, v7, v8);
    uint64_t v10 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    int v75 = v9;
    __int16 v76 = 2080;
    double v77 = v10;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "skip session-info request for %@, state [%s].", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v66 = objc_msgSend_candidatePairToken(self, v11, v12, v13);
      int v67 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(@"GL", @"IDS", @"skip session-info request for %@, state [%s].");

      if (_IDSShouldLog())
      {
        uint64_t v17 = objc_msgSend_candidatePairToken(self, v14, v15, v16, v66, v67);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"skip session-info request for %@, state [%s].");
LABEL_33:
      }
    }
  }
}

- (void)sendQUICStatsRequestWithOptions:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    double v18 = [IDSQRProtoMessage alloc];
    uint64_t v17 = objc_msgSend_initWithType_candidatePair_options_(v18, v19, 18, v20, self, v4);
    if (v17)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v24 = objc_msgSend_sendProtoMessage_candidatePair_(WeakRetained, v22, (uint64_t)v17, v23, self);

      uint64_t v28 = objc_msgSend_transactionID(v17, v25, v26, v27);
      double v29 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        int linkID = self->_linkID;
        *(_DWORD *)buf = 134218240;
        uint64_t v69 = v28;
        __int16 v70 = 1024;
        LODWORD(v71) = linkID;
        _os_log_impl(&dword_19D9BE000, v29, OS_LOG_TYPE_DEFAULT, "send stats req %llx for link %d.", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v56 = v28;
          uint64_t v59 = self->_linkID;
          _IDSLogTransport(@"GL", @"IDS", @"send stats req %llx for link %d.");
          if (_IDSShouldLog())
          {
            uint64_t v56 = v28;
            uint64_t v59 = self->_linkID;
            _IDSLogV(0, @"IDSFoundation", @"GL", @"send stats req %llx for link %d.");
          }
        }
      }
      objc_msgSend_addProtoRequest_(self, v31, v28, v32, v56, v59);
      id v37 = objc_msgSend_stringWithFormat_(NSString, v33, @"%llu", v34, v28);
      Value = 0;
      if (v4)
      {
        double v35 = (const char *)@"ids-extchannel-stat-identifier-key";
        if (@"ids-extchannel-stat-identifier-key") {
          Value = (void *)CFDictionaryGetValue(v4, @"ids-extchannel-stat-identifier-key");
        }
      }
      uint64_t v42 = objc_msgSend_unsignedLongLongValue(Value, v35, v36, v38);
      double v44 = 0;
      if (self->_requestIDToStatsIDs && v37) {
        double v44 = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_requestIDToStatsIDs, v37);
      }
      uint64_t v45 = objc_msgSend_unsignedLongLongValue(v44, v40, v41, v43);
      if (v42 && v42 != v45)
      {
        if (!self->_requestIDToStatsIDs)
        {
          Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          requestIDToStatsIDs = self->_requestIDToStatsIDs;
          self->_requestIDToStatsIDs = Mutable;
        }
        uint64_t v50 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v46, v42, v47);
        if (v50) {
          CFDictionarySetValue((CFMutableDictionaryRef)self->_requestIDToStatsIDs, v37, v50);
        }

        uint64_t v51 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v69 = v42;
          __int16 v70 = 2112;
          id v71 = (char *)v37;
          _os_log_impl(&dword_19D9BE000, v51, OS_LOG_TYPE_DEFAULT, "sendQUICStatsRequestWithOptions: add stats identifier %llu for %@.", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            uint64_t v58 = v42;
            uint64_t v61 = v37;
            _IDSLogTransport(@"GL", @"IDS", @"sendQUICStatsRequestWithOptions: add stats identifier %llu for %@.");
            if (_IDSShouldLog())
            {
              uint64_t v58 = v42;
              uint64_t v61 = v37;
              _IDSLogV(0, @"IDSFoundation", @"GL", @"sendQUICStatsRequestWithOptions: add stats identifier %llu for %@.");
            }
          }
        }
      }
      objc_msgSend_updateStunSentBytes_requestID_(self, v46, v24, v47, v37, v58, v61);
      unsigned int v52 = self->_statsIntervalInSeconds >> 1;
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = sub_19DB38BFC;
      v62[3] = &unk_1E5975900;
      uint64_t v64 = v28;
      uint64_t v65 = v42;
      v62[4] = self;
      id v63 = v37;
      char v67 = v52;
      int v66 = 18;
      double v53 = (double)v52;
      id v54 = v37;
      IDSTransportThreadAddBlockAfter(v62, v53);
    }
    else
    {
      uint64_t v55 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v55, OS_LOG_TYPE_DEFAULT, "failed to create stats request.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"failed to create stats request.");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to create stats request.");
          }
        }
      }
    }
    goto LABEL_40;
  }
  uint64_t v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend_candidatePairToken(self, v6, v7, v8);
    uint64_t v10 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    uint64_t v69 = (uint64_t)v9;
    __int16 v70 = 2080;
    id v71 = v10;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "skip stats request for %@, state [%s].", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      double v57 = objc_msgSend_candidatePairToken(self, v11, v12, v13);
      double v60 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(@"GL", @"IDS", @"skip stats request for %@, state [%s].");

      if (_IDSShouldLog())
      {
        uint64_t v17 = objc_msgSend_candidatePairToken(self, v14, v15, v16, v57, v60);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"skip stats request for %@, state [%s].");
LABEL_40:
      }
    }
  }
}

- (void)sendQUICTestRequest
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    self->_double testStartTime = 0.0;
    if (self->_testSubOperation)
    {
      double v16 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v17 = objc_msgSend_numberWithUnsignedInt_(NSNumber, a2, self->_testOptions, v2);
      __int16 v76 = objc_msgSend_dictionaryWithObjectsAndKeys_(v16, v18, (uint64_t)v17, v19, @"gl-option-test-options-flags", self->_testSubOperation, @"gl-option-test-sub-operation", 0);
    }
    else
    {
      BOOL v20 = self->_testRequestedErrorCode == 0;
      uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v17 = objc_msgSend_numberWithUnsignedInt_(NSNumber, a2, self->_testOptions, v2);
      if (v20)
      {
        __int16 v76 = objc_msgSend_dictionaryWithObject_forKey_(v21, v22, (uint64_t)v17, v23, @"gl-option-test-options-flags");
      }
      else
      {
        uint64_t v24 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v22, self->_testRequestedMessageType, v23);
        double v27 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v25, self->_testRequestedErrorCode, v26);
        __int16 v76 = objc_msgSend_dictionaryWithObjectsAndKeys_(v21, v28, (uint64_t)v17, v29, @"gl-option-test-options-flags", v24, @"gl-option-test-requested-message-type", v27, @"gl-option-test-requested-error-code-type", 0);
      }
    }

    double v30 = [IDSQRProtoMessage alloc];
    uint64_t v33 = objc_msgSend_initWithType_candidatePair_options_(v30, v31, 20, v32, self, v76);
    if (v33)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v37 = objc_msgSend_sendProtoMessage_candidatePair_(WeakRetained, v35, (uint64_t)v33, v36, self);

      uint64_t v41 = objc_msgSend_transactionID(v33, v38, v39, v40);
      objc_msgSend_addProtoRequest_(self, v42, v41, v43);
      double v46 = objc_msgSend_stringWithFormat_(NSString, v44, @"%llu", v45, v41);
      objc_msgSend_updateStunSentBytes_requestID_(self, v47, v37, v48, v46);
      double v49 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int testOptions = self->_testOptions;
        int testRequestedMessageType = self->_testRequestedMessageType;
        int testRequestedErrorCode = self->_testRequestedErrorCode;
        testSubOperation = self->_testSubOperation;
        double v57 = objc_msgSend_candidatePairToken(self, v50, v51, v52);
        int linkID = self->_linkID;
        *(_DWORD *)buf = 67110914;
        *(_DWORD *)uint64_t v79 = testOptions;
        *(_WORD *)&v79[4] = 1024;
        *(_DWORD *)&v79[6] = testRequestedMessageType;
        LOWORD(v80) = 1024;
        *(_DWORD *)((char *)&v80 + 2) = testRequestedErrorCode;
        HIWORD(v80) = 2112;
        uint64_t v81 = testSubOperation;
        __int16 v82 = 2112;
        int v83 = v33;
        __int16 v84 = 2112;
        uint64_t v85 = v57;
        __int16 v86 = 2112;
        double v87 = v46;
        __int16 v88 = 1024;
        int v89 = linkID;
        _os_log_impl(&dword_19D9BE000, v49, OS_LOG_TYPE_DEFAULT, "send test(0x%x,%u,%u,%@) request %@ for %@, %@ link: %d", buf, 0x42u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v62 = self->_testOptions;
          uint64_t v63 = self->_testRequestedMessageType;
          uint64_t v64 = self->_testRequestedErrorCode;
          uint64_t v65 = self->_testSubOperation;
          int v66 = objc_msgSend_candidatePairToken(self, v59, v60, v61);
          uint64_t v75 = self->_linkID;
          _IDSLogTransport(@"GL", @"IDS", @"send test(0x%x,%u,%u,%@) request %@ for %@, %@ link: %d");

          if (_IDSShouldLog())
          {
            __int16 v70 = objc_msgSend_candidatePairToken(self, v67, v68, v69, v62, v63, v64, v65, v33, v66, v46, v75);
            _IDSLogV(0, @"IDSFoundation", @"GL", @"send test(0x%x,%u,%u,%@) request %@ for %@, %@ link: %d");
          }
        }
      }
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = sub_19DB39434;
      v77[3] = &unk_1E5975888;
      v77[4] = self;
      v77[5] = v41;
      IDSTransportThreadAddBlockAfter(v77, 10.0);
    }
    else
    {
      id v71 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v71, OS_LOG_TYPE_DEFAULT, "failed to create test request.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"failed to create test request.");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to create test request.");
          }
        }
      }
    }
  }
  else
  {
    CFDictionaryRef v4 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = objc_msgSend_candidatePairToken(self, v5, v6, v7);
      id v9 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      *(_DWORD *)buf = 138412546;
      *(void *)uint64_t v79 = v8;
      *(_WORD *)&v79[8] = 2080;
      uint64_t v80 = v9;
      _os_log_impl(&dword_19D9BE000, v4, OS_LOG_TYPE_DEFAULT, "skip test request for %@, state [%s].", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      uint64_t v72 = objc_msgSend_candidatePairToken(self, v10, v11, v12);
      uint64_t v74 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(@"GL", @"IDS", @"skip test request for %@, state [%s].");

      if (_IDSShouldLog())
      {
        int v73 = objc_msgSend_candidatePairToken(self, v13, v14, v15, v72, v74);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"skip test request for %@, state [%s].");
      }
    }
  }
}

- (BOOL)processQUICInfoResponse:(id)a3 receivedBytes:(unint64_t)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_transactionID(v6, v7, v8, v9);
  double v13 = objc_msgSend_stringWithFormat_(NSString, v11, @"%llu", v12, v10);
  if (objc_msgSend_removeProtoRequest_(self, v14, v10, v15))
  {
    double v19 = objc_msgSend_infoResponse(v6, v16, v17, v18);
    double v23 = v19;
    if (v19)
    {
      uint64_t v24 = objc_msgSend_clientAddress(v19, v20, v21, v22);
      BOOL v25 = v24 != 0;
      if (v24)
      {
        double v26 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v56 = v24;
          _os_log_impl(&dword_19D9BE000, v26, OS_LOG_TYPE_DEFAULT, "Got info response with client address [%@]", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"Got info response with client address [%@]");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"Got info response with client address [%@]");
            }
          }
        }
        double v27 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v31 = objc_msgSend_candidatePairToken(self, v28, v29, v30);
          *(_DWORD *)buf = 138412290;
          uint64_t v56 = v31;
          _os_log_impl(&dword_19D9BE000, v27, OS_LOG_TYPE_DEFAULT, "receive info-response for %@.", buf, 0xCu);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            uint64_t v51 = objc_msgSend_candidatePairToken(self, v32, v33, v34);
            _IDSLogTransport(@"GL", @"IDS", @"receive info-response for %@.");

            if (_IDSShouldLog())
            {
              double v52 = objc_msgSend_candidatePairToken(self, v35, v36, v37, v51);
              _IDSLogV(0, @"IDSFoundation", @"GL", @"receive info-response for %@.");
            }
          }
        }
        double v38 = ProtoUtilProcessActiveParticipantsFromInfo(v23);
        uint64_t v39 = ProtoUtilProcessActiveLightweightParticipantsFromInfo(v23);
        uint64_t StunSentBytes = objc_msgSend_getStunSentBytes_(self, v40, (uint64_t)v13, v41);
        BYTE4(v54) = 0;
        LODWORD(v54) = 0;
        LOWORD(v53) = 1;
        objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v43, 0, v44, v38, v39, 0, 0, StunSentBytes, a4, v53, v54);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend_disconnectIdleQUICConnectionForCandidatePair_(WeakRetained, v46, (uint64_t)self, v47);
      }
      else
      {
        double v49 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v49, OS_LOG_TYPE_DEFAULT, "processQUICInfoResponse failed due to invalid client address.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"processQUICInfoResponse failed due to invalid client address.");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"processQUICInfoResponse failed due to invalid client address.");
            }
          }
        }
      }
    }
    else
    {
      double v48 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v48, OS_LOG_TYPE_DEFAULT, "processQUICInfoResponse failed due to invalid infoResponse.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"processQUICInfoResponse failed due to invalid infoResponse.");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"processQUICInfoResponse failed due to invalid infoResponse.");
          }
        }
      }
      BOOL v25 = 0;
    }
  }
  else
  {
    BOOL v25 = 1;
  }

  return v25;
}

- (BOOL)processQUICParticipantUpdateResponse:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_transactionID(v4, v5, v6, v7);
  if (objc_msgSend_removeProtoRequest_(self, v9, v8, v10))
  {
    uint64_t v14 = objc_msgSend_participantUpdateResponse(v4, v11, v12, v13);
    BOOL v15 = v14 != 0;
    if (v14)
    {
      double v16 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v20 = objc_msgSend_candidatePairToken(self, v17, v18, v19);
        *(_DWORD *)buf = 134218242;
        uint64_t v34 = v8;
        __int16 v35 = 2112;
        uint64_t v36 = v20;
        _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "receive participant update response %llu for %@.", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_candidatePairToken(self, v21, v22, v23);
          v32 = uint64_t v31 = v8;
          _IDSLogTransport(@"GL", @"IDS", @"receive participant update response %llu for %@.");

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(self, v21, v22, v23, v8, v32);
            v32 = uint64_t v31 = v8;
            _IDSLogV(0, @"IDSFoundation", @"GL", @"receive participant update response %llu for %@.");
          }
        }
      }
      int v24 = objc_msgSend_messageType(v4, v21, v22, v23, v31, v32);
      BOOL v25 = ProtoUtilProcessParticipantUpdate(v14, 0, v24);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend_candidatePair_didReceiveParticipantUpdate_status_(WeakRetained, v27, (uint64_t)self, v28, v25, 0);
    }
    else
    {
      uint64_t v29 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v29, OS_LOG_TYPE_DEFAULT, "processQUICParticipantUpdateResponse failed due to invalid participantUpdateResponse.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"processQUICParticipantUpdateResponse failed due to invalid participantUpdateResponse.");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"processQUICParticipantUpdateResponse failed due to invalid participantUpdateResponse.");
          }
        }
      }
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (BOOL)processQUICGetMaterialResponse:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_transactionID(v4, v5, v6, v7);
  if (objc_msgSend_removeProtoRequest_(self, v9, v8, v10))
  {
    uint64_t v14 = objc_msgSend_getMaterialResponse(v4, v11, v12, v13);
    BOOL v15 = v14 != 0;
    if (v14)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend_candidatePair_didReceiveGetMaterialResponse_(WeakRetained, v17, (uint64_t)self, v18, v14);
    }
    else
    {
      double v19 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "processQUICGetMaterialResponse failed due to invalid getMaterialResponse", v21, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"processQUICGetMaterialResponse failed due to invalid getMaterialResponse");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"processQUICGetMaterialResponse failed due to invalid getMaterialResponse");
          }
        }
      }
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (BOOL)processQUICPutMaterialResponse:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_transactionID(v4, v5, v6, v7);
  if (objc_msgSend_removeProtoRequest_(self, v9, v8, v10))
  {
    uint64_t v14 = objc_msgSend_putMaterialResponse(v4, v11, v12, v13);
    BOOL v15 = v14 != 0;
    if (v14)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend_candidatePair_didReceivePutMaterialResponse_forTxId_(WeakRetained, v17, (uint64_t)self, v18, v14, v8);
    }
    else
    {
      double v19 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "processQUICPutMaterialResponse failed due to invalid putMaterialResponse", v21, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"processQUICPutMaterialResponse failed due to invalid putMaterialResponse");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"processQUICPutMaterialResponse failed due to invalid putMaterialResponse");
          }
        }
      }
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (BOOL)processQUICPluginRegistrationResponse:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_transactionID(v4, v5, v6, v7);
  if (objc_msgSend_removeProtoRequest_(self, v9, v8, v10))
  {
    BOOL v15 = objc_msgSend_pluginControlResponse(v4, v11, v12, v13);
    BOOL v17 = v15 != 0;
    if (v15)
    {
      BOOL v20 = objc_msgSend__pluginNameForProtoRequest_(self, v14, v8, v16);
      if (v20) {
        objc_msgSend__removeProtoPluginRegistrationRequest_(self, v18, v8, v21);
      }
      uint64_t v22 = objc_msgSend_pathExtension(v20, v18, v19, v21);
      int isEqualToString = objc_msgSend_isEqualToString_(v22, v23, @"Register", v24);
      if ((isEqualToString & 1) != 0
        || (objc_msgSend_isEqualToString_(v22, v25, @"Unregister", v28) & 1) != 0)
      {
        uint64_t v29 = objc_msgSend_pluginParticipantId(v15, v25, v26, v28);
        double v30 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v34 = objc_msgSend_candidatePairToken(self, v31, v32, v33);
          *(_DWORD *)buf = 138412802;
          uint64_t v50 = v34;
          __int16 v51 = 2048;
          uint64_t v52 = v29;
          __int16 v53 = 2112;
          uint64_t v54 = v20;
          _os_log_impl(&dword_19D9BE000, v30, OS_LOG_TYPE_DEFAULT, "receive plugin update for %@, with participant id: %llu, and name %@", buf, 0x20u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_candidatePairToken(self, v35, v36, v37);
            uint64_t v47 = v29;
            v46 = double v48 = v20;
            _IDSLogTransport(@"GL", @"IDS", @"receive plugin update for %@, with participant id: %llu, and name %@");

            if (_IDSShouldLog())
            {
              objc_msgSend_candidatePairToken(self, v35, v36, v37, v46, v29, v20);
              uint64_t v47 = v29;
              v46 = double v48 = v20;
              _IDSLogV(0, @"IDSFoundation", @"GL", @"receive plugin update for %@, with participant id: %llu, and name %@");
            }
          }
        }
        double v38 = objc_msgSend_stringByDeletingPathExtension(v20, v35, v36, v37, v46, v47, v48);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        uint64_t v42 = WeakRetained;
        if (isEqualToString) {
          objc_msgSend_candidatePair_didReceivePluginRegistration_pluginName_(WeakRetained, v40, (uint64_t)self, v41, v29, v38);
        }
        else {
          objc_msgSend_candidatePair_didReceivePluginUnregistration_pluginName_(WeakRetained, v40, (uint64_t)self, v41, v29, v38);
        }
      }
      else
      {
        double v45 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v45, OS_LOG_TYPE_DEFAULT, "invalid plugin operation - ignoring this response", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"invalid plugin operation - ignoring this response");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"invalid plugin operation - ignoring this response");
            }
          }
        }
      }
    }
    else
    {
      double v43 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v43, OS_LOG_TYPE_DEFAULT, "processQUICPluginRegistrationResponse failed due to invalid pluginControlResponse.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"processQUICPluginRegistrationResponse failed due to invalid pluginControlResponse.");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"processQUICPluginRegistrationResponse failed due to invalid pluginControlResponse.");
          }
        }
      }
    }
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (BOOL)processQUICSessionInfoResponse:(id)a3 receivedBytes:(unint64_t)a4 isLightweightParticipant:(BOOL)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v11 = objc_msgSend_transactionID(v7, v8, v9, v10);
  uint64_t v14 = objc_msgSend_stringWithFormat_(NSString, v12, @"%llu", v13, v11);
  if (objc_msgSend_removeProtoRequest_(self, v15, v11, v16))
  {
    BOOL v20 = objc_msgSend_sessionInfoResponse(v7, v17, v18, v19);
    BOOL v21 = v20 != 0;
    if (v20)
    {
      uint64_t v22 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = objc_msgSend_candidatePairToken(self, v23, v24, v25);
        *(_DWORD *)buf = 134218242;
        uint64_t v61 = v11;
        __int16 v62 = 2112;
        uint64_t v63 = v26;
        _os_log_impl(&dword_19D9BE000, v22, OS_LOG_TYPE_DEFAULT, "receive session-info response %llu for %@.", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_candidatePairToken(self, v27, v28, v29);
          v56 = uint64_t v55 = v11;
          _IDSLogTransport(@"GL", @"IDS", @"receive session-info response %llu for %@.");

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(self, v27, v28, v29, v11, v56);
            v56 = uint64_t v55 = v11;
            _IDSLogV(0, @"IDSFoundation", @"GL", @"receive session-info response %llu for %@.");
          }
        }
      }
      Value = 0;
      if (self->_requestIDToQueryLinkIDs && v14) {
        Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_requestIDToQueryLinkIDs, v14);
      }
      char v31 = objc_msgSend_intValue(Value, v27, v28, v29, v55, v56);
      ProtoUtilProcessStreamInfo(v20, self->_linkID, v31);
      CFDictionaryRef v32 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      double v33 = 0;
      if (v32 && @"stream-info-peer-published-streams") {
        double v33 = (void *)CFDictionaryGetValue(v32, @"stream-info-peer-published-streams");
      }
      uint64_t v34 = StunUtilProcessParticipants(v33, self->_participantID, a5);
      __int16 v35 = ProtoUtilProcessLightweightParticipants(v20);
      uint64_t StunSentBytes = objc_msgSend_getStunSentBytes_(self, v36, (uint64_t)v14, v37);
      requestIDToSessionInfoReqType = self->_requestIDToSessionInfoReqType;
      if (requestIDToSessionInfoReqType) {
        BOOL v43 = v14 != 0;
      }
      else {
        BOOL v43 = 0;
      }
      if (v43) {
        double v44 = (void *)CFDictionaryGetValue((CFDictionaryRef)requestIDToSessionInfoReqType, v14);
      }
      else {
        double v44 = 0;
      }
      int v46 = objc_msgSend_intValue(v44, v38, v39, v41);
      int hasCommandFlags = objc_msgSend_hasCommandFlags(v20, v47, v48, v49);
      if (hasCommandFlags) {
        int hasCommandFlags = objc_msgSend_commandFlags(v20, v51, v52, v53);
      }
      BYTE4(v58) = 0;
      LODWORD(v58) = hasCommandFlags;
      BYTE1(v57) = v46 == 2;
      LOBYTE(v57) = 0;
      objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v51, (uint64_t)v32, v53, v34, v35, 0, 0, StunSentBytes, a4, v57, v58);
    }
    else
    {
      double v45 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v45, OS_LOG_TYPE_DEFAULT, "processQUICSessionInfoResponse failed due to invalid sessionInfoResponse.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"processQUICSessionInfoResponse failed due to invalid sessionInfoResponse.");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"processQUICSessionInfoResponse failed due to invalid sessionInfoResponse.");
          }
        }
      }
    }
  }
  else
  {
    BOOL v21 = 1;
  }

  return v21;
}

- (BOOL)processQUICStatsResponse:(id)a3 arrivalTime:(double)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_transactionID(v6, v7, v8, v9);
  if (objc_msgSend_removeProtoRequest_(self, v11, v10, v12))
  {
    double v16 = objc_msgSend_statsResponse(v6, v13, v14, v15);
    BOOL v20 = v16;
    BOOL v21 = v16 != 0;
    if (v16)
    {
      int v22 = objc_msgSend_clientTimestampNtp(v16, v17, v18, v19);
      int v23 = ntpTime32(a4);
      unsigned int v24 = (v23 - v22) >> 16;
      double v25 = (double)(unsigned __int16)(v23 - v22) * 0.0000152587891 + (double)v24;
      double serverLatency = self->_serverLatency;
      if (serverLatency == 0.0) {
        double v27 = (double)(unsigned __int16)(v23 - v22) * 0.0000152587891 + (double)v24;
      }
      else {
        double v27 = v25 * 0.1 + serverLatency * 0.9;
      }
      self->_double serverLatency = v27;
      uint64_t v28 = (int)(v25 * 1000.0);
      double v29 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = (int)(self->_serverLatency * 1000.0);
        int linkID = self->_linkID;
        *(_DWORD *)buf = 134218752;
        uint64_t v71 = v10;
        __int16 v72 = 1024;
        int v73 = linkID;
        __int16 v74 = 1024;
        int v75 = v28;
        __int16 v76 = 1024;
        int v77 = v30;
        _os_log_impl(&dword_19D9BE000, v29, OS_LOG_TYPE_DEFAULT, "processQUICStatsResponse: recv stats resp %llu (link: %2d rtt: %5d ms mean: %5d ms).", buf, 0x1Eu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v68 = v28;
          uint64_t v69 = (int)(self->_serverLatency * 1000.0);
          uint64_t v66 = self->_linkID;
          _IDSLogTransport(@"GL", @"IDS", @"processQUICStatsResponse: recv stats resp %llu (link: %2d rtt: %5d ms mean: %5d ms).");
          if (_IDSShouldLog())
          {
            uint64_t v68 = v28;
            uint64_t v69 = (int)(self->_serverLatency * 1000.0);
            uint64_t v66 = self->_linkID;
            _IDSLogV(0, @"IDSFoundation", @"GL", @"processQUICStatsResponse: recv stats resp %llu (link: %2d rtt: %5d ms mean: %5d ms).");
          }
        }
      }
      uint64_t v34 = objc_msgSend_stringWithFormat_(NSString, v32, @"%llu", v33, v10, v66, v68, v69);
      requestIDToStatsIDs = self->_requestIDToStatsIDs;
      if (requestIDToStatsIDs)
      {
        if (v34)
        {
          uint64_t v36 = (id)CFDictionaryGetValue((CFDictionaryRef)requestIDToStatsIDs, v34);
          if (v36)
          {
            double v37 = v36;
            double v38 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            CFDictionarySetValue(v38, @"gl-option-stats-identifier", v37);
            double v41 = objc_msgSend_numberWithChar_(NSNumber, v39, self->_linkID, v40);
            if (v41)
            {
              CFDictionarySetValue(v38, @"gl-option-linkid", v41);
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              sub_19DB81A10();
            }

            double v45 = objc_msgSend_numberWithInt_(NSNumber, v43, v28, v44);
            if (v45)
            {
              CFDictionarySetValue(v38, @"gl-option-stats-server-timestamp", v45);
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              sub_19DB81988();
            }

            int v46 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v50 = objc_msgSend_unsignedLongLongValue(v37, v47, v48, v49);
              int v51 = self->_linkID;
              *(_DWORD *)buf = 134218496;
              uint64_t v71 = v50;
              __int16 v72 = 1024;
              int v73 = v51;
              __int16 v74 = 1024;
              int v75 = v28;
              _os_log_impl(&dword_19D9BE000, v46, OS_LOG_TYPE_DEFAULT, "processQUICStatsResponse: statsIdentifier: %llu, linkID: %d, rtt: %d ms", buf, 0x18u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v55 = objc_msgSend_unsignedLongLongValue(v37, v52, v53, v54);
                uint64_t v67 = self->_linkID;
                uint64_t v65 = v55;
                _IDSLogTransport(@"GL", @"IDS", @"processQUICStatsResponse: statsIdentifier: %llu, linkID: %d, rtt: %d ms");
                if (_IDSShouldLog())
                {
                  objc_msgSend_unsignedLongLongValue(v37, v56, v57, v58, v65, v67, v28);
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"processQUICStatsResponse: statsIdentifier: %llu, linkID: %d, rtt: %d ms");
                }
              }
            }
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend_candidatePair_didReceiveSessionStats_success_(WeakRetained, v60, (uint64_t)self, v61, v38, 1);

            objc_msgSend_removeObjectForKey_(self->_requestIDToStatsIDs, v62, (uint64_t)v34, v63);
          }
        }
      }
    }
    else
    {
      uint64_t v42 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v42, OS_LOG_TYPE_DEFAULT, "invalid stats resp received", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"invalid stats resp received");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"invalid stats resp received");
          }
        }
      }
    }
  }
  else
  {
    BOOL v21 = 1;
  }

  return v21;
}

- (BOOL)processQUICTestResponse:(id)a3 arrivalTime:(double)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v9 = objc_msgSend_transactionID(v5, v6, v7, v8);
  if (objc_msgSend_removeProtoRequest_(self, v10, v9, v11))
  {
    double v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = objc_msgSend_candidatePairToken(self, v13, v14, v15);
      *(_DWORD *)buf = 138412290;
      double v27 = v16;
      _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "receive test response for %@.", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        unsigned int v24 = objc_msgSend_candidatePairToken(self, v17, v18, v19);
        _IDSLogTransport(@"GL", @"IDS", @"receive test response for %@.");

        if (_IDSShouldLog())
        {
          double v25 = objc_msgSend_candidatePairToken(self, v20, v21, v22, v24);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"receive test response for %@.");
        }
      }
    }
  }

  return 1;
}

- (BOOL)processQUICParticipantUpdateIndication:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v8 = objc_msgSend_participantUpdateIndication(v4, v5, v6, v7);
  uint64_t v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_msgSend_txnId(v8, v10, v11, v12);
    BOOL v17 = objc_msgSend_candidatePairToken(self, v14, v15, v16);
    *(_DWORD *)buf = 134218242;
    uint64_t v38 = v13;
    __int16 v39 = 2112;
    double v40 = v17;
    _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "receive participant update indication(%llu) for %@.", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v21 = objc_msgSend_txnId(v8, v18, v19, v20);
      __int16 v35 = objc_msgSend_candidatePairToken(self, v22, v23, v24);
      _IDSLogTransport(@"GL", @"IDS", @"receive participant update indication(%llu) for %@.");

      if (_IDSShouldLog())
      {
        objc_msgSend_txnId(v8, v18, v19, v20, v21, v35);
        uint64_t v36 = objc_msgSend_candidatePairToken(self, v25, v26, v27);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"receive participant update indication(%llu) for %@.");
      }
    }
  }
  if (v8)
  {
    int v28 = objc_msgSend_messageType(v4, v18, v19, v20);
    double v29 = ProtoUtilProcessParticipantUpdate(v8, 0, v28);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_candidatePair_didReceiveParticipantUpdate_status_(WeakRetained, v31, (uint64_t)self, v32, v29, 0);
  }
  else
  {
    double v33 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v33, OS_LOG_TYPE_DEFAULT, "processQUICParticipantUpdateIndication failed due to invalid participantUpdateIndication.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"processQUICParticipantUpdateIndication failed due to invalid participantUpdateIndication.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"processQUICParticipantUpdateIndication failed due to invalid participantUpdateIndication.");
        }
      }
    }
  }

  return v8 != 0;
}

- (BOOL)processQUICPluginControlIndication:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v8 = objc_msgSend_pluginControlIndication(v4, v5, v6, v7);
  double v12 = v8;
  if (v8)
  {
    uint64_t v13 = objc_msgSend_pluginParticipantId(v8, v9, v10, v11);
    unsigned __int8 v17 = objc_msgSend_pluginOperation(v12, v14, v15, v16);
    uint64_t v18 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = objc_msgSend_txnId(v12, v19, v20, v21);
      uint64_t v26 = objc_msgSend_candidatePairToken(self, v23, v24, v25);
      *(_DWORD *)buf = 134218754;
      uint64_t v48 = v22;
      __int16 v49 = 2112;
      uint64_t v50 = v26;
      __int16 v51 = 2048;
      uint64_t v52 = v13;
      __int16 v53 = 1024;
      int v54 = v17;
      _os_log_impl(&dword_19D9BE000, v18, OS_LOG_TYPE_DEFAULT, "receive plugin event(%llu) for %@, with participant id: %llu, operation %u", buf, 0x26u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v30 = objc_msgSend_txnId(v12, v27, v28, v29);
        double v45 = objc_msgSend_candidatePairToken(self, v31, v32, v33);
        _IDSLogTransport(@"GL", @"IDS", @"receive plugin event(%llu) for %@, with participant id: %llu, operation %u");

        if (_IDSShouldLog())
        {
          objc_msgSend_txnId(v12, v34, v35, v36, v30, v45, v13, v17);
          int v46 = objc_msgSend_candidatePairToken(self, v37, v38, v39);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"receive plugin event(%llu) for %@, with participant id: %llu, operation %u");
        }
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_candidatePair_didReceivePluginControlEvent_operation_transactionID_(WeakRetained, v41, (uint64_t)self, v42, v13, v17, 0);
  }
  else
  {
    BOOL v43 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v43, OS_LOG_TYPE_DEFAULT, "processQUICPluginControlIndication failed due to invalid pluginControlIndication.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"processQUICPluginControlIndication failed due to invalid pluginControlIndication.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"processQUICPluginControlIndication failed due to invalid pluginControlIndication.");
        }
      }
    }
  }

  return v12 != 0;
}

- (BOOL)processQUICSessionInfoIndication:(id)a3 arrivalTime:(double)a4 isLightweightParticipant:(BOOL)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v11 = objc_msgSend_sessionInfoIndication(v7, v8, v9, v10);
  double v12 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_msgSend_txnId(v11, v13, v14, v15);
    uint64_t v20 = objc_msgSend_candidatePairToken(self, v17, v18, v19);
    *(_DWORD *)buf = 134218242;
    uint64_t v55 = v16;
    __int16 v56 = 2112;
    uint64_t v57 = v20;
    _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "receive session-info indication(%llu) for %@.", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v24 = objc_msgSend_txnId(v11, v21, v22, v23);
      uint64_t v52 = objc_msgSend_candidatePairToken(self, v25, v26, v27);
      _IDSLogTransport(@"GL", @"IDS", @"receive session-info indication(%llu) for %@.");

      if (_IDSShouldLog())
      {
        objc_msgSend_txnId(v11, v28, v29, v30, v24, v52);
        uint64_t v52 = objc_msgSend_candidatePairToken(self, v31, v32, v33);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"receive session-info indication(%llu) for %@.");
      }
    }
  }
  if (v11)
  {
    ProtoUtilProcessStreamInfo(v11, self->_linkID, self->_linkID);
    CFDictionaryRef v34 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    Value = 0;
    if (v34 && @"stream-info-peer-published-streams") {
      Value = (void *)CFDictionaryGetValue(v34, @"stream-info-peer-published-streams");
    }
    double v36 = StunUtilProcessParticipants(Value, self->_participantID, a5);
    double v37 = ProtoUtilProcessLightweightParticipants(v11);
    uint64_t v41 = objc_msgSend_leftParticipants(v11, v38, v39, v40);
    double v42 = ProtoUtilProcessLeftParticipants(v41, v36, v37);

    int v46 = objc_msgSend_joinedParticipants(v11, v43, v44, v45);
    uint64_t v47 = ProtoUtilProcessjoinedParticipants(v46, v36, v37);

    BYTE4(v53) = 1;
    LODWORD(v53) = 0;
    LOWORD(v52) = 0;
    objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v48, (uint64_t)v34, v49, v36, v37, v47, v42, 0, 0, v52, v53);
  }
  else
  {
    uint64_t v50 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v50, OS_LOG_TYPE_DEFAULT, "processQUICSessionInfoIndication failed due to invalid sessionInfoIndication.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"processQUICSessionInfoIndication failed due to invalid sessionInfoIndication.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"processQUICSessionInfoIndication failed due to invalid sessionInfoIndication.");
        }
      }
    }
  }

  return v11 != 0;
}

- (BOOL)processQUICPutMaterialIndication:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v8 = objc_msgSend_putMaterialIndication(v4, v5, v6, v7);
  uint64_t v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_msgSend_txnId(v8, v10, v11, v12);
    unsigned __int8 v17 = objc_msgSend_candidatePairToken(self, v14, v15, v16);
    *(_DWORD *)buf = 134218242;
    uint64_t v39 = v13;
    __int16 v40 = 2112;
    uint64_t v41 = v17;
    _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "receive put material indication(%llu) for %@.", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v21 = objc_msgSend_txnId(v8, v18, v19, v20);
      double v36 = objc_msgSend_candidatePairToken(self, v22, v23, v24);
      _IDSLogTransport(@"GL", @"IDS", @"receive put material indication(%llu) for %@.");

      if (_IDSShouldLog())
      {
        objc_msgSend_txnId(v8, v25, v26, v27, v21, v36);
        double v37 = objc_msgSend_candidatePairToken(self, v28, v29, v30);
        _IDSLogV(0, @"IDSFoundation", @"GL", @"receive put material indication(%llu) for %@.");
      }
    }
  }
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_candidatePair_didReceivePutMaterialIndication_(WeakRetained, v32, (uint64_t)self, v33, v8);
  }
  else
  {
    CFDictionaryRef v34 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v34, OS_LOG_TYPE_DEFAULT, "processQUICPutMaterialIndication failed due to invalid putMaterialIndication.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"processQUICPutMaterialIndication failed due to invalid putMaterialIndication.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"processQUICPutMaterialIndication failed due to invalid putMaterialIndication.");
        }
      }
    }
  }

  return v8 != 0;
}

- (BOOL)processQUICErrorIndication:(id)a3
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v8 = objc_msgSend_errorIndication(v4, v5, v6, v7);
  double v12 = v8;
  if (v8)
  {
    unsigned __int16 v13 = objc_msgSend_errorCode(v8, v9, v10, v11);
    uint64_t v14 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_msgSend_txnId(v12, v15, v16, v17);
      objc_msgSend_candidatePairToken(self, v19, v20, v21);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = objc_msgSend_errorReason(v12, v23, v24, v25);
      int v30 = objc_msgSend_channelId(v12, v27, v28, v29);
      CFDictionaryRef v34 = objc_msgSend_clientAddress(v12, v31, v32, v33);
      *(_DWORD *)buf = 134219266;
      uint64_t v112 = v18;
      __int16 v113 = 2112;
      id v114 = v22;
      __int16 v115 = 1024;
      int v116 = v13;
      __int16 v117 = 2112;
      uint64_t v118 = v26;
      __int16 v119 = 1024;
      int v120 = v30;
      __int16 v121 = 2112;
      double v122 = v34;
      _os_log_impl(&dword_19D9BE000, v14, OS_LOG_TYPE_DEFAULT, "receive QUIC error indication(%llu) for %@, error_code(%u) reason(%@) channel_id(%u) client address(%@)", buf, 0x36u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v38 = objc_msgSend_txnId(v12, v35, v36, v37);
        uint64_t v42 = objc_msgSend_candidatePairToken(self, v39, v40, v41);
        int v46 = objc_msgSend_errorReason(v12, v43, v44, v45);
        uint64_t v50 = objc_msgSend_channelId(v12, v47, v48, v49);
        id v109 = objc_msgSend_clientAddress(v12, v51, v52, v53);
        _IDSLogTransport(@"GL", @"IDS", @"receive QUIC error indication(%llu) for %@, error_code(%u) reason(%@) channel_id(%u) client address(%@)");

        if (_IDSShouldLog())
        {
          objc_msgSend_txnId(v12, v54, v55, v56, v38, v42, v13, v46, v50, v109);
          uint64_t v60 = objc_msgSend_candidatePairToken(self, v57, v58, v59);
          uint64_t v64 = objc_msgSend_errorReason(v12, v61, v62, v63);
          objc_msgSend_channelId(v12, v65, v66, v67);
          double v110 = objc_msgSend_clientAddress(v12, v68, v69, v70);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"receive QUIC error indication(%llu) for %@, error_code(%u) reason(%@) channel_id(%u) client address(%@)");
        }
      }
    }
    switch(v13)
    {
      case 0x25Bu:
        p_delegate = &self->_delegate;
        id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
        char v73 = objc_opt_respondsToSelector();

        if (v73)
        {
          id v74 = objc_loadWeakRetained((id *)p_delegate);
          objc_msgSend_receiveBlockedIndicationWithReason_(v74, v75, 44, v76);
        }
        break;
      case 0x260u:
        if (self->_state > 2)
        {
          uint64_t v96 = &self->_delegate;
          id v97 = objc_loadWeakRetained((id *)v96);
          char v98 = objc_opt_respondsToSelector();

          if (v98)
          {
            id v99 = objc_loadWeakRetained((id *)v96);
            objc_msgSend_receiveBlockedIndicationWithReason_(v99, v100, 49, v101);
          }
        }
        else
        {
          uint64_t v80 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v81 = (&_IDSStunCandidatePairStateStrings)[self->_state];
            *(_DWORD *)buf = 136315138;
            uint64_t v112 = (uint64_t)v81;
            _os_log_impl(&dword_19D9BE000, v80, OS_LOG_TYPE_DEFAULT, "processQUICErrorIndication: Ignoring PARTICIPANT_MISSKEY_REMOVE, state: %s", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"GL", @"IDS", @"processQUICErrorIndication: Ignoring PARTICIPANT_MISSKEY_REMOVE, state: %s");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"GL", @"processQUICErrorIndication: Ignoring PARTICIPANT_MISSKEY_REMOVE, state: %s");
              }
            }
          }
        }
        break;
      case 0x262u:
        __int16 v82 = &self->_delegate;
        id v83 = objc_loadWeakRetained((id *)v82);
        char v84 = objc_opt_respondsToSelector();

        if (v84)
        {
          id v85 = objc_loadWeakRetained((id *)v82);
          objc_msgSend_receiveErrorIndicationWithCode_(v85, v86, 1, v87);
        }
        break;
      case 0x263u:
        __int16 v88 = &self->_delegate;
        id v89 = objc_loadWeakRetained((id *)v88);
        char v90 = objc_opt_respondsToSelector();

        if (v90)
        {
          id v91 = objc_loadWeakRetained((id *)v88);
          objc_msgSend_receiveBlockedIndicationWithReason_(v91, v92, 46, v93);
        }
        break;
      case 0x266u:
        if (self->_state > 2)
        {
          double v102 = &self->_delegate;
          id v103 = objc_loadWeakRetained((id *)v102);
          char v104 = objc_opt_respondsToSelector();

          if (v104)
          {
            id v105 = objc_loadWeakRetained((id *)v102);
            objc_msgSend_receiveErrorIndicationWithCode_(v105, v106, 2, v107);
          }
        }
        else
        {
          __int16 v94 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
          {
            double v95 = (&_IDSStunCandidatePairStateStrings)[self->_state];
            *(_DWORD *)buf = 136315138;
            uint64_t v112 = (uint64_t)v95;
            _os_log_impl(&dword_19D9BE000, v94, OS_LOG_TYPE_DEFAULT, "processQUICErrorIndication: Ignoring STUN_ERROR_SHORT_MKI_CACHE_MISS, state: %s", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"GL", @"IDS", @"processQUICErrorIndication: Ignoring STUN_ERROR_SHORT_MKI_CACHE_MISS, state: %s");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"GL", @"processQUICErrorIndication: Ignoring STUN_ERROR_SHORT_MKI_CACHE_MISS, state: %s");
              }
            }
          }
        }
        break;
      default:
        uint64_t v78 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v112) = v13;
          _os_log_impl(&dword_19D9BE000, v78, OS_LOG_TYPE_DEFAULT, "invalid case: %hu", buf, 8u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"invalid case: %hu");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"invalid case: %hu");
            }
          }
        }
        goto LABEL_23;
    }
    BOOL v79 = 1;
  }
  else
  {
    int v77 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v77, OS_LOG_TYPE_DEFAULT, "processQUICErrorIndication failed due to invalid errorIndication.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"processQUICErrorIndication failed due to invalid errorIndication.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"processQUICErrorIndication failed due to invalid errorIndication.");
        }
      }
    }
LABEL_23:
    BOOL v79 = 0;
  }

  return v79;
}

- (BOOL)processQUICErrorResponse:(id)a3 packetBuffer:(id *)a4 startTime:(double)a5 headerOverhead:(unint64_t)a6
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  unint64_t var31 = a4->var31;
  uint64_t v14 = objc_msgSend_stringWithFormat_(NSString, v12, @"%llu", v13, var31);
  uint64_t var34_low = LOWORD(a4->var34);
  int var33 = a4->var33;
  int isRealloc = objc_msgSend_isRealloc(self, v17, v18, v19);
  if (!(!v24 & v23))
  {
    uint64_t v25 = 4084;
    switch(var33)
    {
      case 1:
        if (isRealloc) {
          uint64_t v25 = 4081;
        }
        else {
          uint64_t v25 = 4080;
        }
        goto LABEL_15;
      case 2:
      case 3:
      case 4:
      case 6:
      case 8:
      case 9:
        goto LABEL_11;
      case 5:
        goto LABEL_15;
      case 7:
        uint64_t v25 = 4087;
        goto LABEL_15;
      case 10:
        uint64_t v25 = 4088;
        goto LABEL_15;
      default:
        JUMPOUT(0);
    }
  }
  switch(var33)
  {
    case 15:
      uint64_t v25 = 4085;
      break;
    case 18:
      uint64_t v25 = 4083;
      break;
    case 20:
      uint64_t v25 = 2321;
      break;
    case 22:
      uint64_t v25 = 4082;
      break;
    default:
LABEL_11:
      uint64_t v25 = 0;
      break;
  }
LABEL_15:
  if (objc_msgSend_removeProtoRequest_(self, v21, var31, v22))
  {
    if (self->_state != 2)
    {
      uint64_t v38 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        double v39 = ids_monotonic_time();
        int v42 = *(unsigned __int8 *)(objc_msgSend_address(self->_local, v40, v41, v39) + 1);
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)uint64_t v123 = (unsigned __int16)var33;
        *(_WORD *)&v123[4] = 1024;
        *(_DWORD *)&v123[6] = var34_low;
        *(_WORD *)v124 = 2048;
        *(double *)&v124[2] = (v39 - a5) * 1000.0;
        LOWORD(v125) = 1024;
        *(_DWORD *)((char *)&v125 + 2) = v42;
        _os_log_impl(&dword_19D9BE000, v38, OS_LOG_TYPE_DEFAULT, "receive error response - type(%04x) error_code(%u) after %0.3lf ms family: %d.", buf, 0x1Eu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          double v43 = ids_monotonic_time();
          uint64_t v119 = *(unsigned __int8 *)(objc_msgSend_address(self->_local, v44, v45, v43) + 1);
          *((double *)&v118 + 1) = (v43 - a5) * 1000.0;
          uint64_t v114 = (unsigned __int16)var33;
          *(void *)&long long v118 = var34_low;
          _IDSLogTransport(@"GL", @"IDS", @"receive error response - type(%04x) error_code(%u) after %0.3lf ms family: %d.");
          if (_IDSShouldLog())
          {
            double v46 = ids_monotonic_time();
            uint64_t v119 = *(unsigned __int8 *)(objc_msgSend_address(self->_local, v47, v48, v46, (unsigned __int16)var33, var34_low, *((void *)&v118 + 1), v119)+ 1);
            *((double *)&v118 + 1) = (v46 - a5) * 1000.0;
            uint64_t v114 = (unsigned __int16)var33;
            *(void *)&long long v118 = var34_low;
            _IDSLogV(0, @"IDSFoundation", @"GL", @"receive error response - type(%04x) error_code(%u) after %0.3lf ms family: %d.");
          }
        }
      }
      uint64_t v49 = GLUtilStunErrorToGlobalLinkError(var34_low);
      GLUtilReportAWDStunMessageEventWithType((unsigned __int16)v25, v49, self, 0.0);
      uint64_t v50 = GLUtilStunErrorToGlobalLinkError(var34_low);
      __int16 v121 = GLUCreateQRStunMessageEventWithType((unsigned __int16)v25, v50, self, 0, 0.0);
      if (v121) {
        objc_msgSend__notifyQREventAdded_(self, v51, (uint64_t)v121, v52);
      }
      if (var33 > 9)
      {
        if (var33 == 10)
        {
          v111 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D9BE000, v111, OS_LOG_TYPE_DEFAULT, "receive plugin registrion error response", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"GL", @"IDS", @"receive plugin registrion error response");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"GL", @"receive plugin registrion error response");
              }
            }
          }
          goto LABEL_67;
        }
        if (var33 == 15)
        {
          int64_t var2 = a4->var2;
          uint64_t StunSentBytes = objc_msgSend_getStunSentBytes_(self, v51, (uint64_t)v14, v52);
          char v73 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            int v77 = objc_msgSend_candidatePairToken(self, v74, v75, v76);
            *(_DWORD *)buf = 138412290;
            *(void *)uint64_t v123 = v77;
            _os_log_impl(&dword_19D9BE000, v73, OS_LOG_TYPE_DEFAULT, "receive session-info error response for %@.", buf, 0xCu);
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              int v116 = objc_msgSend_candidatePairToken(self, v78, v80, v79);
              _IDSLogTransport(@"GL", @"IDS", @"receive session-info error response for %@.");

              if (_IDSShouldLog())
              {
                __int16 v117 = objc_msgSend_candidatePairToken(self, v78, v81, v79, v116);
                _IDSLogV(0, @"IDSFoundation", @"GL", @"receive session-info error response for %@.");
              }
            }
          }
          BYTE12(v118) = 0;
          *(void *)((char *)&v118 + 4) = 2;
          LOWORD(v118) = 0;
          objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v78, 0, v79, 0, 0, 0, 0, StunSentBytes, var2 + a6, v118, v119);
        }
      }
      else if (var33 == 1)
      {
        __int16 v82 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v86 = (&_IDSStunCandidatePairStateStrings)[self->_state];
          double v87 = off_1E944EAA0;
          __int16 v88 = objc_msgSend_candidatePairToken(self, v83, v84, v85);
          *(_DWORD *)buf = 136315650;
          *(void *)uint64_t v123 = v86;
          *(_WORD *)&v123[8] = 2080;
          *(void *)v124 = v87;
          *(_WORD *)&v124[8] = 2112;
          uint64_t v125 = v88;
          _os_log_impl(&dword_19D9BE000, v82, OS_LOG_TYPE_DEFAULT, "update state (%s->%s) for %@.", buf, 0x20u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            __int16 v92 = (&_IDSStunCandidatePairStateStrings)[self->_state];
            double v93 = off_1E944EAA0;
            objc_msgSend_candidatePairToken(self, v89, v90, v91);
            *((void *)&v118 + 1) = *(void *)&long long v118 = v93;
            uint64_t v114 = (uint64_t)v92;
            _IDSLogTransport(@"GL", @"IDS", @"update state (%s->%s) for %@.");

            if (_IDSShouldLog())
            {
              id v97 = (&_IDSStunCandidatePairStateStrings)[self->_state];
              char v98 = off_1E944EAA0;
              objc_msgSend_candidatePairToken(self, v94, v95, v96, v92, v118);
              *((void *)&v118 + 1) = *(void *)&long long v118 = v98;
              uint64_t v114 = (uint64_t)v97;
              _IDSLogV(0, @"IDSFoundation", @"GL", @"update state (%s->%s) for %@.");
            }
          }
        }
        self->_state = 2;
        id v99 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t participantID = self->_participantID;
          id v103 = objc_msgSend_base64EncodedStringWithOptions_(self->_relaySessionToken, v100, 0, v101);
          *(_DWORD *)buf = 134218242;
          *(void *)uint64_t v123 = participantID;
          *(_WORD *)&v123[8] = 2112;
          *(void *)v124 = v103;
          _os_log_impl(&dword_19D9BE000, v99, OS_LOG_TYPE_DEFAULT, "failed participant:[%16llX], token:[%@]", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            unint64_t v104 = self->_participantID;
            objc_msgSend_base64EncodedStringWithOptions_(self->_relaySessionToken, v51, 0, v52);
            *(void *)&v118 = uint64_t v114 = v104;
            _IDSLogTransport(@"GL", @"IDS", @"failed participant:[%16llX], token:[%@]");

            if (_IDSShouldLog())
            {
              unint64_t v105 = self->_participantID;
              objc_msgSend_base64EncodedStringWithOptions_(self->_relaySessionToken, v51, 0, v52, v114, (void)v118);
              *(void *)&v118 = uint64_t v114 = v105;
              _IDSLogV(0, @"IDSFoundation", @"GL", @"failed participant:[%16llX], token:[%@]");
            }
          }
        }
      }
      else if (var33 == 7)
      {
        double v53 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v57 = objc_msgSend_candidatePairToken(self, v54, v55, v56);
          *(_DWORD *)buf = 138412290;
          *(void *)uint64_t v123 = v57;
          _os_log_impl(&dword_19D9BE000, v53, OS_LOG_TYPE_DEFAULT, "receive participant update error response for %@.", buf, 0xCu);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            uint64_t v114 = objc_msgSend_candidatePairToken(self, v58, v59, v60);
            _IDSLogTransport(@"GL", @"IDS", @"receive participant update error response for %@.");

            if (_IDSShouldLog())
            {
              uint64_t v114 = objc_msgSend_candidatePairToken(self, v58, v59, v60, v114);
              _IDSLogV(0, @"IDSFoundation", @"GL", @"receive participant update error response for %@.");
            }
          }
        }
        double v61 = objc_msgSend_participantUpdateResponse(v10, v58, v59, v60, v114, v118, v119);
        uint64_t v62 = v61;
        if (v61)
        {
          double v63 = ProtoUtilProcessParticipantUpdate(v61, var34_low, 7);
          double v67 = v63;
          if (v63 && objc_msgSend_count(v63, v64, v65, v66))
          {
            uint64_t v68 = sub_19DB27BE8(var34_low);
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend_candidatePair_didReceiveParticipantUpdate_status_(WeakRetained, v70, (uint64_t)self, v71, v67, v68);

            BOOL v37 = 1;
          }
          else
          {
            uint64_t v112 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D9BE000, v112, OS_LOG_TYPE_DEFAULT, "receive participant update error response: invalid participantUpdateInfo", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"receive participant update error response: invalid participantUpdateInfo");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"receive participant update error response: invalid participantUpdateInfo");
                }
              }
            }
            BOOL v37 = 0;
          }
        }
        else
        {
          __int16 v113 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D9BE000, v113, OS_LOG_TYPE_DEFAULT, "processQUICErrorResponse failed due to invalid participantUpdateResponse.", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"GL", @"IDS", @"processQUICErrorResponse failed due to invalid participantUpdateResponse.");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"GL", @"processQUICErrorResponse failed due to invalid participantUpdateResponse.");
              }
            }
          }
          BOOL v37 = 0;
        }

        goto LABEL_68;
      }
      uint64_t v106 = objc_msgSend__didLocalExternalAddressChange_(self, v51, (uint64_t)&a4->var20, v52, v114, v118);
      id v107 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend_candidatePair_didReceiveStunErrorResponse_errorCode_didLocalExternalAddressChange_(v107, v108, (uint64_t)self, v109, v25, var34_low, v106);

LABEL_67:
      BOOL v37 = 1;
LABEL_68:

      goto LABEL_69;
    }
    uint64_t v26 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = objc_msgSend_candidatePairToken(self, v27, v28, v29);
      *(_DWORD *)buf = 138412546;
      *(void *)uint64_t v123 = v30;
      *(_WORD *)&v123[8] = 1024;
      *(_DWORD *)v124 = (unsigned __int16)var33;
      _os_log_impl(&dword_19D9BE000, v26, OS_LOG_TYPE_DEFAULT, "%@ is already in error state, ignore error response %04x.", buf, 0x12u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        __int16 v115 = objc_msgSend_candidatePairToken(self, v31, v32, v33);
        _IDSLogTransport(@"GL", @"IDS", @"%@ is already in error state, ignore error response %04x.");

        if (_IDSShouldLog())
        {
          __int16 v121 = objc_msgSend_candidatePairToken(self, v34, v35, v36, v115, (unsigned __int16)var33);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"%@ is already in error state, ignore error response %04x.");
          goto LABEL_67;
        }
      }
    }
  }
  BOOL v37 = 1;
LABEL_69:

  return v37;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (IDSStunCandidate)local
{
  return (IDSStunCandidate *)objc_getProperty(self, a2, 16, 1);
}

- (IDSStunCandidate)remote
{
  return (IDSStunCandidate *)objc_getProperty(self, a2, 24, 1);
}

- (IDSStunCandidate)relayRemote
{
  return (IDSStunCandidate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRelayRemote:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isNominated
{
  return self->_isNominated;
}

- (void)setIsNominated:(BOOL)a3
{
  self->_isNominated = a3;
}

- (char)linkID
{
  return self->_linkID;
}

- (void)setLinkID:(char)a3
{
  self->_int linkID = a3;
}

- (BOOL)hbStarted
{
  return self->_hbStarted;
}

- (void)setHbStarted:(BOOL)a3
{
  self->_hbStarted = a3;
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSData)relaySessionToken
{
  return (NSData *)objc_getProperty(self, a2, 168, 1);
}

- (NSData)relaySessionKey
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (BOOL)isAcceptedRelaySession
{
  return self->_isAcceptedRelaySession;
}

- (void)setIsAcceptedRelaySession:(BOOL)a3
{
  self->_isAcceptedRelaySession = a3;
}

- (unint64_t)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(unint64_t)a3
{
  self->_unint64_t participantID = a3;
}

- (NSString)pskTransportParameters
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (NSString)pskH3Settings
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (NSUUID)defaultLocalDeviceCBUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 320, 1);
}

- (void)setDefaultLocalDeviceCBUUID:(id)a3
{
}

- (NSUUID)defaultRemoteDeviceCBUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 328, 1);
}

- (void)setDefaultRemoteDeviceCBUUID:(id)a3
{
}

- (int64_t)relayProviderType
{
  return self->_relayProviderType;
}

- (void)setRelayProviderType:(int64_t)a3
{
  self->_relayProviderType = a3;
}

- (int64_t)allocateType
{
  return self->_allocateType;
}

- (void)setAllocateType:(int64_t)a3
{
  self->_int64_t allocateType = a3;
}

- (double)allocateTime
{
  return self->_allocateTime;
}

- (void)setAllocateTime:(double)a3
{
  self->_allocateTime = a3;
}

- (double)selfAllocateStartTime
{
  return self->_selfAllocateStartTime;
}

- (void)setSelfAllocateStartTime:(double)a3
{
  self->_selfAllocateStartTime = a3;
}

- (double)serverLatency
{
  return self->_serverLatency;
}

- (void)setServerLatency:(double)a3
{
  self->_double serverLatency = a3;
}

- (BOOL)pendingRealloc
{
  return self->_pendingRealloc;
}

- (BOOL)recvConnected
{
  return self->_recvConnected;
}

- (void)setRecvConnected:(BOOL)a3
{
  self->_recvConnected = a3;
}

- (BOOL)recvConnectedAck
{
  return self->_recvConnectedAck;
}

- (void)setRecvConnectedAck:(BOOL)a3
{
  self->_recvConnectedAck = a3;
}

- (BOOL)recvDisconnected
{
  return self->_recvDisconnected;
}

- (void)setRecvDisconnected:(BOOL)a3
{
  self->_recvDisconnected = a3;
}

- (BOOL)recvDisconnectedAck
{
  return self->_recvDisconnectedAck;
}

- (void)setRecvDisconnectedAck:(BOOL)a3
{
  self->_recvDisconnectedAck = a3;
}

- (NSData)skeData
{
  return (NSData *)objc_getProperty(self, a2, 392, 1);
}

- (void)setSkeData:(id)a3
{
}

- (double)testStartTime
{
  return self->_testStartTime;
}

- (BOOL)isDisconnecting
{
  return self->_isDisconnecting;
}

- (void)setIsDisconnecting:(BOOL)a3
{
  self->_isDisconnecting = a3;
}

- (BOOL)pendingNoSessionStateAllocbind
{
  return self->_pendingNoSessionStateAllocbind;
}

- (void)setPendingNoSessionStateAllocbind:(BOOL)a3
{
  self->_pendingNoSessionStateAllocbind = a3;
}

- (unsigned)testOptions
{
  return self->_testOptions;
}

- (NSString)testSubOperation
{
  return (NSString *)objc_getProperty(self, a2, 544, 1);
}

- (double)triggeredCheckTime
{
  return self->_triggeredCheckTime;
}

- (void)setTriggeredCheckTime:(double)a3
{
  self->_triggeredCheckTime = a3;
}

- (unsigned)remoteRelayLinkID
{
  return self->_remoteRelayLinkID;
}

- (char)delegatedLinkID
{
  return self->_delegatedLinkID;
}

- (NSDictionary)URIToParticipantIDs
{
  return self->_URIToParticipantIDs;
}

- (BOOL)isConnectToQRIPv6Enabled
{
  return self->_isConnectToQRIPv6Enabled;
}

- (void)setIsConnectToQRIPv6Enabled:(BOOL)a3
{
  self->_isConnectToQRIPv6Enabled = a3;
}

- (double)lastIncomingPacketTime
{
  return self->_lastIncomingPacketTime;
}

- (void)setLastIncomingPacketTime:(double)a3
{
  self->_lastIncomingPacketTime = a3;
}

- (double)lastOutgoingPacketTime
{
  return self->_lastOutgoingPacketTime;
}

- (void)setLastOutgoingPacketTime:(double)a3
{
  self->_lastOutgoingPacketTime = a3;
}

- (double)lastStatsReport
{
  return self->_lastStatsReport;
}

- (void)setLastStatsReport:(double)a3
{
  self->_lastStatsReport = a3;
}

- (unsigned)totalPacketsSentOnLink
{
  return self->_totalPacketsSentOnLink;
}

- (void)setTotalPacketsSentOnLink:(unsigned int)a3
{
  self->_totalPacketsSentOnLink = a3;
}

- (unsigned)totalPacketsReceivedOnLink
{
  return self->_totalPacketsReceivedOnLink;
}

- (void)setTotalPacketsReceivedOnLink:(unsigned int)a3
{
  self->_totalPacketsReceivedOnLink = a3;
}

- (double)hbStartTime
{
  return self->_hbStartTime;
}

- (void)setHbStartTime:(double)a3
{
  self->_hbStartTime = a3;
}

- (unsigned)statsIntervalInSeconds
{
  return self->_statsIntervalInSeconds;
}

- (NSData)hbhSalt
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (NSData)hbhEncKey
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setHbhEncKey:(id)a3
{
}

- (NSData)hbhDecKey
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setHbhDecKey:(id)a3
{
}

- (NSUUID)linkUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLinkUUID:(id)a3
{
}

- (OS_dispatch_source)allocbindFailoverTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 608, 1);
}

- (void)setAllocbindFailoverTimer:(id)a3
{
}

- (IDSQuickRelaySessionInfo)relaySessionInfo
{
  return (IDSQuickRelaySessionInfo *)objc_getProperty(self, a2, 200, 1);
}

- (NSDictionary)sessionInfoDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (unsigned)channelNumber
{
  return self->_channelNumber;
}

- (void)setChannelNumber:(unsigned __int16)a3
{
  self->_channelNumber = a3;
}

- (unsigned)relayLinkID
{
  return self->_relayLinkID;
}

- (unint64_t)capabilityFlags
{
  return self->_capabilityFlags;
}

- (unsigned)stateFlags
{
  return self->_stateFlags;
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (BOOL)enableSKE
{
  return self->_enableSKE;
}

- (NSData)softwareData
{
  return (NSData *)objc_getProperty(self, a2, 248, 1);
}

- (NSString)appName
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (NSMutableArray)pendingStunRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 272, 1);
}

- (NSMutableArray)repliedStunRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 280, 1);
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setGroupID:(id)a3
{
}

- (BOOL)isQUIC
{
  return self->_isQUIC;
}

- (unsigned)sessionInfoReqCount
{
  return self->_sessionInfoReqCount;
}

- (BOOL)recvSKEData
{
  return self->_recvSKEData;
}

- (void)setRecvSKEData:(BOOL)a3
{
  self->_recvSKEData = a3;
}

- (BOOL)sentSKEData
{
  return self->_sentSKEData;
}

- (void)setSentSKEData:(BOOL)a3
{
  self->_sentSKEData = a3;
}

- (BOOL)isNAT64
{
  return self->_isNAT64;
}

- (void)setIsNAT64:(BOOL)a3
{
  self->_isNAT64 = a3;
}

- (BOOL)isRealloc
{
  return self->_isRealloc;
}

- (void)setIsRealloc:(BOOL)a3
{
  self->_int isRealloc = a3;
}

- (NSData)encKey
{
  return (NSData *)objc_getProperty(self, a2, 488, 1);
}

- (NSData)decKey
{
  return (NSData *)objc_getProperty(self, a2, 496, 1);
}

- (NSData)hmacKey
{
  return (NSData *)objc_getProperty(self, a2, 504, 1);
}

- (NSDictionary)participantIDMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 512, 1);
}

- (BOOL)serverIsDegraded
{
  return self->_serverIsDegraded;
}

- (unsigned)testRequestedErrorCode
{
  return self->_testRequestedErrorCode;
}

- (IDSQUICConnectionIDs)QUICConnectionIDs
{
  return self->_QUICConnectionIDs;
}

- (void)setQUICConnectionIDs:(id)a3
{
}

- (NSMutableDictionary)connections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 624, 1);
}

- (unint64_t)remoteParticipantID
{
  return self->_remoteParticipantID;
}

- (void)setRemoteParticipantID:(unint64_t)a3
{
  self->_remoteParticipantID = a3;
}

- (IDSGlobalLinkP2PKeyNegotiationProtocol)p2pNegotiation
{
  return self->_p2pNegotiation;
}

- (void)setP2pNegotiation:(id)a3
{
}

- (IDSGlobalLinkP2PNegotiatedKeysProtocol)p2pNegotiatedKeys
{
  return self->_p2pNegotiatedKeys;
}

- (void)setP2pNegotiatedKeys:(id)a3
{
}

- (IDSGFTMetricsLink)linkMetrics
{
  return self->_linkMetrics;
}

- (void)setLinkMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetrics, 0);
  objc_storeStrong((id *)&self->_p2pNegotiatedKeys, 0);
  objc_storeStrong((id *)&self->_p2pNegotiation, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_QUICConnectionIDs, 0);
  objc_storeStrong((id *)&self->_allocbindFailoverTimer, 0);
  objc_storeStrong((id *)&self->_URIToParticipantIDs, 0);
  objc_storeStrong((id *)&self->_probingTimer, 0);
  objc_storeStrong((id *)&self->_testSubOperation, 0);
  objc_storeStrong((id *)&self->_participantIDMap, 0);
  objc_storeStrong((id *)&self->_hmacKey, 0);
  objc_storeStrong((id *)&self->_decKey, 0);
  objc_storeStrong((id *)&self->_encKey, 0);
  objc_storeStrong((id *)&self->_noSessionStateTimer, 0);
  objc_storeStrong((id *)&self->_reallocTimer, 0);
  objc_storeStrong(&self->_sessionGoAwayBlock, 0);
  objc_storeStrong((id *)&self->_sessionGoAwayTimer, 0);
  objc_storeStrong(&self->_sessionConvergenceBlock, 0);
  objc_storeStrong((id *)&self->_sessionConvergenceTimer, 0);
  objc_storeStrong(&self->_sessionConnectedTimeoutBlock, 0);
  objc_storeStrong((id *)&self->_sessionConnectedTimer, 0);
  objc_storeStrong((id *)&self->_skeData, 0);
  objc_storeStrong((id *)&self->_requestIDToStatsIDs, 0);
  objc_storeStrong((id *)&self->_defaultRemoteDeviceCBUUID, 0);
  objc_storeStrong((id *)&self->_defaultLocalDeviceCBUUID, 0);
  objc_storeStrong((id *)&self->_pluginNameToStunReqID, 0);
  objc_storeStrong((id *)&self->_stunSentBytesToRequestID, 0);
  objc_storeStrong((id *)&self->_requestIDToSessionInfoReqType, 0);
  objc_storeStrong((id *)&self->_requestIDToQueryLinkIDs, 0);
  objc_storeStrong((id *)&self->_repliedStunRequests, 0);
  objc_storeStrong((id *)&self->_pendingStunRequests, 0);
  objc_storeStrong((id *)&self->_pendingProtoRequests, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_softwareData, 0);
  objc_storeStrong((id *)&self->_sessionInfoDict, 0);
  objc_storeStrong((id *)&self->_relaySessionInfo, 0);
  objc_storeStrong((id *)&self->_pskH3Settings, 0);
  objc_storeStrong((id *)&self->_pskTransportParameters, 0);
  objc_storeStrong((id *)&self->_relaySessionKey, 0);
  objc_storeStrong((id *)&self->_relaySessionToken, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_linkUUID, 0);
  objc_storeStrong((id *)&self->_hbhDecKey, 0);
  objc_storeStrong((id *)&self->_hbhEncKey, 0);
  objc_storeStrong((id *)&self->_hbhSalt, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_relayRemote, 0);
  objc_storeStrong((id *)&self->_remote, 0);
  objc_storeStrong((id *)&self->_local, 0);
}

@end