@interface IDSNWLink
+ (BOOL)isSkywalkDemuxSupported;
+ (id)derivePSKFromSessionKey:(id)a3 salt:(id)a4;
- ($EF6EC642B48E9BFC073294F479749444)demuxPatternForQPodConnectionWithID:(unsigned int)a3 forNWLinkConnection:(id)a4;
- (BOOL)_createChannelDataConnection:(id)a3;
- (BOOL)_createChannelDataConnection:(id)a3 retryIndex:(unsigned __int8)a4;
- (BOOL)_createReliableUnicastConnection:(id)a3 localQUICConnectionID:(id)a4;
- (BOOL)_doesUDPConnectionInProgressExist:(id)a3;
- (BOOL)_findExistingCollidingQRConnection:(id)a3 remoteEndpoint:(id)a4 sessionID:(id)a5 localEndpointToUse:(id *)a6;
- (BOOL)_isLocalEndpointCellular:(id)a3;
- (BOOL)_setParameters:(id)a3 NWLinkConnection:(id)a4 sharePortWithListener:(BOOL)a5 isTCP:(BOOL)a6;
- (BOOL)_shouldAllowP2PConnectionTo:(id)a3 anotherRemoteEndpoint:(id)a4;
- (BOOL)_shouldFail;
- (BOOL)connect:(int)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 clientUUID:(unsigned __int8)a6[16] sessionID:(id)a7 relaySessionToken:(id)a8 relaySessionKey:(id)a9 randomSaltBlock:(id)a10 pskTransportParameters:(id)a11 pskH3Settings:(id)a12 newLocalPort:(unsigned __int16 *)a13 disconnectAfterUse:(BOOL)a14 holdUntilFirstPacketReady:(BOOL)a15 readyHandler:(id)a16;
- (BOOL)connectTCP:(int)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 clientUUID:(unsigned __int8)a6[16] sessionID:(id)a7 relaySessionToken:(id)a8 relaySessionKey:(id)a9 randomSaltBlock:(id)a10 newLocalPort:(unsigned __int16 *)a11 disconnectAfterUse:(BOOL)a12 readyHandler:(id)a13;
- (BOOL)connectedToQR;
- (BOOL)createQUICPodP2PConnectionsForSession:(id)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 quicConnectionIDs:(id)a6 negotiatedKeys:(id)a7 channelNumber:(unsigned __int16)a8 completionHandler:(id)a9;
- (BOOL)createQUICPodQRConnectionsForSession:(id)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 quicConnectionIDs:(id)a6 channelNumber:(unsigned __int16)a7;
- (BOOL)disableP2P;
- (BOOL)disallowQUICPodForCellular;
- (BOOL)getEffectiveSourceAddress:(sockaddr_storage *)a3 fromSourceAddress:(const sockaddr *)a4 effectiveDestinationAddress:(sockaddr_storage *)a5 fromDestinationAddress:(const sockaddr *)a6 sessionID:(id)a7 isQRConnection:(BOOL)a8;
- (BOOL)hasListener;
- (BOOL)useDefaultInterfaceOnly;
- (BOOL)wifiAssistEnabled;
- (IDSLinkDelegate)alternateDelegate;
- (IDSLinkDelegate)delegate;
- (IDSNWLink)initWithDeviceUniqueID:(id)a3 cbuuid:(id)a4;
- (NSIndexSet)cellularInterfaceIndices;
- (NSString)cbuuid;
- (NSString)cellInterfaceName;
- (NSString)deviceUniqueID;
- (NSString)linkTypeString;
- (id)_NWLinkConnectionForToken:(id)a3;
- (id)_childConnectionEvaluatorForToken:(id)a3;
- (id)_copyChildConnectionIDFor:(id)a3 clientUniquePID:(unint64_t)a4 sessionID:(id)a5 isRelay:(BOOL)a6 isCellular:(BOOL)a7 isQUICPod:(BOOL)a8;
- (id)_createNetworkInterfaceArrayWithIPVersion:(unint64_t)a3 wantsWiFi:(BOOL)a4 wantsCellular:(BOOL)a5;
- (id)_createNewListenerWithLocalPort:(unsigned __int16 *)a3;
- (id)_createP2PQUICPodConnectionWithType:(unsigned int)a3 udpNWLinkConnection:(id)a4 clientQUICConnectionID:(id)a5 serverQUICConnectionID:(id)a6 clientQUICConnectionIDNumber:(unsigned int)a7 clientSecret:(id)a8 serverSecret:(id)a9 isServer:(BOOL)a10 completionHandler:(id)a11;
- (id)_createQUICPodConnectionWithType:(unsigned int)a3 quicNWLinkConnection:(id)a4 clientQUICConnectionID:(id)a5 clientQUICConnectionIDAsNumber:(unsigned int)a6 serverQUICConnectionID:(id)a7;
- (id)_dictionaryFromPSKParameters:(id)a3;
- (id)_extraListenerForPort:(unsigned __int16)a3;
- (id)_findListenerWithLocalEndpoint:(id)a3;
- (id)_findNewLocalEndpointForQRConnection:(id)a3;
- (id)connectionInfoForLocalAddress:(const sockaddr *)a3 remoteAddress:(const sockaddr *)a4 clientUniquePID:(unint64_t)a5 sessionID:(id)a6 type:(unint64_t)a7 isRelay:(BOOL)a8 isCellular:(BOOL)a9;
- (id)copyCurrentNetworkInterfaces;
- (id)copyLinkStatsDict;
- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4;
- (id)newListenerWithClientUUID:(unsigned __int8)a3[16] wantsWiFi:(BOOL)a4 wantsCellular:(BOOL)a5;
- (id)protocolStackDescriptionFor:(id)a3;
- (unint64_t)_sendData:(id)a3 withPacketBuffer:(id *)a4 NWLinkConnection:(id)a5;
- (unint64_t)headerOverhead;
- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (unint64_t)state;
- (unsigned)_NAT64LocalAddressForInterfaceIndex:(unsigned int)a3;
- (unsigned)_getConnectedLocalPortAndSetLocalEndpointForConnection:(id)a3;
- (unsigned)cellularPort;
- (unsigned)port;
- (void)_addChildConnectionEvaluator:(id)a3 token:(id)a4;
- (void)_addExtraListener:(id)a3 port:(unsigned __int16)a4 isCellular:(BOOL)a5;
- (void)_addInterfaceIndex:(unsigned int)a3 NAT64LocalAddress:(unsigned int)a4;
- (void)_addNWLinkConnection:(id)a3 token:(id)a4;
- (void)_addPendingTCPNWLinkConnection:(id)a3 token:(id)a4;
- (void)_addToRecentQRServerList:(id)a3;
- (void)_addUDPConnectionInProgress:(id)a3 token:(id)a4;
- (void)_cancelNWLinkConnection:(id)a3 remove:(BOOL)a4;
- (void)_cancelNWLinkConnectionWithToken:(id)a3 removeNWLinkConnectionNow:(BOOL)a4;
- (void)_cleanup:(BOOL)a3;
- (void)_createChannelDataConnectionForH2:(id)a3;
- (void)_createChannelDataConnectionForH2:(id)a3 retryIndex:(unsigned __int8)a4;
- (void)_createIndicationConnection:(id)a3;
- (void)_createIndicationConnection:(id)a3 retryIndex:(unsigned __int8)a4;
- (void)_createUDPConnectionForNWLinkConnection:(id)a3 readyHandler:(id)a4;
- (void)_failConnectionsRandomly;
- (void)_failNWLinkConnection:(id)a3;
- (void)_handleIncomingIndicationMessage:(id)a3;
- (void)_handleIncomingMessage:(id)a3 keepWaiting:(BOOL)a4;
- (void)_peelOffQUICConnection:(id)a3 type:(unint64_t)a4 readyHandler:(id)a5;
- (void)_peelOffQUICConnection:(id)a3 type:(unint64_t)a4 readyHandler:(id)a5 cancelHandler:(id)a6;
- (void)_removeChildConnectionEvaluatorFortoken:(id)a3;
- (void)_removeExtraListener:(unsigned __int16)a3;
- (void)_removeNWLinkConnection:(id)a3 token:(id)a4;
- (void)_removePendingTCPNWLinkConnectionForToken:(id)a3;
- (void)_removeUDPConnectionInProgress:(id)a3;
- (void)_scheduleRetryConnectionIfNeeded:(id)a3 baseConnection:(id)a4 kind:(const char *)a5 retryIndex:(unsigned __int8)a6 retryBlock:(id)a7;
- (void)_setWiFiAssistStateForCellularLink:(id)a3 isEnabled:(BOOL)a4;
- (void)_tryReadH2Header:(id)a3;
- (void)cleanup;
- (void)dealloc;
- (void)disconnectP2PWithSessionID:(id)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5;
- (void)disconnectWithSessionID:(id)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 waitTime:(double)a6 final:(BOOL)a7;
- (void)invalidate;
- (void)logConnectionSubtree:(id)a3 indentation:(id)a4;
- (void)logConnectionTree;
- (void)peelOffReliableUnicastConnectionforLocalAddress:(const sockaddr *)a3 remoteAddress:(const sockaddr *)a4 sessionID:(id)a5 localQUICConnectionID:(id)a6;
- (void)removeChildConnectionEvaluatorForSessionID:(id)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 isRelay:(BOOL)a6;
- (void)setAlternateDelegate:(id)a3;
- (void)setCbuuid:(id)a3;
- (void)setCellInterfaceName:(id)a3;
- (void)setCellularInterfaceIndices:(id)a3;
- (void)setCellularPort:(unsigned __int16)a3;
- (void)setConnectedToQR:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)setDisableP2P:(BOOL)a3;
- (void)setDisallowQUICPodForCellular:(BOOL)a3;
- (void)setPort:(unsigned __int16)a3;
- (void)setUseDefaultInterfaceOnly:(BOOL)a3;
- (void)setWiFiAssistState:(BOOL)a3;
- (void)setWifiAssistEnabled:(BOOL)a3;
@end

@implementation IDSNWLink

- (IDSNWLink)initWithDeviceUniqueID:(id)a3 cbuuid:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v42.receiver = self;
  v42.super_class = (Class)IDSNWLink;
  v9 = [(IDSNWLink *)&v42 init];
  v13 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cbuuid, a4);
    v13->_isDefaultPairedDevice = objc_msgSend_isEqualToString_(v13->_cbuuid, v14, @"12345678-7654-DADA-DADA-DADADADADADA", v15);
    objc_storeStrong((id *)&v13->_deviceUniqueID, a3);
    v13->_lock._os_unfair_lock_opaque = 0;
    if (!v13->_recentQRServerList)
    {
      v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      recentQRServerList = v13->_recentQRServerList;
      v13->_recentQRServerList = v16;
    }
    if (!v13->_tokenToPendingUDPNWLinkConnection)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      tokenToPendingUDPNWLinkConnection = v13->_tokenToPendingUDPNWLinkConnection;
      v13->_tokenToPendingUDPNWLinkConnection = (NSMutableDictionary *)Mutable;
    }
    if (!v13->_cellularPortList)
    {
      v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      cellularPortList = v13->_cellularPortList;
      v13->_cellularPortList = v20;
    }
    if (!v13->_queuedPeelOffs)
    {
      CFMutableDictionaryRef v22 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      queuedPeelOffs = v13->_queuedPeelOffs;
      v13->_queuedPeelOffs = (NSMutableDictionary *)v22;
    }
    if (!v13->_tokenToNWLinkConnection)
    {
      CFMutableDictionaryRef v24 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      tokenToNWLinkConnection = v13->_tokenToNWLinkConnection;
      v13->_tokenToNWLinkConnection = (NSMutableDictionary *)v24;
    }
    if (!v13->_tokenToPendingTCPNWLinkConnection)
    {
      CFMutableDictionaryRef v26 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      tokenToPendingTCPNWLinkConnection = v13->_tokenToPendingTCPNWLinkConnection;
      v13->_tokenToPendingTCPNWLinkConnection = (NSMutableDictionary *)v26;
    }
    if (!v13->_tokenToChildConnectionEvaluator)
    {
      CFMutableDictionaryRef v28 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      tokenToChildConnectionEvaluator = v13->_tokenToChildConnectionEvaluator;
      v13->_tokenToChildConnectionEvaluator = (NSMutableDictionary *)v28;
    }
    if (!v13->_interfaceIndexToNAT64LocalAddress)
    {
      CFMutableDictionaryRef v30 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      interfaceIndexToNAT64LocalAddress = v13->_interfaceIndexToNAT64LocalAddress;
      v13->_interfaceIndexToNAT64LocalAddress = (NSMutableDictionary *)v30;
    }
    if (!v13->_portToExtraListener)
    {
      CFMutableDictionaryRef v32 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      portToExtraListener = v13->_portToExtraListener;
      v13->_portToExtraListener = (NSMutableDictionary *)v32;
    }
    if (!v13->_rootConnections)
    {
      v34 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      rootConnections = v13->_rootConnections;
      v13->_rootConnections = v34;
    }
    v13->_state = 0;
    if (IMGetDomainBoolForKey())
    {
      v36 = objc_msgSend_IDSNWLink(IDSFoundationLog, v10, v11, v12);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v36, OS_LOG_TYPE_DEFAULT, "NWLinkChaos on", buf, 2u);
      }

      v13->_shouldFailConnectionsRandomly = 1;
      objc_msgSend__failConnectionsRandomly(v13, v37, v38, v39);
    }
  }
  v40 = objc_msgSend_IDSNWLink(IDSFoundationLog, v10, v11, v12);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v44 = v13;
    _os_log_impl(&dword_19D9BE000, v40, OS_LOG_TYPE_DEFAULT, "created %p", buf, 0xCu);
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_IDSNWLink(IDSFoundationLog, a2, v2, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"YES";
    if (!self->_isInvalidated) {
      v6 = @"NO";
    }
    *(_DWORD *)buf = 134218242;
    double v12 = self;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "deallocating... %p invalidated: %@", buf, 0x16u);
  }

  if (!self->_isInvalidated) {
    objc_msgSend_invalidate(self, v7, v8, v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)IDSNWLink;
  [(IDSNWLink *)&v10 dealloc];
}

- (void)cleanup
{
  objc_msgSend__cleanup_(self, a2, 0, v2);
}

- (void)_cleanup:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend_IDSNWLink(IDSFoundationLog, a2, a3, v3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (v4) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 134218242;
    v119 = self;
    __int16 v120 = 2112;
    v121 = v7;
    _os_log_impl(&dword_19D9BE000, v6, OS_LOG_TYPE_DEFAULT, "cleaning up... %p invalidate: %@", buf, 0x16u);
  }

  listener = self->_listener;
  if (listener) {
    nw_listener_cancel(listener);
  }
  cellularListener = self->_cellularListener;
  if (cellularListener) {
    nw_listener_cancel(cellularListener);
  }
  os_unfair_lock_lock(&self->_lock);
  self->_isInvalidated = v4;
  recentQRServerList = self->_recentQRServerList;
  self->_recentQRServerList = 0;

  cellularPortList = self->_cellularPortList;
  self->_cellularPortList = 0;

  queuedPeelOffs = self->_queuedPeelOffs;
  self->_queuedPeelOffs = 0;

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17 = objc_msgSend_copy(self->_tokenToNWLinkConnection, v14, v15, v16);
  tokenToNWLinkConnection = self->_tokenToNWLinkConnection;
  v113[0] = MEMORY[0x1E4F143A8];
  v113[1] = 3221225472;
  v113[2] = sub_19D9FF6C4;
  v113[3] = &unk_1E59734F8;
  id v19 = v13;
  id v114 = v19;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(tokenToNWLinkConnection, v20, (uint64_t)v113, v21);
  objc_msgSend_removeAllObjects(self->_tokenToNWLinkConnection, v22, v23, v24);
  objc_msgSend_removeAllObjects(self->_interfaceIndexToNAT64LocalAddress, v25, v26, v27);
  v31 = objc_msgSend_allValues(self->_tokenToChildConnectionEvaluator, v28, v29, v30);
  objc_msgSend_removeAllObjects(self->_tokenToChildConnectionEvaluator, v32, v33, v34);
  uint64_t v38 = objc_msgSend_allValues(self->_portToExtraListener, v35, v36, v37);
  id v42 = (id)objc_msgSend_mutableCopy(v38, v39, v40, v41);

  if (!v42) {
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  uint64_t v45 = self->_listener;
  if (v45) {
    objc_msgSend_addObject_(v42, v43, (uint64_t)v45, v44);
  }
  v46 = self->_cellularListener;
  if (v46) {
    objc_msgSend_addObject_(v42, v43, (uint64_t)v46, v44);
  }
  objc_msgSend_removeAllObjects(self->_portToExtraListener, v43, (uint64_t)v46, v44);
  os_unfair_lock_unlock(&self->_lock);
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v47 = v19;
  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v109, v49, v117, 16);
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v110;
    do
    {
      uint64_t v53 = 0;
      do
      {
        if (*(void *)v110 != v52) {
          objc_enumerationMutation(v47);
        }
        nw_connection_cancel(*(nw_connection_t *)(*((void *)&v109 + 1) + 8 * v53++));
      }
      while (v51 != v53);
      uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v54, (uint64_t)&v109, v55, v117, 16);
    }
    while (v51);
  }

  v59 = objc_msgSend_copy(self->_tokenToPendingTCPNWLinkConnection, v56, v57, v58);
  objc_msgSend_removeAllObjects(self->_tokenToPendingTCPNWLinkConnection, v60, v61, v62);
  if (v59)
  {
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v59, v63, (uint64_t)&unk_1EEFCE998, v65);
  }
  v66 = objc_msgSend_copy(self->_tokenToPendingUDPNWLinkConnection, v63, v64, v65);
  objc_msgSend_removeAllObjects(self->_tokenToPendingUDPNWLinkConnection, v67, v68, v69);
  if (v66)
  {
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v66, v70, (uint64_t)&unk_1EEFCE9B8, v71);
  }
  if (v17)
  {
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = sub_19D9FF804;
    v108[3] = &unk_1E59734F8;
    v108[4] = self;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v17, v70, (uint64_t)v108, v71);
  }
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v72 = v31;
  uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v104, v74, v116, 16);
  if (v75)
  {
    uint64_t v76 = v75;
    uint64_t v77 = *(void *)v105;
    do
    {
      uint64_t v78 = 0;
      do
      {
        if (*(void *)v105 != v77) {
          objc_enumerationMutation(v72);
        }
        nw_path_evaluator_cancel();
        ++v78;
      }
      while (v76 != v78);
      uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v79, (uint64_t)&v104, v80, v116, 16);
    }
    while (v76);
  }

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v81 = v42;
  uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v81, v82, (uint64_t)&v100, v83, v115, 16);
  if (v84)
  {
    uint64_t v85 = v84;
    uint64_t v86 = *(void *)v101;
    do
    {
      uint64_t v87 = 0;
      do
      {
        if (*(void *)v101 != v86) {
          objc_enumerationMutation(v81);
        }
        nw_listener_cancel(*(nw_listener_t *)(*((void *)&v100 + 1) + 8 * v87++));
      }
      while (v85 != v87);
      uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v81, v88, (uint64_t)&v100, v89, v115, 16);
    }
    while (v85);
  }

  rootConnections = self->_rootConnections;
  if (rootConnections)
  {
    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = sub_19D9FF810;
    v99[3] = &unk_1E5973540;
    v99[4] = self;
    objc_msgSend_enumerateObjectsUsingBlock_(rootConnections, v90, (uint64_t)v99, v91);
    objc_msgSend_removeAllObjects(self->_rootConnections, v93, v94, v95);
    v96 = self->_rootConnections;
    self->_rootConnections = 0;
  }
  v97 = self->_listener;
  self->_listener = 0;

  v98 = self->_cellularListener;
  self->_cellularListener = 0;

  if (v4) {
    objc_storeWeak((id *)&self->_delegate, 0);
  }
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_IDSNWLink(IDSFoundationLog, a2, v2, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = self;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "invalidating... %p", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend__cleanup_(self, v6, 1, v7);
}

- (unint64_t)headerOverhead
{
  return 0;
}

- (NSString)linkTypeString
{
  return (NSString *)@"NWConnection";
}

- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4
{
  return 0;
}

- (id)copyLinkStatsDict
{
  return 0;
}

- (void)setWiFiAssistState:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend_IDSNWLink(IDSFoundationLog, a2, a3, v3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = @"NO";
    if (v4) {
      double v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    double v27 = v7;
    _os_log_impl(&dword_19D9BE000, v6, OS_LOG_TYPE_DEFAULT, "NWLink setWiFiAssistState(%@) called", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = objc_msgSend_allValues(self->_tokenToNWLinkConnection, v8, v9, v10);
  os_unfair_lock_unlock(&self->_lock);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v11;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v21, v14, v25, 16);
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend__setWiFiAssistStateForCellularLink_isEnabled_(self, v16, *(void *)(*((void *)&v21 + 1) + 8 * v20++), v17, v4, (void)v21);
      }
      while (v18 != v20);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v16, (uint64_t)&v21, v17, v25, 16);
    }
    while (v18);
  }

  self->_wifiAssistEnabled = v4;
}

- (BOOL)hasListener
{
  return self->_listener != 0;
}

- (void)_failConnectionsRandomly
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if (!self->_isInvalidated)
  {
    v5 = objc_msgSend_IDSNWLink(IDSFoundationLog, a2, v2, v3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "NWLinkChaos: logging connection tree", buf, 2u);
    }

    objc_msgSend_logConnectionTree(self, v6, v7, v8);
    id v12 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v13 = self->_tokenToNWLinkConnection;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v66, v15, v72, 16);
    if (v16)
    {
      uint64_t v19 = v16;
      uint64_t v20 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v67 != v20) {
            objc_enumerationMutation(v13);
          }
          long long v22 = objc_msgSend_objectForKeyedSubscript_(self->_tokenToNWLinkConnection, v17, *(void *)(*((void *)&v66 + 1) + 8 * i), v18);
          if ((objc_msgSend_type(v22, v23, v24, v25) == 2 || objc_msgSend_type(v22, v26, v27, v28) == 4)
            && objc_msgSend_state(v22, v26, v27, v28) == 1)
          {
            objc_msgSend_addObject_(v12, v29, (uint64_t)v22, v30);
          }
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v66, v18, v72, 16);
      }
      while (v19);
    }

    double v34 = objc_msgSend_IDSNWLink(IDSFoundationLog, v31, v32, v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = objc_msgSend_count(v12, v35, v36, v37);
      *(_DWORD *)buf = 134217984;
      uint64_t v71 = v38;
      _os_log_impl(&dword_19D9BE000, v34, OS_LOG_TYPE_DEFAULT, "NWLinkChaos: collected %lu possible connections to cancel", buf, 0xCu);
    }

    if (objc_msgSend_count(v12, v39, v40, v41))
    {
      uint32_t v45 = objc_msgSend_count(v12, v42, v43, v44);
      uint32_t v46 = arc4random_uniform(v45);
      double v49 = objc_msgSend_objectAtIndexedSubscript_(v12, v47, v46, v48);
      sub_19D9FFDB0(v49, 1, (uint64_t)"NWLinkChaos failing connection", v50, v51, v52, v53, v54, v64);
      objc_msgSend__failNWLinkConnection_(self, v55, (uint64_t)v49, v56);
      v60 = objc_msgSend_IDSNWLink(IDSFoundationLog, v57, v58, v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v60, OS_LOG_TYPE_DEFAULT, "NWLinkChaos: new connection tree", buf, 2u);
      }

      objc_msgSend_logConnectionTree(self, v61, v62, v63);
    }
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = sub_19DA000BC;
    v65[3] = &unk_1E5973568;
    v65[4] = self;
    IDSTransportThreadAddBlockAfter(v65, 5.0);
  }
}

- (BOOL)_shouldFail
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_shouldFailConnectionsRandomly) {
    return 0;
  }
  uint32_t v2 = arc4random();
  v6 = objc_msgSend_IDSNWLink(IDSFoundationLog, v3, v4, v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = v2;
    _os_log_impl(&dword_19D9BE000, v6, OS_LOG_TYPE_DEFAULT, "NWLinkChaos _shouldFail: rnd = %u", (uint8_t *)v13, 8u);
  }

  HIDWORD(v10) = -1030792151 * v2;
  LODWORD(v10) = -1030792151 * v2;
  if ((v10 >> 2) > 0x28F5C28) {
    return 0;
  }
  id v12 = objc_msgSend_IDSNWLink(IDSFoundationLog, v7, v8, v9);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "NWLinkChaos _shouldFail: returning YES; something should break (and hopefully retry)...",
      (uint8_t *)v13,
      2u);
  }

  return 1;
}

- (id)copyCurrentNetworkInterfaces
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend__createNetworkInterfaceArrayWithIPVersion_wantsWiFi_wantsCellular_(self, a2, 0, v2, self->_wantsWiFi, self->_wantsCellular);
  uint64_t v40 = objc_msgSend__createNetworkInterfaceArrayWithIPVersion_wantsWiFi_wantsCellular_(self, v5, 1, v6, self->_wantsWiFi, self->_wantsCellular);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v7 = v4;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v41, v9, v49, 16);
  if (v10)
  {
    unint64_t v13 = v10;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v42;
    uint64_t v16 = 67109378;
    for (uint64_t i = *(void *)v42; ; uint64_t i = *(void *)v42)
    {
      if (i != v15) {
        objc_enumerationMutation(v7);
      }
      double v18 = *(void **)(*((void *)&v41 + 1) + 8 * v14);
      uint64_t v19 = objc_msgSend_address(v18, v11, v12, *(double *)&v16);
      uint64_t v23 = objc_msgSend_sa(v19, v20, v21, v22);

      uint64_t v27 = (const char *)objc_msgSend_index(v18, v24, v25, v26);
      if (_supportsNAT64(v23, v27, v28))
      {
        uint64_t v29 = objc_msgSend_IDSNWLink(IDSFoundationLog, v11, v12, *(double *)&v16);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          double v30 = SAToIPString(v23);
          *(_DWORD *)buf = 67109378;
          int v46 = (int)v27;
          __int16 v47 = 2112;
          double v48 = v30;
          _os_log_impl(&dword_19D9BE000, v29, OS_LOG_TYPE_DEFAULT, "NAT64: if:%u -> %@", buf, 0x12u);
        }
        objc_msgSend__addInterfaceIndex_NAT64LocalAddress_(self, v31, (uint64_t)v27, v32, bswap32(*(_DWORD *)(v23 + 4)));
      }
      if (++v14 >= v13)
      {
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v11, (uint64_t)&v41, *(double *)&v16, v49, 16);
        if (!v33) {
          break;
        }
        unint64_t v13 = v33;
        uint64_t v14 = 0;
      }
    }
  }

  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_msgSend_addObjectsFromArray_(v34, v35, (uint64_t)v7, v36);
  objc_msgSend_addObjectsFromArray_(v34, v37, (uint64_t)v40, v38);

  return v34;
}

- (id)newListenerWithClientUUID:(unsigned __int8)a3[16] wantsWiFi:(BOOL)a4 wantsCellular:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v8 = *(_OWORD *)a3;
  *(_OWORD *)self->_clientUUID = *(_OWORD *)a3;
  self->_wantsWiFuint64_t i = a4;
  self->_wantsCellular = a5;
  double v9 = objc_msgSend_IDSNWLink(IDSFoundationLog, a2, (uint64_t)a3, *(double *)&v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = @"NO";
    int port = self->_port;
    int cellularPort = self->_cellularPort;
    if (v6) {
      unint64_t v13 = @"YES";
    }
    else {
      unint64_t v13 = @"NO";
    }
    *(_DWORD *)uint64_t v33 = 138413058;
    if (v5) {
      uint64_t v10 = @"YES";
    }
    *(void *)&v33[4] = v13;
    __int16 v34 = 1024;
    int v35 = port;
    __int16 v36 = 2112;
    double v37 = v10;
    __int16 v38 = 1024;
    int v39 = cellularPort;
    _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "setting up listeners (wantsWiFi:%@ on port %u, wantsCellular:%@ on port %u)", v33, 0x22u);
  }

  if (v6)
  {
    objc_msgSend__createNewListenerWithLocalPort_(self, v14, (uint64_t)&self->_port, v16);
    double v17 = (OS_nw_listener *)objc_claimAutoreleasedReturnValue();
    listener = self->_listener;
    self->_listener = v17;

    if (!self->_listener)
    {
      double v30 = objc_msgSend_IDSNWLink(IDSFoundationLog, v14, v15, v16);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_19DB768DC();
      }
      goto LABEL_21;
    }
  }
  if (v5)
  {
    objc_msgSend__createNewListenerWithLocalPort_(self, v14, (uint64_t)&self->_cellularPort, v16);
    uint64_t v19 = (OS_nw_listener *)objc_claimAutoreleasedReturnValue();
    cellularListener = self->_cellularListener;
    self->_cellularListener = v19;

    if (!self->_cellularListener)
    {
      v31 = self->_listener;
      if (v31)
      {
        nw_listener_cancel(v31);
        double v32 = self->_listener;
        self->_listener = 0;
      }
      double v30 = objc_msgSend_IDSNWLink(IDSFoundationLog, v14, v15, v16, *(void *)v33);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_19DB76910();
      }
LABEL_21:

      return 0;
    }
  }
  uint64_t v21 = objc_msgSend_IDSNWLink(IDSFoundationLog, v14, v15, v16, *(void *)v33);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = self->_port;
    uint64_t v23 = self->_listener;
    uint64_t v24 = self->_cellularListener;
    int v25 = self->_cellularPort;
    *(_DWORD *)uint64_t v33 = 134218752;
    *(void *)&v33[4] = v23;
    __int16 v34 = 1024;
    int v35 = v22;
    __int16 v36 = 2048;
    double v37 = v24;
    __int16 v38 = 1024;
    int v39 = v25;
    _os_log_impl(&dword_19D9BE000, v21, OS_LOG_TYPE_DEFAULT, "created listeners default %p port %d cellular %p cellularPort %d", v33, 0x22u);
  }

  return (id)objc_msgSend_copyCurrentNetworkInterfaces(self, v26, v27, v28);
}

+ (id)derivePSKFromSessionKey:(id)a3 salt:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_length(v5, v7, v8, v9) != 20)
  {
    uint64_t v19 = objc_msgSend_IDSNWLink(IDSFoundationLog, v10, v11, v12);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_19DB76A50();
    }
    goto LABEL_11;
  }
  if (objc_msgSend_length(v6, v10, v11, v12) != 12)
  {
    uint64_t v19 = objc_msgSend_IDSNWLink(IDSFoundationLog, v13, v14, v15);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_19DB76A1C();
    }
    goto LABEL_11;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F1CA58]);
  uint64_t v19 = objc_msgSend_initWithLength_(v16, v17, 32, v18);
  id v20 = v6;
  objc_msgSend_bytes(v20, v21, v22, v23, 0, *(void *)"QR-QUIC-V0", 12374, v60);
  uint64_t Hkdf = CCKDFParametersCreateHkdf();
  if (Hkdf)
  {
    uint64_t v28 = Hkdf;
    uint64_t v29 = objc_msgSend_IDSNWLink(IDSFoundationLog, v25, v26, v27);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_19DB769B0(v28, v29, v30, v31, v32, v33, v34, v35);
    }

LABEL_11:
    __int16 v36 = 0;
    goto LABEL_12;
  }
  id v38 = v5;
  objc_msgSend_bytes(v38, v39, v40, v41);
  long long v42 = v19;
  objc_msgSend_mutableBytes(v42, v43, v44, v45);
  objc_msgSend_length(v42, v46, v47, v48);
  uint64_t v49 = CCDeriveKey();
  CCKDFParametersDestroy();
  if (v49)
  {
    uint64_t v53 = objc_msgSend_IDSNWLink(IDSFoundationLog, v50, v51, v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      sub_19DB76944(v49, v53, v54, v55, v56, v57, v58, v59);
    }

    goto LABEL_11;
  }
  __int16 v36 = v42;
LABEL_12:

  return v36;
}

+ (BOOL)isSkywalkDemuxSupported
{
  return 1;
}

- (id)_dictionaryFromPSKParameters:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  double v3 = a3;
  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v4, v5, v6);
  id v51 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (unint64_t)objc_msgSend_length(v3, v7, v8, v9) > 2)
  {
    objc_msgSend_componentsSeparatedByString_(v3, v7, @",", v9);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(log, v10, (uint64_t)&v53, 0.0, v57, 16);
    if (v11)
    {
      uint64_t v14 = v11;
      uint64_t v49 = v3;
      uint64_t v15 = *(void *)v54;
      unint64_t v16 = 0x1E596F000uLL;
      double v17 = &dword_19D9BE000;
      uint64_t v18 = 138412290;
      uint64_t v50 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v54 != v15) {
            objc_enumerationMutation(log);
          }
          id v20 = *(NSObject **)(*((void *)&v53 + 1) + 8 * i);
          if (v20
            && (unint64_t)objc_msgSend_length(*(void **)(*((void *)&v53 + 1) + 8 * i), v12, v13, *(double *)&v18) > 2)
          {
            uint64_t v22 = objc_msgSend_componentsSeparatedByString_(v20, v12, @":", *(double *)&v18);
            uint64_t v21 = v22;
            if (v22 && objc_msgSend_count(v22, v23, v24, v25) == 2)
            {
              uint64_t v26 = objc_msgSend_objectAtIndexedSubscript_(v21, v23, 0, v25);
              uint64_t v29 = objc_msgSend_objectAtIndexedSubscript_(v21, v27, 1, v28);
              uint64_t v33 = objc_msgSend_longLongValue(v26, v30, v31, v32);
              uint64_t v37 = objc_msgSend_longLongValue(v29, v34, v35, v36);
              objc_msgSend_numberWithLongLong_(NSNumber, v38, v37, v39);
              unint64_t v40 = v16;
              long long v42 = v41 = v17;
              double v45 = objc_msgSend_numberWithLongLong_(NSNumber, v43, v33, v44);
              objc_msgSend_setObject_forKeyedSubscript_(v51, v46, (uint64_t)v42, v47, v45);

              double v17 = v41;
              unint64_t v16 = v40;
              uint64_t v15 = v50;
            }
            else
            {
              uint64_t v26 = objc_msgSend_IDSNWLink(*(void **)(v16 + 2896), v23, v24, v25);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v59 = v21;
                _os_log_impl(v17, v26, OS_LOG_TYPE_DEFAULT, "_dictionaryFromPSKParameters: parameter pair has wrong number of parts: %@", buf, 0xCu);
              }
            }
          }
          else
          {
            uint64_t v21 = objc_msgSend_IDSNWLink(*(void **)(v16 + 2896), v12, v13, *(double *)&v18);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v59 = v20;
              _os_log_impl(v17, v21, OS_LOG_TYPE_DEFAULT, "_dictionaryFromPSKParameters: parameter pair is not long enough: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(log, v12, (uint64_t)&v53, *(double *)&v18, v57, 16);
      }
      while (v14);
      double v3 = v49;
    }
  }
  else
  {
    objc_msgSend_IDSNWLink(IDSFoundationLog, v7, v8, v9);
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v59 = v3;
      _os_log_impl(&dword_19D9BE000, log, OS_LOG_TYPE_DEFAULT, "_dictionaryFromPSKParameters: rawStr not long enough: %@", buf, 0xCu);
    }
  }

  return v51;
}

- (BOOL)connect:(int)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 clientUUID:(unsigned __int8)a6[16] sessionID:(id)a7 relaySessionToken:(id)a8 relaySessionKey:(id)a9 randomSaltBlock:(id)a10 pskTransportParameters:(id)a11 pskH3Settings:(id)a12 newLocalPort:(unsigned __int16 *)a13 disconnectAfterUse:(BOOL)a14 holdUntilFirstPacketReady:(BOOL)a15 readyHandler:(id)a16
{
  stack = *(const char **)&a3;
  uint64_t v288 = *MEMORY[0x1E4F143B8];
  id v20 = a7;
  id v249 = a8;
  id v21 = v20;
  uint64_t v22 = a4;
  id v250 = a9;
  double v23 = (void (**)(void))a10;
  id v24 = a11;
  id v25 = a12;
  id v248 = a16;
  *(_OWORD *)self->_clientUUID = *(_OWORD *)a6;
  nw_endpoint_t address = nw_endpoint_create_address(a4);
  nw_endpoint_t v27 = nw_endpoint_create_address(a5);
  id v281 = 0;
  v252 = self;
  v254 = v21;
  LODWORD(v21) = objc_msgSend__findExistingCollidingQRConnection_remoteEndpoint_sessionID_localEndpointToUse_(self, v28, (uint64_t)address, v29, v27, v21, &v281);
  uint64_t v30 = v281;
  uint64_t v251 = (uint64_t)v25;
  endpoint = v27;
  if (!v21)
  {
    v246 = v30;
    goto LABEL_8;
  }
  if (v30
    || (objc_msgSend__findNewLocalEndpointForQRConnection_(self, v31, (uint64_t)address, v33),
        (uint64_t v30 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v34 = v30;
    uint64_t v35 = objc_msgSend_IDSNWLink(IDSFoundationLog, v31, v32, v33);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      nw_endpoint_t v285 = address;
      __int16 v286 = 2112;
      v287 = v34;
      _os_log_impl(&dword_19D9BE000, v35, OS_LOG_TYPE_DEFAULT, "COLLISION MITIGATED: local endpoint %@ -> %@", buf, 0x16u);
    }

    v278[0] = MEMORY[0x1E4F143A8];
    v278[1] = 3221225472;
    v278[2] = sub_19DA01C78;
    v278[3] = &unk_1E5973568;
    v278[4] = self;
    IDSTransportThreadAddBlock(v278);
    *a13 = nw_endpoint_get_port(v34);
    double v36 = v34;

    v246 = v36;
    nw_endpoint_t address = v36;
LABEL_8:
    uint64_t v37 = _tokenWithParameters(address, v27, v254, 5uLL, 0);
    unint64_t v40 = objc_msgSend__NWLinkConnectionForToken_(self, v38, (uint64_t)v37, v39);
    if (v40)
    {
      double v41 = ids_monotonic_time();
      if (objc_msgSend_disconnectionState(v40, v42, v43, v41) != 1
        || (objc_msgSend_scheduledDisconnectTime(v40, v44, v45, v46), v46 >= v41))
      {
        if (objc_msgSend_disconnectionState(v40, v44, v45, v46) == 3)
        {
          sub_19D9FFDB0(v40, 1, (uint64_t)"this QUIC connection cannot be reused", v204, v205, v206, v207, v208, v225);
          v276[0] = MEMORY[0x1E4F143A8];
          v276[1] = 3221225472;
          v276[2] = sub_19DA01D2C;
          v276[3] = &unk_1E59735B8;
          v209 = v248;
          id v277 = v248;
          IDSTransportThreadAddBlock(v276);
          BOOL v184 = 0;
          uint64_t v57 = v277;
        }
        else
        {
          sub_19D9FFDB0(v40, 1, (uint64_t)"%@ already exists", v204, v205, v206, v207, v208, (uint64_t)v37);
          if (a14)
          {
            v209 = v248;
            if (objc_msgSend_disconnectionState(v40, v210, v211, v212) == 1) {
              objc_msgSend_setDisconnectionState_(v40, v213, 0, v214);
            }
          }
          else
          {
            v209 = v248;
            objc_msgSend_setDisconnectionState_(v40, v210, 2, v212);
          }
          v274[0] = MEMORY[0x1E4F143A8];
          v274[1] = 3221225472;
          v274[2] = sub_19DA01D48;
          v274[3] = &unk_1E59735B8;
          id v275 = v209;
          IDSTransportThreadAddBlock(v274);
          BOOL v184 = 1;
          uint64_t v57 = v275;
        }
        goto LABEL_46;
      }
      objc_msgSend_scheduledDisconnectTime(v40, v44, v45, v46);
      sub_19D9FFDB0(v40, 1, (uint64_t)"existing connection %@ already timed out (%.1f < %.1f) - reconnecting...", v47, v48, v49, v50, v51, (uint64_t)v37);
      objc_msgSend_disconnectWithSessionID_localAddress_remoteAddress_waitTime_final_(self, v52, (uint64_t)v254, 0.0, a4, a5, 0);
    }
    uint64_t v53 = v23[2](v23);
    uint64_t v57 = (void *)v53;
    if (v53)
    {
      v242 = (void *)v53;
      uint64_t v58 = [NWLinkConnection alloc];
      uint64_t v61 = objc_msgSend_initWithType_interfaceIndex_localEndpoint_remoteEndpoint_(v58, v59, 5, v60, stack, address, v27);

      objc_msgSend_setHasRequiredInterface_(v61, v62, 1, v63);
      uint64_t v65 = _supportsNAT64((uint64_t)v22, stack, v64);
      objc_msgSend_setSupportsNAT64_(v61, v66, v65, v67);
      objc_msgSend_setSessionID_(v61, v68, (uint64_t)v254, v69);
      if (!a14) {
        objc_msgSend_setDisconnectionState_(v61, v70, 2, v71);
      }
      uint64_t v241 = (uint64_t)v24;
      id v72 = (void *)nw_interface_create_with_index();
      sub_19D9FFDB0(v61, 1, (uint64_t)"connecting on if:%@(%u) for %@", v73, v74, v75, v76, v77, (uint64_t)v72);

      queue = NWLinkQueue();
      secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C88]);
      v79 = nw_parameters_copy_default_protocol_stack(secure_udp);
      LODWORD(__buf) = -1431655766;
      arc4random_buf(&__buf, 4uLL);
      LODWORD(__buf) = __buf & 0xFF7FFFFF;
      double v83 = objc_msgSend_IDSNWLink(IDSFoundationLog, v80, v81, v82);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v285) = __buf;
        _os_log_impl(&dword_19D9BE000, v83, OS_LOG_TYPE_DEFAULT, "_generateQUICConnectionID: %08x", buf, 8u);
      }

      unsigned int buffer = __buf;
      dispatch_data_t v84 = dispatch_data_create(&buffer, 4uLL, 0, 0);
      options = nw_demux_create_options();
      char v269 = 64;
      unsigned int v270 = bswap32(buffer);
      sub_19D9FFDB0(v61, 1, (uint64_t)"connect: adding demux rule with pattern: %02x%02x%02x%02x%02x (%08x)", v86, v87, v88, v89, v90, 64);
      char v268 = -1;
      int v267 = -32;
      LOWORD(v285) = 0;
      *(_DWORD *)buf = 192;
      *(_DWORD *)((char *)&v285 + 2) = bswap32(buffer);
      sub_19D9FFDB0(v61, 1, (uint64_t)"connect: adding demux rule with pattern: %02x%02x%02x%02x%02x%02x%02x%02x%02x%02x (%08x)", v91, v92, v93, v94, v95, 192);
      __int16 v283 = -1;
      unint64_t __buf = 0xFFFF0000000000E0;
      nw_demux_options_add_pattern();
      nw_demux_options_add_pattern();
      v237 = options;
      nw_protocol_stack_prepend_application_protocol(v79, options);
      nw_protocol_options_t v96 = nw_quic_create_options();
      uint64_t v97 = nw_quic_stream_copy_shared_connection_options();
      nw_quic_connection_set_force_version_negotiation();
      nw_quic_connection_set_keepalive_count();
      v98 = nw_quic_connection_copy_sec_protocol_options();
      protocol = v96;
      dispatch_data_t v238 = v84;
      nw_quic_set_source_connection_id();
      stacka = v79;
      uint64_t v101 = objc_msgSend_derivePSKFromSessionKey_salt_(IDSNWLink, v99, (uint64_t)v250, v100, v242);
      v243 = v61;
      v235 = v98;
      v236 = address;
      v234 = (void *)v101;
      if (v101)
      {
        long long v105 = (void *)v101;
        long long v106 = v61;
        v232 = v37;
        v233 = secure_udp;
        v231 = v23;
        uint64_t v107 = objc_msgSend_length(v249, v102, v103, v104) + 13;
        id v108 = objc_alloc(MEMORY[0x1E4F1CA58]);
        id v229 = objc_msgSend_initWithLength_(v108, v109, v107, v110);
        id v114 = v105;
        v115 = (char *)objc_msgSend_mutableBytes(v229, v111, v112, v113);
        char *v115 = 0;
        id v116 = v242;
        uint64_t v120 = objc_msgSend_bytes(v116, v117, v118, v119);
        int v121 = *(_DWORD *)(v120 + 8);
        *(void *)(v115 + 1) = *(void *)v120;
        *(_DWORD *)(v115 + 9) = v121;
        id v122 = v249;
        v126 = (const void *)objc_msgSend_bytes(v122, v123, v124, v125);
        size_t v130 = objc_msgSend_length(v122, v127, v128, v129);
        memcpy(v115 + 13, v126, v130);
        sub_19D9FFDB0(v106, 1, (uint64_t)"PSK transport parameters: %@, h3 settings: %@", v131, v132, v133, v134, v135, v241);
        id v136 = v114;
        v140 = (const void *)objc_msgSend_bytes(v136, v137, v138, v139);
        v141 = dispatch_data_create(v140, 0x20uLL, 0, 0);
        v142 = dispatch_data_create(v115, v107, 0, 0);
        sec_protocol_options_add_pre_shared_key(v98, v141, v142);

        sec_protocol_options_add_tls_application_protocol(v98, "h3");
        nw_quic_connection_add_h3_alpn();
        nw_quic_connection_set_disable_spin_bit();
        v145 = objc_msgSend__dictionaryFromPSKParameters_(v252, v143, v241, v144);
        uint64_t v147 = sub_19DA01D9C(v145, byte_1EF0289A8, 0x2000, v146);
        sub_19DA01D9C(v145, byte_1EF0289C0, 0x2000, v148);
        sub_19DA01D9C(v145, byte_1EF0289D8, 0x2000, v149);
        sub_19DA01D9C(v145, byte_1EF0289F0, 0x2000, v150);
        sub_19DA01D9C(v145, byte_1EF028A08, 16, v151);
        sub_19DA01D9C(v145, byte_1EF028A20, 16, v152);
        sub_19D9FFDB0(v243, 1, (uint64_t)"PSK transport parameters:\n    initialMaxStreamDataBidiLocal: %lld\n    initialMaxStreamDataBidiRemote: %lld\n    initialMaxData: %lld\n    initialMaxStreamDataUni: %lld\n    initialMaxStreamsBidi: %lld\n    initialMaxStreamsUni: %lld", v153, v154, v155, v156, v157, v147);
        nw_quic_set_remote_transport_parameters();
        v230 = (void *)v97;
        nw_quic_connection_set_pmtud_for_non_transport();
        nw_protocol_stack_prepend_application_protocol(stacka, protocol);
        v159 = nw_http3_create_options();
        if (a15) {
          nw_http3_set_0rtt_enabled();
        }
        v161 = objc_msgSend__dictionaryFromPSKParameters_(v252, v158, v251, v160);
        uint64_t v163 = sub_19DA01D9C(v161, byte_1EF0289C0, 0x10000, v162);
        v227 = v161;
        sub_19DA01D9C(v161, byte_1EF028A38, 0x3FFFLL, v164);
        sub_19DA01D9C(v161, byte_1EF0289F0, 100, v165);
        sub_19D9FFDB0(v243, 1, (uint64_t)"PSK H3 parameters:\n    maxFieldSectionSize: %lld\n    maxTableCapacity: %lld\n    blockedStreams: %lld", v166, v167, v168, v169, v170, v163);
        nw_http3_set_initial_remote_settings();
        v228 = v159;
        nw_protocol_stack_prepend_application_protocol(stacka, v159);
        v173 = objc_msgSend_protocolStackDescriptionFor_(v252, v171, (uint64_t)stacka, v172);
        objc_msgSend_setProtocolStackDescription_(v243, v174, (uint64_t)v173, v175);

        objc_msgSend__setParameters_NWLinkConnection_sharePortWithListener_isTCP_(v252, v176, (uint64_t)v233, v177, v243, 1, 0);
        v183 = nw_connection_create(endpoint, v233);
        BOOL v184 = v183 != 0;
        if (v183)
        {
          handler[0] = MEMORY[0x1E4F143A8];
          handler[1] = 3221225472;
          handler[2] = sub_19DA01E00;
          handler[3] = &unk_1E5973630;
          v185 = (id *)v259;
          id v186 = v243;
          v259[0] = v186;
          v259[1] = v252;
          id v187 = v248;
          id v261 = v187;
          BOOL v262 = a15;
          id v188 = v232;
          id v260 = v188;
          nw_connection_set_state_changed_handler(v183, handler);
          objc_msgSend_setConnection_(v186, v189, (uint64_t)v183, v190);
          objc_msgSend_setName_(v186, v191, @"Main QUIC QR connection", v192);
          objc_msgSend__addNWLinkConnection_token_(v252, v193, (uint64_t)v186, v194, v188);
          v195 = queue;
          nw_connection_set_queue(v183, queue);
          if (a15)
          {
            sub_19D9FFDB0(v186, 1, (uint64_t)"start: holding until first packet ready", v196, v197, v198, v199, v200, v226);
            objc_msgSend_setHasQUICStarted_(v186, v201, 0, v202);
            v203 = v231;
            if (v187)
            {
              v255[0] = MEMORY[0x1E4F143A8];
              v255[1] = 3221225472;
              v255[2] = sub_19DA02218;
              v255[3] = &unk_1E5973658;
              id v256 = v186;
              id v257 = v187;
              IDSTransportThreadAddBlock(v255);
            }
          }
          else
          {
            sub_19D9FFDB0(v186, 1, (uint64_t)"start: starting immediately", v196, v197, v198, v199, v200, v226);
            objc_msgSend_setHasQUICStarted_(v186, v222, 1, v223);
            nw_connection_start(v183);
            v203 = v231;
          }

          uint64_t v37 = v232;
        }
        else
        {
          uint64_t v37 = v232;
          sub_19D9FFDB0(v243, 2, (uint64_t)"couldn't create QUIC connection for %@", v178, v179, v180, v181, v182, (uint64_t)v232);
          v263[0] = MEMORY[0x1E4F143A8];
          v263[1] = 3221225472;
          v263[2] = sub_19DA01DE4;
          v263[3] = &unk_1E59735B8;
          v185 = &v264;
          id v264 = v248;
          IDSTransportThreadAddBlock(v263);
          v203 = v231;
          v195 = queue;
        }

        v218 = protocol;
        v217 = (void *)v241;
        v209 = v248;
        secure_udp = v233;
        v220 = v229;
        v216 = v230;
      }
      else
      {
        v216 = (void *)v97;
        v203 = v23;
        v218 = v96;
        v217 = (void *)v241;
        v219 = objc_msgSend_IDSNWLink(IDSFoundationLog, v102, v103, v104);
        if (os_log_type_enabled(v219, OS_LOG_TYPE_ERROR)) {
          sub_19DB76AB8();
        }

        v265[0] = MEMORY[0x1E4F143A8];
        v265[1] = 3221225472;
        v265[2] = sub_19DA01D80;
        v265[3] = &unk_1E59735B8;
        v209 = v248;
        id v266 = v248;
        IDSTransportThreadAddBlock(v265);
        BOOL v184 = 0;
        v220 = v266;
        v195 = queue;
      }

      uint64_t v57 = v242;
      unint64_t v40 = v243;
      id v24 = v217;
      double v23 = v203;
      nw_endpoint_t address = v236;
    }
    else
    {
      v215 = objc_msgSend_IDSNWLink(IDSFoundationLog, v54, v55, v56);
      if (os_log_type_enabled(v215, OS_LOG_TYPE_ERROR)) {
        sub_19DB76A84();
      }

      v272[0] = MEMORY[0x1E4F143A8];
      v272[1] = 3221225472;
      v272[2] = sub_19DA01D64;
      v272[3] = &unk_1E59735B8;
      v209 = v248;
      v273 = v248;
      IDSTransportThreadAddBlock(v272);
      BOOL v184 = 0;
      v195 = v273;
    }

LABEL_46:
    id v25 = (id)v251;

    goto LABEL_47;
  }
  v221 = objc_msgSend_IDSNWLink(IDSFoundationLog, v31, v32, v33);
  if (os_log_type_enabled(v221, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v221, OS_LOG_TYPE_DEFAULT, "COLLISION MITIGATION failed", buf, 2u);
  }

  v279[0] = MEMORY[0x1E4F143A8];
  v279[1] = 3221225472;
  v279[2] = sub_19DA01BA8;
  v279[3] = &unk_1E5973590;
  v209 = v248;
  v279[4] = self;
  id v280 = v248;
  IDSTransportThreadAddBlock(v279);
  BOOL v184 = 0;

LABEL_47:
  return v184;
}

- (BOOL)connectTCP:(int)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 clientUUID:(unsigned __int8)a6[16] sessionID:(id)a7 relaySessionToken:(id)a8 relaySessionKey:(id)a9 randomSaltBlock:(id)a10 newLocalPort:(unsigned __int16 *)a11 disconnectAfterUse:(BOOL)a12 readyHandler:(id)a13
{
  double v17 = *(const char **)&a3;
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  id v19 = a7;
  id v123 = a8;
  id v124 = a9;
  double v125 = (void (**)(void))a10;
  id v126 = a13;
  *(_OWORD *)self->_clientUUID = *(_OWORD *)a6;
  nw_endpoint_t address = nw_endpoint_create_address(a4);
  nw_endpoint_t v21 = nw_endpoint_create_address(a5);
  id v154 = 0;
  v127 = v19;
  LODWORD(a8) = objc_msgSend__findExistingCollidingQRConnection_remoteEndpoint_sessionID_localEndpointToUse_(self, v22, (uint64_t)address, v23, v21, v19, &v154);
  id v24 = v154;
  double v28 = v24;
  if (!a8) {
    goto LABEL_7;
  }
  if (v24
    || (objc_msgSend__findNewLocalEndpointForQRConnection_(self, v25, (uint64_t)address, v27),
        (double v28 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v29 = objc_msgSend_IDSNWLink(IDSFoundationLog, v25, v26, v27);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = address;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v28;
      _os_log_impl(&dword_19D9BE000, v29, OS_LOG_TYPE_DEFAULT, "connectTCP: COLLISION MITIGATED: local endpoint %@ -> %@", buf, 0x16u);
    }

    *a11 = nw_endpoint_get_port(v28);
    double v28 = v28;

    nw_endpoint_t address = v28;
LABEL_7:
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v156 = sub_19DA02C84;
    uint64_t v157 = sub_19DA02C94;
    id v158 = (id)0xAAAAAAAAAAAAAAAALL;
    _tokenWithParameters(address, v21, v127, 5uLL, 0);
    id v158 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v146 = 0;
    uint64_t v147 = &v146;
    uint64_t v148 = 0x3032000000;
    double v149 = sub_19DA02C84;
    double v150 = sub_19DA02C94;
    id v151 = (id)0xAAAAAAAAAAAAAAAALL;
    objc_msgSend__NWLinkConnectionForToken_(self, v30, *(void *)(*(void *)&buf[8] + 40), v31);
    id v151 = (id)objc_claimAutoreleasedReturnValue();
    if (v147[5])
    {
      double v32 = ids_monotonic_time();
      if (objc_msgSend_disconnectionState((void *)v147[5], v33, v34, v32) != 1
        || (objc_msgSend_scheduledDisconnectTime((void *)v147[5], v35, v36, v37), v37 >= v32))
      {
        uint64_t v107 = objc_msgSend_disconnectionState((void *)v147[5], v35, v36, v37);
        id v108 = (void *)v147[5];
        if (v107 == 3)
        {
          sub_19D9FFDB0(v108, 1, (uint64_t)"this H/2 connection cannot be reused", v102, v103, v104, v105, v106, v119);
          v144[0] = MEMORY[0x1E4F143A8];
          v144[1] = 3221225472;
          v144[2] = sub_19DA02C9C;
          v144[3] = &unk_1E59735B8;
          id v145 = v126;
          IDSTransportThreadAddBlock(v144);

          BOOL v93 = 0;
        }
        else
        {
          sub_19D9FFDB0(v108, 1, (uint64_t)"connectTCP: %@ already exists", v102, v103, v104, v105, v106, *(void *)(*(void *)&buf[8] + 40));
          uint64_t v112 = (void *)v147[5];
          if (a12)
          {
            if (objc_msgSend_disconnectionState(v112, v109, v110, v111) == 1) {
              objc_msgSend_setDisconnectionState_((void *)v147[5], v113, 0, v114);
            }
          }
          else
          {
            objc_msgSend_setDisconnectionState_(v112, v109, 2, v111);
          }
          v141[0] = MEMORY[0x1E4F143A8];
          v141[1] = 3221225472;
          v141[2] = sub_19DA02CBC;
          v141[3] = &unk_1E5973680;
          v141[4] = self;
          v143 = &v146;
          id v142 = v126;
          IDSTransportThreadAddBlock(v141);

          BOOL v93 = 1;
        }
        goto LABEL_29;
      }
      id v38 = (void *)v147[5];
      uint64_t v39 = *(void *)(*(void *)&buf[8] + 40);
      objc_msgSend_scheduledDisconnectTime(v38, v35, v36, v37);
      sub_19D9FFDB0(v38, 1, (uint64_t)"existing connection %@ already timed out (%.1f < %.1f) - reconnecting...", v40, v41, v42, v43, v44, v39);
      objc_msgSend_disconnectWithSessionID_localAddress_remoteAddress_waitTime_final_(self, v45, (uint64_t)v127, 0.0, a4, a5, 0);
    }
    id v122 = v125[2]();
    if (v122)
    {
      uint64_t v49 = [NWLinkConnection alloc];
      uint64_t isH2Connection = objc_msgSend_initWithType_interfaceIndex_localEndpoint_remoteEndpoint_isH2Connection_(v49, v50, 5, v51, v17, address, v21, 1);
      uint64_t v53 = (void *)v147[5];
      v147[5] = isH2Connection;

      objc_msgSend_setHasRequiredInterface_((void *)v147[5], v54, 1, v55);
      uint64_t v57 = _supportsNAT64((uint64_t)a4, v17, v56);
      objc_msgSend_setSupportsNAT64_((void *)v147[5], v58, v57, v59);
      objc_msgSend_setSessionID_((void *)v147[5], v60, (uint64_t)v127, v61);
      if (!a12) {
        objc_msgSend_setDisconnectionState_((void *)v147[5], v62, 2, v63);
      }
      uint64_t v64 = (void *)v147[5];
      uint64_t v65 = (void *)nw_interface_create_with_index();
      sub_19D9FFDB0(v64, 1, (uint64_t)"connectTCP: connecting on if:%@(%u) for %@", v66, v67, v68, v69, v70, (uint64_t)v65);

      queue = NWLinkQueue();
      configure_tls[0] = MEMORY[0x1E4F143A8];
      configure_tls[1] = 3221225472;
      configure_tls[2] = sub_19DA02D40;
      configure_tls[3] = &unk_1E59736A8;
      id v135 = v124;
      id v136 = v122;
      id v71 = v126;
      id v138 = v71;
      id v137 = v123;
      secure_tcp = nw_parameters_create_secure_tcp(configure_tls, (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C88]);
      uint64_t v73 = nw_parameters_copy_default_protocol_stack(secure_tcp);
      options = nw_http2_create_options();
      sub_19D9FFDB0((void *)v147[5], 1, (uint64_t)"disabling nw capsule handling", v75, v76, v77, v78, v79, v120);
      nw_http2_set_capsule_handling_disabled();
      nw_protocol_stack_prepend_application_protocol(v73, options);
      double v82 = objc_msgSend_protocolStackDescriptionFor_(self, v80, (uint64_t)v73, v81);
      objc_msgSend_setProtocolStackDescription_((void *)v147[5], v83, (uint64_t)v82, v84);

      objc_msgSend__setParameters_NWLinkConnection_sharePortWithListener_isTCP_(self, v85, (uint64_t)secure_tcp, v86, v147[5], 0, 1);
      uint64_t v92 = nw_connection_create(v21, secure_tcp);
      BOOL v93 = v92 != 0;
      if (v92)
      {
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = sub_19DA02F6C;
        handler[3] = &unk_1E5973720;
        size_t v130 = &v146;
        void handler[4] = self;
        uint64_t v131 = buf;
        id v129 = v71;
        nw_connection_set_state_changed_handler(v92, handler);
        objc_msgSend_setConnection_((void *)v147[5], v94, (uint64_t)v92, v95);
        objc_msgSend_setName_((void *)v147[5], v96, @"Main TCP QR connection", v97);
        objc_msgSend__addPendingTCPNWLinkConnection_token_(self, v98, v147[5], v99, *(void *)(*(void *)&buf[8] + 40));
        nw_connection_set_queue(v92, queue);
        nw_connection_start(v92);
        objc_msgSend_setHasQUICStarted_((void *)v147[5], v100, 1, v101);
      }
      else
      {
        sub_19D9FFDB0((void *)v147[5], 2, (uint64_t)"connectTCP: couldn't create TCPH2 connection for %@", v87, v88, v89, v90, v91, *(void *)(*(void *)&buf[8] + 40));
        v132[0] = MEMORY[0x1E4F143A8];
        v132[1] = 3221225472;
        v132[2] = sub_19DA02F4C;
        v132[3] = &unk_1E59735B8;
        id v133 = v71;
        IDSTransportThreadAddBlock(v132);
      }
      id v116 = queue;
    }
    else
    {
      v115 = objc_msgSend_IDSNWLink(IDSFoundationLog, v46, v47, v48);
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
        sub_19DB76A84();
      }

      v139[0] = MEMORY[0x1E4F143A8];
      v139[1] = 3221225472;
      v139[2] = sub_19DA02D20;
      v139[3] = &unk_1E59735B8;
      v140 = v126;
      IDSTransportThreadAddBlock(v139);
      BOOL v93 = 0;
      id v116 = v140;
    }

LABEL_29:
    _Block_object_dispose(&v146, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_30;
  }
  uint64_t v118 = objc_msgSend_IDSNWLink(IDSFoundationLog, v25, v26, v27);
  if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v118, OS_LOG_TYPE_DEFAULT, "connectTCP: COLLISION MITIGATION failed", buf, 2u);
  }

  v152[0] = MEMORY[0x1E4F143A8];
  v152[1] = 3221225472;
  v152[2] = sub_19DA02C64;
  v152[3] = &unk_1E59735B8;
  uint64_t v153 = v126;
  IDSTransportThreadAddBlock(v152);
  BOOL v93 = 0;
  double v28 = v153;
LABEL_30:

  return v93;
}

- (void)_addPendingTCPNWLinkConnection:(id)a3 token:(id)a4
{
  id value = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (value) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_tokenToNWLinkConnection, v6, value);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_removePendingTCPNWLinkConnectionForToken:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_removeObjectForKey_(self->_tokenToPendingTCPNWLinkConnection, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_lock);
}

- (unsigned)_getConnectedLocalPortAndSetLocalEndpointForConnection:(id)a3
{
  id v3 = a3;
  double v7 = objc_msgSend_connection(v3, v4, v5, v6);
  uint64_t v8 = nw_connection_copy_connected_local_endpoint();

  if (v8)
  {
    unsigned int port = nw_endpoint_get_port(v8);
    sub_19D9FFDB0(v3, 1, (uint64_t)"connectTCP: got local endpoint: %u", v15, v16, v17, v18, v19, port);
  }
  else
  {
    sub_19D9FFDB0(v3, 2, (uint64_t)"connectTCP: unable to get local endpoint from the connected connection!", v9, v10, v11, v12, v13, v23);
    LOWORD(port) = 0;
  }
  objc_msgSend_setLocalEndpoint_(v3, v20, (uint64_t)v8, v21);

  return port;
}

- (void)peelOffReliableUnicastConnectionforLocalAddress:(const sockaddr *)a3 remoteAddress:(const sockaddr *)a4 sessionID:(id)a5 localQUICConnectionID:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  uint64_t v15 = v11;
  if (a3)
  {
    if (a4)
    {
      if (v10)
      {
        if (v11)
        {
          nw_endpoint_t address = nw_endpoint_create_address(a3);
          if (address)
          {
            uint64_t v22 = nw_endpoint_create_address(a4);
            if (v22)
            {
              id v24 = _tokenWithParameters(address, v22, v10, 5uLL, 0);
              double v29 = objc_msgSend__NWLinkConnectionForToken_(self, v25, (uint64_t)v24, v26);
              if (v29)
              {
                objc_msgSend__createReliableUnicastConnection_localQUICConnectionID_(self, v27, (uint64_t)v29, v30, v15);
              }
              else
              {
                double v31 = objc_msgSend_IDSNWLink(IDSFoundationLog, v27, v28, v30);
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                  sub_19DB76C58();
                }
              }
            }
            else
            {
              id v24 = objc_msgSend_IDSNWLink(IDSFoundationLog, v20, v21, v23);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                sub_19DB76C24();
              }
            }
          }
          else
          {
            uint64_t v22 = objc_msgSend_IDSNWLink(IDSFoundationLog, v16, v17, v19);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_19DB76BF0();
            }
          }
        }
        else
        {
          nw_endpoint_t address = objc_msgSend_IDSNWLink(IDSFoundationLog, v12, v13, v14);
          if (os_log_type_enabled(address, OS_LOG_TYPE_ERROR)) {
            sub_19DB76BBC();
          }
        }
      }
      else
      {
        nw_endpoint_t address = objc_msgSend_IDSNWLink(IDSFoundationLog, v12, v13, v14);
        if (os_log_type_enabled(address, OS_LOG_TYPE_ERROR)) {
          sub_19DB76B88();
        }
      }
    }
    else
    {
      nw_endpoint_t address = objc_msgSend_IDSNWLink(IDSFoundationLog, v12, v13, v14);
      if (os_log_type_enabled(address, OS_LOG_TYPE_ERROR)) {
        sub_19DB76B54();
      }
    }
  }
  else
  {
    nw_endpoint_t address = objc_msgSend_IDSNWLink(IDSFoundationLog, v12, v13, v14);
    if (os_log_type_enabled(address, OS_LOG_TYPE_ERROR)) {
      sub_19DB76B20();
    }
  }
}

- (void)disconnectWithSessionID:(id)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 waitTime:(double)a6 final:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  nw_endpoint_t address = nw_endpoint_create_address(a4);
  nw_endpoint_t v14 = nw_endpoint_create_address(a5);
  uint64_t v15 = _tokenWithParameters(address, v14, v12, 5uLL, 0);
  uint64_t v18 = objc_msgSend__NWLinkConnectionForToken_(self, v16, (uint64_t)v15, v17);
  uint64_t v22 = v18;
  if (v18 && objc_msgSend_disconnectionState(v18, v19, v20, v21) != 3)
  {
    if (v7)
    {
      objc_msgSend_setDisconnectionState_(v22, v23, 3, v25);
      objc_msgSend_setState_(v22, v26, 2, v27);
    }
    else if (objc_msgSend_disconnectionState(v22, v23, v24, v25) != 2)
    {
      objc_msgSend_setDisconnectionState_(v22, v28, 1, v29);
    }
    double v30 = ids_monotonic_time();
    objc_msgSend_setScheduledDisconnectTime_(v22, v31, v32, v30 + a6);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_19DA03B50;
  aBlock[3] = &unk_1E5973748;
  aBlock[4] = self;
  double v33 = address;
  uint64_t v45 = v33;
  uint64_t v34 = v14;
  double v46 = v34;
  id v35 = v12;
  id v47 = v35;
  uint64_t v36 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  uint64_t v40 = objc_msgSend_IDSNWLink(IDSFoundationLog, v37, v38, v39);
  BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
  if (a6 == 0.0)
  {
    if (v41)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v40, OS_LOG_TYPE_DEFAULT, "disconnectWithSessionID cleanup immediately", buf, 2u);
    }

    v36[2](v36, 1);
  }
  else
  {
    if (v41)
    {
      *(_DWORD *)buf = 134217984;
      double v49 = a6;
      _os_log_impl(&dword_19D9BE000, v40, OS_LOG_TYPE_DEFAULT, "disconnectWithSessionID scheduled disconnections in %.1f seconds", buf, 0xCu);
    }

    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = sub_19DA03EEC;
    v42[3] = &unk_1E59735B8;
    uint64_t v43 = v36;
    IDSTransportThreadAddBlockAfter(v42, a6);
  }
}

- (void)disconnectP2PWithSessionID:(id)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5
{
  id v8 = a3;
  nw_endpoint_t address = nw_endpoint_create_address(a4);
  nw_endpoint_t v12 = nw_endpoint_create_address(a5);
  if (self->_isInvalidated)
  {
    nw_endpoint_t v14 = objc_msgSend_IDSNWLink(IDSFoundationLog, v10, v11, v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_19D9BE000, v14, OS_LOG_TYPE_DEFAULT, "disconnectWithSessionID alread invalidated", v24, 2u);
    }
  }
  else
  {
    uint64_t v15 = _tokenWithParameters(address, v12, v8, 0, 0);
    objc_msgSend__cancelNWLinkConnectionWithToken_removeNWLinkConnectionNow_(self, v16, (uint64_t)v15, v17, 0);
    uint64_t v18 = _tokenWithParameters(address, v12, v8, 9uLL, 0);

    objc_msgSend__cancelNWLinkConnectionWithToken_removeNWLinkConnectionNow_(self, v19, (uint64_t)v18, v20, 0);
    double v21 = _tokenWithParameters(address, v12, v8, 0xAuLL, 0);

    objc_msgSend__cancelNWLinkConnectionWithToken_removeNWLinkConnectionNow_(self, v22, (uint64_t)v21, v23, 0);
  }
}

- (void)_cancelNWLinkConnectionWithToken:(id)a3 removeNWLinkConnectionNow:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v11 = objc_msgSend__NWLinkConnectionForToken_(self, v7, (uint64_t)v6, v8);
  if (v11)
  {
    objc_msgSend__cancelNWLinkConnection_remove_(self, v9, (uint64_t)v11, v12, v4);
  }
  else
  {
    double v13 = objc_msgSend_IDSNWLink(IDSFoundationLog, v9, v10, v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_DEFAULT, "_cancelNWLinkConnectionWithToken: cannot find connection to disconnect for %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (BOOL)createQUICPodQRConnectionsForSession:(id)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 quicConnectionIDs:(id)a6 channelNumber:(unsigned __int16)a7
{
  uint64_t v7 = a7;
  id v12 = a3;
  id v13 = a6;
  nw_endpoint_t address = nw_endpoint_create_address(a4);
  nw_endpoint_t v15 = nw_endpoint_create_address(a5);
  uint64_t v16 = _tokenWithParameters(address, v15, v12, 5uLL, 0);
  double v21 = objc_msgSend__NWLinkConnectionForToken_(self, v17, v16, v18);
  if (v21)
  {
    double v23 = objc_msgSend_IDSNWLink(IDSFoundationLog, v19, v20, v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "Connection subtree for QUIC connection:", buf, 2u);
    }

    os_unfair_lock_lock(&self->_lock);
    objc_msgSend_logConnectionSubtree_indentation_(self, v24, (uint64_t)v21, v25, &stru_1EEFDAD58);
    os_unfair_lock_unlock(&self->_lock);
  }
  uint64_t v109 = _tokenWithParameters(address, v15, v12, 1uLL, 0);
  uint64_t v28 = objc_msgSend__NWLinkConnectionForToken_(self, v26, v109, v27);
  uint64_t v32 = v28;
  uint64_t v110 = (void *)v16;
  if (!self->_disallowQUICPodForCellular) {
    goto LABEL_8;
  }
  objc_msgSend_localEndpoint(v28, v29, v30, v31);
  id v33 = v12;
  uint64_t v34 = v21;
  id v35 = v15;
  uint64_t v36 = address;
  id v37 = v13;
  uint64_t v38 = v7;
  v40 = double v39 = v32;
  int isLocalEndpointCellular = objc_msgSend__isLocalEndpointCellular_(self, v41, (uint64_t)v40, v42);

  uint64_t v32 = v39;
  uint64_t v7 = v38;
  id v13 = v37;
  nw_endpoint_t address = v36;
  nw_endpoint_t v15 = v35;
  double v21 = v34;
  id v12 = v33;
  double v49 = v110;
  if (isLocalEndpointCellular)
  {
    sub_19D9FFDB0(v32, 1, (uint64_t)"NOT setting up QUICPod because it's disallowed for cellular connections", v44, v45, v46, v47, v48, v105);
    BOOL v50 = 0;
    double v51 = (void *)v109;
  }
  else
  {
LABEL_8:
    id v108 = v32;
    double v52 = v12;
    uint64_t v53 = v7;
    long long v54 = _tokenWithParameters(address, v15, v52, 7uLL, 0);
    objc_msgSend__cancelNWLinkConnectionWithToken_removeNWLinkConnectionNow_(self, v55, (uint64_t)v54, v56, 1);
    uint64_t v106 = v52;
    uint64_t v57 = _tokenWithParameters(address, v15, v52, 8uLL, 0);

    objc_msgSend__cancelNWLinkConnectionWithToken_removeNWLinkConnectionNow_(self, v58, v57, v59, 1);
    double v63 = objc_msgSend_localAVCConnectionIDDispatchData(v13, v60, v61, v62);
    uint64_t v67 = objc_msgSend_localAVCConnectionID(v13, v64, v65, v66);
    id v71 = objc_msgSend_remoteAVCConnectionIDDispatchData(v13, v68, v69, v70);
    uint64_t v74 = objc_msgSend__createQUICPodConnectionWithType_quicNWLinkConnection_clientQUICConnectionID_clientQUICConnectionIDAsNumber_serverQUICConnectionID_(self, v72, 0, v73, v21, v63, v67, v71);

    uint64_t v107 = (void *)v57;
    if (v74)
    {
      objc_msgSend_setChannelNumber_(v74, v75, v53, v81);
      uint64_t v85 = objc_msgSend_localIDSConnectionIDDispatchData(v13, v82, v83, v84);
      uint64_t v89 = objc_msgSend_localIDSConnectionID(v13, v86, v87, v88);
      BOOL v93 = objc_msgSend_remoteIDSConnectionIDDispatchData(v13, v90, v91, v92);
      nw_protocol_options_t v96 = objc_msgSend__createQUICPodConnectionWithType_quicNWLinkConnection_clientQUICConnectionID_clientQUICConnectionIDAsNumber_serverQUICConnectionID_(self, v94, 1, v95, v21, v85, v89, v93);

      BOOL v50 = v96 != 0;
      if (v96)
      {
        objc_msgSend_setChannelNumber_(v96, v97, v53, v98);
      }
      else
      {
        objc_msgSend__cancelNWLinkConnection_remove_(self, v97, (uint64_t)v74, v98, 0);
        sub_19D9FFDB0(v21, 2, (uint64_t)"failed to create IDS QUICPod connection", v99, v100, v101, v102, v103, v105);
      }
      id v12 = v106;
      double v51 = (void *)v109;

      double v49 = v110;
    }
    else
    {
      sub_19D9FFDB0(v21, 2, (uint64_t)"failed to create AVC QUICPod connection", v76, v77, v78, v79, v80, v105);
      BOOL v50 = 0;
      double v51 = (void *)v109;
      double v49 = v110;
      id v12 = v106;
    }

    uint64_t v32 = v108;
  }

  return v50;
}

- (BOOL)createQUICPodP2PConnectionsForSession:(id)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 quicConnectionIDs:(id)a6 negotiatedKeys:(id)a7 channelNumber:(unsigned __int16)a8 completionHandler:(id)a9
{
  unsigned int v186 = a8;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  double v17 = (void (**)(id, void))a9;
  v204[0] = 0;
  v204[1] = v204;
  v204[2] = 0x2020000000;
  char v205 = 1;
  v202[0] = 0;
  v202[1] = v202;
  v202[2] = 0x2020000000;
  char v203 = 0;
  v200[0] = 0;
  v200[1] = v200;
  v200[2] = 0x2020000000;
  char v201 = 0;
  nw_endpoint_t address = nw_endpoint_create_address(a4);
  nw_endpoint_t v190 = nw_endpoint_create_address(a5);
  nw_endpoint_t v191 = address;
  double v192 = v14;
  v189 = _tokenWithParameters(address, v190, v14, 1uLL, 0);
  uint64_t v196 = objc_msgSend__NWLinkConnectionForToken_(self, v19, (uint64_t)v189, v20);
  if (self->_disallowQUICPodForCellular
    && (objc_msgSend_localEndpoint(v196, v21, v22, v23),
        uint64_t v24 = objc_claimAutoreleasedReturnValue(),
        int isLocalEndpointCellular = objc_msgSend__isLocalEndpointCellular_(self, v25, (uint64_t)v24, v26),
        v24,
        isLocalEndpointCellular))
  {
    sub_19D9FFDB0(v196, 1, (uint64_t)"NOT setting up QUICPod because it's disallowed for cellular connections", v28, v29, v30, v31, v32, v183);
    v17[2](v17, 0);
    BOOL v33 = 0;
  }
  else
  {
    if (v196)
    {
      uint64_t v34 = objc_msgSend_IDSNWLink(IDSFoundationLog, v21, v22, v23);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v34, OS_LOG_TYPE_DEFAULT, "Connection subtree for ChannelData connection:", buf, 2u);
      }

      os_unfair_lock_lock(&self->_lock);
      objc_msgSend_logConnectionSubtree_indentation_(self, v35, (uint64_t)v196, v36, &stru_1EEFDAD58);
      os_unfair_lock_unlock(&self->_lock);
    }
    id v37 = objc_msgSend_avc(v16, v21, v22, v23);
    objc_msgSend_clientSecret(v37, v38, v39, v40);
    id v41 = objc_claimAutoreleasedReturnValue();
    uint64_t v45 = (const void *)objc_msgSend_bytes(v41, v42, v43, v44);
    double v49 = objc_msgSend_avc(v16, v46, v47, v48);
    uint64_t v53 = objc_msgSend_clientSecret(v49, v50, v51, v52);
    size_t v57 = objc_msgSend_length(v53, v54, v55, v56);
    dispatch_data_t v195 = dispatch_data_create(v45, v57, 0, 0);

    uint64_t v61 = objc_msgSend_avc(v16, v58, v59, v60);
    objc_msgSend_serverSecret(v61, v62, v63, v64);
    id v65 = objc_claimAutoreleasedReturnValue();
    uint64_t v69 = (const void *)objc_msgSend_bytes(v65, v66, v67, v68);
    double v73 = objc_msgSend_avc(v16, v70, v71, v72);
    uint64_t v77 = objc_msgSend_serverSecret(v73, v74, v75, v76);
    size_t v81 = objc_msgSend_length(v77, v78, v79, v80);
    dispatch_data_t v194 = dispatch_data_create(v69, v81, 0, 0);

    uint64_t v85 = objc_msgSend_ids(v16, v82, v83, v84);
    objc_msgSend_clientSecret(v85, v86, v87, v88);
    id v89 = objc_claimAutoreleasedReturnValue();
    BOOL v93 = (const void *)objc_msgSend_bytes(v89, v90, v91, v92);
    double v97 = objc_msgSend_ids(v16, v94, v95, v96);
    uint64_t v101 = objc_msgSend_clientSecret(v97, v98, v99, v100);
    size_t v105 = objc_msgSend_length(v101, v102, v103, v104);
    v193 = v17;
    dispatch_data_t v188 = dispatch_data_create(v93, v105, 0, 0);

    uint64_t v109 = objc_msgSend_ids(v16, v106, v107, v108);
    objc_msgSend_serverSecret(v109, v110, v111, v112);
    id v113 = objc_claimAutoreleasedReturnValue();
    v117 = (const void *)objc_msgSend_bytes(v113, v114, v115, v116);
    int v121 = objc_msgSend_ids(v16, v118, v119, v120);
    double v125 = objc_msgSend_serverSecret(v121, v122, v123, v124);
    size_t v129 = objc_msgSend_length(v125, v126, v127, v128);
    dispatch_data_t v187 = dispatch_data_create(v117, v129, 0, 0);

    id v133 = objc_msgSend_localAVCConnectionIDDispatchData(v15, v130, v131, v132);
    id v137 = objc_msgSend_remoteAVCConnectionIDDispatchData(v15, v134, v135, v136);
    uint64_t v141 = objc_msgSend_localAVCConnectionID(v15, v138, v139, v140);
    objc_msgSend_isServer(v16, v142, v143, v144);
    id v145 = v196;
    uint64_t v197 = v145;
    id v146 = v193;
    uint64_t v198 = v146;
    double v149 = objc_msgSend__createP2PQUICPodConnectionWithType_udpNWLinkConnection_clientQUICConnectionID_serverQUICConnectionID_clientQUICConnectionIDNumber_clientSecret_serverSecret_isServer_completionHandler_(self, v147, 0, v148, v145, v133, v137, v141, v195);

    if (v149)
    {
      objc_msgSend_setChannelNumber_(v149, v150, v186, v156);
      double v160 = objc_msgSend_localIDSConnectionIDDispatchData(v15, v157, v158, v159);
      double v164 = objc_msgSend_remoteIDSConnectionIDDispatchData(v15, v161, v162, v163);
      unsigned int v185 = objc_msgSend_localIDSConnectionID(v15, v165, v166, v167);
      objc_msgSend_isServer(v16, v168, v169, v170);
      id v171 = v145;
      BOOL v184 = (void (**)(id, void))v146;
      v174 = objc_msgSend__createP2PQUICPodConnectionWithType_udpNWLinkConnection_clientQUICConnectionID_serverQUICConnectionID_clientQUICConnectionIDNumber_clientSecret_serverSecret_isServer_completionHandler_(self, v172, 1, v173, v171, v160, v164, v185, v188);

      BOOL v33 = v174 != 0;
      if (v174)
      {
        objc_msgSend_setChannelNumber_(v174, v175, v186, v176);
      }
      else
      {
        objc_msgSend__cancelNWLinkConnection_remove_(self, v175, (uint64_t)v149, v176, 0);
        sub_19D9FFDB0(v171, 2, (uint64_t)"failed to create IDS QUICPod connection", v177, v178, v179, v180, v181, (uint64_t)v187);
        v184[2](v184, 0);
      }
    }
    else
    {
      sub_19D9FFDB0(v145, 2, (uint64_t)"failed to create AVC QUICPod connection", v151, v152, v153, v154, v155, (uint64_t)v194);
      (*((void (**)(id, void))v146 + 2))(v146, 0);
      BOOL v33 = 0;
    }

    double v17 = (void (**)(id, void))v193;
  }

  _Block_object_dispose(v200, 8);
  _Block_object_dispose(v202, 8);
  _Block_object_dispose(v204, 8);

  return v33;
}

- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  uint64_t v7 = a3;
  return objc_msgSend_sendPacketBufferArray_arraySize_toDeviceUniqueID_cbuuid_(self, a2, (uint64_t)&v7, v5, 1, a4, a5);
}

- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v14 = v11;
  if (v11 && (objc_msgSend_isEqualToString_(v11, v12, (uint64_t)self->_cbuuid, v13) & 1) == 0)
  {
    if (a4 < 1)
    {
      unint64_t v26 = 10;
    }
    else
    {
      uint64_t v25 = a4;
      unint64_t v26 = 10;
      do
      {
        uint64_t v27 = (uint64_t)*a3++;
        _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSNWLink.m", (const char *)0x6FD, v27, v15);
        --v25;
      }
      while (v25);
    }
  }
  else
  {
    if (a4 >= 1)
    {
      id v16 = *a3;
      size_t v129 = (const sockaddr *)((char *)*a3 + 56);
      nw_endpoint_t address = nw_endpoint_create_address(v129);
      nw_endpoint_t v19 = nw_endpoint_create_address((const sockaddr *)((char *)v16 + 184));
      double v136 = self;
      int v131 = *((unsigned __int8 *)v16 + 44);
      id v134 = v10;
      if (*((unsigned char *)v16 + 44))
      {
        double v21 = (void *)*((void *)v16 + 158);
        nw_endpoint_t v22 = address;
        nw_endpoint_t v23 = v19;
        unint64_t v24 = 5;
      }
      else
      {
        if (!*((unsigned char *)v16 + 45) && !*((unsigned char *)v16 + 46))
        {
          if (*((unsigned __int8 *)v16 + 47) | *((unsigned __int8 *)v16 + 43))
          {
            double v97 = (void *)*((void *)v16 + 158);
            nw_endpoint_t v98 = address;
            nw_endpoint_t v99 = v19;
            unint64_t v100 = 0;
          }
          else
          {
            int shouldAllowP2PConnectionTo_anotherRemoteEndpoint = objc_msgSend__shouldAllowP2PConnectionTo_anotherRemoteEndpoint_(self, v18, (uint64_t)v19, v20, 0);
            double v97 = (void *)*((void *)v16 + 158);
            if (shouldAllowP2PConnectionTo_anotherRemoteEndpoint)
            {
              nw_endpoint_t v98 = address;
              nw_endpoint_t v99 = v19;
              unint64_t v100 = 10;
            }
            else
            {
              nw_endpoint_t v98 = address;
              nw_endpoint_t v99 = v19;
              unint64_t v100 = 8;
            }
          }
          uint64_t v28 = _tokenWithParameters(v98, v99, v97, v100, 0);
          uint64_t v31 = objc_msgSend__NWLinkConnectionForToken_(self, v119, (uint64_t)v28, v120);
          if (v31) {
            goto LABEL_16;
          }
          int v121 = _tokenWithParameters(address, v19, v14, 2uLL, 0);

          uint64_t v124 = objc_msgSend__NWLinkConnectionForToken_(self, v122, (uint64_t)v121, v123);
          if (v124)
          {
            id v35 = v124;
            uint64_t v28 = v121;
LABEL_17:
            nw_endpoint_t v135 = v19;
            nw_endpoint_t v132 = address;
            id v133 = v14;
            if (objc_msgSend_type(v35, v32, v33, v34) == 7) {
              uint64_t v39 = 4;
            }
            else {
              uint64_t v39 = 4 * (objc_msgSend_type(v35, v36, v37, v38) == 8);
            }
            id v40 = objc_alloc(MEMORY[0x1E4F28F50]);
            double v44 = objc_msgSend_initWithOptions_(v40, v41, 2, v42);
            uint64_t v46 = 0;
            do
              objc_msgSend_addPointer_(v44, v43, (uint64_t)a3[v46++], v45);
            while (a4 != v46);
            size_t v130 = v28;
            uint64_t v47 = (const void *)(*(void *)*a3 + v39);
            size_t v48 = *((void *)*a3 + 2) - v39;
            *(void *)destructor = MEMORY[0x1E4F143A8];
            *(void *)&destructor[8] = 3221225472;
            *(void *)&destructor[16] = sub_19DA0EC54;
            uint64_t v143 = &unk_1E5973BA8;
            id v49 = v44;
            id v144 = v49;
            dispatch_data_t v50 = dispatch_data_create(v47, v48, 0, destructor);
            uint64_t v51 = v50;
            if (a4 < 2)
            {
              dispatch_data_t concat = v50;
            }
            else
            {
              uint64_t v52 = a4 - 1;
              uint64_t v53 = a3 + 1;
              do
              {
                long long v54 = *v53++;
                uint64_t v55 = dispatch_data_create((const void *)(*v54 + v39), v54[2] - v39, 0, &unk_1EEFCE9D8);
                dispatch_data_t concat = dispatch_data_create_concat(v51, v55);

                uint64_t v51 = concat;
                --v52;
              }
              while (v52);
            }

            sub_19D9FFDB0(v35, 3, (uint64_t)"sendPacketBufferArray: token %@, isQRControlPacket: %@, isSTUNPacket: %@, isReliableUnicast: %@, isClientQUIC: %@, isVirtualRelay: %@", v57, v58, v59, v60, v61, (uint64_t)v130);
            if (objc_msgSend_type(v35, v62, v63, v64) == 7
              || objc_msgSend_type(v35, v65, v66, v72) == 8
              || objc_msgSend_type(v35, v73, v74, v75) == 9
              || objc_msgSend_type(v35, v76, v77, v78) == 10)
            {
              sub_19D9FFDB0(v35, 3, (uint64_t)"sendPacketBufferArray: sending QUICPod", v67, v68, v69, v70, v71, v127);
              *((unsigned char *)v16 + 1296) = 1;
            }
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = sub_19DA05554;
            aBlock[3] = &unk_1E5973798;
            double v140 = v16;
            aBlock[4] = v136;
            uint64_t v79 = concat;
            id v138 = v79;
            char v141 = v131;
            id v80 = v130;
            id v139 = v80;
            double v86 = (uint64_t (**)(void *, NSObject *))_Block_copy(aBlock);
            id v14 = v133;
            if (v131)
            {
              uint64_t v87 = "qr control packet";
            }
            else
            {
              sub_19D9FFDB0(v35, 3, (uint64_t)"non-qr control packet", v81, v82, v83, v84, v85, v127);
              if (!v35)
              {
                sub_19D9FFDB0(0, 3, (uint64_t)"NO existing NWLinkConnection", v81, v82, v83, v84, v85, v127);
                if (objc_msgSend__shouldAllowP2PConnectionTo_anotherRemoteEndpoint_(v136, v89, (uint64_t)v135, v90, 0))
                {
                  if (objc_msgSend__doesUDPConnectionInProgressExist_(v136, v91, (uint64_t)v80, v93))
                  {
                    id v35 = objc_msgSend_IDSNWLink(IDSFoundationLog, v94, v95, v96);
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)destructor = 0;
                      _os_log_impl(&dword_19D9BE000, v35, OS_LOG_TYPE_DEFAULT, "existing UDP connection in progress - return", destructor, 2u);
                    }
                    unint64_t v26 = 14;
                  }
                  else
                  {
                    uint64_t v101 = (const char *)*((unsigned int *)v16 + 12);
                    uint64_t v102 = [NWLinkConnection alloc];
                    id v35 = objc_msgSend_initWithType_interfaceIndex_localEndpoint_remoteEndpoint_(v102, v103, 0, v104, v101, v132, v135);
                    sub_19D9FFDB0(v35, 3, (uint64_t)"created NWLinkConnection", v105, v106, v107, v108, v109, v128);
                    objc_msgSend_setHasRequiredInterface_(v35, v110, 1, v111);
                    uint64_t v113 = _supportsNAT64((uint64_t)v129, v101, v112);
                    objc_msgSend_setSupportsNAT64_(v35, v114, v113, v115);
                    objc_msgSend__createUDPConnectionForNWLinkConnection_readyHandler_(v136, v116, (uint64_t)v35, v117, v86);
                    unint64_t v26 = 0;
                  }
                }
                else
                {
                  id v35 = objc_msgSend_IDSNWLink(IDSFoundationLog, v91, v92, v93);
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)destructor = 138412546;
                    *(void *)&destructor[4] = v132;
                    *(_WORD *)&destructor[12] = 2112;
                    *(void *)&destructor[14] = v135;
                    _os_log_impl(&dword_19D9BE000, v35, OS_LOG_TYPE_DEFAULT, "no direct UDP connection allowed from %@ to QR server %@", destructor, 0x16u);
                  }
                  unint64_t v26 = 6;
                }
                goto LABEL_37;
              }
              uint64_t v87 = "have existing NWLinkConnection";
            }
            sub_19D9FFDB0(v35, 3, (uint64_t)v87, v81, v82, v83, v84, v85, v127);
            unint64_t v26 = v86[2](v86, v35);
LABEL_37:

            id v10 = v134;
            goto LABEL_39;
          }
          uint64_t v28 = _tokenWithParameters(address, v19, *((void **)v16 + 158), 0, 0);

          objc_msgSend__NWLinkConnectionForToken_(self, v125, (uint64_t)v28, v126);
          uint64_t v31 = LABEL_15:;
LABEL_16:
          id v35 = v31;
          goto LABEL_17;
        }
        double v21 = (void *)*((void *)v16 + 158);
        nw_endpoint_t v22 = address;
        nw_endpoint_t v23 = v19;
        unint64_t v24 = 0;
      }
      uint64_t v28 = _tokenWithParameters(v22, v23, v21, v24, 0);
      objc_msgSend__NWLinkConnectionForToken_(self, v29, (uint64_t)v28, v30);
      goto LABEL_15;
    }
    unint64_t v26 = 9;
  }
LABEL_39:

  return v26;
}

- (id)connectionInfoForLocalAddress:(const sockaddr *)a3 remoteAddress:(const sockaddr *)a4 clientUniquePID:(unint64_t)a5 sessionID:(id)a6 type:(unint64_t)a7 isRelay:(BOOL)a8 isCellular:(BOOL)a9
{
  BOOL v9 = a8;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v15 = a6;
  id v16 = objc_alloc_init(IDSNWConnectionInfo);
  nw_endpoint_t address = nw_endpoint_create_address(a3);
  nw_endpoint_t v18 = nw_endpoint_create_address(a4);
  nw_endpoint_t v19 = _tokenWithParameters(address, v18, v15, a7, 0);
  id v65 = self;
  nw_endpoint_t v22 = objc_msgSend__NWLinkConnectionForToken_(self, v20, (uint64_t)v19, v21);
  unint64_t v26 = v22;
  if (v22)
  {
    BOOL v27 = a7 - 7 < 4;
    uint64_t v28 = objc_msgSend_connectionID(v22, v23, v24, v25);
    objc_msgSend_setConnectionID_(v16, v29, v28, v30);
    objc_msgSend_setIsQUICPod_(v16, v31, v27, v32);
    objc_msgSend_setIsValid_(v16, v33, 1, v34);
    objc_msgSend_setIsCellular_(v16, v35, a9, v36);
    objc_msgSend_setClientUniquePID_(v16, v37, a5, v38);
    objc_msgSend_setSessionID_(v16, v39, (uint64_t)v15, v40);
    objc_msgSend_setToken_(v16, v41, (uint64_t)v19, v42);
    objc_msgSend_connection(v26, v43, v44, v45);
    double v64 = v18;
    uint64_t v47 = v46 = address;
    objc_msgSend_setConnection_(v16, v48, (uint64_t)v47, v49);

    isQUICPod = objc_msgSend__copyChildConnectionIDFor_clientUniquePID_sessionID_isRelay_isCellular_isQUICPod_(v65, v50, (uint64_t)v26, v51, a5, v15, v9, a9, v27);
    objc_msgSend_setChildConnectionID_(v16, v53, (uint64_t)isQUICPod, v54);

    uint64_t v58 = objc_msgSend_protocolStackDescription(v26, v55, v56, v57);
    objc_msgSend_setProtocolStackDescription_(v16, v59, (uint64_t)v58, v60);

    nw_endpoint_t address = v46;
    nw_endpoint_t v18 = v64;
    uint64_t v61 = v16;
  }
  else
  {
    double v62 = objc_msgSend_IDSNWLink(IDSFoundationLog, v23, v24, v25);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v67 = v19;
      _os_log_impl(&dword_19D9BE000, v62, OS_LOG_TYPE_DEFAULT, "Did not find NWLinkConnection for token %@", buf, 0xCu);
    }

    uint64_t v61 = 0;
  }

  return v61;
}

- ($EF6EC642B48E9BFC073294F479749444)demuxPatternForQPodConnectionWithID:(unsigned int)a3 forNWLinkConnection:(id)a4
{
  unsigned int v8 = bswap32(a3);
  sub_19D9FFDB0(a4, 1, (uint64_t)"copyChildConnectionIDFor: adding demux rule with pattern: %02x%02x%02x%02x%02x (%08x)", (uint64_t)a4, v4, v5, v6, v7, 64);
  unint64_t v9 = (HIWORD(v8) << 24) | ((unint64_t)HIBYTE(v8) << 32) | (v8 << 8) & 0xFF0000 | (unint64_t)((v8 << 8) & 0xFF00) | 0xFFFFE00000000040;
  __int16 v10 = -1;
  *(_DWORD *)result.var0 = v9;
  result.var0[4] = BYTE4(v9);
  *(_WORD *)result.var1 = *(_WORD *)((char *)&v9 + 5);
  result.var1[2] = HIBYTE(v9);
  *(_WORD *)&result.var1[3] = v10;
  return result;
}

- (id)_copyChildConnectionIDFor:(id)a3 clientUniquePID:(unint64_t)a4 sessionID:(id)a5 isRelay:(BOOL)a6 isCellular:(BOOL)a7 isQUICPod:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  double v17 = v13;
  if (a4)
  {
    nw_endpoint_t v18 = objc_msgSend_localEndpoint(v13, v14, v15, v16);
    uint64_t v134 = objc_msgSend_remoteEndpoint(v17, v19, v20, v21);
    uint64_t v22 = _tokenForNWLinkConnection(v17);
    unint64_t v26 = objc_msgSend_IDSNWLink(IDSFoundationLog, v23, v24, v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_impl(&dword_19D9BE000, v26, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress token = %@", buf, 0xCu);
    }

    uint64_t v30 = objc_msgSend_connection(v17, v27, v28, v29);
    double v34 = (void *)v30;
    id v133 = (void *)v22;
    if (!v30)
    {
      id v35 = objc_msgSend_IDSNWLink(IDSFoundationLog, v31, v32, v33);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        size_t v48 = (void *)v134;
        *(void *)&buf[14] = v134;
        _os_log_impl(&dword_19D9BE000, v35, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress no QUIC or UDP connection found for %@ / %@", buf, 0x16u);
        uint64_t v47 = 0;
        goto LABEL_36;
      }
LABEL_35:
      uint64_t v47 = 0;
      size_t v48 = (void *)v134;
      goto LABEL_36;
    }
    nw_endpoint_t v132 = (void *)v30;
    id v35 = objc_msgSend__childConnectionEvaluatorForToken_(self, v31, v22, v33);
    uint64_t v39 = objc_msgSend_IDSNWLink(IDSFoundationLog, v36, v37, v38);
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
    if (v35)
    {
      if (v40)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v132;
        _os_log_impl(&dword_19D9BE000, v39, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress found existing parent connection: %@", buf, 0xCu);
      }

      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = 0;
      if (nw_path_evaluator_get_client_id())
      {
        id v44 = objc_alloc(MEMORY[0x1E4F29128]);
        uint64_t v47 = objc_msgSend_initWithUUIDBytes_(v44, v45, (uint64_t)buf, v46);
        size_t v48 = (void *)v134;
        double v34 = v132;
LABEL_36:

        goto LABEL_37;
      }
      double v72 = objc_msgSend_IDSNWLink(IDSFoundationLog, v41, v42, v43);
      double v34 = v132;
      if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      LOWORD(v137[0]) = 0;
      double v73 = "copyChildConnectionIDForLocalAddress: failed to get existing client id";
      uint64_t v74 = (uint8_t *)v137;
      double v75 = v72;
      uint32_t v76 = 2;
    }
    else
    {
      if (v40)
      {
        double v49 = "P2P";
        *(_DWORD *)buf = 136315650;
        if (v10) {
          double v49 = "QUIC";
        }
        *(void *)&uint8_t buf[4] = v49;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        __int16 v139 = 2112;
        uint64_t v140 = v134;
        _os_log_impl(&dword_19D9BE000, v39, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress %s connection found for %@ / %@", buf, 0x20u);
      }

      double v34 = v132;
      id v35 = nw_connection_copy_connected_path();
      if (v35)
      {
        if (nw_path_uses_nexus())
        {
          v137[0] = 0xAAAAAAAAAAAAAAAALL;
          v137[1] = 0xAAAAAAAAAAAAAAAALL;
          if (nw_path_get_client_id())
          {
            id v59 = objc_alloc(MEMORY[0x1E4F29128]);
            int v131 = objc_msgSend_initWithUUIDBytes_(v59, v60, (uint64_t)v137, v61);
            id v65 = objc_msgSend_IDSNWLink(IDSFoundationLog, v62, v63, v64);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v131;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v132;
              _os_log_impl(&dword_19D9BE000, v65, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress got %@ from %@", buf, 0x16u);
            }

            if (v8)
            {
              uint64_t v69 = objc_msgSend_quicPodParamaters(v17, v66, v67, v68);
              nw_parameters_t secure_udp = nw_parameters_copy(v69);
            }
            else
            {
              nw_parameters_t secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C88]);
            }
            double v34 = v132;
            memset(buf, 170, 16);
            objc_msgSend_getUUIDBytes_(v131, v70, (uint64_t)buf, v71);
            nw_parameters_set_parent_id();
            size_t v129 = objc_msgSend__findListenerWithLocalEndpoint_(self, v79, (uint64_t)v18, v80);
            if (v129)
            {
              uint64_t options = nw_demux_create_options();
              if (v8)
              {
                uint64_t v88 = options;
                uint64_t v89 = objc_msgSend_localQUICConnectionID(v17, v85, v86, v87);
                *(void *)&long long v136 = objc_msgSend_demuxPatternForQPodConnectionWithID_forNWLinkConnection_(self, v90, v89, v91, v17);
                WORD4(v136) = v92;
                nw_demux_options_add_pattern();
                double v93 = secure_udp;
                uint64_t v94 = v88;
              }
              else
              {
                uint64_t v94 = options;
                if (v10)
                {
                  nw_demux_options_add_pattern();
                  *(void *)&long long v136 = 0x8000000060;
                  *(void *)nw_endpoint_t v135 = 0x10000080000000F0;
                  nw_demux_options_add_pattern();
                  double v93 = secure_udp;
                }
                else
                {
                  double v93 = secure_udp;
                  nw_parameters_set_account_id();
                  LOBYTE(v136) = 0x80;
                  v135[0] = -64;
                  nw_demux_options_add_pattern();
                  nw_demux_options_add_pattern();
                }
                if (v9)
                {
                  sub_19D9FFDB0(v17, 1, (uint64_t)"copyChildConnectionIDFor: adding demux rule for baseband notification packets", v96, v97, v98, v99, v100, v127);
                  LODWORD(v136) = -272716322;
                  *(_DWORD *)nw_endpoint_t v135 = -1;
                  nw_demux_options_add_pattern();
                }
              }
              uint64_t v128 = v94;
              nw_parameters_set_channel_demux_options();
              nw_parameters_allow_sharing_port_with_listener_for_connection();
              uint64_t v101 = IDSRealTimeContext();
              nw_parameters_set_context();

              nw_parameters_set_delegated_unique_pid();
              if (!uuid_is_null(self->_clientUUID)) {
                nw_parameters_set_e_proc_uuid();
              }
              uint64_t v105 = objc_msgSend_IDSNWLink(IDSFoundationLog, v102, v103, v104);
              if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(v136) = 138412290;
                *(void *)((char *)&v136 + 4) = v131;
                _os_log_impl(&dword_19D9BE000, v105, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress: create evaluator with parent connection ID %@", (uint8_t *)&v136, 0xCu);
              }

              nw_endpoint_t v106 = nw_path_copy_effective_local_endpoint(v35);
              nw_endpoint_t v107 = v106;
              if (v106) {
                uint64_t v108 = v106;
              }
              else {
                uint64_t v108 = v18;
              }
              nw_parameters_set_local_endpoint(v93, v108);
              nw_endpoint_t v109 = nw_path_copy_effective_remote_endpoint(v35);
              evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
              if (evaluator_for_endpoint)
              {
                long long v136 = 0uLL;
                if (nw_path_evaluator_get_client_id())
                {
                  id v117 = objc_alloc(MEMORY[0x1E4F29128]);
                  uint64_t v47 = objc_msgSend_initWithUUIDBytes_(v117, v118, (uint64_t)&v136, v119);
                  objc_msgSend__addChildConnectionEvaluator_token_(self, v120, (uint64_t)evaluator_for_endpoint, v121, v133);
                  double v125 = objc_msgSend_IDSNWLink(IDSFoundationLog, v122, v123, v124);
                  if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)nw_endpoint_t v135 = 138412290;
                    *(void *)&v135[4] = v47;
                    _os_log_impl(&dword_19D9BE000, v125, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress: created child connection ID %@", v135, 0xCu);
                  }
                }
                else
                {
                  double v125 = objc_msgSend_IDSNWLink(IDSFoundationLog, v114, v115, v116);
                  if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)nw_endpoint_t v135 = 0;
                    _os_log_impl(&dword_19D9BE000, v125, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress: failed to get client id", v135, 2u);
                  }
                  uint64_t v47 = 0;
                }
                double v78 = v131;
              }
              else
              {
                double v126 = objc_msgSend_IDSNWLink(IDSFoundationLog, v110, v111, v113);
                if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v136) = 0;
                  _os_log_impl(&dword_19D9BE000, v126, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress: failed to create evaluator for", (uint8_t *)&v136, 2u);
                }

                uint64_t v47 = 0;
                double v78 = v131;
                double v34 = v132;
              }

              size_t v48 = (void *)v134;
            }
            else
            {
              uint64_t v95 = objc_msgSend_IDSNWLink(IDSFoundationLog, v81, v82, v83);
              uint64_t v128 = v95;
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(v136) = 138412290;
                *(void *)((char *)&v136 + 4) = v132;
                _os_log_impl(&dword_19D9BE000, v95, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress failed to find the listener for %@", (uint8_t *)&v136, 0xCu);
              }
              uint64_t v47 = 0;
              size_t v48 = (void *)v134;
              double v78 = v131;
            }
          }
          else
          {
            double v78 = objc_msgSend_IDSNWLink(IDSFoundationLog, v56, v57, v58);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v132;
              _os_log_impl(&dword_19D9BE000, v78, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress failed to get client id for %@", buf, 0xCu);
            }
            uint64_t v47 = 0;
            size_t v48 = (void *)v134;
          }

          goto LABEL_36;
        }
        double v72 = objc_msgSend_IDSNWLink(IDSFoundationLog, v53, v54, v55);
        if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_34;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v132;
        double v73 = "copyChildConnectionIDForLocalAddress this connection doesn't support nexus: %@";
      }
      else
      {
        double v72 = objc_msgSend_IDSNWLink(IDSFoundationLog, v50, v51, v52);
        if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
LABEL_34:

          goto LABEL_35;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v132;
        double v73 = "copyChildConnectionIDForLocalAddress failed to copy path for %@";
      }
      uint64_t v74 = buf;
      double v75 = v72;
      uint32_t v76 = 12;
    }
    _os_log_impl(&dword_19D9BE000, v75, OS_LOG_TYPE_DEFAULT, v73, v74, v76);
    goto LABEL_34;
  }
  nw_endpoint_t v18 = objc_msgSend_IDSNWLink(IDSFoundationLog, v14, v15, v16);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v18, OS_LOG_TYPE_DEFAULT, "copyChildConnectionIDForLocalAddress client uniquePID is 0 - skip for now", buf, 2u);
  }
  uint64_t v47 = 0;
LABEL_37:

  return v47;
}

- (void)removeChildConnectionEvaluatorForSessionID:(id)a3 localAddress:(const sockaddr *)a4 remoteAddress:(const sockaddr *)a5 isRelay:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  nw_endpoint_t address = nw_endpoint_create_address(a4);
  nw_endpoint_t v12 = nw_endpoint_create_address(a5);
  if (v6) {
    unint64_t v13 = 5;
  }
  else {
    unint64_t v13 = 0;
  }
  if (v6) {
    unint64_t v14 = 7;
  }
  else {
    unint64_t v14 = 9;
  }
  uint64_t v15 = _tokenWithParameters(address, v12, v10, v13, 0);
  double v16 = _tokenWithParameters(address, v12, v10, v14, 0);

  objc_msgSend__removeChildConnectionEvaluatorFortoken_(self, v17, (uint64_t)v15, v18);
  objc_msgSend__removeChildConnectionEvaluatorFortoken_(self, v19, (uint64_t)v16, v20);
  uint64_t v24 = objc_msgSend_IDSNWLink(IDSFoundationLog, v21, v22, v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    tokenToChildConnectionEvaluator = self->_tokenToChildConnectionEvaluator;
    int v26 = 138412802;
    BOOL v27 = v15;
    __int16 v28 = 2112;
    double v29 = v16;
    __int16 v30 = 2112;
    uint64_t v31 = tokenToChildConnectionEvaluator;
    _os_log_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_DEFAULT, "Removed Child Connection Evaluator for token:%@(%@), remaining Child Connection Evaluators:%@", (uint8_t *)&v26, 0x20u);
  }
}

- (BOOL)getEffectiveSourceAddress:(sockaddr_storage *)a3 fromSourceAddress:(const sockaddr *)a4 effectiveDestinationAddress:(sockaddr_storage *)a5 fromDestinationAddress:(const sockaddr *)a6 sessionID:(id)a7 isQRConnection:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v14 = a7;
  if (a4->sa_family == 2)
  {
    nw_endpoint_t address = nw_endpoint_create_address(a4);
    nw_endpoint_t v16 = nw_endpoint_create_address(a6);
    if (v8) {
      unint64_t v17 = 5;
    }
    else {
      unint64_t v17 = 0;
    }
    double v18 = _tokenWithParameters(address, v16, v14, v17, 0);
    double v21 = objc_msgSend__NWLinkConnectionForToken_(self, v19, (uint64_t)v18, v20);
    double v25 = v21;
    if (v21)
    {
      int v26 = objc_msgSend_connection(v21, v22, v23, v24);
      BOOL v27 = nw_connection_copy_connected_path();

      if (v27)
      {
        double v43 = v18;
        __int16 v28 = nw_path_copy_effective_local_endpoint(v27);
        nw_endpoint_t v29 = nw_path_copy_effective_remote_endpoint(v27);
        __int16 v30 = v29;
        if (v28)
        {
          if (v29)
          {
            __src = nw_endpoint_get_address(v28);
            uint64_t v31 = nw_endpoint_get_address(v30);
            if (__src)
            {
              if (v31)
              {
                uint64_t v32 = v31;
                memcpy(a3, __src, __src->sa_len);
                memcpy(a5, v32, v32->sa_len);
                BOOL v33 = 1;
                sub_19D9FFDB0(v25, 1, (uint64_t)"Found effective addresses: %@-%@ -> %@-%@", v34, v35, v36, v37, v38, (uint64_t)address);

                double v18 = v43;
LABEL_20:

                goto LABEL_21;
              }
            }
          }
        }

        double v18 = v43;
      }
    }
    uint64_t v39 = objc_msgSend_IDSNWLink(IDSFoundationLog, v22, v23, v24);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v40 = @"NO";
      *(_DWORD *)buf = 138413058;
      nw_endpoint_t v45 = address;
      __int16 v46 = 2112;
      if (v8) {
        BOOL v40 = @"YES";
      }
      nw_endpoint_t v47 = v16;
      __int16 v48 = 2112;
      id v49 = v14;
      __int16 v50 = 2112;
      uint64_t v51 = v40;
      _os_log_impl(&dword_19D9BE000, v39, OS_LOG_TYPE_DEFAULT, "Found no effective addresses: local %@, remote %@, sessionID %@, isQR %@", buf, 0x2Au);
    }

    BOOL v33 = 0;
    goto LABEL_20;
  }
  BOOL v33 = 0;
LABEL_21:

  return v33;
}

- (id)_createNewListenerWithLocalPort:(unsigned __int16 *)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v60 = v5;
  long long v61 = v5;
  long long v58 = v5;
  long long v59 = v5;
  long long v56 = v5;
  long long v57 = v5;
  *(_OWORD *)__str = v5;
  long long v55 = v5;
  snprintf(__str, 0x80uLL, "%u", *a3);
  nw_parameters_t secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C88]);
  nw_parameters_set_account_id();
  host = nw_endpoint_create_host("::", __str);
  nw_parameters_set_local_endpoint(secure_udp, host);

  if (!uuid_is_null(self->_clientUUID)) {
    nw_parameters_set_e_proc_uuid();
  }
  BOOL v8 = IDSRealTimeContext();
  nw_parameters_set_context();

  uint64_t options = (void *)nw_demux_create_options();
  char v53 = 0;
  id v10 = (void *)nw_demux_create_options();
  nw_demux_options_add_pattern();
  nw_demux_options_add_pattern();
  nw_parameters_set_channel_demux_options();
  nw_protocol_stack_t v11 = nw_parameters_copy_default_protocol_stack(secure_udp);
  nw_protocol_stack_append_application_protocol();
  uint64_t v37 = objc_msgSend_protocolStackDescriptionFor_(self, v12, (uint64_t)v11, v13);
  nw_endpoint_t v16 = nw_listener_create(secure_udp);
  if (v16)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_19DA06B74;
    handler[3] = &unk_1E59737E8;
    void handler[4] = self;
    id v52 = v37;
    nw_listener_set_new_connection_handler(v16, handler);
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    uint64_t v47 = 0;
    __int16 v48 = &v47;
    uint64_t v49 = 0x2020000000;
    char v50 = 0;
    uint64_t v44 = 0;
    v45[0] = &v44;
    v45[1] = 0x3032000000;
    v45[2] = sub_19DA02C84;
    v45[3] = sub_19DA02C94;
    id v46 = 0;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = sub_19DA0719C;
    v38[3] = &unk_1E5973810;
    nw_endpoint_t v19 = v16;
    double v43 = a3;
    uint64_t v39 = v19;
    id v41 = &v47;
    double v20 = v18;
    BOOL v40 = v20;
    uint64_t v42 = &v44;
    nw_listener_set_state_changed_handler(v19, v38);
    double v21 = NWLinkQueue();
    nw_listener_set_queue(v19, v21);

    nw_listener_start(v19);
    dispatch_time_t v22 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v20, v22);
    if (*((unsigned char *)v48 + 24))
    {
      if (!*a3)
      {
        int v26 = nw_listener_copy_local_endpoint();
        *a3 = nw_endpoint_get_port(v26);
      }
      BOOL v27 = v19;
    }
    else
    {
      uint64_t v35 = objc_msgSend_IDSNWLink(IDSFoundationLog, v23, v24, v25);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_19DB76DA0((uint64_t)v19, (uint64_t)v45, v35);
      }

      nw_listener_cancel(v19);
      BOOL v27 = 0;
    }

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v47, 8);
  }
  else
  {
    __int16 v28 = objc_msgSend_IDSNWLink(IDSFoundationLog, v14, v15, v17);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_19DB76D30((uint64_t)a3, v28, v29, v30, v31, v32, v33, v34);
    }

    BOOL v27 = 0;
  }

  return v27;
}

- (void)_createUDPConnectionForNWLinkConnection:(id)a3 readyHandler:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = _tokenForNWLinkConnection(v6);
  objc_msgSend_interfaceIndex(v6, v9, v10, v11);
  nw_endpoint_t v12 = (void *)nw_interface_create_with_index();
  sub_19D9FFDB0(v6, 1, (uint64_t)"connecting on if:%@(%u) for %@", v13, v14, v15, v16, v17, (uint64_t)v12);

  if ((IMGetDomainBoolForKey() & 1) != 0 || (IMGetDomainBoolForKeyWithDefaultValue() & 1) != 0 || self->_disableP2P)
  {
    nw_parameters_t secure_udp = objc_msgSend_IDSNWLink(IDSFoundationLog, v18, v19, v20);
    if (os_log_type_enabled(secure_udp, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      long long v56 = self;
      _os_log_impl(&dword_19D9BE000, secure_udp, OS_LOG_TYPE_DEFAULT, "<%p> _createUDPConnectionWithLocalEndpoint - disabled by forceQuickRelay or disableP2PLinks", buf, 0xCu);
    }
  }
  else
  {
    nw_parameters_t secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C88]);
    nw_parameters_set_account_id();
    dispatch_time_t v22 = nw_parameters_copy_default_protocol_stack(secure_udp);
    uint64_t options = nw_demux_create_options();
    buf[0] = 0;
    nw_demux_options_add_pattern();
    nw_protocol_stack_prepend_application_protocol(v22, options);
    int v26 = objc_msgSend_protocolStackDescriptionFor_(self, v24, (uint64_t)v22, v25);
    objc_msgSend_setProtocolStackDescription_(v6, v27, (uint64_t)v26, v28);

    if (objc_msgSend__setParameters_NWLinkConnection_sharePortWithListener_isTCP_(self, v29, (uint64_t)secure_udp, v30, v6, 1, 0))
    {
      uint64_t v34 = objc_msgSend_remoteEndpoint(v6, v31, v32, v33);
      uint64_t v35 = nw_connection_create(v34, secure_udp);

      if (v35)
      {
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = sub_19DA07718;
        handler[3] = &unk_1E5973838;
        id v41 = v6;
        id v51 = v41;
        id v52 = self;
        id v42 = v8;
        id v53 = v42;
        id v54 = v7;
        nw_connection_set_state_changed_handler(v35, handler);
        objc_msgSend_setName_(v41, v43, @"UDP connection", v44);
        objc_msgSend_setConnection_(v41, v45, (uint64_t)v35, v46);
        objc_msgSend__addUDPConnectionInProgress_token_(self, v47, (uint64_t)v41, v48, v42);
        uint64_t v49 = NWLinkQueue();
        nw_connection_set_queue(v35, v49);

        nw_connection_start(v35);
      }
      else
      {
        sub_19D9FFDB0(v6, 2, (uint64_t)"could NOT create UDP connection for %@", v36, v37, v38, v39, v40, (uint64_t)v8);
      }
    }
  }
}

- (void)_scheduleRetryConnectionIfNeeded:(id)a3 baseConnection:(id)a4 kind:(const char *)a5 retryIndex:(unsigned __int8)a6 retryBlock:(id)a7
{
  unsigned int v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v16 = a7;
  if (!v12)
  {
    id v23 = v13;
    sub_19D9FFDB0(v23, 1, (uint64_t)"_sheduleRetryConnectionIfNeeded(%s): connection could not be created", v35, v36, v37, v38, v39, (uint64_t)a5);
    goto LABEL_6;
  }
  if (objc_msgSend_hasFailed(v12, v14, v15, v17))
  {
    id v23 = v12;
    if (objc_msgSend_shouldTreatNextTryAsFirstTry(v23, v24, v25, v26))
    {
      sub_19D9FFDB0(v23, 1, (uint64_t)"_sheduleRetryConnectionIfNeeded(%s): treating as first try", v29, v30, v31, v32, v33, (uint64_t)a5);
      unsigned int v8 = 0;
      goto LABEL_7;
    }
LABEL_6:
    if (v8 > 4)
    {
      sub_19D9FFDB0(v23, 2, (uint64_t)"_sheduleRetryConnectionIfNeeded(%s): failed, and out of retries.", v29, v30, v31, v32, v33, (uint64_t)a5);
LABEL_12:

      goto LABEL_13;
    }
LABEL_7:
    if (objc_msgSend_isConnected(v13, v27, v28, v34))
    {
      double v45 = dbl_19DB9B490[v8];
      sub_19D9FFDB0(v23, 1, (uint64_t)"_sheduleRetryConnectionIfNeeded(%s): failed, but scheduling retry %d for %f seconds", v40, v41, v42, v43, v44, (uint64_t)a5);
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = sub_19DA07A2C;
      v46[3] = &unk_1E5973860;
      id v23 = v23;
      id v47 = v23;
      char v50 = a5;
      char v51 = v8;
      double v48 = self;
      id v49 = v16;
      IDSTransportThreadAddBlockAfter(v46, v45);
    }
    else
    {
      sub_19D9FFDB0(v23, 1, (uint64_t)"_sheduleRetryConnectionIfNeeded(%s): failed, and would retry, but base connection is disconnected", v40, v41, v42, v43, v44, (uint64_t)a5);
    }
    goto LABEL_12;
  }
  sub_19D9FFDB0(v12, 1, (uint64_t)"_sheduleRetryConnectionIfNeeded(%s): no need to retry: connection didn't fail", v18, v19, v20, v21, v22, (uint64_t)a5);
LABEL_13:
}

- (void)_createChannelDataConnectionForH2:(id)a3
{
}

- (void)_createChannelDataConnectionForH2:(id)a3 retryIndex:(unsigned __int8)a4
{
  id v6 = a3;
  if (objc_msgSend_hasDisconnected(v6, v7, v8, v9))
  {
    sub_19D9FFDB0(v6, 1, (uint64_t)"_createChannelDataConnectionForH2: base connection has disconnected. Not creating ChannelData connection.", v10, v11, v12, v13, v14, v20[0]);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_19DA07C8C;
    aBlock[3] = &unk_1E5973888;
    aBlock[4] = self;
    id v15 = v6;
    id v29 = v15;
    id v16 = _Block_copy(aBlock);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_19DA07C9C;
    v24[3] = &unk_1E59738D8;
    v24[4] = self;
    id v25 = v15;
    unsigned __int8 v27 = a4;
    id v26 = v16;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = (uint64_t)sub_19DA07F1C;
    v20[3] = (uint64_t)&unk_1E59738D8;
    v20[4] = (uint64_t)self;
    unsigned __int8 v23 = a4;
    id v21 = v25;
    id v22 = v26;
    id v17 = v26;
    objc_msgSend__peelOffQUICConnection_type_readyHandler_cancelHandler_(self, v18, (uint64_t)v21, v19, 2, v24, v20);
  }
}

- (void)_tryReadH2Header:(id)a3
{
  id v4 = a3;
  sub_19D9FFDB0(v4, 1, (uint64_t)"_tryReadH2Header...", v5, v6, v7, v8, v9, v16);
  uint64_t v13 = objc_msgSend_connection(v4, v10, v11, v12);
  completion[0] = MEMORY[0x1E4F143A8];
  completion[1] = 3221225472;
  completion[2] = sub_19DA08060;
  completion[3] = &unk_1E5973928;
  completion[4] = self;
  id v18 = v4;
  id v19 = v13;
  uint64_t v14 = v13;
  id v15 = v4;
  nw_connection_receive(v14, 0, 0, completion);
}

- (BOOL)_createChannelDataConnection:(id)a3
{
  return ((uint64_t (*)(IDSNWLink *, char *, id))MEMORY[0x1F4181798])(self, sel__createChannelDataConnection_retryIndex_, a3);
}

- (BOOL)_createChannelDataConnection:(id)a3 retryIndex:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  if (objc_msgSend_hasDisconnected(v6, v7, v8, v9))
  {
    sub_19D9FFDB0(v6, 1, (uint64_t)"_createChannelDataConnection: base connection has disconnected. Not creating ChannelData connection.", v10, v11, v12, v13, v14, v78);
    BOOL v15 = 0;
  }
  else
  {
    unsigned int v81 = v4;
    uint64_t v16 = [NWLinkConnection alloc];
    id v19 = objc_msgSend_initWithBaseNWLinkConnection_type_(v16, v17, (uint64_t)v6, v18, 1);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_19DA0878C;
    aBlock[3] = &unk_1E5973888;
    aBlock[4] = self;
    id v20 = v6;
    id v98 = v20;
    id v21 = _Block_copy(aBlock);
    id v22 = _tokenForNWLinkConnection(v19);
    nw_parameters_t secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C88]);
    uint64_t v24 = nw_parameters_copy_default_protocol_stack(secure_udp);
    uint64_t options = nw_demux_create_options();
    char v96 = 96;
    char v95 = -16;
    char v94 = 0;
    char v93 = -64;
    int v92 = -272716322;
    int v91 = -1;
    nw_demux_options_add_pattern();
    nw_demux_options_add_pattern();
    nw_demux_options_add_pattern();
    nw_protocol_stack_prepend_application_protocol(v24, options);
    double v83 = v24;
    uint64_t v28 = objc_msgSend_protocolStackDescriptionFor_(self, v26, (uint64_t)v24, v27);
    objc_msgSend_setProtocolStackDescription_(v19, v29, (uint64_t)v28, v30);

    objc_msgSend__setParameters_NWLinkConnection_sharePortWithListener_isTCP_(self, v31, (uint64_t)secure_udp, v32, v19, 0, 0);
    uint64_t v36 = objc_msgSend_connection(v20, v33, v34, v35);
    uint64_t v37 = nw_connection_create_with_connection();

    if (v37 && !objc_msgSend__shouldFail(self, v38, v39, v40))
    {
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = sub_19DA0879C;
      handler[3] = &unk_1E5973950;
      id v49 = v19;
      id v85 = v49;
      uint64_t v86 = self;
      double v80 = v22;
      id v79 = v22;
      id v87 = v79;
      id v50 = v20;
      id v88 = v50;
      char v90 = v81;
      char v51 = v21;
      id v89 = v21;
      nw_connection_set_state_changed_handler(v37, handler);
      objc_msgSend_setParent_(v49, v52, (uint64_t)v50, v53);
      objc_msgSend_setConnection_(v49, v54, (uint64_t)v37, v55);
      objc_msgSend_setName_(v49, v56, @"Channel Data connection", v57);
      uint64_t v61 = objc_msgSend_connectionID(v50, v58, v59, v60);
      objc_msgSend_parent(v50, v62, v63, v64);
      id v65 = v82 = v51;
      objc_msgSend_connectionID(v65, v66, v67, v68);
      BOOL v15 = 1;
      sub_19D9FFDB0(v49, 1, (uint64_t)"peeled off [C%llu(C%llu)]", v69, v70, v71, v72, v73, v61);

      id v21 = v82;
      objc_msgSend__addNWLinkConnection_token_(self, v74, (uint64_t)v49, v75, v79);
      uint32_t v76 = NWLinkQueue();
      nw_connection_set_queue(v37, v76);

      id v22 = v80;
      nw_connection_start(v37);
    }
    else
    {
      uint64_t v41 = objc_msgSend_connectionID(v20, v38, v39, v40);
      sub_19D9FFDB0(v19, 2, (uint64_t)"couldn't create ChannelData connection from [C%llu] for %@", v42, v43, v44, v45, v46, v41);
      objc_msgSend__scheduleRetryConnectionIfNeeded_baseConnection_kind_retryIndex_retryBlock_(self, v47, 0, v48, v20, "CD", v81, v21);
      BOOL v15 = 0;
    }
  }
  return v15;
}

- (BOOL)_createReliableUnicastConnection:(id)a3 localQUICConnectionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [NWLinkConnection alloc];
  uint64_t v11 = objc_msgSend_initWithBaseNWLinkConnection_type_(v8, v9, (uint64_t)v6, v10, 3);
  uint64_t v12 = _tokenForNWLinkConnection(v11);
  nw_parameters_t secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C88]);
  uint64_t v14 = nw_parameters_copy_default_protocol_stack(secure_udp);
  uint64_t options = nw_demux_create_options();
  objc_msgSend_length(v7, v16, v17, v18);
  id v19 = v7;
  objc_msgSend_bytes(v19, v20, v21, v22);

  nw_demux_options_add_pattern();
  double v68 = v14;
  nw_protocol_stack_prepend_application_protocol(v14, options);
  uint64_t isH2Connection = objc_msgSend_isH2Connection(v6, v23, v24, v25);
  objc_msgSend__setParameters_NWLinkConnection_sharePortWithListener_isTCP_(self, v27, (uint64_t)secure_udp, v28, v11, 0, isH2Connection);
  double v32 = objc_msgSend_connection(v6, v29, v30, v31);
  uint64_t v33 = nw_connection_create_with_connection();

  if (v33)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_19DA08B48;
    handler[3] = &unk_1E59737C0;
    id v37 = v11;
    id v70 = v37;
    uint64_t v71 = self;
    uint64_t v38 = v12;
    id v39 = v12;
    id v72 = v39;
    nw_connection_set_state_changed_handler(v33, handler);
    objc_msgSend_setConnection_(v37, v40, (uint64_t)v33, v41);
    objc_msgSend_setName_(v37, v42, @"Reliable Unicast connection", v43);
    uint64_t v47 = objc_msgSend_connectionID(v37, v44, v45, v46);
    objc_msgSend_connectionID(v6, v48, v49, v50);
    sub_19D9FFDB0(v37, 1, (uint64_t)"peeled off RU [C%llu(%llu)]", v51, v52, v53, v54, v55, v47);
    objc_msgSend_setParent_(v37, v56, (uint64_t)v6, v57);
    objc_msgSend__addNWLinkConnection_token_(self, v58, (uint64_t)v37, v59, v39);
    double v60 = NWLinkQueue();
    nw_connection_set_queue(v33, v60);

    nw_connection_start(v33);
  }
  else
  {
    uint64_t v61 = objc_msgSend_connectionID(v6, v34, v35, v36);
    uint64_t v38 = v12;
    sub_19D9FFDB0(v11, 2, (uint64_t)"couldn't create reliable unicast connection from [C%llu] for %@", v62, v63, v64, v65, v66, v61);
  }

  return v33 != 0;
}

- (void)_failNWLinkConnection:(id)a3
{
  id v23 = a3;
  uint64_t v7 = objc_msgSend_state(v23, v4, v5, v6);
  double v9 = v23;
  if (v7 != 4)
  {
    objc_msgSend__cancelNWLinkConnection_remove_(self, (const char *)v23, (uint64_t)v23, v8, 0);
    objc_msgSend_setState_(v23, v10, 4, v11);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v13 = NSString;
    unint64_t v17 = objc_msgSend_type(v23, v14, v15, v16);
    if (v17 > 0xA) {
      objc_msgSend_stringWithCString_encoding_(v13, v18, (uint64_t)"??", v19, 4);
    }
    else {
    id v20 = objc_msgSend_stringWithCString_encoding_(v13, v18, (uint64_t)off_1E5973C08[v17], v19, 4);
    }
    objc_msgSend_link_didFailConnectionOfType_(WeakRetained, v21, (uint64_t)self, v22, v20);

    double v9 = v23;
  }
}

- (void)_cancelNWLinkConnection:(id)a3 remove:(BOOL)a4
{
  BOOL v4 = a4;
  id v27 = a3;
  double v6 = _tokenForNWLinkConnection(v27);
  sub_19D9FFDB0(v27, 1, (uint64_t)"_cancelNWLinkConnectionWithToken: disconnecting %@", v7, v8, v9, v10, v11, (uint64_t)v6);
  if (objc_msgSend_state(v27, v12, v13, v14) != 3 && objc_msgSend_state(v27, v15, v16, v17) != 4)
  {
    uint64_t v21 = objc_msgSend_connection(v27, v18, v19, v20);
    nw_connection_cancel(v21);

    objc_msgSend_setState_(v27, v22, 3, v23);
    if (v4)
    {
      uint64_t v24 = _tokenForNWLinkConnection(v27);
      objc_msgSend__removeNWLinkConnection_token_(self, v25, (uint64_t)v27, v26, v24);
    }
  }
}

- (void)_createIndicationConnection:(id)a3
{
}

- (void)_createIndicationConnection:(id)a3 retryIndex:(unsigned __int8)a4
{
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_19DA08FC0;
  aBlock[3] = &unk_1E5973888;
  aBlock[4] = self;
  id v7 = v6;
  id v25 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_19DA08FD0;
  v20[3] = &unk_1E59738D8;
  v20[4] = self;
  id v9 = v7;
  id v21 = v9;
  unsigned __int8 v23 = a4;
  id v10 = v8;
  id v22 = v10;
  uint64_t v11 = _Block_copy(v20);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_19DA0954C;
  v16[3] = &unk_1E59738D8;
  v16[4] = self;
  id v17 = v9;
  unsigned __int8 v19 = a4;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  objc_msgSend__peelOffQUICConnection_type_readyHandler_cancelHandler_(self, v14, (uint64_t)v13, v15, 4, v11, v16);
}

- (void)_peelOffQUICConnection:(id)a3 type:(unint64_t)a4 readyHandler:(id)a5
{
  objc_msgSend__peelOffQUICConnection_type_readyHandler_cancelHandler_(self, a2, (uint64_t)a3, v5, a4, a5, 0);
}

- (void)_peelOffQUICConnection:(id)a3 type:(unint64_t)a4 readyHandler:(id)a5 cancelHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_19DA097D8;
  aBlock[3] = &unk_1E59739C8;
  unint64_t v58 = a4;
  id v13 = v10;
  id v54 = v13;
  uint64_t v55 = self;
  id v14 = v11;
  id v56 = v14;
  id v15 = v12;
  id v57 = v15;
  uint64_t v16 = _Block_copy(aBlock);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int isConnected = objc_msgSend_isConnected(v13, v18, v19, v20);
  id v27 = @"NO";
  if (isConnected) {
    id v27 = @"YES";
  }
  sub_19D9FFDB0(v13, 1, (uint64_t)"peeling off; isConnected: %@", v22, v23, v24, v25, v26, (uint64_t)v27);
  if (objc_msgSend_isConnected(v13, v28, v29, v30))
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = sub_19DA09C24;
    v50[3] = &unk_1E5973590;
    id v52 = v16;
    id v51 = v13;
    IDSTransportThreadAddBlock(v50);

    double v36 = v52;
  }
  else
  {
    sub_19D9FFDB0(v13, 1, (uint64_t)"not peeling off yet: not connected", v31, v32, v33, v34, v35, v49);
    double v36 = _tokenForNWLinkConnection(v13);
    id v39 = objc_msgSend_objectForKeyedSubscript_(self->_queuedPeelOffs, v37, (uint64_t)v36, v38);

    if (!v39)
    {
      id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_msgSend_setObject_forKeyedSubscript_(self->_queuedPeelOffs, v43, (uint64_t)v42, v44, v36);
    }
    uint64_t v45 = objc_msgSend_objectForKeyedSubscript_(self->_queuedPeelOffs, v40, (uint64_t)v36, v41);
    double v46 = _Block_copy(v16);
    objc_msgSend_addObject_(v45, v47, (uint64_t)v46, v48);
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)_findNewLocalEndpointForQRConnection:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  BOOL v4 = a3;
  int port = nw_endpoint_get_port(v4);
  unsigned __int16 v8 = 1;
  do
  {
    unsigned __int16 v20 = v8 + port;
    uint64_t v9 = objc_msgSend__createNewListenerWithLocalPort_(self, v5, (uint64_t)&v20, v7);
    if (v9)
    {
      id v12 = v9;
      goto LABEL_9;
    }
    unsigned int v10 = v8++;
  }
  while (v10 <= 8);
  unsigned __int16 v20 = 0;
  id v12 = objc_msgSend__createNewListenerWithLocalPort_(self, v5, (uint64_t)&v20, v7);
  if (!v12)
  {
    id v12 = objc_msgSend_IDSNWLink(IDSFoundationLog, v5, v11, v7);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = port + 1;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = port + 9;
      _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "failed to create an extra listener for ports [%u-%u] and 0", buf, 0xEu);
    }
    nw_endpoint_t address = 0;
    goto LABEL_12;
  }
LABEL_9:
  objc_msgSend__addExtraListener_port_isCellular_(self, v5, (uint64_t)v12, v7, v20, port == self->_cellularPort);
  nw_endpoint_get_address(v4);
  *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v32 = v14;
  long long v30 = v14;
  long long v31 = v14;
  long long v28 = v14;
  long long v29 = v14;
  long long v26 = v14;
  long long v27 = v14;
  *(_OWORD *)buf = v14;
  __memcpy_chk();
  SASetPort((uint64_t)buf, v20);
  nw_endpoint_t address = nw_endpoint_create_address((const sockaddr *)buf);
  id v18 = objc_msgSend_IDSNWLink(IDSFoundationLog, v15, v16, v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v21 = 67109376;
    int v22 = port;
    __int16 v23 = 1024;
    int v24 = v20;
    _os_log_impl(&dword_19D9BE000, v18, OS_LOG_TYPE_DEFAULT, "replacing local port %u with new local port %u", v21, 0xEu);
  }

LABEL_12:
  return address;
}

- (id)_createP2PQUICPodConnectionWithType:(unsigned int)a3 udpNWLinkConnection:(id)a4 clientQUICConnectionID:(id)a5 serverQUICConnectionID:(id)a6 clientQUICConnectionIDNumber:(unsigned int)a7 clientSecret:(id)a8 serverSecret:(id)a9 isServer:(BOOL)a10 completionHandler:(id)a11
{
  uint64_t v12 = *(void *)&a7;
  uint64_t v15 = *(void *)&a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v130 = a8;
  id v19 = a9;
  uint64_t v25 = (void (**)(id, void))a11;
  if (v15)
  {
    if (v15 != 1)
    {
      sub_19D9FFDB0(v16, 2, (uint64_t)"Unexpected P2P TLE connection type %u", v20, v21, v22, v23, v24, v15);
      v25[2](v25, 0);
      id v48 = 0;
      uint64_t v49 = v18;
      goto LABEL_20;
    }
    uint64_t v128 = v19;
    double v124 = "IDS";
    uint64_t v26 = 10;
  }
  else
  {
    uint64_t v128 = v19;
    double v124 = "AVC";
    uint64_t v26 = 9;
  }
  char v156 = 64;
  unsigned int v157 = bswap32(v12);
  uint64_t v120 = HIBYTE(v157);
  uint64_t v118 = BYTE1(v157);
  uint64_t v119 = BYTE2(v157);
  uint64_t v117 = v157;
  sub_19D9FFDB0(v16, 1, (uint64_t)"_createQUICPodConnectionWithType: adding demux rule with pattern: %02x%02x%02x%02x%02x (%08x)", v20, v21, v22, v23, v24, 64);
  char v155 = -1;
  int v154 = -32;
  long long v30 = objc_msgSend_connection(v16, v27, v28, v29);
  long long v31 = [NWLinkConnection alloc];
  uint64_t v34 = objc_msgSend_initWithBaseNWLinkConnection_type_(v31, v32, (uint64_t)v16, v33, v26);
  uint64_t v35 = _tokenForNWLinkConnection(v34);
  double v38 = objc_msgSend__NWLinkConnectionForToken_(self, v36, (uint64_t)v35, v37);
  id v42 = v38;
  if (!v38 || !objc_msgSend_isConnected(v38, v39, v40, v41))
  {
    double v126 = v35;
    uint64_t v127 = v30;
    uint64_t v150 = 0;
    uint64_t v151 = &v150;
    uint64_t v152 = 0x2020000000;
    char v153 = 0;
    uint64_t v139 = MEMORY[0x1E4F143A8];
    uint64_t v140 = 3221225472;
    uint64_t v141 = sub_19DA0A4A4;
    id v142 = &unk_1E59739F0;
    double v148 = &v150;
    id v143 = v130;
    id v144 = v128;
    BOOL v149 = a10;
    id v50 = v34;
    id v145 = v50;
    id v146 = v17;
    uint64_t v49 = v18;
    id v147 = v18;
    qpod = nw_parameters_create_qpod();
    nw_parameters_set_account_id();
    if (*((unsigned char *)v151 + 24))
    {
      if (qpod)
      {
        nw_protocol_stack_t v122 = nw_parameters_copy_default_protocol_stack(qpod);
        uint64_t options = (void *)nw_demux_create_options();
        nw_demux_options_add_pattern();
        nw_protocol_stack_append_application_protocol();
        double v59 = objc_msgSend_protocolStackDescriptionFor_(self, v57, (uint64_t)v122, v58);
        objc_msgSend_setProtocolStackDescription_(v50, v60, (uint64_t)v59, v61);

        objc_msgSend__setParameters_NWLinkConnection_sharePortWithListener_isTCP_(self, v62, (uint64_t)qpod, v63, v50, 0, 0);
        sub_19D9FFDB0(v16, 1, (uint64_t)"creating QUICPod connection with connection", v64, v65, v66, v67, v68, v116);
        connection = nw_connection_create_with_connection();
        if (connection)
        {
          objc_msgSend_setQuicPodParamaters_(v50, v69, (uint64_t)qpod, v70);
          objc_msgSend_setIsQUICPod_(v50, v71, 1, v72);
          v137[0] = 0;
          v137[1] = v137;
          void v137[2] = 0x2020000000;
          char v138 = 0;
          handler[0] = MEMORY[0x1E4F143A8];
          handler[1] = 3221225472;
          handler[2] = sub_19DA0A548;
          handler[3] = &unk_1E5973A18;
          long long v136 = v137;
          nw_endpoint_t v135 = v25;
          id v73 = v50;
          id v132 = v73;
          id v133 = self;
          id v121 = v126;
          id v134 = v121;
          nw_connection_set_state_changed_handler(connection, handler);
          objc_msgSend_setParent_(v73, v74, (uint64_t)v16, v75);
          objc_msgSend_setConnection_(v73, v76, (uint64_t)connection, v77);
          double v80 = objc_msgSend_stringWithFormat_(NSString, v78, @"%s qpod connection", v79, v124, v117, v118, v119, v120, v12);
          objc_msgSend_setName_(v73, v81, (uint64_t)v80, v82);

          objc_msgSend_setLocalQUICConnectionID_(v73, v83, v12, v84);
          sub_19D9FFDB0(v73, 1, (uint64_t)"QUICPod local QUIC connection ID: %lu", v85, v86, v87, v88, v89, v12);
          uint64_t v93 = objc_msgSend_connectionID(v73, v90, v91, v92);
          objc_msgSend_connectionID(v16, v94, v95, v96);
          sub_19D9FFDB0(v73, 1, (uint64_t)"QUICPod peeled off [C%llu(C%llu)]", v97, v98, v99, v100, v101, v93);
          objc_msgSend__addNWLinkConnection_token_(self, v102, (uint64_t)v73, v103, v121);
          double v104 = NWLinkQueue();
          nw_connection_set_queue(connection, v104);

          nw_connection_start(connection);
          id v48 = v73;

          _Block_object_dispose(v137, 8);
        }
        else
        {
          v25[2](v25, 0);
          uint64_t v109 = objc_msgSend_connectionID(v16, v106, v107, v108);
          sub_19D9FFDB0(v50, 2, (uint64_t)"couldn't create QUICPod connection from [C%llu] for %@", v110, v111, v112, v113, v114, v109);
          id v48 = 0;
        }

        goto LABEL_18;
      }
      uint64_t v105 = "nw_parameters_create_qpod failed";
    }
    else
    {
      uint64_t v105 = "nw_qpod_setup_secrets failed";
    }
    sub_19D9FFDB0(v50, 2, (uint64_t)v105, v52, v53, v54, v55, v56, v116);
    v25[2](v25, 0);
    id v48 = 0;
LABEL_18:
    long long v30 = v127;

    _Block_object_dispose(&v150, 8);
    uint64_t v35 = v126;
    goto LABEL_19;
  }
  sub_19D9FFDB0(v42, 1, (uint64_t)"not setting up new P2P QUICPod connection because one already exists for token %@", v43, v44, v45, v46, v47, (uint64_t)v35);
  v25[2](v25, 1);
  id v48 = v42;
  uint64_t v49 = v18;
LABEL_19:

  id v19 = v128;
LABEL_20:

  return v48;
}

- (id)_createQUICPodConnectionWithType:(unsigned int)a3 quicNWLinkConnection:(id)a4 clientQUICConnectionID:(id)a5 clientQUICConnectionIDAsNumber:(unsigned int)a6 serverQUICConnectionID:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  id v13 = a5;
  id v19 = a7;
  if (v10)
  {
    if (v10 != 1)
    {
      sub_19D9FFDB0(v12, 2, (uint64_t)"Unexpected TLE connection type %u", v14, v15, v16, v17, v18, v10);
      id v81 = 0;
      goto LABEL_16;
    }
    uint64_t v20 = "IDS";
    uint64_t v21 = 8;
  }
  else
  {
    uint64_t v20 = "AVC";
    uint64_t v21 = 7;
  }
  char v122 = 64;
  unsigned int v123 = bswap32(v8);
  uint64_t v94 = HIBYTE(v123);
  uint64_t v92 = BYTE1(v123);
  uint64_t v93 = BYTE2(v123);
  uint64_t v91 = v123;
  sub_19D9FFDB0(v12, 1, (uint64_t)"_createQUICPodConnectionWithType: adding demux rule with pattern: %02x%02x%02x%02x%02x (%08x)", v14, v15, v16, v17, v18, 64);
  char v121 = -1;
  int v120 = -32;
  uint64_t v25 = objc_msgSend_connection(v12, v22, v23, v24);
  uint64_t v26 = nw_protocol_copy_quic_connection_definition();
  uint64_t v101 = v25;
  nw_protocol_metadata_t v27 = nw_connection_copy_protocol_metadata(v25, v26);

  uint64_t v28 = [NWLinkConnection alloc];
  long long v31 = objc_msgSend_initWithBaseNWLinkConnection_type_(v28, v29, (uint64_t)v12, v30, v21);
  uint64_t v100 = _tokenForNWLinkConnection(v31);
  uint64_t v116 = 0;
  uint64_t v117 = &v116;
  uint64_t v118 = 0x2020000000;
  char v119 = 0;
  uint64_t v106 = MEMORY[0x1E4F143A8];
  uint64_t v107 = 3221225472;
  double v108 = sub_19DA0ABC0;
  uint64_t v109 = &unk_1E5973A40;
  uint64_t v114 = &v116;
  long long v32 = v27;
  uint64_t v110 = v32;
  uint64_t v115 = v20;
  id v33 = v31;
  id v111 = v33;
  id v99 = v13;
  id v112 = v13;
  id v113 = v19;
  qpod = nw_parameters_create_qpod();
  uint64_t v40 = qpod;
  if (*((unsigned char *)v117 + 24))
  {
    if (qpod)
    {
      nw_protocol_stack_t v97 = nw_parameters_copy_default_protocol_stack(qpod);
      uint64_t options = (void *)nw_demux_create_options();
      nw_demux_options_add_pattern();
      nw_protocol_stack_append_application_protocol();
      uint64_t v43 = objc_msgSend_protocolStackDescriptionFor_(self, v41, (uint64_t)v97, v42);
      objc_msgSend_setProtocolStackDescription_(v33, v44, (uint64_t)v43, v45);

      objc_msgSend__setParameters_NWLinkConnection_sharePortWithListener_isTCP_(self, v46, (uint64_t)v40, v47, v33, 0, 0);
      double v96 = self;
      id v50 = nw_connection_create_with_connection();
      if (v50)
      {
        objc_msgSend_setQuicPodParamaters_(v33, v48, (uint64_t)v40, v51);
        objc_msgSend_setIsQUICPod_(v33, v52, 1, v53);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = sub_19DA0AC64;
        handler[3] = &unk_1E59737C0;
        id v54 = v33;
        id v103 = v54;
        double v104 = v96;
        id v95 = v100;
        id v105 = v95;
        nw_connection_set_state_changed_handler(v50, handler);
        objc_msgSend_setConnection_(v54, v55, (uint64_t)v50, v56);
        double v59 = objc_msgSend_stringWithFormat_(NSString, v57, @"%s qpod connection", v58, v20, v91, v92, v93, v94, v8);
        objc_msgSend_setName_(v54, v60, (uint64_t)v59, v61);

        objc_msgSend_setParent_(v54, v62, (uint64_t)v12, v63);
        objc_msgSend_setLocalQUICConnectionID_(v54, v64, v8, v65);
        uint64_t v69 = objc_msgSend_connectionID(v54, v66, v67, v68);
        objc_msgSend_connectionID(v12, v70, v71, v72);
        sub_19D9FFDB0(v54, 1, (uint64_t)"QUICPod peeled off [C%llu(C%llu)]", v73, v74, v75, v76, v77, v69);
        objc_msgSend__addNWLinkConnection_token_(v96, v78, (uint64_t)v54, v79, v95);
        double v80 = NWLinkQueue();
        nw_connection_set_queue(v50, v80);

        nw_connection_start(v50);
        id v81 = v54;
      }
      else
      {
        uint64_t v83 = objc_msgSend_connectionID(v12, v48, v49, v51);
        sub_19D9FFDB0(v33, 2, (uint64_t)"couldn't create QUICPod connection from [C%llu] for %@", v84, v85, v86, v87, v88, v83);
        id v81 = 0;
      }

      goto LABEL_15;
    }
    double v82 = "nw_parameters_create_qpod failed";
  }
  else
  {
    double v82 = "nw_qpod_setup_secrets failed";
  }
  sub_19D9FFDB0(v33, 2, (uint64_t)v82, v35, v36, v37, v38, v39, v90);
  id v81 = 0;
LABEL_15:

  _Block_object_dispose(&v116, 8);
  id v13 = v99;
LABEL_16:

  return v81;
}

- (unint64_t)_sendData:(id)a3 withPacketBuffer:(id *)a4 NWLinkConnection:(id)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = a3;
  id v9 = a5;
  if (objc_msgSend_type(v9, v10, v11, v12) == 4
    || objc_msgSend_type(v9, v13, v14, v15) == 5
    || objc_msgSend_type(v9, v13, v14, v15) == 6)
  {
    int v16 = objc_msgSend_peelOffNewConnection(v9, v13, v14, v15);
    int var33 = a4->var33;
    unint64_t var31 = a4->var31;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_19DA0B1B0;
    aBlock[3] = &unk_1E5973A68;
    int v68 = var33;
    unint64_t v67 = var31;
    uint64_t v64 = v8;
    id v19 = v9;
    id v65 = v19;
    uint64_t v66 = self;
    uint64_t v21 = (void (**)(void *, id))_Block_copy(aBlock);
    if (v16)
    {
      objc_msgSend__peelOffQUICConnection_type_readyHandler_(self, v20, (uint64_t)v19, v22, 6, v21);
    }
    else
    {
      objc_msgSend_setPeelOffNewConnection_(v19, v20, 1, v22);
      v21[2](v21, v19);
    }

    uint64_t v23 = v64;
    goto LABEL_8;
  }
  uint64_t v23 = (id)*MEMORY[0x1E4F38C58];
  int is_null = uuid_is_null(a4->var29);
  if ((objc_msgSend_isH2Connection(v9, v26, v27, v28) & 1) == 0)
  {
    if (is_null)
    {
      if (!a4->var30 && !a4->var21)
      {
LABEL_24:
        uint64_t v44 = objc_msgSend_connection(v9, v29, v30, v36);
        completion[0] = MEMORY[0x1E4F143A8];
        completion[1] = 3221225472;
        completion[2] = sub_19DA0B4AC;
        completion[3] = &unk_1E5973A90;
        id v61 = v9;
        uint64_t v62 = self;
        nw_connection_send(v44, v8, v23, 1, completion);

        goto LABEL_8;
      }
      nw_content_context_t v39 = nw_content_context_create("NWLink packet metadata");

      uint64_t v23 = v39;
    }
    else
    {
      nw_content_context_t v40 = nw_content_context_create("NWLink packet metadata");

      nw_content_context_set_packet_id();
      uint64_t v23 = v40;
    }
    uint64_t var30 = a4->var30;
    if (var30) {
      nw_content_context_set_expiration_milliseconds(v23, var30);
    }
    double v42 = _nwProtocolMetaDataForTrafficClass(a4->var21);
    uint64_t v43 = v42;
    if (v42)
    {
      nw_ip_metadata_set_ecn_flag(v42, (nw_ip_ecn_flag_t)(a4->var22 & 3));
      nw_content_context_set_metadata_for_protocol(v23, v43);
    }

    goto LABEL_24;
  }
  sub_19D9FFDB0(v9, 3, (uint64_t)"_sendData: h2 sending", v31, v32, v33, v34, v35, v55);
  int v71 = -1431655766;
  unint64_t v70 = 0xAAAAAAAAAAAAAAAALL;
  int buffer = -1523056768;
  unint64_t size = dispatch_data_get_size(v8);
  if (size >= 0x40)
  {
    if (size >> 14)
    {
      if (size >> 30)
      {
        if (size >> 62) {
          abort();
        }
        unint64_t size = bswap64(size | 0xC000000000000000);
        int v38 = 8;
      }
      else
      {
        unint64_t size = bswap32(size | 0x80000000);
        int v38 = 4;
      }
    }
    else
    {
      unint64_t size = bswap32(size | 0x4000) >> 16;
      int v38 = 2;
    }
  }
  else
  {
    int v38 = 1;
  }
  unint64_t v59 = size;
  __memcpy_chk();
  double v45 = dispatch_data_create(&buffer, (v38 + 4), 0, 0);
  dispatch_data_t concat = dispatch_data_create_concat(v45, v8);
  id v50 = objc_msgSend_connection(v9, v47, v48, v49);
  id v54 = objc_msgSend_contentContext(v9, v51, v52, v53);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = sub_19DA0B508;
  v56[3] = &unk_1E5973A90;
  id v57 = v9;
  double v58 = self;
  nw_connection_send(v50, concat, v54, 0, v56);

LABEL_8:
  return 0;
}

- (void)_handleIncomingMessage:(id)a3 keepWaiting:(BOOL)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_connection(v6, v7, v8, v9);
  BOOL v17 = objc_msgSend_type(v6, v11, v12, v13) == 4
     || objc_msgSend_type(v6, v14, v15, v16) == 5
     || objc_msgSend_type(v6, v14, v15, v16) == 6;
  int v18 = objc_msgSend_messageType(v6, v14, v15, v16);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_19DA0B734;
  aBlock[3] = &unk_1E5973B08;
  id v19 = v6;
  int v43 = v18;
  id v41 = v19;
  double v42 = self;
  BOOL v44 = v17;
  BOOL v45 = a4;
  uint64_t v20 = _Block_copy(aBlock);
  if (!objc_msgSend_isH2Connection(v19, v21, v22, v23) || v17)
  {
    sub_19D9FFDB0(v19, 3, (uint64_t)"calling nw_connection_receive_message on %@", v26, v27, v28, v29, v30, (uint64_t)v10);
    nw_connection_receive_message(v10, v20);
  }
  else
  {
    uint64_t v32 = objc_msgSend_capsuleParser(v19, v24, v25, v31);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = sub_19DA0C23C;
    v35[3] = &unk_1E5973B30;
    id v36 = v19;
    uint64_t v37 = self;
    BOOL v39 = a4;
    id v38 = v20;
    objc_msgSend_readCapsuleWithCompletionHandler_(v32, v33, (uint64_t)v35, v34);
  }
}

- (void)_handleIncomingIndicationMessage:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_connection(v4, v5, v6, v7);
  completion[0] = MEMORY[0x1E4F143A8];
  completion[1] = 3221225472;
  completion[2] = sub_19DA0C3A4;
  completion[3] = &unk_1E5973928;
  id v12 = v4;
  double v13 = self;
  id v14 = v8;
  double v9 = v8;
  id v10 = v4;
  nw_connection_receive(v9, 4u, 4u, completion);
}

- (id)protocolStackDescriptionFor:(id)a3
{
  id v3 = a3;
  id v4 = nw_protocol_stack_copy_internet_protocol(v3);
  double v5 = nw_protocol_stack_copy_transport_protocol(v3);
  uint64_t v6 = NSString;
  double v7 = sub_19DA0C848(v4);
  uint64_t v8 = sub_19DA0C848(v5);
  uint64_t v11 = objc_msgSend_stringWithFormat_(v6, v9, @"%@.%@", v10, v7, v8);

  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_19DA02C84;
  uint64_t v21 = sub_19DA02C94;
  uint64_t v22 = &stru_1EEFDAD58;
  iterate_block[0] = MEMORY[0x1E4F143A8];
  iterate_block[1] = 3221225472;
  iterate_block[2] = sub_19DA0CA40;
  iterate_block[3] = &unk_1E5973B80;
  iterate_block[4] = &v17;
  nw_protocol_stack_iterate_application_protocols(v3, iterate_block);
  id v14 = objc_msgSend_stringByAppendingString_(v11, v12, v18[5], v13);
  _Block_object_dispose(&v17, 8);

  return v14;
}

- (BOOL)_setParameters:(id)a3 NWLinkConnection:(id)a4 sharePortWithListener:(BOOL)a5 isTCP:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  double v10 = a3;
  id v11 = a4;
  uint64_t v20 = objc_msgSend_localEndpoint(v11, v12, v13, v14);
  uint64_t v21 = @"NO";
  if (v7) {
    uint64_t v21 = @"YES";
  }
  sub_19D9FFDB0(v11, 1, (uint64_t)"_setParameters, sharePortWithListener: %@", v15, v16, v17, v18, v19, (uint64_t)v21);
  int v25 = objc_msgSend_supportsNAT64(v11, v22, v23, v24);
  if (v6)
  {
    if (!v25)
    {
      host = objc_msgSend_cachedH2LocalEndpoint(v11, v26, v27, v28);
      goto LABEL_10;
    }
    *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v75 = v29;
    long long v76 = v29;
    long long v73 = v29;
    long long v74 = v29;
    long long v71 = v29;
    long long v72 = v29;
    *(_OWORD *)__str = v29;
    long long v70 = v29;
    uint64_t v30 = objc_msgSend_cachedH2LocalEndpoint(v11, v26, v27, -3.72066208e-103);
    int port = nw_endpoint_get_port(v30);
    snprintf(__str, 0x80uLL, "%u", port);

LABEL_8:
    host = nw_endpoint_create_host("::", __str);
LABEL_10:
    uint64_t v35 = host;
    nw_parameters_set_local_endpoint(v10, host);

    goto LABEL_12;
  }
  if (v25)
  {
    *(void *)&long long v32 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v75 = v32;
    long long v76 = v32;
    long long v73 = v32;
    long long v74 = v32;
    long long v71 = v32;
    long long v72 = v32;
    *(_OWORD *)__str = v32;
    long long v70 = v32;
    int v33 = nw_endpoint_get_port(v20);
    snprintf(__str, 0x80uLL, "%u", v33);
    goto LABEL_8;
  }
  nw_parameters_set_local_endpoint(v10, v20);
LABEL_12:
  if (objc_msgSend_hasRequiredInterface(v11, v36, v37, v38))
  {
    objc_msgSend_interfaceIndex(v11, v39, v40, v41);
    double v42 = nw_interface_create_with_index();
    nw_parameters_require_interface(v10, v42);
  }
  nw_parameters_set_reuse_local_address(v10, 1);
  if (!uuid_is_null(self->_clientUUID)) {
    nw_parameters_set_e_proc_uuid();
  }
  int v43 = IDSRealTimeContext();
  nw_parameters_set_context();

  if (v6)
  {
    LOBYTE(v49) = 1;
    sub_19D9FFDB0(v11, 1, (uint64_t)"TCP: no need to have demux logic", v44, v45, v46, v47, v48, v68);
  }
  else
  {
    __str[0] = 0;
    uint64_t options = (void *)nw_demux_create_options();
    nw_demux_options_add_pattern();
    nw_parameters_set_channel_demux_options();
    if (v7)
    {
      double v49 = objc_msgSend__findListenerWithLocalEndpoint_(self, v51, (uint64_t)v20, v52);
      if (!v49)
      {
        sub_19D9FFDB0(v11, 2, (uint64_t)"couldn't find the listener for %@", v55, v56, v57, v58, v59, (uint64_t)v20);

        goto LABEL_22;
      }
      id v61 = objc_msgSend_connection(v11, v53, v54, v60);
      nw_parameters_allow_sharing_port_with_listener_for_connection();

      sub_19D9FFDB0(v11, 1, (uint64_t)"sharing local port with listener %p", v62, v63, v64, v65, v66, (uint64_t)v49);
    }

    LOBYTE(v49) = 1;
  }
LABEL_22:

  return (char)v49;
}

- (BOOL)_findExistingCollidingQRConnection:(id)a3 remoteEndpoint:(id)a4 sessionID:(id)a5 localEndpointToUse:(id *)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  endpoint = a3;
  double v49 = a4;
  id v50 = a5;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v12 = objc_msgSend_allValues(self->_tokenToNWLinkConnection, v9, v10, v11);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v52, 0.0, v60, 16);
  if (v14)
  {
    uint64_t v17 = v14;
    char v18 = 0;
    uint64_t v19 = *(void *)v53;
    uint64_t v20 = 138412546;
    uint64_t v21 = v49;
    while (1)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v53 != v19) {
          objc_enumerationMutation(v12);
        }
        uint64_t v23 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        if (objc_msgSend_type(v23, v15, v16, *(double *)&v20) == 5)
        {
          double v24 = objc_msgSend_localEndpoint(v23, v15, v16, *(double *)&v20);
          double v28 = objc_msgSend_remoteEndpoint(v23, v25, v26, v27);
          long long v32 = objc_msgSend_sessionID(v23, v29, v30, v31);
          if (sub_19DA0D094(v21, v28))
          {
            if (objc_msgSend_isEqualToString_(v50, v33, (uint64_t)v32, v34))
            {
              nw_endpoint_t address = nw_endpoint_get_address(endpoint);
              id v36 = nw_endpoint_get_address(v24);
              if (IsSameIP((uint64_t)address, (uint64_t)v36))
              {
                objc_msgSend_localEndpoint(v23, v37, v38, v39);
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
              goto LABEL_15;
            }
            if (sub_19DA0D094(endpoint, v24))
            {
              uint64_t v40 = _tokenWithParameters(endpoint, v21, v50, 5uLL, 0);
              double v41 = _tokenWithParameters(v24, v28, v32, 5uLL, 0);
              uint64_t v45 = objc_msgSend_IDSNWLink(IDSFoundationLog, v42, v43, v44);
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v57 = v40;
                __int16 v58 = 2112;
                uint64_t v59 = v41;
                _os_log_impl(&dword_19D9BE000, v45, OS_LOG_TYPE_DEFAULT, "COLLISION DETECTED: new %@, existing %@", buf, 0x16u);
              }

              char v18 = 1;
LABEL_15:
              uint64_t v21 = v49;
            }
          }

          continue;
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v52, *(double *)&v20, v60, 16);
      if (!v17) {
        goto LABEL_21;
      }
    }
  }
  char v18 = 0;
  uint64_t v21 = v49;
LABEL_21:
  os_unfair_lock_unlock(lock);

  return v18 & 1;
}

- (void)_setWiFiAssistStateForCellularLink:(id)a3 isEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_localEndpoint(v6, v7, v8, v9);
  LODWORD(self) = objc_msgSend__isLocalEndpointCellular_(self, v11, (uint64_t)v10, v12);

  if (self)
  {
    uint64_t v16 = objc_msgSend_connection(v6, v13, v14, v15);
    nw_path_t v17 = nw_connection_copy_current_path(v16);

    memset(src, 170, sizeof(src));
    nw_path_get_flow_registration_id();
    int v18 = socket(2, 2, 17);
    memset(dst, 0, sizeof(dst));
    BOOL v32 = v4;
    uuid_copy(dst, src);
    int v19 = setsockopt(v18, 0xFFFF, 4402, dst, 0x14u);
    if (v4) {
      int v25 = @"YES";
    }
    else {
      int v25 = @"NO";
    }
    if (v19)
    {
      __error();
      sub_19D9FFDB0(v6, 2, (uint64_t)"_setWiFiAssistStateForCellularLink(%@) failed with errno %d", v26, v27, v28, v29, v30, (uint64_t)v25);
    }
    else
    {
      sub_19D9FFDB0(v6, 1, (uint64_t)"_setWiFiAssistStateForCellularLink(%@) succeeded", v20, v21, v22, v23, v24, (uint64_t)v25);
    }
    close(v18);
  }
}

- (void)_addNWLinkConnection:(id)a3 token:(id)a4
{
  id value = a3;
  id v6 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_isInvalidated)
  {
    sub_19D9FFDB0(value, 1, (uint64_t)"late after NWLink %p invalidated", v10, v11, v12, v13, v14, (uint64_t)self);
    objc_msgSend__cancelNWLinkConnection_remove_(self, v16, (uint64_t)value, v17, 0);
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_21;
  }
  if (objc_msgSend_connectionID(value, v8, v9, v15))
  {
    if (!v6) {
      goto LABEL_14;
    }
  }
  else
  {
    sub_19D9FFDB0(value, 2, (uint64_t)"WARNING! Storing nwLinkConnection with connectionID 0", v18, v19, v20, v21, v22, v98);
    if (!v6)
    {
LABEL_14:
      double v41 = value;
      if (value)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)self->_tokenToNWLinkConnection, v6, value);
        double v41 = value;
      }
      sub_19D9FFDB0(v41, 1, (uint64_t)"_addNWLinkConnection: added %@ for %@", (uint64_t)v41, v19, v20, v21, v22, (uint64_t)v6);
      uint64_t v28 = 0;
LABEL_17:
      double v42 = objc_msgSend_parent(value, v38, v39, v40);

      if (v42)
      {
        uint64_t v51 = objc_msgSend_connectionID(value, v43, v44, v50);
        long long v55 = objc_msgSend_parent(value, v52, v53, v54);
        objc_msgSend_connectionID(v55, v56, v57, v58);
        sub_19D9FFDB0(value, 1, (uint64_t)"_addNWLinkConnection: [C%llu] has parent [C%llu], adding as child", v59, v60, v61, v62, v63, v51);

        unint64_t v67 = objc_msgSend_parent(value, v64, v65, v66);
        long long v71 = objc_msgSend_children(v67, v68, v69, v70);
        objc_msgSend_addObject_(v71, v72, (uint64_t)value, v73);
      }
      else
      {
        sub_19D9FFDB0(value, 1, (uint64_t)"_addNWLinkConnection: added to rootConnections", v45, v46, v47, v48, v49, v99);
        objc_msgSend_addObject_(self->_rootConnections, v74, (uint64_t)value, v75);
      }
      goto LABEL_20;
    }
  }
  tokenToNWLinkConnection = self->_tokenToNWLinkConnection;
  if (!tokenToNWLinkConnection) {
    goto LABEL_14;
  }
  uint64_t v24 = (id)CFDictionaryGetValue((CFDictionaryRef)tokenToNWLinkConnection, v6);
  if (!v24) {
    goto LABEL_14;
  }
  uint64_t v28 = v24;
  if ((objc_msgSend_hasFailed(v24, v25, v26, v27) & 1) != 0
    || objc_msgSend_hasDisconnected(v28, v29, v30, v31))
  {
    BOOL v32 = objc_msgSend_connection(v28, v29, v30, v31);
    nw_connection_set_state_changed_handler(v32, 0);

    uint64_t v37 = value;
    if (value)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_tokenToNWLinkConnection, v6, value);
      uint64_t v37 = value;
    }
    sub_19D9FFDB0(v37, 1, (uint64_t)"_addNWLinkConnection: replaced old %@ for %@ due to old being disconnected", (uint64_t)v37, v33, v34, v35, v36, (uint64_t)v6);
    goto LABEL_17;
  }
  unint64_t v76 = objc_msgSend_connectionID(v28, v29, v30, v31);
  if (v76 >= objc_msgSend_connectionID(value, v77, v78, v79))
  {
    sub_19D9FFDB0(value, 1, (uint64_t)"old connection being cancelled because new connection started earlier [C%llu >= C%llu]", v80, v81, v82, v83, v84, v76);
    objc_msgSend__cancelNWLinkConnection_remove_(self, v87, (uint64_t)v28, v88, 0);
    uint64_t v92 = objc_msgSend_connection(v28, v89, v90, v91);
    nw_connection_set_state_changed_handler(v92, 0);

    if (value) {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_tokenToNWLinkConnection, v6, value);
    }
    sub_19D9FFDB0(value, 1, (uint64_t)"_addNWLinkConnection: replaced old %@ for %@", v93, v94, v95, v96, v97, (uint64_t)v6);
    goto LABEL_17;
  }
  sub_19D9FFDB0(value, 1, (uint64_t)"new connection being cancelled due to existing earlier connection [C%llu < C%llu]", v80, v81, v82, v83, v84, v76);
  objc_msgSend__cancelNWLinkConnection_remove_(self, v85, (uint64_t)value, v86, 0);
LABEL_20:
  os_unfair_lock_unlock(p_lock);

LABEL_21:
}

- (id)_NWLinkConnectionForToken:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  Value = 0;
  if (v4 && self->_tokenToNWLinkConnection) {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_tokenToNWLinkConnection, v4);
  }
  id v7 = Value;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)_removeNWLinkConnection:(id)a3 token:(id)a4
{
  id v58 = a3;
  id v6 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_isInvalidated)
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_15;
  }
  uint64_t v11 = objc_msgSend_parent(v58, v8, v9, v10);
  double v15 = v11;
  if (v11)
  {
    uint64_t v16 = objc_msgSend_children(v11, v12, v13, v14);
    objc_msgSend_removeObject_(v16, v17, (uint64_t)v58, v18);

    objc_msgSend_setParent_(v58, v19, 0, v20);
    if (!v6) {
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend_removeObject_(self->_rootConnections, v12, (uint64_t)v58, v14);
    if (!v6) {
      goto LABEL_11;
    }
  }
  tokenToNWLinkConnection = self->_tokenToNWLinkConnection;
  if (tokenToNWLinkConnection)
  {
    int v25 = (id)CFDictionaryGetValue((CFDictionaryRef)tokenToNWLinkConnection, v6);
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = objc_msgSend_connectionID(v25, v21, v22, v23);
      if (v27 == objc_msgSend_connectionID(v58, v28, v29, v30))
      {
        objc_msgSend_removeObjectForKey_(self->_tokenToNWLinkConnection, v31, (uint64_t)v6, v33);
        sub_19D9FFDB0(v58, 1, (uint64_t)"_removeNWLinkConnection: removed %@", v34, v35, v36, v37, v38, (uint64_t)v6);
        double v42 = objc_msgSend_connection(v58, v39, v40, v41);
        nw_connection_set_state_changed_handler(v42, 0);
      }
      else
      {
        uint64_t v49 = objc_msgSend_connectionID(v26, v31, v32, v33);
        objc_msgSend_connectionID(v58, v50, v51, v52);
        sub_19D9FFDB0(v58, 1, (uint64_t)"_removeNWLinkConnection: not removed because it doesn't match to what's stored (%llu != %llu)", v53, v54, v55, v56, v57, v49);
      }

      goto LABEL_14;
    }
  }
LABEL_11:
  uint64_t v43 = objc_msgSend_connectionID(v58, v21, v22, v23);
  sub_19D9FFDB0(v58, 1, (uint64_t)"_removeNWLinkConnection: not removed because it's not stored (%llu)", v44, v45, v46, v47, v48, v43);
LABEL_14:
  os_unfair_lock_unlock(p_lock);

LABEL_15:
}

- (void)_addChildConnectionEvaluator:(id)a3 token:(id)a4
{
  id value = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (value) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_tokenToChildConnectionEvaluator, v6, value);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_removeChildConnectionEvaluatorFortoken:(id)a3
{
  id key = a3;
  os_unfair_lock_lock(&self->_lock);
  if (key)
  {
    tokenToChildConnectionEvaluator = self->_tokenToChildConnectionEvaluator;
    if (tokenToChildConnectionEvaluator) {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)tokenToChildConnectionEvaluator, key);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)_childConnectionEvaluatorForToken:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  Value = 0;
  if (v4 && self->_tokenToChildConnectionEvaluator) {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_tokenToChildConnectionEvaluator, v4);
  }
  id v7 = Value;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)_addInterfaceIndex:(unsigned int)a3 NAT64LocalAddress:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v8, v4, v9);
  if (v11)
  {
    interfaceIndexToNAT64LocalAddress = self->_interfaceIndexToNAT64LocalAddress;
    double v14 = (const void *)objc_msgSend_numberWithUnsignedInt_(NSNumber, v10, v5, v12);
    CFDictionarySetValue((CFMutableDictionaryRef)interfaceIndexToNAT64LocalAddress, v14, v11);
  }

  os_unfair_lock_unlock(p_lock);
}

- (unsigned)_NAT64LocalAddressForInterfaceIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_interfaceIndexToNAT64LocalAddress)
  {
    double v9 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v6, v3, v7);
    if (v9)
    {
      interfaceIndexToNAT64LocalAddress = self->_interfaceIndexToNAT64LocalAddress;
      double v12 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v8, v3, v10);
      uint64_t v13 = (id)CFDictionaryGetValue((CFDictionaryRef)interfaceIndexToNAT64LocalAddress, v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  unsigned int v17 = objc_msgSend_unsignedIntValue(v13, v14, v15, v16);

  return v17;
}

- (void)_addExtraListener:(id)a3 port:(unsigned __int16)a4 isCellular:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v10 = v8;
  id value = v10;
  if (v10)
  {
    portToExtraListener = self->_portToExtraListener;
    double v14 = (const void *)objc_msgSend_numberWithUnsignedShort_(NSNumber, v11, v6, v12);
    CFDictionarySetValue((CFMutableDictionaryRef)portToExtraListener, v14, value);
    id v10 = value;
  }

  if (v5)
  {
    if (self->_cellularPortList)
    {
      unsigned int v17 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v15, v6, v16);

      if (v17)
      {
        cellularPortList = self->_cellularPortList;
        uint64_t v21 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v18, v6, v19);
        CFArrayAppendValue((CFMutableArrayRef)cellularPortList, v21);
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)_extraListenerForPort:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_portToExtraListener)
  {
    double v9 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v6, v3, v7);
    if (v9)
    {
      portToExtraListener = self->_portToExtraListener;
      double v12 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v8, v3, v10);
      uint64_t v13 = (id)CFDictionaryGetValue((CFDictionaryRef)portToExtraListener, v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (void)_removeExtraListener:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_portToExtraListener) {
    goto LABEL_7;
  }
  uint64_t v8 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v6, v3, v7);
  if (!v8) {
    goto LABEL_7;
  }
  double v9 = (void *)v8;
  portToExtraListener = self->_portToExtraListener;
  uint64_t v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v6, v3, v7);
  nw_listener_t listener = (id)CFDictionaryGetValue((CFDictionaryRef)portToExtraListener, v11);

  if (listener)
  {
    double v12 = self->_portToExtraListener;
    uint64_t v13 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v6, v3, v7);
    objc_msgSend_removeObjectForKey_(v12, v14, (uint64_t)v13, v15);

    cellularPortList = self->_cellularPortList;
    double v19 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v17, v3, v18);
    objc_msgSend_removeObject_(cellularPortList, v20, (uint64_t)v19, v21);

    os_unfair_lock_unlock(p_lock);
    nw_listener_cancel(listener);
  }
  else
  {
LABEL_7:
    uint64_t v22 = self->_cellularPortList;
    double v23 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v6, v3, v7);
    objc_msgSend_removeObject_(v22, v24, (uint64_t)v23, v25);

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_addToRecentQRServerList:(id)a3
{
  id v35 = a3;
  objc_msgSend_remoteEndpoint(v35, v4, v5, v6);
  nw_endpoint_t v7 = (nw_endpoint_t)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_connection(v35, v8, v9, v10);
  double v12 = nw_connection_copy_connected_path();

  if (v12)
  {
    nw_endpoint_t v16 = nw_path_copy_effective_remote_endpoint(v12);
  }
  else
  {
    uint64_t v17 = objc_msgSend_connectionID(v35, v13, v14, v15);
    sub_19D9FFDB0(v35, 2, (uint64_t)"failed to copy path for [C%llu]", v18, v19, v20, v21, v22, v17);
    nw_endpoint_t v16 = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  sub_19D9FFDB0(v35, 1, (uint64_t)"adding %@ to recent QR server list %@", v23, v24, v25, v26, v27, (uint64_t)v7);
  recentQRServerList = self->_recentQRServerList;
  if (recentQRServerList && v7) {
    CFArrayAppendValue((CFMutableArrayRef)recentQRServerList, v7);
  }
  if (v16)
  {
    if (v16 != v7)
    {
      sub_19D9FFDB0(v35, 1, (uint64_t)"adding %@ to recent QR server list %@", v28, v29, v30, v31, v32, (uint64_t)v16);
      uint64_t v34 = self->_recentQRServerList;
      if (v34) {
        CFArrayAppendValue((CFMutableArrayRef)v34, v16);
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)_shouldAllowP2PConnectionTo:(id)a3 anotherRemoteEndpoint:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_connectedToQR)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = self->_recentQRServerList;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v21, v11, v25, 16);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v9);
          }
          nw_endpoint_t v16 = *(NSObject **)(*((void *)&v21 + 1) + 8 * i);
          if (sub_19DA0D094(v16, v6) || v7 && sub_19DA0D094(v16, v7))
          {
            BOOL v19 = 0;
            goto LABEL_16;
          }
        }
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v17, (uint64_t)&v21, v18, v25, 16);
        BOOL v19 = 1;
        if (v13) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v19 = 1;
    }
LABEL_16:
  }
  else
  {
    BOOL v19 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v19;
}

- (void)_addUDPConnectionInProgress:(id)a3 token:(id)a4
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_setObject_forKey_(self->_tokenToPendingUDPNWLinkConnection, v9, (uint64_t)v8, v10, v7);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_doesUDPConnectionInProgressExist:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v8 = objc_msgSend_objectForKey_(self->_tokenToPendingUDPNWLinkConnection, v6, (uint64_t)v4, v7);

  os_unfair_lock_unlock(p_lock);
  uint64_t v12 = objc_msgSend_IDSNWLink(IDSFoundationLog, v9, v10, v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = @"NO";
    if (v8) {
      uint64_t v13 = @"YES";
    }
    int v15 = 138412546;
    id v16 = v4;
    __int16 v17 = 2112;
    double v18 = v13;
    _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "UDP connection %@ in progress = %@", (uint8_t *)&v15, 0x16u);
  }

  return v8 != 0;
}

- (void)_removeUDPConnectionInProgress:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_removeObjectForKey_(self->_tokenToPendingUDPNWLinkConnection, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_lock);
}

- (id)_createNetworkInterfaceArrayWithIPVersion:(unint64_t)a3 wantsWiFi:(BOOL)a4 wantsCellular:(BOOL)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = GLUCreateNetworkInterfaceArrayWithOptions(a3, 0, a4, a5, 0, self->_useDefaultInterfaceOnly, self->_isDefaultPairedDevice, 0, self->_cellInterfaceName);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v28, 0.0, v32, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v6);
        }
        int v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        int isCellular = objc_msgSend_isCellular(v15, v9, v10, v11);
        long long v22 = objc_msgSend_address(v15, v17, v18, v19);
        if (isCellular) {
          uint64_t v24 = objc_msgSend_cellularPort(self, v20, v21, v23);
        }
        else {
          uint64_t v24 = objc_msgSend_port(self, v20, v21, v23);
        }
        objc_msgSend_updateLocalPort_(v22, v25, v24, v26);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v28, v11, v32, 16);
    }
    while (v12);
  }
  return v6;
}

- (void)logConnectionTree
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_IDSNWLink(IDSFoundationLog, a2, v2, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = self;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "NWLink Connection Tree %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = self->_rootConnections;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v15, v8, v19, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend_logConnectionSubtree_indentation_(self, v10, *(void *)(*((void *)&v15 + 1) + 8 * v14++), v11, &stru_1EEFDAD58, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v10, (uint64_t)&v15, v11, v19, 16);
    }
    while (v12);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)logConnectionSubtree:(id)a3 indentation:(id)a4
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v11 = objc_msgSend_type(v6, v8, v9, v10);
  if (v11 > 0xA) {
    long long v15 = "??";
  }
  else {
    long long v15 = off_1E5973C08[v11];
  }
  uint64_t v16 = objc_msgSend_sessionID(v6, v12, v13, v14);
  if (v16
    && (uint64_t v20 = (void *)v16,
        objc_msgSend_sessionID(v6, v17, v18, v19),
        uint64_t v21 = objc_claimAutoreleasedReturnValue(),
        unint64_t v25 = objc_msgSend_length(v21, v22, v23, v24),
        v21,
        v20,
        v25 >= 8))
  {
    double v26 = NSString;
    uint64_t v27 = objc_msgSend_sessionID(v6, v17, v18, v19);
    long long v30 = objc_msgSend_substringToIndex_(v27, v28, 8, v29);
    objc_msgSend_stringWithFormat_(v26, v31, @" %@", v32, v30);
    double v86 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v86 = &stru_1EEFDAD58;
  }
  uint64_t v33 = objc_msgSend_protocolStackDescription(v6, v17, v18, v19);

  if (v33)
  {
    uint64_t v37 = NSString;
    uint64_t v38 = objc_msgSend_protocolStackDescription(v6, v34, v35, v36);
    objc_msgSend_stringWithFormat_(v37, v39, @" — %@", v40, v38);
    double v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v41 = &stru_1EEFDAD58;
  }
  double v42 = objc_msgSend_parent(v6, v34, v35, v36);

  if (v42)
  {
    uint64_t v46 = NSString;
    uint64_t v47 = objc_msgSend_parent(v6, v43, v44, v45);
    uint64_t v51 = objc_msgSend_connectionID(v47, v48, v49, v50);
    objc_msgSend_stringWithFormat_(v46, v52, @"(C%llu)", v53, v51);
    uint64_t v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v54 = &stru_1EEFDAD58;
  }
  uint64_t v55 = objc_msgSend_IDSNWLink(IDSFoundationLog, v43, v44, v45);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v85 = objc_msgSend_connectionID(v6, v56, v57, v58);
    uint64_t v62 = objc_msgSend_name(v6, v59, v60, v61);
    uint64_t v84 = objc_msgSend_localEndpoint(v6, v63, v64, v65);
    uint64_t v69 = objc_msgSend_remoteEndpoint(v6, v66, v67, v68);
    *(_DWORD *)buf = 138414338;
    id v93 = v7;
    __int16 v94 = 2080;
    uint64_t v95 = v15;
    __int16 v96 = 2112;
    uint64_t v97 = v86;
    __int16 v98 = 2048;
    uint64_t v99 = v85;
    __int16 v100 = 2112;
    uint64_t v101 = v54;
    __int16 v102 = 2112;
    id v103 = v62;
    __int16 v104 = 2112;
    id v105 = v41;
    __int16 v106 = 2112;
    uint64_t v107 = v84;
    __int16 v108 = 2112;
    uint64_t v109 = v69;
    _os_log_impl(&dword_19D9BE000, v55, OS_LOG_TYPE_DEFAULT, "%@ - %-3s %@ [C%llu%@] %@%@ %@/%@", buf, 0x5Cu);
  }
  long long v72 = objc_msgSend_stringWithFormat_(NSString, v70, @"%@    ", v71, v7);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  double v75 = objc_msgSend_children(v6, v73, v74, 0.0);
  uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v76, (uint64_t)&v87, v77, v91, 16);
  if (v78)
  {
    uint64_t v81 = v78;
    uint64_t v82 = *(void *)v88;
    do
    {
      uint64_t v83 = 0;
      do
      {
        if (*(void *)v88 != v82) {
          objc_enumerationMutation(v75);
        }
        objc_msgSend_logConnectionSubtree_indentation_(self, v79, *(void *)(*((void *)&v87 + 1) + 8 * v83++), v80, v72);
      }
      while (v81 != v83);
      uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v79, (uint64_t)&v87, v80, v91, 16);
    }
    while (v81);
  }
}

- (id)_findListenerWithLocalEndpoint:(id)a3
{
  uint64_t port = nw_endpoint_get_port((nw_endpoint_t)a3);
  objc_msgSend__extraListenerForPort_(self, v5, port, v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (port == self->_cellularPort)
    {
      uint64_t v8 = 80;
LABEL_6:
      id v7 = *(id *)((char *)&self->super.isa + v8);
      goto LABEL_8;
    }
    if (port == self->_port)
    {
      uint64_t v8 = 72;
      goto LABEL_6;
    }
    id v7 = 0;
  }
LABEL_8:
  return v7;
}

- (BOOL)_isLocalEndpointCellular:(id)a3
{
  uint64_t port = nw_endpoint_get_port((nw_endpoint_t)a3);
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (port == self->_cellularPort)
  {
    char v8 = 1;
  }
  else
  {
    cellularPortList = self->_cellularPortList;
    double v10 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v6, port, v7);
    char v8 = objc_msgSend_containsObject_(cellularPortList, v11, (uint64_t)v10, v12);
  }
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)cbuuid
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCbuuid:(id)a3
{
}

- (NSString)deviceUniqueID
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDeviceUniqueID:(id)a3
{
}

- (IDSLinkDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IDSLinkDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSLinkDelegate)alternateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alternateDelegate);
  return (IDSLinkDelegate *)WeakRetained;
}

- (void)setAlternateDelegate:(id)a3
{
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_uint64_t port = a3;
}

- (unsigned)cellularPort
{
  return self->_cellularPort;
}

- (void)setCellularPort:(unsigned __int16)a3
{
  self->_int cellularPort = a3;
}

- (NSString)cellInterfaceName
{
  return self->_cellInterfaceName;
}

- (void)setCellInterfaceName:(id)a3
{
}

- (BOOL)useDefaultInterfaceOnly
{
  return self->_useDefaultInterfaceOnly;
}

- (void)setUseDefaultInterfaceOnly:(BOOL)a3
{
  self->_useDefaultInterfaceOnly = a3;
}

- (NSIndexSet)cellularInterfaceIndices
{
  return self->_cellularInterfaceIndices;
}

- (void)setCellularInterfaceIndices:(id)a3
{
}

- (BOOL)wifiAssistEnabled
{
  return self->_wifiAssistEnabled;
}

- (void)setWifiAssistEnabled:(BOOL)a3
{
  self->_wifiAssistEnabled = a3;
}

- (BOOL)connectedToQR
{
  return self->_connectedToQR;
}

- (void)setConnectedToQR:(BOOL)a3
{
  self->_connectedToQR = a3;
}

- (BOOL)disallowQUICPodForCellular
{
  return self->_disallowQUICPodForCellular;
}

- (void)setDisallowQUICPodForCellular:(BOOL)a3
{
  self->_disallowQUICPodForCellular = a3;
}

- (BOOL)disableP2P
{
  return self->_disableP2P;
}

- (void)setDisableP2P:(BOOL)a3
{
  self->_disableP2P = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularInterfaceIndices, 0);
  objc_destroyWeak((id *)&self->_alternateDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deviceUniqueID, 0);
  objc_storeStrong((id *)&self->_cbuuid, 0);
  objc_storeStrong((id *)&self->_portToExtraListener, 0);
  objc_storeStrong((id *)&self->_interfaceIndexToNAT64LocalAddress, 0);
  objc_storeStrong((id *)&self->_rootConnections, 0);
  objc_storeStrong((id *)&self->_tokenToChildConnectionEvaluator, 0);
  objc_storeStrong((id *)&self->_tokenToPendingUDPNWLinkConnection, 0);
  objc_storeStrong((id *)&self->_tokenToPendingTCPNWLinkConnection, 0);
  objc_storeStrong((id *)&self->_tokenToNWLinkConnection, 0);
  objc_storeStrong((id *)&self->_queuedPeelOffs, 0);
  objc_storeStrong((id *)&self->_cellularPortList, 0);
  objc_storeStrong((id *)&self->_recentQRServerList, 0);
  objc_storeStrong((id *)&self->_cellularListener, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_cellInterfaceName, 0);
}

@end