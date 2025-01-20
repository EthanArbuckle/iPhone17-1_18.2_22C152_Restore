@interface MCSession
+ (id)stringForMCSessionSendDataMode:(int64_t)a3;
+ (id)stringForSessionState:(int64_t)a3;
- (BOOL)isAWDLDisabled;
- (BOOL)isEncryptionPreferenceCompatible:(int64_t)a3;
- (BOOL)preferNCMOverEthernet;
- (BOOL)sendData:(NSData *)data toPeers:(NSArray *)peerIDs withMode:(MCSessionSendDataMode)mode error:(NSError *)error;
- (MCEncryptionPreference)encryptionPreference;
- (MCPeerID)myPeerID;
- (MCSession)init;
- (MCSession)initWithPeer:(MCPeerID *)myPeerID;
- (MCSession)initWithPeer:(MCPeerID *)myPeerID securityIdentity:(NSArray *)identity encryptionPreference:(MCEncryptionPreference)encryptionPreference;
- (MCSessionPrivateDelegate)privateDelegate;
- (NSArray)connectedPeers;
- (NSArray)securityIdentity;
- (NSMutableDictionary)connectionPendingPeerEvents;
- (NSMutableDictionary)peerIDMap;
- (NSMutableDictionary)peerStates;
- (NSOutputStream)startStreamWithName:(NSString *)streamName toPeer:(MCPeerID *)peerID error:(NSError *)error;
- (NSProgress)sendResourceAtURL:(NSURL *)resourceURL withName:(NSString *)resourceName toPeer:(MCPeerID *)peerID withCompletionHandler:(void *)completionHandler;
- (NSString)sessionID;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)syncQueue;
- (OpaqueAGPSession)agpSession;
- (OpaqueGCKSession)gckSession;
- (id)delegate;
- (id)description;
- (id)stringForEncryptionPreference:(int64_t)a3;
- (id)syncDetailedDescription;
- (int64_t)connectedInterfacesForPeer:(id)a3;
- (os_state_data_s)syncStateCapture;
- (unint64_t)maxPeers;
- (unint64_t)stateHandle;
- (unint64_t)syncConnectedPeersCount;
- (unsigned)gckPID;
- (void)cancelConnectPeer:(MCPeerID *)peerID;
- (void)cancelIncomingStream:(id)a3 fromPeer:(id)a4;
- (void)cancelOutgoingStream:(id)a3 toPeer:(id)a4;
- (void)closeDirectConnectionsWithPeer:(id)a3;
- (void)connectPeer:(MCPeerID *)peerID withNearbyConnectionData:(NSData *)data;
- (void)dealloc;
- (void)disconnect;
- (void)logSessionInfo;
- (void)nearbyConnectionDataForPeer:(MCPeerID *)peerID withCompletionHandler:(void *)completionHandler;
- (void)peerDidDeclineInvitation:(id)a3;
- (void)setAWDLDisabled:(BOOL)a3;
- (void)setAgpSession:(OpaqueAGPSession *)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setConnectionPendingPeerEvents:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setGckPID:(unsigned int)a3;
- (void)setGckSession:(OpaqueGCKSession *)a3;
- (void)setHeartbeatTimeout:(unint64_t)a3;
- (void)setICETimeoutForced:(BOOL)a3;
- (void)setMaxPeers:(unint64_t)a3;
- (void)setPeerIDMap:(id)a3;
- (void)setPeerStates:(id)a3;
- (void)setPreferNCMOverEthernet:(BOOL)a3;
- (void)setPrivateDelegate:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setStateHandle:(unint64_t)a3;
- (void)setSyncQueue:(id)a3;
- (void)startConnectionWithIndirectPID:(unsigned int)a3;
- (void)syncCancelIncomingStream:(id)a3 fromPeer:(id)a4;
- (void)syncCancelOutgoingStream:(id)a3 toPeer:(id)a4;
- (void)syncCloseIncomingStream:(id)a3 forPeer:(id)a4 state:(id)a5 error:(id)a6 reason:(int)a7 shouldTriggerCancelProgress:(BOOL)a8;
- (void)syncCloseOutgoingStream:(id)a3 forPeer:(id)a4 state:(id)a5 error:(id)a6 shouldTriggerCancelProgress:(BOOL)a7;
- (void)syncCloseStreamsForPeer:(id)a3;
- (void)syncConnectPeer:(id)a3 withConnectionData:(id)a4;
- (void)syncGetConnectionDataForPeerState:(id)a3 completionHandler:(id)a4;
- (void)syncHandleNetworkEvent:(id *)a3 pid:(unsigned int)a4 freeEventWhenDone:(BOOL *)a5;
- (void)syncHandleXDataDataPacket:(char *)a3 packetSize:(int)a4 forPeer:(id)a5 state:(id)a6;
- (void)syncLogConnectedPeers;
- (void)syncLogMaxConnectedPeers;
- (void)syncPeer:(id)a3 changeStateTo:(int64_t)a4 shouldForceCallback:(BOOL)a5;
- (void)syncSendData:(id)a3 toPeers:(id)a4 withDataMode:(int64_t)a5;
- (void)syncSendXDataConnectionBlobPushToPID:(unsigned int)a3 connectionBlob:(id)a4;
- (void)syncSendXDataPeerIDPushToPID:(unsigned int)a3;
- (void)syncSendXDataStreamCloseFromReceiverToPID:(unsigned int)a3 streamID:(unsigned int)a4 closeReason:(unsigned __int16)a5;
- (void)syncSendXDataStreamCloseFromSenderToPID:(unsigned int)a3 streamID:(unsigned int)a4 closeReason:(unsigned __int16)a5;
- (void)syncSendXDataStreamOpenResponseToPID:(unsigned int)a3 withRequestID:(unsigned int)a4 streamID:(unsigned int)a5;
- (void)syncStartStreamWithName:(id)a3 toPeer:(id)a4 mcFD:(int)a5 isResource:(BOOL)a6;
@end

@implementation MCSession

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
}

- (MCSessionPrivateDelegate)privateDelegate
{
  return (MCSessionPrivateDelegate *)objc_loadWeak((id *)&self->_privateDelegate);
}

- (void)setPrivateDelegate:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MCSession *)self myPeerID];
  v7 = [(MCSession *)self securityIdentity];
  id v8 = [(MCSession *)self stringForEncryptionPreference:[(MCSession *)self encryptionPreference]];
  v9 = [(MCSession *)self connectedPeers];
  [(MCSession *)self delegate];
  v10 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p MyPeerID = %@ SecurityIdentity = %@ EncryptionPreference = %@ ConnectedPeers = %@ Delegate = <%@: %p>>", v5, self, v6, v7, v8, v9, NSStringFromClass(v10), -[MCSession delegate](self, "delegate")];
}

- (id)stringForEncryptionPreference:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"?";
  }
  else {
    return (id)*((void *)&off_264338220 + a3);
  }
}

- (void)syncHandleXDataDataPacket:(char *)a3 packetSize:(int)a4 forPeer:(id)a5 state:(id)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v6 = (a4 - 4);
  if (a4 <= 4)
  {
    v7 = mcs_log();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v18[0]) = 0;
    id v8 = "No content.";
    v9 = v7;
    uint32_t v10 = 2;
LABEL_13:
    _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)v18, v10);
    return;
  }
  uint64_t v12 = bswap32(*(_DWORD *)a3);
  v13 = (void *)[a6 incomingStreams];
  v14 = objc_msgSend(v13, "objectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", v12));
  if (!v14)
  {
    v17 = mcs_log();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    v18[0] = 67109120;
    v18[1] = v12;
    id v8 = "Stream %u not found.";
    v9 = v17;
    uint32_t v10 = 8;
    goto LABEL_13;
  }
  v15 = v14;
  if ([v14 state] == 2 || objc_msgSend(v15, "state") == 3)
  {
    objc_msgSend((id)objc_msgSend(v15, "incomingBuffer"), "appendBytes:length:", a3 + 4, v6);
    if ([v15 sourceSuspended])
    {
      [v15 setSourceSuspended:0];
      v16 = [v15 source];
      dispatch_resume(v16);
    }
  }
}

- (void)syncSendXDataStreamOpenResponseToPID:(unsigned int)a3 withRequestID:(unsigned int)a4 streamID:(unsigned int)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unsigned int v21 = a3;
  v9 = mcs_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    unsigned int v23 = a3;
    __int16 v24 = 1024;
    unsigned int v25 = a4;
    __int16 v26 = 1024;
    unsigned int v27 = a5;
    _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "Streaming: sending XDataStreamOpenResponse to peer[%08X] requestID[%08X] streamID[%08X].", buf, 0x14u);
  }
  uint32_t v10 = malloc_type_malloc(0xCuLL, 0x5816FAD4uLL);
  if (v10)
  {
    v11 = v10;
    _DWORD *v10 = 201326741;
    *((unsigned char *)v10 + 4) = HIBYTE(a4);
    *((unsigned char *)v10 + 5) = BYTE2(a4);
    *((unsigned char *)v10 + 6) = BYTE1(a4);
    *((unsigned char *)v10 + 7) = a4;
    *((unsigned char *)v10 + 8) = HIBYTE(a5);
    *((unsigned char *)v10 + 9) = BYTE2(a5);
    *((unsigned char *)v10 + 10) = BYTE1(a5);
    *((unsigned char *)v10 + 11) = a5;
    *(_DWORD *)buf = 0;
    if (AGPSessionSendTo((uint64_t)self->_agpSession, (int *)&v21, 1, (uint64_t)v10, 12, (uint64_t)buf, 0, 0xAu, 1, 0))
    {
      uint64_t v12 = mcs_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:]();
      }
    }
    free(v11);
  }
  else
  {
    NSLog(&cfstr_OutOfMemoryAll.isa, 12);
    v13 = mcs_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)syncSendXDataStreamCloseFromSenderToPID:(unsigned int)a3 streamID:(unsigned int)a4 closeReason:(unsigned __int16)a5
{
  int v5 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  unsigned int v21 = a3;
  v9 = mcs_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    unsigned int v23 = a3;
    __int16 v24 = 1024;
    unsigned int v25 = a4;
    __int16 v26 = 1024;
    int v27 = v5;
    _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "Streaming: sending XDataStreamCloseFromSender to peer[%08X] streamID[%08X] closeReason[%d].", buf, 0x14u);
  }
  uint32_t v10 = malloc_type_malloc(0xAuLL, 0x4B2E9658uLL);
  if (v10)
  {
    v11 = v10;
    _DWORD *v10 = 167772318;
    *((unsigned char *)v10 + 4) = HIBYTE(a4);
    *((unsigned char *)v10 + 5) = BYTE2(a4);
    *((unsigned char *)v10 + 6) = BYTE1(a4);
    *((unsigned char *)v10 + 7) = a4;
    *((unsigned char *)v10 + 8) = BYTE1(v5);
    *((unsigned char *)v10 + 9) = v5;
    *(_DWORD *)buf = 0;
    if (AGPSessionSendTo((uint64_t)self->_agpSession, (int *)&v21, 1, (uint64_t)v10, 10, (uint64_t)buf, 0, 0xAu, 1, 0))
    {
      uint64_t v12 = mcs_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:]();
      }
    }
    free(v11);
  }
  else
  {
    NSLog(&cfstr_OutOfMemoryAll.isa, 10);
    v13 = mcs_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MCSession syncSendXDataStreamCloseFromSenderToPID:streamID:closeReason:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)syncSendXDataStreamCloseFromReceiverToPID:(unsigned int)a3 streamID:(unsigned int)a4 closeReason:(unsigned __int16)a5
{
  int v5 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  unsigned int v21 = a3;
  v9 = mcs_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    unsigned int v23 = a3;
    __int16 v24 = 1024;
    unsigned int v25 = a4;
    __int16 v26 = 1024;
    int v27 = v5;
    _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "Streaming: sending XDataStreamCloseFromReceiver to peer[%08X] streamID[%08X] closeReason[%d].", buf, 0x14u);
  }
  uint32_t v10 = malloc_type_malloc(0xAuLL, 0x404C8D92uLL);
  if (v10)
  {
    v11 = v10;
    _DWORD *v10 = 167772319;
    *((unsigned char *)v10 + 4) = HIBYTE(a4);
    *((unsigned char *)v10 + 5) = BYTE2(a4);
    *((unsigned char *)v10 + 6) = BYTE1(a4);
    *((unsigned char *)v10 + 7) = a4;
    *((unsigned char *)v10 + 8) = BYTE1(v5);
    *((unsigned char *)v10 + 9) = v5;
    *(_DWORD *)buf = 0;
    if (AGPSessionSendTo((uint64_t)self->_agpSession, (int *)&v21, 1, (uint64_t)v10, 10, (uint64_t)buf, 0, 0xAu, 1, 0))
    {
      uint64_t v12 = mcs_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:]();
      }
    }
    free(v11);
  }
  else
  {
    NSLog(&cfstr_OutOfMemoryAll.isa, 10);
    v13 = mcs_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MCSession syncSendXDataStreamCloseFromSenderToPID:streamID:closeReason:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)syncSendXDataPeerIDPushToPID:(unsigned int)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned int v12 = a3;
  int v5 = mcs_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v14 = a3;
    _os_log_impl(&dword_218756000, v5, OS_LOG_TYPE_DEFAULT, "XData: pushing own peerID to non-neighbor peer[%08X].", buf, 8u);
  }
  id v6 = [(MCPeerID *)[(MCSession *)self myPeerID] serializedRepresentation];
  unsigned __int16 v7 = [v6 length] + 4;
  id v8 = (char *)malloc_type_malloc(v7, 0x4F1A29A4uLL);
  if (v8)
  {
    v9 = v8;
    *(_WORD *)id v8 = 168;
    v8[2] = HIBYTE(v7);
    v8[3] = v7;
    memcpy(v8 + 4, (const void *)[v6 bytes], objc_msgSend(v6, "length"));
    *(_DWORD *)buf = 0;
    if (AGPSessionSendTo((uint64_t)self->_agpSession, (int *)&v12, 1, (uint64_t)v9, v7, (uint64_t)buf, 0, 0xAu, 1, 0))
    {
      uint32_t v10 = mcs_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:]();
      }
    }
    free(v9);
  }
  else
  {
    NSLog(&cfstr_OutOfMemoryAll.isa, v7);
    v11 = mcs_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MCSession syncSendXDataPeerIDPushToPID:]();
    }
  }
}

- (void)syncSendXDataConnectionBlobPushToPID:(unsigned int)a3 connectionBlob:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unsigned int v13 = a3;
  unsigned __int16 v7 = mcs_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v15 = a3;
    _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "XData: pushing connection data to non-neighbor peer[%08X].", buf, 8u);
  }
  unsigned __int16 v8 = [a4 length] + 4;
  v9 = (char *)malloc_type_malloc(v8, 0x95ACD640uLL);
  if (v9)
  {
    uint32_t v10 = v9;
    *(_WORD *)v9 = 169;
    v9[2] = HIBYTE(v8);
    v9[3] = v8;
    memcpy(v9 + 4, (const void *)[a4 bytes], objc_msgSend(a4, "length"));
    *(_DWORD *)buf = 0;
    if (AGPSessionSendTo((uint64_t)self->_agpSession, (int *)&v13, 1, (uint64_t)v10, v8, (uint64_t)buf, 0, 0xAu, 1, 0))
    {
      v11 = mcs_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:]();
      }
    }
    free(v10);
  }
  else
  {
    NSLog(&cfstr_OutOfMemoryAll.isa, v8);
    unsigned int v12 = mcs_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MCSession syncSendXDataPeerIDPushToPID:]();
    }
  }
}

- (void)syncCloseIncomingStream:(id)a3 forPeer:(id)a4 state:(id)a5 error:(id)a6 reason:(int)a7 shouldTriggerCancelProgress:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v33 = *MEMORY[0x263EF8340];
  unsigned int v15 = mcs_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v26 = a3;
    __int16 v27 = 2112;
    id v28 = a4;
    __int16 v29 = 2112;
    id v30 = a5;
    __int16 v31 = 2112;
    id v32 = a6;
    _os_log_impl(&dword_218756000, v15, OS_LOG_TYPE_DEFAULT, "Close incoming stream[%@] peer[%@] peerState[%@] error[%@].", buf, 0x2Au);
  }
  [a3 setState:4];
  if ([a3 source])
  {
    if ([a3 sourceSuspended]) {
      dispatch_resume((dispatch_object_t)[a3 source]);
    }
    dispatch_source_cancel((dispatch_source_t)[a3 source]);
  }
  if ([a3 url])
  {
    if (v8) {
      objc_msgSend((id)objc_msgSend(a3, "progress"), "cancel");
    }
    if (!a6)
    {
      if (a7 == 1)
      {
        uint64_t v17 = (void *)MEMORY[0x263F087E8];
        uint64_t v18 = [NSDictionary dictionaryWithObject:@"Resource transfer cancelled." forKey:*MEMORY[0x263F08320]];
        uint64_t v19 = v17;
        uint64_t v20 = 5;
      }
      else
      {
        if (!a7)
        {
          objc_msgSend((id)objc_msgSend(a3, "progress"), "setCompletedUnitCount:", objc_msgSend((id)objc_msgSend(a3, "progress"), "totalUnitCount"));
          id v16 = (id)[a3 url];
          a6 = 0;
LABEL_18:
          callbackQueue = self->_callbackQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __92__MCSession_syncCloseIncomingStream_forPeer_state_error_reason_shouldTriggerCancelProgress___block_invoke;
          block[3] = &unk_264337DF8;
          block[4] = self;
          block[5] = a3;
          block[6] = a4;
          block[7] = v16;
          block[8] = a6;
          dispatch_async(callbackQueue, block);
          objc_msgSend((id)objc_msgSend(a3, "observer"), "invalidate");
          [a3 setObserver:0];
          goto LABEL_19;
        }
        unsigned int v21 = (void *)MEMORY[0x263F087E8];
        uint64_t v18 = [NSDictionary dictionaryWithObject:@"Resource transfer interrupted." forKey:*MEMORY[0x263F08320]];
        uint64_t v19 = v21;
        uint64_t v20 = 0;
      }
      a6 = (id)[v19 errorWithDomain:@"MCSession" code:v20 userInfo:v18];
    }
    id v16 = 0;
    goto LABEL_18;
  }
LABEL_19:
  unsigned int v23 = (void *)[a5 incomingStreams];
  objc_msgSend(v23, "removeObjectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(a3, "streamID")));
  objc_msgSend((id)objc_msgSend(a5, "incomingStreams"), "removeObjectForKey:", objc_msgSend(a3, "name"));
}

void __92__MCSession_syncCloseIncomingStream_forPeer_state_error_reason_shouldTriggerCancelProgress___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unsigned __int8 v7 = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "privateDelegate"), "session:didFinishReceivingResourceWithName:fromPeer:atURL:withError:propagate:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "name"), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), &v7);
  if (v7) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didFinishReceivingResourceWithName:fromPeer:atURL:withError:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "name"), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
  }
  v2 = mcs_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = [*(id *)(a1 + 32) privateDelegate];
    uint64_t v5 = [*(id *)(a1 + 32) delegate];
    uint64_t v6 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138413314;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 1024;
    int v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "Resource from [%@]. Interrupted callback pd(%@) d(%@) prop(%d) error[%@].", buf, 0x30u);
  }
}

- (void)syncCloseOutgoingStream:(id)a3 forPeer:(id)a4 state:(id)a5 error:(id)a6 shouldTriggerCancelProgress:(BOOL)a7
{
  BOOL v7 = a7;
  objc_msgSend(a3, "setState:", 4, a4);
  if ([a3 url])
  {
    if (v7) {
      objc_msgSend((id)objc_msgSend(a3, "progress"), "cancel");
    }
    if ([a3 completionHandler])
    {
      id v12 = (id)[a3 completionHandler];
      [a3 setCompletionHandler:0];
      callbackQueue = self->_callbackQueue;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __85__MCSession_syncCloseOutgoingStream_forPeer_state_error_shouldTriggerCancelProgress___block_invoke;
      v15[3] = &unk_264337E20;
      v15[4] = a6;
      v15[5] = v12;
      dispatch_async(callbackQueue, v15);
    }
    if ([a3 urlDownloader])
    {
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "urlDownloader"), "urlTask"), "state") != 3) {
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "urlDownloader"), "urlTask"), "cancel");
      }
      [a3 setUrlDownloader:0];
    }
    objc_msgSend((id)objc_msgSend(a3, "observer"), "invalidate");
    [a3 setObserver:0];
  }
  else if ([a3 source])
  {
    if ([a3 sourceSuspended]) {
      dispatch_resume((dispatch_object_t)[a3 source]);
    }
    dispatch_source_cancel((dispatch_source_t)[a3 source]);
  }
  __int16 v14 = (void *)[a5 outgoingStreams];
  objc_msgSend(v14, "removeObjectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(a3, "streamID")));
  objc_msgSend((id)objc_msgSend(a5, "outgoingStreams"), "removeObjectForKey:", objc_msgSend(a3, "name"));
}

void __85__MCSession_syncCloseOutgoingStream_forPeer_state_error_shouldTriggerCancelProgress___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 40);
}

- (void)syncCloseStreamsForPeer:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_peerStates, "objectForKey:");
  if (v5)
  {
    uint64_t v6 = v5;
    BOOL v7 = objc_msgSend((id)objc_msgSend(v5, "incomingStreams"), "allKeys");
    uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 1, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Peer no longer connected.", *MEMORY[0x263F08320]));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = objc_msgSend((id)objc_msgSend(v6, "incomingStreams"), "objectForKey:", v13);
            if (v14) {
              [(MCSession *)self syncCloseIncomingStream:v14 forPeer:a3 state:v6 error:v8 reason:2 shouldTriggerCancelProgress:1];
            }
          }
        }
        uint64_t v10 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v10);
    }
    int v15 = objc_msgSend((id)objc_msgSend(v6, "outgoingStreams"), "allKeys");
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v21 = objc_msgSend((id)objc_msgSend(v6, "incomingStreams"), "objectForKey:", v20);
            if (v21) {
              [(MCSession *)self syncCloseOutgoingStream:v21 forPeer:a3 state:v6 error:v8 shouldTriggerCancelProgress:1];
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v17);
    }
  }
  else
  {
    v22 = mcs_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = [a3 displayName];
      _os_log_impl(&dword_218756000, v22, OS_LOG_TYPE_DEFAULT, "No peerState object for peer [%@].", buf, 0xCu);
    }
  }
}

- (id)syncDetailedDescription
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v28 = 0;
  NSAppendPrintF();
  NSAppendPrintF();
  NSAppendPrintF();
  if ([(MCSession *)self sessionID]) {
    uint64_t v3 = [(MCSession *)self sessionID];
  }
  else {
    uint64_t v3 = &stru_26C9DA3B0;
  }
  uint64_t v16 = v3;
  NSAppendPrintF();
  id v17 = [(MCPeerID *)[(MCSession *)self myPeerID] displayNameAndPID];
  NSAppendPrintF();
  id v18 = [(MCSession *)self stringForEncryptionPreference:[(MCSession *)self encryptionPreference]];
  NSAppendPrintF();
  uint64_t v4 = [(MCSession *)self securityIdentity];
  uint64_t v5 = "yes";
  if (!v4) {
    uint64_t v5 = "no";
  }
  uint64_t v19 = v5;
  NSAppendPrintF();
  uint64_t v20 = [(NSMutableDictionary *)[(MCSession *)self peerStates] count];
  NSAppendPrintF();
  unint64_t v21 = [(MCSession *)self syncConnectedPeersCount];
  NSAppendPrintF();
  unint64_t v22 = [(MCSession *)self maxPeers];
  NSAppendPrintF();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [(MCSession *)self peerStates];
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v23 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](-[MCSession peerStates](self, "peerStates", v23), "objectForKey:", *(void *)(*((void *)&v24 + 1) + 8 * i)), "description");
        NSAppendPrintF();
      }
      uint64_t v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16, v23);
    }
    while (v8);
  }
  [(MCSession *)self gckSession];
  CFMutableStringRef v11 = GCKSessionCopyDetailedDescription();
  if (v11)
  {
    CFMutableStringRef v12 = v11;
    NSAppendPrintF();
    uint64_t v23 = (uint64_t)v12;
    NSAppendPrintF();
    CFRelease(v12);
  }
  [(MCSession *)self agpSession];
  CFMutableStringRef v13 = AGPSessionCopyDetailedDescription();
  if (v13)
  {
    CFMutableStringRef v14 = v13;
    NSAppendPrintF();
    NSAppendPrintF();
    CFRelease(v14);
  }
  return v28;
}

- (os_state_data_s)syncStateCapture
{
  id v2 = [(MCSession *)self syncDetailedDescription];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = (void *)[MEMORY[0x263F08AC0] dataWithPropertyList:v2 format:200 options:0 error:0];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  size_t v5 = [v3 length];
  uint64_t v6 = (os_state_data_s *)malloc_type_calloc(1uLL, v5 + 200, 0x1B503FBFuLL);
  uint64_t v7 = v6;
  if (v6)
  {
    v6->var0 = 1;
    v6->var1.var1 = v5;
    __strlcpy_chk();
    memcpy(v7->var4, (const void *)[v4 bytes], v5);
  }
  return v7;
}

- (void)startConnectionWithIndirectPID:(unsigned int)a3
{
  uint64_t v19 = 0;
  int v18 = 1350;
  uint64_t v5 = GCKSessionPrepareConnection((uint64_t)self->_gckSession, a3);
  if ((v5 & 0x80000000) != 0)
  {
    uint64_t v8 = v5;
    uint64_t v9 = mcs_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MCSession startConnectionWithIndirectPID:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    id v6 = +[MCSessionPeerConnectionData connectionDataSegmentWithEncryptionPreference:[(MCSession *)self encryptionPreference] identitySet:[(MCSession *)self securityIdentity] != 0 gckSessionConnectionDataBytes:v19 gckSessionConnectionDataLength:v18];
    free(v19);
    syncQueue = self->_syncQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __44__MCSession_startConnectionWithIndirectPID___block_invoke;
    v16[3] = &unk_264337E48;
    unsigned int v17 = a3;
    v16[4] = self;
    v16[5] = v6;
    dispatch_async(syncQueue, v16);
  }
}

uint64_t __44__MCSession_startConnectionWithIndirectPID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncSendXDataConnectionBlobPushToPID:*(unsigned int *)(a1 + 48) connectionBlob:*(void *)(a1 + 40)];
}

- (void)syncCancelIncomingStream:(id)a3 fromPeer:(id)a4
{
  uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 5, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Resource transfer cancelled.", *MEMORY[0x263F08320]));
  uint64_t v8 = [(NSMutableDictionary *)self->_peerStates objectForKey:a4];
  -[MCSession syncSendXDataStreamCloseFromReceiverToPID:streamID:closeReason:](self, "syncSendXDataStreamCloseFromReceiverToPID:streamID:closeReason:", [a4 pid], objc_msgSend(a3, "streamID"), 1);

  [(MCSession *)self syncCloseIncomingStream:a3 forPeer:a4 state:v8 error:v7 reason:1 shouldTriggerCancelProgress:0];
}

- (void)cancelIncomingStream:(id)a3 fromPeer:(id)a4
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__MCSession_cancelIncomingStream_fromPeer___block_invoke;
  block[3] = &unk_264337D80;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(syncQueue, block);
}

uint64_t __43__MCSession_cancelIncomingStream_fromPeer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncCancelIncomingStream:*(void *)(a1 + 40) fromPeer:*(void *)(a1 + 48)];
}

- (void)syncCancelOutgoingStream:(id)a3 toPeer:(id)a4
{
  uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 5, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Resource transfer cancelled.", *MEMORY[0x263F08320]));
  uint64_t v8 = [(NSMutableDictionary *)self->_peerStates objectForKey:a4];
  -[MCSession syncSendXDataStreamCloseFromSenderToPID:streamID:closeReason:](self, "syncSendXDataStreamCloseFromSenderToPID:streamID:closeReason:", [a4 pid], objc_msgSend(a3, "streamID"), 1);

  [(MCSession *)self syncCloseOutgoingStream:a3 forPeer:a4 state:v8 error:v7 shouldTriggerCancelProgress:0];
}

- (void)cancelOutgoingStream:(id)a3 toPeer:(id)a4
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__MCSession_cancelOutgoingStream_toPeer___block_invoke;
  block[3] = &unk_264337D80;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(syncQueue, block);
}

uint64_t __41__MCSession_cancelOutgoingStream_toPeer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncCancelOutgoingStream:*(void *)(a1 + 40) toPeer:*(void *)(a1 + 48)];
}

- (unint64_t)syncConnectedPeersCount
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = (void *)[(NSMutableDictionary *)self->_peerStates allValues];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  unint64_t v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v2);
      }
      if ([*(id *)(*((void *)&v9 + 1) + 8 * i) state] == 2) {
        ++v5;
      }
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (void)syncPeer:(id)a3 changeStateTo:(int64_t)a4 shouldForceCallback:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v9 = (void *)-[NSMutableDictionary objectForKey:](self->_peerStates, "objectForKey:");
  if (v9)
  {
    long long v10 = v9;
    uint64_t v11 = [v9 state];
    long long v12 = mcs_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = [a3 displayName];
      __int16 v21 = 2112;
      id v22 = +[MCSession stringForSessionState:v11];
      __int16 v23 = 2112;
      id v24 = +[MCSession stringForSessionState:a4];
      _os_log_impl(&dword_218756000, v12, OS_LOG_TYPE_DEFAULT, "PeerID [%@] change state from [%@] to [%@].", buf, 0x20u);
    }
    if (v11 != a4) {
      goto LABEL_8;
    }
    uint64_t v13 = mcs_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = +[MCSession stringForSessionState:a4];
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = (uint64_t)v14;
      _os_log_impl(&dword_218756000, v13, OS_LOG_TYPE_DEFAULT, "Peer already in state [%@]", buf, 0xCu);
    }
    if (v5)
    {
LABEL_8:
      if (a4)
      {
        [v10 setState:a4];
      }
      else
      {
        id v16 = a3;
        -[NSMutableDictionary removeObjectForKey:](self->_peerIDMap, "removeObjectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "pid")));
        [(NSMutableDictionary *)self->_peerStates removeObjectForKey:a3];
      }
LABEL_15:
      callbackQueue = self->_callbackQueue;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      _DWORD v18[2] = __56__MCSession_syncPeer_changeStateTo_shouldForceCallback___block_invoke;
      v18[3] = &unk_264337E70;
      v18[4] = self;
      v18[5] = a3;
      v18[6] = a4;
      v18[7] = v11;
      dispatch_async(callbackQueue, v18);
      if (a4)
      {
        if (a4 == 2)
        {
          [(MCSession *)self setMaxPeers:[(MCSession *)self maxPeers] + 1];
          [(MCSession *)self syncLogConnectedPeers];
        }
      }
      else if (![(MCSession *)self syncConnectedPeersCount])
      {
        [(MCSession *)self syncLogMaxConnectedPeers];
        [(MCSession *)self setMaxPeers:0];
      }
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v11 = 0;
      goto LABEL_15;
    }
    uint64_t v15 = mcs_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = [a3 displayName];
      __int16 v21 = 2112;
      id v22 = +[MCSession stringForSessionState:a4];
      _os_log_impl(&dword_218756000, v15, OS_LOG_TYPE_DEFAULT, "No peerState for peerID [%@], newState [%@]. Will not callback.", buf, 0x16u);
    }
  }
}

void __56__MCSession_syncPeer_changeStateTo_shouldForceCallback___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unsigned __int8 v8 = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "privateDelegate"), "session:peer:didChangeState:propagate:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), &v8);
  if (v8) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:peer:didChangeState:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v2 = mcs_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = +[MCSession stringForSessionState:*(void *)(a1 + 56)];
    id v5 = +[MCSession stringForSessionState:*(void *)(a1 + 48)];
    uint64_t v6 = [*(id *)(a1 + 32) privateDelegate];
    uint64_t v7 = [*(id *)(a1 + 32) delegate];
    *(_DWORD *)buf = 138413570;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    __int16 v19 = 1024;
    int v20 = v8;
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "Peer [%@] changed state from [%@] to [%@]; pd(%@) d(%@) prop(%d).",
      buf,
      0x3Au);
  }
}

- (void)syncHandleNetworkEvent:(id *)a3 pid:(unsigned int)a4 freeEventWhenDone:(BOOL *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v203 = *MEMORY[0x263EF8340];
  unint64_t v9 = 0x263F08000uLL;
  uint64_t v10 = [NSNumber numberWithUnsignedLong:a4];
  __int16 v11 = (void *)[(NSMutableDictionary *)self->_peerIDMap objectForKey:v10];
  id v12 = mcs_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t var0 = a3->var0;
    if (var0 > 6) {
      id v24 = "?";
    }
    else {
      id v24 = off_264338238[var0];
    }
    int var2 = a3->var2;
    unsigned int var3 = a3->var3;
    *(_DWORD *)v196 = 136316162;
    *(void *)&v196[4] = v24;
    *(_WORD *)&v196[12] = 1024;
    *(_DWORD *)&v196[14] = var2;
    *(_WORD *)&v196[18] = 1024;
    *(_DWORD *)&v196[20] = var3;
    *(_WORD *)&v196[24] = 1024;
    *(_DWORD *)&v196[26] = v6;
    *(_WORD *)v197 = 2112;
    *(void *)&v197[2] = [v11 displayNameAndPID];
    _os_log_debug_impl(&dword_218756000, v12, OS_LOG_TYPE_DEBUG, "Got GCK event [%s] size=%d status=%d from %08X (peer[%@]).", v196, 0x28u);
    unint64_t v9 = 0x263F08000;
    if (v11) {
      goto LABEL_3;
    }
LABEL_24:
    if (![(NSMutableDictionary *)self->_connectionPendingPeerEvents objectForKey:v10])
    {
      int v36 = a3->var0;
      if (a3->var0 != 5)
      {
        if (v36 == 2)
        {
          v46 = mcs_log();
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
            return;
          }
          *(_DWORD *)v196 = 67109120;
          *(_DWORD *)&v196[4] = v6;
          v47 = "No peerID, no event queue for participant [%08X], peer is already disconnected.Ignoring this disconnect event.";
          goto LABEL_49;
        }
        if (v36)
        {
          v50 = mcs_log();
          if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
            return;
          }
          uint64_t v51 = a3->var0;
          if (v51 > 6) {
            v52 = "?";
          }
          else {
            v52 = off_264338238[v51];
          }
          *(_DWORD *)v196 = 67109378;
          *(_DWORD *)&v196[4] = v6;
          *(_WORD *)&v196[8] = 2080;
          *(void *)&v196[10] = v52;
          v47 = "No peerID, no event queue for participant [%08X]. %s is unexpected at this point - please file a bug in "
                "\"MultipeerConnectivity\" if you see this message and something goes wrong.";
          v48 = v50;
          uint32_t v49 = 18;
          goto LABEL_91;
        }
      }
      -[NSMutableDictionary setObject:forKey:](self->_connectionPendingPeerEvents, "setObject:forKey:", [MEMORY[0x263EFF980] array], v10);
      [(MCSession *)self syncSendXDataPeerIDPushToPID:v6];
      if ([(MCPeerID *)self->_myPeerID pid] > v6)
      {
        global_queue = dispatch_get_global_queue(0, 0);
        v193[0] = MEMORY[0x263EF8330];
        v193[1] = 3221225472;
        v193[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke;
        v193[3] = &unk_264337E98;
        v193[4] = self;
        int v194 = v6;
        dispatch_async(global_queue, v193);
      }
    }
    if (a3->var0 == 2)
    {
      v38 = (void *)[(NSMutableDictionary *)self->_connectionPendingPeerEvents objectForKey:v10];
      long long v187 = 0u;
      long long v188 = 0u;
      long long v185 = 0u;
      long long v186 = 0u;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v185 objects:v201 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v186;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v186 != v40) {
              objc_enumerationMutation(v38);
            }
            free((void *)[*(id *)(*((void *)&v185 + 1) + 8 * i) pointerValue]);
          }
          uint64_t v39 = [v38 countByEnumeratingWithState:&v185 objects:v201 count:16];
        }
        while (v39);
      }
      [(NSMutableDictionary *)self->_connectionPendingPeerEvents removeObjectForKey:v10];
    }
    else if (a3->var0 == 5)
    {
      var1 = a3->var1;
      if (*var1 == 168)
      {
        signed int v34 = a3->var2;
        if (v34 > 3)
        {
          unsigned int v53 = *((unsigned __int16 *)var1 + 1);
          uint64_t v54 = __rev16(v53);
          if (v34 >= bswap32(v53) >> 16)
          {
            v63 = -[MCPeerID initWithSerializedRepresentation:]([MCPeerID alloc], "initWithSerializedRepresentation:", [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:var1 + 4 length:v54 - 4 freeWhenDone:0]);
            [(NSMutableDictionary *)self->_peerIDMap setObject:v63 forKey:v10];
            v64 = [[MCSessionPeerState alloc] initWithPeer:v63];
            [(MCSessionPeerState *)v64 setCertificateDecision:2];
            [(NSMutableDictionary *)self->_peerStates setObject:v64 forKey:v63];
            v65 = mcs_log();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              int v66 = [(MCSessionPeerState *)v64 state];
              *(_DWORD *)v196 = 67109120;
              *(_DWORD *)&v196[4] = v66;
              _os_log_impl(&dword_218756000, v65, OS_LOG_TYPE_DEFAULT, "Indirectly connected - dipatching callback (current state = %d).", v196, 8u);
            }
            v67 = (void *)[(NSMutableDictionary *)self->_connectionPendingPeerEvents objectForKey:v10];
            v68 = mcs_log();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v69 = [v67 count];
              *(_DWORD *)v196 = 134218240;
              *(void *)&v196[4] = v69;
              *(_WORD *)&v196[12] = 1024;
              *(_DWORD *)&v196[14] = v6;
              _os_log_impl(&dword_218756000, v68, OS_LOG_TYPE_DEFAULT, "Processing %lu saved events for pid[%08X].", v196, 0x12u);
            }
            long long v191 = 0u;
            long long v192 = 0u;
            long long v189 = 0u;
            long long v190 = 0u;
            uint64_t v70 = [v67 countByEnumeratingWithState:&v189 objects:v202 count:16];
            if (v70)
            {
              uint64_t v71 = *(void *)v190;
              do
              {
                for (uint64_t j = 0; j != v70; ++j)
                {
                  if (*(void *)v190 != v71) {
                    objc_enumerationMutation(v67);
                  }
                  v73 = (void *)[*(id *)(*((void *)&v189 + 1) + 8 * j) pointerValue];
                  [(MCSession *)self syncHandleNetworkEvent:v73 pid:v6 freeEventWhenDone:0];
                  free(v73);
                }
                uint64_t v70 = [v67 countByEnumeratingWithState:&v189 objects:v202 count:16];
              }
              while (v70);
            }
            [(NSMutableDictionary *)self->_connectionPendingPeerEvents removeObjectForKey:v10];
          }
          else
          {
            v55 = mcs_log();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
              -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:]();
            }
          }
        }
        else
        {
          uint64_t v35 = mcs_log();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:]();
          }
        }
      }
    }
    else
    {
      v42 = (void *)[(NSMutableDictionary *)self->_connectionPendingPeerEvents objectForKey:v10];
      objc_msgSend(v42, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithPointer:", a3));
      v43 = mcs_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = a3->var0;
        if (v44 > 6) {
          v45 = "?";
        }
        else {
          v45 = off_264338238[v44];
        }
        uint64_t v56 = [v42 count];
        *(_DWORD *)v196 = 136315906;
        *(void *)&v196[4] = v45;
        *(_WORD *)&v196[12] = 2048;
        *(void *)&v196[14] = a3;
        *(_WORD *)&v196[22] = 1024;
        *(_DWORD *)&v196[24] = v6;
        *(_WORD *)&v196[28] = 2048;
        *(void *)v197 = v56;
        _os_log_impl(&dword_218756000, v43, OS_LOG_TYPE_DEFAULT, "Saved GCK event [%s] ([%p]) from pid[%08X] (%lu total saved).", v196, 0x26u);
      }
      if (a5) {
        *a5 = 0;
      }
    }
    return;
  }
  if (!v11) {
    goto LABEL_24;
  }
LABEL_3:
  switch(a3->var0)
  {
    case 0:
      [(MCSession *)self syncPeer:v11 changeStateTo:2 shouldForceCallback:0];
      return;
    case 1:
      [(MCSession *)self syncPeer:v11 changeStateTo:0 shouldForceCallback:0];
      return;
    case 2:
      [(MCSession *)self syncCloseStreamsForPeer:v11];
      [(MCSession *)self syncPeer:v11 changeStateTo:0 shouldForceCallback:0];
      return;
    case 3:
      uint64_t v13 = [MEMORY[0x263EFF8F8] dataWithBytes:a3->var1 length:a3->var2];
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_406;
      block[3] = &unk_264337D80;
      block[4] = self;
      block[5] = v13;
      block[6] = v11;
      __int16 v15 = block;
      uint64_t v16 = callbackQueue;
      goto LABEL_8;
    case 5:
      uint64_t v17 = [(NSMutableDictionary *)self->_peerStates objectForKey:v11];
      p_int var2 = &a3->var2;
      if (a3->var2 <= 3)
      {
        __int16 v19 = mcs_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.4();
        }
        return;
      }
      uint64_t v25 = (void *)v17;
      long long v26 = a3->var1;
      int v27 = *v26;
      if ((v27 & 0x80000000) == 0)
      {
        -[MCSession syncHandleXDataDataPacket:packetSize:forPeer:state:](self, "syncHandleXDataDataPacket:packetSize:forPeer:state:", v26);
        return;
      }
      v57 = mcs_log();
      int v58 = v27 & 0x7F;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v59 = XDataControlTypeName(v58);
        *(_DWORD *)v196 = 136315138;
        *(void *)&v196[4] = v59;
        _os_log_impl(&dword_218756000, v57, OS_LOG_TYPE_DEFAULT, "Xdata type %s.", v196, 0xCu);
      }
      if (v58 > 30)
      {
        if (v58 != 31)
        {
          if (v58 == 40)
          {
            v78 = mcs_log();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
              -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:]0();
            }
            return;
          }
          if (v58 == 41)
          {
            if (*p_var2 > 3)
            {
              unsigned int v81 = *((unsigned __int16 *)v26 + 1);
              uint64_t v82 = __rev16(v81);
              if (*p_var2 >= bswap32(v81) >> 16)
              {
                v96 = -[MCSessionPeerConnectionData initWithConnectionDataBlob:]([MCSessionPeerConnectionData alloc], "initWithConnectionDataBlob:", [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v26 + 4 length:v82 - 4 freeWhenDone:0]);
                if (v96)
                {
                  BOOL v97 = [(MCSession *)self encryptionPreference] != MCEncryptionNone
                     && [(MCSessionPeerConnectionData *)v96 encryptionPreference] != 2;
                  uint64_t v16 = dispatch_get_global_queue(0, 0);
                  v170[0] = MEMORY[0x263EF8330];
                  v170[1] = 3221225472;
                  v170[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_431;
                  v170[3] = &unk_264337F88;
                  int v171 = v6;
                  v170[4] = self;
                  v170[5] = v96;
                  BOOL v172 = v97;
                  __int16 v15 = v170;
LABEL_8:
                  dispatch_async(v16, v15);
                }
                else
                {
                  v123 = mcs_log();
                  if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR)) {
                    -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:]3();
                  }
                }
              }
              else
              {
                v83 = mcs_log();
                if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                  -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:]2();
                }
              }
            }
            else
            {
              v74 = mcs_log();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
                -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:]1();
              }
            }
            return;
          }
LABEL_110:
          v79 = mcs_log();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
            -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.5();
          }
          return;
        }
        if (*p_var2 <= 9)
        {
          v77 = mcs_log();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
            -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:]7();
          }
          return;
        }
        if (*p_var2 < bswap32(*((unsigned __int16 *)v26 + 1)) >> 16)
        {
          v89 = mcs_log();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
            -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:]8();
          }
          return;
        }
        uint64_t v115 = bswap32(*((_DWORD *)v26 + 1));
        uint64_t v116 = [*(id *)(v9 + 2584) numberWithUnsignedLong:v115];
        v117 = objc_msgSend((id)objc_msgSend(v25, "outgoingStreams"), "objectForKey:", v116);
        v118 = v117;
        if (v117)
        {
          if (v115 != [v117 streamID])
          {
            v129 = mcs_log();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR)) {
              -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:]9(v118);
            }
            return;
          }
          uint64_t v119 = __rev16(*((unsigned __int16 *)v26 + 4));
          if ([v118 state] == 3)
          {
            [v118 setState:4];
            v120 = mcs_log();
            if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v196 = 67109120;
              *(_DWORD *)&v196[4] = v119;
              _os_log_impl(&dword_218756000, v120, OS_LOG_TYPE_DEFAULT, "Stream close done reason(%d).", v196, 8u);
            }
            if ([v118 url] && objc_msgSend(v118, "completionHandler"))
            {
              if (v119)
              {
                if (v119 == 1)
                {
                  v121 = @"Resource transfer cancelled.";
                  uint64_t v122 = 5;
                }
                else
                {
                  uint64_t v122 = 0;
                  v121 = @"Resource transfer interrupted.";
                }
                objc_msgSend((id)objc_msgSend(v118, "progress"), "cancel");
                uint64_t v161 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", v122, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", v121, *MEMORY[0x263F08320]));
              }
              else
              {
                uint64_t v161 = 0;
              }
              id v162 = (id)[v118 completionHandler];
              [v118 setCompletionHandler:0];
              if (v162)
              {
                v163 = self->_callbackQueue;
                v173[0] = MEMORY[0x263EF8330];
                v173[1] = 3221225472;
                v173[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_430;
                v173[3] = &unk_264337E20;
                v173[4] = v161;
                v173[5] = v162;
                dispatch_async(v163, v173);
              }
            }
            objc_msgSend((id)objc_msgSend(v25, "outgoingStreams"), "removeObjectForKey:", v116);
            objc_msgSend((id)objc_msgSend(v25, "outgoingStreams"), "removeObjectForKey:", objc_msgSend(v118, "name"));
            return;
          }
          if ([v118 state] == 2)
          {
            [v118 setState:3];
            [(MCSession *)self syncSendXDataStreamCloseFromSenderToPID:v6 streamID:v115 closeReason:v119];
            v137 = mcs_log();
            if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v138 = [v118 name];
              *(_DWORD *)v196 = 138412546;
              *(void *)&v196[4] = v138;
              *(_WORD *)&v196[12] = 1024;
              *(_DWORD *)&v196[14] = v115;
              _os_log_impl(&dword_218756000, v137, OS_LOG_TYPE_DEFAULT, "Streaming: Got close from receiver for stream[%@] id[%08X].", v196, 0x12u);
            }
            if ([v118 sourceSuspended]) {
              dispatch_resume((dispatch_object_t)[v118 source]);
            }
            dispatch_source_cancel((dispatch_source_t)[v118 source]);
            [v118 setState:4];
            if ([v118 progress]) {
              objc_msgSend((id)objc_msgSend(v118, "progress"), "cancel");
            }
            objc_msgSend((id)objc_msgSend(v25, "outgoingStreams"), "removeObjectForKey:", v116);
            objc_msgSend((id)objc_msgSend(v25, "outgoingStreams"), "removeObjectForKey:", objc_msgSend(v118, "name"));
            return;
          }
          v46 = mcs_log();
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
            return;
          }
          int v141 = [v118 state];
          *(_DWORD *)v196 = 67109120;
          *(_DWORD *)&v196[4] = v141;
          v47 = "Can't close outgoing stream with state %u != open.";
        }
        else
        {
          v46 = mcs_log();
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
            return;
          }
          *(_DWORD *)v196 = 67109120;
          *(_DWORD *)&v196[4] = v115;
          v47 = "Can't close nonexistent outgoing stream [%08X].";
        }
LABEL_49:
        v48 = v46;
        uint32_t v49 = 8;
LABEL_91:
        _os_log_impl(&dword_218756000, v48, OS_LOG_TYPE_DEFAULT, v47, v196, v49);
        return;
      }
      if (v58 == 20)
      {
        if (*p_var2 <= 12)
        {
          v75 = mcs_log();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
            -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.6();
          }
          return;
        }
        uint64_t v84 = bswap32(*((_DWORD *)v26 + 1));
        unsigned int v85 = *((unsigned __int16 *)v26 + 1);
        __int16 v86 = __rev16(v85);
        if (*p_var2 >= bswap32(v85) >> 16)
        {
          unsigned int v166 = *((_DWORD *)v26 + 2);
          id v167 = (id)[[NSString alloc] initWithBytes:v26 + 12 length:(unsigned __int16)(v86 - 12) encoding:4];
          if (!objc_msgSend((id)objc_msgSend(v25, "incomingStreams"), "objectForKey:", v167))
          {
            if (v26[1])
            {
              [MEMORY[0x263F08850] defaultManager];
              v130 = [[(NSString *)NSTemporaryDirectory() stringByAppendingPathComponent:@"resource.XXXXXXXXXXXXXXXX"] UTF8String];
              v131 = strdup(v130);
              if (!v131)
              {
                v147 = mcs_log();
                if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR)) {
                  -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.9();
                }
                return;
              }
              v132 = v131;
              unsigned int v165 = mkstemp(v131);
              uint64_t v164 = objc_msgSend(NSURL, "fileURLWithPath:isDirectory:", objc_msgSend(NSString, "stringWithUTF8String:", v132), 0);
              free(v132);
              v133 = mcs_log();
              if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v196 = 138412290;
                *(void *)&v196[4] = v164;
                _os_log_impl(&dword_218756000, v133, OS_LOG_TYPE_DEFAULT, "Got resource (temp url = %@).", v196, 0xCu);
              }
              if (v165 == -1)
              {
                v148 = mcs_log();
                if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR)) {
                  -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:]0();
                }
                return;
              }
              int v134 = fcntl(v165, 3, 0);
              if (v134 != -1) {
                fcntl(v165, 4, v134 | 4u);
              }
              fcntl(v165, 73, 1);
              v135 = objc_alloc_init(MCSessionStream);
              [(MCSessionStream *)v135 setName:v167];
              [(MCSessionStream *)v135 setState:2];
              [(MCSessionStream *)v135 setPeerID:v11];
              -[MCSessionStream setStreamID:](v135, "setStreamID:", [v25 newStreamID]);
              [(MCSessionStream *)v135 setFd:v165];
              [(MCSessionStream *)v135 setUrl:v164];
              if (bswap32(v166))
              {
                uint64_t v136 = objc_msgSend(MEMORY[0x263F08AB8], "progressWithTotalUnitCount:");
              }
              else
              {
                [(MCSessionStream *)v135 setProgressUnbounded:1];
                uint64_t v136 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:10000];
              }
              [(MCSessionStream *)v135 setProgress:v136];
              [(NSProgress *)[(MCSessionStream *)v135 progress] setPausable:0];
              v149 = [MCResourceProgressObserver alloc];
              uint64_t v150 = [(MCSessionStream *)v135 name];
              uint64_t v151 = [(MCSessionStream *)v135 progress];
              v183[0] = MEMORY[0x263EF8330];
              v183[1] = 3221225472;
              v183[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_421;
              v183[3] = &unk_264337D80;
              v183[4] = self;
              v183[5] = v135;
              v183[6] = v11;
              v152 = [(MCResourceProgressObserver *)v149 initWithName:v150 progress:v151 cancelHandler:v183];
              [(MCSessionStream *)v135 setObserver:v152];

              [(MCSession *)self syncSendXDataStreamOpenResponseToPID:v6 withRequestID:v84 streamID:[(MCSessionStream *)v135 streamID]];
              objc_msgSend((id)objc_msgSend(v25, "incomingStreams"), "setObject:forKey:", v135, v167);
              objc_msgSend((id)objc_msgSend(v25, "incomingStreams"), "setObject:forKey:", v135, objc_msgSend(*(id *)(v9 + 2584), "numberWithUnsignedLong:", -[MCSessionStream streamID](v135, "streamID")));
              v153 = mcs_log();
              if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v154 = [(MCSessionStream *)v135 progress];
                uint64_t v155 = [(MCSessionStream *)v135 progress];
                uint64_t v156 = [(NSProgress *)[(MCSessionStream *)v135 progress] totalUnitCount];
                *(_DWORD *)v196 = 67110402;
                *(_DWORD *)&v196[4] = v84;
                *(_WORD *)&v196[8] = 2112;
                *(void *)&v196[10] = v167;
                *(_WORD *)&v196[18] = 2112;
                *(void *)&v196[20] = v11;
                *(_WORD *)&v196[28] = 2112;
                *(void *)v197 = v154;
                *(_WORD *)&v197[8] = 2048;
                uint64_t v198 = v155;
                __int16 v199 = 2048;
                uint64_t v200 = v156;
                _os_log_impl(&dword_218756000, v153, OS_LOG_TYPE_DEFAULT, "Stream open request [%u] resource [%@] peer[%@] progress[%@]@[%p] size(%lld) - dispatching callback.", v196, 0x3Au);
              }
              v157 = self->_callbackQueue;
              v182[0] = MEMORY[0x263EF8330];
              v182[1] = 3221225472;
              v182[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_422;
              v182[3] = &unk_264337EC0;
              v182[4] = self;
              v182[5] = v167;
              v182[6] = v11;
              v182[7] = v135;
              dispatch_async(v157, v182);
            }
            else
            {
              if (pipe(v195))
              {
                v124 = mcs_log();
                if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR)) {
                  -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.8();
                }
                [(MCSession *)self syncSendXDataStreamOpenResponseToPID:v6 withRequestID:v84 streamID:0x80000000];
                return;
              }
              uint64_t v142 = v195[1];
              v143 = (void *)_CFReadStreamCreateFromFileDescriptor();
              int v144 = fcntl(v142, 3, 0);
              if (v144 != -1) {
                fcntl(v142, 4, v144 | 4u);
              }
              fcntl(v142, 73, 1);
              v135 = objc_alloc_init(MCSessionStream);
              [(MCSessionStream *)v135 setName:v167];
              [(MCSessionStream *)v135 setState:2];
              [(MCSessionStream *)v135 setPeerID:v11];
              -[MCSessionStream setStreamID:](v135, "setStreamID:", [v25 newStreamID]);
              [(MCSessionStream *)v135 setFd:v142];
              [(MCSession *)self syncSendXDataStreamOpenResponseToPID:v6 withRequestID:v84 streamID:[(MCSessionStream *)v135 streamID]];
              objc_msgSend((id)objc_msgSend(v25, "incomingStreams"), "setObject:forKey:", v135, v167);
              objc_msgSend((id)objc_msgSend(v25, "incomingStreams"), "setObject:forKey:", v135, objc_msgSend(*(id *)(v9 + 2584), "numberWithUnsignedLong:", -[MCSessionStream streamID](v135, "streamID")));
              v145 = mcs_log();
              if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v196 = 67109634;
                *(_DWORD *)&v196[4] = v84;
                *(_WORD *)&v196[8] = 2112;
                *(void *)&v196[10] = v167;
                *(_WORD *)&v196[18] = 2112;
                *(void *)&v196[20] = v11;
                _os_log_impl(&dword_218756000, v145, OS_LOG_TYPE_DEFAULT, "Stream open request [%u] stream [%@] peer[%@]. Dispatching callback.", v196, 0x1Cu);
              }
              v146 = self->_callbackQueue;
              v181[0] = MEMORY[0x263EF8330];
              v181[1] = 3221225472;
              v181[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_423;
              v181[3] = &unk_264337EC0;
              v181[4] = self;
              v181[5] = v143;
              v181[6] = v167;
              v181[7] = v11;
              dispatch_async(v146, v181);
            }
            int v158 = [(MCSessionStream *)v135 fd];
            v135->_source = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8418], v158, 0, (dispatch_queue_t)self->_syncQueue);
            -[MCSessionStream setIncomingBuffer:](v135, "setIncomingBuffer:", [MEMORY[0x263EFF990] data]);
            v159 = [(MCSessionStream *)v135 source];
            v179[0] = MEMORY[0x263EF8330];
            v179[1] = 3221225472;
            v179[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_424;
            v179[3] = &unk_264337F10;
            v179[4] = v135;
            v179[5] = self;
            int v180 = v6;
            v179[6] = v11;
            v179[7] = v25;
            dispatch_source_set_event_handler(v159, v179);
            v160 = [(MCSessionStream *)v135 source];
            v178[0] = MEMORY[0x263EF8330];
            v178[1] = 3221225472;
            v178[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_425;
            v178[3] = &unk_264337EE8;
            v178[4] = v135;
            dispatch_source_set_cancel_handler(v160, v178);
            [(MCSessionStream *)v135 setSourceSuspended:1];
            return;
          }
          v98 = mcs_log();
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v99 = [v167 UTF8String];
            *(_DWORD *)v196 = 136315138;
            *(void *)&v196[4] = v99;
            _os_log_impl(&dword_218756000, v98, OS_LOG_TYPE_DEFAULT, "Stream open request - stream already exists %s.", v196, 0xCu);
          }
        }
        else
        {
          v87 = mcs_log();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
            -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.7();
          }
        }
        [(MCSession *)self syncSendXDataStreamOpenResponseToPID:v6 withRequestID:v84 streamID:0x80000000];
        return;
      }
      if (v58 == 21)
      {
        if (*p_var2 > 11)
        {
          if (*p_var2 >= bswap32(*((unsigned __int16 *)v26 + 1)) >> 16)
          {
            unsigned int v100 = *((_DWORD *)v26 + 2);
            uint64_t v101 = [*(id *)(v9 + 2584) numberWithUnsignedLong:bswap32(*((_DWORD *)v26 + 1))];
            uint64_t v102 = bswap32(v100);
            uint64_t v103 = [*(id *)(v9 + 2584) numberWithUnsignedLong:v102];
            v104 = objc_msgSend((id)objc_msgSend(v25, "outgoingStreamRequests"), "objectForKey:", v101);
            v105 = v104;
            if (v104)
            {
              BOOL v106 = [v104 state] == 1;
              v107 = mcs_log();
              v108 = v107;
              if (v106)
              {
                if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v109 = [v105 name];
                  int v110 = [v105 streamID];
                  *(_DWORD *)v196 = 138412546;
                  *(void *)&v196[4] = v109;
                  *(_WORD *)&v196[12] = 1024;
                  *(_DWORD *)&v196[14] = v110;
                  _os_log_impl(&dword_218756000, v108, OS_LOG_TYPE_DEFAULT, "Streaming: Got open response stream[%@] id[%08X].", v196, 0x12u);
                }
                v111 = v105;
                objc_msgSend((id)objc_msgSend(v25, "outgoingStreamRequests"), "removeObjectForKey:", v101);
                objc_msgSend((id)objc_msgSend(v25, "outgoingStreamRequests"), "removeObjectForKey:", objc_msgSend(v105, "name"));
                objc_msgSend((id)objc_msgSend(v25, "outgoingStreams"), "setObject:forKey:", v105, v103);
                objc_msgSend((id)objc_msgSend(v25, "outgoingStreams"), "setObject:forKey:", v105, objc_msgSend(v105, "name"));
                [v105 setState:2];
                [v105 setStreamID:v102];
                if ([v105 url] && (objc_msgSend((id)objc_msgSend(v105, "url"), "isFileURL") & 1) == 0)
                {
                  uint64_t v140 = objc_msgSend((id)objc_msgSend(v105, "urlDownloader"), "urlResponseHandler");
                  (*(void (**)(uint64_t, uint64_t))(v140 + 16))(v140, 1);
                  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v105, "urlDownloader"), "urlTask"), "resume");
                }
                else
                {
                  int v112 = [v105 fd];
                  v105[1] = dispatch_source_create(MEMORY[0x263EF83E8], v112, 0, (dispatch_queue_t)self->_syncQueue);
                  v113 = [v105 source];
                  handler[0] = MEMORY[0x263EF8330];
                  handler[1] = 3221225472;
                  handler[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_426;
                  handler[3] = &unk_264337F60;
                  handler[4] = v105;
                  handler[5] = self;
                  int v176 = v6;
                  int v177 = v102;
                  dispatch_source_set_event_handler(v113, handler);
                  v114 = [v105 source];
                  v174[0] = MEMORY[0x263EF8330];
                  v174[1] = 3221225472;
                  v174[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_429;
                  v174[3] = &unk_264337EE8;
                  v174[4] = v105;
                  dispatch_source_set_cancel_handler(v114, v174);
                  dispatch_resume((dispatch_object_t)[v105 source]);
                  [v105 setSourceSuspended:0];
                }
              }
              else if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
              {
                -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:]4(v105);
              }
            }
            else
            {
              v125 = mcs_log();
              if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR)) {
                -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:]3();
              }
            }
          }
          else
          {
            v88 = mcs_log();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
              -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:]2();
            }
          }
        }
        else
        {
          v76 = mcs_log();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
            -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:]1();
          }
        }
        return;
      }
      if (v58 != 30) {
        goto LABEL_110;
      }
      if (*p_var2 <= 9)
      {
        v60 = mcs_log();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
          -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:]5();
        }
        return;
      }
      if (*p_var2 < bswap32(*((unsigned __int16 *)v26 + 1)) >> 16)
      {
        v80 = mcs_log();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
          -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:]6();
        }
        return;
      }
      uint64_t v90 = bswap32(*((_DWORD *)v26 + 1));
      uint64_t v91 = [*(id *)(v9 + 2584) numberWithUnsignedLong:v90];
      v92 = objc_msgSend((id)objc_msgSend(v25, "incomingStreams"), "objectForKey:", v91);
      v93 = v92;
      if (!v92)
      {
        v46 = mcs_log();
        if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        *(_DWORD *)v196 = 67109120;
        *(_DWORD *)&v196[4] = v90;
        v47 = "Can't close nonexistent incoming stream %u.";
        goto LABEL_49;
      }
      uint64_t v94 = __rev16(*((unsigned __int16 *)v26 + 4));
      if ([v92 state] == 3)
      {
        [v93 setState:4];
        v95 = mcs_log();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v196 = 67109120;
          *(_DWORD *)&v196[4] = v94;
          _os_log_impl(&dword_218756000, v95, OS_LOG_TYPE_DEFAULT, "Stream close done reason(%d).", v196, 8u);
        }
        objc_msgSend((id)objc_msgSend(v25, "incomingStreams"), "removeObjectForKey:", v91);
        objc_msgSend((id)objc_msgSend(v25, "incomingStreams"), "removeObjectForKey:", objc_msgSend(v93, "name"));
        return;
      }
      if ([v93 state] != 2)
      {
        v46 = mcs_log();
        if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        int v139 = [v93 state];
        *(_DWORD *)v196 = 67109120;
        *(_DWORD *)&v196[4] = v139;
        v47 = "Can't close incoming stream with state %u != open.";
        goto LABEL_49;
      }
      [v93 setState:3];
      -[MCSession syncSendXDataStreamCloseFromReceiverToPID:streamID:closeReason:](self, "syncSendXDataStreamCloseFromReceiverToPID:streamID:closeReason:", [v11 pid], objc_msgSend(v93, "streamID"), v94);
      v126 = mcs_log();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v127 = [v93 name];
        *(_DWORD *)v196 = 138412546;
        *(void *)&v196[4] = v127;
        *(_WORD *)&v196[12] = 1024;
        *(_DWORD *)&v196[14] = v90;
        _os_log_impl(&dword_218756000, v126, OS_LOG_TYPE_DEFAULT, "Streaming: Got close from sender for stream[%@] id[%08X].", v196, 0x12u);
      }
      if (!objc_msgSend((id)objc_msgSend(v93, "incomingBuffer"), "length") || v94)
      {
        [(MCSession *)self syncCloseIncomingStream:v93 forPeer:v11 state:v25 error:0 reason:v94 shouldTriggerCancelProgress:0];
        return;
      }
      v128 = mcs_log();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v196 = 0;
        v47 = "XDataStreamCloseFromSender received but have more bytes to write.";
        v48 = v128;
        uint32_t v49 = 2;
        goto LABEL_91;
      }
      return;
    case 6:
      int v20 = (void *)[(NSMutableDictionary *)self->_peerStates objectForKey:v11];
      if (a3->var1)
      {
        *(void *)v196 = 0;
        __memcpy_chk();
        uint64_t v21 = *(void **)v196;
        id v22 = *(id *)v196;
      }
      else
      {
        uint64_t v21 = 0;
      }
      long long v28 = mcs_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = [v11 displayName];
        if (v21) {
          int v30 = [v21 count];
        }
        else {
          int v30 = 0;
        }
        int v61 = [v20 certificateDecision];
        *(_DWORD *)v196 = 138412802;
        *(void *)&v196[4] = v29;
        *(_WORD *)&v196[12] = 1024;
        *(_DWORD *)&v196[14] = v30;
        *(_WORD *)&v196[18] = 1024;
        *(_DWORD *)&v196[20] = v61;
        _os_log_impl(&dword_218756000, v28, OS_LOG_TYPE_DEFAULT, "Remote certificate event for peer [%@] - certificate length [%d], certificateDecision state [%d].", v196, 0x18u);
      }
      v169[0] = MEMORY[0x263EF8330];
      v169[1] = 3221225472;
      v169[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_432;
      v169[3] = &unk_264337FD8;
      v169[4] = self;
      v169[5] = v20;
      v169[6] = v11;
      v62 = (void (**)(id, uint64_t))(id)[v169 copy];
      if ([v20 certificateDecision] == 2)
      {
        v62[2](v62, 1);
        return;
      }
      if ([v20 certificateDecision] == 3)
      {
        v62[2](v62, 0);
        return;
      }
      if ([v20 certificateDecision]) {
        return;
      }
      [v20 setCertificateDecision:1];
      uint64_t v16 = self->_callbackQueue;
      v168[0] = MEMORY[0x263EF8330];
      v168[1] = 3221225472;
      v168[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_437;
      v168[3] = &unk_264338000;
      v168[4] = self;
      v168[5] = v21;
      v168[6] = v11;
      v168[7] = v62;
      __int16 v15 = v168;
      goto LABEL_8;
    default:
      return;
  }
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startConnectionWithIndirectPID:*(unsigned int *)(a1 + 40)];
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_406(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unsigned __int8 v7 = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "privateDelegate"), "session:didReceiveData:fromPeer:propagate:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), &v7);
  if (v7) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didReceiveData:fromPeer:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v2 = mcs_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = [*(id *)(a1 + 40) length];
    uint64_t v5 = [*(id *)(a1 + 32) privateDelegate];
    uint64_t v6 = [*(id *)(a1 + 32) delegate];
    *(_DWORD *)buf = 138413314;
    uint64_t v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    __int16 v16 = 1024;
    int v17 = v7;
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "Incoming packet from [%@] (%lu) - done callback pd(%@) d(%@) prop(%d).", buf, 0x30u);
  }
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_421(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelIncomingStream:*(void *)(a1 + 40) fromPeer:*(void *)(a1 + 48)];
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_422(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned __int8 v6 = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "privateDelegate"), "session:didStartReceivingResourceWithName:fromPeer:withProgress:propagate:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "progress"), &v6);
  if (v6) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didStartReceivingResourceWithName:fromPeer:withProgress:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "progress"));
  }
  id v2 = mcs_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = [*(id *)(a1 + 32) privateDelegate];
    uint64_t v5 = [*(id *)(a1 + 32) delegate];
    *(_DWORD *)buf = 138413058;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 1024;
    int v14 = v6;
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "Did start receiving resource for peer [%@] dispatched. Callback pd(%@) d(%@) prop(%d).", buf, 0x26u);
  }
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_423(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unsigned __int8 v7 = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "privateDelegate"), "session:didReceiveStream:withName:fromPeer:propagate:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), &v7);
  if (v7) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didReceiveStream:withName:fromPeer:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  id v2 = mcs_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v5 = [*(id *)(a1 + 32) privateDelegate];
    uint64_t v6 = [*(id *)(a1 + 32) delegate];
    *(_DWORD *)buf = 138413314;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    __int16 v16 = 1024;
    int v17 = v7;
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "Did receive stream for peer [%@] with name [%@] dispatched. Callback pd(%@) d(%@) prop(%d).", buf, 0x30u);
  }
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_424(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) state] == 2
    || [*(id *)(a1 + 32) state] == 3)
  {
    unsigned int v2 = write([*(id *)(a1 + 32) fd], (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "incomingBuffer"), "bytes"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "incomingBuffer"), "length"));
    if (v2)
    {
      if ((v2 & 0x80000000) != 0)
      {
        if (*__error() == 35 || *__error() == 4 || *__error() == 36)
        {
          dispatch_suspend((dispatch_object_t)[*(id *)(a1 + 32) source]);
          [*(id *)(a1 + 32) setSourceSuspended:1];
          dispatch_time_t v12 = dispatch_time(0, 1000000000);
          uint64_t v13 = *(NSObject **)(*(void *)(a1 + 40) + 96);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_2;
          block[3] = &unk_264337EE8;
          block[4] = *(void *)(a1 + 32);
          dispatch_after(v12, v13, block);
        }
        else
        {
          int v27 = mcs_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            int v28 = *__error();
            uint64_t v29 = [*(id *)(a1 + 32) name];
            int v30 = [*(id *)(a1 + 32) streamID];
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)uint64_t v33 = v28;
            *(_WORD *)&v33[4] = 2112;
            *(void *)&v33[6] = v29;
            *(_WORD *)&v33[14] = 1024;
            *(_DWORD *)&v33[16] = v30;
            _os_log_impl(&dword_218756000, v27, OS_LOG_TYPE_DEFAULT, "Incoming stream: error(%d) stream[%@] %08X.", buf, 0x18u);
          }
          [*(id *)(a1 + 32) setState:3];
          dispatch_source_cancel((dispatch_source_t)[*(id *)(a1 + 32) source]);
          objc_msgSend(*(id *)(a1 + 40), "syncSendXDataStreamCloseFromReceiverToPID:streamID:closeReason:", *(unsigned int *)(a1 + 64), objc_msgSend(*(id *)(a1 + 32), "streamID"), 2);
        }
      }
      else
      {
        uint64_t v3 = v2;
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "incomingBuffer"), "replaceBytesInRange:withBytes:length:", 0, v2, 0, 0);
        if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "incomingBuffer"), "length"))
        {
          if ([*(id *)(a1 + 32) state] == 3)
          {
            uint64_t v5 = *(void *)(a1 + 32);
            uint64_t v4 = *(void **)(a1 + 40);
            uint64_t v6 = *(void *)(a1 + 48);
            uint64_t v7 = *(void *)(a1 + 56);
            [v4 syncCloseIncomingStream:v5 forPeer:v6 state:v7 error:0 reason:0 shouldTriggerCancelProgress:0];
            return;
          }
          dispatch_suspend((dispatch_object_t)[*(id *)(a1 + 32) source]);
          [*(id *)(a1 + 32) setSourceSuspended:1];
        }
        if ([*(id *)(a1 + 32) progress])
        {
          int v14 = [*(id *)(a1 + 32) progressUnbounded];
          uint64_t v15 = (void *)[*(id *)(a1 + 32) progress];
          __int16 v16 = v15;
          if (v14)
          {
            uint64_t v17 = [v15 totalUnitCount];
            uint64_t v18 = v17 - objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "progress"), "completedUnitCount");
            __int16 v19 = (void *)[*(id *)(a1 + 32) progress];
            uint64_t v20 = (uint64_t)((double)[v19 completedUnitCount] + (double)v18 * 0.05);
            uint64_t v21 = v19;
          }
          else
          {
            uint64_t v20 = [v15 completedUnitCount] + v3;
            uint64_t v21 = v16;
          }
          [v21 setCompletedUnitCount:v20];
          id v22 = mcs_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "progress"), "completedUnitCount");
            uint64_t v24 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "progress"), "totalUnitCount");
            double v25 = (double)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "progress"), "completedUnitCount");
            uint64_t v26 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "progress"), "totalUnitCount");
            *(_DWORD *)buf = 134218496;
            *(void *)uint64_t v33 = v23;
            *(_WORD *)&v33[8] = 2048;
            *(void *)&v33[10] = v24;
            *(_WORD *)&v33[18] = 2048;
            double v34 = v25 / (double)v26;
            _os_log_impl(&dword_218756000, v22, OS_LOG_TYPE_DEFAULT, "Incoming stream - progress update (%lld / %lld = %.3lf).", buf, 0x20u);
          }
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) setState:3];
      dispatch_source_cancel((dispatch_source_t)[*(id *)(a1 + 32) source]);
      uint64_t v8 = *(unsigned int *)(a1 + 64);
      uint64_t v9 = *(void **)(a1 + 40);
      uint64_t v10 = [*(id *)(a1 + 32) streamID];
      [v9 syncSendXDataStreamCloseFromReceiverToPID:v8 streamID:v10 closeReason:1];
    }
  }
  else
  {
    dispatch_suspend((dispatch_object_t)[*(id *)(a1 + 32) source]);
    uint64_t v11 = *(void **)(a1 + 32);
    [v11 setSourceSuspended:1];
  }
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result == 2)
  {
    uint64_t result = [*(id *)(a1 + 32) sourceSuspended];
    if (result)
    {
      dispatch_resume((dispatch_object_t)[*(id *)(a1 + 32) source]);
      uint64_t v3 = *(void **)(a1 + 32);
      return [v3 setSourceSuspended:0];
    }
  }
  return result;
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_425(uint64_t a1)
{
  close([*(id *)(a1 + 32) fd]);
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  unsigned int v2 = *(void **)(a1 + 32);

  return [v2 setSource:0];
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_426(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  dispatch_suspend((dispatch_object_t)[*(id *)(a1 + 32) source]);
  [*(id *)(a1 + 32) setSourceSuspended:1];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    unsigned int v2 = (_DWORD *)((char *)v23 - ((AGPSessionMaximumSegmentSize(1) + 15) & 0x1FFFFFFF0));
    int v3 = [*(id *)(a1 + 32) fd];
    int v4 = AGPSessionMaximumSegmentSize(1);
    unsigned int v5 = read(v3, v2 + 1, v4 - 4);
    if (v5)
    {
      uint64_t v6 = mcs_log();
      uint64_t v7 = v6;
      if ((v5 & 0x80000000) != 0)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_426_cold_1();
        }
      }
      else
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = [*(id *)(a1 + 32) name];
          int v9 = v5 + 4;
          *(_DWORD *)buf = 138412802;
          uint64_t v29 = v8;
          __int16 v30 = 1024;
          unsigned int v31 = v5;
          __int16 v32 = 1024;
          unsigned int v33 = v5 + 4;
          _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "Streaming: Outgoing stream [%@]: read %d bytes to send (total %d).", buf, 0x18u);
        }
        else
        {
          int v9 = v5 + 4;
        }
        unsigned int v16 = [*(id *)(a1 + 32) streamID];
        _DWORD *v2 = bswap32(v16);
        *(_DWORD *)buf = 0;
        int v17 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "peerID"), "pid");
        unsigned int v26 = v16;
        int v27 = v17;
        uint64_t v18 = *(void *)(a1 + 40);
        uint64_t v19 = *(void *)(v18 + 80);
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_427;
        v23[3] = &unk_264337F38;
        int v24 = v17;
        unsigned int v25 = v5;
        uint64_t v20 = *(void *)(a1 + 32);
        v23[4] = v18;
        v23[5] = v20;
        if (AGPSessionSendTo(v19, &v27, 1, (uint64_t)v2, v9, (uint64_t)buf, 0, 0xAu, 1, v23))
        {
          uint64_t v21 = mcs_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_426_cold_2();
          }
        }
        if ([*(id *)(a1 + 32) progress])
        {
          id v22 = (void *)[*(id *)(a1 + 32) progress];
          objc_msgSend(v22, "setCompletedUnitCount:", objc_msgSend(v22, "completedUnitCount") + v5);
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) setState:3];
      dispatch_resume((dispatch_object_t)[*(id *)(a1 + 32) source]);
      dispatch_source_cancel((dispatch_source_t)[*(id *)(a1 + 32) source]);
      [*(id *)(a1 + 40) syncSendXDataStreamCloseFromSenderToPID:*(unsigned int *)(a1 + 48) streamID:*(unsigned int *)(a1 + 52) closeReason:0];
      uint64_t v13 = mcs_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [*(id *)(a1 + 32) name];
        unsigned int v15 = [*(id *)(a1 + 32) streamID];
        *(_DWORD *)buf = 138412546;
        uint64_t v29 = v14;
        __int16 v30 = 1024;
        unsigned int v31 = v15;
        _os_log_impl(&dword_218756000, v13, OS_LOG_TYPE_DEFAULT, "Streaming: closing stream[%@] %08X.", buf, 0x12u);
      }
    }
  }
  else
  {
    uint64_t v10 = mcs_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [*(id *)(a1 + 32) name];
      unsigned int v12 = [*(id *)(a1 + 32) streamID];
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v11;
      __int16 v30 = 1024;
      unsigned int v31 = v12;
      _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "Streaming: stream not open for sending [%@] %08X.", buf, 0x12u);
    }
  }
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_427(int8x16_t *a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  uint64_t v6 = a1[3].i64[0];
  int8x16_t v1 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v2 = a1[2].i64[0];
  v4[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_2_428;
  v4[3] = &unk_264337F38;
  int v3 = *(NSObject **)(v2 + 96);
  int8x16_t v5 = v1;
  __int32 v7 = a1[3].i32[2];
  dispatch_async(v3, v4);
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_2_428(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = mcs_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 48);
    int v4 = *(_DWORD *)(a1 + 52) + 4;
    uint64_t v5 = [*(id *)(a1 + 32) name];
    int v6 = [*(id *)(a1 + 32) state];
    v9[0] = 67109890;
    v9[1] = v3;
    __int16 v10 = 1024;
    int v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 1024;
    int v15 = v6;
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "Streaming: Outgoing stream source to participant [%08X]: segment (%d) put on wire for stream [%@] state [%d].", (uint8_t *)v9, 0x1Eu);
  }
  if ([*(id *)(a1 + 32) progress]
    && (uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "progress"), "completedUnitCount"),
        v7 == objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "progress"), "totalUnitCount")))
  {
    [*(id *)(a1 + 32) setState:3];
    dispatch_resume((dispatch_object_t)[*(id *)(a1 + 32) source]);
    dispatch_source_cancel((dispatch_source_t)[*(id *)(a1 + 32) source]);
    return [*(id *)(a1 + 40) syncSendXDataStreamCloseFromSenderToPID:*(unsigned int *)(a1 + 48) streamID:*(unsigned int *)(a1 + 56) closeReason:0];
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) source];
    if (result)
    {
      uint64_t result = [*(id *)(a1 + 32) state];
      if (result == 2)
      {
        dispatch_resume((dispatch_object_t)[*(id *)(a1 + 32) source]);
        return [*(id *)(a1 + 32) setSourceSuspended:0];
      }
    }
  }
  return result;
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_429(uint64_t a1)
{
  close([*(id *)(a1 + 32) fd]);
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setSource:0];
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_430(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_431(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unsigned int v2 = *(_DWORD *)(a1 + 48);
  if (v2 > [*(id *)(*(void *)(a1 + 32) + 48) pid]) {
    [*(id *)(a1 + 32) startConnectionWithIndirectPID:*(unsigned int *)(a1 + 48)];
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 72);
  int v4 = *(_DWORD *)(a1 + 48);
  int v5 = [*(id *)(a1 + 40) hasIdentitySet];
  int v6 = *(unsigned __int8 *)(a1 + 52);
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gckSessionConnectionData"), "bytes");
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gckSessionConnectionData"), "length");
  int v7 = GCKSessionEstablishConnection(v3, v4, v5, v6);
  if (v7 < 0)
  {
    int v8 = v7;
    int v9 = mcs_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      uint64_t v11 = v8;
      _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "Mesh establishment failed (%08lX).", (uint8_t *)&v10, 0xCu);
    }
  }
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_432(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_2_433;
  v9[3] = &unk_264337FB0;
  v9[4] = *(void *)(a1 + 40);
  char v10 = a2;
  dispatch_async(v4, v9);
  int v5 = mcs_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [*(id *)(a1 + 48) displayName];
    int v7 = "NOT accepted";
    if (a2) {
      int v7 = "accepted";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v6;
    __int16 v13 = 2080;
    __int16 v14 = v7;
    _os_log_impl(&dword_218756000, v5, OS_LOG_TYPE_DEFAULT, "Certificate from peer [%@] is %s.", buf, 0x16u);
  }
  return GCKSessionCertificateDecision(*(void *)(*(void *)(a1 + 32) + 72), [*(id *)(a1 + 48) pid], a2);
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_2_433(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v1 = 2;
  }
  else {
    uint64_t v1 = 3;
  }
  return [*(id *)(a1 + 32) setCertificateDecision:v1];
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_437(uint64_t a1)
{
  char v3 = 1;
  [*(id *)(a1 + 32) privateDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "privateDelegate"), "session:didReceiveCertificate:fromPeer:certificateHandler:propagate:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), &v3), v3))
  {
    [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didReceiveCertificate:fromPeer:certificateHandler:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
    }
    else {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  return result;
}

- (MCSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)MCSession;
  [(MCSession *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

- (MCSession)initWithPeer:(MCPeerID *)myPeerID
{
  BOOL v5 = dyld_get_program_sdk_version() >> 16 > 8;

  return [(MCSession *)self initWithPeer:myPeerID securityIdentity:0 encryptionPreference:v5];
}

- (MCSession)initWithPeer:(MCPeerID *)myPeerID securityIdentity:(NSArray *)identity encryptionPreference:(MCEncryptionPreference)encryptionPreference
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)MCSession;
  int v8 = [(MCSession *)&v26 init];
  if (!v8) {
    return v8;
  }
  if (!myPeerID)
  {
    int v9 = (void *)MEMORY[0x263EFF940];
    char v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    uint64_t v12 = (objc_class *)objc_opt_class();
    [v9 raise:*MEMORY[0x263EFF4A0], @"A nil %@ object passed to %@", v11, NSStringFromClass(v12) format];
  }
  v8->_gckSession = (OpaqueGCKSession *)0xFFFFFFFFLL;
  v8->_agpSession = (OpaqueAGPSession *)0xFFFFFFFFLL;
  v8->_sessionID = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString");
  int v13 = [(MCPeerID *)myPeerID pid];
  v8->_gckPID = v13;
  if (GCKSessionCreate(v13, identity, (uint64_t)GCKEventListenerForMCSession, (uint64_t)v8, v8->_sessionID, &v8->_gckSession))
  {
    __int16 v14 = mcs_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MCSession initWithPeer:securityIdentity:encryptionPreference:]();
    }
LABEL_13:
    if (v8->_agpSession != (OpaqueAGPSession *)0xFFFFFFFFLL) {
      AGPSessionRelease();
    }
    if (v8->_gckSession != (OpaqueGCKSession *)0xFFFFFFFFLL) {
      GCKSessionRelease();
    }
    syncQueue = v8->_syncQueue;
    if (syncQueue) {
      dispatch_release(syncQueue);
    }
    callbackQueue = v8->_callbackQueue;
    if (callbackQueue) {
      dispatch_release(callbackQueue);
    }

    return 0;
  }
  v8->_syncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MCSession.syncQueue", 0);
  v8->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MCSession.callbackQueue", 0);
  if (AGPSessionCreate())
  {
    uint64_t v15 = mcs_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MCSession initWithPeer:securityIdentity:encryptionPreference:]();
    }
    goto LABEL_13;
  }
  if (GCKSessionStartEventCallbacks())
  {
    uint64_t v16 = mcs_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MCSession initWithPeer:securityIdentity:encryptionPreference:]();
    }
    goto LABEL_13;
  }
  v8->_myPeerID = (MCPeerID *)[(MCPeerID *)myPeerID copy];
  v8->_securityIdentity = (NSArray *)[(NSArray *)identity copy];
  v8->_encryptionPreference = encryptionPreference;
  v8->_peerIDMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8->_peerStates = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8->_connectionPendingPeerEvents = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v20 = mcs_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    sessionID = v8->_sessionID;
    uint64_t v22 = [(MCPeerID *)v8->_myPeerID displayNameAndPID];
    if (v8->_securityIdentity) {
      uint64_t v23 = "yes";
    }
    else {
      uint64_t v23 = "no";
    }
    uint64_t v24 = [(MCSession *)v8 stringForEncryptionPreference:v8->_encryptionPreference];
    *(_DWORD *)buf = 136316418;
    int v28 = "Nov 10 2024";
    __int16 v29 = 2080;
    __int16 v30 = "21:13:33";
    __int16 v31 = 2112;
    __int16 v32 = sessionID;
    __int16 v33 = 2112;
    uint64_t v34 = v22;
    __int16 v35 = 2080;
    int v36 = v23;
    __int16 v37 = 2112;
    uint64_t v38 = v24;
    _os_log_impl(&dword_218756000, v20, OS_LOG_TYPE_DEFAULT, "MCSession init done! [MCS: %s - %s, sessionID=%@ peerID=%@ securityIdentity=%s encryptionPreference=%@].", buf, 0x3Eu);
  }
  objc_initWeak((id *)buf, v8);
  objc_copyWeak(&v25, (id *)buf);
  v8->_stateHandle = os_state_add_handler();
  [(MCSession *)v8 logSessionInfo];
  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
  return v8;
}

uint64_t __64__MCSession_initWithPeer_securityIdentity_encryptionPreference___block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  return [Weak syncStateCapture];
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_agpSession != (OpaqueAGPSession *)0xFFFFFFFFLL) {
    AGPSessionRelease();
  }
  if (self->_gckSession != (OpaqueGCKSession *)0xFFFFFFFFLL) {
    GCKSessionRelease();
  }
  objc_super v3 = (void *)[(NSMutableDictionary *)self->_peerStates allValues];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[MCSession syncCloseStreamsForPeer:](self, "syncCloseStreamsForPeer:", [*(id *)(*((void *)&v9 + 1) + 8 * i) peerID]);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  if (self->_stateHandle)
  {
    os_state_remove_handler();
    self->_stateHandle = 0;
  }

  objc_storeWeak((id *)&self->_delegate, 0);
  objc_storeWeak((id *)&self->_privateDelegate, 0);
  v8.receiver = self;
  v8.super_class = (Class)MCSession;
  [(MCSession *)&v8 dealloc];
}

- (void)syncGetConnectionDataForPeerState:(id)a3 completionHandler:(id)a4
{
  int v13 = 0;
  int v12 = 1350;
  if ((GCKSessionPrepareConnection((uint64_t)self->_gckSession, objc_msgSend((id)objc_msgSend(a3, "peerID"), "pid")) & 0x80000000) == 0)
  {
    id v7 = +[MCSessionPeerConnectionData connectionDataSegmentWithEncryptionPreference:[(MCSession *)self encryptionPreference] identitySet:[(MCSession *)self securityIdentity] != 0 gckSessionConnectionDataBytes:v13 gckSessionConnectionDataLength:v12];
    free(v13);
LABEL_4:
    [a3 setNearbyConnectionData:v7];
    uint64_t v8 = 0;
    id v9 = v7;
    goto LABEL_5;
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 0, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Unable to create connection data.", *MEMORY[0x263F08320]));
  id v7 = 0;
  id v9 = 0;
  if (!v8) {
    goto LABEL_4;
  }
LABEL_5:
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__MCSession_syncGetConnectionDataForPeerState_completionHandler___block_invoke;
  block[3] = &unk_264338050;
  void block[5] = v8;
  block[6] = a4;
  block[4] = v9;
  dispatch_async(callbackQueue, block);
}

uint64_t __65__MCSession_syncGetConnectionDataForPeerState_completionHandler___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)nearbyConnectionDataForPeer:(MCPeerID *)peerID withCompletionHandler:(void *)completionHandler
{
  id v6 = (id)[completionHandler copy];
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__MCSession_nearbyConnectionDataForPeer_withCompletionHandler___block_invoke;
  block[3] = &unk_264338078;
  block[4] = self;
  void block[5] = peerID;
  block[6] = v6;
  dispatch_async(syncQueue, block);
}

void __63__MCSession_nearbyConnectionDataForPeer_withCompletionHandler___block_invoke(uint64_t a1)
{
  unsigned int v2 = (MCSessionPeerState *)[*(id *)(*(void *)(a1 + 32) + 104) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    objc_super v3 = v2;
    if ([(MCSessionPeerState *)v2 nearbyConnectionData])
    {
      uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 120);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __63__MCSession_nearbyConnectionDataForPeer_withCompletionHandler___block_invoke_2;
      v8[3] = &unk_264337E20;
      uint64_t v5 = *(void *)(a1 + 48);
      v8[4] = v3;
      v8[5] = v5;
      dispatch_async(v4, v8);
      return;
    }
  }
  else
  {
    objc_super v3 = [[MCSessionPeerState alloc] initWithPeer:*(void *)(a1 + 40)];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "setObject:forKey:", *(void *)(a1 + 40), objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(*(id *)(a1 + 40), "pid")));
  [*(id *)(*(void *)(a1 + 32) + 104) setObject:v3 forKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) syncPeer:*(void *)(a1 + 40) changeStateTo:1 shouldForceCallback:0];
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);

  [v6 syncGetConnectionDataForPeerState:v3 completionHandler:v7];
}

uint64_t __63__MCSession_nearbyConnectionDataForPeer_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) nearbyConnectionData];
  objc_super v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16);

  return v3(v1, v2, 0);
}

- (BOOL)isEncryptionPreferenceCompatible:(int64_t)a3
{
  MCEncryptionPreference v5 = [(MCSession *)self encryptionPreference];
  if (a3 == 1 && v5 == MCEncryptionNone) {
    return 0;
  }
  MCEncryptionPreference v7 = [(MCSession *)self encryptionPreference];
  return a3 != 2 || v7 != MCEncryptionRequired;
}

- (void)syncConnectPeer:(id)a3 withConnectionData:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  MCEncryptionPreference v7 = (void *)-[NSMutableDictionary objectForKey:](self->_peerStates, "objectForKey:");
  uint64_t v8 = v7;
  if (v7)
  {
    if ([v7 state] != 1)
    {
      id v9 = mcs_log();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      LOWORD(v28) = 0;
      long long v10 = "Peer needs to be in Connecting state to connect.";
      goto LABEL_12;
    }
    if ([v8 connectPeerCalled])
    {
      id v9 = mcs_log();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      LOWORD(v28) = 0;
      long long v10 = "ConnectPeer already called.";
LABEL_12:
      _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v28, 2u);
      return;
    }
  }
  long long v11 = [[MCSessionPeerConnectionData alloc] initWithConnectionDataBlob:a4];
  if (!v11)
  {
    uint64_t v14 = mcs_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MCSession syncConnectPeer:withConnectionData:](a3);
    }
    goto LABEL_24;
  }
  int v12 = v11;
  if (![(MCSession *)self isEncryptionPreferenceCompatible:[(MCSessionPeerConnectionData *)v11 encryptionPreference]])
  {
    uint64_t v15 = mcs_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v28 = 138412546;
      uint64_t v29 = [a3 displayName];
      __int16 v30 = 2112;
      id v31 = [(MCSession *)self stringForEncryptionPreference:[(MCSessionPeerConnectionData *)v12 encryptionPreference]];
      _os_log_error_impl(&dword_218756000, v15, OS_LOG_TYPE_ERROR, "Peer [%@] has incompatible encryption preference [%@].", (uint8_t *)&v28, 0x16u);
    }
    goto LABEL_24;
  }
  int v13 = [(MCSession *)self encryptionPreference] != MCEncryptionNone
     && [(MCSessionPeerConnectionData *)v12 encryptionPreference] != 2;
  gckSession = self->_gckSession;
  int v17 = [a3 pid];
  int v18 = [(MCSessionPeerConnectionData *)v12 hasIdentitySet];
  [(NSData *)[(MCSessionPeerConnectionData *)v12 gckSessionConnectionData] bytes];
  [(NSData *)[(MCSessionPeerConnectionData *)v12 gckSessionConnectionData] length];
  uint64_t v19 = GCKSessionEstablishConnection((uint64_t)gckSession, v17, v18, v13);
  if ((v19 & 0x80000000) != 0)
  {
    uint64_t v20 = v19;
    uint64_t v21 = mcs_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MCSession syncConnectPeer:withConnectionData:](v20, v21, v22, v23, v24, v25, v26, v27);
    }
LABEL_24:
    [(MCSession *)self syncPeer:a3 changeStateTo:0 shouldForceCallback:0];
    return;
  }

  [v8 setConnectPeerCalled:1];
}

- (void)connectPeer:(MCPeerID *)peerID withNearbyConnectionData:(NSData *)data
{
  id v6 = (void *)[(NSData *)data copy];
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__MCSession_connectPeer_withNearbyConnectionData___block_invoke;
  block[3] = &unk_264337D80;
  block[4] = self;
  void block[5] = peerID;
  block[6] = v6;
  dispatch_async(syncQueue, block);
}

uint64_t __50__MCSession_connectPeer_withNearbyConnectionData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncConnectPeer:*(void *)(a1 + 40) withConnectionData:*(void *)(a1 + 48)];
}

- (void)cancelConnectPeer:(MCPeerID *)peerID
{
  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__MCSession_cancelConnectPeer___block_invoke;
  v4[3] = &unk_264337D58;
  void v4[4] = self;
  v4[5] = peerID;
  dispatch_async(syncQueue, v4);
}

uint64_t __31__MCSession_cancelConnectPeer___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 72);
  int v2 = [*(id *)(a1 + 40) pid];

  return GCKSessionDisposeConnection(v1, v2);
}

- (void)syncSendData:(id)a3 toPeers:(id)a4 withDataMode:(int64_t)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  int v18 = a5;
  BOOL v7 = a5 == 1;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = [a4 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(a4);
        }
        int v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
        uint64_t v20 = 0;
        LODWORD(v20) = [v12 pid];
        int v13 = mcs_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [a3 length];
          *(_DWORD *)buf = 134218496;
          uint64_t v26 = v14;
          __int16 v27 = 1024;
          int v28 = v20;
          __int16 v29 = 1024;
          int v30 = v18;
          _os_log_impl(&dword_218756000, v13, OS_LOG_TYPE_DEFAULT, "Sending %ld bytes of data to participant %u, mode=%d.", buf, 0x18u);
        }
        int v15 = AGPSessionSendTo((uint64_t)self->_agpSession, (int *)&v20, 1, [a3 bytes], objc_msgSend(a3, "length"), (uint64_t)&v20 + 4, v7, 5u, 1, 0);
        if (v15)
        {
          int v16 = v15;
          int v17 = mcs_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v26) = v16;
            _os_log_error_impl(&dword_218756000, v17, OS_LOG_TYPE_ERROR, "AGPSendTo failed with status=%08X.", buf, 8u);
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [a4 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v9);
  }
}

- (BOOL)sendData:(NSData *)data toPeers:(NSArray *)peerIDs withMode:(MCSessionSendDataMode)mode error:(NSError *)error
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v10 = [(NSData *)data copy];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    if ([(NSArray *)peerIDs count])
    {
      uint64_t v32 = 0;
      __int16 v33 = &v32;
      uint64_t v34 = 0x2020000000;
      char v35 = 0;
      *(void *)uint64_t v26 = 0;
      __int16 v27 = v26;
      uint64_t v28 = 0x3052000000;
      __int16 v29 = __Block_byref_object_copy_;
      int v30 = __Block_byref_object_dispose_;
      uint64_t v31 = 0;
      uint64_t v31 = [MEMORY[0x263EFF980] array];
      syncQueue = self->_syncQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __45__MCSession_sendData_toPeers_withMode_error___block_invoke;
      block[3] = &unk_2643380A0;
      block[4] = peerIDs;
      void block[5] = self;
      block[6] = &v32;
      void block[7] = v26;
      dispatch_sync(syncQueue, block);
      BOOL v13 = *((unsigned char *)v33 + 24) == 0;
      if (*((unsigned char *)v33 + 24))
      {
        if (error)
        {
          uint64_t v14 = NSString;
          if ((unint64_t)[*((id *)v27 + 5) count] <= 1) {
            int v15 = @"Peers";
          }
          else {
            int v15 = @"Peer";
          }
          uint64_t v16 = [v14 stringWithFormat:@"%@ %@ not connected", v15, objc_msgSend((id)objc_msgSend(*((id *)v27 + 5), "valueForKey:", @"displayName", "componentsJoinedByString:", @", ")];
          *error = (NSError *)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 1, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", v16, *MEMORY[0x263F08320]));
        }
        int v17 = mcs_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [(id)objc_msgSend(*((id *)v27 + 5) valueForKey:@"displayName", "componentsJoinedByString:", @", "];
          *(_DWORD *)buf = 138412290;
          uint64_t v37 = v18;
          _os_log_impl(&dword_218756000, v17, OS_LOG_TYPE_DEFAULT, "Failed to send data because recipients %@ are not connected.", buf, 0xCu);
        }
      }
      else
      {
        id v21 = [(NSArray *)peerIDs copyDeep_MC];
        long long v22 = self->_syncQueue;
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __45__MCSession_sendData_toPeers_withMode_error___block_invoke_479;
        v24[3] = &unk_2643380C8;
        v24[4] = self;
        v24[5] = v11;
        v24[6] = v21;
        v24[7] = mode;
        dispatch_async(v22, v24);
      }
      _Block_object_dispose(v26, 8);
      _Block_object_dispose(&v32, 8);
      return v13;
    }
    if (error) {
      *error = (NSError *)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 2, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Invalid peerIDs parameter.", *MEMORY[0x263F08320]));
    }

    uint64_t v19 = mcs_log();
    BOOL v13 = 0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      uint64_t v20 = "Failed to send data because no recipients are specified.";
      goto LABEL_20;
    }
  }
  else
  {
    if (error) {
      *error = (NSError *)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 2, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Invalid data parameter.", *MEMORY[0x263F08320]));
    }
    uint64_t v19 = mcs_log();
    BOOL v13 = 0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      uint64_t v20 = "Failed to send data because data is nil.";
LABEL_20:
      _os_log_impl(&dword_218756000, v19, OS_LOG_TYPE_DEFAULT, v20, v26, 2u);
      return 0;
    }
  }
  return v13;
}

uint64_t __45__MCSession_sendData_toPeers_withMode_error___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v2 = (void *)a1[4];
  uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend((id)objc_msgSend(*(id *)(a1[5] + 104), "objectForKey:", *(void *)(*((void *)&v7 + 1) + 8 * v6)), "state") != 2)
        {
          *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
          [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:a1[4]];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __45__MCSession_sendData_toPeers_withMode_error___block_invoke_479(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncSendData:*(void *)(a1 + 40) toPeers:*(void *)(a1 + 48) withDataMode:*(void *)(a1 + 56)];
}

- (NSArray)connectedPeers
{
  objc_super v3 = (NSArray *)[MEMORY[0x263EFF980] array];
  syncQueue = self->_syncQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__MCSession_connectedPeers__block_invoke;
  v6[3] = &unk_264337D58;
  v6[4] = self;
  v6[5] = v3;
  dispatch_sync(syncQueue, v6);
  return v3;
}

uint64_t __27__MCSession_connectedPeers__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 104) allValues];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if ([v7 state] == 2) {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(v7, "peerID"));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (NSProgress)sendResourceAtURL:(NSURL *)resourceURL withName:(NSString *)resourceName toPeer:(MCPeerID *)peerID withCompletionHandler:(void *)completionHandler
{
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  long long v11 = objc_alloc_init(MCSessionStream);
  -[MCSessionStream setProgress:](v11, "setProgress:", [MEMORY[0x263F08AB8] progressWithTotalUnitCount:0]);
  [(MCSessionStream *)v11 setUrl:resourceURL];
  [(MCSessionStream *)v11 setName:resourceName];
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke;
  block[3] = &unk_2643380F0;
  block[4] = self;
  void block[5] = peerID;
  void block[8] = &v40;
  void block[9] = &v36;
  block[6] = resourceName;
  void block[7] = v11;
  dispatch_sync(syncQueue, block);
  if (*((unsigned char *)v41 + 24))
  {
    uint64_t v13 = mcs_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MCSession sendResourceAtURL:withName:toPeer:withCompletionHandler:]();
    }
    callbackQueue = self->_callbackQueue;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_480;
    v34[3] = &unk_264338118;
    v34[4] = completionHandler;
    dispatch_async(callbackQueue, v34);
    int v15 = self->_syncQueue;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_2;
    v33[3] = &unk_264337D80;
    v33[4] = self;
    v33[5] = peerID;
    v33[6] = resourceName;
    uint64_t v16 = v33;
  }
  else
  {
    if (!*((unsigned char *)v37 + 24))
    {
      if ([(NSURL *)resourceURL isFileURL])
      {
        id v21 = (void *)[(NSString *)resourceName copy];
        [(MCSessionStream *)v11 setCompletionHandler:completionHandler];
        long long v22 = self->_syncQueue;
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_3;
        v30[3] = &unk_264337DF8;
        v30[4] = resourceURL;
        v30[5] = self;
        v30[6] = v11;
        v30[7] = v21;
        v30[8] = peerID;
        dispatch_async(v22, v30);

        long long v23 = [(MCSessionStream *)v11 progress];
      }
      else
      {
        if (![(NSString *)[(NSURL *)resourceURL scheme] hasPrefix:@"http"]
          && ![(NSString *)[(NSURL *)resourceURL scheme] hasPrefix:@"https"])
        {
          uint64_t v25 = mcs_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            -[MCSession sendResourceAtURL:withName:toPeer:withCompletionHandler:]();
          }
          uint64_t v26 = self->_callbackQueue;
          v28[0] = MEMORY[0x263EF8330];
          v28[1] = 3221225472;
          v28[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_506;
          v28[3] = &unk_264338118;
          v28[4] = completionHandler;
          dispatch_async(v26, v28);
          int v15 = self->_syncQueue;
          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_2_510;
          v27[3] = &unk_264337D80;
          v27[4] = self;
          v27[5] = peerID;
          v27[6] = resourceName;
          uint64_t v16 = v27;
          goto LABEL_9;
        }
        [(MCSessionStream *)v11 setCompletionHandler:completionHandler];
        long long v24 = self->_syncQueue;
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_3_504;
        v29[3] = &unk_264337EC0;
        v29[4] = self;
        v29[5] = resourceURL;
        v29[6] = v11;
        v29[7] = peerID;
        dispatch_async(v24, v29);
        long long v23 = [(MCSessionStream *)v11 progress];
      }
      uint64_t v19 = v23;
      goto LABEL_10;
    }
    int v17 = mcs_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MCSession sendResourceAtURL:withName:toPeer:withCompletionHandler:]();
    }
    uint64_t v18 = self->_callbackQueue;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_484;
    v32[3] = &unk_264338118;
    v32[4] = completionHandler;
    dispatch_async(v18, v32);
    int v15 = self->_syncQueue;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_2_488;
    v31[3] = &unk_264337D80;
    v31[4] = self;
    v31[5] = peerID;
    v31[6] = resourceName;
    uint64_t v16 = v31;
  }
LABEL_9:
  dispatch_async(v15, v16);
  uint64_t v19 = 0;
LABEL_10:
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  return v19;
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke(void *a1)
{
  int v2 = (void *)[*(id *)(a1[4] + 104) objectForKey:a1[5]];
  uint64_t result = [v2 state];
  if (result != 2)
  {
    uint64_t v4 = a1[8];
    goto LABEL_6;
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(v2, "outgoingStreams"), "objectForKey:", a1[6]);
  if (result || (uint64_t result = objc_msgSend((id)objc_msgSend(v2, "outgoingStreamRequests"), "objectForKey:", a1[6])) != 0)
  {
    uint64_t v4 = a1[9];
LABEL_6:
    *(unsigned char *)(*(void *)(v4 + 8) + 24) = 1;
    return result;
  }
  uint64_t v5 = (void *)[v2 outgoingStreamRequests];
  uint64_t v7 = a1[6];
  uint64_t v6 = a1[7];

  return [v5 setObject:v6 forKey:v7];
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_480(uint64_t a1)
{
  objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 1, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Peer not connected.", *MEMORY[0x263F08320]));
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    objc_super v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_2(void *a1)
{
  int v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 104), "objectForKey:", a1[5]), "outgoingStreamRequests");
  uint64_t v3 = a1[6];

  return [v2 removeObjectForKey:v3];
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_484(uint64_t a1)
{
  objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 2, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Resource with same name already exists.", *MEMORY[0x263F08320]));
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_2_488(void *a1)
{
  int v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 104), "objectForKey:", a1[5]), "outgoingStreamRequests");
  uint64_t v3 = a1[6];

  return [v2 removeObjectForKey:v3];
}

void __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  int v2 = (id *)(a1 + 32);
  uint64_t v3 = open((const char *)[*(id *)(a1 + 32) fileSystemRepresentation], 0);
  if (v3 == -1)
  {
    long long v11 = mcs_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_3_cold_1(v2);
    }
    uint64_t v12 = *(NSObject **)(*(void *)(a1 + 40) + 120);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_493;
    v20[3] = &unk_264337EE8;
    v20[4] = *(void *)(a1 + 48);
    dispatch_async(v12, v20);
  }
  else
  {
    uint64_t v4 = v3;
    memset(&v22, 0, sizeof(v22));
    if (fstat(v3, &v22) == -1)
    {
      close(v4);
      uint64_t v5 = mcs_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_3_cold_2();
      }
      uint64_t v6 = *(NSObject **)(*(void *)(a1 + 40) + 120);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_489;
      block[3] = &unk_264337EE8;
      block[4] = *(void *)(a1 + 48);
      dispatch_async(v6, block);
    }
    int v7 = fcntl(v4, 3, 0);
    if (v7 != -1) {
      fcntl(v4, 4, v7 | 4u);
    }
    fcntl(v4, 73, 1);
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "progress"), "setTotalUnitCount:", v22.st_size);
    long long v8 = mcs_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "progress"), "totalUnitCount");
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v9;
      __int16 v25 = 2048;
      uint64_t v26 = v10;
      _os_log_impl(&dword_218756000, v8, OS_LOG_TYPE_DEFAULT, "About to send file [%@] of size [%lld].", buf, 0x16u);
    }
    [*(id *)(a1 + 40) syncStartStreamWithName:*(void *)(a1 + 56) toPeer:*(void *)(a1 + 64) mcFD:v4 isResource:1];
  }
  uint64_t v13 = [MCResourceProgressObserver alloc];
  uint64_t v14 = [*(id *)(a1 + 48) name];
  uint64_t v15 = [*(id *)(a1 + 48) progress];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_2_497;
  v17[3] = &unk_264337D80;
  long long v18 = *(_OWORD *)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 64);
  uint64_t v16 = [(MCResourceProgressObserver *)v13 initWithName:v14 progress:v15 cancelHandler:v17];
  [*(id *)(a1 + 48) setObserver:v16];
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_489(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 0, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Failed to stat file.", *MEMORY[0x263F08320]));
  uint64_t result = [*(id *)(a1 + 32) completionHandler];
  if (result)
  {
    uint64_t v4 = [*(id *)(a1 + 32) completionHandler];
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v2);
    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 setCompletionHandler:0];
  }
  return result;
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_493(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 0, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Cannot open file.", *MEMORY[0x263F08320]));
  uint64_t result = [*(id *)(a1 + 32) completionHandler];
  if (result)
  {
    uint64_t v4 = [*(id *)(a1 + 32) completionHandler];
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v2);
    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 setCompletionHandler:0];
  }
  return result;
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_2_497(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelOutgoingStream:*(void *)(a1 + 40) toPeer:*(void *)(a1 + 48)];
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_3_504(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 48), "setUrlDownloader:", -[MCResourceDownloader initWithSession:resourceUrl:name:peerID:]([MCResourceDownloader alloc], "initWithSession:resourceUrl:name:peerID:", *(void *)(a1 + 32), *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "name"), *(void *)(a1 + 56)));
  uint64_t v2 = [MCResourceProgressObserver alloc];
  uint64_t v3 = [*(id *)(a1 + 48) name];
  uint64_t v4 = [*(id *)(a1 + 48) progress];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_4;
  v6[3] = &unk_264337D80;
  v6[4] = *(void *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 48), "setObserver:", -[MCResourceProgressObserver initWithName:progress:cancelHandler:](v2, "initWithName:progress:cancelHandler:", v3, v4, v6));
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelOutgoingStream:*(void *)(a1 + 40) toPeer:*(void *)(a1 + 48)];
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_506(uint64_t a1)
{
  objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 3, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Unsupported resource type.", *MEMORY[0x263F08320]));
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_2_510(void *a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 104), "objectForKey:", a1[5]), "outgoingStreamRequests");
  uint64_t v3 = a1[6];

  return [v2 removeObjectForKey:v3];
}

- (void)disconnect
{
  uint64_t v2 = mcs_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "Disconnecting from session.", v3, 2u);
  }
  GCKSessionDisposeAllConnections();
}

- (void)syncStartStreamWithName:(id)a3 toPeer:(id)a4 mcFD:(int)a5 isResource:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v11 = [(NSMutableDictionary *)self->_peerStates objectForKey:a4];
  if (!v11)
  {
    NSLog(&cfstr_UnknownPeer.isa, a4);
    int v17 = mcs_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MCSession syncStartStreamWithName:toPeer:mcFD:isResource:]();
    }
    goto LABEL_13;
  }
  uint64_t v12 = (void *)v11;
  uint64_t v13 = (const char *)[a3 UTF8String];
  int v14 = strlen(v13);
  int v15 = v14;
  if (v14 >= 0x8000)
  {
    NSLog(&cfstr_StreamNameTooL.isa, a3);
    uint64_t v16 = mcs_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v34 = a3;
      _os_log_impl(&dword_218756000, v16, OS_LOG_TYPE_DEFAULT, "Stream name [%@] too long.", buf, 0xCu);
    }
LABEL_12:
    objc_msgSend((id)objc_msgSend(v12, "outgoingStreamRequests"), "removeObjectForKey:", a3);
LABEL_13:
    close(a5);
    return;
  }
  unsigned __int16 v18 = v14 + 12;
  uint64_t v19 = (char *)malloc_type_malloc((unsigned __int16)(v14 + 12), 0x384BA6EFuLL);
  if (!v19)
  {
    NSLog(&cfstr_OutOfMemoryAll.isa, v18);
    stat v22 = mcs_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MCSession syncSendXDataPeerIDPushToPID:]();
    }
    goto LABEL_12;
  }
  uint64_t v20 = v19;
  unsigned int v30 = a5;
  if (v6) {
    id v21 = (MCSessionStream *)objc_msgSend((id)objc_msgSend(v12, "outgoingStreamRequests"), "objectForKey:", a3);
  }
  else {
    id v21 = objc_alloc_init(MCSessionStream);
  }
  long long v23 = v21;
  *uint64_t v20 = -108;
  v20[1] = v6;
  int v29 = v18;
  v20[2] = HIBYTE(v18);
  v20[3] = v18;
  unsigned int v24 = [v12 newStreamOpenRequestID];
  *((_DWORD *)v20 + 1) = bswap32(v24);
  if (v6)
  {
    v20[8] = [(NSProgress *)[(MCSessionStream *)v23 progress] totalUnitCount] >> 24;
    v20[9] = [(NSProgress *)[(MCSessionStream *)v23 progress] totalUnitCount] >> 16;
    v20[10] = (unsigned __int16)[(NSProgress *)[(MCSessionStream *)v23 progress] totalUnitCount] >> 8;
    char v25 = [(NSProgress *)[(MCSessionStream *)v23 progress] totalUnitCount];
  }
  else
  {
    char v25 = 0;
    v20[10] = 0;
    *((_WORD *)v20 + 4) = 0;
  }
  v20[11] = v25;
  memcpy(v20 + 12, v13, v15);
  int v32 = 0;
  int v31 = [a4 pid];
  if (AGPSessionSendTo((uint64_t)self->_agpSession, &v31, 1, (uint64_t)v20, v29, (uint64_t)&v32, 0, 0xAu, 1, 0))
  {
    uint64_t v26 = mcs_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:]();
    }
  }
  [(MCSessionStream *)v23 setName:a3];
  [(MCSessionStream *)v23 setPeerID:a4];
  [(MCSessionStream *)v23 setState:1];
  [(MCSessionStream *)v23 setFd:v30];
  unsigned int v27 = v24;
  objc_msgSend((id)objc_msgSend(v12, "outgoingStreamRequests"), "setObject:forKey:", v23, objc_msgSend(NSNumber, "numberWithUnsignedLong:", v24));
  objc_msgSend((id)objc_msgSend(v12, "outgoingStreamRequests"), "setObject:forKey:", v23, a3);
  uint64_t v28 = mcs_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)uint64_t v34 = v27;
    *(_WORD *)&v34[4] = 2112;
    *(void *)&v34[6] = a3;
    __int16 v35 = 2112;
    id v36 = a4;
    _os_log_impl(&dword_218756000, v28, OS_LOG_TYPE_DEFAULT, "Streaming: sent open request: requestID[%u] stream[%@] peer[%@].", buf, 0x1Cu);
  }
  free(v20);
}

- (NSOutputStream)startStreamWithName:(NSString *)streamName toPeer:(MCPeerID *)peerID error:(NSError *)error
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (streamName
    && peerID
    && [(NSString *)streamName length]
    && [(NSString *)streamName lengthOfBytesUsingEncoding:4] < 0x8000)
  {
    uint64_t v32 = 0;
    __int16 v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    uint64_t v28 = 0;
    int v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    syncQueue = self->_syncQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__MCSession_startStreamWithName_toPeer_error___block_invoke;
    block[3] = &unk_264338140;
    block[4] = self;
    void block[5] = peerID;
    block[6] = streamName;
    void block[7] = &v32;
    void block[8] = &v28;
    dispatch_sync(syncQueue, block);
    if (*((unsigned char *)v33 + 24))
    {
      uint64_t v12 = mcs_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MCSession sendResourceAtURL:withName:toPeer:withCompletionHandler:]();
      }
      if (error)
      {
        uint64_t v13 = (NSError *)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 0, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Peer not connected.", *MEMORY[0x263F08320]));
LABEL_25:
        uint64_t v10 = 0;
        *error = v13;
LABEL_27:
        _Block_object_dispose(&v28, 8);
        _Block_object_dispose(&v32, 8);
        return v10;
      }
      goto LABEL_26;
    }
    if (*((unsigned char *)v29 + 24))
    {
      int v14 = mcs_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MCSession startStreamWithName:toPeer:error:].cold.4();
      }
      if (error)
      {
        uint64_t v13 = (NSError *)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 0, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Stream with same name already exists.", *MEMORY[0x263F08320]));
        goto LABEL_25;
      }
LABEL_26:
      uint64_t v10 = 0;
      goto LABEL_27;
    }
    if (pipe(v44))
    {
      int v15 = mcs_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = __error();
        -[MCSession startStreamWithName:toPeer:error:](v16, buf, v15);
      }
      if (error)
      {
        uint64_t v13 = (NSError *)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 0, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Cannot create pipe.", *MEMORY[0x263F08320]));
        goto LABEL_25;
      }
      goto LABEL_26;
    }
    int v18 = v44[0];
    fcntl(v44[1], 73, 1);
    uint64_t v19 = (void *)_CFWriteStreamCreateFromFileDescriptor();
    if (v19)
    {
      uint64_t v20 = (void *)[(NSString *)streamName copy];
      id v21 = self->_syncQueue;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __46__MCSession_startStreamWithName_toPeer_error___block_invoke_527;
      v25[3] = &unk_264338168;
      int v26 = v18;
      v25[4] = self;
      v25[5] = v20;
      v25[6] = peerID;
      dispatch_async(v21, v25);

      if (!error)
      {
LABEL_37:
        unsigned int v24 = mcs_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          uint64_t v37 = streamName;
          __int16 v38 = 2112;
          char v39 = peerID;
          __int16 v40 = 2048;
          v41 = v19;
          __int16 v42 = 2112;
          char v43 = v19;
          _os_log_impl(&dword_218756000, v24, OS_LOG_TYPE_DEFAULT, "Stream (%@) started with peer (%@) [%p / %@].", buf, 0x2Au);
        }
        uint64_t v10 = v19;
        goto LABEL_27;
      }
      stat v22 = 0;
    }
    else
    {
      long long v23 = mcs_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[MCSession startStreamWithName:toPeer:error:]();
      }
      if (!error) {
        goto LABEL_37;
      }
      stat v22 = (NSError *)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 0, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Cannot create NSOutputStream.", *MEMORY[0x263F08320]));
    }
    *error = v22;
    goto LABEL_37;
  }
  uint64_t v9 = mcs_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[MCSession startStreamWithName:toPeer:error:]();
  }
  uint64_t v10 = 0;
  if (error) {
    *error = (NSError *)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 2, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Invalid parameter.", *MEMORY[0x263F08320]));
  }
  return v10;
}

uint64_t __46__MCSession_startStreamWithName_toPeer_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)[*(id *)(a1[4] + 104) objectForKey:a1[5]];
  uint64_t result = [v2 state];
  if (result != 2)
  {
    uint64_t v4 = a1[7];
    goto LABEL_6;
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(v2, "outgoingStreams"), "objectForKey:", a1[6]);
  if (result || (uint64_t result = objc_msgSend((id)objc_msgSend(v2, "outgoingStreamRequests"), "objectForKey:", a1[6])) != 0)
  {
    uint64_t v4 = a1[8];
LABEL_6:
    *(unsigned char *)(*(void *)(v4 + 8) + 24) = 1;
    return result;
  }
  uint64_t v5 = (void *)[v2 outgoingStreamRequests];
  uint64_t v6 = [MEMORY[0x263EFF9D0] null];
  uint64_t v7 = a1[6];

  return [v5 setObject:v6 forKey:v7];
}

uint64_t __46__MCSession_startStreamWithName_toPeer_error___block_invoke_527(uint64_t a1)
{
  int v2 = fcntl(*(_DWORD *)(a1 + 56), 3, 0);
  if (v2 != -1) {
    fcntl(*(_DWORD *)(a1 + 56), 4, v2 | 4u);
  }
  fcntl(*(_DWORD *)(a1 + 56), 73, 1);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(unsigned int *)(a1 + 56);

  return [v3 syncStartStreamWithName:v4 toPeer:v5 mcFD:v6 isResource:0];
}

- (void)logSessionInfo
{
  v5[4] = *MEMORY[0x263EF8340];
  v4[0] = @"sid";
  if ([(MCSession *)self sessionID]) {
    uint64_t v3 = [(MCSession *)self sessionID];
  }
  else {
    uint64_t v3 = &stru_26C9DA3B0;
  }
  v5[0] = v3;
  v4[1] = @"localPeer";
  v5[1] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MCSession gckPID](self, "gckPID"));
  v4[2] = @"auth";
  v5[2] = objc_msgSend(NSNumber, "numberWithInt:", -[MCSession securityIdentity](self, "securityIdentity") != 0);
  v4[3] = @"cryptPref";
  v5[3] = objc_msgSend(NSNumber, "numberWithInteger:", -[MCSession encryptionPreference](self, "encryptionPreference"));
  MCDashboardLogJSON([NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4], 0, @"SessionInfo");
}

- (void)syncLogConnectedPeers
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"sid";
  if ([(MCSession *)self sessionID]) {
    uint64_t v3 = [(MCSession *)self sessionID];
  }
  else {
    uint64_t v3 = &stru_26C9DA3B0;
  }
  v4[1] = @"peersCnt";
  v5[0] = v3;
  v5[1] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MCSession syncConnectedPeersCount](self, "syncConnectedPeersCount") + 1);
  MCDashboardLogJSON([NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2], 0, @"ConnectedPeers");
}

- (void)syncLogMaxConnectedPeers
{
  v6[2] = *MEMORY[0x263EF8340];
  v5[0] = @"sid";
  if ([(MCSession *)self sessionID]) {
    uint64_t v3 = [(MCSession *)self sessionID];
  }
  else {
    uint64_t v3 = &stru_26C9DA3B0;
  }
  v5[1] = @"maxPeersCnt";
  v6[0] = v3;
  v6[1] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MCSession maxPeers](self, "maxPeers"));
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  MCMetricsLog(@"com.apple.multipeerconnectivity.mcsession.maxconnectedpeers", v4, 0);
  MCDashboardLogJSON(v4, 0, @"MaxConnectedPeers");
}

- (MCPeerID)myPeerID
{
  return self->_myPeerID;
}

- (NSArray)securityIdentity
{
  return self->_securityIdentity;
}

- (MCEncryptionPreference)encryptionPreference
{
  return self->_encryptionPreference;
}

- (OpaqueGCKSession)gckSession
{
  return self->_gckSession;
}

- (void)setGckSession:(OpaqueGCKSession *)a3
{
  self->_gckSession = a3;
}

- (OpaqueAGPSession)agpSession
{
  return self->_agpSession;
}

- (void)setAgpSession:(OpaqueAGPSession *)a3
{
  self->_agpSession = a3;
}

- (unsigned)gckPID
{
  return self->_gckPID;
}

- (void)setGckPID:(unsigned int)a3
{
  self->_gckPID = a3;
}

- (NSMutableDictionary)peerIDMap
{
  return self->_peerIDMap;
}

- (void)setPeerIDMap:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (NSMutableDictionary)peerStates
{
  return self->_peerStates;
}

- (void)setPeerStates:(id)a3
{
}

- (NSMutableDictionary)connectionPendingPeerEvents
{
  return self->_connectionPendingPeerEvents;
}

- (void)setConnectionPendingPeerEvents:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (unint64_t)maxPeers
{
  return self->_maxPeers;
}

- (void)setMaxPeers:(unint64_t)a3
{
  self->_maxPeers = a3;
}

+ (id)stringForSessionState:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"?";
  }
  else {
    return off_264338270[a3];
  }
}

+ (id)stringForMCSessionSendDataMode:(int64_t)a3
{
  uint64_t v3 = @"?";
  if (a3 == 1) {
    uint64_t v3 = @"Unreliable";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"Reliable";
  }
}

- (void)peerDidDeclineInvitation:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = mcs_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = [a3 displayName];
    _os_log_impl(&dword_218756000, v5, OS_LOG_TYPE_DEFAULT, "Peer [%@] declined invitation.", buf, 0xCu);
  }
  syncQueue = self->_syncQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__MCSession_Private__peerDidDeclineInvitation___block_invoke;
  v7[3] = &unk_264337D58;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(syncQueue, v7);
}

uint64_t __47__MCSession_Private__peerDidDeclineInvitation___block_invoke(uint64_t a1)
{
  int v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 104) objectForKey:*(void *)(a1 + 40)];
  if (!v2 || (uint64_t result = [v2 state], result != 2))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 syncPeer:v5 changeStateTo:0 shouldForceCallback:1];
  }
  return result;
}

- (int64_t)connectedInterfacesForPeer:(id)a3
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__MCSession_Private__connectedInterfacesForPeer___block_invoke;
  block[3] = &unk_264338190;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v7;
  dispatch_sync(syncQueue, block);
  int64_t v4 = *((unsigned int *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __49__MCSession_Private__connectedInterfacesForPeer___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 72);
  int v3 = [*(id *)(a1 + 40) pid];
  int64_t v4 = (_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

  return GCKSessionGetInterfacesForParticipant(v2, v3, v4);
}

- (void)setHeartbeatTimeout:(unint64_t)a3
{
  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  void v4[2] = __42__MCSession_Private__setHeartbeatTimeout___block_invoke;
  v4[3] = &unk_2643381B8;
  void v4[4] = self;
  v4[5] = a3;
  dispatch_async(syncQueue, v4);
}

uint64_t __42__MCSession_Private__setHeartbeatTimeout___block_invoke(uint64_t a1)
{
  return GCKSessionSetHeartbeatTimeout(*(void *)(*(void *)(a1 + 32) + 72), *(_DWORD *)(a1 + 40));
}

- (BOOL)isAWDLDisabled
{
  return self->_AWDLDisabled;
}

- (void)setAWDLDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  self->_AWDLDisabled = a3;
  GCKSessionSetAWDLDisabled((uint64_t)self->_gckSession, a3);
  int64_t v4 = mcs_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = "no";
    if (v3) {
      uint64_t v5 = "yes";
    }
    int v6 = 136315138;
    uint64_t v7 = v5;
    _os_log_impl(&dword_218756000, v4, OS_LOG_TYPE_DEFAULT, "AWDLDisabled set to %s.", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)preferNCMOverEthernet
{
  return self->_preferNCMOverEthernet;
}

- (void)setPreferNCMOverEthernet:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  self->_preferNCMOverEthernet = a3;
  GCKSessionSetPreferNCMOverEthernet((uint64_t)self->_gckSession, a3);
  int64_t v4 = mcs_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = "no";
    if (v3) {
      uint64_t v5 = "yes";
    }
    int v6 = 136315138;
    uint64_t v7 = v5;
    _os_log_impl(&dword_218756000, v4, OS_LOG_TYPE_DEFAULT, "Prefer NCM over Ethernet set to %s.", (uint8_t *)&v6, 0xCu);
  }
}

- (void)setICETimeoutForced:(BOOL)a3
{
  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  void v4[2] = __42__MCSession_Testing__setICETimeoutForced___block_invoke;
  v4[3] = &unk_264337FB0;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(syncQueue, v4);
}

uint64_t __42__MCSession_Testing__setICETimeoutForced___block_invoke(uint64_t a1)
{
  return GCKSessionSetICETimeoutForced(*(void *)(*(void *)(a1 + 32) + 72), *(unsigned __int8 *)(a1 + 40));
}

- (void)closeDirectConnectionsWithPeer:(id)a3
{
  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  void v4[2] = __53__MCSession_Testing__closeDirectConnectionsWithPeer___block_invoke;
  v4[3] = &unk_264337D58;
  void v4[4] = self;
  void v4[5] = a3;
  dispatch_async(syncQueue, v4);
}

uint64_t __53__MCSession_Testing__closeDirectConnectionsWithPeer___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 72);
  int v2 = [*(id *)(a1 + 40) pid];

  return GCKSessionCloseDirectConnectionsWithPeer(v1, v2);
}

- (void)syncSendXDataStreamOpenResponseToPID:(uint64_t)a3 withRequestID:(uint64_t)a4 streamID:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "AGPSendTo failed with status=%08X.", v2, v3, v4, v5, v6);
}

- (void)syncSendXDataStreamCloseFromSenderToPID:(uint64_t)a3 streamID:(uint64_t)a4 closeReason:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)syncSendXDataPeerIDPushToPID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "Out of memory (allocating %u bytes).", v2, v3, v4, v5, v6);
}

- (void)startConnectionWithIndirectPID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "PeerID push is too small (%u).", v2, v3, v4, v5, v6);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_218756000, v0, v1, "PeerID push - size mismatch (%u < %u).", v2, v3);
}

- (void)syncHandleNetworkEvent:(void *)a1 pid:(uint64_t)a2 freeEventWhenDone:(uint64_t)a3 .cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  objc_begin_catch(a1);
  objc_end_catch();
  uint64_t v4 = mcs_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    uint64_t v6 = a3;
    _os_log_error_impl(&dword_218756000, v4, OS_LOG_TYPE_ERROR, "PeerID push - failed to create peerID from data [%@].", (uint8_t *)&v5, 0xCu);
  }
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.4()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_218756000, v0, v1, "Incoming xdata is invalid.", v2, v3, v4, v5, v6);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "Xdata unexpected type %d.", v2, v3, v4, v5, v6);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.6()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "Stream open request is too small (%u).", v2, v3, v4, v5, v6);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.7()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_218756000, v0, v1, "Stream open request - size mismatch (%u < %u).", v2, v3);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.8()
{
  __error();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_18(&dword_218756000, v0, v1, "Cannot create pipe for outgoing stream [%@], error (%d).", v2, v3, v4, v5, v6);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.9()
{
  __error();
  OUTLINED_FUNCTION_13();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.10()
{
  __error();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_18(&dword_218756000, v0, v1, "Failed to open file for stream[%@] (%d).", v2, v3, v4, v5, v6);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.11()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "Stream open response is too small (%u).", v2, v3, v4, v5, v6);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.12()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_218756000, v0, v1, "Stream open response - size mismatch (%u < %u).", v2, v3);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.13()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "Stream request doesn't exist [%08X].", v2, v3, v4, v5, v6);
}

- (void)syncHandleNetworkEvent:(void *)a1 pid:freeEventWhenDone:.cold.14(void *a1)
{
  [a1 name];
  [a1 streamID];
  [a1 state];
  OUTLINED_FUNCTION_13();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x18u);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.15()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "Stream close from sender is too small (%u).", v2, v3, v4, v5, v6);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.16()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_218756000, v0, v1, "Stream close from sender - size mismatch (%u < %u).", v2, v3);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.17()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "Stream close from receiver is too small (%u).", v2, v3, v4, v5, v6);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.18()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_218756000, v0, v1, "Stream close from receiver - size mismatch (%u < %u).", v2, v3);
}

- (void)syncHandleNetworkEvent:(void *)a1 pid:freeEventWhenDone:.cold.19(void *a1)
{
  [a1 streamID];
  OUTLINED_FUNCTION_16(&dword_218756000, v1, v2, "StreamID mismatch [%08X] != [%08X].", v3, v4, v5, v6, 0);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.20()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "PeerID push - should not happen any more (%u).", v2, v3, v4, v5, v6);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.21()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "Connection data push is too small (%u).", v2, v3, v4, v5, v6);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.22()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_218756000, v0, v1, "Connection data - size mismatch (%u < %u).", v2, v3);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.23()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_218756000, v0, v1, "Connection data parse error [%@].", v2, v3, v4, v5, v6);
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_426_cold_1()
{
  __error();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_16(&dword_218756000, v0, v1, "Outgoing stream source: read error [%d, %d].", v2, v3, v4, v5, 0);
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_426_cold_2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1(&dword_218756000, v0, v1, "AGPSendTo failed with status=%08X, error (%d).", 67109376, v2);
}

- (void)initWithPeer:securityIdentity:encryptionPreference:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_218756000, v0, v1, "GCKSessionStartEventCallbacks failed.", v2, v3, v4, v5, v6);
}

- (void)initWithPeer:securityIdentity:encryptionPreference:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_218756000, v0, v1, "AGPSessionCreate failed.", v2, v3, v4, v5, v6);
}

- (void)initWithPeer:securityIdentity:encryptionPreference:.cold.3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_218756000, v0, v1, "GCKSessionCreate failed.", v2, v3, v4, v5, v6);
}

- (void)syncConnectPeer:(void *)a1 withConnectionData:.cold.1(void *a1)
{
  [a1 displayName];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_17(&dword_218756000, v1, v2, "Peer [%@] has incompatible connection data.", v3, v4, v5, v6, v7);
}

- (void)syncConnectPeer:(uint64_t)a3 withConnectionData:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendResourceAtURL:withName:toPeer:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_218756000, v0, v1, "Send non-file resource not supported yet.", v2, v3, v4, v5, v6);
}

- (void)sendResourceAtURL:withName:toPeer:withCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_218756000, v0, v1, "Resource with name [%@] already exists.", v2, v3, v4, v5, v6);
}

- (void)sendResourceAtURL:withName:toPeer:withCompletionHandler:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_218756000, v0, v1, "Peer[%@] not connected.", v2, v3, v4, v5, v6);
}

void __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_3_cold_1(id *a1)
{
  [*a1 fileSystemRepresentation];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_17(&dword_218756000, v1, v2, "Cannot open file [%s].", v3, v4, v5, v6, v7);
}

void __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_3_cold_2()
{
  __error();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_13();
  _os_log_error_impl(v0, v1, v2, v3, v4, 8u);
}

- (void)syncStartStreamWithName:toPeer:mcFD:isResource:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_218756000, v0, v1, "Unknown peer [%@].", v2, v3, v4, v5, v6);
}

- (void)startStreamWithName:toPeer:error:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_15(&dword_218756000, v1, (uint64_t)v1, "Bad name[%@] or id[%@].", v2);
}

- (void)startStreamWithName:toPeer:error:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_218756000, v0, v1, "Cannot create output stream.", v2, v3, v4, v5, v6);
}

- (void)startStreamWithName:(int *)a1 toPeer:(uint8_t *)buf error:(os_log_t)log .cold.3(int *a1, uint8_t *buf, os_log_t log)
{
  int v3 = *a1;
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = v3;
  _os_log_error_impl(&dword_218756000, log, OS_LOG_TYPE_ERROR, "Cannot create pipe (%d).", buf, 8u);
}

- (void)startStreamWithName:toPeer:error:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_218756000, v0, v1, "Stream with name [%@] already exists.", v2, v3, v4, v5, v6);
}

@end