@interface VCTransport
+ (VCTransport)sharedInstance;
- (BOOL)ipPortStillExists:(tagIPPORT *)a3 requiresWifi:(BOOL)a4;
- (VCTransport)init;
- (id)getRemoteCIDForDstIPPort:(tagIPPORT *)a3 callID:(unsigned int)a4;
- (int)detailedErrorCodeForConnectionWithCallID:(unsigned int)a3;
- (int)discardRelayBindingForCallID:(unsigned int)a3;
- (int)discardRelayBindingForCallID:(unsigned int)a3 withChannelNumber:(int)a4;
- (int)flushBasebandQueue:(void *)a3;
- (int)getCellTechForCallID:(unsigned int)a3 localCellTech:(int *)a4 isLocalCellularQoSEnabled:(int *)a5 remoteCellTech:(int *)a6 isRemoteCellularQoSEnabled:(int *)a7;
- (int)getConnectionDataForCallID:(unsigned int)a3 version:(unsigned __int8)a4 useCompressedData:(BOOL)a5 pConnectionData:(void *)a6 connectDataSizeInBytes:(int *)a7 relayDictionary:(__CFDictionary *)a8 interfaceUpdate:(BOOL)a9 nonCellularCandidateTimeout:(double)a10;
- (int)getLoopbackIP:(tagIPPORT *)a3;
- (int)getNextBestCandidate:(tagCANDIDATE *)a3 callID:(unsigned int)a4 isLocal:(int)a5 IPPortToExclude:(tagIPPORT *)a6;
- (int)getRemoteICEVersion:(unsigned int)a3 remoteICEVersion:(unsigned int *)a4;
- (int)getSignalStrengthBars:(int *)a3 displayBars:(int *)a4 maxDisplayBars:(int *)a5;
- (int)processRemoteInterfaceChangeMessageWithLocalCallID:(unsigned int)a3 remoteCallID:(unsigned int)a4 remoteData:(void *)a5 remoteLen:(int)a6 remoteCandidateVersion:(unsigned __int16)a7;
- (int)sendData:(id)a3 localCallID:(unsigned int)a4 remoteCallID:(unsigned int)a5 encrypted:(BOOL)a6 OFTType:(int)a7;
- (int)sendUDPPacketReliableEncrypted:(id)a3 localIPPort:(tagIPPORT *)a4 destinationIPPort:(tagIPPORT *)a5 oftType:(int)a6;
- (int)setForceIPv6ForCallID:(unsigned int)a3;
- (int)setForceRelayForCallID:(unsigned int)a3;
- (int)setICETimeout:(double)a3;
- (int)setSKEState:(SKEStateOpaque *)a3 forCallID:(unsigned int)a4;
- (int)setupDTLSSecurity:(unsigned int)a3 connectionResult:(tagCONNRESULT *)a4 completionHandler:(id)a5;
- (int)startConnectionCheckForCallID:(unsigned int)a3 remoteConnectionDataBlob:(id)a4 relayDictionary:(id)a5 iceTimeout:(double)a6 securityIdentity:(__SecIdentity *)a7 skeState:(SKEStateOpaque *)a8 usedRelay:(int *)a9;
- (int)stopConnectivityCheckForCallID:(unsigned int)a3;
- (int)updateBasebandForConnection:(tagCONNRESULT *)a3 notificationRegistrationToken:(unsigned int)a4 callType:(unsigned __int8)a5;
- (int)updateICERoleForCallID:(unsigned int)a3 role:(int)a4 remoteCallID:(unsigned int)a5 sessionID:(__CFString *)a6;
- (int)updateInterfaceList:(unsigned int)a3 shouldFilterCellInterface:(BOOL)a4 isUpdateNeeded:(int *)a5;
- (int)updateQoS:(BOOL)a3;
- (int)updateQualityIndicator:(int)a3 isIPv6:(BOOL)a4;
- (void)cleanup;
- (void)dealloc;
- (void)iceConnectedForCallID:(unsigned int)a3 result:(tagCONNRESULT *)a4 didReceivePacket:(int)a5 useRelay:(int)a6 secretKey:(__CFData *)a7 skeResult:(int)a8;
- (void)iceNewCandidatesForCallID:(unsigned int)a3 blob:(char *)a4 size:(int)a5 newCandidateVersion:(unsigned __int16)a6;
- (void)iceRemoveIPPort:(tagIPPORT *)a3 forCallID:(unsigned int)a4 isLocalInterface:(BOOL)a5;
- (void)iceShouldNominateNewCandidate:(tagCANDIDATEPAIR *)a3 forCallID:(unsigned int)a4 interfaceMask:(int)a5 nominated:(int *)a6 demote:(int *)a7 connectionPriority:(int *)a8 replaceOnly:(int *)a9;
- (void)receivedDataPacket:(char *)a3 length:(int)a4 forCallID:(unsigned int)a5 encrypted:(BOOL)a6 OFTType:(int)a7;
- (void)registerDataReceivedHandler:(id)a3 forCallID:(unsigned int)a4;
- (void)registerICEBlockForCallID:(unsigned int)a3 connectedBlock:(id)a4 newCandidatesBlock:(id)a5 newNominationBlock:(id)a6 removeIPPortBlock:(id)a7;
- (void)setARPLHandler:(id)a3;
- (void)setReportingAgent:(opaqueRTCReporting *)a3;
@end

@implementation VCTransport

- (VCTransport)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCTransport;
  id v2 = [(VCTransport *)&v8 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F47A30]) initWithObject:v2];
    v7[0] = v3;
    v7[1] = MEMORY[0x1E4F1C280];
    v7[2] = MEMORY[0x1E4F1C278];
    TPCreateHandle((uint64_t *)v2 + 1, 0, 0, 0, (uint64_t)VCTransportICEConnected, (uint64_t)VCTransportICENewCandidates, (uint64_t)VCTransportICEShouldNominate, (uint64_t)VCTransportICERemoveIPPort, v3, (uint64_t)VCDataPacketReceivedCallback, (uint64_t)v7);

    *((void *)v2 + 2) = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    *((void *)v2 + 3) = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCTransport.delegateQueue", 0, CustomRootQueue);
    *((void *)v2 + 4) = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    v5 = VCDispatchQueue_GetCustomRootQueue(58);
    *((void *)v2 + 5) = dispatch_queue_create_with_target_V2("com.apple.VideoConference.vctransport.dataReceivedHandlerQueue", 0, v5);
  }
  return (VCTransport *)v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  TPSetDataPacketReceivedCallback((uint64_t)self->tpHandle, 0, 0);
  TPCloseHandle();

  dispatch_release((dispatch_object_t)self->delegateQueue);
  dispatch_release((dispatch_object_t)self->dataReceivedHandlerQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCTransport;
  [(VCTransport *)&v3 dealloc];
}

+ (VCTransport)sharedInstance
{
  id v2 = objc_opt_class();
  objc_sync_enter(v2);
  Weak = (VCTransport *)objc_loadWeak(&gVCTransportInstance);
  if (!Weak)
  {
    uint64_t v4 = objc_alloc_init(VCTransport);
    objc_storeWeak(&gVCTransportInstance, v4);
    Weak = v4;
  }
  objc_sync_exit(v2);
  return Weak;
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
}

- (void)registerICEBlockForCallID:(unsigned int)a3 connectedBlock:(id)a4 newCandidatesBlock:(id)a5 newNominationBlock:(id)a6 removeIPPortBlock:(id)a7
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  delegateQueue = self->delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__VCTransport_registerICEBlockForCallID_connectedBlock_newCandidatesBlock_newNominationBlock_removeIPPortBlock___block_invoke;
  block[3] = &unk_1E6DB9E80;
  unsigned int v9 = a3;
  block[6] = a5;
  block[7] = a6;
  block[8] = a7;
  block[4] = self;
  block[5] = a4;
  dispatch_async(delegateQueue, block);
}

void __112__VCTransport_registerICEBlockForCallID_connectedBlock_newCandidatesBlock_newNominationBlock_removeIPPortBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
  if (*(void *)(a1 + 40) || *(void *)(a1 + 48) || *(void *)(a1 + 56) || *(void *)(a1 + 64))
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    uint64_t v4 = *(const void **)(a1 + 40);
    id v13 = (id)v3;
    if (v4)
    {
      v5 = _Block_copy(v4);
      [v13 setObject:v5 forKeyedSubscript:@"NewConnection"];
    }
    v6 = *(const void **)(a1 + 48);
    if (v6)
    {
      v7 = _Block_copy(v6);
      [v13 setObject:v7 forKeyedSubscript:@"NewCandidates"];
    }
    objc_super v8 = *(const void **)(a1 + 56);
    if (v8)
    {
      unsigned int v9 = _Block_copy(v8);
      [v13 setObject:v9 forKeyedSubscript:@"NewNomination"];
    }
    uint64_t v10 = *(const void **)(a1 + 64);
    if (v10)
    {
      v11 = _Block_copy(v10);
      [v13 setObject:v11 forKeyedSubscript:@"RemoveIPPort"];
    }
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v13 forKeyedSubscript:v2];
  }
  else
  {
    v12 = *(void **)(*(void *)(a1 + 32) + 16);
    [v12 removeObjectForKey:v2];
  }
}

- (int)updateInterfaceList:(unsigned int)a3 shouldFilterCellInterface:(BOOL)a4 isUpdateNeeded:(int *)a5
{
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  v10[2] = *MEMORY[0x1E4F143B8];
  v10[0] = 0xAAAAAAAAAAAAAAAALL;
  v10[1] = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "getClientUUID:", v10);
  objc_sync_enter(self);
  LODWORD(a5) = TPUpdateInterfaceList((uint64_t)self->tpHandle, v7, a5, v6, (const unsigned __int8 *)v10);
  objc_sync_exit(self);
  return (int)a5;
}

- (void)iceConnectedForCallID:(unsigned int)a3 result:(tagCONNRESULT *)a4 didReceivePacket:(int)a5 useRelay:(int)a6 secretKey:(__CFData *)a7 skeResult:(int)a8
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v15 = malloc_type_calloc(1uLL, 0x140uLL, 0x1020040A6FBA1A4uLL);
    memcpy(v15, a4, 0x140uLL);
  }
  else
  {
    v15 = 0;
  }
  delegateQueue = self->delegateQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__VCTransport_iceConnectedForCallID_result_didReceivePacket_useRelay_secretKey_skeResult___block_invoke;
  v17[3] = &unk_1E6DB7FF8;
  v17[4] = self;
  v17[5] = v15;
  unsigned int v18 = a3;
  int v19 = a5;
  v17[6] = a7;
  int v20 = a6;
  int v21 = a8;
  dispatch_async(delegateQueue, v17);
}

void __90__VCTransport_iceConnectedForCallID_result_didReceivePacket_useRelay_secretKey_skeResult___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56))), "objectForKeyedSubscript:", @"NewConnection");
  if (v2) {
    (*(void (**)(uint64_t, void, BOOL, BOOL, void, void))(v2 + 16))(v2, *(void *)(a1 + 40), *(_DWORD *)(a1 + 60) != 0, *(_DWORD *)(a1 + 64) != 0, *(void *)(a1 + 48), *(unsigned int *)(a1 + 68));
  }
  uint64_t v3 = *(void **)(a1 + 40);

  free(v3);
}

- (void)iceNewCandidatesForCallID:(unsigned int)a3 blob:(char *)a4 size:(int)a5 newCandidateVersion:(unsigned __int16)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a4 length:a5];
  delegateQueue = self->delegateQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__VCTransport_iceNewCandidatesForCallID_blob_size_newCandidateVersion___block_invoke;
  v11[3] = &unk_1E6DB8AF8;
  unsigned int v12 = a3;
  v11[4] = self;
  v11[5] = v9;
  unsigned __int16 v13 = a6;
  dispatch_async(delegateQueue, v11);
}

uint64_t __71__VCTransport_iceNewCandidatesForCallID_blob_size_newCandidateVersion___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))), "objectForKeyedSubscript:", @"NewCandidates");
  if (result)
  {
    uint64_t v2 = *(uint64_t (**)(void))(result + 16);
    return v2();
  }
  return result;
}

- (void)iceShouldNominateNewCandidate:(tagCANDIDATEPAIR *)a3 forCallID:(unsigned int)a4 interfaceMask:(int)a5 nominated:(int *)a6 demote:(int *)a7 connectionPriority:(int *)a8 replaceOnly:(int *)a9
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  delegateQueue = self->delegateQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __117__VCTransport_iceShouldNominateNewCandidate_forCallID_interfaceMask_nominated_demote_connectionPriority_replaceOnly___block_invoke;
  void v10[3] = &unk_1E6DB7F08;
  v10[4] = self;
  v10[5] = a3;
  unsigned int v11 = a4;
  int v12 = a5;
  v10[6] = a6;
  v10[7] = a7;
  v10[8] = a8;
  v10[9] = a9;
  dispatch_sync(delegateQueue, v10);
}

void __117__VCTransport_iceShouldNominateNewCandidate_forCallID_interfaceMask_nominated_demote_connectionPriority_replaceOnly___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80))), "objectForKeyedSubscript:", @"NewNomination");
  if (v1)
  {
    uint64_t v2 = *(void (**)(void))(v1 + 16);
    v2();
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      objc_super v8 = "-[VCTransport iceShouldNominateNewCandidate:forCallID:interfaceMask:nominated:demote:connectionPriority:repla"
           "ceOnly:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 261;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d iceNewNominationBlock didn't exist", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)iceRemoveIPPort:(tagIPPORT *)a3 forCallID:(unsigned int)a4 isLocalInterface:(BOOL)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x4810000000;
  void v10[3] = "";
  long long v5 = *(_OWORD *)&a3->szIfName[12];
  long long v11 = *(_OWORD *)&a3->iFlags;
  long long v12 = v5;
  uint64_t v13 = *(void *)&a3->IP.abIPv6[12];
  delegateQueue = self->delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__VCTransport_iceRemoveIPPort_forCallID_isLocalInterface___block_invoke;
  block[3] = &unk_1E6DB9EA8;
  unsigned int v8 = a4;
  block[4] = self;
  block[5] = v10;
  BOOL v9 = a5;
  dispatch_async(delegateQueue, block);
  _Block_object_dispose(v10, 8);
}

void __58__VCTransport_iceRemoveIPPort_forCallID_isLocalInterface___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))), "objectForKeyedSubscript:", @"RemoveIPPort");
  if (v1)
  {
    uint64_t v2 = *(void (**)(void))(v1 + 16);
    v2();
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      unsigned int v8 = "-[VCTransport iceRemoveIPPort:forCallID:isLocalInterface:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 277;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d iceRemoveIPPortBlock didn't exist", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)registerDataReceivedHandler:(id)a3 forCallID:(unsigned int)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dataReceivedHandlerQueue = self->dataReceivedHandlerQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__VCTransport_registerDataReceivedHandler_forCallID___block_invoke;
  v5[3] = &unk_1E6DB9ED0;
  v5[4] = self;
  v5[5] = a3;
  unsigned int v6 = a4;
  dispatch_async(dataReceivedHandlerQueue, v5);
}

void __53__VCTransport_registerDataReceivedHandler_forCallID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = _Block_copy(v2);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v3, objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
    _Block_release(v3);
  }
  else
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 32);
    uint64_t v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
    [v4 removeObjectForKey:v5];
  }
}

- (void)receivedDataPacket:(char *)a3 length:(int)a4 forCallID:(unsigned int)a5 encrypted:(BOOL)a6 OFTType:(int)a7
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:a4];
  dataReceivedHandlerQueue = self->dataReceivedHandlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__VCTransport_receivedDataPacket_length_forCallID_encrypted_OFTType___block_invoke;
  block[3] = &unk_1E6DB7490;
  block[4] = self;
  block[5] = v11;
  BOOL v16 = a6;
  unsigned int v14 = a5;
  int v15 = a7;
  dispatch_async(dataReceivedHandlerQueue, block);
}

uint64_t __69__VCTransport_receivedDataPacket_length_forCallID_encrypted_OFTType___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  if (result)
  {
    uint64_t v2 = *(uint64_t (**)(void))(result + 16);
    return v2();
  }
  return result;
}

- (int)stopConnectivityCheckForCallID:(unsigned int)a3
{
  return TPStopConnectivityCheck();
}

- (id)getRemoteCIDForDstIPPort:(tagIPPORT *)a3 callID:(unsigned int)a4
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = 0xAAAAAAAAAAAAAAAALL;
  if ((TPGetRemoteCIDForDstIPPort() & 0x80000000) != 0) {
    return 0;
  }
  else {
    return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v5 length:8];
  }
}

- (int)getNextBestCandidate:(tagCANDIDATE *)a3 callID:(unsigned int)a4 isLocal:(int)a5 IPPortToExclude:(tagIPPORT *)a6
{
  return TPGetNextBestCandidate();
}

- (int)discardRelayBindingForCallID:(unsigned int)a3
{
  return TPDiscardRelayBinding();
}

- (int)discardRelayBindingForCallID:(unsigned int)a3 withChannelNumber:(int)a4
{
  return TPDiscardRelayBindingWithChannelNumber();
}

- (int)getConnectionDataForCallID:(unsigned int)a3 version:(unsigned __int8)a4 useCompressedData:(BOOL)a5 pConnectionData:(void *)a6 connectDataSizeInBytes:(int *)a7 relayDictionary:(__CFDictionary *)a8 interfaceUpdate:(BOOL)a9 nonCellularCandidateTimeout:(double)a10
{
  BOOL v13 = a5;
  uint64_t v14 = a4;
  v19[2] = *MEMORY[0x1E4F143B8];
  v19[0] = 0xAAAAAAAAAAAAAAAALL;
  v19[1] = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "getClientUUID:", v19);
  LODWORD(v18) = a9;
  return TPGetConnectionData((uint64_t)self->tpHandle, v14, a3, v13, (uint64_t)a6, (uint64_t)a7, 1, 0, (uint64_t)"static", 0, (uint64_t)a8, v18, (const unsigned __int8 *)v19);
}

- (int)setupDTLSSecurity:(unsigned int)a3 connectionResult:(tagCONNRESULT *)a4 completionHandler:(id)a5
{
  return TPSetupOpenFaceTimeSecurity((uint64_t)self->tpHandle, a3, (uint64_t)a4);
}

- (int)detailedErrorCodeForConnectionWithCallID:(unsigned int)a3
{
  if ((int)TPGetConnErrorCode() >= 0) {
    return 400;
  }
  else {
    return 400;
  }
}

- (int)startConnectionCheckForCallID:(unsigned int)a3 remoteConnectionDataBlob:(id)a4 relayDictionary:(id)a5 iceTimeout:(double)a6 securityIdentity:(__SecIdentity *)a7 skeState:(SKEStateOpaque *)a8 usedRelay:(int *)a9
{
  uint64_t v14 = *(void *)&a3;
  uint64_t v16 = [a4 length];
  uint64_t v17 = malloc_type_malloc((int)v16, 0xE93702F6uLL);
  [a4 getBytes:v17 length:(int)v16];
  LODWORD(a9) = TPStartConnectionCheck(a6, (uint64_t)self->tpHandle, v14, (uint64_t)v17, v16, 0, (uint64_t)a5, (uint64_t)a9, a7);
  free(v17);
  return (int)a9;
}

- (BOOL)ipPortStillExists:(tagIPPORT *)a3 requiresWifi:(BOOL)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v5 = 0;
  TPGetInterfaceStillExists((uint64_t)self->tpHandle, (uint64_t)a3, &v5);
  return v5 != 0;
}

- (int)sendUDPPacketReliableEncrypted:(id)a3 localIPPort:(tagIPPORT *)a4 destinationIPPort:(tagIPPORT *)a5 oftType:(int)a6
{
  tpHandle = self->tpHandle;
  uint64_t v11 = (const void *)[a3 bytes];
  int v12 = [a3 length];

  return TPSendUDPPacketARPL((uint64_t)tpHandle, v11, v12, (uint64_t)a4, &a5->iFlags, a6, 1, 1);
}

- (int)sendData:(id)a3 localCallID:(unsigned int)a4 remoteCallID:(unsigned int)a5 encrypted:(BOOL)a6 OFTType:(int)a7
{
  tpHandle = self->tpHandle;
  BOOL v13 = (_OWORD *)[a3 bytes];
  int v14 = [a3 length];

  return TPSendUDPDataPacket((uint64_t)tpHandle, v13, v14, a4, a5, a6, a7);
}

- (int)setForceRelayForCallID:(unsigned int)a3
{
  return TPSetForceRelay();
}

- (int)setForceIPv6ForCallID:(unsigned int)a3
{
  return TPSetForceIPv6();
}

- (int)updateICERoleForCallID:(unsigned int)a3 role:(int)a4 remoteCallID:(unsigned int)a5 sessionID:(__CFString *)a6
{
  return TPUpdateICERole((uint64_t)self->tpHandle, *(uint64_t *)&a3, a4, a5, a6);
}

- (int)setSKEState:(SKEStateOpaque *)a3 forCallID:(unsigned int)a4
{
  return TPSetSKEState();
}

- (int)setICETimeout:(double)a3
{
  return TPSetICETimeout(a3);
}

- (int)updateQoS:(BOOL)a3
{
  return TPUpdateQoS((uint64_t)self->tpHandle, a3);
}

- (int)getLoopbackIP:(tagIPPORT *)a3
{
  return TPGetLoopbackIP((uint64_t)self->tpHandle, (uint64_t)a3);
}

- (void)setARPLHandler:(id)a3
{
}

- (int)processRemoteInterfaceChangeMessageWithLocalCallID:(unsigned int)a3 remoteCallID:(unsigned int)a4 remoteData:(void *)a5 remoteLen:(int)a6 remoteCandidateVersion:(unsigned __int16)a7
{
  return TPProcessRemoteInterfaceChangeMessage((uint64_t)self->tpHandle, a3, a4, (const UInt8 *)a5, a6, a7);
}

- (int)getRemoteICEVersion:(unsigned int)a3 remoteICEVersion:(unsigned int *)a4
{
  return TPGetRemoteICEVersion();
}

- (void)cleanup
{
}

- (int)updateBasebandForConnection:(tagCONNRESULT *)a3 notificationRegistrationToken:(unsigned int)a4 callType:(unsigned __int8)a5
{
  return TPUpdateBaseband((uint64_t)self->tpHandle, (uint64_t)a3, a4, a5);
}

- (int)getCellTechForCallID:(unsigned int)a3 localCellTech:(int *)a4 isLocalCellularQoSEnabled:(int *)a5 remoteCellTech:(int *)a6 isRemoteCellularQoSEnabled:(int *)a7
{
  return TPGetCellTech();
}

- (int)getSignalStrengthBars:(int *)a3 displayBars:(int *)a4 maxDisplayBars:(int *)a5
{
  return TPGetSignalStrength((uint64_t)self->tpHandle, a3, a4, a5);
}

- (int)updateQualityIndicator:(int)a3 isIPv6:(BOOL)a4
{
  return TPUpdateQualityIndictor((uint64_t)self->tpHandle, a3, a4);
}

- (int)flushBasebandQueue:(void *)a3
{
  return TPFlushBasebandQueue((uint64_t)self->tpHandle, (uint64_t)a3);
}

@end